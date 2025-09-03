Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8858AB41F4F
	for <lists+dri-devel@lfdr.de>; Wed,  3 Sep 2025 14:40:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE16010E078;
	Wed,  3 Sep 2025 12:39:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="jP8bZfTk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C10D10E7F8
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Sep 2025 12:39:35 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 583BEtlC022400
 for <dri-devel@lists.freedesktop.org>; Wed, 3 Sep 2025 12:39:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=oB5zz3RfytAZkiTmGBlOmVi4
 cyClShFOwbxdsuokSZg=; b=jP8bZfTkIU6+CM9/1SrD5yO4OdWZSsNZBiMFUweO
 rmVyZ5TMqda6N3bHDJCAfnxH5MmcliWCFu0OLbCKCGYDA/zdWhdd/Sz/hPATj33G
 GtFZGbk/S4EozmQ+ksCCkNV1aebzoLat1wMP/iwS2PcduBR+HiQNouUeTJ9iokXc
 XEhvxkdzTL0RtAxIZaK+XrkDb58wvNEKkpjFb7lo+Oie6///iTGPSjVNwyMlb4NR
 b4OrT4Uvc/lZAg0JlQXS3VMNYLUk2keeSA/KilcyF/32bZF2JTAeS01AxonLkG4a
 aN/7Qo4/P4voZE8fTljEs70fB+vVvZtGfXYlFK4+1ojtkw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ut2fkjca-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Sep 2025 12:39:35 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-720408622e2so34644036d6.0
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Sep 2025 05:39:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756903174; x=1757507974;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oB5zz3RfytAZkiTmGBlOmVi4cyClShFOwbxdsuokSZg=;
 b=cyK7KlrdR3C7dMbQ5eusPEGLodzMFKllocHhENaFJIapsLSUrnT0T+H2ph8tRSIsPZ
 diMC6mVul4MS8ZirqtGurGf28fwRa8CYMNUxpO7zGxxBkYzvj9ZusKcyoQJvQHpk2pzE
 y9Lij05DhtgOVDflr3TJp99hXmohW6I1BChQvpWEu6IMqgHA1PYxfRWkwlac0BetgShH
 bEuUN0ypptT4ZB8PiAlzuCS6Z6qH7TbOT/bw2TUHGRTnkUySxnCNoezoTu4LUmWiQCa5
 QF7tCMxw9QmMO9xlD1WHS5ikZuL2pVzusy86U9d/mDoHjnTlDbuR4Bpgtcjf+Gz6R7q7
 eWLg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUYq1HIEN+PP9+DUWoN5hpjPsu43BqsfcBIGO+F3+hT+JHwagl3Im4S+tFHs8MAMLXg/GlKitWoFgQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzRyNPW5WDNSudIhoSj/hLwyt99HcBvcelUiODWHDapZeffdq/P
 0Spg4+/H+p6VsQgolnNqLNJAIhyKNCiB9OqpqWiHzTKDzpFl4SY0hN1ikCPHNoIXSh6GPmc5yIm
 IOfUgZ4xG1EMdNdOzc0/SiJrsWIc9KONGPYC60Q995ccqX92KPIsi8NO27yhxrk9csDc/zMQ=
X-Gm-Gg: ASbGncv5JLcPI2lH1c06c2v8nF7sRr/g+2NhaRONjP4TfHQC6AM0RWYH7Cr7LqnateO
 8u6CGvGQRfL453vgAlaleCt4WDVTn96KIFiLGmmANk9Hjjv1yJ1GZaals2HSGJNg93XxC/C4o0I
 1KGIc8EZ336Lt0mAi4FMek4x+dKwwWZ3ac5RQwhyX3x/Ze5mP2FBxZBb7e/XrWHIyw7Ljy8ucJD
 XJq5hJkiPMGQSpj16YLSVkxaZ6y5LlP0KFKpO+NP+LcCqEJRfr6OKfC9vk0PfgUqNjysRVPTgmP
 J1/1hMHneNsqPgqAKq+EtoACeuG2kp+wm2mKJHtX3JX03n5GkuHcS+DqPrxjLPiFlAQnqGy3yYe
 e+YEWUwLV2tturs9rVP2V9byd0dIgBFswcO4uNhDtKMqiF5gp3oll
X-Received: by 2002:a05:6214:e8c:b0:71e:bbb8:9db7 with SMTP id
 6a1803df08f44-71ebbb8a459mr109507316d6.34.1756903173377; 
 Wed, 03 Sep 2025 05:39:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG63LR9Aapde9PYpVYUZt99aQbJ5sCqnamanQcH/5zSG/5fKAEXGXcfQRfuN5dgQfaxo69CWw==
X-Received: by 2002:a05:6214:e8c:b0:71e:bbb8:9db7 with SMTP id
 6a1803df08f44-71ebbb8a459mr109506366d6.34.1756903172631; 
 Wed, 03 Sep 2025 05:39:32 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5608aba1767sm503270e87.49.2025.09.03.05.39.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Sep 2025 05:39:31 -0700 (PDT)
Date: Wed, 3 Sep 2025 15:39:29 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Connor Abbott <cwabbott0@gmail.com>,
 Srinivas Kandagatla <srini@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Gaurav Kohli <quic_gkohli@quicinc.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
