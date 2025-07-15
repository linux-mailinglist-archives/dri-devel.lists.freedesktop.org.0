Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24B5AB069FC
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jul 2025 01:40:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D5E410E72E;
	Tue, 15 Jul 2025 23:40:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ke/TAz21";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0C0210E72E
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jul 2025 23:40:49 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56FGDEDc007291
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jul 2025 23:40:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 U74p2NgokusBYICtX+RuOyJ/0ZE3xSV0oX91XuR8eNw=; b=ke/TAz21O+HjjcTw
 SlaGcYjyLsajIpFyU7Kq9fVWzI3pBXIM6yDYkXoxirJwGLy7GDuH8qe2gnv36SLj
 bYX/XvAqfgI+fFsaoZYzEZKMc/RWLn3Y3c8TywRYqs0gj/YU1o+i0dP/fwn7TmCT
 +ZTsAmrJXfPnC/r3o2GgR0c2TgEh8fY9r9A4pcrpE1K/SKhwLBC0UUYb4Ke8Rg9v
 EDLGheYUGiKpQr5+csF761XIFOPc8FKjuYp6QksIhTSRHy9kpdtjfXJ7Q0VBg9Uo
 8wn4Qv/GuhdrigYlzJDhJMsOisF0/lBB64aMTbhakpLFjeIq7gBCXdrNbWbwXjy2
 zf82xA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47wnh5t330-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jul 2025 23:40:49 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-3132c8437ffso9864122a91.1
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jul 2025 16:40:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752622848; x=1753227648;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=U74p2NgokusBYICtX+RuOyJ/0ZE3xSV0oX91XuR8eNw=;
 b=EcOZ1LkTWNwkaOgvao/X9EjJPQ1C7qd2cZlKT7brUvFZMhdg3a3xzFXmM4FTc0UhEr
 r5iSmETN0avn9JCf1cq5mKB5AlyyDlTWbAXlv5DfWy7cxgezQL00hCd62JhRGMGpB1/w
 uMeGphQG1xXlenBuLGC61TvEGO3GmdBe8dQTuVPy+hSr+DpFaV0K2BCgOp8Uf40fRHWD
 BlMmIde4j/21034nVe14hVAUVFma4TU7T6Jcu71YL7vK36Ioj43SBNKJdb5GWescj2LU
 HOqIZZ3qvBKXx0wMoREprz6OR3Rvr30xvBJAgAd71qPWRoNMhQvBu1367oyd1wWPOBV8
 jIVg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVvWFkR0EwPuFYoyR0PQOS1Q3RJP7TGwF/pX9i6hR9CMZeLvPEGxsr3KnqzvDS9LPGcxEYeOu0yND4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxAmw/o2WGqS8z316vwXY7bLqAh90C19J8FWcKl243seKt37XA5
 UpwBmIoJC9HMXzW2JIyWAvp1n4EP7MbLyW2qegfpiKVuJHYqF8lXip71Bt7jCytFrcnJaSFMxH9
 fXBQpz4WB9jrJIve8ZmaakYXW8wifJ7vSFMNQaEiP1zDIwkqlezYa7h1dDc0XUDBo0qKU3Go=
X-Gm-Gg: ASbGncud/HJn5xZh7RWa13mQ9lBhbddhhTR2lG0EfhtAHNELRPD7lB2XRmYLTv7IbGZ
 Er7/rGQwEtNqHWHA4qqzt1Z3/iiocsmsqUaIH1aEhFS6J3dr23zHjfotXI/YDDrmxUryRbIo6h3
 oAyY8xxs8FZ3lSFI52Blx+ZvyAD3d/wXChfKa8fM+Rd8nzywogVvXBrRc2UROvPOWjNN1K/2gNW
 tU3h4tIQNfGiCzkNslxUxFLw3sHa2utAiflAopM2x3vvvKCbzmpVxbuEd7CXfh4ttLmPEusQx9g
 srH2To7NTxTSTQAOBiUcyBV5s6s9VTFE8EGzp26iVQie+EoNDIClhk2dwzeQBoPRUOWi9DhFa8M
 rfXGCWEliiO8FRDdfZRwfJA==
