Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DCFCC68233
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 09:12:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7490110E104;
	Tue, 18 Nov 2025 08:12:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="VtRBh2H/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DC8D10E3AB
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 12:15:45 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id
 46e09a7af769-7c750b10e14so592935a34.2
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 04:15:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763381744; x=1763986544; darn=lists.freedesktop.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=4WnJAjOb5m7GcYv5bBgvWQxHWZC+fRcGfI2RHiGRXkw=;
 b=VtRBh2H/XHQyCcrCkQWIXXEaK72zSNumzc9T+qfL61iOZt1Z3sh+wTSIE2epff24uW
 qH21ochPbKzzaE90rXu6isLu94iPS0HUHIhga+Y1fIF+a/cAxS9462lvyBbG5gBhdML1
 shYE8EdFPXMgWzDqI9AWaZxt8Tqqz8Qi9xF30XGsJqQmRlV5MkKyswLqGp5nMKS5g9cU
 wTr2nLZNLxi4FQXz0c+Sr3GanvkU5fwYon6GdrP26ppadXh/nwqUGCWeEal+NNt7m8n3
 GlRVz+7tp2hr4bRvhGO9bfH1gd6vrMIa1qDMvMcHHOQp8B4zRALjtCqaNbCuqGg1ymGJ
 5dyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763381744; x=1763986544;
 h=to:subject:message-id:date:from:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4WnJAjOb5m7GcYv5bBgvWQxHWZC+fRcGfI2RHiGRXkw=;
 b=d/xYYH4CyDfMiEze06oz+9ak2FpFLqofPmO3/YCGStOP3hvSrMdoqpTGyolOGxyZip
 wktaRgDi6U7+SnobE7xU/BirelXtg77C2ArOIKOM4eQARx+tOe6VRrq+0fNsJP0j4L2w
 GBzeY5I+jbavLX1GPnvj/pultku/P7SW4enWhO4VOWRjUFFIkn2j7kiU0SeNC3dUVGD6
 cID/ZOg0bFxWOELR4SUbvoxuzuj4V0CINkdJGbBzHEd66bMWw2Of/8EeGZ3Dqr6OHUNz
 uTbMmeVixjp/6SiNXhM9ZByyzNvShw80dnPdMdB8SBslEr2F8k1gaECTi8d6it4wTnOR
 u8ww==
X-Gm-Message-State: AOJu0YwjMCom1Mmkd0paSYKdYDgXlar0syz8i2GtOw4YYl3ue/p0RcuY
 AzDlbC2MtB6Id8tW1+SEW1FvWZicxNcqoz/0URPqCH4usNRUjgLfqoi9X+217eoNuUDpL/H05G4
 JDXp702vTHOTFs5OMEPWBrA3r7tbejkYtWPQMGfw=
X-Gm-Gg: ASbGncueV1s256rDTgmgMaWj+kkRx6nQ7KycqXP4VlIbjjiyipnHRRZc2YGQR8C5mIu
 vYPKEPOLyzB+wm7Yhp7mkJ8hiluZUKPuHodQe9LJupiRBhMAmclRRwku0Cz6uWBs9c1nx0gJNH1
 DvJ7tbYHvjTHaBsRayBS5JYlkbhZUR/3ikTveKQvtkCZZkPFIQeS5/HiPHKQ22oqZwvJcdgVwuG
 WBSDB63NGHoFkCQN/bZYG3Gkmrx+iooBRfAY5c5yhCfye+68IBhwsrIBqucR/QtUYf/ZiGFSqi5
 3LwIyK8JDoLnCxQsMZZ52LwePe1ixtDHBqj63oU=
X-Google-Smtp-Source: AGHT+IHvPo7kWKHVs8G0dbog5gKNsF296xNsIHuDj/aF718r8F2u62k2zmXSNYSxcOVTs1+wDRVjM40SdiYt3NHgDQU=
X-Received: by 2002:a05:6808:3a16:b0:450:cb93:69ef with SMTP id
 5614622812f47-450cb93799cmr1205534b6e.56.1763381743847; Mon, 17 Nov 2025
 04:15:43 -0800 (PST)
MIME-Version: 1.0
From: =?UTF-8?Q?Basti=C3=A1n_Almendras?= <bastian.almendras96@gmail.com>
Date: Mon, 17 Nov 2025 09:15:31 -0300
X-Gm-Features: AWmQ_blXwGpNR1KwP5GVoi1Vf1Xn02G7_0N_ry__lED401WsSqT6o0Hw4VrbbsI
Message-ID: <CABuR8mur0cMvJ4PZa7-uE75zbRQ9U7mKKSPFgoWHf=gxiNU-Ag@mail.gmail.com>
Subject: drm: panel-orientation-quirks: Add quirk for Acer Switch One 10
 (SW1-011)
