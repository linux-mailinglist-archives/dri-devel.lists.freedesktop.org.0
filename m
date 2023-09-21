Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C317A7A92F1
	for <lists+dri-devel@lfdr.de>; Thu, 21 Sep 2023 11:07:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F4E210E591;
	Thu, 21 Sep 2023 09:07:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com
 [209.85.128.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22EDE10E591
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Sep 2023 09:07:20 +0000 (UTC)
Received: by mail-yw1-f170.google.com with SMTP id
 00721157ae682-59bbdb435bfso8565567b3.3
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Sep 2023 02:07:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695287239; x=1695892039;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=40XOX8q82CJYYuN+M1nPVewiZW/zHKq9qHFf150I6MI=;
 b=ACJog65eOCjo12im4xQHtNuaN50nEnyxwXZSWRqPwC/IG7KbJdOA1nT69JO0DM9B4P
 o4dRhl/PIHgD49dA84v60D4qjJMEvgFNrhSWN/hHSv8uk7EEpLpFCbZ3HfV95y3QUhOp
 9xYDeFtIyKJFQASEtV49vy/jYiTuFInGLcAyhBgAV1kuukT8MSv6+9i1S82JXOERNMMF
 32TghhMmLCjKvokvqatuHNdYoCHEuJ5JGtvaiO3qnOsPsMC7eJCgXpZfbArbXHl99Ic+
 0eh7Ja9pxGfHPTefB5BVslsXPdLU3a07lmoiuxrxdNV07o4E7BBGhm+LRa/sXHsiEcUk
 Huew==
X-Gm-Message-State: AOJu0YwGH/StENzEafViBzZQw3QppLamNtn+cVoZ552TJbV/DB9dHhOo
 GeRfbUXTXL2gKG1gZACiJNe+ToHbcdhvwg==
X-Google-Smtp-Source: AGHT+IEUvves3tuYAZDVWAbaawnqHM6VXGjeNvgHS7yPRMDb4Yk4Iz5je1qGMIdtmjw7mshx/nQNbw==
X-Received: by 2002:a0d:cc0a:0:b0:59b:e622:f820 with SMTP id
 o10-20020a0dcc0a000000b0059be622f820mr4768239ywd.13.1695287238979; 
 Thu, 21 Sep 2023 02:07:18 -0700 (PDT)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com.
 [209.85.128.175]) by smtp.gmail.com with ESMTPSA id
 o2-20020a817302000000b00598d67585d7sm224376ywc.117.2023.09.21.02.07.18
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Sep 2023 02:07:18 -0700 (PDT)
Received: by mail-yw1-f175.google.com with SMTP id
 00721157ae682-59bbdb435bfso8565457b3.3
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Sep 2023 02:07:18 -0700 (PDT)
X-Received: by 2002:a81:9e10:0:b0:579:effb:ae1c with SMTP id
 m16-20020a819e10000000b00579effbae1cmr5117090ywj.26.1695287238501; Thu, 21
 Sep 2023 02:07:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230914195138.1518065-1-javierm@redhat.com>
 <f5620d32-2705-498b-a65c-7dc663340a6d@suse.de>
 <87wmwo3q50.fsf@minerva.mail-host-address-is-not-set>
 <552hpgr7qzbjxuyei3n5m7rsn7ekwbdgzv25oe5vy6qb35gf23@q4etussk5jwl>
 <CAMuHMdUGVgj6V+N865QZaAusqD7O2f1askE544Z4MF0h4zBERg@mail.gmail.com>
 <2p53aei56tlr7k6w5oawlwpmv2k7agpbb6wfwpxcg3rqyueyrx@2as7tijrgnh4>
 <CAMuHMdV9Q=F6D=FgBYazjxGL8HY1cRLJUxdfdvr8=6fwgn+EHQ@mail.gmail.com>
 <yz2wo76us5bsshdsyiybanpsxa2izqwuj6ts3b76lnfo74ypgz@kx5vqwi6cjap>
