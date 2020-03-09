Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CD2617F1A6
	for <lists+dri-devel@lfdr.de>; Tue, 10 Mar 2020 09:19:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA2716E838;
	Tue, 10 Mar 2020 08:19:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com
 [IPv6:2607:f8b0:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E79A6E111
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Mar 2020 22:28:53 +0000 (UTC)
Received: by mail-oi1-x244.google.com with SMTP id y71so6493161oia.7
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Mar 2020 15:28:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Es47KjDK/hWadKH/v9xPd4F0lLQoQ3sr2417oAXr/tU=;
 b=MgajOmyyAtv7UmYDoPC0jd1MOj3beqW7IbyfooxKtCGGP3FkaOcT2Ovhp0Fi0/ojnT
 lGtY+8OxAz7maq86dfZDNNzRH9zLr7c1L3xiV6VYC97WdiUxW1TP2dYeItkRafKMHVXc
 n4q0/+/KaHKttvMb0Cr+khailijU+LBjcH8/Vivy13zJPV3Wa8G+jvqT80sJa9oQgNgG
 CniC59RMHaz2xDrqGnkuzFC9AKBTpVLQQ9ebjsdEplXRiA3Q9wolMM5zR0QlBIlUT4Ku
 cM/WzAeCeVWfhM8SpVls+fcztK01Ozegzsm/2RW5UGJPzRnmMTWLZUDRJhJ2GV0spdY+
 YtbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Es47KjDK/hWadKH/v9xPd4F0lLQoQ3sr2417oAXr/tU=;
 b=B+t4BvMDqxQZZOPJyeUHgtiWfXAbOII8M2nWabKPIxN1sPCJ+N808MJ3jPtobWBo4S
 nCr6xob02Wxlrh0i+iQJysBofpnuaH4Sfg4WO8w/jFWThFVi8IgbZ96/3AJxPLavXvDY
 s64C2wD+yWtUt3GfHf4J8zToVsgnTFHJrfYGvHsdcU9hk9A6Fs7dwNlogbGOmWVNX1J1
 yAxPs1b03r9KWbe8OBtf8/jqH8oPhVc4Z8nmBR6GlVRFMqdP9Z6wQdDJ0zNpaWU2dc6d
 RGkZJYFvKqAPJa5cgwXUD7O85jsXyyuY4moBw8HL08Ac2lxkFFsQbUaHSDQB7+/XjBsP
 +D3w==
X-Gm-Message-State: ANhLgQ2u23o4uIZl/Cxw3mFuNZSyDoZq9KJJQiW8dPsSj0kF58+dWvHV
 JIAugftrUuv8ozctXFomfefySvf7ES4tKHKkARA=
X-Google-Smtp-Source: ADFU+vtU5GX2EEb6Reuz4YRODMRzYC78NkJFKaejN4jv+zCbJpOs9anR6SY8vnKCcYwgMaaXCVp7rl1Kf+AESBzJ0FQ=
X-Received: by 2002:aca:ac89:: with SMTP id v131mr1044761oie.7.1583792932582; 
 Mon, 09 Mar 2020 15:28:52 -0700 (PDT)
MIME-Version: 1.0
References: <20200306152031.14212-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200309203242.GA14486@bogus>
 <CA+V-a8uAhrkRPUaQOOAUgeKFnwH7zZOF-raQiYvtc9edUeHJ7g@mail.gmail.com>
 <20200309214739.GA11495@ravnborg.org>
In-Reply-To: <20200309214739.GA11495@ravnborg.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 9 Mar 2020 22:28:26 +0000
Message-ID: <CA+V-a8uRD2Vi05rPw2fw6SQO66EHWG=Z+ZAL23xR_9QSVz7WBw@mail.gmail.com>
Subject: Re: [RESEND PATCH v7] dt-bindings: display: Add idk-2121wr binding
To: Sam Ravnborg <sam@ravnborg.org>
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
 Chris Paterson <Chris.Paterson2@renesas.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 LKML <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sam,

On Mon, Mar 9, 2020 at 9:47 PM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Hi Prabhakar
>
> On Mon, Mar 09, 2020 at 09:23:24PM +0000, Lad, Prabhakar wrote:
> > Hi Rob,
> >
> > On Mon, Mar 9, 2020 at 8:32 PM Rob Herring <robh@kernel.org> wrote:
> > >
> > > On Fri,  6 Mar 2020 15:20:31 +0000, Lad Prabhakar wrote:
> > > > From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > > >
> > > > Add binding for the idk-2121wr LVDS panel from Advantech.
> > > >
> > > > Some panel-specific documentation can be found here:
> > > > https://buy.advantech.eu/Displays/Embedded-LCD-Kits-High-Brightness/model-IDK-2121WR-K2FHA2E.htm
> > > >
> > > > Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > ---
> > > > Apologies for flooding in I missed to add the ML email-ids for the earlier
> > > > version so resending it.
> > > >
> > > > Hi All,
> > > >
> > > > This patch is part of series [1] ("Add dual-LVDS panel support to EK874),
> > > > all the patches have been accepted from it except this one. I have fixed
> > > > Rob's comments in this version of the patch.
> > > >
> > > > [1] https://patchwork.kernel.org/cover/11297589/
> > > >
> > > > v6->7
> > > >  * Added reference to lvds.yaml
> > > >  * Changed maintainer to myself
> > > >  * Switched to dual license
> > > >  * Dropped required properties except for ports as rest are already listed
> > > >    in lvds.panel
> > > >  * Dropped Reviewed-by tag of Laurent, due to the changes made it might not
> > > >    be valid.
> > > >
> > > > v5->v6:
> > > >  * No change
> > > >
> > > > v4->v5:
> > > > * No change
> > > >
> > > > v3->v4:
> > > > * Absorbed patch "dt-bindings: display: Add bindings for LVDS
> > > >   bus-timings"
> > > > * Big restructuring after Rob's and Laurent's comments
> > > >
> > > > v2->v3:
> > > > * New patch
> > > >
> > > >  .../display/panel/advantech,idk-2121wr.yaml        | 120 +++++++++++++++++++++
> > > >  1 file changed, 120 insertions(+)
> > > >  create mode 100644 Documentation/devicetree/bindings/display/panel/advantech,idk-2121wr.yaml
> > > >
> > >
> > > My bot found errors running 'make dt_binding_check' on your patch:
> > >
> > > /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/panel/advantech,idk-2121wr.example.dt.yaml: panel-lvds: 'port' is a required property
> > > /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/panel/advantech,idk-2121wr.example.dt.yaml: panel-lvds: 'port' is a required property
> > >
> > This panel is a dual channel LVDS, as a result the root port is called as
> > ports instead of port and the child node port@0 and port@1 are used for
> > even and odd pixels, hence binding has required property as ports instead
> > of port.
>
> What goes wrong is that you have a ref to lvds.yaml - and thus you get
> also required from that file.
>
Agreed.

> So basically - I think this binding should not have a ref to lvds.yaml -
> as the binding needs to be different.
>
Yes makes sense, will post a v8 dropping the reference to lvds.yaml

Cheers,
--Prabhakar

>         Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
