Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F67DA25F50
	for <lists+dri-devel@lfdr.de>; Mon,  3 Feb 2025 16:56:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02C0310E4F8;
	Mon,  3 Feb 2025 15:56:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="mFsQ50W8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E71910E4F8
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Feb 2025 15:56:51 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-54287a3ba3cso5066909e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Feb 2025 07:56:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738598209; x=1739203009; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=XuPn9eD2+NZOGE/JtJyvNpoPT7dTMzCQ+q+2GtUzeK0=;
 b=mFsQ50W8Vj/5ThIFjVroRZXXS05nLvO3zd7XNAIpHm1o3LBVpJCeYWV+lhJt94mjqO
 T6t9s6CPb+MezL+tKnGjh3gFFM+JT5FxJvZWC0Qj3b858lG2VTYoXBvlVzWPUV6URqxF
 rlmb2LEr2dyr76CPV6rJn71snrWkN0edWjskp4EM+fV0OOdLGEYNgrKHQhzQgOXO/SLF
 66PEPbRpP7I0IpI2cXpctsNS79tJsYJakctOh9bdXJ+TE3HkO37BmwLbcaqfcirL1c0u
 4U7E15H/QEc3/ueRKcufzpyOV/2coGvR/iJBQRTMamHemWQqJ/GbPZLo/C/JVabEthCu
 OIJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738598209; x=1739203009;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XuPn9eD2+NZOGE/JtJyvNpoPT7dTMzCQ+q+2GtUzeK0=;
 b=Qy06MzM4fc7GG6MQlAmlgP7jJMz1KlsSa4qt3fGm5HUhtTJxr5u37151ZD3TNylmRv
 8yu/bNGNMr//PZDD75ZVabFfonLTUt6zrs3XSk2qtEVB7UAw3IEMYLpDeO/J3J/bFijW
 2FmkI1N6lHolDdRG4CI1Ke6IiTBSEh0kCwfmC61GfW7Aj15UYShRtDwLxKGMnMtHRyXk
 vEGkuJUmYy5mWnysSXWzuWDHwWgQ1R9E/RFLTB5My52stma17M4g7xOV5yd5locrfTCU
 FTW6+008M3jsFvhgwAwZJHRmQRbUVAV4sTxIZHStuINDnxP/n7war6XPHIN6jjBjSRk9
 8tVA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX1rOxf3CrzaLJiYg4TPDhIjjTqfESpapm455+BDGqHvrG1btweXXysr+7bhCqRTXxVrnyBc44LIy4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxlb5CF02IfVzukXkGUZrkHpRq+/5lSfhy4xg3JCNt2mT92FOPt
 DVgixetWu0eIpNfiZiKgQ52p6l6KGBNhqs6AR165XOFOCzukwMiXd/SQTjRxzyY=
X-Gm-Gg: ASbGncuoC0+hgm6p06p/VVJ+ug41Rek9aul3yYM8WqBAVjE40L28zdFbPHPCvywAp7b
 uyjTMzxh8udUNGaREzLn2bPf5xq3AUllPXDyP4e6tnyPLlEcIJwwP9AvBf7QGeWKzB7+zSoNbbL
 CTcseuSIlY2z4sQDbVlfkerPjGnq3qpcDdQtYiXrdFFiBXSiWsnKaSsfPizkpJ7sCC8ED3Bsfgc
 rbwcC9PNp3hvBuG1KDsZ/FldXfJVgYOWw+PGogmvZe2F8WRbMzG78W8nOJ1VZwSS9Hp8a9TPpu7
 A2tSQn0Zth1lxjroVYQrRK9YBBqd6jPNHX9X5zt6Wb1z1VGs9yrHqMDflxQLUEr68MF8tUg=
X-Google-Smtp-Source: AGHT+IHSnoSCZLZHMn/lU1E0tDL4ALU9pDTSYGpNUSZmjEf9hrT7l0l/+rTZfGCvvt4GZkbgG33ukQ==
X-Received: by 2002:a05:6512:3e09:b0:543:9b0d:d388 with SMTP id
 2adb3069b0e04-543f0f25369mr4615484e87.19.1738598209413; 
 Mon, 03 Feb 2025 07:56:49 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-543ebeb797fsm1333435e87.189.2025.02.03.07.56.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Feb 2025 07:56:49 -0800 (PST)
Date: Mon, 3 Feb 2025 17:56:46 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Louis Chauvet <louis.chauvet@bootlin.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v4 3/4] drm/vc4: hdmi: Use drm_atomic_helper_reset_crtc()
Message-ID: <lu2crev4ikpn2tu6mizmvi4oorb7tbat2uxmcci3qekqi4ohqq@vfps25gpnurk>
References: <20250203145824.155869-1-herve.codina@bootlin.com>
 <20250203145824.155869-4-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250203145824.155869-4-herve.codina@bootlin.com>
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

On Mon, Feb 03, 2025 at 03:58:22PM +0100, Herve Codina wrote:
> The current code uses a the reset_pipe() local function to reset the
> CRTC outputs.
> 
> drm_atomic_helper_reset_crtc() has been introduced recently and it
> performs exact same operations.
> 
> In order to avoid code duplication, use the new helper instead of the
> local function.
> 
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> ---
>  drivers/gpu/drm/vc4/vc4_hdmi.c | 30 +-----------------------------
>  1 file changed, 1 insertion(+), 29 deletions(-)
> 

Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
