Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 743EF1E07CF
	for <lists+dri-devel@lfdr.de>; Mon, 25 May 2020 09:22:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3E2C89D81;
	Mon, 25 May 2020 07:21:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com
 [IPv6:2a00:1450:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DFE789D83
 for <dri-devel@lists.freedesktop.org>; Sun, 24 May 2020 21:13:44 +0000 (UTC)
Received: by mail-ej1-x643.google.com with SMTP id a2so18602309ejb.10
 for <dri-devel@lists.freedesktop.org>; Sun, 24 May 2020 14:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:thread-topic:thread-index:date:message-id
 :references:in-reply-to:accept-language:content-language
 :mime-version; bh=bHabQpmzN2xel/6FviasUmQyZalMd4G+B5z38znNNaQ=;
 b=ImqHuBrx0dkDg3bKjZUt7fqutkW524MSCJI9ZaiE26WAYod9G1Z5Y8kyVMwdz85BKj
 h+MKf5c4xvS7Lm4qY2m1eFIR+SGcE+NAKCM9MrqRsIvKPoQnpER+7epcXE5sjmcM24WO
 gsa1m3lulwKvf043SKh+VamaxV2IePy1z/3LVLtAVlP7sldogFxvggkho+4voshZFm2d
 ttYa0qmOAkG1YUCA/Ewf5HA6IhvkB3Hhpc0ioK+z+6EhG5YQ/cYGYwklXSCLEesmfjUQ
 pjPyxgT0oLS394o3/28s2WDg/1zBe1i+bHmGSTTBzxLSL1j3dYhfQXUhilcx3LUDaEsV
 /Pxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:thread-topic:thread-index:date
 :message-id:references:in-reply-to:accept-language:content-language
 :mime-version;
 bh=bHabQpmzN2xel/6FviasUmQyZalMd4G+B5z38znNNaQ=;
 b=phpemP3qx1lnkcwRjCLNffhwLG7uiG9A1oJMUvFme2GYV2EHfv0GnObQcZ0Jzu4I93
 y/NIH32zr3IyvZVIHP0hNPErvfb2m2Bfgrwc+E5np16eP4yyGUd39bEiUOtAL3GAtLK2
 Y+I4fDEabUCswPcnTZvMKpW40EiluRxFDivsxr6Tswuh0BdLvUAxMo2YJdmx3z6YCc93
 zXBhZffycE+KbFlz1O0lUYkbmMsxO/Z6o9IXjPnCAvUVt642uLvAVZ0K+ikDefxKMRkJ
 EiT+I8zBkqxmhPk2I9lDKgtrEGAVg3bWUiZyAUdqgqfwIHzcu9afpNmqLkvfSLD4oYYe
 RwlA==
X-Gm-Message-State: AOAM531tcGOSaAdryl+ylhnIIKEJ7OuRunWchu7j1nO5AME7ew/09cn5
 4lk3JK9vko27xwrAEsho6ERquzKq
X-Google-Smtp-Source: ABdhPJybmvPBHYVgpmyMBbeuicMUi8K9pS8+4jnXxZYxTu/rCH8nihDjPaIyAGPjuaK5CiTqvixcww==
X-Received: by 2002:adf:e3c1:: with SMTP id k1mr8380436wrm.33.1590354822693;
 Sun, 24 May 2020 14:13:42 -0700 (PDT)
Received: from DB7PR03MB4604.eurprd03.prod.outlook.com
 ([2603:1026:c02:2822::5])
 by smtp.gmail.com with ESMTPSA id d13sm15753032wmb.39.2020.05.24.14.13.41
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 24 May 2020 14:13:42 -0700 (PDT)
From: =?Windows-1252?Q?=C1lvaro_Fern=E1ndez_Rojas?= <noltari@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, "computersforpeace@gmail.com"
 <computersforpeace@gmail.com>, "kdasu.kdev@gmail.com" <kdasu.kdev@gmail.com>, 
 "richard@nod.at" <richard@nod.at>, "vigneshr@ti.com" <vigneshr@ti.com>,
 "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "bcm-kernel-feedback-list@broadcom.com"
 <bcm-kernel-feedback-list@broadcom.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-media@vger.kernel.org"
 <linux-media@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linaro-mm-sig@lists.linaro.org"
 <linaro-mm-sig@lists.linaro.org>
Subject: Re: [PATCH v4 4/5] dt: bindings: brcmnand: add v2.1 and v2.2 support
Thread-Topic: [PATCH v4 4/5] dt: bindings: brcmnand: add v2.1 and v2.2 support
Thread-Index: AQHWMDKzmsni5a0R3kuk/L0lkEpqlai3od4AgAAAgwCAAD50Ng==
X-MS-Exchange-MessageSentRepresentingType: 1
Date: Sun, 24 May 2020 21:13:41 +0000
Message-ID: <DB7PR03MB4604C2B50C013033D0CB95F8F5B20@DB7PR03MB4604.eurprd03.prod.outlook.com>
References: <20200522121524.4161539-5-noltari@gmail.com>
 <20200524192550.4559-1-miquel.raynal@bootlin.com>,
 <20200524212740.08c2810f@xps13>
In-Reply-To: <20200524212740.08c2810f@xps13>
Accept-Language: es-ES, en-US
Content-Language: es-ES
X-MS-Has-Attach: 
X-MS-Exchange-Organization-SCL: -1
X-MS-TNEF-Correlator: 
X-MS-Exchange-Organization-RecordReviewCfmType: 0
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 25 May 2020 07:21:04 +0000
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
Content-Type: multipart/mixed; boundary="===============1458509031=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1458509031==
Content-Language: es-ES
Content-Type: multipart/alternative;
	boundary="_000_DB7PR03MB4604C2B50C013033D0CB95F8F5B20DB7PR03MB4604eurp_"

--_000_DB7PR03MB4604C2B50C013033D0CB95F8F5B20DB7PR03MB4604eurp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Thanks for merging the patches :).

