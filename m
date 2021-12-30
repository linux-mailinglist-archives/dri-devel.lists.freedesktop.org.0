Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86231481948
	for <lists+dri-devel@lfdr.de>; Thu, 30 Dec 2021 05:19:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B0BA10E12E;
	Thu, 30 Dec 2021 04:18:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sonic309-15.consmr.mail.bf2.yahoo.com
 (sonic309-15.consmr.mail.bf2.yahoo.com [74.6.129.125])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AD4E10E12E
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Dec 2021 04:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1640837935; bh=3lkLShOsmIFfFJTYQatyr+3Rx5/KGyPuQ7dvBsO//R4=;
 h=From:Subject:Date:To:References:From:Subject:Reply-To;
 b=GzSqBppdN3Zm/K1Ul2VEGNGbl4/gM/MfdIDL12WFWyOV4PSgJNZ3iHfofn4olcNdtszzgQQGb2zS5GahnhDCwQoYCZN2GCbJjCN7gtczQLGXGLpWVFhr7WWuLY/xqUYzRB7CopYsAruBOylbfJFvsh3a9E1y8CUEBd+UeMGAPaf8QPE3gcb3dv/g+bhk8quM4K9++Z90qM7ndtka/vFFVYJNe4wUtQnsXRDKXbA1GJWXue3boCi6slyOmmKVtMx89ArXjV+QV5lTAgGcDzob1k9x+lcjWJJ2PBLnOTLAHQrj/ht+WnFCnTLeO/sUgTryChFUIRbqmrzuXXFEShv1Pg==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1640837935; bh=n8qYtdRWcqbXfiKXUXs3bSGSjGEBGOYCCAFMUwnFL9J=;
 h=X-Sonic-MF:From:Subject:Date:To:From:Subject;
 b=kefJyv1PiT5a6qtc1YvtOXK2S4Vl7G4mqlWvVbLxd/tgqdOVdWsapSW7ch+irlBMEkp4ooZma9ery1nMUvY16bA2txmoqsPWZE9IHcQSphaWzEk4LKWHNR9o1DG14lolikywEqYQQnq1eM+86GoGxbZmgWMDbArx840J8YY+Z21PiCGB6wS+tqdxfcs3gurlMBA50hBYWmZjCrgiXVch3YbU9wOulasLuifSPDy1NemKIAjvIFKGheCDzT/8lUcUKp8VWIj4SSk7n3vyhhxdhS7LZKf5uhl6vnAOa3hbJLDPWt9paVfZSxX17CvIjkWvzDi/WbauXaF/MqkFD7T8NQ==
