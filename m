Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 10ADB703D6A
	for <lists+dri-devel@lfdr.de>; Mon, 15 May 2023 21:13:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7667410E258;
	Mon, 15 May 2023 19:13:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com
 [IPv6:2607:f8b0:4864:20::1130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90D1210E258
 for <dri-devel@lists.freedesktop.org>; Mon, 15 May 2023 19:13:01 +0000 (UTC)
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-559e2051d05so187561017b3.3
 for <dri-devel@lists.freedesktop.org>; Mon, 15 May 2023 12:13:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684177980; x=1686769980;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=buMTvzj30ZgxcgwVKLFoA6Hv/2Gc4z76k5nbzhdcfcE=;
 b=kGyzVwdggUf0TCs+S9ne4HxjpOQvYeVlI94Z+wRM6wFu5WZrHEVjGgS/gcr5u6sSQu
 6bvrmsBvXMxD4J/AJXeUUdkaENEfKxofPyDqT6r/ILnw25Leaj2iL7fkxQyrTQapODEE
 Jf88zY6aaay7/kJJGEGT5cjSetRMC1GROJtF/UPVsbHDCX8sda8ktlMz13MnZZzrkoGQ
 QEPzI8r9Tq7hnJRZ4AqIFdHEZBuenL49+dTg56lrPvHyTSwYG4QDkJml13BgGM2QaJPh
 lKgff229nsQi6PVUMa7a2yvIYKfomzUfgTXr6x0sY874tUgTDf8HEEBStYlna/e02Sv5
 H2oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684177980; x=1686769980;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=buMTvzj30ZgxcgwVKLFoA6Hv/2Gc4z76k5nbzhdcfcE=;
 b=giXnl8Ly3hXzImnlW/PUokGm33TEE6gpY/PWnmJsp4oh/ZyEkcf+PRyOGH0pDA3k4y
 5fhgKgls0pYiE/hs/5JUmfVhzxqE6WkgKfZ3FynYBlqi09Y0Ivt9qXAKQ5Y5WVSksbMp
 DSBi+0vF/4ZpnuNviykm3nTHa5nhtHtUhtpexTopRbyOIw1Q3uXrPqLt/Ae6ZOXCGh5P
 xqKdK48xCTknnoQu7MvgBDeZSxH2RFPNQT0nuHipLCSn56PqrpYRDtKjwYhlTQPmKSxg
 dUxksmevsVLWAjrHKOXwQgB7K5o4CGFeYaE8HZXJuC8IGoYxUW5mVju2e5WKzjn8NqaU
 MLcw==
X-Gm-Message-State: AC+VfDyyo5VrTy1anIXOZUG79F4vWPdkifbxg1d+byD6u08bIHY93Rv3
 9SOhNMLxj7rys6cSUrwoZVEDpdh6iXlmz/9XoRkgQw==
X-Google-Smtp-Source: ACHHUZ4zo5Odlu/M+PIPJ0+/SGozXBDUG7yCyRfqLCsT/XHyRTLU8KzMao1l25ceAAxmRbqbJPdevypdm7mTatLG5yQ=
X-Received: by 2002:a0d:ebd6:0:b0:54f:d816:895d with SMTP id
 u205-20020a0debd6000000b0054fd816895dmr36270831ywe.28.1684177980506; Mon, 15
 May 2023 12:13:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230321011821.635977-1-dmitry.baryshkov@linaro.org>
 <20230321011821.635977-3-dmitry.baryshkov@linaro.org>
 <ea7af397-1840-f15b-6f56-2d0559b8be4d@quicinc.com>
 <CAA8EJppbXavJCT4ErBoW2cBjRoabFK58UQ39T6h96Ovm8yMdEQ@mail.gmail.com>
 <94d4bc54-74c5-f565-a75e-766fdc458f75@quicinc.com>
In-Reply-To: <94d4bc54-74c5-f565-a75e-766fdc458f75@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 15 May 2023 22:12:49 +0300
Message-ID: <CAA8EJpqWZ0X-npaMEQ6=fzyT-G+fvX_-=DsUjPnqdiuP_RO_ag@mail.gmail.com>
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

On Mon, 15 May 2023 at 21:45, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 5/14/2023 10:01 AM, Dmitry Baryshkov wrote:
> > On Sat, 13 May 2023 at 01:12, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> >>
> >>
> >>
> >> On 3/20/2023 6:18 PM, Dmitry Baryshkov wrote:
> >>> Take into account the plane rotation and flipping when calculating src
> >>> positions for the wide plane parts.
> >>>
> >>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>
> >> Do we need to have a fixes tag for this? This means we dont consider
> >> rotation while calculating src position today which is a bug?
> >
> > Hmm, I thought that I had a check forbidding rotation with the current
> > approach, but I don't see it. Most probably I thought about it and
> > then forgot to add it.
> > The proper fix should be to disallow it for static SSPP case. I'll
> > include the patch into v3.
> >
> >>
> >>> ---
> >>>    drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 27 ++++++++++++++---------
> >>>    1 file changed, 17 insertions(+), 10 deletions(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> >>> index 2e63eb0a2f3f..d43e04fc4578 100644
> >>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> >>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> >>> @@ -887,16 +887,6 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
> >>>                return -EINVAL;
> >>>        }
> >>>
> >>> -     pipe_cfg->src_rect = new_plane_state->src;
> >>> -
> >>> -     /* state->src is 16.16, src_rect is not */
> >>> -     pipe_cfg->src_rect.x1 >>= 16;
> >>> -     pipe_cfg->src_rect.x2 >>= 16;
> >>> -     pipe_cfg->src_rect.y1 >>= 16;
> >>> -     pipe_cfg->src_rect.y2 >>= 16;
> >>> -
> >>> -     pipe_cfg->dst_rect = new_plane_state->dst;
> >>> -
> >>>        fb_rect.x2 = new_plane_state->fb->width;
> >>>        fb_rect.y2 = new_plane_state->fb->height;
> >>>
> >>> @@ -912,6 +902,15 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
> >>>
> >>>        max_linewidth = pdpu->catalog->caps->max_linewidth;
> >>>
> >>> +     /* state->src is 16.16, src_rect is not */
> >>> +     drm_rect_fp_to_int(&pipe_cfg->src_rect, &new_plane_state->src);
> >>> +
> >>> +     pipe_cfg->dst_rect = new_plane_state->dst;
> >>> +
> >>> +     drm_rect_rotate(&pipe_cfg->src_rect,
> >>> +                     new_plane_state->fb->width, new_plane_state->fb->height,
> >>> +                     new_plane_state->rotation);
> >>> +
> >>>        if (drm_rect_width(&pipe_cfg->src_rect) > max_linewidth) {
> >>>                /*
> >>>                 * In parallel multirect case only the half of the usual width
> >>> @@ -959,6 +958,14 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
> >>>                r_pipe_cfg->dst_rect.x1 = pipe_cfg->dst_rect.x2;
> >>>        }
> >>>
> >>> +     drm_rect_rotate_inv(&pipe_cfg->src_rect,
> >>> +                         new_plane_state->fb->width, new_plane_state->fb->height,
> >>> +                         new_plane_state->rotation);
> >>> +     if (r_pipe->sspp)
> >>
> >> Dont you need to check for if (r_pipe_cfg) here and not if
> >> (r_pipe->sspp) because parameter you are passing is the r_pipe_cfg to
> >> drm_rect_rotate_inv().
> >
> > Of course not. r_pipe_cfg is a pointer to the field in pstate. We know
> > that it can not be NULL.
> >
>
> Ack, and my bad for not checking that r_pipe_cfg points to a field in
> pstate but .... it was just weird though that you are checking for
> r_pipe->sspp before calling a method which really doesnt care if its
> null or not. How about you use drm_rect_visible(r_pipe_cfg->src_rect)
>
> If its not set, it wont be visible too.

I think it is better for the uniformity to check for r_pipe->sspp:
this is the condition that is used all over the driver to check that
r_pipe is used.

>
> >>
> >> So we rotated the pipe_cfg once, then rotated_inv it to restore the
> >> rectangle to its original state, but r_pipe_cfg's rectangle was never
> >> rotated as it was not allocated before this function so it will remain
> >> in inverse rotated state now right?
> >
> > No. r_pipe_cfg is set beforehand to the half of the rotated pipe_cfg.
> >
>
> Ok i got it now. Instead of directly operating on the plane_state's
> rectangle which makes you to invert again why not just use a temporary
> drm_rect which stores the rotated pipe_cfg->src_rect. That way you dont
> have to invert anything?

I don't think this will work. I explicitly rotate & invert rotation to
get correct coordinates for both source and destination rectangles.
Doing it otherwise would require us to manually implement this in the
DPU driver.

>
> >>> +             drm_rect_rotate_inv(&r_pipe_cfg->src_rect,
> >>> +                                 new_plane_state->fb->width, new_plane_state->fb->height,
> >>> +                                 new_plane_state->rotation);
> >>> +
> >>>        ret = dpu_plane_atomic_check_pipe(pdpu, pipe, pipe_cfg, fmt);
> >>>        if (ret)
> >>>                return ret;
> >
> >
> >
> > --
> > With best wishes
> > Dmitry



-- 
With best wishes
Dmitry
