Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A7D0A14888
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2025 04:38:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 561E210E194;
	Fri, 17 Jan 2025 03:38:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ML37LEZR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 067BF10E194
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2025 03:38:55 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-5401c52000fso1665440e87.2
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2025 19:38:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737085073; x=1737689873; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=RbRhauMuE7vnNEQUajYDJYV2KJ4uJrNBBU7umCd3XAo=;
 b=ML37LEZROyKmNzE78PjaweulaR3FmSL7/HzDjtwPWqHVxpwNy3RGpLBhBwVdqRnnvi
 /yhdxaVSuP6r6Eiuj+zmOEMpsitB38zBpbjrmmeDZO1XD+FTO7axwE1aEJUZ9EdBMImA
 t81h/cbOICHF1PuMTp5jh7AW/RJDJ0yugpUquPRHJPo89GTh4Go6N7d6EbEvc6f15jnQ
 KClgXROE5Qn6Tr75Yeala7lSah5YaWB/tzffie0FCxUHl987IxA1QnQx04PeZnUSM6hC
 /b4iAPoWRKCY+Cy91bcwkyaTC7HKo/q5lvWM3oMBKFsW9zJh5ipOiIYMS6X8KUbDP4Sh
 S+ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737085073; x=1737689873;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RbRhauMuE7vnNEQUajYDJYV2KJ4uJrNBBU7umCd3XAo=;
 b=ekVekpo5jAvZcp7CmTigh8HcvqTVrhTeDoBhVnddO8DZD66xGEwh+xrwk+YhdgSkc+
 VWwiTd0QQyZ5ap8KKjylHP/IVqdk59mYIjQYNUUbtQwW2JGKLmEwNgmY34RkZMfsZcaN
 N4+SA604gzWpyGKSVDlYh7M/B1wacxKK5cHNi9ABaMa48yZzf2sgGJCbVH9cJZXBCslz
 Uwy09rv/xo0tK+yrowUnwpWQTbyMpGoA+yVTndZTS9qM4nRXk8flyT9UymjmpaHSvamv
 +ZmH8tF8WfL7SIbH6SftnbsaF4czjC8nve5c06Gs1P/DTWBCT7b7hTm2d8dBx5il1yyW
 WOyw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX2KG0ku3WsqaL+uWj2HH+aF668084pIO0Wazkt+tgeWEGhokHD3piMxAwsHgYU5HNud/deHBz7WqE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyLKsHFvo3YqeQ4Xx/tlobi2wf+saYBBM1ogvOKbk4vg5dmrf54
 6KTubxj4QD5ja16Nm+N/0QbKyOYxGFYdO9Mr+jJoVLUFcGZscTWQLCcFMB3EMSk=
X-Gm-Gg: ASbGnctAeUkmIBzoMBrI6+OIKPHgOo9ckivmpZ2r48vXTv5YPaIaGpu1XhlIIm1h1cr
 NhnX5QV8aZKkAPkCSUihcqJUZ9ZEqATypvMarDRV1bIDJdnwPQ2SOCy8J7aD4538wOudh99Z+YG
 O2PBKGzADuEgafQ01I/HBFGKyvZeAMLnV8wcEWdiyGHP0R+zGEVYqUkAXzH66I+2HUCOuPIx+CT
 lHiGLxfbcLD7znyfePQbfuz6tyUmoiA6bV48OyrvjIhcm4pv0OlDOgZJxlJnNuBPLg04Q1xvEbg
 agp1G2+XsJMVF5Z4ugXEyQZszp3B8LT8hPYG
X-Google-Smtp-Source: AGHT+IFOT1+RQIjsjZXqf2Cffm/N+YEVBjWGmnuiuZFzm+cpHfW+kc9gDgzw7QaN3oySnGnlkKtSug==
X-Received: by 2002:a05:6512:ad5:b0:542:2190:9d99 with SMTP id
 2adb3069b0e04-5439c22d7fcmr220660e87.6.1737085073255; 
 Thu, 16 Jan 2025 19:37:53 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5439af62dbdsm195439e87.144.2025.01.16.19.37.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jan 2025 19:37:51 -0800 (PST)
Date: Fri, 17 Jan 2025 05:37:49 +0200
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
Message-ID: <a5ezjovkywse5pvzkm6gpgxrylfzxoahld46nenhfwa4xh2vf6@dhiwwbxauvrk>
References: <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-0-74749c6eba33@linaro.org>
 <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-10-74749c6eba33@linaro.org>
 <l6z2skrj2tvlnqok44yepqs32keuz3wsfpgsacesrxi3q4s4xb@oiicfia3tkef>
 <CABymUCOdtePUgcbtY3Xtf9detcfwm=RjG1D_sfDOSbSP-EjwXA@mail.gmail.com>
 <gj6lxrclgabwuww3rl2ynw5qmaq4lx6xycxrazcwnnf5fbezjb@oijoszqsrdps>
 <CABymUCPa_k7OriJcDNZmCER9zhK-vk78NaK5HpV8-+Ta+MQQMg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABymUCPa_k7OriJcDNZmCER9zhK-vk78NaK5HpV8-+Ta+MQQMg@mail.gmail.com>
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

