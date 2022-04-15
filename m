Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C03EA5028BA
	for <lists+dri-devel@lfdr.de>; Fri, 15 Apr 2022 13:11:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06A3110E5FF;
	Fri, 15 Apr 2022 11:11:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0927010E5FF
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Apr 2022 11:11:37 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id bu29so13633689lfb.0
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Apr 2022 04:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=8rKWtpqqPYYEzbZqAeN0/yV6I0K22SlsHKssE8lnJN8=;
 b=pDHtljXSqA2HodN7HlG9y1B6GuMhsGZLlJlcQxYhLqTRpqtwwwIiwZkqkDt+BtbyUa
 6eRkeCSVa3ae11sqFhXiYTh+8Xzc2OzqBoCgVrGPCqzk5rfM0bD6B0B0NMucrOBNfeTm
 C0nSat3ITXMgyD+l2uohx8g0p5x5aiawkiwckJPuWEPp2xj+lkaIUpmHpRKrOOjYGucH
 udN3Dr5Uj5713A6k95503LUwavhxTkAg/sinqN+adya0s3DcIe2IYE1wxcIb2drIsPax
 299KRPW0MDSW+XDgsYOsQCOeEKdVI0zeB+ksQNJdhbb482AruEYHDm4Xf9Z/rV3b9KF7
 4x0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=8rKWtpqqPYYEzbZqAeN0/yV6I0K22SlsHKssE8lnJN8=;
 b=KDGZyihXPRkhV91V+SY5fFDxxdEmTlScqQcSwDXWlNmX/Z5MftCODQc3HXiMkJC6gm
 0rjVT/9O/hOe6WgeqxZQRuXbPTW93nHHTERG+oVGmDPEy3Xh80zg325OovHLvLVSUSYo
 heiYkvmgjzKre3Pe7EM1O/45d4TXnDPcK/Ex+zqCU0MtQyc4WdgdEMAj7kIG0C5bSvLJ
 nAs8CSKXDzKP9I8eagon8Ur/Y2a57BOVAymX2mtkQvAX+7LdGwzL2TC2GrvO0iY5YABZ
 tBXx54kkRNa7o3Tqpn1P/3eSfD0P1Gb0UIcLkIhdXrBofYRjV89XgeC5H+Hz8CvQ88Qp
 JrIw==
X-Gm-Message-State: AOAM533opk06KrrNBmv8TJ2yjWSAIlmDm6MKk6gktj4L6da8VsQGvNZR
 yXGMZtjzQBzDUMilIFIOFEw=
X-Google-Smtp-Source: ABdhPJxbKlylx4tyVwT8241mw9KFsamD4RsvG/OQBJ3XGgGjiFSEPufVIE5jgl5DuiHaSAE+Zmp23w==
X-Received: by 2002:a05:6512:1188:b0:44a:3457:3a0b with SMTP id
 g8-20020a056512118800b0044a34573a0bmr4827072lfr.427.1650021095018; 
 Fri, 15 Apr 2022 04:11:35 -0700 (PDT)
Received: from smtpclient.apple (31-178-191-245.dynamic.chello.pl.
 [31.178.191.245]) by smtp.gmail.com with ESMTPSA id
 25-20020ac24d59000000b0046d06f31bc2sm293850lfp.282.2022.04.15.04.11.33
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 15 Apr 2022 04:11:34 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: [PATCH v9 00/23] drm/rockchip: RK356x VOP2 support
From: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
In-Reply-To: <CAPj87rNatQ9KjDSnYQTh4+FOUcPTerbzH3m8AuAF_BPbM1xxGg@mail.gmail.com>
Date: Fri, 15 Apr 2022 13:11:32 +0200
Content-Transfer-Encoding: quoted-printable
Message-Id: <EE789168-EEFD-4231-96D5-9E62AED6D08C@gmail.com>
References: <20220328151116.2034635-1-s.hauer@pengutronix.de>
 <FB201567-AE5A-4242-82F1-7C55D8F111EA@gmail.com>
 <20220401125205.GL4012@pengutronix.de>
 <5420D26D-34FD-4637-B602-F6271E38BB8D@gmail.com>
 <BA4C591F-D115-43D2-BF59-A75B29889E50@gmail.com>
 <20220408080748.GA2387@pengutronix.de> <20220408120021.GO4012@pengutronix.de>
 <B3E76A7A-9B62-4E6F-9472-00B6298689C5@gmail.com>
 <20220411090800.GR4012@pengutronix.de>
 <5929E7A7-776E-4BCB-92C8-A1CE05774FE3@gmail.com>
 <20220412075034.GS4012@pengutronix.de>
 <e2ef484b60fe9c5fc077240a26bd18275974dc4a.camel@pengutronix.de>
 <EF0F8E87-2618-4E5E-807D-259FEEC0FB24@gmail.com>
 <CAPj87rNatQ9KjDSnYQTh4+FOUcPTerbzH3m8AuAF_BPbM1xxGg@mail.gmail.com>
