Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68E9FA75B5D
	for <lists+dri-devel@lfdr.de>; Sun, 30 Mar 2025 19:22:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C19EC10E2E6;
	Sun, 30 Mar 2025 17:22:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="RJa85vAo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D6F310E2E6
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Mar 2025 17:22:22 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52U6BscU010297
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Mar 2025 17:22:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=MpstrBktHoiPo2cjbWcg5qOx
 X+BiuBgnPlKTlDTx9Zw=; b=RJa85vAoxvvC85w5M55/qcng0Svpd+QE0aSk+oim
 aKts9P03N7D24lfioMjfFQ/EtGHV8zxXdjTOQ0JOGD6tUiyKl6hJn7Td74q76Yjf
 DQ+pCWcelqvLdOaBwdKzFzufU584VNrmKNjVNejN62JA71gLXvIq+Id52PACV0P/
 5Y2XhNLQgYeDOrcHXMVS8BRsr/v9+Llk1lcyNISk550WeoD8ijdsAR52kQ8Vwbfl
 KWK9HSV7usavMjGWZF5KmspnQWGGQLnjm1MQd2QVt6pN+Rq9ij53y8HCVlo9ODLb
 45oVSG57gdba7Qcoq+KI2ViiS9MPK0YtqisWdbfUweQzeQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45p935thax-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Mar 2025 17:22:21 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7c5f7210995so226861885a.1
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Mar 2025 10:22:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743355340; x=1743960140;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MpstrBktHoiPo2cjbWcg5qOxX+BiuBgnPlKTlDTx9Zw=;
 b=Q+rx+Z1F0C9HW8zPWtbrqFOfesOHEX3NwwxDYaB3PnHcxUFZymXkp6mnA0m6qvsz/7
 UDV6JQr86hjtaFI77wYulIF0HJCwmHfJSDBZYPdAaGYB/RfSo9ytj53Vhpwkq1asuidA
 T5aKNnQr1/hrgjowzIhZb7pe8nvl7LjHn66klfkdsXk6gHwIfBARCJtSaIRVErg+f6f0
 JayXZ6qyEFLYV/j/9Ux4H2YnnVccw1cCB6STtzSNv8a7E3kvAZCzA6wUPagwHlXiwDji
 jyvscKOcA41AvAiBjJHo7Klt3Aao75n42mAPoSBd+693Atw/dYBpOI9PDKhVeN4QvbYt
 tlSQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX8E0lDKt/AwF7Dtn7ZxYI63FWj96f1SSJSUd74TP3OfVtS0X75rJLI3y6CWLZCh3Pqupc98nipW5I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy1CjTaulBiAYHfeJPc+WYKBhfqVfujywKu6/Xz/NO+RfL7ZVYW
 S6zH0f8hT7cjGjHjBqkN45Wv3q7Z2nKCdGOb8sqYpRAJAToXjYkCvq46cx5DbnSlD5WZc+WhFJm
 cHpJ8q0s7vhbOFE/PQUqEzpIjK3rL0k2GGFLIigqkrJ+JqF1bP/5YHrume+BEu2Xz35E=
X-Gm-Gg: ASbGncvZqVshDB8GpSyjw8HLArvVz7BOaaiXGUA9D7fTCRa5tcgC1HLOdR474vj2cuY
 MtYjad78etWVkeeVArPJGLQWh1WUpGQ29JDmEKEwERHGJZFcWIINC6pVQN22WLaGVQgrZ8W+UYR
 vvbmH95mOceq25CrjE7vM6pitbs3qLAG/n5t7UWkTa2bTHBbWi78hWTvoTBdWmEKchY8kCBEcBM
 iN3xQTyM51Ayr56oMq82BfeZ433ztvyGg3MOYqnsDiEzoIdrLD4KLpKmlphz1c3okiAvI2uWyUo
 ZYgojLhylDcNL1TcUtXUuYdUX4KHBjgjqVqR2NOW688XqogmAv6O/NoA9jR8m4ru4piYVdhFR5u
 Lkns=
