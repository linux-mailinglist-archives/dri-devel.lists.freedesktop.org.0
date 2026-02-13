Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KO7xKVFoj2lHQwEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 19:07:13 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13370138CFA
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 19:07:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E585D10E83E;
	Fri, 13 Feb 2026 18:07:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="oHG/B6Tr";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S8XK/LwR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C085810E83E
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Feb 2026 18:07:08 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61DHRE823797012
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Feb 2026 18:07:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=juCPHRGtn8d9yraSrdzmynq9
 tmNMvO7V3Lxbw8+gznI=; b=oHG/B6TrA5NIyAIFJJgQHZLcc5U81qaxsmBVv2Zf
 pzJyTIXB440UgKDkZiM+Hq7eKIv5ko03m5fYMEDnJBE0WD1wNUZuJu19aiSu35b8
 JjhEJlZ1CWuC3fJVe5hPfDT/1o1BrpfGZkYW9Sic/5dAIXNl/V9pxwFUTdQV4Rd4
 vByHkmHp5PKBsJZBzubhb5CwXGrsTYv9tDUvKPJOZ4vqXClahaqOxk401O7ECyru
 d3td1DebuCBMmyMZWFpkm6m0vAonAahvLt/I7HkcxRfveUTqM6WvkkUpOEzuX2TV
 uJ9DyG7J4rXWVOdIKsFIsrP0rCW5vBR/mie+Pv+KDvyQDw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ca8ca84dt-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Feb 2026 18:07:07 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8cb42f56c4aso339504585a.3
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Feb 2026 10:07:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1771006027; x=1771610827;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=juCPHRGtn8d9yraSrdzmynq9tmNMvO7V3Lxbw8+gznI=;
 b=S8XK/LwRSNrcwZlIlzueIFfn2yycY1Whjcn7RAQmBfqrUHmanSoeuv6aPyVcDf2l19
 2rxe1tMzbOWs0AWrnON/tBt4n1yO8WdLbO06bKlvvXkwLMKndDdB8IqInPHLcAGKyCiM
 orFd+W+qbE5O3EO3snJeujsDXt/LeGQgAokLYqbM6IuNmB+5x/7o/txUiqO660JEvf05
 NlnGMBsHk0tceexuQ7HNRqYjwMZw+LNlowYjSxHGdyhLTDiBgf3tD/N8Lyt674elrMae
 9fWKDL2wz+5Gjsu4YSGcjNwA0V8vLkyfp5evgaFjtfSd89fIFwB9aA7ZGm/iAsN+DTKK
 YfVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771006027; x=1771610827;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=juCPHRGtn8d9yraSrdzmynq9tmNMvO7V3Lxbw8+gznI=;
 b=XxsPUfs5ebBv0s5D5zv60cX+P1PVKJiW7RBHrfsKMhsNnwQy/zqbgPuRzuuevRb+Y7
 pRSBdjnE8nySNOoC2b3i0iq3tFkTDQVyDWKC3UMosj7VbgILNXioGuxDUt3UGFoJuEXY
 s7uOLeWCsNNikh8lTJR4lip6BQsEI6iWGdX+HlHHU07g8DRHQn+E7PFv+HJ2+Mg1FD6z
 TcO/OMRXTghuOk9OgiY7R8PwMlajnJ7JVMQHZvb6IatGLmBKoHfA/DYsyfjQIbLYr5+W
 x5r9M+dVE7rp+Ss/xocju22vl9e0YXzrwJcF4GfWgaY4R2+7B8ls4PmVlHUfAW+L2Rxq
 yk4w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXdujYXDvoPTntTjOvuI8FraWYEaFDBUxgERJmU9HLSbhE8J0P2C+Rk3BVA8AmfwYk8NBouB+0Wm80=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyzBxbrn9iUNkSJdOtqZqcDn3yCWsewDrPT7i3w7iNEo6f+H+08
 zmz+ePEAEpp/ISzKsImpFXz2uBw/jWmNctalWsOsu9aay/g0KM/0ybsmqNDNpWAciCpBW3HNoVz
 m9jnpcsOL9lYlAuQc9LqYW1iH25jBnca80wpxbdRsATIKjlZq4GOjf5fVTsTfJfWPS9Ohc00=
