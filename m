Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB834A8085E
	for <lists+dri-devel@lfdr.de>; Tue,  8 Apr 2025 14:44:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49E3910E041;
	Tue,  8 Apr 2025 12:44:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ovuATnNA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5D6A10E041
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Apr 2025 12:44:38 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 538BFsNh019576
 for <dri-devel@lists.freedesktop.org>; Tue, 8 Apr 2025 12:44:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 lg3ZT4srw+6aryFi5Qc7G2dueXIKHeooH8YunyQ+fbw=; b=ovuATnNAylzikAyd
 WtOcoK/ivI0Z1bAvVeZIcWUM0vUOKBVIFq1RIDSG6DOTo6g14E4X/kfM8FHcayzZ
 60RyeWAWGrY1LETgrU1OQTE94j923Igv32/NuaYlTPz0Gh3dpN2pxPNWbmRjzjZ4
 KZADeWIh059zhZsxgvrI0UhKbjoY3wWAIkxwEU2UHENveZagtDZpmYjeoUdXzk6I
 CHx8mEf2FDsuI0V6lPCnKQCmmBYLzt9VczDOsESP4g7ql52bytZH5mtGUDKOlfD2
 ACwfVqCLTHX8nmSZOfUrvaG61wc0WvOXe9l4n3vXWZsPZY3ddxrLpuQSCrFWYNNT
 4qY+/w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twg3fr7n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Apr 2025 12:44:37 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7c54a6b0c70so487003985a.0
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Apr 2025 05:44:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744116277; x=1744721077;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lg3ZT4srw+6aryFi5Qc7G2dueXIKHeooH8YunyQ+fbw=;
 b=Vov/0fFVugbUIOl1y78uJ/TJqRaJUxf0t8fzD4QNi+utYlSs4rHssnPCKH9lAVmUhH
 1tFCRnxaHExoW5QcEU153JQZj2TuhampfdgB8+lB+ezBahata0sNfqDT/k2srClTU9pK
 DehTHXcYiMsi9RB7iXAAlG08kg4vZafGwR4v2fwhdn9yFNtUiasJBklN0dvg2aluEGV+
 gHrwI6vaJzCEmCg2y3McRj3oSOuBoqOsatx8v3Yv4Zqo44rIh/cIf5rwaW5DGuTETfnu
 lfduB8cAgJ+FRD/yvpyVOIlMJ+IGxnhly4XpCTYviwkoa2Xv4Oep8oF8sixrcqxoLT3J
 Ib7g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUC2zjmHBVvToxVYTbr6hUmet3VqDrFwCSLNsBssrk4mJfBDpjZwOsRg/onvYaakqTnp4ZrzQ53ks0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxNm1yANQtGnWSoDrF0A1VndY/T2kkIwHUIyrNSxZsC9y1uAw4S
 E7f4NH0XQSJP6P8dH9fgh8eNIqcSRl1s3z4Xwq2wCd7pIez/2v8oQlrHLSgrYSnxX+Cuf/yLl3D
 qmv2bC81G2OmNkuL32T2AfGf/SEFmY8EsFY9GLRuzjbX1qPv1KNSrxSDIJL/8WiR0gus=
X-Gm-Gg: ASbGncsdiDia0uUO3F7g34g+kxQIQ6eC+UP5AdNUaLBe9qyT5tqaRsSS0k9Uaxx1MPR
 Jqe3ylM9+/cst7rfROOsNUc6D7cdC5TsHY9YXtjmSBZiRZZCO3kQDEQ6Lvpzq3ZVl7/cMtByDCk
 9CtI6hHaoPfKdaYyzREPOnFVOtjOLQK9Sdj3VYRl7mPzpTDW6MJDcnXoJFOEojog620EwyX6Z4r
 pW71m77lOO5TrncTe7IGwDpxLXxRs8sMSUZb9Fhfxi39LmYCpiplEoJUHuPwKFsOQQ+bwk3WSU7
 9NaWTeu7DHr+bHzHcOh9DrF+u1NYZ/NE6iJgB0tnTL0Dz535azbWVOJc/c6Hlid0j43xyEd4ivL
 /X/c=
