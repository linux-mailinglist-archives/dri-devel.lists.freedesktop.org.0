Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BF36ABBBEC
	for <lists+dri-devel@lfdr.de>; Mon, 19 May 2025 13:06:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF2C010E215;
	Mon, 19 May 2025 11:06:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="JewDuTcO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 822CD10E24B
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 11:06:20 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J9aBLk006225
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 11:06:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 WUNDWWtPZoGCLyfSP3pq1jbetmnEZ5Ir/gdEY68iwt8=; b=JewDuTcO/sMRs/sz
 BHl7xxScZxq9ahtbeNBmg9j9H1VG6RozyrCBhw0v8RsfaHnjIJyqZbCxmj6ufHov
 H+CndrM1ua2utYRfhwYxPjx6CV+4CKr0zfvcz6Td2vUlryypWkwtm9hYbQj6ciW6
 fpUGA+lwuokrxopJO7FQE9p5gpW75aVsTfi7x8RBdQRKy8coRUbVGvA5XBQbj0wD
 w51V9l16yUQxEFoZgCn15mNmT9JPEK7LRpOboP7nP1zRpjxy646OJw8eYLiHtjCS
 BTDTzHPHnWdhBqiTq0C32TpIkqmJulgTJo6mUwTHgnA066ahuuA9b/FttEO6J1so
 uQITAA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjm4m2ty-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 11:06:19 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id
 41be03b00d2f7-b240fdc9c20so4469704a12.3
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 04:06:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747652778; x=1748257578;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WUNDWWtPZoGCLyfSP3pq1jbetmnEZ5Ir/gdEY68iwt8=;
 b=v6nj1PrpH24GASm3v8JgPblefILjrVPON/RohkIv6Ur5X6za4WwNOadfFwGcISSjmF
 i2k4RmE8G38ctZ3X7D+hcev9HSe/jQWAnGMmYDKstBKwL4okIpBMPHRWpTp2OgBBx46M
 0Q4veqFuLpja9tzCfuVWlC+h9MUKSfkSnH+gJR2orCoVYyjYe+/yPnrrF4L+jAZSShYC
 huRUZ4Hd7kTLW+OE014VCZLdyijyTbevhQeu9atoZ0oRzzia+pJll0KvXEtFIe+Hd4FS
 JTgKPMJCSAJ3m3BTWo02iT+giYRr0Q7m28TaMNFJFZLsGC1CDiypzywlgAq3fczIKxfh
 VDkg==
X-Forwarded-Encrypted: i=1;
 AJvYcCURFsbpA1FeJguakSWQ4rg0gbp9Gl5sLX6yjkVKTaR4o3QSsgxzlguCjIEZYxDaeNcKGlP5QK/RXlc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzNcvfX0CKOYimf7KMiCiG6BufL5O9W2rFFCxVmPMdbNqjIEDuH
 d65smfsWGLefJHcX/4NsBdiOrfwOuUIl77ra/aMMzRZEiue16GVrMHCdz2wbCoEH+5FzWFTxjz6
 wHrZUIgEBt7VjhDZcwUDDiVgwD176EIlKlqlhmPtdA5rD95fGfA6NlvaEzB8IWEm8LbQwuyg=
X-Gm-Gg: ASbGncsDLsMiWfOnU/xvXa1F5AjY+x8ZgRkZBFKrbGL3Oy9DZvLcfc/+nyL0QVxzuNN
 xKHCYI6FlNt9Cn71Y/gO5YMzEN5hXOZpLM0DWOfYkLzkqS4QzlahE3GCXLfJK4vUdL0KLsuYWeW
 fw8f5lFQZglErF86rzdOcWfiz59EFoTIgtSQznE3Dk6fyc+hAcNVF6jxovVwjNEf8g6hV9WPcuw
 tOsN4PLED0UNE9dZOmYQ24BL3hYMxXH59uD/mcertBrXObiTuIXOjuc9Miz2ws/Sc3br9MLqg8Y
 HcFxeCMd/BJkgafaxY36YEt52X3nK2gwV/ummA==
X-Received: by 2002:a05:6a21:3d8b:b0:217:ff4b:cc57 with SMTP id
 adf61e73a8af0-217ff4bcc70mr13447297637.39.1747652778277; 
 Mon, 19 May 2025 04:06:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEHW8AIMBrKHP5ulMfETRqfjRJlImNtYkbXRn6muV3ss1e64lSzJgGDOqisnYMXvv+ewYsT/g==
