Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EF2F9A3B81
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2024 12:29:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B458410E8E3;
	Fri, 18 Oct 2024 10:29:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="cQiL5YnY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FFBF10E8E3
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2024 10:28:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 82C0E5C5FCA;
 Fri, 18 Oct 2024 10:28:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58D37C4CECF;
 Fri, 18 Oct 2024 10:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1729247338;
 bh=REWg+DJcLyxWQwSgmCkjX3Xts0CxpAY3QlIkvgz2udE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cQiL5YnYYObn8WGM1v2tkJTEgXR5mPsX4C3ph5p4orSVsOzOqDj44vgXhLdX8C6mv
 ZKm99uxHdyLWb9pjjk4OySF0c7Ab8L19FNCVl8s+sbGScKUPVRnkesxthRYDO5sx/w
 YWrPb44Bpp2A9U57VUfsOci3Ow6tBBg0sym3VtNw=
Date: Fri, 18 Oct 2024 12:28:51 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Sherry Yang <sherry.yang@oracle.com>
Cc: stable@vger.kernel.org, sashal@kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
 eric@anholt.net, robh@kernel.org, noralf@tronnes.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 6.1.y 5.15.y] drm/shmem-helper: Fix BUG_ON() on
 mmap(PROT_WRITE, MAP_PRIVATE)
Message-ID: <2024101845-dictator-contusion-bf29@gregkh>
References: <20241017171829.2040531-1-sherry.yang@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241017171829.2040531-1-sherry.yang@oracle.com>
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

On Thu, Oct 17, 2024 at 10:18:29AM -0700, Sherry Yang wrote:
> From: "Wachowski, Karol" <karol.wachowski@intel.com>
> 
> commit 39bc27bd688066a63e56f7f64ad34fae03fbe3b8 upstream.

Now queued up, thanks.

greg k-h
