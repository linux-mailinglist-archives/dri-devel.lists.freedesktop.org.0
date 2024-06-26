Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5698F917A0A
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2024 09:47:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B313210E7A7;
	Wed, 26 Jun 2024 07:47:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="DuXVmeH3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB89C10E7A7;
 Wed, 26 Jun 2024 07:47:17 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45Q6j2BJ020260;
 Wed, 26 Jun 2024 07:47:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=X89kKqUUubk6lY1LGLTGyR0M
 MmZHzIHID2aTkTYA/Ss=; b=DuXVmeH3qGI8JDeeQI3zqJEK3Ev6PfTSzIcFZblC
 OkQtxkfUAeiN8Z8dikpQ607RlDqgCYEeWd7qz003bj03g2wURcsPILHwET912lp2
 R39dymrUlTzHA9HocpjSWFN/iyzOeMFxcFQS8gH5A0+5PJjR2pI+dwWnkRe0j3Hf
 m4EVuzVTWyLBoSKQ8tx0nohlQyt1qBHYNupiUWNfYzp4LshUb0zZDqLSV9v6rlwv
 /MEl39vmK57a4ktBmFjOfB+wFVh0p3VZwTQUwXZPEx9q+PZcPPClTwhqGG7U34T/
 2JRdxb4Ydy2IWAQIcn834Y2oSsVfcZqcRO1/NEgSUQZBKQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ywp6yrsj5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Jun 2024 07:47:09 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 45Q7l81W006054
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Jun 2024 07:47:08 GMT
Received: from hu-akhilpo-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 26 Jun 2024 00:47:02 -0700
Date: Wed, 26 Jun 2024 13:16:59 +0530
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: freedreno <freedreno@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
 Rob Clark <robdclark@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Conor Dooley <conor+dt@kernel.org>, "Daniel Vetter" <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Marijn Suijten
 <marijn.suijten@somainline.org>, Maxime Ripard <mripard@kernel.org>, "Rob
 Herring" <robh@kernel.org>, Sean Paul <sean@poorly.run>, Thomas Zimmermann
 <tzimmermann@suse.de>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 1/3] dt-bindings: display/msm/gmu: Add Adreno X185 GMU
Message-ID: <20240626074659.jtcvk5aqd7m2sdwq@hu-akhilpo-hyd.qualcomm.com>
References: <20240623110753.141400-1-quic_akhilpo@quicinc.com>
 <20240623110753.141400-2-quic_akhilpo@quicinc.com>
 <248e8983-1b91-4fff-a941-74c6dc4fcbc1@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <248e8983-1b91-4fff-a941-74c6dc4fcbc1@kernel.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: uzxhyqVX8FXPUry1q4hs4o3CxV7j1lq2
X-Proofpoint-ORIG-GUID: uzxhyqVX8FXPUry1q4hs4o3CxV7j1lq2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-26_03,2024-06-25_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 bulkscore=0
 phishscore=0 adultscore=0 mlxscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 lowpriorityscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2406260057
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

On Sun, Jun 23, 2024 at 02:40:14PM +0200, Krzysztof Kozlowski wrote:
> On 23/06/2024 13:06, Akhil P Oommen wrote:
> > Document Adreno X185 GMU in the dt-binding specification.
> > 
> > Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> > ---
> > 
> >  Documentation/devicetree/bindings/display/msm/gmu.yaml | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/display/msm/gmu.yaml b/Documentation/devicetree/bindings/display/msm/gmu.yaml
> > index b3837368a260..9aa7151fd66f 100644
> > --- a/Documentation/devicetree/bindings/display/msm/gmu.yaml
> > +++ b/Documentation/devicetree/bindings/display/msm/gmu.yaml
> > @@ -23,6 +23,9 @@ properties:
> >        - items:
> >            - pattern: '^qcom,adreno-gmu-[67][0-9][0-9]\.[0-9]$'
> >            - const: qcom,adreno-gmu
> > +      - items:
> > +          - pattern: '^qcom,adreno-gmu-[x][1-9][0-9][0-9]\.[0-9]$'
> 
> '[x]' is odd. Should be just 'x'.

Ack

-Akhil
> 
> 
> Best regards,
> Krzysztof
> 
