Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ABC067EA1D
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jan 2023 16:58:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9645E10E9AC;
	Fri, 27 Jan 2023 15:58:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DDD810E9AB;
 Fri, 27 Jan 2023 15:58:45 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id f34so8790781lfv.10;
 Fri, 27 Jan 2023 07:58:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=gxPYGkBTLyNwdnpWXyMidWkyToKrKS2TDNAp8XKdcr0=;
 b=ltgTBhYyECT4aeWJUQHm1M5VrbDTeEYKKPy3TlfpSBPHPEyHpyCwVRQYNb6pOWXa/8
 JMdvt/o0YODaBX4gNvTyeFU2m5qO4b48n7cXLRGFARYV46Z4V+42B07PhEAPeDehdYqO
 sQ13OD9zuvfwukgpJw5Jemf1H+StxBdNXyY+ee/tM/4LaGnyD0fDH8bwTZhUJtB6D1T0
 093uw82/Ek9zV+/hQay/Fo4H0oSb33BmvmpZdoLiAQzocEFbBmivhwTUsxfM7yZOjfxN
 mK9Spkn2R0vmHarwJWz36Sn6HxaVwSJytU1VdgafpSN+SdeNXgnNxsBuZWidRXECllpc
 demg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gxPYGkBTLyNwdnpWXyMidWkyToKrKS2TDNAp8XKdcr0=;
 b=RSkgt3QEcFJG98GD9ueBU1TW4L8+2gZgKvy3laXiDdH226cB5c1tgf599N7YpgNrWj
 9WJWKxw1gG8nLGsKthV5uP/3XwrlLeFpPaaaZJt93XzwznbmNJpqfsWcixJAEBsc8IFA
 Rq1OHZJaE1v/5WD/2fQZjdzVDlIsynnOQVuqBAIbMmZKQpV0rEIz28vVM6UtrbSLFFov
 gtFYDIfLRUFmdg3SItalIOPZIxzNNA9k1AIQSU+OKQ/aP6hLEsQ0WEoC88Q08EnB+kPX
 Ruho/pd0aQQUuTarPRHr6lmuBmjUfoOFpC38CsoSXn79OEYy3YJyt+PdBf5gGWCbZYhP
 OF8A==
X-Gm-Message-State: AFqh2kq5Y+6FA62x1j8vQngxDJUxWnB0FRcNSijpsPrd7T++ygvHQYfZ
 6MrCLqNNDxT3+LigzSuJq31jPobCPTepBq7EfYY=
X-Google-Smtp-Source: AMrXdXvIluarNvYG0CtDBhA8Lzuu88bokR/qsJ4KfMXHbvl8AcCkstnd9L+0r8FIqD6ztdfcghLyV3SVtwJ1LXGwfAg=
X-Received: by 2002:ac2:5dfb:0:b0:4b5:6a20:ca94 with SMTP id
 z27-20020ac25dfb000000b004b56a20ca94mr3207427lfq.135.1674835123630; Fri, 27
 Jan 2023 07:58:43 -0800 (PST)
MIME-Version: 1.0
References: <b64705e3-2e63-a466-f829-f9568b06766a@googlemail.com>
 <fcec3c78-b5d9-eb48-0fc0-d1f27de87f23@leemhuis.info>
 <b21fa1f6-a71d-5657-8596-ee0be73185ea@leemhuis.info>
In-Reply-To: <b21fa1f6-a71d-5657-8596-ee0be73185ea@leemhuis.info>
From: Chris Clayton <chris2553@googlemail.com>
Date: Fri, 27 Jan 2023 15:58:29 +0000
Message-ID: <CAGGLNVj1Jnb115jc6opcmg1YJ7-trObAWpqv2w_EtLnvbecSvw@mail.gmail.com>
Subject: Re: linux-6.2-rc4+ hangs on poweroff/reboot: Bisected
To: Linux regressions mailing list <regressions@lists.linux.dev>
Content-Type: multipart/alternative; boundary="00000000000099f63605f340f04a"
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
Cc: Karol Herbst <kherbst@redhat.com>,
 ML nouveau <nouveau@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>, bskeggs@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--00000000000099f63605f340f04a
Content-Type: text/plain; charset="UTF-8"

Thanks Thorsten.

I did try to revert but it didnt revert cleanly and I don't have the
knowledge to fix it up.

The patch was part of a merge that included a number of related patches.
I'll try to revert the lot and report back.

Chris


On Fri, 27 Jan 2023, 11:20 Linux kernel regression tracking (Thorsten
Leemhuis), <regressions@leemhuis.info> wrote:

