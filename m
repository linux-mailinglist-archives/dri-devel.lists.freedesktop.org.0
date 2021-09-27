Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2151E419DA2
	for <lists+dri-devel@lfdr.de>; Mon, 27 Sep 2021 19:54:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA3F389E36;
	Mon, 27 Sep 2021 17:54:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de
 [81.169.146.168])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32C9E89EA3
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Sep 2021 17:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1632765272;
 s=strato-dkim-0002; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
 From:Subject:Sender;
 bh=CWSJn3eYMqcgFfJquy93uoB2YaNgTvLjpKlOuWenFyg=;
 b=latlCJ/fbP0toHtO8C5YBgSx25zVBlnhc7FmKkoYyDTeAQKVe3jqH5jRXI4vdZJmto
 uBHQF5F+L4Qz+Owh2vdzPvpKmcGm83zZb5miNQyU0v2uqE4IkNAKES2iFDAGO9fR0Ip2
 //CRsx6eUnv0EwdmTsGvxipxKijjwacGJjCdxHT5xTgCaY/b7BQ2oOkGvySB9OkPC1pl
 R4LcEkPNvoXasLoAUwjVxNA0DUJf3sNOVPJKdeXPZ2hCDEa9fmbR8PZQhYWfL3aRBKQ9
 DnhgHhYFqiRCJbY2EhT/jMZqPDjS7LlyvBwYtNWWDIFj5vvcV0di4PR53G2EjmKAMhy4
 TUJg==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj7gpw91N5y2S3i8QW3w=="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box by smtp.strato.de (RZmta 47.33.8 DYNA|AUTH)
 with ESMTPSA id I01f74x8RHsWb3k
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1
 with 256 ECDH bits, eq. 3072 bits RSA))
 (Client did not present a certificate);
 Mon, 27 Sep 2021 19:54:32 +0200 (CEST)
Content-Type: multipart/alternative;
 boundary="Apple-Mail=_0EB372CA-63EF-44CF-8B8F-2821A13674B1"
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.21\))
Subject: Re: [PATCH v4 06/10] drm/ingenic: Add dw-hdmi driver for jz4780
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20210927170846.srsfzbq7lsli4vwj@gilmour>
Date: Mon, 27 Sep 2021 19:54:31 +0200
Cc: Paul Cercueil <paul@crapouillou.net>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
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
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Paul Boddie <paul@boddie.org.uk>, devicetree@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
 letux-kernel@openphoenux.org, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel@lists.freedesktop.org
Message-Id: <84EFAEAC-A109-4DAE-85F5-659BD5EA6587@goldelico.com>
References: <cover.1632761067.git.hns@goldelico.com>
 <cecd7ae2e21f6547f23c125b2f7767b0090277bc.1632761068.git.hns@goldelico.com>
 <20210927170846.srsfzbq7lsli4vwj@gilmour>
To: Maxime Ripard <maxime@cerno.tech>
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


--Apple-Mail=_0EB372CA-63EF-44CF-8B8F-2821A13674B1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii



> Am 27.09.2021 um 19:08 schrieb Maxime Ripard <maxime@cerno.tech>:
>=20
> On Mon, Sep 27, 2021 at 06:44:24PM +0200, H. Nikolaus Schaller wrote:
>> From: Paul Boddie <paul@boddie.org.uk>
>>=20
>> A specialisation of the generic Synopsys HDMI driver is employed for =
JZ4780
>> HDMI support. This requires a new driver, plus device tree and =
configuration
>> modifications.
>>=20
>> +	regulator =3D devm_regulator_get_optional(&pdev->dev, =
"hdmi-5v");
>> +
>> +	if (IS_ERR(regulator)) {
>> +		ret =3D PTR_ERR(regulator);
>> +
>> +		DRM_DEV_ERROR(&pdev->dev, "failed to get hpd regulator: =
%s (%d)\n",
>> +			      "hdmi-5v", ret);
>> +		return ret;
>> +	}
>=20
> This doesn't match your binding

or the binding not what we wanted to have...

BR and thanks,
Nikolaus=

--Apple-Mail=_0EB372CA-63EF-44CF-8B8F-2821A13674B1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dus-ascii"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D""><br =
class=3D""><div><br class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D"">Am 27.09.2021 um 19:08 schrieb Maxime Ripard &lt;<a =
href=3D"mailto:maxime@cerno.tech" =
class=3D"">maxime@cerno.tech</a>&gt;:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Menlo-Regular; =
font-size: 11px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" class=3D"">On Mon, Sep =
27, 2021 at 06:44:24PM +0200, H. Nikolaus Schaller wrote:</span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Menlo-Regular; =
font-size: 11px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><blockquote type=3D"cite" style=3D"font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; orphans: auto; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D"">From: =
Paul Boddie &lt;<a href=3D"mailto:paul@boddie.org.uk" =
class=3D"">paul@boddie.org.uk</a>&gt;<br class=3D""><br class=3D"">A =
specialisation of the generic Synopsys HDMI driver is employed for =
JZ4780<br class=3D"">HDMI support. This requires a new driver, plus =
device tree and configuration<br class=3D"">modifications.<br =
class=3D""><br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>regulator =3D =
devm_regulator_get_optional(&amp;pdev-&gt;dev, "hdmi-5v");<br =
class=3D"">+<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>if (IS_ERR(regulator)) {<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>ret =3D PTR_ERR(regulator);<br class=3D"">+<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>DRM_DEV_ERROR(&amp;pdev-&gt;dev, "failed to get hpd regulator: %s =
(%d)\n",<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;"hdmi-5v", ret);<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>return ret;<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>}<br =
class=3D""></blockquote><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Menlo-Regular; font-size: 11px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Menlo-Regular; font-size: 11px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">This doesn't match your binding</span><br style=3D"caret-color:=
 rgb(0, 0, 0); font-family: Menlo-Regular; font-size: 11px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""></div></blockquote><div><br =
class=3D""></div>or the binding not what we wanted to =
have...</div><div><br class=3D""></div><div>BR and =
thanks,</div><div>Nikolaus</div></body></html>=

--Apple-Mail=_0EB372CA-63EF-44CF-8B8F-2821A13674B1--
