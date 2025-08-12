Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F178B21DA3
	for <lists+dri-devel@lfdr.de>; Tue, 12 Aug 2025 07:55:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1902910E590;
	Tue, 12 Aug 2025 05:55:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="FhrQzbW/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBE3C10E590
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Aug 2025 05:55:28 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57C3bCf6004624
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Aug 2025 05:55:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 XI4zA0XPEeDju8LmiA5iAEsb1GjF7x2tJZG8gRPEHcw=; b=FhrQzbW/vDlM2Zam
 Aqq0M+z7LFXJEmSTWYT1ASIuluq9c7fLPwnTy1t4UJX1tW4jKcr6HQpo1wnrTscE
 yZG0t6M4qhQWvZxDXzV4HYqnyKnlbIqZyrbq3oycD29I4myfBbHAK/yZjLDqLyVP
 6JSfbbT8ZZwqw4MqMfcFnhRvFoq7/29rZH6fckzUnzL2D840tlge4T66xiU+HV4p
 CIed+G5to8rHqRsMDn392U5s0Phk3Yk7hsHpnGYUP6gvSFeQ4vHIva4niKR2m6CW
 p7UB6D2ycgRGXSIy2LO/3DplyYSVwbrvcB/8OdA18++tdZjddYuR6uB5Fv2qea0a
 zpNraQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48fjxba3xc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Aug 2025 05:55:28 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-31ecb3a3d0aso4964930a91.3
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Aug 2025 22:55:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754978127; x=1755582927;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XI4zA0XPEeDju8LmiA5iAEsb1GjF7x2tJZG8gRPEHcw=;
 b=sFBjbAz/i0XSkW1z9WE23waYObvka0KEvfGog5hnFLfypnunts+bMGOZedREtupv6m
 WYxkqdz4YcFZl+hri7mcXPd6+zk6XOjoWCS61p51TgVwcuTlKKYzC2UXjhfCxVoJ1M7x
 gUlaRb/lUsZORM0oytGPhtDuFY1a+Ftdo33nbkvMLncYooeGEFJg3NjJKKyy43R6l532
 iPfDk11v9WdFmqR80w6CmSGrcx9eljlHS81D7pODt6lzGRbopEaNlGaNpBRhIp6GrZ0m
 KZvHSeimDX2dBZ8y9cehRset+BEFO/SMu0OHL+DTUoOHMBepGqriXKJqOwmMvjn1eu91
 H3pQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/Q47gyIoivoybrOG4xeVsMkYFxxv/5aAmbnL51Wh4giz0RaRepus72ITZM1dB/gWnYdcpapvHgfQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyspHgGfZsFuLFzlgLtOY/KLIe5ln55e32evQh3fLWzm+PmNZ9Y
 Ar4IzCg1xDfYYZndBoiB9OpIGPZ5UbktMVJUE3gAF205NxOeL5rgz+044InCJDyTOh1aeiat/sk
 4fTRckTkq1yGDSNRa9eOXJj+MGKOc/mhbzf3f6r17+qSzhZy5cy2bhq6g36PZj/EFXWGS5jI=
X-Gm-Gg: ASbGncudK1Qx1lXurH+UALPTyVNPiJfK78rKlwXjEHPoJszHg2Jq7L8L670W7vy1CR4
 C3thG9ugfrPhY8lS4SdY8EGRLCTcej78x8korSUTVZZVYfyyiFp2us5l/+b089RLZ4hHVb+qXCh
 X1mgaHqIIfEY2RSMZPp7NeKlQSQ7m38p69e4GTZ6TuXx5xsOqzJGg5G9MaxKhphOAe6fj28TEoU
 UrfMiHXW9AGLU/uxm8i0oCt1S6VBrtvv7ojdzcQgRlmbupI+ZvsXtlVw3vlnW276JybIb0QXbZm
 dItzrxXsM4TJw+pfW9mx5F2533503AMqn30Wyu+k7hwv90DY5PlOwHSeJaIBQRISRoOBd5s=
