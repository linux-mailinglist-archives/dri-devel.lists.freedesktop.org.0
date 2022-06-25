Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B7CB55AB4C
	for <lists+dri-devel@lfdr.de>; Sat, 25 Jun 2022 17:32:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6197714A3DB;
	Sat, 25 Jun 2022 15:32:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4571D14A3D7
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Jun 2022 15:32:03 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id c2so9437208lfk.0
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Jun 2022 08:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=Z9ETXVQoG+NSia4BWAvn8UPiHwd3KtEYBLM24GpcwVY=;
 b=Gg3ivGB/psyf11Mg4SFHWWk4639JAi/73oqYuQ/Bw62+6wcg29IedtjpTCpD6fPyVx
 OFMCg9N9y7lNOJ2Zy9rQG87KUtXYmbjd2+1xSAC+ZDKVfMKIlX5/W+oYLHnOPHUo7gzv
 yYq/6c/rQHKOxf6R2kCZ4NNr0/rTCSuTzcYKvTACr22HGPDSN/cRGArwOxOxQIfZpazx
 cu69leHGF3zlwBUksXt9hL5/4v4xeE4jeNx1lNYsYXJvtycxZnmIwTReS66duc5TnSTC
 QOuzx8guse6oXrARHOrsDnL5c9DytUnHVDDsWwqw8jmybflzBuFiKHtsrxQjJoOkpXBA
 gCMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=Z9ETXVQoG+NSia4BWAvn8UPiHwd3KtEYBLM24GpcwVY=;
 b=ISAVu/uiiytqkrdqvaJkHps7H1tdUV6jL0H0G90oRP6RqnwqcMz2lOhlYQUbL+nhvg
 X40zUZ4dnAKQrcMAVFW3JDTEjJuPLxst3/6Wh6i02TmdkXdqT9qVaIEAhd/3b4gMRHxh
 ot7/cw6sX8hDQmz8tznbqVbs2pCE8W9ZOUucbGEkrozamTP6kotqepR21ZnSE5AzNJqd
 gWY6zO5zYk3PFlUaTRIoNYXYzCFa/MOx7aueqP7xYUCkrZgMg/Axd1q9pnl3fyg4S5/R
 pTI9aX9IGEMCcBS1BaYRRxCkJQWC2EmuOCpjZDgWec07gcxpEf4ZC0/IjetDsYBFz+/B
 D63Q==
X-Gm-Message-State: AJIora9BTPv02HLRg2ndNGlu5x8wv+Hi8bl8CP6l0BC8oophPOs4B8Wg
 afyyKYfX3ZGNCEgqX7R6wEY=
X-Google-Smtp-Source: AGRyM1tYRUZ2+K9ffQbbS2qyHHn7CfSUYEej8iuTqyvLAig+xeKvZnz3WV5JP/I16y9lw5dsM8GbxA==
X-Received: by 2002:a05:6512:1281:b0:47f:7066:6fb2 with SMTP id
 u1-20020a056512128100b0047f70666fb2mr2658566lfs.247.1656171121420; 
 Sat, 25 Jun 2022 08:32:01 -0700 (PDT)
Received: from smtpclient.apple (31-178-127-80.dynamic.chello.pl.
 [31.178.127.80]) by smtp.gmail.com with ESMTPSA id
 g23-20020ac24d97000000b0047255d2117csm908460lfe.171.2022.06.25.08.32.00
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 25 Jun 2022 08:32:00 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: [PATCH v11 20/24] arm64: dts: rockchip: enable vop2 and hdmi tx
 on rock-3a
From: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
In-Reply-To: <CAMdYzYpdo6Hb30y1oEya5GT1eXHJVTETq--HcmMjF40gvCUZ9A@mail.gmail.com>
Date: Sat, 25 Jun 2022 17:31:59 +0200
Content-Transfer-Encoding: quoted-printable
Message-Id: <E9DC63DF-46A6-438E-A7F1-5F7A65F56DFC@gmail.com>
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
dniu 25.06.2022, o godz. 16:00:
>=20
>=20
> The first issue you have is the TV isn't responding until the absolute
> end.

I suspect this is because lack on idle gaps between cec commands sent =
from board to tv.
Maybe TV sw. can't deal with consecutive commands without any idle =
between them?=20

It is interesting that disconnecting TV - so CEC line is driven only by =
board - rock3a still don't have any idle gaps while rock3b (and radxa =
4.19 bsp) has them (very similar between 5.18mailine and 4.19 bsp).

How this is possible that change I/O from m0->m1 impacts _timings_ on =
free hanging CEC line?=20

> This strikes me as a signal integrity issue. Do you have an
> oscilloscope (not a logic analyzer, you need voltages and ramp times)
> to compare the working vs non-working signals? Check both sides of the
> level shifter.

Indeed - i will verify this with digital oscilloscope.=20
Already ordered and must await week or 2 for delivery :-(

My analog oscilloscope shows correct levels and slopes "seems" to be the =
same like in working (no memory so i can compare only visually on fuzzy =
screen)=20

For me key is to understand why on rock3a there is no any idles between =
cec commands - even when nothing is connected to bard (so cec is only =
sending and nothing external impacts cec state machine)....=20=
