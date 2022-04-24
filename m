Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B3C5050D4F6
	for <lists+dri-devel@lfdr.de>; Sun, 24 Apr 2022 22:01:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A61C710E248;
	Sun, 24 Apr 2022 20:01:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 093FA10E248
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Apr 2022 20:01:18 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id p18so11044693edr.7
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Apr 2022 13:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Sf7MisxX3LNkimFSGyyrRktC622uWreucLzzkMFjVxE=;
 b=ZCIOZskE2WztPBVoBucejcl7KLi6eC4H3SnAqCPc8CvXVbhaKCFqwAOkouOeE3XIw4
 Xy2c+vTyka6xFaVskcbnlsDda6uY8l17JywdD5/voUCg6WN8WfLqOfGDW68e9t+zTrEt
 0EHyLLmWu+HgvGreor3M+2VVypMDBiYfpZCtdFON1ARa2E2BpkOlpCgpPhP2fFI1EA+5
 ObzvHgO+fm64AsNH8zzoWadVcDd/LHj4R65koel07f0BbMnNw0Gw4WNP2zXSvvs9gpKM
 tU7yAiznylfXsOKwsrA50rAMWixxISSD1TGwBbMsRoIYHTLavXJU2TUKruLGGZJBkdTh
 YiiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Sf7MisxX3LNkimFSGyyrRktC622uWreucLzzkMFjVxE=;
 b=YhCj6BxCTnta3r5iqtW+EDCJYkd7e4cg01vGFct1icfVAUyWO6WKVWzlLiCTM1kckO
 ZgB65tKV1w3hj3llafuDNwJDis/hVpR0TtvUpONZPxN25L31uy/Znpl3NXXw6jEU0Qpe
 a8QFiDSKGsvACANP6xM5C6zDnti8L8cp04V5Oa1PbQtPX7sZa6KSweT1Go/Eu/3klHEV
 19Tb9CVyQUGCkQHz6UyUbTxALupEtrMcJ2UfWHj9zxZ+eKlOITYgvI11P2gJusY485qO
 BAW4nN1A7zyrSIv0L3DLD3f1cgCrdNdOEiV90E7wnHYsHe0bnSbs2bojTvNljjDMBrcG
 6rsg==
X-Gm-Message-State: AOAM531trnYsBbxQHT2RwK1i4gMbugBfklzOs842jSwGPkv1b71S3mKt
 zGawRiF8q/93C0dLUtHMaWQ=
X-Google-Smtp-Source: ABdhPJw9EYpgPzBF7aomsbu5Pu2r+fJI1zxuI2gBwhN5+KDIqR1ckuUKzGAma1SNoXggt53pH+Sczw==
X-Received: by 2002:a50:ed11:0:b0:425:c3d1:4547 with SMTP id
 j17-20020a50ed11000000b00425c3d14547mr12150359eds.410.1650830476615; 
 Sun, 24 Apr 2022 13:01:16 -0700 (PDT)
Received: from kista.localnet (cpe-86-58-32-107.static.triera.net.
 [86.58.32.107]) by smtp.gmail.com with ESMTPSA id
 x17-20020a170906297100b006e49a9535f3sm2893176ejd.114.2022.04.24.13.01.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Apr 2022 13:01:16 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <mripard@kernel.org>,
 Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH v3 09/14] drm/sun4i: Allow VI layers to be primary planes
Date: Sun, 24 Apr 2022 22:01:15 +0200
Message-ID: <2236113.ElGaqSPkdT@kista>
In-Reply-To: <20220424162633.12369-10-samuel@sholland.org>
References: <20220424162633.12369-1-samuel@sholland.org>
 <20220424162633.12369-10-samuel@sholland.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
Cc: devicetree@vger.kernel.org, Samuel Holland <samuel@sholland.org>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Dne nedelja, 24. april 2022 ob 18:26:27 CEST je Samuel Holland napisal(a):
> D1's mixer 1 has no UI layers, only a single VI layer. That means the
> mixer can only be used if the primary plane comes from this VI layer.
> Add the code to handle this case.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej Skrabec

> ---
> 
> (no changes since v2)
> 
> Changes in v2:
>  - Use Jernej's patches for mixer mode setting.
> 
>  drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/
sun8i_vi_layer.c
> index bb7c43036dfa..f7d0b082d634 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
> @@ -542,6 +542,7 @@ struct sun8i_vi_layer *sun8i_vi_layer_init_one(struct 
drm_device *drm,
>  					       struct 
sun8i_mixer *mixer,
>  					       int index)
>  {
> +	enum drm_plane_type type = DRM_PLANE_TYPE_OVERLAY;
>  	u32 supported_encodings, supported_ranges;
>  	unsigned int plane_cnt, format_count;
>  	struct sun8i_vi_layer *layer;
> @@ -560,12 +561,15 @@ struct sun8i_vi_layer *sun8i_vi_layer_init_one(struct 
drm_device *drm,
>  		format_count = ARRAY_SIZE(sun8i_vi_layer_formats);
>  	}
>  
> +	if (!mixer->cfg->ui_num && index == 0)
> +		type = DRM_PLANE_TYPE_PRIMARY;
> +
>  	/* possible crtcs are set later */
>  	ret = drm_universal_plane_init(drm, &layer->plane, 0,
>  				       &sun8i_vi_layer_funcs,
>  				       formats, format_count,
>  				       sun8i_layer_modifiers,
> -				       DRM_PLANE_TYPE_OVERLAY, 
NULL);
> +				       type, NULL);
>  	if (ret) {
>  		dev_err(drm->dev, "Couldn't initialize layer\n");
>  		return ERR_PTR(ret);
> -- 
> 2.35.1
> 
> 


