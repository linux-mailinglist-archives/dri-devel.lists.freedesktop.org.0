Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFD37C33241
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 23:15:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25E6710E676;
	Tue,  4 Nov 2025 22:15:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="FCFKYNr/";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gOB8madf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33C6610E676
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Nov 2025 22:15:12 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5A4KflnF3033113
 for <dri-devel@lists.freedesktop.org>; Tue, 4 Nov 2025 22:15:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ogbBgd/Tv25LIQg1F6++n7axOZ48HuYuD70xNJM/fEQ=; b=FCFKYNr/ialbd9JR
 pHORa2NYr5qUtOAxtzEzhdloSYdIhKvmqVj9ntsGL0McN4s1pCOmXirkCBE31WGq
 snFcuo17qKaA1mtkbA8rlxUoVfseOylW8Az5aOM5x1XlwdXVcpUkwT4qzu9l+CRw
 MDCsSObf3ojBQmlgtLvhrDrFFiVRfivzXt6I8vnLyR+SuGewkxNp2qbcCNmqDUoW
 WCiZnQq5ff0T8eW11zjyxPFl5vvKf/yfkicTo64QeyZW4bijiJrqZV8jvYu8fDF6
 4QnqP6zgn6t3NqtvTfd/OGL6CysJLMZLacxK3IQHI8ekUcZs09lx3U0i+KzJJiAG
 Xp4Gkg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a7fgrj1k7-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Nov 2025 22:15:11 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-7a2885329beso302357b3a.0
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Nov 2025 14:15:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1762294510; x=1762899310;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ogbBgd/Tv25LIQg1F6++n7axOZ48HuYuD70xNJM/fEQ=;
 b=gOB8madfGC259fnzR/QSKCMyOK/B2X0pW16QGL4TjriKa0ji8DCix1sKLCN6kZiTj9
 RotaUH3SBYKZrOX3aR8LH+2yke7/YxxdSqCbaDIF7IGYLZTGUCW27P6apoMtTIDQjGTG
 aC/a86MQbqDxeZDs6CeZ+9OK0Kqu4Mg4ygRHyek2ppr6JVv5bHezsUK3N5y0M7Y8CbBg
 F9mMy6ABz3uysK2w8ToIRQ3RdaCK07zFkNBboSyJ/QO4koh4ifACFKrIR2INRq0VGl/E
 Tz9ClAw9m26Jb38g1ffQftCF9Tp4yk8ym7a9U07ijdRXUZnT1hAoedT7tJZ8xdsz4QiE
 cAdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762294510; x=1762899310;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ogbBgd/Tv25LIQg1F6++n7axOZ48HuYuD70xNJM/fEQ=;
 b=l0d7YPu8wSMwkGp6t0y5wk7U5YN1AfMjFJNQiFx8aS0pOHCTr2uwN/vvbPmHAVCq8z
 j7Gd2TWuFA6iqYJmIthNqZeT0B337VImo+WnbV24i2Fn9XHisFFxyGStIW3TvanWzAzN
 8w6aYZOMHTvdno8RimEeVsbv1/3w0C+9kYGPamzFZCoCNjxgYYf6q+60QG5p5iTWN3l5
 zqN4ItyIkNWa061BJbtXBW5JBOBMq15JTm2Akvb3tgt4NvuANs6anQE7QVmXyCSkWkAW
 oECCURgYI1Xx8xpVnGfZEwfHM6kOj2RO59HYj2sgypWD7m3+FCZSmIAVmVLeJLZ6+7Zm
 rjbw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUAfPVXv5OSMNsZ7xyOHg+6dR+KgMYyT9TYJyEX6EoQdmd147O/muaesa3SPxe56SEbs5pCHVOrblI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzQMLjwhhOWmU0Ty9nl/qXSaS5fCcievTW2SiimTxX7liTbxIJG
 f5/nxBSmllCDNQIHb2fRsUAUmLt509CPkDodnw7SX/tl0rnFrEV7G8llqsnwM26OQCUoOSRk8Om
 u9TDK7XWXOXrL1n17H2Amb2lcoBp8+wI9mL3+raSZpOKR3EYGESZCBwVDGRGAQLcESPu75nOaOD
 1FGoo=
