Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F5B7BC3B7D
	for <lists+dri-devel@lfdr.de>; Wed, 08 Oct 2025 09:49:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9161110E02F;
	Wed,  8 Oct 2025 07:49:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="W2n2fsyj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FE1110E02F
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Oct 2025 07:49:38 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5987aW1F003354
 for <dri-devel@lists.freedesktop.org>; Wed, 8 Oct 2025 07:49:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 f6FGKMqGT/it1BXXMf4DBINopGEsg63OAjTDH201qHg=; b=W2n2fsyjCenGht8j
 lqlxGr8dFa8Y01EWBRjea6EnfbpvECALOYs5Sc2CMrqJcry1m2xF9HR4QHA3X/vO
 BH4qE1LnsCzB9SfMgRNsVwRp6Egw3gP1Mqh/PH/GYgkDH+HxGyjvMtzpdGxwU/Na
 XOTgaKiwi6vSc1fIjhFvHAvqNKTfLzyf2n9EFx2m8tRPZ+hzC8HkoM1MFPtTyVgX
 CPeXOo3YI9MBNC4y1N3xe1bwKDDjQ6nVqL09zup6VCICEyWahxgoAin/ojBv8GNh
 yqVqk0I/p4tDzlzBxf573kEkA1CvoUdhe8Q0THNT4lXl14ziHqKSb5k4cU6Q/vij
 Uweqmg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49juy71q0a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Oct 2025 07:49:37 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4e4b4e6f75fso20934361cf.1
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Oct 2025 00:49:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759909777; x=1760514577;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=f6FGKMqGT/it1BXXMf4DBINopGEsg63OAjTDH201qHg=;
 b=I8DRF9Uk1/uxKIVuF9lWKk6YYU3C87tSEYYjTHYKA6Bxn7p/P+pku6EbHH/VQfS+uA
 +x+muQ5CSWGTmzKKJr74xcsf90hHnDU2wKwdARc78QtHrGPOjTB+NVNPaKYP12vK1tSC
 +48UaNOoEQGrWmMkk9MnPvkCBuki1PYzO7uIiXz2fw6BQkOaLY1Vx3XxM57FkNFUeipO
 RVrwHEGpA+TbLi36q3Q711ucKJpQQ493DgCAbvn7wDDlAdCOVhllR3tjOf3CL8cVIala
 8XOqy2Hxm10lPD3tylpbVJxO2Se8qI8/6k5JrGYueuidy3uh8eQnkFU+D+E/nYPXszTB
 yofA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWu3EmdL/RpuoBd1FvG2gAYykRmvu0et5sr4lsHdudbIIWd206C32fHoohjf6s4V8trxn2ljXzle+o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzCCQzoYR1Gx5t0d2abeikRZMb4IPBFe1cKr32ymlk7DIDvyNAB
 7CR8//G1Nc9JKzmLE87pCDgeceDdqA9GHGVIyR3WodJwPFcRzqLr74TBZnjhmvSbKuJxujB21ia
 74b2QJmaZMnQSjv8oGEzSHzATyRm13qkTkeBdqXDx+XUGdxkzOvV5md86cBl7mNX0sc8ilg0=
X-Gm-Gg: ASbGncumZJV8AvxLfsmMzNq6EhtPBe/f5kDtFTZJ2hxnAh9dogKL/Uz4UXMJtkoWvD5
 /Ko4/x05f4byQJr8JvFlT7eUfWwvEOnGa2+rvwSwptTcmdSqR1EZ3i6vMC2hD+ajP/p/RoneQoQ
 nfgAhYLZs0G2oe6LyGgCIm8MaPETHax2oYukKbYHCXcZPLUJmLZx0bSsOpJLcoyVgLo/Lze7AhQ
 N9PZI9zfFkfljYeGQEUWlFj6ftHaSaQDB2FFeF04EyqShFFByRtVdL0rBeOqANkAGHFdJIY4nU2
 bX30v2rulBNdy4BCGAiH3vqwFuSVKjsDTdC3rlbNFyexc8Ec/lgCkOFN4BlqRPZkYlPRefijix1
 Wf6rCXqzcKjpAWyP3+3NkRsDGWo4=
