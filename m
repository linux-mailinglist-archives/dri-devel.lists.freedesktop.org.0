Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60A2A9AB366
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2024 18:08:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F378210E6B8;
	Tue, 22 Oct 2024 16:08:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="mSxq+A8g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DDD810E6B8
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2024 16:08:30 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id
 98e67ed59e1d1-2e30fb8cb07so4243343a91.3
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2024 09:08:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1729613310; x=1730218110;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=O34N6hV8NTFWFEECvWQoNtBGAXpFQDcnaZf0oYg4B1E=;
 b=mSxq+A8gdWpXcI9NLtrsoGT/t1PIP77b3wI1sP7yGsHFkVFlnU58Xx3kkduxLgY4GM
 KGC965D9HjCDG2BdrbGh0ZBzPmhIIS/vxyJNxwJWkNyrQ8hB2IMJo35noZWoxo6QZwch
 fSGEESAPDazAy0ssVGisgfY3vzghYxmfewPfV1j6istee1G1WvVCMBrD3qc9sWnYYjHF
 S4F9Q3SdKwKnzmrTe9OCBssYw1zdM58dHhgj58xx9mbAYHDAB6o4tl57ddmTWihvv1/J
 Dbf7VH8pF0QDGW6S0bqNhPnFoExpvGIzLtMUnhhlSwF8X4hw/2cLzMUzyVxo7Nj9Mz6e
 c2ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729613310; x=1730218110;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=O34N6hV8NTFWFEECvWQoNtBGAXpFQDcnaZf0oYg4B1E=;
 b=LVeIY/YoC4PF62vOaBvXk8hjgsnNb6TVnKvtU3WhsOuiieCOqv7SgA1r6PU/mXdAZA
 T5QpD/DhlFHIxkQ8pU69BZ70JZugKnN4SATL3POPbxIOrPrAVqVsBQZ51GEGjGOHfBo2
 GhlwAv025Hq9uX37j9aGswaXzGV2sLzjWFRvX3iRHxeiLOwTA3duGP6orGyLZshOOJba
 jrEHXYY0R299NEqbsEav5UHg9DnCv4OxE30ZTHechRo9Md6Nps1ZfH2yH4bAnQo/bFXw
 E+/iJN0thfWtiTN2gDnZYDgN4dCBtZoVVnSAiGCwxPCrY5b7iVc1zLfLAD9pueXS0lZL
 XFlA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWkdPF0KDazd898LpMT5Zt40q46gbpDXy6lMUB2bkHID4IthbLYFTLh7K27EWfGix55Nf1zWCQRz3k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxgIaA7EunbbIEgzWJGpuLLe3YVwOBH/8ZT+nsUVgyPzvizAJs7
 mE3ThO6v/wrDzZ3tzbaQe6bC1CymDxxJ7MB6jME3E7cyCG1nBKJIn1Wvsxpmlq/qymKWhi012L0
 yuzSoLPxgr2DvRhh9yqXRjLdmyYMyOjO86xVb
X-Google-Smtp-Source: AGHT+IEMn8iZiKlFU+7gC3G8gJjn8JaGTVqTPbCt/8M1TQXtAKatmFKIXaUeG8TU0c1jgxwmxPvC0BXzz5fbJXK/Jow=
X-Received: by 2002:a17:90a:e390:b0:2e2:8fb4:502d with SMTP id
 98e67ed59e1d1-2e5da5817c1mr4330711a91.16.1729613309523; Tue, 22 Oct 2024
 09:08:29 -0700 (PDT)
MIME-Version: 1.0
References: <1a1ab663-d068-40fb-8c94-f0715403d276@ideasonboard.com>
 <CAGETcx-LtuMJM1205FwMy0U-fetAKhFdon65qAxHKV3Q2cUOGQ@mail.gmail.com>
 <4a25cd50-06be-4e95-b29e-4f5eb23d8bca@ideasonboard.com>
In-Reply-To: <4a25cd50-06be-4e95-b29e-4f5eb23d8bca@ideasonboard.com>
From: Saravana Kannan <saravanak@google.com>
Date: Tue, 22 Oct 2024 09:07:50 -0700
Message-ID: <CAGETcx9dTokpRGwZrE2t0LfVOOFxGn83O60KOnt7D+D2-YMx+g@mail.gmail.com>
Subject: Re: fw_devlinks preventing a panel driver from probing
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Linux Kernel List <linux-kernel@vger.kernel.org>,
 Aradhya Bhatia <aradhya.bhatia@linux.dev>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Devarsh Thakkar <devarsht@ti.com>
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

