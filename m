Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D8DFA6A3A0
	for <lists+dri-devel@lfdr.de>; Thu, 20 Mar 2025 11:28:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB40410E1DF;
	Thu, 20 Mar 2025 10:28:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="h4cj1sGn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 629E310E1DF
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Mar 2025 10:28:44 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52K6Z7GO025403
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Mar 2025 10:28:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 t7JCFxJENGct7M1n7Kf+6tvuHHB4HK4sMdAZpytvjcM=; b=h4cj1sGnX3jHFcpd
 Y/V7raEGTWPOS9mM35u/HRsKdiQTSCVklabyqD8TAGASorLC+Dg1/kC44VeoObuQ
 vDLZBz20Ebgb3lwitOAHGVcYqT88UgSNgqw8eZarU4esArZwCnGaDKzo7CZA5hRt
 GQRjwY4CulEsIhndQBRBwQlRUS1ImEgfHZ+YOgInELBwT7jU68wChIwYqHbHXQKH
 Do/nW565edG7cVdUXf0KdnxebtOsFkoVNQTmy1Hnq78DOVMX7SPuLg6i8CQS/5n3
 OsDhKN2gGzMW0351kW1ex3uvoxkNkhg0Z3RWvKfJ1Q1o+so5hrQdv0Qoxi2WuZTY
 Tc76Aw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45g15y2h7d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Mar 2025 10:28:43 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-6e19bfc2025so1300906d6.1
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Mar 2025 03:28:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742466522; x=1743071322;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=t7JCFxJENGct7M1n7Kf+6tvuHHB4HK4sMdAZpytvjcM=;
 b=G6ob5N3T8NrPa9BBn8znRxfblPJb1Jli9N8IO3VSWvI4HbZHfcPJgcZ0d/gLGWOJqy
 StR+of8gExYvleEmGByYapD5ITHJJQ0cnGHScn7a3lM31x/RRwe4xu4tx2IXWp/wBg2U
 na1uL4E1GIyOvHmQ59aGbBq7sNrE2qce1mB6Cbj9Fv6AwsyyQYhFyvtfSyc62JWQizGp
 Ff6LnwCt612dBDF+DZiWAlYTXl+WkdmmFPt0kMt4bRjFp6JeRT9q1N6EY/aioYpNFRzo
 3Ls5yZe5EjTEMBVflqE4Z/t/AawLdAuScfiF6lf7WDfQ/W+3h/s+tCONQ+NPN9zu/ktG
 Pn3w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUZ+cVMPWL76Ny4vQVZFmGZ0hKeSpjcPItE11M6zAB9zz1cDNOZ2wiJgzRzX7ubqfz5mGTctBlmekY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzmet1pt8i57mjY/EPq7pZxXaoGcS9PY552htNcn62Kta/wXEws
 ySUNWsfDZT76t/gJMWU/BwjRi2hEAmxOFwiqmVdBmpz2AtJF/ZHZ0Kn7ckv7NVMaHV6bbSsCfsw
 4rCugA1JTl8j9zCMpT01YrEKwzUxnL5JN/C4vuVK06j3nheY3kZWthSywLR5lTQcqbKk=
X-Gm-Gg: ASbGncsjndb1W61JNYdfAQYXhUWRlAS9w5pVqvOtf9bbNL/y4JUu8BsXHiOIQMP7Zwe
 cclFFBhnKmDM9aOzZfLQjnQtWcPDqCCUhfSSWDekoMXMCnIOWcWC+nsBG8RkHpTWhhbCbMzPLAn
 xrNZkHxKbY5d2eO8KolTsvuhfNQ5i5Izgsk5A3EHpDJ8J40WwMd4cBd6IxN9QLiYTUepaorpvpr
 PSf8mtvoxpJamTmOUeprSBN1uE8HS3P3pAYojyXOFqJe30VpCgzsxjmxOUD2Ys8B6z2J0MxNlpt
 3mklv2vHwDAmhnOBJsrEIYnD6PZxAgT5oagnEE54g38e+s576sKvVyjWfqdRTWA9t+MkbQ==
