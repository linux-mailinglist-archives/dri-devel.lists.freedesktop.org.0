Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12D21B2BEDA
	for <lists+dri-devel@lfdr.de>; Tue, 19 Aug 2025 12:26:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDAC110E2A9;
	Tue, 19 Aug 2025 10:26:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="P5JhTto1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D83910E2A9
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 10:26:50 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57J90Yjs030348
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 10:26:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=xE7uyuKMxcBKXrxBsPxzQapw
 O+ECMi8oJU47VWU7q9s=; b=P5JhTto1xhp44zXtePfv1MxuWSA7GDZeyRAh9H99
 d8YaN16ENMVeKyPX4BCiLUQgM/LGzLSMHOCijpe/nLqx7t/reYdmHtXOwgpRW9my
 Zt8Fwb0hceJ52FoDU0RtgTXI90REIKYY58AldirlRofk7rsHlXce4euXEIvdrJ/v
 yIPXR2hiFEvKveEyRzbV12WXhvyPSQJ5MSbWCk3DhOhUTHwkdT6B9X7EJj4sbNkm
 6ApxW38pwEm7O+zXLt49RBrYTqwXLx1NpZPtu6o7Fs1j0ncc3WNnK3XzrhIgZFiG
 48oykR00n9OMD5JRRzcNmQNPWc1mVU8pvuBrFJNuOkDCfQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48kyunvd1y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 10:26:49 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4b1098f924bso155120511cf.0
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 03:26:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755599208; x=1756204008;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xE7uyuKMxcBKXrxBsPxzQapwO+ECMi8oJU47VWU7q9s=;
 b=OkvLO40zd1j6cByoWcZGUF8yzW+Age6TyFcJhdgygWo7FvOPVTaiRrgh7O24mlh5eG
 rYxkTUyfVGKEja6bg82ovNdI3DXWkRttfvVycNgKzkipYmGf55Qi7eoL/8IeTDlTu/1F
 pWcA2kAO2egy0+ybXjqUBCJX1BC9dh3136irAITDdrAouQSP7+kKVujY6M+6JgW9FKPB
 NxiAmRuoU7c8sxpMc/lHNSsATeYx4Dr9Hsczjrlk2iVT0b+eEH6FYSP1D+DaL9EWAGKj
 zfVwTq1uhJLrQdGP54pJoGa4d7xKrgZHvb+TlC+Xi6hMx3nc079fd6fvURmBemUgCDk6
 QfYQ==
X-Gm-Message-State: AOJu0Yxd7+tGUZJpqkLNHIdABqJOd9oLjycF3g7jFMreq9uLwOTE97Oe
 +K4NLRMB6cWV/UN/ChAGxNCoay28lpePblPPm0iMAMYSuVq6YIT8NDvcKEypjhX3HRsdOEfk7n2
 FrzWbkLSV2R2J4vzhOGhUZtVriDue9YhF8vmn/u0jEeZkcXNw3JiLssLDRcwChqlwSvyA+fI=
X-Gm-Gg: ASbGncucbUiOvYnHPUvkWWunIlUkIGq/u8Fp5ehDbkg+bI6Qq/qOcE0hfWnu5su+1PF
 pr9EM1H3bIrZtuqo0Yfqx/0FpP/ohwM/av/NUNcGCBiRwZkoS5jUnV8JUE0wqTVeA+JZHCz5yvn
 jGzmuyhNEWhxGpSDCmNdU7YXkpgbRH0/C0AK2oQYTkmCkvkOMNjYpsxCOnufa9GlTAuC004Hxwp
 rTxg3BkMuqMupxbozqw4XCvglpAdlpWhx376HatHRjvJFw9BMdPPOHO3tg4D2z0YGSF2+2KEeYs
 /IlqCGSsDlK2UQ75HMDl2w2FCEym4YgSij/bxIOvpWTy0oX3AUf6+a/74KPvNSDyoPaTR8Br18f
 OgPtN9p896if2F+bjIW3QHTsW9eFSf1e+CLyX3qIfbR6Ygj/1spBe
