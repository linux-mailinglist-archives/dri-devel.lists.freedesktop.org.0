Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CE43D239FA
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jan 2026 10:39:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA5FE10E70D;
	Thu, 15 Jan 2026 09:39:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="bm+TPvTW";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d86d1C6D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 381C010E70D
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 09:39:06 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60F6fjWw2074022
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 09:39:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 sIl66dlruuXNU821cYXGzfF3YYebMAS06VChYc3I744=; b=bm+TPvTWFzSOgfOy
 h5dmypeHCJi2tyoVbWQfuJIec3ZCFrwh5DxuaMcDfK/oiRyA8tGGSrf245Roxl1l
 aP1e+jY0h9Jah68A+4uvJ+SYkl4YHdSF2o1g/s0452REzItZR0m6qzbrJjGZxUK0
 L214QYGDyGs0tQiM/RHzVsfCu/YPwHGTwlBPb8GeAtIDft2gidbNwKsCcAsybah1
 lSWQ+QWsbspCkxL3Rggm3lTnb3JlUaZwJ5F7j/iaEhAYJPtN72lXK7ySaBYxQxKQ
 F0OibpKEbv5PjqJOeDlvtCmNWKJeXGS0yacAIeslB8kkvhRn7jb58G5Uzbm4rvtc
 O8Co4g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bpjj9j0rp-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 09:39:05 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8c1cffa1f2dso487600885a.1
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 01:39:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768469943; x=1769074743;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=sIl66dlruuXNU821cYXGzfF3YYebMAS06VChYc3I744=;
 b=d86d1C6DYg/EkaXURwTTg7FfpKKLAJFkx6eR6O3TP0ts/5NXZNw2IxUVz0rY+VD9eT
 eifY0HtrSqEQwDLgSklXq3lGVN1Q2TflFbJ+gjwicXT6Dt060eOFRdcOJieTfCvb1Ee5
 Zh/nMlpqAXC0VW83JlH3DQD83vGtdt+KS2ahHhEXLNnW/wkKmbFNM3UPhmvOM0raMQmc
 5BjRs4fE1ctAEJp7LbQ7uLx+vDgqQcrt0PMRxMurNMbClZfVv25NA0vm1T412gxZw0I+
 U28+dwSQOeO3w4TxYCxYYd46dBfnA29uxBAxL7KCzH+Bkb2fOh+UDZxbVJA55QCMdC/j
 /Yaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768469943; x=1769074743;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sIl66dlruuXNU821cYXGzfF3YYebMAS06VChYc3I744=;
 b=AmDtXs298ZwOUNgcXtqIn65xoaUUjhXMAspuRtrkTW7gtb8qFWEMpp38q5K1hieFVr
 H9ObYhMqH8KLU+cNIs1JMPEtpfp4uVyUUB5kn306IRMEfYCg0iPJtwvLLgnfOZH9yizQ
 +fZJnJ12Ps0ZMfoE6qVD4bpd0AGDjTNoZRey0ghpkylHvJMC7MoUrAxNf1G8Exa/hIFv
 WEgyQxsQDbqH1m8dhWuqAgf7aKZeAcgZovdrV2500izHU295yATgWtgK0odRU7OxUoYl
 DUNsaMReO/B8gKrnjbluztjVzDcDAlKQSlx4MPXi66wgt1s1UOVAELHMZEfbLF2M8ysK
 7Wcw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUXJC30XC81wT3Q7gvlalwispH0SZcCPv13PJJ4Qb53jsMWunZbEBrB4SB0tv+PlpCBtdMcVuODWvU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwPhS8ggB5DWlTbr0brxWfGWQuzkpJmRmMsa94OC9iovnChicWd
 l8vk0OBvvmbkBpdHykFUgEStBxBB9HpUJwr2G41N5G4H201D96JzdBNppgeuxVftVgQiccCfceo
 bI2fh8POm/u/53N2OAtYk1Fsi37BQxONJbdceXtr3mw0EvyJXRHtQq4UnuQmoReSGgIrtvxg=