X-Received: by 2002:a05:620a:1918:b0:7c5:9c38:ef6b with SMTP id
 af79cd13be357-7c775abfc97mr2255089185a.45.1744116276813; 
 Tue, 08 Apr 2025 05:44:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEG22ST879wU1hj8qKN5DvkfkmnnORS8BpEMeXnfFTdBQ8zZsfg2IPMrVXraLLg9Li7ARcMaQ==
X-Received: by 2002:a05:620a:1918:b0:7c5:9c38:ef6b with SMTP id
 af79cd13be357-7c775abfc97mr2255084485a.45.1744116276401; 
 Tue, 08 Apr 2025 05:44:36 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54c1e6370d1sm1512901e87.143.2025.04.08.05.44.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Apr 2025 05:44:35 -0700 (PDT)
Date: Tue, 8 Apr 2025 15:44:33 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Andy Yan <andyshrk@163.com>
Cc: Alex Bee <knaerzche@gmail.com>, heiko@sntech.de, conor+dt@kernel.org,
 krzk+dt@kernel.org, robh@kernel.org, hjc@rock-chips.com,
 mripard@kernel.org, neil.armstrong@linaro.org,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH v3 7/7] drm/rockchip: inno-hdmi: Convert to drm bridge
Message-ID: <yjxr7dphzm7rbuf7mfpkat4k2vssk2qxio3esvjfhd2ygq6byo@kag57knzrj4l>
References: <20250402123150.238234-1-andyshrk@163.com>
 <20250402123150.238234-8-andyshrk@163.com>
 <680a40a8-07c1-4dde-93b2-337ab15f7afe@gmail.com>
 <618c65eb.b8a8.1961550f5ae.Coremail.andyshrk@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <618c65eb.b8a8.1961550f5ae.Coremail.andyshrk@163.com>
X-Proofpoint-GUID: _s7eqP5ZWGyEtmi7ZSBIqfxSMA65heWV
X-Proofpoint-ORIG-GUID: _s7eqP5ZWGyEtmi7ZSBIqfxSMA65heWV
X-Authority-Analysis: v=2.4 cv=I/9lRMgg c=1 sm=1 tr=0 ts=67f51a35 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=Byx-y9mGAAAA:8 a=pGLkceISAAAA:8
 a=s8YR1HE3AAAA:8 a=RRhK3aCThXU4g2SLoiEA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_04,2025-04-08_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0
 phishscore=0 suspectscore=0 mlxlogscore=999 lowpriorityscore=0 spamscore=0
 clxscore=1015 malwarescore=0 adultscore=0 priorityscore=1501
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504080090
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

