Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C9D67EA08
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jan 2023 16:54:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C1ED10E9A5;
	Fri, 27 Jan 2023 15:54:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 820A610E17E;
 Fri, 27 Jan 2023 15:53:57 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id a11so8902691lfg.0;
 Fri, 27 Jan 2023 07:53:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=5OGLoQNhfElwlf4HSSljs/h1UxRr1MpBzN6yt1vwDjk=;
 b=Dxxml8dXOTjwtUnGbGFQErqhLdm3/nf+ySkYzcVBT9XALc77iRzB5+ecKEuc7uP0Z6
 sifhAcHkiMHiNex5VToV03R9EmuRnAIs9uzrgKR6AkmT2563PsFgZPim9QhUO8yw3yLz
 par05/XS+aRFqTlbptc6d65oB8t7lwNl+hcoff7BW7LB5QG2Uo6znBuEiJuTFGH7WTy/
 kpE0g7iRgiTAbB9mOEg26xa7DRWwLFbmJPYlZET7hqZd0ngY6X/yvvavaAbwms0p+DQM
 72VRgaV9FzbkeHXqx2G8J7sKEDZgY7c5Qp7PsBljdr3DRChehdKbqgMqip/P/7ZLfflB
 J5wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5OGLoQNhfElwlf4HSSljs/h1UxRr1MpBzN6yt1vwDjk=;
 b=8Bd8Mrk6WVASK5syMmye0r6agaitXoRwKjBzm/SGGWJxvzRilL4ggcFVgIInYNl8lj
 sGSby7r+TjcDmhoJekE37KZJK4xau4tErOTKY925L54uJxsSxOOxd9Xcac35Rboja3uk
 jeMMwL3Qk6PzoI/kp7PbUUbZBtWAaucLEAHLy75puJPEJZSZFDmSY9YjVXVaVx+nSFfu
 u/GEjMTum2SxZVx/wHSOBSVU9hz06yAKXU4bUb7H1oBQuOMShfZoOG3jbFhzJ33HVRyh
 4nNZ6P+erk1SFIR7pjsFc2kFM6is6M8TYRuzvr20l89GkkwvqqlF/chM6LlY9yMx6O4i
 uy1Q==
X-Gm-Message-State: AFqh2kovM+S5+deF/OSDN9FsMhs67xGOZWoOe8+mhDyMnukpqNiPAwtS
 4p2uOJ1nFC8jg4wNUJ/miUfZ9LHUx0pO5BqLMZg=
X-Google-Smtp-Source: AMrXdXvCQ3pd/VvAclGrdN5I9Xdf8njwLY5A+w3H4bWeF7I/UlW9fVCQzJPBYeiwMyjgu6Ur6CxYweKJSbGJQK5knZw=
X-Received: by 2002:a19:6901:0:b0:4d5:af91:f3e9 with SMTP id
 e1-20020a196901000000b004d5af91f3e9mr1458852lfc.269.1674834835556; Fri, 27
 Jan 2023 07:53:55 -0800 (PST)
MIME-Version: 1.0
References: <b64705e3-2e63-a466-f829-f9568b06766a@googlemail.com>
 <fcec3c78-b5d9-eb48-0fc0-d1f27de87f23@leemhuis.info>
 <b21fa1f6-a71d-5657-8596-ee0be73185ea@leemhuis.info>
 <CACO55tsgc7mmmYBQATqG=zUmO22A1uA3_+A0krdCoORj4PirXg@mail.gmail.com>
In-Reply-To: <CACO55tsgc7mmmYBQATqG=zUmO22A1uA3_+A0krdCoORj4PirXg@mail.gmail.com>
From: Chris Clayton <chris2553@googlemail.com>
Date: Fri, 27 Jan 2023 15:53:44 +0000
Message-ID: <CAGGLNViL2p6=X9phs3Aps6kXN_+g0k6q21Jw5aUyfxO5jsPGYw@mail.gmail.com>
Subject: Re: linux-6.2-rc4+ hangs on poweroff/reboot: Bisected
To: Karol Herbst <kherbst@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000006e4b1005f340df3a"
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
Cc: Linux regressions mailing list <regressions@lists.linux.dev>,
 ML nouveau <nouveau@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>, bskeggs@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--0000000000006e4b1005f340df3a
