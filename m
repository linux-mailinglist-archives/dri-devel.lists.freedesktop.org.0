Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B8B4D201BA
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jan 2026 17:12:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01F9510E618;
	Wed, 14 Jan 2026 16:12:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="fw4ly/Sy";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WpOm5FSU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DED710E61B
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 16:12:48 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60EEThxB2497621
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 16:12:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 3udo9Mw+DK3PwA7JzXb/AilVbOQhXrI/Va8VuA69IyQ=; b=fw4ly/SyPvv2f5pF
 evdxFZZoz0rj5qITvIN+htu5Ay4m4RTwbfFqvXDTCr1BQNSo9Zkj7YNHrr0mAMnA
 akaAkLX0VHmD+2xgcBO7je9MFTQ7YjCC9s4GgxV5AWoYo9Z54PAqhR50pG6wUzvF
 Kxo5R5UuIGNMxgreoUMF4yNucU2Y14VabOCbADoXw1QTMOoqi5h4NLSVgkCcwglA
 SvqxBcrrSz40NwYpkwwVRKSqZSyqSS+CJSLDjC23lwJwTTE+sUfAsZoN9xzZE+nP
 hmur9AQRz+4blgT2k/nf/jlVK2vjqKjJZsdQ8QNvwKUc72DK3WodU442ptVuD83A
 yJeWuA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bp16x3572-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 16:12:47 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8c5311864d9so207445585a.2
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 08:12:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768407165; x=1769011965;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=3udo9Mw+DK3PwA7JzXb/AilVbOQhXrI/Va8VuA69IyQ=;
 b=WpOm5FSUIhTzhpU8XXM5Wu3Npu6/6eIxZPxV4rx9O0PlAk7aess5xACpIYDKh2cVV1
 UuzeW/9t7KnGt7zIl3lDw1fZtIrzyrSibUGxI4YhbwJBmwFvgtelksy5Gk/7sAg5Wcc0
 UGh704WNQXkQcH1v3rDKFSw/+UWvTWuCdvgFo8XMYwmV7q+5k8Rmfp9v21KankRbm1/l
 y1CDR7ptk+5EjZ5T5FKSIC3H9Qx0UlGB+ienlwLr/0brpgzCodECYtQe6K8B8NnsHMo7
 XfLiusDWYa557jbOJbAmZ56gqNZkFzj0mFCTV4BOmeTV8HfG2W/TiXfRzHnJ33fjlmxZ
 ogzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768407165; x=1769011965;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3udo9Mw+DK3PwA7JzXb/AilVbOQhXrI/Va8VuA69IyQ=;
 b=Hs3P7WT9Sv9hshg8WNp0UGRhJ4CnePxB3SwfcjDy9ub8Jd8YBm78P81mvhmkoygd0n
 5/KyCIXa+DXXMLgnSEIP1ANccJMIXhNrBAurB/U3QORPBFAyOp77b08P1zcP4CEGG9c/
 uoFAQ74XXy53dGWRcf7vL3i1flAbinHeJvg+cw0e2QmYDsYBrT9QzprZrXu+RO5EuOe6
 1CTMnoDamGqv4zbRSZJihTgVDbgsC25GPjs6vYQ9hGBjI4AFHfItTWsqNrAvjQR4J8J8
 i/YM5wI2TNNfvI9spSfmR2SB2x3XT5hH7P8vk+6eilwjOV0aSgMo6hjCCiMoKBnzcbvT
 VNhg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVMqYwQhs4h1sBL5Tbo5Wh9eEHND6zh0+/JFY7ScZk7FG8UFyDwTr13yRC1IF7jwkyAM/zabeOvWmQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz7WeoGBdrXtt2wugvvGKq2JbIa4dbGU27VPYCwjOJy2/iLSAst
 v7gqHOmym6sl839Y5IwG4phBbNJFv+UdPSurmrTBqfkyk0QMGFppbyyTRc+E969/8B8ucVVJGMk
 76KxCj3psJitNfUr7iXX9m8DYv3S/zoq42G1Gg74Fn4q6j5hUzt1lFeldc9tVZ42n0punyoY=
X-Gm-Gg: AY/fxX4I3Cxxoq8+wSQkbMrx2V//mwBR91465up4NcwmULIk89VZvT0bivwNEfyQgzt
 tr54FYgxia99fWIjEfCbOcfVnGA5WCsSM+2VzvjPBGP4GqPkR2fUeRRiS9RG2HD2U1God/yKoEh
 dZyBXx7y+DXMB+1V21aty3XIyh0us7q8zAwC6Ttu+GJ9eG+Y1rtoVrobDMHrPQhQZz9zYns0TQn
 GKLMi/AWTEBGrIB5xBXPpC4F6FA8qflumnnLpx9+e6iD+khQLdO/tnH9xDrNhNRn+KDR3AkGKn7
 Kq+HKV4VajQgUiVNNI3zy83+yLNPnjL+oos6m6VDJ4fva9vBSxdNP1OWBW3aMhtv7i0K3tyjFkL
 p1iB2kx9IxQ/42UfAtj2HIn3aph8Jc3PIH7g2wE4ZrWjSCKJJMqNhCC8EAf2c03Xdy+6/Qa+K4u
 1AUWu/K6VOBz9wMJfzsumemsI=
