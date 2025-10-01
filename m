Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74955BAFDF8
	for <lists+dri-devel@lfdr.de>; Wed, 01 Oct 2025 11:35:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E90ED10E69E;
	Wed,  1 Oct 2025 09:35:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="R1IDEJh4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBEB110E69E
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Oct 2025 09:35:17 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59171oax024597
 for <dri-devel@lists.freedesktop.org>; Wed, 1 Oct 2025 09:35:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 DDF9dailVTb9C+8g1Gxz0cI5TBD6wn76XGlSDfVLb5s=; b=R1IDEJh4EBryW4Sb
 vT9pxjcQ6folIvZgqA+UqusGWBLRXww5TIVxaPn7sLYRgwjLmUkrq8+zsvRI6zKA
 15jaPB+YRd2wsCuJwJs1UNNYjyctsUFM60nIxHtQ1uYrOeboFRQwO7cTqcslIDv0
 AYFqiFUJijfnhIwtIR1Gf0FdEjp6qg1EO/5BWc4F4EN5+Y6VkJnD/PbO6zBp/c8B
 0vi26cHbZqTwqJYj1R8XJ3cPWpShfJa/P+nK1zMHHmpFP+yrxcNooVzKaImHHSlf
 EL2RC3URhNiDYTX4OgtZuc80r2Vvm//aIcBbUXQPRXcBURxGietSfJUTLM+d1B2c
 SbYJvQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e59n4eep-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Oct 2025 09:35:17 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-269af520712so75637285ad.2
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Oct 2025 02:35:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759311316; x=1759916116;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DDF9dailVTb9C+8g1Gxz0cI5TBD6wn76XGlSDfVLb5s=;
 b=d02hgCb2KouprSO4ccKr6+5U24905Gd8bbrr0JFawuPFSTgK47CWG6ufrGVyEv21X+
 JatqrbaV3XHPN446urZUG3slaSwctlPljPcbyYB5t18M9nlYlNBbL8paFdOVR3jFEw4J
 djLocmbqGCal2WdiGK+UVNl0fSmjDi7fdyqrbovF7Z9gv6/0JpRWX2Ny53UDtBsaKWwD
 KJfGSj0SKp4HwhdgjYj0H/8iSGMJxKCjgFhhDP5Rd/BfhY/QxLEjTGsaosARF1RKaPIp
 FWPn3w+YKSB469CLzVr++3S7+zQkZQ0zTCzKlfX9TcUX8nduAfxTbI9TgcIM9MJnfjAx
 x0qA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWkA7/5VsklESvqy4Y3Dr02jIQxbYvrHqU/+4trgAwNVTg3EkHbnGRIz8OQ7tsxsIsr7EHoP9t8yhI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyp++/kvzh3b/YO8fUqeUho2s6c4k6zQR5WZdTKdOPkQd4PFy3h
 /1rxC5uwwH5D5O+oz2oHdz+V1m0+/T0iNTQW9cuIXWXpY2ME/YR++d7THqmFP/lOZar/GFpNqv0
 wLEjAVTKULMuov1dPe8ajgXeF06eratNhnguVrFWmc1BSfu3xmre+ghz+E9tGTjIdkZO1IiQ=
X-Gm-Gg: ASbGncu8Rm10wM496zZv3rx8gwkX7DivByy9LNdVBv4p2ex0qAWWXdR5uhkeEgnJlrK
 s2aPgWCzL1QflVqnLt7UF1Dtzj/Q2/YPLkO1mKarnPNzN/w+jnXoNK14PgoFobQPrR3YFRSxdlF
 tTRTQLF4PBHFSEItaF5OmyN1sBWMN6WuPsiaiy2ON0P+NdD0PuxCTFXirz+jgUqWbgOywAc1gZ9
 ru17WQ7XoX6VHB282u0hMgtQjtmoRea9VS6zqrQr83uAYKFY2ALRnvX81ReFV2d88mAnJk0Uosz
 S0MS1rMCbvIkuuiwVYwyIgPi9i6YML5iH/abAb1oYVuVKFdrp+b+XBq+lWo4zEWBhlTWbZP8jsy
 8ELFJ
