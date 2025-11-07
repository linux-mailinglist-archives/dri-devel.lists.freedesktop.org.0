Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2828C4147D
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 19:29:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B251010EAFD;
	Fri,  7 Nov 2025 18:29:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="NzwFIR/2";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AcXiAhMM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 036D310EAFD
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Nov 2025 18:29:39 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5A7CYAcI2281722
 for <dri-devel@lists.freedesktop.org>; Fri, 7 Nov 2025 18:29:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 MpjK2rA+NNwU9b5o/GD7Ujhzx79pLwNclFBxZ3L2HUo=; b=NzwFIR/2D58AtxLI
 5vkTuMR7EJxjYHwRtLXdEVdikBcDLg7E3jA+JGkvevSgH2KpCcJaNkH5s+UiDg2q
 o36nIqic8WjGCXrh3RoS9XX+ZPs/5c7rGK3lyCCOUQ2UNlTFHhe+Zl/UmoSO5M5K
 P/rJ1W9A34S7yhpIj/6HSCYM+MAHDgwGywmcycPyBxT/t7rYN0jYqoMl7CsKyL5R
 a6iTMWjUwIdfSQ4yMG8QymktKzXE6+PCh4GtLAZsoekbrdykMz8E0TAAGeF0eWNF
 /geBRHEUJh1pF4pIaJNOFGFHWKiH7x53op1rA/kDpT39+lpjJztQkr9HaaDDVZCD
 tBNuEw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a9a9sj7f0-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Nov 2025 18:29:38 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-27c62320f16so16593125ad.1
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Nov 2025 10:29:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1762540178; x=1763144978;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MpjK2rA+NNwU9b5o/GD7Ujhzx79pLwNclFBxZ3L2HUo=;
 b=AcXiAhMMWR3Fvh6w0au4Sm4WsvBwaR1dfN16XCJ8G8o50I4i5JPzY3gXsjh35ptAIR
 r+MgW+93DnxRHJQY4BLOjSE87DuzWMqP8T3dswSpEK97u9bm6f5whV9TmyNk6YLKj1g9
 Ozg6J1vwyuxftzhmaRRwIcpMN/PkTk70hePAlNWWen0099drcp0v8i3i/dinx+gUbRpO
 w0Gc16I/rpPQT0lwZUtMUqfJwhfNQUKjG2QQQurcIyshFTH5dCDvuSs9Yy4Tm8d5ei/d
 eP9+HB/4WqX4RkS+Qobf1NWme9kXlNGi59Tb+sVN7x3LY6yv47NMjs6+yTtcyxlTjc6R
 dGlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762540178; x=1763144978;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MpjK2rA+NNwU9b5o/GD7Ujhzx79pLwNclFBxZ3L2HUo=;
 b=nHue8sCCBVib4U31YsHHGj4K2IWHlKGOS6TIDhBDWRz5PLgvsHrHTeGMwrssEb4X1w
 m4IiZv5fXIqF2e/j2JJ63KImxF26XLJ863gTJA/TCGMPFiDLaHijaSFG47U4pvk6iSwD
 c6v+QAjr2wMyvuIGEhPGHa3Dbs0arSTZ5/F9IoCZ7Tu0lj/IhDKXSFZ2Ds++FmuyNkS2
 OH7Bc5K9QIkXm/Sh0wwCkrp5kggtIzKS+hD7urBOR6Tos/DJBPv4OGH9GPHwv722EvTI
 ISrTK0ZbbODKxCBxsTvLqSppku/p/w5StY+D2DnACjIh2CWvU6E1ZYfxdHCiSXaOcoM7
 uK9Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWYeJBSBLlgTq9EkJpEFwOGv1sG9YcGWJP5BSaL64FOh0e9VWPmDVZLQdYwlEXNStpIiwxZr4Fddqk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwCr86uZjs+lbXaCCMkZZleiUp0hPbuN5k08AkmIxcZPtNEQBHn
 UPOspt4E3f1s17LD+TADD9MQ/EAvh9wkVL71y5PjhLQkExuAYfciwl9MQYBGTWGo3g8vqSD3R5V
 B9ERppCVk1u8/kfYYcE4dlP/K7Qki5qnkrdlKlqsyCw13t9rIO1Mh0HK3WmW2q8rILcwZvWU=
