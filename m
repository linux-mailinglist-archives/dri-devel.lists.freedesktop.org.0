Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2418E55A511
	for <lists+dri-devel@lfdr.de>; Sat, 25 Jun 2022 01:50:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6AD310F5BB;
	Fri, 24 Jun 2022 23:50:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com
 [IPv6:2607:f8b0:4864:20::b2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 162B510F5B6
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jun 2022 23:50:51 +0000 (UTC)
Received: by mail-yb1-xb2a.google.com with SMTP id p7so5620287ybm.7
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jun 2022 16:50:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Tpyy52Va1yoUFxkWaJiZWHUiWCZKDHYZNk3jb16MkOc=;
 b=bZ5Qc2PmXudjnJ7XSVzr2YBjuEyOt6GrlLXoD12O9fIJ+jo0UGfqbWTpuNs3g/mQzU
 Jr5tBqM0dnffPv10emheE6AMj/AASM0COPNeOXelqEYDSNZNL+Vh6hgLq1ekJayzpiUh
 FED1zdeTCzdhgtVkUu998NvUX+OIXrM02hrA8sF/GIyHXlUdwjVGP5ax3j49XH3/Qnfq
 0rSjgWTimDcX3doA3Z7ckSIbyll1U0JPMFTHErhLEmc4dhHmKEVjMyQDN9iWSE5wr23P
 3jNFI+FsOJUl8Tj1puiOWEj/ZUD4YhNXWgQDnbgEhtw1VTMVzqAjqlW3MlO237R2SY3c
 u4eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Tpyy52Va1yoUFxkWaJiZWHUiWCZKDHYZNk3jb16MkOc=;
 b=Vi66x85BopMyO5eMIkkFvjInY+2SN4H5d1OCTbC1XU8uOPDSTaRUi1k87tJWJyqIzy
 WyBWvVogl7w2VQ/FC7BLjveUXQpHMKNJoTlRG+n/vWR8LdewwbIQPIVFRVYzsGT9btvC
 qdYq/CKykGgHh+MJMMxSRrYOvCl4+xqRK0UlIHcUhYjo4e5QoOCuJ0RvJ0MSBTyWWsDE
 sGIRu9tTtoRjBgZfVIQ+0ySEshA6DCGiEloNzK0BIrlT8/iyvEz0HNth7FIk6dFOO82i
 yeXngW+DJ6CLim5fCAnUf8Uf7XPpwr7LstlkFASzqjxBtvHDlUYb3ulM7ZMvs2JndwZf
 R75w==
X-Gm-Message-State: AJIora8OOjjZ348ypIejtQy9OQOaH775Ovw8MKId5zv7dVinL6O3k320
 VklLMJSGvjD6eani+8h4e2kqY2mkBfqVDdGQN4I=
X-Google-Smtp-Source: AGRyM1vdDI/f8LGzmuk1iFMTPRqi7k5Gwp2+cwL1cyeaP7+C0e3UHCumNqn9DagvqoDBnzMHFa+NXofTv2G6w2geU2U=
X-Received: by 2002:a25:9101:0:b0:669:8f1d:d2cf with SMTP id
 v1-20020a259101000000b006698f1dd2cfmr1730228ybl.461.1656114650221; Fri, 24
 Jun 2022 16:50:50 -0700 (PDT)
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
 <CAMdYzYqGGfWDr11iyyfzigxsL7_N2szuag9P6TUZGuzGF4oB+A@mail.gmail.com>
 <AF6176F5-995E-473B-B494-844ECC26BC03@gmail.com>
In-Reply-To: <AF6176F5-995E-473B-B494-844ECC26BC03@gmail.com>
From: Peter Geis <pgwipeout@gmail.com>
Date: Fri, 24 Jun 2022 19:50:38 -0400
Message-ID: <CAMdYzYocZw1SNtgbfqn1VuvKTCiuMNTYRn2MydiGnL-UxtnYuA@mail.gmail.com>
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

On Fri, Jun 24, 2022 at 2:57 PM Piotr Oniszczuk
<piotr.oniszczuk@gmail.com> wrote:
>
>
>
> > Wiadomo=C5=9B=C4=87 napisana przez Peter Geis <pgwipeout@gmail.com> w d=
niu 24.06.2022, o godz. 14:40:
> >
> >>
> >> Sascha, Peter
> >>
> >> I returned to trying to find why hdmi-cec is not working on rock3-a v1=
.31 hw.
> >>
> >> I'm on vop2 v11 on 5.18 mainline.
> >>
> >> Current findings:
> >>
> >> (1) the same sw. stack/binaries works on rock-3b (where cec uses hdmit=
x_m0 instead of hdmitx_m1 I/O line);
> >>
> >> (2) gpio-cec however works no problem on rock3-a;
> >>
> >> (3) monitoring cec messages with v4-utils 'cec-follower -s' shows exac=
t the same events in non-working rock3-a and working rock3-b
> >> (tested by issue configure cec by 'cec-ctl -d /dev/cec0 --phys-addr=3D=
1.0.0.0 --playback' command)
> >
> > --phys-addr isn't a valid command for this controller. The device
> > designation is only required if you have more than one cec device.
> >
> >>
> >> --> i'm interpreting this as confirmation that low level phy layer rec=
eives ok cec data from connected device on non-working rock3-a;
> >>
> >> (4) debug sysfs for cec shows "has CEC follower (in passthrough mode)"=
 for working rock-3b and there is NO "has CEC follower" debug message in fa=
iling rock3-a.
> >
> > This makes me suspect you are in fact not using the same software
> > stack, or are not running the same commands.
>
> It was the same SD card - with only DT declaration changed in boot.scr
> Such SD card has cec perfectly working in rock3b
>
> > Running `cec-follower -v -m -T` on a rk3566 device with working cec
> > using 5.19-rc1, I see no mention of cec-follower in the debugfs cec0
> > status entry.
> >
> >>
> >> For me It looks like low-level hdmi-cec works ok on failing rock3-a - =
but upper layers (in hdmi vop2?) are not registering (or failing to registe=
r) cec-follower filehandle. This happens just when hdmitx I/O in DT is chan=
ged from hdmitx_m0 to hdmutx_m1. A bit strange - but all my tests consisten=
tly confirming this observation....
> >
> > There is nothing wrong with vop2 as it is not involved at all in this.
> > The rockchip hdmi driver (which is not specific to vop2) does nothing
> > more than call the cec registration method in the dw hdmi bridge
> > driver, which then calls the kernel cec registration functions.
> > Changing pinmux changes nothing in how this functions.
> >
> >>
> >> I'm too weak in kernel cec internals - so maybe you have any pointers =
how to further debug/investigate this issue?
> >
> > As we discussed in the pine64 room, this is still very likely a
> > hardware issue with this board. A configuration issue with your u-boot
> > or tf-a is also a possibility, but is less likely.
> >
> > You showed with your logic analyzer with nothing plugged in and cec
> > not muxed to m1, data was present on m1.
>
> Issue of presence of data on m1 with nothing plugged was mistake from my =
side: wrong board pin used to connect logic analyser GND.
> After correctly connecting GND - all is ok (no any unexpected data; pulse=
s appears only after cec commands; pulses timings are ok so cec protocol an=
alyser shows reasonable data; no cec timing errors reported by protocol ana=
lyser).
>
>
> > I requested you investigate
> > the following, to which you haven't replied:
> > Have you tried forcing m0 to be assigned to a device other than hdmi-ce=
c?
>
> I'm a bit lost here: v1.31 hw uses m1 and m0 is unused.
> Is you idea to verify that m0 is not used by hdmi-cec - even when m1 is d=
eclared for hdmi-cec in DT?
> May you pls hint me with any example of DT snippet for Your m0 assignment=
 idea?

As pinctrl is only assigned when a device explicitly requests it in
the kernel driver, it is possible to have multiple pinctrl pins
assigned to a single device if it was left that way by previous
software or userspace has fun with it. Such as both the m0 and m1 pins
are assigned to the cec-controller. Such a case is broken.

You can assign the m0 pin to another device explicitly, but before
doing so I'd read the register manually just to see if it. For example
that pin also is the spi3m1_cs1 pin.

>
> > Have you checked if m1 is shorted to another pin?
>
> Yes. Looks ok for me.
> (as radxa debian has working ok hdmi-cec i think hw is ok)
>
> >
> > In regards to your data frames for 4.19 vs 5.18, image-view-on is not
> > a valid command if the topology doesn't detect a device on the bus.
> > I recommend running the same test, except run `cec-ctl -S --playback`
> > and post the results for both.
>
> Pls find results for command `cec-ctl -S --playback`:
>
> 1.  radxa ubuntu 4.19 bsp:
> logic analyser cec proto decoded + timings: https://pastebin.com/hHPmKv4i
> FYI logic analyser output (first 350msec): https://paste.pics/63cb4dc7f9b=
51d8825d377b45bf71ae4
>
> 2. mainline 5.18.6:
> logic analyser cec proto decoded + timings: https://pastebin.com/YYDUY4x1
> FYI logic analyser output (first 350msec): https://paste.pics/0d894b8ceba=
164dc6d743f8044c7e01e
>
>

Now this is interesting, the TV is responding in both cases. The TV
does not show up at all in the return sequence in case 2?
