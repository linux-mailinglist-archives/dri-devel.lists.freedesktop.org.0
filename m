Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 184E9B4FDD1
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 15:45:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6645F10E252;
	Tue,  9 Sep 2025 13:45:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ojpuLWI/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C125F10E252
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Sep 2025 13:45:52 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5899LTIQ032407
 for <dri-devel@lists.freedesktop.org>; Tue, 9 Sep 2025 13:45:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 HtGgkybPm6v0URRLFra4Jz238QIDHfHOy7Lnfw1I7jY=; b=ojpuLWI/i/8rSiLF
 PgiIWFM8nkWUz1lFRxSdfSPkqpjx7ZZT+kmzidsQYFlscsuU6w2SY9cyRYaooE3E
 ptoNqi+5sNeEb4staNh0kx46MBRGmsbYyPrVrEYY5WORfuMMbglSMBT3ozl9lVBn
 z5zYXhM+VWba4/FTPj16RPPoKGJRqWZ1v7gD1hyJ9QawZfhbHOUH8hRNfma59hz9
 WkQjGf1vgygkjBrijmeBjjObrZuT11rIKe7AtXl74mjKPun427GNvMZeZ522OUxo
 0v0oYx1PqN8y3bRrOFqGIO+FUiHH5HXGF9w07sKa7scU32TpI17pe+Zy7Tcr0jpx
 gTW5XA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490e4m08w1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Sep 2025 13:45:52 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-7724688833bso5999409b3a.2
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Sep 2025 06:45:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757425551; x=1758030351;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HtGgkybPm6v0URRLFra4Jz238QIDHfHOy7Lnfw1I7jY=;
 b=b7UXL8EgKs5LgqGVNjiy4TCjurYXXnaUE5ieAw8T6mnpPR5Jo+YlajvqPSGem4ONuI
 W6Kw96J4/w9wJOy4HEFa//rk7UyoK9vCdtGmcGN84gkdd20jbdTlPs+rZ85yQhPvS8zQ
 DdqYtjcOG7cBxQf4qa1aXgi17krtffiVY01NTsk41V8w5WnhTvCx5mk1VpwxNX/EhoJg
 KCpJt5EiZfLLqYCNtss7f4Vx+bV3I4o23ChhT2Iu6Gsed3CEFqZnYmGMRK+P4BWkhaTW
 n3Mjs6KcRhGi6ZDXKedzz6NPu59PEr0RP018TU55Wnxv+qKnioRyKoeCBBClyBqQLjxq
 evhw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU3xmqO2v0m/WX2sUHHLJrVwNAzFyjAwUpDxUL4tlE3GBoD9dc8cR9EhUjg+qQzJDaTHZx7P8HthoM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxG311RDuGqqHKG+muKvGpjuqTPMRkaug4+Va/jQhL+pgCAaC6f
 d2KyPya/WjTEGpWIXmhNvbk1SYLDt1vxhfLrBcW8L/hm7joydJ3PT8neMvLKt+JEvV+zmryhb7S
 TKM4hxDSzbaL7wMhDX8JiVoSN2v188p5tBMzh9gTu4jOyn8JQzrmX4A4Z1xMwfs9PYgaN09GSTS
 b5a+E=
X-Gm-Gg: ASbGnctbT3nKkUyv7r0YirJwdog0f41ko/l8tF6h9JyFfKSFoEFmiDvyp9RiBN/nJ0W
 U/xmaWJ6sSefsob2npR/Jp4BrTxpuRhck1gFvSW0nGPAgYFMbMz+tDslwvtrWfH0dg+2ZWZ5Pg7
 rYSLqcgCcnXXJvEpCKSG1unUyOStOIQVRxF7vSSOrph+GiGg2Frg+vd6DSvzKPSzPd69zwCwmdd
 eVMng6X+2zlpL6T8HJ8QD3xqE7hcLbP3lJ52Ith7zA4FqydWXmFPyBK6EpwqEqVth5ZSRyYRy4l
 lGnUNrVT7ZXcO/oy4kPr0hdzwxayuJsCP31a9x6biZ+TsHNTJpNOnkls3u5DnA==
X-Received: by 2002:a05:6a00:13a2:b0:772:48c5:c761 with SMTP id
 d2e1a72fcca58-7742dcccbd2mr13013036b3a.10.1757425550848; 
 Tue, 09 Sep 2025 06:45:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE6cvRFc+/YxS+v49Zyl4iRKsKHIagabDncXnmXjWPenP1jekeJK1Igj52NaYuVapCTIrXssQ==
X-Received: by 2002:a05:6a00:13a2:b0:772:48c5:c761 with SMTP id
 d2e1a72fcca58-7742dcccbd2mr13012985b3a.10.1757425550288; 
 Tue, 09 Sep 2025 06:45:50 -0700 (PDT)
Received: from [10.91.118.43] ([202.46.23.19])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7746612d9c5sm2237291b3a.34.2025.09.09.06.45.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Sep 2025 06:45:49 -0700 (PDT)
Message-ID: <87e8c438-63d0-4f00-b147-4783ad208ab3@oss.qualcomm.com>
Date: Tue, 9 Sep 2025 19:15:42 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/6] arm64: dts: qcom: sa8775p: Add gpu and gmu nodes
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Gaurav Kohli <quic_gkohli@quicinc.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>, Sean Paul
 <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
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
 Dmitry Baryshkov <lumag@kernel.org>
