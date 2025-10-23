Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F2FC03A79
	for <lists+dri-devel@lfdr.de>; Fri, 24 Oct 2025 00:17:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B2B210E978;
	Thu, 23 Oct 2025 22:17:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="UUasmk3g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1465410E972
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 22:17:39 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59NCLDFl023736
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 22:17:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 eXhgsnolQuosOCqmxN7GIdRp3agVwulspfbFQ5KcWGY=; b=UUasmk3gf49mUvbJ
 7h9Zg0DoBYf71jSH/3zOhijwNaCgP2i+48GuW9H5qosi3VLTbxGHYWQUc/tBO0Om
 VoVHYzeK1ud3GNdPzLS2M+mEosafzK204m8C7oFEn8QyoCkp1Tv512dj/Ji10gMQ
 kO3YAjYEnAm6lakLFShMTXtXvLjFUnoHOZ2mb8tOHMi2qPhSuCcv14O22ZuoV04P
 1szQTcDb5kDMKNffEAzCSvHjrYqo+iBEouBsB3ODzDNLPiS0pA2BDlFFIPISg1dq
 4ECTvchqCaE7OFB7bhUlKuaDE5Wiuy7JVReKkZNV8qizgXCfdm107V4ItHwpTjQV
 5ULgJw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49ym9j1qds-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 22:17:38 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-76e2eb787f2so1162368b3a.3
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 15:17:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761257857; x=1761862657;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eXhgsnolQuosOCqmxN7GIdRp3agVwulspfbFQ5KcWGY=;
 b=K9H2TLkzmw9Lj0RbkOcE4B5O+BkziFmkagTArYkLE/ib7yMKgUg/+u6M9ka4rrw0WN
 cEq1EvOF/1GUz9NQIvkCHn36g1iw7Q5OpAUvjgaS3cSixKhUuHiXlkz7ZpVhmTy3eWGn
 CyI2D/ADsr0U8L6JIi/e9mszbLFuvtO4rrbUnRl0J23Bl6J4ia/Sdp6nDOTgcjDeomB9
 8Tz68mnNIJvJFYRb4nJNXcgLmwxxMD2St1CINkMgKQDFrLzDqlXKa5+hveytQ0m94z5e
 HN7mM9yHuEvBusP57yH8MTBFIYs9el86AI041UXThAaF3WtYqfd1OcBv/SMFwPwP9P/q
 xOVg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXNgDkFqGMPyLqiWxTQqJpF6GLIP0qsEV3wMNT3ulOBTB9paNtOYHz4jAqxtGdYFFnigxUm1hWiQoc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx5bc8ylrsg8HUP6BZcCAAxu7fbgqG+X4uf9jWquUJfNJkPoevL
 DjdUjaKN8NaN5tDXRb4UxGVfgca8/hMFfvg/c/2ZM5XDtXsMJgBczLdsNx0DNJHUfguiJ3NliXE
 DVZV4aQQ56XatVGUNDhbC/CcTLwXMgkeTlR6lkOmIRV2UGuN44l+7uBpp6cfr8KJbJAGj/Lg=
X-Gm-Gg: ASbGncvbGujT4GwVe4O5ucFbUUHw7+qUtIe2w5NMYa4WUCj77B8Ks4Zg/HKwmsakJbI
 19N24qJ1ISnzKq7GHHGVTDYCLD2/VrYVMp+aCwZfnldnVzQ+NiJmXInL4yqtKcMHTPXeAAsDE6s
 jaSgFpaovIyDF6xLEyz4s3FqOBVeGlRC+PZrK1nv1qccGrimpROCU1MS/S+H8+KRNALS2Et4vYo
 /QDnnVD5gGCIz3L+PEDt2rPVqedvIoYLwROtkw0+FHezfIZLXsMoIY324hFZtgB0hPSB6dZkQuQ
 xXb5gceWP6c2ezpu0g2fw0YOABYqBxl+DU5dxO/jCYvNTFUH+DwzAhhnCHxH7/d8Xkxqf9Pz0yV
 ikrfAvDtieUn9mCySfJMzOGQ=
X-Received: by 2002:a05:6a00:92aa:b0:79a:fd01:dfa9 with SMTP id
 d2e1a72fcca58-7a286765c70mr34300b3a.6.1761257857346; 
 Thu, 23 Oct 2025 15:17:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEXCip3lfFlFFHAfU+3zmg9cMpt0K19PwWmMQCOg96oi40mBOKNaVibdgO92QzHjjA63GTbQA==
X-Received: by 2002:a05:6a00:92aa:b0:79a:fd01:dfa9 with SMTP id
 d2e1a72fcca58-7a286765c70mr34262b3a.6.1761257856827; 
 Thu, 23 Oct 2025 15:17:36 -0700 (PDT)