BTW, is there something wrong with patch 5?
I can see patches 1-4 applied in https://git.kernel.org/pub/scm/linux/kerne=
l/git/mtd/linux.git/log/?h=3Dnand/next, but I can=92t see patch 5.

Best regards,
=C1lvaro.
________________________________
De: Miquel Raynal <miquel.raynal@bootlin.com>
Enviado: Sunday, May 24, 2020 9:27:40 PM
Para: =C1lvaro Fern=E1ndez Rojas <noltari@gmail.com>; computersforpeace@gma=
il.com <computersforpeace@gmail.com>; kdasu.kdev@gmail.com <kdasu.kdev@gmai=
l.com>; miquel.raynal@bootlin.com <miquel.raynal@bootlin.com>; richard@nod.=
at <richard@nod.at>; vigneshr@ti.com <vigneshr@ti.com>; sumit.semwal@linaro=
.org <sumit.semwal@linaro.org>; linux-mtd@lists.infradead.org <linux-mtd@li=
sts.infradead.org>; bcm-kernel-feedback-list@broadcom.com <bcm-kernel-feedb=
ack-list@broadcom.com>; linux-kernel@vger.kernel.org <linux-kernel@vger.ker=
nel.org>; linux-media@vger.kernel.org <linux-media@vger.kernel.org>; dri-de=
vel@lists.freedesktop.org <dri-devel@lists.freedesktop.org>; linaro-mm-sig@=
lists.linaro.org <linaro-mm-sig@lists.linaro.org>
Asunto: Re: [PATCH v4 4/5] dt: bindings: brcmnand: add v2.1 and v2.2 suppor=
t


Miquel Raynal <miquel.raynal@bootlin.com> wrote on Sun, 24 May 2020
21:25:50 +0200:

> On Fri, 2020-05-22 at 12:15:23 UTC, =3D?utf-8?q?=3DC3=3D81lvaro_Fern=3DC3=
=3DA1ndez_Rojas?=3D wrote:
> > Added brcm,brcmnand-v2.1 and brcm,brcmnand-v2.2 as possible compatible
> > strings to support brcmnand controllers v2.1 and v2.2.
> >
> > Signed-off-by: =C1lvaro Fern=E1ndez Rojas <noltari@gmail.com>
> > Acked-by: Florian Fainelli <f.fainelli@gmail.com>
>
> Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git =
nand/next, thanks.

FYI I updated the commit log:
s/dt: bindings:/dt-bindings: mtd:/
s/Added/Add/

Thanks,
Miqu=E8l