Content-Type: text/plain; charset="UTF-8"

Hi Karol.

I sent the originsl report to Ben and LKML. Thorsten then added you, Lyude
Paul and the dri-devel and nouveau lists. So you should have received this
report on or about January 19.

Chris

On Fri, 27 Jan 2023, 11:35 Karol Herbst, <kherbst@redhat.com> wrote:

> Where was the original email sent to anyway, because I don't have it at
> all.
>
> Anyhow, I suspect we want to fetch logs to see what's happening, but
> due to the nature of this bug it might get difficult.
>
> I'm checking out the laptops I have here if I can reproduce this
> issue, but I think all mine with Turing GPUs are fine.
>
> Maybe Ben has any idea what might be wrong with
> 0e44c21708761977dcbea9b846b51a6fb684907a or if that's an issue which
> is already fixed by not upstreamed patches as I think I remember Ben
> to talk about something like that recently.
>
> Karol
>
> On Fri, Jan 27, 2023 at 12:20 PM Linux kernel regression tracking
> (Thorsten Leemhuis) <regressions@leemhuis.info> wrote:
> >
> > Hi, this is your Linux kernel regression tracker. Top-posting for once,
> > to make this easily accessible to everyone.
> >
> > @nouveau-maintainers, did anyone take a look at this? The report is
> > already 8 days old and I don't see a single reply. Sure, we'll likely
> > get a -rc8, but still it would be good to not fix this on the finish
> line.
> >
> > Chris, btw, did you try if you can revert the commit on top of latest
> > mainline? And if so, does it fix the problem?
> >
> > Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
> > --
> > Everything you wanna know about Linux kernel regression tracking:
> > https://linux-regtracking.leemhuis.info/about/#tldr
> > If I did something stupid, please tell me, as explained on that page.
> >
> > #regzbot poke
> >
> > On 19.01.23 15:33, Linux kernel regression tracking (Thorsten Leemhuis)
> > wrote:
> > > [adding various lists and the two other nouveau maintainers to the list
> > > of recipients]
> >
> > > On 18.01.23 21:59, Chris Clayton wrote:
> > >> Hi.
> > >>
> > >> I build and installed the lastest development kernel earlier this
> week. I've found that when I try the laptop down (or
> > >> reboot it), it hangs right at the end of closing the current session.
> The last line I see on  the screen when rebooting is:
> > >>
> > >>      sd 4:0:0:0: [sda] Synchronising SCSI cache
> > >>
> > >> when closing down I see one additional line:
> > >>
> > >>      sd 4:0:0:0 [sda]Stopping disk
> > >>
> > >> In both cases the machine then hangs and I have to hold down the
> power button fot a few seconds to switch it off.
> > >>
> > >> Linux 6.1 is OK but 6.2-rc1 hangs, so I bisected between this two and
> landed on:
> > >>
> > >>      # first bad commit: [0e44c21708761977dcbea9b846b51a6fb684907a]
> drm/nouveau/flcn: new code to load+boot simple HS FWs
> > >> (VPR scrubber)
> > >>
> > >> I built and installed a kernel with
> f15cde64b66161bfa74fb58f4e5697d8265b802e (the parent of the bad commit)
> checked out
> > >> and that shuts down and reboots fine. It the did the same with the
> bad commit checked out and that does indeed hang, so
> > >> I'm confident the bisect outcome is OK.
> > >>
> > >> Kernels 6.1.6 and 5.15.88 are also OK.
> > >>
> > >> My system had dual GPUs - one intel and one NVidia. Related extracts
> from 'lscpi -v' is:
> > >>
> > >> 00:02.0 VGA compatible controller: Intel Corporation CometLake-H GT2
> [UHD Graphics] (rev 05) (prog-if 00 [VGA controller])
> > >>         Subsystem: CLEVO/KAPOK Computer CometLake-H GT2 [UHD Graphics]
> > >>
> > >>         Flags: bus master, fast devsel, latency 0, IRQ 142
> > >>
> > >>         Memory at c2000000 (64-bit, non-prefetchable) [size=16M]
> > >>
> > >>         Memory at a0000000 (64-bit, prefetchable) [size=256M]
> > >>
> > >>         I/O ports at 5000 [size=64]
> > >>
> > >>         Expansion ROM at 000c0000 [virtual] [disabled] [size=128K]
> > >>
> > >>         Capabilities: [40] Vendor Specific Information: Len=0c <?>
> > >>
> > >>         Capabilities: [70] Express Root Complex Integrated Endpoint,
> MSI 00
> > >>
> > >>         Capabilities: [ac] MSI: Enable+ Count=1/1 Maskable- 64bit-
> > >>
> > >>         Capabilities: [d0] Power Management version 2
> > >>
> > >>         Kernel driver in use: i915
> > >>
> > >>         Kernel modules: i915
> > >>
> > >>
> > >> 01:00.0 VGA compatible controller: NVIDIA Corporation TU117M [GeForce
> GTX 1650 Ti Mobile] (rev a1) (prog-if 00 [VGA
> > >> controller])
> > >>         Subsystem: CLEVO/KAPOK Computer TU117M [GeForce GTX 1650 Ti
> Mobile]
> > >>         Flags: bus master, fast devsel, latency 0, IRQ 141
> > >>         Memory at c4000000 (32-bit, non-prefetchable) [size=16M]
> > >>         Memory at b0000000 (64-bit, prefetchable) [size=256M]
> > >>         Memory at c0000000 (64-bit, prefetchable) [size=32M]
> > >>         I/O ports at 4000 [size=128]
> > >>         Expansion ROM at c3000000 [disabled] [size=512K]
> > >>         Capabilities: [60] Power Management version 3
> > >>         Capabilities: [68] MSI: Enable+ Count=1/1 Maskable- 64bit+
> > >>         Capabilities: [78] Express Legacy Endpoint, MSI 00
> > >>         Kernel driver in use: nouveau
> > >>         Kernel modules: nouveau
> > >>
> > >> DRI_PRIME=1 is exported in one of my init scripts (yes, I am still
> using sysvinit).
> > >>
> > >> I've attached the bisect.log, but please let me know if I can provide
> any other diagnostics. Please cc me as I'm not
> > >> subscribed.
> > >
> > > Thanks for the report. To be sure the issue doesn't fall through the
> > > cracks unnoticed, I'm adding it to regzbot, the Linux kernel regression
> > > tracking bot:
> > >
> > > #regzbot ^introduced e44c2170876197
> > > #regzbot title drm: nouveau: hangs on poweroff/reboot
> > > #regzbot ignore-activity
> > >
> > > This isn't a regression? This issue or a fix for it are already
> > > discussed somewhere else? It was fixed already? You want to clarify
> when
> > > the regression started to happen? Or point out I got the title or
> > > something else totally wrong? Then just reply and tell me -- ideally
> > > while also telling regzbot about it, as explained by the page listed in
> > > the footer of this mail.
> > >
> > > Developers: When fixing the issue, remember to add 'Link:' tags
> pointing
> > > to the report (the parent of this mail). See page linked in footer for
> > > details.
> > >
> > > Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker'
> hat)
> > > --
> > > Everything you wanna know about Linux kernel regression tracking:
> > > https://linux-regtracking.leemhuis.info/about/#tldr
> > > That page also explains what to do if mails like this annoy you.
> >
>
>