Received: from [192.168.1.5] ([106.222.232.102])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7a274b8b32asm3691332b3a.43.2025.10.23.15.17.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Oct 2025 15:17:36 -0700 (PDT)
Message-ID: <25ad160b-b618-4ade-a978-e4ae56c79e32@oss.qualcomm.com>
Date: Fri, 24 Oct 2025 03:47:29 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] arm64: dts: qcom: qcs615: Add gpu and rgmu nodes
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Jie Zhang <quic_jiezh@quicinc.com>
References: <20251017-qcs615-spin-2-v1-0-0baa44f80905@oss.qualcomm.com>
 <20251017-qcs615-spin-2-v1-5-0baa44f80905@oss.qualcomm.com>
 <fdec4bf0-6d88-4a9b-a81a-061476dd9e1b@oss.qualcomm.com>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <fdec4bf0-6d88-4a9b-a81a-061476dd9e1b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=CLknnBrD c=1 sm=1 tr=0 ts=68faa982 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=OORdEvYNKPdDRPFHMUl15A==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=bgAURMIcSi5BoiUHQI0A:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIzMDExMiBTYWx0ZWRfX692Atw3dSCVv
 6lys54SCRDJ1tKGMlZmKi+xpo9Ma7pnCvmv0ek4PJ12nUidSlhE71WTs0psTWbeHo3YtZTMkm5c
 0600FRWUqjZQWAo7rxBe8TfNMyacFQgRnu3du894ufuG9H/7mNeo5pxyMA8GTFydMraH/xgiIle
 te9pnOB4MzJAVnKHMWtbMWbuPEhWkQXxuqZpOoV8uzy4fvQFUFAC5U4Vzgi9Z8+Fo+Y7bqod/7d
 AEIuCQXeh97q0zrawsDVNCL0JD1RSHiFgo2Uh0CABg1cBXUzaFCHTlLOiC6mPBB3uZalxFjM/HM
 npG1xv4LSzhz4LeBYUV/46uP618GNpj2ozTB6l6gK3/8m0qJzF5KRsvDNocSxESHLENPVRrlo/u
 hVmi/KGZFa3HbXNI3p6GSUb+hDHCWA==
X-Proofpoint-GUID: bVJT8UAti1r0U3E6Eqojgyho-dEQpGM2
X-Proofpoint-ORIG-GUID: bVJT8UAti1r0U3E6Eqojgyho-dEQpGM2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-23_03,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 phishscore=0 bulkscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 impostorscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510230112
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

On 10/22/2025 8:57 PM, Konrad Dybcio wrote:
> On 10/17/25 7:08 PM, Akhil P Oommen wrote:
>> From: Jie Zhang <quic_jiezh@quicinc.com>
>>
>> Add gpu and rgmu nodes for qcs615 chipset.
>>
>> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +			gpu_zap_shader: zap-shader {
>> +				memory-region = <&pil_gpu_mem>;
>> +			};
>> +
>> +			gpu_opp_table: opp-table {
>> +				compatible = "operating-points-v2";
>> +
>> +				opp-845000000 {
>> +					opp-hz = /bits/ 64 <845000000>;
>> +					required-opps = <&rpmhpd_opp_turbo>;
>> +					opp-peak-kBps = <7050000>;
> 
> Are there speed bins?

None I am aware of as of now.

> 
> [...]
> 
>> +		rgmu: rgmu@506a000 {
>> +			compatible = "qcom,adreno-rgmu-612.0", "qcom,adreno-rgmu";
>> +			reg = <0x0 0x0506a000 0x0 0x34000>;
>> +			reg-names = "gmu";
>> +
>> +			clocks = <&gpucc GPU_CC_CX_GMU_CLK>,
>> +				 <&gpucc GPU_CC_CXO_CLK>,
>> +				 <&gcc GCC_DDRSS_GPU_AXI_CLK>,
>> +				 <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
>> +				 <&gpucc GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK>;
>> +			clock-names = "gmu",
>> +				      "cxo",
>> +				      "axi",
>> +				      "memnoc",
>> +				      "smmu_vote";
>> +
>> +			power-domains = <&gpucc CX_GDSC>,
>> +					<&gpucc GX_GDSC>,
>> +					<&rpmhpd RPMHPD_CX>;
>> +			power-domain-names = "cx", "gx", "vdd_cx";
> 
> I think the gpucc node should reference _CX directly instead,
> then genpd/opp should trickle the requirements up the chain

Do you mean the CX rail scaling here should be handled by gpucc clk driver?


> 
>> +
>> +			interrupts = <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>;
>> +			interrupt-names = "oob", "gmu";
> 
> 1 a line, please

Ack. Thanks

-Akhil

> 
> lgtm otherwise
> 
> Konrad


