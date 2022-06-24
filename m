Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2E945599BC
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jun 2022 14:40:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B09DC10E33B;
	Fri, 24 Jun 2022 12:40:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com
 [IPv6:2607:f8b0:4864:20::1131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3170B10E33B
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jun 2022 12:40:28 +0000 (UTC)
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-2ef5380669cso23323247b3.9
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jun 2022 05:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=XZAwzSvN1418WBrWmnDVbHQmccxtnQQCuTfqFJ1iD/M=;
 b=iwU4WAwYuY4nkLCJy0axAqGQoG42lj5PEowL1fzfUW1VZzpw1/JWJhdAXHS8VcTujk
 J5fH6JbEPmaRAOT0dBNudO6Csia2IYm+8+BZorymw71HaEIQaO0gekGz1aLnsYhJ6n8y
 cN0jvvlrqeMKRgih7BUcHlBuqsyukSc0/9f2iL29VpMnV0PvNQjD5GQWDbV3gym+XKct
 E271VdMxoeJdxXZvuKsc752Lz08Vnar6at93uoANsDPZ//DTcMmgTajkXuwNtwi0F7sY
 E/5FEF70ekzn+BR24HBj+Qci3izVWS4DQndVou0RRKj+BpMB8XpaucqCnwQOZP36EdMe
 mGig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=XZAwzSvN1418WBrWmnDVbHQmccxtnQQCuTfqFJ1iD/M=;
 b=QeNHBAri1RCTTuRQPvi0WMAk4mTfoJ1U6Kb2AHSOD63AOvnvri3Gr9V7ritfSSmPQk
 hcplvPbnU9diHgRZQx5/0rJX1AkRJYBesIJQU5FZgwtKZaRg8p9eIFpk6/E792EivOYT
 Q7r11YBZPbA2jMmjZyQKqzzGJsQmKvd3kqrQEQbOHujx8yQ77WhGAHxaLEBbGkSiB5tT
 /V33QYsPQzgPieIK6qJsaB/i/LxhIkT1nMtWacNUYoZS4D/7KCW3VwuGKg6LoGKDjwCX
 YLKOfGZWcUQdkCXAd0pKDACr7JFulQhGnpyCKUP5cW9terEjD/fy0OWEDXenKOacqirW
 +JEA==
X-Gm-Message-State: AJIora+F0W1LqGZbgABATn42IRf3qOxCv0BsiNyOX2io5JqVborsIDk1
 ePaat9EYpfhP4vv+0enpV4AcHreA8yNxGYQTS3A=
X-Google-Smtp-Source: AGRyM1uhuP3HFOm268+6mHrbu8xCTmrxJLbj7jAnsvz7AhIXGUaUE3iuu/MCaQ9V+nE2SgjhttjDEqCcfT2jOeVl9kA=
X-Received: by 2002:a81:315:0:b0:317:6789:a0c1 with SMTP id
 21-20020a810315000000b003176789a0c1mr16908125ywd.378.1656074427236; Fri, 24
 Jun 2022 05:40:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220422072841.2206452-1-s.hauer@pengutronix.de>
 <20220422072841.2206452-21-s.hauer@pengutronix.de>
 <A86359EC-5291-41BD-966E-EB7890644731@gmail.com>
 <CAMdYzYoFG3wCQaWXQNJd7mE20OMCj=ZeuewwZfaCJyoCBT-kQQ@mail.gmail.com>
 <0E6FE020-C95E-47CF-A9D6-AC3F2B2D334F@gmail.com>
 <CAMdYzYobfJ7WGN+UQ7t5e1Zy9knjfHLse8KzrGrHPfeMkkG0gw@mail.gmail.com>
 <9F2D8CFF-1EAE-4586-9EE9-82A9D67840BB@gmail.com>
 <CAMdYzYrz7DRj7F9hGaAPaTSiZkQ4eMNujAp8uPuE9geL6kAz4g@mail.gmail.com>
 <9567EECF-A154-4FE1-A03C-5ED080409030@gmail.com>
 <190C3FD3-0185-4A99-B10E-A5790047D993@gmail.com>
In-Reply-To: <190C3FD3-0185-4A99-B10E-A5790047D993@gmail.com>
From: Peter Geis <pgwipeout@gmail.com>
Date: Fri, 24 Jun 2022 08:40:15 -0400
Message-ID: <CAMdYzYqGGfWDr11iyyfzigxsL7_N2szuag9P6TUZGuzGF4oB+A@mail.gmail.com>
Subject: Re: [PATCH v11 20/24] arm64: dts: rockchip: enable vop2 and hdmi tx
 on rock-3a
To: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Sandy Huang <hjc@rock-chips.com>,
 dri-devel@lists.freedesktop.org,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Michael Riesch <michael.riesch@wolfvision.net>, kernel@pengutronix.de,
 Andy Yan <andy.yan@rock-chips.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 kernel test robot <lkp@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 24, 2022 at 4:30 AM Piotr Oniszczuk
<piotr.oniszczuk@gmail.com> wrote:
>
>
>
> > Wiadomo=C5=9B=C4=87 napisana przez Piotr Oniszczuk <piotr.oniszczuk@gma=
il.com> w dniu 14.05.2022, o godz. 15:58:
> >
> >
> >
> >> Wiadomo=C5=9B=C4=87 napisana przez Peter Geis <pgwipeout@gmail.com> w =
dniu 09.05.2022, o godz. 18:00:
> >>
> >> If you want to confirm the hardware is configured correctly you can
> >> remove the cec pin from the hdmi node and set up a cec-gpio node.
> >> https://elixir.bootlin.com/linux/v5.18-rc5/source/Documentation/device=
tree/bindings/media/cec-gpio.txt
> >
> > Peter, Sascha
> >
> > I configured cec-gpio and can confirm: with gpio cec works on my rock3-=
a board v1.31.
> >
> > So summarising my tests:
> >
> >                                        rock3-a v1.1   rock3-a v1.31   r=
ock3-b
> >
> > radxa debian:                               ok             ok          =
      ok
> >
> > other ppl mainline 5.18:               ok             n/t              =
  n/t
> >
> > me with mainline 5.18:                 n/t            nok              =
ok
> >
> > me with mainline 5.18 gpio-cec:  n/t             ok                n/t
> >
> > Non-working combination is: rock3-a v1.31 hw on mainline 5.18.
> > For me it looks like there is bug in case when rk3568 using cec on hdmi=
txm1_cec line.
> > (The same binaries working ok on my rock3-b where cec is on hdmitxm0_ce=
c line. It also works on Peter's rock3a v1.1 - which also uses hdmitxm0_cec=
 line).
> >
> > It looks like upper cec driver can talk to lower driver (dw-hdmi?) but =
nothing is received from lower driver, as my app says:
> > CECAdapter: CEC device can't poll TV: TV does not respond to CEC polls
> >
> > btw: I verified with oscilloscope connected to hdmitxm1_cec line: start=
ing cec-compliance -v -T shows expected series of 0V pulses on hdmitxm1_cec=
 line....
> >
> >
>
> Sascha, Peter
>
> I returned to trying to find why hdmi-cec is not working on rock3-a v1.31=
 hw.
>
> I'm on vop2 v11 on 5.18 mainline.
>
> Current findings:
>
> (1) the same sw. stack/binaries works on rock-3b (where cec uses hdmitx_m=
0 instead of hdmitx_m1 I/O line);
>
> (2) gpio-cec however works no problem on rock3-a;
>
> (3) monitoring cec messages with v4-utils 'cec-follower -s' shows exact t=
he same events in non-working rock3-a and working rock3-b
> (tested by issue configure cec by 'cec-ctl -d /dev/cec0 --phys-addr=3D1.0=
.0.0 --playback' command)

--phys-addr isn't a valid command for this controller. The device
designation is only required if you have more than one cec device.

>
> --> i'm interpreting this as confirmation that low level phy layer receiv=
es ok cec data from connected device on non-working rock3-a;
>
> (4) debug sysfs for cec shows "has CEC follower (in passthrough mode)" fo=
r working rock-3b and there is NO "has CEC follower" debug message in faili=
ng rock3-a.

This makes me suspect you are in fact not using the same software
stack, or are not running the same commands.
Running `cec-follower -v -m -T` on a rk3566 device with working cec
using 5.19-rc1, I see no mention of cec-follower in the debugfs cec0
status entry.

>
> For me It looks like low-level hdmi-cec works ok on failing rock3-a - but=
 upper layers (in hdmi vop2?) are not registering (or failing to register) =
cec-follower filehandle. This happens just when hdmitx I/O in DT is changed=
 from hdmitx_m0 to hdmutx_m1. A bit strange - but all my tests consistently=
 confirming this observation....

There is nothing wrong with vop2 as it is not involved at all in this.
The rockchip hdmi driver (which is not specific to vop2) does nothing
more than call the cec registration method in the dw hdmi bridge
driver, which then calls the kernel cec registration functions.
Changing pinmux changes nothing in how this functions.

>
> I'm too weak in kernel cec internals - so maybe you have any pointers how=
 to further debug/investigate this issue?

As we discussed in the pine64 room, this is still very likely a
hardware issue with this board. A configuration issue with your u-boot
or tf-a is also a possibility, but is less likely.

You showed with your logic analyzer with nothing plugged in and cec
not muxed to m1, data was present on m1. I requested you investigate
the following, to which you haven't replied:
Have you tried forcing m0 to be assigned to a device other than hdmi-cec?
Have you checked if m1 is shorted to another pin?

In regards to your data frames for 4.19 vs 5.18, image-view-on is not
a valid command if the topology doesn't detect a device on the bus.
I recommend running the same test, except run `cec-ctl -S --playback`
and post the results for both.

>
>
>
> BTW: i'm not alone with cec issue on rock3a v1.31 - already 2 other users=
 contacted me with the same issue...
>
>
