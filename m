Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48E16A83F4A
	for <lists+dri-devel@lfdr.de>; Thu, 10 Apr 2025 11:47:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DA1610E887;
	Thu, 10 Apr 2025 09:47:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="RCqqNIJk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7784C10E887
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Apr 2025 09:47:43 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53A75pIG017269
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Apr 2025 09:47:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=RtFAhLnWjHj2Vdt72nOfnzwD
 dl81RhuU6X6p7dY45kY=; b=RCqqNIJkfPCkWt5tlsfwKh+AUa8UWhLwDQqkznVz
 7T0qhh8CnDlXNBgJaMXfndl+/2yqUQnPgd7UjSZg/i63sYUKbK/wuWY7XIQvV9jW
 YcQW7IqS4/jgvlL13ibQLpkrIUlk7tK54KOLnvtqbKw1+9RG39Hleuh1hmg+pZN3
 bt3FjaVj15oU+NVWQpbJPOQQfTzFO7G0KE+mH/VMhdIpJk7RsBmQWriF2vUZZi3r
 p93TPeG24iyAZz8bB5nCSrNy+WRt3cd+1o9HaGdwim/z8cW+QkGjmiaal3hXCMwS
 0zcD8+9FWAsaVs24GapDtPtmAaQ3KCCeEWb/gc1Tny2dkQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twc1p9gd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Apr 2025 09:47:42 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-6e91b1ddb51so12581826d6.0
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Apr 2025 02:47:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744278461; x=1744883261;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RtFAhLnWjHj2Vdt72nOfnzwDdl81RhuU6X6p7dY45kY=;
 b=m3kLZmFy3Cm5ftaYWEa+lq17mEb/oRb31DM0vdnBUqhHGxlLxw0xTZ0FOpycCWt2Q5
 XUonFERGRRKmp5UuWPe4z86itU/pb4JA5JlscyMa7gQl46vm7RcGhbbfmBlZSUZBasOk
 n76kH74wyPplwHf5Gy6P0/Ssf2Py1xOg8ccKATpqdQtW7yA9ZcyiZwZWCvEsooO32P+2
 hoDyzIK/SQ1afTw3zM0I20BgKi5tDfIbhuEGzZ58Gjxr8jjGmQeqQDiUr5e5Bu4kPEiG
 oQQkmMa4c2VwyCUZTrbtAEOmjI1swsXGE0FnaCJPPf+067cNHHPckEXqbo841KeFVpq3
 O49g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUeq5dsb6Ptq43FJQUz6QRQDEltmEpQ+1U8VT2S80OWiLJjAi1TUrtuBKGBVRtO9DiCDOTtyhcU2BI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyo37BwFCSWm7l8O5u3kNtk7lxFIXEBpiQPPBKtW/mruwOgmIil
 4j+hE9IA4NGzh4dfyZbCZuyixA8NK0vJEXgeqhJSozZJAJENj/aRQ6Mb85967KMd+xigtQcz2Ue
 Bmc43+op886rU7+dqI2o5yrEUkMtyT4uAwetJhV+5bXUrCeTp/NxnoMMj10NtRJHi3fU=
X-Gm-Gg: ASbGnctLc52DdtOH08A8IBzqge2GuAuHsbF81xDPCFw7r2jdA8Kx5LCC2P4aFaJr8tS
 yMf4wWP84gr+x7p4ko/TEOlBmh6mXgl9b4j7Y5q6Lyhbj+k7HhJcnG+taqRBDIQXt0mgXlvKxT8
 VIRCiGbxjHQ6kCUgmVr3rmDsSQRet8mMct9/MqfVptDb+0g7jb1SoiLcFIMzrARqKKa7qHdom5q
 2iUeH8wj7VbX/A7nW6VLDce5hGXSGcfPmxXoVbzkpQzqyafCXZP3VNGojzr9T/UGRvnRS+Wi5CY
 QlzSQZGulIOuOgUmttPB0ytZ+rXuFqQ8H0rc1hiIRVJ1FjNExbuD0ISV6mDw9+0iUoHfdoigHGg
 =
