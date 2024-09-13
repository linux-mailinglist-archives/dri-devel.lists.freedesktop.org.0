Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E32A69779F1
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2024 09:43:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E94E610EB23;
	Fri, 13 Sep 2024 07:43:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com
 [209.85.219.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C64510EB23
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 07:43:27 +0000 (UTC)
Received: by mail-yb1-f180.google.com with SMTP id
 3f1490d57ef6-e1a9e4fa5aaso1845945276.2
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 00:43:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726213406; x=1726818206;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Uob8wHcFsSqO1Ywd9b+SmTX4fajQu+yvDZdClendtRg=;
 b=B+A9PThv9WkVvz9Q/FSJwfHtmwV2pwWN+6dEum/uYWfgpD3372nEBP4flko4ix+sne
 ENdVP7g1v2wYBYpZ9GR+kguzWAVHJ3S1/1PLog986+CEksnG1cXj5Pg2U4CG+MCBRR8J
 woFqL43VlXNlLeSkQ1wPRWkIureZMmknkIV+8hacD3qkxBxs5h7IqPJx2uSdylP+7IDg
 bcQqd53l781lCrlgr2WGB/1HQcRUKwpBtjQG2iQQawCYPSe41oSh5dSPBD/BDmum0/ro
 bLUPjIib1AT1CZQU5Rp7Qer3adRS7axRdhpqlkRXK9x+L8y/OUrDTrWNC4mrC0ProZL0
 cF3g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXkGh5aKBChLusisnsI1BjWzcVdUHVmU/658zDR+rjvM/fb3tS4aL5CNBFaD6LK2W722kbBOj9X+mo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwgifutJkgMwOKA30I701/R9e2AHrrvhRlbvISGTggeFnK4sT/z
 xtYXeSNDgSnxsRZmTZk67BDHs9A6Jo1RwT7HfxRqJcKTh7f1V3ffVp1UKguN
X-Google-Smtp-Source: AGHT+IGJmODOH3UrAsEpjCBW9R0KXJrpbcoKjvOVQDFLZIJnrSPK3rOYHDFabENfdt4Go9Cu1zASag==
X-Received: by 2002:a05:6902:1b8e:b0:e1a:ab3c:2a97 with SMTP id
 3f1490d57ef6-e1d9dc419a8mr5052659276.40.1726213406270; 
 Fri, 13 Sep 2024 00:43:26 -0700 (PDT)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com.
 [209.85.128.170]) by smtp.gmail.com with ESMTPSA id
 3f1490d57ef6-e1d7b9dca65sm1329710276.5.2024.09.13.00.43.26
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Sep 2024 00:43:26 -0700 (PDT)
Received: by mail-yw1-f170.google.com with SMTP id
 00721157ae682-6d5a4615a56so15623747b3.0
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 00:43:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWAWdDWl2cWlJ8kVe9T1jFw2t9oR1n1JHjB4RLsYb/iLlA8RgnDfubVrYRHtMquOpD0f08Fpb3Ur+g=@lists.freedesktop.org
X-Received: by 2002:a05:690c:a8b:b0:6db:d27f:dd96 with SMTP id
 00721157ae682-6dbd27fde76mr4703747b3.45.1726213405883; Fri, 13 Sep 2024
 00:43:25 -0700 (PDT)
MIME-Version: 1.0
References: <20240912171142.3241719-1-devarsht@ti.com>
 <c501c5d3-d715-4ac5-98be-35d23ad1cfbe@kernel.org>
 <3y4pqlazkuofc37s6zlw7waqzmtdl5iydhm4i3i45n6d6pnflc@osyocv7wxtif>
 <87ed5oypeh.fsf@minerva.mail-host-address-is-not-set>
In-Reply-To: <87ed5oypeh.fsf@minerva.mail-host-address-is-not-set>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 13 Sep 2024 09:43:13 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWYtsERgJH+Epq2d0P34PfVtEG69HHDLgz_nsKaxbDu4g@mail.gmail.com>
Message-ID: <CAMuHMdWYtsERgJH+Epq2d0P34PfVtEG69HHDLgz_nsKaxbDu4g@mail.gmail.com>
Subject: Re: [PATCH] drm/tidss: Add MIT license along with GPL-2.0
To: Javier Martinez Canillas <javierm@redhat.com>
Cc: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
 Danilo Krummrich <dakr@kernel.org>, Devarsh Thakkar <devarsht@ti.com>,
 jyri.sarha@iki.fi, 
 tomi.valkeinen@ideasonboard.com, airlied@gmail.com, daniel@ffwll.ch, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 praneeth@ti.com, nm@ti.com, vigneshr@ti.com, r-ravikumar@ti.com, 
 j-choudhary@ti.com, grandmaster@al2klimov.de, caihuoqing@baidu.com, 
 ahalaney@redhat.com, cai.huoqing@linux.dev, colin.i.king@gmail.com, 
 dmitry.baryshkov@linaro.org, geert+renesas@glider.be, 
 laurent.pinchart@ideasonboard.com, robh@kernel.org, sam@ravnborg.org, 
 simona.vetter@ffwll.ch, ville.syrjala@linux.intel.com, 
 wangxiaojun11@huawei.com, yuanjilin@cdjrlc.com, yuehaibing@huawei.com
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

On Fri, Sep 13, 2024 at 9:38=E2=80=AFAM Javier Martinez Canillas
<javierm@redhat.com> wrote:
> Uwe Kleine-K=C3=B6nig <u.kleine-koenig@baylibre.com> writes:

> > On Thu, Sep 12, 2024 at 10:47:31PM +0200, Danilo Krummrich wrote:
> >> On 9/12/24 7:11 PM, Devarsh Thakkar wrote:
> >> > Modify license to include dual licensing as GPL-2.0-only OR MIT lice=
nse for
> >> > tidss display driver. This allows other operating system ecosystems =
such as
> >> > Zephyr and also the commercial firmwares to refer and derive code fr=
om this
> >> > display driver in a more permissive manner.
> >> >
> >> > Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
> >>
> >> My only contribution to this driver was through DRM refactorings,
> >> but anyways:
> >>
> >> Acked-by: Danilo Krummrich <dakr@kernel.org>
> >
> > Similar for me. I only touched one of the affected files with a
> > refactoring change (34cdd1f691ade28abd36ce3cab8f9d442f43bf3f). I don't
> > assume this gives me any copyright to that driver, but to simplify
> > things:
> >
> > Acked-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@baylibre.com>
>
> Similar for me too. My only change to this driver I think was to add DRM
> panic support in commit b2cb6011bcaf ("drm/tidss: Add drm_panic support")=
.
>
> But I'm also OK with the change, so:
>
> Acked-by: Javier Martinez Canillas <javierm@redhat.com>

Similar for me, just a forgotten comment update.

Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>

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