X-Gm-Gg: AZuq6aKh8uvzzA03Bo3gqERNhCZezFu4s7LfQO6CdlhqgJNa+i2Fp/CaT0ayNYlHA7F
 joaYo9pPFTyheZGVNlG5o2soAnwYaG0qCfTt38Ku4Cj9BeAyxrvXGbfoDFy4MN4568VxAKgX3hY
 5VY/6TEMNC490mFYsSB+DcdSgZVqe4O4pUS0b10EjgiEdKcICIQWrIEUvSFjS3rP9YwuG2Ro8YB
 gQN3FbTe0l5rlp12X4ahEibHzswy1xskmBvcdH1B+l5Qyrvy3WZ5IJS2/94xVIguKD/pGP687UO
 XyPWQmzpAxlnHw/W/KkINYDS2yvskkBm1+ngPzpn+xpt9mIsIa76m43LFyaAiHi0VACg1tGQhJU
 ImKRdam595/hzIeL6GBUVULTl/I7yYTrzWULb7fWBe7pUqTPj0qMDgHszjl7JMp9tyIYUEAZ6CR
 74QLql0SW4BNs/wzadIgw6ZR7d/mTHg5wtELU=
X-Received: by 2002:a05:620a:290c:b0:8b2:ea5a:4149 with SMTP id
 af79cd13be357-8cb4248158dmr348959285a.65.1771006027033; 
 Fri, 13 Feb 2026 10:07:07 -0800 (PST)
X-Received: by 2002:a05:620a:290c:b0:8b2:ea5a:4149 with SMTP id
 af79cd13be357-8cb4248158dmr348954485a.65.1771006026519; 
 Fri, 13 Feb 2026 10:07:06 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59e5f56306esm1695901e87.16.2026.02.13.10.07.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Feb 2026 10:07:04 -0800 (PST)
Date: Fri, 13 Feb 2026 20:07:02 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Richard Acayan <mailingradian@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 yifei@zhan.science
Subject: Re: [PATCH 3/6] drm/panel: Add Novatek/Tianma NT37700F panel
Message-ID: <gpkuq7b6mae5ib2xvphmir66pb6ysexhhfqkorve5zewkj4ofc@ryccazsoxqm7>
References: <20260210023300.15785-1-mailingradian@gmail.com>
 <20260210023300.15785-4-mailingradian@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260210023300.15785-4-mailingradian@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEzMDEzOSBTYWx0ZWRfX+SouYi37Zyah
 /U/We2jfFV/nj3HrjTnJQZJ+3wk1Y5XBWt6RwNuNB/TVBz6g2H9QvseP5qDT93HsRAuvi4+Hfys
 bRzv5J1inSUALgQpPv9BvUMaHLdGVSn/vKq42QBROCRHHli50qtJDlvkuZn7BsEdsWVStNuQn5u
 JGVggmqwE1apZmv05ruaKSQEuWwshah3O/9D6UtQyq2iHLWbZrh3//uqvncWn6UWZVZKgD/Kle/
 DkDgnBHB+XQTOhBFS0D6v5Sjc83ILMKX/qJDJwuMnyG9aUP2UI5OPkvRTHaKKe+SUhIBHLSc3cV
 wzyu2/mARolzSOCdOwRYNLmRA+lPjKllF9WvZZ3E0OOCs8yP2E8JXbXcVOHB2GrKNYVf7Sazp3t
 gCAF076VdswnzjRlvXWOolr8Xu3kJ8N+eeOE1fp20t65tvnx3PVzuI0FZrvMbAonswctt9GH1wZ
 S+4jqLIyxsJveuD6fVA==
