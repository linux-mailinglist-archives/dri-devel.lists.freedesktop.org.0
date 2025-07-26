Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BD49B12A7D
	for <lists+dri-devel@lfdr.de>; Sat, 26 Jul 2025 14:34:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75D7C10E475;
	Sat, 26 Jul 2025 12:33:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="LYGuj1XW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 261B010E473
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Jul 2025 12:33:58 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56QC06t5026298
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Jul 2025 12:33:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=w8cRMM89BCO/d2ibKR5H0J+K
 hadOlFl5UBCobrDClss=; b=LYGuj1XWNn7PAy9gSM1fBsaSEAPLeC2rogQ5BrHE
 eicGP9AbExnTrHUhfNgTokQKqGz0ai1rIOC4gyPHIaEiNegmsENPncV73LaQKflJ
 WglWPqSCffp9+9rnt1uYIOsTyvLu7MM9VjjkuLBvGqmm9W9cLq/AYSxgKPcZpCUE
 meIIftXcjeXQNlucaQEZBbUUG0OEzZ3tvYbiW398x5Pw7pfUxvGuf9Sf3EcgoOyY
 yjSdX4K8a5TI7cAgqThweKSte21+isdIhf3Mc7hCpkwv/S9o8X72k3uQyMpWzsNT
 mq++n8WO1qrfemRzqMUl4i4ltYez/XDnYG7+2L7e5EWzAA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484p1a8p3a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Jul 2025 12:33:57 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-707053d60c4so83933476d6.3
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Jul 2025 05:33:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753533236; x=1754138036;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=w8cRMM89BCO/d2ibKR5H0J+KhadOlFl5UBCobrDClss=;
 b=vr9uoRSEfVkEZucFLU0kKRWu7NwSmAXKF4/TjqAHEhZi15BqfCm/9PMnw6DCEhwfKU
 730sJU4g7EHdHxN1rLVtl14mhXRUnjFVnmIk+S9bK3rbRMg+5VujyD1trIRXcZnJk8W+
 1Mdiu2suyLBpvtGtYSiDRCY3mDHE7MRleqAjrPyqKPg66LdZquI7spmzW+wdxizGrBdW
 vxP7v0xtwesAWSxu7Wi1mXdqEDej983Gw/jVTfSSdkzKPCGcSBXpbi30lh5YiOlMS10L
 JI4dcNo+EFpzmcJf1dA8XBilOh7Y3bNyUTxpMXONjBGYcUVhslKcZnj+tL8MOlYRdjq/
 WerA==
X-Gm-Message-State: AOJu0Yy7jJ2q14JZAFlOGuiNvaMuqHZ+KkuoFxH66Y+v0CO0jI1OwZse
 UPb2fTB35MHCDBQTQzwLzweL9uLO/h8G8O4a0IWNlAhTSZ9awnqwfVqWMXB6vc/NQx2Ft/rbgRM
 mW814VR2VtMUXO/sEZcn3Xye5HPLBtWW8BO1eMbIGS2ZlD1JSZwHoGsB9jqbp7ej1/vsgAuQkrt
 ccn70=
X-Gm-Gg: ASbGncs0k0pHe89pxupTh4m1oqxIpkAp5WOEiJKZseoNRh28C3g9JbP2DuoCc6O8ZUm
 ECSZ8LIAte4Cld6RHTImbRVpm7nrlDVqy0scXPTjFHjvITdoU9n3oV+hJNfBQVrTbVFsRf2xcEj
 XyGGHNXFSjEX/WbT5fE4K7wWmWCFiIutR4TdF495MPDYgcxELqksQ8IPzxyLBSjlsIpggtpnNoZ
 FOKaSNVURNq3vEUITSRqgS/rbHmVDwwzlWi1JtGpRQGjLQx3/D0HAq5W0mlpSwvoGqyH31hOq2A
 n41JJrALwLA9WuA9JfBbO4/bQYsVD2CVixQS7hQaiPCxbEZty0kN0X+oOiLfeESaIoAZptteRcU
 GAq0rSDa0hB30C1/rhNjP8xxllsH6G8V3kho2+E+MfLbUgITjoMsn