X-Received: by 2002:ad4:5ca3:0:b0:707:4710:a551 with SMTP id
 6a1803df08f44-70c35d9c531mr18088946d6.46.1755599208058; 
 Tue, 19 Aug 2025 03:26:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEL+NwHdqESLr4H1zNqBf4L2J3X7OtnhGZV79//D9XbHk/5wVxx4ZjWe4bRnazONdoj9BEFlg==
X-Received: by 2002:ad4:5ca3:0:b0:707:4710:a551 with SMTP id
 6a1803df08f44-70c35d9c531mr18088626d6.46.1755599207207; 
 Tue, 19 Aug 2025 03:26:47 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3340a41e3cfsm22274001fa.6.2025.08.19.03.26.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Aug 2025 03:26:46 -0700 (PDT)
Date: Tue, 19 Aug 2025 13:26:44 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mike Looijmans <mike.looijmans@topic.nl>
Cc: dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>, 
 David Airlie <airlied@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] drm: bridge: Add TI tmds181 and sn65dp159 driver
Message-ID: <63xsz4p45hkz23z5hnqzyminrsr2s7m6u74csw244wmlaaihqa@4ib2opfe5l2v>
References: <20250812145256.135645-1-mike.looijmans@topic.nl>
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.6fffab14-bc0e-422f-81bd-f55176f1f6c8@emailsignatures365.codetwo.com>
 <20250812145256.135645-3-mike.looijmans@topic.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250812145256.135645-3-mike.looijmans@topic.nl>
X-Proofpoint-GUID: EB2UjCUeG9_akDC-kskdgHCqw4Yc_EkQ
X-Authority-Analysis: v=2.4 cv=N6UpF39B c=1 sm=1 tr=0 ts=68a45169 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=Z6EfDJrRAAAA:8 a=4mo8Gh65AAAA:8 a=2DNHKj4biBUlbhhL0xsA:9
 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22 a=GLvejNd0Yr38jcbvy3o4:22
 a=-TqyL22UkbLrTLSMRg8E:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE4MDA3MSBTYWx0ZWRfX2PDVXPOaP1nk
 K2oEFiL7GiwpRl062XCj3penXcPerTSVJ4qNJvnrzOYpFlSrxLJCBIuR6a8FA2WeET9s2QoKegW
 1hu4MabygD5KwTKphuOZS3dPcjkzglLWVrg8nkFNYoyCXLK4cLCXEYTf+0RhLEP7jCWVpkNS6aI
 pxpbmyuKJn7Z7iidqLPILJw3ncHB3b6SGHtuWFlzRaulQDCVEECorWwwcUJyoHlrRnOzf2ao4sv
 ql97Am6aLl+/TWpzEnaoiyeyiXCA2+o2yrF9ORwhiYw9vf9XE0/iMoNPcE17GtGkvtwckkRQD4Z
 F+a/9FZvCsNiNiMcC1cZipiTOKO4uxVa4EY4HCMNHO207P0sGxIGpOfzNbaUb0QwBgQWynmEPLv
 8IH5z64V
X-Proofpoint-ORIG-GUID: EB2UjCUeG9_akDC-kskdgHCqw4Yc_EkQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_01,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508180071
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