X-Gm-Gg: AY/fxX5QLyL7ZUt2dOxS0AOGL1CoISNOfwK2a05OJXhpNE1BFLj399uecXydNS+tX71
 1d5eLYa4fSNtPplv4zkXFXCwJ+08c4uV7eH8IDdY8wSBaDenB1MqxdQo/VmiFeFSJjbKQ3fkjEk
 PI/8AdRBVD7c+hkkqinxtLvfw8YRXSjnmR72Jzq039Wq47EKVpG7xM7m+N+W/AogPN1NtvH62sl
 jD8YnydHGnzSz8QM1OZMsdGlgGPjzv1jAzHmmekj+Dndzphdqb2x5XOkn3gRm7uvLmLNPpmD1F6
 IunvHyLDIciccjQOhITG91Tj4Qim1sUQpo861MdCSk6eEimwgNXHxQ//K6c7G/EWZYTcskNwH+D
 /2cd5NJ+79lq0YrXQBEA8YiWYj+l0Ori9Ow9VFV77gOF9mV3HytRzxLxBjSQxxEFEGQA7+Jfxf7
 UC9k8MSYdM0vE4obio8axMHfo=
X-Received: by 2002:a05:620a:2a04:b0:8b2:ea3f:2fa4 with SMTP id
 af79cd13be357-8c589b853b9mr308444885a.6.1768469943034; 
 Thu, 15 Jan 2026 01:39:03 -0800 (PST)
X-Received: by 2002:a05:620a:2a04:b0:8b2:ea3f:2fa4 with SMTP id
 af79cd13be357-8c589b853b9mr308442885a.6.1768469942520; 
 Thu, 15 Jan 2026 01:39:02 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59ba9e32e12sm529060e87.27.2026.01.15.01.39.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jan 2026 01:39:01 -0800 (PST)
Date: Thu, 15 Jan 2026 11:38:59 +0200
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
Message-ID: <uh75cutkn4opgjbwebpqvhq4xfzep3jnsblaevpgs3gchg264k@gzgydmui2653>
References: <20250918-v6-16-rc2-quad-pipe-upstream-4-v16-0-ff6232e3472f@linaro.org>
 <20250918-v6-16-rc2-quad-pipe-upstream-4-v16-9-ff6232e3472f@linaro.org>
 <CABymUCNY9uo0Cm0KgM9yChuxJ22=Y-4JjHj7cEh5ByX8Nr3y-w@mail.gmail.com>
 <nvd4eksgcmeqlfwp4jc27fpuzi6otdhzcefdbmj7a2xgv2bqwr@r6rytxs7ibj3>
 <CABymUCP2yAQptCGCBX0X75iRSkKkfctiEaxUH7_eOpspR55_Kg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABymUCP2yAQptCGCBX0X75iRSkKkfctiEaxUH7_eOpspR55_Kg@mail.gmail.com>
X-Proofpoint-ORIG-GUID: CnmlLMureBRF-1XqclDegs_vIA_DkWxS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDA2OCBTYWx0ZWRfXwbPS1ewX1dUi
 l+FJPnf85IvGvYiDsX4A0j1FROrI1xkpagBtA7XuOA7Tgy2LCYz8AYoXh8rhZArWRe7tnzGaAa7
 YFmz6GlJE6622L0vzjRzI+A15CWmn4sh4CRXITxH8Qegfdt8Modcf3yfOnGwf7olyFnRPewJ3vg
 ixNv0Owz6Lmo1XFI9BwiPDF5MVlzPQez6BnVnZ0ASkcFkg20BQ7c9okPbs4upPuJ4j2MSbP+4Be
 26Rgr0qtnXRMVeuEjty8gH6Fw4iG20PrK8c+QhrtH4dnjI34ZuRyv5URHByHDzqTJIcP0WJVFIe
 Pd6BA8J4nNGQGUmsPeySlpIfzhy7ACq10LYCGGy/o2Z7TyLGKJc6i/tOmsVCmorIbwyiYypSX2e
 NqW2UQl4HMUP3me2aBjUTj5sgqi0LhIcqSG0mWpJqY8mCD2pb8uZJwCiaJbv7sxrTIvU7oaa3+c
 kbZCni7B/7+zNa6S32A==
X-Authority-Analysis: v=2.4 cv=dcCNHHXe c=1 sm=1 tr=0 ts=6968b5b9 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=sWKEhP36mHoA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=49zKgsZv9mWLMjEby-4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: CnmlLMureBRF-1XqclDegs_vIA_DkWxS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_03,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 phishscore=0 clxscore=1015 impostorscore=0
 adultscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601150068
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

