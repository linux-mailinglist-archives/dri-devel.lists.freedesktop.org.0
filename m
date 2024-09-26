Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6B99986DC6
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2024 09:32:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70F3910EAD2;
	Thu, 26 Sep 2024 07:32:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="OhkcjUDm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77E8E10EAD0
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2024 07:32:47 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-535694d67eeso722970e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2024 00:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1727335965; x=1727940765; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=8aonqfZhxhzRCigtKU2JDf5og9fZlc9KKVh/g2kla2I=;
 b=OhkcjUDmQ12h68NfYGc5S1b4waTKLi9F+GndRdjgWpgkKvNOO0Qa0EIxvG89yiqwhN
 HuwRD0yYs/6CSmTNENZ1j+bSwmBrDm5/Z4RI9vHodFaQt3OEPXhe7xLrDAqrtNW26o1+
 YqaKcYie1fasNGUGjiqkvsg3/cancCf3McjtapayvvwK2HYEpTRe7zbNQuy445v6SGHS
 fz06zZNBXkE1rSLrwMJEAOUH8xPq+q3mxki13Rsep4PKgt/e5jPnx513Cobmf946mscZ
 5l7teACHYuzFLWa2MIavoADiFu2Tfzk5OvOxihxjGMEN69q6cEBqfJFlpxd1oICahvkJ
 dDOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727335965; x=1727940765;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8aonqfZhxhzRCigtKU2JDf5og9fZlc9KKVh/g2kla2I=;
 b=bV0yb3r47egii1RnpVvTCF0gAWA6XjC92gexg3Dus7s+Cy/rAn1xJThwCVfaXVMVhH
 JS8+X8+q9pVch61lLLwahtIrE1GVvqJ8jSdeBQJyPDMh6V1X0tf3EzdDdBRF728Yyu4v
 svsOFBzpecMLJluAv7y3az2NOjpgwmzbdksiwKJUbumUl/M5yCQZWsQAO2E1vgUnjOH9
 iRxaECuB2uJlNrdtdm8PBlzURfs9bXgLKSUotOsO7ra32oDOWxXyiLXNTyVEeBwyHQUn
 Zwi+s9Zc+fjBJX6Qt7Wkjt3bodInth4SeRNPuI2R1gfq5Al7/9okxKQJvPxMPCt15Lwr
 2s2A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWUiOHo9CXJiTyxWpa5Ttm1p46PPRPwXFoCMwigqDuYjs93uIQHoHA1mjPFYAgm7t6GGEZVzsy8V/I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxDXDImvCFpDgJ57OV6spWaBv7dFa4/dqrWSwffimaQIaB+mgET
 Snwf/LxD3bD0UBQuDFV0Wk7vsSobfz83dUaY/b5DQHS4233YXbCxyiHpzUSl6r4=
X-Google-Smtp-Source: AGHT+IFEJ3mGtjqHYi8+hQZO+ABBsYaf7BGxMD8HjL57H5h34gv/88G8VtZ+ToUkoIv8MyINwNfCgw==
X-Received: by 2002:a05:6512:304d:b0:52f:228:cf91 with SMTP id
 2adb3069b0e04-53896bdeadamr669409e87.1.1727335965407; 
 Thu, 26 Sep 2024 00:32:45 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-537a85e13edsm730901e87.10.2024.09.26.00.32.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Sep 2024 00:32:43 -0700 (PDT)
Date: Thu, 26 Sep 2024 10:32:41 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Cc: Jagan Teki <jagan@amarulasolutions.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Stefan Agner <stefan@agner.ch>, 
 Alison Wang <alison.wang@nxp.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Subject: Re: [PATCH 0/6] drm: constify read-only regmap structs
Message-ID: <3i46wd7hqr5u3oxqlgyff4i27vxpg3spewkhby336hxmgbvmon@wijkq64pluzg>
References: <20240925-drm-const-regmap-v1-0-e609d502401b@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240925-drm-const-regmap-v1-0-e609d502401b@gmail.com>
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

On Wed, Sep 25, 2024 at 05:42:39PM GMT, Javier Carrasco wrote:
> This series adds the const modifier to the remaining regmap_bus and
> regmap_config structs under drm/ that are effectively used as const
> (i.e., only read after their declaration), but kept ad writtable data.
> 
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
> ---
> Javier Carrasco (6):
>       drm/bridge: dpc3433: Constify struct regmap_config
>       drm/fsl-dcu: Constify struct regmap_config
>       drm/mediatek: dp: Constify struct regmap_config
>       drm/meson: Constify struct regmap_config
>       drm/panel: ili9322: Constify struct regmap_bus
>       drm/sprd: Constify struct regmap_bus
> 

For the series:


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
