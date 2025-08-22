Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A92DB32415
	for <lists+dri-devel@lfdr.de>; Fri, 22 Aug 2025 23:22:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA39610EBC9;
	Fri, 22 Aug 2025 21:22:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="gQS8Om7v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23FB110EBC8
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Aug 2025 21:22:34 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57MHUxwD030563
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Aug 2025 21:22:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 y04A3Fq2j9qagFY6krypelE5uzKnSvrs/VFzYky1PFg=; b=gQS8Om7vQtOyKzYk
 Fy41yFewp/AE82OFifGiQr6Rq+Zmao8xQeRDTu6nesE1TXyWnBUwaTp8ztldk0Zq
 rImQ6OLSJ9wzj2YrELxsUuD52qRalGZXUN/xiREzUKWV6u8PjB25m3OyML1S5mxg
 Muh8slscn3lggCPC2f7csqm2x/+hSOM4ttZmGEwsFGaVAKTvZ9/90DoMQKI4hoUB
 vfM6GPetebR5W/zyhtoN6HuMrpTiTRBa/b4tz3fEIveYq5j4xs0BmxYnMUQDuxt7
 ycv/Ok91yS8m3KrNuXIRhOHVSsja0cnbvkGEIgg0rKMa45f1j3X1EsecX5fzb2Si
 9gTNTg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48pw0yrham-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Aug 2025 21:22:33 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-76e2e62284dso4857849b3a.0
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Aug 2025 14:22:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755897753; x=1756502553;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=y04A3Fq2j9qagFY6krypelE5uzKnSvrs/VFzYky1PFg=;
 b=PubZVDihK/hXRmnzh3CzGnrXQlM4QDydjLOYXUgqyfVfXHbJ/DPS06aJqgDpH3bvyv
 zR3/GWwZq96DJn6nduwoMVENIGK9uxB5a9NT59Y0jZpWIWCWHHuq5qz54IuJJ3I4KJls
 qrVzUsGmKX5qwtBOiFOiWTV0VCmmm3c26DKLOL0/E3JXmJGl8jtofiryGCIt7hWTCsEd
 00NraH6gpy6tEgeGh8UM3j2s3cGRgaPbjtUv5uqAE4CjF0lPCEhTzZ4yoYjozqCEy4qy
 BEw5pCnxtktWVkWwNg2nU/KI+a4ZJcBaNXsBtAKT5o+Clka2gSHb2CaW5tuyZUh3tYAP
 TL2A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUwM88wEpudzu83HKUZY7GaPq173dj6aUE+/3QsX42cR5XQJts54EWyldzqAeYrdq1BrT9EPJzM8hM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxHaOT/+WB2zh03lotNltsqyBkkXskIK1XPNL5Ml/4bXeYgr0IF
 NpoKA4tqpLNUl2KEoKUUxHllxDwocZx/Oizu55NRc8RDyOlXA4cyJs3EmKZ4Nte/YQwVNhEKnv4
 ArITMkrETKI8iSEJCvMlReD7GOyTxYu2RVAbJFgR6AzNA9glnkX0sic5NVhVFXZ3EYLFg60g=
X-Gm-Gg: ASbGncszOEQjqI/TrfM1elZT8qMtSVvgvsnIpVe1HQlqKh1NAvE/9S9zMPJ5dDJwEYA
 wRGy46pGdAvy4pawZAoYZLdU+L8tfUJ3qcZfwiuAw2NrsoYXq+vV7Y7/bshHk9RW+PwZNQbgkdN
 8dz1DdOgm8uDH6txbjOHAb7qhjTI92Z54D9e83RGnWF/hDov+uqACZR3XKSYCmGvTxTrNomZGIO
 B90cGRrG/tkG96Sq83MNms3OzpdIRAzPcjVg+cGsFRJS4GliUjSNoJa2RQ2afj0dXlQKZW6T5kF
 1LjhugoUrhR1sTj3C0fweOZiOH3bDumXcyooIHxCyV3+1Oyby5EYKUwoT3jOBR8=
