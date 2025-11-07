Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2562BC3F0D9
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 10:01:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2541E10E1B3;
	Fri,  7 Nov 2025 09:01:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="I8q9+gFl";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CCvps4nf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B22810E1AF
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Nov 2025 09:01:49 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5A757g1u2273426
 for <dri-devel@lists.freedesktop.org>; Fri, 7 Nov 2025 09:01:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 7Xwdlres7UKZJumX+U/fUtnUAYm89N+blgEZuA7qA+U=; b=I8q9+gFlQqTjsN8F
 KhoD6sB3C3NlEz+F7BhoABfsklg1CZH2Ih0raJ8k5PnWjUq6B5sux54Ow67qkL61
 g0TtnetH8cxQjfldn+drdhMRKmZMDAIHWse9W+2793zrOLb6TTTOUTO4fRAZScnu
 Gtx82Ed2i1XtACO1P62nQ1fj64zrFNTEHLWoAIp5nmGmnEoacdSgUL5dmEbFEV1d
 guk+My7kHsJq2uxOSBv5nrxaGBgrTnCk6Q3X09/70+b3bsJpOYzP5chx8A3KBGTZ
 65FgVZ3KbdbL/MzBx/Vy8p0iJrT1ZsDgcUTx8j/Yyy5dinvabtkhizkL/hht7dj9
 8N1C0A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a9abmrm9w-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Nov 2025 09:01:48 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-883618130f5so22883285a.1
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Nov 2025 01:01:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1762506107; x=1763110907;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7Xwdlres7UKZJumX+U/fUtnUAYm89N+blgEZuA7qA+U=;
 b=CCvps4nfkDTG7jwtN2rjWXTb/rtb0+2WAfcGDKH3q5e2E497mMlxwIaGbXfTUf6Jb2
 n++KpA6Mf/fHUsEHYpDhpvTM0hVb00SFyVT0km8L0todD46ErMkNIq2ASlvx/a2D/pSt
 G49T/XsYFSVjVVDjbv44eiieyVYqdgOYsw8FBvPCJ0+pKTAxWwJd8JB1PqLpza9VYpIS
 1UMOMdFT4PrzyCnN2cAzKSzwuqOcwXbnBL1tIcwb8KNbtkjaxsdJY8IQiEjYiHCg8nAG
 47PKlWcR7GFriELi9Wuoon4nEiG4R4i8Zv/25G+ma6JSRXCHnikx4jyOJDSxP8Rj1e0G
 qy0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762506107; x=1763110907;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7Xwdlres7UKZJumX+U/fUtnUAYm89N+blgEZuA7qA+U=;
 b=JY/PF8ZbjBxQAJr9shxlSFuei80KC9Qx+QjJ18wkO45U4ln0kVb/IIbICLbgRSM6NQ
 egkEYZePiZH+xInKfiGKFlpJlqgid7hE/ZzC8zGQC9iV46RI7Ofvgk7Rao/Eq3t+Wd8e
 8zkzS5fHhc264wEXs6wXWgBI/9OUiJtDgo5iBXBaQkbyKKQ2ngfZlxvpLMMVsrwnYt3+
 NmU7hsa4MSg0c6pGV8NU8Pb6fRqKWSnmb0ak1PbiVjp2s8J75+xHpZggXdx/iqTAToch
 9GkMVagi5FlNJObvc4HHn44tQhAY8DwYacII4JYanSEzOXjMVLeyPBK189NK9NYQO0uV
 fDQw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV+vQBve1B3r829VYIaHQ6Jnd9C648uB7kupZ7wjuzFUm9ZBLMuphGdIYAqfGJfdRvp+FcZboUFnH8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx+hgTXYUzQ8kWGg9MFpRCYDaSyArpOYz7PGIKqnSWSKG0fFCrT
 0K9Jn2lc3pORCJSZRIc6VzNmrjM2VLFLmnDBA09n/Dw69Hg1QsgpCOeBl5tyMm7LFk41IUxk7eE
 ftuS04dhybOGDjQAxOKF8++bx/0YhqgJQLHvt1GsnBQoXO2HaZHDvVhQSOEMQeUIKYR/Rjfo=
