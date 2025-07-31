Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CDA0B1785F
	for <lists+dri-devel@lfdr.de>; Thu, 31 Jul 2025 23:43:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E96B10E2C1;
	Thu, 31 Jul 2025 21:43:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="D6DMmKCd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA76C10E2C1
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Jul 2025 21:43:36 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-45618ddd62fso2717045e9.3
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Jul 2025 14:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753998215; x=1754603015; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mVuwC8UGnhHwVB50C+DPCf7wPw8Gtqu+iJNVt6eueag=;
 b=D6DMmKCdoiJb56H4pAoT/Hk6p7lryJXxzonMEOG1gCFspYC3kiG2Ub+8S2efk2RDIU
 Via2uBYaO99RlsLB8QNDhzse3LI+k4sJkyIffA3uy2wYPnXCy7boIsA/IUDLkynkHZYV
 xcBjfDutyYZVNNXpabP5XPDvuKLpcxc55qscGCVl6n1XKJ6AMZHok3RxHwigGJmW8E5w
 Np8X45e3TchZXRSAJMVGeqO4T0RD0vIy7frWALnOImKT0BRqxc/AtFnp+ROmv1MUIsW9
 OMLHv3L76JJigqVf/G1Z0zYmkHZkVPsCKLl4bWpHlmH3Bq2vumfX1xd0qh8CPe4e0Cvf
 5ABw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753998215; x=1754603015;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mVuwC8UGnhHwVB50C+DPCf7wPw8Gtqu+iJNVt6eueag=;
 b=FCnZgkoZPhnPwj612Cz9ujmKOpZ/NvOiaQ+JxH51oACTOQCEZbn3ogML+63YN0I5PO
 qWylvHaFtiBQ8yi+29jWlhS6bni2+K31sOHTdZi5HnB5uJC6MeYNSpxt2YCS8AGUWFOF
 PULLErbFBj3S3h8Z5t81v54KY5Y2T2XumroZI1Hiq6SeHyKCk34ICq+TY915uwqJPn0s
 GIunKdFGQHSVZ0Tj/WGZUM/L1fcSvdOvGdQj6p6Bm7A2vGUwj8zsnJFxB0OF/3dcNaMe
 cay6MGYDkMWKlOLJ+uThtNDtpt7q2UI+KWfqi29h75ND8ToLJQ29sDho5FlooJ4nhO6h
 +f1g==
X-Gm-Message-State: AOJu0YzJ5/p3Lq/4DLYczKRkIlGW1aGHene9qm7btYF2iuv60b5saQay
 npBJJMxqX0j4EO9jg89ecuzhn5BdBu7RPwjNa3jM/y/4+1q5adZRmqCGAXPvymoOvgcJJB7yy07
 eSTC9vTVztBkIAGmT1EuqqO2acaF1Mw==
X-Gm-Gg: ASbGnctybUtOSgLR3ELq+1IRvix7NfZGp04X3+FzZvxQDgzIACZBfy68MFakTF+qDyv
 yyHcZgGq+tHqfPOB2ZtS3i4Ei0VI+wIQiLM85BxWVAGBlyMGZo62Ufjv08YeqF7bSNLIyo/vA4s
 ER0LRGhKduLsy9Vg5kJsfE+sdR0lqjmf9gLgLdPM0ZAmfs+9yIfrSIVSmWgDpdqaj8Ynhj6fIwi
 FAJmLo=
X-Google-Smtp-Source: AGHT+IHpB6Hl4ZebtAfNcyc2eS73Ko83njTG1t6gr49Z9kbw/LLnTogLy3mZ7uIf6yNx3otUoSfmmusKFErOVSMXlfQ=
X-Received: by 2002:a05:600c:8b65:b0:441:b698:3431 with SMTP id
 5b1f17b1804b1-45892bcfaf9mr70317255e9.28.1753998214809; Thu, 31 Jul 2025
 14:43:34 -0700 (PDT)
MIME-Version: 1.0
References: <20250727165846.38186-1-alex.vinarskis@gmail.com>
 <20250727165846.38186-4-alex.vinarskis@gmail.com>
 <CAD=FV=Xd_xL=PYvVNqQWFZGmqN+Q=SvvaBTfbv9k+fDb8QwUtQ@mail.gmail.com>
 <CAMcHhXp47zmpoNYLCVRWWBk4HcYepgWX=3kWWzW8c8+a=2kE6A@mail.gmail.com>
 <CAD=FV=XT-BBRDBHVh2KBpJydSje7_eUF19OMu9e3CcRvDf7ung@mail.gmail.com>
In-Reply-To: <CAD=FV=XT-BBRDBHVh2KBpJydSje7_eUF19OMu9e3CcRvDf7ung@mail.gmail.com>
From: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Date: Thu, 31 Jul 2025 23:43:23 +0200
X-Gm-Features: Ac12FXza9SHOkn8kXzmnifFDDxgM-t8FELZFnQEfBU0CoG5aGwgQRlmAo1iH0MM
Message-ID: <CAMcHhXrStcuc-ORy7_zhjwDv=r_bUONb812VGGp_5DYatNWhaw@mail.gmail.com>
Subject: Re: [PATCH v1 3/3] drm/panel-edp: Add BOE NV140WUM-N64
To: Doug Anderson <dianders@chromium.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
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

