Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D30F0B358CB
	for <lists+dri-devel@lfdr.de>; Tue, 26 Aug 2025 11:26:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D2E410E61F;
	Tue, 26 Aug 2025 09:26:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="XOuHedPu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02ECB10E61B
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Aug 2025 09:26:15 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57Q5l7jw026177
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Aug 2025 09:26:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=7KgDcKLK3b159g1W/t3sHnMu
 AA3fp8hQ8bh2XnHJ4Gc=; b=XOuHedPukwV2WWTwQlYfxX5/a2iR0+oJ8xUiQ9En
 OjLXPMJPmxWkkRBeWoSd6iFocYiVWJ6YmTOlpvYTig5msjnVJs3LGupRh1XlM5zw
 wM97wUlfeYI8ygDchqRFcpxyKsQUdislQIYS9BVMk+j0vR3QO5eSrjTT5qPl2U/A
 72Wnm5UhJd8qciTwCnpxH5HJ3t0/k1FnB/5dhztcv0nPoPPxGr3Lxs51xy7Nfxoy
 pXDVCQD3ALX76UUQk6nXkasTCcxDqGrEVicPI/Twh2Gqr8JWGtFN3gwpFQRfYTPW
 6c8yq9kDp3/e7JjHnZpZVTZSDyyMminjrhsnSJ1uRdIcxQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5xfg759-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Aug 2025 09:26:15 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4b109765d3fso112847431cf.1
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Aug 2025 02:26:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756200374; x=1756805174;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7KgDcKLK3b159g1W/t3sHnMuAA3fp8hQ8bh2XnHJ4Gc=;
 b=ida5sSBgi9ZIV5Z+bKwDL493a7xOUqNp5n3UY0rbnNuhUroEB0mDbeG6TwDWFN5tuC
 2HT/o/GtRagpWtxQX36Ar4o7bEM6TQX+03JB3cRoU7qqwFEkj3KkECM/pLrKeDz2VEVk
 ICHXYp2CLEnCJ37AuY6NQc6BIJ/hN7QGQIBVXErNbc/6MXEVOxSKoJIs2/2RhR05wG+l
 zrBeOMJg2qPH84M5ogMmd8pFtctoid+0Vceq2LWoaik0e9eRLXW4YJHdiQMgOuoVzV8j
 MfhTsvWAW82zz47jmljcZV/px+HpsgdMDqkD/2/clOYdCWzty2TVaUwohR7yA7s7v0iF
 lSMA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWAsTgOqJ+9qAEfwMedz7Tx1nZKgkkj4HMWcftYhtJOWCjADiMu/OLjxTpU6St1My61NuVjKY3zmuM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz1hKwb/9CitMLe8fZAmBW6jjcnzYzH8zeB/NM3pnSNbCZIBVrp
 myM5m8uEa5PyhEmH9mfDdBLCu/pvX9o36vu9qtmjxnVF1Bydr8Khdwpht02vEoJ7E4R3eR5Y87f
 HPz+PI62ktI1CJIAki9hDE0Z1dF5HA2nLjF1P204g2vS50i0UKJfo5eMunpo4tJ78Hrkqp3k=
X-Gm-Gg: ASbGncsp+hHM5wycqYETQ+jRmRQ0kVEP6WnBJ2grEQy8uLnAX1g3mO46/LHcsg48DC/
 optkG5wjAccYqloGF2TSFMXJJMOE+ex425h5s4n3ijRFV/4C20rIReXK6ATs6TvFVOmxNvItG5i
 9KkoC1o/MFhT9DIXOjsBuEbAAwEgI/i6ilAaHp4aJt0bcTztvO/N2oAOyjWaJjVB3Q00xwFx+gp
 isAtbRKQpjKTAW5b7Y1+yjWYZ7ld9ui0Plta4eiwwaG7xMkRSUc5sA50FmOeZoZZBI5dG+L8GAz
 BpMlO/tMO/ctcC+TuPJ/EMJ6JR79UUEwg5nwAIJOSZtEEjMP2T1LKdrcZ8t+sQuumloLeKAZ3lK
 adhNLfj76qcnkQAUBUUd7Q7mGbPgBVnSULWKgQYAN6zaAlDQ4XT4X
