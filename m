Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 506CF9FB062
	for <lists+dri-devel@lfdr.de>; Mon, 23 Dec 2024 15:54:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C78C310E440;
	Mon, 23 Dec 2024 14:54:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="jSd1qDvC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7175B10E350
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Dec 2024 14:53:59 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BNBW2J3007269
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Dec 2024 14:53:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 5ghtmWKaZ1U0P311B2DIkY7UWMWyv3IgV388/E65aHw=; b=jSd1qDvCPg9OmwlR
 w8YwDBuTDcslSravko4wcTOls3KbGkkO8yfBLb1PM71EXvje3jKDb5YsdYfMtshL
 8QuWgu4ryxxikuxGZlgMqF5Qtyv9Ibda7s1swX9S+hX2Q1DghmY+9/jsdD/poJ+W
 ug9x9VQM5+VpsHpavUHDMB5bLlLvgvX37X/Lu/9cp0jw08unzJDfKkRFLgoPuLF1
 nJHd641KZn3UkHEMXrxriRXCGwzY19qurZNb0xXDtz2wje9lXh0JvLmZWlpoyme0
 oQjYt6rBnObUB7+6EYz7TMzAMpUXpHZCcJ46zrKXGzab8El2Jp0Iqc9QgjHtmFaU
 yKus/A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43q72n8gq8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Dec 2024 14:53:58 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7b6f134dac1so30282685a.3
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Dec 2024 06:53:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734965638; x=1735570438;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5ghtmWKaZ1U0P311B2DIkY7UWMWyv3IgV388/E65aHw=;
 b=puVbe7cYQ1hdg+B0HB8LW/++QeTnL7+NIbFnP9nQoxDWgzkaq/0bGIk3KjGqQEjnTt
 gkx1y9u1H8QI3RtWgxExDWJ9GmqwbYNR/FrM/ELnBuq5x7nvle3detaFJcFtaKo8Jfyq
 V0IP0m4IUJyOKCTIyYuMd73Rtf343MX40ePJBCobJTYyAzA99s4wzRxSFPO89xak3mnm
 YGTx+AFBeGqsiVvFDtjcJWVApIVh+RgnVxU+H7jarj5vvo6c7+o+QoJlE3XiPDjEjUAu
 IcgQEXygLZ8KIQ4LDfEFiIRGj+BqZRl87NPQnThp8jPJpJFkr3EuRRsSozmoJS9L5z3Y
 ucQw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVkon68bAfK1Y8rvpr4l1Qt9uycrsZkERV/oSl7DekMF2yB/iZQH0srlK47NPKGCHpEr52SVcLWEAk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxHoL1El1h7V/F7g65/BcZP+uApZsc+AsTbbRLz08zappQNE02R
 a7V/VjZ3yaxcZagqxU/xNbGmP0901URxs9FiBmAtHwMi+t1e5DfUJBDQv7OHjC0vCPmkSieiHPq
 CpBHlz2ZJ0nupWGZNWgC7Ynbzf8e6qsIakoAHQXBeRAQ/q7TUGihoUB+I5uFH/JElA/8=
X-Gm-Gg: ASbGnctuGGvxpjt+GlyjjZSNahRr9PJ94EIiVhoL2pT6b5hgaWzKOuNYjJns08Qv9+T
 +z0X5zWbaLAopdgZMxOCyziaWkt1tub7YdapL0tyN1T9d/4HKug9/Slx3JV08vusZ3mhC5yCwlF
 xJ/HUFpM7gm2hCOEa5/z+79Z/vZKpp0Oz4stdGjo86vceY3SN0pazT+J0kUvHPthGMraPHKFqkZ
 gHgUib+gIx1IXBJoNJkbo0+LL2I1FkRhfOZh9ogREsmGe5hqDSMaiYfCtheHq7NzCq7+16zVdX+
 kt8tiDJnE8cRpMKQIjAuPeou1UEncSJi2/I=
X-Received: by 2002:a05:622a:15d4:b0:467:6283:3c99 with SMTP id
 d75a77b69052e-46a4a8cdd7bmr81247551cf.4.1734965637844; 
 Mon, 23 Dec 2024 06:53:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG0ijPdXH8OJJzJaaNa9GXKoX6mI+05srwOUkZxvg03q2jV0DPYvPA21HOuhd3j1qywYncbGA==
X-Received: by 2002:a05:622a:15d4:b0:467:6283:3c99 with SMTP id
 d75a77b69052e-46a4a8cdd7bmr81247361cf.4.1734965637498; 
 Mon, 23 Dec 2024 06:53:57 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d806fedbbasm5192315a12.71.2024.12.23.06.53.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Dec 2024 06:53:57 -0800 (PST)
Message-ID: <43785ae9-ee3f-4107-9f8b-08b882e5dec4@oss.qualcomm.com>
Date: Mon, 23 Dec 2024 15:53:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 7/7] arm64: qcom: dts: sm8650: add interconnect and
 opp-peak-kBps for GPU
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20241217-topic-sm8x50-gpu-bw-vote-v6-0-1adaf97e7310@linaro.org>
 <20241217-topic-sm8x50-gpu-bw-vote-v6-7-1adaf97e7310@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241217-topic-sm8x50-gpu-bw-vote-v6-7-1adaf97e7310@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: t1r2ry-i3AXuHj-JtmCeYnM2W9QYYz80
X-Proofpoint-GUID: t1r2ry-i3AXuHj-JtmCeYnM2W9QYYz80
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0
 bulkscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 mlxlogscore=843 spamscore=0 mlxscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412230134
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

On 17.12.2024 3:51 PM, Neil Armstrong wrote:
> Each GPU OPP requires a specific peak DDR bandwidth, let's add
> those to each OPP and also the related interconnect path.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
