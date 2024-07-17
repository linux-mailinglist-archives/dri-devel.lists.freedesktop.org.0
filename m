Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7542D933AE0
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jul 2024 12:07:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D86D310EA53;
	Wed, 17 Jul 2024 10:07:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="t2eyOM1y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com
 [209.85.128.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFE8E10EA53
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jul 2024 10:07:33 +0000 (UTC)
Received: by mail-yw1-f171.google.com with SMTP id
 00721157ae682-64b29539d86so59214397b3.2
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jul 2024 03:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721210853; x=1721815653; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=iiFPGR0gU3k4tCZTtBUGT3nSA1nwJ4HhDZsrK4BmglM=;
 b=t2eyOM1yBRzRoWJhqdjpk7NgkehHvqoWiTqgeZ2311M3dTYu5AwS9g1ADgTozKzVTO
 0r1L95Um1abztlY7qWQB2Dskzo7y2lkxzWvkESgdQUA4P9mOkvS3dGXiaRLdMqMKjKKs
 KuyCJyijh+UG+Tg3XQtMPPQ7ekE1b+JbuCrg1YqEKBJHKxSJm9/o3/J+Os3cY+ud+jyC
 gsCQIgSLGtRV8Vr0VEHlI7RPp/sKQPqB+Lfi9b4RLUId4HX/7923R9N2Z8Eon+NNajZ6
 9VY4ti7c1zo9g+yezCWxKKHNkChW9oe9rp4Ifu7jPgRytXRj0qMHbG0MvRLvbnHvtdCE
 4Pxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721210853; x=1721815653;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iiFPGR0gU3k4tCZTtBUGT3nSA1nwJ4HhDZsrK4BmglM=;
 b=eMnk/3S8T9BIt7In2f4Rs7zrtV8tW+md+58qBQMR2t2GN/8S5WYggid9tfXnWs4sOe
 qxvg+kLUlVB7i3omPr282UsLi4YybVmK/KbxQzfO5PEr1ed+AbbX5+9LYSooKOOgG316
 9Ilg6aMzkLYsikBuTNO3Tm6pD+zqTof3WGTvbQBlUFaEc/8RALSTnAgVxapa8N6G5mRE
 2pLLz3Kf8PnmsouP+BTs3LHiLRJcAeAoe7vKOdJYjXlrMFqYCkDOJewNWsTxBj9uopYY
 s5g/xXEdhKz9C3+CPbp0bUOsgy2z5f6hSG5qt2p4zWeUH8s2yiAG7NNfb4qmnYywTHi7
 I8/w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXPdD8EER9CSJWE11yWmAnLC2yv4MWFXnuYJhF2NivZVCqyPFmQYxI4DRC+RfAu7Dk2zcg8PGpzw2CWzXWxM6iLC/+OhlqqJNAFXSVa0meR
X-Gm-Message-State: AOJu0YzVuojsRaM8RrMpUl56abzKx43Y4lEBNlHaA+McufqpX8fskU2H
 wxm/hGXq1ryUKJ7D90w/xow1uPkiz3YD136NElXHVHdt+YklV69aNzAOETzIy7iFqfJhNhxlWP1
 +Id7jwnozl5AhleaQGgq2AywLO5guRxTrKOAmUA==
X-Google-Smtp-Source: AGHT+IHc8TGqZAwqFDlo6Dq21pNEyUGk0iKQ7/Kg+Qq13x9l/X18noftNvx9aDoaiAU4YcJRXQyyKKTDSXzpl9HWJIM=
X-Received: by 2002:a05:6902:2b84:b0:e03:b61f:22e6 with SMTP id
 3f1490d57ef6-e05ed69b163mr1422398276.9.1721210852748; Wed, 17 Jul 2024
 03:07:32 -0700 (PDT)
MIME-Version: 1.0
References: <20240716133117.483514-1-tejasvipin76@gmail.com>
 <p7fahem6egnooi5org4lv3gtz2elafylvlnyily7buvzcpv2qh@vssvpfci3lwn>
 <a05b4e6e-272a-43be-8202-2b81049a41a4@gmail.com>
In-Reply-To: <a05b4e6e-272a-43be-8202-2b81049a41a4@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 17 Jul 2024 13:07:22 +0300
Message-ID: <CAA8EJpoRd3ooMnH8Z38yNH0M-L_CUd+H4WoYydd2AEmpXGeU8Q@mail.gmail.com>
Subject: Re: [PATCH] drm/mipi-dsi: Introduce macros to create mipi_dsi_*_multi
 functions
To: Tejas Vipin <tejasvipin76@gmail.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 dianders@chromium.org, airlied@gmail.com, daniel@ffwll.ch, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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

On Wed, 17 Jul 2024 at 12:58, Tejas Vipin <tejasvipin76@gmail.com> wrote:
>
>
>
> On 7/16/24 10:31 PM, Dmitry Baryshkov wrote:
> > On Tue, Jul 16, 2024 at 07:01:17PM GMT, Tejas Vipin wrote:
> >> Introduce 2 new macros, DSI_CTX_NO_OP and MIPI_DSI_ADD_MULTI_VARIANT.
> >>
> >> DSI_CTX_NO_OP calls a function only if the context passed to it hasn't
> >> encountered any errors. It is a generic form of what mipi_dsi_msleep
> >> does.
> >>
> >> MIPI_DSI_ADD_MULTI_VARIANT defines a multi style function of any
> >> mipi_dsi function that follows a certain style. This allows us to
> >> greatly reduce the amount of redundant code written for each multi
> >> function. It reduces the overhead for a developer introducing new
> >> mipi_dsi_*_multi functions.
> >>
> >> Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>
> >> ---
> >>  drivers/gpu/drm/drm_mipi_dsi.c | 286 ++++++++++-----------------------
> >>  1 file changed, 83 insertions(+), 203 deletions(-)
> >>
> >
> > [...]
> >
> >> -void mipi_dsi_dcs_set_tear_on_multi(struct mipi_dsi_multi_context *ctx,
> >> -                                enum mipi_dsi_dcs_tear_mode mode)
> >> -{
> >> -    struct mipi_dsi_device *dsi = ctx->dsi;
> >> -    struct device *dev = &dsi->dev;
> >> -    ssize_t ret;
> >> -
> >> -    if (ctx->accum_err)
> >> -            return;
> >> -
> >> -    ret = mipi_dsi_dcs_set_tear_on(dsi, mode);
> >> -    if (ret < 0) {
> >> -            ctx->accum_err = ret;
> >> -            dev_err(dev, "sending DCS SET_TEAR_ON failed: %d\n",
> >> -                    ctx->accum_err);
> >> -    }
> >> -}
> >> -EXPORT_SYMBOL(mipi_dsi_dcs_set_tear_on_multi);
> >> +#define MIPI_DSI_ADD_MULTI_VARIANT(proto, err, inner_func, ...)     \
> >> +proto {                                                             \
> >> +    struct mipi_dsi_device *dsi = ctx->dsi;                 \
> >> +    struct device *dev = &dsi->dev;                         \
> >> +    int ret;                                                \
> >> +    \
> >> +    if (ctx->accum_err)                                     \
> >> +            return;                                         \
> >> +    \
> >> +    ret = inner_func(dsi, ##__VA_ARGS__);                   \
> >> +    if (ret < 0) {                                          \
> >> +            ctx->accum_err = ret;                           \
> >> +            dev_err(dev, err, ctx->accum_err);              \
> >> +    }                                                       \
> >> +}                                                           \
> >> +EXPORT_SYMBOL(inner_func##_multi);
> >> +
> >> +MIPI_DSI_ADD_MULTI_VARIANT(
> >> +    void mipi_dsi_picture_parameter_set_multi(
> >> +    struct mipi_dsi_multi_context *ctx,
> >> +    const struct drm_dsc_picture_parameter_set *pps),
> >> +    "sending PPS failed: %d\n",
> >> +    mipi_dsi_picture_parameter_set, pps);
> >
> > I'd say that having everything wrapped in the macro looks completely
> > unreadable.
> >
> > If you really insist, it can become something like:
> >
> > MIPI_DSI_ADD_MULTI_VARIANT(mipi_dsi_picture_parameter_set
> >       MULTI_PROTO(const struct drm_dsc_picture_parameter_set *pps),
> >       MULTI_ARGS(pps),
> >       "sending PPS failed");
> >
> > (note, I dropped the obvious parts: that the funciton is foo_multi, its
> > return type is void, first parameter is context, etc).
> >
> > However it might be better to go other way arround.
> > Do we want for all the drivers to migrate to _multi()-kind of API? If
> > so, what about renaming the multi and non-multi functions accordingly
> > and making the old API a wrapper around the multi() function?
> >
>
> I think this would be good. For the wrapper to make a multi() function
> non-multi, what do you think about a macro that would just pass a
> default dsi_ctx to the multi() func and return on error? In this case
> it would also be good to let the code fill inline instead of generating
> a whole new function imo.
>
> So in this scenario all the mipi dsi functions would be multi functions,
> and a function could be called non-multi like MACRO_NAME(func) at the
> call site.

Sounds good to me. I'd suggest to wait for a day or two for further
feedback / comments from other developers.

>
> I also think there is merit in keeping DSI_CTX_NO_OP.
>
> What do you think?
>
> --
> Tejas Vipin



-- 
With best wishes
Dmitry
