Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2E349A1A8A
	for <lists+dri-devel@lfdr.de>; Thu, 17 Oct 2024 08:12:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FD4110E2E6;
	Thu, 17 Oct 2024 06:12:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="Hm+iHbOm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49A9010E2E6;
 Thu, 17 Oct 2024 06:12:37 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49H0Ml3F009850;
 Thu, 17 Oct 2024 06:12:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=36Mj+LWAMG1ObzhZEFt2cE+V
 Q8ole1RPtJozdSz024w=; b=Hm+iHbOmzDH3BA3fFMOc0yBEKs546I9AJK0juyUG
 8c3nLSKI/SaqncUO3lkPd/SHJ/Ap/r+eIKLGFHIcnZDX7y8+aa+kVz3BCe+yBcgK
 z3RdxPFumWPtSeLtUsyT5keBOrglW+F1nsjWuGRuzeLxLJ668ava/colKkyjJShD
 gBSXXDivLxqpfke78PHK44uq/dJoOW54ebXKGsdkwdfelDoq0/v6mwQRzHIJoQ/d
 2PRQlvBGd0Hc+QciZZTd2Q2UHECryC6kDYwEtp5in9dhBV10nMsWqNksdNS2JUke
 b9PGZQKioA4axNprfjmegb6ahbxM+zYQg5xFXHngczYoIQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42ar050qjm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Oct 2024 06:12:28 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49H6CS55014200
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Oct 2024 06:12:28 GMT
Received: from hu-akhilpo-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 16 Oct 2024 23:12:21 -0700
Date: Thu, 17 Oct 2024 11:42:17 +0530
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, "Konrad
 Dybcio" <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>,
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <linux-pm@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: Re: [PATCH RFC 3/3] arm64: dts: qcom: x1e80100: Add ACD levels for GPU
Message-ID: <20241017061217.mmq27egyg5cdlubb@hu-akhilpo-hyd.qualcomm.com>
References: <20241012-gpu-acd-v1-0-1e5e91aa95b6@quicinc.com>
 <20241012-gpu-acd-v1-3-1e5e91aa95b6@quicinc.com>
 <5axuqj4hetfkgg2f53ph4um24b7xfyumktreglxqyzfsdhy25e@deucq7vqxq5l>
 <20241015193540.mcpp2dvkmikruncj@hu-akhilpo-hyd.qualcomm.com>
 <921d3a39-d95c-4156-b376-44e8dc6a6467@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <921d3a39-d95c-4156-b376-44e8dc6a6467@kernel.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: K7ZE-BasbvO9D3-PDBjUmfDM0CqU4eoI
X-Proofpoint-ORIG-GUID: K7ZE-BasbvO9D3-PDBjUmfDM0CqU4eoI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxlogscore=999
 clxscore=1015 spamscore=0 suspectscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 mlxscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410170040
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

On Wed, Oct 16, 2024 at 09:50:04AM +0200, Krzysztof Kozlowski wrote:
> On 15/10/2024 21:35, Akhil P Oommen wrote:
> > On Mon, Oct 14, 2024 at 09:40:13AM +0200, Krzysztof Kozlowski wrote:
> >> On Sat, Oct 12, 2024 at 01:59:30AM +0530, Akhil P Oommen wrote:
> >>> Update GPU node to include acd level values.
> >>>
> >>> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> >>> ---
> >>>  arch/arm64/boot/dts/qcom/x1e80100.dtsi | 11 ++++++++++-
> >>>  1 file changed, 10 insertions(+), 1 deletion(-)
> >>>
> >>> diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> >>> index a36076e3c56b..e6c500480eb1 100644
> >>> --- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> >>> +++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> >>> @@ -3323,60 +3323,69 @@ zap-shader {
> >>>  			};
> >>>  
> >>>  			gpu_opp_table: opp-table {
> >>> -				compatible = "operating-points-v2";
> >>> +				compatible = "operating-points-v2-adreno";
> >>
> >> This nicely breaks all existing users of this DTS. Sorry, no. We are way
> >> past initial bringup/development. One year past.

How do I identify when devicetree is considered stable? An arbitrary
time period doesn't sound like a good idea. Is there a general consensus
on this?

X1E chipset is still considered under development at least till the end of this
year, right?

> > 
> > It is not obvious to me how it breaks backward compatibility. Could you
> 
> I did not say "backward compatibility". I said existing users.
> 
> > please elaborate a bit? I am aware that drivers should be backward
> > compatible with DT, but not the other way. Are we talking about kernels other
> > than Linux?
> > 
> 
> Boot OpenBSD with new DTS. Previously: worked fine. Now: works less fine.
> 
> We had exact talk about this during LPC.
> 
> > Also, does including "operating-points-v2" too here help?
> 
> Fallback? Yes, assuming these are compatible. Not much is explained in
> the commit msg, except duplicating diff. That's not what the commit msg
> is for.

Okay. We can keep the fallback compatible string.

-Akhil.

> 
> 
> Best regards,
> Krzysztof
> 