X-YMail-OSG: ok8AgOIVM1nM2lgfTvwSZyBgv.LpTa.WJ3SXtQIcBkB65c9WjS5p1WAty.Q_aEI
 g4pLAnO0YUCVqmUf4qev.yrbPmlSuhxcqOxEKS9NbGHlaQY7oO1lYNenK44r.4ZaXicaJhSky9q_
 PyoJDo3KhuQFjI0q9jpVBQtmQtR4kSJOPHQ9dMPphTd5WcO2DETfC5OmLoY0.ue3oMIPJzkReRlO
 cbERyZWHUmdXShd2ISbBY024PWqHG0220jql1qebjXsog0XFVrj5xqnY5jgZZi2ah8nFTfWelPJV
 06BaZsWlbreB4EPQtfkrgATaJasX7ksHOgf4Qo6uOlP9JPInudhEHFjVr1E692EcTb7HNnwGC4gr
 yMiqTDTED0Opc8ONuyzMKmmGEbjsVb332lU9To4_1yEX04EyktcmABTXqBK.IlQOoNGzls8ra.dd
 cyMLIu0mwsvctc1JxwNHGSDLdi0DW2V5f8.2vlZMi7nJTB.HR6VfEk_ugb8rJcxOODbB2DUIwE1D
 P1NurqUoNXtHjKPwEqcspBqG765JmTPaqXvYYGAhGVxPwlECF6G.aUEfbnMwhfloQ4umJAOb7M_P
 Y4av.oqcsjGZXa4XlCFXV80NSoanIiApb3D1j9oM2o.YZC1mST9EvP2Q9UOjVSHiDXQdum0C4JP1
 cYUQ1kvSmBo8_ebqIbmQgJbyyC6Ma.JxcjUlfJ2omhwyx0uZ3UxCwoRWyzEVgjh49FWRjxJZfvFg
 23e8lnkDakW6ka5SWlc_o_wtGYf8HGpEj9iF579spGO5joM3Bs6s30u9tsNG8Q.YMajsxKy29cVI
 cwYpaJC7bptANi5aUs31Hhg0SRZSaIY71Ko0oIJAAEZZGjjBq4fpPSLKtKzIwnzCi4hs9lEgRlwb
 RyxLBIu.pFMGuz0K5HH0i4qOR1j4or5MOId3Lc9Np3UGoScoEAsGR7lNx_elBlqqOvJ9LDSsyd2f
 Rv3P58sK10sg_PfDrRZeaLl5DsV7OPHOxKh54jU1q0r0yOmFks9D1deUltuXJXtyqkAPzk.BUlKx
 bIpjQIhszBknjxoTSU8.Vny8gRdrk1ujI.0zA8xfuiiyPHUCr.vRt96gIZl.EofvSZ1y1YqgUeZ_
 CKghW50.Go7_2ZQ2PCPPI5z0Igf3b0SRvOvKKJOrhEi0zKBJtffktmWm33tU4lOdEe3iXSZv5PiO
 4nwmWW2oAsKjuntj9wuf.3zVlsdOia4xSk8xuqzi4sKTzC1pZhyyKnLbsYYhQ5VM8z29zLbeB4q7
 aLhla04hBJu7XUexeZ_4SwHrEf5NWVy7GdnlalxajHjwY41wGM_aix5QuVXR.gYEamhGKHAgkrZe
 RywI8jVIAWrbrkSCqVmQxzVLi0hexMcf.DyxJQMdT.8QAvpKRrm269k7OA0rEjWFcLS1UbI4AFPO
 ic3mXmSab9mGd67MFAOsAsMQ2fcU2ocMstq6HI1aUio7gOxxVoT3HUu6hS4iTPcGq6Q8n2TasClN
 Y9Dn3ea.04LCMbMmIdOqJaoN.Iyzd..9RJY8moG8BtrRWqh9ChJHJ7whMALII2okHAUNN615NlG5
 _XBP04H2X.aCugdi4NcE5pZX5.qu9HKQLMTwhnzjtxN34pZQ6VXutn5C2KFJurwru_0KhAuT93nR
 xRktY5CXnd5gs5QM8C70PFRcMYh31ueEDm0JYQ1mePRs515Uq7VvnpwbIMw7_g3sMBieYuFiluei
 pTKXhdcdtvAg2kYWCwYgDRNuQpmIAd.nFzgoyOnxMzTkNtmalTwcIsFpMuCuiMCXpurQZNCu0xnD
 iiJZRSjHpZab4hgY8ogZ0c7oQY4SF6w67f7CyocxoM2Lns96O1AW3XfZv_rQ9gLBQL8aXu1EuZNj
 SPdAZahSzETHvJhhavBgUJ4SlxMJnfNac6Mi7LLkNG5vANsqDkAAr_KrIvo8pgbhk95GteKfZINQ
 EmjwEPfSxHpMfRlEW0N9Rv93t9jP7v3vhHUOxwkSQ3reTIiDlpMHDTWkqpukGkNOCtAi1UPZ6H8W
 Ou9t0T3MzZOtI3e1gQHTqBELTJxvsVe0Qar8GZlcMHZdIy8c9uKYRBtj.1TIiuzksUSXy9AXUWKz
 MRo4FaduSh6rX6vnH0s1Mz9yEdOO7hIRIz7blOOVV3zTHDjanZDMqg88FdRNKwCoBgNbBH8klCyD
 sjkb5U0KRNQHCoPmTHid4EAW_PBvMf_kx2G5PZiwv4zXjvxZ6xtrulg3LnM4cLebGPxHUH9JZGRD
 1P88-
X-Sonic-MF: <chazste@yahoo.com>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic309.consmr.mail.bf2.yahoo.com with HTTP; Thu, 30 Dec 2021 04:18:55 +0000
Received: by kubenode513.mail-prod1.omega.gq1.yahoo.com (VZM Hermes SMTP
 Server) with ESMTPA ID e0223a7a4bb80b45a7ac0cbf382bb336; 
 Thu, 30 Dec 2021 04:18:53 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary=Apple-Mail-7675B974-E3E2-481A-B3CA-0331D5881F7C
Content-Transfer-Encoding: 7bit
From: Charles Stevens <chazste@yahoo.com>
Mime-Version: 1.0 (1.0)
Subject: Renesas rcar-du and DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE
Message-Id: <FE3831D8-A33F-470B-AD55-6005786139AF@yahoo.com>
Date: Wed, 29 Dec 2021 22:18:50 -0600
To: dri-devel@lists.freedesktop.org
X-Mailer: iPhone Mail (18G82)
References: <FE3831D8-A33F-470B-AD55-6005786139AF.ref@yahoo.com>
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


