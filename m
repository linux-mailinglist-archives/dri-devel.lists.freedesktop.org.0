Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B73B151EDD7
	for <lists+dri-devel@lfdr.de>; Sun,  8 May 2022 15:40:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E32610F587;
	Sun,  8 May 2022 13:40:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F39210F587
 for <dri-devel@lists.freedesktop.org>; Sun,  8 May 2022 13:40:13 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id u23so14072836lfc.1
 for <dri-devel@lists.freedesktop.org>; Sun, 08 May 2022 06:40:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=hNugHMH0gYmqiT8RdngvmmaCgPBmeqCOezfX1bTdgH8=;
 b=a1ogE+DV8vt9+H0Mi/fvKmsEtgHDkVWC6eL/ssTxk9jTpRU8qV9U1aspYnGFQdwcgI
 C+xErjn9SZz3POxD7CLBteDeYzigHg34lyctj8PGHI1w+tVJchdJnfMuqCR0fRI8xD0g
 XPjOZ4FoEMFvNYhjoXg2IBC5COwrSs9XJdpWAkhq7lDcf5oQFCvgjkc6Cc2S7sGtu+Y1
 kEywFIW4LF9eQ7UOyHiLaI0HV/ex22GTuipSC+WUFlAYwGPhhWzIyEZc4IEwotgwDZ7c
 NgIONcyoaugrNAaMmvOpeHNPr0sTcZBfZf1X+g8OHjbzv6uky8kuKgpXBdgdLFkfCnht
 yjpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=hNugHMH0gYmqiT8RdngvmmaCgPBmeqCOezfX1bTdgH8=;
 b=29i2rUknXYGv6Eadq2PYbLrg6bYQjCKpYTnabDgNCseqe8kXM7G9q4Civ80sR/D/e6
 aicnbpLJluDuNQSTyATgS2CC+lQesfjB8hhe8XulgxFI2zw2YUyThuPcRRilrFqNFEyM
 fuIrRBex7P4INcbiMmHHwN80fsrOgphdqcjFCaiWgc3pBv2AN6ytR7FCKKxmechsOKM/
 r/sMZzO6JwGpH7+LCiwJ9Ga1u0PrlWj9hOMKB79QXtxzuk0UR4v7dDWhHBmMm1xWkU2m
 NStikPBmAJzoqzP0BZK9yaoQbIUmUpaAsVx2KjthQi/jC2yadjmj8ul6cTjs7tCvOXD9
 CU5w==
X-Gm-Message-State: AOAM530Nu99JYOcdii0qS3yWjA/zMTtfPCOHL5jr30RKIXgtF8Kbjf5s
 4aRRmDQ5RccHJTnHwZSnntU=
X-Google-Smtp-Source: ABdhPJzCr7fHU4OjHw+Q2jcxaaAzu3hQtbMSZZC/N9bd3qImeaOgf1Hf2ZyLOdRp09ZiftoRQ44XVg==
X-Received: by 2002:ac2:57c7:0:b0:472:208d:926f with SMTP id
 k7-20020ac257c7000000b00472208d926fmr9029878lfo.224.1652017211328; 
 Sun, 08 May 2022 06:40:11 -0700 (PDT)
Received: from smtpclient.apple (31-178-191-245.dynamic.chello.pl.
 [31.178.191.245]) by smtp.gmail.com with ESMTPSA id
 a21-20020a2e88d5000000b00250a09889a1sm1035233ljk.16.2022.05.08.06.40.10
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 08 May 2022 06:40:10 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: [PATCH v11 20/24] arm64: dts: rockchip: enable vop2 and hdmi tx
 on rock-3a
From: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
In-Reply-To: <20220422072841.2206452-21-s.hauer@pengutronix.de>
Date: Sun, 8 May 2022 15:40:09 +0200
Content-Transfer-Encoding: quoted-printable
Message-Id: <A86359EC-5291-41BD-966E-EB7890644731@gmail.com>
References: <20220422072841.2206452-1-s.hauer@pengutronix.de>
 <20220422072841.2206452-21-s.hauer@pengutronix.de>
To: Sascha Hauer <s.hauer@pengutronix.de>,
 Michael Riesch <michael.riesch@wolfvision.net>
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
 Peter Geis <pgwipeout@gmail.com>, Sandy Huang <hjc@rock-chips.com>,
 dri-devel@lists.freedesktop.org,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 kernel@pengutronix.de, Andy Yan <andy.yan@rock-chips.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 kernel test robot <lkp@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



> Wiadomo=C5=9B=C4=87 napisana przez Sascha Hauer =
<s.hauer@pengutronix.de> w dniu 22.04.2022, o godz. 09:28:
>=20
> From: Michael Riesch <michael.riesch@wolfvision.net>
>=20
> Enable the RK356x Video Output Processor (VOP) 2 on the Radxa
> ROCK3 Model A.
>=20
> Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
> Reported-by: kernel test robot <lkp@intel.com>
> Link: =
https://lore.kernel.org/r/20220310210352.451136-4-michael.riesch@wolfvisio=
n.net
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> ---

Sascha, Michael,

I'm using v11 series on 5.18-rc5 on rk3566 tvbox with great success.
Recently i started to work on rock3-a (rk3568).
v11 gives me video, audio - but cec is not working on rock3-a.

I was told:

32k clock needed for cec and this clock is generated by the rtc which is =
embedded in the rk8xx regulator.
So you should make sure it is enabled when hdmi is powerd on, eg adding =
it to the RK3568_PD_VO powerdomain should help

I was trying to do this in dts https://pastebin.com/67wu9QrH but cec is =
still non-functional

Maybe You have some hints/pointers here?

br

btw: my dts gives me working usb2 port0/port1 and usb3 port0. but usb3 =
port1 is non-working
maybe you know what is missing?=20
 =20=
