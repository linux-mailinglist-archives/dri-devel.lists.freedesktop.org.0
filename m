Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57E333753CB
	for <lists+dri-devel@lfdr.de>; Thu,  6 May 2021 14:26:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88ACB6E15E;
	Thu,  6 May 2021 12:26:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 948FA6E15E
 for <dri-devel@lists.freedesktop.org>; Thu,  6 May 2021 12:26:13 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id m9so5417450wrx.3
 for <dri-devel@lists.freedesktop.org>; Thu, 06 May 2021 05:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=/ifHkTWOlt0DCppHf0tpts48yR60EAMQ4VuIqqohHTk=;
 b=cIxAAr/UHi0mhTlZ2dvqpczrkI87aVz4IiHEjr3BX2ILV8dGTxwiRSMUSMLGjVeKfn
 NAzGDKYNfZbCBIlWEOOJPqj99nHbBs8ggFRYPuWMpejYj/R9296ANExKyDRutmJaWp3Y
 oZXAhiZVNBVPj2f3QbSjIYWAyIvBffmYfpnDY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=/ifHkTWOlt0DCppHf0tpts48yR60EAMQ4VuIqqohHTk=;
 b=SFQ2FhqMPu4oHI1ttUvekOEVNN1jlDXc4vlfOvnPImABvw/HEIVMKVXXxLl+CBFjF8
 9rOBhJ97pDaqwqQXUBewM6ssbH6gBIxSvM5Pm/WRuewWf2KVFkTJkSrLB6HAS6tWa48C
 uZUxZCJRTPM23FWtq3g/uVbcdfU6UvJ+CGo0CGYrW7Auaxf4GhwfwC99jImam5PQDkej
 mctn+Xn4SxLR7r+vXpCEf8P6/lIU1T4Yx971/aUsJOP5RTYRzkuodBmrvqLulFRS+0Kv
 thvFwDW0VsXgEgrgoqrW1EuS9WnRc1b0Kn6dPWEueq7eTzqHBluMp1DRKtPJ00J8Jh67
 1YoA==
X-Gm-Message-State: AOAM5334uD7fS4B3Fr431P79OwRulvQ0VI5+gKT2wyK6DWeunxg9E3Af
 MXByHZHGl7okk3x0sRo00qIQIxdmnEkLhA==
X-Google-Smtp-Source: ABdhPJzNckMKDFTCHdiXh/0znHW0NmpfbmlQAeOAP2a53r7g8zV70gcy6c0b66SMNORZaZ7dF7ZdKw==
X-Received: by 2002:a05:6000:110c:: with SMTP id
 z12mr4706973wrw.188.1620303972145; 
 Thu, 06 May 2021 05:26:12 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id l12sm4428819wrq.36.2021.05.06.05.26.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 May 2021 05:26:11 -0700 (PDT)
Date: Thu, 6 May 2021 14:26:09 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Wan Jiabing <wanjiabing@vivo.com>
Subject: Re: [PATCH] drm/gma500: update comment of psb_spank()
Message-ID: <YJPgYaQfDwQF5iJz@phenom.ffwll.local>
Mail-Followup-To: Wan Jiabing <wanjiabing@vivo.com>,
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kael_w@yeah.net
References: <20210506112851.20315-1-wanjiabing@vivo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210506112851.20315-1-wanjiabing@vivo.com>
X-Operating-System: Linux phenom 5.10.32scarlett+ 
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, kael_w@yeah.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, May 06, 2021 at 07:28:51PM +0800, Wan Jiabing wrote:
> In commit 5c209d8056b9 ("drm/gma500: psb_spank() doesn't need it's
> own file"), accel_2d.c was deleted and psb_spank() was moved into
> psb_drv.c. Fix the comment here.
> 
> Signed-off-by: Wan Jiabing <wanjiabing@vivo.com>

Queued up for 5.14, thanks for your patch.
-Daniel

> ---
>  drivers/gpu/drm/gma500/psb_drv.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/gma500/psb_drv.h b/drivers/gpu/drm/gma500/psb_drv.h
> index 49afa577d442..d6e7c2c2c947 100644
> --- a/drivers/gpu/drm/gma500/psb_drv.h
> +++ b/drivers/gpu/drm/gma500/psb_drv.h
> @@ -646,7 +646,7 @@ extern u32 psb_get_vblank_counter(struct drm_crtc *crtc);
>  extern int psbfb_probed(struct drm_device *dev);
>  extern int psbfb_remove(struct drm_device *dev,
>  			struct drm_framebuffer *fb);
> -/* accel_2d.c */
> +/* psb_drv.c */
>  extern void psb_spank(struct drm_psb_private *dev_priv);
>  
>  /* psb_reset.c */
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