--Apple-Mail-7675B974-E3E2-481A-B3CA-0331D5881F7C
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

=EF=BB=BF
Hi All,
     I am working on a platform based on the Renesas RZ/G2 SoC family. This c=
hip uses the rcar-du driver for the display. I would like to submit a patch t=
o address the fact that the driver does not check/honor the flag DRM_BUS_FLA=
G_PIXDATA_DRIVE_POSEDGE. My issue is that I would like to make as small a ch=
ange to the driver as possible, but the panel bus_flags don't seem to even m=
ake it to the crtc driver. The crtc driver seems to use adjusted_mode to set=
 the HSYNC and VSYNC polarity and as I said ignores the pixel clock polarity=
 leaving it at the default of driving on the falling edge. In my investigati=
ons so far I have not figured out how to chase the pointers from the CRTC to=
 the bridge to the panel in order to be able to look at bus_flags. My curren=
t approach also modifies the encoder initialization to cache the needed pane=
l and then find the attached encoder during CRTC initialization to find the b=
us flags. This seems like a lot of work and not something that would be acce=
pted as a patch. The OMAP DSS seems to have problems accessing this flag as w=
ell. The TI driver goes so far as to document the current approach as a HACK=
 and suggest a fairly large change to the driver to address the problem. Am I=
 missing something? Is there an easy way to get from a drm_crtc to a drm_pan=
el that is in the same pipeline?=20

    Any pointers would be greatly appreciated!

Thanks!

-charles=

--Apple-Mail-7675B974-E3E2-481A-B3CA-0331D5881F7C
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto"><div dir=3D"ltr">=EF=BB=BF<div class=3D"yah=
oo-style-wrap" style=3D"font-family:Helvetica Neue, Helvetica, Arial, sans-s=
erif;font-size:13px;"><div dir=3D"ltr" data-setdir=3D"false">Hi All,</div><d=
iv dir=3D"ltr" data-setdir=3D"false">&nbsp; &nbsp; &nbsp;I am working on a p=
latform based on the Renesas RZ/G2 SoC family. This chip uses the rcar-du dr=
iver for the display. I would like to submit a patch to address the fact tha=
t the driver does not check/honor the flag&nbsp;<a href=3D"https://elixir.bo=
otlin.com/linux/latest/C/ident/DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE" rel=3D"no=
follow" target=3D"_blank" style=3D"font-family: &quot;Ubuntu Mono&quot;, mon=
ospace; font-size: 0.9em; white-space: pre-wrap; background-color: initial; b=
ackground-position: initial; background-size: initial; background-repeat: in=
itial; background-attachment: initial; background-origin: initial; backgroun=
d-clip: initial; color: inherit; border-radius: 0.2em;"><b>DRM_BUS_FLAG_PIXD=
ATA_DRIVE_POSEDGE</b></a>. My issue is that I would like to make as small a c=
hange to the driver as possible, but the panel bus_flags don't seem to even m=
ake it to the crtc driver. The crtc driver seems to use adjusted_mode to set=
 the HSYNC and VSYNC polarity and as I said ignores the pixel clock polarity=
 leaving it at the default of driving on the falling edge. In my investigati=
ons so far I have not figured out how to chase the pointers from the CRTC to=
 the bridge to the panel in order to be able to look at bus_flags. My curren=
t approach also modifies the encoder initialization to cache the needed pane=
l and then find the attached encoder during CRTC initialization to find the b=
us flags. This seems like a lot of work and not something that would be acce=
pted as a patch. The OMAP DSS seems to have problems accessing this flag as w=
ell. The TI driver goes so far as to document the current approach as a HACK=
 and suggest a fairly large change to the driver to address the problem. Am I=
 missing something? Is there an easy way to get from a drm_crtc to a drm_pan=
el that is in the same pipeline?&nbsp;</div><div dir=3D"ltr" data-setdir=3D"=
false"><br></div><div dir=3D"ltr" data-setdir=3D"false">&nbsp; &nbsp; Any po=
inters would be greatly appreciated!</div><div dir=3D"ltr" data-setdir=3D"fa=
lse"><br></div><div dir=3D"ltr" data-setdir=3D"false">Thanks!</div><div dir=3D=
"ltr" data-setdir=3D"false"><br></div><div dir=3D"ltr" data-setdir=3D"false"=
>-charles</div></div></div></body></html>=

--Apple-Mail-7675B974-E3E2-481A-B3CA-0331D5881F7C--
