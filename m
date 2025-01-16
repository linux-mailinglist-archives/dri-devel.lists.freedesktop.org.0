Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59A7BA1377B
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2025 11:09:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8D6B10E925;
	Thu, 16 Jan 2025 10:09:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="gug60ks1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A390110E925
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2025 10:09:24 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-54020b0dcd2so2007952e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2025 02:09:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737022103; x=1737626903; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=cQL5P+stysbXGUSGza6LY0P64HDoGy15LTxz7SThOgw=;
 b=gug60ks1BX2ZUPKp+sd6BNDkOmcq4IdhNighzn/LoKqvnl4bkF+SGbThK6F5Ro4WDp
 k7I4XWHLGO4MHNr9bJcs3kFKSFjzIfuqPXAynQ0u+JpdsBKwDc7FSXB2ct3uZ/yOjDq/
 1HIjp7gM4czF6kds5EZSAt7swsgIaNeAhND1hVTYovI469gOsKJpWdNMTFj9/PC5yt3p
 EKImao2XGLdwPfbLOC+efFegshbMVTWmZbtyruYYlVMfBqDgaZ2i2CeWNcOiE2AopqPT
 XvyQN7cnKrMLaOHzRMnuhyfuLh0XXPe7+/NuMX6oVbuE9HXR6KvSNjofi7EXs0U2E6YA
 D0zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737022103; x=1737626903;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cQL5P+stysbXGUSGza6LY0P64HDoGy15LTxz7SThOgw=;
 b=r+kmhu1TcSCWiihNvTacG5cSfxkwe8oF8Prh7rIsqLUxDrvmt+Gd9p0DP0sB51k8+/
 DzUDLzIVhF1HhGzE5bKs07hqQl9QSdsXSn0wJ61Avp446J6nUPS+uVww0+h0MnhnqqGu
 G0YRFv6Yu8xHXHH+TYnOP2FdY4sgeI/ddBhIyVQALJlI12h5G31aS7dLepsMt1VZua1X
 vwR6yhiaNwYOL5pAsf17eB7VMGx4S8UWOKD/6QhQuQ7woSXl5ksoPFwgvEfibnXh7l9u
 MYwGIEyHkpxAKaEZKm+IueAE7t9YNTBlBWzFH/mz+IXSNYXT4c+B3uIgt57cHaH9jtl/
 Aweg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVIiSRpkplfxDVV3UJW+PckX4YDWE0aMwA23XrG90SrhnNfXppgRvZwK/wAWDc0wjtgAZdBUEqLfvY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxTAhNT75YBr96WYpqmX389rVa7u21lw9vJ+PT+EVL+lneH0apx
 kUmO1EZMHAbMXMjAfJQhZdtM4BVXIUzcnYVAmqPG2k8cSeiOi+xvqh7BCxUFfcw=
X-Gm-Gg: ASbGnctIHSCwA41dlnDSkwFW5NZk7KW6qaVVTET9Np2jGMZd5BTwdFl5xUob1zojWjl
 RlH8PCUyTJ/9zgwuIYpO6gxfLe9myTa+W+8ZUv9xf5wm9Vz8Q4RMCLQ/9kNsg9F/UBqRIbokWnj
 nVY8kh7UN6YyE4lNP/yqyOItau+PGddicNugvLtcchvojafUoStYLuaqm5LXnmyEK54zOuutlva
 +L0XFCIz+NL7kvcQ0eZ36uUYGA+OWo/k2n/FBlvo820rSw0iAMWwoPKwVfqlim2kaio2JKgdffj
 V+qAVqHgCiaeQYeReC/wU1FdmWPWUy4io3iB
X-Google-Smtp-Source: AGHT+IHibacZs62C+50hmUYD+We34R8ZMYI1SInbRx/AkSrEVIhxjVZEe01dBch1oRXN+Fj/nO4vEw==
X-Received: by 2002:a05:6512:1049:b0:542:8d92:158a with SMTP id
 2adb3069b0e04-542abf9a237mr2328195e87.10.1737022103006; 
 Thu, 16 Jan 2025 02:08:23 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5428bec0829sm2270932e87.197.2025.01.16.02.08.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jan 2025 02:08:21 -0800 (PST)
