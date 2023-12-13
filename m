Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 467E18118CA
	for <lists+dri-devel@lfdr.de>; Wed, 13 Dec 2023 17:11:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 621D110E27A;
	Wed, 13 Dec 2023 16:11:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com
 [209.85.219.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5039710E27E
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Dec 2023 16:11:38 +0000 (UTC)
Received: by mail-yb1-f174.google.com with SMTP id
 3f1490d57ef6-dbcd348f64cso658107276.2
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Dec 2023 08:11:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702483897; x=1703088697;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ooc1eGxg6yQfZfP7GcslNnI0+HwUG+ZY14aw/Vso+Oc=;
 b=Olvl27OdraqAgcmcAjOXiVP2eer1g+RKO9PXrSGe4l7UkBkO9hgU724VfK0ZMJU1DV
 M/Qujtb/ifXtaaHEUni5UpkHXgsNSo6EBJ7GQVL49gJhxp4d7ChowyQ8RHUifnbDNiXJ
 J+fe6eRM88tjYN4VGSIFs6dVdevJwT13M7/j9kG4ff7oUKNvB3S1Fw55adV2vLYW8YWk
 v2KTa8PgAgVibXoMyanqJUjaPs+n5AITJPxPPgD3uefxEg2gZAhxFSWeJyS9Um9B3JcR
 PAqQ5IBSMDFUrVA2DVowlnj/6SY4ICLGFVZ6q96uD/nE6P/LHxcWAcFKYP2gOKdVkmWn
 eJgQ==
X-Gm-Message-State: AOJu0Yw2Zqjb39jb/0PtLuVN0499crP6QrS8B+mKCH6p/9YgzlwLNq1u
 PkYc/7BfABM20fI4MqNR7qm6LuTkR/PLEA==
X-Google-Smtp-Source: AGHT+IEWIxiv4rQ6PsixIof/w+1PMh7D81IZVrVNttvqbmjBbHUpWUDlfI9trdyc6wkswIr5gBKhOQ==
X-Received: by 2002:a25:870c:0:b0:db7:dacf:2f38 with SMTP id
 a12-20020a25870c000000b00db7dacf2f38mr5992435ybl.127.1702483897097; 
 Wed, 13 Dec 2023 08:11:37 -0800 (PST)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com.
 [209.85.219.182]) by smtp.gmail.com with ESMTPSA id
 x9-20020a25a009000000b00d9a36ded1besm4123944ybh.6.2023.12.13.08.11.36
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Dec 2023 08:11:36 -0800 (PST)
Received: by mail-yb1-f182.google.com with SMTP id
 3f1490d57ef6-dbcd348f64cso658084276.2
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Dec 2023 08:11:36 -0800 (PST)
X-Received: by 2002:a25:ea4f:0:b0:db7:dacf:2f2a with SMTP id
 o15-20020a25ea4f000000b00db7dacf2f2amr5105926ybe.113.1702483895971; Wed, 13
 Dec 2023 08:11:35 -0800 (PST)
MIME-Version: 1.0
References: <20231128105129.161121-1-biju.das.jz@bp.renesas.com>
 <20231128105129.161121-4-biju.das.jz@bp.renesas.com>
 <sechknyg33iucaku37vfhk7ie7xgcealfqbvaopm4rrnqbo5g5@s35peonkzzoz>
 <20231213155049.GH12450@pendragon.ideasonboard.com>
In-Reply-To: <20231213155049.GH12450@pendragon.ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 13 Dec 2023 17:11:24 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVCRghimhRXo9D=NDqrnRKgCykkVUf9jQOJTHOTq8PPew@mail.gmail.com>
Message-ID: <CAMuHMdVCRghimhRXo9D=NDqrnRKgCykkVUf9jQOJTHOTq8PPew@mail.gmail.com>
Subject: Re: [PATCH v15 3/5] drm: renesas: Add RZ/G2L DU Support
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
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
Cc: Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Biju Das <biju.das.au@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Magnus Damm <magnus.damm@gmail.com>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Maxime Ripard <mripard@kernel.org>, linux-renesas-soc@vger.kernel.org,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, dri-devel@lists.freedesktop.org,
 Biju Das <biju.das.jz@bp.renesas.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Dec 13, 2023 at 4:50=E2=80=AFPM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Wed, Dec 13, 2023 at 04:47:09PM +0100, Maxime Ripard wrote:
> > On Tue, Nov 28, 2023 at 10:51:27AM +0000, Biju Das wrote:
> > > The LCD controller is composed of Frame Compression Processor (FCPVD)=
,
> > > Video Signal Processor (VSPD), and Display Unit (DU).
> > >
> > > It has DPI/DSI interfaces and supports a maximum resolution of 1080p
> > > along with 2 RPFs to support the blending of two picture layers and
> > > raster operations (ROPs).
> > >
> > > The DU module is connected to VSPD. Add RZ/G2L DU support for RZ/G2L
> > > alike SoCs.
> > >
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> >
> > I'd still like a review from Geert or Laurent, I don't know the SoC.

I don't consider myself sufficiently familiar with DRM and the DU.
Kieran?

> I won't have time soon, and this driver has been blocked for way too
> long due to that :-S

Indeed...

[deleted 278 lines of needlessly quoted text]

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
