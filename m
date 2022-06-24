Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5A3555A15A
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jun 2022 20:57:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D66010E037;
	Fri, 24 Jun 2022 18:57:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80A5310E037
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jun 2022 18:57:17 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id s10so3734201ljh.12
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jun 2022 11:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=yujU6wgiuzxnVq2RSk00G5bzO79HhVKR1x0d7hhLj3s=;
 b=E70PUdqkKUbvtmMfqmzr1UJkdwXO6yDU9y9de5P4e/7BLHTdXLtxEC+8ygsHMaNzMT
 UzWJeClQrQfYS6Z+AbsF4xGiiPNPo0QHYBCqqIMAbb3HDg00zAi77zw7cZmc7lrt205G
 smqUGNexRQUwzCcrTzxb5005tyXYHTprELkLFLZAouGUFt9n98CryJbx7w1DRCW6RDG/
 Q8UADSlQa/8lFrcGUUJz7tmVvXnmo8PxQQIA9KpaIlKvaw/j5J/9wwgyQOLOWVEbPuMp
 qjG+tzZwrss7i580yHhMUEe93RgILOlLMMfDgSPSjrLUMxflby1DIM2LcgECWLtSyVFJ
 KYLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=yujU6wgiuzxnVq2RSk00G5bzO79HhVKR1x0d7hhLj3s=;
 b=QkNUiLsnjmtWW/ZxBCycoJ6K242ApX/HFdGUB/EfIO61krDHEqDodZ/I4wFGdMJvDL
 YgLFvkN+cJ/JQAe4N453oQn6ZlnAntLpN//qIpFwoyH6ByHAvJ/49YUonbbC+pnhKo56
 xqMC2TAOlAwnr6eutZglZXXj5jEP0fWZ/hoKnFjVlqr146mmcoHZysoijCqDVQnkbZRD
 YNhjMl9ZfytO07DZ2spCHBY7GuSl7JMgdvXa0SM/f1hNKDb3bVbSb51HQk0qZ5HqDHvf
 jCFsdKPhScdgn4qooyefPiSOzRivYTCz9ZSemyVOvX+cJNzbKwKepPw00LsL6Lsc1GKD
 +JpA==
X-Gm-Message-State: AJIora9z6fw/CJPRPYjIUcQRNAb5scexXi9x05jOELUQn0BQQQj+7wpL
 A3yUyoG/J/CG7eHMhwVC4K4=
X-Google-Smtp-Source: AGRyM1sCLxtQnJNMFL1cybqxSpXEbF3Hidxrs6JMbwv+6YqzEkIzQ3oc6pzuig7vB6rv6E7r4Wue+w==
X-Received: by 2002:a05:651c:1790:b0:259:1115:1af8 with SMTP id
 bn16-20020a05651c179000b0025911151af8mr200164ljb.520.1656097035646; 
 Fri, 24 Jun 2022 11:57:15 -0700 (PDT)
Received: from smtpclient.apple (31-178-127-80.dynamic.chello.pl.
 [31.178.127.80]) by smtp.gmail.com with ESMTPSA id
 n1-20020a056512388100b0047861cba7bdsm482737lft.53.2022.06.24.11.57.14
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 24 Jun 2022 11:57:15 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: [PATCH v11 20/24] arm64: dts: rockchip: enable vop2 and hdmi tx
 on rock-3a
From: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
In-Reply-To: <CAMdYzYqGGfWDr11iyyfzigxsL7_N2szuag9P6TUZGuzGF4oB+A@mail.gmail.com>
Date: Fri, 24 Jun 2022 20:57:13 +0200
Content-Transfer-Encoding: quoted-printable
Message-Id: <AF6176F5-995E-473B-B494-844ECC26BC03@gmail.com>
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
To: Peter Geis <pgwipeout@gmail.com>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
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



