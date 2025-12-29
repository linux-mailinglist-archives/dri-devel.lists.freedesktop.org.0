Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D23EACE8341
	for <lists+dri-devel@lfdr.de>; Mon, 29 Dec 2025 22:19:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C00A10E709;
	Mon, 29 Dec 2025 21:19:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Mzw5rElC";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RW+k8ws7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4B9210E6AB
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Dec 2025 21:19:29 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BTIcmmZ2013471
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Dec 2025 21:19:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ZpBCIZzQrlhqAZnvW6IzAsAlvQ2lYCsIDcnMGn3xCmM=; b=Mzw5rElCstkRJJ4y
 RJzTKp44R/e59QZKa1rMxyP2CVNgkr2hgTWKUHlOm8SWpDvdGNKAIyYeaMd/UELt
 7DTIO9yNc9c4rsUBbH4ZdXIZSiRacLwma6j2unUJl9cljwMPIU8a2m2CYo+lO9dV
 lwt2HqCQQOCPxHVwiPWSxfgZCjsMgHbsXmdSOEta1OsDVCnZfTZInm8uOtPcRwV+
 HBJ26yiMA14VjdYVCKQ3uHN5pSHNux5uQHffKm7xxR53RJ83fgzG1LEQ9wx0h8u3
 W5JSn/xeZ+bT93liCayUoTU1E3BLQ8mvnV8izOqB+C/0ucesoLeADEKUs/dyNlcT
 Bc8nXA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bbqk19c3f-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Dec 2025 21:19:28 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-7aa148105a2so9072626b3a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Dec 2025 13:19:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767043168; x=1767647968;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZpBCIZzQrlhqAZnvW6IzAsAlvQ2lYCsIDcnMGn3xCmM=;
 b=RW+k8ws79fQ2c+fZr69gqH34B1jV1k6dAj0ZokZjq3PtTO5S4CPD7pX+Bf1C0TIxn/
 bngeQOIfbOJ2ZAt4+1HCOXu75iRLscd7riW8ehXU/ofD9eqCmH0S3FcJPfBAN/qjCiWr
 7w5BP2pRglIFcbq78CA8Ddnhh91ly88xx0n/ZQVBFaZAqIJL59bhN5Mm/I+7ZPQ7dV9S
 IdZyp+YjVhFc2comTd/+RqIGAGAGouGhaOybm/beRtxpsD7GzimbmES0mJ1Lb0FYRU9W
 hpZbYyKdZ1MRCw+Mq7XQzkM5y+GZ3wXNtE7nMytEa56C9+UGC930k8unzX4iWCQsD5ru
 edcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767043168; x=1767647968;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZpBCIZzQrlhqAZnvW6IzAsAlvQ2lYCsIDcnMGn3xCmM=;
 b=SzE1QzmrpoEfHq3GJ4fYdZaaUp3WK+xQ1bz9CniMi2mhPhidXJz2mJRnMTS+OESp8D
 JeOE0aw0wbKMitx0SFCh16xxs0rbeq1rhfY9DpoRxIG/nsyGzaqfsX1f9t7lvGW8pqk7
 hZFc6JOKzM8h0CsYICUnOSntjF/E69kZGkRjrfFJW8Lv4jdGMwt+6A1CzQUEhHOonGkn
 zdQ23PERQwe1FUy1+8XVmyT9p9+GrrO/fZw1rvhsIx46l33YOpIzEMCVo4zktkemskn3
 Sdg3RzrCxBxASVM8a99McJIDogfH5sSKD5EQhIb7qTw9KM4UF6lN9ie+92snEcaDjhk+
 EqCg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXy/Dhmqra/Uu5+HKOLN5ogABiaK2m6hm8Yt8Da3Z6g2K6lctAjFUcSGK60dikqZ6pm23MQMiAmP5s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz1stZp03iT2dkSt3U8RUvnax3C1YBI7pO8eJ+VvyvYPkH75v55
 Obt3rWzF3RVSbtgDp+/XVNZ3LMw62eJBv+kZj3pnnIG8QaIeBdUhY2x6+zmsZq+AoJOxLhMMnSc
 el4N3AC143/Y7Lov5HNgj1dCACDzsbcHLkQYSBPbXSwNnX2v5FeG9Kadvr+AsiGg4mzXZtV4=
