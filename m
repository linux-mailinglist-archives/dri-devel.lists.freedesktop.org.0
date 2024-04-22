Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 943248AD558
	for <lists+dri-devel@lfdr.de>; Mon, 22 Apr 2024 21:59:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F069110F804;
	Mon, 22 Apr 2024 19:59:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="I4mrlvZi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E6E910F804
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Apr 2024 19:59:01 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-518931f8d23so5122136e87.3
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Apr 2024 12:59:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713815940; x=1714420740; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=BCaWoKLrALkIbA4A/YaIT+eUoN1vxXvgvkVTJTvpm9w=;
 b=I4mrlvZir1Npz3IRI9GXYgZ+hDh8F7TvAhH/EF0NnEKgeJp/F0+Pa5HFGXtssBPLeq
 E03sgmgyGlaCB6fhJcmRe1V9c/31geUYH2gVPCC5K2vhByvBWEJeazgI6zL8poqVsaXZ
 O9TLmlMnJnSdJfJM85Mtd4UHXMc1aiX2H9mIJDHiNK9lV5U5gLf8IOkX4DV0JByV43s/
 fQecDJv8Xu35KZjaMBw47WJTdI6JF3QXo//OvcPn7p9Cm1G2hCiLsI1xlCuWAlX03Doj
 +WN/zSJMT81ZT5C5aSR89/5N7fmWEPshep+JRX/YAn1tsQyO1zBu5qQ4FfCnTvkYCFOK
 FADA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713815940; x=1714420740;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BCaWoKLrALkIbA4A/YaIT+eUoN1vxXvgvkVTJTvpm9w=;
 b=JvSZkZTbiI0g/iNuE2qx7fZ6tZ1d0Sgj2aKnJHMKOjTfUVW60exayIVIj9ZwA5GB2m
 U1MX5eMlAgwfDmymYnZSllzjsdbTpx0nvNC3uEiFiz/MwpgfSOadsqmYxCak687bn/tX
 0XdezmU1XeAkK1znR1qeVnvIErqUUCSRcbIPIsxf26e9z14/Tb593pMZsdgz2o1GR2Dc
 1o7FOIZAvdDKxW6IHLT4YuXzhFMg+jnRyTyNZuLMumpH+lALozt/EnNLPbBH7SLEobzg
 nbRR3o3+lk5nZgAijGnmP9H0/DujAim8ztoYN6XyGNx/DtXXNbAXbuyn4UbfzHkLgMrq
 XaWw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUvT6t/oqri+2589M+8kplOzb5G+Vic6D6FixA26OIFCWmHUEm0oj1tZ/MXnq6OA6PVgzRzZ40NDclS/VSykeW587UrZ/Io0g+1xrV6U3HB
X-Gm-Message-State: AOJu0Ywn6hfiy7Q0QKP1igFLigqJyUfjrqELgiscvNWrriOHCIjaOHsc
 VtXBsMMG/Luh+W6WjQ+GIyNhFw/fxZ6JoWNTzU1mgSLLmylJ/fpOxod7/pbMjmw=
X-Google-Smtp-Source: AGHT+IFUb73EfVZYDKKz5Mp4KXCiEORIldm2g3t08iybjPl3d+C9b5pMwoTT+328QacufrKQEVzKOg==
X-Received: by 2002:a05:6512:2016:b0:51b:180a:7b7c with SMTP id
 a22-20020a056512201600b0051b180a7b7cmr3000623lfb.3.1713815939653; 
 Mon, 22 Apr 2024 12:58:59 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::8a5])
 by smtp.gmail.com with ESMTPSA id
 j11-20020ac2550b000000b005195b745303sm1812574lfk.116.2024.04.22.12.58.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Apr 2024 12:58:58 -0700 (PDT)
Date: Mon, 22 Apr 2024 22:58:57 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Sui Jingfeng <sui.jingfeng@linux.dev>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Phong LE <ple@baylibre.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/9] drm/bridge: simple-bridge: Add platform module
 alias
Message-ID: <rkmyhgdfyowtec3yfoyubtkb4v55qc5vn3kltc2mapml6qsbed@qdilwjw2hqgf>
References: <20240422191903.255642-1-sui.jingfeng@linux.dev>
 <20240422191903.255642-4-sui.jingfeng@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240422191903.255642-4-sui.jingfeng@linux.dev>
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

On Tue, Apr 23, 2024 at 03:18:57AM +0800, Sui Jingfeng wrote:
> Otherwise when compiled as module, this driver will not be probed on
> non-DT environment. This is a fundamential step to make this driver
> truely OF-independent.
> 
> Signed-off-by: Sui Jingfeng <sui.jingfeng@linux.dev>
> ---
>  drivers/gpu/drm/bridge/simple-bridge.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/bridge/simple-bridge.c b/drivers/gpu/drm/bridge/simple-bridge.c
> index 3b09bdd5ad4d..6be271d1394b 100644
> --- a/drivers/gpu/drm/bridge/simple-bridge.c
> +++ b/drivers/gpu/drm/bridge/simple-bridge.c
> @@ -308,3 +308,4 @@ module_platform_driver(simple_bridge_driver);
>  MODULE_AUTHOR("Maxime Ripard <maxime.ripard@free-electrons.com>");
>  MODULE_DESCRIPTION("Simple DRM bridge driver");
>  MODULE_LICENSE("GPL");
> +MODULE_ALIAS("platform:simple-bridge");

I think it would be better to use MODULE_DEVICE_TABLE(platform,
simple_bridge_platform)id_table). Note, there is no such thing as
generic 'simple_bridge'. I'd expect platform device to have a
device-specific name which can be matched by the driver. This requires a
platform_device_id table.

> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
