Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 928FDC46039
	for <lists+dri-devel@lfdr.de>; Mon, 10 Nov 2025 11:43:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3665B10E065;
	Mon, 10 Nov 2025 10:43:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="D/MhN+5F";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iOi1Jt51";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 305C310E13F
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 10:43:07 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AA8YAtn1809151
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 10:43:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 eSqXKqt4w5CGKMXelCEmeHZsf36l7BOGUQpou8ggYx8=; b=D/MhN+5FBDmQwyrk
 yi8sgc/Z54izzyQvKikz3VpJaZAEosoUWlESfrTOsSbpkE7HwWTuuQpmgusrDQdY
 vbqd+7oqP9K97GOyzT3kEazUqnyODoaRT9E72MJDwkFGwZ2zin+TQ9qwcjDrkHPV
 ibm/DiITFTiA+r8bzgysLVaG5o2vtuUyvRMjlhtHXg7MdK2B9QtgOULdaSBwbJMe
 9Oym9tBjAuT4P5MAaq2v+uCtSSmDShgROhL4wpz7zmoqqp2dqr7ND7DOQDkFLR96
 44iX0YOEn3lAkp9LBanGb3QQeUP/80rAHKpjM8pyhpldsDaH2q4eCRBwXuQ2qdM0
 kfm+Tg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ab5m1hhwn-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 10:43:06 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-298389232c4so1652385ad.2
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 02:43:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1762771386; x=1763376186;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=eSqXKqt4w5CGKMXelCEmeHZsf36l7BOGUQpou8ggYx8=;
 b=iOi1Jt51VbszOW/BL/Qn/+1KbQn+hTxrOVm9ow6KpBoYOjj5GH/+e3kihszGtMPBsr
 BZxmKjLrkfAg96rtPTM3Ml/6yVRFVCMSC1v4nS1JhZ9BL51lSSpd+U0oG1ujG4wHgUJ6
 J9mOJVPgb0vhf7Ew4jzUS+JcN5Dl7zcz22bFnfvk+pQE9mdSq6E5bMj/hHTiKxy8uVZp
 tGRyjkjgNQB6zlm/dwLuE3idkoCyvBGbgLqfWutkSyN1ZrFgyfMYpGmRvw6v1BFly/Ee
 6krIcoMqxCs2voX65Qqp/q+C5t9zqQpZRcwtXOHWF0aCxyDxoL7ZWuftFwTZKnoMHA6H
 oOlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762771386; x=1763376186;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eSqXKqt4w5CGKMXelCEmeHZsf36l7BOGUQpou8ggYx8=;
 b=kM3qYKXNQTaR8PcwJJ4VC/7iCvmC3wU6OSxoTYIGbNtAxicMRLlkELtD02XVblnQfr
 MXM7E0v9EI4FGOoiwuQaydna6nwFOfBuqZCWW6doGegT+Me2GJdiKBrjpiTAOGNZyEIC
 KMfbZdqH3RPI1eUJ1eOP7rEaZOlMUvMPSwUbHSdG2usKfU3XrTvZq6BXUCUnTj90q9mp
 lE0Z2VYUog7Ai1JKixnHIxsmOkx1PF8SaQl7Z5qoA+zcxvf+RuuF7n8iTvLz1iQedgwq
 utChiM33vlAWOTYjmzsHrfS4oY/1tLGJ6JwA5+iopk4aTy4m/3cPa5PjKg5GtYLpGXEP
 FWpA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV3dLpfXF4aE9PNyYhm80E68DbcXc64Mfq8alkynLC9/hOkhPETHPj//fgOtU+AteFa+zBjp5fUT1U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzyksIBVOYoZ5TduuPLTFpWuhbAPMWCCbJoQ8+Wujrxgwe3oCpu
 D/JYVOMxQv5Fci38XGN02uAK5aXXGY/H8WsfYuA3WmnnqMxZDNE6kBgkdDf0J33cRplNPEibjkw
 S2Voh2ix3tIMvtEHeVl2s37CWpQuanmFUgfKcc26xbjtVFsoLxSURO+hJMw5jAI5YKHN3/hg=