X-Received: by 2002:a05:620a:4502:b0:8b9:7a1a:8c73 with SMTP id
 af79cd13be357-8c52fb90a04mr493626885a.46.1768407163666; 
 Wed, 14 Jan 2026 08:12:43 -0800 (PST)
X-Received: by 2002:a05:620a:4502:b0:8b9:7a1a:8c73 with SMTP id
 af79cd13be357-8c52fb90a04mr493619385a.46.1768407163009; 
 Wed, 14 Jan 2026 08:12:43 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-382fc959db1sm46330641fa.2.2026.01.14.08.12.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jan 2026 08:12:42 -0800 (PST)
Date: Wed, 14 Jan 2026 18:12:40 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jun Nie <jun.nie@linaro.org>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v16 09/10] drm/msm/dpu: support plane splitting in
 quad-pipe case
Message-ID: <nvd4eksgcmeqlfwp4jc27fpuzi6otdhzcefdbmj7a2xgv2bqwr@r6rytxs7ibj3>
References: <20250918-v6-16-rc2-quad-pipe-upstream-4-v16-0-ff6232e3472f@linaro.org>
 <20250918-v6-16-rc2-quad-pipe-upstream-4-v16-9-ff6232e3472f@linaro.org>
 <CABymUCNY9uo0Cm0KgM9yChuxJ22=Y-4JjHj7cEh5ByX8Nr3y-w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABymUCNY9uo0Cm0KgM9yChuxJ22=Y-4JjHj7cEh5ByX8Nr3y-w@mail.gmail.com>
X-Proofpoint-GUID: 0gG_q7iGy8C88U-OPcEEOSRTs3kgGOvr
X-Proofpoint-ORIG-GUID: 0gG_q7iGy8C88U-OPcEEOSRTs3kgGOvr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDEzNSBTYWx0ZWRfXwe2lxqvWd8uG
 pWK8wNpWHGxsnKZHqyl3KJ341Gw7BJLq/OOJY4sK8es9ib01mmX0ZY1ZP4iBZnkCs6x9OxVaWrW
 A+G+204mnHzT/iWObcsizf+GzbDz8eEzckU+faGHRFfmbjD6bSXYkTrhNvYmllDdQHA6wbJTpEb
 sKdrXtp9EHOYKjetzZqg3ET/3YFvGvZaM0t1Rpr4NUYYl1sVAi+/Q33PQy4eqzXvE2rEVb6JEVB
 x6rF1rtt8qRpvLwaEUF+I++fvf6L0kUMdohR5kIQ7e7UY5wJT074kCsAIcJ5Hi7KeTisuBEGrOx
 VTuCZQJ30mK3R0ig6EV5AUExN4MD/H6+Gu1A+d+A3NRSHrYISAjulU9nRyzptByX8SiXK7c36zX
 28lAVWPiSIZd3yo8TsAqxAL06cnMBd5LfOg3zMVFQToblHR+7NOf/oLSM8A+1m0Y5cL3NmbR0wj
 vP6EjfFY1jdfufwSpTw==
X-Authority-Analysis: v=2.4 cv=JvT8bc4C c=1 sm=1 tr=0 ts=6967c07f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=sWKEhP36mHoA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=7nXcqi-YNvihj1AckBkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_05,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 adultscore=0 priorityscore=1501
 clxscore=1015 impostorscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601140135
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