X-Received: by 2002:a05:6214:23cd:b0:6e6:62fb:3504 with SMTP id
 6a1803df08f44-6eb2ba0c59cmr29712106d6.8.1742466522646; 
 Thu, 20 Mar 2025 03:28:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IENDiGX/C/TqtQC7A30JrTt6Srt5dzpSfvmRqIWtJNoV+GAAS2k4SYx2YUt3qrXWOs29AJnUw==
X-Received: by 2002:a05:6214:23cd:b0:6e6:62fb:3504 with SMTP id
 6a1803df08f44-6eb2ba0c59cmr29711986d6.8.1742466522225; 
 Thu, 20 Mar 2025 03:28:42 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac3149ce9a9sm1138534066b.110.2025.03.20.03.28.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Mar 2025 03:28:41 -0700 (PDT)
Message-ID: <3b4c816d-d7e7-4029-917d-f519a75149d6@oss.qualcomm.com>
Date: Thu, 20 Mar 2025 11:28:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] misc: fastrpc: add support for gpdsp remoteproc
To: Ling Xu <quic_lxu5@quicinc.com>, andersson@kernel.org,
 konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, srinivas.kandagatla@linaro.org,
 amahesh@qti.qualcomm.com, arnd@arndb.de, gregkh@linuxfoundation.org
Cc: quic_kuiw@quicinc.com, quic_ekangupt@quicinc.com,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20250320051645.2254904-1-quic_lxu5@quicinc.com>
 <20250320051645.2254904-3-quic_lxu5@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250320051645.2254904-3-quic_lxu5@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: zE1OL6xh0MsZzHjJ_PC2ZKiw_sXzt0dY
X-Proofpoint-ORIG-GUID: zE1OL6xh0MsZzHjJ_PC2ZKiw_sXzt0dY
X-Authority-Analysis: v=2.4 cv=VaD3PEp9 c=1 sm=1 tr=0 ts=67dbeddb cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=0IcnB8eo5JocWn4U3IUA:9
 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-20_03,2025-03-19_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 mlxlogscore=999 phishscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 mlxscore=0 malwarescore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503200064
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

On 3/20/25 6:16 AM, Ling Xu wrote:
> The fastrpc driver has support for 5 types of remoteprocs. There are
> some products which support GPDSP remoteprocs. Add changes to support
> GPDSP remoteprocs.
> 
> Signed-off-by: Ling Xu <quic_lxu5@quicinc.com>
> ---
>  drivers/misc/fastrpc.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index 7b7a22c91fe4..80aa554b3042 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -28,7 +28,9 @@
>  #define SDSP_DOMAIN_ID (2)
>  #define CDSP_DOMAIN_ID (3)
>  #define CDSP1_DOMAIN_ID (4)
> -#define FASTRPC_DEV_MAX		5 /* adsp, mdsp, slpi, cdsp, cdsp1 */
> +#define GDSP0_DOMAIN_ID (5)
> +#define GDSP1_DOMAIN_ID (6)
> +#define FASTRPC_DEV_MAX		7 /* adsp, mdsp, slpi, cdsp, cdsp1, gdsp0, gdsp1 */

This sounds like a good enum candidate

>  #define FASTRPC_MAX_SESSIONS	14
>  #define FASTRPC_MAX_VMIDS	16
>  #define FASTRPC_ALIGN		128
> @@ -107,7 +109,9 @@
>  #define miscdev_to_fdevice(d) container_of(d, struct fastrpc_device, miscdev)
>  
>  static const char *domains[FASTRPC_DEV_MAX] = { "adsp", "mdsp",
> -						"sdsp", "cdsp", "cdsp1" };
> +						"sdsp", "cdsp",
> +						"cdsp1", "gdsp0",
> +						"gdsp1" };

And this could become

*domains[FASTRPC_DEV_MAX] = {
	...
	[CDSP_DOMAIN_ID] = "cdsp"
	...
};

etc.

Konrad