X-Received: by 2002:a17:903:2283:b0:240:9a45:26e6 with SMTP id
 d9443c01a7336-242fc230f18mr30549725ad.10.1754978127365; 
 Mon, 11 Aug 2025 22:55:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE/YPzCOCkFvG1QEpOcPR/+AeqBulYJ1CpcEiZvOMQ6dowlNrMRbKyFgKjMlGH5EpOo+tkUlg==
X-Received: by 2002:a17:903:2283:b0:240:9a45:26e6 with SMTP id
 d9443c01a7336-242fc230f18mr30549445ad.10.1754978126934; 
 Mon, 11 Aug 2025 22:55:26 -0700 (PDT)
Received: from [10.206.107.125] ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241d1f15092sm290447335ad.66.2025.08.11.22.55.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Aug 2025 22:55:26 -0700 (PDT)
Message-ID: <d1cce1f2-df38-49ea-ab62-a1397be4e599@oss.qualcomm.com>
Date: Tue, 12 Aug 2025 11:25:21 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 1/5] dt-bindings: misc: qcom,fastrpc: Add GDSP label
To: Ling Xu <quic_lxu5@quicinc.com>, srini@kernel.org,
 amahesh@qti.qualcomm.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
 arnd@arndb.de, gregkh@linuxfoundation.org
Cc: quic_kuiw@quicinc.com, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20250716132836.1008119-1-quic_lxu5@quicinc.com>
 <20250716132836.1008119-2-quic_lxu5@quicinc.com>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <20250716132836.1008119-2-quic_lxu5@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=G6EcE8k5 c=1 sm=1 tr=0 ts=689ad750 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=3zBhIfn5MegWJkNBbEwA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA5NyBTYWx0ZWRfX49bICS1Bs2MR
 WyEibhbWHLykG2Hp0jNCysDQqoz7mrAMZ0CHUF24PKdPcJp9s+07jm+02faALLItvB7CMu2Fhtw
 Ubxw/PVAX1mOHaShtcbDzNQD4Dum2hJ++m37LrYDjF1NcoMSNjoYhoTCdaO4KnVkZkxtaF/jkU6
 HMH9YF+mxGgHt/zIrytD5uBaELGZV3sToW9FXbkKupSFKjAfttUxkcv2HYFACWZibYOeT43axpr
 jXr+i+JKKmcCktqmRvmZg5+vsxLCIh7eeVwYgSGBEce0c4zPV6Bpo2r+HRedSO/dkiczStgMlKh
 aIIvJf6d2MyzaaGcPeI5duNeYBnmYplV7yXonyWdZZcfay22O1J1rv1Ag5oJt6jy86/N44FZ983
 RKKztVL4
X-Proofpoint-ORIG-GUID: qU3pQVqL1SQf2eA5nWZTsGGiW9pKuepe
X-Proofpoint-GUID: qU3pQVqL1SQf2eA5nWZTsGGiW9pKuepe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_02,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 bulkscore=0 spamscore=0 phishscore=0
 malwarescore=0 adultscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508110097
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



On 7/16/2025 6:58 PM, Ling Xu wrote:
> There are some products which support GDSP remoteprocs. GDSP is General
> Purpose DSP where tasks can be offloaded. There are 2 GDSPs named gdsp0
> and gdsp1. Add "gdsp0" and "gdsp1" as the new supported labels for GDSP
> fastrpc domains.
>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Ling Xu <quic_lxu5@quicinc.com>
> ---
>  Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
> index 0840a3d92513..3f6199fc9ae6 100644
> --- a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
> +++ b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
> @@ -27,6 +27,8 @@ properties:
>        - sdsp
>        - cdsp
>        - cdsp1
> +      - gdsp0
> +      - gdsp1
>  

Reviewed-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>

>    memory-region:
>      maxItems: 1

