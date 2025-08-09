Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53AE9B1F2D7
	for <lists+dri-devel@lfdr.de>; Sat,  9 Aug 2025 09:26:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 447A910E085;
	Sat,  9 Aug 2025 07:26:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZkUez9eV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6619A10E085
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Aug 2025 07:26:11 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5797Hpg5022945
 for <dri-devel@lists.freedesktop.org>; Sat, 9 Aug 2025 07:26:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=Fn5zSngvFk1cTroUj6eTtc01
 4LhJeakMsMKQPeY16BU=; b=ZkUez9eVPvdmJ8FupuRJ+mGBOBtBUGEamj8LZJIi
 /IoKhbx1M5RyWZbUYDUP6th5sHtllSZun5kSDEzXZkXuT/vqzcLh1HaJ4GAvhaNM
 NQV8PqwxyupYFLoqhQUJXc1xCWBQV6dSqWR8rygQm5Wkk6Mi1JMRW3T0NfnShVwn
 ufLwptxyAj+7pLKtahzzcRL3ql181u3XUV1I3y4sx3Jwb4fGWjrrXcEO4MnaZ7LB
 z4WzKhy18qdEQ6MUhzPyLXM6QNMdOi4DAdW4K7RjgY7Zp4NNNRb2MUfKRcYvadL3
 eAcT0FefR5Xu2W0jsCEkaJDrfAxcQ4Rod9Xmkctm4Kd9AA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dwngraqt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 09 Aug 2025 07:26:10 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-70749d4c689so53755416d6.1
 for <dri-devel@lists.freedesktop.org>; Sat, 09 Aug 2025 00:26:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754724369; x=1755329169;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Fn5zSngvFk1cTroUj6eTtc014LhJeakMsMKQPeY16BU=;
 b=Hm5jMdQoUNVlHLiLI9MjuHBw3nezoalXHgpEn9Y5saZ0ASpY3jc6eSqUG3q8gkec9b
 nNN3BjxeMLwC8+tMFFnfhzyNmzLb9C9rzOhlaV9fxg1XkbyxB0zZ71z8LhqIKufOx/M6
 46gEonK90WE5dT7Y2GX3g0lotq1iJ4dIGoRrgTt4+dv/RtoqpxelN2oKMcNrzlwmB25W
 MjMViL2VLjXTdxvL+PKVaG042yZbnEA0iFjEDmJ60yVW1w/E6ZFam9qWdQ9jqO8j6B/H
 AAMlLHQcqadNypeKeBAjRxO780ZR8lZY3afhirX//ZImSWGnvo4B2AXHT5CT0PL8BZEg
 6F5Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUgT0om15/Y4i9pamwsgj4C0VAyhrzkX/xJxX1qurc9KDEx7R2yiJzbJ2x2MwJ6oEw7LCjlpshiGf8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxc8pea4Y9N06hiDixn4UlLbaWqwzT7HsJWDnFbh9oa6TSBV65X
 BdxBApOduMMGv4CxXwqBL5tNQaF7T0y1MjUUX4GxLahREgxF8SSgjQ8rNOTqw10gVi/yFed0YZg
 c09JgeMKSSLmQdUYqj7+plxJgS4Yom6wwVdFFdbyW8KlrhQG7Po0pptFr00hq1b5rX1gxiTQ=
X-Gm-Gg: ASbGnctZYdGL4RvHmax+IRjMcu9rulgua40ZmjZFgrjMCBYla+abfusO0E5+QZQZhpZ
 8F0XKubEh+0DlVrDoEMRVr2qJmamZCv7hb9Vs4/2tWKHdvLgpP9jZ8qZCPeE/nBJ1fDhOESThYQ
 Oip+BBouLsAIOjfN4ZvC64vyJ3Pq9D9vN5RWGaDCqHL9ChetS/MhbojdUyrEEpKns7FimraH17H
 vjOxzuQPbJYF2ByhGLUpB0VVgydo4qU5yoHFwo61sSBf5/ld75Qx+3FJDoH9/8Ku/kH7HXTC/MJ
 LkwWD3QIFfK8JQ2AQLWpCCMenx+v25CLmkaRlT/STHQGfZ4DBfJRJbfgAv2LT2yGarc+RjTgHLa
 jwhKIZEVHiQXj5UBZiZGEC5B2eo8pShdt0TFwHUvNTP8R9DaFPthP
