Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7815C1C69A4
	for <lists+dri-devel@lfdr.de>; Wed,  6 May 2020 09:02:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBC886E28E;
	Wed,  6 May 2020 07:02:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC1B06E142
 for <dri-devel@lists.freedesktop.org>; Tue,  5 May 2020 08:24:49 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id x4so1240777wmj.1
 for <dri-devel@lists.freedesktop.org>; Tue, 05 May 2020 01:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:message-id:mime-version:subject:date:in-reply-to:cc:to
 :references; bh=xGGP0A8xqujpkkJ8oWkAeu/OIxPilG38zuMmQrK5MZI=;
 b=jJhWZffScCx0e3lZoT4DkVbNHp/EHRJX1cSSuiBRgV9+tcA6W2H2xvor11VKMwPeTT
 pNPzCTZzis1zWQMrPpq8yXrl4sihNtFVNIxkblUc06JHNHgHi7GY/CVICeOZ7HSwZwhK
 LLljMHGC+9d9aALbIYpuo59t2atWcCoPyVY5fR6I6jtbtJqELYICrGgDhv0xr52Z00Vt
 jOdmrs1XzTqZhAT72WpfhswrSwnjZC9QIr2Xmjwh2g46o82uRwUplDKWZABWbjZYVGuB
 R/Qwcv1j1IT5L7AdAGZ54/NaTWO9LAulJGJwISyh47dRb5h6OFeaYuY7+WpZa7N3Pt4L
 te+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:message-id:mime-version:subject:date
 :in-reply-to:cc:to:references;
 bh=xGGP0A8xqujpkkJ8oWkAeu/OIxPilG38zuMmQrK5MZI=;
 b=Nlc5mbooeBVtET9Oqr37hEGagDdAkcQCp6BIcAwKQEG7ABozAwjYvVAn/PcKp0xVEa
 r7U+h6LFEqg7XEkonBeiNQCu8uxdPcFBO8dcyTwwELDv/eWaUuizv1adNsKMfBb8XK0F
 gm5V9duni8VbtRB91kPnShe0z39ZjUZsujSSH+o0E6Z+uZoXN//76nCsZMD6UNnwdFIy
 Donup9NMCbWsdGjqsgRwmkJ46Qc0RATW+vdfwbAByCISAIgJRAXu+Q4vFi9Q7zqaiJCl
 palPBc6AOFq5+XIOvkFABUSj9c1rqgwSFdakehVWyFlS4cKJh9lT8toyIXtCTGlbhk9r
 3xlw==
X-Gm-Message-State: AGi0PuYPiFCUhV56s1P9fdFPancoz2G0bLfLD4g5cDkIiAAds0OMNjIX
 MdQD/fHbMeHeDvu4XYDjE5U=
X-Google-Smtp-Source: APiQypLFZMKLVpQMC6w3cBKrq2WU5NbIS9vaEpctXys2UHhz6d6TgzfmwjNaGDDg771mlz3n9Utg8g==
X-Received: by 2002:a7b:c104:: with SMTP id w4mr2119154wmi.8.1588667088401;
 Tue, 05 May 2020 01:24:48 -0700 (PDT)
Received: from macbook-pro-alvaro.lan (246.red-83-44-9.dynamicip.rima-tde.net.
 [83.44.9.246])
 by smtp.gmail.com with ESMTPSA id n6sm1997551wrs.81.2020.05.05.01.24.46
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 05 May 2020 01:24:47 -0700 (PDT)
From: =?utf-8?Q?=C3=81lvaro_Fern=C3=A1ndez_Rojas?= <noltari@gmail.com>
Message-Id: <FFE6FE5C-4FE0-49B6-AD36-CEF344015283@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: [PATCH] nand: brcmnand: correctly verify erased pages
Date: Tue, 5 May 2020 10:24:46 +0200
In-Reply-To: <2fea8057-8b84-790e-60ba-b6848a186e18@gmail.com>
To: Florian Fainelli <f.fainelli@gmail.com>
References: <20200504092943.2739784-1-noltari@gmail.com>
 <2fea8057-8b84-790e-60ba-b6848a186e18@gmail.com>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
X-Mailman-Approved-At: Wed, 06 May 2020 07:02:40 +0000
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
Cc: vigneshr@ti.com, kdasu.kdev@gmail.com, richard@nod.at,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-mtd@lists.infradead.org,
 miquel.raynal@bootlin.com, bcm-kernel-feedback-list@broadcom.com,
 computersforpeace@gmail.com, linux-media@vger.kernel.org