X-Received: by 2002:ac8:738a:0:b0:4d1:7b86:3618 with SMTP id
 d75a77b69052e-4e6eaf20fccmr18572931cf.3.1759909776725; 
 Wed, 08 Oct 2025 00:49:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGMQVUQpo51JuaeXpfR2ayI65xP1qWadO5lRPd+cQm1e8LxV0RZwtOpSEe047HzmkSgyMLPsQ==
X-Received: by 2002:ac8:738a:0:b0:4d1:7b86:3618 with SMTP id
 d75a77b69052e-4e6eaf20fccmr18572771cf.3.1759909776153; 
 Wed, 08 Oct 2025 00:49:36 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-639d4a67888sm1577799a12.1.2025.10.08.00.49.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Oct 2025 00:49:35 -0700 (PDT)
Message-ID: <c3339f06-aaca-490b-997c-8b6b145c93c8@oss.qualcomm.com>
Date: Wed, 8 Oct 2025 09:49:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: Add xbl_config image entry for AIC200
To: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
 jeff.hugo@oss.qualcomm.com, carl.vanderlip@oss.qualcomm.com,
 troy.hanson@oss.qualcomm.com, zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20251007221528.561242-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251007221528.561242-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=IrITsb/g c=1 sm=1 tr=0 ts=68e61791 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=3QUyYiSUeFS93uMjaC0A:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: aBcDIBazQxcR6X91QcIlrjY9KJVNTBDj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAyOSBTYWx0ZWRfX9IltnbgoEYsd
 u+wAcEn8VzZiKL26LsuQP1huDnvxt2nN4K/UBaPfE1l3QCRJDjJ0egdYV9Vwrbp9B/OFDbeZ5qX
 57Cug8vyXhHi6YpFiOvtFFkq6ZSfz8QIpOlrFzCu0Cj/b3nvTKjmJsRLJNUrnQTJZ/O9aqfHqHj
 quu2r3VKx3Fo1rOTjmx0sVgMI1r836X1QdChWa3EqfIOOi+ivchhTm6wWiPE4PB3RyB9iIeAjKK
 TPiCZnXvySiJeOduXQtdjRPsvVV7pZ8pyGHoOPpTZWS6ch9fCQ+tsFfefMbxJ+Sh59IHaWZBjsb
 VZnZ9dq4MmQJePNiAInA5aI19hVuWgmXaWVXdOPhwfn5csazv4K0ERiyY1t/JuckjbHWEoom0x8
 eAOOidCDr9z+CX26/LMuWrNpRbMw9A==
X-Proofpoint-ORIG-GUID: aBcDIBazQxcR6X91QcIlrjY9KJVNTBDj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_01,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 malwarescore=0
 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040029
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

On 10/8/25 12:15 AM, Youssef Samir wrote:
> From: Aswin Venkatesan <aswivenk@qti.qualcomm.com>
> 
> Update the Sahara image table for the AIC200 to add an entry for xbl_config image at id 38.
> 
> Signed-off-by: Aswin Venkatesan <aswivenk@qti.qualcomm.com>
> Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
> ---
>  drivers/accel/qaic/sahara.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/accel/qaic/sahara.c b/drivers/accel/qaic/sahara.c
> index 3ebcc1f7ff58..04e8acb94c04 100644
> --- a/drivers/accel/qaic/sahara.c
> +++ b/drivers/accel/qaic/sahara.c
> @@ -194,6 +194,7 @@ static const char * const aic200_image_table[] = {
>  	[23] = "qcom/aic200/aop.mbn",
>  	[32] = "qcom/aic200/tz.mbn",
>  	[33] = "qcom/aic200/hypvm.mbn",
> +	[38] = "qcom/aic200/xbl_config.elf",

This is the third oneliner extending this array you sent within 24h,
please get the list of required files and update this list once and
for good

Konrad

