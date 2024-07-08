Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6003929EF1
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2024 11:20:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 154F610E0E8;
	Mon,  8 Jul 2024 09:20:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com
 [209.85.219.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6921810E0E8
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jul 2024 09:20:26 +0000 (UTC)
Received: by mail-yb1-f174.google.com with SMTP id
 3f1490d57ef6-dff17fd97b3so4118518276.2
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Jul 2024 02:20:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720430424; x=1721035224;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RraAuMZIqM8eVclBnVWxcht54fRcrWMbQsKuGQTdpSU=;
 b=Ca8TmF2MBg+l75j0I9Q6+F00XiS8aXAwpUZa0+4zpxjJNmtnq5CaqkzzXIB/FX1eKt
 Xfe/SYBtxQmP/bTV1XsAOH78pMXyvq3fWJQW6ajH6f/51v1+HoY+ykkViWlazmC+SrFo
 zzojL09ZZWDEUsKw+DxINrGTp4yLeuVvmJowj0d8wQsMTAMRGD1cYhmtUH7WJgQhNFC6
 +lx0mzdjEf3DJT9PCltOXC552W/ThJSpq9sUxsb/1YVji7EiqfZt5UyBOdwzLpbFqFrm
 RqaeJaYSAmM3ASH9NvbMzugfPprS645A3QopFDSXsPgPPU2ezsSAQN2pgs9Zh7DVHiBM
 Z5sw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU8QrPS5zUxZbzXnWCQ7+jpooAfu5E1PaFx8dzc6nmiwWaqsYRAPX1nIORWMg8MQzgHj2Z81Y0hBhuJ/Mey86nCvD1btWa+ZFaTJyl2/XCn
X-Gm-Message-State: AOJu0Yx4qE9zX/kKb1mjjxcbhfCnGDwqKYmSRiO4LhiSPUW//5ImmJk2
 sGaPfp7F1nWGzcc/NGNHhz/TVwBeg9LlcHII/IRwefcLEsqWjC4UY2EQPRn/
X-Google-Smtp-Source: AGHT+IGtD3QkO0hasawKb1SJZIqiNTRRxkQXkGJu2KPbVuRUwOE4UpPiRxBn6rNA5/b8+dBy2dcthg==
X-Received: by 2002:a25:3606:0:b0:dfe:5f44:d46c with SMTP id
 3f1490d57ef6-e03c1993883mr12902166276.36.1720430423956; 
 Mon, 08 Jul 2024 02:20:23 -0700 (PDT)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com.
 [209.85.128.172]) by smtp.gmail.com with ESMTPSA id
 3f1490d57ef6-e0353f5f30esm3677759276.57.2024.07.08.02.20.23
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Jul 2024 02:20:23 -0700 (PDT)
Received: by mail-yw1-f172.google.com with SMTP id
 00721157ae682-64f4fd64773so43967607b3.0
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Jul 2024 02:20:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUmpkc6ip4GbuhoVO55cHWU8hdAzMDwpDxCOTKCQlS3QHHKykHCGADweqhvJYPfY08kqJ1QBg66fG4QI9H4gMmMwJPcr6xwHWR8UDfcHMc6
X-Received: by 2002:a05:690c:4d82:b0:618:8d66:8363 with SMTP id
 00721157ae682-652d7682c02mr152685557b3.41.1720430423213; Mon, 08 Jul 2024
 02:20:23 -0700 (PDT)
MIME-Version: 1.0
References: <20240708082712.30257-1-biju.das.jz@bp.renesas.com>
 <20240708-mighty-squid-of-glamour-6c1af7@houat>
 <TY3PR01MB113460400FF8AB36377DAFF4286DA2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB113460400FF8AB36377DAFF4286DA2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 8 Jul 2024 11:20:11 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWCKKD91WhHzTHmr95L2C3WWcynOjtTXHZpBZAssJJKUA@mail.gmail.com>
Message-ID: <CAMuHMdWCKKD91WhHzTHmr95L2C3WWcynOjtTXHZpBZAssJJKUA@mail.gmail.com>
Subject: Re: [PATCH] drm: renesas: shmobile: shmo_drm_crtc: Fix PM imbalance
 if RPM_ACTIVE is true
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Maxime Ripard <mripard@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
 "biju.das.au" <biju.das.au@gmail.com>
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

Hi Biju,

On Mon, Jul 8, 2024 at 11:00=E2=80=AFAM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
> > From: Maxime Ripard <mripard@kernel.org>
> > On Mon, Jul 08, 2024 at 09:27:09AM GMT, Biju Das wrote:
> > > The pm_runtime_resume_and_get() returns 1 if RPM is active, in this
> > > case it won't call a put. This will result in PM imbalance as it trea=
t
> > > this as an error and propagate this to caller and the caller never
> > > calls corresponding put(). Fix this issue by checking error condition
> > > only.
> > >
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

> > > --- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
> > > +++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
> > > @@ -208,7 +208,7 @@ static void shmob_drm_crtc_atomic_enable(struct d=
rm_crtc *crtc,
> > >     int ret;
> > >
> > >     ret =3D pm_runtime_resume_and_get(dev);
> > > -   if (ret)
> > > +   if (ret < 0)
> > >             return;
> >
> > The documentation of pm_runtime_resume_and_get says that:
> >
> >   Resume @dev synchronously and if that is successful, increment its
> >   runtime PM usage counter. Return 0 if the runtime PM usage counter of
> >   @dev has been incremented or a negative error code otherwise.
> >
> > So it looks like it can't return 1, ever. Are you sure you're not confu=
sing pm_runtime_resume_and_get
> > with pm_runtime_get?
>
> It should be ret < 0 as ret =3D 1 corresponds to RPM_ACTIVE and the API d=
oes not call put() when ret =3D 1; see [1] and [2]
>
> [1] https://elixir.bootlin.com/linux/v6.10-rc6/source/drivers/base/power/=
runtime.c#L778
>
> [2] https://elixir.bootlin.com/linux/v6.10-rc6/source/include/linux/pm_ru=
ntime.h#L431
>
> Am I miss anything? Please let me know.

Thanks for your patch, but the code for pm_runtime_resume_and_get()
seems to disagree?
https://elixir.bootlin.com/linux/latest/source/include/linux/pm_runtime.h#L=
436

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