In-Reply-To: <yz2wo76us5bsshdsyiybanpsxa2izqwuj6ts3b76lnfo74ypgz@kx5vqwi6cjap>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 21 Sep 2023 11:07:07 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUHm1msGCvOsArurvCZLPi4Pjr4RE8XR5mTQEiVQ1OMxA@mail.gmail.com>
Message-ID: <CAMuHMdUHm1msGCvOsArurvCZLPi4Pjr4RE8XR5mTQEiVQ1OMxA@mail.gmail.com>
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

On Thu, Sep 21, 2023 at 10:51=E2=80=AFAM Maxime Ripard <mripard@kernel.org>=
 wrote:
> On Thu, Sep 21, 2023 at 10:46:05AM +0200, Geert Uytterhoeven wrote:
> > On Thu, Sep 21, 2023 at 10:12=E2=80=AFAM Maxime Ripard <mripard@kernel.=
org> wrote:
> > > On Thu, Sep 21, 2023 at 09:57:22AM +0200, Geert Uytterhoeven wrote:
> > > > On Thu, Sep 21, 2023 at 9:44=E2=80=AFAM Maxime Ripard <mripard@kern=
el.org> wrote:
> > > > > On Mon, Sep 18, 2023 at 09:19:07AM +0200, Javier Martinez Canilla=
s wrote:
> > > > > > Thomas Zimmermann <tzimmermann@suse.de> writes:
> > > > > > > Am 14.09.23 um 21:51 schrieb Javier Martinez Canillas:
> > > > > > >> The driver uses a naming convention where functions for stru=
ct drm_*_funcs
> > > > > > >> callbacks are named ssd130x_$object_$operation, while the ca=
llbacks for
> > > > > > >> struct drm_*_helper_funcs are named ssd130x_$object_helper_$=
operation.
> > > > > > >>
> > > > > > >> The idea is that this helper_ prefix in the function names d=
enote that are
> > > > > > >> for struct drm_*_helper_funcs callbacks. This convention was=
 copied from
> > > > > > >> other drivers, when ssd130x was written but Maxime pointed o=
ut that is the
> > > > > > >> exception rather than the norm.
> > > > > > >
> > > > > > > I guess you found this in my code. I want to point out that I=
 use the
> > > > > > > _helper infix to signal that these are callback for
> > > > > > > drm_primary_plane_helper_funcs and *not* drm_primary_plane_fu=
ncs. The
> > > > > > > naming is intentional.
> > > > > >
> > > > > > Yes, that's what tried to say in the commit message and indeed =
I got the
> > > > > > convention from drivers in drivers/gpu/drm/tiny. In fact I beli=
eve these
> > > > > > function names are since first iteration of the driver, when wa=
s meant to
> > > > > > be a tiny driver.
> > > > > >
> > > > > > According to Maxime it's the exception rather than the rule and=
 suggested
> > > > > > to change it, I don't really have a strong opinion on either na=
ming TBH.
> > > > >
> > > > > Maybe that's just me, but the helper in the name indeed throws me=
 off. In my
> > > > > mind, it's supposed to be used only for helpers, not functions im=
plementing the
> > > > > helpers hooks.
> > > >
> > > > With several callbacks using the same (field) name, it is very help=
ful
> > > > to name the actual implementation by combining the struct type name
> > > > and the field name.
> > >
> > > I can't think of any (at least for a given object). Which one do you =
have in
> > > mind?
> >
> > E.g. atomic_check():
> >
> >     drm_crtc_helper_funcs.atomic_check()
> >     drm_encoder_helper_funcs.atomic_check()
> >     drm_connector_helper_funcs.atomic_check()
> >     drm_plane_helper_funcs.atomic_check()
>
> Right, but that's between objects, not between drm_$OBJECT_funcs and
> drm_$OBJECT_helper_funcs. So conflicts for a single given driver is unlik=
ely,
> and can be solved by using, say, $DRIVER_crtc_atomic_check and
> $DRIVER_plane_atomic_check.

IC. There are indeed no such conflicts (except between
drm_encoder_slave_funcs and drm_encoder_helper_funcs, which I guess
doesn't count).

Thanks, this helps a lot to explain why there is no need to have
"helper" in the name of the callbacks.

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
