Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49D52B03DBD
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jul 2025 13:54:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA35810E473;
	Mon, 14 Jul 2025 11:54:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="oOuXmr1Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8127C10E473
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 11:54:17 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56EA00cH011832
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 11:54:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=hhDlRlYOa9A7BFK+SQrOUTc/
 kbhd6bQStxsgEEh3z6E=; b=oOuXmr1YZQG3vBqx4ELGnIL9QUhw4NibIF2ljHCz
 Dxyjkpt5JPwMheuwKa+VuBzdY+vR/yfC4ZaMpNm6RBxjpq5Ie0rlCzliDD8GQMrH
 6Ao3NBx29YnpRG8DZqT3qeqquMes+il3p+jwhxGuIknfvBlO97s5wIh8DTf6J4rz
 lXUnXi0yRBSYAIedN8svvxx5ZEDLJUJyErfN6ZLNWUIFLnpqYeACMO4w61Fpijm5
 mfnHtPZDdsUovD5Sh8PkbjOlhhd9vHy1xXDtlj6AeUfrGNewxAiPFKvvqBHRfXDZ
 uui5qAo8Or9l/Im/3cNTO3eITm1vDxF3CDSeUN1Z6H5efA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ufut4gv4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 11:54:16 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7d44a260e45so775026685a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 04:54:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752494055; x=1753098855;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hhDlRlYOa9A7BFK+SQrOUTc/kbhd6bQStxsgEEh3z6E=;
 b=YOmWybKXb0xJEDeLL7uA3mZXPWZIp1R5hU1vfFeFK/KsKMyirAUHAVkCj/q1GnhKJl
 mw4PIhr8/HAalbM0sdhVyRhCNmCED7Q/9/Lw/b7D3utVXYbodD7AoJzwxXcwsuOOtkzo
 4ltJwn7Dix05vb5uQ3O44SsMp6hw/phuJLmCD66LS8inTrfa/sHqTQj8m+E/kbh1a8A1
 wZqx056Q4e9Dt/rGHRIk2vt0ipTayRNQLXG5JAv9iukkiMNYQP9hiETIvSirvekzH3bR
 QeCvDRBulKHbiE9+mTS2yQI7hPfeGkAQaArQgl/KhW0/ZZEWduZkybYFjq62ThvQ2d7B
 ycrQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/VcDeaO9tVAjutSUW4zkGYRpOS8RDsFofg5Gz1j8OwvQalSNDAiC8TM4XQcA598l3OBmiQRb2RxY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwRL3NxcFyzwqPwkNSBXrJBz8v4EzjDKAazSls/aTPxCQHHvP7v
 2maxMyg5vZP4beXWmVQLVxXV4rUlCeO9fDk+huKklORXn6tqlNox2aLUBD4h7lULYtRyyzE6bov
 axykv6uGKE36ZHOZwPEycYctBDDmCdMTCtvGe9OSuVkodHVQtI7fwJdbqCm/l9Wr8/zN7w5MaVU
 86KVM=
X-Gm-Gg: ASbGncuOh0qHnLvEUsynFqtUpqVAhojQrLVi2sc2jRr5oIu5P4ll4JqTu3xrf9knYbD
 fpusQJS2S0XpO8E5l9GwWLUKs8Q7tvujiZSbGvpm9ZDLOzo1FB6/9hBtOFFNe/BFx9iwv+V5zcQ
 xVaV+SOIR4vVpsPMXebz+WM79qJaskzS+a7JzEsc7a/YE6Atvo6lx2XPvz2E67q8D8ohWIjhUkl
 5O4/e4e0eBtRn9umiI0sDzNlev2RxewfmV9IlS9rMJZuR+XcyIB8Us4gCibMY+//wlur/JHY4gP
 +rTSRjY/uBLJyRyq6MkCaEGNj2uB2q0/SjsngGe/FPtdsbtEYdaplfoZznwYD1mobPt9E+7n0Eg
 tolrQXJDBr7DIyb62cjfVnwYNgnKgOXu8aZdwmx2vcpe3DrsR2nPl
X-Received: by 2002:a05:620a:d86:b0:7d3:a7d9:1120 with SMTP id
 af79cd13be357-7dc99b9fb23mr2424124785a.24.1752494055340; 
 Mon, 14 Jul 2025 04:54:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGMqZJV+7lQmgWTt4eaASnArEGjHjj4zcLu7wtF2nr7er4jJuci6OVCbQumR6y+apIH309lGw==
X-Received: by 2002:a05:620a:d86:b0:7d3:a7d9:1120 with SMTP id
 af79cd13be357-7dc99b9fb23mr2424119485a.24.1752494054766; 
 Mon, 14 Jul 2025 04:54:14 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55943b602ffsm1897581e87.147.2025.07.14.04.54.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jul 2025 04:54:13 -0700 (PDT)
