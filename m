Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99017B16854
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jul 2025 23:37:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F45710E23A;
	Wed, 30 Jul 2025 21:37:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="KCcBAvni";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7C6610E23A
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jul 2025 21:37:41 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id
 d9443c01a7336-24009eeb2a7so2851235ad.0
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jul 2025 14:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1753911460; x=1754516260;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Trba2romfAqKA5pCTcTWA+7l/bmJjMmTIDHvknnQsLU=;
 b=KCcBAvniQLhohUD7QARTSpqTJNCLJDarHRk9WUvBdfkE6q+LVxP1Lvq82RBruup+GT
 MIvc+JxnZqwW/cEunKxu4CPUmG2hERj9XrnBQH/Vu0x8pVSOn2HZilYAsc0SQeW5iuq3
 T4JkfDoIHTK7LVvE9Edzeq78qwBuFN9Y6d2DA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753911460; x=1754516260;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Trba2romfAqKA5pCTcTWA+7l/bmJjMmTIDHvknnQsLU=;
 b=a7uYCdnvVUioUEND7eOe+DdKlZ9RgcVWBiRO3uvXzvHQzaRMPUeMgeYkZB/xduvAXd
 tlbZff8s8+cOU3KH/whjg5r46giyi21FcG/WruAPp9y0pL3YsW4rX2i8nWWeCshPNpdz
 GQyoQ5EOVlhxxXYtMgg6CQwknA3X3icJ87mJdv4FnhRBtcPbey6zecdG4JQQs8hKjHyO
 qoMikzqm4KwJbFqY4rhxnpb8GbAcB/bwC2oInm7cHEssho4SGp4LsypzqGaq7Wqd57kF
 DBEXvE3npZeW5lAFHTBgXEgQiVoeyomY64lJWGoWKeiofhk09cn0vCnWMAhM6EmwOxXX
 /IDw==
X-Gm-Message-State: AOJu0YxbaQS4zWJeklFGv5hpxzJDYXIbsXAYiD5rSc9eoDGZTeBfIUPR
 p9PRiDQOoGq8Jy+GQwIoScFJezBKdNgJEJQW1iG4k7Itpkl8Opmaq4kn76/2KDqaIInOXOAb+g+
 ZbT8=
X-Gm-Gg: ASbGncteSH0FSzzXvNBYE8U8tbWvYiXsYzHvMfXaXXxyFd6O87PAg0OqkjekxBRrLFX
 cSZxm4wqgVR6MZ80Gbhf6EGvJcHIYOAbV8sP/Q3x2xZcJBUOE3NK+/92Enm6jIcbvTnt0XZ4vGK
 dRLtgpoeYanNNdyZg827UUF+sDzxzbJhDBXZ8EC8Q57YqdEm6rw+rmBPSwlgTLbkK6cv8wefOwC
 J3iA9sk+wG9ns/4sij+TeR7TLrxYZBQODfbB0iyEZmD3CC++T321+WT5suXQr4cPLYfmxGObwEK
 5VG3hy41nRIExz+UtivCwCgTcabu/ZmvN/kPwKPyNO4Uv3QaRa2HPDXMQtEKOjrYh2TuFKfddCL
 RXKX2SzEOBszWUTi9TsssaNU0kGQfF7x9EBjRxuN1foqusK9v+7xJbC7dxnlDrD/m1w==
X-Google-Smtp-Source: AGHT+IEjC4+1a4rWJ5OXylZYKLoYKEkd9PGA0tplKuXUh229KvDiQSEI14mKlCmOZjQPSoJXulepVw==
X-Received: by 2002:a17:902:f68f:b0:240:468c:83e7 with SMTP id
 d9443c01a7336-24096a4f603mr75875355ad.3.1753911459840; 
 Wed, 30 Jul 2025 14:37:39 -0700 (PDT)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com.
 [209.85.215.177]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241e899adc3sm675035ad.118.2025.07.30.14.37.38
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Jul 2025 14:37:38 -0700 (PDT)
Received: by mail-pg1-f177.google.com with SMTP id
 41be03b00d2f7-b31e0ead80eso206386a12.0
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jul 2025 14:37:38 -0700 (PDT)
X-Received: by 2002:a17:90b:2690:b0:31f:8723:d128 with SMTP id
 98e67ed59e1d1-31f8723d163mr1711464a91.34.1753911457424; Wed, 30 Jul 2025
 14:37:37 -0700 (PDT)
MIME-Version: 1.0
References: <20250727165846.38186-1-alex.vinarskis@gmail.com>
 <20250727165846.38186-4-alex.vinarskis@gmail.com>
 <CAD=FV=Xd_xL=PYvVNqQWFZGmqN+Q=SvvaBTfbv9k+fDb8QwUtQ@mail.gmail.com>
 <CAMcHhXp47zmpoNYLCVRWWBk4HcYepgWX=3kWWzW8c8+a=2kE6A@mail.gmail.com>