On Wed, 30 Jul 2025 at 23:44, Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Wed, Jul 30, 2025 at 1:38=E2=80=AFPM Aleksandrs Vinarskis
> <alex.vinarskis@gmail.com> wrote:
> >
> > On Tue, 29 Jul 2025 at 17:50, Doug Anderson <dianders@chromium.org> wro=
te:
> > >
> > > Hi,
> > >
> > > On Sun, Jul 27, 2025 at 9:58=E2=80=AFAM Aleksandrs Vinarskis
> > > <alex.vinarskis@gmail.com> wrote:
> > > >
> > > > Timings taken from NV140WUM-N41. It is found in some arm64 laptops,
> > > > eg. Asus Zenbook A14 UX3407QA.
> > > >
> > > > The raw edid of the panel is:
> > > > 00 ff ff ff ff ff ff 00 09 e5 f6 0c 00 00 00 00
> > > > 10 22 01 04 a5 1e 13 78 07 8e 95 a6 52 4c 9d 26
> > > > 0f 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
> > > > 01 01 01 01 01 01 5d 30 80 a0 70 b0 28 40 30 20
> > > > 36 00 2e bc 10 00 00 1a 00 00 00 fd 00 28 3c 4a
> > > > 4a 0f 01 0a 20 20 20 20 20 20 00 00 00 fe 00 3d
> > > > 4c 33 30 20 20 20 20 20 20 20 20 ff 00 00 00 fc
> > > > 00 4e 56 31 34 30 57 55 4d 2d 4e 36 34 0a 01 f8
> > > >
> > > > 70 20 79 02 00 21 00 1d c8 0b 5d 07 80 07 b0 04
> > > > 88 66 ea 51 cc 74 9d 66 52 0f 02 35 54 40 5e 40
> > > > 5e 00 44 12 78 22 00 14 7f 5c 02 85 7f 07 9f 00
> > > > 2f 00 1f 00 af 04 27 00 02 00 05 00 2b 00 0c 27
> > > > 00 28 3b 00 00 27 00 28 2f 00 00 2e 00 06 00 44
> > > > 40 5e 40 5e 81 00 1e 72 1a 00 00 03 71 28 3c 00
> > > > 00 60 ff 60 ff 3c 00 00 00 00 e3 05 04 00 e6 06
> > > > 01 01 60 60 ff 00 00 00 00 00 00 00 00 00 de 90
> > > >
> > > > Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
> > > > ---
> > > >  drivers/gpu/drm/panel/panel-edp.c | 1 +
> > > >  1 file changed, 1 insertion(+)
> > > >
> > > > diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/pa=
nel/panel-edp.c
> > > > index 9a56e208cbdd..b334926e96ed 100644
> > > > --- a/drivers/gpu/drm/panel/panel-edp.c
> > > > +++ b/drivers/gpu/drm/panel/panel-edp.c
> > > > @@ -1947,6 +1947,7 @@ static const struct edp_panel_entry edp_panel=
s[] =3D {
> > > >         EDP_PANEL_ENTRY('B', 'O', 'E', 0x0c20, &delay_200_500_e80, =
"NT140FHM-N47"),
> > > >         EDP_PANEL_ENTRY('B', 'O', 'E', 0x0c93, &delay_200_500_e200,=
 "Unknown"),
> > > >         EDP_PANEL_ENTRY('B', 'O', 'E', 0x0cb6, &delay_200_500_e200,=
 "NT116WHM-N44"),
> > > > +       EDP_PANEL_ENTRY('B', 'O', 'E', 0x0cf6, &delay_200_500_e50_p=
2e80, "NV140WUM-N64"),
> > >
> > > Since this is a "guess" timing without any datasheet, I'd be more
> > > comfortable picking the most conservative of the "cousin" timings. Ca=
n
> > > you re-send with "delay_200_500_e200" instead?
> >
> > Sure.
> >
> > Do I understand correctly that more conservative delay_200_500_e200
> > will for sure not make it worse, since its more conservative? In that
> > case can re-spin right away. Otherwise I would prefer to re-test it
> > first, may take a few days as I do not own the hardware so need to
> > propagate the change and get some feedback.
>
> Is anything really for sure? No. :-)
>
> ...but it's _highly_ likely to not make it worse. Presumably you
> tested without ${SUBJECT} patch and things worked OK aside from the
> big warning splat in your logs about using the conservative timings.
> Those conservative timings basically give you:
>
> desc->delay.enable =3D 200;
>
> ...so you probably already tested with an enable timing of 200 and
> using 200 here will give you the same conservative number for
> "enable", will avoid some other conservative timings, and will avoid
> the warning splat.

Indeed, this is mostly to get rid of the warning, and it worked
perfectly fine without adjusted timings.
Thanks for the explanation! Will re-spin shortly.

Alex

>
> ...and the "p2e80" doesn't do anything useful when enable is 200.
>
>
> -Doug
