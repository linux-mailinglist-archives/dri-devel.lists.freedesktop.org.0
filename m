Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC004AE8584
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jun 2025 16:03:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D070D10E72B;
	Wed, 25 Jun 2025 14:03:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="MKaAVv4X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F96610E72B
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 14:03:36 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55P9nIqR032752
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 14:03:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=URKZePCRRSWNA6m1/d+xkCFp
 jOvfyFXCKN/6BSWCDGU=; b=MKaAVv4XfQR4jf+secKsYKhgLwQdYBMU1onEiPrE
 g3z2kfZXBpAVFDJcGI0foBthQ9pdP/eOY6HApYbBpDpfZ6ddDafCQy1d2KrFLXyM
 x/hVvbCxbIH5xMa62McpKOSHPo6brldDt3CCiqQ/JvaDGa0HoVtko9bDhUxV10Zf
 H1+5lvbTvWVatIj2k0twfZO9L6x6NCtLOY1IesZFNPrOfuboumEe/4AT3M+IgVia
 ti/6hWJvozEZkXrvh7pCB/8veEc7oTD/NSe+w+LrUgAEFN0m1ocwhTlpuGyULJRR
 lZhNUKHvBfeHMBZ4xASb372BviH2LM2CPsCmeSqHTnsBSw==
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fbm1xpb8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 14:03:35 +0000 (GMT)
Received: by mail-il1-f198.google.com with SMTP id
 e9e14a558f8ab-3ddcb80387dso8812135ab.1
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 07:03:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750860214; x=1751465014;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=URKZePCRRSWNA6m1/d+xkCFpjOvfyFXCKN/6BSWCDGU=;
 b=oR6JY3Nbi4ewfqEP9ZV+EsVmcv9ofox0XKGcq1cTpG+olSmfaWaVeCfIi4GLxW4JmR
 /SHMRRDctbf33PKe5HPm9VARjfFyw1iCMTm2YuVjOZxVLKljKgU9jACiVlxJPrplg8BO
 suhIlQJUetGU9xuhGK9E1GGCLvO9Qlh+pBzKDyNnDPzHGlqUaQrYawFcoSlSl060Cpfc
 p9LHSl97RiU0GXuQ1tvvq7xm82z9q/vrzxnEHC4hPrr757MYUCgFhTGJxv6qq1ODl7z4
 0tSZbU7tt4Tz3mtXji2pdOEpYrxZvptTVzpvOA6yyxP6EEgoy/2ArKQZNzBJNM0Ip121
 Ti1A==
X-Forwarded-Encrypted: i=1;
 AJvYcCW0DZNF5B/du1Ky4RRcSL2jaJ7/iDiXUhnvpm4I/MVB0AEyWFfg8kvKdaQTIsZPeEu2MqSP70vNewQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy9u3Ffgto0fpyb9nKk7wSj0Ws30mV5XRd4MJ2d66JNaGb+bS4l
 ZGp3zx6TA5zE9ltlxfIZ7/hEPy+LH0toIarovi6PdA9r5BuKGNjJkBDoXDooeO7RBhMDNdwI0BB
 W84TtQrbRfMutAbfvWL10IltwM082H6aTIBeUQ9j7etn1HrMEQqYKbrIbAHZ3KvzvqTJQyj4=
X-Gm-Gg: ASbGncuTD2HbdRwg/lcXz7Ot/1w153igXB9fzvSAW+HYvQd8CVGO6UicyRT15tg0j71
 lPphgbEyqPgR07VROy99/lYXUe7tFpl4onbhVGs6AHF/fXjGA6BulRBwXVKXCaLiISxTF/AkGDP
 rTJIWQdnOOVQIfOjCPVICYjyBFcy3zlthPuYa1p60cnYdkXx+EVLfKYjH/WJHVQQBOEGmUVbMYj
 f0o/eh5sA1BBvpMAmhfbGWfDsfBYN2xcVmm/kltHK1oQYd9kexRiC9zYFKa8l9KsbEDcLxh8qZL
 eV3RFaoWHpe0aFVoeajlJsvZjzesg39wzJI4aLOs5xp0qUJP699CWVh7Jq0sLsL+SRhgToQVC2a
 cqmVijlcl5IixjKe2G/9qj9Hl2nsCzmRhx1k=
X-Received: by 2002:a05:6e02:1746:b0:3dd:a0fc:1990 with SMTP id
 e9e14a558f8ab-3df288c489dmr102423595ab.3.1750860214053; 
 Wed, 25 Jun 2025 07:03:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGypCwMCHMt534i1XnTY01Nz4JEqoxT4c1vs6MRi3pmgy33qxWXH4LT7FJdUnQhkZO7vUdCPw==
