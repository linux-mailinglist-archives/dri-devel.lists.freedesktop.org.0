Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51E9B6FC18C
	for <lists+dri-devel@lfdr.de>; Tue,  9 May 2023 10:17:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71BCD10E353;
	Tue,  9 May 2023 08:17:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAB7110E353;
 Tue,  9 May 2023 08:17:47 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2ac785015d6so59673051fa.0; 
 Tue, 09 May 2023 01:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683620264; x=1686212264;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=OjTLAwcSfW33yi30YSBcw2vId/+hADodVzww3zES9GU=;
 b=pHWE8RHyZks9GcELTy0ukoOUNcI9+D0e9F2EmQhVtAoUGDkCrnf2DUuh8C4EyyycvQ
 uSL6qTMRoGc3hn2ekX18vYYaJyp5R63NwzvSnFNfLybEnFuJIgOgajdzEUgLEURellYv
 CuMSnktwYlEUsf7OZZMTftJeJCFE3WXqh+wbJNKiNRjEePTzZRGMA27rNZXFx2hozNcV
 zHQKlVhn9jP4ZfHQDn7SIzEEDF4Fk1FCV9ddSOXjDXTrPT3rOW6B3gBrxlKJrIlW6Vh8
 wY0zTS8FdUnT/8KUEagK7NrOzzfpdsRATCIpZHxt5+e/N9pb3RyRQj3Avdld/UoWv5h1
 CuMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683620264; x=1686212264;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OjTLAwcSfW33yi30YSBcw2vId/+hADodVzww3zES9GU=;
 b=jOcDmB6+DGxVojxjMPZkOT3MjWOH7J5tDy/a+/4coPNsdICL4KTnXXG7oY37wJdiUU
 lJ9ZbrK3TyXBUGqKtndMlqI8/DUifKbrfjwKCuS1B+wzwteUTwlF+ZAerzSRwTt2vpD6
 9XKSqKUQDhcdniDLS/LvKfny0pi1gy+8221Bt1hzZIeVFK9dlkqGdFiJW352dq3vsGDV
 pId1KQmefqEBqgspHa+eSBjfW7mqnVMLgYW3/FgPMFInRi/yW7VUse3to762e/ULsHS4
 3v5hqiGjBDP0t5EL9u66jKc+7Y7Dat+On5gWI8Ls3m0UjJAapWJQA7x5P1TnfVut4cQO
 KLJQ==
X-Gm-Message-State: AC+VfDw0BXobwllVXn9Pk5Y1ciGBd2InjR7ExINHbjdv//9wLSwYkiHM
 fMBTMtQH6FSPI65w1y5TJ64=
X-Google-Smtp-Source: ACHHUZ7LmCOCJAG91ndd96qEzYRQHJZz/LW5LKu+Xq4HKJz+vwFXFAqATkDKJpUyyv74wyXlx4VOxw==
X-Received: by 2002:a2e:3211:0:b0:2a8:ba15:eb6f with SMTP id
 y17-20020a2e3211000000b002a8ba15eb6fmr578855ljy.6.1683620264268; 
 Tue, 09 May 2023 01:17:44 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 22-20020ac24856000000b004f252f48e5fsm264614lfy.40.2023.05.09.01.17.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 May 2023 01:17:43 -0700 (PDT)
