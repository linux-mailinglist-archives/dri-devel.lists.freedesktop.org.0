Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88323A428E9
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2025 18:08:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E164A10E489;
	Mon, 24 Feb 2025 17:08:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="o+xA+XU9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69C2010E489
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2025 17:08:11 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-546237cd3cbso4702218e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2025 09:08:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740416889; x=1741021689; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=SDD7C/XbQ4WEaFEyI9RS4ouDEECOxDAKosUSoNyCeps=;
 b=o+xA+XU9VQBXj6eW3MvNp6hv0Pem35pStZoOBSPreexFtfo8mR8qQgf0MRSJ+TBMQm
 SROAWK5ctCRUXe+CInGkLYLYzWuq3+qkfZpuCeNfh3I7e0bLRmb/he2i9nwlUBDWAOE5
 P4cMooKQc63195R+P+AdDk8GGNLwIQqx6N/9M/14e6e2HlCylm1+LuYivdMSw9CeFFdH
 b8iP653fiFz9WEENhqExsNnbxEUTXOgL0HlMEcN7ogwMLKcO89+WaFeX4Hc4LNRMdjhg
 CjlcJDQ1Qx+1onpePE7QSalQfEN08anZ9TNgo+ksBb0pH6IVasBRzV+5cT+edvOd/ly/
 dx7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740416889; x=1741021689;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SDD7C/XbQ4WEaFEyI9RS4ouDEECOxDAKosUSoNyCeps=;
 b=ApWejBnwIJFMCqOO4QDkM/u9nOcK236IZRTo0CQq3U/y6x2KEXUmI1WWoZ4VwnxTj6
 xl1UWcvJS//t8RjWOT487yJi+acbc/MeHCpP1g0NGANGyrkmP/+gTjT990ee5FPxwlQu
 vY8htGChur5UYFNGHCy3BF4EItE9zNfi4a0cYh3fIhs64YpRFy2yyjglfjDkpAy8f06e
 TgY4EG7tY7WwBBSnZgwr/xyQfcIK6VzAXcP6HlkcVQwVlxTQiO3HalmBBl3LQxRfHuST
 5w+QEIXzJLKGmakd9I8KgLIOmMUPs9nFE5An94OYd4bDWYJcC6NROxY5hjU52dl5VuPi
 z3bQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVf2g8nvpeHbjty2Gi0oTUmOoQMPakamsl1Gu34PPfHINiUfwBx67XLxhYECRkXEqrFWGY1fxfpSSY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyWbR+LDFWT0FKO+zEnhFPabuM0m3ERsKe2kUDAYn1whG++4pu5
 4iV7vPhlox88Zgn5wb/smZaDzzYnPAuvJ47FqBO5hD97r5ulZ8qavlI7EP1THDU=
X-Gm-Gg: ASbGncsLXDPmlh7KzY2HFu9XKBuNNHz4vuerucP+D95EuB0hFJcA0w+oMFhm3syRhJz
 0JX01P0UAXPDwMEHXV6AY1dW9JqrRk1oQxsIIY8zh2q39oyhvGEWZW1fEnnfVhGdC4enBIyJIvm
 ZMyyj2iS+1FnMY2c/08C5LsjcjV459+UWQQWGmkKtz+56Rjns2nmXdo+gfnSPXv+Iv6p9zSnULY
 A647GFspuMPA6wGy2hfNDqzSkxT1f8FxagO1rubwPN/GLUxQCuwJ/XS7Qs7ArjiPYT3rWX5Whdk
 KGAQpz1uK8+btDsnlNG7wXIcwwFNYQlos9TCstDAbAL3m6VtUMfwtt+5mYxB2SL7ROEZEx1twPh
 ZhsQQ5g==
X-Google-Smtp-Source: AGHT+IHB1gFnnaGSzBphtTkMlhlOX/xtMLMcfN5SzTa6WkSqGOzrAt8tTjA8bVyEGzKZWV+BQiheoQ==
X-Received: by 2002:a05:6512:691:b0:545:e7f:cf33 with SMTP id
 2adb3069b0e04-54838efaefcmr5529016e87.28.1740416889466; 
 Mon, 24 Feb 2025 09:08:09 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-545243fdfb6sm3283441e87.218.2025.02.24.09.08.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Feb 2025 09:08:08 -0800 (PST)