On Thu, Jan 16, 2025 at 11:36:21PM +0800, Jun Nie wrote:
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> 于2025年1月16日周四 18:08写道：
> >
> > On Thu, Jan 16, 2025 at 05:49:43PM +0800, Jun Nie wrote:
> > > Dmitry Baryshkov <dmitry.baryshkov@linaro.org> 于2025年1月16日周四 16:00写道：
> > > >
> > > > On Thu, Jan 16, 2025 at 03:25:59PM +0800, Jun Nie wrote:
> > > > > Store pipes in array with removing dedicated r_pipe. There are
> > > > > 2 pipes in a drm plane at most currently, while 4 pipes are
> > > > > required for quad-pipe case. Generalize the handling to pipe pair
> > > > > and ease handling to another pipe pair later.
> > > >
> > > > With the first sentence being moved to the end of the commit message:
> > > >
> > > > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > >
> > > > Minor issues below, please address them in the next version.
> > > >
> > > > >
> > > > > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > > > > ---
> > > > >  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  |  35 +++----
> > > > >  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 167 +++++++++++++++++-------------
> > > > >  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h |  12 +--
> > > > >  3 files changed, 112 insertions(+), 102 deletions(-)
> > > >
> > > > > @@ -853,6 +855,9 @@ static int dpu_plane_atomic_check_nosspp(struct drm_plane *plane,
> > > > >               return -EINVAL;
> > > > >       }
> > > > >
> > > > > +     /* move the assignment here, to ease handling to another pairs later */
> > > >
> > > > Is it a TODO comment? It reads like an order.
> > > >
> > > > > +     pipe_cfg = &pstate->pipe_cfg[0];
> > > > > +     r_pipe_cfg = &pstate->pipe_cfg[1];
> > > > >       /* state->src is 16.16, src_rect is not */
> > > > >       drm_rect_fp_to_int(&pipe_cfg->src_rect, &new_plane_state->src);
> > > > >
> > > >
> > > > > @@ -1387,17 +1394,28 @@ static void _dpu_plane_atomic_disable(struct drm_plane *plane)
> > > > >  {
> > > > >       struct drm_plane_state *state = plane->state;
> > > > >       struct dpu_plane_state *pstate = to_dpu_plane_state(state);
> > > > > -     struct dpu_sw_pipe *r_pipe = &pstate->r_pipe;
> > > > > +     struct dpu_sw_pipe *pipe;
> > > > > +     int i;
> > > > >
> > > > > -     trace_dpu_plane_disable(DRMID(plane), false,
> > > > > -                             pstate->pipe.multirect_mode);
> > > > > +     for (i = 0; i < PIPES_PER_STAGE; i += 1) {
> > > > > +             pipe = &pstate->pipe[i];
> > > > > +             if (!pipe->sspp)
> > > > > +                     continue;
> > > > >
> > > > > -     if (r_pipe->sspp) {
> > > > > -             r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> > > > > -             r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> > > > > +             trace_dpu_plane_disable(DRMID(plane), false,
> > > > > +                                     pstate->pipe[i].multirect_mode);
> > > > >
> > > > > -             if (r_pipe->sspp->ops.setup_multirect)
> > > > > -                     r_pipe->sspp->ops.setup_multirect(r_pipe);
> > > > > +             /*
> > > > > +              * clear multirect for the right pipe so that the SSPP
> > > > > +              * can be further reused in the solo mode
> > > > > +              */
> > > > > +             if (pipe->sspp && i == 1) {
> > > >
> > > > Wouldn't it be better to `&& i % 2 != 0`? Then, I think, this condition
> > > > can stay even in quad-pipe case.
> > >
> > > If all pipes are in solo mode, there is no need to test ' i %2 != 0 '. Below
> > > test shall be better, right?
> > > if (pipe->sspp && pipe->multirect_index == DPU_SSPP_RECT_1)
> >
> > Again, this will not work as expected for the SSPP-sharing case as it
> > will then clear pipe 0 for the sharing planes.
> >
> > Let me think a bit... This code resets multirect for right pipes. It was
> > added back in 4.9 to fix the case of 'master' aka RECT_0 not being a
> > part of the atomic update. However I don't think this is applicable
> > anymore. We use z_pos normalization, so all planes for a CRTC are added
> > to the commit. Please drop this piece in a separate commit.
> 
> You mean only testing sspp as below? We have to handle the default
>  non-shared case as existing implementation. Maybe we add a flag after
> sharing SSPP among planes? Otherwise, how to distinct the shared
> SSPP case and disable multi-rect mode in non-shared case?
> 
>                if (pipe->sspp) {

I was thinking about dropping this piece of code completely, but we can
do it afterwards. Note, that you check for !pipe->sspp few lines above,
so the code can become:


 for (i = 0; i < PIPES_PER_STAGE; i++) {
   pipe = &pstate->pipe[i];
   if (!pipe->sspp)
     continue;

   if (i % PIPES_PER_STAGE == 0)
     continue;

   pipe->multirect_index = DPU_SSPP_RECT_SOLO;
   ...
 }

> 
> >
> > >
> > > >
> > > > > +                     pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> > > > > +                     pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> > > > > +
> > > > > +                     if (pipe->sspp->ops.setup_multirect)
> > > > > +                             pipe->sspp->ops.setup_multirect(pipe);
> > > > > +             }
> > > > >       }
> > > > >
> > > > >       pstate->pending = true;
> > > >
> > > > --
> > > > With best wishes
> > > > Dmitry
> >
> > --
> > With best wishes
> > Dmitry

-- 
With best wishes
Dmitry
