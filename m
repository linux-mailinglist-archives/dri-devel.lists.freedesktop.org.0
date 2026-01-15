Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66B2CD23D76
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jan 2026 11:10:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5E0710E733;
	Thu, 15 Jan 2026 10:10:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="YHLU/2MH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com
 [74.125.224.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FC9A10E733
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 10:10:49 +0000 (UTC)
Received: by mail-yx1-f41.google.com with SMTP id
 956f58d0204a3-6420c0cf4abso544536d50.1
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 02:10:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1768471848; x=1769076648; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Rkv8ikQUARN/N/Kkx850hQ4m0bkxMdUFAMwwE3tHVbI=;
 b=YHLU/2MHE+jCASL0Sjk8Nc7jlxMruXcByWRrI3nIl/+JL+ymVzz21bXDHFM+tIiDI0
 0XNK0oAt+eFJ4KN+y6LCUYgmBJxTkAv4fE7Q2V6sxcDaKJ8rFfCtv83TQz6KN8D8nTbk
 mUzM0u7Rha6Nyq976B2g7TIj+INZyJNM4SaQviQaP9FOK6mGhyWSeuRKic6DnPNcoXd8
 J873HNAsyF+zB1ZmOMetX3bU1qoV+lD70V3LCc1hHv0MIz19RPbx0OKoR/zqUyUC4gBL
 dp9iL2PsTwdBxegkalsBXXXavEnb6UMU64MSqz5i+O1V8rTiW8Vdk/Wh4J7qtm/PMo/M
 3VGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768471848; x=1769076648;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Rkv8ikQUARN/N/Kkx850hQ4m0bkxMdUFAMwwE3tHVbI=;
 b=o2GkqAyKZ1Q3nMCGVLWTAzEOjT+VLVRFKnGBYm5xoaSAjRLeohaP4pI2Y4LZOrsLrb
 6AIrxn7fY0szd3nS4ZG5qFUCZmm/++ihW1Ht0/UNJbaCy7tDhXTL9dZbKWfoGKnDHF9y
 2Q1ZE2Qdy6b8sh+piCKP5VlVabcuiK5rBPSNaiWv3glaXzGs98BCZlksNZT87Sig662+
 NwiN/9ynUlguLkNVSqHUtBJucDwqgmL9o1xjFqQh8BMe48+1+sWEbooHw89HwLCoLb1X
 a1jiRgoXhHS7aKRqSuwzpasRTvE9WeadeANzm+HNut5NnyF7ldciudWZ2v+Jvlo4+Y4g
 jzOw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUKxe7eIHg+EtcpK+YpyZ84q8ZfVS2BVNTpw68S06Q4p6LMcpDSM3DKMNz9NiPIb8I7v433Lw0tsg8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx7G43Zbq1YH7cOhaRjJh3GhPG1WgTw7OP9wbL1R6wrEploEBGS
 PqpvxjIR/ciWbC9oZpq7bSKZdyreRc9WlJWza49u4lv01IE5U53Tgxs9fxeNOK1ujh4ajoln3VY
 /FdJhOtBgGy+RRIa381g4XiWwB+audD2jU1LGf/+QPw==
X-Gm-Gg: AY/fxX4+9UVDnvSReRJOsE8U19HWex6QjVPVr0UHblZk39LS1iBGDyVTxFTfqt9MEEO
 v7RSutw+cqho3SPXrAoqsCAwTHmM0XWDUWTM6Dkr8100vPt4DQ/9XBoZas5c2S4APqLKXy+YZzn
 TqHzn9oW0DNZAKtCQeIx9BTnJGGxwO/G2LpZWp3XUd8MeEn1E7ftcXWNauU/FRM0z+l36xqm7k9
 V8tEuvGNGjNy8zqb92DaADbutmitbvpg4dmEO4Yn+/0XLZ4/Zu+X5f3ipmpcLUNy3M4ddGO+xta
 LA4=
X-Received: by 2002:a05:690e:1898:b0:63f:b366:98c9 with SMTP id
 956f58d0204a3-64903b45c7fmr3328872d50.46.1768471848192; Thu, 15 Jan 2026
 02:10:48 -0800 (PST)
MIME-Version: 1.0
References: <20250918-v6-16-rc2-quad-pipe-upstream-4-v16-0-ff6232e3472f@linaro.org>
 <20250918-v6-16-rc2-quad-pipe-upstream-4-v16-9-ff6232e3472f@linaro.org>
 <CABymUCNY9uo0Cm0KgM9yChuxJ22=Y-4JjHj7cEh5ByX8Nr3y-w@mail.gmail.com>
 <nvd4eksgcmeqlfwp4jc27fpuzi6otdhzcefdbmj7a2xgv2bqwr@r6rytxs7ibj3>
 <CABymUCP2yAQptCGCBX0X75iRSkKkfctiEaxUH7_eOpspR55_Kg@mail.gmail.com>
 <uh75cutkn4opgjbwebpqvhq4xfzep3jnsblaevpgs3gchg264k@gzgydmui2653>
 <CABymUCPkfYHhtxEqN7KgBPHEvYh=NRotutJ=eiLm=ZUB85t-Qw@mail.gmail.com>
In-Reply-To: <CABymUCPkfYHhtxEqN7KgBPHEvYh=NRotutJ=eiLm=ZUB85t-Qw@mail.gmail.com>
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 15 Jan 2026 18:10:36 +0800
X-Gm-Features: AZwV_QgmurEtZGqCC-J87iEhyC8ARZYKkLKMsRCGKhZjRYi4rTUDAlAEEHYZ7nE
Message-ID: <CABymUCM_KAAunMSUSXXUWMy45y4yTv4iV5WGo4DG-xv=ExMahA@mail.gmail.com>
Subject: Re: [PATCH v16 09/10] drm/msm/dpu: support plane splitting in
 quad-pipe case
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>,
 Dmitry Baryshkov <lumag@kernel.org>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Jun Nie <jun.nie@linaro.org> =E4=BA=8E2026=E5=B9=B41=E6=9C=8815=E6=97=A5=E5=
=91=A8=E5=9B=9B 17:57=E5=86=99=E9=81=93=EF=BC=9A
>
> Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> =E4=BA=8E2026=E5=B9=
=B41=E6=9C=8815=E6=97=A5=E5=91=A8=E5=9B=9B 17:39=E5=86=99=E9=81=93=EF=BC=9A
> >
> > On Thu, Jan 15, 2026 at 05:34:28PM +0800, Jun Nie wrote:
> > > Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> =E4=BA=8E2026=E5=
=B9=B41=E6=9C=8815=E6=97=A5=E5=91=A8=E5=9B=9B 00:12=E5=86=99=E9=81=93=EF=BC=
=9A
> > > >
> > > > On Wed, Jan 14, 2026 at 10:48:17PM +0800, Jun Nie wrote:
> > > > > Jun Nie <jun.nie@linaro.org> =E4=BA=8E2025=E5=B9=B49=E6=9C=8818=
=E6=97=A5=E5=91=A8=E5=9B=9B 21:30=E5=86=99=E9=81=93=EF=BC=9A
> > > > > >
> > > > > > The content of every half of screen is sent out via one interfa=
ce in
> > > > > > dual-DSI case. The content for every interface is blended by a =
LM
> > > > > > pair in quad-pipe case, thus a LM pair should not blend any con=
tent
> > > > > > that cross the half of screen in this case. Clip plane into pip=
es per
> > > > > > left and right half screen ROI if topology is quad pipe case.
> > > > > >
> > > > > > The clipped rectangle on every half of screen is futher handled=
 by two
> > > > > > pipes if its width exceeds a limit for a single pipe.
> > > > > >
> > > > > > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > > > > > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > > > Reviewed-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> > > > > > ---
> > > > > >  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  |  11 +++
> > > > > >  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h  |   2 +
> > > > > >  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 137 ++++++++++++++=
+++++++---------
> > > > > >  3 files changed, 110 insertions(+), 40 deletions(-)
> > > > > >
> > > > > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers=
/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > > > > > index d825eb8e40ae8bd456ede6269951339e3053d0d3..e925d93b38feac0=
594d735fdc2c5b9fd5ae83e6a 100644
> > > > > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > > > > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > > > > > @@ -1604,6 +1604,17 @@ int dpu_crtc_vblank(struct drm_crtc *crt=
c, bool en)
> > > > > >         return 0;
> > > > > >  }
> > > > > >
> > > > > > +/**
> > > > > > + * dpu_crtc_get_num_lm - Get mixer number in this CRTC pipelin=
e
> > > > > > + * @state: Pointer to drm crtc state object
> > > > > > + */
> > > > > > +unsigned int dpu_crtc_get_num_lm(const struct drm_crtc_state *=
state)
> > > > > > +{
> > > > > > +       struct dpu_crtc_state *cstate =3D to_dpu_crtc_state(sta=
te);
> > > > > > +
> > > > > > +       return cstate->num_mixers;
> > > > > > +}
> > > > > > +
> > > > > >  #ifdef CONFIG_DEBUG_FS
> > > > > >  static int _dpu_debugfs_status_show(struct seq_file *s, void *=
data)
> > > > > >  {
> > > > > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h b/drivers=
/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> > > > > > index 94392b9b924546f96e738ae20920cf9afd568e6b..6eaba5696e8e6bd=
1246a9895c4c8714ca6589b10 100644
> > > > > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> > > > > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> > > > > > @@ -267,4 +267,6 @@ static inline enum dpu_crtc_client_type dpu=
_crtc_get_client_type(
> > > > > >
> > > > > >  void dpu_crtc_frame_event_cb(struct drm_crtc *crtc, u32 event)=
;
> > > > > >
> > > > > > +unsigned int dpu_crtc_get_num_lm(const struct drm_crtc_state *=
state);
> > > > > > +
> > > > > >  #endif /* _DPU_CRTC_H_ */
> > > > > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/driver=
s/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > > > > > index 5ae58352cbee1251a0140879f04fc7c304cae674..89a5feb6308bcac=
537562c3dc4e61c16c92e460c 100644
> > > > > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > > > > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > > > > > @@ -824,8 +824,12 @@ static int dpu_plane_atomic_check_nosspp(s=
truct drm_plane *plane,
> > > > > >         struct dpu_plane_state *pstate =3D to_dpu_plane_state(n=
ew_plane_state);
> > > > > >         struct dpu_sw_pipe_cfg *pipe_cfg;
> > > > > >         struct dpu_sw_pipe_cfg *r_pipe_cfg;
> > > > > > +       struct dpu_sw_pipe_cfg init_pipe_cfg;
> > > > > >         struct drm_rect fb_rect =3D { 0 };
> > > > > > +       const struct drm_display_mode *mode =3D &crtc_state->ad=
justed_mode;
> > > > > >         uint32_t max_linewidth;
> > > > > > +       u32 num_lm;
> > > > > > +       int stage_id, num_stages;
> > > > > >
> > > > > >         min_scale =3D FRAC_16_16(1, MAX_UPSCALE_RATIO);
> > > > > >         max_scale =3D MAX_DOWNSCALE_RATIO << 16;
> > > > > > @@ -848,13 +852,10 @@ static int dpu_plane_atomic_check_nosspp(=
struct drm_plane *plane,
> > > > > >                 return -EINVAL;
> > > > > >         }
> > > > > >
> > > > > > -       /* move the assignment here, to ease handling to anothe=
r pairs later */
> > > > > > -       pipe_cfg =3D &pstate->pipe_cfg[0];
> > > > > > -       r_pipe_cfg =3D &pstate->pipe_cfg[1];
> > > > > > -       /* state->src is 16.16, src_rect is not */
> > > > > > -       drm_rect_fp_to_int(&pipe_cfg->src_rect, &new_plane_stat=
e->src);
> > > > > > +       num_lm =3D dpu_crtc_get_num_lm(crtc_state);
> > > > > >
> > > > > > -       pipe_cfg->dst_rect =3D new_plane_state->dst;
> > > > > > +       /* state->src is 16.16, src_rect is not */
> > > > > > +       drm_rect_fp_to_int(&init_pipe_cfg.src_rect, &new_plane_=
state->src);
> > > > > >
> > > > > >         fb_rect.x2 =3D new_plane_state->fb->width;
> > > > > >         fb_rect.y2 =3D new_plane_state->fb->height;
> > > > > > @@ -879,35 +880,94 @@ static int dpu_plane_atomic_check_nosspp(=
struct drm_plane *plane,
> > > > > >
> > > > > >         max_linewidth =3D pdpu->catalog->caps->max_linewidth;
> > > > > >
> > > > > > -       drm_rect_rotate(&pipe_cfg->src_rect,
> > > > > > +       drm_rect_rotate(&init_pipe_cfg.src_rect,
> > > > > >                         new_plane_state->fb->width, new_plane_s=
tate->fb->height,
> > > > > >                         new_plane_state->rotation);
> > > > > >
> > > > > > -       if ((drm_rect_width(&pipe_cfg->src_rect) > max_linewidt=
h) ||
> > > > > > -            _dpu_plane_calc_clk(&crtc_state->adjusted_mode, pi=
pe_cfg) > max_mdp_clk_rate) {
> > > > > > -               if (drm_rect_width(&pipe_cfg->src_rect) > 2 * m=
ax_linewidth) {
> > > > > > -                       DPU_DEBUG_PLANE(pdpu, "invalid src " DR=
M_RECT_FMT " line:%u\n",
> > > > > > -                                       DRM_RECT_ARG(&pipe_cfg-=
>src_rect), max_linewidth);
> > > > > > -                       return -E2BIG;
> > > > > > +       /*
> > > > > > +        * We have 1 mixer pair cfg for 1:1:1 and 2:2:1 topolog=
y, 2 mixer pair
> > > > > > +        * configs for left and right half screen in case of 4:=
4:2 topology.
> > > > > > +        * But we may have 2 rect to split wide plane that exce=
eds limit with 1
> > > > > > +        * config for 2:2:1. So need to handle both wide plane =
splitting, and
> > > > > > +        * two halves of screen splitting for quad-pipe case. C=
heck dest
> > > > > > +        * rectangle left/right clipping first, then check wide=
 rectangle
> > > > > > +        * splitting in every half next.
> > > > > > +        */
> > > > > > +       num_stages =3D (num_lm + 1) / 2;
> > > > >
> > > > > Hi Dmitry,
> > > > > Because the plane is checked before crtc is checked in the drm fr=
amework. While
> > > > > the topology is decided in crtc check. Thus num_lm is 0 when this=
 function is
> > > > > called for the first time. As a result, the below iteration is no=
t run
> > > > > at all and leads
> > > > >  to iommu warning.
> > > >
> > > > How does it lead to IOMMU warnings?
> > >
> > > Because the pipe is not configured with width/height etc when the ite=
ration is
> > > skipped. I have not found the root cause so far. But per the null IOM=
MU iova
> > > value, suppose it is due to DMA buffer not being prepared when DMA is=
 started.
> >
> > I'd think, that corresponding SRC regs are either garbage or zero progr=
ammed.
>
> You are right in that. Sorry for my words is not accurate. I mean the
> DMA buffer is not
> feed to DMA engine correctly.
> >
> > >
> > > >
> > > > > Do you suggest to change drm framework with adding extra crtc che=
ck before
> > > > > plane check, or you prefer the below line here?
> > > > >
> > > > > num_stages =3D max(1, (num_lm + 1) / 2);
> > > >
> > > > DRM framework provides enough hooks to be able to influence the ord=
er or
> > > > operations without changing the framework. But, I'd like to point o=
ut
> > > > that for the virtual plane case we already perform plane operations
> > > > from dpu_crtc_atomic_check(). You can employ the same approach.
> > >
> > > Thanks for the suggestion! I see dpu_assign_plane_resources() is call=
ed
> > > from crtc side, which avoids the plane splitting before topology deci=
sion.
> > > To use this method, it looks like we are enabling the virtual plane b=
y default.
> > > Because the virtual plane differs from the traditional method only wi=
th the
> > > plane splitting and resource preparation. Can we just enable the virt=
ual
> > > plane by default in this situation?
> >
> > In which situation? It is a global switch. And we need to be able to
> > work with it turned off, until corresponding code is dropped.
>
> I mean the situation that the plane SSPP allocation and related resource
> preparation shall be deferred until crtc calling the plane API. In this w=
ay,
> the traditional plane management is almost identical with the virtual
> plane method. Or could you point out what shall differ for the two method=
s
> after we deferred the preparation? Thanks!

You just want to have different SSPP number limit for the 2 methods?
>
> Jun
> >
> > >
> > > Jun
> > >
> > > >
> > > >
> > > > --
> > > > With best wishes
> > > > Dmitry
> >
> > --
> > With best wishes
> > Dmitry