X-Gm-Gg: ASbGncuoBQRrovo98O2mVeJcfcYSMfpdRxJZU3qJMmh/QOPgIZ/lWh2qk5J3PEuBqwM
 4axLsVufMEliclDFkvGu03GeFtf2evCe3mkMl0P/zgGFvcAxRp6qppUuAxUBjH8Ag3szqfupUgO
 EvnWc19rgCocnKc8oz20bRkt3FHslxS+ZuDbiVnE1y8qN05YpCY3uXaxdyKt7EpPPriMxVJt7jh
 Z2z6trsloizWMka91jUNejuODz8XXpypfjkAnM8Y7OVzSiXDQr1e6OWI8GuNu7hNWggmI6r4IuX
 TpK51YDnIkqqDABYezKhb0b0CekjMzXrZd3ySvEQujJvmQdks+OrZbhD2ovmSiiU/LMaaO4cH0K
 81634VV2+3CAz3dmMC9hH/Q==
X-Received: by 2002:a17:902:f790:b0:295:9a46:a1d0 with SMTP id
 d9443c01a7336-297e56df960mr102724385ad.45.1762771385976; 
 Mon, 10 Nov 2025 02:43:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEF/4A52+hPm+KGskAyqtu2lioNjT9Bv0FG/S2i/1sn1bpC5Zjl0LIeTPyJfY/iBBpamPtPaQ==
X-Received: by 2002:a17:902:f790:b0:295:9a46:a1d0 with SMTP id
 d9443c01a7336-297e56df960mr102723845ad.45.1762771385447; 
 Mon, 10 Nov 2025 02:43:05 -0800 (PST)
Received: from [10.204.104.20] ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-297ddde1e7esm82040835ad.77.2025.11.10.02.42.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Nov 2025 02:43:05 -0800 (PST)
Message-ID: <1d31c371-0b74-4584-9f2b-dafa76197492@oss.qualcomm.com>
Date: Mon, 10 Nov 2025 16:12:58 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] arm64: dts: qcom: sm6150: Add gpu and rgmu nodes
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
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
 <defc450a-1699-4682-a41e-59035bafccbe@oss.qualcomm.com>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <defc450a-1699-4682-a41e-59035bafccbe@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDA5MyBTYWx0ZWRfX4600aIIrgrHp
 9z367GExjCxq2r0YnxWnm2qbuzdpdsSzGuSTJf2UGEQeGIMR7HjW/aMypDgqZ7vA6iG6GFZvxq+
 lvIsXPfehdAQhAf+5w0BaIR19dluFl5ck8rYox8/OlDm4xYHu1CJBYXrC2HjBxsFeSdlILGtuez
 1WBiu0gLoq08cGCDq+ocrCEzq0N1m1GTr81uVJpg0TnOKlKU6s1+qXxAjnQKs6D8oTziStEmuSd
 XnHDTZH3IiZS8l9Ea/xUXPCHojDdMEylqNrrerAk+cCUYUcB5D4WVpHMR5tZbNBL0cx/LUXfYre
 RU6mpMvdIhZl1eeTI9CQISCK4qD5oL4cny8NX8z6ewgMrl8sXmJNt/pQWXjoYmnEmpiEyDsDYQu
 EKoTRw/+bN9t+17WZoPh59LxRu44cg==
X-Authority-Analysis: v=2.4 cv=TsXrRTXh c=1 sm=1 tr=0 ts=6911c1ba cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=I_p1zpMzltXwdS2KmfMA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: Kp_0J5U5h9j4PQqmZLq9S6J1UpwaW7C-
X-Proofpoint-GUID: Kp_0J5U5h9j4PQqmZLq9S6J1UpwaW7C-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_04,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0 spamscore=0
 malwarescore=0 impostorscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511100093
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

On 11/7/2025 2:31 PM, Konrad Dybcio wrote:
> On 11/6/25 9:50 PM, Akhil P Oommen wrote:
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
> 
> Is this last clock really necessary?

Downstream votes for this. So we are aligning with that.

-Akhil

> 
> Konrad
> 


