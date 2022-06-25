Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EC9855AAB3
	for <lists+dri-devel@lfdr.de>; Sat, 25 Jun 2022 16:01:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4070812BD28;
	Sat, 25 Jun 2022 14:01:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com
 [IPv6:2607:f8b0:4864:20::1131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 415D512BD28
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Jun 2022 14:01:01 +0000 (UTC)
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-317710edb9dso49021057b3.0
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Jun 2022 07:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=OlJBCh4/5PmpnOBhdoVJtvgIr2FzDQlSyXY7J+nK0VE=;
 b=dBfvNQDZkFwNtS9+Lh+Xj52q2P3PzKSoPQmkSPiFqREMcsgU9kT5Nlm4rqdMKP1SAy
 F92o3do1EeRNELMBwzrPKeLwxSWbxdZZVDNg9Xl2RJFbNoOSdNWsnhtlFPuOB7t5OEut
 pyGu5ncq05nHPMQaocy3duodBXz7k5BLyLYztnSILOBSOG92Dz85BfU5Lux12wQUSBbh
 dyfMon60GIfDZEdlWja7oI36wXpNCDmWtW/PR02yNoWs6ABu4ditgZRgR8eGO0QQQ/Ti
 P5L2NW/u8MvnRQ5RiZGiF2Mk4JskcjroXprfV1C3tbyg5FjUwm5FDY4q9pXkZEHfcUMy
 dejA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=OlJBCh4/5PmpnOBhdoVJtvgIr2FzDQlSyXY7J+nK0VE=;
 b=WHtyAczjnxG5MU/Vdo9T0wxj7xx8sIuQYuMYlmpL3Cfg9SKIIag8MiEYQphp+Ps+7g
 9nDeWvwQQnRaOb+MepC4FU+edWgqSzqGNzUX7rgGczhdxpnqhMX6S3L+mbWVvWjafGPe
 AiTtH/fY7CxL1/32mYjoJ3JIlBrdWV2c9WvFMl7dC+qFweq/MJ6mlX/W8K9JKKw3cjfU
 BxNr9oMbPEv3BuZhqSC2J1kzEeoybqkE2smnmqTCOpEtZ8hQclEwS8OMza2/Vh6zWN3g
 punE1AkK2j+Y+1MKBoMGWyG+7GabVKRmMZgaHAcSaYwkt7pubREkIg1/k0jw4kO0pMpe
 yYWw==
X-Gm-Message-State: AJIora+POiZfqIv9pH9+E9cqm8PF+xNhouN4M71owO2mjVMNRp6hl/Wo
 V+rSTugujx6tXw5lnzQVU4PhDo0ooRNUHqDCSu8=
X-Google-Smtp-Source: AGRyM1uQlivRe5FWpvpscLIvjiOdf2TpFkPxQgyGtyGmj8sHtwRx5yQ6IrqG25Vxr9wWF/W4/8M/SsEdY8Os9zAlyk8=
X-Received: by 2002:a81:754:0:b0:314:59e0:ceb7 with SMTP id
 81-20020a810754000000b0031459e0ceb7mr4500103ywh.178.1656165659927; Sat, 25
 Jun 2022 07:00:59 -0700 (PDT)
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
 <CAMdYzYocZw1SNtgbfqn1VuvKTCiuMNTYRn2MydiGnL-UxtnYuA@mail.gmail.com>
 <0D8B18A1-82FD-4902-A443-AD774DE43DAD@gmail.com>
In-Reply-To: <0D8B18A1-82FD-4902-A443-AD774DE43DAD@gmail.com>
From: Peter Geis <pgwipeout@gmail.com>
Date: Sat, 25 Jun 2022 10:00:48 -0400
Message-ID: <CAMdYzYpdo6Hb30y1oEya5GT1eXHJVTETq--HcmMjF40gvCUZ9A@mail.gmail.com>
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

On Sat, Jun 25, 2022 at 9:18 AM Piotr Oniszczuk
<piotr.oniszczuk@gmail.com> wrote:
>
>
>
> > Wiadomo=C5=9B=C4=87 napisana przez Peter Geis <pgwipeout@gmail.com> w d=
niu 25.06.2022, o godz. 01:50:
> >
> > On Fri, Jun 24, 2022 at 2:57 PM Piotr Oniszczuk
> > <piotr.oniszczuk@gmail.com> wrote:
> >>
> >>
> >>
> >>> Wiadomo=C5=9B=C4=87 napisana przez Peter Geis <pgwipeout@gmail.com> w=
 dniu 24.06.2022, o godz. 14:40:
> >>>
> >>>>
> >>>> Sascha, Peter
> >>>>
> >>>> I returned to trying to find why hdmi-cec is not working on rock3-a =
v1.31 hw.
> >>>>
> >>>> I'm on vop2 v11 on 5.18 mainline.
> >>>>
> >>>> Current findings:
> >>>>
> >>>> (1) the same sw. stack/binaries works on rock-3b (where cec uses hdm=
itx_m0 instead of hdmitx_m1 I/O line);
> >>>>
> >>>> (2) gpio-cec however works no problem on rock3-a;
> >>>>
> >>>> (3) monitoring cec messages with v4-utils 'cec-follower -s' shows ex=
act the same events in non-working rock3-a and working rock3-b
> >>>> (tested by issue configure cec by 'cec-ctl -d /dev/cec0 --phys-addr=
=3D1.0.0.0 --playback' command)
> >>>
> >>> --phys-addr isn't a valid command for this controller. The device
> >>> designation is only required if you have more than one cec device.
> >>>
> >>>>
> >>>> --> i'm interpreting this as confirmation that low level phy layer r=
eceives ok cec data from connected device on non-working rock3-a;
> >>>>
> >>>> (4) debug sysfs for cec shows "has CEC follower (in passthrough mode=
)" for working rock-3b and there is NO "has CEC follower" debug message in =
failing rock3-a.
> >>>
> >>> This makes me suspect you are in fact not using the same software
> >>> stack, or are not running the same commands.
> >>
> >> It was the same SD card - with only DT declaration changed in boot.scr
> >> Such SD card has cec perfectly working in rock3b
> >>
> >>> Running `cec-follower -v -m -T` on a rk3566 device with working cec
> >>> using 5.19-rc1, I see no mention of cec-follower in the debugfs cec0
> >>> status entry.
> >>>
> >>>>
> >>>> For me It looks like low-level hdmi-cec works ok on failing rock3-a =
- but upper layers (in hdmi vop2?) are not registering (or failing to regis=
ter) cec-follower filehandle. This happens just when hdmitx I/O in DT is ch=
anged from hdmitx_m0 to hdmutx_m1. A bit strange - but all my tests consist=
ently confirming this observation....
> >>>
> >>> There is nothing wrong with vop2 as it is not involved at all in this=
.
> >>> The rockchip hdmi driver (which is not specific to vop2) does nothing
> >>> more than call the cec registration method in the dw hdmi bridge
> >>> driver, which then calls the kernel cec registration functions.
> >>> Changing pinmux changes nothing in how this functions.
> >>>
> >>>>
> >>>> I'm too weak in kernel cec internals - so maybe you have any pointer=
s how to further debug/investigate this issue?
> >>>
> >>> As we discussed in the pine64 room, this is still very likely a
> >>> hardware issue with this board. A configuration issue with your u-boo=
t
> >>> or tf-a is also a possibility, but is less likely.
> >>>
> >>> You showed with your logic analyzer with nothing plugged in and cec
> >>> not muxed to m1, data was present on m1.
> >>
> >> Issue of presence of data on m1 with nothing plugged was mistake from =
my side: wrong board pin used to connect logic analyser GND.
> >> After correctly connecting GND - all is ok (no any unexpected data; pu=
lses appears only after cec commands; pulses timings are ok so cec protocol=
 analyser shows reasonable data; no cec timing errors reported by protocol =
analyser).
> >>
> >>
> >>> I requested you investigate
> >>> the following, to which you haven't replied:
> >>> Have you tried forcing m0 to be assigned to a device other than hdmi-=
cec?
> >>
> >> I'm a bit lost here: v1.31 hw uses m1 and m0 is unused.
> >> Is you idea to verify that m0 is not used by hdmi-cec - even when m1 i=
s declared for hdmi-cec in DT?
> >> May you pls hint me with any example of DT snippet for Your m0 assignm=
ent idea?
> >
> > As pinctrl is only assigned when a device explicitly requests it in
> > the kernel driver, it is possible to have multiple pinctrl pins
> > assigned to a single device if it was left that way by previous
> > software or userspace has fun with it. Such as both the m0 and m1 pins
> > are assigned to the cec-controller. Such a case is broken.
> >
> > You can assign the m0 pin to another device explicitly, but before
> > doing so I'd read the register manually just to see if it. For example
> > that pin also is the spi3m1_cs1 pin.
>
> So done test where I assigned m0 for gpio-cec.
> 2nd cec device appeared.
> But this changed nothing regarding hdmi-cec.  Sill dead :-(

On Rockchip devices, pinctrl and gpio are separate blocks. Even if you
enable gpio, the pinctrl will still be assigned to the underlying
device. You need to change the pinctrl assignment to another device.
What was the result of your read of the register?

>
> >
> >>
> >>> Have you checked if m1 is shorted to another pin?
> >>
> >> Yes. Looks ok for me.
> >> (as radxa debian has working ok hdmi-cec i think hw is ok)
> >>
> >>>
> >>> In regards to your data frames for 4.19 vs 5.18, image-view-on is not
> >>> a valid command if the topology doesn't detect a device on the bus.
> >>> I recommend running the same test, except run `cec-ctl -S --playback`
> >>> and post the results for both.
> >>
> >> Pls find results for command `cec-ctl -S --playback`:
> >>
> >> 1.  radxa ubuntu 4.19 bsp:
> >> logic analyser cec proto decoded + timings: https://pastebin.com/hHPmK=
v4i
> >> FYI logic analyser output (first 350msec): https://paste.pics/63cb4dc7=
f9b51d8825d377b45bf71ae4
> >>
> >> 2. mainline 5.18.6:
> >> logic analyser cec proto decoded + timings: https://pastebin.com/YYDUY=
4x1
> >> FYI logic analyser output (first 350msec): https://paste.pics/0d894b8c=
eba164dc6d743f8044c7e01e
> >>
> >>
> >
> > Now this is interesting, the TV is responding in both cases. The TV
> > does not show up at all in the return sequence in case 2?
>
>
> So I started to compare `cec-ctl -S --playback`on rock3a and rock3b - but=
 this time after cold reboots of: TV and board.
>
> overview of whole comm:
> working OK rock3-b ( https://pastebin.com/ffthT5UQ )
> non-working rock3-a ( https://pastebin.com/Qdn71qwS )
>
> First difference i see is idle/no idle between cec commands:
> non-working: https://paste.pics/bb1616312d1f75b8808aff30f186ed76
> working: https://paste.pics/96d96f4950f4d87defbfd8172819de2d
>
> i.e.
> working: has 20ms idle before opcode 0xA6 https://paste.pics/346f482310ba=
a0d6ed0a3d5b2e820e09
> while non-working has no any idle https://paste.pics/640ee190e0d501d4fc9b=
05c746a68502
> data in frames is the same
>
> or
> working: has 20ms idle before opcode 0x84 https://paste.pics/93cb7c3cd72a=
b0f91c9a5b6ff24cadf3
> while non-working has no any idle https://paste.pics/e9afed93f5b3acf6e11a=
a00d390d52bc
> data in frames is the same
>
> for opcode 0x87 data in frames is also the same
>
>
> generally:
> working has always around 16..20ms of idle between commands while non-wor=
king has no any idles.
>
> How this is possible that changing m0->m1 changes timings in such way?
>
>

The first issue you have is the TV isn't responding until the absolute
end. This strikes me as a signal integrity issue. Do you have an
oscilloscope (not a logic analyzer, you need voltages and ramp times)
to compare the working vs non-working signals? Check both sides of the
level shifter.

You can try bumping the drive levels for the m1 pin as well.

The m1 pin lives in the pmuio domain, whereas the other devices live
in the normal domain. That could be affecting the signal strength.
