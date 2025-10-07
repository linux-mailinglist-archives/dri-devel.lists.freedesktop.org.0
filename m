Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CEF2BC1D18
	for <lists+dri-devel@lfdr.de>; Tue, 07 Oct 2025 16:54:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EF1910E1B1;
	Tue,  7 Oct 2025 14:54:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="d8FyE9qq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDA0F10E1B1
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Oct 2025 14:54:21 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 597ETKbL020772
 for <dri-devel@lists.freedesktop.org>; Tue, 7 Oct 2025 14:54:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 7pFzOCBtK6ecgFU0LGwGZWUqpH1ZlyB2kreE3/tCZLM=; b=d8FyE9qqk8UryWyx
 x3Ul+nxMDVsGuGCKpdTYYbF940w3zw116aVU11bmFLM9vsyXrs78K730m6x9i6Gl
 8CG5/AQcooZpTzmKUKeOhI+5soqK6dOWehzYAdGleqQvwlzz76cJjqpnKlKcyrnO
 gbEwvJbBpjk6iS9ofG//q5ZUfo7MYkSuVknAjvGNNddnuSrSXWVaKf+xoDIaNQcp
 yCNPQMMarbp7esC8AfGrshhjF3ELCcxURK+t+6MpCqCLu0Qq6m432v2Y5l5C2fhE
 BlKhi23Vu3F7vcr3MvarhsIphvnPCdh6A7Qbx2/8JbSngnZq+NsZYb4GKQw+hadb
 cDQbMQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49js9dyqxv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Oct 2025 14:54:21 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-781269a9049so10630632b3a.2
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Oct 2025 07:54:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759848860; x=1760453660;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7pFzOCBtK6ecgFU0LGwGZWUqpH1ZlyB2kreE3/tCZLM=;
 b=Rk3OJtTtb2Ucv7PZi51cq2eFhi+wsv2f1DQG2UyAh/RORQAt9I7VpzJGIMEuoHDgZA
 nXRFqO3KPfKZxk8UW56utfHPK3jN9Un6+FcNneuX/pX/YXrs0evZ0N0VwKtxDIJR7RG0
 noKS41D6HVWBrOADeXwSGtUSbZRg90VmRG8gHglBR8zKIuhDWV2rqKxOAKmQNlPhRWw5
 zRgA+9ltEtWUzJWZF12EVzpHy9oGHUNzUW+ovsbreFVoMztbSrTQYjUpYBiHF2V1m1sw
 h8DRZ7V/QkUPcwYm5mfz271IwpwSbXcNaF5SBclJR7NEowlvIKThqofGn1vXjp9A3Vnx
 1Jsw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXeXZrlCdOyFSBjCVE/JrIpGdOqwMjr/KSgJOctqqXJ5iM1KcA2yPy3N9mKJyKwN5F6uNIzpsZV3yQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxsydkYKw9l7B3ex4U0lQqZExtVPC+C44h+u6g1cMEADH8wX8qy
 ngzLP4el4qraPkODezPucXh3M7cR5r9llWDZR2Z8Ku1dabZIH2KGJ/a9nGMHG7Worpyo/dmo4NG
 yzKmaLxos3M6liU80HLjhX8tVRFPQkibA5vxIhgYvpu5Kk17IxxhPKJ1t36RUkf6o04EZwjM=
X-Gm-Gg: ASbGnctbIyzzkM6y/yOawLTcR0QZpWp/md7l4uGGMy8GgHpRZrk19Hdg/jQ5XMJaYrg
 wiY2SrCx+QYxLVSUPO1cP9mu2Vo3ba/U1XqBmAWv++AgfMhXzXM8mp5YcwA4kEJWLiUdd87/Ruz
 3XZEe3ZR+pkeJEEvdrt3500nVt1vtBnPOKiwO4Oo0RKS+2/ou4w1xbhbHOQKaXbDEKWgFUHiWUU
 pek/FBfbEu0MyuvwaZwuzqCeLlbw5D2FqUsjbsZ2cZLVm4/nsvQ5lzfXBKMLhoxv7d6rRl8aBJX
 O4BfQrFcUAYumiJPbXwJX46gJyPjyLFeFP9OuUeY5wfcCdm4t2Xd4c/BBXbLq/nc/usykuQVehy
 kqfqaeITQE1CW5OnUGCw=
