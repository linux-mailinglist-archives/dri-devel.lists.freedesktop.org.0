Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B081D735A11
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jun 2023 16:52:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F46810E06B;
	Mon, 19 Jun 2023 14:52:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com
 [209.85.128.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFB7810E06B
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jun 2023 14:52:23 +0000 (UTC)
Received: by mail-yw1-f181.google.com with SMTP id
 00721157ae682-570002c9b38so41530707b3.1
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jun 2023 07:52:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687186342; x=1689778342;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LoOnRXHrsLLQiMhQI14PH3mvugiSH4SYYbHJHuEsw7E=;
 b=GXVsXNNfjo8sCtkhilx1W8YeEeel42j9fdB49K83DhLzaXW3ci8EXOEIiJnYP1jl81
 Eg4xRXge5fpSZkY/FUDdRzZVZJGJqABWqdiaYXjJhmefm8yu283pmBgFfYZOWJcnGvcO
 JHKuv/EmWbKaTxX41ua2/THrRiBqQlX9eLFQpHSb2FUcnIwDw5SvK+4gvOX559GK3q8x
 Xpd5UFWsN5tud5ke+hFfpyH7CjsXXBkw99kKUz3faK0MGg/klDXlhxSI2knWTmHMOxxJ
 z61eJrWzrBy0mvgilWZYfVfYZ7+SP8uErE8utOPqJmvnY9CKo8m5NxLR3d6foCha1dTu
 LdjQ==
X-Gm-Message-State: AC+VfDzhAINEug5dcBzAx/P9KEE0Up/tphX4KjYQchwVCu7LvpIlT96u
 VWScM6nQ9z/uccJZiVxDrWqSl/hhDPbopw==
X-Google-Smtp-Source: ACHHUZ6BoMtp1T+VIdedh4i0VZyWNwGYgA5sO8wQfBBwnuAfX5gwf9zZ7l7nqLbAkEL2hiLnN7N3/w==
X-Received: by 2002:a81:dd0d:0:b0:56f:ecdd:ded2 with SMTP id
 e13-20020a81dd0d000000b0056fecddded2mr10470420ywn.40.1687186342594; 
 Mon, 19 Jun 2023 07:52:22 -0700 (PDT)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com.
 [209.85.219.178]) by smtp.gmail.com with ESMTPSA id
 o12-20020a0dcc0c000000b0056d2fce4e09sm4692424ywd.42.2023.06.19.07.52.22
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Jun 2023 07:52:22 -0700 (PDT)
Received: by mail-yb1-f178.google.com with SMTP id
 3f1490d57ef6-bc4f89f0f2fso3768689276.3
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jun 2023 07:52:22 -0700 (PDT)
X-Received: by 2002:a25:7414:0:b0:bc8:cd2c:2fc with SMTP id
 p20-20020a257414000000b00bc8cd2c02fcmr6811037ybc.24.1687186341787; Mon, 19
 Jun 2023 07:52:21 -0700 (PDT)
MIME-Version: 1.0
References: <20230601154002.uv2wfatpb7b45duz@pengutronix.de>
 <CAD=FV=WvP--wJwBQtnSoW_xb57R1Wf9dH0XzWxe+NorczXfeAw@mail.gmail.com>
 <20230617161222.wy55pbomnrrlfy5u@pengutronix.de>
 <CAD=FV=U5gbMUNteyyFcTvHVBDWzfthM0aDirJC+yXGovDwMOBA@mail.gmail.com>
 <20230618123915.hmy66z7e532jhwgk@pengutronix.de>
 <jlq2xayh4dxfigfsh2fms2kt4hlrqcwxblffmqq7czbhqhhvz7@hsvol72f5i3y>
 <20230618162950.6th2yo66baqay5mv@pengutronix.de>
 <vxjp5c4wojcvbnp3ghsspwkgrc4mjmskzl56jkuxlgfhcji7kx@m3hg525p7y6a>
 <20230619105342.ugf5gz26gcalcsi6@pengutronix.de>
 <a6ex232lwyovzzazfh6jfvlwszppr2624czgcc5sa4nthkgecf@asauiw3rf4vi>
 <20230619135849.crbbeqsytla7upbw@pengutronix.de> <87bkhbjzhk.fsf@intel.com>
In-Reply-To: <87bkhbjzhk.fsf@intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 19 Jun 2023 16:52:07 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUK_smDEbqKmm_teKW=mDNxWfK8wDieBTrta1YfU3_aLA@mail.gmail.com>
Message-ID: <CAMuHMdUK_smDEbqKmm_teKW=mDNxWfK8wDieBTrta1YfU3_aLA@mail.gmail.com>
Subject: Re: patches dropped from drm-misc-next [Was: Re: [PATCH 00/53] drm:
 Convert to platform remove callback returning] void
To: Jani Nikula <jani.nikula@intel.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Stephen Rothwell <sfr@canb.auug.org.au>, dri-devel@lists.freedesktop.org,
 Maxime Ripard <mripard@kernel.org>,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jani,

On Mon, Jun 19, 2023 at 4:30=E2=80=AFPM Jani Nikula <jani.nikula@intel.com>=
 wrote:
> [Trimmed the recipients considerably; there's really no need to keep
> spamming so many people about this.]

CC sfr

> On Mon, 19 Jun 2023, Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.d=
e> wrote:
> > Not knowing dim I think there is a simple(?) technical solution here: I=
t
> > only has to make sure that after the pull request from drm-misc to drm
> > was sent, no new patches are added to the branch that is merged in next=
.
>
> The drm-misc-next and drm-intel-next branches are *always* open to
> patches, regardless of the merge window. That's not going to change. We
> never tell people "this is not the right time for your patches" due to
> the merge window, like some subsystems do.

Good (personally, I don't like it when a subsystem is not open to patches,
as it means that when I finally have time to work on patches myself, I
cannot submit them ;-)

> We have separate branches specifically for feeding to linux-next and
> they serve no other purpose. The tooling tries to push the right thing
> there, depending on the last pull request cutoff, so that linux-next
> reflects what it's supposed to, but obviously the tooling doesn't have
> the smarts to figure out when the last pull request is going to be
> sent. (Really, humans don't always get that right either, because
> predicting the future is kind of hard.)

OK. So all of this was a genuine mistake...

> Looks like you hit an issue, and although nobody else has complained
> about this one over the 9 years we've been using dim, it royally
> confused you. Sorry about that. There's always room for improvement in
> the tooling, in the process, and in the human communication.

Thanks for the explanation!

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