X-Authority-Analysis: v=2.4 cv=CZEFJbrl c=1 sm=1 tr=0 ts=698f684b cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=NEAV23lmAAAA:8
 a=pGLkceISAAAA:8 a=p7dDDWI-mmMNy6hFEsAA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: JmCPOoiuVWqIpO2zpkh_r3PR9xmh5XG0
X-Proofpoint-ORIG-GUID: JmCPOoiuVWqIpO2zpkh_r3PR9xmh5XG0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-13_03,2026-02-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 phishscore=0 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602130139
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
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mailingradian@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:neil.armstrong@linaro.org,m:jesszhan0024@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:thierry.reding@gmail.com,m:sam@ravnborg.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:yifei@zhan.science,m:krzk@kernel.org,m:conor@kernel.org,m:thierryreding@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,gmail.com,linux.intel.com,suse.de,ffwll.ch,ravnborg.org,vger.kernel.org,lists.freedesktop.org,zhan.science];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:dkim]
X-Rspamd-Queue-Id: 13370138CFA
X-Rspamd-Action: no action

On Mon, Feb 09, 2026 at 09:32:57PM -0500, Richard Acayan wrote:
> Some Pixel 3a XL devices have a Tianma panel. Add support for it, with
> the aid of linux-mdss-dsi-panel-driver-generator.
> 
> Link: https://github.com/msm8916-mainline/linux-mdss-dsi-panel-driver-generator
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---
>  drivers/gpu/drm/panel/Kconfig                 |   9 +
>  drivers/gpu/drm/panel/Makefile                |   1 +
>  .../gpu/drm/panel/panel-novatek-nt37700f.c    | 294 ++++++++++++++++++
>  3 files changed, 304 insertions(+)
>  create mode 100644 drivers/gpu/drm/panel/panel-novatek-nt37700f.c
> 
> diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
> index 76f6af819037..138d617e8195 100644
> --- a/drivers/gpu/drm/panel/Kconfig
> +++ b/drivers/gpu/drm/panel/Kconfig
> @@ -553,6 +553,15 @@ config DRM_PANEL_NOVATEK_NT36672E
>  	  LCD panel module. The panel has a resolution of 1080x2408 and uses 24 bit
>  	  RGB per pixel.
>  
> +config DRM_PANEL_NOVATEK_NT37700F
> +	tristate "Novatek NT37700F DSI panel"
> +	depends on OF
> +	depends on DRM_MIPI_DSI
> +	depends on BACKLIGHT_CLASS_DEVICE
> +	help
> +	  Say Y here if you want to enable support for Novatek NT37700F DSI
> +	  panel module. The panel has a resolution of 1080x2160.
> +
>  config DRM_PANEL_NOVATEK_NT37801
>  	tristate "Novatek NT37801/NT37810 AMOLED DSI panel"
>  	depends on OF
> diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
> index b9562a6fdcb3..9218a7d7ff34 100644
> --- a/drivers/gpu/drm/panel/Makefile
> +++ b/drivers/gpu/drm/panel/Makefile
> @@ -54,6 +54,7 @@ obj-$(CONFIG_DRM_PANEL_NOVATEK_NT35950) += panel-novatek-nt35950.o
>  obj-$(CONFIG_DRM_PANEL_NOVATEK_NT36523) += panel-novatek-nt36523.o
>  obj-$(CONFIG_DRM_PANEL_NOVATEK_NT36672A) += panel-novatek-nt36672a.o
>  obj-$(CONFIG_DRM_PANEL_NOVATEK_NT36672E) += panel-novatek-nt36672e.o
> +obj-$(CONFIG_DRM_PANEL_NOVATEK_NT37700F) += panel-novatek-nt37700f.o
>  obj-$(CONFIG_DRM_PANEL_NOVATEK_NT37801) += panel-novatek-nt37801.o
>  obj-$(CONFIG_DRM_PANEL_NOVATEK_NT39016) += panel-novatek-nt39016.o
>  obj-$(CONFIG_DRM_PANEL_MANTIX_MLAF057WE51) += panel-mantix-mlaf057we51.o
> diff --git a/drivers/gpu/drm/panel/panel-novatek-nt37700f.c b/drivers/gpu/drm/panel/panel-novatek-nt37700f.c
> new file mode 100644
> index 000000000000..491f1f30ce41
> --- /dev/null
> +++ b/drivers/gpu/drm/panel/panel-novatek-nt37700f.c
> @@ -0,0 +1,294 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2024, The Linux Foundation. All rights reserved.
> + * Generated with linux-mdss-dsi-panel-driver-generator from vendor device tree:
> + *   Copyright (c) 2013, The Linux Foundation. All rights reserved.
> + */
> +
> +#include <linux/backlight.h>
> +#include <linux/delay.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +
> +#include <video/mipi_display.h>
> +
> +#include <drm/drm_mipi_dsi.h>
> +#include <drm/drm_modes.h>
> +#include <drm/drm_panel.h>
> +#include <drm/drm_probe_helper.h>
> +
> +struct nt37700f_tianma {
> +	struct drm_panel panel;
> +	struct mipi_dsi_device *dsi;
> +	struct gpio_desc *reset_gpio;
> +};
> +
> +static inline
> +struct nt37700f_tianma *to_nt37700f_tianma(struct drm_panel *panel)
> +{
> +	return container_of(panel, struct nt37700f_tianma, panel);
> +}
> +
> +static void nt37700f_tianma_reset(struct nt37700f_tianma *ctx)
> +{
> +	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
> +	usleep_range(1000, 2000);
> +	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
> +	usleep_range(10000, 11000);
> +}
> +
> +static int nt37700f_tianma_on(struct nt37700f_tianma *ctx)
> +{
> +	struct mipi_dsi_device *dsi = ctx->dsi;
> +	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
> +
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf0, 0x55, 0xaa, 0x52, 0x08, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xc0, 0x56);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xca, 0x52);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x06);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb5, 0x2b, 0x1a);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf0, 0x55, 0xaa, 0x52, 0x08, 0x01);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xcd, 0x04, 0x82);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf0, 0x55, 0xaa, 0x52, 0x08, 0x02);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xcc, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xff, 0xaa, 0x55, 0xa5, 0x80);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x55);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf6, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x56);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf6, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xff, 0xaa, 0x55, 0xa5, 0x81);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x07);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf3, 0x07);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x05);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf3, 0x25);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x90, 0x01);
> +
> +	mipi_dsi_dcs_set_column_address_multi(&dsi_ctx, 0x0000, 0x0437);

