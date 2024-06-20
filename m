Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 398ED910910
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2024 16:54:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 940F810E2DD;
	Thu, 20 Jun 2024 14:54:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="BaKpkCsl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com
 [209.85.128.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12EB610E2DD
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 14:54:41 +0000 (UTC)
Received: by mail-yw1-f177.google.com with SMTP id
 00721157ae682-62cddff7f20so9105257b3.3
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 07:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718895281; x=1719500081; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7UZg6z2ZV7fEWVr/cuuO7y2J8t4KdG2GG3PzRAtJBxs=;
 b=BaKpkCslQjF3gwj05CxQJpGxRB+CoaotEkp9pjOCVuSCPGhiiSp6/+4G2FesFQ4ucU
 ok3Yb9VHUPKIttLro8MUFN602pY/yMUdOX1LDk4eEBF17rrEEUsMqSmpoSWmYnGLsEWv
 pJiIuDi+8Rcq4qHT0t2kJGcnSn69adu8DcywZcmEl3p83t4/bOUyZs233o5ZpH4iTN0H
 vChowFlTBYSe58ddj8LYTmV/TBsztXvZSp/YFOtjIkmL16Npi4vXCkq/33BcFdFTn9fQ
 LSPIt0af0hePam0SvgoZuHnoThBINg7wGnhD/3FDHqqiNVshjzGNExjO6FPZGVoIEBkU
 LiVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718895281; x=1719500081;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7UZg6z2ZV7fEWVr/cuuO7y2J8t4KdG2GG3PzRAtJBxs=;
 b=kMQGMMZniUO5P5u3NSvzPc68ZdkOMwjSgsdXPQUcSjUmYlBKVLSYpuEIW2otVLPWOn
 wtei4iwO29Q09ii8GTJYkbSXNi3zEcfSgobMDDMdP/9LWSkivV2+vUoFav8MQssdoHlB
 vjtF9c4nyWWXrWKxMJRSRwSUo1zTbQhpJoDlMf9RQ2o8+W8TZw2CaSpplrSEJUvNwFNV
 bQCSzcPgU0jc/NfZ5KGimX2ZR563D5bgBbKQFS5JPgEx8UHGrSEqCd41LFGnBp0q+gMC
 e9Z25X7MJHFodagIMkJlEfuuHE0+eq4OrZB2NF+2D7KS1n28gmPzQ+4EVq0gImHgd7ni
 JbGA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVwc0KCOLpJNVMfO9BXMo654Ng5Vg0HKm8ZnA3Vqyr8DEwGEXLrQXi9sVUHIOji0IZgzajYEeJT4x1XdGI6GYrWqK6MQUuZlC3GaWPPxopM
X-Gm-Message-State: AOJu0YxJfh/USFOXqTyIjLnn3Ygy0Qv/z53yWKQgkVYZYk8s5cjsGvBW
 XFUBK2U8BtOzQsubsH+v2eblwNolM7u61jYRHyozTlj++eEzcN4hayQlBQb+gUgN+bEUtQY3T5s
 AYYlYXZaHu5kMtN0OLuMl73qK9iD6+jD9NwYRrR4UedCa6r0WrUg=
X-Google-Smtp-Source: AGHT+IEEEALjTBQPo0s0Uauc0UaOOzy70kfdrSt7ddTWFNqet+lDyn9cqCJ27AkvRYxTAqRJyw/n1fgD1JSmJCuDlS0=
X-Received: by 2002:a0d:f484:0:b0:61a:d846:9858 with SMTP id
 00721157ae682-63a8e1dacb1mr58152777b3.20.1718895280821; Thu, 20 Jun 2024
 07:54:40 -0700 (PDT)
MIME-Version: 1.0
References: <20240619033351.230929-1-tejasvipin76@gmail.com>
 <mozxxkpqlboh2w7bf55bezgcy5b2jfgepmgullgd24dtmwfva2@mghwg3c5an5y>
 <a9312102-44c1-4529-b3ef-a7831392c42f@gmail.com>
 <CAD=FV=VJA5R1SKZe1vmRWc4=GXPbFOsT3gdj+x9cwR7YCQ8GfQ@mail.gmail.com>
In-Reply-To: <CAD=FV=VJA5R1SKZe1vmRWc4=GXPbFOsT3gdj+x9cwR7YCQ8GfQ@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 20 Jun 2024 17:54:30 +0300
Message-ID: <CAA8EJpr_HYkXnP3XR9LpDhi1xkQfE_CKJzfzGrO5qd_pQYtiOw@mail.gmail.com>
Subject: Re: [PATCH v2] drm/panel: raydium-rm692e5: transition to mipi_dsi
 wrapped functions
To: Doug Anderson <dianders@chromium.org>
Cc: Tejas Vipin <tejasvipin76@gmail.com>, neil.armstrong@linaro.org, 
 quic_jesszhan@quicinc.com, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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

On Thu, 20 Jun 2024 at 17:42, Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Wed, Jun 19, 2024 at 12:23=E2=80=AFAM Tejas Vipin <tejasvipin76@gmail.=
com> wrote:
> >
> >
> >
> > On 6/19/24 12:06 PM, Dmitry Baryshkov wrote:
> > > On Wed, Jun 19, 2024 at 09:03:49AM GMT, Tejas Vipin wrote:
> > >> Use functions introduced in commit 966e397e4f60 ("drm/mipi-dsi: Intr=
oduce
> > >> mipi_dsi_*_write_seq_multi()") and commit f79d6d28d8fe
> > >> ("drm/mipi-dsi: wrap more functions for streamline handling") for th=
e
> > >> raydium rm692e5 panel.
> > >>
> > >> Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>
> > >> ---
> > >> Changes in v2:
> > >>     - Change rm692e5_on to return void and take mipi_dsi_multi_conte=
xt
> > >>       as an argument.
> > >>     - Remove unnecessary warnings.
> > >>     - More efficient error handling in rm692e5_prepare
> > >>
> > >> v1: https://lore.kernel.org/all/20240615093758.65431-1-tejasvipin76@=
gmail.com/
> > >> ---
> > >>  drivers/gpu/drm/panel/panel-raydium-rm692e5.c | 237 ++++++++-------=
---
> > >>  1 file changed, 99 insertions(+), 138 deletions(-)
> > >>
> > >> diff --git a/drivers/gpu/drm/panel/panel-raydium-rm692e5.c b/drivers=
/gpu/drm/panel/panel-raydium-rm692e5.c
> > >> index 21d97f6b8a2f..9936bda61af2 100644
> > >> --- a/drivers/gpu/drm/panel/panel-raydium-rm692e5.c
> > >> +++ b/drivers/gpu/drm/panel/panel-raydium-rm692e5.c
> > >
> > >>  static int rm692e5_prepare(struct drm_panel *panel)
> > >>  {
> > >>      struct rm692e5_panel *ctx =3D to_rm692e5_panel(panel);
> > >>      struct drm_dsc_picture_parameter_set pps;
> > >> -    struct device *dev =3D &ctx->dsi->dev;
> > >> -    int ret;
> > >> +    struct mipi_dsi_multi_context dsi_ctx =3D { .dsi =3D ctx->dsi }=
;
> > >>
> > >> -    ret =3D regulator_bulk_enable(ARRAY_SIZE(ctx->supplies), ctx->s=
upplies);
> > >> -    if (ret < 0) {
> > >> -            dev_err(dev, "Failed to enable regulators: %d\n", ret);
> > >> -            return ret;
> > >> -    }
> > >> +    dsi_ctx.accum_err =3D regulator_bulk_enable(ARRAY_SIZE(ctx->sup=
plies), ctx->supplies);
> > >> +    if (dsi_ctx.accum_err)
> > >> +            return dsi_ctx.accum_err;
> > >
> > > int ret, please. Let's leave dsi_ctx.accum_err for DSI errors only.
> > > LGTM otherwise.
> >
> > Is this really necessary seeing how regulator_bulk_enable returns
> > 0 on success anyways? It saves creating a new variable for a single
> > check. In case you do think its necessary, should it be changed in
> > himax_hx83102 too?
>
> Right. I made the same choice as Tejas did when I wrote commit
> a2ab7cb169da ("drm/panel: himax-hx83102: use wrapped MIPI DCS
> functions"). In that commit message, I wrote:
>
> It can also be noted that hx83102_prepare() has a mix of things that
> can take advantage of _multi calls and things that can't. The cleanest
> seemed to be to use the multi_ctx still but consistently use the
> "accum_err" variable for error returns, though that's definitely a
> style decision with pros and cons.
>
> In my mind trying to juggle half the cases having the error in "ret"
> and half in the DSI context was a recipe for getting mixed up and
> returning the wrong error. On the other hand, it felt awkward using
> the "dsi_ctx.accum_err". In the end I felt that the extra awkwardness
> was worth it if it meant that I was less likely to "return ret" when
> the error code was actually in "dsi_ctx.accum_err"...

Fair point.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


--=20
With best wishes
Dmitry