--_000_DB7PR03MB4604C2B50C013033D0CB95F8F5B20DB7PR03MB4604eurp_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
</head>
<body>
<div dir=3D"ltr">
<div></div>
<div data-ogsc=3D"" style=3D"">
<div dir=3D"ltr">Thanks for merging the patches :).</div>
<div dir=3D"ltr"><br>
</div>
<div dir=3D"ltr">BTW, is there something wrong with patch 5?</div>
<div dir=3D"ltr">I can see patches 1-4 applied in&nbsp;<a href=3D"https://g=
it.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git/log/?h=3Dnand/next">ht=
tps://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git/log/?h=3Dnand/n=
ext</a>, but I can=92t see patch 5.</div>
<div><br>
</div>
<div class=3D"ms-outlook-ios-signature" id=3D"ms-outlook-mobile-signature">
<div style=3D"direction: ltr;" dir=3D"ltr">Best regards,</div>
<div style=3D"direction: ltr;" dir=3D"ltr">=C1lvaro.</div>
</div>
</div>
</div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>De:</b> Miquel Raynal &lt;mique=
l.raynal@bootlin.com&gt;<br>
<b>Enviado:</b> Sunday, May 24, 2020 9:27:40 PM<br>
<b>Para:</b> =C1lvaro Fern=E1ndez Rojas &lt;noltari@gmail.com&gt;; computer=
sforpeace@gmail.com &lt;computersforpeace@gmail.com&gt;; kdasu.kdev@gmail.c=
om &lt;kdasu.kdev@gmail.com&gt;; miquel.raynal@bootlin.com &lt;miquel.rayna=
l@bootlin.com&gt;; richard@nod.at &lt;richard@nod.at&gt;; vigneshr@ti.com
 &lt;vigneshr@ti.com&gt;; sumit.semwal@linaro.org &lt;sumit.semwal@linaro.o=
rg&gt;; linux-mtd@lists.infradead.org &lt;linux-mtd@lists.infradead.org&gt;=
; bcm-kernel-feedback-list@broadcom.com &lt;bcm-kernel-feedback-list@broadc=
om.com&gt;; linux-kernel@vger.kernel.org &lt;linux-kernel@vger.kernel.org&g=
t;;
 linux-media@vger.kernel.org &lt;linux-media@vger.kernel.org&gt;; dri-devel=
@lists.freedesktop.org &lt;dri-devel@lists.freedesktop.org&gt;; linaro-mm-s=
ig@lists.linaro.org &lt;linaro-mm-sig@lists.linaro.org&gt;<br>
<b>Asunto:</b> Re: [PATCH v4 4/5] dt: bindings: brcmnand: add v2.1 and v2.2=
 support</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText"><br>
Miquel Raynal &lt;miquel.raynal@bootlin.com&gt; wrote on Sun, 24 May 2020<b=
r>
21:25:50 &#43;0200:<br>
<br>
&gt; On Fri, 2020-05-22 at 12:15:23 UTC, =3D?utf-8?q?=3DC3=3D81lvaro_Fern=
=3DC3=3DA1ndez_Rojas?=3D wrote:<br>
&gt; &gt; Added brcm,brcmnand-v2.1 and brcm,brcmnand-v2.2 as possible compa=
tible<br>
&gt; &gt; strings to support brcmnand controllers v2.1 and v2.2.<br>
&gt; &gt; <br>
&gt; &gt; Signed-off-by: =C1lvaro Fern=E1ndez Rojas &lt;noltari@gmail.com&g=
t;<br>
&gt; &gt; Acked-by: Florian Fainelli &lt;f.fainelli@gmail.com&gt;&nbsp; <br=
>
&gt; <br>
&gt; Applied to <a href=3D"https://git.kernel.org/pub/scm/linux/kernel/git/=
mtd/linux.git">
https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git</a> nand/next=
, thanks.<br>
<br>
FYI I updated the commit log:<br>
s/dt: bindings:/dt-bindings: mtd:/<br>
s/Added/Add/<br>
<br>
Thanks,<br>
Miqu=E8l<br>
</div>
</span></font></div>
</body>
</html>

--_000_DB7PR03MB4604C2B50C013033D0CB95F8F5B20DB7PR03MB4604eurp_--

--===============1458509031==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1458509031==--
