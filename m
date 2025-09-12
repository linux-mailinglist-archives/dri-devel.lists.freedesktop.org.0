Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C3FEB54CA1
	for <lists+dri-devel@lfdr.de>; Fri, 12 Sep 2025 14:10:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F69E10EC26;
	Fri, 12 Sep 2025 12:10:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="mDZ+sMVz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7665710EC27
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 12:10:09 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58C9fKi0009098
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 12:10:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=dUewbymExetqos/pBiWHZiBD
 APIskSwpfO+nHDhO8vI=; b=mDZ+sMVzzT0+YVrLCIiX+PhRLvmJOSfFfErrhw04
 m6AdFsZDmcPt0Obm6ckzfWx4Q1aZ5+S4nMGWp+miK4xCgs5METyJJPCetrGb1hy4
 +UiBpuZQR8xqIlvMCmrq6SANVmDRdwdAnkOEtTJSEuFEb1BfJM/LJq0hyjPNc4H5
 tNPyF+h1AVv7BmcAQYO97RKAKwZbiuj/Y7CfN2Co/OJz6LGNPURlDJXr78NYKlb4
 Hul7VxkCW05y/MIGDcpS60WXLZmFOUPfsNqoq4jPLFeOmYLJxbBwJZfXxMZUG8iM
 Vrrq/6Nj1dg4sWApmDsmlbdnIwHXY61EDnwe65LTxzYACQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490cj13hnb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 12:10:08 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-814370a9f58so532694485a.1
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 05:10:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757679008; x=1758283808;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dUewbymExetqos/pBiWHZiBDAPIskSwpfO+nHDhO8vI=;
 b=CXBeYUk/COpkAqB7oJ6cdc2p1Ft4XP+6jZfSf8FVzvq7/8H6kadAcNpeV4stP0S2IJ
 SziDJWvSmGdVKeEFjrJYYy+t7PfavSe+XNm19oVxJqUjAzT464yLC6TTcXSPs2WKQjR/
 3IPGcve+qYrHK9v6anaSxA2Vf9KAyEAqzbtszWDcSnhKQYOnuGAa07c6JjWVOv4jk7SZ
 5jtoFL3nTnlMJi1TkgEdC2mOp2cd/C7qYPUeNFC28FN8CH0m442qMuRy/DDigyaVGTyP
 F8Lfu88b65WtSGyGgvXso8peEE9TyoNiS9QSuNgw3wJ627oTaNNDzVQZcZgZRIjlPafH
 XbRg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUxSbTiuEKT/+pdmV/iw9WcfPtTFfu/jKW9TM9zP5+b2Vn32l2VLlpx6fwOJZmWcN8w8okSvlJOvbU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YweLKfM0ZmKPZsJUditBu084Zqpo7sihkyG1R6QX3DZsTVL4gL7
 GP3ahUPX929ZzSeWWBXIBGFY04p/LvUmKtVI1hLjCZThK1o/LWtyJx2DHUs9uJ9MOXZCSdfF1p3
 DD7y02BX/nRVy3eFTtLskW1FRs+ji0BxEb2diomFfw2/EoW/f3SxodAkw7TiLk12qK3eaI+o=
X-Gm-Gg: ASbGncsDF016N/mUYw34p+tI+29oBjTQQEORTMn8kpxU70LX7xJK8MrvYok0r1idiFP
 prd95Cn6V8T6PX6WToQyeUOsEruWVIREFCYpytMs4RMtQbYQ5x4fUF02AlRf3cfay5wqi4XQHcr
 1GEcCSdK78ZspCpqPOQY4EiS9GgB15Gq4iCNE4+J+HBIqQSbivSZfhJ76NXOqHGfGvBemcPWDhN
 mlzZv5Hz8DlhRCer4jKrPhsbsMzsmNnXzvxLOnQ2iiQ04sTmWKPY8neZnUNXUjwm8yd4WEsNNMl
 2dsiUTTOc3cullV17qKb30tpHHkmWk7C8n04arR02XMlvASy/pRuX8FKcvkhh5sxx4JE7gfWfzM
 PkZ+iVPcGIa75vPrPjSk7T6gAFE5VJryhV6oZ1clZDIgd2jWGt0h2
X-Received: by 2002:ad4:4ea3:0:b0:70d:f55f:ef97 with SMTP id
 6a1803df08f44-7621c32efaemr78241946d6.1.1757679007396; 
 Fri, 12 Sep 2025 05:10:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGj9V1c+2coOy5S3o8/s5vrGQ5oy6OiMW/P7QJhRZCoPuqb8GRBAOCSvwHquRJ3YcZvRDvPSw==
X-Received: by 2002:ad4:4ea3:0:b0:70d:f55f:ef97 with SMTP id
 6a1803df08f44-7621c32efaemr78241266d6.1.1757679006733; 
 Fri, 12 Sep 2025 05:10:06 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-56e5cf2f446sm1136422e87.42.2025.09.12.05.10.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Sep 2025 05:10:05 -0700 (PDT)
