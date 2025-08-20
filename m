Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7ABFB2DB82
	for <lists+dri-devel@lfdr.de>; Wed, 20 Aug 2025 13:46:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01A4910E257;
	Wed, 20 Aug 2025 11:46:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="B89iNIsy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C56B610E705
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 11:46:01 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57KA8qvl008263
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 11:46:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=86Ln+09pzyozcQ/MppaK2YJ1
 etLMTMvIuD/Ncqfow7s=; b=B89iNIsyfpDobeJi/CKyI3/jrxOpQ+j9kBlRJmMt
 oREaLSNisve+CUXbIxSjxOHyK7NRV29nBJxgrtbXZ9wixa3qempgSqCMBFOISd2I
 aXXYfKEmz8jR9Ulph1oLhCuRyvkjcuD+oHqosGJXPkEYVd/UoUAImN007rwM3MLD
 ag6Gza9tPLGhGtYbPWD2AoyITlvn25eSjqkpGpgRnS05zRcQfrbAcfoAhjixaRtr
 WwBiD7IhRQZDHdIN2jjC9u2k5RDC+CwQPJdpnb/sSLg/BWOv8c4KTSJueKqtyfqN
 QIe4VrhJxUtK/GKAhUebGerKKN/I4DvYbwbtwjvxy+0FOA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n5291jfd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 11:46:00 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-70a88dae248so18669316d6.0
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 04:46:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755690360; x=1756295160;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=86Ln+09pzyozcQ/MppaK2YJ1etLMTMvIuD/Ncqfow7s=;
 b=gQixBvnLQ97jXnTh3c6bwuB9gofIdYQDFGXbNqsCGMc7iSLKVsXmDHNFdcEcoAROW5
 Cm5xiAcwTnSUSPOEQY9ZR5nVyBYav9jI5DltLRpRxN5TPHD6IFbv13NTfMGPX5x0rHI0
 KfHqW91NmWx50YJB/8uw7nYNX056RGznrLzhclJrM2SlnVq9maomJmfChIrNIx8iI3Gi
 kUC9jU6+G5giTVWEAaMFWFAzaF7PyZhbr1zVWG4KC69ghTbfawKnzeRpQhATpXAX83Ws
 jzhjYT6V1aGJS73ko7X8TyE9TxSGvmvTp9mC+1zzDwcavLU6z/S4/zpCaiXkPXwA2/dq
 +06w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWoylIO/+TfQBYzBUYZMalyw4fC3jYnMzGQ/d/fdp9DNpmt/Rl/HPIhXcU3hslQzBiDPa/st45fsaY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwCgT1BQqdQKn48VOBRjMMoEuhYHBwPeccWquzXtSngWj5hxK7K
 p04eR+HsIi78rWl5au13f2JfQyNOxYQ27oXzo8HOkTNtm8nDYCZRy+8mDt2SqLR5Yd2NMZagwTd
 8Nr9PQkpLiAhCdNdx7asihY3GRMSvUO+SRhGn6pIhtSEBFiKBU5AbAV7D5d674HO5CW0HK7I=
X-Gm-Gg: ASbGncuek7x+dvN/BDrbRqafdGIKEDQXToEOQvkWkcmI50Pjkfs3pBQyt69mwLunSVJ
 Yqo8yrK9elBGMJJk3Bju4gkn1UljOhc2b25P9Q7Rzvu+Da5hlEdYVtk2b9GZh6EEWjJOiTcsYbd
 Jxp/80HYTWwLB9pHuL1oLn35vGhCCWlYQBGdlXQwhs6KAHYXPd/OEdTjkgOYB7hYrq/MgmU1Dgf
 s/cH7Kdvei0AHkdWlYA12wlmkHmJALdoejF47o3kvyiwo5/l0zBgic78FguMHv5q3jffgpEvp5W
 jqBKC0ZUVnt5DvmOyEpUcFHq0dgSmFE2dIYApqYcKK1fbfyR89swjNBBXy/nOplenbU6/kUNtQo
 KNoRynXyk64W9E97gzkU/FjA0l2E3qNTY7KjvVp3YNzAf3+xtddGR
X-Received: by 2002:ad4:5aa3:0:b0:707:4a94:2203 with SMTP id
 6a1803df08f44-70c6a8bab6amr59972286d6.25.1755690359702; 
 Wed, 20 Aug 2025 04:45:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFlaN2Z2SMVVXIYqO8llzjIfBnKuhBBs2TnJOJtmy1FbGCyh3MeXwdPwEtQXchEguz6D2cJ7Q==
