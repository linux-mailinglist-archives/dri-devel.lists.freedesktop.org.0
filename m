Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C6D28C93C6
	for <lists+dri-devel@lfdr.de>; Sun, 19 May 2024 09:59:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09DF810E099;
	Sun, 19 May 2024 07:59:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Q+2tvIxp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E039F10E099
 for <dri-devel@lists.freedesktop.org>; Sun, 19 May 2024 07:59:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5334760DFB;
 Sun, 19 May 2024 07:59:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70A4FC32781;
 Sun, 19 May 2024 07:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1716105575;
 bh=H/2+qHdYi7ZEH7Zr9/SLo5WPHWSoGzS8PBcfWjDh6Hg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Q+2tvIxpjbjvQNCxXWSJzFAJeeMCAvdCKktm2TtN70Zxn9KA+SXM7CaJRPaq/WpPl
 IbyyFYOyMX8vooiPyAgSrFHyI9DSfvabTdmqdXmlpaS87pHIqmS4kUQO6IRUWyUr7Y
 9b3oYYAIZC/B0s3437qH/UsmtvzKbdxc5YeUFnf0=
Date: Sun, 19 May 2024 09:59:32 +0200
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
Subject: Re: [PATCH 2/2] drm/rockchip: vop: enable VOP_FEATURE_INTERNAL_RGB
 on RK3066
Message-ID: <2024051907-extruding-overplant-54f1@gregkh>
References: <20240519074019.10424-1-val@packett.cool>
 <20240519074019.10424-2-val@packett.cool>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240519074019.10424-2-val@packett.cool>
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

On Sun, May 19, 2024 at 04:31:32AM -0300, Val Packett wrote:
> Signed-off-by: Val Packett <val@packett.cool>
> Cc: stable@vger.kernel.org
> ---
>  drivers/gpu/drm/rockchip/rockchip_vop_reg.c | 1 +
>  1 file changed, 1 insertion(+)

Maybe the DRM subsystem has more lax rules, but I know I can't take
patches without any changelog text at all, sorry.

greg k-h
