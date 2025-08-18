Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BDFCB2A123
	for <lists+dri-devel@lfdr.de>; Mon, 18 Aug 2025 14:10:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC36710E1E1;
	Mon, 18 Aug 2025 12:10:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="CRbbCsbo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03A4210E431
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Aug 2025 12:10:49 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57I8LTRX022741
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Aug 2025 12:10:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 hkCumoRo2vdkK1vJUdNAG8+5dWwDOOe6LmYrb1+L328=; b=CRbbCsboCmEeSV5G
 He/9QKkQkSmpqBbjylTHOsOuzhgOf2ZhdMWXnzJfyK0gPTKGdEiKKsTzy0fg7u19
 EByc/RZlQ4mD+wRAmk7W90I5z3hSLiS/Pi0/aB54nJLnE0jtuzkfP54FVMJQKB0L
 cU7oU/ydbX9pbuGUsGNDh9ExK4dqWRDWUTanvWQLQHKzDU297sSq/kyGCldhQBda
 UwOSozM4LuL+lz6hT55a5NYtIwLq9wGCYv5z3XaEUDeqIaGBCt64A1NclTy4zx/U
 a+QHWW069SO57XSNorziTvrd9Lx3aY/TcT/hB4CsV+fl3aPJji/sZXS/coxL0K1r
 P8bdQA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jgxtcrs5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Aug 2025 12:10:49 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-2445812598bso111251875ad.2
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Aug 2025 05:10:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755519048; x=1756123848;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hkCumoRo2vdkK1vJUdNAG8+5dWwDOOe6LmYrb1+L328=;
 b=ic6tvd0BZGD+fGRBYkzw+NkZswkV6w2Se9FlWdDkR4Xid7p/umOsXCrv26yqMd4S1s
 sDtM3ZXpa7nV+avmGlSCciaPJDg6AuFU4CMItcYDK1bCVZqcQO1BaZ85acUNIYNrdzr+
 vIuNCrUZiUwK4WSZaJzBE7BSsRh/hQyzudEY0UAbesJu5dNCOpl/NRQ7i+NYbOwOMuwT
 vB/wlV+6sMshv7ac70Z4c7FW0+1PLfQh1p1NGiNBBNodsKOc34mJxTpU3t8mkHU0AeDI
 cb1uynOd3SKlbAtuOP9NdjQllUCbWutBzRY9IgOWLZQvgKA4N/YSLfd5l47iaJA6ruS8
 a8aw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX6x7TbKFfogUCB0g9iQ2aEV0Qh/amXnaI854zJ4n50R9XgrKu5goAAGTkZuJw2J+J93pd5O1yX5PI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz9SFb/XfheWEjHn9Z+ctn0Pjp4XQ0n4pjUiZgr7+iuiUC5Bql4
 hRjAnM80/MUJHqKbdf50MOaErce1cvi4kU37eCphxkKU2wjxUfxgjqo4cVGdqyEZvcz1YyRS5hJ
 f5mR35Qt6vFzG8QB7FkMGvrkj0Cr93hB3DKVpXWeFcH8q7R88IBmecZ07/MpIRS/ZChBMveaeAq
 npL4M=
X-Gm-Gg: ASbGncsm6eqDzjuO6R8Y44/OwknZs57CcriwkMku8u1Dxu7dAA2Hbj/+FUbKxRkDZfA
 5IVjh7KQPv+klUXZA/5IBholUT+5ViuNmJSodilSURlxdRe8IZQSmSaIHpKv1opahiihx3MVxtv
 QS9l7Wlo+IWGdcaBMRb1Wp8oO1I97VSWAP8RBRrTgQt+jzAY3V9q5aQ7yrR8QqgiHfaWbY/RmUh
 qvxkBcahsIJaQ6o9XLEVy7Mmo9+5FAo9GhaeykSCWdeenWTZkBwavnzinJ5rH6wyfcVkHfBzK01
 KHnxs+FlunPD7VMwrLVdx4s03OszhPYuY9ebEy5onrIHPOH/n0dqin6ZSE26lLEv
X-Received: by 2002:a17:902:d4c6:b0:244:5cde:d384 with SMTP id
 d9443c01a7336-2446d85f7demr181641555ad.31.1755519048386; 
 Mon, 18 Aug 2025 05:10:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFZONzJWFtT1XNEyRK6xcm4gebbokS24vhl3Ky3z4naJfpk4imCqD/UHpgAJi8OHvE0+TLUjg==
