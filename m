Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E084ABBCCA
	for <lists+dri-devel@lfdr.de>; Mon, 19 May 2025 13:41:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2908410E22F;
	Mon, 19 May 2025 11:41:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="KWUxnsF0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3867710E241
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 11:41:20 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J9Zws1010511
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 11:41:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 8NH6zss8ksLhBIkZZCpgHGxMvB4Tdn63he1bkhLEuAY=; b=KWUxnsF0NXlqW5n9
 LwwPJB0GKGHbjrHLcyNVlO+rfxncJCyr6RKTbmOWZNqYWGMUsicR25DR2kjrTIlH
 N6dBo9g0GcI03d9NVR5NH/pBtucXr+DEvlBqW7YZoaWBOIza9/UZE7VqmQkq3U2W
 NlNJOlnDnrbKDSU92vQNkWl7gcd1hOxSzNSIGca8ZdGM89QHcdY9+4bn7sccxjtz
 BmoO2ni1NjHi0Nn2Sy5ezwFLUEenH8zV2PEUhZmd1THCjRfzHTM051eliZUgK0+d
 ERNR9ZOQp7CtcscRzBDA7JTP9YlMchOjWiLckCxvGe/8ahyobXJhq/D8tWF/u/uT
 z3oUtw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjkyma51-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 11:41:19 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-6f8ae3c3d80so72861976d6.2
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 04:41:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747654878; x=1748259678;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8NH6zss8ksLhBIkZZCpgHGxMvB4Tdn63he1bkhLEuAY=;
 b=l6guwWrUgnQE22QJrQIwdVCijqr1XcYzDQEpTGy/Gpecjk2Bl0X7qhllePGIdv+c5S
 DQEvvqqIbSLrsuZHBQWjcej27rCrU1qqSHCEM5pciwZIlkL0Lp4dHEdPhRRo9/N87GdQ
 wBEt8tts1NHD9rdazzI1T4NEWfmMJwo2X0N5Qol5fOjR2Vbgg6zrv2uLdovd3wBD58ha
 wLP2cye3tHuoagMkoBTPpMUjjYmtk+/ek5lVXVTEoHoU7a2bO5/IYlVZ6Negsxv9n18A
 pGCNtk4UDZ8Ny5hlK6eLY68rALmDCyLqxPwMmI9QxBxD+KoWlRMO+1h5xJeHp2leJPEh
 LabA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU6mb7ZZFbTK/ejXG+7iO7PmlUI3dvKTR4Txsftoy0gh7/JXWgXWQ1cG+e7M0JDsuzTzN4Y9d6EkAc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwSwMHHoicICgKxi7qrPJ8eKb6TXbyYl2CfB1G4K2sBxdy8YVnO
 /Q/0cNmn6eP5T082mqr8/qV7lah35lYuxBmpciX8T2G1GKhzS3bCWlUesm03kIVzTMQ4eMKxvFV
 XW6/zCUj5qEETeQpS89/2LCYl1EpJcJZsV4UfjIr1M7OhJTHN0kclpHhYCmOtbAb8U4MZ+lk=
X-Gm-Gg: ASbGnctw7AbUdmwRq5D+ZB8jJHixvhvtkAL20rb7QbkniXp7iKXra0o607arIkn2EMv
 yvDxHqIjN67lWmWeq+P2ZIwD11FI/GHwxj2D5I2lU423iMjO4mtyenx+hHYHQAekH01sYht7sHb
 UVGHumBRifdnQ6DZvGOD+sZ8DyXLsP+N+llr0kusqwTVH7pz/+fBmdOph+zAbbOp4UawYQufkbL
 9OMk1Ad2E8V1garVPa1UeZ+tNrSGzC8aouReDiV33qp9G/htCNVyFXOdPXMi66mkUfqX1UJMHgf
 IW7A0vQUQT9y5ZWgWfzwWCHe/fV7culTXi7org==
X-Received: by 2002:a05:6214:1c4f:b0:6f8:c23c:525c with SMTP id
 6a1803df08f44-6f8c23c8530mr167707326d6.7.1747654878351; 
 Mon, 19 May 2025 04:41:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGKetVEUOMOD7ijejFtThdTa2+lxn4IofykDpJ3wdGmzgV7qd681WbcnWRt9DJzKQiimfHKLQ==