On Tue, Aug 12, 2025 at 04:51:35PM +0200, Mike Looijmans wrote:
> The tmds181 and sn65dp159 are "retimers" and hence can be considered
> HDMI-to-HDMI bridges. Typical usage is to convert the output of an
> FPGA into a valid HDMI signal, and it will typically be inserted
> between an encoder and hdmi-connector.
> 
> Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
> ---
> 
>  drivers/gpu/drm/bridge/Kconfig      |  11 +
>  drivers/gpu/drm/bridge/Makefile     |   1 +
>  drivers/gpu/drm/bridge/ti-tmds181.c | 512 ++++++++++++++++++++++++++++
>  3 files changed, 524 insertions(+)
>  create mode 100644 drivers/gpu/drm/bridge/ti-tmds181.c
> 
> diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
> index b9e0ca85226a..753177fc9b50 100644
> --- a/drivers/gpu/drm/bridge/Kconfig
> +++ b/drivers/gpu/drm/bridge/Kconfig
> @@ -430,6 +430,17 @@ config DRM_TI_SN65DSI86
>  	help
>  	  Texas Instruments SN65DSI86 DSI to eDP Bridge driver
>  
> +config DRM_TI_TMDS181
> +        tristate "TI TMDS181 and SN65DP159 HDMI retimer bridge driver"
> +	depends on OF
> +	select DRM_KMS_HELPER
> +	select REGMAP_I2C
> +	help
> +	  Enable this to support the TI TMDS181 and SN65DP159 HDMI retimers.
> +	  The SN65DP159 provides output into a cable (source) whereas the
> +	  TMDS181 is meant to forward a cable signal into a PCB (sink). Either
> +	  can be set up as source or sink though.
> +
>  config DRM_TI_TPD12S015
>  	tristate "TI TPD12S015 HDMI level shifter and ESD protection"
>  	depends on OF
> diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/Makefile
> index 245e8a27e3fc..f4b5089e903c 100644
> --- a/drivers/gpu/drm/bridge/Makefile
> +++ b/drivers/gpu/drm/bridge/Makefile
> @@ -39,6 +39,7 @@ obj-$(CONFIG_DRM_TI_SN65DSI83) += ti-sn65dsi83.o
>  obj-$(CONFIG_DRM_TI_SN65DSI86) += ti-sn65dsi86.o
>  obj-$(CONFIG_DRM_TI_TDP158) += ti-tdp158.o
>  obj-$(CONFIG_DRM_TI_TFP410) += ti-tfp410.o
> +obj-$(CONFIG_DRM_TI_TMDS181) += ti-tmds181.o
>  obj-$(CONFIG_DRM_TI_TPD12S015) += ti-tpd12s015.o
>  obj-$(CONFIG_DRM_NWL_MIPI_DSI) += nwl-dsi.o
>  obj-$(CONFIG_DRM_ITE_IT66121) += ite-it66121.o
> diff --git a/drivers/gpu/drm/bridge/ti-tmds181.c b/drivers/gpu/drm/bridge/ti-tmds181.c
> new file mode 100644
> index 000000000000..6fbbc13ddc10
> --- /dev/null
> +++ b/drivers/gpu/drm/bridge/ti-tmds181.c
> @@ -0,0 +1,512 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * TI tmds181 and sn65dp159 HDMI redriver and retimer chips
> + *
> + * Copyright (C) 2018 - 2025 Topic Embedded Products <www.topic.nl>
> + *
> + * based on code
> + * Copyright (C) 2007 Hans Verkuil
> + * Copyright (C) 2016, 2017 Leon Woestenberg <leon@sidebranch.com>
> + */
> +
> +#include <linux/module.h>
> +#include <linux/kernel.h>
> +#include <linux/i2c.h>
> +#include <linux/slab.h>
> +#include <linux/of.h>
> +#include <linux/regmap.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/delay.h>
> +
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_bridge.h>
> +#include <drm/drm_crtc.h>
> +#include <drm/drm_print.h>
> +#include <drm/drm_probe_helper.h>
> +
> +MODULE_DESCRIPTION("I2C device driver for DP159 and TMDS181 redriver/retimer");
> +MODULE_AUTHOR("Mike Looijmans");
> +MODULE_LICENSE("GPL");
> +
> +#define TMDS181_REG_ID		0
> +#define TMDS181_REG_REV		0x8
> +#define TMDS181_REG_CTRL9	0x9
> +/* Registers A and B have a volatile bit, but we don't use it, so cache is ok */
> +#define TMDS181_REG_CTRLA	0xA
> +#define TMDS181_REG_CTRLB	0xB
> +#define TMDS181_REG_CTRLC	0xC
> +#define TMDS181_REG_EQUALIZER	0xD
> +#define TMDS181_REG_EYESCAN	0xE

Usually it's recommended to use lowercase hex.

