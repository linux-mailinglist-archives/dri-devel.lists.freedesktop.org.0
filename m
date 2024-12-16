Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 12ECC9F2D93
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2024 10:59:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42A1910E037;
	Mon, 16 Dec 2024 09:59:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="YexdHixK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68E1610E037
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2024 09:59:39 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2ffa49f623cso48945271fa.1
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2024 01:59:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734343178; x=1734947978; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=FnJu3tNx6PFynXYk1/Woga2+QSGZXsPiestKM7hs3xI=;
 b=YexdHixK93R0jBO2r9EvUywA0fuQdurgQTmOY/oRmRwo0qRi+Omq0WgwugSQwttGAD
 WPUH4v3nf+hs6OknekyoGmSG+ylZtjlXdhdmOiVtBrCfKHGbKGPtkSxw++gtDahnVge0
 izDWDtxVHXsEPGd5TnB1NQ5TKLvCBQ/RMlSA2gXIO9YAnGnTt5fGkOaSE5UJRfLCbzw4
 0Gl9k80w/wz/PjltZAxLiIJuasB4EYNEtWlYgjf0C8q/Hg/uqANLzaY5QpO1zxoEKSpw
 2TzcBCnvQ/Sfpc83Y4tz2HAsvO1n8i6CbqBR/LycXAv7Vnr76vi0u3hL3vnddkChL1+B
 seLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734343178; x=1734947978;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FnJu3tNx6PFynXYk1/Woga2+QSGZXsPiestKM7hs3xI=;
 b=A1ia+Gsmelo4eIgwcDmtT/zRrX6PQPoLBdQKUAzlD20xCM1eHPhS3G1zhs7xRy8Uyq
 YIADQMIG39mBZlKROvqbqTiErxr+F3hhv02fxcFseOIv4fvasSTpNKp4qI8JIfjyDnJ1
 uLP+DJ8XdPFhrwJoUWVRw2IOtbD0q2mf63skhXeQST3j2iE7F5T2cHpzukO59nZpQ7nT
 EgVSXUKNk5YsX7GpO09yTvGJniUFbf70vlWVRJtqASxUnEhVNlopb5Ht5JbOyut5KJRb
 WEx34uL6ONW4wSFNA+ksTpYhao84BqgoQdP/HgmBdyOF6AKkEsU1PoDNnzarU09hHefm
 jAlw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUEDl9lUDKPDaPpOZGKYolgmoJJJKFb7SYhPadPHi11onhtV6+ny840BO0t8xSqzfyZOQs5ezMzwCw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxNIIAJtO3s7N4alyk4gcwfhWz+h60MSuOLYtQhj8Rbc68KXRhI
 E4ET/Hpbx2Z9aMKOk5NOmJUCWFpw6cWCr4rO2bwppTdCIW+Z9FRrTIYp3iBXUFI=
X-Gm-Gg: ASbGncvDs9On1rUEWuYvE7LRKbYuQ4sf+JYXioYNayHb1qg2gZqvQSts6uz1K5SMadC
 rj+QADszaF6wMhtMx6QT7821qpjjPeAQWSVmvw8yq7lyLr+6NtNtsEWWEKcBBleOS/q75qA0ZeH
 5nKqiasEKu6fbYnaagSws58aCb+JFboRzr6YGei59AsUs/O4DmrdeqBN1VzTlRhj8E5oA2U0AU2
 Iwk5x3K2zaoIzztXMDzW0BdfKd3CRcPSlKPoSXg/wlPDd7DBAhCMnyB/Hcp7RZ1t5sm1B/mZRT+
 x7lWnj9SD2B/BBp9gVjboSWzLNjKeP+N8JXJ
X-Google-Smtp-Source: AGHT+IGzuyIoz4RW4zE50l9A5GROziEsvDO7/q2gt1gPF1DlZnBaj2q1Sy1bt91ZKI974j+OroEhRg==
X-Received: by 2002:a2e:a9a8:0:b0:2ff:8e69:77ef with SMTP id
 38308e7fff4ca-302544230e1mr44031131fa.1.1734343177585; 
 Mon, 16 Dec 2024 01:59:37 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-303441a5a75sm8674571fa.99.2024.12.16.01.59.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Dec 2024 01:59:36 -0800 (PST)
Date: Mon, 16 Dec 2024 11:59:33 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andrej Picej <andrej.picej@norik.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com,
 airlied@gmail.com, 
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
 festevam@gmail.com, marex@denx.de, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, upstream@lists.phytec.de
Subject: Re: [PATCH v7 2/3] drm/bridge: ti-sn65dsi83: Add ti,lvds-vod-swing
 optional properties
Message-ID: <75aewnwpb6y73gqlrqmelzeia7bdar5ihm3ety5gfjaqalkuby@gwv4xjpomoit>
References: <20241216085410.1968634-1-andrej.picej@norik.com>
 <20241216085410.1968634-3-andrej.picej@norik.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241216085410.1968634-3-andrej.picej@norik.com>
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

On Mon, Dec 16, 2024 at 09:54:09AM +0100, Andrej Picej wrote:
> Add a optional properties to change LVDS output voltage. This should not
> be static as this depends mainly on the connected display voltage
> requirement. We have three properties:
> - "ti,lvds-termination-ohms", which sets near end termination,
> - "ti,lvds-vod-swing-data-microvolt" and
> - "ti,lvds-vod-swing-clock-microvolt" which both set LVDS differential
> output voltage for data and clock lanes. They are defined as an array
> with min and max values. The appropriate bitfield will be set if
> selected constraints can be met.
> 
> If "ti,lvds-termination-ohms" is not defined the default of 200 Ohm near
> end termination will be used. Selecting only one:
> "ti,lvds-vod-swing-data-microvolt" or
> "ti,lvds-vod-swing-clock-microvolt" can be done, but the output voltage
> constraint for only data/clock lanes will be met. Setting both is
> recommended.
> 
> Signed-off-by: Andrej Picej <andrej.picej@norik.com>
> ---
> Changes in v7:
> - decrement refcount of the endpoint in all error cases,
> - add spaces to improve the readability of the long if statement conditions in
> sn65dsi83_select_lvds_vod_swing.
> Changes in v6:
> - rework termination resistor logic, default is now set by resistor value, not
> reg value,
> - move setting lvds_vod_swing_conf to default value of 0x1 inside if statement
> which checks if both properties are not set
> Changes in v5:
> - specify default values in sn65dsi83_parse_lvds_endpoint,
> - move sn65dsi83_parse_lvds_endpoint for channel B up, outside if,
> Changes in v4:
> - fix typo in commit message bitfiled -> bitfield
> - use arrays (lvds_vod_swing_conf and lvds_term_conf) in private data, instead
> of separate variables for channel A/B
> - add more checks on return value of "of_property_read_u32_array"
> Changes in v3:
> - use microvolts for default array values 1000 mV -> 1000000 uV.
> Changes in v2:
> - use datasheet tables to get the proper configuration
> - since major change was done change the authorship to myself
> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi83.c | 145 +++++++++++++++++++++++++-
>  1 file changed, 142 insertions(+), 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
