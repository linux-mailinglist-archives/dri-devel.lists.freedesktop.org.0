Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E9B3C48C67
	for <lists+dri-devel@lfdr.de>; Mon, 10 Nov 2025 19:55:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E618210E2F6;
	Mon, 10 Nov 2025 18:55:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="DoxmVHy8";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GhHb1iGC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CD2F10E2F6
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 18:55:03 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AAG8ex22992480
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 18:55:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 i31Jkdbc6ZwQdMs/k5lp51vN+i0JVQZ2SD2eDZUB7bI=; b=DoxmVHy8sHUsyfXl
 x16aTRAi8QkOU/MwP65F9EIWy/DHQ9ggCxUp444rIxeY5jMHj5o/DloMJVLLEAmf
 kUhqg5zzq4jLbnorwH1/9JcYc1D6TRcRUyoK3g+/ISBDP+t99jDgt1zRLO5riNb2
 DOtgWgr5vIUKtgrRR5Q4gIMr2buMb6AzA2K34rtU+9s3VmAew6sx9jfejHy7SuTf
 N5DZKoF0eZSYdsVoSA0wdDB/P9g3HQZhUf6BFpo0HrreZcp903611NPStd1QwfHu
 xJ5/cAVkVHyxiKysqSrLl7fe1UlbUtZMrhEgph1jhr54M/F/EFqhvG64uy3tzk3f
 eiGB4g==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4abd88srp6-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 18:55:02 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-2956510d04cso42963965ad.3
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 10:55:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1762800902; x=1763405702;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=i31Jkdbc6ZwQdMs/k5lp51vN+i0JVQZ2SD2eDZUB7bI=;
 b=GhHb1iGCHQYfV2Yjg+A7b+mL7o9lmtaYzRitkcuZ9jlYyt+Yque8hl5ghEwpTWA8Bk
 +OVsO8tKU7L/KBMZ2kdMHzg3e4f2+X1gOeFYJb/Vodsv81txGBgCftUv1rmlL/ryFDWO
 xlNxg3SVhNgEpfttl3Gng3AmqKNyehd4J9UGkMr29pQqhnBsIMVnTwswHcQIvUIvnskC
 +nyMPjNbvFYL1jV3dn9qqkxaH3wfNvvZ6+bnwtU9ofpUvbbU/fUjokqLHMQW27clYDsm
 4jjwVA55qeDtZQRkSHPZfFO1/i/GJxrilhJMctpQvCF+v4qKqc0ESSaSsPl52eDzdpQ7
 yaMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762800902; x=1763405702;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=i31Jkdbc6ZwQdMs/k5lp51vN+i0JVQZ2SD2eDZUB7bI=;
 b=hAejtuj6knocd+AyKO/JxjPgY4Lx5Tq8vn+HhudvKR6VdnJsSCQ0SChDFQzXiiOnRn
 ZLi5Xhp9kjzmUG94cDEBpjHKzelJbaVsS6TzR/Y1pZKqbF9v4b+bAq7MFvNQbX/w4wSJ
 4BKctYtt2IP0hgG/3zjI8cnp9LqMa1iUzpYYqrkSmZzZ9AeEFKJXc14xolS7GLdUBgvF
 7C5TDdZj1EfLOPfB+/eJ445sal2Mw1LGF7JM2BGbwyql6/CgWYRVst8o1PUth7zmlUMy
 1O/vzhNj4gcgvuzK9yVYIppmzohD2eHt+SR7BEUNqLNsWZ/x0rHT1KeotD1a1aios/PP
 Z5/g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWe6t3mS8EBFzw4B/QtaNnCy3xns24OcRbA2YJTiYXY3rj8tHXsnMgkrvj4w1J827XuKLumXdnK3OA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyxgAcn7a8R7d5EOQKRkNNdcN1sRPUyGzrfJMXb7nxaSGoPY7/C
 2XY0uxb1EUtHzyB5UrtEF+xWWCbudc/y2CvqG9kEC/x8i9Al2L6MfkYAYpPYBe6fzV6ETvdp8r0
 OoHrWLa2SGxOahn2Z2PjyI1cR2l7LMGrEdG2iXcyayVuBTXhj6HT1RP0H8VrZ9kGQhhktMQA=
X-Gm-Gg: ASbGncu5Jn6fI5GNMmsjgtDRT7chd9cFgiwgMKQNAMN0fSPvjU3zW2uD7bVjzoxxcim
 EN323uprdLdG+AvTgDPGBrQ6orBrv5OgWSUmF0HxQog1CHFRFRRCf8K17wsRrY6oTFkYM6yLRmg
 iyG9UY+ZOYQ2CGyvTBO5KGt606S26J1rbZ/rivLVL97axNZuWhX9qQrIcGfInxFtlcduCqu6Xeq
 wbOkj0A/deu0eCxdvLxZ1PDwmJ+jExJxEsmVL7Gm12n0rJ/cwtbUQs7doviArJXtiahOEDXYq7/
 CBTvqWd9cAdWWGFFixLF2lX51hnjVTTa9y9IKHUbegnWHsmClodSP3rkK7MQMdcm1+yg7HTfmI+
 MbWnAmfClamnhNOl4qT7bcLRNY8M16wLyz2YEharFWnAiduyOMHSS