> +
> +enum tmds181_chip {
> +	tmds181,
> +	dp159,
> +};
> +
> +struct tmds181_data {
> +	struct i2c_client *client;
> +	struct regmap *regmap;
> +	struct drm_bridge *next_bridge;
> +	struct drm_bridge bridge;
> +	enum tmds181_chip chip;
> +};
> +

[...]

> +
> +static const char * const tmds181_modes[] = {
> +	"redriver",
> +	"auto1",
> +	"auto2",
> +	"retimer",
> +};
> +
> +static ssize_t mode_show(struct device *dev,
> +		struct device_attribute *attr, char *buf)
> +{
> +	struct tmds181_data *data = dev_get_drvdata(dev);
> +	const char *equalizer;
> +	u32 val;
> +	int ret;
> +
> +	ret = regmap_read(data->regmap, TMDS181_REG_CTRLA, &val);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (val & BIT(4)) {
> +		if (val & BIT(5))
> +			equalizer = "eq-adaptive";
> +		else
> +			equalizer = "eq-fixed";
> +	} else {
> +		equalizer = "eq-disabled";
> +	}
> +
> +	return scnprintf(buf, PAGE_SIZE, "%6s %s %s\n",
> +			(val & BIT(7)) ? "sink" : "source",
> +			tmds181_modes[val & 0x03],
> +			equalizer);
> +}
> +
> +static ssize_t mode_store(struct device *dev,
> +		struct device_attribute *attr, const char *buf, size_t len)
> +{
> +	struct tmds181_data *data = dev_get_drvdata(dev);
> +	u32 val;
> +	int ret;
> +	int i;
> +
> +	/* Strip trailing newline(s) for being user friendly */
> +	while (len && buf[len] == '\n')
> +		--len;
> +
> +	/* Need at least 4 actual characters */
> +	if (len < 4)
> +		return -EINVAL;
> +
> +	ret = regmap_read(data->regmap, TMDS181_REG_CTRLA, &val);
> +	if (ret < 0)
> +		return ret;
> +
> +	for (i = 0; i < ARRAY_SIZE(tmds181_modes); ++i) {
> +		if (strncmp(tmds181_modes[i], buf, len) == 0) {
> +			val &= ~0x03;
> +			val |= i;
> +			break;
> +		}
> +	}
> +
> +	if (strncmp("sink", buf, len) == 0)
> +		val |= BIT(7);
> +
> +	if (strncmp("source", buf, len) == 0)
> +		val &= ~BIT(7);
> +
> +	if (strncmp("eq-", buf, 3) == 0) {
> +		switch (buf[3]) {
> +		case 'a': /* adaptive */
> +			val |= BIT(4) | BIT(5);
> +			break;
> +		case 'f': /* fixed */
> +			val |= BIT(4);
> +			val &= ~BIT(5);
> +			break;
> +		case 'd': /* disable */
> +			val &= ~(BIT(4) | BIT(5));
> +			break;
> +		}
> +	}
> +
> +	/* Always set the "apply changes" bit */
> +	val |= BIT(2);
> +
> +	ret = regmap_write(data->regmap, TMDS181_REG_CTRLA, val);
> +	if (ret < 0)
> +		return ret;
> +
> +	return len;
> +}
> +
> +/* termination for HDMI TX: 0=off, 1=150..300, 3=75..150 ohms */
> +static ssize_t termination_show(struct device *dev,
> +		struct device_attribute *attr, char *buf)
> +{
> +	struct tmds181_data *data = dev_get_drvdata(dev);
> +	u32 val;
> +	int ret;
> +
> +	ret = regmap_read(data->regmap, TMDS181_REG_CTRLB, &val);
> +	if (ret < 0)
> +		return ret;
> +
> +	val >>= 3;
> +	val &= 0x03;
> +
> +	return scnprintf(buf, PAGE_SIZE, "%u\n", val);
> +}
> +
> +static ssize_t termination_store(struct device *dev,
> +		struct device_attribute *attr, const char *buf, size_t len)
> +{
> +	struct tmds181_data *data = dev_get_drvdata(dev);
> +	u32 val;
> +	unsigned long newval;
> +	int ret;
> +
> +	ret = regmap_read(data->regmap, TMDS181_REG_CTRLB, &val);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = kstrtoul((const char *) buf, 10, &newval);
> +	if (ret)
> +		return ret;
> +
> +	if (newval > 3)
> +		return -EINVAL;
> +
> +	val &= ~(0x03 << 3);
> +	val |= newval << 3;
> +
> +	ret = regmap_write(data->regmap, TMDS181_REG_CTRLB, val);
> +	if (ret < 0)
> +		return ret;
> +
> +	return len;
> +}
> +
> +static DEVICE_ATTR_RW(mode);
> +static DEVICE_ATTR_RW(termination);