X-Received: by 2002:a05:6214:2622:b0:704:7c55:4ff3 with SMTP id
 6a1803df08f44-7072049f1admr69563816d6.4.1753533236023; 
 Sat, 26 Jul 2025 05:33:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGYL+i20wvik2k8ybZcLSjUO54dD2ixoLhw+HaO6iD4q20/2WO93wX4OnjSp+gZ9Ik7pPwU+w==
X-Received: by 2002:a05:6214:2622:b0:704:7c55:4ff3 with SMTP id
 6a1803df08f44-7072049f1admr69563546d6.4.1753533235548; 
 Sat, 26 Jul 2025 05:33:55 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55b6316d6cbsm427270e87.29.2025.07.26.05.33.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Jul 2025 05:33:53 -0700 (PDT)
Date: Sat, 26 Jul 2025 15:33:51 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Suraj Kandpal <suraj.kandpal@intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, ankit.k.nautiyal@intel.com,
 arun.r.murthy@intel.com, uma.shankar@intel.com
Subject: Re: [PATCH 03/28] drm/writeback: Define function to get
 drm_connector from writeback
Message-ID: <ng2ps7k5h74w6zo62oqazzetunjc2psooobmh3zcrrmxesi2ua@va6z7eqjst2u>
References: <20250725050409.2687242-1-suraj.kandpal@intel.com>
 <20250725050409.2687242-4-suraj.kandpal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250725050409.2687242-4-suraj.kandpal@intel.com>
X-Proofpoint-ORIG-GUID: tmCja1-JOTA-EmvsRPgAWUn23RprDo9z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI2MDEwOSBTYWx0ZWRfX8rRTk8R4JIhH
 IZJok8uZX2ivmAqySK4vWAJFLoeVWnd5+4EaNdudhCsi7016YERxSHoIrJhe9V2A903S/1DT9Db
 v1CMg98O0WgUoQcKMZhd5bO00tNXLwyFNX11FfpppxBp9hOZ/UkHTUVcgzlbUas1j/BxpsyupZC
 mIzhrFy+q3oWugzJVld5DElNtPNoD+HNX7kk9p8u3pc/6Vzf0MJiYXIxeh96bsMvoGJJm/0E6bi
 W69ydcfaZD9GhSH/DUFmaiYjYtku8boDZRje5lxuFN49KXfu0aBV0Bjz6CWze5YCEk+CcJeRBsM
 xp4iE4RYv7ujT/Ejn9o79tjiD2oN5oUmR3X7AXGTzoWmhsyoWYGi7kjYC+W9iezBoVk2gQFq0pQ
 5M1A3XOL6HLlTLHsOYNOYFjteOUa9wWw+ZFWlF2BZNRhye8oX65t8/pMnDXYYnKUYHmJ4nQH
X-Proofpoint-GUID: tmCja1-JOTA-EmvsRPgAWUn23RprDo9z
X-Authority-Analysis: v=2.4 cv=KtNN2XWN c=1 sm=1 tr=0 ts=6884cb35 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=QyXUC8HyAAAA:8 a=ueQVv7-7oDeDgNA6tiQA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-26_03,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 adultscore=0 mlxlogscore=999 bulkscore=0 spamscore=0 impostorscore=0
 mlxscore=0 malwarescore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507260109
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

