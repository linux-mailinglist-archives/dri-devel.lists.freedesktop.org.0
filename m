Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 94A931A9C1E
	for <lists+dri-devel@lfdr.de>; Wed, 15 Apr 2020 13:25:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B298C6E970;
	Wed, 15 Apr 2020 11:25:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F38FF6E970
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 11:25:26 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id x4so16973791wmj.1
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 04:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=apXLkj8/Y6/Je/J3pw9VYIeGtZznbEDSTaodMw9SIP8=;
 b=CtHkHYlCnlsa+tUc8/F7g7a0/P6u8ejT1ayfSACtu0kpWhs3EFaqXHsG66HdK2TqVO
 1YepPve4g/tteoWGzn/BId3gVqa0gSrcAXKoX7yewG/1H0vQN4Qe2Pn7YxQ/IdDn6tw3
 UgUpHRyZ0gelkfNm/V6/st91NhPu8ozpGjQpo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=apXLkj8/Y6/Je/J3pw9VYIeGtZznbEDSTaodMw9SIP8=;
 b=sWoINvWtLBLyT05VkJiLpOni7L/fNzRpWBrZUj56W7ZBQd+jM/Zvg75FdlxO/QQfGQ
 eNBRzcdFplARHxqPz4qC1joACh4DX62eE/MAZXkR11v5OAcWv0nbu6xJvb7/rN96+Sng
 kWFtBVu3UcDaopHvhPP6IflK6vQ8eekDfsSTM7lMmIBec6i7G/QSrFPd2KMYfWTgRiRl
 ajRlw00uJJTIFXDeJwG5sPVe7q08xTHkVsHB+eLaf8l+5fOixmwYyOIn5Gr5sr/BDw28
 u0xq1o9kY38agy4qjrrVi0z9SlpWFNTmpk7VXzewDRQ3TBdYllQQknYmGUCOS1gucIcG
 uygg==
X-Gm-Message-State: AGi0PubCu/PbUGZhz6pzfz80t39hw+Ixwy0iRML4WFwKT/MjwoDlrl8t
 h3nFD114FTuNPbzPQNGd+4xr2g==
X-Google-Smtp-Source: APiQypLPhakDBiE4HRC90MnW5/bRC2vpIu2AQD3Xvb6Y3wPK7412N1qq31ytrTaUWKirLB1NJ1AesQ==
X-Received: by 2002:a1c:7c13:: with SMTP id x19mr4706062wmc.124.1586949925687; 
 Wed, 15 Apr 2020 04:25:25 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id w3sm4358429wrc.18.2020.04.15.04.25.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Apr 2020 04:25:25 -0700 (PDT)
Date: Wed, 15 Apr 2020 13:25:23 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Colin King <colin.king@canonical.com>
Subject: Re: [PATCH][next] drm/rockchip: fix spelling mistake "modifer" ->
 "modifier"
Message-ID: <20200415112523.GA3456981@phenom.ffwll.local>
Mail-Followup-To: Colin King <colin.king@canonical.com>,
 Sandy Huang <hjc@rock-chips.com>,
 Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20200415083420.366279-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200415083420.366279-1-colin.king@canonical.com>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
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
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org,
 Sandy Huang <hjc@rock-chips.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 15, 2020 at 09:34:20AM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> There is a spelling mistake in a DRM_DEBUG_KMS debug message. Fix it.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Queued for 5.8, thanks for your patch.
-Daniel

> ---
>  drivers/gpu/drm/rockchip/rockchip_drm_vop.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
> index b87d22eb6ae1..33463b79a37b 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
> @@ -769,7 +769,7 @@ static bool rockchip_mod_supported(struct drm_plane *plane,
>  		return true;
>  
>  	if (!rockchip_afbc(modifier)) {
> -		DRM_DEBUG_KMS("Unsupported format modifer 0x%llx\n", modifier);
> +		DRM_DEBUG_KMS("Unsupported format modifier 0x%llx\n", modifier);
>  
>  		return false;
>  	}
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
