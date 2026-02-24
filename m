Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eDiNF7xPnWkBOgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 08:14:04 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 870DC182D5D
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 08:14:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8045F10E4BC;
	Tue, 24 Feb 2026 07:14:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="VoKlZWl2";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Hx51r+YM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C404710E4BC
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Feb 2026 07:13:59 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61O4Losg3125554
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Feb 2026 07:13:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=LjWW2fz9JFnIDecC4bmSwaSl
 dLOVjSLiT+Wf40e9tMg=; b=VoKlZWl2LQcr9w8ovYLjXEvAhF7OGE6ZVHj/M7KE
 RUjjkGERShVGNo3W0UbRP/noDeSEy5I5zXwIRRcHZVa93MMqusVYwyY+ZDlwnZKH
 KTV9GnyqDMaM11dlEJKsfOrrmWb0Wk198RNtbNs17+gmw0l6/geuTQWxjxR1q50C
 t1Gp+Ns9jmgU+Njn2ySLEvuFPeTPBNTJU5QILTWeFe32WlQjbzZNWXUkkJeXrK5B
 KSoJNQSwLkpsb6VHsKfUqTo1HSaxy/UuFTOzm7JbAOciiiVrXpKCscQJusXC665Z
 376byoqPzU8KU2HCSbfu0uRG9YHIpK7xDf5ICj7AXxYJPw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgte8t7ff-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Feb 2026 07:13:58 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8cb4817f3c8so4155069385a.3
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 23:13:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1771917238; x=1772522038;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=LjWW2fz9JFnIDecC4bmSwaSldLOVjSLiT+Wf40e9tMg=;
 b=Hx51r+YMc+Oas4tTFXlLvaxA8XCp7zrSSsf198+JRPvcv+45mhQkJRknu7CC0cCwuZ
 P7G4t9ZvAJCHlZm3Y30wUGF4ROKjNZw07eZESsU4jeqJxf/w1nmM8szFR8DdslkhHdck
 PoU3YRdUS++BCqQZtiz025KevTRBCKqmA25IoXAE1XytMglC56XDmnMl+yNBuyU97BSv
 9Y2kmjVucZLKcdB+LDZqHAGwN4a6vkQFWXaP1PXXByisZKNUjN9jPNkM+t5q012VzlHI
 znQzir9KXwhgBYBCLwDWlszcNja9Ub6LatoCPPmOsGem+j2vX83BbuKIXxjCQRqwqJta
 IQfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771917238; x=1772522038;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LjWW2fz9JFnIDecC4bmSwaSldLOVjSLiT+Wf40e9tMg=;
 b=ZvJAfg8X3q/wLUY1srQZHNe67xudpPDGAQAb6JGMIU2m7Rb6gRkiMzYVqfTVuKWVvm
 W3Ywpx8hFTIuz5firJlZoR/NoNrMFRlhvCewUZb2fvJ66Lb68GvpewGLe4d4Jlss6dKM
 PGxkrCNvT9WSJOV91Z7Lxu3X9Ubr4C30EZ7FqFi6I9QRlFY8YYgtUVIS4lLMcrWhdOVX
 OlJamPkLo/GjdkSe+uplNsyeOncinP01YHiM3V5UBAUYsrdPDGIr5nVh1SF8Ptfwg1Bq
 /VYKLOH7FcgDyquPvmFk3kHyp2CLlThqh9/ExLJO/QkFA0PFhz/K1vH0Za+WQQQ5CTcG
 IAXQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUJoEhPB7erRLaB/Hp+LYRrt1dE1PUuKVHDafDkpRjmU5q9LIrHyhnSwBcVzMv+4X04q0kNdFg6kf0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyNggtzHN6AITXbIrg7KcH83pMQD6kiihOMZuli1B62/KAYWJZe
 9s6HdwwjPyzGfWLoUQGbI+I0DTr+i3n4vPG4LkGEec0DmCTYspzKavaYv4FySSCvasDPppLvx2k
 wVDvEqyezms7oKF/LUjVbShxAM6TcX43y2KFWcsOYmFB5vPtrwjzWFWpwWGc9WAbIK7A5dQg=
X-Gm-Gg: AZuq6aJoHl0KOtSHgT6WvElwYDi5xO3Yz6T4Q1Jwn+qqsGKwORaNtEDmbvg9DBqlte3
 ckDPBt5Bu+WciHdJWxQ6yFaLthcNLiN4bDumZrz+Len5vyjxjuMCNr8oq2WY1gqFBDkI+LtPnIU
 sABjixsna7b+ipkY6WxbkhddGyl4MuOJyknG7N5YkFjjD8AT5v90w/9/jvjk7KoiWxNfpW/6eSu
 Or+p7Hy0mJX+0764muNNM0eM9KUn7ywQ6hS4HUJUUXiKPYjW2pIxMJWcO4XnKON64WDf8jZqhuQ
 1FuOaK2KQUtCDV0ajBuMUDJOzv/fTp5rkvH6jFeSAxQJly0mYywUVnT5bkIrBwarQvtojqiX1xD
 uOcb4fr8+5CKdS5/PBr2dr+ZL1H/CSshmn7AfFqjbwLbf2oEaOyhMiS0x0Vtmt1IFncolE0XFHL
 94HOGhIRxU01wGhuy69sSwTX07/zfz7fspIpg=
X-Received: by 2002:a05:620a:460c:b0:8cb:5130:cfe0 with SMTP id
 af79cd13be357-8cb8ca63f87mr1402971985a.51.1771917237284; 
 Mon, 23 Feb 2026 23:13:57 -0800 (PST)
X-Received: by 2002:a05:620a:460c:b0:8cb:5130:cfe0 with SMTP id
 af79cd13be357-8cb8ca63f87mr1402968385a.51.1771917236389; 
 Mon, 23 Feb 2026 23:13:56 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a0eeb3eb6dsm2011772e87.50.2026.02.23.23.13.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Feb 2026 23:13:55 -0800 (PST)
Date: Tue, 24 Feb 2026 09:13:53 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Hermes.wu@ite.com.tw
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Pet.Weng@ite.com.tw,
 Kenneth.Hung@ite.com.tw, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] drm/bridge: Add ITE IT6162 MIPI DSI to HDMI bridge
 driver
Message-ID: <iqpoe4wdqjkib7r4uawj22kag5doqgovwrzb7r47fwgpxxpygv@rdcrfxh7gwzg>
References: <20260223-upstream-6162-v1-0-ebcc66ccb1fe@ite.com.tw>
 <20260223-upstream-6162-v1-1-ebcc66ccb1fe@ite.com.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260223-upstream-6162-v1-1-ebcc66ccb1fe@ite.com.tw>
X-Proofpoint-ORIG-GUID: JUBjY94N5imyQmuf_nDmXRpUNUdV12rH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDA2MSBTYWx0ZWRfX1sU3pl4uW4WR
 IurYONUBAvJlpFlSq9oBT6UglEAxDkyfdD28ZOoZ1ZLzzA4hyXLh7IExkjCNzh2k/HXL12K/hJD
 nG+vOvszh05q93TQb9PqgYlQY1wZxrr1yYiIWC2+piBE7adg6tKVwjpdIcD/6Zh845bUYEAjMu+
 pSZe9zKhtU6quSu1DVvp8QIeBG3PLTMPCO0x6ChcXYO1yl3kHkNT1WSTE6fVDETapg/W0/jLb0l
 YMx2PNGfB6ihluJbsSeQk8se08Uk55xdkgo/MbkwVwF6/4bZosW4hD50JFXlkGfiDGQVXnuYHow
 fejvvcidlBOSu9kstnBwTSEJAYWU3dOX8gIb2hAypfH75UaNVT1H2MafOAp0G5PRAT32X9uaPnM
 Vx6kbCkgqdeHlHZHRR9rYLvvwPPgMr5NizyhM4XdFFtJuvJPXilp0UWepyQyC38E1P+RxK+az41
 F9z6D/alw3RL6z2PH/A==
X-Proofpoint-GUID: JUBjY94N5imyQmuf_nDmXRpUNUdV12rH
X-Authority-Analysis: v=2.4 cv=WqQm8Nfv c=1 sm=1 tr=0 ts=699d4fb6 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=Ns9eNvu6AAAA:8
 a=9zVFTbw21CLjZNTvJ1sA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=LZLx1i01EnjtqRv10NxV:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_06,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602240061
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Hermes.wu@ite.com.tw,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:Pet.Weng@ite.com.tw,m:Kenneth.Hung@ite.com.tw,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jernejskrabec@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,ffwll.ch,linux.intel.com,suse.de,ite.com.tw,lists.freedesktop.org,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:dkim,ite.com.tw:email,hdcp_work.work:url]
X-Rspamd-Queue-Id: 870DC182D5D
X-Rspamd-Action: no action

