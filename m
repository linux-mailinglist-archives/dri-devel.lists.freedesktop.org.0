Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A3068D87F3
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jun 2024 19:30:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD0FE10E267;
	Mon,  3 Jun 2024 17:30:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=treblig.org header.i=@treblig.org header.b="d/I1cH1f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17AD810E267;
 Mon,  3 Jun 2024 17:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
 ; s=bytemarkmx;
 h=Content-Type:MIME-Version:Message-ID:Subject:From:Date:From
 :Subject; bh=N1rA3ay0tZG+PPeHYHe8unqz8YmRW6XYkHVM0lfB4Dw=; b=d/I1cH1fk5K56xrJ
 nJHlCjeC/Gt73oh4PlPiL3mfaYyOMq4eUTIJy6ZVuYB0zxtn/SGyPd39jH2VUhEsqNxzeNuOdGWaW
 NMS8WAATQNy4apezaQHsCPsHD3U0QvpHGLfhgI1mvhu+hkM33TALSVtwl74ZL0R2GmDTj3QMijweG
 Yrxm3q3Jjd2LqRBgxUIbKXYLOU0eJMaFG0s5njtZjgiS16KO5fNhxeuYVkPKkdCRIbS7d9C4e8aSk
 L/Ob5zua3j1qmS8RRJP7cS5KNxPw/hF+V0Tzg1XMTMHZ6l+1s+xI0LPdp1Vl8/Lz3s4SbZnIi3rzv
 zw49hFDcVq8D9Hz7Pw==;
Received: from dg by mx.treblig.org with local (Exim 4.96)
 (envelope-from <dg@treblig.org>) id 1sEBVz-003zuI-0j;
 Mon, 03 Jun 2024 17:30:35 +0000
Date: Mon, 3 Jun 2024 17:30:35 +0000
From: "Dr. David Alan Gilbert" <linux@treblig.org>
To: kherbst@redhat.com, lyude@redhat.com, dakr@redhat.com
Cc: bskeggs@redhat.com, daniel@ffwll.ch, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/6] drm/nouveau: remove unused struct 'init_exec'
Message-ID: <Zl39u4zOif2Sw4Sa@gallifrey>
References: <20240517232617.230767-1-linux@treblig.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20240517232617.230767-1-linux@treblig.org>
X-Chocolate: 70 percent or better cocoa solids preferably
X-Operating-System: Linux/6.1.0-21-amd64 (x86_64)
X-Uptime: 17:29:59 up 26 days, 4:44, 1 user, load average: 0.00, 0.00, 0.00
User-Agent: Mutt/2.2.12 (2023-09-09)
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

* linux@treblig.org (linux@treblig.org) wrote:
> From: "Dr. David Alan Gilbert" <linux@treblig.org>
> 
> 'init_exec' is unused since
> commit cb75d97e9c77 ("drm/nouveau: implement devinit subdev, and new
> init table parser")
> Remove it.
> 
> Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>

Ping.


> ---
>  drivers/gpu/drm/nouveau/nouveau_bios.c | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_bios.c b/drivers/gpu/drm/nouveau/nouveau_bios.c
> index 79cfab53f80e..8c3c1f1e01c5 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_bios.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_bios.c
> @@ -43,11 +43,6 @@
>  #define BIOSLOG(sip, fmt, arg...) NV_DEBUG(sip->dev, fmt, ##arg)
>  #define LOG_OLD_VALUE(x)
>  
> -struct init_exec {
> -	bool execute;
> -	bool repeat;
> -};
> -
>  static bool nv_cksum(const uint8_t *data, unsigned int length)
>  {
>  	/*
> -- 
> 2.45.1
> 
-- 
 -----Open up your eyes, open up your mind, open up your code -------   
/ Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
\        dave @ treblig.org |                               | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/