References: <20250822-a663-gpu-support-v4-0-97d26bb2144e@oss.qualcomm.com>
 <20250822-a663-gpu-support-v4-3-97d26bb2144e@oss.qualcomm.com>
 <f11b778d-eba1-4712-81c7-b83f2cb38b46@oss.qualcomm.com>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <f11b778d-eba1-4712-81c7-b83f2cb38b46@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzOCBTYWx0ZWRfXyKEmNU0Gut1X
 cRrGNwUWWTOdz4TEqZfD86rgvG92b7clRgroUiKqVep+ymYNhhWYOuONpl2K1cM9WqMRosUZCUo
 Gk1qSakwuvUCrZhIijoXJlFeAu1GZQcLztd+qUQyTjwAIurKaLtek8Y2NfJz86xVGmj/ySLPsin
 9P32NvgtEUmeJtAZLJKRfRHDlPd0iuq/1371mNUWBYlAS2wpaHotXvjjDeLP1J+PIU37C9Z9/ZV
 FkLHd5UDFzPTa/vR1ZrDrqcgPrm0bwKolBKJp6jdbu7QOTKI6q7CalJ9s1GMVEAAOEU6U9s7P/o
 1IFiEGhYVHCwo/ZPBIOI+hBdsQG0OWfzkSamJtvudMD0DVqu1ovjqF4wWCpN4RMQu6gsvv+enZt
 sIplLN4P
X-Authority-Analysis: v=2.4 cv=J66q7BnS c=1 sm=1 tr=0 ts=68c02f90 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=2iJ5yM1ecYHLd0rZiA0A:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: I1kMuKscqbUXpquglRVclAsiFYWmk9wP
X-Proofpoint-ORIG-GUID: I1kMuKscqbUXpquglRVclAsiFYWmk9wP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-09_01,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0 phishscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060038
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

On 9/3/2025 5:56 PM, Konrad Dybcio wrote:
> On 8/21/25 8:55 PM, Akhil P Oommen wrote:
>> From: Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
>>
>> Add gpu and gmu nodes for sa8775p chipset. As of now all
>> SKUs have the same GPU fmax, so there is no requirement of
>> speed bin support.
>>
>> Signed-off-by: Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>  arch/arm64/boot/dts/qcom/lemans.dtsi | 116 +++++++++++++++++++++++++++++++++++
>>  1 file changed, 116 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
>> index 8ceb59742a9fc6562b2c38731ddabe3a549f7f35..8eac8d4719db9230105ad93ac22287850b6b007c 100644
>> --- a/arch/arm64/boot/dts/qcom/lemans.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
>> @@ -1097,6 +1097,18 @@ ipcc: mailbox@408000 {
>>  			#mbox-cells = <2>;
>>  		};
>>  
>> +		qfprom: efuse@784000 {
>> +			compatible = "qcom,sa8775p-qfprom", "qcom,qfprom";
>> +			reg = <0x0 0x00784000 0x0 0x2410>;
> 
> len = 0x3000

My bad. I missed these additional comments in this thread. Will extend
this range to keep it 4K aligned.

> 
> [...]
> 
>> +		gmu: gmu@3d6a000 {
>> +			compatible = "qcom,adreno-gmu-663.0", "qcom,adreno-gmu";
>> +			reg = <0x0 0x03d6a000 0x0 0x34000>,
> 
> This bleeds into GPU_CC, len should be 0x26000
> 
>> +			      <0x0 0x03de0000 0x0 0x10000>,
>> +			      <0x0 0x0b290000 0x0 0x10000>;
>> +			reg-names = "gmu", "rscc", "gmu_pdc";
>> +			interrupts = <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>;
>> +			interrupt-names = "hfi", "gmu";
>> +			clocks = <&gpucc GPU_CC_CX_GMU_CLK>,
>> +				 <&gpucc GPU_CC_CXO_CLK>,
>> +				 <&gcc GCC_DDRSS_GPU_AXI_CLK>,
>> +				 <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
>> +				 <&gpucc GPU_CC_AHB_CLK>,
>> +				 <&gpucc GPU_CC_HUB_CX_INT_CLK>,
>> +				 <&gpucc GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK>;
> 
> This clock only belongs in the SMMU node

Not really. This is recommended for A663 GPU like other A660 based GPUs.
I know it is not intuitive. Similarly, we used to vote GMU clk for GPU
SMMU earlier.

> 
>> +			clock-names = "gmu",
>> +				      "cxo",
>> +				      "axi",
>> +				      "memnoc",
>> +				      "ahb",
>> +				      "hub",
>> +				      "smmu_vote";
>> +			power-domains = <&gpucc GPU_CC_CX_GDSC>,
>> +					<&gpucc GPU_CC_GX_GDSC>;
>> +			power-domain-names = "cx",
>> +					     "gx";
>> +			iommus = <&adreno_smmu 5 0xc00>;
>> +			operating-points-v2 = <&gmu_opp_table>;
>> +
>> +			gmu_opp_table: opp-table {
>> +				compatible = "operating-points-v2";
>> +
>> +				opp-200000000 {
>> +					opp-hz = /bits/ 64 <200000000>;
> 
> 500 MHz @ RPMH_REGULATOR_LEVEL_SVS, 200 isn't even present in the clock driver
> 

Ack. I guess this is fine. Hopefully GMU won't explode. :)

-Akhil

> Konrad