X-Gm-Gg: ASbGncsDuoXyikFGo3XgXFeYOtjzlblRPGXIJ48oPaCpLc2vOMmHRgAYrOyiWgnA00j
 Ym4iOjYSf4imX2LKkwgm3D2GRVPCjRfE1Fo+6j60hUfTjErABPf0phw4w/FEDCKdRtrK/CQX1/d
 IwYcM8yD5uS5BsNQAJ2DEdaVzUQIP7KgEi+RsAYEaslpTFulaLSGI7TIvMimkXOj2pi0TIx59R6
 IDMB2wm4jmRos4+3/Wd15GoI7xaYTVegznBCMNZ0rtyZw3TSHGNJe2KIHB1DChKJEZH4dzxdUo7
 J22XWT4Dv3xIGJBtAKBea0BRYv0aNozl3DIgTTPpjxyRgFKAf5guo8zSu1DP468LUwuklZvH+Uf
 FzUx/WO0dPdSH19nNQIjwNPbMsAVVXQ8rUBXK+1XuCqJAkLabMmArXBAh
X-Received: by 2002:a05:622a:181c:b0:4e0:b24a:6577 with SMTP id
 d75a77b69052e-4ed949225d6mr17918031cf.2.1762506107426; 
 Fri, 07 Nov 2025 01:01:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFBs2ARbegNGfxVipaDHjwLs6J9evX5dbivnH5xxAvdhKWOJJB0eRECaR784rSXA0QDalhnCg==
X-Received: by 2002:a05:622a:181c:b0:4e0:b24a:6577 with SMTP id
 d75a77b69052e-4ed949225d6mr17917561cf.2.1762506106773; 
 Fri, 07 Nov 2025 01:01:46 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b72bf97d43bsm191672866b.45.2025.11.07.01.01.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Nov 2025 01:01:46 -0800 (PST)
Message-ID: <defc450a-1699-4682-a41e-59035bafccbe@oss.qualcomm.com>
Date: Fri, 7 Nov 2025 10:01:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] arm64: dts: qcom: sm6150: Add gpu and rgmu nodes
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Jessica Zhang <jesszhan0024@gmail.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Jie Zhang <quic_jiezh@quicinc.com>
References: <20251107-qcs615-spin-2-v2-0-a2d7c4fbf6e6@oss.qualcomm.com>
 <20251107-qcs615-spin-2-v2-5-a2d7c4fbf6e6@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251107-qcs615-spin-2-v2-5-a2d7c4fbf6e6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: OUHllSrN3F-WBLlvfq22Fb1FydTJA1Pb
X-Proofpoint-ORIG-GUID: OUHllSrN3F-WBLlvfq22Fb1FydTJA1Pb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA3MDA3MiBTYWx0ZWRfX3avok4Hv5pLK
 XAqS9PbayWVyzbZtgqkcGGkKsoa9ux2mTBrAGfvfZeXsvIuGZdkuKyw3gBWtOHcA++wTzcwxSfm
 otF5ckmbQojX7AlI4QP0qRzCWqVUcrN9+PZmzYbI5afQUhRa6+8NYvnRQhYDEg4GUtnKdDN47Zs
 4G4bGdIKCPKLzO7Ha9lU4GOkxQQMAjbCsTTzeFQ+3k+xmmJA9c3DukWUiAqqflxjlLcJ6hsf0tZ
 pa/3AgPCrT4gXyvSN3Cs+r+8wr3QOX3ktmwjF/tXkNADqd1E924QMlO+rw6LwHRRCduSftPag3g
 tk5cjYuLPQqvVG0/VWJtpUdwLWY5ksvBOyxZBF+/5UmLtSiU9DbnJSlgxp2WUrMgYI2nA1OXmDN
 qpqEt2F/930q17j6vuv9eS2zsZAACA==
X-Authority-Analysis: v=2.4 cv=HPjO14tv c=1 sm=1 tr=0 ts=690db57c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=mufC2ag2MkhLk2B-SdYA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-07_02,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511070072
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

On 11/6/25 9:50 PM, Akhil P Oommen wrote:
> From: Jie Zhang <quic_jiezh@quicinc.com>
> 
> Add gpu and rgmu nodes for qcs615 chipset.
> 
> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

[...]

> +		rgmu: rgmu@506a000 {
> +			compatible = "qcom,adreno-rgmu-612.0", "qcom,adreno-rgmu";
> +			reg = <0x0 0x0506a000 0x0 0x34000>;
> +			reg-names = "gmu";
> +
> +			clocks = <&gpucc GPU_CC_CX_GMU_CLK>,
> +				 <&gpucc GPU_CC_CXO_CLK>,
> +				 <&gcc GCC_DDRSS_GPU_AXI_CLK>,
> +				 <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
> +				 <&gpucc GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK>;

Is this last clock really necessary?

Konrad

