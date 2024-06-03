Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1EDA8D8AE3
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jun 2024 22:31:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AD3210E153;
	Mon,  3 Jun 2024 20:31:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="NvW805tx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 548BF10E153
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jun 2024 20:31:08 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-52b912198a6so2306142e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Jun 2024 13:31:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717446666; x=1718051466; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=q2AjR4uuxoyAwAOvk4z2camqVDTU+eBYs24+HoHi/i8=;
 b=NvW805tx7ORN6atHd/NRLGSucl8vT1tWwW75Mm0QpUojZC3DFoFDYeB9K/OtI589ce
 oq0lxzjCrsBJcOcWNt387BgD24xxp7bczjXOorEBpm4+t8FdNLoDygXvZrqBV01b0Y8C
 T8f4MnTA4BBjqK/W0Js+OLjjCq4+PFBKaEDpIMwUQTXsKmwnkBooeM0/tSt9ENFGUiey
 EgDiIW30eUgnadpZuonE1shHEIc2JYn+sB5ZjrMXSpXOwpeSUrqh3pBIccwM+x++DUO2
 vTljW/YL0+RRdjTffG7kDKWyoSYbJpAaxZ41M1VG1D0mQI9CR990tu2mHc+i5Gr4XY0J
 a+KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717446666; x=1718051466;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=q2AjR4uuxoyAwAOvk4z2camqVDTU+eBYs24+HoHi/i8=;
 b=hWfHsggfJuL0ZRpJzgUcMrmmALnRDJVQVI1n6A+3NRvFPMPjsIptazqPf34RWY5Zmo
 yYRHo3ZqYudmdkQiRoWV5Dn4vRCa3lxHFJGpPAo3UBayK9UrkH6pVA+mRrpfaP9NCne6
 A3DNdlKA/GOvu8VTdOxFDzOPLCTCn8QlzcqA9BjQX+Awh8hqzC73UYfIC7f/yOEbbkAc
 PUx0fVmomUf/2kRtzN1eVbrO+3fOny5SBOGwOSh9Re2Yp5lbPehLI+uh8Pwb6BsDZTQn
 f243oG+/tghiK0DPGpqoKCBrsawdGQ+pRUIT1EIFegfEqw6jnRmA2OaNuI2Trx/e0Hyv
 8rGQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUs6vjHSZwbAweOFKBFJm6thEmapDMUM4hZH+Zt0gesSwh7tlNRBF1VJyFQi6nAwoxtuOWOtAl/FQL8qDEir1gF6DH35ba/fhiKW6vAinnS
X-Gm-Message-State: AOJu0YwMmSURkuypJbQWGK56XldS7Qyuo83Fgfnxy5teAWail5gT6BHx
 R6n6NRT5nuQxeIuvK26Dpo+uqltzwy8C35hQhiM04p/9J6UwAOXL1FjRRZsCiOo=
X-Google-Smtp-Source: AGHT+IGGtZNy8Pr7JqVQMa2c6+HXJKdsAyzhhZ8mAe/EzUG9NQsyho1u3hZr/yzrsncDGv6TInJ/rg==
X-Received: by 2002:a05:6512:3e24:b0:52b:8455:fb1f with SMTP id
 2adb3069b0e04-52b895609e6mr10600378e87.10.1717446666056; 
 Mon, 03 Jun 2024 13:31:06 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52b84d8a661sm1316210e87.271.2024.06.03.13.31.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jun 2024 13:31:05 -0700 (PDT)
Date: Mon, 3 Jun 2024 23:31:03 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: noralf@tronnes.org
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 David Lechner <david@lechnology.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>,
 Tommaso Merciai <tommaso.merciai@amarulasolutions.com>
Subject: Re: [PATCH v3 2/5] drm/mipi-dbi: Remove
 mipi_dbi_machine_little_endian()
Message-ID: <l2j2bhyw6uttkqbx7o7hpb2yxzawh7f5r3eggefyvhlxc4mdik@vta7x4akfw3y>
References: <20240603-panel-mipi-dbi-rgb666-v3-0-59ed53ca73da@tronnes.org>
 <20240603-panel-mipi-dbi-rgb666-v3-2-59ed53ca73da@tronnes.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240603-panel-mipi-dbi-rgb666-v3-2-59ed53ca73da@tronnes.org>
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

On Mon, Jun 03, 2024 at 01:21:33PM +0200, Noralf Trønnes via B4 Relay wrote:
> From: Noralf Trønnes <noralf@tronnes.org>
> 
> mipi_dbi_machine_little_endian() should really have been called
> mipi_dbi_framebuffer_little_endian() because that's the function it
> performs. When I added support for these SPI displays I thought that the
> framebuffers on big endian machines were also big endian, but I have
> later learned that this is not the case. There's a bit in the fourcc code
> that controls this: DRM_FORMAT_BIG_ENDIAN.
> 
> Just remove the function to avoid confusion. We can add big endian support
> later should the need arise and we have hardware to test on.
> 
> Instead of just amending the docs, expand it to explain the endianness
> handling.
> 
> Signed-off-by: Noralf Trønnes <noralf@tronnes.org>
> ---
>  drivers/gpu/drm/drm_mipi_dbi.c | 35 +++++++++++++++++++----------------
>  1 file changed, 19 insertions(+), 16 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