X-Received: by 2002:a05:6a21:3d8b:b0:217:ff4b:cc57 with SMTP id
 adf61e73a8af0-217ff4bcc70mr13447275637.39.1747652777923; 
 Mon, 19 May 2025 04:06:17 -0700 (PDT)
Received: from [10.204.65.175] ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-742a970bb2fsm6135568b3a.53.2025.05.19.04.06.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 May 2025 04:06:17 -0700 (PDT)
Message-ID: <71eb4b35-51a3-411c-838d-4af19631325a@oss.qualcomm.com>
Date: Mon, 19 May 2025 16:36:13 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/5] misc: fastrpc: Move all remote heap allocations to
 a new list
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: srinivas.kandagatla@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
 gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
 linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
 dri-devel@lists.freedesktop.org, arnd@arndb.de, stable@kernel.org
References: <20250513042825.2147985-1-ekansh.gupta@oss.qualcomm.com>
 <20250513042825.2147985-3-ekansh.gupta@oss.qualcomm.com>
 <sgfcaujjpbvirwx7cwebgj46uwlcvgr4cgcnav5fmwmjsf4uku@iytanuqqiwxo>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <sgfcaujjpbvirwx7cwebgj46uwlcvgr4cgcnav5fmwmjsf4uku@iytanuqqiwxo>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: McEF7iiuFXjMCyJpr_2pkTngZ3KCPhrz
X-Authority-Analysis: v=2.4 cv=C4bpyRP+ c=1 sm=1 tr=0 ts=682b10ab cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=04P1SzlzcXGIquy7d0wA:9 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: McEF7iiuFXjMCyJpr_2pkTngZ3KCPhrz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDEwNSBTYWx0ZWRfXzCjUeOCIRK+4
 7jjvVl5vH4ZuP52lfX41++8JoUxAlXrOpP9fXw1UlGRe94s3tsy9j/tY2XNUrL3x05pDdC64ZpP
 JEfrNcYM+oMd8QWCyCH2MZuM2PWkeTeCPAZapbbUr/7J2GkfdNMPjPM1HCT12RBEp5xAnv8O7gb
 ANZ3bM/8n5UlccneIaMjASy68xu86GOcBPwtCLPjijAEg1ULCsUg8qijU6vgKcVjlb0bvFkQ5eh
 YhPtDf6IYEyNUvvJYDlkwsBuTltRtbMJ68PXTU78/21IftFtmbr3OdZnDkAGDEC+Q5NQ55V2AH4
 7x7Rx+fpeP8gSUvTLaXtyQGQCARMyiSIyVQEfOb/fxECi7p0zA6/4ZMWIfvGAd/7CiBtP0SGUbv
 v2ei1JAgwmjnHDTwj43q5FHupsxVob1GuZR8NKt6JNQSQqVxzQGKx/gNGAeyjayzq6LYI5Cm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_04,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0 adultscore=0
 mlxlogscore=999 spamscore=0 lowpriorityscore=0 phishscore=0 mlxscore=0
 bulkscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505190105
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



On 5/19/2025 3:46 PM, Dmitry Baryshkov wrote:
> On Tue, May 13, 2025 at 09:58:22AM +0530, Ekansh Gupta wrote:
>> Remote heap allocations are not organized in a maintainable manner,
>> leading to potential issues with memory management. As the remote
> Which issues? I think I have been asking this question previously.
> Please expand the commit message here.
This is mostly related to the memory clean-up and the other patch where
unmap request was added, I'll try to pull more details about the issue
scenario.
>
>> heap allocations are maintained in fl mmaps list, the allocations
>> will go away if the audio daemon process is killed but there are
> What is audio daemon process?
As audio PD on DSP is static, there is HLOS process(audio daemon) required to
attach to audio PD to fulfill it's memory and file operation requirements.

This daemon can be thought of to be somewhat similar to rootPD(adsprpcd) or
sensorsPD(sscrpcd) daemons. Although, there is a slight difference in case of audio
daemon as it is required to take additional information and resources to audio PD
while attaching.

//Ekansh
>
>> chances that audio PD might still be using the memory. Move all
>> remote heap allocations to a dedicated list where the entries are
>> cleaned only for user requests and subsystem shutdown.
>>
>> Fixes: 0871561055e66 ("misc: fastrpc: Add support for audiopd")
>> Cc: stable@kernel.org
>> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>> ---
>>  drivers/misc/fastrpc.c | 93 ++++++++++++++++++++++++++++++++----------
>>  1 file changed, 72 insertions(+), 21 deletions(-)
>>

