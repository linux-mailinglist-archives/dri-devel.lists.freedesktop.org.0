Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C36F4177132
	for <lists+dri-devel@lfdr.de>; Tue,  3 Mar 2020 09:25:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 094EB6E9F2;
	Tue,  3 Mar 2020 08:24:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo6-p03-ob.smtp.rzone.de (mo6-p03-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5303::12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B61146E4D0
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2020 07:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1583220302;
 s=strato-dkim-0002; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=0JD2czR4i28VqvC+r7V3gHmAU4v7JT+PK30l6nvdRns=;
 b=mxMcvVQtEc6o+Lfx4fFiAGXSRJx/UZvC7ZEplW4tY3LuWGHJWxxQ6OTQzLWL0veFTQ
 1yRMFHPb4aG9majL6rN7Z0XU+03dBWEWqtdqZwa27bDDpgQwwfqBUcYb5slrKYBCJ+1m
 KynZSi8JFGhhkHirL0+2nUg1GIe79uE/fXhOLAMKRGocZMThL/+/4NsNVNdBuqS3ToyY
 p+SQWfy1v6hN6/AXCuoU4r8wZAGn562IEMH+fOqSZkWHp+Ws/d6oxt3ZPfVVYSmV19cj
 souvPXO0GMqfFVDWta+dpTarJpcyJ46FYAdmDi6wpR8Y2SOUpsFmsoJhwYMrPip6ZoSC
 Uz9g==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj7wpz8NMGHPrpwDGvxw=="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box by smtp.strato.de (RZmta 46.2.0 DYNA|AUTH)
 with ESMTPSA id y0a02cw237OnFzF
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256
 ECDH bits, eq. 3072 bits RSA))
 (Client did not present a certificate);
 Tue, 3 Mar 2020 08:24:49 +0100 (CET)
Subject: Re: [RFC v2 6/8] MIPS: DTS: jz4780: account for Synopsys HDMI driver
 and LCD controller
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
From: H. Nikolaus Schaller <hns@goldelico.com>
In-Reply-To: <1583177253.3.5@crapouillou.net>
Date: Tue, 3 Mar 2020 08:24:49 +0100
Message-Id: <04905285-25E4-442E-89D0-3F6C50D1E87C@goldelico.com>
References: <cover.1582913973.git.hns@goldelico.com>
 <04b485165f38744816a0446e95150cafdeb716ee.1582913973.git.hns@goldelico.com>
 <1583177253.3.5@crapouillou.net>
To: Paul Cercueil <paul@crapouillou.net>
X-Mailer: Apple Mail (2.3124)
X-Mailman-Approved-At: Tue, 03 Mar 2020 08:24:06 +0000
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

Hm. I am not sure.

Can there be differences in HDMI between different boards so
that it needs to be defined there?

IMHO the HDMI subsystem is completely sitting on the jz4780 SoC
and clocked by the master clock. So boards should only differ in the
ESD protection and mechanical connector... =


And status =3D "ok".

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

Ah, that is an interesting detail.

It could be the reason why the HDMI does not show an output signal yet.
If the jz4740-lcd and jz4780-lcd are not really 100% compatible.
I'll give it try asap.

If it does not help to get output signals, we need community members who
can test (i.e. own an CI20 board) and can help to identify the bug(s).

> =

> That means the YAML should be updated too.

Ok.

BR,
Nikolaus

> =

> -Paul
> =

>> +		reg =3D <0x13050000 0x1800>;
>> +
>> +		clocks =3D <&cgu JZ4780_CLK_TVE>, <&cgu JZ4780_CLK_LCD0PIXCLK>;
>> +		clock-names =3D "lcd", "lcd_pclk";
>> +
>> +		interrupt-parent =3D <&intc>;
>> +		interrupts =3D <31>;
>> +
>> +		status =3D "disabled";
>> +	};
>> };
>> --
>> 2.23.0
> =

> =


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
