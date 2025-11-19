Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E988C71826
	for <lists+dri-devel@lfdr.de>; Thu, 20 Nov 2025 01:10:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 978FF10E6B7;
	Thu, 20 Nov 2025 00:10:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="CGav2uZq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
 [209.85.167.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B130D10E240
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Nov 2025 12:42:59 +0000 (UTC)
Received: by mail-oi1-f196.google.com with SMTP id
 5614622812f47-45034dbaaabso2885935b6e.3
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Nov 2025 04:42:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763556178; x=1764160978; darn=lists.freedesktop.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=/L1jDhNVb06AZzh50uMtlGOP/1m7Y7AXXDmm2n6YdGQ=;
 b=CGav2uZqTkl235xm9nQ9YEv2HgAYlkpTrBwpFOqarZoKmKqHE/O5b7u1JZa6b1ahwA
 faWIMed0OvHE/c6v0wIzRZlFRzmQQg4qYfPYstggXkcz2/cHUsm6I91cpvra9krmzrep
 Rn2wgcuoe79IHboqIOrVlYxmdcrvEAzUVXiVfvG0Up/71DdhWA0KHPHXHFzeCvSm7iT5
 W5yfsu0TSVLHAuY4t+PkcB71M74sJ2Zah5ApF6E+HBtxmFJ7yOOl5M+Hif7ivnhz8F5v
 iiUEOI8Fvj/4YqrDTVXNzB9zk2To2j6ySPIbtJjSbhme4wSTQ9jVinQ0mHRgY+OXd0/Z
 BLPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763556178; x=1764160978;
 h=to:subject:message-id:date:from:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/L1jDhNVb06AZzh50uMtlGOP/1m7Y7AXXDmm2n6YdGQ=;
 b=EHimEaBmGfGSnfBqjRjnjPaCdpZ+5D0E/WzE5hRudRWmafWbnzD6l3BLKblurewmqW
 HNr9Ds0haXvpc6miCp1mNtF3YpHCF0EAbc9zW0L6Vt+Ku6VisU8AYgpQfubX812yFeUM
 6mo/0wCASaxlv29LDEZ1BIw0TabpojYyMXy+8LMAzTvFxywXaYPx4o8U1O/AWi2IoZoO
 Py9cYPDmZ7Z3BAAVX843FCnwCwBmnuUL8Pay7NRZ4dBl7Z+cHq1ZF4HcBvLDgaH7UT7G
 rkzCgzRBqBKhgXXPryAjsI1oqMGKkqPPw+sXG3bY+ZGgxMhTkmLrfQsij0f7Bsqhmwh0
 aJOA==
X-Gm-Message-State: AOJu0Yx4Cp5OykHsahGR2e67GDCQlmxtJ7vcS7Aippp+S2JDhDsHUGqz
 y0jfP3AwWySnF1xq4SLLl90rcSEXpzn9nDV8Sajn109g+MLD2Dysj7E38hIwCwkqPVX9hDTgPN1
 mKUmXef5KpqQ7WRKyLwVYdpCD+BIDXquOcbP0qkg=
X-Gm-Gg: ASbGncsxmTw0plyprxmli9xfaFvUE7ClonBV8Jd3XdTv5UGqj8+LBfigdikt4R8emCz
 hVY2sCTDfrtfTxx0x2H7k6RGwvTnDyLkLUo1jo+m1+tl9rH3rLRCVGFgWMvzqPAYk3PDraNQQIW
 HSFB4mBSEgzgB3b7xLofAIWpONmiayPEoyd0WLHzgk8XM1hkB54/YfLhhdxbarz3cYJ8Iw58voZ
 u2Eq+syoadM0AosWNJiCMbiWYFqV+7eDWASLy1kJtHmiyGnSobumvB0tXMCTvapSnIwH4ojASWU
 TDUgc2Vd3uqXRIaPt/BSQAckIpBJ
X-Google-Smtp-Source: AGHT+IFPMS/IhwjzRNkGjyJjRo09VWJoFSFrn58KX5v/mk0wQbegEx3/jparMAXfl6xbFqtmOc7EVuXGzPUSn4sw+eY=
X-Received: by 2002:a05:6808:198b:b0:450:b3ec:c154 with SMTP id
 5614622812f47-450ef8f75e2mr1118789b6e.25.1763556178430; Wed, 19 Nov 2025
 04:42:58 -0800 (PST)
MIME-Version: 1.0
From: =?UTF-8?Q?Basti=C3=A1n_Almendras?= <bastian.almendras96@gmail.com>
Date: Wed, 19 Nov 2025 09:42:45 -0300
X-Gm-Features: AWmQ_bnGTlJqbcxxPe9caQ7MQwsDpvSTKQR6FGxh7B1XoFnKNi-3Lureun_M2cU
Message-ID: <CABuR8ms7CrBLtQ12w4mkbLTMVjhS0Krm6TV=Z+yotKy8ymy75g@mail.gmail.com>
Subject: drm: panel-orientation-quirks: Add quirk for Acer Switch One 10
 (SW1-011)
To: dri-devel@lists.freedesktop.org
Content-Type: multipart/alternative; boundary="0000000000008e8f520643f1eb8a"
X-Mailman-Approved-At: Thu, 20 Nov 2025 00:10:28 +0000
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

--0000000000008e8f520643f1eb8a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello, good morning. I'm trying to get my old tablet working properly on
Debian, but I've had to add some fixes.
Here's a commit I created to like the Acer Switch One 10 S1003, for which
there already is a quirk, the Acer Switch 10 (SW1-011) has a 800x1280
portrait screen mounted in the tablet part of a landscape oriented 2-in-1.
Thank you very much for taking the time to read this.

here the diff:

170,175d169
}, { /* Acer Switch one 10 (SW1-011) */
.matches =3D {
  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Acer"),
  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Switch One SW1-011"),
},
.driver_data =3D (void *)&lcd800x1280_rightside_up,

regards,
--=20

*Basti=C3=A1n Almendras VenegasIngeniero en ejecuci=C3=B3n en electr=C3=B3n=
ica*
*Universidad del Biob=C3=ADo*
*+56 9 84458240*

--0000000000008e8f520643f1eb8a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div><div><div>Hello, go=
od morning. I&#39;m trying to get my old tablet working properly on Debian,=
 but I&#39;ve had to add some fixes.</div><div>Here&#39;s a commit I create=
d to like the Acer Switch One 10 S1003, for which there already is a quirk,=
 the Acer Switch 10 (SW1-011) has a 800x1280 portrait screen mounted in the=
 tablet part of a landscape oriented 2-in-1.</div></div><div>Thank you very=
 much for taking the time to read this.</div></div><div><br></div><div>here=
 the diff:</div><div><br></div><div><div><div>170,175d169</div><div><span s=
tyle=3D"white-space-collapse: preserve;">	</span>}, {<span style=3D"white-s=
pace-collapse: preserve;">	</span>/* Acer Switch one 10 (SW1-011) */</div><=
div><span style=3D"white-space-collapse: preserve;">		</span>.matches =3D {=
</div><div><span style=3D"white-space-collapse: preserve;">		</span>=C2=A0 =
DMI_EXACT_MATCH(DMI_SYS_VENDOR, &quot;Acer&quot;),</div><div><span style=3D=
"white-space-collapse: preserve;">		</span>=C2=A0 DMI_EXACT_MATCH(DMI_PRODU=
CT_NAME, &quot;Switch One SW1-011&quot;),</div><div><span style=3D"white-sp=
ace-collapse: preserve;">		</span>},=C2=A0</div><div><span style=3D"white-s=
pace-collapse: preserve;">		</span>.driver_data =3D (void *)&amp;lcd800x128=
0_rightside_up,</div></div><div><br></div></div><div>regards,</div><span cl=
ass=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmai=
l_signature"><div dir=3D"ltr"><div style=3D"color:rgb(136,136,136)"><i><b><=
u>Basti=C3=A1n Almendras Venegas</u></b><br>Ingeniero en ejecuci=C3=B3n en =
electr=C3=B3nica</i></div><div style=3D"color:rgb(136,136,136)"><i>Universi=
dad del Biob=C3=ADo</i></div><div style=3D"color:rgb(136,136,136)"><i>+56 9=
 84458240</i></div></div></div></div></div></div>

--0000000000008e8f520643f1eb8a--