--0000000000006e4b1005f340df3a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hi Karol.<div dir=3D"auto"><br></div><div dir=3D"auto">I =
sent the originsl report to Ben and LKML. Thorsten then added you, Lyude=C2=
=A0 Paul and the dri-devel and nouveau lists. So you should have received t=
his report on or about January 19.</div><div dir=3D"auto"><br></div><div di=
r=3D"auto">Chris</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr"=
 class=3D"gmail_attr">On Fri, 27 Jan 2023, 11:35 Karol Herbst, &lt;<a href=
=3D"mailto:kherbst@redhat.com" rel=3D"noreferrer noreferrer noreferrer nore=
ferrer" target=3D"_blank">kherbst@redhat.com</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc=
 solid;padding-left:1ex">Where was the original email sent to anyway, becau=
se I don&#39;t have it at all.<br>
<br>
Anyhow, I suspect we want to fetch logs to see what&#39;s happening, but<br=
>
due to the nature of this bug it might get difficult.<br>
<br>
I&#39;m checking out the laptops I have here if I can reproduce this<br>
issue, but I think all mine with Turing GPUs are fine.<br>
<br>
Maybe Ben has any idea what might be wrong with<br>
0e44c21708761977dcbea9b846b51a6fb684907a or if that&#39;s an issue which<br=
>
is already fixed by not upstreamed patches as I think I remember Ben<br>
to talk about something like that recently.<br>
<br>
Karol<br>
<br>
On Fri, Jan 27, 2023 at 12:20 PM Linux kernel regression tracking<br>
(Thorsten Leemhuis) &lt;<a href=3D"mailto:regressions@leemhuis.info" rel=3D=
"noreferrer noreferrer noreferrer noreferrer noreferrer" target=3D"_blank">=
regressions@leemhuis.info</a>&gt; wrote:<br>
&gt;<br>
&gt; Hi, this is your Linux kernel regression tracker. Top-posting for once=
,<br>
&gt; to make this easily accessible to everyone.<br>
&gt;<br>
&gt; @nouveau-maintainers, did anyone take a look at this? The report is<br=
>
&gt; already 8 days old and I don&#39;t see a single reply. Sure, we&#39;ll=
 likely<br>
