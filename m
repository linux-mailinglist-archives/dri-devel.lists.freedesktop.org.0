Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8455B17F198
	for <lists+dri-devel@lfdr.de>; Tue, 10 Mar 2020 09:19:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7BCD6E811;
	Tue, 10 Mar 2020 08:19:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41C8C6E59B
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Mar 2020 21:23:51 +0000 (UTC)
Received: by mail-ot1-x343.google.com with SMTP id j16so11147755otl.1
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Mar 2020 14:23:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=60mtLRBTUGDAGEj9S+E+BacY2yBoes/RyfYQD2sha5w=;
 b=uNpqJ4H5j7CHmuE/rB7F61LMk0uUS39z4LbdTUguTFFIO6LT4Z3RjkDmMMeYpdJMd4
 kDETIuUwWnOOHvM3AV5d2iwDizGvqCsKSC1GiZuga5vJmL0JGp2K7bhg+wTuCNKKap4C
 xk+yfeYnfHRnNaXX/tL1LGfMvI+tGcRcgMgI7HVZs7ILHSrs3xg0iYdYtm2Gt5cPDd06
 txhcFOOWUXb0OlRqrmFWPD5zLZ4AUpXfo9A8bJOqb0X7Ny4FeIcjxeYHvLU1b03tJ9ai
 ezMqRXnTjHPToungkje0TMOsYDWl9CE5kVY/utn9sJEA+tB5dajOW3Y605MotvK38q74
 ji2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=60mtLRBTUGDAGEj9S+E+BacY2yBoes/RyfYQD2sha5w=;
 b=uV5UMnL+YgvbH0gKOUvbTSqroyS2mTzmUArSAWROMlrDteskF/JtpEZjJ/VR7A0Ugb
 7sn+Yb+TvDJfbya3LYIfgH8eFNr/HywadwVZmcq900iR2g9Aqr1FXJbTpgAbUxiHKHpl
 ti3eZIigeSVUWLd7RG/obljfIAL3E3iZQkdIBDDFHSHuwU9AxvMEq4ycFbj3b1V0caXp
 JAzFUMu7DvfrRXFYdNiTB+oi7lW5HwF8nwdTJTVLjQdgs7CDWtOXYRhE86ZgiR7GZd4J
 CCsL7Ap1p28RaIpW65F7IrQUuPzA/f0Rk44AymdEWM/X404aYpoBtSKEALLDsHviC/dC
 yZqA==
X-Gm-Message-State: ANhLgQ18cOD8H7vCwInyxvCy99khFdbDRvcaqYUPd33g3zVYV/g0csQ+
 gbaCyvogHec7pCIBLwBp7O/y6sNIA3XOrQPawrE=
X-Google-Smtp-Source: ADFU+vsnq8F5RsqgkD+u2jIs+ixTXB5m/pE4+STbQz3EG0F3FtB21RUH829nSz2B+EjxGxc4zpuwK5RVKPeHRfqY318=
X-Received: by 2002:a9d:64cd:: with SMTP id n13mr14626799otl.274.1583789030439; 
 Mon, 09 Mar 2020 14:23:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200306152031.14212-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200309203242.GA14486@bogus>
In-Reply-To: <20200309203242.GA14486@bogus>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 9 Mar 2020 21:23:24 +0000
Message-ID: <CA+V-a8uAhrkRPUaQOOAUgeKFnwH7zZOF-raQiYvtc9edUeHJ7g@mail.gmail.com>
Subject: Re: [RESEND PATCH v7] dt-bindings: display: Add idk-2121wr binding
To: Rob Herring <robh@kernel.org>
X-Mailman-Approved-At: Tue, 10 Mar 2020 08:19:05 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Chris Paterson <Chris.Paterson2@renesas.com>,
 David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rob,

On Mon, Mar 9, 2020 at 8:32 PM Rob Herring <robh@kernel.org> wrote:
>
> On Fri,  6 Mar 2020 15:20:31 +0000, Lad Prabhakar wrote:
> > From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> >
> > Add binding for the idk-2121wr LVDS panel from Advantech.
> >
> > Some panel-specific documentation can be found here:
> > https://buy.advantech.eu/Displays/Embedded-LCD-Kits-High-Brightness/model-IDK-2121WR-K2FHA2E.htm
> >
> > Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > Apologies for flooding in I missed to add the ML email-ids for the earlier
> > version so resending it.
> >
> > Hi All,
> >
> > This patch is part of series [1] ("Add dual-LVDS panel support to EK874),
> > all the patches have been accepted from it except this one. I have fixed
> > Rob's comments in this version of the patch.
> >
> > [1] https://patchwork.kernel.org/cover/11297589/
> >
> > v6->7
> >  * Added reference to lvds.yaml
> >  * Changed maintainer to myself
> >  * Switched to dual license
> >  * Dropped required properties except for ports as rest are already listed
> >    in lvds.panel
> >  * Dropped Reviewed-by tag of Laurent, due to the changes made it might not
> >    be valid.
> >
> > v5->v6:
> >  * No change
> >
> > v4->v5:
> > * No change
> >
> > v3->v4:
> > * Absorbed patch "dt-bindings: display: Add bindings for LVDS
> >   bus-timings"
> > * Big restructuring after Rob's and Laurent's comments
> >
> > v2->v3:
> > * New patch
> >
> >  .../display/panel/advantech,idk-2121wr.yaml        | 120 +++++++++++++++++++++
> >  1 file changed, 120 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/display/panel/advantech,idk-2121wr.yaml
> >
>
> My bot found errors running 'make dt_binding_check' on your patch:
>
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/panel/advantech,idk-2121wr.example.dt.yaml: panel-lvds: 'port' is a required property
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/panel/advantech,idk-2121wr.example.dt.yaml: panel-lvds: 'port' is a required property
>
This panel is a dual channel LVDS, as a result the root port is called as
ports instead of port and the child node port@0 and port@1 are used for
even and odd pixels, hence binding has required property as ports instead
of port.

Cheers,
--Prabhakar

> See https://patchwork.ozlabs.org/patch/1250384
> Please check and re-submit.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
