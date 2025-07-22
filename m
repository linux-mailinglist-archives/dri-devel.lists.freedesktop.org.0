Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93886B0E19F
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jul 2025 18:22:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03EA410E6C8;
	Tue, 22 Jul 2025 16:22:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="ciz9aBzK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
 [209.85.210.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B228F10E6CC
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 16:22:50 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id
 d2e1a72fcca58-75b5be236deso2394062b3a.0
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 09:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1753201368; x=1753806168;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xEXUdZr0ohXXfzmWQ2dHHBxRJSqO63DOp1ZvGK6vo/c=;
 b=ciz9aBzKPVzyJbRp6aQVtKnlnlVEdEI0H+qLXbYNKliAyjJVe5mO2HSgH08pFk23EQ
 XjHNQesXVJXzpLKOVdm2VGZKSsI7erxaWRxW807Wjos4O2lUFe6pd86rPr2cq9s2Golp
 uXaWltFD9SEV1yqWDSQQt0jyhQwCYbQIrd+o4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753201368; x=1753806168;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xEXUdZr0ohXXfzmWQ2dHHBxRJSqO63DOp1ZvGK6vo/c=;
 b=OQaYkrloQk/m1RdxEc9TIPg05RUJb49wz3SWXEVpffmyTR7UKuDst12ldhmabD0jbu
 YwWi4Y4E4wXuuRfn/9gD9Ww9/nHR8Tee3xAYyTPEbsF4lR/coNEaOXekRpp3fyH8kmKz
 Gy1df03k/pf+zrWrP3I89SsiTz/6O1fZV05vAblhRzyrJZRF8d/3cm7yKFw8r0yh9msr
 05dX33UpXNq4tciJXFOQ0H+kyB/k1OPavKov2rsO5NMPQRob6uiGS+Xfnf6OI/Ex5pGB
 oFsCh1MTRpYOtlbeGhFgNp6bcdJQPXN6O9E3KIIpR/SSmDt3VYSuKkwueNCbkoSWQfwV
 Lrdg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVY3Joq3Wn4QtNrS42wBrusAqq0su7tFcCtIsz2cUjTQDQsZWaWRNKtBPizSqEIxUOgCoNRZtNmEp0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyGu0ehCE2R9/69Xk3gqf3bMQNdgCcMfg9cekJ3K8EGI5VFu0pd
 WS0AJA15OwsL7cMooiPq8ahGUCwfPDVF/voMoncDJNLZLJGkF0Hv348KIgqL+uSqZCvrrslDOTV
 fuV0=
X-Gm-Gg: ASbGncsf6wuWh1KZreKH/er+SqJCkmXxhiZt53xlTXSz+ccFMYba224jIzdAWyucpG/
 Vlp2pMf6OA7+3O2Q7+MzW5DPudtpp7FGtT53qbwz3p8taLD9mDM8z8PYYaX15YBD5zfEKHliHL6
 T/fbmMaBTmL5pnwk+aK4GEYDaNdOdImAU00z6ayqTDnP4clBoWkw6Hfd36isjLBtHM9zKsulkHH
 C3XrOeYN1qShDuPoA+v5zUER5D511l5IOKdPmEF6CwiJHFUqCZBukQ81cr0tQAyoY5TiTRfydAR
 9NH/TZEC1bnl8h2Qes26FGy4Ger0MvBbtL46XimrSbUFUDhAlHLFttTlscalPvGkq1SMaG4cO8J
 /B/Lw0eIA8fmH1NghprFEEnIHvcHlaFwuWeglPc30DfS/Cu6dLAjdEYKUZq8jh39udQgcDqS5
X-Google-Smtp-Source: AGHT+IEF8kleeivIsUmfwhr3B87RM/AFJzA9wvSkSbF3HNu0+ZBZA5NDe84+kApmkwNkgSfP9GCU2A==
X-Received: by 2002:a05:6a00:460e:b0:748:de24:1ade with SMTP id
 d2e1a72fcca58-75722d62d06mr35792281b3a.7.1753201368179; 
 Tue, 22 Jul 2025 09:22:48 -0700 (PDT)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com.
 [209.85.216.46]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-759cb1575f0sm7821929b3a.75.2025.07.22.09.22.45
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Jul 2025 09:22:45 -0700 (PDT)
Received: by mail-pj1-f46.google.com with SMTP id
 98e67ed59e1d1-3135f3511bcso4709353a91.0
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 09:22:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCV7up6/y1oodEYD8CtvXlBFctl9u6gqcjMf9SEmwUjfVQDe1XlUN/vbTUtSH3G7+DRBE74CoZMuqsE=@lists.freedesktop.org
X-Received: by 2002:a17:90b:4f49:b0:311:c970:c9c0 with SMTP id
 98e67ed59e1d1-31c9f45e26cmr31413464a91.22.1753201365336; Tue, 22 Jul 2025
 09:22:45 -0700 (PDT)
MIME-Version: 1.0
References: <20250719082639.307545-1-me@brighamcampbell.com>
 <20250719082639.307545-2-me@brighamcampbell.com>
 <CAD=FV=Xzno3ReSyp9w+DC+nLoy1AXmcwd+j1=_XRxFi_k+bmng@mail.gmail.com>
 <DBI61MARVMJA.1DDSNK4TZE5TG@brighamcampbell.com>
In-Reply-To: <DBI61MARVMJA.1DDSNK4TZE5TG@brighamcampbell.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 22 Jul 2025 09:22:33 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U7rAhChkJgOXW09z6O0ad2n478oRXpeT5p9EzYTAr3mA@mail.gmail.com>
X-Gm-Features: Ac12FXwxEcBNTtJQox66nAzXomf74eWKkhHW-9gxqeg5dTLC3EZLkMZuuh1RwxM
Message-ID: <CAD=FV=U7rAhChkJgOXW09z6O0ad2n478oRXpeT5p9EzYTAr3mA@mail.gmail.com>
Subject: Re: [PATCH v5 1/4] drm: Create mipi_dsi_dual* macros
To: Brigham Campbell <me@brighamcampbell.com>
Cc: tejasvipin76@gmail.com, diogo.ivo@tecnico.ulisboa.pt, 
 skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev, 
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
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

On Mon, Jul 21, 2025 at 5:43=E2=80=AFPM Brigham Campbell <me@brighamcampbel=
l.com> wrote:
>
> On Mon Jul 21, 2025 at 10:30 AM MDT, Doug Anderson wrote:
> >> +void mpi_dsi_dual_generic_write_multi(struct mipi_dsi_device *dsi1,
> >
> > BUG: above should be "mipi", not "mpi"
> >
> >> +                                     struct mipi_dsi_device *dsi2,
> >> +                                     struct mipi_dsi_multi_context *c=
tx,
> >> +                                     const void *payload, size_t size=
)
> >> +{
> >> +       ctx->dsi =3D dsi1;
> >> +       mipi_dsi_generic_write_multi(ctx, data, len);
> >
> > BUG: "data" and "len" are not valid local variables...
> >
> >> + * mipi_dsi_dual - send the same MIPI DSI command to two interfaces
> >
> > It could be worth also pointing people to
> > mipi_dsi_dual_generic_write_seq_multi() and
> > mipi_dsi_dual_dcs_write_seq_multi() below?
> >
> >> + * @_func: MIPI DSI function or macro to pass context and arguments i=
nto
> >
> > nit: remove "or macro".
> >
> >> +               struct mipi_dsi_multi_context *_ctxcpy =3D (_ctx); \
> >> +               (_ctxcpy)->dsi =3D (_dsi1);                        \
> >
> > nit: now that "_ctxcpy" is a local variable you no longer need the
> > extra parenthesis around it.
> >
> >> +               mipi_dsi_dual_generic_write_multi(_dsi1, _dsi2, _ctx, =
d,        \
> >> +                                                        ARRAY_SIZE(d)=
);        \
> >
> > nit: the indentation of ARRAY_SIZE() is slightly off.
> >
> >> +#define mipi_dsi_dual_dcs_write_seq_multi(_dsi1, _dsi2, _ctx, _cmd, _=
seq)   \
> >
> > BUG: doesn't "_seq" need to be "_seq..." ?
> >
> > BUG: You need to remove the definition of this macro from
> > `panel-novatek-nt36523.c` or else it won't compile anymore since the
> > name of your macro is the exact same as theirs and they include this
> > header file. It would be OK w/ me if you squashed that into the same
> > patch since otherwise rejiggering things would just be churn...
>
> Sorry to have sent out such a poor quality patch, Doug! I always compile
> changed files and test my changes when I can, but I think I must have
> compiled just the lpm102a188a panel C source file itself by mistake when
> I sent out this series revision. From now on, I'll simply enable the
> relevant kernel config options and rebuild the entire kernel.
>
> I'll address each of these items in v6.

Don't worry too much about it. While it's good to make sure you test
your patches, everyone makes mistakes! :-)


