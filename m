Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A34D7B12A81
	for <lists+dri-devel@lfdr.de>; Sat, 26 Jul 2025 14:38:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A766610E47C;
	Sat, 26 Jul 2025 12:38:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="T7zXasWk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3FF610E277
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Jul 2025 12:38:46 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56QAa1vu025229
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Jul 2025 12:38:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=p9WlLsI7wH4qRMkHcYS2d4F0
 b2ykbaMu84wDP9zYLAg=; b=T7zXasWkZ06zpnqARRkITEpUQPvghYuVTqKDO/c5
 DkNlyWVe2PJbAAVW6ID1DgAu11k444F0gxoGTpym5YSzRqTVjGwmq+qvzP59MbeI
 AFxGODu8ftka/jUJdG9NVBlaBdkkq8NNxh3l10es9Zu/y9kuUbtpaag0Ics9eTdX
 iCMgFtsvCEqzlk9ey+dUSeQIzrwGEUV8wOC7e1dRdB0z+H7ZaObisUUIyFfOHBNU
 6FwPDL/twmJ7RwBB3UwPFLoHa3J/WvttRasHChoWnfCerKu1LlVhtnVmG6YQi06M
 idJMXiQZZK6O6mdrXtPJKbWuQp4fMm2AZrk7h7qX2lPK2g==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484r6qgh0a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Jul 2025 12:38:45 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-70739adfaceso1892646d6.0
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Jul 2025 05:38:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753533524; x=1754138324;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=p9WlLsI7wH4qRMkHcYS2d4F0b2ykbaMu84wDP9zYLAg=;
 b=D3VkYcfVRUTWOQ15qc0Ay5tdolAOznC5lTIgeW7nnpVmi5oqiLxiQ9wFhLBuAsRCld
 r+b7kv4kDDXEH5HCwiBP/sAO3GQQG6BF8fYtnLJ8rmrEx9BGPAj4h9rJ409rUCmb1QZh
 PYuoHRkmgFKJoI2RnHZ5+8PU5z+RB8qJ+rB2sm+XXKVzpRevcJKPbsDiTYf5J9zFOjRu
 NHGyt0Nt+XVGj2Y/BK1Q3dRFbhf9hvKjtIQ/nilBs0f1SlRXzVziMQtWkzQQ2dWcRWX/
 Cf6B3rQ7/4XVa4iLuoST07FloFbJslj/FXXzpgC/Lq+6uromBPXVY85+PeeEVvRxe8z8
 ajmA==
X-Gm-Message-State: AOJu0YzofbcpWSSHb1tQE1dLGSVs0NvYBY94G0N7xnlYb1jpPKXmyvQP
 ykMdr6Gff8WgnOuXcwpYvLyckA4F7SRbRXKMiNU08ldq6P6O4Uu6GIwmLxQI9UkwLakgignhEVc
 7tG5o0inuUXDldsHO/8Kg/0p6WRJcbplfmEmqLbzWOButABZkE5h1sjVOGipTmcBb5/NBFXQ=
X-Gm-Gg: ASbGncvz85YQWM22Mbb7SgVGCuywuyda0/asfSQx4en5vAcKGoPk3JlhffNQeb0mqT/
 iGMNeCe6N6wUfsJgIlp62FnVt6FFSxwxo/GLiZA0Rr+ND5ZyAGm2ciqJG+lZUAF5gB0arxc/dQB
 QQwJJYbvdi5J4XBRciwtvNKjOQtOyrN6+Q7+s7mhV6Ix5BR2+QwaSIweUITXe+dQBiFE5DEIgTR
 3KyB4nhZmLUEPhpxmoJk/Nn1TWusKRxKuyYhWz9gphxVwpzza4818NKFSpInF3i/A+jwrk87jBA
 M25DChF945HLqQPsF7AqciNIXd9/eRNG/pMYo9AZrHewvBGyyqu/zADOwumxy0mFiTZ1dHK7Drg
 TnocLvjEnqaWaflis9P4S0ps8HloeCn9H36pDIXTX4E4bNyZcXIia
X-Received: by 2002:a05:6214:c64:b0:6fb:265:a2c5 with SMTP id
 6a1803df08f44-70713d6d5d8mr103943156d6.17.1753533524542; 
 Sat, 26 Jul 2025 05:38:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHNpnjyLFNka9PviBkscyS3Ceub+UziIG7kHudjcBkOBPWBI7J1LtbvLyuYM7A/xBfUxwo1Og==
X-Received: by 2002:a05:6214:c64:b0:6fb:265:a2c5 with SMTP id
 6a1803df08f44-70713d6d5d8mr103942896d6.17.1753533524022; 
 Sat, 26 Jul 2025 05:38:44 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-331f429f382sm4288081fa.92.2025.07.26.05.38.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Jul 2025 05:38:43 -0700 (PDT)
Date: Sat, 26 Jul 2025 15:38:41 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Suraj Kandpal <suraj.kandpal@intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, ankit.k.nautiyal@intel.com,
 arun.r.murthy@intel.com, uma.shankar@intel.com