&gt; get a -rc8, but still it would be good to not fix this on the finish l=
ine.<br>
&gt;<br>
&gt; Chris, btw, did you try if you can revert the commit on top of latest<=
br>
&gt; mainline? And if so, does it fix the problem?<br>
&gt;<br>
&gt; Ciao, Thorsten (wearing his &#39;the Linux kernel&#39;s regression tra=
cker&#39; hat)<br>
&gt; --<br>
&gt; Everything you wanna know about Linux kernel regression tracking:<br>
&gt; <a href=3D"https://linux-regtracking.leemhuis.info/about/#tldr" rel=3D=
"noreferrer noreferrer noreferrer noreferrer noreferrer noreferrer" target=
=3D"_blank">https://linux-regtracking.leemhuis.info/about/#tldr</a><br>
&gt; If I did something stupid, please tell me, as explained on that page.<=
br>
&gt;<br>
&gt; #regzbot poke<br>
&gt;<br>
&gt; On 19.01.23 15:33, Linux kernel regression tracking (Thorsten Leemhuis=
)<br>
&gt; wrote:<br>
&gt; &gt; [adding various lists and the two other nouveau maintainers to th=
e list<br>
&gt; &gt; of recipients]<br>
&gt;<br>
&gt; &gt; On 18.01.23 21:59, Chris Clayton wrote:<br>
&gt; &gt;&gt; Hi.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; I build and installed the lastest development kernel earlier =
this week. I&#39;ve found that when I try the laptop down (or<br>
&gt; &gt;&gt; reboot it), it hangs right at the end of closing the current =
session. The last line I see on=C2=A0 the screen when rebooting is:<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 sd 4:0:0:0: [sda] Synchronising SCSI cach=
e<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; when closing down I see one additional line:<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 sd 4:0:0:0 [sda]Stopping disk<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; In both cases the machine then hangs and I have to hold down =
the power button fot a few seconds to switch it off.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Linux 6.1 is OK but 6.2-rc1 hangs, so I bisected between this=
 two and landed on:<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 # first bad commit: [0e44c21708761977dcbe=
