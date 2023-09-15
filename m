Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D65517A14F3
	for <lists+dri-devel@lfdr.de>; Fri, 15 Sep 2023 06:58:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85EAF10E075;
	Fri, 15 Sep 2023 04:58:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [IPv6:2607:f8b0:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9D5B10E075
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Sep 2023 04:58:36 +0000 (UTC)
Received: by mail-pg1-x532.google.com with SMTP id
 41be03b00d2f7-577fb90bbebso1146350a12.1
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Sep 2023 21:58:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1694753916; x=1695358716;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=fhsajtpeOeh2nBytWoKmEmN9EZC9U8e31FJLV6iox60=;
 b=m6rmh8o8lbdtonto2uYMnotJE6sEWhOG7NpNYK5QmgBMdP0XxyGDabfbuEwuLG9Yjk
 nCyd4gNTUJXeJdUfWuwgLczANscCJlCORMFAUA8wOAjAksA1F+iWRjyeUFkJpoboQKap
 rWfjZl7fGSHc5XP1s4aPJBXcFmy5OoUnqB3e8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694753916; x=1695358716;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fhsajtpeOeh2nBytWoKmEmN9EZC9U8e31FJLV6iox60=;
 b=SHPN3qepd2F9DWzRCg1LcJfOuumBPRYjBZFS4ayOGYqcCrA3Q/eaEyLai0sahP2Dz2
 QUklzRU1VDHtwB+15XW4SXBxlE0Vd8u9xouM9A8MDL77PNnG/NNAXIlJTYJiQf9jgGe/
 Kyo2DLOEmIa0IXSwvWmLbj+2o8XVJiAV8HSEFRoelNBL/hvioc3G5f6DZoWr4lOoCVLs
 G4IPNsn2XFrfRQ567B+GUvPiZHqPByes448PLqGM5ebwQilamxnTfIsHsoFIo+glaMJO
 wyjK2YF4x44JnYw3Ds5l0SwUeEWIQsr2YXAFYZJu9s47ciysoijUB4CfkgVTNEzkewJK
 8IUA==
X-Gm-Message-State: AOJu0Yzw2MsuBY3PdmVoui6ZHWrLvcwC2OQJKN5Oi4pcIh0WRIcxlNBS
 IDUvCGRFdAYwXclYpYagSmoqww==
X-Google-Smtp-Source: AGHT+IHAmWQcAvThssqgWXbggJNS/TydsVAkxf1KlDv9GNBO38qD+u6WVPMGPpXVEOqFJJZtDsV7lg==
X-Received: by 2002:a17:90a:7503:b0:26b:6a2f:7d90 with SMTP id
 q3-20020a17090a750300b0026b6a2f7d90mr523526pjk.23.1694753916448; 
 Thu, 14 Sep 2023 21:58:36 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net.
 [198.0.35.241]) by smtp.gmail.com with ESMTPSA id
 w2-20020a170902d70200b001bbaf09ce15sm2448050ply.152.2023.09.14.21.58.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Sep 2023 21:58:35 -0700 (PDT)
Date: Thu, 14 Sep 2023 21:58:35 -0700
From: Kees Cook <keescook@chromium.org>
To: Justin Stitt <justinstitt@google.com>
Subject: Re: [PATCH] drm/nouveau/core: refactor deprecated strncpy
Message-ID: <202309142158.9D766D97@keescook>
References: <20230914-strncpy-drivers-gpu-drm-nouveau-nvkm-core-firmware-c-v1-1-3aeae46c032f@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230914-strncpy-drivers-gpu-drm-nouveau-nvkm-core-firmware-c-v1-1-3aeae46c032f@google.com>
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
Cc: Karol Herbst <kherbst@redhat.com>, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>, linux-hardening@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Sep 14, 2023 at 09:40:49PM +0000, Justin Stitt wrote:
> `strncpy` is deprecated for use on NUL-terminated destination strings [1].
> 
> We should prefer more robust and less ambiguous string interfaces.
> 
> A suitable replacement is `strscpy` [2] due to the fact that it guarantees
> NUL-termination on the destination buffer without unnecessarily NUL-padding.
> 
> There is likely no bug in the current implementation due to the safeguard:
> | 	cname[sizeof(cname) - 1] = '\0';
> ... however we can provide simpler and easier to understand code using
> the newer (and recommended) `strscpy` api.
> 
> Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#strncpy-on-nul-terminated-strings [1]
> Link: https://manpages.debian.org/testing/linux-manual-4.8/strscpy.9.en.html [2]
> Link: https://github.com/KSPP/linux/issues/90
> Cc: linux-hardening@vger.kernel.org
> Signed-off-by: Justin Stitt <justinstitt@google.com>
> ---
>  drivers/gpu/drm/nouveau/nvkm/core/firmware.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nvkm/core/firmware.c b/drivers/gpu/drm/nouveau/nvkm/core/firmware.c
> index 91fb494d4009..374212da9e95 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/core/firmware.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/core/firmware.c
> @@ -79,8 +79,7 @@ nvkm_firmware_get(const struct nvkm_subdev *subdev, const char *fwname, int ver,
>  	int i;
>  
>  	/* Convert device name to lowercase */
> -	strncpy(cname, device->chip->name, sizeof(cname));
> -	cname[sizeof(cname) - 1] = '\0';
> +	strscpy(cname, device->chip->name, sizeof(cname));
>  	i = strlen(cname);
>  	while (i) {
>  		--i;

Yup, consumed by strlen() and snprintf(). Looks like a standard
conversion. :)

Reviewed-by: Kees Cook <keescook@chromium.org>

-Kees

> 
> ---
> base-commit: 3669558bdf354cd352be955ef2764cde6a9bf5ec
> change-id: 20230914-strncpy-drivers-gpu-drm-nouveau-nvkm-core-firmware-c-791223838b72
> 
> Best regards,
> --
> Justin Stitt <justinstitt@google.com>
> 

-- 
Kees Cook
