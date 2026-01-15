Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C20BD23C13
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jan 2026 10:57:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B114210E72A;
	Thu, 15 Jan 2026 09:57:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="U9BFTFHA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com
 [74.125.224.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C50A10E1BA
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 09:57:13 +0000 (UTC)
Received: by mail-yx1-f46.google.com with SMTP id
 956f58d0204a3-6466d8fd383so632789d50.2
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 01:57:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1768471032; x=1769075832; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+ZQ01fdUTk2fmkDZbOMCCfMvQv0D+Gvt+c54zKAvLrA=;
 b=U9BFTFHAOCIiuJwzRsSXxsl3PGZsAVzlZ/N9xwEsr1vT+rtvpiSPE20ES6JXCH3UqI
 t/8pVnnu8lBvDmuKiKqL3Jk/SbROU7d+1MxUZSOxXWGdr+wuWaFrwCPRgDbOz5BZs1xH
 VWMNXLaq0hfLREbERYcyYC7lm0T4PvM6wbs2gunvcwlivXljZXBbbR0tPBeKScZSsvZv
 72uJmSNFv67yyiaLRb8mmfh47+N9TMOEFg3KGeyW9zC5B1g/LLS9SD0WFhnMv62YQDsQ
 6Y5qxqip9VHz7sF0/9cwPnLtFLazKs93OAZ38fY2wEUgKIQfUJxPR2HkPWb/RfGN52Mx
 BjRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768471032; x=1769075832;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=+ZQ01fdUTk2fmkDZbOMCCfMvQv0D+Gvt+c54zKAvLrA=;
 b=CcdkS5aDPvfltZOBwaOEgtA968pdHc4wjrg7J3QUezkl0Z8ZH7p7Rod3F/NSFAzKBa
 Bhk9+3DFWl4fNYu/j17Dg9/hy7wOzuzldIwVRmXGk04Z7lx7dDh5XHRMH0Bv4OepIfQs
 QNB0nKEUIqKE8xU4oFUTQseGnCLHLG0Zt9Cyv1r79/0eUNrbTTOxGrGWDnuRdhphYVz8
 LU+GQXGUjXupwwEPtGllQWUXHce3CJBG5B8nZ8BuomtGFOIcqYR64vKQ4cVdNzj55zmZ
 0M+KBWubG9Mr3HDd9nS/qlhfuPBByboTfwM3Rh2E8KlUIvHW44pUm+cnh2Nj+nn6jHFX
 BVow==
X-Forwarded-Encrypted: i=1;
 AJvYcCXIaPwBCjm6eiuBbRdLrBWYGCHThU/w3Jtyu78hg9x8vXaFrYKRadHyrzspT6LiikXejRJO0YD5DKE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxd5P+gK0YJLG6QN9d71U00OcB4hKkxGSlXXeopIo66db5wRBkf
 LIk63zPrnbQruTlicD+xizEe4QaDSZEQFRGh9tdh6Yqtmf9K/UgU8c5i06uHY2gbbqhfb/0Qw9S
 sVWgzf4k85XQEtYq0T49M/zt4ajdsAwfAnyMmqd299w==
X-Gm-Gg: AY/fxX4F3iVzqAHSb+cWikUR2/BrBvO8vvO0W2Vd0+G73sYezsSCZbHYfnIGzMRtDpm
 HwnNbnkp2rcdzeHMTTC/cEhUe/ePt+H/V4Eq7TrOLM1ohPYxJeiAzur94C864uSO2CL+Xpom+Zq
 EvkWQ9kT57kQaak+5zY0+nDZC0Ul/netrWRUj0kAOJRW48SmlzFt1dsxKIVApR6ZpvtmYGilriq
 A8SFAxd003TAvGn+hJ7Q7ti3Z0UpJLjuroCRsv0TwrIt6CMY7pGlNrf8VD5y4JHkv4a6DEtsnv2
 gfT44RLxxrxnPg==
X-Received: by 2002:a05:690e:1347:b0:645:68e5:11e0 with SMTP id
 956f58d0204a3-64901aac8femr4092547d50.17.1768471032031; Thu, 15 Jan 2026
 01:57:12 -0800 (PST)
MIME-Version: 1.0
References: <20250918-v6-16-rc2-quad-pipe-upstream-4-v16-0-ff6232e3472f@linaro.org>
 <20250918-v6-16-rc2-quad-pipe-upstream-4-v16-9-ff6232e3472f@linaro.org>
 <CABymUCNY9uo0Cm0KgM9yChuxJ22=Y-4JjHj7cEh5ByX8Nr3y-w@mail.gmail.com>
 <nvd4eksgcmeqlfwp4jc27fpuzi6otdhzcefdbmj7a2xgv2bqwr@r6rytxs7ibj3>
 <CABymUCP2yAQptCGCBX0X75iRSkKkfctiEaxUH7_eOpspR55_Kg@mail.gmail.com>
 <uh75cutkn4opgjbwebpqvhq4xfzep3jnsblaevpgs3gchg264k@gzgydmui2653>
In-Reply-To: <uh75cutkn4opgjbwebpqvhq4xfzep3jnsblaevpgs3gchg264k@gzgydmui2653>
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 15 Jan 2026 17:57:01 +0800
X-Gm-Features: AZwV_Qid3ja3M6W6SXReUsE8sDOy9w9iUzK8QhY5bPYw03bdOSvzpKMh6Ko5g5E
Message-ID: <CABymUCPkfYHhtxEqN7KgBPHEvYh=NRotutJ=eiLm=ZUB85t-Qw@mail.gmail.com>
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

Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> =E4=BA=8E2026=E5=B9=B4=
1=E6=9C=8815=E6=97=A5=E5=91=A8=E5=9B=9B 17:39=E5=86=99=E9=81=93=EF=BC=9A
>
> On Thu, Jan 15, 2026 at 05:34:28PM +0800, Jun Nie wrote:
> > Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> =E4=BA=8E2026=E5=
=B9=B41=E6=9C=8815=E6=97=A5=E5=91=A8=E5=9B=9B 00:12=E5=86=99=E9=81=93=EF=BC=
=9A
> > >
> > > On Wed, Jan 14, 2026 at 10:48:17PM +0800, Jun Nie wrote:
> > > > Jun Nie <jun.nie@linaro.org> =E4=BA=8E2025=E5=B9=B49=E6=9C=8818=E6=
=97=A5=E5=91=A8=E5=9B=9B 21:30=E5=86=99=E9=81=93=EF=BC=9A
> > > > >
> > > > > The content of every half of screen is sent out via one interface=
 in
> > > > > dual-DSI case. The content for every interface is blended by a LM
> > > > > pair in quad-pipe case, thus a LM pair should not blend any conte=
nt
> > > > > that cross the half of screen in this case. Clip plane into pipes=
 per
> > > > > left and right half screen ROI if topology is quad pipe case.
> > > > >
> > > > > The clipped rectangle on every half of screen is futher handled b=
y two
> > > > > pipes if its width exceeds a limit for a single pipe.
> > > > >
> > > > > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > > > > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > > Reviewed-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> > > > > ---
> > > > >  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  |  11 +++
> > > > >  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h  |   2 +
> > > > >  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 137 ++++++++++++++++=
+++++---------
> > > > >  3 files changed, 110 insertions(+), 40 deletions(-)
> > > > >
> > > > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/g=
pu/drm/msm/disp/dpu1/dpu_crtc.c
> > > > > index d825eb8e40ae8bd456ede6269951339e3053d0d3..e925d93b38feac059=
4d735fdc2c5b9fd5ae83e6a 100644
> > > > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > > > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > > > > @@ -1604,6 +1604,17 @@ int dpu_crtc_vblank(struct drm_crtc *crtc,=
 bool en)
> > > > >         return 0;
> > > > >  }
> > > > >
> > > > > +/**
> > > > > + * dpu_crtc_get_num_lm - Get mixer number in this CRTC pipeline
> > > > > + * @state: Pointer to drm crtc state object
> > > > > + */
> > > > > +unsigned int dpu_crtc_get_num_lm(const struct drm_crtc_state *st=
ate)
> > > > > +{
> > > > > +       struct dpu_crtc_state *cstate =3D to_dpu_crtc_state(state=
);
> > > > > +
> > > > > +       return cstate->num_mixers;
> > > > > +}
> > > > > +
> > > > >  #ifdef CONFIG_DEBUG_FS
> > > > >  static int _dpu_debugfs_status_show(struct seq_file *s, void *da=
ta)
> > > > >  {
> > > > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h b/drivers/g=
pu/drm/msm/disp/dpu1/dpu_crtc.h
> > > > > index 94392b9b924546f96e738ae20920cf9afd568e6b..6eaba5696e8e6bd12=
46a9895c4c8714ca6589b10 100644
> > > > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> > > > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> > > > > @@ -267,4 +267,6 @@ static inline enum dpu_crtc_client_type dpu_c=
rtc_get_client_type(
> > > > >
> > > > >  void dpu_crtc_frame_event_cb(struct drm_crtc *crtc, u32 event);
> > > > >
> > > > > +unsigned int dpu_crtc_get_num_lm(const struct drm_crtc_state *st=
ate);
> > > > > +
> > > > >  #endif /* _DPU_CRTC_H_ */
> > > > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/=
gpu/drm/msm/disp/dpu1/dpu_plane.c
> > > > > index 5ae58352cbee1251a0140879f04fc7c304cae674..89a5feb6308bcac53=
7562c3dc4e61c16c92e460c 100644
> > > > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > > > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > > > > @@ -824,8 +824,12 @@ static int dpu_plane_atomic_check_nosspp(str=
uct drm_plane *plane,
> > > > >         struct dpu_plane_state *pstate =3D to_dpu_plane_state(new=
_plane_state);
> > > > >         struct dpu_sw_pipe_cfg *pipe_cfg;
> > > > >         struct dpu_sw_pipe_cfg *r_pipe_cfg;
> > > > > +       struct dpu_sw_pipe_cfg init_pipe_cfg;
> > > > >         struct drm_rect fb_rect =3D { 0 };
> > > > > +       const struct drm_display_mode *mode =3D &crtc_state->adju=
sted_mode;
> > > > >         uint32_t max_linewidth;
> > > > > +       u32 num_lm;
> > > > > +       int stage_id, num_stages;
> > > > >
> > > > >         min_scale =3D FRAC_16_16(1, MAX_UPSCALE_RATIO);
> > > > >         max_scale =3D MAX_DOWNSCALE_RATIO << 16;
> > > > > @@ -848,13 +852,10 @@ static int dpu_plane_atomic_check_nosspp(st=
ruct drm_plane *plane,
> > > > >                 return -EINVAL;
> > > > >         }
> > > > >
> > > > > -       /* move the assignment here, to ease handling to another =
pairs later */
> > > > > -       pipe_cfg =3D &pstate->pipe_cfg[0];
> > > > > -       r_pipe_cfg =3D &pstate->pipe_cfg[1];
> > > > > -       /* state->src is 16.16, src_rect is not */
> > > > > -       drm_rect_fp_to_int(&pipe_cfg->src_rect, &new_plane_state-=
>src);
> > > > > +       num_lm =3D dpu_crtc_get_num_lm(crtc_state);
> > > > >
> > > > > -       pipe_cfg->dst_rect =3D new_plane_state->dst;
> > > > > +       /* state->src is 16.16, src_rect is not */
> > > > > +       drm_rect_fp_to_int(&init_pipe_cfg.src_rect, &new_plane_st=
ate->src);
> > > > >
> > > > >         fb_rect.x2 =3D new_plane_state->fb->width;
> > > > >         fb_rect.y2 =3D new_plane_state->fb->height;
> > > > > @@ -879,35 +880,94 @@ static int dpu_plane_atomic_check_nosspp(st=
ruct drm_plane *plane,
> > > > >
> > > > >         max_linewidth =3D pdpu->catalog->caps->max_linewidth;
> > > > >
> > > > > -       drm_rect_rotate(&pipe_cfg->src_rect,
> > > > > +       drm_rect_rotate(&init_pipe_cfg.src_rect,
> > > > >                         new_plane_state->fb->width, new_plane_sta=
te->fb->height,
> > > > >                         new_plane_state->rotation);
> > > > >
> > > > > -       if ((drm_rect_width(&pipe_cfg->src_rect) > max_linewidth)=
 ||
> > > > > -            _dpu_plane_calc_clk(&crtc_state->adjusted_mode, pipe=
_cfg) > max_mdp_clk_rate) {
> > > > > -               if (drm_rect_width(&pipe_cfg->src_rect) > 2 * max=
_linewidth) {
> > > > > -                       DPU_DEBUG_PLANE(pdpu, "invalid src " DRM_=
RECT_FMT " line:%u\n",
> > > > > -                                       DRM_RECT_ARG(&pipe_cfg->s=
rc_rect), max_linewidth);
> > > > > -                       return -E2BIG;
> > > > > +       /*
> > > > > +        * We have 1 mixer pair cfg for 1:1:1 and 2:2:1 topology,=
 2 mixer pair
> > > > > +        * configs for left and right half screen in case of 4:4:=
2 topology.
> > > > > +        * But we may have 2 rect to split wide plane that exceed=
s limit with 1
> > > > > +        * config for 2:2:1. So need to handle both wide plane sp=
litting, and
> > > > > +        * two halves of screen splitting for quad-pipe case. Che=
ck dest
> > > > > +        * rectangle left/right clipping first, then check wide r=
ectangle
> > > > > +        * splitting in every half next.
> > > > > +        */
> > > > > +       num_stages =3D (num_lm + 1) / 2;
> > > >
> > > > Hi Dmitry,
> > > > Because the plane is checked before crtc is checked in the drm fram=
ework. While
> > > > the topology is decided in crtc check. Thus num_lm is 0 when this f=
unction is
> > > > called for the first time. As a result, the below iteration is not =
run
> > > > at all and leads
> > > >  to iommu warning.
> > >
> > > How does it lead to IOMMU warnings?
> >
> > Because the pipe is not configured with width/height etc when the itera=
tion is
> > skipped. I have not found the root cause so far. But per the null IOMMU=
 iova
> > value, suppose it is due to DMA buffer not being prepared when DMA is s=
tarted.
>
> I'd think, that corresponding SRC regs are either garbage or zero program=
med.

You are right in that. Sorry for my words is not accurate. I mean the
DMA buffer is not
feed to DMA engine correctly.
>
> >
> > >
> > > > Do you suggest to change drm framework with adding extra crtc check=
 before
> > > > plane check, or you prefer the below line here?
> > > >
> > > > num_stages =3D max(1, (num_lm + 1) / 2);
> > >
> > > DRM framework provides enough hooks to be able to influence the order=
 or
> > > operations without changing the framework. But, I'd like to point out
> > > that for the virtual plane case we already perform plane operations
> > > from dpu_crtc_atomic_check(). You can employ the same approach.
> >
> > Thanks for the suggestion! I see dpu_assign_plane_resources() is called
> > from crtc side, which avoids the plane splitting before topology decisi=
on.
> > To use this method, it looks like we are enabling the virtual plane by =
default.
> > Because the virtual plane differs from the traditional method only with=
 the
> > plane splitting and resource preparation. Can we just enable the virtua=
l
> > plane by default in this situation?
>
> In which situation? It is a global switch. And we need to be able to
> work with it turned off, until corresponding code is dropped.

I mean the situation that the plane SSPP allocation and related resource
preparation shall be deferred until crtc calling the plane API. In this way=
,
the traditional plane management is almost identical with the virtual
plane method. Or could you point out what shall differ for the two methods
after we deferred the preparation? Thanks!

Jun
>
> >
> > Jun
> >
> > >
> > >
> > > --
> > > With best wishes
> > > Dmitry
>
> --
> With best wishes
> Dmitry
