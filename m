Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 136E68C9421
	for <lists+dri-devel@lfdr.de>; Sun, 19 May 2024 10:54:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4AD910E063;
	Sun, 19 May 2024 08:54:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="nZr0+0uH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95E4C10E0A8
 for <dri-devel@lists.freedesktop.org>; Sun, 19 May 2024 08:54:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 69181CE0976;
 Sun, 19 May 2024 08:54:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAF3EC32781;
 Sun, 19 May 2024 08:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1716108879;
 bh=avtQ0tx1UdGxRsX9qlthvVsjKBAmRdw8FRebf2A40AY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nZr0+0uH7hovHNTAPMinTSPdETzLlI5O+iBMGKaXSs8Dn6tjYThYVZzpuuB3q89k7
 8ivAraMr8BuZNiDzkNjR/dw/01BJItU3zMnON0g2J5TM9Tz5uw5dZXEBMbSE45LRbU
 njK9ujwV0dIekKzEFZV4X3qw2RHWZ5KQYPCMhgUQ=
Date: Sun, 19 May 2024 10:54:36 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Val Packett <val@packett.cool>
Cc: stable@vger.kernel.org, Sandy Huang <hjc@rock-chips.com>,
 Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] drm/rockchip: vop: clear DMA stop bit on flush on
 RK3066
Message-ID: <2024051930-canteen-produce-1ba7@gregkh>
References: <20240519074019.10424-1-val@packett.cool>
 <2024051936-cosmetics-seismic-9fea@gregkh>
 <0C5QDS.UDESKUXHKPET1@packett.cool>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0C5QDS.UDESKUXHKPET1@packett.cool>
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

On Sun, May 19, 2024 at 05:38:24AM -0300, Val Packett wrote:
> 
> 
> On Sun, May 19 2024 at 09:59:47 +02:00:00, Greg KH
> <gregkh@linuxfoundation.org> wrote:
> > On Sun, May 19, 2024 at 04:31:31AM -0300, Val Packett wrote:
> > >  On the RK3066, there is a bit that must be cleared on flush,
> > > otherwise
> > >  we do not get display output (at least for RGB).
> > 
> > What commit id does this fix?
> 
> I guess: f4a6de855e "drm: rockchip: vop: add rk3066 vop definitions" ?

Great, can you add a Fixes: tag when you resend these?

> But similar changes like:
> 742203cd "drm: rockchip: add missing registers for RK3066"
> 8d544233 "drm/rockchip: vop: Add directly output rgb feature for px30"
> did not have any "Fixes" reference.

Just because people didn't properly tag things in the past, doesn't mean
you should perpetuate that problem :)

thanks,

greg k-h