Date: Mon, 14 Jul 2025 14:54:12 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Yongxing Mou <quic_yongmou@quicinc.com>
Subject: Re: [PATCH 18/19] drm/msm/dp: Move link training to atomic_enable()
Message-ID: <cofa377vptj7on637u3c3mnxndplcmaegsb5h6idinz5wrvm6s@toylno4uapq4>
References: <20250711-hpd-refactor-v1-0-33cbac823f34@oss.qualcomm.com>
 <20250711-hpd-refactor-v1-18-33cbac823f34@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250711-hpd-refactor-v1-18-33cbac823f34@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=e7gGSbp/ c=1 sm=1 tr=0 ts=6874efe8 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=kAOSIj3XOs-WuWg9PYUA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: klK3A6tByI1UgocNJR5kv_MzppPinGmt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE0MDA2OSBTYWx0ZWRfX4wnmqK1BXDRD
 lA9xP40FSOS9bO+WSjeYWvx01C9QhlWHYlvFLwkEsvP6W2YkRsYWdeoQ3GR0moxYnChvU3UAsC5
 Xma6z4AS28jKusFb9MWW139HBc5QaFnv2ch4qwe6C5lPGY1uwN6QbdjWhSY6C4S78LLtSYoldyl
 PfQI8P5zmLbzBId32KAKdQ7NgN++64h7mzbQ/QFbrj5DHV5jWEa+PPCJdhp4FgGrxJOWgf5gxzt
 G8iLg+w00ie5u8Mywi1p73/+w+g0Idz/cJp9JHbpMW/qXZZCuVuFq4Gj9QBzVzBlB27qR95N9qG
 39QeI4R+CJ5P+EAMvUWpZxfTBSMoCFNMgNMxRXQr66D68mnNXXGN5dAqLGFv7fS6u97oa3CVuv2
 /DmLvHxUWNQIk6RIZGXmBrO4YwxkxgYj8WUOhsBJUJVyt1Xxqnubj+efeLAUHYy0C8ykzChe
X-Proofpoint-ORIG-GUID: klK3A6tByI1UgocNJR5kv_MzppPinGmt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_01,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 spamscore=0 suspectscore=0
 phishscore=0 bulkscore=0 impostorscore=0 clxscore=1015 adultscore=0
 malwarescore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507140069
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

On Fri, Jul 11, 2025 at 05:58:23PM -0700, Jessica Zhang wrote:
> Currently, the DP link training is being done during HPD. Move
> link training to atomic_enable() in accordance with the atomic_enable()
> documentation.
> 
> In addition, don't disable the link until atomic_post_disable() (as part
> of the dp_ctrl_off[_link_stream]() helpers).
> 
> Since the link training is moved to a later part of the enable sequence,
> change the bridge detect() to return true when the display is physically
> connected instead of when the link is ready.

These two parts should be patch #2 in the series.

> 
> Finally, call the plug/unplug handlers directly in hpd_notify() instead
> of queueing them in the event thread so that they aren't preempted by
> other events.
> 
> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 15 ++++++++-------
>  drivers/gpu/drm/msm/dp/dp_drm.c     |  6 +++---
>  2 files changed, 11 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 87f2750a99ca..32e1ee40c2c3 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -410,11 +410,6 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
>  	msm_dp_link_psm_config(dp->link, &dp->panel->link_info, false);
>  
>  	msm_dp_link_reset_phy_params_vx_px(dp->link);
> -	rc = msm_dp_ctrl_on_link(dp->ctrl);
> -	if (rc) {
> -		DRM_ERROR("failed to complete DP link training\n");
> -		goto end;
> -	}
>  
>  	msm_dp_add_event(dp, EV_USER_NOTIFICATION, true, 0);
>  
> @@ -1561,6 +1556,12 @@ void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
>  		force_link_train = true;
>  	}
>  
> +	rc = msm_dp_ctrl_on_link(msm_dp_display->ctrl);
> +	if (rc) {
> +		DRM_ERROR("Failed link training (rc=%d)\n", rc);
> +		dp->connector->state->link_status = DRM_LINK_STATUS_BAD;
> +	}
> +
>  	msm_dp_display_enable(msm_dp_display, force_link_train);
>  
>  	rc = msm_dp_display_post_enable(dp);
> @@ -1706,7 +1707,7 @@ void msm_dp_bridge_hpd_notify(struct drm_bridge *bridge,
>  		return;
>  
>  	if (!msm_dp_display->link_ready && status == connector_status_connected)
> -		msm_dp_add_event(dp, EV_HPD_PLUG_INT, 0, 0);
> +		msm_dp_hpd_plug_handle(dp, 0);
>  	else if (msm_dp_display->link_ready && status == connector_status_disconnected)
> -		msm_dp_add_event(dp, EV_HPD_UNPLUG_INT, 0, 0);
> +		msm_dp_hpd_unplug_handle(dp, 0);

This chunk should be separated from this patch. I'd ask to drop
EV_HPD_PLUG_INT / EV_HPD_UNPLUG_INT completely and call DRM functions
all over the place instead. You can do it in a single patch, which comes
after this one.

>  }

-- 
With best wishes
Dmitry
