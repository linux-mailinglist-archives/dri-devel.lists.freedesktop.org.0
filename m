Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E45056D04B
	for <lists+dri-devel@lfdr.de>; Sun, 10 Jul 2022 19:01:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E3FB14BCFA;
	Sun, 10 Jul 2022 17:01:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6271F14BCF6
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Jul 2022 17:01:23 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id bu42so5328074lfb.0
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Jul 2022 10:01:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=l5KBCfAYsYBJK00LG729DXfB0UnpaT/zELkVvdQsl2k=;
 b=l4xC2JvKpgguZIekeYks5GBWZNd+nxhscrKPy/iFwlHrX5IHPNR+dg0MkRAGLCLnn4
 J/qjx4gCp+iS+3quLxQDXlEs2QWURLHYdt764zfFSCxgGn5GaK0mTuz1JRGHzGKk/D4D
 2sJtQ8KjuDQ7CmOf5avdSbC4qNCo6olgDxce1o4eg+hvYB+/fa9potF1u4ejsVHdwLCQ
 iEpSvBL9vngc4nvqP6ZFdx5/tk6P8jY2XRGSCsE45SU6hvP2qOjMIH65h9Ym2PzoO28H
 F+3PDTtO1SyY00S2atlgTeBjqk47AEp4IALEacYHMvQkhx9lp7J199Aro/pMfoMFnKxa
 X/Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=l5KBCfAYsYBJK00LG729DXfB0UnpaT/zELkVvdQsl2k=;
 b=T+GTtdqklcbnrqrAs0C8bp0qEP8qBpEwgXYQmQeFMqgYsoy1RldQ1G+qc8Q38t7eFh
 C9rgnHfAviUXdJKTz6yZ79L/CUMZsbX9AOXpztFfvnWkJNkl6lFXQ+54R9r6YBVKeotr
 ovaG/Hz8PlKn13Rd8KUecqbUe7///Ag3UKfjKupM5G0UPgYQgfIEYTqBiKaEfDEV5mj3
 8eZd5DAVaFiijFfkOg1J4fcvNrry2+TmCzTYA9YumaQq8TD/p5+p77XVn+NnRDTEr0aF
 fH/0L2kkO4My0t+0nSIETTIZSX5/HGCu0ZHxSdIPhCDEJzsl8Xirjv900mipRCrl+MGU
 Db3g==
X-Gm-Message-State: AJIora+DbONG16FNZ7oRrhO+LhkCdM0+HIAoJYrw624hoG7uuZ/w7iUa
 o+E3RxZgjv5RRayrpjSQ3SE=
X-Google-Smtp-Source: AGRyM1uyIS9oK9Fh8cBxLkbNkrlVHcMu5NngnD6Rs6WSVParGKGEiwgMWhY3lvBxlSFpWCJ4WEn3MA==
X-Received: by 2002:a05:6512:505:b0:489:c93d:a95c with SMTP id
 o5-20020a056512050500b00489c93da95cmr6616045lfb.115.1657472481536; 
 Sun, 10 Jul 2022 10:01:21 -0700 (PDT)
Received: from smtpclient.apple (31-178-127-80.dynamic.chello.pl.
 [31.178.127.80]) by smtp.gmail.com with ESMTPSA id
 q12-20020a056512210c00b00489daae997fsm355423lfr.10.2022.07.10.10.01.20
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 10 Jul 2022 10:01:21 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: [PATCH v11 20/24] arm64: dts: rockchip: enable vop2 and hdmi tx
 on rock-3a
From: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
In-Reply-To: <E9DC63DF-46A6-438E-A7F1-5F7A65F56DFC@gmail.com>
Date: Sun, 10 Jul 2022 19:01:17 +0200
Content-Transfer-Encoding: quoted-printable
Message-Id: <F2EFA9CE-C8D7-4D7B-9CAB-80EEA9FAF7DB@gmail.com>
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
 <CAMdYzYpdo6Hb30y1oEya5GT1eXHJVTETq--HcmMjF40gvCUZ9A@mail.gmail.com>
 <E9DC63DF-46A6-438E-A7F1-5F7A65F56DFC@gmail.com>
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



> Wiadomo=C5=9B=C4=87 napisana przez Piotr Oniszczuk =
<piotr.oniszczuk@gmail.com> w dniu 25.06.2022, o godz. 17:31:
>=20
>=20
>=20
>> Wiadomo=C5=9B=C4=87 napisana przez Peter Geis <pgwipeout@gmail.com> w =
dniu 25.06.2022, o godz. 16:00:
>>=20
>>=20
>> The first issue you have is the TV isn't responding until the =
absolute
>> end.
>=20
> I suspect this is because lack on idle gaps between cec commands sent =
from board to tv.
> Maybe TV sw. can't deal with consecutive commands without any idle =
between them?=20
>=20
> It is interesting that disconnecting TV - so CEC line is driven only =
by board - rock3a still don't have any idle gaps while rock3b (and radxa =
4.19 bsp) has them (very similar between 5.18mailine and 4.19 bsp).
>=20
> How this is possible that change I/O from m0->m1 impacts _timings_ on =
free hanging CEC line?=20
>=20
>> This strikes me as a signal integrity issue. Do you have an
>> oscilloscope (not a logic analyzer, you need voltages and ramp times)
>> to compare the working vs non-working signals? Check both sides of =
the
>> level shifter.
>=20
> Indeed - i will verify this with digital oscilloscope.=20

Peter,

fyi

I got my oscilloscope and do measurements on hdmi cable cec line on: =
working rock3b and non-working rock3a.
sw was exactly the same (same sd card; only dtb changed)

Pls see measurements for:
start pulse
"0" pulse
"1" pulse

non-working rock3-a:
http://warped.inet2.org/rock3a-one.png
http://warped.inet2.org/rock3a-start.png
http://warped.inet2.org/rock3a-zero.png

working rock3-b
http://warped.inet2.org/rock3b-one.png
http://warped.inet2.org/rock3b-start.png
http://warped.inet2.org/rock3b-zero.png

Now i'm 99% sure issue is not hw related but sw (kernel)...

br=
