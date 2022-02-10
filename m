Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 273864B1F96
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 08:48:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C322810E9FD;
	Fri, 11 Feb 2022 07:48:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 786C510E880
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Feb 2022 14:31:09 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id k18so8218684lji.12
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Feb 2022 06:31:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=novomatic-tech.com; s=ntpgsuite;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=87XkPg4lradxO8OFL7VMqVlJzMU37c35t+FwA352MNA=;
 b=UCj3z4lCO4UHVr44g1p6B0L37Olg9wXP0UPFSCxW8vDnpewrcKrAfvCCmXSqRLKxJm
 KFJnR8KCNBL2ZjfeQCkJU6NB8DkkBu8ztjgo7YEV7nzrXMMwuRyUO7p0Qfx0zGx30tGr
 TSeOdHC19zT55KkwtrL48xXfF3HE+5Xx5DaAf/GcjfKAMjVpL8WY6tNw5vKkCO/7qGiJ
 xMPTL4Lo8S3x+d2Ozi+D1qNLY3nf4//Qv5IvfvAWViz1v77P+PxzTnaWthVlzXQIOVZY
 46WWrHs6YXAZSYjpI+r1ROhHoL1eNkK6K0a4H4ple9F0DOvLEJfN0S1JWS6e6kJNhB+2
 HlVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=87XkPg4lradxO8OFL7VMqVlJzMU37c35t+FwA352MNA=;
 b=PaiWvC97b7q+3NDH1sPLN2Yb5UmZkvGZAaTdDw35m0h9yozbSBXxtCpKpDdOtJ0njM
 45uYaKfHUk27+b1+fFOi++SbTrYJ4zYweZr/gI8UmbHYxSkTtGMDJ4M7p6vsWLOeCdg5
 9/Vsna4MFmUzOuQBPYiN6SQ0flQtYJ1AEbBca2VoGxrXM3TpqxhGms/b6cziD8+/pnRq
 8xEqZuPi4mn1rvhjGcJQ4vkmENl4YjRFHKrpjfGqW89wJTD29pmZv0FFWt67p4chNTyR
 /MCJ8Matd6GuigeoesvCBcZQ6nnokKqJwBXVKMA12rySAxqEFaYADpRRciAs/7BBShqF
 P0hg==
X-Gm-Message-State: AOAM5328dbfTwm7WRu9XN3VWyYLThLQeq7FzqHB/DSP8BHSKXOJ8Zvng
 nxpb1Id1Py2IvIQbmNuJHkuKkjmmpCnXztkn+PLtZLsa77UvUaFOZIt6FyRUSQXv5KtoXFEyg6/
 uy4m0HGvuYM0T8NWK6/BXDr6nIXPnCGTUGKqLrmk=
X-Google-Smtp-Source: ABdhPJwhcfAW9ptd/PTzVZQFp7dFdgXvVRgiVGWuAolU/zHslbDcJ/1WpOM8GPKoDBq/mu9xFD9jmCEuYZPCBHf3IQ0=
X-Received: by 2002:a2e:7c10:: with SMTP id x16mr5077133ljc.482.1644503467832; 
 Thu, 10 Feb 2022 06:31:07 -0800 (PST)
MIME-Version: 1.0
From: "Sokalski, Marcin" <msokalski@novomatic-tech.com>
Date: Thu, 10 Feb 2022 15:30:57 +0100
Message-ID: <CAOGaehmsFdyV6jgXPVQOxWiPPu0n_G=8LaujCcNncoKBkRb_8Q@mail.gmail.com>
Subject: Patch for fbcon not letting to read console font if it's width is
 17-24 (3 bytes pitch)
To: b.zolnierkie@samsung.com
Content-Type: multipart/alternative; boundary="000000000000084bd405d7aacdc9"
X-Mailman-Approved-At: Fri, 11 Feb 2022 07:47:51 +0000
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
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--000000000000084bd405d7aacdc9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

staging: drivers: video: fbdev: core: fbcon: Fix getting font from fbcon

The patch fixes the problem of getting fonts from fbcon when the font's
width spans over 3 bytes.
The bug can be reproduced inside linux console running fbcon in following
way:

Set font with width in range 17-24, ie: solar24x32.psfu can be downloaded
from kbd package
> setfont /usr/share/consolefonts/solar24x32.psfu

Try to read it back:
> setfont -O font.psfu

Before the fix, it will diplay:
> get_font: GIO_FONT: Invalid argument

On patched kernel it will output font.psfu file
Now we can confirm it is a valid font file:
> setfont font.psfu

Signed-off-by: Marcin Sokalski <msokalski@novomatic-tech.com>