X-Received: by 2002:a17:903:244a:b0:295:bba8:3c4d with SMTP id
 d9443c01a7336-297e56ada4fmr110965805ad.35.1762800902140; 
 Mon, 10 Nov 2025 10:55:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHnoi8L/6S2oVVbU1pOEwmq5eJK/vJw958G/hYadl9mjrBUKeaV27bhmZWcoacrQdwz6Pv+FQ==
X-Received: by 2002:a17:903:244a:b0:295:bba8:3c4d with SMTP id
 d9443c01a7336-297e56ada4fmr110965415ad.35.1762800901552; 
 Mon, 10 Nov 2025 10:55:01 -0800 (PST)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29650968602sm157045745ad.9.2025.11.10.10.55.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Nov 2025 10:55:01 -0800 (PST)
Message-ID: <e44c8f40-b6ff-4369-8d86-ded225b41544@oss.qualcomm.com>
Date: Mon, 10 Nov 2025 11:54:59 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] accel/qaic documentation fixes
To: Bagas Sanjaya <bagasdotme@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Documentation <linux-doc@vger.kernel.org>,
 Linux ARM MSM <linux-arm-msm@vger.kernel.org>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>
Cc: Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
 Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
 Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>,
 Zack McKevitt <zachary.mckevitt@oss.qualcomm.com>,
 Aswin Venkatesan <aswivenk@qti.qualcomm.com>
References: <20251110035952.25778-2-bagasdotme@gmail.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20251110035952.25778-2-bagasdotme@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 3ONjo_IF12SAnYXNdoKvcswpxNmUTKUf
X-Authority-Analysis: v=2.4 cv=PL4COPqC c=1 sm=1 tr=0 ts=69123506 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=rOUgymgbAAAA:8
 a=wQdz1tM6fslYZEmrDPIA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=MP9ZtiD8KjrkvI0BhSjB:22 a=HhbK4dLum7pmb74im6QT:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDE2MCBTYWx0ZWRfX6RuGBOJeetOQ
 r6+L3Dul3z9jA1vOcCcxn/iCv93WeogI3VxAsvAAcnfMFj4rup7kcyARKKMNt90W8XseklWzVdl
 OkKm+nECd6G8zeQMyectx7pLslnqNXIxhYcVSpoAXgX085uXCAcdCp2sFeylwtfvKsbuHwjllit
 gDU8INfhVjuTzoeVWLZj0HiM2Q3RyaRErVLQ7ZH1eKLPAEIev2plzVrdHsaemK+b06qV1MQJcmt
 55kNVgM40DA5IRHv8t40oFjksF8/SidYDd0vyEquDqd1SUwZkwDwWM6/zx2WEx1tlVvW6bIqBwD
 0IzbaPHw5JYtkmotOE1dZZYust5ylJOKjkBZJGwLlhBOFmtMiG1+ahDB1lSs/FdkrRK0Ay+Vy7X
 pz/GujNL/y+sC/DMcQ+SvHkuxYdxiw==
X-Proofpoint-ORIG-GUID: 3ONjo_IF12SAnYXNdoKvcswpxNmUTKUf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_07,2025-11-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 adultscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511100160
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

On 11/9/2025 8:59 PM, Bagas Sanjaya wrote:
> Hi,
> 
> Here are two documentation (indentation) fixes for accel/qaic as reported in
> linux-next ([1], [2]).
> 
> Enjoy!
> 
> [1]: https://lore.kernel.org/linux-next/20251110132401.200d88bd@canb.auug.org.au/
> [2]: https://lore.kernel.org/linux-next/20251110135038.29e96051@canb.auug.org.au/
> 
> Bagas Sanjaya (2):
>    accel/qaic: Separate DBC_STATE_* definition list
>    accel/qaic: Format DBC states table in sysfs ABI documentation
> 
>   Documentation/ABI/stable/sysfs-driver-qaic | 17 ++++++++++-------
>   Documentation/accel/qaic/aic100.rst        |  1 +
>   2 files changed, 11 insertions(+), 7 deletions(-)
> 
> 
> base-commit: a2b0c33e9423cd06133304e2f81c713849059b10


Thank you for the fixes. Yet again I am impressed by having your fixes 
in my inbox before I even see the reports.

I'll get these merged to drm-misc-next where the offending issues 
currently reside.  I anticipate getting that done later today.

-Jeff