X-Gm-Gg: ASbGncsh4YpCDBZIXK8C6ooxshO8zS23DBN285oplOq1dBmySQ1ykEtzNMJZvpgiMWg
 MjdNg/iGIKc+VPICXSLx0cXrf9YF6GhD3sE5bZ05yKXX4s6ogLg2C6LYcOF6X3mlVQiw2XVbFEx
 fYIyc66c3IQzq71T8NJcd2tfTBswyv9HP+DJFJjHL1LykX5cp7nO4bEHwPKMr2nJvkzmgmTec6T
 wjCd+oc5g+ZcSLWvlpDvrrg78IWvqQl8Aul0nm1tw8Res2Hro1MTVs7aDeizb9zon6w47tmgMrp
 zNSNb/va5W7bHWu0jU/BsiHJJaPLJ71hSPPGk13FtIhx+37lU+qYcGZyZ4YbC1WlUXdKi+hNX/v
 NmpehBCXxX8+CA3MJwS/G7EhQjMqP66kzbgv/AaQinJwNo4wKBtoJ
X-Received: by 2002:a17:902:e80e:b0:295:987d:f7ef with SMTP id
 d9443c01a7336-297e56191b3mr1004265ad.10.1762540177962; 
 Fri, 07 Nov 2025 10:29:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGqRuxfjVyRZCDf3BXcIUPdAAopn2/c6Fn4uA4ymDQ0hrtducOxKth5m6lXQGzuYY/M3lL16g==
X-Received: by 2002:a17:902:e80e:b0:295:987d:f7ef with SMTP id
 d9443c01a7336-297e56191b3mr1004045ad.10.1762540177465; 
 Fri, 07 Nov 2025 10:29:37 -0800 (PST)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29651c6f797sm66983025ad.56.2025.11.07.10.29.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Nov 2025 10:29:36 -0800 (PST)
Message-ID: <2adbeb5b-2b52-4763-bc69-ec09b7637e86@oss.qualcomm.com>
Date: Fri, 7 Nov 2025 11:29:35 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: Add qaic_ prefix to irq_polling_work
To: Zack McKevitt <zachary.mckevitt@oss.qualcomm.com>,
 carl.vanderlip@oss.qualcomm.com, troy.hanson@oss.qualcomm.com,
 youssef.abdulrahman@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 andersson@kernel.org
References: <20251031192511.3179130-1-zachary.mckevitt@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20251031192511.3179130-1-zachary.mckevitt@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=CdgFJbrl c=1 sm=1 tr=0 ts=690e3a92 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=QMP_p6KWfhAjlvo0swIA:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA3MDE1MyBTYWx0ZWRfXwh0K9LR6R5j3
 i+xArLRcDFJghc4ZNFtZ9phnQzCtyBfZ1yyiov6Fm4xYXtN3j0rPyKqt92jmQ1Vt+Zp12/7nYs3
 IHg516Gjts74PCs2AxFl7ZIHxSpAbColVIxcbYrdKmssbezvzSqV19Xf6Cj05go4gta17ZpO61O
 HHfl1aQGM3q4KAApDJYJfMRSRLsYvlaX8aLtUQYRO5FNOPY4A+oYtOGWK4B76HUc54yy6B4dCki
 MU0vpuH6XUnlNaImpGvRrBZN/Q2W2VbvNZgfxNgu06GuJkgRzmPHP9NyTPqmGrxI5cVCgltkEEd
 pxzYy8G5R90tVB8KPJ64TCxaYLoEcrhPB8Dkx30zH9+WY+1S2CXNYlX4tFr0qguh1onB4bs2iah
 dU6YNUwPINVKEOAK5IyP+0CViWKl1w==
X-Proofpoint-ORIG-GUID: jwLLLRF9I4FBIjZdQXpdfW5knBhN0fgV
X-Proofpoint-GUID: jwLLLRF9I4FBIjZdQXpdfW5knBhN0fgV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-07_05,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 spamscore=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511070153
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

On 10/31/2025 1:25 PM, Zack McKevitt wrote:
> Rename irq_polling_work to qaic_irq_polling_work to reduce ambiguity
> and avoid potential naming conflicts in the future.
> 
> Signed-off-by: Zack McKevitt <zachary.mckevitt@oss.qualcomm.com>

Pushed to drm-misc-next

-Jeff
