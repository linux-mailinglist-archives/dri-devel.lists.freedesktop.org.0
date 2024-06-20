Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 848DE9108AC
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2024 16:43:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA57A10EA44;
	Thu, 20 Jun 2024 14:43:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="kDdrebV9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com
 [209.85.160.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26B2D10EA44
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 14:43:01 +0000 (UTC)
Received: by mail-oa1-f52.google.com with SMTP id
 586e51a60fabf-25982aa59efso501438fac.3
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 07:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1718894577; x=1719499377;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fTqruObpt/HIvpDQMuAjEvg89Qw86zRssV1fyDgz0Hc=;
 b=kDdrebV9fJDuk0cB5Y+fQWUJaGAI4bnsR4c+Ho+7tGlDDbtOhkx0LKQfI1zse9BdZ5
 4Wbap2ckb0qP6mus3RUcPTxq00uMP1tODIRJfWbMl0xN9sXNcB56KprUWm7uRiW/F9iA
 JWfJAPyReDdOiu85mtrk4N7LwMtHE9/sx7rvY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718894577; x=1719499377;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fTqruObpt/HIvpDQMuAjEvg89Qw86zRssV1fyDgz0Hc=;
 b=kGI8R6uckbVTz2JCd4CQyYU/OIhQa+K5+QT9QT0yMgiw/OCGwqNsiEZtXFXaxNHlWK
 3xsm+2ezGUXcjJroAgNlqd2wOyeledvn7u5n+KjCXQ/ZHksWkQIffwLyfUlgN0xF5N7q
 6iBGKsKpXtdLjFsKWfbaXbpreMmOWupc3zXwD0OglKVoCAObVGWHZ3SQXO5td8dyXc8e
 vcJ+sQpkPOb9wnBw7BIvxTE+dpawg3CtIDYZwcCuo0uXmqwM4fpi0qELvcTwWZU5WrlV
 O6Csx4oyFUam4MKIrvlgeixA/0ExArouNZjmRNqovkGrd3/SFFKPZY2e/7Gd1OJw61mD
 MugA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVfksahaJdh95nkeh7fPa7yxpffzoZn4w1PVgK2kmt72or/v9NXL8Zd+M12lQLEVPVExM/qLVXDlZGIjCmz080C+cH1omiVi159zOgHpnCq
X-Gm-Message-State: AOJu0YwH7FhpYHRQK6Pj/flplQEyCCBsS5o5NPBYFu88Q3AFgd0fMAiS
 ITJswr6Ta0KbYE2NLAD1aDN87HSP7b789ZZ4fLimvUxAWfk4S9L0diRgPNUgfe5ds8AINbgog5o
 =
X-Google-Smtp-Source: AGHT+IH2kOBVO5TiHoBs+YJ9z/lw7VjEz5MfidYXNo+G1t8BtputXZwF3dWft51edJgqGtSW3zKn/g==
X-Received: by 2002:a05:6870:819e:b0:24f:d9de:3bf9 with SMTP id
 586e51a60fabf-25c94d09681mr5906508fac.47.1718894577385; 
 Thu, 20 Jun 2024 07:42:57 -0700 (PDT)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com.
 [209.85.160.175]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-798abc0ce27sm698217585a.90.2024.06.20.07.42.55
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Jun 2024 07:42:56 -0700 (PDT)
Received: by mail-qt1-f175.google.com with SMTP id
 d75a77b69052e-4405dffca81so395161cf.1
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 07:42:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXRqFx62+4bgfQUqUvrzwJKN9zYkEtO0ryMXH1OYl3or+q2ptlPaSbfjZyMawVEZfPrrxdQLvXHcx4z/WEn0D8bMug/CC9ZWZT7CLPCAePC
X-Received: by 2002:a05:622a:1301:b0:443:1cdd:7859 with SMTP id
 d75a77b69052e-444a8f6e1e0mr6647671cf.12.1718894575312; Thu, 20 Jun 2024
 07:42:55 -0700 (PDT)
MIME-Version: 1.0
References: <20240619033351.230929-1-tejasvipin76@gmail.com>
 <mozxxkpqlboh2w7bf55bezgcy5b2jfgepmgullgd24dtmwfva2@mghwg3c5an5y>
 <a9312102-44c1-4529-b3ef-a7831392c42f@gmail.com>
In-Reply-To: <a9312102-44c1-4529-b3ef-a7831392c42f@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 20 Jun 2024 07:42:39 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VJA5R1SKZe1vmRWc4=GXPbFOsT3gdj+x9cwR7YCQ8GfQ@mail.gmail.com>
Message-ID: <CAD=FV=VJA5R1SKZe1vmRWc4=GXPbFOsT3gdj+x9cwR7YCQ8GfQ@mail.gmail.com>
Subject: Re: [PATCH v2] drm/panel: raydium-rm692e5: transition to mipi_dsi
 wrapped functions
To: Tejas Vipin <tejasvipin76@gmail.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, neil.armstrong@linaro.org, 
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

Hi,

On Wed, Jun 19, 2024 at 12:23=E2=80=AFAM Tejas Vipin <tejasvipin76@gmail.co=
m> wrote:
>
>
>
> On 6/19/24 12:06 PM, Dmitry Baryshkov wrote:
> > On Wed, Jun 19, 2024 at 09:03:49AM GMT, Tejas Vipin wrote:
> >> Use functions introduced in commit 966e397e4f60 ("drm/mipi-dsi: Introd=
uce
> >> mipi_dsi_*_write_seq_multi()") and commit f79d6d28d8fe
> >> ("drm/mipi-dsi: wrap more functions for streamline handling") for the
> >> raydium rm692e5 panel.
> >>
> >> Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>
> >> ---
> >> Changes in v2:
> >>     - Change rm692e5_on to return void and take mipi_dsi_multi_context
> >>       as an argument.
> >>     - Remove unnecessary warnings.
> >>     - More efficient error handling in rm692e5_prepare
> >>
> >> v1: https://lore.kernel.org/all/20240615093758.65431-1-tejasvipin76@gm=
ail.com/
> >> ---
> >>  drivers/gpu/drm/panel/panel-raydium-rm692e5.c | 237 ++++++++---------=
-
> >>  1 file changed, 99 insertions(+), 138 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/panel/panel-raydium-rm692e5.c b/drivers/g=
pu/drm/panel/panel-raydium-rm692e5.c
> >> index 21d97f6b8a2f..9936bda61af2 100644
> >> --- a/drivers/gpu/drm/panel/panel-raydium-rm692e5.c
> >> +++ b/drivers/gpu/drm/panel/panel-raydium-rm692e5.c
> >
> >>  static int rm692e5_prepare(struct drm_panel *panel)
> >>  {
> >>      struct rm692e5_panel *ctx =3D to_rm692e5_panel(panel);
> >>      struct drm_dsc_picture_parameter_set pps;
> >> -    struct device *dev =3D &ctx->dsi->dev;
> >> -    int ret;
> >> +    struct mipi_dsi_multi_context dsi_ctx =3D { .dsi =3D ctx->dsi };
> >>
> >> -    ret =3D regulator_bulk_enable(ARRAY_SIZE(ctx->supplies), ctx->sup=
plies);
> >> -    if (ret < 0) {
> >> -            dev_err(dev, "Failed to enable regulators: %d\n", ret);
> >> -            return ret;
> >> -    }
> >> +    dsi_ctx.accum_err =3D regulator_bulk_enable(ARRAY_SIZE(ctx->suppl=
ies), ctx->supplies);
> >> +    if (dsi_ctx.accum_err)
> >> +            return dsi_ctx.accum_err;
> >
> > int ret, please. Let's leave dsi_ctx.accum_err for DSI errors only.
> > LGTM otherwise.
>
> Is this really necessary seeing how regulator_bulk_enable returns
> 0 on success anyways? It saves creating a new variable for a single
> check. In case you do think its necessary, should it be changed in
> himax_hx83102 too?

Right. I made the same choice as Tejas did when I wrote commit
a2ab7cb169da ("drm/panel: himax-hx83102: use wrapped MIPI DCS
functions"). In that commit message, I wrote:

It can also be noted that hx83102_prepare() has a mix of things that
can take advantage of _multi calls and things that can't. The cleanest
seemed to be to use the multi_ctx still but consistently use the
"accum_err" variable for error returns, though that's definitely a
style decision with pros and cons.

In my mind trying to juggle half the cases having the error in "ret"
and half in the DSI context was a recipe for getting mixed up and
returning the wrong error. On the other hand, it felt awkward using
the "dsi_ctx.accum_err". In the end I felt that the extra awkwardness
was worth it if it meant that I was less likely to "return ret" when
the error code was actually in "dsi_ctx.accum_err"...


-Doug