X-Received: by 2002:a05:6214:2429:b0:6e6:6aa5:2326 with SMTP id
 6a1803df08f44-6f0e5c077a2mr29592536d6.24.1744278461277; 
 Thu, 10 Apr 2025 02:47:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFT1JawutUvxmYR8lSzmTSyg/BqvttzgIC0oWCpvsKu3CJovvRayjBGGQe29GzvatBdsd/+ow==
X-Received: by 2002:a05:6214:2429:b0:6e6:6aa5:2326 with SMTP id
 6a1803df08f44-6f0e5c077a2mr29592226d6.24.1744278460917; 
 Thu, 10 Apr 2025 02:47:40 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30f465d5ebfsm4052221fa.68.2025.04.10.02.47.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Apr 2025 02:47:40 -0700 (PDT)
Date: Thu, 10 Apr 2025 12:47:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kory Maincent <kory.maincent@bootlin.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH 2/4] drm/panel: ilitek-ili9881c: Add support for two-lane
 configuration
Message-ID: <nvfgrdmynquuwub3qy26zqyztb7ze3u74vv53tmk5xoltruw5c@nnbw3heppqd7>
References: <20250408-feature_sfto340xc-v1-0-f303d1b9a996@bootlin.com>
 <20250408-feature_sfto340xc-v1-2-f303d1b9a996@bootlin.com>
 <ioput75qsjfehxqaw2vyeeogtox43cosdk65psp4t5wp737dey@p7bwaltapdng>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ioput75qsjfehxqaw2vyeeogtox43cosdk65psp4t5wp737dey@p7bwaltapdng>
X-Proofpoint-ORIG-GUID: xocZjKeW-4E7F_ktSSh3ywMRrsc1tQkN
X-Authority-Analysis: v=2.4 cv=KtdN2XWN c=1 sm=1 tr=0 ts=67f793be cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=XR8D0OoHHMoA:10 a=P-IC7800AAAA:8 a=UfFV69bjFFh9RDvSpowA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-GUID: xocZjKeW-4E7F_ktSSh3ywMRrsc1tQkN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-10_01,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 spamscore=0
 malwarescore=0 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504100073
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

On Thu, Apr 10, 2025 at 12:34:15PM +0300, Dmitry Baryshkov wrote:
> On Tue, Apr 08, 2025 at 05:27:01PM +0200, Kory Maincent wrote:
> > Enable support for two-lane configuration which is done by setting the
> > LANSEL_SW_EN and LANSEL_SW bits in the Pad Control register.
> > 
> > Use the dsi-lanes device tree parameter to configure the number of lanes.
> > The default configuration remains set to four lanes.
> > 
> > Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
> > ---
> >  drivers/gpu/drm/panel/panel-ilitek-ili9881c.c | 35 +++++++++++++++++++++++++--
> >  1 file changed, 33 insertions(+), 2 deletions(-)
> > 
> > @@ -1504,7 +1523,7 @@ static const struct drm_panel_funcs ili9881c_funcs = {
> >  static int ili9881c_dsi_probe(struct mipi_dsi_device *dsi)
> >  {
> >  	struct ili9881c *ctx;
> > -	int ret;
> > +	int ret, lanes;
> >  
> >  	ctx = devm_kzalloc(&dsi->dev, sizeof(*ctx), GFP_KERNEL);
> >  	if (!ctx)
> > @@ -1545,11 +1564,23 @@ static int ili9881c_dsi_probe(struct mipi_dsi_device *dsi)
> >  	if (ret)
> >  		return ret;
> >  
> > +	ret = of_property_read_u32(dsi->dev.of_node, "dsi-lanes", &lanes);
> 
> Use dsi->lanes instead.

Please ignore this comment :-)

> 

-- 
With best wishes
Dmitry