X-Received: by 2002:ad4:5aa3:0:b0:707:4a94:2203 with SMTP id
 6a1803df08f44-70c6a8bab6amr59971906d6.25.1755690358997; 
 Wed, 20 Aug 2025 04:45:58 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55e02c31498sm660064e87.12.2025.08.20.04.45.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Aug 2025 04:45:58 -0700 (PDT)
Date: Wed, 20 Aug 2025 14:45:56 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, fange.zhang@oss.qualcomm.com,
 yongxing.mou@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, quic_lliu6@quicinc.com
Subject: Re: [PATCH v3 09/14] phy: qcom: qmp-usbc: Add DP PHY ops for USB/DP
 switchable Type-C PHYs
Message-ID: <3pr7ninjxr4pgsz56dr6ojjmx27fzzszmtt6mx4r6qaqt25tnc@nrgx5qiqc7z4>
References: <20250820-add-displayport-support-for-qcs615-platform-v3-0-a43bd25ec39c@oss.qualcomm.com>
 <20250820-add-displayport-support-for-qcs615-platform-v3-9-a43bd25ec39c@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250820-add-displayport-support-for-qcs615-platform-v3-9-a43bd25ec39c@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Aui3HO9P c=1 sm=1 tr=0 ts=68a5b578 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=0tJ4ROd8JQyD-KrPA2gA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: DPTnbUnbiS2lEmIa5DiWEjoEHGjzzM5F
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX7KF4wdQykjq9
 w+9IGFpuIjklDUDTsH49oBaTvlVl2Nvh+8q75PjwbVjBr5cFbfcR0Y8xV5rF0umq4LLhpimMLqy
 DW2rkfO2HSp1RvRL1nLa+7XX22hG0z5gjBIAOMsJBB+h1oGMC6/LsTMSMl+z8hljdhVLBp55iK9
 MOlcigR2GWxhc26YaIxyEyF4Kat2bloIXjdRvN39otNloDq+99wLyQzBRs7fHHpELFiFnKzn6CP
 pIITg+GTuATM8N8lZv5EABDT211yudCG4ThuhZ639DLB88m/g0Hfg3VAjEq+VsausfdB+yAlb6k
 LM91o21ER+Z84eYbeIlRcy0i8nqQNq1dSPD9dBKMmlqWMopw6qUdiFRJxFctZvWrBaP5YpzU5k7
 jQ+tWHt0Nx1VIvU/xfJPh3ERBs23jg==
X-Proofpoint-GUID: DPTnbUnbiS2lEmIa5DiWEjoEHGjzzM5F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_03,2025-08-20_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2508110000
 definitions=main-2508200013
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

On Wed, Aug 20, 2025 at 05:34:51PM +0800, Xiangxu Yin wrote:
> Define qmp_usbc_dp_phy_ops struct to support DP mode on USB/DP
> switchable PHYs.
> 
> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 163 +++++++++++++++++++++++++++++++
>  1 file changed, 163 insertions(+)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
> index 1508a4a5f57aff85318485b79528325f28a825a4..a1495a2029cf038bb65c36e42d0a4f633e544558 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
> @@ -22,6 +22,8 @@
>  #include <linux/slab.h>
>  #include <linux/usb/typec.h>
>  #include <linux/usb/typec_mux.h>
> +#include <dt-bindings/phy/phy-qcom-qmp.h>
> +#include <drm/bridge/aux-bridge.h>

This one is not necessary yet

>  
>  #include "phy-qcom-qmp-common.h"
>  

[...]

>  static const struct phy_ops qmp_usbc_usb_phy_ops = {
>  	.init		= qmp_usbc_usb_enable,
>  	.exit		= qmp_usbc_usb_disable,
> @@ -1095,6 +1248,16 @@ static const struct phy_ops qmp_usbc_usb_phy_ops = {
>  	.owner		= THIS_MODULE,
>  };
>  
> +static const struct phy_ops qmp_usbc_dp_phy_ops = {

Please try restructuring your patches so that there are no unused
warnings in the middle of the series. You can split the next patch into
'parse' and 'enable' parts, then squash this patch into the 'enable'
one.

> +	.init		= qmp_usbc_dp_enable,
> +	.exit		= qmp_usbc_dp_disable,
> +	.configure	= qmp_usbc_dp_configure,
> +	.calibrate	= qmp_usbc_dp_calibrate,
> +	.power_on	= qmp_usbc_dp_power_on,
> +	.power_off	= qmp_usbc_dp_power_off,
> +	.owner		= THIS_MODULE,
> +};
> +
>  static void qmp_usbc_enable_autonomous_mode(struct qmp_usbc *qmp)
>  {
>  	const struct qmp_phy_cfg *cfg = qmp->cfg;
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