X-Received: by 2002:a17:902:d4c6:b0:244:5cde:d384 with SMTP id
 d9443c01a7336-2446d85f7demr181641135ad.31.1755519047954; 
 Mon, 18 Aug 2025 05:10:47 -0700 (PDT)
Received: from [192.168.1.4] ([106.222.229.157])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2446c2f441asm79279165ad.0.2025.08.18.05.10.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Aug 2025 05:10:47 -0700 (PDT)
Message-ID: <272d2a39-19ce-4ac5-b3c6-3e3d6d9985c5@oss.qualcomm.com>
Date: Mon, 18 Aug 2025 17:40:42 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm: skip re-emitting IBs for unusable VMs
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
References: <20250813-unusable_fix_b4-v1-1-3218d166b8a8@gmail.com>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250813-unusable_fix_b4-v1-1-3218d166b8a8@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 4jLJZoV4rE7RUGmuAknuf57IgACVudeW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAyMCBTYWx0ZWRfXzGEh0m8qQfCr
 djVD0nmr1geXv0BDuVbRyK/ZsY7HdLinsN7O/qcbLvcgQ6a4DpeCcmByj8PuandNF28i28Do4ia
 FjT4v4aLbBrBHrRmprxORJFZk/vvtcDpQ6DcUXXTxtoFVbAVqadGqi5si5g1w500xO/jMbfmxOC
 TkKwTdZArkvDKEnsAUDqo6TcUObwUWPHXh8X1yXlgh8KANg8PVkocHowkbsvTE63kQCqANWqMjz
 XpKmun5b38/4TkvN3omDC4d7bDh7GSnMc/AOqKsxyaW2TEccVyXWfRvZuSka7DjgY9l01KT3VXV
 HpYKSRtufc6jRayPzIKJVD+5eNoSicYLfNyyfPYp4FcMIdTEATXfBUfFhCrCs1SCFe0BWi772HC
 cvM3J1Km
X-Proofpoint-GUID: 4jLJZoV4rE7RUGmuAknuf57IgACVudeW
X-Authority-Analysis: v=2.4 cv=V7B90fni c=1 sm=1 tr=0 ts=68a31849 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=9Q8gPALlkHEzzDxkdHlyxw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=pGLkceISAAAA:8 a=b798ue3nI8IKDaXQGNYA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-18_05,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 adultscore=0 clxscore=1015
 suspectscore=0 impostorscore=0 bulkscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508160020
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

On 8/13/2025 6:34 PM, Antonino Maniscalco wrote:
> When a VM is marked as an usuable we disallow new submissions from it,
> however submissions that where already scheduled on the ring would still
> be re-sent.
> 
> Since this can lead to further hangs, avoid emitting the actual IBs.
> 
> Fixes: 6a4d287a1ae6 ("drm/msm: Mark VM as unusable on GPU hangs")
> Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
> ---
>  drivers/gpu/drm/msm/msm_gpu.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
> index c317b25a8162edba0d594f61427eac4440871b73..e6cd85c810bd2314c8bba53644a622464713b7f2 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.c
> +++ b/drivers/gpu/drm/msm/msm_gpu.c
> @@ -553,8 +553,15 @@ static void recover_worker(struct kthread_work *work)
>  			unsigned long flags;
>  
>  			spin_lock_irqsave(&ring->submit_lock, flags);
> -			list_for_each_entry(submit, &ring->submits, node)
> +			list_for_each_entry(submit, &ring->submits, node) {
> +				/*
> +				 * If the submit uses an unusable vm make sure
> +				 * we don't actually run it
> +				 */
> +				if (to_msm_vm(submit->vm)->unusable)
> +					submit->nr_cmds = 0;

Just curious, why not just retire this submit here?

-Akhil

>  				gpu->funcs->submit(gpu, submit);
> +			}
>  			spin_unlock_irqrestore(&ring->submit_lock, flags);
>  		}
>  	}
> 
> ---
> base-commit: 8290d37ad2b087bbcfe65fa5bcaf260e184b250a
> change-id: 20250813-unusable_fix_b4-10bde6f3b756
> 
> Best regards,