> Hi, this is your Linux kernel regression tracker. Top-posting for once,
> to make this easily accessible to everyone.
>
> @nouveau-maintainers, did anyone take a look at this? The report is
> already 8 days old and I don't see a single reply. Sure, we'll likely
> get a -rc8, but still it would be good to not fix this on the finish line.
>
> Chris, btw, did you try if you can revert the commit on top of latest
> mainline? And if so, does it fix the problem?
>
> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
> --
> Everything you wanna know about Linux kernel regression tracking:
> https://linux-regtracking.leemhuis.info/about/#tldr
> If I did something stupid, please tell me, as explained on that page.
>
> #regzbot poke
>
> On 19.01.23 15:33, Linux kernel regression tracking (Thorsten Leemhuis)
> wrote:
> > [adding various lists and the two other nouveau maintainers to the list
> > of recipients]
>
> > On 18.01.23 21:59, Chris Clayton wrote:
> >> Hi.
> >>
> >> I build and installed the lastest development kernel earlier this week.
> I've found that when I try the laptop down (or
> >> reboot it), it hangs right at the end of closing the current session.
> The last line I see on  the screen when rebooting is:
> >>
> >>      sd 4:0:0:0: [sda] Synchronising SCSI cache
> >>
> >> when closing down I see one additional line:
> >>
> >>      sd 4:0:0:0 [sda]Stopping disk
> >>
> >> In both cases the machine then hangs and I have to hold down the power
> button fot a few seconds to switch it off.
> >>
> >> Linux 6.1 is OK but 6.2-rc1 hangs, so I bisected between this two and
> landed on:
> >>
> >>      # first bad commit: [0e44c21708761977dcbea9b846b51a6fb684907a]
> drm/nouveau/flcn: new code to load+boot simple HS FWs
> >> (VPR scrubber)
> >>
> >> I built and installed a kernel with
> f15cde64b66161bfa74fb58f4e5697d8265b802e (the parent of the bad commit)
> checked out
> >> and that shuts down and reboots fine. It the did the same with the bad
> commit checked out and that does indeed hang, so
> >> I'm confident the bisect outcome is OK.
> >>
> >> Kernels 6.1.6 and 5.15.88 are also OK.
> >>
> >> My system had dual GPUs - one intel and one NVidia. Related extracts
> from 'lscpi -v' is:
> >>
> >> 00:02.0 VGA compatible controller: Intel Corporation CometLake-H GT2
> [UHD Graphics] (rev 05) (prog-if 00 [VGA controller])
> >>         Subsystem: CLEVO/KAPOK Computer CometLake-H GT2 [UHD Graphics]
> >>
> >>         Flags: bus master, fast devsel, latency 0, IRQ 142
> >>
> >>         Memory at c2000000 (64-bit, non-prefetchable) [size=16M]
> >>
> >>         Memory at a0000000 (64-bit, prefetchable) [size=256M]
> >>
> >>         I/O ports at 5000 [size=64]
> >>
> >>         Expansion ROM at 000c0000 [virtual] [disabled] [size=128K]
> >>
> >>         Capabilities: [40] Vendor Specific Information: Len=0c <?>
> >>
> >>         Capabilities: [70] Express Root Complex Integrated Endpoint,
> MSI 00
> >>
> >>         Capabilities: [ac] MSI: Enable+ Count=1/1 Maskable- 64bit-
> >>
> >>         Capabilities: [d0] Power Management version 2
> >>
> >>         Kernel driver in use: i915
> >>
> >>         Kernel modules: i915
> >>
> >>
> >> 01:00.0 VGA compatible controller: NVIDIA Corporation TU117M [GeForce
> GTX 1650 Ti Mobile] (rev a1) (prog-if 00 [VGA
> >> controller])
> >>         Subsystem: CLEVO/KAPOK Computer TU117M [GeForce GTX 1650 Ti
> Mobile]
> >>         Flags: bus master, fast devsel, latency 0, IRQ 141
> >>         Memory at c4000000 (32-bit, non-prefetchable) [size=16M]
> >>         Memory at b0000000 (64-bit, prefetchable) [size=256M]
> >>         Memory at c0000000 (64-bit, prefetchable) [size=32M]
> >>         I/O ports at 4000 [size=128]
> >>         Expansion ROM at c3000000 [disabled] [size=512K]
> >>         Capabilities: [60] Power Management version 3
> >>         Capabilities: [68] MSI: Enable+ Count=1/1 Maskable- 64bit+
> >>         Capabilities: [78] Express Legacy Endpoint, MSI 00
> >>         Kernel driver in use: nouveau
> >>         Kernel modules: nouveau
> >>
> >> DRI_PRIME=1 is exported in one of my init scripts (yes, I am still
> using sysvinit).
> >>
> >> I've attached the bisect.log, but please let me know if I can provide
> any other diagnostics. Please cc me as I'm not
> >> subscribed.
> >
> > Thanks for the report. To be sure the issue doesn't fall through the
> > cracks unnoticed, I'm adding it to regzbot, the Linux kernel regression
> > tracking bot:
> >
> > #regzbot ^introduced e44c2170876197
> > #regzbot title drm: nouveau: hangs on poweroff/reboot
> > #regzbot ignore-activity
> >
> > This isn't a regression? This issue or a fix for it are already
> > discussed somewhere else? It was fixed already? You want to clarify when
> > the regression started to happen? Or point out I got the title or
> > something else totally wrong? Then just reply and tell me -- ideally
> > while also telling regzbot about it, as explained by the page listed in
> > the footer of this mail.
> >
> > Developers: When fixing the issue, remember to add 'Link:' tags pointing
> > to the report (the parent of this mail). See page linked in footer for
> > details.
> >
> > Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
> > --
> > Everything you wanna know about Linux kernel regression tracking:
> > https://linux-regtracking.leemhuis.info/about/#tldr
> > That page also explains what to do if mails like this annoy you.
>

