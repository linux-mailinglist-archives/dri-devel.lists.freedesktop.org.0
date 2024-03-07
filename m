Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D8E9875824
	for <lists+dri-devel@lfdr.de>; Thu,  7 Mar 2024 21:18:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5585110E704;
	Thu,  7 Mar 2024 20:18:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="Lwf8KH1n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com
 [209.85.210.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40B4A10F81A
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Mar 2024 20:18:41 +0000 (UTC)
Received: by mail-ot1-f49.google.com with SMTP id
 46e09a7af769-6e4fd6de193so696682a34.0
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Mar 2024 12:18:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1709842720; x=1710447520;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7MCQxZzA+X4VwUId6l+G07DVSjCf5LO0NLL8gGAxMXc=;
 b=Lwf8KH1nTp7sAMgmvWYi7tIvCcjFkV7/UlQ+qZLi6UzjlsgH75dfQIEVuMylHB1iMS
 bEaCDqHqrSESjRDQwFHcqz6UV1t2B6Kr8sMhzFQZHGERtXEHvdWmooGbS+4maVsw9M1k
 0tTu08lejrnonBrh0dvu2pkSVKood15a4KrP0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709842720; x=1710447520;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7MCQxZzA+X4VwUId6l+G07DVSjCf5LO0NLL8gGAxMXc=;
 b=W4bMHRhCgKo2tYR9bjhK46WagLFd6pnQIs7+kxjH3BAD3eom7wcEafa1EdXrxAYtU8
 GMqblDderyK9f61p8tBRwNCTXdtF6V0kjFAbiUaMUJwx3T/7ZNAGAgM6eVfle1/2rAa5
 Zj6Yv9IhFZKzjqhXIjcnunDMQjxQUJoGnij1ejAL7GnR0X1M+0o2Jt/lSCk39KWuzDTo
 inUaOeSD4y5A/tWOlwT2TIaTbqbE1oU8qz6VdN3w7ObTZzaeIno9pJ4Gz8zkL/Qh5Zai
 hTAdfGef6g+erAYOP1aYG7euiBd51wmn1QCGDrIQ4u1immdUB1I7AJTY3oDmBbTz/Y53
 1Aqw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXZnL4K0NP+NPzleSW+AKkIkwOdl0KHIXqGePw5GNiMTnbNRiGUOLmuZOnvEJY3aegZk5s84azyl7yIGwgXE1xE3/39O0El9+Yyh0L1MEVc
X-Gm-Message-State: AOJu0YwZSfWnrc1f8z+a5PaKkQuB0QPb+sGgdTZeYlbJIU28PdBlGKpj
 2vOaJtcHE3mLCHjh9Ufn3lnVrBTPi0bLGOHk8uQBYdD/rb5acXtglgQ+4yJnBzwgyI7hlwekc5+
 W1ynDE3oTlmddegLnXrsIABuv7yn11lcRoAS2
X-Google-Smtp-Source: AGHT+IHnQWZq5sTkoFgDP1OClhsVZQSs/T5a+/TDdaivOzpMFvr9a2x5ufdUSv5PqX6045dLB9IK5AV4mGBEBemRhEM=
X-Received: by 2002:a05:6830:2052:b0:6e4:8c94:bf6f with SMTP id
 f18-20020a056830205200b006e48c94bf6fmr8906984otp.37.1709842720376; Thu, 07
 Mar 2024 12:18:40 -0800 (PST)
MIME-Version: 1.0
References: <20240306200353.1436198-1-hsinyi@chromium.org>
 <20240306200353.1436198-7-hsinyi@chromium.org>
 <CAD=FV=VvhKZHVzHQdOO=_p0E5m7ig1LY2s5MZRojRynKHbF1xw@mail.gmail.com>
 <87msraw4q6.fsf@intel.com>
In-Reply-To: <87msraw4q6.fsf@intel.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Thu, 7 Mar 2024 12:18:14 -0800
Message-ID: <CAJMQK-izRv18V1o7_Q23vWFXQsFgaR74xxZ4Vby0FVtNn21TMg@mail.gmail.com>
Subject: Re: [PATCH v5 6/6] drm/panel-edp: Fix AUO 0x405c panel naming and add
 a variant
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Doug Anderson <dianders@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
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

On Thu, Mar 7, 2024 at 5:28=E2=80=AFAM Jani Nikula <jani.nikula@linux.intel=
.com> wrote:
>
> On Wed, 06 Mar 2024, Doug Anderson <dianders@chromium.org> wrote:
> > Hi,
> >
> > On Wed, Mar 6, 2024 at 12:04=E2=80=AFPM Hsin-Yi Wang <hsinyi@chromium.o=
rg> wrote:
> >>
> >> @@ -1009,6 +1009,19 @@ static const struct panel_desc auo_b101ean01 =
=3D {
> >>         },
> >>  };
> >>
> >> +static const struct drm_display_mode auo_b116xa3_mode =3D {
> >> +       .clock =3D 70589,
> >> +       .hdisplay =3D 1366,
> >> +       .hsync_start =3D 1366 + 40,
> >> +       .hsync_end =3D 1366 + 40 + 40,
> >> +       .htotal =3D 1366 + 40 + 40 + 32,
> >> +       .vdisplay =3D 768,
> >> +       .vsync_start =3D 768 + 10,
> >> +       .vsync_end =3D 768 + 10 + 12,
> >> +       .vtotal =3D 768 + 10 + 12 + 6,
> >> +       .flags =3D DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC,
> >> +};
> >> +
> >>  static const struct drm_display_mode auo_b116xak01_mode =3D {
> >>         .clock =3D 69300,
> >>         .hdisplay =3D 1366,
> >> @@ -1990,7 +2003,9 @@ static const struct edp_panel_entry edp_panels[]=
 =3D {
> >>         EDP_PANEL_ENTRY('A', 'U', 'O', 0x239b, &delay_200_500_e50, "B1=
16XAN06.1"),
> >>         EDP_PANEL_ENTRY('A', 'U', 'O', 0x255c, &delay_200_500_e50, "B1=
16XTN02.5"),
> >>         EDP_PANEL_ENTRY('A', 'U', 'O', 0x403d, &delay_200_500_e50, "B1=
40HAN04.0"),
> >> -       EDP_PANEL_ENTRY('A', 'U', 'O', 0x405c, &auo_b116xak01.delay, "=
B116XAK01.0"),
> >> +       EDP_PANEL_ENTRY('A', 'U', 'O', 0x405c, &auo_b116xak01.delay, "=
B116XAN04.0"),
> >> +       EDP_PANEL_ENTRY2('A', 'U', 'O', 0x405c, &auo_b116xak01.delay, =
"B116XAK01.0 ",
> >
> > Remove the trailing space from the string above now?
>
> Maybe it actually needs to be considered part of the name; see my other
> reply in the earlier patch.
>
I randomly checked 3 of the AUO panels that I had a datasheet with,
and all of them have a white space padding before \n.
The descriptor of that field is marked as "Reserved for definition",
unlike other characters, representing the name, which are marked with
"Manufacture P/N".

For this example, do we still want to consider the white space part of
the name? I know they didn't follow the spec exactly.

> >
> > Aside from that:
> >
> > Reviewed-by: Douglas Anderson <dianders@chromium.org>
>
> --
> Jani Nikula, Intel
