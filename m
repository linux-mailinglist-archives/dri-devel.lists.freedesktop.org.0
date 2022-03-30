Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F64F4EBE37
	for <lists+dri-devel@lfdr.de>; Wed, 30 Mar 2022 12:01:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38DE110E19B;
	Wed, 30 Mar 2022 10:01:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED1BD10E19B
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Mar 2022 10:01:09 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id z12so21088389lfu.10
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Mar 2022 03:01:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=iM9RkPocLajd/F2Sado6Lz3mmw6/5GLuVCjJsTEPSlQ=;
 b=afhYY2uiPWmuqXrLFTTmcNLD1VwyENIeJDto8ZZ8HrjwbmF1KnQUMWdODCI5YsDCuF
 rAQxKE87ymzn5qeFdnpVL5gQomgtM+Q4I4fD75TPqSa5DIyGhuKTUpizNRt4qHIGTldm
 iHSrHF4Oo3nJqGErS8Jj2laHHZjMlBicV6CgBBmElSxL0IGa8DJ8yC7mQLsuZwhg7rcA
 ke4SgZDYW+9t47WTnqCdILIc+9M1KKYnx9xRzSOFVClw3ovK4bJR/Dh+PXBj6nxI2jGc
 GgLk/4yBSqR4oP4bp8jYZRrAsBGfeC61069mMfy4Gw3cAQaXenVKr9ZHKVGMyT43a2pJ
 CEGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=iM9RkPocLajd/F2Sado6Lz3mmw6/5GLuVCjJsTEPSlQ=;
 b=DXsnxvbEbJIZvCsU/SkYQd9qjrA5HVTyumI9rod6L0dyY8+PMyC7IjxKAm9JTKiTE7
 wKYdGJ00uqgnML0Ca+GoBBIPt7/X3Eo4Ivu5ttZ2GveGdwX5G4fsGAuH7cLhnrRql3Kc
 lUYukFXxO34Fu7C5qOiDV9ts3K+h8EY1wHlc0A0BPB5sJISMkfAMBLAXv6R1oK2QMNeW
 DucTt4Tyg+xKQ7MPe9kWNvD3YG41tsstciAr9kYGXksVna7e6H+sRlmtzIfGzUFH6AI+
 1z67tRDJ+x+gwjiVk6LYFerFU05kDtFw0fEI6ZOKpt1YcDUzrs7p2sxg3AJcOKmyfY9X
 VOyQ==
X-Gm-Message-State: AOAM5338ryM6k4o0IA4eUGPwCHnA1DPpHIYpaGAd01dQnQQrN7tHL5jv
 FWIFloEbC5nfl4qFd/Kygp4=
X-Google-Smtp-Source: ABdhPJwoaEklwy52BTnnqc/WFhBF9pjJcgLr6vuMHK0urHErA00xP51NX+6+xp0tad0639krJPjqfg==
X-Received: by 2002:a05:6512:33c3:b0:44a:8067:7ec4 with SMTP id
 d3-20020a05651233c300b0044a80677ec4mr6313648lfg.601.1648634467661; 
 Wed, 30 Mar 2022 03:01:07 -0700 (PDT)
Received: from smtpclient.apple (public-gprs541832.centertel.pl.
 [31.61.235.201]) by smtp.gmail.com with ESMTPSA id
 u12-20020a056512128c00b00446499f855dsm2285773lfs.78.2022.03.30.03.01.06
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 30 Mar 2022 03:01:07 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: [PATCH v9 00/23] drm/rockchip: RK356x VOP2 support
From: "piotro.oniszczuk@google.com" <piotr.oniszczuk@gmail.com>
In-Reply-To: <20220330094556.GZ12181@pengutronix.de>
Date: Wed, 30 Mar 2022 12:01:05 +0200
Content-Transfer-Encoding: quoted-printable
Message-Id: <D3DA14F9-C9C6-4927-B015-5B7D25689DAA@gmail.com>
References: <20220328151116.2034635-1-s.hauer@pengutronix.de>
 <FB201567-AE5A-4242-82F1-7C55D8F111EA@gmail.com>
 <20220330072822.GX12181@pengutronix.de>
 <0D8F5951-5375-46B5-BFF0-7ED410371EB7@gmail.com>
 <20220330094556.GZ12181@pengutronix.de>
To: Sascha Hauer <s.hauer@pengutronix.de>
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
 Michael Riesch <michael.riesch@wolfvision.net>, kernel@pengutronix.de,
 Andy Yan <andy.yan@rock-chips.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



> Wiadomo=C5=9B=C4=87 napisana przez Sascha Hauer =
<s.hauer@pengutronix.de> w dniu 30.03.2022, o godz. 11:45:
>=20
> On Wed, Mar 30, 2022 at 10:41:56AM +0200, piotro.oniszczuk@google.com =
wrote:
>=20
> Let me rephrase this: The above sets a plane, but it doesn't set a =
mode
> on the crtc. When my system boots up then the output of modetest looks
> like this:
>=20
> Encoders:
> id      crtc    type    possible crtcs  possible clones
> 68      0       TMDS    0x00000001      0x00000001
> Connectors:
> id      encoder status          name            size (mm)       modes  =
encoders
> 69      0       connected       HDMI-A-1        530x300         9      =
68
> CRTCs:
> id      fb      pos     size
> 67      0       (0,0)   (0x0)
>  #0  nan 0 0 0 0 0 0 0 0 0 flags: ; type:=20
>=20
> No mode is set on the CRTC and the encoder/connector/crtc are not =
bound
> to each other, consequently the screen is in standby. "modetest -P
> 43@67:1920x1080@NV12" doesn't change this, still no mode set. Hence my
> question: How did you set a mode initially?

Ah ok. I see your point.
mode is set by app (player).=20

Sequence was like this:
-boot board
-start app
-on UI select playback
-playback has green screen
-exit app
-run modetest -P 43@67:1920x1080@NV12 (the same green screen like in =
playback)
-run modetest -P 49@67:1920x1080@NV12 (works ok)
-run modetest -P 43@67:1920x1080@NV12 (now works ok)

>=20
>>>=20
>>=20
>> I'm not sure that above command only sets plane.
>> On other SoCs i=E2=80=99m testing it gives expected results: diagonal =
colored stripes.
>> There is single exception: rk356x with vop2 - where screen is green =
unless i =E2=80=9Efix/enable=E2=80=9D by playing with plane #69  =20
>>=20
>>> I did with "modetest -s 69@67:1920x1080 -d" and with this it works =
as
>>> expected, I can't reproduce any green screen issue here.
>>=20
>> I see you are using plane #69.
>> Why not #43?
>=20
> I used "modetest -s 69@67:1920x1080 -d" to set a mode. The '69' is the
> connector id, not a plane.

ack.
typo from my side.

it was
modetest -P 49@67:1920x1080@NV12


>=20
>> Is plane #43 working ok for you?
>=20
> Yes.

So it looks your testing method of #43 is not meaningful for verifying =
issue we are discussing here.

In my case:
12 SOC (except rk356x VOP2) gives me:
-boot board
-start app
-on UI select playback
-playback is ok
-exit app
-run modetest -P XX@YY:1920x1080@NV12 (diagonal stripes)

(XX/YY are plane/connector elected by app: plane@conector with format =
matching provider format)=20

rk356x with vop2 v9:
-boot board
-start app
-on UI select playback
-playback has green screen
-exit app
-run modetest -P 43@67:1920x1080@NV12 (the same green screen like in =
playback)
-run modetest -P 49@67:1920x1080@NV12 (works ok)
-run modetest -P 43@67:1920x1080@NV12 (now works ok)


