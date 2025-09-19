Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B526B8AF56
	for <lists+dri-devel@lfdr.de>; Fri, 19 Sep 2025 20:42:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AE7210EA6C;
	Fri, 19 Sep 2025 18:41:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="blqNXqNa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D69E310EA6C
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Sep 2025 18:41:54 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58JHWqLF028087
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Sep 2025 18:41:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=i7CxFXs3E+TxXdjR6pU++0nh
 zSKDiXUs6/X+r4T9DOg=; b=blqNXqNap4RdDUrGJHaDIHahSPTcmOFjAAK+36Di
 IhcA+6lelkrQOZIVWpJSuXMeRHzdHh/A85okxRiUZtD/Puq0p0o1Yl9sFuPKUK3S
 GNpN8JmcC0KqZyKFIkCGuQkKMeGpqo+0jIGMOh4UqHFF8icYmbfvlttCkDjGuLFJ
 5o+m737uE+ltICx5CWLeNg1rcAzxN12kRS1XVv7MD0EYOE/4Su0r6i3TCEQf6XIW
 yPJ2GD8bmI49TxO1khkl/iLaIwqip/E3oZfAVS0rqEuAjU6wOFRLCI4EKfiE4irS
 AG8X9GKy5YRMaiXaJVO0WNnRG4/C0yhxFIBUmET0gFBhIg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497v1jhggx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Sep 2025 18:41:53 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4b49666c8b8so43339181cf.3
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Sep 2025 11:41:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758307313; x=1758912113;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=i7CxFXs3E+TxXdjR6pU++0nhzSKDiXUs6/X+r4T9DOg=;
 b=HCymKdTp3QqyZ66vKx0yAEHCJb9NocPAEp0GsYZUuvc634mfYNBcOxoIQ1wFOvOc89
 DO7eeizOWqbs5MQ6HGcApakBvNWhzBR84I7DiKPsQDSbqOLa8hrcEC+H1yj/1phmkzR7
 S21B6fJ4AY/biQazqDTrb7oxtbgchjC6P3VZB5erMIMFRDHgieZo2wYun67tXTndVhEx
 pRt64vI0e3AM25mMDD0Y79Ex2l0FnKC6/+i1W/J1Mx9Pv4o03rAL6OEal49y1dIZmb2/
 DJx9mGSkoLOxs+1swySFg0VvkVJQJXXoSVFOqpaYnbWW8U8PHK0LfDpIcNCAtp7s4kED
 ESpQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX1dGTTqK6NI0FE/Gzvg6k6KFeuYXZZKtljgv6hRI+R/iZ+UQB6r85P07YuLics70AC77X1hLaPvkc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzTauB+GROgfaUEU0xiMm7+CvuEwtbRoMkr5y/OAdzHvzGAzwW5
 BbLW7V1e/aFQD6dznuRXRsnx4Hs+NDUX3FMkeBIgEAjDsndR+x9eTX8tvUqBT5et5z7StXlCidN
 td19sHBa7xAArcSZoMmRg0XJEvPCQJEK7WNDjjuPfMq7blYP1JqnRqd0QBkb1MQ9tpq7GMb8=
X-Gm-Gg: ASbGncsDhlY72+9IfNxxiyaLKJWmHWXZU5XWShv5TfhLWQv+pFGKk6LsWUoomiIba4e
 N14rKfHHZMarJyJSKK4aTVCstIax6YwWPV5Ma74wK/lAvuo/ql8PqRBw4vnjZyslnWIoDw8nV+x
 nZ7FlrFydmyrrdA6WkUfl9li29C9fasQnU0tkplxsYchiOXD2P0dBNZjN92smW/9zRU07Djs84k
 6Y+cnyVn9dK3DI+g3i0AqlVBu0DsUVLv5HIVPJwFRUdB4vXKSm3QQokLfxKcyMQfRLTFyGC5N/H
 JahKzSHxj/k+ItX6ZaLN9MvJyp3PzQp55e06vnxW6llSDrhzCl3tnb/dslh8DWfEA/oNcoVyizH
 ukmGTKFWXB9OZIINg3BGzMC7Oa9rXXFZ4PuEUr1FMwSPTnTz41Rf6
X-Received: by 2002:a05:622a:491:b0:4b6:2336:7005 with SMTP id
 d75a77b69052e-4c06d6828d5mr48024581cf.19.1758307312801; 
 Fri, 19 Sep 2025 11:41:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF+jXszKO5APDEximPKgrAQZzyc5+8giT/WjH1lhXJNUczhHvAVEcXJ87AWsBXaMadhHq3byQ==