X-Received: by 2002:a05:6e02:1746:b0:3dd:a0fc:1990 with SMTP id
 e9e14a558f8ab-3df288c489dmr102422645ab.3.1750860213349; 
 Wed, 25 Jun 2025 07:03:33 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-553e41bbbd9sm2187336e87.124.2025.06.25.07.03.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jun 2025 07:03:32 -0700 (PDT)
Date: Wed, 25 Jun 2025 17:03:31 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <quic_yongmou@quicinc.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH v2 02/38] drm/msm/dp: remove dp_display's dp_mode and use
 dp_panel's instead
Message-ID: <4jrpa7iyygciuy2k4ydk7cpm5isdrddclljf6gbyvkiqc645tx@idyds4tkstkx>
References: <20250609-msm-dp-mst-v2-0-a54d8902a23d@quicinc.com>
 <20250609-msm-dp-mst-v2-2-a54d8902a23d@quicinc.com>
 <kq6tb2wnte6v5z7uxgzc22kjwcevgvcdluzqbelvnbpbxlkotd@ltlv3u2guj4u>
 <1be2238d-7bb2-4ef9-9c7c-81dab0dcb559@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1be2238d-7bb2-4ef9-9c7c-81dab0dcb559@quicinc.com>
X-Authority-Analysis: v=2.4 cv=YYu95xRf c=1 sm=1 tr=0 ts=685c01b7 cx=c_pps
 a=knIvlqb+BQeIC/0qDTJ88A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=e5mUnYsNAAAA:8 a=COk6AnOGAAAA:8 a=s97EMkLwCKFNuu-rtO0A:9
 a=CjuIK1q_8ugA:10 a=8vIIu0IPYQVSORyX1RVL:22 a=Vxmtnl_E_bksehYqCbjh:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: ruUyFfpusFQOjKBiaDZNYFVSKJsVCuTH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDEwMSBTYWx0ZWRfX/mFp+5PVujVE
 PGqJQF8gyvxlMPXFkaZkMQEvuOTV0dn6lWA1P5tDawPQaDRiNoshLFxftBahPQvY3TnDjZxZcdc
 LtVr5FyGC1UhiL7TngScmao98yfTDSviPIIbMyI9EuCipYTMT1BXlLEBt/zaCHia8g91ovexMJs
 90xfsgS/shL7sR4Haoy0jG6uoRfT79Vky2a+TTnFcb2zo/FpGueMatylE/Q6jqXCEe+4mY/7hbl
 5k+GV+NwrzR8Bb92LJ3ptf/3dQb4SfqMws8iVi6VgZtFK38dudkrWs7VFJf7mBuO6j+EVQ0uSAs
 l7rLJ21716qgcw/wxWJrIKaJZ1xcWAZhueI891ed5T9w+UeCofyA+0S/9oX6+cwOcgo98auhNtZ
 eFuQniKp2ulpRrPfecXZ4PlDIn0PdQR0YRxpAWPDAuPJn4u39Fe8V4LbhaCescdw0RhgGe7S
X-Proofpoint-ORIG-GUID: ruUyFfpusFQOjKBiaDZNYFVSKJsVCuTH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_04,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 spamscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 mlxlogscore=999
 clxscore=1015 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506250101
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

On Wed, Jun 25, 2025 at 08:34:18PM +0800, Yongxing Mou wrote:
> 
> 
> On 2025/6/9 20:48, Dmitry Baryshkov wrote:
> > On Mon, Jun 09, 2025 at 08:21:21PM +0800, Yongxing Mou wrote:
> > > From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > > 
> > > dp_display caches the current display mode and then passes it onto
> > > the panel to be used for programming the panel params. Remove this
> > > two level passing and directly populated the panel's dp_display_mode
> > > instead.
> > 
> > - Why do we need to cache / copy it anyway? Can't we just pass the
> >    corresponding drm_atomic_state / drm_crtc_state / drm_display_mode ?
> > 
> This part works as follows: .mode_set() copies the adjusted_mode into
> msm_dp_display_private->msm_dp_display_mode, and also parses and stores
> variables such as v_active_low/h_active_low/out_fmt_is_yuv_420 and ... When
> @drm_bridge_funcs.atomic_enable() is called, it copies
> msm_dp_display->msm_dp_mode into dp_panel->msm_dp_mode and initializes
> panel_info in msm_dp_display_set_mode(). Then when go to
> msm_dp_ctrl_on_stream(), the parameters are updated into the corresponding
> hardware registers.

So, if we do everything during .atomic_enable(), there would be no need
to store and/or copy anything. All the data is available and can be used
as is.

> 
> This design has been in place since the first version of the DP driver and
> has remained largely unchanged.

Yes... The point is that you are touching this piece of code anyway,
let's make it nicer.