Subject: Re: [PATCH v4 3/6] arm64: dts: qcom: sa8775p: Add gpu and gmu nodes
Message-ID: <exkrgx6rdotfrrsnklsd7zk4ydehsk5vaoevibpqisyq2dwbd4@sa4kgnuexlna>
References: <20250822-a663-gpu-support-v4-0-97d26bb2144e@oss.qualcomm.com>
 <20250822-a663-gpu-support-v4-3-97d26bb2144e@oss.qualcomm.com>
 <f11b778d-eba1-4712-81c7-b83f2cb38b46@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f11b778d-eba1-4712-81c7-b83f2cb38b46@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzOCBTYWx0ZWRfX3n16LNQd+Gv7
 op1zRqpwaSiuWpUsJOZO0bYbA9vqWBKXMrh+oPcccj4ff+nDzbV3xIgaiWfFkMQTALD5QhX+iCm
 YhkRaJgjmRPRWhz3rjsowbTl+e0TTk+ZSjROpH0RUccc3Q92DHt3GHDtO+XQ3O5sXLee3aehYzW
 TIDjL55spxwO7P4m8uGkFDsYicrOsTSFmR1arlJFM+iaelrjVVbRCk8ZQSUVJYIrEKYzR7rIGpG
 0VjLHpyW2SomTXjOMKIsIHiLmDE3Nktg7D8Jzbi5JRARfH7+aOD0W70dyQmTY0cCauBBx9AehcA
 OL66xy4y8oVY8s4ufaHXi2q/JhQ0kC/9Ppbfmn7rPrS8x2X1cpRef0b1mzCdyl3JQgdacxKpZRt
 aKOEjiqe
X-Proofpoint-ORIG-GUID: VoA9qeKTYiYM0YSUb-fh5fzF5qFOzv4K
X-Proofpoint-GUID: VoA9qeKTYiYM0YSUb-fh5fzF5qFOzv4K
X-Authority-Analysis: v=2.4 cv=U7iSDfru c=1 sm=1 tr=0 ts=68b83707 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=eIaLAbkvAzmcLstrs1gA:9 a=CjuIK1q_8ugA:10 a=iYH6xdkBrDN1Jqds4HTS:22
 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_06,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300038
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

On Wed, Sep 03, 2025 at 02:26:30PM +0200, Konrad Dybcio wrote:
> On 8/21/25 8:55 PM, Akhil P Oommen wrote:
> > From: Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
> > 
> > Add gpu and gmu nodes for sa8775p chipset. As of now all
> > SKUs have the same GPU fmax, so there is no requirement of
> > speed bin support.
> > 
> > Signed-off-by: Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
> > Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  arch/arm64/boot/dts/qcom/lemans.dtsi | 116 +++++++++++++++++++++++++++++++++++
> >  1 file changed, 116 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
> > index 8ceb59742a9fc6562b2c38731ddabe3a549f7f35..8eac8d4719db9230105ad93ac22287850b6b007c 100644
> > --- a/arch/arm64/boot/dts/qcom/lemans.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
> > @@ -1097,6 +1097,18 @@ ipcc: mailbox@408000 {
> >  			#mbox-cells = <2>;
> >  		};
> >  
> > +		qfprom: efuse@784000 {
> > +			compatible = "qcom,sa8775p-qfprom", "qcom,qfprom";
> > +			reg = <0x0 0x00784000 0x0 0x2410>;
> 
> len = 0x3000
> 
> [...]
> 
> > +		gmu: gmu@3d6a000 {
> > +			compatible = "qcom,adreno-gmu-663.0", "qcom,adreno-gmu";
> > +			reg = <0x0 0x03d6a000 0x0 0x34000>,
> 
> This bleeds into GPU_CC, len should be 0x26000

gpucc is in the middle of GMU, see other platforms.

> 
> > +			      <0x0 0x03de0000 0x0 0x10000>,
> > +			      <0x0 0x0b290000 0x0 0x10000>;
> > +			reg-names = "gmu", "rscc", "gmu_pdc";
> > +			interrupts = <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>,
> > +				     <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>;
> > +			interrupt-names = "hfi", "gmu";
> > +			clocks = <&gpucc GPU_CC_CX_GMU_CLK>,
> > +				 <&gpucc GPU_CC_CXO_CLK>,
> > +				 <&gcc GCC_DDRSS_GPU_AXI_CLK>,
> > +				 <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
> > +				 <&gpucc GPU_CC_AHB_CLK>,
> > +				 <&gpucc GPU_CC_HUB_CX_INT_CLK>,
> > +				 <&gpucc GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK>;
> 
> This clock only belongs in the SMMU node
> 
> > +			clock-names = "gmu",
> > +				      "cxo",
> > +				      "axi",
> > +				      "memnoc",
> > +				      "ahb",
> > +				      "hub",
> > +				      "smmu_vote";
> > +			power-domains = <&gpucc GPU_CC_CX_GDSC>,
> > +					<&gpucc GPU_CC_GX_GDSC>;
> > +			power-domain-names = "cx",
> > +					     "gx";
> > +			iommus = <&adreno_smmu 5 0xc00>;
> > +			operating-points-v2 = <&gmu_opp_table>;
> > +
> > +			gmu_opp_table: opp-table {
> > +				compatible = "operating-points-v2";
> > +
> > +				opp-200000000 {
> > +					opp-hz = /bits/ 64 <200000000>;
> 
> 500 MHz @ RPMH_REGULATOR_LEVEL_SVS, 200 isn't even present in the clock driver
> 
> Konrad

-- 
With best wishes
Dmitry