X-Received: by 2002:a05:6214:3307:b0:709:b6d0:946e with SMTP id
 6a1803df08f44-709b6d09645mr1636236d6.27.1754724369574; 
 Sat, 09 Aug 2025 00:26:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGm3MfVvK4EIf4H1uoz2bYlt0vMPAaOJ10CZbYEnFJEmJp/EYCEmQWeipcOqLyUae5jc+e59A==
X-Received: by 2002:a05:6214:3307:b0:709:b6d0:946e with SMTP id
 6a1803df08f44-709b6d09645mr1636046d6.27.1754724369092; 
 Sat, 09 Aug 2025 00:26:09 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-332382a9273sm32441521fa.24.2025.08.09.00.26.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Aug 2025 00:26:08 -0700 (PDT)
Date: Sat, 9 Aug 2025 10:26:06 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Yongxing Mou <quic_yongmou@quicinc.com>
Subject: Re: [PATCH v2 11/12] drm/msm/dp: drop the entire HPD state machine
Message-ID: <7vgdlv3kqttwav3ckqlb6xul6o3dpob5iokyqtdvnk3vvfbx4x@kg2gajwovdzi>
References: <20250808-hpd-refactor-v2-0-7f4e1e741aa3@oss.qualcomm.com>
 <20250808-hpd-refactor-v2-11-7f4e1e741aa3@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250808-hpd-refactor-v2-11-7f4e1e741aa3@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: vEAwSxFptaGCcVdkwf9sMvjoq1yhd_fO
X-Authority-Analysis: v=2.4 cv=RunFLDmK c=1 sm=1 tr=0 ts=6896f812 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=K4FjR5uwuDtgQbbanG4A:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: vEAwSxFptaGCcVdkwf9sMvjoq1yhd_fO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAxOCBTYWx0ZWRfXxMIjKlSWC1sm
 KwIDscbeLuxog+ocDFPzv9jUuw1lV5+qO5czZi2Kd6B1rLlj6qwCrGRGzRd8eB+NL2UP3PONWUO
 Ak5iUcKwackQtWDmM6WtCCI8ufDj7oBV4foqCRx1e2qlskSQ55Mo+fXBbVht9V65Ud+d42lXwEi
 +51FNQWh1Q/dbTJvrckwJg9MOhzpG5FW2aVFrU9ugcFPPVPrrCaSDgZmJq9MZwsNEyX4GDw6UX6
 SN60t3IBV/6FWe/2t7vlQUJkMtfCqR6yjlejq1APtWukohguQiR+fOwRmLOurDmh8bXRV7yMuUz
 qvbKqS/FdufX/rsNzrb47GAP6ZigbZBnyZf2y46OsTk23FnWq8NDPlTE1VuAPrto3Wb9iwIJXAO
 yUmz9/lK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-09_02,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 impostorscore=0 spamscore=0 bulkscore=0
 phishscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508090018
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

On Fri, Aug 08, 2025 at 05:35:23PM -0700, Jessica Zhang wrote:
> Since internal HPD IRQ event handling has been moved to being handled by
> the DRM framework detect() and hpd_notify() callbacks, there is no need
> for the MSM driver to track the HPD state separately.
> 
> Drop all references to the HPD state machine and replace existing checks
> with checks for link_ready or sink_count.

After this patch there should no more difference between 'internal_hpd'
and 'external_hpd' cases. However, the code still tries to make the
difference for some reason. There are several places where the driver
calls msm_dp_display_send_hpd_notification(), e.g.
msm_dp_hpd_unplug_handle(), msm_dp_display_process_hpd_high(), etc.
These functions are called from msm_dp_bridge_hpd_notify(), which means
that we can end up with the lock ups because of the event loops.

> 
> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c    |  22 ------
>  drivers/gpu/drm/msm/dp/dp_ctrl.h    |   1 -
>  drivers/gpu/drm/msm/dp/dp_display.c | 148 +++++++++---------------------------
>  3 files changed, 34 insertions(+), 137 deletions(-)
> 

-- 
With best wishes
Dmitry