a9b846b51a6fb684907a] drm/nouveau/flcn: new code to load+boot simple HS FWs=
<br>
&gt; &gt;&gt; (VPR scrubber)<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; I built and installed a kernel with f15cde64b66161bfa74fb58f4=
e5697d8265b802e (the parent of the bad commit) checked out<br>
&gt; &gt;&gt; and that shuts down and reboots fine. It the did the same wit=
h the bad commit checked out and that does indeed hang, so<br>
&gt; &gt;&gt; I&#39;m confident the bisect outcome is OK.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Kernels 6.1.6 and 5.15.88 are also OK.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; My system had dual GPUs - one intel and one NVidia. Related e=
xtracts from &#39;lscpi -v&#39; is:<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; 00:02.0 VGA compatible controller: Intel Corporation CometLak=
e-H GT2 [UHD Graphics] (rev 05) (prog-if 00 [VGA controller])<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Subsystem: CLEVO/KAPOK Compu=
ter CometLake-H GT2 [UHD Graphics]<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Flags: bus master, fast devs=
el, latency 0, IRQ 142<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Memory at c2000000 (64-bit, =
non-prefetchable) [size=3D16M]<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Memory at a0000000 (64-bit, =
prefetchable) [size=3D256M]<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0I/O ports at 5000 [size=3D64=
]<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Expansion ROM at 000c0000 [v=
irtual] [disabled] [size=3D128K]<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Capabilities: [40] Vendor Sp=
ecific Information: Len=3D0c &lt;?&gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Capabilities: [70] Express R=
oot Complex Integrated Endpoint, MSI 00<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Capabilities: [ac] MSI: Enab=
le+ Count=3D1/1 Maskable- 64bit-<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Capabilities: [d0] Power Man=
agement version 2<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Kernel driver in use: i915<b=
r>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Kernel modules: i915<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; 01:00.0 VGA compatible controller: NVIDIA Corporation TU117M =
[GeForce GTX 1650 Ti Mobile] (rev a1) (prog-if 00 [VGA<br>
&gt; &gt;&gt; controller])<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Subsystem: CLEVO/KAPOK Compu=
ter TU117M [GeForce GTX 1650 Ti Mobile]<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Flags: bus master, fast devs=
el, latency 0, IRQ 141<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Memory at c4000000 (32-bit, =
non-prefetchable) [size=3D16M]<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Memory at b0000000 (64-bit, =
prefetchable) [size=3D256M]<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Memory at c0000000 (64-bit, =
prefetchable) [size=3D32M]<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0I/O ports at 4000 [size=3D12=
8]<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Expansion ROM at c3000000 [d=
isabled] [size=3D512K]<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Capabilities: [60] Power Man=
agement version 3<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Capabilities: [68] MSI: Enab=
le+ Count=3D1/1 Maskable- 64bit+<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Capabilities: [78] Express L=
egacy Endpoint, MSI 00<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Kernel driver in use: nouvea=
u<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Kernel modules: nouveau<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; DRI_PRIME=3D1 is exported in one of my init scripts (yes, I a=
m still using sysvinit).<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; I&#39;ve attached the bisect.log, but please let me know if I=
 can provide any other diagnostics. Please cc me as I&#39;m not<br>
&gt; &gt;&gt; subscribed.<br>
&gt; &gt;<br>
&gt; &gt; Thanks for the report. To be sure the issue doesn&#39;t fall thro=
ugh the<br>
&gt; &gt; cracks unnoticed, I&#39;m adding it to regzbot, the Linux kernel =
regression<br>
&gt; &gt; tracking bot:<br>
&gt; &gt;<br>
&gt; &gt; #regzbot ^introduced e44c2170876197<br>
&gt; &gt; #regzbot title drm: nouveau: hangs on poweroff/reboot<br>
&gt; &gt; #regzbot ignore-activity<br>
&gt; &gt;<br>
&gt; &gt; This isn&#39;t a regression? This issue or a fix for it are alrea=
dy<br>
&gt; &gt; discussed somewhere else? It was fixed already? You want to clari=
fy when<br>
&gt; &gt; the regression started to happen? Or point out I got the title or=
<br>
&gt; &gt; something else totally wrong? Then just reply and tell me -- idea=
lly<br>
&gt; &gt; while also telling regzbot about it, as explained by the page lis=
ted in<br>
&gt; &gt; the footer of this mail.<br>
&gt; &gt;<br>
&gt; &gt; Developers: When fixing the issue, remember to add &#39;Link:&#39=
; tags pointing<br>
&gt; &gt; to the report (the parent of this mail). See page linked in foote=
r for<br>
&gt; &gt; details.<br>
&gt; &gt;<br>
&gt; &gt; Ciao, Thorsten (wearing his &#39;the Linux kernel&#39;s regressio=
n tracker&#39; hat)<br>
&gt; &gt; --<br>
&gt; &gt; Everything you wanna know about Linux kernel regression tracking:=
<br>
&gt; &gt; <a href=3D"https://linux-regtracking.leemhuis.info/about/#tldr" r=
el=3D"noreferrer noreferrer noreferrer noreferrer noreferrer noreferrer" ta=
rget=3D"_blank">https://linux-regtracking.leemhuis.info/about/#tldr</a><br>
&gt; &gt; That page also explains what to do if mails like this annoy you.<=
br>
&gt;<br>
<br>
</blockquote></div>

--0000000000006e4b1005f340df3a--