diff --git a/drivers/video/fbdev/core/fbcon.c
b/drivers/video/fbdev/core/fbcon.c
index 99ecd9a6d844..1f599872cae5 100644
--- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -1806,18 +1806,15 @@ static int fbcon_get_font(struct vc_data *vc,
struct console_font *font)
  fontdata +=3D j;
  }
  } else if (font->width <=3D 24) {
- if (font->charcount * (vc->vc_font.height * sizeof(u32)) >
FNTSIZE(fontdata))
+ j =3D vc->vc_font.height * 3;
+ if (font->charcount * j > FNTSIZE(fontdata))
  return -EINVAL;

  for (i =3D 0; i < font->charcount; i++) {
- for (j =3D 0; j < vc->vc_font.height; j++) {
- *data++ =3D fontdata[0];
- *data++ =3D fontdata[1];
- *data++ =3D fontdata[2];
- fontdata +=3D sizeof(u32);
- }
- memset(data, 0, 3 * (32 - j));
- data +=3D 3 * (32 - j);
+ memcpy(data, fontdata, j);
+ memset(data + j, 0, 96 - j);
+ data +=3D 96;
+ fontdata +=3D j;
  }
  } else {
  j =3D vc->vc_font.height * 4;

--=20
CONFIDENTIALITY NOTICE
------------------------------------
This E-mail is=20
intended only to be read or used by the addressee.The information contained=
=20
in this E-mail message may be confidential information. If you are not the=
=20
intended recipient, any use, interference with, distribution, disclosure or=
=20
copying of this material is unauthorised and prohibited. Confidentiality=20
attached to this communication is not waived or lost by reason of the=20
mistaken delivery to you.
If you have received this message in error,=20
please delete it and notify us by return E-mail or telephone NOVOMATIC=20
Technologies Poland Sp. z o.o. +48 12 258 00 50. Any E-mail attachment may=
=20
contain software viruses which could damage your own computer system.=20
Whilst reasonable precaution has been taken to minimize this risk, we=20
cannot accept liability for any damage which you sustain as a result of=20
software viruses. You should therefore carry out your own virus checks=20
before opening any attachments.
------------------------------------
NOVOMATIC Technologies Poland Sp. z o.o., Poland, Krakowska 368, 32-080=20
Zabierz=C3=B3w

--000000000000084bd405d7aacdc9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">staging: drivers: video: fbdev: core: fbcon: Fix getting f=
ont from fbcon<br><br>The patch fixes the problem of getting fonts from fbc=
on when the font&#39;s width spans over 3 bytes.<br>The bug can be reproduc=
ed inside linux console running fbcon in following way:<br><br>Set font wit=
h width in range 17-24, ie: solar24x32.psfu can be downloaded from kbd pack=
age<br>&gt; setfont /usr/share/consolefonts/solar24x32.psfu<br><br>Try to r=
ead it back:<br>&gt; setfont -O font.psfu<br><br>Before the fix, it will di=
play:<br>&gt; get_font: GIO_FONT: Invalid argument<br><br>On patched kernel=
 it will output font.psfu file<br>Now we can confirm it is a valid font fil=
e:<br>&gt; setfont font.psfu<br><br>Signed-off-by: Marcin Sokalski &lt;<a h=
ref=3D"mailto:msokalski@novomatic-tech.com">msokalski@novomatic-tech.com</a=
>&gt;<br><br>diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/=
fbdev/core/fbcon.c<br>index 99ecd9a6d844..1f599872cae5 100644<br>--- a/driv=
ers/video/fbdev/core/fbcon.c<br>+++ b/drivers/video/fbdev/core/fbcon.c<br>@=
@ -1806,18 +1806,15 @@ static int fbcon_get_font(struct vc_data *vc, struct=
 console_font *font)<br>=C2=A0			fontdata +=3D j;<br>=C2=A0		}<br>=C2=A0	} =
else if (font-&gt;width &lt;=3D 24) {<br>-		if (font-&gt;charcount * (vc-&g=
t;vc_font.height * sizeof(u32)) &gt; FNTSIZE(fontdata))<br>+		j =3D vc-&gt;=
vc_font.height * 3;<br>+		if (font-&gt;charcount * j &gt; FNTSIZE(fontdata)=
)<br>=C2=A0			return -EINVAL;<br>=C2=A0<br>=C2=A0		for (i =3D 0; i &lt; fon=
t-&gt;charcount; i++) {<br>-			for (j =3D 0; j &lt; vc-&gt;vc_font.height; =
j++) {<br>-				*data++ =3D fontdata[0];<br>-				*data++ =3D fontdata[1];<br=
>-				*data++ =3D fontdata[2];<br>-				fontdata +=3D sizeof(u32);<br>-			}<=
br>-			memset(data, 0, 3 * (32 - j));<br>-			data +=3D 3 * (32 - j);<br>+		=
	memcpy(data, fontdata, j);<br>+			memset(data + j, 0, 96 - j);<br>+			data=
 +=3D 96;<br>+			fontdata +=3D j;<br>=C2=A0		}<br>=C2=A0	} else {<br>=C2=A0=
		j =3D vc-&gt;vc_font.height * 4;</div>

<br>
<div><font face=3D"Arial, Helvetica, sans-serif" size=3D"2">CONFIDENTIALITY=
 NOTICE</font></div><div><font face=3D"Arial, Helvetica, sans-serif" size=
=3D"2">------------------------------<wbr>------</font></div><div><font fac=
e=3D"Arial, Helvetica, sans-serif" size=3D"2">This E-mail is intended only =
to be read or used by the addressee.The information contained in this E-mai=
l message may be confidential information. If you are not the intended reci=
pient, any use, interference with, distribution, disclosure or copying of t=
his material is unauthorised and prohibited. Confidentiality attached to th=
is communication is not waived or lost by reason of the mistaken delivery t=
o you.</font></div><div><font face=3D"Arial, Helvetica, sans-serif" size=3D=
"2">If you have received this message in error, please delete it and notify=
 us by return E-mail or telephone NOVOMATIC Technologies Poland Sp. z o.o. =
+48 12 258 00 50. Any E-mail attachment may contain software viruses which =
could damage your own computer system. Whilst reasonable precaution has bee=
n taken to minimize this risk, we cannot accept liability for any damage wh=
ich you sustain as a result of software viruses. You should therefore carry=
 out your own virus checks before opening any attachments.</font></div><div=
><font face=3D"Arial, Helvetica, sans-serif" size=3D"2">-------------------=
-----------<wbr>------</font></div><div><font face=3D"Arial, Helvetica, san=
s-serif" size=3D"2">NOVOMATIC Technologies Poland Sp. z o.o., Poland, Krako=
wska 368, 32-080 Zabierz=C3=B3w</font></div>
--000000000000084bd405d7aacdc9--
