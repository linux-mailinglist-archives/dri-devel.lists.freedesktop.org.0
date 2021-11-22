Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAD72458FC7
	for <lists+dri-devel@lfdr.de>; Mon, 22 Nov 2021 14:52:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86B456E134;
	Mon, 22 Nov 2021 13:52:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54D376E16F
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Nov 2021 13:52:10 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id z5so77370472edd.3
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Nov 2021 05:52:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=W96Ux2wAP/6MEl/TsAxJjFenhKnYvAGcxSAtBasDuhA=;
 b=Zn9nRZj1Y/m4d3KHlNrxO/hgOeNTpGAW8r46eWUR7hVGKiSx2JQPASOlKGztG4OCGo
 27fDh4fYvIxxcV2I4TjMNHRcWJv8LIlnIUCHHk049/XZdS6aeVDxUS1cUdlsa1lFVRzq
 G4w3TBrmSfcgU40ueZj1wRKWDqMILDq/3IWWY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=W96Ux2wAP/6MEl/TsAxJjFenhKnYvAGcxSAtBasDuhA=;
 b=zlg2fPeliHshgIRspA759DtAYDu1XbJnaWS0Kq0KzUwXTuKValv6EWXDFg4r7vvfkL
 HfJxrUNGlGQ2rbEque9XP2MY+OVjZPZzaU9IhYbp8V80bz4EZT5IAwWO3YFv/38Ldxja
 3O5keRbfV6evSpYtt3FMFP9gpBijY/WNZ39aUY6M3krEx/re6BHEPldHYvccgy85eUKn
 qVBhMowaGuDvdjxePACBIJUDLFYDdrHrgVJMvMHze2JeH0qYH30OT4TDe0jAA/PWKI/z
 OjvFPGGOQnIr58CAv1o77kqjUPbERdReh99dcDVopgQhAb5VCJu8PCX98osq2acD9QRH
 09jg==
X-Gm-Message-State: AOAM533055sdlHealGuGFbnS6HIP+S/F3QZORzw/x2CTKJYSKIFT6XK1
 3CENSzpzjn19tPNUP9e44W0Te0SMjJWGUV8xxCJw4w==
X-Google-Smtp-Source: ABdhPJycmduTAJMMqqpakE8LC3Ls0d7CyCwvzAZV6V7y82h6HcyCR5E7hilKiG2AXgia6vjGC3rjmUhdCKp63G+/BEM=
X-Received: by 2002:aa7:d748:: with SMTP id a8mr64968522eds.21.1637589128408; 
 Mon, 22 Nov 2021 05:52:08 -0800 (PST)
MIME-Version: 1.0
References: <20211122065223.88059-1-jagan@amarulasolutions.com>
 <20211122065223.88059-5-jagan@amarulasolutions.com>
 <20211122100759.qw6lvwb33ciemg2y@gilmour>
 <CAMty3ZDDQR-OkjqEfb1ZYZG+oLN2ZOv-2GLxs3AdeDHqUD8fjQ@mail.gmail.com>
 <20211122132847.ds4gtk2unq3fkagy@gilmour>
In-Reply-To: <20211122132847.ds4gtk2unq3fkagy@gilmour>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Mon, 22 Nov 2021 19:21:57 +0530
Message-ID: <CAMty3ZAzwKtABZqJhVDmgOVpnZFg66z6Bc_pn3Fm9=658RPG1g@mail.gmail.com>
Subject: Re: [PATCH v5 4/7] drm: sun4i: dsi: Add mode_set function
To: Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>, linux-sunxi@googlegroups.com,
 dri-devel@lists.freedesktop.org, Chen-Yu Tsai <wens@csie.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, linux-amarula@amarulasolutions.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime,

On Mon, Nov 22, 2021 at 6:58 PM Maxime Ripard <maxime@cerno.tech> wrote:
>
> On Mon, Nov 22, 2021 at 06:35:58PM +0530, Jagan Teki wrote:
> > On Mon, Nov 22, 2021 at 3:38 PM Maxime Ripard <maxime@cerno.tech> wrote:
> > >
> > > On Mon, Nov 22, 2021 at 12:22:20PM +0530, Jagan Teki wrote:
> > > > Get the display mode settings via mode_set bridge function
> > > > instead of explicitly de-reference.
> > >
> > > What's wrong with dereferencing the mode?
> >
> > Nothing wrong with dereferencing, however we have built-in API to that job.
>
> That's not an API though?

May be we can call it bridge or encoding function, I usually call
these ops are API's.

>
> It's perfectly valid to dereference the pointer in atomic_enable, and
> that patch would consume memory for no particular reason.

Again, I'm not pointing any mistake in dereference and certainly not
understand about what memory consumption issue here. I'm doing it here
since I'm doing it via mode_set in other drivers. No problem for me
either way.

Thanks,
Jagan.