1080 - 1

> +	mipi_dsi_dcs_set_page_address_multi(&dsi_ctx, 0x0000, 0x086f);

2160 - 1

> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_WRITE_CONTROL_DISPLAY, 0x20);
> +	mipi_dsi_dcs_set_tear_on_multi(&dsi_ctx, MIPI_DSI_DCS_TEAR_MODE_VBLANK);
> +
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf0, 0x55, 0xaa, 0x52, 0x08, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xc0, 0x56);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf0, 0x55, 0xaa, 0x52, 0x08, 0x02);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xcd, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf0, 0x55, 0xaa, 0x52, 0x08, 0x04);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xd0, 0x11, 0x64);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x09);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb1, 0x20);
> +
> +	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
> +	mipi_dsi_msleep(&dsi_ctx, 120);
> +	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
> +
> +	return dsi_ctx.accum_err;
> +}
> +
> +static int nt37700f_tianma_disable(struct drm_panel *panel)
> +{
> +	struct nt37700f_tianma *ctx = to_nt37700f_tianma(panel);
> +	struct mipi_dsi_device *dsi = ctx->dsi;
> +	struct device *dev = &dsi->dev;
> +	int ret;
> +
> +	ret = mipi_dsi_dcs_set_display_off(dsi);

Please use _multi helpers here too.

> +	if (ret < 0) {
> +		dev_err(dev, "Failed to set display off: %d\n", ret);
> +		return ret;
> +	}
> +	msleep(50);
> +
> +	ret = mipi_dsi_dcs_enter_sleep_mode(dsi);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to enter sleep mode: %d\n", ret);
> +		return ret;
> +	}
> +	msleep(100);
> +
> +	return 0;
> +}
> +
> +static int nt37700f_tianma_prepare(struct drm_panel *panel)
> +{
> +	struct nt37700f_tianma *ctx = to_nt37700f_tianma(panel);
> +	struct device *dev = &ctx->dsi->dev;
> +	int ret;
> +
> +	nt37700f_tianma_reset(ctx);
> +
> +	ret = nt37700f_tianma_on(ctx);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to initialize panel: %d\n", ret);
> +		gpiod_set_value_cansleep(ctx->reset_gpio, 1);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int nt37700f_tianma_unprepare(struct drm_panel *panel)
> +{
> +	struct nt37700f_tianma *ctx = to_nt37700f_tianma(panel);
> +
> +	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
> +
> +	return 0;
> +}
> +
> +static const struct drm_display_mode nt37700f_tianma_mode = {
> +	.clock = (1080 + 32 + 32 + 98) * (2160 + 32 + 4 + 98) * 60 / 1000,
> +	.hdisplay = 1080,
> +	.hsync_start = 1080 + 32,
> +	.hsync_end = 1080 + 32 + 32,
> +	.htotal = 1080 + 32 + 32 + 98,
> +	.vdisplay = 2160,
> +	.vsync_start = 2160 + 32,
> +	.vsync_end = 2160 + 32 + 4,
> +	.vtotal = 2160 + 32 + 4 + 98,
> +	.width_mm = 69,
> +	.height_mm = 137,
> +	.type = DRM_MODE_TYPE_DRIVER,
> +};
> +
> +static int nt37700f_tianma_get_modes(struct drm_panel *panel,
> +				     struct drm_connector *connector)
> +{
> +	return drm_connector_helper_get_modes_fixed(connector, &nt37700f_tianma_mode);
> +}
> +
> +static const struct drm_panel_funcs nt37700f_tianma_panel_funcs = {
> +	.prepare = nt37700f_tianma_prepare,
> +	.unprepare = nt37700f_tianma_unprepare,
> +	.disable = nt37700f_tianma_disable,
> +	.get_modes = nt37700f_tianma_get_modes,
> +};
> +
> +static int nt37700f_tianma_bl_update_status(struct backlight_device *bl)
> +{
> +	struct mipi_dsi_device *dsi = bl_get_data(bl);
> +	u16 brightness = backlight_get_brightness(bl);
> +	int ret;
> +
> +	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
> +
> +	ret = mipi_dsi_dcs_set_display_brightness_large(dsi, brightness);
> +	if (ret < 0)
> +		return ret;
> +
> +	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
> +
> +	return 0;
> +}
> +
> +// TODO: Check if /sys/class/backlight/.../actual_brightness actually returns
> +// correct values. If not, remove this function.

Any chance of checking it?

> +static int nt37700f_tianma_bl_get_brightness(struct backlight_device *bl)
> +{
> +	struct mipi_dsi_device *dsi = bl_get_data(bl);
> +	u16 brightness;
> +	int ret;
> +
> +	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
> +
> +	ret = mipi_dsi_dcs_get_display_brightness_large(dsi, &brightness);
> +	if (ret < 0)
> +		return ret;
> +
> +	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
> +
> +	return brightness;
> +}
> +

-- 
With best wishes
Dmitry
