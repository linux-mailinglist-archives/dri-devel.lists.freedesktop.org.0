Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14C27CA3FB3
	for <lists+dri-devel@lfdr.de>; Thu, 04 Dec 2025 15:19:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCE5410E1E4;
	Thu,  4 Dec 2025 14:19:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="HCEGbSFv";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OoVDLjKH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2D9810E1E1
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Dec 2025 14:19:15 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5B4AvDL01119464
 for <dri-devel@lists.freedesktop.org>; Thu, 4 Dec 2025 14:19:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=mqkwYOUmyjupzirFYCxiZXeG
 rlAicEzgr6b6eb9AWv8=; b=HCEGbSFvYa0sLYysDUcgB9uuxQEeLSuSdpnYs5P8
 rR9vvSlSDap99mqTIweB8oejsLdx943GsX7638oAwSAyJKLMH8zvzHJqJ18e+Qn6
 fmwA+Mx3HRBh7aiRJq1arz14AuxR/StWKilHp4UIMBxeWtEl9qv6OQLfZSCBi23t
 eqvmXiiK67Ssbus9YwOM/Isfcs+psU+rVMWbdzBGZXrrnoZO7wzBCti/fZIdUKhE
 Qu0PLv2e1B3iqkkPFnVwAZX5o6gTOG3naXYE/vYDYFNvoUhgT6eZBpW4xgVtpY17
 URP97X8dSu8rhcSTeTS/+s4+NFfBGn9156a+y00tcItKmA==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com
 [209.85.221.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4au90frh1q-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Dec 2025 14:19:15 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id
 71dfb90a1353d-55b29194c04so676565e0c.3
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Dec 2025 06:19:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1764857954; x=1765462754;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=mqkwYOUmyjupzirFYCxiZXeGrlAicEzgr6b6eb9AWv8=;
 b=OoVDLjKHjFtO6eBxJmBtS34+TreNufUe9J88qBZ+XKE6zqQbDBL9iN5CXas8WTIZlV
 G0cVhMSFrtef/+ZQhHksS7knk6xNEzcq+tPipxuQk5TaHi/mslxMEgJWrI4wHKr8/kGf
 NyJkStnGcqfiWQo/8Km7Q3cCaL4KPLNxvCB1gtldp+/Zb+p/+PKejVA9XlIMPUlH9jet
 s0twDKXJXp1LjXkqheWRox04BTUFLLIAfE07upihaepVg82kH9laX1ewJy1T6fFoemN8
 aESgstMCiXjAJthh2hxo2yPnPGnesVP7/JrfReC36bi1jeH/Sw1xkaAMTcx9KQyfPlTT
 jHjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764857954; x=1765462754;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mqkwYOUmyjupzirFYCxiZXeGrlAicEzgr6b6eb9AWv8=;
 b=L0PEWa/iNzAGm8pNWccFgBX+f0R40ekAsBPKywvR7qYnwTQdWD1OlpoqaBCK/Y0Za+
 JAEhBEyCroDItX1jqgWfkXdzYnRSJOWXYDHTvSBXEyCndRbYlnbS3Ikh7U1RbpRSGKtH
 au46+Zj0sqMbonC6hWmfJ1DunjpDTGyD3nOcZt7aDZ/Mh0bGsM5iZTd2zvj0oi1hNl4O
 QHoLJVr7HPJPx2CyCOg0t+fyxOCn9EmhkucM6VNtPipVmEA0VDRuWjFfA00dQ79qlBY/
 dcl45CL1o7sNTIHAVnzbVqcGYprgfneCZwsvosmv99IImDUZiewEMuF0aqcEMegp1rkE
 KLmQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUlEJV90y+IMyW2YF/RpSdrpK+HCvvmvzhzOWy9l/Oa/v/hcxecfQa6pDUZ5ejf7JNDNY0k8C10V0k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzvWeFglQU/TpFKR76BqHRXkVqMvRYITAirnI1upMRYR7Tqghe2
 uD3M7EyZC/bIR02mBTPptSt2R58SxhvJpyBcpRxnRBr9d7n140l+cgp6VuHLsdzyjdhsudraSF4
 JdUOPyJEj+CIwxFer5krCfIb5yULch81K5EYcORYz8yyBIR+92Ho3a1AqxdmvjQGCQG8IDvc=
X-Gm-Gg: ASbGncuuse1Hs4AMcatOtaDdv1IMuUNMC0nNbNGGW9qquZgs1SIrfSRhB8OmvdvhWin
 SmXmRjhqmRO6CA99hI9dfEdYmNJlu6SQcAt0EG9pZam3yTLCH6/uh/ubRBwgYFFtlpJ5P4qZ5ZW
 uUm2MV1rofkekbKpS2PD5v2aofL6wtJeh7wrdJtQ1niKP3pL0kgiM6a7FkndY0AZGUdrDCWgC0P
 RcG3kA9PiBNf1ZINo50VCv9UWrHhXcJTjHoMKGmQMC6go0EREMldOr3wc+6TBXCn4fF/yOi8Mj8
 JW7tted/4z3h3SoYeGz6GFtfatyam9X5NPBW2vDA2ptvAujHJDpQ8OteCukyO+wBBpI3KeW125S
 uxGuEBXBl+IaPH6kXFWJoV8GfB9nMZYs56YQTLJ7Langb6kB7wfXElz2z3hrNRNUoF6YJy7xkhC
 925XgubTT4EGuhoG75uWBX3g4=
X-Received: by 2002:a05:6122:8b1c:b0:55b:305b:4e3e with SMTP id
 71dfb90a1353d-55e5c069222mr2089152e0c.20.1764857954314; 
 Thu, 04 Dec 2025 06:19:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH+C9sPLLhanFRiDS0Uhb5SqXmagHH84fKENQBceI675Xl3lju6FqtHCMLOcYbmnIYg1z1JPA==
X-Received: by 2002:a05:6122:8b1c:b0:55b:305b:4e3e with SMTP id
 71dfb90a1353d-55e5c069222mr2089112e0c.20.1764857953644; 
 Thu, 04 Dec 2025 06:19:13 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-597d7b1a550sm565511e87.6.2025.12.04.06.19.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Dec 2025 06:19:12 -0800 (PST)
Date: Thu, 4 Dec 2025 16:19:11 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
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
 Jessica Zhang <jesszhan0024@gmail.com>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Jie Zhang <quic_jiezh@quicinc.com>
Subject: Re: [PATCH v3 5/6] arm64: dts: qcom: sm6150: Add gpu and rgmu nodes
Message-ID: <3gqq3w6ovy5srgvabyeugsjbwrhaxmjvicykhjmlcxd74gtsaf@5u6wvvzeq52z>
References: <20251122-qcs615-spin-2-v3-0-9f4d4c87f51d@oss.qualcomm.com>
 <20251122-qcs615-spin-2-v3-5-9f4d4c87f51d@oss.qualcomm.com>
 <8560ad26-4756-4c2a-97c3-2c5c0695172c@oss.qualcomm.com>
 <z4gqro2bx6oq2ht75m2klogo5dsirb74tmc3u3shjyalxmaxil@5sy7ufmqhdgw>
 <6fa1da5d-9ea7-4d72-a03a-82edc4bef099@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6fa1da5d-9ea7-4d72-a03a-82edc4bef099@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=OdCVzxTY c=1 sm=1 tr=0 ts=69319863 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=sIfkXvtQUm5KZGAQGskA:9 a=CjuIK1q_8ugA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: _SbmUoXKgYMIMrJp0LFD272rZJRhIa6W
X-Proofpoint-ORIG-GUID: _SbmUoXKgYMIMrJp0LFD272rZJRhIa6W
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA0MDExNiBTYWx0ZWRfX6u2nAVu24A/a
 HXC9a6hTu9xNk+9lkPrrYBx+JPBZ7ogR5pYiRZS7ArHEB4TktWa+jhkE6hnuSi1E/2gvBKFVWC5
 qC350jG0cSFc5eN46D7iKDiSQGfxXFE9TdxwQYn+plG9799qlO07y510rafiu2zI2kjB8RKB/+M
 qyHUYdz8dMASn1VIn3BmrEGTG8JoUGf8QzOX7usa81Ta5rnRtyZh+0Zp6Uk5me+BRbdvrRmC7sg
 tu5hFKpGuHNJtNnbVRce9m3U3h490MvnBGNULWRZY+SlOeX4vPe0nV3xoCW2EcH8L8LhNw1YxEq
 m1Rls+dEc/4VHdarqrCYGHIWHyJD0aqYsvHgcwYg8RVlcAAsb5SZ051Imeo68jbgSkTKsyEj474
 ED6bO78OmHzb9XRuPYDSPMfiB0cnGQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-04_03,2025-12-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 suspectscore=0 phishscore=0 malwarescore=0 bulkscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512040116
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

On Thu, Dec 04, 2025 at 03:43:33PM +0530, Akhil P Oommen wrote:
> On 11/26/2025 6:12 AM, Dmitry Baryshkov wrote:
> > On Sat, Nov 22, 2025 at 03:03:10PM +0100, Konrad Dybcio wrote:
> >> On 11/21/25 10:52 PM, Akhil P Oommen wrote:
> >>> From: Jie Zhang <quic_jiezh@quicinc.com>
> >>>
> >>> Add gpu and rgmu nodes for qcs615 chipset.
> >>>
> >>> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
> >>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> >>> ---
> >>
> >> [...]
> >>
> >>> +			gpu_opp_table: opp-table {
> >>> +				compatible = "operating-points-v2";
> >>> +
> >>> +				opp-845000000 {
> >>> +					opp-hz = /bits/ 64 <845000000>;
> >>> +					required-opps = <&rpmhpd_opp_turbo>;
> >>> +					opp-peak-kBps = <7050000>;
> >>> +				};
> >>
> >> I see another speed of 895 @ turbo_l1, perhaps that's for speedbins
> >> or mobile parts specifically?
> > 
> > msm-4.14 defines 7 speedbins for SM6150. Akhil, I don't see any of them
> > here.
> 
> The IoT/Auto variants have a different frequency plan compared to the
> mobile variant. I reviewed the downstream code and this aligns with that
> except the 290Mhz corner. We can remove that one.
> 
> Here we are describing the IoT variant of Talos. So we can ignore the
> speedbins from the mobile variant until that is supported.

No, we are describing just Talos, which hopefully covers both mobile and
non-mobile platforms.


-- 
With best wishes
Dmitry
