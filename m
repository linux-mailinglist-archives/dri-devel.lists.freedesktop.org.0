Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB67041C705
	for <lists+dri-devel@lfdr.de>; Wed, 29 Sep 2021 16:42:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2DE06E1BE;
	Wed, 29 Sep 2021 14:42:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de
 [81.169.146.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D48E76E1BE
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Sep 2021 14:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1632926532;
 s=strato-dkim-0002; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
 From:Subject:Sender;
 bh=Rj5wPC+azbPBOEQyEt5RY3pzQQCBfq403oUX1dL3sm4=;
 b=gPH4BJs8MqjMX2JVCsFF1BpAZiX4EfShZ1czC02Kv/8L5GkslP0h4qbXMb583yFClW
 EDzGhKfmT5N96txqBDVDWv0n/J+pSY3UB+uWQiVa8wUNimefPakFLbiavsFCpaIH1Uyf
 lRcqEQ9IoCxt7kRdfBu4ozNvlXIEjNLVpX+/0KfJ/SJFkgflYXrWyotwoLtw/Cafct9O
 XCDaqKvlZ+HUHAFkJnHvAcCpsS62bxM9Vs8776psp/yy6fSe50vd+Hl2MpKu+deVszpn
 WjrhGvDK6BFLTaavEcJTivgQvo6TMg5TOtzKzWgH0oGUdaKs5ZrBdYIaaOue/qwrSnLO
 tOeA==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj4Qpw9iZeHWElw43qmio="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box by smtp.strato.de (RZmta 47.33.8 DYNA|AUTH)
 with ESMTPSA id I01f74x8TEgAkV0
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1
 with 256 ECDH bits, eq. 3072 bits RSA))
 (Client did not present a certificate);
 Wed, 29 Sep 2021 16:42:10 +0200 (CEST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.21\))
Subject: Re: [PATCH v4 02/10] drm/ingenic: Add support for JZ4780 and HDMI
 output
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <VM970R.TLCBMNA67DOI2@crapouillou.net>
Date: Wed, 29 Sep 2021 16:42:10 +0200
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
Message-Id: <1E592756-C57C-4C9B-BCF2-EC10DB6E3234@goldelico.com>
References: <cover.1632761067.git.hns@goldelico.com>
 <68cca888be1894ce45f1a93cfabeb5aa1f88c20a.1632761067.git.hns@goldelico.com>
 <OA150R.JLKJBJP8V7FJ2@crapouillou.net>
 <1E10A04A-4A78-4B47-B0FB-1E8C99456DA1@goldelico.com>
 <17BF1D7A-2057-448B-9FD2-907DE0EFD281@goldelico.com>
 <VM970R.TLCBMNA67DOI2@crapouillou.net>
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

> Am 29.09.2021 um 16:30 schrieb Paul Cercueil <paul@crapouillou.net>:
>=20
> Hi,
>=20
> Le mar., sept. 28 2021 at 14:06:03 +0200, H. Nikolaus Schaller =
<hns@goldelico.com> a =C3=A9crit :
>> Hi Paul,
>>> Am 28.09.2021 um 12:21 schrieb H. Nikolaus Schaller =
<hns@goldelico.com>:
>>>>> @@ -1492,10 +1555,16 @@ static int ingenic_drm_init(void)
>>>>> {
>>>>> 	int err;
>>>>> +	if (IS_ENABLED(CONFIG_DRM_INGENIC_DW_HDMI)) {
>>>>> +		err =3D =
platform_driver_register(ingenic_dw_hdmi_driver_ptr);
>>>>> +		if (err)
>>>>> +			return err;
>>>>> +	}
>>>> I don't see why you need to register the ingenic-dw-hdmi driver =
here. Just register it in the ingenic-dw-hdmi driver.
>>> Ok, I never though about this (as the code was not from me). We =
apparently just followed the IPU code pattern (learning by example).
>>> It indeed looks not necessary and would also avoid the =
ingenic_dw_hdmi_driver_ptr dependency.
>>> But: what is ingenic_ipu_driver_ptr then good for?
>=20
> It's done this way because ingenic-drm-drv.c and ingenic-ipu.c are =
both compiled within the same module ingenic-drm.

Ah, I see. Hadn't checked this.

> I'm not sure this is still required, maybe ingenic-ipu.c can be its =
own module now.

What I have seen is that it has its own compatible record. So there =
could be load-on-demand by DTS.

>=20
>>> If we can get rid of this as well, we can drop patch 1/10 =
("drm/ingenic: Fix drm_init error path if IPU was registered") =
completely.
>> A quick test shows that it *is* required. At least if I configure =
everything as modules.
>> But like you I can't explain why.
>=20
> Well, a quick test here shows that it is not required, at least when =
configuring with everything built-in.

IMHO the hdmi driver (module) should be loaded on demand. Not everyone =
wants to have it.

Well, that is the problem that needs to be solved...

BR and thanks,
Nikolaus

