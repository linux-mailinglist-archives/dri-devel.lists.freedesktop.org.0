Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2351F913C08
	for <lists+dri-devel@lfdr.de>; Sun, 23 Jun 2024 17:16:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28F1E10E032;
	Sun, 23 Jun 2024 15:16:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="hq3MRWsL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3775410E032;
 Sun, 23 Jun 2024 15:16:45 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45NCra2G032082;
 Sun, 23 Jun 2024 15:16:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=UQEPgx4q8Ps5aQqYl668p4Ii
 oyWdh5cXGvkATol/Ua4=; b=hq3MRWsLLn5DybUKJgs8uKBzOK+MpQgDiTy7Mcii
 9ihOo+YUuCndiCgqHCMeH0LfyAtUmvo/vsSmTge+Xr7JwxoYLajW3/geXyZhK7O/
 lQQEuvkbwVg3PSMCUFVO1XeOu/aDk9V7bHmN6mZe7+3wouL377jOC7so4s9CSYBY
 ORmNzJGYG8BFwTJ/+ZW9v2WVKz3sRrGAIdThtR6BvexF7lcDYMKfoF3VeaPanZVn
 /SXJcY4ssC+TR5ZHxMpcCP+cbu9rnwFcg0tvc4bNrlx0yjI7muyCXdCaoUcd8eIY
 Du4FxL9c9+jeE4vwV9JWLAZyclUfZmniCtkfp1wCtlQK8A==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ywkyn20rd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 23 Jun 2024 15:16:40 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 45NFGcKQ023059
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 23 Jun 2024 15:16:38 GMT
Received: from hu-akhilpo-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 23 Jun 2024 08:16:34 -0700
Date: Sun, 23 Jun 2024 20:46:30 +0530
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: freedreno <freedreno@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
 Rob Clark <robdclark@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
 Rob Herring <robh@kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 3/3] arm64: dts: qcom: x1e80100: Add gpu support
Message-ID: <20240623151630.bskqwqhp25mu3yuf@hu-akhilpo-hyd.qualcomm.com>
References: <20240623110753.141400-1-quic_akhilpo@quicinc.com>
 <20240623110753.141400-4-quic_akhilpo@quicinc.com>
 <a458a3a7-2b6d-4032-949c-b2c021d339e8@kernel.org>
 <20240623122856.kqf4x6mft74hzk7y@hu-akhilpo-hyd.qualcomm.com>
 <7d69e98d-a870-4200-8f22-2a16fcf02794@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <7d69e98d-a870-4200-8f22-2a16fcf02794@kernel.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: VeifPqgPBpSGbWurgtZo3aWPTg6xaO9T
X-Proofpoint-GUID: VeifPqgPBpSGbWurgtZo3aWPTg6xaO9T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-23_07,2024-06-21_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0
 mlxscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 mlxlogscore=999 spamscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2406230122
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

On Sun, Jun 23, 2024 at 02:53:17PM +0200, Krzysztof Kozlowski wrote:
> On 23/06/2024 14:28, Akhil P Oommen wrote:
> > On Sun, Jun 23, 2024 at 01:17:16PM +0200, Krzysztof Kozlowski wrote:
> >> On 23/06/2024 13:06, Akhil P Oommen wrote:
> >>> Add the necessary dt nodes for gpu support in X1E80100.
> >>>
> >>> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> >>> ---
> >>> +		gmu: gmu@3d6a000 {
> >>> +			compatible = "qcom,adreno-gmu-x185.1", "qcom,adreno-gmu";
> >>> +			reg = <0x0 0x03d50000 0x0 0x10000>,
> >>> +			      <0x0 0x03d6a000 0x0 0x35000>,
> >>> +			      <0x0 0x0b280000 0x0 0x10000>;
> >>> +			reg-names =  "rscc", "gmu", "gmu_pdc";
> >>
> >> Really, please start testing your patches. Your internal instructions
> >> tells you to do that, so please follow it carefully. Don't use the
> >> community as the tool, because you do not want to run checks and
> >> investigate results.
> > 
> > This was obviously tested before (and retested now) and everything works. I am
> > confused about what you meant. Could you please elaborate a bit? The device
> > and the compilation/test setup is new for me, so I am wondering if I
> > made any silly mistake!
> 
> Eh, your DTS is not correct, but this could not be pointed out by tests,
> because the binding does not work. :(

I reordered both "reg" and "reg-names" arrays based on the address. Not sure if
that is what we are talking about here. Gpu driver uses platform_get_resource_byname()
to query mmio resources.

I will retest dt-bindings and dts checks after picking the patches you
just posted and report back. Is the schema supposed to enforce strict
order?

-Akhil.
> 
> I'll fix up the binding and then please test on top of my patch (see
> your internal guideline about necessary tests before sending any binding
> or DTS patch).
> 
> Best regards,
> Krzysztof
> 
