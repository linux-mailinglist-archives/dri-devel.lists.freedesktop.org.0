Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 903367EC7ED
	for <lists+dri-devel@lfdr.de>; Wed, 15 Nov 2023 16:53:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9498110E089;
	Wed, 15 Nov 2023 15:53:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6FEA10E089
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Nov 2023 15:53:04 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-32fadd4ad09so4835721f8f.1
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Nov 2023 07:53:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1700063583; x=1700668383;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P0o7wVY4Z+/CfE773KwLKFQ/G0W7E5XEigW016DUdkI=;
 b=SFXLNw/ErstVbZ5aRH/i6B1KXQQA/AH2XIaDoe9sNYs9ODqIKLHhqouH9WklFr0woY
 Clnm8BVZLutnYuXEZ49hsARFagbj/xaUWUUxWp0rvWvUOAkoaUIkBV9KpE6tyGWOWtjt
 Gm2sExbImyMKylW2FVhmXndR2ZzRxKA1b7vkcZZ2yFBv47kKy/2AIwmhmf7sOXow1CDq
 UkfL7yjWEiporpq2S7+EumMM7yRJCvm9M0X9pgW4Sy/Skek908KaJeutt5Nf7Nc6Yc46
 yUHPsc558uwzwSwDnXHeaJmsJGUzOXPIMZKRUnG2bbsE0qN/Fi5AsiUy8STrLXNTajxh
 XjuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700063583; x=1700668383;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=P0o7wVY4Z+/CfE773KwLKFQ/G0W7E5XEigW016DUdkI=;
 b=fBYuTEpfL5tFyN47LX7rliPhq82qLWbirO8s47NWlLqHcUU1l/NYr82Ez5IfsKptBi
 ZS41egFONPgjmOvRx7xO4AwACIVxee6EZL0Iwxfml5NrajWywsF+YaD72Rrs11F+EyIO
 7l9u7Rn6Ao7Pa2ggGZjWSxDFUYhA7bZQHwy/0k0G6w0deqpEOYOxlXaJH1zTlBdfVX3X
 ct6mGbE2fo9zPoom/MN6fsMGV6lVl7nRHQs6nZ8g0YFgG3r15sMHv8GqrXobhqYD5M1E
 yMZWspad/86fIAEDcRwgyI1ZhzFo/p/Hx36Z2UQwmjWGgrTLmOi+I5I3SOq7LqA1tu2p
 ai+A==
X-Gm-Message-State: AOJu0YwL7yedZaEsjJzLDiqRZLgSqa4Pck+Djwq1sMCF7nUomI5SUDyG
 BvkgJ7lEZmz9RLG4NJEXKnWm5fZ2RqVuIRmx7U5eZA==
X-Google-Smtp-Source: AGHT+IHV/SEME9EZGXCQLBSXL9uZD1NVc9cYfJL72n/LJIM0QFuI5owBhoOpxizaqcoECaAHSL/f3Vcb+kWc+csyNH4=
X-Received: by 2002:a5d:460a:0:b0:32f:8a7f:f00f with SMTP id
 t10-20020a5d460a000000b0032f8a7ff00fmr8654191wrq.60.1700063583161; Wed, 15
 Nov 2023 07:53:03 -0800 (PST)
MIME-Version: 1.0
References: <20231114233859.274189-1-appsforartists@google.com>
 <70f12e96-0fcc-4954-8507-27cf5e15a3b2@redhat.com>
 <CAAL3-=9YYQBV-T-KhHdYrtGHH1RC29uzTuQ98roAY9GwrNrwmg@mail.gmail.com>
 <CAAL3-=-b3-RZNNfQEYzQxK=SW4PPJ7cmrX8omBniec+tgC2frw@mail.gmail.com>
 <4570d94e-b446-4fd1-a24a-db11a87846c4@redhat.com>
In-Reply-To: <4570d94e-b446-4fd1-a24a-db11a87846c4@redhat.com>
From: Brenton Simpson <appsforartists@google.com>
Date: Wed, 15 Nov 2023 07:52:52 -0800
Message-ID: <CAAL3-=_p4waxpf9a6B0Yvno0dnakZ6f81-Kfjxwbw4jA_CrcSw@mail.gmail.com>
Subject: Re: [PATCH] drm/panel-orientation-quirks: add Lenovo Legion Go
To: Hans de Goede <hdegoede@redhat.com>
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
Cc: Patrick Thompson <ptf@google.com>, Emil Velikov <emil.l.velikov@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jared Baldridge <jrb@expunge.us>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Allen Ballway <ballway@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Yes, thanks!

That's the email attached to my public git work, so it should be the
one here as well.

Sorry for the hassle.  Very new to sending PRs over email, and still
working through the kinks.

On Wed, Nov 15, 2023 at 7:51=E2=80=AFAM Hans de Goede <hdegoede@redhat.com>=
 wrote:
>
> Hi,
>
> On 11/15/23 16:48, Brenton Simpson wrote:
> > Resending from the email address linked to my GitHub account.
>
> Ok, this doesn't really help. I'll just fix-up the author
> field of the original patch.
>
> Do understand correctly that both the author and the Signed-off-by
> should be set to:
>
> Brenton Simpson <appsforartists@google.com>
>
> ?
>
> Regards,
>
> Hans
>
>
>
> >
> > -- >8 --
> >
> > The Legion Go has a 2560x1600 portrait screen, with the native "up" fac=
ing =3D
> > the right controller (90=3DC2=3DB0 CW from the rest of the device).
> >
> > Signed-off-by: Brenton Simpson <appsforartists@google.com>
> > ---
> >  drivers/gpu/drm/drm_panel_orientation_quirks.c | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/g=
pu/d=3D
> > rm/drm_panel_orientation_quirks.c
> > index d5c1529..3d92f66 100644
> > --- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
> > +++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
> > @@ -336,6 +336,12 @@ static const struct dmi_system_id orientation_data=
[] =3D
> > =3D3D {
> >  =3D09=3D09  DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "IdeaPad Duet 3 10IGL=
5"),
> >  =3D09=3D09},
> >  =3D09=3D09.driver_data =3D3D (void *)&lcd1200x1920_rightside_up,
> > +=3D09}, {=3D09/* Lenovo Legion Go 8APU1 */
> > +=3D09=3D09.matches =3D3D {
> > +=3D09=3D09  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> > +=3D09=3D09  DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "Legion Go 8APU1"),
> > +=3D09=3D09},
> > +=3D09=3D09.driver_data =3D3D (void *)&lcd1600x2560_leftside_up,
> >  =3D09}, {=3D09/* Lenovo Yoga Book X90F / X90L */
> >  =3D09=3D09.matches =3D3D {
> >  =3D09=3D09  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Intel Corporation"),
> > --=3D20
> > 2.43.0.rc0.421.g78406f8d94-goog
> >
>