X-Gm-Gg: ASbGncvqx1hg1bFpZjXZZzTUCTx8AvwAiGIg3qugfPEU9IcOYdsemm7lg3exOgs7111
 ZTqZ0erqspLKKBaYEkGtiG/PjIOutHrq3sOIQr/OSq7v/Rp8daNUVXu3+DeQLAA3SdrRlLhras9
 kqOREN4YneZpdzikeEkblXrLzlvgHYyRNqhBuDyRkSdjtndvEsm5cDmnLNmAhbIk9jJCvj4rrsB
 /XfSwECR1TsTTawsUaQeTDjRGuXVKqdonNeUmnbZPxVsR/LdqAKJ5Fs+zNDgHWgboT9iZyGCijJ
 tMO+0I9nJvw/6ZiwVOfizKBdUy7bZsMEoR1TCQUTppDCrkTEmt6lcDYB1X9n6tI1a9J3xDbgkb2
 VjNjsmYBfsgeJO+8LOTdtjzU=
X-Received: by 2002:a05:6a00:4188:b0:7ad:8299:6155 with SMTP id
 d2e1a72fcca58-7ad82997336mr2710633b3a.2.1762294508750; 
 Tue, 04 Nov 2025 14:15:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEMSaGzu4ogexmgVVatd2/255fBbWIxfGY0+4QCkMTk6DFn3f8QXyGVUkFdUAVjo2NXiMQ6Dg==
X-Received: by 2002:a05:6a00:4188:b0:7ad:8299:6155 with SMTP id
 d2e1a72fcca58-7ad82997336mr2710598b3a.2.1762294508107; 
 Tue, 04 Nov 2025 14:15:08 -0800 (PST)
Received: from [192.168.1.6] ([106.222.228.179])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7acd3b10bd1sm4013047b3a.30.2025.11.04.14.15.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Nov 2025 14:15:07 -0800 (PST)
Message-ID: <b94eff34-8a10-44fe-ac8b-304407922984@oss.qualcomm.com>
Date: Wed, 5 Nov 2025 03:45:04 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: Add Akhil as a reviewer for the Adreno driver
To: Rob Clark <robin.clark@oss.qualcomm.com>, dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>
References: <20251104220245.240480-1-robin.clark@oss.qualcomm.com>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <20251104220245.240480-1-robin.clark@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: JAPL7MCXN9MXshwZJMfP1c-Rpk44RF2W
X-Proofpoint-GUID: JAPL7MCXN9MXshwZJMfP1c-Rpk44RF2W
X-Authority-Analysis: v=2.4 cv=b7O/I9Gx c=1 sm=1 tr=0 ts=690a7aef cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=oSIXvc0h2ZBec1W313aPdA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=e5mUnYsNAAAA:8
 a=V8cJkdWAq56nonIdhLQA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA0MDE4NyBTYWx0ZWRfX4C89eV8LohW9
 nD/9mnjWDRZoMNpj0adRQoFcKBbYrpn0+vbALcaFLpcsg+4DhxrEN8+VslIP94TzDTnqCsEvf0w
 xOf3majLNessSVYYhGOWjt2ob/BYK3GOUGe/l/V6TAZuXt+wxj/6SnBR8BaxjNPB2NTt06Zn1FB
 07tmmfIMBf48NGUcI0EoS3atEWvI9WJ1sS6sRaWJGtsdL2c9dG+AbppnQETy53JYuRVxYjqCjP/
 6XYC5xktHo0idrNc/khg+g/RC8xsoeJOHUAwL/8LNjIDkvygTA0G5u2wD63gzzF5VdfzyElVuaY
 d9FFZRe1GVOf4FGX2Wv4+RtzDcwWaFNUXrDMsrWeOhcRq5xji5nG9sgersodgdueczsN2fyxk1j
 rDbno+Nqh8RpA5Xsstp32hiD9Qwvtw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-04_04,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 phishscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511040187
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

On 11/5/2025 3:32 AM, Rob Clark wrote:
> Akhil should be getting tagged to review GPU patches.
> 
> Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>

Acked-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>

-Akhil

> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 1083598bb2b6..033675aab0d0 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7880,6 +7880,7 @@ DRM DRIVER for Qualcomm Adreno GPUs
>  M:	Rob Clark <robin.clark@oss.qualcomm.com>
>  R:	Sean Paul <sean@poorly.run>
>  R:	Konrad Dybcio <konradybcio@kernel.org>
> +R:	Akhil P Oommen <akhilpo@oss.qualcomm.com>
>  L:	linux-arm-msm@vger.kernel.org
>  L:	dri-devel@lists.freedesktop.org
>  L:	freedreno@lists.freedesktop.org