--00000000000099f63605f340f04a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Thanks Thorsten.<div dir=3D"auto"><br></div><div dir=3D"a=
uto">I did try to revert but it didnt revert cleanly and I don&#39;t have t=
he knowledge to fix it up.</div><div dir=3D"auto"><br></div><div dir=3D"aut=
o">The patch was part of a merge that included a number of related patches.=
 I&#39;ll try to revert the lot and report back.</div><div dir=3D"auto"><br=
></div><div dir=3D"auto">Chris<br><div dir=3D"auto"><br></div></div></div><=
br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri,=
 27 Jan 2023, 11:20 Linux kernel regression tracking (Thorsten Leemhuis), &=
lt;<a href=3D"mailto:regressions@leemhuis.info">regressions@leemhuis.info</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hi, this is your Linu=
x kernel regression tracker. Top-posting for once,<br>
to make this easily accessible to everyone.<br>
<br>
@nouveau-maintainers, did anyone take a look at this? The report is<br>
already 8 days old and I don&#39;t see a single reply. Sure, we&#39;ll like=
ly<br>
get a -rc8, but still it would be good to not fix this on the finish line.<=
br>
<br>
Chris, btw, did you try if you can revert the commit on top of latest<br>
mainline? And if so, does it fix the problem?<br>
<br>
Ciao, Thorsten (wearing his &#39;the Linux kernel&#39;s regression tracker&=
#39; hat)<br>
--<br>
Everything you wanna know about Linux kernel regression tracking:<br>
<a href=3D"https://linux-regtracking.leemhuis.info/about/#tldr" rel=3D"nore=
ferrer noreferrer" target=3D"_blank">https://linux-regtracking.leemhuis.inf=
o/about/#tldr</a><br>
If I did something stupid, please tell me, as explained on that page.<br>
<br>
#regzbot poke<br>
<br>
On 19.01.23 15:33, Linux kernel regression tracking (Thorsten Leemhuis)<br>
wrote:<br>
&gt; [adding various lists and the two other nouveau maintainers to the lis=
t<br>
&gt; of recipients]<br>
<br>
&gt; On 18.01.23 21:59, Chris Clayton wrote:<br>
&gt;&gt; Hi.<br>
&gt;&gt;<br>
&gt;&gt; I build and installed the lastest development kernel earlier this =
week. I&#39;ve found that when I try the laptop down (or<br>
&gt;&gt; reboot it), it hangs right at the end of closing the current sessi=
on. The last line I see on=C2=A0 the screen when rebooting is:<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 sd 4:0:0:0: [sda] Synchronising SCSI cache<br>
&gt;&gt;<br>
&gt;&gt; when closing down I see one additional line:<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 sd 4:0:0:0 [sda]Stopping disk<br>
&gt;&gt;<br>
&gt;&gt; In both cases the machine then hangs and I have to hold down the p=
ower button fot a few seconds to switch it off.<br>
&gt;&gt;<br>
&gt;&gt; Linux 6.1 is OK but 6.2-rc1 hangs, so I bisected between this two =
and landed on:<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 # first bad commit: [0e44c21708761977dcbea9b84=
6b51a6fb684907a] drm/nouveau/flcn: new code to load+boot simple HS FWs<br>
&gt;&gt; (VPR scrubber)<br>
&gt;&gt;<br>
&gt;&gt; I built and installed a kernel with f15cde64b66161bfa74fb58f4e5697=
d8265b802e (the parent of the bad commit) checked out<br>
&gt;&gt; and that shuts down and reboots fine. It the did the same with the=
 bad commit checked out and that does indeed hang, so<br>