Content-Type: multipart/mixed; boundary="===============1113090153=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1113090153==
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_299C2087-3EC6-467B-A0F1-58BBF48C0264"


--Apple-Mail=_299C2087-3EC6-467B-A0F1-58BBF48C0264
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

Hi Florian,

I added it on v2.

Best regards,
=C3=81lvaro.

> El 4 may 2020, a las 23:43, Florian Fainelli <f.fainelli@gmail.com> =
escribi=C3=B3:
>=20
>=20
>=20
> On 5/4/2020 2:29 AM, =C3=81lvaro Fern=C3=A1ndez Rojas wrote:
>> The current code checks that the whole OOB area is erased.
>> This is a problem when JFFS2 cleanmarkers are added to the OOB, since =
it will
>> fail due to the usable OOB bytes not being 0xff.
>> Correct this by only checking that the ECC aren't 0xff.
>>=20
>> Signed-off-by: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com =
<mailto:noltari@gmail.com>>
>=20
> Can you provide a Fixes: tag for this change?
>=20
>> ---
>> drivers/mtd/nand/raw/brcmnand/brcmnand.c | 22 ++++++++++++++++++----
>> 1 file changed, 18 insertions(+), 4 deletions(-)
>>=20
>> diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand.c =
b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
>> index e4e3ceeac38f..546f0807b887 100644
>> --- a/drivers/mtd/nand/raw/brcmnand/brcmnand.c
>> +++ b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
>> @@ -2018,6 +2018,7 @@ static int brcmnand_read_by_pio(struct mtd_info =
*mtd, struct nand_chip *chip,
>> static int brcmstb_nand_verify_erased_page(struct mtd_info *mtd,
>> 		  struct nand_chip *chip, void *buf, u64 addr)
>> {
>> +	struct mtd_oob_region oobecc;
>> 	int i, sas;
>> 	void *oob =3D chip->oob_poi;
>> 	int bitflips =3D 0;
>> @@ -2035,11 +2036,24 @@ static int =
brcmstb_nand_verify_erased_page(struct mtd_info *mtd,
>> 	if (ret)
>> 		return ret;
>>=20
>> -	for (i =3D 0; i < chip->ecc.steps; i++, oob +=3D sas) {
>> +	for (i =3D 0; i < chip->ecc.steps; i++) {
>> 		ecc_chunk =3D buf + chip->ecc.size * i;
>> -		ret =3D nand_check_erased_ecc_chunk(ecc_chunk,
>> -						  chip->ecc.size,
>> -						  oob, sas, NULL, 0,
>> +
>> +		ret =3D nand_check_erased_ecc_chunk(ecc_chunk, =
chip->ecc.size,
>> +						  NULL, 0, NULL, 0,
>> +						  chip->ecc.strength);
>> +		if (ret < 0)
>> +			return ret;
>> +
>> +		bitflips =3D max(bitflips, ret);
>> +	}
>> +
>> +	for (i =3D 0; mtd->ooblayout->ecc(mtd, i, &oobecc) !=3D -ERANGE; =
i++)
>> +	{
>> +		ret =3D nand_check_erased_ecc_chunk(NULL, 0,
>> +						  oob + oobecc.offset,
>> +						  oobecc.length,
>> +						  NULL, 0,
>> 						  chip->ecc.strength);
>> 		if (ret < 0)
>> 			return ret;
>>=20
>=20
> --=20
> Florian


--Apple-Mail=_299C2087-3EC6-467B-A0F1-58BBF48C0264
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D"">Hi =
Florian,<div class=3D""><br class=3D""></div><div class=3D"">I added it =
on v2.</div><div class=3D""><br class=3D""></div><div class=3D"">Best =
regards,</div><div class=3D"">=C3=81lvaro.<br class=3D""><div><br =
class=3D""><blockquote type=3D"cite" class=3D""><div class=3D"">El 4 may =
2020, a las 23:43, Florian Fainelli &lt;<a =
href=3D"mailto:f.fainelli@gmail.com" =
class=3D"">f.fainelli@gmail.com</a>&gt; escribi=C3=B3:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;" class=3D"">On 5/4/2020 2:29 AM, =C3=81lvaro =
Fern=C3=A1ndez Rojas wrote:</span><br style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><blockquote type=3D"cite" =
style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D"">The current code checks that the =
whole OOB area is erased.<br class=3D"">This is a problem when JFFS2 =
cleanmarkers are added to the OOB, since it will<br class=3D"">fail due =
to the usable OOB bytes not being 0xff.<br class=3D"">Correct this by =
only checking that the ECC aren't 0xff.<br class=3D""><br =
class=3D"">Signed-off-by: =C3=81lvaro Fern=C3=A1ndez Rojas &lt;<a =
href=3D"mailto:noltari@gmail.com" class=3D"">noltari@gmail.com</a>&gt;<br =
class=3D""></blockquote><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">Can you provide a Fixes: tag for this change?</span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" =
class=3D""><blockquote type=3D"cite" style=3D"font-family: Helvetica; =
font-size: 12px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; orphans: auto; text-align: =
start; text-indent: 0px; text-transform: none; white-space: normal; =
widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D"">---<br =
class=3D"">drivers/mtd/nand/raw/brcmnand/brcmnand.c | 22 =
++++++++++++++++++----<br class=3D"">1 file changed, 18 insertions(+), 4 =
deletions(-)<br class=3D""><br class=3D"">diff --git =
a/drivers/mtd/nand/raw/brcmnand/brcmnand.c =
b/drivers/mtd/nand/raw/brcmnand/brcmnand.c<br class=3D"">index =
e4e3ceeac38f..546f0807b887 100644<br class=3D"">--- =
a/drivers/mtd/nand/raw/brcmnand/brcmnand.c<br class=3D"">+++ =
b/drivers/mtd/nand/raw/brcmnand/brcmnand.c<br class=3D"">@@ -2018,6 =
+2018,7 @@ static int brcmnand_read_by_pio(struct mtd_info *mtd, struct =
nand_chip *chip,<br class=3D"">static int =
brcmstb_nand_verify_erased_page(struct mtd_info *mtd,<br class=3D""><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>&nbsp;struct nand_chip =
*chip, void *buf, u64 addr)<br class=3D"">{<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>struct =
mtd_oob_region oobecc;<br class=3D""><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>int i, sas;<br class=3D""><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>void *oob =
=3D chip-&gt;oob_poi;<br class=3D""><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>int bitflips =3D 0;<br =
class=3D"">@@ -2035,11 +2036,24 @@ static int =
brcmstb_nand_verify_erased_page(struct mtd_info *mtd,<br class=3D""><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>if =
(ret)<br class=3D""><span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span><span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span>return ret;<br class=3D""><br class=3D"">-<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>for (i =3D =
0; i &lt; chip-&gt;ecc.steps; i++, oob +=3D sas) {<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>for (i =3D =
0; i &lt; chip-&gt;ecc.steps; i++) {<br class=3D""><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>ecc_chunk =
=3D buf + chip-&gt;ecc.size * i;<br class=3D"">-<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>ret =3D =
nand_check_erased_ecc_chunk(ecc_chunk,<br class=3D"">-<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>&nbsp;chip-&gt;ecc.size,<br =
class=3D"">-<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-converted-space">&nbsp;</span>&nbsp;oob, =
sas, NULL, 0,<br class=3D"">+<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>ret =3D =
nand_check_erased_ecc_chunk(ecc_chunk, chip-&gt;ecc.size,<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-converted-space">&nbsp;</span>&nbsp;NULL, 0, =
NULL, 0,<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>&nbsp;chip-&gt;ecc.strength);=
<br class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span><span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span>if (ret &lt; 0)<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>return =
ret;<br class=3D"">+<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>bitflips =3D max(bitflips, =
ret);<br class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span>}<br class=3D"">+<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>for (i =3D =
0; mtd-&gt;ooblayout-&gt;ecc(mtd, i, &amp;oobecc) !=3D -ERANGE; i++)<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>{<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>ret =3D =
nand_check_erased_ecc_chunk(NULL, 0,<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>&nbsp;oob + =
oobecc.offset,<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>&nbsp;oobecc.length,<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-converted-space">&nbsp;</span>&nbsp;NULL, =
0,<br class=3D""><span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span><span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span><span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span><span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span><span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span><span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>&nbsp;chip-&gt;ecc.strength);=
<br class=3D""><span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span><span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span>if (ret &lt; 0)<br class=3D""><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>return =
ret;<br class=3D""><br class=3D""></blockquote><br style=3D"caret-color: =
rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">--<span class=3D"Apple-converted-space">&nbsp;</span></span><br=
 style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;" =
class=3D"">Florian</span></div></blockquote></div><br =
class=3D""></div></body></html>=

--Apple-Mail=_299C2087-3EC6-467B-A0F1-58BBF48C0264--

--===============1113090153==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1113090153==--
