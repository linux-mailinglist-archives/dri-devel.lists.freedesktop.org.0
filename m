Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73723182AB4
	for <lists+dri-devel@lfdr.de>; Thu, 12 Mar 2020 09:09:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DA1E6EA80;
	Thu, 12 Mar 2020 08:08:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo6-p02-ob.smtp.rzone.de (mo6-p02-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5302::10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 760E56E455
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Mar 2020 12:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1583930643;
 s=strato-dkim-0002; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=szVCPXkRhUgrnj2vMcg5P15yraJcGhHnjrwU78GZvNI=;
 b=ACp7nSHSYPBYKh/bzJGXsY7pfwdmgMX9JqvRzr8DGgBPWfrMOVLC86WmHp1TJctZ9h
 614dpaJmpPRCdjhwvBnSV9MXuZ+PImtY5q+18JzOUA/WRDTaSWi0HeBHs7XQUPkn3czq
 iqUsPsPeJKzrMTpw8zBKs33p3UapA+nYRTwUIXmqFbP3SA5mfpuQR1mR3USRnPPD8/zr
 AguPL8q6w8sBeVYZ00xYBviYffct2CiwZ70jV4sulCm1bWj6QEKAYtWP3M3DGgACSZO0
 PErpoaQU5DYI3Zve0rF6/RKIMuFYFm0Gi2iizPaIKmjPw9401fHGM90F5CqHwaRIYAls
 Pq1w==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj4Qpw9iZeHmMnw43lIA8="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box by smtp.strato.de (RZmta 46.2.0 DYNA|AUTH)
 with ESMTPSA id y0a02cw2BChlyCN
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256
 ECDH bits, eq. 3072 bits RSA))
 (Client did not present a certificate);
 Wed, 11 Mar 2020 13:43:47 +0100 (CET)
Subject: Re: [RFC v2 6/8] MIPS: DTS: jz4780: account for Synopsys HDMI driver
 and LCD controller
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <1583177253.3.5@crapouillou.net>
Date: Wed, 11 Mar 2020 13:43:46 +0100
Message-Id: <F29E9DCC-29BC-4B88-9288-3E53BF8423C6@goldelico.com>
References: <cover.1582913973.git.hns@goldelico.com>
 <04b485165f38744816a0446e95150cafdeb716ee.1582913973.git.hns@goldelico.com>
 <1583177253.3.5@crapouillou.net>
To: Paul Cercueil <paul@crapouillou.net>
X-Mailer: Apple Mail (2.3124)
X-Mailman-Approved-At: Thu, 12 Mar 2020 08:08:13 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Paul Boddie <paul@boddie.org.uk>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Paul Burton <paulburton@kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 David Airlie <airlied@linux.ie>,
 MIPS Creator CI20 Development <mips-creator-ci20-dev@googlegroups.com>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Ralf Baechle <ralf@linux-mips.org>, linux-mips@vger.kernel.org,
 Andi Kleen <ak@linux.intel.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Discussions about the Letux Kernel <letux-kernel@openphoenux.org>,
 "Eric W. Biederman" <ebiederm@xmission.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Paul,

> Am 02.03.2020 um 20:27 schrieb Paul Cercueil <paul@crapouillou.net>:
> =

> Hi Nikolaus,
> =

> =

> Le ven., f=E9vr. 28, 2020 at 19:19, H. Nikolaus Schaller <hns@goldelico.c=
om> a =E9crit :
>> From: Paul Boddie <paul@boddie.org.uk>
>> A specialisation of the generic Synopsys HDMI driver is employed for JZ4=
780
>> HDMI support. This requires a new driver, plus device tree and configura=
tion
>> modifications.
>> Signed-off-by: Paul Boddie <paul@boddie.org.uk>
>> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
>> ---
>> arch/mips/boot/dts/ingenic/jz4780.dtsi | 32 ++++++++++++++++++++++++++
>> 1 file changed, 32 insertions(+)
>> diff --git a/arch/mips/boot/dts/ingenic/jz4780.dtsi b/arch/mips/boot/dts=
/ingenic/jz4780.dtsi
>> index f928329b034b..391d4e1efd35 100644
>> --- a/arch/mips/boot/dts/ingenic/jz4780.dtsi
>> +++ b/arch/mips/boot/dts/ingenic/jz4780.dtsi
>> @@ -433,4 +433,36 @@
>> 		status =3D "disabled";
>> 	};
>> +
>> +	hdmi: hdmi@10180000 {
>> +		compatible =3D "ingenic,jz4780-dw-hdmi";
>> +		reg =3D <0x10180000 0x8000>;
>> +		reg-io-width =3D <4>;
>> +
>> +		clocks =3D <&cgu JZ4780_CLK_HDMI>, <&cgu JZ4780_CLK_AHB0>;
>> +		clock-names =3D "isfr" , "iahb";
>> +
>> +		assigned-clocks =3D <&cgu JZ4780_CLK_HDMI>;
>> +		assigned-clock-rates =3D <27000000>;
> =

> I *think* this should go to the board file.
> =

>> +
>> +		interrupt-parent =3D <&intc>;
>> +		interrupts =3D <3>;
>> +
>> +		/* ddc-i2c-bus =3D <&i2c4>; */
>> +
>> +		status =3D "disabled";
>> +	};
>> +
>> +	lcd: lcd@13050000 {
> =

> The node name should be 'lcd-controller'.
> =

>> +		compatible =3D "ingenic,jz4740-lcd";
> =

> The JZ4780's LCD controller is much newer than the JZ4740 one, so even if=
 it works with the "ingenic,jz4740-lcd" compatible string, you want it as a=
 fallback.
> So this should be: compatible =3D "ingenic,jz4780-lcd", "ingenic,jz4740-l=
cd".
> =

> That means the YAML should be updated too.

I have started to look into jz4780 HDMI setup again.

Well, there is no driver compatible to "ingenic,jz4780-lcd" so far
and it is questionalbe if we need a different one.

I think we should rather make the driver also compatible
than adding a fallback to ingenic,jz4740-lcdto the DTS.

The reason why this is better even if both LCDC are almost
compatible is that the jz4780 allows for much bigger displays
and therefore should have its own jz_soc_info with 4k x 2k
as maximum.

Next I tried to find out if the LCDC are really compatible.

Well the jz4780 has two lcdc instances but they are separated
by the reg addr. Next, there are unique features (like picture in
picture with alpha blending) but those are probably disabled
if not programmed from reset state. This may become a reason
to separate or augment the driver for the jz4780 but at the
moment we can ignore that.

There are also subtly different bit definitions and register
widths (e.g. 24 bit in addition to 16/18 bit modes or more bits
for the sync position) but it looks as if the ingenic_drm
driver already handles this.

Then I tried to read back the registers. Strangely they
are all 0x00000000. So there is no programming of the
lcd-controller in our DT setup with HDMI at all!

I also checked that ingenic_drm_probe() is called and
returns successfully 0. It also reports that a /dev/fb
has been created:

[    7.908830] ingenic-drm 13050000.lcd-controller: fb0: ingenic-drmdrmf fr=
ame buffer device

But for example ingenic_drm_encoder_atomic_mode_set() is
never called which should write some registers of the LCDC.

I only did see some calls to ingenic_drm_encoder_atomic_check().

This of course explains why we have no HDMI signals despite
proper HPD and a /dev/fb0. Because the LCDC is not being
programmed.

Any ideas / hints how to check or improve?

BR and thanks,
Nikolaus

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