X-Received: by 2002:a05:6a00:2991:b0:770:374c:6c60 with SMTP id
 d2e1a72fcca58-770375bb1b7mr3749749b3a.12.1755897752700; 
 Fri, 22 Aug 2025 14:22:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHqSDDQ1Oqep4mXvYQ0f5AHY2NlHaFudfMAfAYS8IQDadWgR54tO2EW+TnIYNX89ov0/SlHQg==
X-Received: by 2002:a05:6a00:2991:b0:770:374c:6c60 with SMTP id
 d2e1a72fcca58-770375bb1b7mr3749726b3a.12.1755897752210; 
 Fri, 22 Aug 2025 14:22:32 -0700 (PDT)
Received: from [192.168.1.6] ([106.222.235.20])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-770401af16bsm767687b3a.54.2025.08.22.14.22.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Aug 2025 14:22:31 -0700 (PDT)
Message-ID: <73ba625b-604d-44e7-a73b-9f727ec46917@oss.qualcomm.com>
Date: Sat, 23 Aug 2025 02:52:26 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm: make sure to not queue up recovery more than once
To: Antonino Maniscalco <antomani103@gmail.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250821-recovery-fix-v1-1-abfc518ba0a5@gmail.com>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250821-recovery-fix-v1-1-abfc518ba0a5@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Z6bsHGRA c=1 sm=1 tr=0 ts=68a8df99 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=YJRzWv9GHcPC3W2cS631hg==:17
 a=xRKJ3yPZld0_iGqN:21 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=F5irVdaa_9mHTkytiuEA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: eY9sNrV125VDKwdIeNuYwGzS91R76aIz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIyMDE2MCBTYWx0ZWRfX4s+06hA5Dugn
 YNjwSqtnbyL3W0+gf8U1rsS6/b9gCgkVO75saeZKZMDS3a929OBAE9btGyZ88+bbTtmIpxz1Mwn
 PrmhQADvAVGI5X61nHPrqjjb9bZmwnLmzyyK+51GDXwjUQ/X4/RI3OWrbUlC+KCfq1ZrSLiO6MI
 dex5xQsvt8zrmnchW1bjBLj/cWVM5dPFdfbz8kw+85u9Zr+sDePZl/Wm/YzZw2ALurEOy7JxQyF
 r13D75A7meosJhwOv2VrxJLSDBJ8qkKQv6xoVCm3GI/tG3DxyYAe0q4YffH0SCTMD8q6MtNFz3V
 OIpwT4Xpxhj9aBJ9PZt1wyeCu6pFfk48HAB3tvTfBqEktbzsjoCdj63R9RNFZoQORY0ik93dJzl
 YZOL1e82
X-Proofpoint-ORIG-GUID: eY9sNrV125VDKwdIeNuYwGzS91R76aIz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_05,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 impostorscore=0
 suspectscore=0 phishscore=0 adultscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508220160
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

On 8/21/2025 6:36 PM, Antonino Maniscalco wrote:
> If two fault IRQs arrive in short succession recovery work will be
> queued up twice.
> 
> When recovery runs a second time it may end up killing an unrelated
> context.
> 
> Prevent this by masking off interrupts when triggering recovery.
> 
> Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>

Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>

-Akhil

> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 45dd5fd1c2bfcb0a01b71a326c7d95b0f9496d99..f8992a68df7fb77362273206859e696c1a52e02f 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -1727,6 +1727,9 @@ static void a6xx_fault_detect_irq(struct msm_gpu *gpu)
>  	/* Turn off the hangcheck timer to keep it from bothering us */
>  	timer_delete(&gpu->hangcheck_timer);
>  
> +	/* Turn off interrupts to avoid triggering recovery again */
> +	gpu_write(gpu, REG_A6XX_RBBM_INT_0_MASK, 0);
> +
>  	kthread_queue_work(gpu->worker, &gpu->recover_work);
>  }
>  
> 
> ---
> base-commit: ba0f4c4c0f9d0f90300578fc8d081f43be281a71
> change-id: 20250821-recovery-fix-350c07a92f97
> 
> Best regards,