X-Received: by 2002:a17:903:2384:b0:26c:3e5d:43b6 with SMTP id
 d9443c01a7336-28e7f2f4ef0mr36261255ad.32.1759311315779; 
 Wed, 01 Oct 2025 02:35:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHYUv/Dm0XesDSTyHwQm2dVe57hhTs7K33D3ebSSuW0U2zhQHMjz1FXWOI+Y+NBaNAKCKO4DQ==
X-Received: by 2002:a17:903:2384:b0:26c:3e5d:43b6 with SMTP id
 d9443c01a7336-28e7f2f4ef0mr36260875ad.32.1759311315356; 
 Wed, 01 Oct 2025 02:35:15 -0700 (PDT)
Received: from [10.217.219.207] ([202.46.22.19])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-27ed671d8c6sm181633145ad.56.2025.10.01.02.35.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Oct 2025 02:35:15 -0700 (PDT)
Message-ID: <32fd77a1-f352-4f82-be18-c978fabac280@oss.qualcomm.com>
Date: Wed, 1 Oct 2025 15:05:09 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/2] i2c: i2c-qcom-geni: Add Block event interrupt
 support
To: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
 Vinod Koul <vkoul@kernel.org>, Viken Dadhaniya <quic_vdadhani@quicinc.com>,
 Andi Shyti <andi.shyti@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, quic_vtanuku@quicinc.com
References: <20250925120035.2844283-1-jyothi.seerapu@oss.qualcomm.com>
 <20250925120035.2844283-3-jyothi.seerapu@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20250925120035.2844283-3-jyothi.seerapu@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: XvBbMkDS794fn3CCd64ck0smoufP2hHR
X-Authority-Analysis: v=2.4 cv=O4g0fR9W c=1 sm=1 tr=0 ts=68dcf5d5 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=fvgdV2PV7z-sFcuOFeoA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: XvBbMkDS794fn3CCd64ck0smoufP2hHR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAwMSBTYWx0ZWRfX6+DzspP3+KTU
 XpjFnMQjbmHSnJflkjNT15ObiYNxQUJwW3y03ZxdlQdGAc6LHQ3at7CZVlFPPJQlr+3LT9IyPmw
 D0fQjt612VGcHSyEEh7StHzakdTffF44utuUxMEm8SQG4YPT8sSK5hN2P/MpSHBywpq3v0h9ClV
 eB4bj6AkWPBI35b51ZfXaMUGq2EJ9E5oSkUrZCU5FwIUQF33fnDW+QArqwVnqKdhno7nUibF69h
 V4TOp+mIzHrlb/4MubFt9tEBj0cTMsumaXNZdySKXtxg/UyIs5gpE76/w2PQMIbDGygwT+be1cX
 Vy7q6pMjZEwdR0IhbZJIT1APCV/5iPcxrV4D+KHQ0I5AScwnxU6XM5Ga0Uh1C0pLoblqWTa1R7A
 wEAuEJpKZUyf+Ik4fPZnbcGJ9kBV9g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-01_02,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 spamscore=0 impostorscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270001
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



On 9/25/2025 5:30 PM, Jyothi Kumar Seerapu wrote:
> From: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>
> 
> The I2C driver gets an interrupt upon transfer completion.
> When handling multiple messages in a single transfer, this
> results in N interrupts for N messages, leading to significant
> software interrupt latency.
> 
> To mitigate this latency, utilize Block Event Interrupt (BEI)
> mechanism. Enabling BEI instructs the hardware to prevent interrupt
> generation and BEI is disabled when an interrupt is necessary.
> 
> Large I2C transfer can be divided into chunks of messages internally.
> Interrupts are not expected for the messages for which BEI bit set,
> only the last message triggers an interrupt, indicating the completion of
> N messages. This BEI mechanism enhances overall transfer efficiency.
> 
> BEI optimizations are currently implemented for I2C write transfers only,
> as there is no use case for multiple I2C read messages in a single transfer
> at this time.
> 
> Signed-off-by: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>
> ---
> 

Acked-by: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>

