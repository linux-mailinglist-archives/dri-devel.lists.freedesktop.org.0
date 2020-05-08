Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5B8B1CA4CD
	for <lists+dri-devel@lfdr.de>; Fri,  8 May 2020 09:08:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C90DF6EA86;
	Fri,  8 May 2020 07:08:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB8CD6EA86
 for <dri-devel@lists.freedesktop.org>; Fri,  8 May 2020 07:08:41 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id v12so575463wrp.12
 for <dri-devel@lists.freedesktop.org>; Fri, 08 May 2020 00:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=DmTzp+J4aS4CxYYhCILNVwYfVehwX/dqCJCx5jKGlEM=;
 b=CEhHuPS/Sdlv7SlOF1Hc4wrg/jxQ0bfVMANuWCZjoRc8dNc/HsdgEoZO7HGBHXwoaf
 ruEIoF3gHK5AY6lSz66A+ROgs5JDNmxQyX5jJA9tVa0h0eLsOpexhZTVa8lNea46FiWB
 /GPsBiQ9zAcTAkVD8gFbnjr8OjE1EkxiL9eto=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=DmTzp+J4aS4CxYYhCILNVwYfVehwX/dqCJCx5jKGlEM=;
 b=uWtlgCnwK0Usveh3DvMpPZTAvTvlYxfK+McX6Z4drn5zoUC+uBe90oYpalQyUeev6z
 1Xpg4EqrDWAPvnpY81+O7LqCnKqjzvYJIUUuxnSFxvcrfCzP6QEnNBeTfPdlNjJFYfVy
 urE5dt8Bms/gumIHWp8F81cM4Zk3rF7vTpkCeYZ0HWB5DKr6e8eNP6/MfXarl5aJRxKL
 LpAnIY/kiy8vCJSLuP9Zt7BaU76BwROTrI+ix5iPrAmm8wZ2lrVExNO3VA9XcFBSReIp
 3P2OYO/GXYsyAmjLRk/mQZXK2YEOZ1v5d0hGfYzWRXQJtXj7Y1MAL4vm3pIhLOECZ3B5
 w1eQ==
X-Gm-Message-State: AGi0PuZyBEjylHRJGII33L/DT2DP8mXdt3H/axt1tJlRQ+c6anDccjLF
 TwqidObtZh0+ffFMZXyfCTEtFA==
X-Google-Smtp-Source: APiQypIdXHZDbCY1mjOHI7A02KN/NFXcXdx0OSG3FPCPhGoilD6eSlbRaDrFn+uMA+JdV38nVB2Qsw==
X-Received: by 2002:adf:e791:: with SMTP id n17mr1265834wrm.217.1588921720359; 
 Fri, 08 May 2020 00:08:40 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id s24sm12302509wmj.28.2020.05.08.00.08.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 May 2020 00:08:39 -0700 (PDT)
Date: Fri, 8 May 2020 09:08:37 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Colin King <colin.king@canonical.com>
Subject: Re: [PATCH] drm/exynos: remove redundant initialization to variable
 'start'
Message-ID: <20200508070837.GF1383626@phenom.ffwll.local>
Mail-Followup-To: Colin King <colin.king@canonical.com>,
 Inki Dae <inki.dae@samsung.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 David Airlie <airlied@linux.ie>, Kukjin Kim <kgene@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20200507202237.64350-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200507202237.64350-1-colin.king@canonical.com>
X-Operating-System: Linux phenom 5.4.0-4-amd64 
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
Cc: linux-samsung-soc@vger.kernel.org, Joonyoung Shim <jy0922.shim@samsung.com>,
 David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org,
 Seung-Woo Kim <sw0312.kim@samsung.com>, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, May 07, 2020 at 09:22:37PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The variable 'start' is being initialized with a value that is never read
> and it is being updated later with a new value.  The initialization is
> redundant and can be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/exynos/exynos_drm_dsi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> index 902938d2568f..b0b9cb1ec18f 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> @@ -1150,7 +1150,7 @@ static bool exynos_dsi_transfer_finish(struct exynos_dsi *dsi)
>  {
>  	struct exynos_dsi_transfer *xfer;
>  	unsigned long flags;
> -	bool start = true;
> +	bool start;
>  
>  	spin_lock_irqsave(&dsi->transfer_lock, flags);
>  
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