Subject: Re: [PATCH 18/28] drm/i915/writeback: Add connector atomic check
Message-ID: <75d63c4377tss5cml47qu3ferkwuod7rceox6t5lrjqdzykuxx@q26ta2glzndw>
References: <20250725050409.2687242-1-suraj.kandpal@intel.com>
 <20250725050409.2687242-19-suraj.kandpal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250725050409.2687242-19-suraj.kandpal@intel.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI2MDEwMiBTYWx0ZWRfX+JWmrvOFoygU
 bguOzCWd1grRGSoLLBLtEQYKY/knn7AdblN17TUzl9HytMe4kvDuc/gF+PdTH5+u3ra90A6iSo5
 JGx/93T+7Cz8TJNg2Sy+tuFRBrlumX+raJqik+I0LRsDM8yXCRHFm2SqT+oH6fNvcIAOOepOpPD
 r6OaIqr3xqObVdqmDMWfMfQiB1gBkqL7mxUyu9y/l+gSg4jm0Lkbrk5fVKUeGirX5y7sGQTJUlR
 YGt/kvWwzUxZzHGqLwORw7/h3TNe/TAkQWl+IH578hM0wGlOBB5pvHIY9j4B/1e8QBujlWi/p7l
 m1+6TL67B6eTZQFUEOdXZ0fP9nClzDACra1Dfv+THFOCF0ji80Vi6GzuXVvqUnUbXueR2X+/7is
 A80zOi1YflnfN/K4QGwaN4jyWwSHiglEFOO1JJrYV6MdjpPoyVhCRQZZkaZgALVP+xItLm+i
X-Proofpoint-ORIG-GUID: ZzkfJn0wJSgPYxE5SloaM7Bph1CayTQK
X-Authority-Analysis: v=2.4 cv=ea89f6EH c=1 sm=1 tr=0 ts=6884cc56 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=QyXUC8HyAAAA:8 a=7yYpvgMhsW9ct4Lpu_sA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: ZzkfJn0wJSgPYxE5SloaM7Bph1CayTQK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-26_03,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0 phishscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 adultscore=0 clxscore=1015
 spamscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507260102
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

On Fri, Jul 25, 2025 at 10:33:59AM +0530, Suraj Kandpal wrote:
> Add connector helper function for atomic check which sets the
> mode_changed bit and checks if pixel format of fb is valid or not.
> 
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> ---
>  .../gpu/drm/i915/display/intel_writeback.c    | 49 +++++++++++++++++++
>  1 file changed, 49 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_writeback.c b/drivers/gpu/drm/i915/display/intel_writeback.c
> index 9b2432d86d35..7fb30cc61991 100644
> --- a/drivers/gpu/drm/i915/display/intel_writeback.c
> +++ b/drivers/gpu/drm/i915/display/intel_writeback.c
> @@ -186,6 +186,54 @@ static void intel_writeback_connector_destroy(struct drm_connector *connector)
>  	kfree(connector);
>  }
>  
> +static int intel_writeback_check_format(u32 format)
> +{
> +	int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(writeback_formats); i++) {
> +		if (writeback_formats[i] == format)
> +			return 0;
> +	}
> +
> +	return -EINVAL;
> +}
> +
> +static int intel_writeback_atomic_check(struct drm_connector *connector,
> +					struct drm_atomic_state *state)
> +{
> +	struct drm_connector_state *conn_state =
> +		drm_atomic_get_new_connector_state(state, connector);
> +	struct drm_crtc_state *crtc_state;
> +	struct drm_framebuffer *fb;
> +	int ret;
> +
> +	/* We return 0 since this is called while disabling writeback encoder */
> +	if (!conn_state->crtc)
> +		return 0;
> +
> +	/* We do not allow a blank commit when using writeback connector */
> +	if (!conn_state->writeback_job)
> +		return -EINVAL;
> +
> +	fb = conn_state->writeback_job->fb;
> +	if (!fb)
> +		return -EINVAL;

Other atomic_check functions return 0 if there is no writeback_job or no
FB. Please elaborate.

> +
> +	crtc_state = drm_atomic_get_new_crtc_state(state, conn_state->crtc);
> +	if (fb->width != crtc_state->mode.hdisplay ||
> +	    fb->height != crtc_state->mode.vdisplay)
> +		return -EINVAL;
> +
> +	ret = intel_writeback_check_format(fb->format->format);
> +	if (ret) {
> +		drm_dbg_kms(connector->dev,
> +			    "Unsupported drm format sent in writeback job\n");
> +		return ret;
> +	}

Missing a call to drm_atomic_helper_check_wb_connector_state(). Please
use the framework where available.

> +
> +	return 0;
> +}
> +
>  static struct drm_writeback_connector *
>  intel_get_writeback_connector(struct drm_connector *connector)
>  {
> @@ -221,6 +269,7 @@ static const struct drm_connector_helper_funcs conn_helper_funcs = {
>  	.get_writeback_connector = intel_get_writeback_connector,
>  	.get_modes = intel_writeback_get_modes,
>  	.mode_valid = intel_writeback_mode_valid,
> +	.atomic_check = intel_writeback_atomic_check,
>  	.prepare_writeback_job = intel_writeback_prepare_job,
>  	.cleanup_writeback_job = intel_writeback_cleanup_job,
>  };
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
