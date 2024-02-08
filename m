Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D8DD84E226
	for <lists+dri-devel@lfdr.de>; Thu,  8 Feb 2024 14:42:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47CA910E034;
	Thu,  8 Feb 2024 13:42:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="HokeIsQG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com
 [209.85.219.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9704D10E034
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Feb 2024 13:42:16 +0000 (UTC)
Received: by mail-yb1-f180.google.com with SMTP id
 3f1490d57ef6-dc6de8a699dso1788512276.3
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Feb 2024 05:42:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707399736; x=1708004536; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=o3L07Zaa/U0Hl10b3niyIyLHQRXKQ0pEwtrFSrjTmGc=;
 b=HokeIsQG0YoG7GJHBIIdRokhucHBcln1OPS1kKuCNc7gjuao7MemUdiVRYrLu10RcF
 NPBS0EkIngyP/cYS846ZXL2ea6kZlnMtKCGrLWfJRyn6q5qyQD6O71IKacoYfKz0HKY4
 GwnD52Aq7OrZYCiRwkqw7MAaqLUZ5HzRXnWgEXIMjxvnk61p4w7s0F4lUbZhPZnD0w+t
 qkBgVEQKPqcLRa6XDa9kReia1p4h2TwdwQZckgfJoxxdQAYK4S930qQF3VzccwUivlqo
 B5YY87inbZ6niwWXofU6MXKkp8JqXMug0s2DzvBnh9JjlttUnUo1jTuamGMTgYsAaWwA
 lDdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707399736; x=1708004536;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=o3L07Zaa/U0Hl10b3niyIyLHQRXKQ0pEwtrFSrjTmGc=;
 b=K/k7FZWfK9SGQSJI0mArHoYGtL76Rrpgw3Z5U9ECziiH0j9hDvKGx80L8Q9OBRhYzt
 LV0VMgcYGQaY8QwSxX7hFpPa+sgepm8YV71ReyuHoekC7Gez2gzIEUYhVCUP45S6fs3J
 Np5XqSw0OnUadwviBpNwHKoPSV0tx5yUSgGQqzYltFlL/jb58oeJL8CXmAI+qo4XHRFe
 fAXx+lyy8WeDuhqRY61SgshDndZ7X38y0garZCt3C6SXMZbi+pgd+HrVi8ExNSC1aiDV
 fj7ddUuQqV5lCIA232lV0aZuqaQgl2/aBGXnvz2BjwFcwGg1riRVJfEkz2QInAao9XBL
 1SFQ==
X-Gm-Message-State: AOJu0YwX9pAW0+5AzL8bYFJkxB1OiwlJv4bY2m2gWUnUSe73bmnp+AeA
 dXqIrWVjYRxfu09Fwxf1X0g5dceZRi/cq0CLgBCHI+g/R67Xb98kQro1PScCl8gxBqx85OJlOCb
 hPtNJ551ppjs0j9PjOuAcZpy0pjQr6PsGIkEFnQ==
X-Google-Smtp-Source: AGHT+IF7a6DN/3MmFz1RM6AZhkpDQ4lVtxHHUav0Cuj2WGI8kn65F++9hx3M+kVNGIRqQ/jr0jj40W+GNOPvctN6WRg=
X-Received: by 2002:a5b:bc4:0:b0:dc6:dc58:8793 with SMTP id
 c4-20020a5b0bc4000000b00dc6dc588793mr7751830ybr.45.1707399735707; Thu, 08 Feb
 2024 05:42:15 -0800 (PST)
MIME-Version: 1.0
References: <20240129-x1e80100-display-v1-0-0d9eb8254df0@linaro.org>
 <20240129-x1e80100-display-v1-3-0d9eb8254df0@linaro.org>
 <CAA8EJponbo2vvuj2ftCQuxtrZp0w7JQqJ_ADF80Wd2y1V74BzA@mail.gmail.com>
 <ZcTZL+fls7A8O9P0@linaro.org>
In-Reply-To: <ZcTZL+fls7A8O9P0@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 8 Feb 2024 15:42:04 +0200
Message-ID: <CAA8EJpr3p286ff1pHhhBdF7GA=g8Pnv9yWDukwnnNaOuykPcTQ@mail.gmail.com>
Subject: Re: [PATCH 3/5] drm/msm: mdss: Add X1E80100 support
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
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

On Thu, 8 Feb 2024 at 15:37, Abel Vesa <abel.vesa@linaro.org> wrote:
>
> On 24-01-29 17:11:25, Dmitry Baryshkov wrote:
> > On Mon, 29 Jan 2024 at 15:19, Abel Vesa <abel.vesa@linaro.org> wrote:
> > >
> > > Add support for MDSS on X1E80100.
> > >
> > > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > > ---
> > >  drivers/gpu/drm/msm/msm_mdss.c | 10 ++++++++++
> > >  1 file changed, 10 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
> > > index 455b2e3a0cdd..eddf7fdbb60a 100644
> > > --- a/drivers/gpu/drm/msm/msm_mdss.c
> > > +++ b/drivers/gpu/drm/msm/msm_mdss.c
> > > @@ -564,6 +564,15 @@ static const struct msm_mdss_data sdm670_data = {
> > >         .highest_bank_bit = 1,
> > >  };
> > >
> > > +static const struct msm_mdss_data x1e80100_data = {
> > > +       .ubwc_enc_version = UBWC_4_0,
> > > +       .ubwc_dec_version = UBWC_4_3,
> > > +       .ubwc_swizzle = 6,
> > > +       .ubwc_static = 1,
> > > +       .highest_bank_bit = 2,
> > > +       .macrotile_mode = 1,
> >
> > Missing .reg_bus_bw, LGTM otherwise
>
> Dmitry, I do not have the exact value yet.
>
> Can I come back with a subsequent (different) patch to add it at a later stage
> when I have that information?
>
> I see no point in holding display support any further since it works
> fine with the default bandwith.
>
> If yes, I'll respin this series right away, but without the reg_bus_bw.

Please add a TODO or FIXME comment there.

>
> >
> > > +};
> > > +
> > >  static const struct msm_mdss_data sdm845_data = {
> > >         .ubwc_enc_version = UBWC_2_0,
> > >         .ubwc_dec_version = UBWC_2_0,
> > > @@ -655,6 +664,7 @@ static const struct of_device_id mdss_dt_match[] = {
> > >         { .compatible = "qcom,sm8450-mdss", .data = &sm8350_data },
> > >         { .compatible = "qcom,sm8550-mdss", .data = &sm8550_data },
> > >         { .compatible = "qcom,sm8650-mdss", .data = &sm8550_data},
> > > +       { .compatible = "qcom,x1e80100-mdss", .data = &x1e80100_data},
> > >         {}
> > >  };
> > >  MODULE_DEVICE_TABLE(of, mdss_dt_match);
> > >
> > > --
> > > 2.34.1
> > >
> >
> >
> > --
> > With best wishes
> > Dmitry



-- 
With best wishes
Dmitry
