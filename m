Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id Q5MnL6hikGlgZAEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 14 Feb 2026 12:55:20 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64E2013BC86
	for <lists+dri-devel@lfdr.de>; Sat, 14 Feb 2026 12:55:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56CFB10E151;
	Sat, 14 Feb 2026 11:55:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="H8xQBP9d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com
 [74.125.224.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5650910E14D
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Feb 2026 11:55:14 +0000 (UTC)
Received: by mail-yx1-f42.google.com with SMTP id
 956f58d0204a3-64aea64bf15so1693584d50.2
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Feb 2026 03:55:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771070113; cv=none;
 d=google.com; s=arc-20240605;
 b=URsmRDSAZ/PTCcXaYSror2gy6T/dpCGrfWrm6c6tDwqvZg8WGrCU6XmtsBPK+4R+by
 7fL5GQTuo9/b/IUQnVbkA/aHixTtrUf/kf9QKKKsG5hT7nxnM4x9YvrD3H03Jp6t/YQJ
 gw83wWo+BQ4tFVqQgZp4pWxw+7QfJVt2XaWYywtPNdcPCEfCO+RojKfi/IKj/1YBbbGC
 98aHONfefr+eo6MftR9tiNpJ1YCPvjdUZrIkRSLYBFOpdvbR/6wIE6N8lKqdttYFZxgk
 JtJ5M2sdOVTbgxBA5sVyVlPqFepusgwfcm1keBt5xUsfW58HmFRRu23Gq93INlbgDBAb
 bO8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=sfC50XSQItSsLfF856D24b0b0ZI/QZxB3Dst2QZCTGg=;
 fh=YthBy6mhH2DPd+MGkYoGWi08rZutKBz8xv8PtjqPlyU=;
 b=PsdBXgIEdGmXJ6D9Ppntz7Mbg9U4L16aec85/8EN+SwD8oSytMNtwvHOTrFn143klC
 FUc+E1kPYIMs9BwG6T4qO7dxeFE+gy7ul00b8RKHH5/IkxvLBiBb23KUpP6gKHlpF3WF
 csni6K+X2ghiBZnU3mst0snhJqXyQ1g8I7ufumMmfhzsz5tT7ErGkAT5PhJGdNBn1EbW
 gAHI6SuPyEcz3GGVBxvjtj4Ob8wcqL5rSF2IuNjEj0nNYBrOfMjtKBEoxfppYV+fCGq3
 U2kTv5Ze6FZjkLKbUobuPbXYgkUwIU5IUq+dWfyxDT7P83vnG/c3IWfGuHkSE0H3ENvJ
 0++w==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1771070113; x=1771674913; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sfC50XSQItSsLfF856D24b0b0ZI/QZxB3Dst2QZCTGg=;
 b=H8xQBP9doa9EfN+AAgVzATEsRIBKLUVbUE2az04cV3S2ULYiiep2N7x6jkzgZg9coG
 1Z/BmIFqudFdfy4YQaB/5jPwTjncmvMb77ke2Cx2qyXZZVos85nOUr/6eUCVwnTbj/YT
 zwGs6lS42Fnu0Mf27JcwcmnAh0wquMDhXZq5Ha1OlOLDQ7spEdzXfVSBRTuyW6xhpTA1
 g2302vjy81lt1vBLcfJ/Do64ieapOWc7WSJGZ6L+hT6FRrPLJ5kajVc9xVVXYNDPIk3F
 opzSZQQ4PP2h9WxN4Axn8DPfsDHquFKr8wkmo9y57MwalZ4TQOyCo9vteWNMcciM53sU
 ZHMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771070113; x=1771674913;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=sfC50XSQItSsLfF856D24b0b0ZI/QZxB3Dst2QZCTGg=;
 b=k0mrtwRiikIjYbzRZc9M6O6s3xm2B38DRilSP64VtpCVGjcNweaxHA3Xkkcjdts7VW
 t9zkAEmgyxIbxDtD/fHQ+CMVdauVoBE4yIY36C/FIzl9WWCygV9tcI63hfOR/qsv08EF
 0Z9grs/KDDQfQIwhFz6UDbV2/dH5Oxg0gU0gO10/QI6ZqzCQzB8DN5a7K5mhssVMdLk1
 yepUuIh2ULntQW0iYswskOrObElZVzKA3NZz8fFKFwDIbup1wMphUhzNAGrSju4tDLhJ
 ibZ85ErCtUea4fjCGOBDgtO3bLqv0Q/4ZjVqmJzXCzzQU0JhK0pB/9ZbRfoVPIf1S0w1
 KSEA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVFVpenJ8YTeHHW7dM7srBlH4qCoeHarCLGZuWqnUheE8rn6rpIDF/5LrGemW11jpJGeDqkuZiOFgk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy2SZYqaQmtXImkSHklfI0pvcbquAorOFP76bf62tQWEkeAmEud
 IU0S66PWw4V5LjTNHiwQn07RenGUgJoRWwZfbmMpQJypnF1/sjOx7fL10C/fV2M1Yxkn/DoSAkq
 Jjvg3tWgaWwSnrjPIWh6Nw62J5D+E/AVUr2LFoCMsLQ==
X-Gm-Gg: AZuq6aINbv5oNJHG4toPXGXeqjENdcufphIro/4vfAuk/hAxzPY9bh4RiZOUnUaJXvk
 m/J5mhhj8C+yykklV++w/6Zj1ZA5SJeA2IfgKPCeX+bdgGj//P1sr3By4sjMJJcuWfG7/e9jWS/
 8oGHBYRh1Myeqj/N3eZoWBqEO+P0upqyXwu5oDQDrox7KFQvx/5oK6IKKEA7ilUIp0cWqNNoeTa
 6Un7Fvm4IsRucoxsRszmcehi7TdBkH3JYDVQiAqhPo7NTOhxAdC2EkU6qhbDaZNlkQge9AsbPJz
 SNKR8AfAoFd0WTb+aw==
X-Received: by 2002:a05:690c:9990:b0:78f:a615:2724 with SMTP id
 00721157ae682-797a0cca0cdmr83696787b3.48.1771070113134; Sat, 14 Feb 2026
 03:55:13 -0800 (PST)
MIME-Version: 1.0
References: <20260213-msm-next-quad-pipe-split-v18-0-5815158d3635@linaro.org>
 <20260213-msm-next-quad-pipe-split-v18-2-5815158d3635@linaro.org>
 <pufuo7jq4olww3ksyawqkoee34cl4fhtpfh3sh2kfuimajswod@gv4rp6wsnrhx>
In-Reply-To: <pufuo7jq4olww3ksyawqkoee34cl4fhtpfh3sh2kfuimajswod@gv4rp6wsnrhx>
From: Jun Nie <jun.nie@linaro.org>
Date: Sat, 14 Feb 2026 19:55:02 +0800
X-Gm-Features: AZwV_Qigv3G7TrMHGxexVDebiOQwk_U6GNZ8jgGeUNvo9OZcvzyb-L5nKUd2Gxs
Message-ID: <CABymUCMba4C0g+TPzWAT_eXTyxDbJDgWjTw3WgXu9=voOyZONQ@mail.gmail.com>
Subject: Re: [PATCH v18 2/4] drm/msm/dpu: Defer SSPP allocation until CRTC
 check
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>,
 Dmitry Baryshkov <lumag@kernel.org>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:lumag@kernel.org,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:robin.clark@oss.qualcomm.com,m:neil.armstrong@linaro.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[jun.nie@linaro.org,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jun.nie@linaro.org,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[linux.dev,kernel.org,poorly.run,somainline.org,gmail.com,ffwll.ch,oss.qualcomm.com,linaro.org,vger.kernel.org,lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,linaro.org:email,linaro.org:dkim]
X-Rspamd-Queue-Id: 64E2013BC86
X-Rspamd-Action: no action

Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> =E4=BA=8E2026=E5=B9=B4=
2=E6=9C=8814=E6=97=A5=E5=91=A8=E5=85=AD 01:03=E5=86=99=E9=81=93=EF=BC=9A
>
> On Fri, Feb 13, 2026 at 10:54:26PM +0800, Jun Nie wrote:
> > Currently, mapping plane to SSPP occurs during the plane check phase fo=
r
> > non-virtual plane case. The SSPP allocation and plane mapping occurs du=
ring
> > crtc check phase for virtual plane case. Defer these SSPP operations un=
til
>
> Nit: CRTC
>
> > CRTC check stage to unify the 2 cases, and ease later revisement for
> > quad-pipe change.
> >
> > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > ---
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  |   3 +-
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 155 +++++++++++++---------=
--------
> >  2 files changed, 66 insertions(+), 92 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm=
/msm/disp/dpu1/dpu_crtc.c
> > index 6bf7c46379aed..797296b14264e 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > @@ -1534,8 +1534,7 @@ static int dpu_crtc_atomic_check(struct drm_crtc =
*crtc,
> >                       return rc;
> >       }
> >
> > -     if (dpu_use_virtual_planes &&
> > -         (crtc_state->planes_changed || crtc_state->zpos_changed)) {
> > +     if (crtc_state->planes_changed || crtc_state->zpos_changed) {
> >               rc =3D dpu_crtc_reassign_planes(crtc, crtc_state);
>
> dpu_crtc_reassing_planes() starts by freeing all SSPPs. It should not be
> used in a non-virtual-plane case. I'd suggest duplicating the function
> and stripping out all code and data related to virtual planes.

OK, will duplicate the function to customize non-virtual-plane version.
>
> >               if (rc < 0)
> >                       return rc;
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/dr=
m/msm/disp/dpu1/dpu_plane.c
> > index 66f240ce29d07..be1a7fcf11b81 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > @@ -1119,102 +1119,24 @@ static int dpu_plane_atomic_check(struct drm_p=
lane *plane,
> >       struct drm_plane_state *new_plane_state =3D drm_atomic_get_new_pl=
ane_state(state,
> >                                                                        =
        plane);
> >       int ret =3D 0;
> > -     struct dpu_plane *pdpu =3D to_dpu_plane(plane);
> > -     struct dpu_plane_state *pstate =3D to_dpu_plane_state(new_plane_s=
tate);
> > -     struct dpu_kms *dpu_kms =3D _dpu_plane_get_kms(plane);
> > -     struct dpu_sw_pipe *pipe =3D &pstate->pipe[0];
> > -     struct dpu_sw_pipe *r_pipe =3D &pstate->pipe[1];
> > -     struct dpu_sw_pipe_cfg *pipe_cfg =3D &pstate->pipe_cfg[0];
> > -     struct dpu_sw_pipe_cfg *r_pipe_cfg =3D &pstate->pipe_cfg[1];
> > -     const struct drm_crtc_state *crtc_state =3D NULL;
> > -     uint32_t max_linewidth =3D dpu_kms->catalog->caps->max_linewidth;
> > +     struct drm_crtc_state *crtc_state =3D NULL;
> >
> >       if (new_plane_state->crtc)
> >               crtc_state =3D drm_atomic_get_new_crtc_state(state,
> >                                                          new_plane_stat=
e->crtc);
> >
> > -     pipe->sspp =3D dpu_rm_get_sspp(&dpu_kms->rm, pdpu->pipe);
> > -
> > -     if (!pipe->sspp)
> > -             return -EINVAL;
> > -
> >       ret =3D dpu_plane_atomic_check_nosspp(plane, new_plane_state, crt=
c_state);
> >       if (ret)
> >               return ret;
> >
> > -     ret =3D dpu_plane_split(plane, new_plane_state, crtc_state);
> > -     if (ret)
> > -             return ret;
> > -
> >       if (!new_plane_state->visible)
> >               return 0;
> >
> > -     if (!dpu_plane_try_multirect_parallel(pipe, pipe_cfg, r_pipe, r_p=
ipe_cfg,
> > -                                           pipe->sspp,
> > -                                           msm_framebuffer_format(new_=
plane_state->fb),
> > -                                           max_linewidth)) {
> > -             DPU_DEBUG_PLANE(pdpu, "invalid " DRM_RECT_FMT " /" DRM_RE=
CT_FMT
> > -                             " max_line:%u, can't use split source\n",
> > -                             DRM_RECT_ARG(&pipe_cfg->src_rect),
> > -                             DRM_RECT_ARG(&r_pipe_cfg->src_rect),
> > -                             max_linewidth);
> > -             return -E2BIG;
> > -     }
> > -
> > -     return dpu_plane_atomic_check_sspp(plane, state, crtc_state);
> > -}
> > -
> > -static int dpu_plane_virtual_atomic_check(struct drm_plane *plane,
> > -                                       struct drm_atomic_state *state)
> > -{
> > -     struct drm_plane_state *plane_state =3D
> > -             drm_atomic_get_plane_state(state, plane);
> > -     struct drm_plane_state *old_plane_state =3D
> > -             drm_atomic_get_old_plane_state(state, plane);
> > -     struct dpu_plane_state *pstate =3D to_dpu_plane_state(plane_state=
);
> > -     struct drm_crtc_state *crtc_state =3D NULL;
> > -     int ret, i;
> > -
> > -     if (IS_ERR(plane_state))
> > -             return PTR_ERR(plane_state);
> > -
> > -     if (plane_state->crtc)
> > -             crtc_state =3D drm_atomic_get_new_crtc_state(state,
> > -                                                        plane_state->c=
rtc);
> > -
> > -     ret =3D dpu_plane_atomic_check_nosspp(plane, plane_state, crtc_st=
ate);
> > -     if (ret)
> > -             return ret;
> > -
> > -     ret =3D dpu_plane_split(plane, plane_state, crtc_state);
> > -     if (ret)
> > -             return ret;
> > -
> > -     if (!plane_state->visible) {
> > -             /*
> > -              * resources are freed by dpu_crtc_assign_plane_resources=
(),
> > -              * but clean them here.
> > -              */
> > -             for (i =3D 0; i < PIPES_PER_PLANE; i++)
> > -                     pstate->pipe[i].sspp =3D NULL;
> > -
> > -             return 0;
> > -     }
> > -
> >       /*
> > -      * Force resource reallocation if the format of FB or src/dst hav=
e
> > -      * changed. We might need to allocate different SSPP or SSPPs for=
 this
> > -      * plane than the one used previously.
> > +      * To trigger the callback of dpu_assign_plane_resources() to
> > +      * finish the sspp assignment or allocation and check.
> >        */
> > -     if (!old_plane_state || !old_plane_state->fb ||
> > -         old_plane_state->src_w !=3D plane_state->src_w ||
> > -         old_plane_state->src_h !=3D plane_state->src_h ||
> > -         old_plane_state->crtc_w !=3D plane_state->crtc_w ||
> > -         old_plane_state->crtc_h !=3D plane_state->crtc_h ||
> > -         msm_framebuffer_format(old_plane_state->fb) !=3D
> > -         msm_framebuffer_format(plane_state->fb))
> > -             crtc_state->planes_changed =3D true;
> > -
> > +     crtc_state->planes_changed =3D true;
>
> Why do we need to enforce this? Previously it was limited to the cases
> when the plane has actually changed and required revalidation.

It is just for safety to ensure derferring the SSPP handling into CRTC
check stage.
The planes_changed is set in drm_atomic_helper_plane_changed() as below
call tree for every frame in kmscube test. So this enforcement does
not introduce
redundant calling. I can use another variable to trigger the deferred
SSPP handling.
But we still need to optimize drm framework or msm_atomic_check to
avoid redundant
asserting crtc_state->planes_changed later.

drm_atomic_check_only
  -> msm_atomic_check
     -> drm_atomic_helper_check
        -> drm_atomic_helper_check_planes
            -> drm_atomic_helper_plane_changed  =3D>
crtc_state->planes_changed is asserted.
>
> >       return 0;
> >  }
> >
> > @@ -1261,9 +1183,9 @@ static int dpu_plane_virtual_assign_resources(str=
uct drm_crtc *crtc,
> >                                             struct dpu_global_state *gl=
obal_state,
> >                                             struct drm_atomic_state *st=
ate,
> >                                             struct drm_plane_state *pla=
ne_state,
> > +                                           const struct drm_crtc_state=
 *crtc_state,
> >                                             struct drm_plane_state **pr=
ev_adjacent_plane_state)
> >  {
> > -     const struct drm_crtc_state *crtc_state =3D NULL;
> >       struct drm_plane *plane =3D plane_state->plane;
> >       struct dpu_kms *dpu_kms =3D _dpu_plane_get_kms(plane);
> >       struct dpu_rm_sspp_requirements reqs;
> > @@ -1273,10 +1195,6 @@ static int dpu_plane_virtual_assign_resources(st=
ruct drm_crtc *crtc,
> >       const struct msm_format *fmt;
> >       int i, ret;
> >
> > -     if (plane_state->crtc)
> > -             crtc_state =3D drm_atomic_get_new_crtc_state(state,
> > -                                                        plane_state->c=
rtc);
> > -
> >       pstate =3D to_dpu_plane_state(plane_state);
> >       for (i =3D 0; i < STAGES_PER_PLANE; i++)
> >               prev_adjacent_pstate[i] =3D prev_adjacent_plane_state[i] =
?
> > @@ -1288,6 +1206,10 @@ static int dpu_plane_virtual_assign_resources(st=
ruct drm_crtc *crtc,
> >       if (!plane_state->fb)
> >               return -EINVAL;
> >
> > +     ret =3D dpu_plane_split(plane, plane_state, crtc_state);
> > +     if (ret)
> > +             return ret;
> > +
> >       fmt =3D msm_framebuffer_format(plane_state->fb);
> >       reqs.yuv =3D MSM_FORMAT_IS_YUV(fmt);
> >       reqs.scale =3D (plane_state->src_w >> 16 !=3D plane_state->crtc_w=
) ||
> > @@ -1318,14 +1240,56 @@ static int dpu_plane_virtual_assign_resources(s=
truct drm_crtc *crtc,
> >       return dpu_plane_atomic_check_sspp(plane, state, crtc_state);
> >  }
> >
> > +static int dpu_plane_assign_resources(struct drm_crtc *crtc,
> > +                                   struct dpu_global_state *global_sta=
te,
> > +                                   struct drm_atomic_state *state,
> > +                                   struct drm_plane_state *plane_state=
,
> > +                                   const struct drm_crtc_state *crtc_s=
tate,
> > +                                   struct drm_plane_state **prev_adjac=
ent_plane_state)
> > +{
> > +     struct drm_plane *plane =3D plane_state->plane;
> > +     struct dpu_kms *dpu_kms =3D _dpu_plane_get_kms(plane);
> > +     struct dpu_plane_state *pstate =3D to_dpu_plane_state(plane_state=
);
> > +     struct dpu_sw_pipe *pipe =3D &pstate->pipe[0];
> > +     struct dpu_sw_pipe *r_pipe =3D &pstate->pipe[1];
> > +     struct dpu_sw_pipe_cfg *pipe_cfg =3D &pstate->pipe_cfg[0];
> > +     struct dpu_sw_pipe_cfg *r_pipe_cfg =3D &pstate->pipe_cfg[1];
> > +     struct dpu_plane *pdpu =3D to_dpu_plane(plane);
> > +     int ret;
> > +
> > +     pipe->sspp =3D dpu_rm_get_sspp(&dpu_kms->rm, pdpu->pipe);
> > +     if (!pipe->sspp)
> > +             return -EINVAL;
> > +
> > +     ret =3D dpu_plane_split(plane, plane_state, crtc_state);
> > +     if (ret)
> > +             return ret;
> > +
> > +     if (!dpu_plane_try_multirect_parallel(pipe, pipe_cfg, r_pipe, r_p=
ipe_cfg,
> > +                                           pipe->sspp,
> > +                                           msm_framebuffer_format(plan=
e_state->fb),
> > +                                           dpu_kms->catalog->caps->max=
_linewidth)) {
> > +             DPU_DEBUG_PLANE(pdpu, "invalid " DRM_RECT_FMT " /" DRM_RE=
CT_FMT
> > +                             " max_line:%u, can't use split source\n",
> > +                             DRM_RECT_ARG(&pipe_cfg->src_rect),
> > +                             DRM_RECT_ARG(&r_pipe_cfg->src_rect),
> > +                             dpu_kms->catalog->caps->max_linewidth);
> > +             return -E2BIG;
> > +     }
> > +
> > +     return dpu_plane_atomic_check_sspp(plane, state, crtc_state);
> > +}
> > +
> >  int dpu_assign_plane_resources(struct dpu_global_state *global_state,
> >                              struct drm_atomic_state *state,
> >                              struct drm_crtc *crtc,
> >                              struct drm_plane_state **states,
> >                              unsigned int num_planes)
> >  {
> > -     unsigned int i;
> >       struct drm_plane_state *prev_adjacent_plane_state[STAGES_PER_PLAN=
E] =3D { NULL };
> > +     const struct drm_crtc_state *crtc_state =3D NULL;
> > +     unsigned int i;
> > +     int ret;
> >
> >       for (i =3D 0; i < num_planes; i++) {
> >               struct drm_plane_state *plane_state =3D states[i];
> > @@ -1334,8 +1298,19 @@ int dpu_assign_plane_resources(struct dpu_global=
_state *global_state,
> >                   !plane_state->visible)
> >                       continue;
> >
> > -             int ret =3D dpu_plane_virtual_assign_resources(crtc, glob=
al_state,
> > +             if (plane_state->crtc)
> > +                     crtc_state =3D drm_atomic_get_new_crtc_state(stat=
e,
> > +                                                                plane_=
state->crtc);
> > +
> > +             if (!dpu_use_virtual_planes)
> > +                     ret =3D dpu_plane_assign_resources(crtc, global_s=
tate,
> > +                                                      state, plane_sta=
te,
> > +                                                      crtc_state,
> > +                                                      prev_adjacent_pl=
ane_state);
>
> This is an overkill for the non-virtual case. We don't need adjancent
> states, we don't need the array of plane state pointers, etc.

dpu_plane_assign_resources just include the SSPP assignment, which
is moved from dpu_plane_atomic_check(). The adjancent state is handled
in dpu_plane_virtual_assign_resources()
>
> > +             else
> > +                     ret =3D dpu_plane_virtual_assign_resources(crtc, =
global_state,
> >                                                            state, plane=
_state,
> > +                                                          crtc_state,
> >                                                            prev_adjacen=
t_plane_state);
> >               if (ret)
> >                       return ret;
> > @@ -1772,7 +1747,7 @@ static const struct drm_plane_helper_funcs dpu_pl=
ane_helper_funcs =3D {
> >  static const struct drm_plane_helper_funcs dpu_plane_virtual_helper_fu=
ncs =3D {
> >       .prepare_fb =3D dpu_plane_prepare_fb,
> >       .cleanup_fb =3D dpu_plane_cleanup_fb,
> > -     .atomic_check =3D dpu_plane_virtual_atomic_check,
> > +     .atomic_check =3D dpu_plane_atomic_check,
> >       .atomic_update =3D dpu_plane_atomic_update,
> >  };
> >
> >
> > --
> > 2.43.0
> >
>
> --
> With best wishes
> Dmitry
