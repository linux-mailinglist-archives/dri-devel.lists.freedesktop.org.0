Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 286DEBC5827
	for <lists+dri-devel@lfdr.de>; Wed, 08 Oct 2025 17:04:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84AA010E840;
	Wed,  8 Oct 2025 15:04:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="X6WOrroF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0923B10E840
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Oct 2025 15:04:09 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59890LmM001555
 for <dri-devel@lists.freedesktop.org>; Wed, 8 Oct 2025 15:04:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 D1FsHI8tDKC12GU64drWYojuDzJtnmaPmMWYps3VYB4=; b=X6WOrroFhitCv3Rj
 ny0xeMxH6m8/vXluRrpZc3TNXidH0yVFcldDkFotO+Drsl/U6hL7FUs0UpjLMicy
 HVGn6JIZF7zmTCfX4faAP+48ZkWGkIV3Bs65nraPozStlQpdZNsFsMw16xVgGFej
 xXIsIf1o7nIhd4w9JwwGnNBeopVQ/Owx5Or7hHRSAHciaThf3wkKRr0OAXfG1eE/
 bUTmfQueJSiORxOUkKBeU1zXx4p9f3A7pNVgVj5y4YbVFTJvT5uSZFt6fGmjGdwC
 q/Kl8d/Qu/VxAY4pMPOsCgYuzLRLbiT+dmIl2BtCOfF7COhcn/HGiOid+y8TdHs7
 YxTfKA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jrxnb9pd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Oct 2025 15:04:02 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-33428befc5bso22195a91.0
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Oct 2025 08:04:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759935841; x=1760540641;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=D1FsHI8tDKC12GU64drWYojuDzJtnmaPmMWYps3VYB4=;
 b=jpPT0Ew8Q645N7+K7EzUvuYesdjHAU7Ji2/wKbXldFJ4Hh2/z6bxsC+QbuFUBIeXjw
 dlhcjVvVZV1K8ofTTnmouV+sOkBGbZPp0OHIoxEdCHflcmeZiFC+4MZM1jsmbshAoFSz
 rTWwhBhpoz3dXWle7fhEVoIEXPz/e/NZb0tmlXNL7WieX1muywxAW6WPpO6fuEnYCTHk
 zYYDKFeGKdNdw5nxAWz2XVUAoUCLXpQDcTL1MYQFRv5NZq6zxgQSpqDA2O/5HsFsgOIS
 3+1Nx4JeSfgVPzAyFAauuBrlNZFd8v6BTb5aFkKt7poj996x7tr4qVAIPmvpGSZfEWbg
 ZwZQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVeSW5VExnAA99lwDshik1fLACUyVLIsh/roAp6s8QEj/PI6ekV6OrRnEzfBvFG1LVNhwKdjM4Iz/k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxrKRYnP6OcqM5+Cu7QjYhYA1c4+7e0ov26LzViUqIXv+09fj5D
 32Q8/bqZK7j6FIdJ/8qSy89t+5dZaP5ReFRHXkxwAgxOtE1sLhCzg7R22vAOTq6TYC0slecTYvY
 WcKk4TAcJ4DQDZKZPp0xK4QjjouDXe7S6ZuOmVO/0Zl7RmVEhN+KrG22jfcHIxg3G0xjasew=
X-Gm-Gg: ASbGncvHnfEe978pS+Us9ikjtaHiS5yIMs629rEFU5On2KpS76e1Rh3ViVDNBgtF1pE
 5KHuvw5uN+9tWeuGXY/bIwrSZh59ohd9L9CIC7IhwjqrsUQBBltmtAc/NSKxX+09UD/PPkOpMwt
 dz1cDUJPgN6AsXDeYvaIUq7/fBdQRM1fo8y3L9fMH89feIkNgVmkGKV+KII+3ZiiHoHpt5AtwDJ
 lM2EzBMUIDAOTN28rCIbW13dabnIwc5/W6u2m338ww33LPh2+9sMxrrp5TRFDNkzk6/TWx+rL7m
 FDHK6UqnPk6Oe9XVyEJnnaqU3H/+4ffKHZ4B1mHg145RNcLz3H1WdN6taVXv89Ds3EQl8CAw/lV
 B2zvoLlU8skMoIJ+dAP8=
