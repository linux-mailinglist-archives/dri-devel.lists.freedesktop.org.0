Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 473167A925D
	for <lists+dri-devel@lfdr.de>; Thu, 21 Sep 2023 09:57:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6323A10E581;
	Thu, 21 Sep 2023 07:57:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com
 [209.85.128.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 449C610E581
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Sep 2023 07:57:36 +0000 (UTC)
Received: by mail-yw1-f171.google.com with SMTP id
 00721157ae682-59bfb0825efso7962397b3.3
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Sep 2023 00:57:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695283055; x=1695887855;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1b4te39uCS0E/NkoW2Yy3eXJPfyE4+wAq2OQTK/UETI=;
 b=VW+jRuVYj2QJ9F4Blo4inked9JKe77cssSOHe8SP+TpSmOlgePlBXT+YmgpXTreaxy
 3QKc0F2tKuCORW/l6QLhu1NzAjKM8hwp0xTIfD2pVVvcJKxDSLkTmpT7lFczn/sLqnXu
 8eBSnJ12cEYL8EjP2jns9kY5LVAUu+BBL1gPHmpd/SCrXPCvZxNcAywHF9YtC6UIXnNP
 JB3FJF7/oQLdE04ezbmcYbJPwFcPYb3fA9ervs93hbwtTS1ckgdp0mmCYMiz0DLSGu42
 M3sJL5LFqqBQ5JxLLf78SA4zv53sp09C7Ryf5yAEsugodnezTklIrcFljY9VX3Vb7SDR
 9zFw==
X-Gm-Message-State: AOJu0YzblVwfyUx2cx7Tpt2xJdA+7x1f6tog/PPMGug2IvqCIW1biZmx
 CGNZb6U5JQNg2HwR9R3H05I+VQU4/SkkWQ==
X-Google-Smtp-Source: AGHT+IFv6jcK+39wkg6KwFtEVu0GnUVeZ6TV3oWRv3JcOTK5JW8Y0YvliusW3ECb0BgbEenwCMT7wg==
X-Received: by 2002:a0d:fd45:0:b0:58a:83cd:115d with SMTP id
 n66-20020a0dfd45000000b0058a83cd115dmr3863837ywf.50.1695283055080; 
 Thu, 21 Sep 2023 00:57:35 -0700 (PDT)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com.
 [209.85.128.180]) by smtp.gmail.com with ESMTPSA id
 c64-20020a0dc143000000b0059a34cfa2a5sm204091ywd.67.2023.09.21.00.57.34
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Sep 2023 00:57:34 -0700 (PDT)
Received: by mail-yw1-f180.google.com with SMTP id
 00721157ae682-59c00b5c8b2so8053317b3.1
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Sep 2023 00:57:34 -0700 (PDT)
X-Received: by 2002:a0d:d205:0:b0:59b:de0f:c23b with SMTP id
 u5-20020a0dd205000000b0059bde0fc23bmr4756114ywd.46.1695283054573; Thu, 21 Sep
 2023 00:57:34 -0700 (PDT)
MIME-Version: 1.0
References: <20230914195138.1518065-1-javierm@redhat.com>
 <f5620d32-2705-498b-a65c-7dc663340a6d@suse.de>
 <87wmwo3q50.fsf@minerva.mail-host-address-is-not-set>
 <552hpgr7qzbjxuyei3n5m7rsn7ekwbdgzv25oe5vy6qb35gf23@q4etussk5jwl>
In-Reply-To: <552hpgr7qzbjxuyei3n5m7rsn7ekwbdgzv25oe5vy6qb35gf23@q4etussk5jwl>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 21 Sep 2023 09:57:22 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUGVgj6V+N865QZaAusqD7O2f1askE544Z4MF0h4zBERg@mail.gmail.com>
Message-ID: <CAMuHMdUGVgj6V+N865QZaAusqD7O2f1askE544Z4MF0h4zBERg@mail.gmail.com>
Subject: Re: [PATCH] drm/ssd130x: Drop _helper prefix from struct
 drm_*_helper_funcs callbacks
To: Maxime Ripard <mripard@kernel.org>
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
Cc: dri-devel@lists.freedesktop.org,
 Javier Martinez Canillas <javierm@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime,

On Thu, Sep 21, 2023 at 9:44=E2=80=AFAM Maxime Ripard <mripard@kernel.org> =
wrote:
> On Mon, Sep 18, 2023 at 09:19:07AM +0200, Javier Martinez Canillas wrote:
> > Thomas Zimmermann <tzimmermann@suse.de> writes:
> > > Am 14.09.23 um 21:51 schrieb Javier Martinez Canillas:
> > >> The driver uses a naming convention where functions for struct drm_*=
_funcs
> > >> callbacks are named ssd130x_$object_$operation, while the callbacks =
for
> > >> struct drm_*_helper_funcs are named ssd130x_$object_helper_$operatio=
n.
> > >>
> > >> The idea is that this helper_ prefix in the function names denote th=
at are
> > >> for struct drm_*_helper_funcs callbacks. This convention was copied =
from
> > >> other drivers, when ssd130x was written but Maxime pointed out that =
is the
> > >> exception rather than the norm.
> > >
> > > I guess you found this in my code. I want to point out that I use the
> > > _helper infix to signal that these are callback for
> > > drm_primary_plane_helper_funcs and *not* drm_primary_plane_funcs. The
> > > naming is intentional.
> >
> > Yes, that's what tried to say in the commit message and indeed I got th=
e
> > convention from drivers in drivers/gpu/drm/tiny. In fact I believe thes=
e
> > function names are since first iteration of the driver, when was meant =
to
> > be a tiny driver.
> >
> > According to Maxime it's the exception rather than the rule and suggest=
ed
> > to change it, I don't really have a strong opinion on either naming TBH=
.
>
> Maybe that's just me, but the helper in the name indeed throws me off. In=
 my
> mind, it's supposed to be used only for helpers, not functions implementi=
ng the
> helpers hooks.

With several callbacks using the same (field) name, it is very helpful
to name the actual implementation by combining the struct type name
and the field name.  Anything else confuses the casual reader.
Perhaps the real question is whether the structures should have "helper"
in their name in the first place?

Just my 2=E2=82=ACc as a DRM novice...

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
