Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04D12559570
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jun 2022 10:30:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C1B8112C99;
	Fri, 24 Jun 2022 08:30:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C9E4112C99
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jun 2022 08:30:02 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id z13so3160197lfj.13
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jun 2022 01:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=vhHLGCtSFBmyTfpIq8EGMclBh6vP5ng22bVrKNLVB7U=;
 b=YxzICFaUI5YpE/x/tv9UJzxb8gkbdJ7J4TOXMBqYrDns5wF4Y7Udzf2XXNmTMSUqaK
 dNa9S8hSe5rIDyHc6zGtVR1NwAPvrLiQXsCH7pFV6yWkEF9nfTA/GZUb2XybWzQiMTZo
 h7gNLBJgNFHUM7XjYwT1Ars2SVUZVt0CjFQH0LazrPrUXpw9sI0QExU3BtRXgfHeQ6vY
 qUt9NZs69JQAMPizsExjbQBarCYG3ugwSkQYC15QPcn7slvYp3H7zcR31l78niQ26MPM
 mgdJVdGzg390spTO0HB8/ke+IIf2UJCJGBH3cfUkCbaJSdFzKagmKu03DmVBL3p/9fTy
 8clQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=vhHLGCtSFBmyTfpIq8EGMclBh6vP5ng22bVrKNLVB7U=;
 b=QuJeGlb/7z9BYqEoajizY47iEtGyzDQG9jnS48sdyx8sPSVei3uLR2162sYTGlnjoo
 2wMXsWtosEhXI7xIkWv5twLZsYGZgkZ+/3wJSkQoIle5kIEOuNtWBRSYnhIAkOo9Fj/S
 gYRxFIUVyJF/zGO5VyihHMlTc6MJAFXnWfKoP9pTsuTQCeeKrq+TmjZFVvtNwvxdH/62
 f11u5oZ2uEjtTN1iV4KyhMWe9/nWjl/6aY6BuQevOvv4b2ZUZW7a0Ln3m6goo2DVZb+d
 dVAOvX6W3iVTaDTcidlKWk8VgCrQZ5AMCiQJ7VCY8gUkuLnHFYaWHgsqCpg521bXXgHQ
 gqeg==
X-Gm-Message-State: AJIora+3x1dqPF5InKylOVJV6h7ieGyS7neC+gPvyxIA4OvZqfLKHrAq
 OgcsNfmzef20Qbl/+SfvzSY=
X-Google-Smtp-Source: AGRyM1v9WYYuU0mBUEqOos3s+YPYbE9rehK49zADd4tUbZ1ZMFZa88G7vdlJynmS8fl+cY/I2Cqivg==
X-Received: by 2002:ac2:548d:0:b0:47f:b55a:6f60 with SMTP id
 t13-20020ac2548d000000b0047fb55a6f60mr1598551lfk.627.1656059400359; 
 Fri, 24 Jun 2022 01:30:00 -0700 (PDT)
Received: from smtpclient.apple (31-178-127-80.dynamic.chello.pl.
 [31.178.127.80]) by smtp.gmail.com with ESMTPSA id
 d18-20020a056512369200b0047916805548sm256568lfs.242.2022.06.24.01.29.57
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 24 Jun 2022 01:29:57 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: [PATCH v11 20/24] arm64: dts: rockchip: enable vop2 and hdmi tx
 on rock-3a
From: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
In-Reply-To: <9567EECF-A154-4FE1-A03C-5ED080409030@gmail.com>
Date: Fri, 24 Jun 2022 10:29:55 +0200
Content-Transfer-Encoding: quoted-printable
Message-Id: <190C3FD3-0185-4A99-B10E-A5790047D993@gmail.com>
References: <20220422072841.2206452-1-s.hauer@pengutronix.de>
 <20220422072841.2206452-21-s.hauer@pengutronix.de>
 <A86359EC-5291-41BD-966E-EB7890644731@gmail.com>
 <CAMdYzYoFG3wCQaWXQNJd7mE20OMCj=ZeuewwZfaCJyoCBT-kQQ@mail.gmail.com>
 <0E6FE020-C95E-47CF-A9D6-AC3F2B2D334F@gmail.com>
 <CAMdYzYobfJ7WGN+UQ7t5e1Zy9knjfHLse8KzrGrHPfeMkkG0gw@mail.gmail.com>
 <9F2D8CFF-1EAE-4586-9EE9-82A9D67840BB@gmail.com>
 <CAMdYzYrz7DRj7F9hGaAPaTSiZkQ4eMNujAp8uPuE9geL6kAz4g@mail.gmail.com>
 <9567EECF-A154-4FE1-A03C-5ED080409030@gmail.com>