X-Received: by 2002:a17:90b:4c89:b0:321:9366:5865 with SMTP id
 98e67ed59e1d1-33b513b4afemr4474911a91.33.1759935840672; 
 Wed, 08 Oct 2025 08:04:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHXb2r25FrUlFtQmKCbW4C/1VTz8aMkN2qm5ZdQ8T7jblUuJ7YHZkg4PXB1eDjHmdFUyYJMXg==
X-Received: by 2002:a17:90b:4c89:b0:321:9366:5865 with SMTP id
 98e67ed59e1d1-33b513b4afemr4474795a91.33.1759935839738; 
 Wed, 08 Oct 2025 08:03:59 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-33b51394fe0sm3768860a91.19.2025.10.08.08.03.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Oct 2025 08:03:59 -0700 (PDT)
Message-ID: <b84df96a-16c9-4369-b3a2-7f4204416261@oss.qualcomm.com>
Date: Wed, 8 Oct 2025 09:03:57 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] accel/ivpu: Return correct job error status
To: Karol Wachowski <karol.wachowski@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, maciej.falkowski@linux.intel.com, lizhi.hou@amd.com,
 Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>
References: <20251008061255.2909794-1-karol.wachowski@linux.intel.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20251008061255.2909794-1-karol.wachowski@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAwMSBTYWx0ZWRfX9HieCVq+aQWe
 oiNHS/kTnMq00D89qeiOl+5w6mCok7E+YWl9F/0c/oEpQ+JvTFYqLoNiitaAgVoLS/TZsQ7K4RA
 13bAkaPe1Px02J2vaDnN4j+plXBiTub8X1pi4/69ZxpTAWKhy4U/L5zJmbXBglUywkiILTGDwFT
 soLK6DY0ovMszASIZouOrbjsK9ubgpz10MXY8IIA5geq4r4yh3ZqQzNFE7q5BaLw/hlSUFX98Sc
 BVvavWI4F/43/at/nB/h7psYEMcTUhJb7v3Yp6Z0zhC6cvRJKq/haJLyzN2DA3xGQVixlIy/T8b
 OzNZCcnjP/qqfGpG4fwdJWsUSYq80FZ4fKVGXO2X4nFN5eORKHhEBcAi8xciHKPVdebwHDd0VIw
 TJ0mAIulE7nsUaeUJXVKPcXSAzyr9g==
X-Proofpoint-GUID: SeKwT3_Vas9zudgZpAO37RJGkMydreCU
X-Proofpoint-ORIG-GUID: SeKwT3_Vas9zudgZpAO37RJGkMydreCU
X-Authority-Analysis: v=2.4 cv=EqnfbCcA c=1 sm=1 tr=0 ts=68e67d62 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8
 a=hcH7oEWeSakXkJ_fsSoA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_04,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 suspectscore=0 bulkscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040001
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

On 10/8/2025 12:12 AM, Karol Wachowski wrote:
> From: Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>
> 
> The driver was returning ABORTED for all errors that trigger engine reset.

This is past tense (was). I believe coding style says that commit text 
should be in the present tense (is). "The driver is returning ABORTED..."

> It is better to distinguish between different error types by returning
> the actual error code reported by firmware. This allows userspace to
> take different actions based on the error type and improves
> debuggability.
> 
> Refactor ivpu_job_signal_and_destroy() by extracting engine error
> handling logic into a new function ivpu_job_handle_engine_error().
> This simplifies engine error handling logic by removing necessity of
> calling ivpu_job_singal_and_destroy() multiple times by a single job
> changing it's behavior based on job status.
> 
> Signed-off-by: Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>
> Signed-off-by: Karol Wachowski <karol.wachowski@linux.intel.com>

I don't see a need for a v3 to do a minor tweak to the commit text when 
it seems reasonable to just inline that at merge.

Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
