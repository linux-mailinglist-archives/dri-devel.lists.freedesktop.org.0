Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB1C949E54A
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jan 2022 15:57:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E558C10EED6;
	Thu, 27 Jan 2022 14:57:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DCCA10E6F5
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jan 2022 14:43:31 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id u14so5744172lfo.11
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jan 2022 06:43:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=Ems2AVRzgkln4g25JzOfFWh1TwoPY/Y8voDAbyyDVf0=;
 b=BAn2jTpFDnjHLFDhEgg0n9RbAV0aMMiQeP5idKwIoCPsIx0n3ulV0vAeEtTHXLcv6l
 w6gxOasGY7zf+ty0A+O5cUKuwhv2mBT2tS7Y1qp8Qxd89OMEY3hjKvRujj7LYsC1Rbx1
 zl6sT4qgfSMr8Xwn1aDyuMH6yfPUu39X2ZlGCTkqa5CHkWVF5GYqQZipcJPNgPZZEF0a
 arnr4kUhXqCz3QN3qXkxLzEXNz6oNEigJ29/Vmbw4vs12yPzLN9hBHvNHjMG9gkbEEJc
 9HpI66Fsp2Lq9QgS3dJ/XXcJBom5OLSk/FAyQtHpM/zIQ9lU1wM6OfwjwJ08WQf1qwF/
 WNcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=Ems2AVRzgkln4g25JzOfFWh1TwoPY/Y8voDAbyyDVf0=;
 b=MJX0gUmyUplzP5cbyu3C7X6sXHRXW0bBHk7QX6U1oGB5lDqN4sLiOimCYFWCvb0ZsL
 zKZ56+IFNMJd7EiIM7eK1V8+Lmgm5iIRZQD191mV5l3RQ/ITVdM+Gf/jTrxfTLQRk+Rj
 7M1Y1SiW3SZvd31dMkXGHcxMAqTImA0FtvNKjTHx+4Nrx+52Ql5LA6LJoKK43hZ7gy07
 Ru28Oss0JAXxITw2IBwfKmvcSZaQHKawJfQhh2HOPkpFlUv/hoKX75ljgCdbuv54oSfZ
 VayLXbecLdgtLu/0aNva4v4JITDo5oluIpJK71BEBtd687kEv9EEUjsZPg4YyszGeSpG
 ksCQ==
X-Gm-Message-State: AOAM533Z+aQQ/N3KtIRDu/0DyLjGSDXorWW7EVP+SGKUravkeebC434u
 5kQduZCgVv5+gmPpuDzIGyw=
X-Google-Smtp-Source: ABdhPJxNXOMj0HG4eaEtEWBOBz5dKP+jjqXxckuqFNSi9mi+FleyYUby2GFywJABEdDjRvYBB5LiMQ==
X-Received: by 2002:a05:6512:ea1:: with SMTP id
 bi33mr3027601lfb.571.1643294609150; 
 Thu, 27 Jan 2022 06:43:29 -0800 (PST)
Received: from smtpclient.apple (31-178-191-245.dynamic.chello.pl.
 [31.178.191.245])
 by smtp.gmail.com with ESMTPSA id z9sm2196073lft.160.2022.01.27.06.43.27
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 27 Jan 2022 06:43:28 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: [PATCH 27/27] drm: rockchip: Add VOP2 driver
From: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
In-Reply-To: <20220127110009.GK23490@pengutronix.de>
Date: Thu, 27 Jan 2022 15:43:24 +0100
Content-Transfer-Encoding: quoted-printable
Message-Id: <6E75EF52-3ED6-4E53-9DE3-DBEAA7BFD005@gmail.com>
References: <20220126145549.617165-1-s.hauer@pengutronix.de>
 <20220126145549.617165-28-s.hauer@pengutronix.de>
 <6588D77C-D3CB-4FB0-8B00-5EDD6ABD6923@gmail.com>
 <20220127110009.GK23490@pengutronix.de>
To: Sascha Hauer <s.hauer@pengutronix.de>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-Mailman-Approved-At: Thu, 27 Jan 2022 14:57:22 +0000
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
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 Michael Riesch <michael.riesch@wolfvision.net>, kernel@pengutronix.de,
 Andy Yan <andy.yan@rock-chips.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



> Wiadomo=C5=9B=C4=87 napisana przez Sascha Hauer =
<s.hauer@pengutronix.de> w dniu 27.01.2022, o godz. 12:00:
>=20
>>=20
>> -on rk3399 it gives me 4k screen where right vertical 1/3 part of =
screen is garbage
>> -on rk3566 my samsung 4k monitor has black screen and cycle of OSD =
msgs: HDMI2 connected; HDMI2 disconnected; ....
>=20
> Same here on my rk3568, also with a samsung monitor. Was it 4k@60Hz or
> 4k@30Hz? If the former, could you give 4k@30Hz a try? That mode works
> well here.

It was 4k@30
Indeed - firmware of my samsung is total crap in UI aspects - so maybe =
in hdmi modes are as well :-p
Anyway - this crap monitor works ok with 4k@30 on =
AW/RPI4/rk3399/n3450/MacBookPro

>>=20
>> BTW: getting well working 4k HDMI modes on rk3399 was real story for =
me.
>> There is many different series of patches to address this - but all =
have some subtle issues for me (i.e. 4k HDMI modes works but i.e. Qt is =
failing with DRM atomic commits in EGLFS)
>> I developed well working [1] giving me reliable 4k on rk3399 =
(including working Qt DRM drawing in EGLFS mode)=20
>> Maybe it will be somehow helpful to get 4k modes solution for rk3566 =
_and_ rk3399 (on single kernel binary)?
>>=20
>> [1] =
https://github.com/warpme/minimyth2/blob/master/script/kernel/linux-5.16/f=
iles/0730-drm-rockchip-add-4k-videomodes-support.patch
>=20
> At least there are patches in it that I have in my series as well and
> keep popping up everywhere like "drm/rockchip: dw_hdmi: Use
> auto-generated tables" and "drm/rockchip: dw_hdmi: Set cur_ctr to 0
> always"
>=20

What was time-consuming for me was finding working patches combination =
which not breaks Qt DRM Atomic commits.
Many series floating arround various git repos/projects were offering 4k =
modes but breaking Qt in the same time....

btw: have you plans to look/address non-working DRM planes in VOP2?
Rendering to DRM plane gives me green screen on rk3566.
The same code (and binaries) are working ok on rk3399 (and other SoCs).
=20
=20=
