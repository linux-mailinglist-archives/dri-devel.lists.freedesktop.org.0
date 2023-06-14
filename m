Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8289730A6E
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jun 2023 00:10:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B20710E46D;
	Wed, 14 Jun 2023 22:10:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E31A510E46D;
 Wed, 14 Jun 2023 22:10:14 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 35ELoFid020851; Wed, 14 Jun 2023 22:10:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=date : from : to :
 cc : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=qcppdkim1; bh=nnWLQwiZkQ8s5CJTvwAtHE6CaPCsbe4R6Q/zstn1Luc=;
 b=DZz5I+9VuXJWd7k/TkEHCTpNnPL4Wypx4h/Xq2vqIBngIrpz4gY96hFKFupz7Va4krlg
 2QPJBHhJnQXtDwUK7ZDZ1wtzq9D8Ry+R0llYF+0uSsPLNdoN99qwfBMv5p8CYjLj/3p9
 /V+dtoWoIJ36492O9Rf8uM/QSKEwezvHFcbdoyYq/R35nO1dOUpYeoFpDPbIlUCuMIm4
 8Z/bKKADuD0f5SuVGc569xMX9mljdVu+QyxWpS8Cs/NdJUPQky0N6sACjddRnmehTOOO
 YQfmXlSQbGXJp1ga/DjvuNYChq48aBZgYwfRFUPwYsnx1ppoaPveg0RwnMZuNDr10IGB TA== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3r7auy1p69-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Jun 2023 22:10:09 +0000
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 35EM9iW3028192
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Jun 2023 22:09:45 GMT
Received: from hu-bjorande-lv.qualcomm.com (10.49.16.6) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Wed, 14 Jun 2023 15:09:44 -0700
Date: Wed, 14 Jun 2023 15:09:43 -0700
From: Bjorn Andersson <quic_bjorande@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>
Subject: Re: [PATCH v2 0/3] drm/msm/adreno: GPU support on SC8280XP
Message-ID: <20230614220943.GA2941091@hu-bjorande-lv.qualcomm.com>
References: <20230523011522.65351-1-quic_bjorande@quicinc.com>
 <168675861182.1453524.13825528487008901071.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <168675861182.1453524.13825528487008901071.b4-ty@kernel.org>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: H2uwT20jcJRpnISyN6zyDC_T5LdqIC3a
X-Proofpoint-GUID: H2uwT20jcJRpnISyN6zyDC_T5LdqIC3a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-14_14,2023-06-14_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 lowpriorityscore=0 mlxscore=0 spamscore=0 impostorscore=0 mlxlogscore=999
 adultscore=0 phishscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306140194
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
Cc: devicetree@vger.kernel.org, mani@kernel.org,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>,
 johan@kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 14, 2023 at 09:03:34AM -0700, Bjorn Andersson wrote:
> On Mon, 22 May 2023 18:15:19 -0700, Bjorn Andersson wrote:
> > This series introduces support for A690 in the DRM/MSM driver and
> > enables it for the two SC8280XP laptops.
> > 
> > Bjorn Andersson (3):
> >   drm/msm/adreno: Add Adreno A690 support
> >   arm64: dts: qcom: sc8280xp: Add GPU related nodes
> >   arm64: dts: qcom: sc8280xp: Enable GPU related nodes
> > 
> > [...]
> 
> Applied, thanks!
> 
> [1/3] drm/msm/adreno: Add Adreno A690 support
>       (no commit info)
> [2/3] arm64: dts: qcom: sc8280xp: Add GPU related nodes
>       commit: eec51ab2fd6f447a993c502364704d0cb5bc8cae
> [3/3] arm64: dts: qcom: sc8280xp: Enable GPU related nodes
>       commit: 598a06afca5a2ab4850ce9ff8146ec728cca570c
> 

Seems like I managed to confuse b4, only v4 of the DTS patches were
merged, while Rob merged the driver change.

Regards,
Bjorn