Undocumented ABI. Why are they configured at runtime rather than through
the DT / fwnode?

> +
> +static struct attribute *tmds181_attrs[] = {
> +	&dev_attr_mode.attr,
> +	&dev_attr_termination.attr,
> +	NULL,
> +};
> +
> +static const struct attribute_group tmds181_attr_group = {
> +	.attrs = tmds181_attrs,
> +};
> +
> +static const u8 tmds181_id_tmds181[8] = "TMDS181 ";
> +static const u8 tmds181_id_dp159[8]   = "DP159   ";
> +
> +static int tmds181_check_id(struct tmds181_data *data)
> +{
> +	int ret;
> +	int retry;
> +	u8 buffer[8];
> +
> +	for (retry = 0; retry < 20; ++retry) {
> +		ret = regmap_bulk_read(data->regmap, TMDS181_REG_ID, buffer,
> +				       sizeof(buffer));
> +		if (!ret)
> +			break;
> +
> +		/* Compensate for very long OE power-up delays due to the cap */
> +		usleep_range(5000, 10000);
> +	}
> +
> +	if (ret) {
> +		dev_err(&data->client->dev, "I2C read ID failed\n");
> +		return ret;
> +	}
> +
> +	if (memcmp(buffer, tmds181_id_tmds181, sizeof(buffer)) == 0) {
> +		dev_info(&data->client->dev, "Detected: TMDS181\n");
> +		data->chip = tmds181;
> +		return 0;
> +	}
> +
> +	if (memcmp(buffer, tmds181_id_dp159, sizeof(buffer)) == 0) {
> +		dev_info(&data->client->dev, "Detected: DP159\n");
> +		data->chip = dp159;
> +		return 0;
> +	}
> +
> +	dev_err(&data->client->dev, "Unknown or wrong ID: %*pE\n", (int)sizeof(buffer), buffer);
> +
> +	return -ENODEV;
> +}
> +
> +static bool tmds181_regmap_is_volatile(struct device *dev, unsigned int reg)
> +{
> +	switch (reg) {
> +	/* IBERT result and status registers, not used yet */
> +	case 0x15:
> +	case 0x17 ... 0x1F:
> +		return true;
> +	default:
> +		return false;
> +	}
> +}
> +
> +static const struct regmap_config tmds181_regmap_config = {
> +	.reg_bits = 8,
> +	.val_bits = 8,
> +	.cache_type = REGCACHE_RBTREE,
> +	.max_register = 0x20,
> +	.volatile_reg = tmds181_regmap_is_volatile,
> +};
> +
> +static int tmds181_probe(struct i2c_client *client)
> +{
> +	struct tmds181_data *data;
> +	struct gpio_desc *oe_gpio;
> +	int ret;
> +	u32 param;
> +	u8 val;
> +
> +	/* Check if the adapter supports the needed features */
> +	if (!i2c_check_functionality(client->adapter, I2C_FUNC_SMBUS_BYTE_DATA))
> +		return -EIO;
> +
> +	data = devm_kzalloc(&client->dev, sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	data->client = client;
> +	i2c_set_clientdata(client, data);
> +	data->regmap = devm_regmap_init_i2c(client, &tmds181_regmap_config);
> +	if (IS_ERR(data->regmap))
> +		return PTR_ERR(data->regmap);
> +
> +	/* The "OE" pin acts as a reset */
> +	oe_gpio = devm_gpiod_get_optional(&client->dev, "oe", GPIOD_OUT_LOW);
> +	if (IS_ERR(oe_gpio)) {
> +		ret = PTR_ERR(oe_gpio);
> +		if (ret != -EPROBE_DEFER)
> +			dev_err(&client->dev, "failed to acquire 'oe' gpio\n");
> +		return ret;
> +	}
> +	if (oe_gpio) {
> +		/* Need at least 100us reset pulse */
> +		usleep_range(100, 200);
> +		gpiod_set_value_cansleep(oe_gpio, 1);
> +	}
> +
> +	/* Reading the ID also provides enough time for the reset */
> +	ret = tmds181_check_id(data);
> +	if (ret)
> +		return ret;
> +
> +	/* We take care of power control, so disable the chips PM functions */
> +	/* SIG_EN=0 PD_EN=1 HPD_AUTO_PWRDWN_DISABLE=1 I2C_DR_CTL=0b11*/
> +	regmap_update_bits(data->regmap, TMDS181_REG_CTRL9, 0x1f, 0x0f);
> +
> +	/* Apply configuration changes */
> +	if (of_property_read_bool(client->dev.of_node, "source-mode"))

Undocumented DT properties. Please document them in DT bindings.

> +		regmap_update_bits(data->regmap,
> +				TMDS181_REG_CTRLA, BIT(7), 0);
> +	if (of_property_read_bool(client->dev.of_node, "sink-mode"))
> +		regmap_update_bits(data->regmap,
> +				TMDS181_REG_CTRLA, BIT(7), BIT(7));
> +	if (of_property_read_bool(client->dev.of_node, "redriver-mode"))
> +		regmap_update_bits(data->regmap,
> +				TMDS181_REG_CTRLA, 0x03, 0x00);
> +	if (of_property_read_bool(client->dev.of_node, "retimer-mode"))
> +		regmap_update_bits(data->regmap,
> +				TMDS181_REG_CTRLA, 0x03, 0x03);
> +	if (of_property_read_bool(client->dev.of_node, "adaptive-equalizer"))
> +		regmap_update_bits(data->regmap,
> +			TMDS181_REG_CTRLA, BIT(4) | BIT(5), BIT(4) | BIT(5));
> +	if (of_property_read_bool(client->dev.of_node, "disable-equalizer"))
> +		regmap_update_bits(data->regmap, TMDS181_REG_CTRLA, BIT(4), 0);
> +
> +	switch (data->chip) {
> +	case dp159:
> +		/*  SLEW=0b00 Mode=HDMI DDC_TRAIN_SET=1 */
> +		val = BIT(0);
> +		/* Default slew rate is max */
> +		param = 3;
> +		if (!of_property_read_u32(client->dev.of_node,
> +					"slew-rate", &param)) {
> +			if (param > 3) {
> +				dev_err(&client->dev, "invalid slew-rate\n");
> +				return -EINVAL;
> +			}
> +			/* Implement 0 = slow, 3 = fast slew rate */
> +			val = (3 - param) << 6;
> +		}
> +		if (of_property_read_bool(client->dev.of_node, "dvi-mode"))
> +			val |= BIT(5);
> +		break;
> +	default:
> +		/* DDC_DR_SEL=1 DDC_TRAIN_SETDISABLE=1 */
> +		val = BIT(2) | BIT(0);
> +		break;
> +	}
> +
> +	/* termination for HDMI TX: 0=off, 1=150..300, 3=75..150 ohms */
> +	if (!of_property_read_u32(client->dev.of_node, "termination", &param))
> +		val |= ((param & 0x3) << 3);
> +
> +	ret = regmap_write(data->regmap, TMDS181_REG_CTRLB, val);
> +	if (ret < 0) {
> +		dev_err(&client->dev, "regmap_write(B) failed\n");
> +		return ret;
> +	}
> +
> +	val = 0; /* Default for C register */
> +	if (!of_property_read_u32(client->dev.of_node, "vswing-data", &param))
> +		val |= (param << 5);
> +	if (!of_property_read_u32(client->dev.of_node, "vswing-clk", &param))
> +		val |= (param << 2);
> +	/* Datasheet recommends HDMI_TWPST=0b01 for HDMI compliance */
> +	if (of_property_read_bool(client->dev.of_node, "enable-de-emphasis"))
> +		val |= 0x01;
> +	ret = regmap_write(data->regmap, TMDS181_REG_CTRLC, val);
> +	if (ret < 0) {
> +		dev_err(&client->dev, "regmap_write(C) failed\n");
> +		return ret;
> +	}
> +
> +	/* DIS_HDMI2_SWG: HDMI 1.x only, keep clock at full rate */
> +	val = BIT(0);
> +	if (!of_property_read_u32(client->dev.of_node, "eq-data", &param)) {
> +		val |= (param << 3);
> +		/* If defined, also force the "fixed" equalizer mode */
> +		regmap_update_bits(data->regmap, TMDS181_REG_CTRLA, BIT(5), 0);
> +	}
> +	if (!of_property_read_u32(client->dev.of_node, "eq-clk", &param)) {
> +		val |= (param << 1);
> +		regmap_update_bits(data->regmap, TMDS181_REG_CTRLA, BIT(5), 0);
> +	}
> +	ret = regmap_write(data->regmap, TMDS181_REG_EQUALIZER, val);
> +	if (ret < 0) {
> +		dev_err(&client->dev, "regmap_write(EQUALIZER) failed\n");
> +		return ret;
> +	}
> +
> +	ret = tmds181_apply_changes(data);
> +	if (ret < 0) {
> +		dev_err(&client->dev, "tmds181_apply_changes failed\n");
> +		return ret;
> +	}
> +
> +	ret = sysfs_create_group(&client->dev.kobj, &tmds181_attr_group);
> +	if (ret)
> +		dev_err(&client->dev, "sysfs_create_group error: %d\n", ret);
> +
> +	/* Find next bridge in chain */
> +	data->next_bridge = devm_drm_of_get_bridge(&client->dev, client->dev.of_node, 1, 0);
> +	if (IS_ERR(data->next_bridge))
> +		return dev_err_probe(&client->dev, PTR_ERR(data->next_bridge),
> +				     "Failed to find next bridge\n");
> +
> +	/* Register the bridge. */
> +	data->bridge.funcs = &tmds181_bridge_funcs;
> +	data->bridge.of_node = client->dev.of_node;
> +
> +	return devm_drm_bridge_add(&client->dev, &data->bridge);
> +}
> +
> +static const struct i2c_device_id tmds181_id[] = {
> +	{ "tmds181", tmds181 },
> +	{ "sn65dp159", dp159 },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(i2c, tmds181_id);
> +
> +#if IS_ENABLED(CONFIG_OF)
> +static const struct of_device_id tmds181_of_match[] = {
> +	{ .compatible = "ti,tmds181", },
> +	{ .compatible = "ti,sn65dp159", },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, tmds181_of_match);
> +#endif
> +
> +static struct i2c_driver tmds181_driver = {
> +	.driver = {
> +		.owner = THIS_MODULE,
> +		.name	= "tmds181",
> +		.of_match_table = of_match_ptr(tmds181_of_match),
> +	},
> +	.probe		= tmds181_probe,
> +	.id_table	= tmds181_id,
> +};
> +
> +module_i2c_driver(tmds181_driver);
> -- 
> 2.43.0
> 
> 
> Met vriendelijke groet / kind regards,
> 
> Mike Looijmans
> System Expert
> 
> 
> TOPIC Embedded Products B.V.
> Materiaalweg 4, 5681 RJ Best
> The Netherlands
> 
> T: +31 (0) 499 33 69 69
> E: mike.looijmans@topic.nl
> W: www.topic.nl
> 
> Please consider the environment before printing this e-mail

-- 
With best wishes
Dmitry