Date: Fri, 12 Sep 2025 15:10:03 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
 li.liu@oss.qualcomm.com
Subject: Re: [PATCH 2/2] drm/msm/dp: Add DisplayPort support for SM6150
Message-ID: <ds5fisf464z3i4b6hz2ca2ul4u65d4rmjzvst5plfvdwywo2qm@gzgffhfpp4ib>
References: <20250912-add-dp-controller-support-for-sm6150-v1-0-02b34b7b719d@oss.qualcomm.com>
 <20250912-add-dp-controller-support-for-sm6150-v1-2-02b34b7b719d@oss.qualcomm.com>
 <budeqnh65mcmtc5rscbgvy2nz3woptxnht6sddzg7jhttsnx5f@bwf3kyvbrfaj>
 <d9c55e72-0683-4eb3-a22f-015a799e2c79@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d9c55e72-0683-4eb3-a22f-015a799e2c79@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 5o4QMJZasjCWhKR9t5SYCSyj4UatNh_A
X-Proofpoint-GUID: 5o4QMJZasjCWhKR9t5SYCSyj4UatNh_A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAyNCBTYWx0ZWRfX13X6Mz0WltZt
 pZvvf7v+6+ZTXsdAp1H2F6JNdFoEAZje+3FBbb3i3XPb+sG7wrS/jYOUv0h5Mu6tlqYTTX4iZVN
 134Bjr3LCk0C5nuoE4vTehwLfsLPj/jJw6KFJhWM8XB0wtDsFaAX5GL/gS73JZ/tWGo5CCGgzyt
 alYCh0S6DxI4nxocbRNF4V83IKoV1Qgbs7f6u2KSe3WZ/ECzbrfjTYYWTq1Korw2o3fJZQQOzou
 ESxiQOjoW8bPKC2OUYk4vss4++dh1ivmOIc9tJ4ADCpBeHzm872dOT8tSDvI7zZqwHQOwL97Sec
 iSANuUtRrPES2af1dRj//6Kj7MRZmCEdIc/JtmHln3QbLFlIN1ZJ0m38ILm2uUPRmzxuNQZQW1U
 RqRaNomI
X-Authority-Analysis: v=2.4 cv=QeFmvtbv c=1 sm=1 tr=0 ts=68c40da0 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=YvU48llmxf4k0NmX4icA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_04,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 spamscore=0 impostorscore=0
 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509060024
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

On Fri, Sep 12, 2025 at 07:53:50PM +0800, Xiangxu Yin wrote:
> 
> On 9/12/2025 7:47 PM, Dmitry Baryshkov wrote:
> > On Fri, Sep 12, 2025 at 07:39:17PM +0800, Xiangxu Yin wrote:
> >> Add support for SM6150 DisplayPort controller, which shares base offset
> >> and configuration with SC7180. While SM6150 lacks some SC7180 features
> >> (e.g. HBR3, MST), current msm_dp_desc_sc7180 data is sufficient. Listing it
> > SM6150 supports MST as far as I can see.
> 
> 
> Yes, but since msm_dp_desc hasn't been mainlined with MST enabled yet,
> I went ahead and submitted it with this commit message.


The commit message is misleading: it makes one think that SC7180
supports MST, while SM6150 doesn't.

> 
> 
> >> explicitly ensures future compatibility.
> >>
> >> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> >> ---
> >>  drivers/gpu/drm/msm/dp/dp_display.c | 1 +
> >>  1 file changed, 1 insertion(+)
> >>
> >> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> >> index d87d47cc7ec3eb757ac192c411000bc50b824c59..ddb22b50490035779904d4cab20e2fee7e0f9657 100644
> >> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> >> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> >> @@ -196,6 +196,7 @@ static const struct of_device_id msm_dp_dt_match[] = {
> >>  	{ .compatible = "qcom,sc8280xp-dp", .data = &msm_dp_desc_sc8280xp },
> >>  	{ .compatible = "qcom,sc8280xp-edp", .data = &msm_dp_desc_sc8280xp },
> >>  	{ .compatible = "qcom,sdm845-dp", .data = &msm_dp_desc_sdm845 },
> >> +	{ .compatible = "qcom,sm6150-dp", .data = &msm_dp_desc_sc7180 },
> >>  	{ .compatible = "qcom,sm8350-dp", .data = &msm_dp_desc_sc7180 },
> >>  	{ .compatible = "qcom,sm8650-dp", .data = &msm_dp_desc_sm8650 },
> >>  	{ .compatible = "qcom,x1e80100-dp", .data = &msm_dp_desc_x1e80100 },
> >>
> >> -- 
> >> 2.34.1
> >>

-- 
With best wishes
Dmitry
