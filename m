Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E5B6C3F0B7
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 09:58:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0ADCE10E00E;
	Fri,  7 Nov 2025 08:58:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="LxSkVNhT";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M5DN2vr1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A140910E05C
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Nov 2025 08:58:54 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5A77AqM3629581
 for <dri-devel@lists.freedesktop.org>; Fri, 7 Nov 2025 08:58:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 cn9MVujSeUQg7Dj4W0694p+5S0bGJYjJQ6rQW7mue3Q=; b=LxSkVNhTpZButxID
 knOUvd7Y7gCfXWAyhBFKxBOzDtiR4NYZMNc8i7tJehlv2p4ushQX2hPDWZdxD1Bc
 cPtcpjp8xtS6qd3YVirgRjdejqtpayzUcKnQJE59LoAG/XujTw1qnvnk7rld1jiG
 e/UbpbCEkFLe716oKLCCn6VgYt9KqT9tuhQt3qOlk8TkCAmMSuyjkGwo9FjREtt2
 DsPnkTC9atTwRsFoHmOg6Tdqoza05l41S/nymeXvpV+XwAftxUllAMvDgmKX2si9
 mdqagA/7POHU0UIhhtI7G4XgMqlDroVrz1fclD/TFfMPTWT5SdCaBLZiwWWcXyVc
 NH+B2w==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a92231y6j-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Nov 2025 08:58:53 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4e890deecf6so902421cf.0
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Nov 2025 00:58:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1762505933; x=1763110733;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cn9MVujSeUQg7Dj4W0694p+5S0bGJYjJQ6rQW7mue3Q=;
 b=M5DN2vr1i9ywypzKnmMYI+r3ZlTJmpc04mf+/sKUUGlQQbog0xDXqKzXtvuCjIEsvQ
 tDT24GH6uetGC17NWejRYqx1CSSX4Hw+YP6VQ/F21FjnnYcmpQWdxdWHyOQ1zNxbNheA
 mnKB0BMHzQ8hadl/lTXh3EVDkPHS4HhFsLwYIfB38I6dfBC9/cPWiARGvHXCsOJkd3VG
 V3YkJTAwCJLqxE29YzYKVra7XqH6jRx0TvrAklRTBn288urgcHDWPTOJd5pw0X476v4E
 Fq75NKUzpWFCjIgsfpPJDn3LcJ5QRVIrn8BZn7epmguBNAXSP4ya+0PNfcgEezzqXSZe
 qFQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762505933; x=1763110733;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cn9MVujSeUQg7Dj4W0694p+5S0bGJYjJQ6rQW7mue3Q=;
 b=G3I8O9fFozRrbOSH7nYil9F8goTrleTCDRVel3hfX4S5Ijnj7l4M2TIatZuSr28rZY
 s55Sj3d/HVEVgdEiYsIZklld4YD0RgC1N9Eq97bFbmULfUdmOqFSB0gfTqM8HndXyd6U
 Y8dvHrFBEpTtE1C7bAjbdUhZGS1Ff2y4tzljtA/N3TsFDzmcD5wEVOWF1PUGINgok5F6
 fSfm02ZtfMEuOSnV7PxoRVuplfy7A022v/HpMZ0115icdZzrHQoaLI468c+jruqxHG+W
 YXe+HA0aRBAlhsAlzt1FRvjfnGEzQOS9w9ZqDqb5YJNkl3s7e/LUmgVrjkQNsIuDwx9/
 FqUw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVLDITIfkLrFfjUcJv9Bar7Zfb9GzTARZCTsYhKTpTh9kHvO2JOrUon7SCaGpDtD7tlG6dbcExzNlM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxWEor47Bp1N0fvWMvcsPcX+xBss3pDNvjiXbjEvRg4/GUgKifU
 4l/MeiezdXNBPuyU14Qp/froabhBDotzqNGsgaLqy2fctbk2SjobSxOH7yyRw+ZqEtozVVvu2ci
 x21NWSCbI4i3qFfgh9JJTOqbUG++3gDYJvKzaOrXZFpGknkC5NwqwJeF3pZcM02doqgPOrOI=