> Wiadomo=C5=9B=C4=87 napisana przez Peter Geis <pgwipeout@gmail.com> w =
dniu 24.06.2022, o godz. 14:40:
>=20
>>=20
>> Sascha, Peter
>>=20
>> I returned to trying to find why hdmi-cec is not working on rock3-a =
v1.31 hw.
>>=20
>> I'm on vop2 v11 on 5.18 mainline.
>>=20
>> Current findings:
>>=20
>> (1) the same sw. stack/binaries works on rock-3b (where cec uses =
hdmitx_m0 instead of hdmitx_m1 I/O line);
>>=20
>> (2) gpio-cec however works no problem on rock3-a;
>>=20
>> (3) monitoring cec messages with v4-utils 'cec-follower -s' shows =
exact the same events in non-working rock3-a and working rock3-b
>> (tested by issue configure cec by 'cec-ctl -d /dev/cec0 =
--phys-addr=3D1.0.0.0 --playback' command)
>=20
> --phys-addr isn't a valid command for this controller. The device
> designation is only required if you have more than one cec device.
>=20
>>=20
>> --> i'm interpreting this as confirmation that low level phy layer =
receives ok cec data from connected device on non-working rock3-a;
>>=20
>> (4) debug sysfs for cec shows "has CEC follower (in passthrough =
mode)" for working rock-3b and there is NO "has CEC follower" debug =
message in failing rock3-a.
>=20
> This makes me suspect you are in fact not using the same software
> stack, or are not running the same commands.

It was the same SD card - with only DT declaration changed in boot.scr
Such SD card has cec perfectly working in rock3b

> Running `cec-follower -v -m -T` on a rk3566 device with working cec
> using 5.19-rc1, I see no mention of cec-follower in the debugfs cec0
> status entry.
>=20
>>=20
>> For me It looks like low-level hdmi-cec works ok on failing rock3-a - =
but upper layers (in hdmi vop2?) are not registering (or failing to =
register) cec-follower filehandle. This happens just when hdmitx I/O in =
DT is changed from hdmitx_m0 to hdmutx_m1. A bit strange - but all my =
tests consistently confirming this observation....
>=20
> There is nothing wrong with vop2 as it is not involved at all in this.
> The rockchip hdmi driver (which is not specific to vop2) does nothing
> more than call the cec registration method in the dw hdmi bridge
> driver, which then calls the kernel cec registration functions.
> Changing pinmux changes nothing in how this functions.
>=20
>>=20
>> I'm too weak in kernel cec internals - so maybe you have any pointers =
how to further debug/investigate this issue?
>=20
> As we discussed in the pine64 room, this is still very likely a
> hardware issue with this board. A configuration issue with your u-boot
> or tf-a is also a possibility, but is less likely.
>=20
> You showed with your logic analyzer with nothing plugged in and cec
> not muxed to m1, data was present on m1.

Issue of presence of data on m1 with nothing plugged was mistake from my =
side: wrong board pin used to connect logic analyser GND.
After correctly connecting GND - all is ok (no any unexpected data; =
pulses appears only after cec commands; pulses timings are ok so cec =
protocol analyser shows reasonable data; no cec timing errors reported =
by protocol analyser).=20


> I requested you investigate
> the following, to which you haven't replied:
> Have you tried forcing m0 to be assigned to a device other than =
hdmi-cec?

I'm a bit lost here: v1.31 hw uses m1 and m0 is unused.
Is you idea to verify that m0 is not used by hdmi-cec - even when m1 is =
declared for hdmi-cec in DT?
May you pls hint me with any example of DT snippet for Your m0 =
assignment idea? =20
=20
> Have you checked if m1 is shorted to another pin?

Yes. Looks ok for me.
(as radxa debian has working ok hdmi-cec i think hw is ok)=20

>=20
> In regards to your data frames for 4.19 vs 5.18, image-view-on is not
> a valid command if the topology doesn't detect a device on the bus.
> I recommend running the same test, except run `cec-ctl -S --playback`
> and post the results for both.

Pls find results for command `cec-ctl -S --playback`:=20

1.  radxa ubuntu 4.19 bsp:
logic analyser cec proto decoded + timings: =
https://pastebin.com/hHPmKv4i
FYI logic analyser output (first 350msec): =
https://paste.pics/63cb4dc7f9b51d8825d377b45bf71ae4

2. mainline 5.18.6:
logic analyser cec proto decoded + timings: =
https://pastebin.com/YYDUY4x1=20
FYI logic analyser output (first 350msec): =
https://paste.pics/0d894b8ceba164dc6d743f8044c7e01e