On Fri, Jul 25, 2025 at 10:33:44AM +0530, Suraj Kandpal wrote:
> Now that drm_connector may not always be embedded within
> drm_writeback_connector, let's define a function which either uses
> the writeback helper hook that returns the drm_connector associated
> with the drm_writeback_connector or just return the drm_connector
> embedded inside drm_writeback_connector if the helper hook is not
> present. Lets use this function and call it whenever
> drm_connector is required mostly when connector helper private funcs
> need to be fetched.
> 
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> ---
>  drivers/gpu/drm/drm_writeback.c | 33 ++++++++++++++++++++++++++-------
>  1 file changed, 26 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_writeback.c b/drivers/gpu/drm/drm_writeback.c
> index e9f7123270d6..d610cb827975 100644
> --- a/drivers/gpu/drm/drm_writeback.c
> +++ b/drivers/gpu/drm/drm_writeback.c
> @@ -120,6 +120,18 @@ drm_connector_to_writeback(struct drm_connector *connector)
>  }
>  EXPORT_SYMBOL(drm_connector_to_writeback);
>  
> +static struct drm_connector *
> +drm_connector_from_writeback(struct drm_writeback_connector *wb_connector)
> +{
> +	const struct drm_writeback_connector_helper_funcs *funcs =
> +		wb_connector->helper_private;
> +
> +	if (funcs && funcs->get_connector_from_writeback)
> +		return funcs->get_connector_from_writeback(wb_connector);

The get_connector_from_writeback() and
drm_writeback_connector_helper_funcs should be moved to this patch.

However it feels really awkward to make drm_writeback_connector, which
is a wrapper around the drm_connector, to use some external DRM
connector. A quick grepping reveals API (which you missed) that expects
drm_writeback_connector.base to be a valid connector. And it would be
very hard to catch sunch an API later on.

If you want to use DRM framwework, while retaining
intel_connector for writeback connectors, I'd suggest following slightly
different path: extract common parts of drm_writeback_connector into a
common structure, and use it within the DRM core. Then provide functions
to fetch drm_connector from that struct or fetch it from drm_connector.


> +
> +	return &wb_connector->base;
> +}
> +
>  static int create_writeback_properties(struct drm_device *dev)
>  {
>  	struct drm_property *prop;
> @@ -478,6 +490,7 @@ drm_writeback_connector_init_with_conn(struct drm_device *dev, struct drm_connec
>  	if (ret)
>  		goto connector_fail;
>  
> +	drm_writeback_connector_helper_add(wb_connector, wb_funcs);
>  	INIT_LIST_HEAD(&wb_connector->job_queue);
>  	spin_lock_init(&wb_connector->job_lock);
>  
> @@ -527,13 +540,15 @@ int drm_writeback_set_fb(struct drm_connector_state *conn_state,
>  
>  int drm_writeback_prepare_job(struct drm_writeback_job *job)
>  {
> -	struct drm_writeback_connector *connector = job->connector;
> +	struct drm_writeback_connector *wb_connector = job->connector;
> +	struct drm_connector *connector =
> +		drm_connector_from_writeback(wb_connector);
>  	const struct drm_connector_helper_funcs *funcs =
> -		connector->base.helper_private;
> +		connector->helper_private;
>  	int ret;
>  
>  	if (funcs->prepare_writeback_job) {
> -		ret = funcs->prepare_writeback_job(connector, job);
> +		ret = funcs->prepare_writeback_job(wb_connector, job);
>  		if (ret < 0)
>  			return ret;
>  	}
> @@ -579,12 +594,14 @@ EXPORT_SYMBOL(drm_writeback_queue_job);
>  
>  void drm_writeback_cleanup_job(struct drm_writeback_job *job)
>  {
> -	struct drm_writeback_connector *connector = job->connector;
> +	struct drm_writeback_connector *wb_connector = job->connector;
> +	struct drm_connector *connector =
> +		drm_connector_from_writeback(wb_connector);
>  	const struct drm_connector_helper_funcs *funcs =
> -		connector->base.helper_private;
> +		connector->helper_private;
>  
>  	if (job->prepared && funcs->cleanup_writeback_job)
> -		funcs->cleanup_writeback_job(connector, job);
> +		funcs->cleanup_writeback_job(wb_connector, job);
>  
>  	if (job->fb)
>  		drm_framebuffer_put(job->fb);
> @@ -665,9 +682,11 @@ EXPORT_SYMBOL(drm_writeback_signal_completion);
>  struct dma_fence *
>  drm_writeback_get_out_fence(struct drm_writeback_connector *wb_connector)
>  {
> +	struct drm_connector *connector =
> +		drm_connector_from_writeback(wb_connector);
>  	struct dma_fence *fence;
>  
> -	if (WARN_ON(wb_connector->base.connector_type !=
> +	if (WARN_ON(connector->connector_type !=
>  		    DRM_MODE_CONNECTOR_WRITEBACK))
>  		return NULL;
>  
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