X-Received: by 2002:a05:622a:491:b0:4b6:2336:7005 with SMTP id
 d75a77b69052e-4c06d6828d5mr48024191cf.19.1758307312164; 
 Fri, 19 Sep 2025 11:41:52 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-361a99e9024sm13738501fa.49.2025.09.19.11.41.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Sep 2025 11:41:51 -0700 (PDT)
Date: Fri, 19 Sep 2025 21:41:48 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
 li.liu@oss.qualcomm.com, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Subject: Re: [PATCH v5 12/14] phy: qcom: qmp-usbc: Add QCS615 USB/DP PHY
 config and DP mode support
Message-ID: <bfpgktxgo2hb6dpzy3i7jdr6w4de5boorx4n6qeapct2vre4sn@4z2mnppridn5>
References: <20250919-add-displayport-support-for-qcs615-platform-v5-0-eae6681f4002@oss.qualcomm.com>
 <20250919-add-displayport-support-for-qcs615-platform-v5-12-eae6681f4002@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250919-add-displayport-support-for-qcs615-platform-v5-12-eae6681f4002@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: FYt06BrxBkQt4MxalngAEYJ8m9Ab60qC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE3MDExMCBTYWx0ZWRfX8G+8SIfe30EL
 x5ecO5RJMG9dXRalLfmxwEojdevEGVrNUbOG5Fvhs3eEWVVNNPXyBbyPePb4pp/m3Cn9/0q6LYj
 ybdUseTtn7UciXx/rYGvHfF/74KQckiO9A9acfkHMTnKpuyFD7uT/b8Yb+hmbTYVRYWQhYejLk7
 cxvPP6M8ikxiTWo/S1/ZYUm2Mp1fOzS0RTd0rkn5jTQ2mJusaMp5gDEA+QN0+XWwgdKNYFyt3yV
 YqpCUC0R2t/y5g9TMQdIniWnssNcGtYuD0er1ChBxlgfZQ22x9oqzBHgafAmAoXfxfuLjtOuVRF
 1aG9b6tUCAgievnd6Smypt+fcGy8KFGNYxNhmt3cJwD2gweJ92rWiXPZmd92+Up7tnc2ojlzkD9
 6gBNILYV
X-Authority-Analysis: v=2.4 cv=AeqxH2XG c=1 sm=1 tr=0 ts=68cda3f1 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=XgMPAK_adSAUw0pB5X0A:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: FYt06BrxBkQt4MxalngAEYJ8m9Ab60qC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-19_02,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 suspectscore=0 adultscore=0
 impostorscore=0 priorityscore=1501 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509170110
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

On Fri, Sep 19, 2025 at 10:24:29PM +0800, Xiangxu Yin wrote:
> Add QCS615-specific configuration for USB/DP PHY, including DP init
> routines, voltage swing tables, and platform data. Add compatible
> "qcs615-qmp-usb3-dp-phy".
> 
> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 395 +++++++++++++++++++++++++++++++
>  1 file changed, 395 insertions(+)
> 
> +
> +	writel(0x3f, qmp->dp_tx + QSERDES_V2_TX_TRANSCEIVER_BIAS_EN);
> +	writel(0x10, qmp->dp_tx + QSERDES_V2_TX_HIGHZ_DRVR_EN);
> +	writel(0x0a, qmp->dp_tx + QSERDES_V2_TX_TX_POL_INV);
> +	writel(0x3f, qmp->dp_tx2 + QSERDES_V2_TX_TRANSCEIVER_BIAS_EN);
> +	writel(0x10, qmp->dp_tx2 + QSERDES_V2_TX_HIGHZ_DRVR_EN);
> +	writel(0x0a, qmp->dp_tx2 + QSERDES_V2_TX_TX_POL_INV);

Are you sure that these don't need to be adjusted based on
qmp->orientation or selected lanes count?

In fact... I don't see orientation handling for DP at all. Don't we need
it?

> +
> +	writel(0x18, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
> +	writel(0x19, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
> +
> +	if (readl_poll_timeout(qmp->dp_dp_phy + QSERDES_V2_DP_PHY_STATUS,
> +			       status,
> +			       ((status & BIT(1)) > 0),
> +			       500,
> +			       10000)){
> +		dev_err(qmp->dev, "PHY_READY not ready\n");
> +		return -ETIMEDOUT;
> +	}
> +
> +	return 0;
> +}
> +

-- 
With best wishes
Dmitry