On Tue, Apr 08, 2025 at 08:12:29PM +0800, Andy Yan wrote:
> 
> 
> Hi Alex，
> 
> At 2025-04-03 01:24:22, "Alex Bee" <knaerzche@gmail.com> wrote:
> >
> >Hi Andy,
> >
> >> From: Andy Yan <andy.yan@rock-chips.com>
> >> 
> >> Convert it to drm bridge driver, it will be convenient for us to
> >> migrate the connector part to the display driver later.
> >> 
> >> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> >> 
> >> ---
> >> 
> >> Changes in v3:
> >> - First included in v3
> >> - Link to V2: https://lore.kernel.org/dri-devel/20250325132944.171111-1-andyshrk@163.com/
> >> 
> >>   drivers/gpu/drm/bridge/Kconfig                |   7 +
> >>   drivers/gpu/drm/bridge/Makefile               |   1 +
> >>   .../inno_hdmi.c => bridge/inno-hdmi.c}        | 924 ++++++++++--------
> >>   drivers/gpu/drm/rockchip/Kconfig              |   1 +
> >>   drivers/gpu/drm/rockchip/Makefile             |   2 +-
> >>   drivers/gpu/drm/rockchip/inno_hdmi-rockchip.c | 187 ++++
> >>   drivers/gpu/drm/rockchip/inno_hdmi.h          | 349 -------
> >>   include/drm/bridge/inno_hdmi.h                |  33 +
> >>   8 files changed, 741 insertions(+), 763 deletions(-)
> >>   rename drivers/gpu/drm/{rockchip/inno_hdmi.c => bridge/inno-hdmi.c} (52%)
> >>   create mode 100644 drivers/gpu/drm/rockchip/inno_hdmi-rockchip.c
> >>   delete mode 100644 drivers/gpu/drm/rockchip/inno_hdmi.h
> >>   create mode 100644 include/drm/bridge/inno_hdmi.h
> >>
> >
> >...
> >
> >> +#define m_RX_DONE			(1 << 0)
> >> +
> >> +#define HDMI_CEC_TX_INT			0xda
> >> +#define HDMI_CEC_RX_INT			0xdb
> >> +#define HDMI_CEC_BUSFREETIME_L		0xdc
> >> +#define HDMI_CEC_BUSFREETIME_H		0xdd
> >> +#define HDMI_CEC_LOGICADDR		0xde
> >> +
> >>   struct inno_hdmi_i2c {
> >>   	struct i2c_adapter adap;
> >>   
> >> @@ -68,41 +395,18 @@ struct inno_hdmi_i2c {
> >>   
> >>   struct inno_hdmi {
> >>   	struct device *dev;
> >> -
> >> +	struct drm_bridge bridge;
> >>   	struct clk *pclk;
> >>   	struct clk *refclk;
> >>   	void __iomem *regs;
> >>   	struct regmap *grf;
> >>   
> >> -	struct drm_connector	connector;
> >> -	struct rockchip_encoder	encoder;
> >> -
> >>   	struct inno_hdmi_i2c *i2c;
> >>   	struct i2c_adapter *ddc;
> >> -
> >> -	const struct inno_hdmi_variant *variant;
> >> +	const struct inno_hdmi_plat_data *plat_data;
> >> +	unsigned int colorimetry;
> >
> >thanks a lot for doing the bridge conversion for this driver.
> >Please keep the custom connector state which was introduced after Maxim's
> >review during the last rework of this [0] driver. The colorimetry is not
> >part of the device, but of the connector and thus should not be part of the
> >device struct.
> >It's, however, likely that the common (hdmi-)connector framework will once
> >hold its own colorimetry property and then the custom connector state in
> >this driver can go away, but until than we have to keep it here.
> 
> After converting to a bridge driver, this driver no longer has a connector. 
> In this case, how should I create customized connector states?

You can subclass drm_bridge_state. Another option is to follow
rk3066_hdmi.c and to pass mode to inno_hdmi_config_video_csc().
Finally, you can just extend the drm_connector_hdmi_state.

My preference would lean towards the second option.

> 
> >
> >Thanks,
> >Alex
> >
> >[0]
> >https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=ceeb0f0104a62c867656c2730a51df47e7350b8f
> >
> >
> >>   };
> >>   
> >> -struct inno_hdmi_connector_state {
> >> -	struct drm_connector_state	base;
> >> -	unsigned int			colorimetry;
> >> -};
> >> -
> >> -static struct inno_hdmi *encoder_to_inno_hdmi(struct drm_encoder *encoder)
> >> -{
> >> -	struct rockchip_encoder *rkencoder = to_rockchip_encoder(encoder);
> >> -
> >> -	return container_of(rkencoder, struct inno_hdmi, encoder);
> >> -}
> >> -
> >> -static struct inno_hdmi *connector_to_inno_hdmi(struct drm_connector *connector)
> >...

-- 
With best wishes
Dmitry