Date: Tue, 9 May 2023 11:17:40 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Steven Kucharzyk <stvr_8888@comcast.net>
Subject: Re: [RFC] Plane color pipeline KMS uAPI
Message-ID: <20230509111740.006136cd@eldfell>
In-Reply-To: <20230508185409.07501f40@n2pa>
References: <QMers3awXvNCQlyhWdTtsPwkp5ie9bze_hD5nAccFW7a_RXlWjYB7MoUW_8CKLT2bSQwIXVi5H6VULYIxCdgvryZoAoJnC5lZgyK1QWn488=@emersion.fr>
 <ZFUgnMI4IIbv78By@phenom.ffwll.local>
 <-srJIIP1y4EoWtJAfk4_EaRpo7i2x1lXu0HKX4wLHcsmMfnrCdMb0EpPHOdedfZitFpdxIl3rDjBceq_UtYhQSIyJmNMVase-Oa9iP-RQ2o=@emersion.fr>
 <ZFVe1EPIV65ZpaQv@phenom.ffwll.local>
 <DN4DsX1iIafGb2QiXpToAtyTLkdWlCDgHjsIoC_bq9QN0iEVnuZYRH3AM6ER8AtpT0glLr_CUplpU4V7YEI1_lxcYXGeBdX54cdsO3X7-PY=@emersion.fr>
 <20230508185409.07501f40@n2pa>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.24; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/6PWX2paZD=YKgFnrO0/WtVD";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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
Cc: DRI Development <dri-devel@lists.freedesktop.org>,
 wayland-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/6PWX2paZD=YKgFnrO0/WtVD
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 8 May 2023 18:54:09 -0500
Steven Kucharzyk <stvr_8888@comcast.net> wrote:

> I'd like to ask if there is a block/flow chart/diagram that has been
> created that represent the elements that are being discussed for this
> RFC? If so, would you be so kind as to point me to it or send it to me?

Hi Steven,

the whole point of the design is that there is no predefined block
diagram or flow chart. It would not fit hardware well, as hardware
generations and vendors do not generally have a common design. Instead,
the idea is to model what the hardware can do, and for that each driver
will create a set of specific pipelines the hardware implements.
Userspace then choose a pipeline that suits it and populates its
parameters.

As for the elements themselves, we can hopefully define some commonly
available types, but undoubtedly there will be a few hardware-specific
elements as well. Otherwise some piece of special hardware functionality
cannot be used at all.

The job of defining a generic pipeline model and mapping that to actual
hardware elements is left for a userspace library. I expect there will
be multiple pipeline models, more to be introduced over time. Hence
putting that in a userspace library instead of carving it in stone at
the kernel UAPI.


Next time, please do use reply-to-all, you have again dropped everyone
and other mailing lists from the CC.


Thanks,
pq

--Sig_/6PWX2paZD=YKgFnrO0/WtVD
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmRaAaQACgkQI1/ltBGq
qqeQ7xAAi8ZuARBTtVzq/AyvqZpMOLuinoPxqtT4aLxJ28xm/jeiFuryQzQKvGN5
yns+v1Rfy5r3NOTclSY57HFlMbeA+eqd0SBP9oL2mINGV9RWOXmeM/3khxm/ra2L
EJd1PSbr9W+OxPUCo91klsF0IWlxybE5fQta6LkYTeQtm6ERCDwdmKtXKFRlW2ht
SfvZ9QEFEw2VtWmW0CjEnKRvESm6RuxzmSB1OcRhG9aFwJ+AHezzaIgeLdwxrZyN
AtV2sN7cbpYty4oGTJGfbQ+GNQ1/qE56Hyz4ajDIbaZw0KG+1kDYcSERhHPqExIL
eZyLa0uhVWrnARQIN9gPp8AHsM2+Ojtf1H/b8C9c137WW74tO2Zh2JTWIc9z5NWA
FQeBEiOmEeaoO71BJ9I6H6VIzFvxJ49bUEfb/eh97+u+DnQQB5kZeAtRAXN9IPUD
Bxe6puxx/MykRYlJ/h+2abV00SdofgUnQduVaUH2ENFnwNJuszrJ/Zs/yONDG+EI
/sRPmfnPg5LQlB+wQ4Q6VuH7FSn550Y2nxi1A+tx0pKPFLZ989/an/tokfR1aina
KLvIlUtEDBxiOaruA22XsiB7F73oKfroq5W7FyxGsmBRxDltFWVQD2HzASinJXEY
k5nTA985TZo8KPsDINEaqjTHySJS/fdtDvb6mRGlVARl1VruzSU=
=77Q8
-----END PGP SIGNATURE-----

--Sig_/6PWX2paZD=YKgFnrO0/WtVD--