X-Received: by 2002:a17:90b:4f47:b0:2ff:6167:e92d with SMTP id
 98e67ed59e1d1-31c9f489b00mr504218a91.32.1752622848221; 
 Tue, 15 Jul 2025 16:40:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHTTJbpQZuVeL9T10AqTmZygZig9Img276JHEdkFxvJJ/A1KoaAeYTrUG70jqOz6RxoHxwmBA==
X-Received: by 2002:a17:90b:4f47:b0:2ff:6167:e92d with SMTP id
 98e67ed59e1d1-31c9f489b00mr504193a91.32.1752622847720; 
 Tue, 15 Jul 2025 16:40:47 -0700 (PDT)
Received: from [10.134.71.99] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b3bbe6c5660sm12492300a12.48.2025.07.15.16.40.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Jul 2025 16:40:47 -0700 (PDT)
Message-ID: <5ff344a4-cbc5-45a6-9258-9d51c73c24e0@oss.qualcomm.com>
Date: Tue, 15 Jul 2025 16:40:44 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/dpu: correct dpu_plane_virtual_atomic_check()
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel test robot <lkp@intel.com>
References: <20250715-msm-fix-virt-atomic-check-v1-1-9bab02c9f952@oss.qualcomm.com>
Content-Language: en-US
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
In-Reply-To: <20250715-msm-fix-virt-atomic-check-v1-1-9bab02c9f952@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=dKimmPZb c=1 sm=1 tr=0 ts=6876e701 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8
 a=EUspDBNiAAAA:8 a=kWyCMJcj1dDTDgwf64UA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: 0VoREq3_zJg77LGjUzgiD_9Y0f8xP29V
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDIxOSBTYWx0ZWRfX/sBTeR49MPww
 x8xcDGDQFYimJ4y6vWQC9sX8dD87rqOyhDESYOYdkVeTEyrm1cCHR5llKLlSjoYTWvcpKDqbp8W
 OVyZ+ABcKV+RVVjWh7+XNLFzyizpafabgCd7fVkMQDzviNDlFbIqlirhLKZyaVPWaYuZ+GTQttN
 Hs9B1M3/L2VAUFgP7cdmdpqNaSz3Ab6dH9qwsz9BTN2vWGbNe8nVBLipgdl1/m/RaMbh0I3vbSK
 ltBamAyEWq4SFz/ldywV73uotTWgIMQOXnh9xy0Aqvvcg9FqcBkG2l5bX2PoBB2Y1IgqEH/KPbX
 cKx5B9f83fo1SjR72UuGenmXuCc88xCHcl8pa1h7WQq6pY8DmdqxoyFrdUPm7X1woJik5uVxr0R
 ciaTh3yQRq1al+VsU7ooytjagpxYrmWotAPmJiMbs2nr3XZ+iNnLMPM7HzWE85kzfs1x1Mjx
X-Proofpoint-ORIG-GUID: 0VoREq3_zJg77LGjUzgiD_9Y0f8xP29V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-15_05,2025-07-15_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 mlxlogscore=920 mlxscore=0 spamscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507150219
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



On 7/15/2025 10:28 AM, Dmitry Baryshkov wrote:
> Fix c&p error in dpu_plane_virtual_atomic_check(), compare CRTC width
> too, in addition to CRTC height.
> 
> Fixes: 8c62a31607f6 ("drm/msm/dpu: allow using two SSPP blocks for a single plane")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202507150432.U0cALR6W-lkp@intel.com/
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>

> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index 01171c535a27c8983aab6450d6f7a4316ae9c4ee..c722f54e71b03b78f3de82fec4f2d291d95bbba3 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -1162,7 +1162,7 @@ static int dpu_plane_virtual_atomic_check(struct drm_plane *plane,
>   	if (!old_plane_state || !old_plane_state->fb ||
>   	    old_plane_state->src_w != plane_state->src_w ||
>   	    old_plane_state->src_h != plane_state->src_h ||
> -	    old_plane_state->src_w != plane_state->src_w ||
> +	    old_plane_state->crtc_w != plane_state->crtc_w ||
>   	    old_plane_state->crtc_h != plane_state->crtc_h ||
>   	    msm_framebuffer_format(old_plane_state->fb) !=
>   	    msm_framebuffer_format(plane_state->fb))
> 
> ---
> base-commit: 8290d37ad2b087bbcfe65fa5bcaf260e184b250a
> change-id: 20250715-msm-fix-virt-atomic-check-ae38fcfd9e08
> 
> Best regards,