X-Gm-Gg: AY/fxX6DOZVnYFzh8GeO57ubrTYcXL3KE7nrYUDb+aEXvPPpvzB9U3q7aeF5lF37Vay
 pCkQi/kl7GjpCARVvJuGgURq3375vDhApqBNGmbgMw3zyTiailD9aQjhBXA5Aygju5sT7IaR8jG
 9M2v6SO6WFEbLXHZtqBVWlcaEtpZVmm8XRB64qVGVhWfcfi5wbS8gqSZjAUCWXSA/vNmXVP1nDS
 hCNhQgZaRJ+4iprrhNLWf5vvk/d7tCXV5I57XfDclZhs9WEYXTkjBSJYwmBUV4xIX3+jQ37XJVl
 1nsgaVuNQE1olOY0+kbBDJXU2W810YAzLCsW05xNbTHDc8f7q84o1zNaTWihVwzRrkQJxiVN9aJ
 xnVW4aSNaJYIdZ25RjvBEBQEiX9+Xpw8H6w==
X-Received: by 2002:a05:6a00:90a2:b0:7b8:10b9:9bec with SMTP id
 d2e1a72fcca58-7ff654b8185mr29097583b3a.19.1767043168221; 
 Mon, 29 Dec 2025 13:19:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHObsOyE0pNTP9yuvY4xceFRRd+xJwU6ZcRdjs/f/UrixkkJEYeWSKVBpetD5YZmRKunrqPzQ==
X-Received: by 2002:a05:6a00:90a2:b0:7b8:10b9:9bec with SMTP id
 d2e1a72fcca58-7ff654b8185mr29097557b3a.19.1767043167701; 
 Mon, 29 Dec 2025 13:19:27 -0800 (PST)
Received: from [192.168.1.5] ([106.222.228.162])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7ff7a843ee4sm30860986b3a.10.2025.12.29.13.19.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Dec 2025 13:19:27 -0800 (PST)
Message-ID: <cfa16bc7-9a27-4fd5-b1c9-fd239f529dc8@oss.qualcomm.com>
Date: Tue, 30 Dec 2025 02:49:18 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFT PATCH 0/3] Add missing CX_MEM/DBGC GPU regions for
 SM6115/QCM2290
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20251229-topic-6115_2290_gpu_dbgc-v1-0-4a24d196389c@oss.qualcomm.com>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <20251229-topic-6115_2290_gpu_dbgc-v1-0-4a24d196389c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: dI_t_qXYX2HRey_akotX5KdvTVfaFvKE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI5MDE5NSBTYWx0ZWRfXzwN8n/bwE5Yh
 YJ4fLOzYiK6WtgAMpXG8UpaTixWBgf1szRatD4i59c4V3pmUIQLOuZsLHdUFbaRbivXrTedQ7Gc
 1UsWh5A/FRu7PX0W70GUkBlMjVjIpRbP3Fpd3YKg3Fc2DTy1cmzWQ1pHMrpp417vMikTUgqR3Nt
 Ze+9/9ofVmDbDavK8VvWAd9YKbZXeD3siJ4bikBMRvGzTI8gtBFCfZc581ryZjQmVr/IchPB3JL
 TXDFhVCZrica/dj3FEWYxwbzyziipi0st2y44w7Yf4M8ZsKoTG+r1E2VWH/qwP+tg7zUzx9JatV
 7F14zqDSqU80BVWxlb+AoxkJlSUu6McoLyTBZyPVGINVLsQg1bwZIoG/g0fD2dqRfGJtXEFv+MY
 pacWcBarYI0MmPt6qMoLmdymILkCL9m7hdKuA2R9/I51Hj34BWnYPpu607suSQs6AaJohg2qkOC
 x3qBzrVNEfULpkrfRGA==
X-Authority-Analysis: v=2.4 cv=Tf6bdBQh c=1 sm=1 tr=0 ts=6952f060 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=DNOyb6/IJtREwcjsjFyOSQ==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=b3iq9OUVpPj_UNejB_kA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: dI_t_qXYX2HRey_akotX5KdvTVfaFvKE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-29_06,2025-12-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512290195
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

On 12/30/2025 2:17 AM, Konrad Dybcio wrote:
> These regions were previously left undescribed, fix that.
> 
> Compile-tested only, the driver shouldn't break though.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
> Konrad Dybcio (3):
>       dt-bindings: display/msm/gpu: Straighten out reg-names on A619L/610/702
>       arm64: dts: qcom: agatti: Add CX_MEM/DBGC GPU regions
>       arm64: dts: qcom: sm6115: Add CX_MEM/DBGC GPU regions

For the entire series:

Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>

-Akhil

> 
>  Documentation/devicetree/bindings/display/msm/gpu.yaml | 6 ------
>  arch/arm64/boot/dts/qcom/agatti.dtsi                   | 8 ++++++--
>  arch/arm64/boot/dts/qcom/sm6115.dtsi                   | 8 ++++++--
>  3 files changed, 12 insertions(+), 10 deletions(-)
> ---
> base-commit: cc3aa43b44bdb43dfbac0fcb51c56594a11338a8
> change-id: 20251229-topic-6115_2290_gpu_dbgc-79822622b58d
> 
> Best regards,