Date: Mon, 24 Feb 2025 19:08:06 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 13/15] drm/msm/dpu: support SSPP assignment for
 quad-pipe case
Message-ID: <n22g66ruabunma4w4p44zjtsnb5t4vdpjuaocasbup3alb4fxp@74tu3wnqbwfg>
References: <20250217-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v6-0-c11402574367@linaro.org>
 <20250217-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v6-13-c11402574367@linaro.org>
 <khmeegjx5jmu4c32un3gqu7sumkbtdkg6cawwwmwtmkp5gkrag@sklf5tr7qbwv>
 <CABymUCOnnWQZpOhgDfENmWrTUuwb76zSN7nSeO+eyNp4k+PKRw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABymUCOnnWQZpOhgDfENmWrTUuwb76zSN7nSeO+eyNp4k+PKRw@mail.gmail.com>
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

On Mon, Feb 24, 2025 at 06:14:22PM +0800, Jun Nie wrote:
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> 于2025年2月22日周六 00:36写道：
> >
> > On Mon, Feb 17, 2025 at 10:16:02PM +0800, Jun Nie wrote:
> > > Currently, SSPPs are assigned to a maximum of two pipes. However,
> > > quad-pipe usage scenarios require four pipes and involve configuring
> > > two stages. In quad-pipe case, the first two pipes share a set of
> > > mixer configurations and enable multi-rect mode when certain
> > > conditions are met. The same applies to the subsequent two pipes.
> > >
> > > Assign SSPPs to the pipes in each stage using a unified method and
> > > to loop the stages accordingly.
> > >
> > > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > > ---
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 63 +++++++++++++++++++------------
> > >  1 file changed, 39 insertions(+), 24 deletions(-)
> > >
> > > +     for (stage_id = 0; stage_id < num_stages; stage_id++) {
> > > +             for (i = stage_id * PIPES_PER_STAGE; i < (stage_id + 1) * PIPES_PER_STAGE; i++) {
> 
> Do you mean define and assign r_pipe / r_pipe_cfg here?

No, because for i = num_stages-1, the r_pipe would point to invalid
memory.

> 
> > > +                     pipe = &pstate->pipe[i];
> > > +                     pipe_cfg = &pstate->pipe_cfg[i];
> > > +
> > > +                     if (drm_rect_width(&pipe_cfg->src_rect) == 0)
> > > +                             break;
> > > +
> > > +                     pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, &reqs);
> > > +                     if (!pipe->sspp)
> > > +                             return -ENODEV;
> > > +
> > > +                     r_pipe = &pstate->pipe[i + 1];
> > > +                     r_pipe_cfg = &pstate->pipe_cfg[i + 1];
> > > +
> > > +                     /*
> > > +                      * If current pipe is the first pipe in pipe pair, check
> > > +                      * multi-rect opportunity for the 2nd pipe in the pair.
> > > +                      * SSPP multi-rect mode cross mixer pairs is not supported.
> > > +                      */
> > > +                     if ((i % PIPES_PER_STAGE == 0) &&
> >
> > Please move r_pipe / r_pipe_cfg definition and assignment here.
> 
> r_pipe / r_pipe_cfg is used in this if(). Please see above question.

Maybe we can rework it somehow. I really don't fancy the after-the-array
pointer.

> >
> >
> > > +                         drm_rect_width(&r_pipe_cfg->src_rect) != 0 &&
> > > +                         dpu_plane_try_multirect_parallel(pipe, pipe_cfg, r_pipe, r_pipe_cfg,
> > > +                                                           pipe->sspp,
> > > +                                                           msm_framebuffer_format(plane_state->fb),
> > > +                                                           dpu_kms->catalog->caps->max_linewidth)) {
> > > +                             i++;
> > > +                     } else {
> > > +                             /* multirect is not possible, use two SSPP blocks */
> > > +                             pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> > > +                             pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> > > +                             DPU_DEBUG_PLANE(pdpu, "allocating sspp_%d for pipe %d.\n",
> > > +                                             pipe->sspp->idx - SSPP_NONE, i);
> > > +                     }
> > > +             }
> > >       }
> > >
> > >       return dpu_plane_atomic_check_sspp(plane, state, crtc_state);
> > >
> > > --
> > > 2.34.1
> > >
> >
> > --
> > With best wishes
> > Dmitry

-- 
With best wishes
Dmitry