X-Received: by 2002:a05:6a00:6c99:b0:78a:f784:e8cf with SMTP id
 d2e1a72fcca58-78c98cdf03bmr18407544b3a.27.1759848860361; 
 Tue, 07 Oct 2025 07:54:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHhSYJFCY2HmFmO62HSCj/gXDdC0WfxDGB9Dp2AWx7lEP+Fycqkc55xdmsqIISZWFnevOe1UA==
X-Received: by 2002:a05:6a00:6c99:b0:78a:f784:e8cf with SMTP id
 d2e1a72fcca58-78c98cdf03bmr18407511b3a.27.1759848859839; 
 Tue, 07 Oct 2025 07:54:19 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-78b0209005asm16319500b3a.81.2025.10.07.07.54.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Oct 2025 07:54:19 -0700 (PDT)
Message-ID: <6b057daf-42d3-435a-af93-8c57e31550b7@oss.qualcomm.com>
Date: Tue, 7 Oct 2025 08:54:18 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/ivpu: Return correct job error status
To: Karol Wachowski <karol.wachowski@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, maciej.falkowski@linux.intel.com, lizhi.hou@amd.com,
 Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>
References: <20251007083527.2817045-1-karol.wachowski@linux.intel.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20251007083527.2817045-1-karol.wachowski@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Hrl72kTS c=1 sm=1 tr=0 ts=68e5299d cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=QyXUC8HyAAAA:8 a=JViXSQ18S5ioEFei0h4A:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: l7LXZX1ZD1JHuNXIbkb-gfemxyfHPrLo
X-Proofpoint-ORIG-GUID: l7LXZX1ZD1JHuNXIbkb-gfemxyfHPrLo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAwNCBTYWx0ZWRfX9AXwxQeWvtuo
 EI6LlwcVWEsRizFZWPX4kE0s3+34TuX+MdhisRKzlVnZSodS+HWjFKoU5ZHMNvuqeB5vb9WNbo+
 MWBe9uulWGDoehIUXK1o01B0MEN8P00uJNvr2AcP0ZiuXckjA4fLNqX6k7+fQ4/qrzPwefTO9oL
 3VX3736GMxItGYCAYrAwD9q7shyPNuAOYTgyuNNwqDslffvBsv2M3JN4XgB5fKOlZEQehulapbg
 wMIeKlG/oLMWomQvGMIQWvI6a4bBsgmA20he3xaZ0y6pQBxNl/14R0VJ7xY+QCuqjA8eZnhoPO6
 kYS56HZGSFtGFeQRLNJY3uIX2tfV392WGoYqd5sdg0uNd3jLMEBl4dtXvNnK2wjPfKiLhTtvTKZ
 PJ34saPKTQcw6gdWQo2BuHmC/wOIfg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-07_01,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040004
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

On 10/7/2025 2:35 AM, Karol Wachowski wrote:
> From: Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>
> 
> The driver was returning ABORTED for all error that trigger engine reset.

"is returning" right? The driver currently does this (without this patch)?

Is this a bad thing? Should the driver do something different? I feel 
like there should be more explanation here.

> Refactor ivpu_job_signal_and_destroy() by extracting engine error
> handling logic into a new function ivpu_job_handle_engine_error().
> This simplifies engine error handling logic by removing necessity of
> calling ivpu_job_singal_and_destroy() multiple times by a single job
> changing it's behavior based on job status.
> 
> Signed-off-by: Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>
> Signed-off-by: Karol Wachowski <karol.wachowski@linux.intel.com>