On Mon, Feb 23, 2026 at 05:20:45PM +0800, Hermes Wu via B4 Relay wrote:
> From: Hermes Wu <Hermes.wu@ite.com.tw>
> 
> Add support for the ITE IT6162 MIPI DSI to HDMI 2.0 bridge chip.
> The IT6162 is an I2C-controlled bridge that supports the following
> configurations:
> 
>   - Single MIPI DSI input: up to 4K @ 30Hz
>   - Dual MIPI DSI input (combined): up to 4K @ 60Hz
> 
> The driver implements the DRM bridge and connector frameworks,
> including mode setting, EDID retrieval, and HPD support.
> 
> Signed-off-by: Hermes Wu <Hermes.wu@ite.com.tw>
> ---
>  drivers/gpu/drm/bridge/Kconfig      |   17 +
>  drivers/gpu/drm/bridge/Makefile     |    1 +
>  drivers/gpu/drm/bridge/ite-it6162.c | 1876 +++++++++++++++++++++++++++++++++++
>  3 files changed, 1894 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
> index 39385deafc68e4bdc61088558036bf6938da7461..b53e23d421dfd2a875f92293847e694b175f6533 100644
> --- a/drivers/gpu/drm/bridge/Kconfig
> +++ b/drivers/gpu/drm/bridge/Kconfig
> @@ -107,6 +107,23 @@ config DRM_INNO_HDMI
>  	select DRM_DISPLAY_HELPER
>  	select DRM_KMS_HELPER
>  
> +config DRM_ITE_IT6162
> +	tristate "iTE IT6162 DSI to HDMI bridge"
> +	depends on OF
> +	select REGMAP_I2C
> +	select DRM_MIPI_DSI
> +	select DRM_PANEL_BRIDGE
> +	select DRM_KMS_HELPER
> +	select DRM_HDMI_HELPER
> +	select DRM_DISPLAY_HDMI_HELPER
> +	select DRM_DISPLAY_HDCP_HELPER
> +	select DRM_DISPLAY_HELPER
> +	help
> +	  Driver for iTE IT6162 DSI to HDMI bridge
> +	  chip driver that converts DSI to HDMI signals
> +	  support up to 4k60 with 2 MIPI DSI
> +	  Please say Y if you have such hardware.
> +
>  config DRM_ITE_IT6263
>  	tristate "ITE IT6263 LVDS/HDMI bridge"
>  	depends on OF
> diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/Makefile
> index 909c21cc3acd31e36f85fcbf38032b912ad4d948..13dfa08aa6e9c5a885895ed40f813b1d8b532639 100644
> --- a/drivers/gpu/drm/bridge/Makefile
> +++ b/drivers/gpu/drm/bridge/Makefile
> @@ -11,6 +11,7 @@ tda998x-y := tda998x_drv.o
>  obj-$(CONFIG_DRM_I2C_NXP_TDA998X) += tda998x.o
>  
>  obj-$(CONFIG_DRM_INNO_HDMI) += inno-hdmi.o
> +obj-$(CONFIG_DRM_ITE_IT6162) += ite-it6162.o
>  obj-$(CONFIG_DRM_ITE_IT6263) += ite-it6263.o
>  obj-$(CONFIG_DRM_ITE_IT6505) += ite-it6505.o
>  obj-$(CONFIG_DRM_LONTIUM_LT8912B) += lontium-lt8912b.o
> diff --git a/drivers/gpu/drm/bridge/ite-it6162.c b/drivers/gpu/drm/bridge/ite-it6162.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..498b7c0c33fa8cf1bdd6c13be106030b3b6849ff
> --- /dev/null
> +++ b/drivers/gpu/drm/bridge/ite-it6162.c
> @@ -0,0 +1,1876 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright 2024 ITE
> + *
> + * This program is free software; you can redistribute it and/or modify it
> + * under the terms of the GNU General Public License as published by the
> + * Free Software Foundation; either version 2 of the License, or (at your
> + * option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful, but
> + * WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
> + * or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
> + * for more details.
> + */
> +#include <linux/gpio/consumer.h>
> +#include <linux/i2c.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_irq.h>
> +#include <linux/of_graph.h>
> +#include <linux/regmap.h>
> +#include <drm/drm_drv.h>
> +#include <drm/drm_of.h>
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_bridge.h>
> +#include <drm/drm_probe_helper.h>
> +#include <drm/drm_edid.h>
> +#include <video/videomode.h>
> +#include <drm/drm_mipi_dsi.h>
> +#include <drm/drm_print.h>
> +#include <sound/hdmi-codec.h>
> +#include <linux/pm_runtime.h>

Keep the headers sorted.

> +
> +#include <drm/display/drm_hdcp_helper.h>
> +#include <drm/drm_bridge_connector.h>
> +#include <drm/display/drm_dsc.h>
> +#include <drm/display/drm_hdmi_helper.h>
> +#include <drm/display/drm_hdmi_state_helper.h>
> +
> +#define DATA_BUFFER_DEPTH 32
> +
> +#define OFFSET_CHIP_ID_L 0x00
> +#define OFFSET_CHIP_ID_M 0x01
> +#define OFFSET_CHIP_ID_H 0x02
> +#define OFFSET_VERSION_L 0x03
> +#define OFFSET_VERSION_M 0x04
> +#define OFFSET_VERSION_H 0x03
> +#define OFFSET_MIPI_CONFIG_L 0x06
> +#define OFFSET_MIPI_CONFIG_H 0x07
> +#define OFFSET_TX_CONFIG 0x08
> +#define OFFSET_TX_SETTING 0x09
> +#define OFFSET_MIPI_STATUS 0x0A
> +
> +#define OFFSET_TX_STATUS 0x0C
> +#define B_TX_STATUS_HPD 7
> +#define B_TX_STATUS_VIDEO_STB 6
> +#define B_TX_STATUS_HDCP 4
> +#define M_TX_STATUS_HDCP 0x30
> +
> +#define TX_VIDEO_STB BIT(B_TX_STATUS_VIDEO_STB)
> +#define TX_STATUS_HPD BIT(B_TX_STATUS_HPD)
> +
> +#define GET_TX_HPD_STATUS(x) (((x) & TX_STATUS_HPD) >> B_TX_STATUS_HPD)
> +#define GET_TX_VIDEO_STATUS(x) (((x) & TX_VIDEO_STB) >> B_TX_STATUS_VIDEO_STB)
> +#define GET_TX_HDCP_STATUS(x) (((x) & M_TX_STATUS_HDCP) >> B_TX_STATUS_HDCP)
> +
> +#define OFFSET_SINK_CAP 0x0D
> +#define B_SINK_CAP_HDCP_VER 4
> +#define M_SINK_CAP_HDCP_VER 0x30
> +
> +#define GET_SINK_CAP_HDCP_VER(x) (((x) & M_SINK_CAP_HDCP_VER) >> B_SINK_CAP_HDCP_VER)
> +
> +#define OFFSET_DRIVER_DATA 0x0E
> +
> +#define OFFSET_DATA_TYPE_IDX 0x0F
> +#define OFFSET_DATA_BUFFER 0x20
> +
> +#define OFFSET_HOST_SETTING 0xFE
> +#define B_CONFIG_CHG BIT(7)
> +#define B_SET_CHG BIT(6)
> +#define HOST_SETTING_VIDEO_INFO         (1)
> +#define HOST_SETTING_AUDIO_INFO         (2)
> +#define HOST_SETTING_VIDEO_AUDIO_INFO   (3)
> +#define HOST_SETTING_EDID_R     (0x04)
> +#define HOST_SETTING_HDCP_R     (0x05)
> +
> +#define OFFSET_EVENT_CHG 0xFF
> +#define B_EVENT_CHG_BUFFER 4
> +#define M_EVENT_CHG_BUFFER_STS	(0x30)
> +
> +#define B_EVENT_CHG	1
> +#define B_EVENT_IC_READY 0
> +
> +#define EVENT_CHG  BIT(B_EVENT_CHG)
> +#define EVENT_READY BIT(B_EVENT_IC_READY)
> +
> +#define GET_BUFFER_STATUS(x) (((x) & M_EVENT_CHG_BUFFER_STS) >> B_EVENT_CHG_BUFFER)
> +
> +#define TIMEOUT_INFOBLOCK_MS 1800
> +
> +enum it6162_audio_select {
> +	I2S = 0,
> +	SPDIF,
> +};
> +
> +enum it6162_audio_word_length {
> +	WORD_LENGTH_16BIT = 0x0,
> +	WORD_LENGTH_18BIT = 0x1,
> +	WORD_LENGTH_20BIT = 0x2,
> +	WORD_LENGTH_24BIT = 0x3,
> +};
> +
> +enum it6162_audio_sample_rate {
> +	SAMPLE_RATE_32K = 0x3,
> +	SAMPLE_RATE_48K = 0x2,
> +	SAMPLE_RATE_64K = 0xB,
> +	SAMPLE_RATE_96K = 0xA,
> +	SAMPLE_RATE_192K = 0xE,
> +	SAMPLE_RATE_44_1K = 0x0,
> +	SAMPLE_RATE_88_2K = 0x8,
> +	SAMPLE_RATE_176_4K = 0xC,
> +};
> +
> +enum it6162_audio_type {
> +	LPCM = 0,
> +	NLPCM,
> +};
> +
> +enum data_buf_sts {
> +	NO_STS = 0x00,
> +	BUF_READY = 0x01,
> +	BUF_FAIL = 0x02,
> +};
> +
> +enum hdcp_state {
> +	NO_HDCP_STATE = 0x00,
> +	AUTH_DONE = 0x01,
> +	AUTH_FAIL = 0x02,
> +};
> +
> +enum hdcp_ver {
> +	NO_HDCP = 0x0,
> +	HDCP_14 = 0x1,
> +	HDCP_23 = 0x2,
> +};
> +
> +struct it6162_chip_info {
> +	u32 chip_id;
> +	u32 version;
> +};
> +
> +struct it6162_audio {
> +	enum it6162_audio_select select;
> +	enum it6162_audio_type type;
> +	enum it6162_audio_sample_rate sample_rate;
> +	unsigned int audio_enable;
> +	unsigned int sample_width;
> +	unsigned int channel_number;
> +	unsigned int user_cts;
> +	u8 infoframe[HDMI_INFOFRAME_SIZE(AUDIO)];

No, use provided DRM HDMI helpers.

> +	unsigned char channel_status[AES_IEC958_STATUS_SIZE];
> +};
> +
> +struct it6162_video {
> +	u8 vic;
> +	u32 clock;
> +	u16 htotal;
> +	u16 hfp;
> +	u16 hsw;
> +	u16 hbp;
> +	u16 hdew;
> +	u16 vtotal;
> +	u16 vfp;
> +	u16 vsw;
> +	u16 vbp;
> +	u16 vdew;
> +	u8 hpol;
> +	u8 vpol;
> +	u8 prog;
> +	u16 v_aspect;
> +	u16 h_aspect;
> +	u8 pix_rep;
> +	u8 colorspace;
> +};

Why do you need a new struct for DRM modes? Can't you use an existing
functions?

> +
> +enum sync_mode {
> +	SYNC_EVENT = 0x0,
> +	SYNC_PULSE = 0x1,
> +	SYNC_AUTO = 0x2,
> +};
> +
> +struct it6162_mipi_cfg {
> +	bool en_port[2];
> +	u8 lane_num;
> +	bool pn_swap;
> +	bool lane_swap;
> +	bool continuous_clk;
> +	enum sync_mode mode;
> +	enum mipi_dsi_pixel_format format;
> +	unsigned long mode_flags;
> +};
> +
> +struct it6162_tx_out_set {
> +	enum hdcp_ver hdcp_version;
> +	bool hdcp_encyption;
> +	u8 stream_ID;
> +};
> +
> +struct it6162_infoblock_msg {
> +	u8 action;
> +	int len;
> +	u8 msg[32];
> +};
> +
> +struct it6162 {
> +	struct drm_bridge bridge;
> +	struct drm_connector connector;

Please drop. Use drm_bridge_device_connector instead.

> +	struct device *dev;
> +	enum drm_connector_status connector_status;
> +	struct drm_device *drm;
> +
> +	struct i2c_client *it6162_i2c;
> +	struct regmap *it6162_regmap;
> +
> +	struct delayed_work hdcp_work;
> +
> +	struct regulator *pwr1833;
> +	struct regulator *ovdd;
> +	struct regulator *ivdd;
> +	struct gpio_desc *gpiod_reset;
> +
> +	bool power_on;
> +	bool is_hdmi;
> +	bool has_audio;
> +	bool en_hdcp;
> +
> +	/* operations can only be served one at the time */
> +	struct mutex lock;

Which operations?

> +
> +	/* it6162 DSI RX related params */
> +	struct mipi_dsi_device *dsi;
> +	struct it6162_mipi_cfg mipi_cfg;
> +	struct it6162_tx_out_set tx_out_set;
> +
> +	bool support_audio;

This flag is only used in the probe path. Drop it.

> +	struct it6162_audio audio_config;
> +	struct platform_device *audio_pdev;
> +	hdmi_codec_plugged_cb plugged_cb;
> +	struct device *codec_dev;
> +
> +	struct it6162_chip_info chip_info;

Drop, it's also used only in probe.

> +
> +	enum data_buf_sts data_buf_sts;
> +	enum hdcp_state hdcp_sts;
> +	enum hdcp_ver hdcp_version;
> +
> +	bool bridge_hpd_enable;
> +
> +};
> +
> +static struct it6162 *bridge_to_it6162(struct drm_bridge *bridge)
> +{
> +	return container_of(bridge, struct it6162, bridge);
> +}
> +
> +static const struct regmap_config it6162_regmap_config = {
> +	.reg_bits = 8,
> +	.val_bits = 8,
> +	.max_register = 0xff,
> +	.cache_type = REGCACHE_NONE,
> +};
> +
> +static int it6162_i2c_regmap_init(struct i2c_client *client,
> +				  struct it6162 *it6162)

Inline this function.

> +{
> +	it6162->it6162_i2c = client;
> +	i2c_set_clientdata(client, it6162);
> +	it6162->it6162_regmap = devm_regmap_init_i2c(it6162->it6162_i2c,
> +						     &it6162_regmap_config);
> +
> +	if (IS_ERR(it6162->it6162_regmap))
> +		return PTR_ERR(it6162->it6162_regmap);
> +
> +	return 0;
> +}
> +
> +static unsigned int it6162_infoblock_read(struct it6162 *it6162,
> +					  unsigned int reg)
> +{
> +	unsigned int val;
> +	int err;
> +	struct device *dev = it6162->dev;
> +
> +	err = regmap_read(it6162->it6162_regmap, reg, &val);
> +	if (err < 0) {
> +		dev_err(dev, "read failed rx reg[0x%x] err: %d", reg, err);
> +		return err;
> +	}
> +
> +	return val;

Drop these wrappers around regmap, they provide no added functionality.

> +}
> +
> +static int it6162_infoblock_write(struct it6162 *it6162, unsigned int reg,
> +				  unsigned int val)
> +{
> +	int err;
> +	struct device *dev = it6162->dev;
> +
> +	err = regmap_write(it6162->it6162_regmap, reg, val);
> +
> +	if (err < 0) {
> +		dev_err(dev, "write failed rx reg[0x%x] = 0x%x err = %d",
> +			reg, val, err);
> +		return err;
> +	}
> +
> +	return 0;
> +}
> +
> +static inline void it6162_infoblock_update_bits(struct it6162 *it6162,
> +						unsigned int reg,
> +						unsigned int mask,
> +						unsigned int val)
> +{
> +	regmap_update_bits(it6162->it6162_regmap, reg, mask, val);
> +}
> +
> +static inline void it6162_infoblock_bulk_read(struct it6162 *it6162,
> +					      unsigned int reg,
> +					      u8 *buf, size_t len)
> +{
> +	regmap_bulk_read(it6162->it6162_regmap, reg, buf, len);
> +}
> +
> +static inline void it6162_infoblock_read_bufer(struct it6162 *it6162,
> +					       u8 *buf, size_t len)
> +{
> +	regmap_bulk_read(it6162->it6162_regmap,
> +			 OFFSET_DATA_BUFFER, buf, len);
> +}
> +
> +static inline void it6162_infoblock_bulk_write(struct it6162 *it6162,
> +					       unsigned int reg,
> +					       u8 *buf, size_t len)
> +{
> +	regmap_bulk_write(it6162->it6162_regmap, reg, buf, len);
> +}
> +
> +static inline void it6162_infoblock_write_bufer(struct it6162 *it6162,
> +						u8 *buf, size_t len)
> +{
> +	regmap_bulk_write(it6162->it6162_regmap,
> +			  OFFSET_DATA_BUFFER, buf, len);
> +}

All these wrappers can be dropped.

> +
> +static bool it6162_infoblock_complete(struct it6162 *it6162)
> +{
> +	int tmp;
> +
> +	tmp = it6162_infoblock_read(it6162, OFFSET_HOST_SETTING);
> +	return tmp == 0 ? true : false;
> +}
> +
> +static int it6162_infoblock_wait_complete(struct it6162 *it6162)
> +{
> +	struct device *dev = it6162->dev;
> +	int status;
> +	bool val = 0;
> +
> +	status = readx_poll_timeout(it6162_infoblock_complete,
> +				    it6162,
> +				    val,
> +				    val,
> +				    50 * 1000,
> +				    TIMEOUT_INFOBLOCK_MS * 1000);
> +
> +	if (status < 0) {
> +		dev_err(dev, "%s err status = %d", __func__, status);
> +		return -ETIMEDOUT;
> +	}
> +
> +	return 0;
> +}
> +
> +static int it6162_infoblock_host_set(struct it6162 *it6162, u8 setting)
> +{
> +	dev_info(it6162->dev, "%s %x", __func__, setting);

Drop extra spamming, please. Use kretprobes.

> +	it6162_infoblock_write(it6162, OFFSET_HOST_SETTING, setting);
> +	/*wait command complete*/
> +	it6162_infoblock_wait_complete(it6162);

And the error handling is missing. Drop the wrapper and call
readx_poll_timeout() here. It is the only place where you use
it6162_infoblock_wait_complete().

> +
> +	return 0;
> +}
> +
> +static int it6162_infoblock_request_data(struct it6162 *it6162,
> +					 u8 setting, u8 index, u8 *buf)
> +{
> +	struct device *dev = it6162->dev;
> +	int status;
> +	bool val = 0;
> +
> +	it6162->data_buf_sts = NO_STS;
> +	it6162_infoblock_write(it6162, OFFSET_DATA_TYPE_IDX, index);
> +	it6162_infoblock_write(it6162, OFFSET_HOST_SETTING, setting);
> +
> +	status = readx_poll_timeout(it6162_infoblock_complete,
> +				    it6162,
> +				    val,
> +				    val && it6162->data_buf_sts == BUF_READY,
> +				    50 * 1000,
> +				    TIMEOUT_INFOBLOCK_MS * 1000);
> +
> +	if (status < 0) {
> +		dev_err(dev,
> +			"%s err status = %d %d",
> +			__func__,
> +			status,
> +			it6162->data_buf_sts);
> +		return -ETIMEDOUT;
> +	}
> +
> +	dev_dbg(dev, "%s [0x%x] 0x%x", __func__, setting, it6162->data_buf_sts);
> +	if (it6162->data_buf_sts != BUF_READY)
> +		return -EIO;
> +
> +	it6162_infoblock_read_bufer(it6162, buf, DATA_BUFFER_DEPTH);
> +	return 0;
> +}
> +
> +static void it6162_infoblock_mipi_config(struct it6162 *it6162,
> +					 struct it6162_mipi_cfg *cfg)
> +{
> +	u8 cfg_val = 0;
> +
> +	cfg_val = (cfg->continuous_clk << 6) | (cfg->en_port[1] << 5) |
> +		  (cfg->en_port[0] << 4) | (cfg->lane_swap << 3) |
> +		  (cfg->pn_swap << 2) | (cfg->lane_num - 1);

Use FIELD_PREP instead. Don't forget to #include <linux/bitfield.h>.

> +
> +	dev_dbg(it6162->dev, "%s 0x%02x 0x%02x", __func__,
> +		cfg_val, cfg->mode);
> +
> +	it6162_infoblock_write(it6162, OFFSET_MIPI_CONFIG_L, cfg_val);
> +	it6162_infoblock_write(it6162, OFFSET_MIPI_CONFIG_H, cfg->mode);
> +}
> +
> +static inline void it6162_infoblock_write_msg(struct it6162 *it6162,
> +					      struct it6162_infoblock_msg *msg)
> +{
> +	it6162_infoblock_write_bufer(it6162, msg->msg, msg->len);
> +	it6162_infoblock_host_set(it6162, msg->action);
> +}
> +
> +static void it6162_set_default_config(struct it6162 *it6162)
> +{
> +	guard(mutex)(&it6162->lock);
> +	it6162_infoblock_mipi_config(it6162, &it6162->mipi_cfg);
> +	it6162_infoblock_update_bits(it6162,
> +				     OFFSET_MIPI_CONFIG_L, 0x30, 0x00);
> +	it6162_infoblock_write(it6162, OFFSET_TX_CONFIG, 0x00);
> +	it6162_infoblock_write(it6162, OFFSET_TX_SETTING, 0x00);
> +	it6162_infoblock_host_set(it6162, B_CONFIG_CHG | B_SET_CHG);
> +}
> +
> +static void it6162_mipi_disable(struct it6162 *it6162)
> +{
> +	guard(mutex)(&it6162->lock);
> +	it6162_infoblock_update_bits(it6162, OFFSET_MIPI_CONFIG_L,
> +				     0x30, 0x00);
> +	it6162_infoblock_host_set(it6162, B_CONFIG_CHG);
> +}
T> +
> +static void it6162_mipi_enable(struct it6162 *it6162)
> +{
> +	unsigned int cfg_val = 0;
> +
> +	cfg_val = it6162->mipi_cfg.en_port[0] << 4 |
> +		  it6162->mipi_cfg.en_port[1] << 5;

FIELD_PREP

> +
> +	guard(mutex)(&it6162->lock);
> +	it6162_infoblock_update_bits(it6162,
> +				     OFFSET_MIPI_CONFIG_L, 0x30, cfg_val);

You will define masks to use FIELD_PREP. Use them here.

> +	it6162_infoblock_host_set(it6162, B_CONFIG_CHG);
> +}
> +
> +static void it6162_tx_hdcp_enable(struct it6162 *it6162,
> +				  struct it6162_tx_out_set *tx_out)
> +{
> +	u8 tmp;
> +
> +	it6162->hdcp_sts = NO_HDCP_STATE;
> +	tmp = it6162_infoblock_read(it6162, OFFSET_TX_SETTING) & 0x0F;
> +	tmp |= (tx_out->hdcp_version << 6) |
> +		(tx_out->hdcp_encyption << 5) |
> +		(tx_out->stream_ID << 4);

You can guess, FIELD_PREP

> +
> +	guard(mutex)(&it6162->lock);

Don't you need to lock it before reading the OFFSET_TX_SETTING?
Otherwise RMW sequence might be influenced by other code.

> +	it6162_infoblock_write(it6162, OFFSET_TX_SETTING, tmp);
> +	it6162_infoblock_host_set(it6162, B_SET_CHG);
> +
> +	drm_dbg(it6162->drm, "%s 0x%02x", __func__, tmp);
> +}
> +
> +static void it6162_tx_hdcp_disable(struct it6162 *it6162)
> +{
> +	u8 tmp;
> +
> +	it6162->hdcp_sts = NO_HDCP_STATE;
> +	it6162->hdcp_version = NO_HDCP;
> +	guard(mutex)(&it6162->lock);
> +	tmp = it6162_infoblock_read(it6162, OFFSET_TX_SETTING);
> +	tmp &= 0x0F;
> +	it6162_infoblock_write(it6162, OFFSET_TX_SETTING, tmp);
> +	it6162_infoblock_host_set(it6162, B_SET_CHG);
> +
> +	drm_dbg(it6162->drm, "%s 0x%02x", __func__, tmp);
> +}
> +
> +static void it6162_tx_hdcp_setup(struct it6162 *it6162,
> +				 u8 ver,
> +				 bool encription)
> +{
> +	struct it6162_tx_out_set tx_out;
> +
> +	drm_dbg(it6162->drm, "%s ver %x enc %d", __func__, ver, encription);
> +
> +	if (ver != NO_HDCP) {
> +		tx_out.hdcp_version = ver;
> +		tx_out.hdcp_encyption = encription;
> +		it6162_tx_hdcp_enable(it6162, &tx_out);
> +	} else {
> +		it6162_tx_hdcp_disable(it6162);
> +	}
> +}
> +
> +static void it6162_tx_enable(struct it6162 *it6162)
> +{
> +	if (!it6162->en_hdcp)
> +		it6162->hdcp_version = NO_HDCP;
> +	else
> +		it6162->hdcp_version = it6162->tx_out_set.hdcp_version;
> +
> +	drm_dbg(it6162->drm, "%s %d", __func__, it6162->hdcp_version);
> +}
> +
> +static void it6162_tx_disable(struct it6162 *it6162)
> +{
> +	if (it6162->en_hdcp) {
> +		it6162_tx_hdcp_setup(it6162, NO_HDCP, false);
> +		cancel_delayed_work_sync(&it6162->hdcp_work);

Cancel the work before programming the HDCP

> +	}
> +	drm_dbg(it6162->drm, "%s %d", __func__, it6162->hdcp_version);
> +}
> +
> +static void it6162_show_drm_video_mode(struct it6162 *it6162,
> +				       const struct videomode *vm)
> +{
> +	struct drm_device *drm = it6162->drm;
> +
> +	drm_info(drm, "HActive = %u", vm->hactive);
> +	drm_info(drm, "VActive = %u", vm->vactive);
> +	drm_info(drm, "HTotal  = %u",
> +		 vm->hactive + vm->hfront_porch + vm->hsync_len +
> +		 vm->hback_porch);
> +	drm_info(drm, "VTotal  = %u",
> +		 vm->vactive + vm->vfront_porch + vm->vsync_len +
> +		 vm->vback_porch);
> +	drm_info(drm, "PCLK    = %lukhz", vm->pixelclock / 1000);
> +	drm_info(drm, "HFP     = %u", vm->hfront_porch);
> +	drm_info(drm, "HSW     = %u", vm->hsync_len);
> +	drm_info(drm, "HBP     = %u", vm->hback_porch);
> +	drm_info(drm, "VFP     = %u", vm->vfront_porch);
> +	drm_info(drm, "VSW     = %u", vm->vsync_len);
> +	drm_info(drm, "VBP     = %u", vm->vback_porch);
> +	if (vm->flags & DISPLAY_FLAGS_HSYNC_HIGH)
> +		drm_info(drm, "HPOL +");
> +	else
> +		drm_info(drm, "HPOL -");
> +	if (vm->flags & DISPLAY_FLAGS_VSYNC_HIGH)
> +		drm_info(drm, "VPOL +");
> +	else
> +		drm_info(drm, "VPOL -");
> +	if (vm->flags & DISPLAY_FLAGS_INTERLACED)
> +		drm_info(drm, "Intelaced");
> +	else
> +		drm_info(drm, "Progressive");
> +}
> +
> +static void it6162_get_video_setting(struct it6162 *it6162,
> +				     struct it6162_video *video,
> +				     struct videomode *vm,
> +				     struct hdmi_avi_infoframe *avi_info)
> +{
> +	it6162_show_drm_video_mode(it6162, vm);
> +
> +	if (vm->flags & DISPLAY_FLAGS_HSYNC_HIGH)
> +		video->hpol = 1;
> +
> +	if (vm->flags & DISPLAY_FLAGS_VSYNC_HIGH)
> +		video->vpol = 1;
> +
> +	if (vm->flags & DISPLAY_FLAGS_INTERLACED)
> +		video->prog = false;
> +
> +	video->clock = vm->pixelclock / 1000;
> +	video->hdew = vm->hactive;
> +
> +	video->hfp = vm->hfront_porch;
> +	video->hsw = vm->hsync_len;
> +	video->hbp = vm->hback_porch;
> +	video->htotal = vm->hactive +
> +			vm->hfront_porch +
> +			vm->hsync_len +
> +			vm->hback_porch;
> +
> +	video->vdew = vm->vactive;
> +	video->vfp = vm->vfront_porch;
> +	video->vsw = vm->vsync_len;
> +	video->vbp = vm->vback_porch;
> +	video->vtotal = vm->vactive +
> +			vm->vfront_porch +
> +			vm->vsync_len +
> +			vm->vback_porch;
> +
> +	video->vic = avi_info->video_code;

So, you need VIC and pixel_ration from the programmed infoframe. Please
modify hdmi_generate_avi_infoframe() and store VIC, aspect ratio and
pixel_repeat in HDMI conn_state.

> +
> +	drm_dbg(it6162->drm, "vic %x", video->vic);
> +
> +	switch (avi_info->picture_aspect) {
> +	case HDMI_PICTURE_ASPECT_4_3:
> +		video->h_aspect = 4;
> +		video->v_aspect = 3;
> +		break;
> +	case HDMI_PICTURE_ASPECT_16_9:
> +		video->h_aspect = 16;
> +		video->v_aspect = 9;
> +		break;
> +	case HDMI_PICTURE_ASPECT_64_27:
> +		video->h_aspect = 64;
> +		video->v_aspect = 27;
> +		break;
> +	case HDMI_PICTURE_ASPECT_256_135:
> +		video->h_aspect = 256;
> +		video->v_aspect = 135;
> +		break;
> +	default:
> +		video->h_aspect = 4;
> +		video->v_aspect = 3;
> +		break;
> +	}
> +	drm_dbg(it6162->drm, "aspect %d:%d",
> +		video->h_aspect, video->v_aspect);
> +
> +	video->pix_rep = avi_info->pixel_repeat + 1;
> +	drm_dbg(it6162->drm, "pix_rep %d", video->pix_rep);
> +	video->colorspace = avi_info->colorspace;

conn_state->hdmi.output_format

> +	drm_dbg(it6162->drm, "colorspace %d", video->colorspace);
> +}
> +
> +static void it6162_pack_video_setting(struct it6162 *it6162,
> +				      struct it6162_video *video,
> +				      struct it6162_infoblock_msg *msg)
> +{
> +	msg->action = HOST_SETTING_VIDEO_INFO;
> +	msg->len = 0x1C;
> +
> +	msg->msg[0x00] =  video->hdew & 0xFF;
> +	msg->msg[0x01] =  (video->hdew >> 8) & 0x3F;
> +	msg->msg[0x02] =  video->vdew & 0xFF;
> +	msg->msg[0x03] =  (video->vdew >> 8) & 0x3F;
> +	msg->msg[0x04] =  video->clock  & 0xFF;
> +	msg->msg[0x05] =  (video->clock >> 8) & 0xFF;
> +	msg->msg[0x06] =  (video->clock >> 16) & 0xFF;
> +	msg->msg[0x07] =  (video->clock >> 24) & 0xFF;
> +	msg->msg[0x08] =  video->hfp & 0xFF;
> +	msg->msg[0x09] =  (video->hfp >> 8) & 0x3F;
> +	msg->msg[0x0A] =  video->hsw & 0xFF;
> +	msg->msg[0x0B] =  (video->hsw >> 8) & 0x3F;
> +	msg->msg[0x0C] =  video->hbp & 0xFF;
> +	msg->msg[0x0D] =  (video->hbp >> 8) & 0x3F;
> +	msg->msg[0x0E] =  video->vfp & 0xFF;
> +	msg->msg[0x0F] =  (video->vfp >> 8) & 0x3F;
> +	msg->msg[0x10] =  video->vsw & 0xFF;
> +	msg->msg[0x11] =  (video->vsw >> 8) & 0x3F;
> +	msg->msg[0x12] =  video->vbp & 0xFF;
> +	msg->msg[0x13] =  (video->vbp >> 8) & 0x3F;
> +	msg->msg[0x14] =  (video->prog << 2) |
> +			  (video->vpol << 1) |
> +			  video->hpol;
> +	msg->msg[0x15] =  video->v_aspect;
> +	msg->msg[0x16] =  video->h_aspect & 0xFF;
> +	msg->msg[0x17] =  video->h_aspect >> 8;
> +	msg->msg[0x18] =  video->pix_rep;
> +	msg->msg[0x19] =  video->vic;
> +	msg->msg[0x1A] =  video->colorspace;
> +	msg->msg[0x1B] =  1;
> +}
> +
> +static void it6162_mipi_set_d2v_video_timing(struct it6162 *it6162,
> +					     struct videomode *vm,
> +					     struct hdmi_avi_infoframe *avi_info)
> +{
> +	struct it6162_video video;
> +	struct it6162_infoblock_msg msg;
> +
> +	it6162_get_video_setting(it6162, &video, vm, avi_info);
> +	it6162_pack_video_setting(it6162, &video, &msg);
> +	guard(mutex)(&it6162->lock);
> +	it6162_infoblock_write_msg(it6162, &msg);
> +}
> +
> +static int it6162_hdcp_read_infomation(struct it6162 *it6162,
> +				       u8 *status, u8 *bksv)
> +{
> +	u8 buf[DATA_BUFFER_DEPTH];
> +	int ret;
> +
> +	guard(mutex)(&it6162->lock);
> +	ret = it6162_infoblock_request_data(it6162,
> +					    HOST_SETTING_HDCP_R,
> +					    0x00,
> +					    buf);
> +
> +	if (ret < 0)
> +		return ret;
> +
> +	if (status)
> +		memcpy(status, buf, 2);
> +
> +	if (bksv)
> +		memcpy(bksv, buf + 2, 5);
> +
> +	return 0;
> +}
> +
> +static int it6162_hdcp_read_list(struct it6162 *it6162,
> +				 u8 *ksv_list,
> +				 int dev_count)
> +{
> +	u8 buf[DATA_BUFFER_DEPTH];
> +	int i, j, ret;
> +
> +	if (!ksv_list || dev_count <= 0)
> +		return -EINVAL;
> +
> +	guard(mutex)(&it6162->lock);
> +
> +	for (i = 0; i < (dev_count / 6 + 1); i++) {
> +		/* KsV lists */
> +		ret = it6162_infoblock_request_data(it6162,
> +						    HOST_SETTING_HDCP_R,
> +						    i + 1,
> +						    buf);
> +
> +		if (ret < 0)
> +			return ret;
> +
> +		for (j = 0; j < 30; j += 5) {
> +			if ((i * 6 + j / 5) >= dev_count)
> +				break;
> +
> +			memcpy(&ksv_list[(i * 6 + j / 5) * 5], &buf[j], 5);
> +		}
> +	}
> +
> +	return dev_count;
> +}
> +
> +static void it6162_update_hdcp14(struct it6162 *it6162)
> +{
> +	struct drm_device *drm = it6162->drm;
> +	int dev_count;
> +	u8 bksv[5];
> +	u8 bstatus[2];
> +	u8 ksvlist[5 * 30];
> +	int i, ret;
> +
> +	ret = it6162_hdcp_read_infomation(it6162, bstatus, bksv);
> +
> +	if (ret < 0) {
> +		drm_err(drm, "read Bstatus fail!!!!");
> +		return;
> +	}
> +	drm_dbg(drm, "status = 0x%02X%02X", bstatus[1], bstatus[0]);
> +
> +	if (DRM_HDCP_MAX_DEVICE_EXCEEDED(bstatus[0]) ||
> +	    DRM_HDCP_MAX_CASCADE_EXCEEDED(bstatus[1])) {
> +		drm_err(drm, "HDCP14 Max Topology Limit Exceeded");
> +		return;
> +	}
> +
> +	dev_count = DRM_HDCP_NUM_DOWNSTREAM(bstatus[0]);
> +	drm_dbg(drm, "dev_count %d", dev_count);
> +	if (dev_count == 0)
> +		return;
> +
> +	dev_count = dev_count > 30 ? 30 : dev_count;
> +	ret = it6162_hdcp_read_list(it6162, ksvlist, dev_count);
> +
> +	if (ret < 0) {
> +		drm_err(drm, "read KSV list fail!!!!");
> +		return;
> +	}
> +
> +	for (i = 0; i < dev_count; i++) {
> +		drm_info(drm, "KSV %02X %02X %02X %02X %02X",

You really like spamming... no.

> +			 ksvlist[i * 5 + 0], ksvlist[i * 5 + 1],
> +			 ksvlist[i * 5 + 2], ksvlist[i * 5 + 3],
> +			 ksvlist[i * 5 + 4]);
> +	}
> +}
> +
> +static void it6162_update_hdcp23(struct it6162 *it6162)
> +{
> +	struct drm_device *drm = it6162->drm;
> +	int dev_count;
> +	u8 rxid[5];
> +	u8 rxinfo[2];
> +	u8 rxid_list[5 * 30];
> +	int i, ret;
> +
> +	ret = it6162_hdcp_read_infomation(it6162, rxinfo, rxid);
> +
> +	if (ret < 0) {
> +		drm_err(drm, "read Rxinfo fail!!!!");
> +		return;
> +	}
> +	drm_dbg(drm, "Rxinfo 0x%02X%02X", rxinfo[1], rxinfo[0]);
> +
> +	if (HDCP_2_2_MAX_CASCADE_EXCEEDED(rxinfo[1]) ||
> +	    HDCP_2_2_MAX_DEVS_EXCEEDED(rxinfo[1])) {
> +		drm_err(drm, "Topology Max Size Exceeded");
> +		return;
> +	}
> +
> +	dev_count = (HDCP_2_2_DEV_COUNT_HI(rxinfo[0]) << 4 |
> +		     HDCP_2_2_DEV_COUNT_LO(rxinfo[1]));
> +
> +	drm_dbg(drm, "dev_count %d", dev_count);
> +	if (dev_count == 0)
> +		return;
> +
> +	dev_count = dev_count > 30 ? 30 : dev_count;
> +
> +	ret = it6162_hdcp_read_list(it6162, rxid_list, dev_count);
> +
> +	if (ret < 0) {
> +		drm_err(drm, "read RxID list fail!!!!");
> +		return;
> +	}
> +
> +	for (i = 0; i < dev_count; i++) {
> +		drm_info(drm, "RxID %02X %02X %02X %02X %02X",
> +			 rxid_list[i * 5 + 0], rxid_list[i * 5 + 1],
> +			 rxid_list[i * 5 + 2], rxid_list[i * 5 + 3],
> +			 rxid_list[i * 5 + 4]);
> +	}
> +}
> +
> +static void it6162_update_hdcp(struct it6162 *it6162)
> +{
> +	if (it6162->hdcp_version == HDCP_23)
> +		it6162_update_hdcp23(it6162);
> +	else
> +		it6162_update_hdcp14(it6162);
> +}
> +
> +static void it6162_hdcp_handler(struct it6162 *it6162)
> +{
> +	unsigned int tx_status, sink_cap;
> +	enum hdcp_state hdcp_sts;
> +	u8 hdcp_ver;
> +
> +	drm_info(it6162->drm, "%s %d", __func__, it6162->en_hdcp);
> +	if (!it6162->en_hdcp)
> +		return;
> +
> +	tx_status = it6162_infoblock_read(it6162, OFFSET_TX_STATUS);
> +	sink_cap = it6162_infoblock_read(it6162, OFFSET_SINK_CAP);
> +	drm_info(it6162->drm, "Tx status %x", tx_status);
> +	drm_info(it6162->drm, "SINK capability %x", sink_cap);
> +
> +	if (it6162->tx_out_set.hdcp_version != NO_HDCP &&
> +	    it6162->hdcp_version != NO_HDCP) {
> +		hdcp_sts = GET_TX_HDCP_STATUS(tx_status);
> +		hdcp_ver = GET_SINK_CAP_HDCP_VER(sink_cap);
> +		drm_info(it6162->drm, "hdcp %x->%x, ver %x-%x",
> +			 it6162->hdcp_sts, hdcp_sts,
> +			 it6162->hdcp_version, hdcp_ver);
> +
> +		if (it6162->hdcp_sts != hdcp_sts ||
> +		    it6162->hdcp_sts == NO_HDCP_STATE) {
> +			it6162->hdcp_sts = hdcp_sts;
> +			it6162->hdcp_version = hdcp_ver;
> +			switch (hdcp_sts) {
> +			case AUTH_DONE:
> +				drm_info(it6162->drm, "HDCP AUTH DONE");
> +				it6162_update_hdcp(it6162);
> +				break;
> +			case AUTH_FAIL:
> +				drm_info(it6162->drm, "HDCP AUTH FAIL");
> +				if (it6162->hdcp_version == HDCP_23) {
> +					it6162->hdcp_version = HDCP_14;
> +					it6162_tx_hdcp_setup(it6162,
> +							     it6162->hdcp_version,
> +							     true);
> +				} else {
> +					it6162_tx_hdcp_disable(it6162);
> +				}
> +
> +				break;
> +			default:
> +				drm_info(it6162->drm, "HDCP NO AUTH");
> +				it6162_tx_hdcp_setup(it6162,
> +						     it6162->hdcp_version,
> +						     true);
> +				break;

drm_hdcp_update_content_protection() at proper places?

> +			}
> +		}
> +	}
> +}
> +
> +static void it6162_interrupt_handler(struct it6162 *it6162)
> +{
> +	unsigned int int_status, tx_status, mipi_status, sink_cap;
> +	enum drm_connector_status connector_status;
> +
> +	int_status = it6162_infoblock_read(it6162, OFFSET_EVENT_CHG);
> +	it6162_infoblock_write(it6162, OFFSET_EVENT_CHG, 0xFF);
> +
> +	if (!!GET_BUFFER_STATUS(int_status)) {
> +		drm_info(it6162->drm, "IRQ int_status = %x", int_status);

Please don't spam the logs unless requested.

> +		it6162_infoblock_write(it6162, OFFSET_DRIVER_DATA, int_status);
> +		it6162->data_buf_sts = GET_BUFFER_STATUS(int_status);
> +	}
> +
> +	if (!(int_status & EVENT_CHG))
> +		return;
> +
> +	drm_info(it6162->drm, "evnet change");
> +	tx_status = it6162_infoblock_read(it6162, OFFSET_TX_STATUS);
> +	drm_info(it6162->drm, "Tx status %x", tx_status);
> +
> +	mipi_status = it6162_infoblock_read(it6162, OFFSET_MIPI_STATUS);
> +	drm_info(it6162->drm, "MIPI status %x", mipi_status);
> +
> +	sink_cap = it6162_infoblock_read(it6162, OFFSET_SINK_CAP);
> +	drm_info(it6162->drm, "SINK capability %x", sink_cap);
> +
> +	connector_status = GET_TX_HPD_STATUS(tx_status) ?
> +			   connector_status_connected :
> +			   connector_status_disconnected;
> +
> +	if (it6162->connector_status != connector_status) {
> +		it6162->connector_status = connector_status;
> +
> +		if (it6162->bridge_hpd_enable)
> +			drm_bridge_hpd_notify(&it6162->bridge,
> +					      it6162->connector_status);

Call this function unconditionally.

> +	}
> +
> +	if (it6162->en_hdcp && GET_TX_VIDEO_STATUS(tx_status) &&
> +	    connector_status == connector_status_connected)
> +		queue_delayed_work(system_wq,
> +				   &it6162->hdcp_work,
> +				   msecs_to_jiffies(2500));
> +}
> +
> +static bool it6162_wait_devices(struct it6162 *it6162)
> +{
> +	struct device *dev = &it6162->it6162_i2c->dev;
> +	unsigned int status, i;
> +	unsigned int regEF;
> +
> +	for (i = 0; i < 10; i++) {
> +		msleep(200);
> +		regEF = it6162_infoblock_read(it6162, OFFSET_HOST_SETTING);
> +		status = it6162_infoblock_read(it6162, OFFSET_EVENT_CHG);
> +		dev_err(dev, "wait 6162 rdy %x %x %u", status, regEF, i);

And what does this mean?

> +
> +		if (status & EVENT_READY) {
> +			dev_info(dev, "IC status %01x", status);
> +			return true;
> +		}
> +		it6162_infoblock_write(it6162, 0x00, 0x00);
> +	}
> +
> +	dev_err(dev, "-ENODEV %s %x", __func__, status);
> +	return false;
> +}
> +
> +static void it6162_reset_init(struct it6162 *it6162)
> +{
> +	it6162_set_default_config(it6162);
> +}
> +
> +static int it6162_platform_set_power(struct it6162 *it6162)
> +{
> +	struct device *dev = it6162->dev;
> +	int err;
> +
> +	if (!it6162->ivdd && !it6162->pwr1833 && !it6162->ovdd)
> +		return 0;

Drop all the conditionals from this funciton.

> +
> +	if (it6162->ivdd) {
> +		err = regulator_enable(it6162->ivdd);
> +		if (err) {
> +			dev_err(dev, "Failed to enable IVDD: %d",
> +				err);
> +			return err;
> +		}
> +	}
> +
> +	if (it6162->pwr1833) {
> +		err = regulator_enable(it6162->pwr1833);
> +		if (err) {
> +			dev_err(dev, "Failed to enable VDD1833: %d",
> +				err);
> +			return err;
> +		}
> +	}
> +
> +	if (it6162->ovdd) {
> +		err = regulator_enable(it6162->ovdd);
> +		if (err)
> +			return err;
> +	}
> +
> +	if (it6162->gpiod_reset) {
> +		usleep_range(10000, 20000);
> +		gpiod_set_value_cansleep(it6162->gpiod_reset, 1);
> +		usleep_range(1000, 2000);
> +		gpiod_set_value_cansleep(it6162->gpiod_reset, 0);
> +		usleep_range(10000, 20000);
> +	}
> +
> +	return 0;
> +}
> +
> +static int it6162_platform_clear_power(struct it6162 *it6162)
> +{
> +	struct device *dev = it6162->dev;
> +	int err;
> +
> +	if (!it6162->ivdd && !it6162->pwr1833 && !it6162->ovdd)
> +		return 0;

And from this one too.

> +
> +	if (it6162->ivdd) {
> +		err = regulator_disable(it6162->ivdd);
> +		if (err) {
> +			dev_err(dev, "Failed to disable IVDD: %d", err);
> +			return err;
> +		}
> +		usleep_range(2000, 3000);
> +	}
> +
> +	if (it6162->pwr1833) {
> +		err = regulator_disable(it6162->pwr1833);
> +		if (err) {
> +			dev_err(dev, "Failed to disable VDD1833: %d", err);
> +			return err;
> +		}
> +	}
> +
> +	if (it6162->ovdd) {
> +		err = regulator_disable(it6162->ovdd);
> +		if (err)
> +			return err;
> +	}
> +	return 0;
> +}
> +
> +static int it6162_detect_devices(struct it6162 *it6162)
> +{
> +	struct device *dev = it6162->dev;
> +	const struct it6162_chip_info *chip_info;
> +	u32 chip_id, version;
> +	u8 buf[6];
> +
> +	it6162_platform_set_power(it6162);
> +
> +	if (!it6162_wait_devices(it6162))
> +		return -ENODEV;
> +
> +	chip_info = of_device_get_match_data(dev);
> +
> +	it6162_infoblock_bulk_read(it6162, OFFSET_CHIP_ID_L, &buf[0], 6);
> +	dev_info(dev, "chip id %02x %02x %02X", buf[0], buf[1], buf[2]);
> +	dev_info(dev, "chip VER %02x %02x %02x", buf[3], buf[4], buf[5]);
> +
> +	chip_id = (buf[0] << 16) | (buf[1] << 8) | (buf[2]);
> +	version = (buf[3] << 16) | (buf[4] << 8) | (buf[5]);
> +	dev_info(dev, "chip id 0x%06x, version 0x%06x", chip_id, version);
> +
> +	if (chip_id != chip_info->chip_id || version < chip_info->version) {
> +		dev_err(dev, "chip_id 0x%06x != 0x%06x",
> +			chip_id, chip_info->chip_id);
> +		dev_err(dev, "version 0x%06x != 0x%06x",
> +			version, chip_info->version);
> +
> +		return -ENODEV;
> +	}
> +
> +	it6162->chip_info.chip_id = chip_info->chip_id;
> +	it6162->chip_info.version = chip_info->version;
> +
> +	return 0;
> +}
> +
> +static int __maybe_unused it6162_poweron(struct it6162 *it6162)
> +{
> +	struct device *dev = it6162->dev;
> +	int err;
> +
> +	dev_dbg(dev, "powered on Start");
> +	if (!it6162->power_on) {
> +		err = it6162_platform_set_power(it6162);
> +		if (err < 0)
> +			return err;
> +		/*wait for info block ready after power-on-rest*/
> +		if (!it6162_wait_devices(it6162))
> +			return -ENODEV;
> +	}
> +
> +	it6162->connector_status = connector_status_disconnected;
> +	it6162_reset_init(it6162);
> +
> +	enable_irq(it6162->it6162_i2c->irq);
> +	dev_dbg(dev, "enable irq %d",
> +		it6162->it6162_i2c->irq);
> +
> +	it6162->power_on = true;
> +	dev_info(dev, "it6162 poweron end");
> +	return 0;
> +}
> +
> +static int __maybe_unused it6162_poweroff(struct it6162 *it6162)
> +{
> +	struct device *dev = it6162->dev;
> +	int err;
> +
> +	dev_dbg(dev, "powered off start");
> +	disable_irq(it6162->it6162_i2c->irq);
> +	dev_dbg(dev, "disable irq %d", it6162->it6162_i2c->irq);
> +
> +	if (it6162->power_on) {
> +		err = it6162_platform_clear_power(it6162);
> +		if (err < 0)
> +			return err;
> +	}
> +
> +	it6162->power_on = false;
> +	dev_dbg(dev, "it6162 poweroff");
> +	return 0;
> +}
> +
> +static void it6162_config_default(struct it6162 *it6162)
> +{
> +	struct it6162_mipi_cfg *mipi_cfg = &it6162->mipi_cfg;
> +	struct it6162_audio *audio_config = &it6162->audio_config;
> +
> +	mipi_cfg->lane_num = 4;
> +	mipi_cfg->pn_swap = false;
> +	mipi_cfg->lane_swap = false;
> +	mipi_cfg->en_port[0] = false;
> +	mipi_cfg->en_port[1] = false;
> +	mipi_cfg->continuous_clk = true;
> +	mipi_cfg->mode = SYNC_EVENT;
> +	mipi_cfg->format = MIPI_DSI_FMT_RGB888;
> +	mipi_cfg->mode_flags = MIPI_DSI_MODE_VIDEO;
> +
> +	audio_config->select = I2S;
> +	audio_config->sample_rate = SAMPLE_RATE_48K;
> +	audio_config->type = LPCM;
> +	audio_config->sample_width = WORD_LENGTH_16BIT;
> +	audio_config->channel_number = 2;
> +
> +	it6162->connector_status = connector_status_disconnected;
> +}
> +
> +static enum drm_connector_status it6162_detect(struct it6162 *it6162)
> +{
> +	unsigned int tx_status;
> +
> +	tx_status = it6162_infoblock_read(it6162, OFFSET_TX_STATUS);
> +	it6162->connector_status = GET_TX_HPD_STATUS(tx_status) ?
> +				   connector_status_connected :
> +				   connector_status_disconnected;
> +
> +	drm_dbg(it6162->drm, "%s connector_status %x", __func__,
> +		it6162->connector_status);
> +	return it6162->connector_status;
> +}
> +
> +static int it6162_get_edid_block(void *data, u8 *buf, unsigned int block,
> +				 size_t len)
> +{
> +	struct it6162 *it6162 = data;
> +	unsigned int cnt;
> +	unsigned int i;
> +	u8 config;
> +
> +	if (len > EDID_LENGTH)
> +		return -EINVAL;
> +
> +	guard(mutex)(&it6162->lock);
> +
> +	cnt = 0;
> +	for (i = 0; i < EDID_LENGTH; i += DATA_BUFFER_DEPTH, cnt++) {
> +		config = (block << 2) | (cnt);
> +		if (it6162_infoblock_request_data(it6162,
> +						  HOST_SETTING_EDID_R,
> +						  config, buf + i) < 0)
> +			return -EIO;
> +	}
> +
> +	return 0;
> +}
> +
> +static void it6162_enable_audio(struct it6162 *it6162)
> +{
> +	struct it6162_audio *config = &it6162->audio_config;
> +
> +	guard(mutex)(&it6162->lock);
> +	it6162_infoblock_write(it6162, 0x3D, config->sample_rate);
> +	it6162_infoblock_write(it6162, 0x3C, (config->channel_number) |
> +					     (config->select << 4) |
> +					     (config->type << 6));
> +	//Standard i2s 16bit, 24bit
> +	it6162_infoblock_write(it6162, 0x3E, 0x80 |
> +					     config->sample_width << 5);
> +
> +	it6162_infoblock_host_set(it6162, HOST_SETTING_AUDIO_INFO);
> +}
> +
> +static void it6162_disable_audio(struct it6162 *it6162)
> +{
> +	guard(mutex)(&it6162->lock);
> +	it6162_infoblock_write(it6162, 0x3C, 0x00);
> +	it6162_infoblock_host_set(it6162, HOST_SETTING_AUDIO_INFO);
> +}
> +
> +static irqreturn_t it6162_int_threaded_handler(int unused, void *data)
> +{
> +	struct it6162 *it6162 = data;
> +
> +	it6162_interrupt_handler(it6162);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static int it6162_audio_update_hw_params(struct it6162 *it6162,
> +					 struct hdmi_codec_daifmt *fmt,
> +					 struct hdmi_codec_params *hparms)
> +{
> +	struct it6162_audio *config = &it6162->audio_config;
> +
> +	hdmi_audio_infoframe_pack(&hparms->cea, &config->infoframe,
> +				  sizeof(config->infoframe));

Drop, it should be handled by the helpers.

> +
> +	memcpy(config->channel_status, &hparms->iec.status[0],
> +	       AES_IEC958_STATUS_SIZE);
> +
> +	config->channel_number = hparms->channels;
> +
> +	switch (hparms->sample_rate) {
> +	case 32000:
> +		config->sample_rate = SAMPLE_RATE_32K;
> +		break;
> +	case 44100:
> +		config->sample_rate = SAMPLE_RATE_44_1K;
> +		break;
> +	case 48000:
> +		config->sample_rate = SAMPLE_RATE_48K;
> +		break;
> +	case 88200:
> +		config->sample_rate = SAMPLE_RATE_88_2K;
> +		break;
> +	case 96000:
> +		config->sample_rate = SAMPLE_RATE_96K;
> +		break;
> +	case 176400:
> +		config->sample_rate = SAMPLE_RATE_176_4K;
> +		break;
> +	case 192000:
> +		config->sample_rate = SAMPLE_RATE_192K;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	switch (hparms->sample_width) {
> +	case 16:
> +		config->sample_width = WORD_LENGTH_16BIT;
> +		break;
> +	case 24:
> +		config->sample_width = WORD_LENGTH_18BIT;
> +		break;
> +	case 20:
> +		config->sample_width = WORD_LENGTH_24BIT;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	switch (fmt->fmt) {
> +	case HDMI_I2S:
> +		config->select = I2S;
> +		break;
> +	case HDMI_SPDIF:
> +		config->select = SPDIF;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static void it6162_hdcp_work(struct work_struct *work)
> +{
> +	struct it6162 *it6162 = container_of(work,
> +				struct it6162,
> +				hdcp_work.work);
> +
> +	it6162_hdcp_handler(it6162);
> +}
> +
> +static struct mipi_dsi_host *it6162_of_get_dsi_host_by_port(struct it6162 *it6162,
> +							    int port)
> +{
> +	struct device_node *of = it6162->dev->of_node;
> +	struct device_node *host_node;
> +	struct device_node *endpoint;
> +	struct mipi_dsi_host *dsi_host;
> +
> +	endpoint = of_graph_get_endpoint_by_regs(of, port, -1);
> +	if (!endpoint)
> +		return ERR_PTR(-ENODEV);
> +
> +	host_node = of_graph_get_remote_port_parent(endpoint);
> +	of_node_put(endpoint);
> +	if (!host_node)
> +		return ERR_PTR(-ENODEV);
> +
> +	dsi_host = of_find_mipi_dsi_host_by_node(host_node);
> +	of_node_put(host_node);
> +
> +	if (IS_ERR_OR_NULL(dsi_host))

of_find_mipi_dsi_host_by_node() doesn't return ERR_PTR, so just if
(!dsi_host).

> +		return ERR_PTR(-EPROBE_DEFER);
> +
> +	return dsi_host;
> +}
> +
> +static int it6162_of_get_dsi_host(struct it6162 *it6162)
> +{
> +	struct device *dev = it6162->dev;
> +	struct mipi_dsi_host *dsi_host;
> +	int port, host_count = 0;
> +
> +	for (port = 0; port < 2; port++) {
> +		dsi_host = it6162_of_get_dsi_host_by_port(it6162, port);
> +
> +		if (PTR_ERR(dsi_host) == -EPROBE_DEFER) {
> +			dev_info(dev,
> +				 "DSI host for port %d not ready, defer probe",
> +				 port);
> +			return -EPROBE_DEFER;
> +		}
> +
> +		if (IS_ERR(dsi_host)) {
> +			dev_info(dev, "DSI host for port %d not found", port);
> +			continue;
> +		}
> +
> +		host_count++;
> +	}
> +
> +	dev_info(dev, "%s = %d", __func__, host_count);
> +	if (host_count == 0)
> +		return -ENODEV;
> +
> +	return 0;
> +}
> +
> +static void it6162_load_mipi_pars_from_port(struct it6162 *it6162, int port)
> +{
> +	struct device_node *of = it6162->dev->of_node;
> +	struct device_node *endpoint;
> +	struct device *dev = it6162->dev;
> +	struct it6162_mipi_cfg *mipicfg = &it6162->mipi_cfg;
> +	int dsi_lanes;
> +
> +	endpoint = of_graph_get_endpoint_by_regs(of, port, -1);
> +
> +	if (!endpoint)
> +		return;
> +
> +	dsi_lanes = drm_of_get_data_lanes_count(endpoint, 1, 4);
> +
> +	if (dsi_lanes <= 0)
> +		mipicfg->lane_num = 4;

return dsi_lanes;

> +	else
> +		mipicfg->lane_num = dsi_lanes;
> +
> +	mipicfg->pn_swap = of_property_present(endpoint,
> +					       "ite,mipi-dsi-phy-pn-swap");
> +	mipicfg->lane_swap = of_property_present(endpoint,
> +						 "ite,mipi-dsi-phy-link-swap");
> +
> +	if (of_property_present(endpoint, "ite,mipi-dsi-mode-video-sync-pulse")) {
> +		mipicfg->mode_flags |= MIPI_DSI_MODE_VIDEO_SYNC_PULSE;
> +		mipicfg->mode = SYNC_PULSE;
> +	}
> +
> +	if (of_property_present(endpoint, "ite,mipi-dsi-clock-non-continous")) {
> +		mipicfg->mode_flags |= MIPI_DSI_CLOCK_NON_CONTINUOUS;
> +		mipicfg->continuous_clk = false;
> +	}
> +
> +	of_node_put(endpoint);
> +
> +	dev_info(dev, "lanes: %d pn_swap: %d, lane_swap: %d, mode_flags: %lu",
> +		 mipicfg->lane_num, mipicfg->pn_swap,
> +		 mipicfg->lane_swap, mipicfg->mode_flags);
> +}
> +
> +static int it6162_attach_dsi(struct it6162 *it6162)
> +{
> +	struct device *dev = it6162->dev;
> +	struct device_node *np = dev->of_node;
> +	const struct mipi_dsi_device_info info = {"it6162-mipi", 0, np};
> +	struct mipi_dsi_device *dsi;
> +	struct mipi_dsi_host *dsi_host;
> +	struct it6162_mipi_cfg *mipi_cfg = &it6162->mipi_cfg;
> +	int ret = 0;
> +
> +	for (int port = 0; port < 2; port++) {
> +		dsi_host = it6162_of_get_dsi_host_by_port(it6162, port);
> +		if (IS_ERR(dsi_host))
> +			continue;
> +
> +		mipi_cfg->en_port[port] = true;
> +
> +		if (!it6162->dsi) {
> +			dev_info(dev, "DSI host loaded paras for port %d", port);
> +			it6162->dsi = dsi;
> +			it6162_load_mipi_pars_from_port(it6162, port);
> +		}
> +
> +		dsi = devm_mipi_dsi_device_register_full(dev, dsi_host, &info);
> +		if (IS_ERR(dsi)) {
> +			dev_err(dev, "failed to create dsi device");
> +			return PTR_ERR(dsi);
> +		}
> +
> +		dsi->lanes = mipi_cfg->lane_num;
> +		dsi->format = mipi_cfg->format;
> +		dsi->mode_flags = mipi_cfg->mode_flags;
> +		dev_info(dev, "dsi lanes %d, format %d, mode_flags %lu",
> +			 dsi->lanes, dsi->format, dsi->mode_flags);
> +		ret = devm_mipi_dsi_attach(dev, dsi);
> +
> +		if (ret) {
> +			dev_err(dev, "failed to attach dsi device %d", port);
> +			return ret;
> +		}
> +	}
> +
> +	it6162_poweron(it6162);
> +	return 0;
> +}
> +
> +static unsigned int it6162_parse_dt(struct it6162 *it6162)
> +{
> +	struct device *dev = it6162->dev;
> +	struct device_node *np = dev->of_node;
> +	struct device_node *audio_port;
> +	u16 reg_val;
> +	int ret;
> +
> +	/* get audio port*/
> +	audio_port = of_graph_get_port_by_id(np, 2);
> +	if (audio_port) {
> +		it6162->support_audio = true;
> +		of_node_put(audio_port);
> +	}
> +
> +	/* get hdcp support*/
> +	ret = of_property_read_u16(np, "ite,hdcp-version", &reg_val);

What if this HDCP version doesn't match the HDCP version of the sink? I
think it should be selected at the runtime.

> +	if (ret == 0) {
> +		it6162->en_hdcp = true;
> +		it6162->hdcp_version = reg_val;
> +		dev_info(dev, "HDCP version %x", it6162->hdcp_version);
> +	} else {
> +		it6162->en_hdcp = false;
> +		dev_info(dev, "HDCP not supported");
> +	}
> +
> +	return 0;
> +}
> +
> +static int it6162_init_pdata(struct it6162 *it6162)
> +{
> +	struct device *dev = it6162->dev;
> +
> +	it6162->ivdd = devm_regulator_get(dev, "ivdd");
> +	if (IS_ERR(it6162->ivdd)) {
> +		dev_info(dev, "ivdd regulator not found");

No, it means a different issue. Return the error as returned by the
regulator subsystem.

> +		it6162->ivdd = NULL;
> +	}
> +
> +	it6162->pwr1833 = devm_regulator_get(dev, "ovdd1833");
> +	if (IS_ERR(it6162->pwr1833)) {
> +		dev_info(dev, "pwr1833 regulator not found");
> +		it6162->pwr1833 = NULL;
> +	}
> +
> +	it6162->ovdd = devm_regulator_get(dev, "ovdd");
> +	if (IS_ERR(it6162->ovdd)) {
> +		dev_info(dev, "ovdd regulator not found");
> +		it6162->ovdd = NULL;
> +	}
> +
> +	it6162->gpiod_reset = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
> +	if (IS_ERR(it6162->gpiod_reset)) {
> +		dev_info(dev, "reset gpio not found");
> +		it6162->gpiod_reset = NULL;

Also no, return the error.

> +	}
> +
> +	return 0;
> +}
> +
> +static int it6162_bridge_attach(struct drm_bridge *bridge,
> +				struct drm_encoder *encoder,
> +				 enum drm_bridge_attach_flags flags)
> +{
> +	struct it6162 *it6162 = bridge_to_it6162(bridge);
> +	struct drm_device *drm = bridge->dev;
> +
> +	it6162->drm = drm;
> +
> +	if (!drm_core_check_feature(drm, DRIVER_ATOMIC)) {
> +		drm_dbg(drm,
> +			"it6162 driver only copes with atomic updates");
> +		return -EOPNOTSUPP;
> +	}
> +
> +	if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)) {

What is the usecase for this?

> +		struct drm_connector *connector;
> +		int ret;
> +
> +		connector = drm_bridge_connector_init(drm, bridge->encoder);
> +		if (IS_ERR(connector)) {
> +			drm_dbg(drm, "Unable to create bridge connector");
> +			return PTR_ERR(connector);
> +		}
> +
> +		ret = drm_connector_attach_encoder(connector, bridge->encoder);
> +		if (ret < 0)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static enum drm_mode_status
> +	it6162_bridge_mode_valid(struct drm_bridge *bridge,
> +				 const struct drm_display_info *info,
> +				 const struct drm_display_mode *mode)
> +{
> +	if (mode->clock > 300000)
> +		return MODE_CLOCK_HIGH;

use hdmi_tmds_char_rate_valid() instead

> +
> +	return MODE_OK;
> +}
> +
> +static enum drm_connector_status
> +		it6162_bridge_detect(struct drm_bridge *bridge,
> +				     struct drm_connector *connector)
> +{
> +	struct it6162 *it6162 = bridge_to_it6162(bridge);
> +
> +	return it6162->power_on ? it6162_detect(it6162) :
> +				connector_status_disconnected;
> +}
> +
> +static void it6162_bridge_hpd_enable(struct drm_bridge *bridge)
> +{
> +	struct it6162 *it6162 = bridge_to_it6162(bridge);
> +
> +	it6162->bridge_hpd_enable = true;

No. These callbacks are supposed to enable / disable the interrupt.

> +}
> +
> +static void it6162_bridge_hpd_disable(struct drm_bridge *bridge)
> +{
> +	struct it6162 *it6162 = bridge_to_it6162(bridge);
> +
> +	it6162->bridge_hpd_enable = false;
> +}
> +
> +static void it6162_bridge_atomic_enable(struct drm_bridge *bridge,
> +					struct drm_atomic_state *state)
> +{
> +	struct it6162 *it6162 = bridge_to_it6162(bridge);
> +	struct drm_crtc_state *crtc_state;
> +	struct drm_connector_state *conn_state;
> +	struct drm_display_mode *mode;
> +	struct drm_connector *connector;
> +	struct videomode vm;
> +	struct hdmi_avi_infoframe avi_info;
> +	int ret;
> +
> +	drm_dbg(it6162->drm, "it6162_bridge_atomic_enable");
> +	connector = drm_atomic_get_new_connector_for_encoder(state,
> +							     bridge->encoder);
> +
> +	if (!connector)
> +		return;
> +
> +	it6162->connector = *connector;

Oh... No you can't just do that. If you need to store the connector,
store the pointer. But in most cases you don't need it.

> +
> +	conn_state = drm_atomic_get_new_connector_state(state, connector);
> +	crtc_state = drm_atomic_get_new_crtc_state(state, conn_state->crtc);
> +	mode = &crtc_state->mode;
> +
> +	it6162->is_hdmi = connector->display_info.is_hdmi;
> +	it6162->has_audio = connector->display_info.has_audio;
> +
> +	drm_dbg(it6162->drm, "%s mode, monitor %ssupport audio",
> +		it6162->is_hdmi ? "HDMI" : "DVI",
> +		it6162->has_audio ? "" : "not ");

"monitor not support audio" is not a proper English.

> +
> +	if (it6162->is_hdmi) {
> +		ret = drm_hdmi_avi_infoframe_from_display_mode(&avi_info,
> +							       connector,
> +							       mode);

No, use DRM HDMI helpers. Also please implement at least HDMI
infoframes. Consider implementing SPD too.

> +		if (ret)
> +			drm_err(it6162->drm, "Failed to setup AVI infoframe: %d", ret);
> +	}
> +
> +	drm_display_mode_to_videomode(mode, &vm);

What for? Pass drm mode directly.

> +
> +	it6162_mipi_set_d2v_video_timing(it6162, &vm, &avi_info);

And if HDMI monitor is not detected, you are passing a pointer to the
random garbage from the stack.

> +
> +	it6162_tx_enable(it6162);
> +	it6162_mipi_enable(it6162);
> +}
> +
> +static int it6162_bridge_atomic_check(struct drm_bridge *bridge,
> +				      struct drm_bridge_state *bridge_state,
> +				      struct drm_crtc_state *crtc_state,
> +				      struct drm_connector_state *conn_state)
> +{
> +	struct drm_display_mode *adj = &crtc_state->adjusted_mode;
> +	struct drm_display_mode *mode = &crtc_state->mode;
> +	struct videomode vm;
> +	struct it6162 *it6162 = bridge_to_it6162(bridge);
> +	u32 hfp, hsw, hbp;
> +	u32 clock;
> +	u32 hfp_check;
> +
> +	drm_display_mode_to_videomode(mode, &vm);

Why do you need to do it? Drop and use the DRM mode directly.

> +	clock = vm.pixelclock / 1000;
> +
> +	hfp = vm.hfront_porch;
> +	hsw = vm.hsync_len;
> +	hbp = vm.hback_porch;
> +
> +	hfp_check = DIV_ROUND_UP(65 * clock, 1000000) + 4;
> +	if (hfp >= hfp_check)
> +		return 0;
> +
> +	drm_dbg(it6162->drm, "hfp_check %d", hfp_check);
> +	if (hbp > hfp_check - hfp) {
> +		adj->hsync_start = adj->hdisplay + hfp_check;
> +		adj->hsync_end = adj->hsync_start + hsw;
> +	}
> +
> +	return 0;
> +}
> +
> +static void it6162_bridge_atomic_disable(struct drm_bridge *bridge,
> +					 struct drm_atomic_state *state)
> +{
> +	struct it6162 *it6162 = bridge_to_it6162(bridge);
> +
> +	drm_dbg(it6162->drm, "it6162_bridge_atomic_disable");
> +	it6162_tx_disable(it6162);
> +	it6162_mipi_disable(it6162);
> +}
> +
> +static const struct drm_edid
> +		*it6162_bridge_read_edid(struct drm_bridge *bridge,
> +					 struct drm_connector *connector)
> +{
> +	struct it6162 *it6162 = bridge_to_it6162(bridge);
> +	const struct drm_edid *edid;
> +
> +	drm_dbg(it6162->drm, "it6162_bridge_read_edid");
> +	edid = drm_edid_read_custom(connector, it6162_get_edid_block, it6162);
> +	if (!edid) {
> +		drm_err(it6162->drm, "failed to read EDID");
> +		return 0;
> +	}
> +
> +	return edid;
> +}
> +
> +static int it6162_bridge_hdmi_audio_prepare(struct drm_bridge *bridge,
> +					    struct drm_connector *connector,
> +					    struct hdmi_codec_daifmt *fmt,
> +					    struct hdmi_codec_params *params)
> +{
> +	struct it6162 *it6162 = bridge_to_it6162(bridge);
> +
> +	it6162_audio_update_hw_params(it6162, fmt, params);

The order of calls is wrong. audio_startup() is called before
audio_prepare(). So move it6162_enable_audio() here and drop the
struct it6162_audio. Instead you can program params directly, without
interim storage.

> +
> +	return drm_atomic_helper_connector_hdmi_update_audio_infoframe(connector,
> +								       &params->cea);

You are calling this helper, but you have not provided the infoframe
handling functions.

> +}
> +
> +static int it6162_bridge_hdmi_audio_startup(struct drm_bridge *bridge,
> +					    struct drm_connector *connector)
> +{
> +	struct it6162 *it6162 = bridge_to_it6162(bridge);
> +
> +	it6162_enable_audio(it6162);
> +	return 0;
> +}
> +
> +static void it6162_bridge_hdmi_audio_shutdown(struct drm_bridge *bridge,
> +					      struct drm_connector *connector)
> +{
> +	struct it6162 *it6162 = bridge_to_it6162(bridge);
> +
> +	it6162_disable_audio(it6162);
> +}
> +
> +static const struct drm_bridge_funcs it6162_bridge_funcs = {
> +	.attach = it6162_bridge_attach,
> +	.mode_valid = it6162_bridge_mode_valid,
> +	.detect = it6162_bridge_detect,
> +	.hpd_enable = it6162_bridge_hpd_enable,
> +	.hpd_disable = it6162_bridge_hpd_disable,
> +
> +	.atomic_enable = it6162_bridge_atomic_enable,
> +	.atomic_disable = it6162_bridge_atomic_disable,
> +	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
> +	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
> +	.atomic_reset = drm_atomic_helper_bridge_reset,
> +	.atomic_check = it6162_bridge_atomic_check,
> +
> +	.edid_read = it6162_bridge_read_edid,
> +
> +	.hdmi_audio_prepare = it6162_bridge_hdmi_audio_prepare,
> +	.hdmi_audio_startup = it6162_bridge_hdmi_audio_startup,
> +	.hdmi_audio_shutdown = it6162_bridge_hdmi_audio_shutdown,
> +};
> +
> +static int it6162_probe(struct i2c_client *client)
> +{
> +	struct device *dev = &client->dev;
> +	struct device_node *np = dev->of_node;
> +	struct it6162 *it6162;
> +	int ret;
> +
> +	it6162 = devm_drm_bridge_alloc(dev, struct it6162, bridge,
> +				       &it6162_bridge_funcs);
> +	if (IS_ERR(it6162))
> +		return PTR_ERR(it6162);
> +
> +	it6162->dev = dev;
> +
> +	ret = it6162_of_get_dsi_host(it6162);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = it6162_i2c_regmap_init(client, it6162);
> +	if (ret != 0)
> +		return ret;
> +
> +	ret = it6162_init_pdata(it6162);
> +	if (ret) {
> +		dev_err(dev, "Failed to initialize pdata: %d", ret);
> +		return ret;
> +	}
> +
> +	it6162_config_default(it6162);
> +	it6162_parse_dt(it6162);
> +
> +	if (it6162_detect_devices(it6162) < 0)
> +		return -ENODEV;
> +
> +	if (!client->irq) {
> +		dev_err(dev, "Failed to get INTP IRQ");
> +		return -ENODEV;
> +	}
> +
> +	ret = devm_request_threaded_irq(&client->dev, client->irq, NULL,
> +					it6162_int_threaded_handler,
> +					IRQF_TRIGGER_LOW | IRQF_ONESHOT |
> +					IRQF_NO_AUTOEN,
> +					"it6162-intp", it6162);
> +	if (ret) {
> +		dev_err(dev, "Failed to request INTP threaded IRQ: %d", ret);
> +		return ret;
> +	}
> +
> +	INIT_DELAYED_WORK(&it6162->hdcp_work, it6162_hdcp_work);
> +
> +	mutex_init(&it6162->lock);
> +
> +	it6162->bridge.of_node = np;
> +	it6162->bridge.ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID |
> +			     DRM_BRIDGE_OP_MODES;
> +
> +	it6162->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
> +
> +	it6162->bridge.vendor = "ITE";
> +	it6162->bridge.product = "IT6162";
> +
> +	if (it6162->support_audio) {
> +		/* enable audio support */
> +		it6162->bridge.ops |= DRM_BRIDGE_OP_HDMI_AUDIO;
> +		it6162->bridge.hdmi_audio_dev = dev;
> +		it6162->bridge.hdmi_audio_max_i2s_playback_channels = 8;
> +		it6162->bridge.hdmi_audio_dai_port = 2;
> +	}
> +
> +	devm_drm_bridge_add(dev, &it6162->bridge);
> +
> +	return it6162_attach_dsi(it6162);
> +}
> +
> +static void it6162_remove(struct i2c_client *client)
> +{
> +	struct it6162 *it6162 = i2c_get_clientdata(client);
> +
> +	disable_irq(client->irq);
> +	cancel_delayed_work_sync(&it6162->hdcp_work);
> +	mutex_destroy(&it6162->lock);
> +}
> +
> +static const struct it6162_chip_info it6162_chip_info = {
> +	.chip_id = 0x616200,
> +	.version = 0x006500,
> +};
> +
> +static const struct of_device_id it6162_dt_ids[] = {
> +	{ .compatible = "ite,it6162", .data = &it6162_chip_info},
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, it6162_dt_ids);
> +
> +static const struct i2c_device_id it6162_i2c_ids[] = {
> +	{ "it6162", 0 },
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(i2c, it6162_i2c_ids);
> +
> +static struct i2c_driver it6162_driver = {
> +	.driver = {
> +		.name = "it6162",
> +		.of_match_table = it6162_dt_ids,
> +	},
> +	.probe = it6162_probe,
> +	.remove = it6162_remove,
> +	.id_table = it6162_i2c_ids,
> +};
> +
> +module_i2c_driver(it6162_driver);
> +
> +MODULE_AUTHOR("Pet Weng <pet.weng@ite.com.tw>");
> +MODULE_AUTHOR("Hermes Wu <Hermes.Wu@ite.com.tw>");
> +MODULE_DESCRIPTION("it6162 mipi to hdmi driver");
> +MODULE_LICENSE("GPL");
> 
> -- 
> 2.34.1
> 
> 

-- 
With best wishes
Dmitry