X-Received: by 2002:a05:620a:2412:b0:7c3:c512:9b1a with SMTP id
 af79cd13be357-7c5f9bf8935mr1234069085a.22.1743355340527; 
 Sun, 30 Mar 2025 10:22:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFSoBC4dUGhh5eAY7d9B2uxFl1IY0/AMu+wvbdzmOGdBqnQEleuLNcum0aJAyOX+e7Wh6kjiw==
X-Received: by 2002:a05:620a:2412:b0:7c3:c512:9b1a with SMTP id
 af79cd13be357-7c5f9bf8935mr1234066585a.22.1743355340139; 
 Sun, 30 Mar 2025 10:22:20 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54b094c1a7asm931739e87.86.2025.03.30.10.22.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Mar 2025 10:22:18 -0700 (PDT)
Date: Sun, 30 Mar 2025 20:22:15 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Alexander Baransky <sanyapilot496@gmail.com>
Cc: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] drm/panel: Add Visionox G2647FB105 panel driver
Message-ID: <eni3k3dj5le52bjpi6m2yurepgnx5u2wijb2ds6vdivdj7vi4w@2stfkhhadvud>
References: <20250327163750.986815-1-sanyapilot496@gmail.com>
 <20250327163750.986815-3-sanyapilot496@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250327163750.986815-3-sanyapilot496@gmail.com>
X-Proofpoint-GUID: MGJUAc0W7k_iBg0cPIE2szg2pD4A0XcI
X-Authority-Analysis: v=2.4 cv=KOFaDEFo c=1 sm=1 tr=0 ts=67e97dcd cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Vs1iUdzkB0EA:10 a=pGLkceISAAAA:8 a=cT8Zqm98tluRgYDMnLUA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: MGJUAc0W7k_iBg0cPIE2szg2pD4A0XcI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-30_08,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0 spamscore=0
 phishscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503300121
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

On Thu, Mar 27, 2025 at 07:37:45PM +0300, Alexander Baransky wrote:
> Add the driver for Visionox G2647FB105 6.47" FHD Plus CMD mode AMOLED panel
> support found in:
> - Xiaomi Mi Note 10 / CC9 Pro (sm7150-xiaomi-tucana)
> - Xiaomi Mi Note 10 Lite (sm7150-xiaomi-toco)
> 
> Signed-off-by: Alexander Baransky <sanyapilot496@gmail.com>
> ---
>  drivers/gpu/drm/panel/Kconfig                 |   9 +
>  drivers/gpu/drm/panel/Makefile                |   1 +
>  .../gpu/drm/panel/panel-visionox-g2647fb105.c | 282 ++++++++++++++++++
>  3 files changed, 292 insertions(+)
>  create mode 100644 drivers/gpu/drm/panel/panel-visionox-g2647fb105.c
> 
> +
> +static int visionox_g2647fb105_prepare(struct drm_panel *panel)
> +{
> +	struct visionox_g2647fb105 *ctx = to_visionox_g2647fb105(panel);
> +	struct device *dev = &ctx->dsi->dev;
> +	int ret;
> +
> +	ret = regulator_bulk_enable(ARRAY_SIZE(visionox_g2647fb105_supplies), ctx->supplies);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to enable regulators: %d\n", ret);
> +		return ret;
> +	}
> +
> +	visionox_g2647fb105_reset(ctx);
> +
> +	ret = visionox_g2647fb105_on(ctx);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to initialize panel: %d\n", ret);
> +		gpiod_set_value_cansleep(ctx->reset_gpio, 1);
> +		regulator_bulk_disable(ARRAY_SIZE(visionox_g2647fb105_supplies), ctx->supplies);

Unfortunately, you can't disable the regulators here. panel bridge
doesn't check for an error (and it can not further propagate an error),
so if visionox_g2647fb105_on() fails, then there will be an extra call
to regulator_bulk_disable() in visionox_g2647fb105_unprepare().

> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +

LGTM otherwise

-- 
With best wishes
Dmitry