On Tue, Oct 22, 2024 at 12:51=E2=80=AFAM Tomi Valkeinen
<tomi.valkeinen@ideasonboard.com> wrote:
>
> Hi,
>
> On 22/10/2024 02:29, Saravana Kannan wrote:
> > Hi Tomi,
> >
> > Sorry it took a while to get back.
> >
> > On Mon, Sep 16, 2024 at 4:52=E2=80=AFAM Tomi Valkeinen
> > <tomi.valkeinen@ideasonboard.com> wrote:
> >>
> >> Hi,
> >>
> >> We have an issue where two devices have dependencies to each other,
> >> according to drivers/base/core.c's fw_devlinks, and this prevents them
> >> from probing. I've been adding debugging to the core.c, but so far I
> >> don't quite grasp the issue, so I thought to ask. Maybe someone can
> >> instantly say that this just won't work...
> >>
> >> So, we have two devices, DSS (display subsystem) and an LVDS panel. Th=
e
> >> DSS normally outputs parallel video from its video ports (VP), but it
> >> has an integrated LVDS block (OLDI, Open LVDS Display Interface). The
> >> OLDI block takes input from DSS's parallel outputs. The OLDI is not
> >> modeled as a separate device (neither in the DT nor in the Linux devic=
e
> >> model) as it has no register space, and is controlled fully by the DSS=
.
> >>
> >> To support dual-link LVDS, the DSS has two OLDI instances. They both
> >> take their input from the same parallel video port, but each OLDI send=
s
> >> alternate lines forward. So for a dual-link setup the connections woul=
d
> >> be like this:
> >>
> >> +-----+-----+         +-------+         +----------+
> >> |     |     |         |       |         |          |
> >> |     | VP1 +----+--->| OLDI0 +-------->|          |
> >> |     |     |    |    |       |         |          |
> >> | DSS +-----+    |    +-------+         |  Panel   |
> >> |     |     |    |    |       |         |          |
> >> |     | VP2 |    +--->| OLDI1 +-------->|          |
> >> |     |     |         |       |         |          |
> >> +-----+-----+         +-------+         +----------+
> >>
> >> As the OLDI is not a separate device, it also does not have an
> >> independent device tree node, but rather it's inside DSS's node. The D=
SS
> >> parallel outputs are under a normal "ports" node, but OLDI ports are
> >> under "oldi-txes/ports" (see below for dts to clarify this).
> >>
> >> And I think (guess...) this is the root of the issue we're seeing, as =
it
> >> means the following, one or both of which might be the reason for this
> >> issue:
> >>
> >> - OLDI fwnodes don't have an associated struct device *. I think the
> >> reason is that the OLDI media graph ports are one level too deep in th=
e
> >> hierarchy. So while the DSS ports are associated with the DSS device,
> >> OLDI ports are not.
> >
> > This is the root cause of the issue in some sense. fw_devlink doesn't
> > know that DSS depends on the VP. In the current DT, it only appears as
> > if the OLDI depends on VP. See further below for the fix.
> >
> >>
> >> - The VP ports inside the DSS point to OLDI ports, which are also insi=
de
> >> DSS. So ports from a device point to ports in the same device (and bac=
k).
> >>
> >> If I understand the fw_devlink code correctly, in a normal case the
> >> links formed with media graphs are marked as a cycle
> >> (FWLINK_FLAG_CYCLE), and then ignored as far as probing goes.
> >>
> >> What we see here is that when using a single-link OLDI panel, the pane=
l
> >> driver's probe never gets called, as it depends on the OLDI, and the
> >> link between the panel and the OLDI is not a cycle.
> >>
> >> The DSS driver probes, but the probe fails as it requires all the pane=
l
> >> devices to have been probed (and thus registered to the DRM framework)
> >> before it can finish its setup.
> >>
> >> With dual-link, probing does happen and the drivers work. But I believ=
e
> >> this is essentially an accident, in the sense that the first link
> >> between the panel and the OLDI still blocks the probing, but the secon=
d
> >> links allows the driver core to traverse the devlinks further, causing
> >> it to mark the links to the panel as FWLINK_FLAG_CYCLE (or maybe it on=
ly
> >> marks one of those links, and that's enough).
> >>
> >> If I set fw_devlink=3Doff as a kernel parameter, the probing proceeds
> >> successfully in both single- and dual-link cases.
> >>
> >> Now, my questions is, is this a bug in the driver core, a bug in the D=
T
> >> bindings, or something in between (DT is fine-ish, but the structure i=
s
> >> something that won't be supported by the driver core).
> >>
> >> And a follow-up question, regardless of the answer to the first one:
> >> which direction should I go from here =3D).
> >>
> >> The device tree data (simplified) for this is as follows, first the
> >> dual-link case, then the single-link case:
> >>
> >> /* Dual-link */
> >>
> >> dss: dss@30200000 {
> >>          compatible =3D "ti,am625-dss";
> >>
> >>          oldi-txes {
> >>                  oldi0: oldi@0 {
> >>                          oldi0_ports: ports {
> >>                                  port@0 {
> >>                                          oldi_0_in: endpoint {
> >>                                                  remote-endpoint =3D <=
&dpi0_out0>;
> >>                                          };
> >>                                  };
> >>
> >>                                  port@1 {
> >>                                          oldi_0_out: endpoint {
> >>                                                  remote-endpoint =3D <=
&lcd_in0>;
> >>                                          };
> >>                                  };
> >>                          };
> >>                  };
> >>
> >>                  oldi1: oldi@1 {
> >>                          oldi1_ports: ports {
> >>                                  port@0 {
> >>                                          oldi_1_in: endpoint {
> >>                                                  remote-endpoint =3D <=
&dpi0_out1>;
> >>                                          };
> >>                                  };
> >>
> >>                                  port@1 {
> >>                                          oldi_1_out: endpoint {
> >>                                                  remote-endpoint =3D <=
&lcd_in1>;
> >>                                          };
> >>                                  };
> >>                          };
> >>                  };
> >>          };
> >>
> >>          dss_ports: ports {
> >>                  port@0 {
> >>                          dpi0_out0: endpoint@0 {
> >>                                  remote-endpoint =3D <&oldi_0_in>;
> >>                          };
> >>                          dpi0_out1: endpoint@1 {
> >>                                  remote-endpoint =3D <&oldi_1_in>;
> >>                          };
> >>                  };
> >>          };
> >> };
> >>
> >> display {
> >>          compatible =3D "microtips,mf-101hiebcaf0", "panel-simple";
> >
> > In here, add this new property that I added some time back.
> >
> > post-init-providers =3D <&oldi-txes>;
>
> Thanks! This helps:
>
> post-init-providers =3D <&oldi0>;
>
> or for dual-link:
>
> post-init-providers =3D <&oldi0>, <&oldi1>;
>
> > This tells fw_devlink that VP doesn't depend on this node for
> > initialization/probing. This property is basically available to break
> > cycles in DT and mark one of the edges of the cycles as "not a real
> > init dependency".
> >
> > You should do the same for the single link case too.
>
> While this helps, it's not very nice... Every new DT overlay that uses
> OLDI display needs to have these.

Actually, taking a closer look at the DT and assuming I am visualizing
it correctly in my head, fw_devlink should notice the cycle between
oldi-txes and display and shouldn't block display from probing. Can
you check the cycle detection code and see where it's bailing out
early and not marking the fwnode link with the CYCLE flag?

__fw_devlink_relax_cycles() is where you want to look. There are a
bunch of debug log messages inside it and around where it's called
from.

Also, can you check debugfs/devices_deferred, or the
"wait_for_supplier" file under /sys/devices/..../display/ to make sure
it's actually stuck on oldi-txes? Just to make cure it's not some
other corner case that's triggered by oldi-txes?

> I'm still confused about why this is needed. OF graphs are _always_
> two-way links. Doesn't that mean that OF graphs never can be used for
> dependencies, as they go both ways?

Good question :) Yes, they'll always be ignored as cycles. But with
post-init-providers, it's actually better to add it so that cycles are
broken and better ordering is enforced. See my talk at LPC referee
talk about fw_devlink to see all the benefits you get from it. :)