On Thu, Jan 15, 2026 at 05:34:28PM +0800, Jun Nie wrote:
> Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> 于2026年1月15日周四 00:12写道：
> >
> > On Wed, Jan 14, 2026 at 10:48:17PM +0800, Jun Nie wrote:
> > > Jun Nie <jun.nie@linaro.org> 于2025年9月18日周四 21:30写道：
> > > >
> > > > The content of every half of screen is sent out via one interface in
> > > > dual-DSI case. The content for every interface is blended by a LM
> > > > pair in quad-pipe case, thus a LM pair should not blend any content
> > > > that cross the half of screen in this case. Clip plane into pipes per
> > > > left and right half screen ROI if topology is quad pipe case.
> > > >
> > > > The clipped rectangle on every half of screen is futher handled by two
> > > > pipes if its width exceeds a limit for a single pipe.
> > > >
> > > > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > > > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > Reviewed-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> > > > ---
> > > >  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  |  11 +++
> > > >  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h  |   2 +
> > > >  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 137 +++++++++++++++++++++---------
> > > >  3 files changed, 110 insertions(+), 40 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > > > index d825eb8e40ae8bd456ede6269951339e3053d0d3..e925d93b38feac0594d735fdc2c5b9fd5ae83e6a 100644
> > > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > > > @@ -1604,6 +1604,17 @@ int dpu_crtc_vblank(struct drm_crtc *crtc, bool en)
> > > >         return 0;
> > > >  }
> > > >
> > > > +/**
> > > > + * dpu_crtc_get_num_lm - Get mixer number in this CRTC pipeline
> > > > + * @state: Pointer to drm crtc state object
> > > > + */
> > > > +unsigned int dpu_crtc_get_num_lm(const struct drm_crtc_state *state)
> > > > +{
> > > > +       struct dpu_crtc_state *cstate = to_dpu_crtc_state(state);
> > > > +
> > > > +       return cstate->num_mixers;
> > > > +}
> > > > +
> > > >  #ifdef CONFIG_DEBUG_FS
> > > >  static int _dpu_debugfs_status_show(struct seq_file *s, void *data)
> > > >  {
> > > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> > > > index 94392b9b924546f96e738ae20920cf9afd568e6b..6eaba5696e8e6bd1246a9895c4c8714ca6589b10 100644
> > > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> > > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> > > > @@ -267,4 +267,6 @@ static inline enum dpu_crtc_client_type dpu_crtc_get_client_type(
> > > >
> > > >  void dpu_crtc_frame_event_cb(struct drm_crtc *crtc, u32 event);
> > > >
> > > > +unsigned int dpu_crtc_get_num_lm(const struct drm_crtc_state *state);
> > > > +
> > > >  #endif /* _DPU_CRTC_H_ */
> > > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > > > index 5ae58352cbee1251a0140879f04fc7c304cae674..89a5feb6308bcac537562c3dc4e61c16c92e460c 100644
> > > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > > > @@ -824,8 +824,12 @@ static int dpu_plane_atomic_check_nosspp(struct drm_plane *plane,
> > > >         struct dpu_plane_state *pstate = to_dpu_plane_state(new_plane_state);
> > > >         struct dpu_sw_pipe_cfg *pipe_cfg;
> > > >         struct dpu_sw_pipe_cfg *r_pipe_cfg;
> > > > +       struct dpu_sw_pipe_cfg init_pipe_cfg;
> > > >         struct drm_rect fb_rect = { 0 };
> > > > +       const struct drm_display_mode *mode = &crtc_state->adjusted_mode;
> > > >         uint32_t max_linewidth;
> > > > +       u32 num_lm;
> > > > +       int stage_id, num_stages;
> > > >
> > > >         min_scale = FRAC_16_16(1, MAX_UPSCALE_RATIO);
> > > >         max_scale = MAX_DOWNSCALE_RATIO << 16;
> > > > @@ -848,13 +852,10 @@ static int dpu_plane_atomic_check_nosspp(struct drm_plane *plane,
> > > >                 return -EINVAL;
> > > >         }
> > > >
> > > > -       /* move the assignment here, to ease handling to another pairs later */
> > > > -       pipe_cfg = &pstate->pipe_cfg[0];
> > > > -       r_pipe_cfg = &pstate->pipe_cfg[1];
> > > > -       /* state->src is 16.16, src_rect is not */
> > > > -       drm_rect_fp_to_int(&pipe_cfg->src_rect, &new_plane_state->src);
> > > > +       num_lm = dpu_crtc_get_num_lm(crtc_state);
> > > >
> > > > -       pipe_cfg->dst_rect = new_plane_state->dst;
> > > > +       /* state->src is 16.16, src_rect is not */
> > > > +       drm_rect_fp_to_int(&init_pipe_cfg.src_rect, &new_plane_state->src);
> > > >
> > > >         fb_rect.x2 = new_plane_state->fb->width;
> > > >         fb_rect.y2 = new_plane_state->fb->height;
> > > > @@ -879,35 +880,94 @@ static int dpu_plane_atomic_check_nosspp(struct drm_plane *plane,
> > > >
> > > >         max_linewidth = pdpu->catalog->caps->max_linewidth;
> > > >
> > > > -       drm_rect_rotate(&pipe_cfg->src_rect,
> > > > +       drm_rect_rotate(&init_pipe_cfg.src_rect,
> > > >                         new_plane_state->fb->width, new_plane_state->fb->height,
> > > >                         new_plane_state->rotation);
> > > >
> > > > -       if ((drm_rect_width(&pipe_cfg->src_rect) > max_linewidth) ||
> > > > -            _dpu_plane_calc_clk(&crtc_state->adjusted_mode, pipe_cfg) > max_mdp_clk_rate) {
> > > > -               if (drm_rect_width(&pipe_cfg->src_rect) > 2 * max_linewidth) {
> > > > -                       DPU_DEBUG_PLANE(pdpu, "invalid src " DRM_RECT_FMT " line:%u\n",
> > > > -                                       DRM_RECT_ARG(&pipe_cfg->src_rect), max_linewidth);
> > > > -                       return -E2BIG;
> > > > +       /*
> > > > +        * We have 1 mixer pair cfg for 1:1:1 and 2:2:1 topology, 2 mixer pair
> > > > +        * configs for left and right half screen in case of 4:4:2 topology.
> > > > +        * But we may have 2 rect to split wide plane that exceeds limit with 1
> > > > +        * config for 2:2:1. So need to handle both wide plane splitting, and
> > > > +        * two halves of screen splitting for quad-pipe case. Check dest
> > > > +        * rectangle left/right clipping first, then check wide rectangle
> > > > +        * splitting in every half next.
> > > > +        */
> > > > +       num_stages = (num_lm + 1) / 2;
> > >
> > > Hi Dmitry,
> > > Because the plane is checked before crtc is checked in the drm framework. While
> > > the topology is decided in crtc check. Thus num_lm is 0 when this function is
> > > called for the first time. As a result, the below iteration is not run
> > > at all and leads
> > >  to iommu warning.
> >
> > How does it lead to IOMMU warnings?
> 
> Because the pipe is not configured with width/height etc when the iteration is
> skipped. I have not found the root cause so far. But per the null IOMMU iova
> value, suppose it is due to DMA buffer not being prepared when DMA is started.

I'd think, that corresponding SRC regs are either garbage or zero programmed.

> 
> >
> > > Do you suggest to change drm framework with adding extra crtc check before
> > > plane check, or you prefer the below line here?
> > >
> > > num_stages = max(1, (num_lm + 1) / 2);
> >
> > DRM framework provides enough hooks to be able to influence the order or
> > operations without changing the framework. But, I'd like to point out
> > that for the virtual plane case we already perform plane operations
> > from dpu_crtc_atomic_check(). You can employ the same approach.
> 
> Thanks for the suggestion! I see dpu_assign_plane_resources() is called
> from crtc side, which avoids the plane splitting before topology decision.
> To use this method, it looks like we are enabling the virtual plane by default.
> Because the virtual plane differs from the traditional method only with the
> plane splitting and resource preparation. Can we just enable the virtual
> plane by default in this situation?

In which situation? It is a global switch. And we need to be able to
work with it turned off, until corresponding code is dropped.

> 
> Jun
> 
> >
> >
> > --
> > With best wishes
> > Dmitry

-- 
With best wishes
Dmitry
