Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50A7C9B12E4
	for <lists+dri-devel@lfdr.de>; Sat, 26 Oct 2024 00:41:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28D7410EB9C;
	Fri, 25 Oct 2024 22:41:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="xFV6SgJv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com
 [209.85.217.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF01710EB9C
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2024 22:41:16 +0000 (UTC)
Received: by mail-vs1-f53.google.com with SMTP id
 ada2fe7eead31-4a482cb53bdso925553137.3
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2024 15:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1729896076; x=1730500876;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ufH+EtsjOy4NqkuM2/R3knbfyq9uu2UMpU5o6nl5xXA=;
 b=xFV6SgJvwFiuQLLbD73eb9IoaTZx6539cwH6bIcfCN5TRgX8ieZ8tueFr/WE+t0m8L
 rQWPXqgFvxT9xH6rhNTYgBPWeNjKASu+XsremFtjEH7e7CYzHJNxAPmdbruvDVTDl8pf
 axe/DVOiDeanCU2maohOaPlWDbZ6JiM2p+pxQl2J3bi1x1K0gTbVYGGRbncb0wWhGLfR
 xTuI3xPJqSR6XJXm3rg+JEkOrc25lpbeXaBk0inwCZf3mVI1PzM3wbZv4RFX59xcjMj3
 /7tZR/ZWHvFv2oFyVpEkqJp4J8K59m6wWe31tM535wRyBNZAN4wa4dQN3/SV9HOvLavK
 1JAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729896076; x=1730500876;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ufH+EtsjOy4NqkuM2/R3knbfyq9uu2UMpU5o6nl5xXA=;
 b=FxbtRRC9Z1UyWDzYgYDNlyt0eUW6AMvLkaIivKsAMZ9DobAylixfUlrrSwLl3MOI+F
 pxP3ORzU6A0QWwVfXpi1Dy+hnzdPmt9C+y2BlPMKKEk+SvYg/D5VaNuD1T/qvB19pj8R
 DvNlkS7ZdVuczIwTMpxDdUta+JhODZ2gBP4zneFytvcRqxawOzDRyLylqbFauXNZTOGU
 ZGoPVSZd2nFLF2gtEynEH43VgMFdPGuvp8r4NoLuY9NUfcVuV07fhRNhqrurB1YRhthX
 B7Ojo4/yesjckwCdlDJj5eTiwMOKaMzAW/wGCI2wAJzlI+VUwHj/58+qEv1WhG5GllaL
 WUsg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX8NOqNednMk1oXUnyiXUY60nYzElQjHMQngOROo0wAHKSmQGHU7gz/B7snmUW3xm/xt4LtWEeX3Us=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzsbms0kEYkRGAuaunKnIsNj2t+4cyyMbhG6/IYGIS8piLS3oRa
 4aDU/wfIXAPvSojddBy6xQJxl69E+GAeCEdmy/glNO5SnlZAMo5cjN56T1WhFalswbb57SFkA9/
 rkaObFaNx+L+7Rk/n+F1WoAaKdFD9WN+a5IHl
X-Google-Smtp-Source: AGHT+IFeSVSLul0ubpmO+DY+z+2FGccs5yQ3f6orl28haVEsIOmsuFRneCaTEWvNgqrYwVKn0DMFDsLPZ+Vi8QHSJMo=
X-Received: by 2002:a05:6102:5094:b0:49c:92d:1041 with SMTP id
 ada2fe7eead31-4a8cfb63a85mr1130806137.14.1729896075387; Fri, 25 Oct 2024
 15:41:15 -0700 (PDT)
MIME-Version: 1.0
References: <1a1ab663-d068-40fb-8c94-f0715403d276@ideasonboard.com>
 <CAGETcx-LtuMJM1205FwMy0U-fetAKhFdon65qAxHKV3Q2cUOGQ@mail.gmail.com>
 <4a25cd50-06be-4e95-b29e-4f5eb23d8bca@ideasonboard.com>
 <CAGETcx9dTokpRGwZrE2t0LfVOOFxGn83O60KOnt7D+D2-YMx+g@mail.gmail.com>
 <7b8a93c7-ba4a-47b7-9ba9-c94e3c6a7fc5@ideasonboard.com>
 <CAGETcx9Jxthy1jvNDGCKSseM621DVo4TEAsm2JHn8K+fy3MC-A@mail.gmail.com>
In-Reply-To: <CAGETcx9Jxthy1jvNDGCKSseM621DVo4TEAsm2JHn8K+fy3MC-A@mail.gmail.com>
From: Saravana Kannan <saravanak@google.com>
Date: Fri, 25 Oct 2024 15:40:34 -0700
Message-ID: <CAGETcx88eFjAh7FEQr_S_WdkCCxaN82j5mnGYG-mvULBF_KYhg@mail.gmail.com>
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

On Thu, Oct 24, 2024 at 3:55=E2=80=AFPM Saravana Kannan <saravanak@google.c=
om> wrote:
>
> On Wed, Oct 23, 2024 at 1:52=E2=80=AFAM Tomi Valkeinen
> <tomi.valkeinen@ideasonboard.com> wrote:
> >
> > Hi,
> >
> > On 22/10/2024 19:07, Saravana Kannan wrote:
> > > On Tue, Oct 22, 2024 at 12:51=E2=80=AFAM Tomi Valkeinen
> > > <tomi.valkeinen@ideasonboard.com> wrote:
> > >>
> > >> Hi,
> > >>
> > >> On 22/10/2024 02:29, Saravana Kannan wrote:
> > >>> Hi Tomi,
> > >>>
> > >>> Sorry it took a while to get back.
> > >>>
> > >>> On Mon, Sep 16, 2024 at 4:52=E2=80=AFAM Tomi Valkeinen
> > >>> <tomi.valkeinen@ideasonboard.com> wrote:
> > >>>>
> > >>>> Hi,
> > >>>>
> > >>>> We have an issue where two devices have dependencies to each other=
,
> > >>>> according to drivers/base/core.c's fw_devlinks, and this prevents =
them
> > >>>> from probing. I've been adding debugging to the core.c, but so far=
 I
> > >>>> don't quite grasp the issue, so I thought to ask. Maybe someone ca=
n
> > >>>> instantly say that this just won't work...
> > >>>>
> > >>>> So, we have two devices, DSS (display subsystem) and an LVDS panel=
. The
> > >>>> DSS normally outputs parallel video from its video ports (VP), but=
 it
> > >>>> has an integrated LVDS block (OLDI, Open LVDS Display Interface). =
The
> > >>>> OLDI block takes input from DSS's parallel outputs. The OLDI is no=
t
> > >>>> modeled as a separate device (neither in the DT nor in the Linux d=
evice
> > >>>> model) as it has no register space, and is controlled fully by the=
 DSS.
> > >>>>
> > >>>> To support dual-link LVDS, the DSS has two OLDI instances. They bo=
th
> > >>>> take their input from the same parallel video port, but each OLDI =
sends
> > >>>> alternate lines forward. So for a dual-link setup the connections =
would
> > >>>> be like this:
> > >>>>
> > >>>> +-----+-----+         +-------+         +----------+
> > >>>> |     |     |         |       |         |          |
> > >>>> |     | VP1 +----+--->| OLDI0 +-------->|          |
> > >>>> |     |     |    |    |       |         |          |
> > >>>> | DSS +-----+    |    +-------+         |  Panel   |
> > >>>> |     |     |    |    |       |         |          |
> > >>>> |     | VP2 |    +--->| OLDI1 +-------->|          |
> > >>>> |     |     |         |       |         |          |
> > >>>> +-----+-----+         +-------+         +----------+
> > >>>>
> > >>>> As the OLDI is not a separate device, it also does not have an
> > >>>> independent device tree node, but rather it's inside DSS's node. T=
he DSS
> > >>>> parallel outputs are under a normal "ports" node, but OLDI ports a=
re
> > >>>> under "oldi-txes/ports" (see below for dts to clarify this).
> > >>>>
> > >>>> And I think (guess...) this is the root of the issue we're seeing,=
 as it
> > >>>> means the following, one or both of which might be the reason for =
this
> > >>>> issue:
> > >>>>
> > >>>> - OLDI fwnodes don't have an associated struct device *. I think t=
he
> > >>>> reason is that the OLDI media graph ports are one level too deep i=
n the
> > >>>> hierarchy. So while the DSS ports are associated with the DSS devi=
ce,
> > >>>> OLDI ports are not.
> > >>>
> > >>> This is the root cause of the issue in some sense. fw_devlink doesn=
't
> > >>> know that DSS depends on the VP. In the current DT, it only appears=
 as
> > >>> if the OLDI depends on VP. See further below for the fix.
> > >>>
> > >>>>
> > >>>> - The VP ports inside the DSS point to OLDI ports, which are also =
inside
> > >>>> DSS. So ports from a device point to ports in the same device (and=
 back).
> > >>>>
> > >>>> If I understand the fw_devlink code correctly, in a normal case th=
e
> > >>>> links formed with media graphs are marked as a cycle
> > >>>> (FWLINK_FLAG_CYCLE), and then ignored as far as probing goes.
> > >>>>
> > >>>> What we see here is that when using a single-link OLDI panel, the =
panel
> > >>>> driver's probe never gets called, as it depends on the OLDI, and t=
he
> > >>>> link between the panel and the OLDI is not a cycle.
> > >>>>
> > >>>> The DSS driver probes, but the probe fails as it requires all the =
panel
> > >>>> devices to have been probed (and thus registered to the DRM framew=
ork)
> > >>>> before it can finish its setup.
> > >>>>
> > >>>> With dual-link, probing does happen and the drivers work. But I be=
lieve
> > >>>> this is essentially an accident, in the sense that the first link
> > >>>> between the panel and the OLDI still blocks the probing, but the s=
econd
> > >>>> links allows the driver core to traverse the devlinks further, cau=
sing
> > >>>> it to mark the links to the panel as FWLINK_FLAG_CYCLE (or maybe i=
t only
> > >>>> marks one of those links, and that's enough).
> > >>>>
> > >>>> If I set fw_devlink=3Doff as a kernel parameter, the probing proce=
eds
> > >>>> successfully in both single- and dual-link cases.
> > >>>>
> > >>>> Now, my questions is, is this a bug in the driver core, a bug in t=
he DT
> > >>>> bindings, or something in between (DT is fine-ish, but the structu=
re is
> > >>>> something that won't be supported by the driver core).
> > >>>>
> > >>>> And a follow-up question, regardless of the answer to the first on=
e:
> > >>>> which direction should I go from here =3D).
> > >>>>
> > >>>> The device tree data (simplified) for this is as follows, first th=
e
> > >>>> dual-link case, then the single-link case:
> > >>>>
> > >>>> /* Dual-link */
> > >>>>
> > >>>> dss: dss@30200000 {
> > >>>>           compatible =3D "ti,am625-dss";
> > >>>>
> > >>>>           oldi-txes {
> > >>>>                   oldi0: oldi@0 {
> > >>>>                           oldi0_ports: ports {
> > >>>>                                   port@0 {
> > >>>>                                           oldi_0_in: endpoint {
> > >>>>                                                   remote-endpoint =
=3D <&dpi0_out0>;
> > >>>>                                           };
> > >>>>                                   };
> > >>>>
> > >>>>                                   port@1 {
> > >>>>                                           oldi_0_out: endpoint {
> > >>>>                                                   remote-endpoint =
=3D <&lcd_in0>;
> > >>>>                                           };
> > >>>>                                   };
> > >>>>                           };
> > >>>>                   };
> > >>>>
> > >>>>                   oldi1: oldi@1 {
> > >>>>                           oldi1_ports: ports {
> > >>>>                                   port@0 {
> > >>>>                                           oldi_1_in: endpoint {
> > >>>>                                                   remote-endpoint =
=3D <&dpi0_out1>;
> > >>>>                                           };
> > >>>>                                   };
> > >>>>
> > >>>>                                   port@1 {
> > >>>>                                           oldi_1_out: endpoint {
> > >>>>                                                   remote-endpoint =
=3D <&lcd_in1>;
> > >>>>                                           };
> > >>>>                                   };
> > >>>>                           };
> > >>>>                   };
> > >>>>           };
> > >>>>
> > >>>>           dss_ports: ports {
> > >>>>                   port@0 {
> > >>>>                           dpi0_out0: endpoint@0 {
> > >>>>                                   remote-endpoint =3D <&oldi_0_in>=
;
> > >>>>                           };
> > >>>>                           dpi0_out1: endpoint@1 {
> > >>>>                                   remote-endpoint =3D <&oldi_1_in>=
;
> > >>>>                           };
> > >>>>                   };
> > >>>>           };
> > >>>> };
> > >>>>
> > >>>> display {
> > >>>>           compatible =3D "microtips,mf-101hiebcaf0", "panel-simple=
";
> > >>>
> > >>> In here, add this new property that I added some time back.
> > >>>
> > >>> post-init-providers =3D <&oldi-txes>;
> > >>
> > >> Thanks! This helps:
> > >>
> > >> post-init-providers =3D <&oldi0>;
> > >>
> > >> or for dual-link:
> > >>
> > >> post-init-providers =3D <&oldi0>, <&oldi1>;
> > >>
> > >>> This tells fw_devlink that VP doesn't depend on this node for
> > >>> initialization/probing. This property is basically available to bre=
ak
> > >>> cycles in DT and mark one of the edges of the cycles as "not a real
> > >>> init dependency".
> > >>>
> > >>> You should do the same for the single link case too.
> > >>
> > >> While this helps, it's not very nice... Every new DT overlay that us=
es
> > >> OLDI display needs to have these.
> > >
> > > Actually, taking a closer look at the DT and assuming I am visualizin=
g
> > > it correctly in my head, fw_devlink should notice the cycle between
> > > oldi-txes and display and shouldn't block display from probing. Can
> > > you check the cycle detection code and see where it's bailing out
> > > early and not marking the fwnode link with the CYCLE flag?
> > >
> > > __fw_devlink_relax_cycles() is where you want to look. There are a
> > > bunch of debug log messages inside it and around where it's called
> > > from.
> >
> > I'm not quite sure how to read the debug messages. I have attached thre=
e
> > kernel logs, with the debug prints enabled in drivers/base/core.c. The
> > "fixed" is the one with the post-init-providers.
> >
> > I load the display drivers as modules after the main boot has happened,
> > and at the end of the logs I have the kernel prints when I load the
> > modules. The single-link.txt also shows the debugfs/devices_deferred fi=
le.
> >
> > The relevant strings to search are "dss", "oldi" and "display" (display
> > is the panel).
> >
> > So... All devlinks are supplier-consumer links. How are those created
> > with an OF media graph, as there's no clear supplier nor consumer. In
> > this particular case I see that display is marked as a consumer of oldi=
,
> > but also dss is marked as a consumer of oldi. Is this just, essentially=
,
> > random?
>
> No, the cyclic links you see are "sync state only" links. They don't
> enforce any ordering other than "sync_state()" callbacks. So, it's not
> random. In this example, it just ensures that the sync_state()
> callbacks of display and dss will only get called after both those
> devices probe. If it's confusing, try to understand what
> fw_devlink=3Dpermissive does. When we see a cycle, we just put all the
> devices in the cycle in "permissive" mode wrt each other.
>
> > Also, as there's no separate device for OLDI, I don't see oldi at all i=
n
> > /sys/class/devlink/. But what I see there is a bit odd...
> >
> > For dual link I get:
> >
> > platform:display--platform:30200000.dss
> >
> > which, I guess, makes sense. But for single link fixed case, I don't
> > have anything there...
> >
> > > Also, can you check debugfs/devices_deferred, or the
> > > "wait_for_supplier" file under /sys/devices/..../display/ to make sur=
e
> > > it's actually stuck on oldi-txes? Just to make cure it's not some
> > > other corner case that's triggered by oldi-txes?
> > >
> > >> I'm still confused about why this is needed. OF graphs are _always_
> > >> two-way links. Doesn't that mean that OF graphs never can be used fo=
r
> > >> dependencies, as they go both ways?
> > >
> > > Good question :) Yes, they'll always be ignored as cycles. But with
> > > post-init-providers, it's actually better to add it so that cycles ar=
e
> > > broken and better ordering is enforced. See my talk at LPC referee
> > > talk about fw_devlink to see all the benefits you get from it. :)
> >
> > Thanks for the pointer! It was interesting and I now understand the
> > whole devlink thing better, although I have to say the details still
> > escape me... =3D)
> >
> > Also, isn't post-init-providers describing software behavior, not
> > hardware? It doesn't sound like something we should have in the DT.
>
> Not really. In real hardware, there can't be a cycle for
> initialization. And the current DT properties don't tell us which link
> is not needed for initialization. And post-init-providers is for
> describing which dependency is not needed for hardware initialization.
>
> Take a look at the docs in the dt-schema for post-init-providers and
> that might help.
>
> > >> If so, shouldn't we just always
> > >> ignore all OF graphs for dependency checking?
> > >
> > > There are cases when two devices A and B have remote-endpoints betwee=
n
> > > them and ALSO have for example a gpio dependency between them. Where
> > > the gpio is the "post-init-supplier". If we don't parse
> > > remote-endpoint and mark the cycles, cases like these don't get to
> > > probe.
> >
> > I'm sorry, I don't understand this. If we have 1) A and B with a (one
> > way) gpio dependency, and 2) A and B with a (one way) gpio dependency
> > _and_ two way media graph dependency, shouldn't the cases behave
> > identically, as the graph dependency should just be ignored?
>
> Let's assume in both cases the A and B point to each other using
> remote-endpoints. Let's also assume in both cases A says it needs a
> GPIO from B. But the real dependency for probing is that B needs A to
> probe first (due to the remote end point).
>
> The only difference between case 1 and 2 is whether fw_devlink
> supports remote-endpoint parsing.
>
> In case 1, fw_devlink has no way of knowing there is a cycle between A
> and B because it doesn't know that B depends on A (due to
> remote-endpoint). So it can't break any cycles and permanently
> prevents A and B from probing because all it sees is that it needs B
> to provide a GPIO to A.
>
> In case 2, fw_devlink sees that B also depends on A. So there's a
> cycle and marks them both as part of a cycle. And now A and B can
> probe.
>
> Also, forgot to say this last time: we need to support remote-endpoint
> to ensure sync_state() callbacks work correctly when X and Y have
> remote-endpoints between them.
>
> > Or maybe I don't understand the example case at all... Why would the
> > gpio be a post-init-supplier? Isn't gpio something you want at init tim=
e?
>
> Apparently not. There are examples of GPIOs that are used only
> acquired (get()) at run time in reaction to some event.
>
> Anyway, with all that said, I think I have a solution in mind for you
> that should allow devices to probe without post-init-providers. But
> I'll need to make the changes and then test it. Let me send it to you
> in a few days. Btw, you should always use post-init-providers to break
> cycles and do better enforcing of probe/suspend/resume/shutdown order.

Hey Tomi,

Can you give this a shot and let me know if it fixes your issue? I
have more instruction in the patch too.

https://lore.kernel.org/all/20241025223721.184998-1-saravanak@google.com/T/=
#u

-Saravana