> If so, shouldn't we just always
> ignore all OF graphs for dependency checking?

There are cases when two devices A and B have remote-endpoints between
them and ALSO have for example a gpio dependency between them. Where
the gpio is the "post-init-supplier". If we don't parse
remote-endpoint and mark the cycles, cases like these don't get to
probe.

-Saravana

>
>   Tomi
>
> >
> > Hope that helps. Let me know.
> >
> > Thanks,
> > Saravana
> >
> >>
> >>          ports {
> >>                  port@0 {
> >>                          lcd_in0: endpoint {
> >>                                  remote-endpoint =3D <&oldi_0_out>;
> >>                          };
> >>                  };
> >>
> >>                  port@1 {
> >>                          lcd_in1: endpoint {
> >>                                  remote-endpoint =3D <&oldi_1_out>;
> >>                          };
> >>                  };
> >>          };
> >> };
> >>
> >>
> >> /* Single-link */
> >>
> >> dss: dss@30200000 {
> >>          compatible =3D "ti,am625-dss";
> >>
> >>          oldi-txes {
> >>                  oldi0: oldi@0 {
> >>                          oldi0_ports: ports {
> >>                                  port@0 {
> >>                                          oldi_0_in: endpoint {
> >>                                                  remote-endpoint =3D <=
&dpi0_out0>;
> >>                                          };
> >>                                  };
> >>
> >>                                  port@1 {
> >>                                          oldi_0_out: endpoint {
> >>                                                  remote-endpoint =3D <=
&lcd_in0>;
> >>                                          };
> >>                                  };
> >>                          };
> >>                  };
> >>          };
> >>
> >>          dss_ports: ports {
> >>                  port@0 {
> >>                          dpi0_out0: endpoint@0 {
> >>                                  remote-endpoint =3D <&oldi_0_in>;
> >>                          };
> >>                  };
> >>          };
> >> };
> >>
> >> display {
> >>          compatible =3D "microtips,mf-101hiebcaf0", "panel-simple";
> >>
> >>          ports {
> >>                  port@0 {
> >>                          lcd_in0: endpoint {
> >>                                  remote-endpoint =3D <&oldi_0_out>;
> >>                          };
> >>                  };
> >>          };
> >> };
> >>
> >>    Tomi
> >>
>
