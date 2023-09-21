Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E4F647A92C6
	for <lists+dri-devel@lfdr.de>; Thu, 21 Sep 2023 10:46:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 834D910E588;
	Thu, 21 Sep 2023 08:46:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com
 [209.85.219.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CA1410E588
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Sep 2023 08:46:20 +0000 (UTC)
Received: by mail-yb1-f182.google.com with SMTP id
 3f1490d57ef6-d81b803b09aso853990276.2
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Sep 2023 01:46:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695285979; x=1695890779;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6wRswdA+hUPT84SfQuestnzzAlGgjNnTThx2x+1h1rI=;
 b=s38m4kfdvjjyn89+Hz0JqvnF7dNfGHxiG3ax359zaW34Uv8MKvU5dyIl7COIs4Ausu
 yrPYhIVuNuU2yGvaWrTrYP8sI8bjx3E8S3RFBNKHKgZoPIXUzP2e2yuPsVvQk8rciF7n
 G4hI9FnTeD2bpkz3kJDDPHKPqUYVwKWunLwtcL5NHXbX32d5K6L+CJiovayRBUQxu/t9
 6isop3vUiWwFFV1G39aIlDl57s/WxWEDSMzAPnI2DNGMbjxeNEeK+aOz3zUlT0fpkk0z
 pb7Y5xpWvz0mtGqk6DrXi6QVypZkjKmdj6NbW0ABtZv2WAOIZwDP4TFOK4G/l01KBeJ7
 9Yyg==
X-Gm-Message-State: AOJu0YxWL/wRADfPzmZfhJGKB4TDpV8MyTtyCftDfNUT5tBVbGg2b4em
 NfBN9qfMnzbUOh50Oy9zhHRe4AyNasqaTw==
X-Google-Smtp-Source: AGHT+IFLTjqcBZJvnFlKciJKB57k6o4KgNyIoa2L4ozq4puoPg9AfFpwDPBt9excVpOqjICkQDJJ3g==
X-Received: by 2002:a25:bdcf:0:b0:d81:97c:c016 with SMTP id
 g15-20020a25bdcf000000b00d81097cc016mr4244037ybk.15.1695285978943; 
 Thu, 21 Sep 2023 01:46:18 -0700 (PDT)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com.
 [209.85.128.181]) by smtp.gmail.com with ESMTPSA id
 14-20020a25050e000000b00d3596aca5bcsm248794ybf.34.2023.09.21.01.46.18
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Sep 2023 01:46:18 -0700 (PDT)
Received: by mail-yw1-f181.google.com with SMTP id
 00721157ae682-59c0b5f984aso8558817b3.2
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Sep 2023 01:46:18 -0700 (PDT)
X-Received: by 2002:a81:5dd7:0:b0:59b:ce0b:7829 with SMTP id
 r206-20020a815dd7000000b0059bce0b7829mr4365474ywb.35.1695285978536; Thu, 21
 Sep 2023 01:46:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230914195138.1518065-1-javierm@redhat.com>
 <f5620d32-2705-498b-a65c-7dc663340a6d@suse.de>
 <87wmwo3q50.fsf@minerva.mail-host-address-is-not-set>
 <552hpgr7qzbjxuyei3n5m7rsn7ekwbdgzv25oe5vy6qb35gf23@q4etussk5jwl>
 <CAMuHMdUGVgj6V+N865QZaAusqD7O2f1askE544Z4MF0h4zBERg@mail.gmail.com>
 <2p53aei56tlr7k6w5oawlwpmv2k7agpbb6wfwpxcg3rqyueyrx@2as7tijrgnh4>
In-Reply-To: <2p53aei56tlr7k6w5oawlwpmv2k7agpbb6wfwpxcg3rqyueyrx@2as7tijrgnh4>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 21 Sep 2023 10:46:05 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV9Q=F6D=FgBYazjxGL8HY1cRLJUxdfdvr8=6fwgn+EHQ@mail.gmail.com>
Message-ID: <CAMuHMdV9Q=F6D=FgBYazjxGL8HY1cRLJUxdfdvr8=6fwgn+EHQ@mail.gmail.com>
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

On Thu, Sep 21, 2023 at 10:12=E2=80=AFAM Maxime Ripard <mripard@kernel.org>=
 wrote:
> On Thu, Sep 21, 2023 at 09:57:22AM +0200, Geert Uytterhoeven wrote:
> > On Thu, Sep 21, 2023 at 9:44=E2=80=AFAM Maxime Ripard <mripard@kernel.o=
rg> wrote:
> > > On Mon, Sep 18, 2023 at 09:19:07AM +0200, Javier Martinez Canillas wr=
ote:
> > > > Thomas Zimmermann <tzimmermann@suse.de> writes:
> > > > > Am 14.09.23 um 21:51 schrieb Javier Martinez Canillas:
> > > > >> The driver uses a naming convention where functions for struct d=
rm_*_funcs
> > > > >> callbacks are named ssd130x_$object_$operation, while the callba=
cks for
> > > > >> struct drm_*_helper_funcs are named ssd130x_$object_helper_$oper=
ation.
> > > > >>
> > > > >> The idea is that this helper_ prefix in the function names denot=
e that are
> > > > >> for struct drm_*_helper_funcs callbacks. This convention was cop=
ied from
> > > > >> other drivers, when ssd130x was written but Maxime pointed out t=
hat is the
> > > > >> exception rather than the norm.
> > > > >
> > > > > I guess you found this in my code. I want to point out that I use=
 the
> > > > > _helper infix to signal that these are callback for
> > > > > drm_primary_plane_helper_funcs and *not* drm_primary_plane_funcs.=
 The
> > > > > naming is intentional.
> > > >
> > > > Yes, that's what tried to say in the commit message and indeed I go=
t the
> > > > convention from drivers in drivers/gpu/drm/tiny. In fact I believe =
these
> > > > function names are since first iteration of the driver, when was me=
ant to
> > > > be a tiny driver.
> > > >
> > > > According to Maxime it's the exception rather than the rule and sug=
gested
> > > > to change it, I don't really have a strong opinion on either naming=
 TBH.
> > >
> > > Maybe that's just me, but the helper in the name indeed throws me off=
. In my
> > > mind, it's supposed to be used only for helpers, not functions implem=
enting the
> > > helpers hooks.
> >
> > With several callbacks using the same (field) name, it is very helpful
> > to name the actual implementation by combining the struct type name
> > and the field name.
>
> I can't think of any (at least for a given object). Which one do you have=
 in
> mind?

E.g. atomic_check():

    drm_crtc_helper_funcs.atomic_check()
    drm_encoder_helper_funcs.atomic_check()
    drm_connector_helper_funcs.atomic_check()
    drm_plane_helper_funcs.atomic_check()

Interestingly, drm_mode_config_helper_funcs does not have an
atomic_check() callback, but drm_mode_config_funcs has.

> > Anything else confuses the casual reader. Perhaps the real question is =
whether
> > the structures should have "helper" in their name in the first place?
>
> Those structures are meant for functions used by the helpers, they are no=
t
> helper functions.

That might be how they started, but to me it looks like all these helpers
are no longer helpers, but part of the core...

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