> > I guess we also chose different argument orders than they did (that's
> > probably my fault, sorry!). They had the "ctx" still first and this
> > patch consistently has "dsi1" and "dsi2" first. I don't think it
> > really matters, but we should be consistent which means either
> > adjusting your patch or theirs. It's probably worth confirming that
> > the novatek driver at least compiles before you submit v6.
>
> No, this was my fault. You had suggested the correct order. When I
> implemented the change, I preferred to put `ctx` after `dsi1` and `dsi2`
> because that's what I had done when I implemented the mipi_dsi_dual
> macro. I'll swap up the order, remove the function definition from the
> novatek driver, and compile both lpm102a188a and the novatek driver
> before sending out v6.
>
> By the way, we can discuss this further when I've sent out v6, but the
> novatek driver appears to pass a mipi_dsi_context struct into the
> write_seq_multi macro directly instead of a mipi_dsi_context struct
> pointer. We opted to use a pointer in this patch series so that it can
> be passed to a function in order to reduce the compiled size of drivers.
> For now, I'll plan to solve this by changing calls to write_seq_multi in
> the novatek driver to pass a pointer. I hope that the churn that this
> will cause in the novatek driver isn't unacceptable.

Looks fine. It probably should have been a pointer in the novatek
driver to begin with, but when it was a macro it didn't really matter.

-Doug