X-Received: by 2002:a05:6214:1c4f:b0:6f8:c23c:525c with SMTP id
 6a1803df08f44-6f8c23c8530mr167706806d6.7.1747654877764; 
 Mon, 19 May 2025 04:41:17 -0700 (PDT)
Received: from [192.168.68.115] ([5.133.47.210])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-442ffaa75cfsm73888675e9.1.2025.05.19.04.41.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 May 2025 04:41:17 -0700 (PDT)
Message-ID: <a277c632-1701-49d8-a7e0-80d28afd3a2d@oss.qualcomm.com>
Date: Mon, 19 May 2025 12:41:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/5] misc: fastrpc: Fix initial memory allocation for
 Audio PD memory pool
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
 linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
 dri-devel@lists.freedesktop.org, arnd@arndb.de, stable@kernel.org
References: <20250513042825.2147985-1-ekansh.gupta@oss.qualcomm.com>
 <20250513042825.2147985-4-ekansh.gupta@oss.qualcomm.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20250513042825.2147985-4-ekansh.gupta@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ocJleBD3W5OLv0nwQhMEvDOj2uPK9HRQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDExMCBTYWx0ZWRfX32/4sivI3yyq
 2zcyFIpg03xb/v+ooJw8BXv39w/KJIfYVEI7jJe051nagaLJb6HBuTN/1NC8YXhcKt4A+93UdTM
 qqPQogWDPnxFVCYYDGE40I0HXk4rKTVfZNfBTSjZU+KPZBJCIKJrZUfv/4oOsBc+L5RAMncG8ys
 81E7ond+qW2Bm8x13iDFZ8RkphE4ri9dLCl5nsLOz7KHMvRm9lyWcGeEPg4S85rKQcd3CS+kyFY
 9frGQ/T9UeQRurS6gayCLqCka8A+uRWmwDe6YYfCJ3iQQ2dTm8AZxfYe6pQ//RUZhSxlwU+sYQ/
 p/jBP2woHA/V/yypsYbWvluQAyGZzcTYOAu2ccYpeu1HLwjzaoEicYUPmPOa8upasEniG1ADs/f
 thN+Mde1kJVLqutgwn86eKjoP6rOX9CngfmJDJ3MlrTu75NsclWcAo4pFmEEmsia95958N5J
X-Authority-Analysis: v=2.4 cv=H8Pbw/Yi c=1 sm=1 tr=0 ts=682b18df cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=uVJRloqESzKIWsLaVeAA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: ocJleBD3W5OLv0nwQhMEvDOj2uPK9HRQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_05,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 mlxlogscore=999 adultscore=0
 phishscore=0 mlxscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 impostorscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505190110
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

On 5/13/25 05:28, Ekansh Gupta wrote:
> The initially allocated memory is not properly included in the pool,
> leading to potential issues with memory management. Set the number
> of pages to one to ensure that the initially allocated memory is
> correctly added to the Audio PD memory pool.
> 
> Fixes: 0871561055e66 ("misc: fastrpc: Add support for audiopd")
> Cc: stable@kernel.org
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> ---
>  drivers/misc/fastrpc.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index d4e38b5e5e6c..b629e24f00bc 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -1311,6 +1311,9 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
>  		goto err;
>  	}
>  
> +	inbuf.client_id = fl->client_id;
> +	inbuf.namelen = init.namelen;

inbuf is not used till the invoke call, why are we moving these two
lines here?

> +	inbuf.pageslen = 0;



>  	if (!fl->cctx->audio_init_mem) {
>  		err = fastrpc_remote_heap_alloc(fl, fl->sctx->dev, init.memlen,
>  						&buf);
> @@ -1335,12 +1338,10 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
>  			list_add_tail(&buf->node, &fl->cctx->rhmaps);
>  			spin_unlock_irqrestore(&fl->cctx->lock, flags);
>  			fl->cctx->audio_init_mem = true;
> +			inbuf.pageslen = 1;
>  		}
>  	}
>  
> -	inbuf.client_id = fl->client_id;
> -	inbuf.namelen = init.namelen;
> -	inbuf.pageslen = 0;
>  	fl->pd = USER_PD;
>  
>  	args[0].ptr = (u64)(uintptr_t)&inbuf;