To: Sascha Hauer <s.hauer@pengutronix.de>,
 Peter Geis <pgwipeout@gmail.com>
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
 Sandy Huang <hjc@rock-chips.com>, dri-devel@lists.freedesktop.org,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Michael Riesch <michael.riesch@wolfvision.net>, kernel@pengutronix.de,
 Andy Yan <andy.yan@rock-chips.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 kernel test robot <lkp@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



> Wiadomo=C5=9B=C4=87 napisana przez Piotr Oniszczuk =
<piotr.oniszczuk@gmail.com> w dniu 14.05.2022, o godz. 15:58:
>=20
>=20
>=20
>> Wiadomo=C5=9B=C4=87 napisana przez Peter Geis <pgwipeout@gmail.com> w =
dniu 09.05.2022, o godz. 18:00:
>>=20
>> If you want to confirm the hardware is configured correctly you can
>> remove the cec pin from the hdmi node and set up a cec-gpio node.
>> =
https://elixir.bootlin.com/linux/v5.18-rc5/source/Documentation/devicetree=
/bindings/media/cec-gpio.txt
>=20
> Peter, Sascha
>=20
> I configured cec-gpio and can confirm: with gpio cec works on my =
rock3-a board v1.31.
>=20
> So summarising my tests:
>=20
>                                        rock3-a v1.1   rock3-a v1.31   =
rock3-b
>=20
> radxa debian:                               ok             ok          =
      ok
>=20
> other ppl mainline 5.18:               ok             n/t              =
  n/t
>=20
> me with mainline 5.18:                 n/t            nok              =
ok
>=20
> me with mainline 5.18 gpio-cec:  n/t             ok                n/t
>=20
> Non-working combination is: rock3-a v1.31 hw on mainline 5.18.=20
> For me it looks like there is bug in case when rk3568 using cec on =
hdmitxm1_cec line.
> (The same binaries working ok on my rock3-b where cec is on =
hdmitxm0_cec line. It also works on Peter's rock3a v1.1 - which also =
uses hdmitxm0_cec line).
>=20
> It looks like upper cec driver can talk to lower driver (dw-hdmi?) but =
nothing is received from lower driver, as my app says:
> CECAdapter: CEC device can't poll TV: TV does not respond to CEC polls
>=20
> btw: I verified with oscilloscope connected to hdmitxm1_cec line: =
starting cec-compliance -v -T shows expected series of 0V pulses on =
hdmitxm1_cec line....
>=20
>=20

Sascha, Peter

I returned to trying to find why hdmi-cec is not working on rock3-a =
v1.31 hw.

I'm on vop2 v11 on 5.18 mainline.
=20
Current findings:

(1) the same sw. stack/binaries works on rock-3b (where cec uses =
hdmitx_m0 instead of hdmitx_m1 I/O line);

(2) gpio-cec however works no problem on rock3-a;

(3) monitoring cec messages with v4-utils 'cec-follower -s' shows exact =
the same events in non-working rock3-a and working rock3-b
(tested by issue configure cec by 'cec-ctl -d /dev/cec0 =
--phys-addr=3D1.0.0.0 --playback' command)

--> i'm interpreting this as confirmation that low level phy layer =
receives ok cec data from connected device on non-working rock3-a;

(4) debug sysfs for cec shows "has CEC follower (in passthrough mode)" =
for working rock-3b and there is NO "has CEC follower" debug message in =
failing rock3-a.

For me It looks like low-level hdmi-cec works ok on failing rock3-a - =
but upper layers (in hdmi vop2?) are not registering (or failing to =
register) cec-follower filehandle. This happens just when hdmitx I/O in =
DT is changed from hdmitx_m0 to hdmutx_m1. A bit strange - but all my =
tests consistently confirming this observation....

I'm too weak in kernel cec internals - so maybe you have any pointers =
how to further debug/investigate this issue?



BTW: i'm not alone with cec issue on rock3a v1.31 - already 2 other =
users contacted me with the same issue...


