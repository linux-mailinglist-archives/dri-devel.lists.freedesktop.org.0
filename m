Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE1066F4BA6
	for <lists+dri-devel@lfdr.de>; Tue,  2 May 2023 22:54:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8505210E035;
	Tue,  2 May 2023 20:54:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com
 [IPv6:2607:f8b0:4864:20::b35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45B4910E035
 for <dri-devel@lists.freedesktop.org>; Tue,  2 May 2023 20:54:24 +0000 (UTC)
Received: by mail-yb1-xb35.google.com with SMTP id
 3f1490d57ef6-b9a6ab9ede3so6147838276.2
 for <dri-devel@lists.freedesktop.org>; Tue, 02 May 2023 13:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683060863; x=1685652863;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=qKj2wzaGtI84pEmGbP8x31LUD/+KSxviLtyuERFjO4M=;
 b=O8tzjbmaHbS+rS2qaBvKxDBXsWjig0r/01rltb/PK9Zd46YYgMbGLrNsaKrwAG5z7j
 eaUryrqfwdnUUsn1PuSOkXgmaEG1dDYUZKnEJRZK1awWr5U87bTwNz6XCXeFKqclkxY+
 G5TPfVA0PJZV4fxaqq703RRcnw3tIzY5b4eR9jt+FqEsSsUxWu68EjfH8XOl3J9gDjJE
 UuFEzjBOIFZRktkuFpMIar/ECD52GBXqSOyB0wZzOUWvXNSi3GVPbyy0SB9wLNsu2KMn
 Z+ua7sve7HL8HII2QIQju5OZu03LgbVayfgsXZjyAUIPLr478VfDEs77nIPHFP4pQ0lo
 pj1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683060863; x=1685652863;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qKj2wzaGtI84pEmGbP8x31LUD/+KSxviLtyuERFjO4M=;
 b=Mb5W2jnAubpwH8jFaLr+w5MrMxEXcW/E1Ig2rBMfok2lxkB97/FrlDhfFO1NrYrYve
 gO5YpbAenG05VVmSKw56qbS0Ui5HGbcajEaVs7ZrACEWRVjQz/165Bb++V/WD2F5B4kn
 5UWpJvFKm5mz1wS2k/q6GZQGuh/ateSbS7YWWmb1DpBhtSctSZgwk1mZXuOFP8W7w1lk
 fZSzIes5MpI9xg8wGyiJVABmG0Yq0dnb+B2fLMZppwlELmyFIWI5VAd+VxrlW4VX41iQ
 QHdNR9gLzqhkFsu+HFyFUJaeYbsOvd0ArqE8gO4k6Dy74UsvyMOghZqqTysZVMkBNj56
 bwIw==
X-Gm-Message-State: AC+VfDzFNGGvZutWN0k4KgoBLrIu+snqIdrRAGCHpLLamdm+Yf8jZ+/P
 sksz1YNURuPx3aqLBQBqPhGjcTnG/moE++0p9i6RFg==
X-Google-Smtp-Source: ACHHUZ5V+SuJGVlvrn7iDJQE546Nk7u86in4Hl4fEzLfZZpN2U1HP8S4Nj/9qWKGFg9w0ovBejoWJFHiJ9U1aPGsNUo=
X-Received: by 2002:a25:ad53:0:b0:b9f:2fc8:d3a7 with SMTP id
 l19-20020a25ad53000000b00b9f2fc8d3a7mr844910ybe.63.1683060863068; Tue, 02 May
 2023 13:54:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230430235732.3341119-1-dmitry.baryshkov@linaro.org>
 <20230430235732.3341119-3-dmitry.baryshkov@linaro.org>
 <81d97939-1369-9a2d-01bb-ad8c8a4b7e5c@quicinc.com>
In-Reply-To: <81d97939-1369-9a2d-01bb-ad8c8a4b7e5c@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 2 May 2023 23:54:11 +0300
Message-ID: <CAA8EJprD6biRhcx5pAJvb4Jfz_L-88_=zeySReN2Y5Nrtq+_Lw@mail.gmail.com>
Subject: Re: [PATCH 2/7] drm/msm/dpu: drop dpu_encoder_early_unregister
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
Cc: freedreno@lists.freedesktop.org, Bjorn Andersson <andersson@kernel.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 linux-arm-msm@vger.kernel.org, Marijn Suijten <marijn.suijten@somainline.org>,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 2 May 2023 at 23:45, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 4/30/2023 4:57 PM, Dmitry Baryshkov wrote:
> > There is no need to clean up debugfs manually, it will be done by the
> > DRM core on device deregistration.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
>
> There are two reasons to have the debugfs removed in the early_unregister:
>
> 1) Today, registration happens in late_register(), hence to balance the
> the call in _dpu_encoder_init_debugfs(), this one is present.
>
> 2) In drm_modeset_register_all(), if drm_connector_register_all() fails,
> it calls drm_encoder_unregister_all() first which calls early_unregister().
>
> So to balance these out, dont we need to keep it?

Please correct me if I'm wrong, drm_debugfs_cleanup() should take care of that.

> >   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 8 --------
> >   1 file changed, 8 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > index 32785cb1b079..8c45c949ec39 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > @@ -2154,13 +2154,6 @@ static int dpu_encoder_late_register(struct drm_encoder *encoder)
> >       return _dpu_encoder_init_debugfs(encoder);
> >   }
> >
> > -static void dpu_encoder_early_unregister(struct drm_encoder *encoder)
> > -{
> > -     struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(encoder);
> > -
> > -     debugfs_remove_recursive(dpu_enc->debugfs_root);
> > -}
> > -
> >   static int dpu_encoder_virt_add_phys_encs(
> >               struct msm_display_info *disp_info,
> >               struct dpu_encoder_virt *dpu_enc,
> > @@ -2374,7 +2367,6 @@ static const struct drm_encoder_helper_funcs dpu_encoder_helper_funcs = {
> >   static const struct drm_encoder_funcs dpu_encoder_funcs = {
> >               .destroy = dpu_encoder_destroy,
> >               .late_register = dpu_encoder_late_register,
> > -             .early_unregister = dpu_encoder_early_unregister,
> >   };
> >
> >   struct drm_encoder *dpu_encoder_init(struct drm_device *dev,

-- 
With best wishes
Dmitry
