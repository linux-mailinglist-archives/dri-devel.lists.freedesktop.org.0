Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 401C676E2DE
	for <lists+dri-devel@lfdr.de>; Thu,  3 Aug 2023 10:24:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F97910E5C5;
	Thu,  3 Aug 2023 08:24:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 555BD10E5C3
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Aug 2023 08:24:04 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-5216095a698so187459a12.0
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Aug 2023 01:24:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1691051043; x=1691655843;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=nbTnDk6xm8bXsJTdMm/u5KzN9buEZoXHsYvGilXN/vg=;
 b=bneCMVzipA/D/51dwZGjvL4lizIX2tke0yFhsH7g4BVayRJ4/dhIhy35lwTqmV1wow
 yIxbU+ZzR1zICMiO+fkFG7QjXP8iN9AceuitqhBWmNchJ7Ei3H7Z6+oPEw9O3vh00l2p
 pRMso+mGPdC/Jptnc21GaaXxBVORbrgUyC7OY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691051043; x=1691655843;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nbTnDk6xm8bXsJTdMm/u5KzN9buEZoXHsYvGilXN/vg=;
 b=gQ8lmiHNEliwrPs4QPNqUvMb3F3FpbwI7rEU5qSjBqHmZkiT5YBLBP5p3MlVCO7DzW
 hL8/d5hhNbkOsbKBcf9WXCYiLr2Zjip6dDc0aW+NTBZDKFIxAeJi4gY4ardgZCv4uiLD
 LPGsEx2WbRcIOKtfmeku/hOSmp87JQM+snYPqnXyRNgA0uyPJImyHefyLQawmxgMMHmn
 PKZMudj9s6YfnPlVIApV7p1CoNpmcaKE8ENYB4CCiSaHO4pcAJlmf2jTe1N+9ZkevpC3
 eTFDMTFZhyVMQh8bZNsom1o3jBujzGsptoj36rsGdHEQXZD/GK9MoBrR6aAaRhOBTOpE
 dRKg==
X-Gm-Message-State: ABy/qLZ47+s3s+hgIiRFGFRI9X807onvC+/VANvhpjylPeTMjDV/3nsp
 woEl1+IR/5VszPAwfHBhkuZanA==
X-Google-Smtp-Source: APBJJlHLFD2eZSNkRmGTYcicJHy3ZlecbYJADNzo18jX1yclgyf54H93esOpSSGvRtGepaDZ+LbKIA==
X-Received: by 2002:a05:6402:35d4:b0:522:28b9:e85f with SMTP id
 z20-20020a05640235d400b0052228b9e85fmr13889998edc.1.1691051042729; 
 Thu, 03 Aug 2023 01:24:02 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 v15-20020aa7dbcf000000b0050488d1d376sm9726889edt.0.2023.08.03.01.24.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Aug 2023 01:24:01 -0700 (PDT)
Date: Thu, 3 Aug 2023 10:24:00 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Justin Green <greenjustin@chromium.org>
Subject: Re: [PATCH RESEND] drm/mediatek: Add valid modifier check
Message-ID: <ZMtkIHkfhbOCodhw@phenom.ffwll.local>
References: <20230724175839.675911-1-greenjustin@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230724175839.675911-1-greenjustin@chromium.org>
X-Operating-System: Linux phenom 6.3.0-2-amd64 
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
Cc: chunkuang.hu@kernel.org, jason-jh.lin@mediatek.com, justin.yeh@mediatek.com,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 wenst@chromium.org, angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jul 24, 2023 at 01:58:39PM -0400, Justin Green wrote:
> Add a check to mtk_drm_mode_fb_create() that rejects any modifier that
> is not the AFBC mode supported by MT8195's display overlays.
> 
> Tested by booting ChromeOS and verifying the UI works, and by running
> the ChromeOS kms_addfb_basic binary, which has a test called
> "addfb25-bad-modifier" that attempts to create a framebuffer with the
> modifier DRM_FORMAT_MOD_INVALID and verifies the ADDFB2 ioctl returns
> EINVAL.
> 
> Signed-off-by: Justin Green <greenjustin@chromium.org>
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> index cd5b18ef7951..2096e8a794ad 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -51,6 +51,13 @@ mtk_drm_mode_fb_create(struct drm_device *dev,
>  	if (info->num_planes != 1)
>  		return ERR_PTR(-EINVAL);
>  
> +	if (cmd->modifier[0] &&
> +	    cmd->modifier[0] != DRM_FORMAT_MOD_ARM_AFBC(
> +					AFBC_FORMAT_MOD_BLOCK_SIZE_32x8 |
> +					AFBC_FORMAT_MOD_SPLIT |
> +					AFBC_FORMAT_MOD_SPARSE))
> +		return ERR_PTR(-EINVAL);

If you set the modifiers/format properties correctly and use all the
helpers then the drm core should already validate that only formats you
can use are allowed.

See c91acda3a380 ("drm/gem: Check for valid formats") and the related gem
fb helper functions to see how this is supposed to be done. These kind of
checks in driver code for gem drivers (which really is everyone at this
point) should not be needed at all.

Cheers, Sima

> +
>  	return drm_gem_fb_create(dev, file, cmd);
>  }
>  
> -- 
> 2.41.0.162.gfafddb0af9-goog
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