To: dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="00000000000072247f0643c94eb7"
X-Mailman-Approved-At: Tue, 18 Nov 2025 08:12:21 +0000
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

--00000000000072247f0643c94eb7
Content-Type: multipart/alternative; boundary="00000000000072247e0643c94eb5"

--00000000000072247e0643c94eb5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello, I'm sending the diff patch to add this feature to my PC, which was
made for me.

170,175d169
}, { /* Acer Switch one 10 (SW1-011) */
.matches =3D {
  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Acer"),
  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Switch One SW1-011"),
},
.driver_data =3D (void *)&lcd800x1280_rightside_up,

https://github.com/CypherNoodle/linux-sunxi/commit/c03dc4de6455c429699d5c4d=
b4ca05a1571dbe1b

Regards,
--=20

*Basti=C3=A1n Almendras VenegasIngeniero en ejecuci=C3=B3n en electr=C3=B3n=
ica*
*Universidad del Biob=C3=ADo*
*+56 9 84458240*

--00000000000072247e0643c94eb5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div><d=
iv>Hello, I&#39;m sending the diff patch to add this feature to my PC, whic=
h was made for me.</div></div><div><br></div><div><div>170,175d169</div><di=
v><span style=3D"white-space:pre">	</span>}, {<span style=3D"white-space:pr=
e">	</span>/* Acer Switch one 10 (SW1-011) */</div><div><span style=3D"whit=
e-space:pre">		</span>.matches =3D {</div><div><span style=3D"white-space:p=
re">		</span>=C2=A0 DMI_EXACT_MATCH(DMI_SYS_VENDOR, &quot;Acer&quot;),</div=
><div><span style=3D"white-space:pre">		</span>=C2=A0 DMI_EXACT_MATCH(DMI_P=
RODUCT_NAME, &quot;Switch One SW1-011&quot;),</div><div><span style=3D"whit=
e-space:pre">		</span>},=C2=A0</div><div><span style=3D"white-space:pre">		=
</span>.driver_data =3D (void *)&amp;lcd800x1280_rightside_up,</div></div><=
div><br></div><div><a href=3D"https://github.com/CypherNoodle/linux-sunxi/c=
ommit/c03dc4de6455c429699d5c4db4ca05a1571dbe1b">https://github.com/CypherNo=
odle/linux-sunxi/commit/c03dc4de6455c429699d5c4db4ca05a1571dbe1b</a></div><=
div><br></div><div>Regards,</div><span class=3D"gmail_signature_prefix">-- =
</span><br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><div=
 style=3D"color:rgb(136,136,136)"><i><b><u>Basti=C3=A1n Almendras Venegas</=
u></b><br>Ingeniero en ejecuci=C3=B3n en electr=C3=B3nica</i></div><div sty=
le=3D"color:rgb(136,136,136)"><i>Universidad del Biob=C3=ADo</i></div><div =
style=3D"color:rgb(136,136,136)"><i>+56 9 84458240</i></div></div></div></d=
iv></div></div></div>

--00000000000072247e0643c94eb5--

--00000000000072247f0643c94eb7
Content-Type: text/plain; charset="US-ASCII"; name="diff_drm_panel_orientation_quirks.txt"
Content-Disposition: attachment; 
	filename="diff_drm_panel_orientation_quirks.txt"
Content-Transfer-Encoding: base64
Content-ID: <f_mi33whis0>
X-Attachment-Id: f_mi33whis0

MTcwLDE3NWQxNjkKPCAJfSwgewkvKiBBY2VyIFN3aXRjaCBvbmUgMTAgKFNXMS0wMTEpICovCjwg
CQkubWF0Y2hlcyA9IHsKPCAJCSAgRE1JX0VYQUNUX01BVENIKERNSV9TWVNfVkVORE9SLCAiQWNl
ciIpLAo8IAkJICBETUlfRVhBQ1RfTUFUQ0goRE1JX1BST0RVQ1RfTkFNRSwgIlN3aXRjaCBPbmUg
U1cxLTAxMSIpLAo8IAkJfSwgCjwgCQkuZHJpdmVyX2RhdGEgPSAodm9pZCAqKSZsY2Q4MDB4MTI4
MF9yaWdodHNpZGVfdXAsCg==
--00000000000072247f0643c94eb7--
