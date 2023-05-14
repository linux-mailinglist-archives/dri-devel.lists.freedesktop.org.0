Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F5BC701E5C
	for <lists+dri-devel@lfdr.de>; Sun, 14 May 2023 19:01:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17AD810E07E;
	Sun, 14 May 2023 17:01:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com
 [IPv6:2607:f8b0:4864:20::112b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F67810E095
 for <dri-devel@lists.freedesktop.org>; Sun, 14 May 2023 17:01:40 +0000 (UTC)
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-55d2e87048cso173717667b3.1
 for <dri-devel@lists.freedesktop.org>; Sun, 14 May 2023 10:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684083699; x=1686675699;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=2UHE6KlW9JyEYO4rMr/i63nT9UiBXdbXXzrRs9yxmkU=;
 b=RPKTeggauu5yKDq3wGbtAgtozDUWB6aA+Niak68nX+2zDqgRHObtdkLgGG+ZS2s62q
 AQM5/zSZhEl6sm9upmDn+HR9bAEO/uu3Ori8BkiQDeEv7r58e46h6gLcP7/IPJpbuQhS
 ICnC6i6cT2fqe8mNqWMod+M5DcSyf0ddQN+1s6p/UHwwJmxZa9a0M/PG4KqWgFRqukFY
 NT7QlCB+4sUJCU5ujJMlS5tJWvLjyWj1FtHwYgK9qlwe6z1A6SFU3NydcxRDYXb04rvc
 9EUeFGRjjaW0qh9gLJ3Zbp/vQ4tJSA1Pw7oM6NDFfOosBrCvWyBHnHvEWe7qOjCmd45S
 b6BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684083699; x=1686675699;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2UHE6KlW9JyEYO4rMr/i63nT9UiBXdbXXzrRs9yxmkU=;
 b=G29plDlsi+/tfzM+9tiAlE7T4D92pDJVkJipf7dI1sjJYXrrAS49G9LThP40fR82xs
 4moOwpXXIBXwM0NI1lU8SnjlN33d4sHf6IeGj0Fe+zYJD/dpIGPQnHlWY4682JUkDcsA
 G6MOpBEmkd5Jifn3o2zyUXXOdcydatD2mUZSt7gqZg/Rt7rJPMrM6zU0SKweofaT2CDs
 zLGxb6DERA+oWTntzBy/Gpbqg1O87I7h5OaEXe2RlkOEobPKX+4Xa44DOZrYHyGyJD0F
 vMCS7dn+xbLOg2OTiHJJawTzB5R1ehrWPL+cNSSfxex84o6YDoVMiEG2bva8zBldBe5m
 SBaw==
X-Gm-Message-State: AC+VfDycLO2T1shJIXgP05UrHTosJeR5fg6+eAKF8O+0qIZ2KZPkThY3
 mR2X9Q3+ItGtlBcfFpI8EGFunZgjwwi/AIf8vjMYCA==
X-Google-Smtp-Source: ACHHUZ6CIWv7Cilknh4FESFfjsUlP+18hc9999+7vuxr0cmZZf09oa3qy8n/zP5ZyAmBRAUuuyuzlPz6QAxgVJIsHeE=
X-Received: by 2002:a81:4985:0:b0:55a:577f:eff9 with SMTP id
 w127-20020a814985000000b0055a577feff9mr29769040ywa.28.1684083699008; Sun, 14
 May 2023 10:01:39 -0700 (PDT)
MIME-Version: 1.0
References: <20230321011821.635977-1-dmitry.baryshkov@linaro.org>
 <20230321011821.635977-3-dmitry.baryshkov@linaro.org>
 <ea7af397-1840-f15b-6f56-2d0559b8be4d@quicinc.com>
In-Reply-To: <ea7af397-1840-f15b-6f56-2d0559b8be4d@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 14 May 2023 20:01:28 +0300
Message-ID: <CAA8EJppbXavJCT4ErBoW2cBjRoabFK58UQ39T6h96Ovm8yMdEQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 02/13] drm/msm/dpu: take plane rotation into
 account for wide planes
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 13 May 2023 at 01:12, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 3/20/2023 6:18 PM, Dmitry Baryshkov wrote:
> > Take into account the plane rotation and flipping when calculating src
> > positions for the wide plane parts.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>
> Do we need to have a fixes tag for this? This means we dont consider
> rotation while calculating src position today which is a bug?

Hmm, I thought that I had a check forbidding rotation with the current
approach, but I don't see it. Most probably I thought about it and
then forgot to add it.
The proper fix should be to disallow it for static SSPP case. I'll
include the patch into v3.

>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 27 ++++++++++++++---------
> >   1 file changed, 17 insertions(+), 10 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > index 2e63eb0a2f3f..d43e04fc4578 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > @@ -887,16 +887,6 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
> >               return -EINVAL;
> >       }
> >
> > -     pipe_cfg->src_rect = new_plane_state->src;
> > -
> > -     /* state->src is 16.16, src_rect is not */
> > -     pipe_cfg->src_rect.x1 >>= 16;
> > -     pipe_cfg->src_rect.x2 >>= 16;
> > -     pipe_cfg->src_rect.y1 >>= 16;
> > -     pipe_cfg->src_rect.y2 >>= 16;
> > -
> > -     pipe_cfg->dst_rect = new_plane_state->dst;
> > -
> >       fb_rect.x2 = new_plane_state->fb->width;
> >       fb_rect.y2 = new_plane_state->fb->height;
> >
> > @@ -912,6 +902,15 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
> >
> >       max_linewidth = pdpu->catalog->caps->max_linewidth;
> >
> > +     /* state->src is 16.16, src_rect is not */
> > +     drm_rect_fp_to_int(&pipe_cfg->src_rect, &new_plane_state->src);
> > +
> > +     pipe_cfg->dst_rect = new_plane_state->dst;
> > +
> > +     drm_rect_rotate(&pipe_cfg->src_rect,
> > +                     new_plane_state->fb->width, new_plane_state->fb->height,
> > +                     new_plane_state->rotation);
> > +
> >       if (drm_rect_width(&pipe_cfg->src_rect) > max_linewidth) {
> >               /*
> >                * In parallel multirect case only the half of the usual width
> > @@ -959,6 +958,14 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
> >               r_pipe_cfg->dst_rect.x1 = pipe_cfg->dst_rect.x2;
> >       }
> >
> > +     drm_rect_rotate_inv(&pipe_cfg->src_rect,
> > +                         new_plane_state->fb->width, new_plane_state->fb->height,
> > +                         new_plane_state->rotation);
> > +     if (r_pipe->sspp)
>
> Dont you need to check for if (r_pipe_cfg) here and not if
> (r_pipe->sspp) because parameter you are passing is the r_pipe_cfg to
> drm_rect_rotate_inv().

Of course not. r_pipe_cfg is a pointer to the field in pstate. We know
that it can not be NULL.

>
> So we rotated the pipe_cfg once, then rotated_inv it to restore the
> rectangle to its original state, but r_pipe_cfg's rectangle was never
> rotated as it was not allocated before this function so it will remain
> in inverse rotated state now right?

No. r_pipe_cfg is set beforehand to the half of the rotated pipe_cfg.

> > +             drm_rect_rotate_inv(&r_pipe_cfg->src_rect,
> > +                                 new_plane_state->fb->width, new_plane_state->fb->height,
> > +                                 new_plane_state->rotation);
> > +
> >       ret = dpu_plane_atomic_check_pipe(pdpu, pipe, pipe_cfg, fmt);
> >       if (ret)
> >               return ret;



--
With best wishes
Dmitry