To: Daniel Stone <daniel@fooishbar.org>
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
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, kernel@pengutronix.de,
 Sascha Hauer <s.hauer@pengutronix.de>, Sandy Huang <hjc@rock-chips.com>,
 dri-devel@lists.freedesktop.org,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Lucas Stach <lst@pengutronix.de>,
 Michael Riesch <michael.riesch@wolfvision.net>,
 Peter Geis <pgwipeout@gmail.com>, Andy Yan <andy.yan@rock-chips.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



> Wiadomo=C5=9B=C4=87 napisana przez Daniel Stone <daniel@fooishbar.org> =
w dniu 12.04.2022, o godz. 13:30:
>=20
>> Testing Sacha patch (see today's email from Sascha) i'm getting
>>=20
>> Qt: EGL Error : Could not create the egl surface: error =3D 0x3009
>>=20
>> i'm reading this as: Qt tries allocate EGL surface and EGL returns =
error.
>> or i'm wrong?
>=20
> Correct, that's EGL_BAD_MATCH. There are very few ways that can
> happen; by far the most likely is that Qt has chosen an EGLConfig
> which does not correctly correspond to the format. (If it was an
> impossible format/modifier combination, then this would be already
> caught when allocating the gbm_surface.)
>=20
> Either way, it seems quite clear that the VOP2 driver is totally fine
> here, and that you have a Qt (likely) or Mesa (tbh less likely) issue
> to debug to get the app working.
>=20
> Cheers,
> Daniel

Thx Daniel!

Indeed - this is probably another case where I see: writing DRM planes =
rendering mediaplayer with help of Qt is (too)corner case for Qt....


@all

Looking on Qt sources it looks to me this format should be supported:

=
https://code.qt.io/cgit/qt/qtbase.git/tree/src/platformsupport/kmsconvenie=
nce/qkmsdevice.cpp?h=3D5.15.2#n380

Interesting that with custom Qt config1: "format": "argb8888",
DRI state shows: format=3DAR24 little-endian (0x34325241)

UI is OK, playback is OK. OSD not visible (*)

custom config2: "format": "abgr8888"=20
Qt crashes with EGL_BAD_MATCH

So it looks forcing some Qt formats works while other - not.=20

Looking why this:

Qt logging says nothing.
export MESA_DEBUG=3D1 gives no any message. I'm a lost here a bit...



But from a bit more distant perspective:

1. Sascha concludes in (*) that issue is most probably in format =
negotiation by app.

2. imho app probably correctly negotiates accordingly to inputs it gets =
from providers (DRM) and clients (mesa).=20
Test with patch excluding
DRM_FORMAT_XRGB8888,
DRM_FORMAT_ARGB8888,
shows imho proper app reaction on this (new format elected; but Qt fails =
with this format). Indirectly i conclude app logic is ok....

3. Sum of p1 & p2 tells me:
i need to add extra logic in format election to specifically deal with =
constrains of rk356x (see explanation in (*))
   =20
4. Even if i implement p3 - then user world - (this using Qt) - will be =
not happy as:
- majority users are using pre-build Qt
- I don't believe Trolltech will fix this soon

So i see following path:
 =20
we will verify is issue of Qt with abgr8888 an Qt root cause issue,

If Yes - then:
	- Investigate is there reasonable way to workaround with this =
outside of Qt?
If not - then:
	- conclude: vop2 - due Qt bug - will not work ok with Qt until =
Qt will be fixed.

=20
If you think this make sense - i need some help with: verify is issue of =
Qt with abgr8888 an Qt root cause issue

let me know what you think



(*)
Sascha mentioned:
> Somehow negotiation of the format goes wrong. Applications shouldn't
> pick these formats when the GPU is used for rendering. I don't know =
how
> and where this should be fixed properly, but your application should =
use
> DRM_FORMAT_ABGR8888 aka AB24 aka PIPE_FORMAT_R8G8B8A8_UNORM instead of
> DRM_FORMAT_ARGB8888 aka AR24 aka PIPE_FORMAT_B8G8R8A8_UNORM.


