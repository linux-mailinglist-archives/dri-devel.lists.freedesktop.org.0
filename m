Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADFC7B422D4
	for <lists+dri-devel@lfdr.de>; Wed,  3 Sep 2025 16:00:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B254A10E8A5;
	Wed,  3 Sep 2025 14:00:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="CFVGfxqV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D02210E8A5
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Sep 2025 14:00:50 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 583Dx6n7019931
 for <dri-devel@lists.freedesktop.org>; Wed, 3 Sep 2025 14:00:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=Z6pj88/J3j1NKaodwkNXmQxi
 gRcyLxr517oZ55+1nuk=; b=CFVGfxqVsPqKflGUyxNKOIe0rLvur1zSQf2LpgzV
 +ILbhpQ0vD5AoJ7+LmJFdk6AHSfrSenkwAEsCZ+DbtBU64bsBOwqQF1RWuvTY7u3
 Rbjt+M/eTERLXCzecdEpMLPFnzObwrwUvK7Fj5aBVkGAM8J1/7aeTbKPShBkyjjx
 gpCTHlt4+cUB/nfSH4McgdMVB+jIWPkLI+cvNHkQfoXjt7Y1/YAqddjpM3XlrP1W
 lyhzm7i7qMIFOSy/C+eC+4mrBSuLC8bb/IK2i9qM8pVmNe4sbKEl7TqJnvwtUwyc
 qYaXegb/3vEHbjSe9rSinT5HrTClAeeXJM96kLIjMSNXaA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48utk93qa7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Sep 2025 14:00:49 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-70de52d2904so157409436d6.0
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Sep 2025 07:00:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756908048; x=1757512848;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Z6pj88/J3j1NKaodwkNXmQxigRcyLxr517oZ55+1nuk=;
 b=RY/yfj7Z6uvEHr9+ufuWVxyvGWTMdw7etEzHWenSBVhCAaeJmxuA9zzIBw/CC0EssH
 OS5B9qgbJ8SNxlkb9iCxxSTi/G2k5x0ow3s98nhxKXh91HK1NCAUj5lIUIRPbVugeIHi
 gKlKCzufWTiTg0VgOPjmjRGQfR5yit20nFpYwsvGzstbR9j/sHt/7pyuIsGBVvw2Vyuj
 sYBE62EMsis5DWZrJ9xbUs9F8rFiv7wG3Vwayvf/QKMbPcNmV7eh72Z2otR2yoHPbE4Z
 Lceia1u1Gmj6mBv/2R2cSC6iddbn3hwS2RDobGonyls5tDjbQWSRKQ9hPLaHF7uFUki/
 gulQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWgDR7p700pkKcqUSSS+ymAwcjvW7dHlCWDrPJy8XC2868PUrX+Pe/fB/kfN1IZQ9r/qwauQM2NwDo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxWTZ1vyKTVnY6qkemGO9PUIzmvI48VoaQ57GOQ8jWIBfydYEhs
 0RUKGEElj1t8dM7zbhEKoReeVR4qvo41Ho31KQ2kiksld4NT1tr8+r12Og8sdLAMs4D+KjiRA8S
 82WjamFA9tbawTihd2OEBonecYxSGZQlSCaQhfCwX/ELKi+kozwnF7dKQ5dVoomYfUAnaCAQ=
X-Gm-Gg: ASbGncs5pBhJZyTf+ca5wyi4AY6oiE6o5KPhDznis6WiU9Pa6e1m2w7SMMQ80B3WkEF
 HBoyB8mTnWX9+4rdxbKqy7VlseHW21YUl6vMfDqFL8L1fEU7m8BU0cjIIfVipLtqFDxdb0ucWPN
 OFbxlZk6CH0tDsudS0Bx6ifIozp8JDtfclK0pDKHa4BbU7/6mO2WP7LCRz/ZMyRSmTtZ6VjriHm
 PTXjb/gKYm6VVYenWZtVKyNOUyN8rkx0BG5oaEiFv/jjBWQRGAtO9Z2ZL6UVVv/eRWOLiiVPJgo
 gUmaEdue2nkMU7sMh1aer4lYLvQSaSQDx5lv6NQGwbNRAaouVpUTjxEEqAqZUEGEnMnwAYiLW6A
 GajJmHeia4Jzk/A5C/v/zOqEFrSM6CM6+4tJ5G48QKmpXagXxM23i
X-Received: by 2002:ac8:5e53:0:b0:4b3:48b2:aa9f with SMTP id
 d75a77b69052e-4b348b2b623mr70291541cf.50.1756908045442; 
 Wed, 03 Sep 2025 07:00:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEnDnwIQkCmFKK18oDjQbnACoTF/d8n+oT9VNWxZl8INMw0myHrJGeaehADC9LPm5hkCdYKhA==