&gt;&gt; I&#39;m confident the bisect outcome is OK.<br>
&gt;&gt;<br>
&gt;&gt; Kernels 6.1.6 and 5.15.88 are also OK.<br>
&gt;&gt;<br>
&gt;&gt; My system had dual GPUs - one intel and one NVidia. Related extrac=
ts from &#39;lscpi -v&#39; is:<br>
&gt;&gt;<br>
&gt;&gt; 00:02.0 VGA compatible controller: Intel Corporation CometLake-H G=
T2 [UHD Graphics] (rev 05) (prog-if 00 [VGA controller])<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Subsystem: CLEVO/KAPOK Computer C=
ometLake-H GT2 [UHD Graphics]<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Flags: bus master, fast devsel, l=
atency 0, IRQ 142<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Memory at c2000000 (64-bit, non-p=
refetchable) [size=3D16M]<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Memory at a0000000 (64-bit, prefe=
tchable) [size=3D256M]<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0I/O ports at 5000 [size=3D64]<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Expansion ROM at 000c0000 [virtua=
l] [disabled] [size=3D128K]<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Capabilities: [40] Vendor Specifi=
c Information: Len=3D0c &lt;?&gt;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Capabilities: [70] Express Root C=
omplex Integrated Endpoint, MSI 00<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Capabilities: [ac] MSI: Enable+ C=
ount=3D1/1 Maskable- 64bit-<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Capabilities: [d0] Power Manageme=
nt version 2<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Kernel driver in use: i915<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Kernel modules: i915<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; 01:00.0 VGA compatible controller: NVIDIA Corporation TU117M [GeFo=
rce GTX 1650 Ti Mobile] (rev a1) (prog-if 00 [VGA<br>
&gt;&gt; controller])<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Subsystem: CLEVO/KAPOK Computer T=
U117M [GeForce GTX 1650 Ti Mobile]<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Flags: bus master, fast devsel, l=
atency 0, IRQ 141<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Memory at c4000000 (32-bit, non-p=
refetchable) [size=3D16M]<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Memory at b0000000 (64-bit, prefe=
tchable) [size=3D256M]<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Memory at c0000000 (64-bit, prefe=
tchable) [size=3D32M]<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0I/O ports at 4000 [size=3D128]<br=
>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Expansion ROM at c3000000 [disabl=
ed] [size=3D512K]<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Capabilities: [60] Power Manageme=
nt version 3<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Capabilities: [68] MSI: Enable+ C=
ount=3D1/1 Maskable- 64bit+<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Capabilities: [78] Express Legacy=
 Endpoint, MSI 00<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Kernel driver in use: nouveau<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Kernel modules: nouveau<br>
&gt;&gt;<br>
&gt;&gt; DRI_PRIME=3D1 is exported in one of my init scripts (yes, I am sti=
ll using sysvinit).<br>
&gt;&gt;<br>
&gt;&gt; I&#39;ve attached the bisect.log, but please let me know if I can =
provide any other diagnostics. Please cc me as I&#39;m not<br>
&gt;&gt; subscribed.<br>
&gt; <br>
&gt; Thanks for the report. To be sure the issue doesn&#39;t fall through t=
he<br>
&gt; cracks unnoticed, I&#39;m adding it to regzbot, the Linux kernel regre=
ssion<br>
&gt; tracking bot:<br>
&gt; <br>
&gt; #regzbot ^introduced e44c2170876197<br>
&gt; #regzbot title drm: nouveau: hangs on poweroff/reboot<br>
&gt; #regzbot ignore-activity<br>
&gt; <br>
&gt; This isn&#39;t a regression? This issue or a fix for it are already<br=
>
&gt; discussed somewhere else? It was fixed already? You want to clarify wh=
en<br>
&gt; the regression started to happen? Or point out I got the title or<br>
&gt; something else totally wrong? Then just reply and tell me -- ideally<b=
r>
&gt; while also telling regzbot about it, as explained by the page listed i=
n<br>
&gt; the footer of this mail.<br>
&gt; <br>
&gt; Developers: When fixing the issue, remember to add &#39;Link:&#39; tag=
s pointing<br>
&gt; to the report (the parent of this mail). See page linked in footer for=
<br>
&gt; details.<br>
&gt; <br>
&gt; Ciao, Thorsten (wearing his &#39;the Linux kernel&#39;s regression tra=
cker&#39; hat)<br>
&gt; --<br>
&gt; Everything you wanna know about Linux kernel regression tracking:<br>
&gt; <a href=3D"https://linux-regtracking.leemhuis.info/about/#tldr" rel=3D=
"noreferrer noreferrer" target=3D"_blank">https://linux-regtracking.leemhui=
s.info/about/#tldr</a><br>
&gt; That page also explains what to do if mails like this annoy you.<br>
</blockquote></div>

--00000000000099f63605f340f04a--
