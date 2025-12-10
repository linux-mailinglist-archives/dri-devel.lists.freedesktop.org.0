Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A534CB2695
	for <lists+dri-devel@lfdr.de>; Wed, 10 Dec 2025 09:30:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F39710E6A1;
	Wed, 10 Dec 2025 08:30:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="OEsdP+jE";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BoXGwfKn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80F4710E6A1
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Dec 2025 08:30:45 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BA6E1C31047171
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Dec 2025 08:30:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=BaVrsxaWW/xE3ijm84e8O1hc
 kueX7M+RVS9RTEowbKE=; b=OEsdP+jEmVLOtgYQJdWiV0cdwhOLghB6WILlPtow
 iz9n9w35272+wXQpuGJ3cTvvnf+04iCTYno6/qbGTynUKrc5AAAOcWbDe8w08Qmb
 Xak+veMGTdahnIprG7Nsa2E7paaOw/SzkbTrykCbWQGBImrXFXiGHbtlBylT4aNK
 AbKg7auT7DV0tEigcaABid1or0GK82GYwcn+ZJwW5zkbeJoU1hox8r2P6tQSiK3u
 JMju5s8IWO7fWZIPBO2ON0lzwEh1q/8FfSyWWAIg9acjTrBS+vady3NjVlKcrB9U
 MG1MN/rsxDKgymkJwQHJbPgRQwZlw8VukXHUm9USYcTdmg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4axwbf1kg9-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Dec 2025 08:30:43 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4ee09211413so154751851cf.2
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Dec 2025 00:30:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1765355442; x=1765960242;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=BaVrsxaWW/xE3ijm84e8O1hckueX7M+RVS9RTEowbKE=;
 b=BoXGwfKnAX5EEzev2woinGFBy/uS4dztfT91Fk3whM76xnuoo59CaEmdCJbGfIOike
 hqXArEV+jMy6u/452fyRIrN6ijZzC8zG3YR1FV2NC4f4tfhYg+26V30ptY/DiOBCHj1B
 SdIatMplooUEph/mLQTBIPsYMj0QBFmoUFF0rTxNdhNcjzyShh2YrVcTRGVtDhMpzzED
 b+PaFUtkfB8LrYXUWb5HEbgposEKbyubTUt0Qfn82gueef/U2aNm7v3K5ZUEc7XjMhsq
 mBx+tm+bq5Y0um3wm34QyyPKlkObpiEU+a92p00vWXXgmhjii3cMVq7FyL43khXQBoel
 Ig/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765355442; x=1765960242;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BaVrsxaWW/xE3ijm84e8O1hckueX7M+RVS9RTEowbKE=;
 b=i0QOF1f3YRbaxMb4ZIS5XyWstVBvbV6DnGpN4+JQi9UPr/DPL9GxInwoLvwZX/u6dq
 fTzrTaEpXCEi7t+gJixh5ELkbdVKWwt00BxdVJ4qPBmFY5Uh2LViX2tdzAes9OTUV3yt
 li8aktAZjxjE8GDQFPoxTogM6B/EroDaADTg0L7lUe2f5c2v+zjImQ2mM5zPbEVX4lXe
 w3yFFiXYZzFmgsH/WkKE4EJUI9N6uUSkxEksKKXFKAc21G2BleXV0kCZvzoC2CDckEQ8
 gCgHEaTsWP63ySDGSRgY2t/zcyf07IZ5rHHnz2I1zlslNsgHnKTGO2Kv5y3ycGVuWkVo
 Rz7g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWT2pFYc/qxI3F+BkBZyNw3uCM+9GmqmO7eYcPfVKeZky7zpnnAXweiPNepAScgWVj4lCDN6QzAp10=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxl1ljldGKKPw3wRqLBBZykBiuCqhB4+ggc1GO18+vn9gfFGrAb
 CKkzVlqzQUPgJ5Aa1cwNhF6SxgC+aaf3Zs19YAk7adumB9uCaXT2WDWv4HOFVgo1inOcQNs2ZEC
 HjOJxSSn/YfPTLqAtc9iSUaap3/kJ/Lw/ijoYb0vm3mg6BsasBe5NnmZSwHQ7kIOEJi6HY9s=
X-Gm-Gg: ASbGncu3low04Kjbk/nU+82Ueg3pzKcKP9+DuwKM1/cVVlzuPJK+eBi8O/TVlPgUe++
 Inrbnfirp5Xo69Xr7LH+WYO0NOO9thnRZq5dzUOPpeKS3pjAOrKJwKZ5503p4N+R2zs8yzXa7LW
 bIRALN6lXI5636PuN0XM/ve4vQpTSoP5f4eId6OSY32gE7+mUAIczERD9mqKwTfb5vJDP02j87X
 RLOWav2BJwgwQBhdC4IK6k3V8i8bkBrLiqae/IhQf0K1T/LmXr3wb/p8X54Kk8UCGXtjOy2PpIf
 bXW/1klXO/QqJrBZsWL/buUUpIC0pech5IKiJYBWvBAYpRagkMzrCBTHqhmGXL7ZR7HWgT/JcKa
 BvYs6mr2wT1y/cMdK4LOC7TlSoqHB1SSiGPDC6c/y4othEkNY0WiD+tO1TUg3Xsbxkg+pKEQ8uS
 DASe7pmnmHTnSXz8x5ByYMRrc=