X-Received: by 2002:ac8:5e53:0:b0:4b3:48b2:aa9f with SMTP id
 d75a77b69052e-4b348b2b623mr70287801cf.50.1756908041921; 
 Wed, 03 Sep 2025 07:00:41 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-337f4c90454sm10451921fa.18.2025.09.03.07.00.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Sep 2025 07:00:39 -0700 (PDT)
Date: Wed, 3 Sep 2025 17:00:37 +0300
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
Message-ID: <t5pxum74q3fwf6wgcbaeaginjvtjfn357pkfswvafsggtmvxfv@jl5qjfhpmmow>
References: <20250822-a663-gpu-support-v4-0-97d26bb2144e@oss.qualcomm.com>
 <20250822-a663-gpu-support-v4-3-97d26bb2144e@oss.qualcomm.com>
 <f11b778d-eba1-4712-81c7-b83f2cb38b46@oss.qualcomm.com>
 <exkrgx6rdotfrrsnklsd7zk4ydehsk5vaoevibpqisyq2dwbd4@sa4kgnuexlna>
 <f169be5a-faa5-4824-861e-27bd2083b9cf@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f169be5a-faa5-4824-861e-27bd2083b9cf@oss.qualcomm.com>
X-Proofpoint-GUID: 7e7FjRzaRmXux4E1Ru5q6NqUD27pTL5W
X-Proofpoint-ORIG-GUID: 7e7FjRzaRmXux4E1Ru5q6NqUD27pTL5W
X-Authority-Analysis: v=2.4 cv=ccnSrmDM c=1 sm=1 tr=0 ts=68b84a11 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=I_3-zorBrfLWAkoykd4A:9 a=CjuIK1q_8ugA:10 a=1HOtulTD9v-eNWfpl4qZ:22
 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDA0MiBTYWx0ZWRfX+bD+lLMasChe
 rJweSAHLssaVWiMjaqcsSCUpFynWWlXi238wouwZx1EF2+AQYUOCmSghSTj4R3QQYdMtag8IapZ
 sfBPmDDr+v6OKoXGD/a1vZUGPr7kdiT55s77FE/6mn4+fZFCnTbvpGsYA2toiXW89LtBjJ8JqxN
 R6e3YqiTJDanqFhYHD9MLZhOxYNZav57vGE8ppeswcr8lNWnGt54z5ED+5NidWiyMw02eHbbW+a
 k1wSEc387fo8TmOozcEZepUJ0GpYN9ZN4tYeNu4rYchtZtsDSw2G7KP91YXS2KyS3uqlqMH6dQd
 3jzoR+cnaMvJe+G6XAjQpbRfep14BCBa2Vu8S0DOz5yR9L/lLC53bz2RWAU0rOdfGgI1X7HzVVq
 mRbZzIeD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_07,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 clxscore=1015 suspectscore=0 spamscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300042
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

On Wed, Sep 03, 2025 at 03:36:34PM +0200, Konrad Dybcio wrote:
> On 9/3/25 2:39 PM, Dmitry Baryshkov wrote:
> > On Wed, Sep 03, 2025 at 02:26:30PM +0200, Konrad Dybcio wrote:
> >> On 8/21/25 8:55 PM, Akhil P Oommen wrote:
> >>> From: Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
> >>>
> >>> Add gpu and gmu nodes for sa8775p chipset. As of now all
> >>> SKUs have the same GPU fmax, so there is no requirement of
> >>> speed bin support.
> >>>
> >>> Signed-off-by: Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
> >>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> >>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>> ---
> >>>  arch/arm64/boot/dts/qcom/lemans.dtsi | 116 +++++++++++++++++++++++++++++++++++
> >>>  1 file changed, 116 insertions(+)
> >>>
> >>> diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
> >>> index 8ceb59742a9fc6562b2c38731ddabe3a549f7f35..8eac8d4719db9230105ad93ac22287850b6b007c 100644
> >>> --- a/arch/arm64/boot/dts/qcom/lemans.dtsi
> >>> +++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
> >>> @@ -1097,6 +1097,18 @@ ipcc: mailbox@408000 {
> >>>  			#mbox-cells = <2>;
> >>>  		};
> >>>  
> >>> +		qfprom: efuse@784000 {
> >>> +			compatible = "qcom,sa8775p-qfprom", "qcom,qfprom";
> >>> +			reg = <0x0 0x00784000 0x0 0x2410>;
> >>
> >> len = 0x3000
> >>
> >> [...]
> >>
> >>> +		gmu: gmu@3d6a000 {
> >>> +			compatible = "qcom,adreno-gmu-663.0", "qcom,adreno-gmu";
> >>> +			reg = <0x0 0x03d6a000 0x0 0x34000>,
> >>
> >> This bleeds into GPU_CC, len should be 0x26000
> > 
> > gpucc is in the middle of GMU, see other platforms.
> 
> This is not the case here

Why? I think GPU CC is a part of the GMU by design: GMU accesses GPU CC
registers directly from the firmware.

-- 
With best wishes
Dmitry