> Originally, the drm_mode would be passed in
> two stages: from msm_dp_display->msm_dp_mode to dp_panel->msm_dp_mode. Since
> in MST mode each stream requires its own drm_mode and stored in dp_panel, we
> simplified the two-stage transfer into a single step (.mode_set() do all
> things and store in msm_dp_panel). Meanwhile we modified the
> msm_dp_display_set_mode function to accept a msm_dp_panel parameter,
> allowing the MST bridge funcs' mode_set() to reuse this part code.
> 
> The following patches:
> https://patchwork.freedesktop.org/patch/657573/?series=142207&rev=2 and
> https://patchwork.freedesktop.org/patch/657593/?series=142207&rev=2,
> introduce msm_dp_display_*_helper functions to help reuse common code across
> MST/SST/eDP drm_bridge_funcs.
> 
> If we drop msm_dp_mode from dp_panel and use drm_display_mode, it might
> introduce a large number of changes that are not directly related to MST.
> Actually i think the presence of msm_dp_display_mode seems to simplify the
> work in msm_dp_panel_timing_cfg(), this patch series we want to focus on MST
> parts, so would we consider optimizing them later?

Sure... But then you have to change two places. If you optimize it
first, you have to touch only place. And it can be even submitted
separately.

> 
> Thanks~
> > > 
> > > Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > > Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
> > > ---
> > >   drivers/gpu/drm/msm/dp/dp_display.c | 76 ++++++++++++++-----------------------
> > >   1 file changed, 29 insertions(+), 47 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> > > index 4a9b65647cdef1ed6c3bb851f93df0db8be977af..9d2db9cbd2552470a36a63f70f517c35436f7280 100644
> > > --- a/drivers/gpu/drm/msm/dp/dp_display.c
> > > +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> > > @@ -92,7 +92,6 @@ struct msm_dp_display_private {
> > >   	struct msm_dp_panel   *panel;
> > >   	struct msm_dp_ctrl    *ctrl;
> > > -	struct msm_dp_display_mode msm_dp_mode;
> > >   	struct msm_dp msm_dp_display;
> > >   	/* wait for audio signaling */
> > > @@ -806,16 +805,29 @@ static int msm_dp_init_sub_modules(struct msm_dp_display_private *dp)
> > >   }
> > >   static int msm_dp_display_set_mode(struct msm_dp *msm_dp_display,
> > > -			       struct msm_dp_display_mode *mode)
> > > +				   const struct drm_display_mode *adjusted_mode,
> > > +				   struct msm_dp_panel *msm_dp_panel)
> > >   {
> > > -	struct msm_dp_display_private *dp;
> > > +	u32 bpp;
> > > -	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
> > > +	drm_mode_copy(&msm_dp_panel->msm_dp_mode.drm_mode, adjusted_mode);
> > > +
> > > +	if (msm_dp_display_check_video_test(msm_dp_display))
> > > +		bpp = msm_dp_display_get_test_bpp(msm_dp_display);
> > > +	else
> > > +		bpp = msm_dp_panel->connector->display_info.bpc * 3;
> > > +
> > > +	msm_dp_panel->msm_dp_mode.bpp = bpp;
> > > +
> > > +	msm_dp_panel->msm_dp_mode.v_active_low =
> > > +		!!(adjusted_mode->flags & DRM_MODE_FLAG_NVSYNC);
> > > +	msm_dp_panel->msm_dp_mode.h_active_low =
> > > +		!!(adjusted_mode->flags & DRM_MODE_FLAG_NHSYNC);
> > > +	msm_dp_panel->msm_dp_mode.out_fmt_is_yuv_420 =
> > > +		drm_mode_is_420_only(&msm_dp_panel->connector->display_info, adjusted_mode) &&
> > > +		msm_dp_panel->vsc_sdp_supported;
> > > -	drm_mode_copy(&dp->panel->msm_dp_mode.drm_mode, &mode->drm_mode);
> > > -	dp->panel->msm_dp_mode.bpp = mode->bpp;
> > > -	dp->panel->msm_dp_mode.out_fmt_is_yuv_420 = mode->out_fmt_is_yuv_420;
> > > -	msm_dp_panel_init_panel_info(dp->panel);
> > > +	msm_dp_panel_init_panel_info(msm_dp_panel);
> > >   	return 0;
> > >   }
> > > @@ -1431,10 +1443,13 @@ bool msm_dp_needs_periph_flush(const struct msm_dp *msm_dp_display,
> > >   bool msm_dp_wide_bus_available(const struct msm_dp *msm_dp_display)
> > >   {
> > >   	struct msm_dp_display_private *dp;
> > > +	struct msm_dp_panel *dp_panel;
> > >   	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
> > > -	if (dp->msm_dp_mode.out_fmt_is_yuv_420)
> > > +	dp_panel = dp->panel;
> > > +
> > > +	if (dp_panel->msm_dp_mode.out_fmt_is_yuv_420)
> > >   		return false;
> > >   	return dp->wide_bus_supported;
> > > @@ -1496,10 +1511,6 @@ void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
> > >   	bool force_link_train = false;
> > >   	msm_dp_display = container_of(dp, struct msm_dp_display_private, msm_dp_display);
> > > -	if (!msm_dp_display->msm_dp_mode.drm_mode.clock) {
> > > -		DRM_ERROR("invalid params\n");
> > > -		return;
> > > -	}
> > >   	if (dp->is_edp)
> > >   		msm_dp_hpd_plug_handle(msm_dp_display, 0);
> > > @@ -1517,15 +1528,6 @@ void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
> > >   		return;
> > >   	}
> > > -	rc = msm_dp_display_set_mode(dp, &msm_dp_display->msm_dp_mode);
> > > -	if (rc) {
> > > -		DRM_ERROR("Failed to perform a mode set, rc=%d\n", rc);
> > > -		mutex_unlock(&msm_dp_display->event_mutex);
> > > -		return;
> > > -	}
> > 
> > It should be done other way around: keep this call and drop
> > msm_dp_bridge_mode_set().
> > 
> Emm as reply in last comments..

Yep. Drop .mode_set, the callback is even described as deprecated.

> > > -
> > > -	hpd_state =  msm_dp_display->hpd_state;
> > > -
> > >   	if (hpd_state == ST_CONNECTED && !dp->power_on) {
> > >   		msm_dp_display_host_phy_init(msm_dp_display);
> > >   		force_link_train = true;
> > > @@ -1604,33 +1606,13 @@ void msm_dp_bridge_mode_set(struct drm_bridge *drm_bridge,
> > >   	msm_dp_display = container_of(dp, struct msm_dp_display_private, msm_dp_display);
> > >   	msm_dp_panel = msm_dp_display->panel;
> > > -	memset(&msm_dp_display->msm_dp_mode, 0x0, sizeof(struct msm_dp_display_mode));
> > > -
> > > -	if (msm_dp_display_check_video_test(dp))
> > > -		msm_dp_display->msm_dp_mode.bpp = msm_dp_display_get_test_bpp(dp);
> > > -	else /* Default num_components per pixel = 3 */
> > > -		msm_dp_display->msm_dp_mode.bpp = dp->connector->display_info.bpc * 3;
> > > -
> > > -	if (!msm_dp_display->msm_dp_mode.bpp)
> > > -		msm_dp_display->msm_dp_mode.bpp = 24; /* Default bpp */
> > > -
> > > -	drm_mode_copy(&msm_dp_display->msm_dp_mode.drm_mode, adjusted_mode);
> > > -
> > > -	msm_dp_display->msm_dp_mode.v_active_low =
> > > -		!!(msm_dp_display->msm_dp_mode.drm_mode.flags & DRM_MODE_FLAG_NVSYNC);
> > > -
> > > -	msm_dp_display->msm_dp_mode.h_active_low =
> > > -		!!(msm_dp_display->msm_dp_mode.drm_mode.flags & DRM_MODE_FLAG_NHSYNC);
> > > -
> > > -	msm_dp_display->msm_dp_mode.out_fmt_is_yuv_420 =
> > > -		drm_mode_is_420_only(&dp->connector->display_info, adjusted_mode) &&
> > > -		msm_dp_panel->vsc_sdp_supported;
> > > +	msm_dp_display_set_mode(dp, adjusted_mode, msm_dp_panel);
> > >   	/* populate wide_bus_support to different layers */
> > > -	msm_dp_display->ctrl->wide_bus_en =
> > > -		msm_dp_display->msm_dp_mode.out_fmt_is_yuv_420 ? false : msm_dp_display->wide_bus_supported;
> > > -	msm_dp_display->catalog->wide_bus_en =
> > > -		msm_dp_display->msm_dp_mode.out_fmt_is_yuv_420 ? false : msm_dp_display->wide_bus_supported;
> > > +	msm_dp_display->ctrl->wide_bus_en = msm_dp_panel->msm_dp_mode.out_fmt_is_yuv_420 ?
> > > +		false : msm_dp_display->wide_bus_supported;
> > > +	msm_dp_display->catalog->wide_bus_en = msm_dp_panel->msm_dp_mode.out_fmt_is_yuv_420 ?
> > > +		false : msm_dp_display->wide_bus_supported;
> > >   }
> > >   void msm_dp_bridge_hpd_enable(struct drm_bridge *bridge)
> > > 
> > > -- 
> > > 2.34.1
> > > 
> > 
> 

-- 
With best wishes
Dmitry