X-Received: by 2002:ac8:7d0f:0:b0:4ab:958a:6003 with SMTP id
 d75a77b69052e-4b2e76f6c0emr6051041cf.27.1756200374142; 
 Tue, 26 Aug 2025 02:26:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFLI2pBmaxUZlk2JfGZiIZiLVPRGKwKddxYmLZBVub9Mv5V9yCX6KNDj8QRrTIRv5+E0q1Vzg==
X-Received: by 2002:ac8:7d0f:0:b0:4ab:958a:6003 with SMTP id
 d75a77b69052e-4b2e76f6c0emr6050811cf.27.1756200373545; 
 Tue, 26 Aug 2025 02:26:13 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55f35c11ffesm2214856e87.40.2025.08.26.02.26.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Aug 2025 02:26:12 -0700 (PDT)
Date: Tue, 26 Aug 2025 12:26:09 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH v3 26/38] drm/msm/dp: add an API to initialize MST on
 sink side
Message-ID: <4u5bt5y4suecanvxni2fnljdzrxnkjrg2dgkwzpj4pztvyoef3@nopu6m7w543n>
References: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
 <20250825-msm-dp-mst-v3-26-01faacfcdedd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250825-msm-dp-mst-v3-26-01faacfcdedd@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfX4W0ZQOjFEheO
 u+Xtq0j4zEXZGjRJWl+3tXqftHWRts8oQtfypafVBYTuMB/u/2vv1rnrt8rgmZj//foQ9nSjTTg
 gqAyLnUmAJip+3/6/0e57iyEqOB0wr6pdfIYpGkp+Pg5eeGvkpvQDMNT6rGmPKhuYNDLu1C10gz
 cfwAgEQj9kQDNQhLk28dgIgUuoH/SpSaI/2vbH1Z3fsmjpRDOkHzJ3xQO4NZ0QNMsajaZwyzR1S
 9TNjTLQPBTtXP/axPk7HSXliS/me0FUm8TashTGWsG+jAo8ErGDsuibRDEzWlPLyydwraZXQnB1
 14NZuRWpelxbls+DPACaf9C/6dZb8mBmHEMvSzMWxFQuRqxnjwfjr/prnWvBBeVGnWvzhtSLEUm
 8nyAVoyZ
X-Proofpoint-GUID: qh_0lOb0Rk8JVeCF4VfAllYkuruaLTCw
X-Authority-Analysis: v=2.4 cv=MutS63ae c=1 sm=1 tr=0 ts=68ad7db7 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=7z2oCe98pf8tU8XqQ0sA:9
 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: qh_0lOb0Rk8JVeCF4VfAllYkuruaLTCw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-26_02,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 adultscore=0 spamscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230033
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

