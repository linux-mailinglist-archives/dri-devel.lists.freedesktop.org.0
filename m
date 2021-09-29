Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9491341C582
	for <lists+dri-devel@lfdr.de>; Wed, 29 Sep 2021 15:25:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D63106EA5D;
	Wed, 29 Sep 2021 13:25:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de
 [85.215.255.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28DB96EA5D
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Sep 2021 13:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1632921905;
 s=strato-dkim-0002; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
 From:Subject:Sender;
 bh=iXnkGBjUJ/lD8Seg+3/qoiXxZlA8cp27UXC2S8pwhhE=;
 b=LKr/APoVDaPodsHvLUwFwZdabISWBDYx7ojmMJKUlP3z+sgzhD748oTXc2WmfcIoiZ
 1szZPCEho16UYScbl2z+dDlVLQwqXiro/m9UeJtTKzO6e5vuakfdM2oPGCf1rh36vCwk
 AoaYxSczLNmY5pj7K/B+m3lu2zaPLzL2ffYVRMAgE+LyvIDthiTtzCLvSD4hpIQJS7cp
 npEX43lPiBRxLMr2D5WE80Tz2lsDwbaIplqLcFXRMG7wprx0EJmg5X4zaC72omlf/sRX
 HQQSBtm844e+cumiuLExMB7MAD07ZvNcdTKDg6CXAjjMGAsXDPXwyX9iJ+TQfNV9AdXG
 BheQ==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj4Qpw9iZeHWElw43qmio="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box by smtp.strato.de (RZmta 47.33.8 DYNA|AUTH)
 with ESMTPSA id I01f74x8TDP3k6X
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1
 with 256 ECDH bits, eq. 3072 bits RSA))
 (Client did not present a certificate);
 Wed, 29 Sep 2021 15:25:03 +0200 (CEST)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.21\))
Subject: Re: [PATCH v4 02/10] drm/ingenic: Add support for JZ4780 and HDMI
 output
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <17BF1D7A-2057-448B-9FD2-907DE0EFD281@goldelico.com>
Date: Wed, 29 Sep 2021 15:25:02 +0200
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Kees Cook <keescook@chromium.org>,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Ezequiel Garcia <ezequiel@collabora.com>,
 Harry Wentland <harry.wentland@amd.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maxime Ripard <maxime@cerno.tech>, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Paul Boddie <paul@boddie.org.uk>, devicetree@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
 letux-kernel@openphoenux.org, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <3D436929-570A-43FA-A388-27A183ECF703@goldelico.com>
References: <cover.1632761067.git.hns@goldelico.com>
 <68cca888be1894ce45f1a93cfabeb5aa1f88c20a.1632761067.git.hns@goldelico.com>
 <OA150R.JLKJBJP8V7FJ2@crapouillou.net>
 <1E10A04A-4A78-4B47-B0FB-1E8C99456DA1@goldelico.com>
 <17BF1D7A-2057-448B-9FD2-907DE0EFD281@goldelico.com>
To: Paul Cercueil <paul@crapouillou.net>
X-Mailer: Apple Mail (2.3445.104.21)
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Paul,


> Am 28.09.2021 um 14:06 schrieb H. Nikolaus Schaller =
<hns@goldelico.com>:
>=20
> Hi Paul,
>=20
>> Am 28.09.2021 um 12:21 schrieb H. Nikolaus Schaller =
<hns@goldelico.com>:
>>=20
>>>> @@ -1492,10 +1555,16 @@ static int ingenic_drm_init(void)
>>>> {
>>>> 	int err;
>>>> +	if (IS_ENABLED(CONFIG_DRM_INGENIC_DW_HDMI)) {
>>>> +		err =3D =
platform_driver_register(ingenic_dw_hdmi_driver_ptr);
>>>> +		if (err)
>>>> +			return err;
>>>> +	}
>>>=20
>>> I don't see why you need to register the ingenic-dw-hdmi driver =
here. Just register it in the ingenic-dw-hdmi driver.
>>=20
>> Ok, I never though about this (as the code was not from me). We =
apparently just followed the IPU code pattern (learning by example).
>>=20
>> It indeed looks not necessary and would also avoid the =
ingenic_dw_hdmi_driver_ptr dependency.
>>=20
>> But: what is ingenic_ipu_driver_ptr then good for?
>>=20
>> If we can get rid of this as well, we can drop patch 1/10 =
("drm/ingenic: Fix drm_init error path if IPU was registered") =
completely.
>=20
> A quick test shows that it *is* required. At least if I configure =
everything as modules.
> But like you I can't explain why.
>=20
> Well, just a very rough idea (may be wrong): the bridge chain is not =
like an i2c bus and
> clients are not automatically loaded/probed if linked in the device =
tree. Therefore the
> consumer (ingenic_drm_drv) must register the "clients" like IPU and =
HDMI.

Any suggestion how to proceed here for v5?

BR,
Nikolaus

