Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C11ED527177
	for <lists+dri-devel@lfdr.de>; Sat, 14 May 2022 15:58:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 994EC10E315;
	Sat, 14 May 2022 13:58:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C06A710E315
 for <dri-devel@lists.freedesktop.org>; Sat, 14 May 2022 13:58:36 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id f4so6068121lfu.12
 for <dri-devel@lists.freedesktop.org>; Sat, 14 May 2022 06:58:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=WFXcfLyV82TN1IHaZmk8t/+knPV2lzNY8wGFyy7H1XU=;
 b=Dy8KXqN/xkldZpue0XYKALuvc2JxE/lAHRiJb67GQ/97IgXVeS+pBcFtFl9UU2Oufa
 dzfW4iUn4ZT9X/PNPUnIKtkqBVjXzelZxGZwG38zD219RAR5Ht1dZQoxks+m22GmAt5H
 +p50Yr6mfnbJphf0/Gi0XPWWTfdAEOM+XoyYpx+UhdOANVa7AqR3uvR9sBtku/mMz16v
 nGgcCu/eGBRqSc4ivvEsHGYJ0nkh+G8utlyKE92sJLETlCNIAyMxz5JDQfUr+DJhkHUY
 9SDqSRTRUUUsmIvIPx6CIubA600LDqf7yXHYzFU3ST8YsnWPeQD623unpbVVnrIOKrG4
 o/Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=WFXcfLyV82TN1IHaZmk8t/+knPV2lzNY8wGFyy7H1XU=;
 b=6kgU486HsMzrNmWRd3Bn7L8p8rdoFARMPfzHu+7PGqy9bzajS/g9/vAu4enuZM1dcQ
 iY+3OTcy830CdBcYgtPMsi6J89a+nJIWZrXEGmbrIZjpiht+BGf55EPwD9uwp52mJUS2
 RdQkwNLu53tAVjyMNsmHo9TZrtm8m5Qh7lXQOYkm1866Yw2Lq5EkTEydfUALV2Sr4L4Q
 U+4g4jwNrN9gf91Jaf1QgIE3Zn8GfPVs4r8u57/3et9gj91cCxyGIF5u8jCFfOiZLja+
 Hd1iuiZH1anxYQ6yo0XED6VhFWfYrfSs+IWaXieP0Avk4BMfgeM9PeFgcsKLlp6nxMoM
 +brA==
X-Gm-Message-State: AOAM532gOt3nO965mPdtUkc1ux9pYU7yNIBQgpqkoYiblWD8JfPe46ef
 ia2RxnFdldna06DreYzJ4XY=
X-Google-Smtp-Source: ABdhPJxOBSnngxlxkFS9HgODgvy8FFmIRWFKtGDuWxolf96hSsSZHXsgBM1SM0qhLe6rv0jxdjDiOQ==
X-Received: by 2002:ac2:43a1:0:b0:472:1de:bbdc with SMTP id
 t1-20020ac243a1000000b0047201debbdcmr6768984lfl.48.1652536714934; 
 Sat, 14 May 2022 06:58:34 -0700 (PDT)
Received: from smtpclient.apple (31-178-191-245.dynamic.chello.pl.
 [31.178.191.245]) by smtp.gmail.com with ESMTPSA id
 z13-20020ac24f8d000000b0047255d21134sm719016lfs.99.2022.05.14.06.58.32
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 14 May 2022 06:58:34 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: [PATCH v11 20/24] arm64: dts: rockchip: enable vop2 and hdmi tx
 on rock-3a
From: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
In-Reply-To: <CAMdYzYrz7DRj7F9hGaAPaTSiZkQ4eMNujAp8uPuE9geL6kAz4g@mail.gmail.com>
Date: Sat, 14 May 2022 15:58:30 +0200
Content-Transfer-Encoding: quoted-printable
Message-Id: <9567EECF-A154-4FE1-A03C-5ED080409030@gmail.com>
References: <20220422072841.2206452-1-s.hauer@pengutronix.de>
 <20220422072841.2206452-21-s.hauer@pengutronix.de>
 <A86359EC-5291-41BD-966E-EB7890644731@gmail.com>
 <CAMdYzYoFG3wCQaWXQNJd7mE20OMCj=ZeuewwZfaCJyoCBT-kQQ@mail.gmail.com>
 <0E6FE020-C95E-47CF-A9D6-AC3F2B2D334F@gmail.com>
 <CAMdYzYobfJ7WGN+UQ7t5e1Zy9knjfHLse8KzrGrHPfeMkkG0gw@mail.gmail.com>
 <9F2D8CFF-1EAE-4586-9EE9-82A9D67840BB@gmail.com>
 <CAMdYzYrz7DRj7F9hGaAPaTSiZkQ4eMNujAp8uPuE9geL6kAz4g@mail.gmail.com>
To: Peter Geis <pgwipeout@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>
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



> Wiadomo=C5=9B=C4=87 napisana przez Peter Geis <pgwipeout@gmail.com> w =
dniu 09.05.2022, o godz. 18:00:
>=20
> If you want to confirm the hardware is configured correctly you can
> remove the cec pin from the hdmi node and set up a cec-gpio node.
> =
https://elixir.bootlin.com/linux/v5.18-rc5/source/Documentation/devicetree=
/bindings/media/cec-gpio.txt

Peter, Sascha

I configured cec-gpio and can confirm: with gpio cec works on my rock3-a =
board v1.31.

So summarising my tests:

                                        rock3-a v1.1   rock3-a v1.31   =
rock3-b

radxa debian:                               ok             ok            =
    ok

other ppl mainline 5.18:               ok             n/t                =
n/t

me with mainline 5.18:                 n/t            nok              =
ok

me with mainline 5.18 gpio-cec:  n/t             ok                n/t

Non-working combination is: rock3-a v1.31 hw on mainline 5.18.=20
For me it looks like there is bug in case when rk3568 using cec on =
hdmitxm1_cec line.
(The same binaries working ok on my rock3-b where cec is on hdmitxm0_cec =
line. It also works on Peter's rock3a v1.1 - which also uses =
hdmitxm0_cec line).

It looks like upper cec driver can talk to lower driver (dw-hdmi?) but =
nothing is received from lower driver, as my app says:
CECAdapter: CEC device can't poll TV: TV does not respond to CEC polls

btw: I verified with oscilloscope connected to hdmitxm1_cec line: =
starting cec-compliance -v -T shows expected series of 0V pulses on =
hdmitxm1_cec line....

   =20