On Wed, Jan 14, 2026 at 10:48:17PM +0800, Jun Nie wrote:
> Jun Nie <jun.nie@linaro.org> 于2025年9月18日周四 21:30写道：
> >
> > The content of every half of screen is sent out via one interface in
> > dual-DSI case. The content for every interface is blended by a LM
> > pair in quad-pipe case, thus a LM pair should not blend any content
> > that cross the half of screen in this case. Clip plane into pipes per
> > left and right half screen ROI if topology is quad pipe case.
> >
> > The clipped rectangle on every half of screen is futher handled by two
> > pipes if its width exceeds a limit for a single pipe.
> >
> > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > Reviewed-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> > ---
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  |  11 +++
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h  |   2 +
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 137 +++++++++++++++++++++---------
> >  3 files changed, 110 insertions(+), 40 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > index d825eb8e40ae8bd456ede6269951339e3053d0d3..e925d93b38feac0594d735fdc2c5b9fd5ae83e6a 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > @@ -1604,6 +1604,17 @@ int dpu_crtc_vblank(struct drm_crtc *crtc, bool en)
> >         return 0;
> >  }
> >
> > +/**
> > + * dpu_crtc_get_num_lm - Get mixer number in this CRTC pipeline
> > + * @state: Pointer to drm crtc state object
> > + */
> > +unsigned int dpu_crtc_get_num_lm(const struct drm_crtc_state *state)
> > +{
> > +       struct dpu_crtc_state *cstate = to_dpu_crtc_state(state);
> > +
> > +       return cstate->num_mixers;
> > +}
> > +
> >  #ifdef CONFIG_DEBUG_FS
> >  static int _dpu_debugfs_status_show(struct seq_file *s, void *data)
> >  {
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> > index 94392b9b924546f96e738ae20920cf9afd568e6b..6eaba5696e8e6bd1246a9895c4c8714ca6589b10 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> > @@ -267,4 +267,6 @@ static inline enum dpu_crtc_client_type dpu_crtc_get_client_type(
> >
> >  void dpu_crtc_frame_event_cb(struct drm_crtc *crtc, u32 event);
> >
> > +unsigned int dpu_crtc_get_num_lm(const struct drm_crtc_state *state);
> > +
> >  #endif /* _DPU_CRTC_H_ */
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > index 5ae58352cbee1251a0140879f04fc7c304cae674..89a5feb6308bcac537562c3dc4e61c16c92e460c 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > @@ -824,8 +824,12 @@ static int dpu_plane_atomic_check_nosspp(struct drm_plane *plane,
> >         struct dpu_plane_state *pstate = to_dpu_plane_state(new_plane_state);
> >         struct dpu_sw_pipe_cfg *pipe_cfg;
> >         struct dpu_sw_pipe_cfg *r_pipe_cfg;
> > +       struct dpu_sw_pipe_cfg init_pipe_cfg;
> >         struct drm_rect fb_rect = { 0 };
> > +       const struct drm_display_mode *mode = &crtc_state->adjusted_mode;
> >         uint32_t max_linewidth;
> > +       u32 num_lm;
> > +       int stage_id, num_stages;
> >
> >         min_scale = FRAC_16_16(1, MAX_UPSCALE_RATIO);
> >         max_scale = MAX_DOWNSCALE_RATIO << 16;
> > @@ -848,13 +852,10 @@ static int dpu_plane_atomic_check_nosspp(struct drm_plane *plane,
> >                 return -EINVAL;
> >         }
> >
> > -       /* move the assignment here, to ease handling to another pairs later */
> > -       pipe_cfg = &pstate->pipe_cfg[0];
> > -       r_pipe_cfg = &pstate->pipe_cfg[1];
> > -       /* state->src is 16.16, src_rect is not */
> > -       drm_rect_fp_to_int(&pipe_cfg->src_rect, &new_plane_state->src);
> > +       num_lm = dpu_crtc_get_num_lm(crtc_state);
> >
> > -       pipe_cfg->dst_rect = new_plane_state->dst;
> > +       /* state->src is 16.16, src_rect is not */
> > +       drm_rect_fp_to_int(&init_pipe_cfg.src_rect, &new_plane_state->src);
> >
> >         fb_rect.x2 = new_plane_state->fb->width;
> >         fb_rect.y2 = new_plane_state->fb->height;
> > @@ -879,35 +880,94 @@ static int dpu_plane_atomic_check_nosspp(struct drm_plane *plane,
> >
> >         max_linewidth = pdpu->catalog->caps->max_linewidth;
> >
> > -       drm_rect_rotate(&pipe_cfg->src_rect,
> > +       drm_rect_rotate(&init_pipe_cfg.src_rect,
> >                         new_plane_state->fb->width, new_plane_state->fb->height,
> >                         new_plane_state->rotation);
> >
> > -       if ((drm_rect_width(&pipe_cfg->src_rect) > max_linewidth) ||
> > -            _dpu_plane_calc_clk(&crtc_state->adjusted_mode, pipe_cfg) > max_mdp_clk_rate) {
> > -               if (drm_rect_width(&pipe_cfg->src_rect) > 2 * max_linewidth) {
> > -                       DPU_DEBUG_PLANE(pdpu, "invalid src " DRM_RECT_FMT " line:%u\n",
> > -                                       DRM_RECT_ARG(&pipe_cfg->src_rect), max_linewidth);
> > -                       return -E2BIG;
> > +       /*
> > +        * We have 1 mixer pair cfg for 1:1:1 and 2:2:1 topology, 2 mixer pair
> > +        * configs for left and right half screen in case of 4:4:2 topology.
> > +        * But we may have 2 rect to split wide plane that exceeds limit with 1
> > +        * config for 2:2:1. So need to handle both wide plane splitting, and
> > +        * two halves of screen splitting for quad-pipe case. Check dest
> > +        * rectangle left/right clipping first, then check wide rectangle
> > +        * splitting in every half next.
> > +        */
> > +       num_stages = (num_lm + 1) / 2;
> 
> Hi Dmitry,
> Because the plane is checked before crtc is checked in the drm framework. While
> the topology is decided in crtc check. Thus num_lm is 0 when this function is
> called for the first time. As a result, the below iteration is not run
> at all and leads
>  to iommu warning.

How does it lead to IOMMU warnings?

> Do you suggest to change drm framework with adding extra crtc check before
> plane check, or you prefer the below line here?
> 
> num_stages = max(1, (num_lm + 1) / 2);

DRM framework provides enough hooks to be able to influence the order or
operations without changing the framework. But, I'd like to point out
that for the virtual plane case we already perform plane operations
from dpu_crtc_atomic_check(). You can employ the same approach.


-- 
With best wishes
Dmitry
