Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF123910389
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2024 13:59:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DFEB10E943;
	Thu, 20 Jun 2024 11:59:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="DpdhdmB/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com
 [209.85.128.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4850E10E09F
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 11:59:34 +0000 (UTC)
Received: by mail-yw1-f173.google.com with SMTP id
 00721157ae682-62a2424ed00so8864107b3.1
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 04:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718884773; x=1719489573; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Hba2yhY6+cS9zRWYgJ6DWNBfIqROICVlAJkK3HOraRg=;
 b=DpdhdmB/mWrdg0dwgZ3S/p8p61HoMPIhr8dbPhVUqiCZ8xiONxcVsuH+NJaUbEWplM
 U3qXRtvEOf2MflkZhflx1Z1x5mn2bLA8utOsH/Xu2kcy7MB9TIjOtMQDTFcPk7rCkcfj
 4eWHjR1ZqLrpiUbIXnvm0aV4oteBDpTH89PPJvZJStGlN5YWGuXF9RNLh19gvCQZvdux
 ktreF3+28uCBvXDgOokA3l+h98t2NHPtdZoSqp9KDEe9ON99f4xOIwbAnPSPRkIKU60s
 WY08PNcQe4Y745EiEIRI2ZXJbm2ZAqm82VEMpIkwhoMhtqaFxDvnxgkFxSE7t1VGlsKw
 9Ahw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718884773; x=1719489573;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Hba2yhY6+cS9zRWYgJ6DWNBfIqROICVlAJkK3HOraRg=;
 b=RJwEwguVim1MQTbkCRztjddORcGRx7c0kwQG2ccPzOiu9swHjGkQCskwh1H9jIG6tf
 eLjkqKEgTpRQpICKvMse0pFBEgi7MYyrfGbKSceUKuvnRJsoNu3xxdqVlD++1MF3HkRt
 0DWbHPQG9eJhFMxjt7x6xG55UthiGnqO8tEMDjgt1aKi0NdwKh8veTcv58I7sq1YP+Vc
 M3yAj/6kZjRBW/Pm6yz/7aj2ky1SJBbMkacJzqQFKVQ7VyKscb9rMe7UXGVd4lapeZFN
 Zjenitiy23mxFpgjlxsOZgnPx4JnNagKczE0eWu+gl6jwKfa92Rb52mUjcDqwzP1xDZc
 b7IA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXAj+d7qYH4PqPgsPXSZq4m4ju38ss7wbwqG5k2iyupYtzPTgJ1yJ1icY6qXAiUB7rAOp/T+Ra85SsdwRv5sFhhztduHmwGKkuc551YEiE3
X-Gm-Message-State: AOJu0Yx9l31OCCLMvGC98a/iIoUGXDPkkkL5q/V/CUhanzh9zKfHbYZs
 bemJd9q3VXIHLIvnvgIY+otXpErg78iKk0mIM+l/UrFvJ2BHKH4WQ+wkPtI67KGHtimf/w/g7v2
 qrHPkK+GQKEbmXyQEZE9Ixb0Bu1jh+p8uJ9qHVA==
X-Google-Smtp-Source: AGHT+IFjjYSy37hdNHLG7AiZ0xFq8sTXhXbpeuY8x23zxt9N1eVayw54qYltw9zRhc5ZPVpb3MiaKOR9gK1e1PANkDc=
X-Received: by 2002:a0d:e694:0:b0:632:844d:5cf2 with SMTP id
 00721157ae682-63a8fbec98dmr45645717b3.51.1718884772646; Thu, 20 Jun 2024
 04:59:32 -0700 (PDT)
MIME-Version: 1.0
References: <20240614-dpu-mode-config-width-v3-0-29ec4069c99b@linaro.org>
 <20240614-dpu-mode-config-width-v3-7-29ec4069c99b@linaro.org>
 <e191758e-3fb2-947f-09c6-71f37ab34891@quicinc.com>
 <f9b63458-6d85-b8d4-f9f8-5e1966323a54@quicinc.com>
 <CAA8EJppDcjf1JYi+iCheNt7XR-vfYx+JQ_QsBkXbR3wJD2egpg@mail.gmail.com>
 <88886ed2-d92c-ae0b-e0b6-06576e7862a2@quicinc.com>
In-Reply-To: <88886ed2-d92c-ae0b-e0b6-06576e7862a2@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 20 Jun 2024 14:59:21 +0300
Message-ID: <CAA8EJprwmF4ECxTUTsRLmgC5aCjY-1XQrE-QuxDyW+wKtxonPQ@mail.gmail.com>
Subject: Re: [PATCH v3 7/9] drm/msm/dpu: drop
 _dpu_crtc_check_and_setup_lm_bounds from atomic_begin
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 19 Jun 2024 at 20:10, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 6/18/2024 8:26 PM, Dmitry Baryshkov wrote:
> > On Wed, 19 Jun 2024 at 01:56, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> >> On 6/13/2024 4:20 PM, Abhinav Kumar wrote:
> >>> On 6/13/2024 3:36 PM, Dmitry Baryshkov wrote:
> >>>> The dpu_crtc_atomic_check() already calls the function
> >>>> _dpu_crtc_check_and_setup_lm_bounds().  There is no need to call it
> >>>> again from dpu_crtc_atomic_begin().
> >>>>
> >>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>>> ---
> >>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 2 --
> >>>>    1 file changed, 2 deletions(-)
> >>>>
> >>>
> >>> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> >>
> >>
> >> This change is causing a small regression on sc7280 chromebook.
> >>
> >> I have tested and concluded that this is causing the chrome boot
> >> animation to disappear.
> >>
> >> I have tested a couple of times and without this change it works fine.
> >>
> >> If this change was meant as an optimization, can we drop this one and
> >> investigate later why this is causing one? I have not spent time
> >> investigating why it happened. Rest of the series works well and I dont
> >> see any dependency as such. Let me know if that works for you. Otherwise
> >> I will have to spend a little more time on this patch and why chrome
> >> compositor does not like this for the animation screen.
> >
> > Oh, my. Thank you for the test!
> > I think I know what's happening. The cstate->num_mixers gets set only
> > in dpu_encoder_virt_atomic_mode_set(). So during
> > dpu_crtc_atomic_check() we don't have cstate->num_mixers is stale (and
> > if it is 0, the check is skipped).
> >
>
> Yes, it is a possible explanation for this.
>
> > I guess I'll have to move cstate->mixers[] and cstate->num_mixers
> > assignment to the dpu_encoder_virt_atomic_check(). And maybe we should
> > start thinking about my old idea of moving resource allocation to the
> > CRTC code.
> >
>
> I wonder if thats the right fix though because it seems correct to me
> that num_mixers is set in mode_set after the atomic_check phase.

The state should be consistent after the atomic_check(). Currently it
is not. cstate->num_mixers is not correct until mode_set().

>
> Perhaps the right way would be to breakup check_and_set() to check() and
> set() respectively and call only the check() part in atomic_check() and
> keep the set() part in atomic_begin to avoid duplication.
>
> Either way, I think we should re-visit this as this patch by itself is
> an optimization and I am totally fine if you want to merge the rest of
> this series just dropping this one for now.

The patch itself might be an optimization, but it pointed out the
actual issue with cstate->num_mixers.

-- 
With best wishes
Dmitry
