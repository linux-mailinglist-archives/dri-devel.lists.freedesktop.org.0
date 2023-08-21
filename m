Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA8B1782BD7
	for <lists+dri-devel@lfdr.de>; Mon, 21 Aug 2023 16:30:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D724410E279;
	Mon, 21 Aug 2023 14:30:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com
 [IPv6:2607:f8b0:4864:20::b2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68EEB10E27C
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Aug 2023 14:30:46 +0000 (UTC)
Received: by mail-yb1-xb2b.google.com with SMTP id
 3f1490d57ef6-d7260fae148so3503170276.1
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Aug 2023 07:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1692628245; x=1693233045;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nLZAfwWae+l7KovvQb+xvjIIf9zbIN7GukHDovbcWdU=;
 b=wkhk4IBHW4nyUq9sDk45zUvDNZ2LgmkjW/6P7OlrngQasHMDRd2pNfaZfztdGLUAUG
 ZzURPCJwzrY/GwrBV0HdGK0d1t+PyWJ517+SnEObWUef60OO6CFVlurjW2opXCVIZ3ww
 o0/Ec+tUMqj+8lKMwwEDtQs9RcDI7vTYOkThkTIs2ViDamUoLgwf7LjjaRm6rLOdbo1+
 BULkM8FLEPPMi9IoBE+OqIYohKQ8z5BveWxt1KkRTb5mmDAmQsshAgf8RNDNmGPweegb
 GU6uBF29clTmjwCnquHPUuEt04Cr6vB92FLA4MWzKVZoZvfYidLFHqIt+nNCNpOLJmLz
 s9Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692628245; x=1693233045;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nLZAfwWae+l7KovvQb+xvjIIf9zbIN7GukHDovbcWdU=;
 b=M6yEhN28lOE45sqSD6wTcWtQEVmoViUiFzAKXB99aMO21Q0tgD1NROLDHo60mRjyT7
 zeCY8bhJ6rUHOWztzIIHWpY7F3cdak6T8oGKkMWYeDEetl2fR3tEgYmkKaCEy8Idd4lw
 yX200H7JQZhtp+sgnZs4MIvFEX+5S/MEj80YEnjMS3XUQfcKCTc2+Lq3Z/4liByB2kK9
 XybylnAVSH2NvGqRieZbpIfFcU5jSUg68lO6pMwb3PdcSpuEFojQP+yyHAoG8AbKzxza
 HeVGs0PbOxDNJH/ZKdc5PdgtAkrziGJZEoFDcNXz+sg2lMVhTOOPR3nQPXMjXVdAevXx
 lNfA==
X-Gm-Message-State: AOJu0YwN5rUsQ6u8frghTUO8EfmWN++knYVWbfUHZGIYWPTHN08Ew9o1
 dupIo3fQGXQhs3b6KlqkUjX78H7AQ8B3C5DAWNItLQ==
X-Google-Smtp-Source: AGHT+IEtI7kyvzHlCjmS2t5LAWH1HO1EYTttLTmUAkp9ChovA1koUFNUJoeIE4gvFDjLiS2vuBccKf4ylGjPcMOM6ZA=
X-Received: by 2002:a25:ae08:0:b0:d09:d53:ce41 with SMTP id
 a8-20020a25ae08000000b00d090d53ce41mr6390313ybj.55.1692628232389; Mon, 21 Aug
 2023 07:30:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230728-solid-fill-v5-0-053dbefa909c@quicinc.com>
 <20230728-solid-fill-v5-2-053dbefa909c@quicinc.com>
 <CAA8EJpq=pbDoYc9wqKKrX+RahXp8zWTPFqVqA=S-0TkWXXJUjQ@mail.gmail.com>
 <CA+hFU4y38MTTUsbri1jy=n4Vyp7xx2CosD9Nmk97z_au6NHCdQ@mail.gmail.com>
 <CAA8EJpoFpUcQL_7pb0toDoLFsK=9GdBLQH+h_MMffrp9k7eCyw@mail.gmail.com>
 <20230818135133.3fdeddba@eldfell>
 <c4b7e9eb-fb5d-4b2f-8358-f41598d7d983@linaro.org>
 <20230818165500.50360195@eldfell>
In-Reply-To: <20230818165500.50360195@eldfell>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 21 Aug 2023 17:30:21 +0300
Message-ID: <CAA8EJpqigb8OJ-u7W9VeZtXp5rhXyU30_5wALeUDsf+rhe-kEA@mail.gmail.com>
Subject: Re: [PATCH RFC v5 02/10] drm: Introduce solid fill DRM plane property
To: Pekka Paalanen <ppaalanen@gmail.com>
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Sebastian Wick <sebastian.wick@redhat.com>, Sean Paul <sean@poorly.run>,
 dri-devel@lists.freedesktop.org, quic_abhinavk@quicinc.com,
 Maxime Ripard <mripard@kernel.org>, linux-kernel@vger.kernel.org,
 wayland-devel@lists.freedesktop.org, laurent.pinchart@ideasonboard.com,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 18 Aug 2023 at 16:55, Pekka Paalanen <ppaalanen@gmail.com> wrote:
>
> On Fri, 18 Aug 2023 14:03:14 +0300
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
>
> > On 18/08/2023 13:51, Pekka Paalanen wrote:
> > > On Fri, 4 Aug 2023 16:59:00 +0300
> > > Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
> > >
> > >> On Fri, 4 Aug 2023 at 16:44, Sebastian Wick <sebastian.wick@redhat.c=
om> wrote:
> > >>>
> > >>> On Fri, Aug 4, 2023 at 3:27=E2=80=AFPM Dmitry Baryshkov
> > >>> <dmitry.baryshkov@linaro.org> wrote:
> > >>>>
> > >>>> On Fri, 28 Jul 2023 at 20:03, Jessica Zhang <quic_jesszhan@quicinc=
.com> wrote:
> > >>>>>
> > >>>>> Document and add support for solid_fill property to drm_plane. In
> > >>>>> addition, add support for setting and getting the values for soli=
d_fill.
> > >>>>>
> > >>>>> To enable solid fill planes, userspace must assign a property blo=
b to
> > >>>>> the "solid_fill" plane property containing the following informat=
ion:
> > >>>>>
> > >>>>> struct drm_mode_solid_fill {
> > >>>>>          u32 version;
> > >>>>>          u32 r, g, b;
> > >>>>> };
> > >>>>>
> > >>>>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> > >>>>> ---
> > >>>>>   drivers/gpu/drm/drm_atomic_state_helper.c |  9 +++++
> > >>>>>   drivers/gpu/drm/drm_atomic_uapi.c         | 55 ++++++++++++++++=
+++++++++++++++
> > >>>>>   drivers/gpu/drm/drm_blend.c               | 30 ++++++++++++++++=
+
> > >>>>>   include/drm/drm_blend.h                   |  1 +
> > >>>>>   include/drm/drm_plane.h                   | 35 ++++++++++++++++=
++++
> > >>>>>   include/uapi/drm/drm_mode.h               | 24 ++++++++++++++
> > >>>>>   6 files changed, 154 insertions(+)
> > >>>>>
> > >>>>
> > >>>> [skipped most of the patch]
>
> ...
>
> > >>> Maybe another COLOR_FILL enum value
> > >>> with alpha might be better? Maybe just doing the alpha via the alph=
a
> > >>> property is good enough.
> > >>
> > >> One of our customers has a use case for setting the opaque solid fil=
l,
> > >> while keeping the plane's alpha intact.
> > >
> > > Could you explain more about why they must keep plane alpha intact
> > > instead of reprogramming everything with atomic? Is there some
> > > combination that just cannot reach the same end result via userspace
> > > manipulation of the solid fill values with plane alpha?
> > >
> > > Or is it a matter of userspace architecture where you have independen=
t
> > > components responsible for different KMS property values?
>
> > The latter one. The goal is to be able to switch between pixel sources
> > without touching any additional properties (including plane's alpha val=
ue).
>
> Sorry, but that does not seem like a good justification for KMS UAPI
> design.
>
> It is even in conflict with how atomic KMS UAPI was designed to work:
> collect all your changes into a single commit, and push it at once.
> Here we are talking about separate components changing the different
> properties of the same KMS plane even. If you want to change both plane
> opacity and contents, does it mean you need two refresh cycles, one at
> a time? Could the two components be even racing with each other,
> stalling each other randomly?

Most likely I was not verbose enough.

We want to setup the blending scene, including the FB and the solid
fill properties for the plane. FB is set up in the RGBA format, each
pixel having its own alpha value in addition to the plane's alpha
value. Then under certain circumstances, the plane gets hidden by the
solid fill (think of a curtain). We do not want to touch the global
scene setup (including plane alpha value), just switch the curtain on
and off.
I think this plays good enough with the defined plane blending rules,
where one can use pre-multiplied blending mode or use coverage
blending mode.



--
With best wishes
Dmitry
