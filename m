Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA1BDC9C09A
	for <lists+dri-devel@lfdr.de>; Tue, 02 Dec 2025 16:53:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0223810E67A;
	Tue,  2 Dec 2025 15:53:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="fz2ez+iL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCB5A10E674;
 Tue,  2 Dec 2025 15:53:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id E163060141;
 Tue,  2 Dec 2025 15:53:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 098C8C4CEF1;
 Tue,  2 Dec 2025 15:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1764690788;
 bh=dAuiJuoctUPi+JO/hbGHwGpVusbOU/8eCH/UeKEZfNU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fz2ez+iLP9STXL5YjoRxhOjyPsvrIc6RDVKWcIDX/1QHHsSM4sdWrzjHE7v0dVjjG
 doEQ2sMlHbZ2+eoyAL143a1glI1ItnsWn5Ut/ZXkdORSlbk7GoGXwGoXYJgP6DV6fb
 MB/QfJSpLVds6QHP0BZ3SNQNKQztmcuQgvQ94VDo=
Date: Tue, 2 Dec 2025 16:53:04 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Sasha Levin <sashal@kernel.org>, stable@vger.kernel.org,
 Javier Martinez Canillas <javierm@redhat.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH 6.6.y] drm, fbcon, vga_switcheroo: Avoid race condition
 in fbcon setup
Message-ID: <2025120251-polymer-disobey-ccc4@gregkh>
References: <2025120119-quake-universal-d896@gregkh>
 <20251201225123.1298682-1-sashal@kernel.org>
 <250b44b3-e75b-4f8d-af44-d3a985ea554c@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <250b44b3-e75b-4f8d-af44-d3a985ea554c@suse.de>
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 02, 2025 at 08:42:52AM +0100, Thomas Zimmermann wrote:
> Hi,
> 
> thanks for backporting.
> 
> You also have to remove the calls to vga_switcheroo_client_fb_set() from
> these files
> 
> https://elixir.bootlin.com/linux/v6.6/source/drivers/gpu/drm/i915/display/intel_fbdev.c
> 
> https://elixir.bootlin.com/linux/v6.6/source/drivers/gpu/drm/radeon/radeon_fbdev.c

Also, a fixed backport would be appreciated here.

thanks

greg k-h
