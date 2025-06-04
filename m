Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36427ACE210
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jun 2025 18:18:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FD6010E21F;
	Wed,  4 Jun 2025 16:18:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="MJf2oh15";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA3AA10E21F
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Jun 2025 16:18:12 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5549eXlc012594
 for <dri-devel@lists.freedesktop.org>; Wed, 4 Jun 2025 16:18:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 /FKalLodIY+3cT9Xt0G1l7UIsgPISWBmeyASaI94Pws=; b=MJf2oh1583p/fAql
 cBM6gNOQUiQ08Q8LoFU7I679R315ixTjNItYAbyN/93DrpJbZNPHi89pnTqW8LQx
 PVQhlUmM94eVf8EEA8W/HkgjM1onIAFG0fWSyZRr5qZwT08/vO7US2WWLMQiAlEb
 rnsZ/uQZj/WVwuBGfaQi6DqT89+OLVpl4796ihbJ5SEKmYmOhrkQV98qdhrdtB0R
 NRSrfs8BqWpC+nLyuIIHEOmcJ3owTkeGiaED+8quTpLHzoR2EEj1hQQwjU+BmVRm
 a5U6CHrp/xwAoQdZB0qs82IJ5g9WDENpvSYuPEH+u0JS5cRt2DBV5wGY/ocmajRL
 0P24Pg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 472be82d8s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Jun 2025 16:18:12 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-747ddba7c90so69963b3a.0
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Jun 2025 09:18:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749053891; x=1749658691;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/FKalLodIY+3cT9Xt0G1l7UIsgPISWBmeyASaI94Pws=;
 b=i19k5rqu2TYK6qcLc8gjrWTvfzTS2xbNNcV1Fp+Gwa2YA5OhPE1oqyZCLgoZj/Olya
 9zZzuWVEZVUSVdEN7wFL1dQ2KONCEHVbQIq17aqTEqNDQGLRC0uoJzShvXmW37g+krfb
 dW7T7PRwHQaJnlvg1HCk/6kxmUVLzw2/5tYUjMGzKevawIT10UANKfn/OwSEmjFwb0NB
 TDG/3x9vpGwTKoEoM3lbJYH5K5rp7DWpDHFpjY30G1d+fRq1LL98M1w3v4xzUzIZlDeh
 loLhOpD2QZPRFPgCL5v2/x14bIHKh7VIXMcJoup09Z2XJi1C3eb3n49i74EoptN6Ll8A
 sXxQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUvJF4iWT9sLlO+J4if0tEYfpO+ruUrLlXx+74OKOECyTITTJon1/UE702IKHYd8kfw2eHoymi3rrw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx8OY0V8FhTt+XTaM2IWYN89HjG8jDHvVbxDkOvhzlrliHJgurW
 3HNsPTwDFg7PHNWfT6OYREXyqZe0leJyXNIzD66DMBXj35T5d62FgDEWyiW2nVGqnfoB+82jYiy
 r/0/hSRjt8KNDIl6XHqS/shQfjhyRdkKbYB2ScfF/Gh08ZSm9EBVXCh779OulVyYBtel8Usw=
X-Gm-Gg: ASbGncvKLeUdBd2+PVMVgIWtypl3290keQTiYSqVJIAfc39IDBBkEefDjYu4yRPqSqv
 TBkJFaShYhi+2ktjJX5fV+AE+WJxLLuNCuVubXn0gpSJ1GpYow2m/gfkRqj608jqqsOXoMfqiiK
 5D6PdrSVbUf9IPciYnGt88ORTilVxLmtZ3HEouBlgDznGAUG6Ls1Pg26kX0expY1JscjysVYNE2
 nMdsCWuyYMQiGg87fkgKlVVMB2NUrM2EcQR+qLoQE0oYjiNahZpzZpDHHs2Eh6SqxypQpP7O9IK
 sbau/3HeLlMREPqyLpo1Oh0Ua3CZm+JqZ8P8LTzc3I4ZmaS+5EburoukmdyoYw==
