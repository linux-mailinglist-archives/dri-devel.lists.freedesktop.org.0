Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF2AB919989
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2024 23:00:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DED410E02D;
	Wed, 26 Jun 2024 21:00:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="pVh5gk+t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 193A010E02D;
 Wed, 26 Jun 2024 21:00:39 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45QAfTBj015147;
 Wed, 26 Jun 2024 21:00:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=jz+kGvORTC1/BrO1jPJcuIxC
 U2cPjTlrc1Mn988d9Vc=; b=pVh5gk+tI/6YSvj1hjKjMS4fIsnliLab5k7Gq3WT
 aoLNhwrfz9ln73z0cODRrb7SUxdo0cTm3KwCv4+F83TEAgTSFurBdjFGRZ96o9PT
 52sHVrEtUjLex5G8lLGgEFsDfzP14ibzSbOr2PHcNplUShGIxWFwzZBJpPgJlsm/
 EVpAnSDLQPdK1/mIQxEFREPXwV5ORJ/7GjNXmTyEc3DgoByeX5v2p7zq20PvONZk
 y0sND9JENCDKt0PdK2FDpTcO9QpLqskyqJN/qRSdP+d8ZSgcedxkGyOVTIKl5K70
 HQo+n4imwItx7EMNJVgtXlH5vvvYuF2T1/ugONL4P/3SDg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ywqshtrdm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Jun 2024 21:00:35 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 45QL0YHk000995
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Jun 2024 21:00:34 GMT
Received: from hu-akhilpo-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 26 Jun 2024 14:00:31 -0700
Date: Thu, 27 Jun 2024 02:30:27 +0530
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: freedreno <freedreno@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
 Rob Clark <robdclark@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
 Rob Herring <robh@kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 3/3] arm64: dts: qcom: x1e80100: Add gpu support
Message-ID: <20240626210027.q33fy4bssxgu2bmb@hu-akhilpo-hyd.qualcomm.com>
References: <20240623110753.141400-1-quic_akhilpo@quicinc.com>
 <20240623110753.141400-4-quic_akhilpo@quicinc.com>
 <ionw2k6rz5eokroilrluq2nvh7uap4oans62z66o7fydray7l5@a52bkrf2plkb>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ionw2k6rz5eokroilrluq2nvh7uap4oans62z66o7fydray7l5@a52bkrf2plkb>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: pR-N3FEjDG63EShagIb3RHxxPtHDNfkH
X-Proofpoint-GUID: pR-N3FEjDG63EShagIb3RHxxPtHDNfkH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-26_13,2024-06-25_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015
 bulkscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 mlxscore=0 impostorscore=0 mlxlogscore=884 priorityscore=1501 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2406140001
 definitions=main-2406260153
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

On Mon, Jun 24, 2024 at 12:23:42AM +0300, Dmitry Baryshkov wrote:
> On Sun, Jun 23, 2024 at 04:36:30PM GMT, Akhil P Oommen wrote:
> > Add the necessary dt nodes for gpu support in X1E80100.
> > 
> > Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> > ---
> > 
> >  arch/arm64/boot/dts/qcom/x1e80100.dtsi | 195 +++++++++++++++++++++++++
> >  1 file changed, 195 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> > index 5f90a0b3c016..3e887286bab4 100644
> > --- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> > @@ -6,6 +6,7 @@
> >  #include <dt-bindings/clock/qcom,rpmh.h>
> >  #include <dt-bindings/clock/qcom,x1e80100-dispcc.h>
> >  #include <dt-bindings/clock/qcom,x1e80100-gcc.h>
> > +#include <dt-bindings/clock/qcom,x1e80100-gpucc.h>
> >  #include <dt-bindings/clock/qcom,x1e80100-tcsr.h>
> >  #include <dt-bindings/dma/qcom-gpi.h>
> >  #include <dt-bindings/interconnect/qcom,icc.h>
> 
> 
> > +		gmu: gmu@3d6a000 {
> > +			compatible = "qcom,adreno-gmu-x185.1", "qcom,adreno-gmu";
> > +			reg = <0x0 0x03d50000 0x0 0x10000>,
> > +			      <0x0 0x03d6a000 0x0 0x35000>,
> > +			      <0x0 0x0b280000 0x0 0x10000>;
> > +			reg-names =  "rscc", "gmu", "gmu_pdc";
> 
> Ther @address should match the first resource defined for a device.

I will reorder this and move gmu to first.

-Akhil.

> 
> > +
> -- 
> With best wishes
> Dmitry