In-Reply-To: <CAMcHhXp47zmpoNYLCVRWWBk4HcYepgWX=3kWWzW8c8+a=2kE6A@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 30 Jul 2025 14:37:25 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XT-BBRDBHVh2KBpJydSje7_eUF19OMu9e3CcRvDf7ung@mail.gmail.com>
X-Gm-Features: Ac12FXxsWI-JqOTSi6Zqqs_uBhOIVlKslLHhjHruc_ljfiRzC80Syh2AMH_Yjow
Message-ID: <CAD=FV=XT-BBRDBHVh2KBpJydSje7_eUF19OMu9e3CcRvDf7ung@mail.gmail.com>
Subject: Re: [PATCH v1 3/3] drm/panel-edp: Add BOE NV140WUM-N64
To: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
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

Hi,

On Wed, Jul 30, 2025 at 1:38=E2=80=AFPM Aleksandrs Vinarskis
<alex.vinarskis@gmail.com> wrote:
>
> On Tue, 29 Jul 2025 at 17:50, Doug Anderson <dianders@chromium.org> wrote=
:
> >
> > Hi,
> >
> > On Sun, Jul 27, 2025 at 9:58=E2=80=AFAM Aleksandrs Vinarskis
> > <alex.vinarskis@gmail.com> wrote:
> > >
> > > Timings taken from NV140WUM-N41. It is found in some arm64 laptops,
> > > eg. Asus Zenbook A14 UX3407QA.
> > >
> > > The raw edid of the panel is:
> > > 00 ff ff ff ff ff ff 00 09 e5 f6 0c 00 00 00 00
> > > 10 22 01 04 a5 1e 13 78 07 8e 95 a6 52 4c 9d 26
> > > 0f 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
> > > 01 01 01 01 01 01 5d 30 80 a0 70 b0 28 40 30 20
> > > 36 00 2e bc 10 00 00 1a 00 00 00 fd 00 28 3c 4a
> > > 4a 0f 01 0a 20 20 20 20 20 20 00 00 00 fe 00 3d
> > > 4c 33 30 20 20 20 20 20 20 20 20 ff 00 00 00 fc
> > > 00 4e 56 31 34 30 57 55 4d 2d 4e 36 34 0a 01 f8
> > >
> > > 70 20 79 02 00 21 00 1d c8 0b 5d 07 80 07 b0 04
> > > 88 66 ea 51 cc 74 9d 66 52 0f 02 35 54 40 5e 40
> > > 5e 00 44 12 78 22 00 14 7f 5c 02 85 7f 07 9f 00
> > > 2f 00 1f 00 af 04 27 00 02 00 05 00 2b 00 0c 27
> > > 00 28 3b 00 00 27 00 28 2f 00 00 2e 00 06 00 44
> > > 40 5e 40 5e 81 00 1e 72 1a 00 00 03 71 28 3c 00
> > > 00 60 ff 60 ff 3c 00 00 00 00 e3 05 04 00 e6 06
> > > 01 01 60 60 ff 00 00 00 00 00 00 00 00 00 de 90
> > >
> > > Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
> > > ---
> > >  drivers/gpu/drm/panel/panel-edp.c | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/pane=
l/panel-edp.c
> > > index 9a56e208cbdd..b334926e96ed 100644
> > > --- a/drivers/gpu/drm/panel/panel-edp.c
> > > +++ b/drivers/gpu/drm/panel/panel-edp.c
> > > @@ -1947,6 +1947,7 @@ static const struct edp_panel_entry edp_panels[=
] =3D {
> > >         EDP_PANEL_ENTRY('B', 'O', 'E', 0x0c20, &delay_200_500_e80, "N=
T140FHM-N47"),
> > >         EDP_PANEL_ENTRY('B', 'O', 'E', 0x0c93, &delay_200_500_e200, "=
Unknown"),
> > >         EDP_PANEL_ENTRY('B', 'O', 'E', 0x0cb6, &delay_200_500_e200, "=
NT116WHM-N44"),
> > > +       EDP_PANEL_ENTRY('B', 'O', 'E', 0x0cf6, &delay_200_500_e50_p2e=
80, "NV140WUM-N64"),
> >
> > Since this is a "guess" timing without any datasheet, I'd be more
> > comfortable picking the most conservative of the "cousin" timings. Can
> > you re-send with "delay_200_500_e200" instead?
>
> Sure.
>
> Do I understand correctly that more conservative delay_200_500_e200
> will for sure not make it worse, since its more conservative? In that
> case can re-spin right away. Otherwise I would prefer to re-test it
> first, may take a few days as I do not own the hardware so need to
> propagate the change and get some feedback.

Is anything really for sure? No. :-)

...but it's _highly_ likely to not make it worse. Presumably you
tested without ${SUBJECT} patch and things worked OK aside from the
big warning splat in your logs about using the conservative timings.
Those conservative timings basically give you:

desc->delay.enable =3D 200;

...so you probably already tested with an enable timing of 200 and
using 200 here will give you the same conservative number for
"enable", will avoid some other conservative timings, and will avoid
the warning splat.

...and the "p2e80" doesn't do anything useful when enable is 200.


-Doug
