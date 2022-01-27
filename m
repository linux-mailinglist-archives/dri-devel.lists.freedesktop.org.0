Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6006349EC77
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jan 2022 21:27:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F2B110E88C;
	Thu, 27 Jan 2022 20:27:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 521 seconds by postgrey-1.36 at gabe;
 Thu, 27 Jan 2022 20:27:21 UTC
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B096710E88C
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jan 2022 20:27:21 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 0BC89CE239E
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jan 2022 20:18:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8B59C340F0
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jan 2022 20:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643314711;
 bh=HwcJNC4Xs1PdswWHmb9yiCd8N9H6MoMdl2udx7sPK5g=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=n0H9f+3rWCGYSn+MTwky3Tw4XpfRdM7As76V3+rIJbSYnqYKCpUmiYnyH2s8jaKPv
 cqOx9cg7uHrcrIz7H4oBK/6deYRIR9Z+pfIseO8IOjnKSAKmNXCfofY26aiZJiwJE0
 4LiDzA9vmHKK+KODgDEVTqai35oyGK/IkB6ljjdf7NvWo29zVPBC3p7l3/UgFDi6AG
 j+6j//N77LSxeFRGWVSyPWjupE5vh/C/mUgNZ5hrHyRr9tiH5RkBjOf6vmSgb87tZq
 GRljJdAaWOb9I9smphjc/h//gmlZqkwNFuaAzLMoMSrjm1g5riZRdeQywTTX8oO1Lm
 2IbMM6M5zpU2g==
Received: by mail-qt1-f176.google.com with SMTP id k14so3465583qtq.10
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jan 2022 12:18:31 -0800 (PST)
X-Gm-Message-State: AOAM531XcxrrReLv3y6pi0incg1dFJBBl0dWNtgqyIRXRjREKL2eN85t
 piFFQXaz8PRvCGJgR9bt5Jl9NN7tmcX0FYc2ig==
X-Google-Smtp-Source: ABdhPJwxjeIoBo2WtSIXzWbRD+IvzUIUZWuJZpaSlcaD7AZPFSsmYDZt39fHEUMzNPEaamJ+GjXhKnlbdlMpYWhhnyw=
X-Received: by 2002:ac8:578e:: with SMTP id v14mr4098539qta.345.1643314710815; 
 Thu, 27 Jan 2022 12:18:30 -0800 (PST)
MIME-Version: 1.0
References: <20220123172520.48741-1-noralf@tronnes.org>
 <20220123172520.48741-2-noralf@tronnes.org>
 <CAL_JsqJU_WFeJDt5jqLN9BQN2j_TCf3+0hKvbNSYwmg-2DSF=Q@mail.gmail.com>
 <931fab73-3a91-fda0-4af3-b48a1ad3c742@tronnes.org>
 <CAL_JsqLiw42zfaRPmszs2bmGbAcL5STSTVUtP0PyWnm=CaG8ug@mail.gmail.com>
 <20220127093624.6gozbr6gl4ft66fz@houat>
In-Reply-To: <20220127093624.6gozbr6gl4ft66fz@houat>
From: Rob Herring <robh+dt@kernel.org>
Date: Thu, 27 Jan 2022 14:18:19 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJ2EmCG_RkryKDt+05sxunQTGDt9o5LRriCPSGLnHWp3Q@mail.gmail.com>
Message-ID: <CAL_JsqJ2EmCG_RkryKDt+05sxunQTGDt9o5LRriCPSGLnHWp3Q@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: display: add bindings for MIPI DBI
 compatible SPI panels
To: Maxime Ripard <maxime@cerno.tech>
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
Cc: devicetree@vger.kernel.org, David Lechner <david@lechnology.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 27, 2022 at 3:36 AM Maxime Ripard <maxime@cerno.tech> wrote:
>
> Hi Rob,
>
> On Mon, Jan 24, 2022 at 10:42:37AM -0600, Rob Herring wrote:
> > On Mon, Jan 24, 2022 at 10:28 AM Noralf Tr=C3=B8nnes <noralf@tronnes.or=
g> wrote:
> > >
> > >
> > >
> > > Den 24.01.2022 17.08, skrev Rob Herring:
> > > > On Sun, Jan 23, 2022 at 11:25 AM Noralf Tr=C3=B8nnes <noralf@tronne=
s.org> wrote:
> > > >>
> > > >> Add binding for MIPI DBI compatible SPI panels.
> > > >
> > > > I'm sure we already have MIPI DBI panels. What's this for?
> > > >
> > >
> > > It aims to use one driver to cover all MIPI DBI panels where the
> > > controller setup is loaded from userspace in a firmware file.
> >
> > What's the solution when the user wants a splash screen in the
> > bootloader and also wants multiple panels supported?
> >
> > Also, 1 driver doesn't dictate 1 compatible. A one to many
> > relationship is fine and makes the decision entirely the OS's.
> >
> > > The cover
> > > letter points to the discussion where Maxime proposed this:
> > >
> > > https://lore.kernel.org/dri-devel/20211129093946.xhp22mvdut3m67sc@hou=
at/
> >
> > The proposal there is:
> >
> > > compatible =3D "panel-spi";
> > > model =3D "panel-from-random-place-42";
> >
> > The same thing can be accomplished with this:
> >
> > compatible =3D "panel-from-random-place-42", "panel-spi";
> >
> > What's the advantage of hijacking 'model'?
>
> So, the main issue is that a panel is essentially two things: a
> controller and the actual panel.
>
> The controller has an initialization sequence of its own, and part of it
> is parameters to match the panel.
>
> So you can have identical controllers that won't have the same
> initialization sequence because they don't have the same panel.
>
> I was assuming that a compatible would be more about the controller, so
> we needed something else, thus "model"

We already have cases like that which have "foo,some-panel", "bar,a-ctrlr-i=
c".

Rob