On Mon, Aug 25, 2025 at 10:16:12PM +0800, Yongxing Mou wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> If the DP controller is capable of supporting multiple streams
> then initialize the DP sink in MST mode by programming the DP_MSTM_CTRL
> DPCD register to enable MST mode.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 55 ++++++++++++++++++++++++++++++-------
>  1 file changed, 45 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index cb433103d439ac6b8089bdecf0ee6be35c914db1..84df34306fb557341bea288ea8c13b0c81b11919 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -14,6 +14,7 @@
>  #include <linux/string_choices.h>
>  #include <drm/display/drm_dp_aux_bus.h>
>  #include <drm/display/drm_hdmi_audio_helper.h>
> +#include <drm/display/drm_dp_mst_helper.h>
>  #include <drm/drm_edid.h>
>  
>  #include "msm_drv.h"
> @@ -297,6 +298,35 @@ static int msm_dp_display_lttpr_init(struct msm_dp_display_private *dp, u8 *dpcd
>  	return lttpr_count;
>  }
>  
> +static void msm_dp_display_mst_init(struct msm_dp_display_private *dp)
> +{
> +	const unsigned long clear_mstm_ctrl_timeout_us = 100000;
> +	u8 old_mstm_ctrl;
> +	struct msm_dp *msm_dp = &dp->msm_dp_display;
> +	int ret;
> +
> +	/* clear sink mst state */
> +	drm_dp_dpcd_readb(dp->aux, DP_MSTM_CTRL, &old_mstm_ctrl);
> +	drm_dp_dpcd_writeb(dp->aux, DP_MSTM_CTRL, 0);
> +
> +	/* add extra delay if MST old state is on*/
> +	if (old_mstm_ctrl) {
> +		drm_dbg_dp(dp->drm_dev, "wait %luus to set DP_MSTM_CTRL set 0\n",
> +			   clear_mstm_ctrl_timeout_us);
> +		usleep_range(clear_mstm_ctrl_timeout_us,
> +			     clear_mstm_ctrl_timeout_us + 1000);
> +	}
> +
> +	ret = drm_dp_dpcd_writeb(dp->aux, DP_MSTM_CTRL,
> +				 DP_MST_EN | DP_UP_REQ_EN | DP_UPSTREAM_IS_SRC);
> +	if (ret < 0) {

I didn't catch this up in the previous patches. We have two sets of DPCD
accessors: the older ones which can return error or the size of the data
that was actually read / written (which might be less than the size of
the buffer passed to the function) and newer ones, which return error or
0. drm_dp_dpcd_writeb() is from the first group, so if it was
successful, it should be returning 1. It's all a pain to handle, so
please start using newer accessors in your patches (the full conversion
of the MSM driver is on my todo list, but it's intrusive, so was
delaying it...).

TL;DR: inside your code please use drm_dp_dpcd_read_byte() /
drm_dp_dpcd_write_byte() / drm_dp_dpcd_read_data() /
drm_dp_dpcd_write_data().

> +		DRM_ERROR("sink mst enablement failed\n");
> +		return;
> +	}
> +
> +	msm_dp->mst_active = true;
> +}
> +
>  static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
>  {
>  	struct drm_connector *connector = dp->msm_dp_display.connector;
> @@ -315,18 +345,20 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
>  	if (rc)
>  		goto end;
>  
> -	drm_edid = drm_edid_read_ddc(connector, &dp->aux->ddc);
> -	drm_edid_connector_update(connector, drm_edid);
> +	if (!dp->mst_supported || !drm_dp_read_mst_cap(dp->aux, dp->panel->dpcd)) {

In several previous patches, the functions initializing MST can
return an error, leaving the user with half-initialized MST. Are those
errors a safety coding or do they have some real-use usecase? In the
latter case, it would be nice to keep SST wokring if enabling MST fails.

> +		drm_edid = drm_edid_read_ddc(connector, &dp->aux->ddc);
> +		drm_edid_connector_update(connector, drm_edid);
>  
> -	if (!drm_edid) {
> -		DRM_ERROR("panel edid read failed\n");
> -		/* check edid read fail is due to unplug */
> -		if (!msm_dp_aux_is_link_connected(dp->aux))
> -			return -ETIMEDOUT;
> -	}
> +		if (!drm_edid) {
> +			DRM_ERROR("panel edid read failed\n");
> +			/* check edid read fail is due to unplug */
> +			if (!msm_dp_aux_is_link_connected(dp->aux))
> +				return -ETIMEDOUT;
> +		}
>  
> -	if (rc)
> -		goto end;
> +		if (rc)
> +			goto end;
> +	}
>  
>  	msm_dp_link_process_request(dp->link);
>  
> @@ -349,6 +381,9 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
>  	 */
>  	msm_dp_link_psm_config(dp->link, &dp->panel->link_info, false);
>  
> +	if (dp->mst_supported && drm_dp_read_mst_cap(dp->aux, dp->panel->dpcd))
> +		msm_dp_display_mst_init(dp);
> +
>  	msm_dp_link_reset_phy_params_vx_px(dp->link);
>  
>  	if (!dp->msm_dp_display.internal_hpd)
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