X-Received: by 2002:a05:622a:a30a:b0:4ee:1806:97f7 with SMTP id
 d75a77b69052e-4f1b1a7db1dmr15168691cf.47.1765355442540; 
 Wed, 10 Dec 2025 00:30:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHtqikgbD78OR/TCirFrEnhCsQjS6VLCnfWR6a+KQxIbEmUhDluyiIUFEvvL7QnBCmP9kh7zQ==
X-Received: by 2002:a05:622a:a30a:b0:4ee:1806:97f7 with SMTP id
 d75a77b69052e-4f1b1a7db1dmr15168321cf.47.1765355441988; 
 Wed, 10 Dec 2025 00:30:41 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-597d7c1e2acsm6186915e87.61.2025.12.10.00.30.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Dec 2025 00:30:41 -0800 (PST)
Date: Wed, 10 Dec 2025 10:30:39 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>
Cc: marijn.suijten@somainline.org, swboyd@chromium.org, mripard@kernel.org,
 abel.vesa@linaro.org, andersson@kernel.org, konradybcio@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 robin.clark@oss.qualcomm.com, jessica.zhang@oss.qualcomm.com,
 abhinav.kumar@linux.dev, sean@poorly.run, airlied@gmail.com,
 simona@ffwll.ch, alex.vinarskis@gmail.com,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
 quic_riteshk@quicinc.com, quic_amitsi@quicinc.com,
 Mahadevan P <mahadevan.p@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: lemans: add mdss1 display
 device nodes
Message-ID: <cndguco6ijb666ugbqpbffyhbbgs2nyno3qujuevz5dnpegir3@ygkh7vctnzuj>
References: <20251125105622.1755651-1-quic_mkuntuma@quicinc.com>
 <20251125105622.1755651-3-quic_mkuntuma@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251125105622.1755651-3-quic_mkuntuma@quicinc.com>
X-Proofpoint-GUID: IvCB92gMpuFjmHtcjeFcnABIuqXAntdK
X-Proofpoint-ORIG-GUID: IvCB92gMpuFjmHtcjeFcnABIuqXAntdK
X-Authority-Analysis: v=2.4 cv=f/dFxeyM c=1 sm=1 tr=0 ts=69392fb3 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=Dm6QUQfMve3NhQMXUkAA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEwMDA3MyBTYWx0ZWRfX4GA6D1+j1Oly
 H6HbqBYVI4vdAiRRiLnb7ZZSXvcJjW600Zjt0ReZQFnnMKJMb5bUfOvSunGn8kJw8+8lCv8jYXW
 j3zO+0S85RwSF3Ib1IGnLBLFqJz6FpBTd/gfv8h3PFGZAhNB6JPKrSFwHdfEC4BzMT7Dy4rA8OL
 b9Tkxbv2VdxPUU+3Xr1q3a/pOzknL4TlG3eR6u9fPAronF1JbSRrysRxausLQijrYfb/Hcy5vyU
 PF9aHnDuZosPA5AezaGZJ3Mi9juhAk8eAAgoh6d8WXOYvs52iT4h7U0yT01fxro0VDDMMsCTJrK
 tmAKOOeAezgEEfOdQgQXayp8oF6+NVV3oZpY6fl1PAgghCQb4/wTYBbyq8QNEGEVfXkFm1LvBH7
 ZtR7+0aqea7RBXc4ZnjJ4dkFoLuJMA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_05,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 impostorscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512100073
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

On Tue, Nov 25, 2025 at 04:26:21PM +0530, Mani Chandana Ballary Kuntumalla wrote:
> Add devicetree changes to enable second Mobile Display Subsystem (mdss1),
> Display Processing Unit(DPU), Display Port(DP) controllers and eDP PHYs
> on the Qualcomm Lemans platform.
> 
> Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> Signed-off-by: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/lemans.dtsi | 338 ++++++++++++++++++++++++++-
>  1 file changed, 336 insertions(+), 2 deletions(-)
> 
> +
> +				mdss1_dp_opp_table: opp-table {

Why do we need two instances of the table?

> +					compatible = "operating-points-v2";
> +
> +					opp-160000000 {
> +						opp-hz = /bits/ 64 <160000000>;
> +						required-opps = <&rpmhpd_opp_low_svs>;
> +					};
> +
> +					opp-270000000 {
> +						opp-hz = /bits/ 64 <270000000>;
> +						required-opps = <&rpmhpd_opp_svs>;
> +					};
> +
> +					opp-540000000 {
> +						opp-hz = /bits/ 64 <540000000>;
> +						required-opps = <&rpmhpd_opp_svs_l1>;
> +					};
> +
> +					opp-810000000 {
> +						opp-hz = /bits/ 64 <810000000>;
> +						required-opps = <&rpmhpd_opp_nom>;
> +					};
> +				};
> +			};
> +
> +				mdss1_dp1_opp_table: opp-table {
> +					compatible = "operating-points-v2";
> +
> +					opp-160000000 {
> +						opp-hz = /bits/ 64 <160000000>;
> +						required-opps = <&rpmhpd_opp_low_svs>;
> +					};
> +
> +					opp-270000000 {
> +						opp-hz = /bits/ 64 <270000000>;
> +						required-opps = <&rpmhpd_opp_svs>;
> +					};
> +
> +					opp-540000000 {
> +						opp-hz = /bits/ 64 <540000000>;
> +						required-opps = <&rpmhpd_opp_svs_l1>;
> +					};
> +
> +					opp-810000000 {
> +						opp-hz = /bits/ 64 <810000000>;
> +						required-opps = <&rpmhpd_opp_nom>;
> +					};
> +				};
> +			};
> +		};
> +

-- 
With best wishes
Dmitry