X-Received: by 2002:a05:6a21:338f:b0:1f5:92ac:d6a1 with SMTP id
 adf61e73a8af0-21d22a6d399mr5102656637.4.1749053891316; 
 Wed, 04 Jun 2025 09:18:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHso7G09k9UvuycvraO1NDz4fm/Vag8N+EPM5/nbAn3PNvuV5tem1zGbbXZtmexx1nDcVU5uQ==
X-Received: by 2002:a05:6a21:338f:b0:1f5:92ac:d6a1 with SMTP id
 adf61e73a8af0-21d22a6d399mr5102616637.4.1749053890774; 
 Wed, 04 Jun 2025 09:18:10 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b2eceb02e93sm8956129a12.16.2025.06.04.09.18.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Jun 2025 09:18:10 -0700 (PDT)
Message-ID: <0423ac43-0a12-4f0f-ade3-61364d4abf93@oss.qualcomm.com>
Date: Wed, 4 Jun 2025 10:18:08 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/ivpu: Reorder doorbell unregister and command queue
 destruction
To: Maciej Falkowski <maciej.falkowski@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, jacek.lawrynowicz@linux.intel.com,
 lizhi.hou@amd.com, Karol Wachowski <karol.wachowski@intel.com>,
 stable@vger.kernel.org
References: <20250604154450.1209596-1-maciej.falkowski@linux.intel.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20250604154450.1209596-1-maciej.falkowski@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=bNYWIO+Z c=1 sm=1 tr=0 ts=684071c4 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=QyXUC8HyAAAA:8 a=VwQbUJbxAAAA:8
 a=XIlkvbPez1Y0lOnEMrgA:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: 433N1IV_xawogEIFZKoOfskMEeS2OV5P
X-Proofpoint-ORIG-GUID: 433N1IV_xawogEIFZKoOfskMEeS2OV5P
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA0MDEyMiBTYWx0ZWRfX2n4RrWN7X5Ws
 RfjRIE6miYCVKBKfKDjNXU79SrvsjwwC5QZSNExJ1v0agOpHknS7+1gHacsWQxGdleifXeMLa+K
 LVtCq/cT2TEhMMqIoUTB8Sp+0bjQMGSPsW7Ct8t1PFCikSiuTQIzOKOoim0bnEW8MUziMAYAQ1j
 mKpx9WUW6esq5WQhYkvkTUnFa/iBRu7sH9ph6ZBH6wWav5ciu/5/EdZjm8uFKOqddEPKsYNA5qa
 eNPuiW4M/vqWummBtto7dNWEuiGHnJfh5aZdIaWPsmZO60X7bnUchBwQrWf+4Icyevi1RS5T5pY
 zQhQgWij6FjjKPTVqrEeGZb99c3ne4A0n2v2l3VXacBzASlcBaWEK7XqJ3Ax+rPPM8KWn7p8qQe
 nhi6uRWQ9yD02sE8yhYaI8r7KnOSUXYpZmBDZxo8RwdV2HiFKV7sQKldXHLskFt7628OoZFh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-04_03,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 suspectscore=0 mlxscore=0 impostorscore=0 spamscore=0 clxscore=1015
 mlxlogscore=999 adultscore=0 bulkscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506040122
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

On 6/4/2025 9:44 AM, Maciej Falkowski wrote:
> From: Karol Wachowski <karol.wachowski@intel.com>
> 
> Refactor ivpu_cmdq_unregister() to ensure the doorbell is unregistered
> before destroying the command queue. The NPU firmware requires doorbells
> to be unregistered prior to command queue destruction.
> 
> If doorbell remains registered when command queue destroy command is sent
> firmware will automatically unregister the doorbell, making subsequent
> unregister attempts no-operations (NOPs).
> 
> Ensure compliance with firmware expectations by moving the doorbell
> unregister call ahead of the command queue destruction logic,
> thus preventing unnecessary NOP operation.
> 
> Fixes: 2a18ceff9482 ("accel/ivpu: Implement support for hardware scheduler")
> Cc: <stable@vger.kernel.org> # v6.11+
> Signed-off-by: Karol Wachowski <karol.wachowski@intel.com>
> Signed-off-by: Maciej Falkowski <maciej.falkowski@linux.intel.com>

Huh?  This was posted to the list on May 15th, and Jacek applied it to 
drm-misc-fixes on May 28th.

-Jeff
