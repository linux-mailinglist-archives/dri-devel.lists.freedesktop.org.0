Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C47BB45CA0D
	for <lists+dri-devel@lfdr.de>; Wed, 24 Nov 2021 17:30:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 081676EA38;
	Wed, 24 Nov 2021 16:30:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo4-p03-ob.smtp.rzone.de (mo4-p03-ob.smtp.rzone.de
 [85.215.255.101])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D42CB6EA2F
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Nov 2021 16:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1637771406;
 s=strato-dkim-0002; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
 From:Subject:Sender;
 bh=x/yheI97VKaHNQMVbMflabvGwLK6kwR6cdJb58J0b+M=;
 b=X5qgWtSV2Jv39KDkxgjm++dWI+CIo/cr+nLfLTFbLP74KBTp5lE6t/INRuv8CvNwoL
 HUpmqcyOPyH/UfMRrphBjTwYQsdoK5Ak0haFOIMqh2LfQyUO1J92va/zuFUgEdMIOtRz
 ZpRr/rUuR98OZX/DV/eHdahBtzI8R/dlmpulgwIxTf2umATJrYIWpbMVBZ2sOw4dcKAC
 TwbduGyrpLQ01vofifqm6/7Igbopmp+GorjDiBEptOCEGi5204TIk3nijGKYfEkfZb+l
 cnya5LbSRhx91IEfwEHyBoirO+oKW1V7UzRKBGRgokeNXbjOg6xSx6+wgyJXF1LNEiID
 fy3A==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj7gpw91N5y2S3jsN+"
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box by smtp.strato.de (RZmta 47.34.10 DYNA|AUTH)
 with ESMTPSA id e05ed8xAOGU53om
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1
 with 256 ECDH bits, eq. 3072 bits RSA))
 (Client did not present a certificate);
 Wed, 24 Nov 2021 17:30:05 +0100 (CET)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.21\))
Subject: Re: [PATCH v8 6/8] MIPS: DTS: CI20: Add DT nodes for HDMI setup
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <CAMuHMdWO3yosf5eyTPpydVuT3pwvuw9Q=2BUxq+rxPjE3iSnrw@mail.gmail.com>
Date: Wed, 24 Nov 2021 17:30:05 +0100
Content-Transfer-Encoding: quoted-printable
Message-Id: <B622D2B5-D631-43F3-9D50-2B41681C78AB@goldelico.com>
References: <cover.1637691240.git.hns@goldelico.com>
 <d62023e0872e9b393db736f4a0ecf04b3fc1c91b.1637691240.git.hns@goldelico.com>
 <O0K13R.TIL3JBQ5L8TO1@crapouillou.net>
 <04F0ED7C-3D18-4CCF-8F10-E0A36B0E4F4B@goldelico.com>
 <CAMuHMdWO3yosf5eyTPpydVuT3pwvuw9Q=2BUxq+rxPjE3iSnrw@mail.gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Paul Boddie <paul@boddie.org.uk>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Paul Cercueil <paul@crapouillou.net>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Sam Ravnborg <sam@ravnborg.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Kees Cook <keescook@chromium.org>,
 Jonas Karlman <jonas@kwiboo.se>, Mark Brown <broonie@kernel.org>,
 Maxime Ripard <maxime@cerno.tech>, letux-kernel@openphoenux.org,
 Ezequiel Garcia <ezequiel@collabora.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Liam Girdwood <lgirdwood@gmail.com>, Robert Foss <robert.foss@linaro.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, "Eric W. Biederman" <ebiederm@xmission.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Geert,

> Am 24.11.2021 um 17:21 schrieb Geert Uytterhoeven =
<geert@linux-m68k.org>:
>=20
> Hi Nikolaus,
>=20
> On Wed, Nov 24, 2021 at 5:19 PM H. Nikolaus Schaller =
<hns@goldelico.com> wrote:
>>> Am 23.11.2021 um 21:10 schrieb Paul Cercueil <paul@crapouillou.net>:
>>> Le mar., nov. 23 2021 at 19:13:59 +0100, H. Nikolaus Schaller =
<hns@goldelico.com> a =C3=A9crit :
>>>> +    assigned-clock-rates =3D <48000000>, <0>, <54000000>, <0>, =
<27000000>;
>>>> };
>>>> &tcu {
>>>> @@ -509,6 +534,19 @@ pins_i2c4: i2c4 {
>>>>             bias-disable;
>>>>     };
>>>> +    pins_hdmi_ddc: hdmi_ddc {
>>>> +            function =3D "hdmi-ddc";
>>>> +            groups =3D "hdmi-ddc";
>>>> +            bias-disable;
>>>> +    };
>>>> +
>>>> +    /* switch to PF25 as gpio driving DDC_SDA low */
>>>> +    pins_hdmi_ddc_unwedge: hdmi_ddc {
>>>> +            function =3D "hdmi-ddc";
>>>> +            groups =3D "hdmi-ddc";
>>>> +            bias-disable;
>>>> +    };
>>>=20
>>> Your pins_hdmi_ddc and pins_hdmi_ddc_unwedge are the exact same? You =
could just use the former and pass it to both pinctrl-0 and pinctrl-1.
>>=20
>> This was forgotten to remove. We do not make use of the unwedge =
feature because I could not find out how to use pinctrl to switch this =
to gpio25 and drive it low.
>=20
> Using gpio-hog?

well, AFAIR it activates the gpio permanently and is a propery of the =
gpio controller and not of pinmux.
The driver assumes it can use pinmux state switching to drive the =
DDC_SDA line low on demand.

Since it is unlikely that we need it at all (and we have no test case =
that it works) I think we simply can leave
this driver feature unused unless we get a test case.

BR and thanks,
Nikolaus