X-Gm-Gg: ASbGnctCKputIfGNrWmEPSdSSOwG8AVKz+NnnPwFm6Y6MG16d7hqBhJeybtfgry2mbX
 ECP5aQwz9PLZneTZlZUvaZvOjwgv6xM0QTUTwPLw0pCf9oAwnue10PsnzHdXCV5RiQaOGiiQ1Ek
 g799twWO0zUmXo0uuuAngCLmZ+EaBnl7IEKo+8CaoqOnksdq/FN0E9jo8x0uxj26n37UdYABiUi
 CugB1G1KM8GyVJzNHRDFF4fsJHYq6wWWVGio+L23nZlTX57zT4k+6dcztVZ5AkGyzF/2w2Lm+Z7
 q6A8i7x8HqVwTguPyNDevUTQ/QjKVZXVZVpCo81VmwKbZvLjf2Sqmcfcwu8ZW02u2xqDvx8g4W3
 TxBRCw5OoFFfZXGqs6y2FRKKOq1dkIFAjsnSY1LGJUuKFXR6TGsKFBhE3
X-Received: by 2002:a05:622a:1341:b0:4e6:eaff:3a4b with SMTP id
 d75a77b69052e-4ed949705e3mr18348051cf.4.1762505933137; 
 Fri, 07 Nov 2025 00:58:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG3yissiuXnLprAb0tOmfzOXBuXxz3L4rCYCtZnWOoindSmuz5Umn/9KnJzzWMWahvXwcLBeg==
X-Received: by 2002:a05:622a:1341:b0:4e6:eaff:3a4b with SMTP id
 d75a77b69052e-4ed949705e3mr18347771cf.4.1762505932549; 
 Fri, 07 Nov 2025 00:58:52 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6411f8141e6sm3807288a12.15.2025.11.07.00.58.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Nov 2025 00:58:52 -0800 (PST)
Message-ID: <abf79d96-72c2-453b-aa2d-0626be584baa@oss.qualcomm.com>
Date: Fri, 7 Nov 2025 09:58:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] drm/msm/a6xx: Add support for Adreno 612
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
 <20251107-qcs615-spin-2-v2-1-a2d7c4fbf6e6@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251107-qcs615-spin-2-v2-1-a2d7c4fbf6e6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA3MDA3MSBTYWx0ZWRfX11pXozgL5CFA
 X+4MWmPR2dXPujgvsAtVxKo8AVfEwipWn7uvNT504Wt/HYywhB8U9DyF4Z640z7Z1bwQC/+gVGz
 Z5B7lTTFkuNGQDACOO8ho3t6g5vzX5L51y8Y2pcQam1M6cyG/O5Hp3dWGJqWvCvN2zyQQyYRxqj
 nyueqhfef65glYeMhoWnnoYhb9WSpSso1AQOnteEgAyNvzmUULZF45HhWsbDNQwC87MfZSeiXSc
 U7Oy3fl+weP0m/fioNWrTJoT72MlFFsmBANZwqbk2Lm0zHBUtd7P85VFy0HSizx/NpxptBaUC7E
 w4szA53HqDFAiij3NdrLdYNJMGnjhXgTec5maEP80kGtS24iLfCcMBHAg3HvhKTJXVDzNpJDlki
 De7lgzaDaMF24ouvxMd8EQQCWKVUrA==
X-Authority-Analysis: v=2.4 cv=Csmys34D c=1 sm=1 tr=0 ts=690db4cd cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=DZDN4dxgVV-jXp9GYI4A:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: fwv3ZKWyAH6-7_iJt0hs8oTv774HzgIw
X-Proofpoint-ORIG-GUID: fwv3ZKWyAH6-7_iJt0hs8oTv774HzgIw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-07_02,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511070071
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
> Add support for Adreno 612 GPU found in SM6150/QCS615 chipsets.
> A612 falls under ADRENO_6XX_GEN1 family and is a cut down version
> of A615 GPU.
> 
> A612 has a new IP called Reduced Graphics Management Unit or RGMU
> which is a small state machine which helps to toggle GX GDSC
> (connected to CX rail) to implement IFPC feature. It doesn't support
> any other features of a full fledged GMU like clock control, resource
> voting to rpmh etc. So we need linux clock driver support like other
> gmu-wrapper implementations to control gpu core clock and gpu GX gdsc.
> This patch skips RGMU core initialization and act more like a
> gmu-wrapper case.
> 
> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

[...]

>  	/* Enable fault detection */
> -	if (adreno_is_a730(adreno_gpu) ||
> +	if (adreno_is_a612(adreno_gpu) ||
> +	    adreno_is_a730(adreno_gpu) ||
>  	    adreno_is_a740_family(adreno_gpu))
>  		gpu_write(gpu, REG_A6XX_RBBM_INTERFACE_HANG_INT_CNTL, (1 << 30) | 0xcfffff);

Downstream sets this to 0x3fffff, but IDK if having a timeout too
large is an issue

Konrad