Date: Thu, 16 Jan 2025 12:08:19 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 10/16] drm/msm/dpu: handle pipes as array
Message-ID: <gj6lxrclgabwuww3rl2ynw5qmaq4lx6xycxrazcwnnf5fbezjb@oijoszqsrdps>
References: <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-0-74749c6eba33@linaro.org>
 <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-10-74749c6eba33@linaro.org>
 <l6z2skrj2tvlnqok44yepqs32keuz3wsfpgsacesrxi3q4s4xb@oiicfia3tkef>
 <CABymUCOdtePUgcbtY3Xtf9detcfwm=RjG1D_sfDOSbSP-EjwXA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABymUCOdtePUgcbtY3Xtf9detcfwm=RjG1D_sfDOSbSP-EjwXA@mail.gmail.com>
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

On Thu, Jan 16, 2025 at 05:49:43PM +0800, Jun Nie wrote:
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> 于2025年1月16日周四 16:00写道：
> >
> > On Thu, Jan 16, 2025 at 03:25:59PM +0800, Jun Nie wrote:
> > > Store pipes in array with removing dedicated r_pipe. There are
> > > 2 pipes in a drm plane at most currently, while 4 pipes are
> > > required for quad-pipe case. Generalize the handling to pipe pair
> > > and ease handling to another pipe pair later.
> >
> > With the first sentence being moved to the end of the commit message:
> >
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >
> > Minor issues below, please address them in the next version.
> >
> > >
> > > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > > ---
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  |  35 +++----
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 167 +++++++++++++++++-------------
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h |  12 +--
> > >  3 files changed, 112 insertions(+), 102 deletions(-)
> >
> > > @@ -853,6 +855,9 @@ static int dpu_plane_atomic_check_nosspp(struct drm_plane *plane,
> > >               return -EINVAL;
> > >       }
> > >
> > > +     /* move the assignment here, to ease handling to another pairs later */
> >
> > Is it a TODO comment? It reads like an order.
> >
> > > +     pipe_cfg = &pstate->pipe_cfg[0];
> > > +     r_pipe_cfg = &pstate->pipe_cfg[1];
> > >       /* state->src is 16.16, src_rect is not */
> > >       drm_rect_fp_to_int(&pipe_cfg->src_rect, &new_plane_state->src);
> > >
> >
> > > @@ -1387,17 +1394,28 @@ static void _dpu_plane_atomic_disable(struct drm_plane *plane)
> > >  {
> > >       struct drm_plane_state *state = plane->state;
> > >       struct dpu_plane_state *pstate = to_dpu_plane_state(state);
> > > -     struct dpu_sw_pipe *r_pipe = &pstate->r_pipe;
> > > +     struct dpu_sw_pipe *pipe;
> > > +     int i;
> > >
> > > -     trace_dpu_plane_disable(DRMID(plane), false,
> > > -                             pstate->pipe.multirect_mode);
> > > +     for (i = 0; i < PIPES_PER_STAGE; i += 1) {
> > > +             pipe = &pstate->pipe[i];
> > > +             if (!pipe->sspp)
> > > +                     continue;
> > >
> > > -     if (r_pipe->sspp) {
> > > -             r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> > > -             r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> > > +             trace_dpu_plane_disable(DRMID(plane), false,
> > > +                                     pstate->pipe[i].multirect_mode);
> > >
> > > -             if (r_pipe->sspp->ops.setup_multirect)
> > > -                     r_pipe->sspp->ops.setup_multirect(r_pipe);
> > > +             /*
> > > +              * clear multirect for the right pipe so that the SSPP
> > > +              * can be further reused in the solo mode
> > > +              */
> > > +             if (pipe->sspp && i == 1) {
> >
> > Wouldn't it be better to `&& i % 2 != 0`? Then, I think, this condition
> > can stay even in quad-pipe case.
> 
> If all pipes are in solo mode, there is no need to test ' i %2 != 0 '. Below
> test shall be better, right?
> if (pipe->sspp && pipe->multirect_index == DPU_SSPP_RECT_1)

Again, this will not work as expected for the SSPP-sharing case as it
will then clear pipe 0 for the sharing planes.

Let me think a bit... This code resets multirect for right pipes. It was
added back in 4.9 to fix the case of 'master' aka RECT_0 not being a
part of the atomic update. However I don't think this is applicable
anymore. We use z_pos normalization, so all planes for a CRTC are added
to the commit. Please drop this piece in a separate commit.

> 
> >
> > > +                     pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> > > +                     pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> > > +
> > > +                     if (pipe->sspp->ops.setup_multirect)
> > > +                             pipe->sspp->ops.setup_multirect(pipe);
> > > +             }
> > >       }
> > >
> > >       pstate->pending = true;
> >
> > --
> > With best wishes
> > Dmitry

-- 
With best wishes
Dmitry
