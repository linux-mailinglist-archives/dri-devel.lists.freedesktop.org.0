Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B43B481E7A
	for <lists+dri-devel@lfdr.de>; Thu, 30 Dec 2021 18:17:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B64710E236;
	Thu, 30 Dec 2021 17:17:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sonic312-21.consmr.mail.bf2.yahoo.com
 (sonic312-21.consmr.mail.bf2.yahoo.com [74.6.128.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 359E010FC6B
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Dec 2021 21:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1640640310; bh=AZu+3oBhyQ6RQbpVZa5JMSwjQ4rExhRVBCKzphK+jHk=;
 h=Date:From:To:Subject:References:From:Subject:Reply-To;
 b=HUgQyv9zrJ/B/M1xiHACh/dmqaxwkkFNdlPvZChqQBH6iEMmajHJnqpMysl5+9qkQDFZlWTwZ1iwZZVBiMPWJfUJKRmeTdinKd+KukTF1745uaMRAXfByziHK+0OII8+9N8XjODKyiIg9RFxMZnUHKgjBhkTqYlXU3ugjbCUEvwK2JzMOBSd+a+9Y7Cl6pQ78GRJWN07/oyYZVJQ+aCz+TLRAMN6GklbkjfcmBlOD15l1TZfZuXBr5jeV4/O0hnPnuBHBYEO1sOorlsf2z1m4n2vjtyFd3b9EJ/EnlWGIHKm8U4XZznUbCe3HCSM8UdNtqvohsczHydJFUkIUtnJ+g==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1640640310; bh=n4YhZsrhoJFr002FFtUtoi6hP2WCyhvjDX2rU7NxeRP=;
 h=X-Sonic-MF:Date:From:To:Subject:From:Subject;
 b=YAThDwvCv8wfkz2r9NZn//opaf967jPdQgguB6p0eatXX6+DeFM/YHTP8D0oPopN3o5jzKiqGWpUpIgYrVWDtl2FElstS55or3I70W0mMww71WeHk3jWuZYWyYAFhtjr7xv3oU+QhTK/xyTvSFNTLU1cpZ7Txw1QWpnzXMQ2+f4Kh8D9jA9JJYwaHX1BUofgm4pxUv9vR8JZVi3DcvGT54QakX0v4gTbO3Oz3cBpRKJu+dhpcY4S/5pADiQv1igcWtzLJ6JkolH/Kc7eS9ja7nP7Z7kl76k6FSoQTD4x/rRRaP/FgAFKpSeT7EV4gUxsbGFYCHm7CDnGZ6tQt0Tnig==
X-YMail-OSG: hDIJUr0VM1mTKx0oscu8q9MPh1ssRVDvmhSbtAOrP6LUfk4QowKYtBNTcORKkWC
 Rw.UoU1VuT2nEJARrz_860ZP6kpOLb99cBZ4TB6G8hrEWxOIeO047I3LJqO3WtHZzDYq8JZo2MIU
 9bkDoqkLckJuFvTCmsdwSOPNRRLFJ3LyrjVfGICoesa2QDwylt4ilz6O48KRRJcS5iNn2zD1JQY8
 szlWMuodwGLGTPJYiFU_FvFCzcFrXl3z9Ck2px0ytqgswFnuqK.1CW5rZK7jHMRRjizWLbb3btIU
 d_Hu6.9ZA0qiy6ty7LVPpyFa4q_d_6Rs5I_nh6_zGqU1Cj0WukidMINYhBxDyWyvqtgkd6Hk_23B
 A11.wB70I8Ln9l7p75E6P0Oo64PdCNJ5lcDCTdmoloFX2nk.PNLZ1_.DlD7YNBtkEDwg95MX4nXc
 lKlH3DEE_Trx5yZwF0xn3rpj0CWQbu_Z1kfn8GS.LoJVlhL0hO9diyq0o6u7YPazyqC0Zyv6xRNS
 nROHhb.JF07EZxhne5N..k5gIvrKQ7UBOWvbo82bYuLSmnMwAwI_KVp5yCbMBZVRxTIfPV8vV_Tj
 xtWd6J3TU0f0phZ7QWgjGWeHtSWJnaCvF9hG8QJNnxwrs4mdHdMfhm_htqZKo3K1x7UrQqtAJFmZ
 nREWCjpZI54vsO2.aeOKSpyPSThf1iwCptyP1EIDaI89eFlJoVeE8788fkfJXK6WAVtHA7.HUgxv
 _0bxdDAnMkRkM_XftN3KQpeGB0_9i8uppLVHqDtaT1z4UW7Y8nsfbbeCDVW5Fpdqa.lKa3cU9iKI
 cD8Z3h9zYHh736WNPmMi9vgGptVXUZRFf7w3FBect39Ww5Rl1DmZkpgr7RL5KzJE_uRJu3V4UJ9O
 TuPlvIf59a5gug_QqXd8RZ5dI7Tr7g.4yHsEEjpEO4vhXMqm.BEtl6mX7JlwjhOh69LSr47_oMcZ
 yg0KI35tRjLR66XR4UZR_TqWtjCf3cEFNjJJLNafpdZPbn4YEImaqV0C634vUv3_7i1j4UcF3Koo
 lVPqvvenCsDxR9UKQz9SdZBaDVufoM8ayBZFNLyf12N7G9DRow7ELxGB96kyXLUJE8IMkYbBPiup
 WKSgVfLxzlhZR8cqKxIR43NYhreLVjfkKbWRhIfKHVWi2D5qgv5KLSEOoaXGyvW.bbbFFDVhG20A
 N9mRtp23yfi9gDoDV0Sc03pSzn9E6Nho5MPGPscZOvZaConUAc6kS0f0zj5Itw1jOdSMaV81dIis
 nh_GUytqkqIFGOUDPu8rqJBZAP9.atA6Zjm2s2RZH.LxGF_mWzoFDZtSqYaIPRgpAoP2zYAZXXDx
 sNjSGWToQrWR23iEzIYMPVVw8PggJw4ydAFGj9gggcVJjzRXnmmu0voz6mBLvp6IWg6BqfmH5VCI
 cuOr8rPWFf.EJnkYh7xK3yHhhnLd_Bwyg.oovUoz_V39JOc9XM4eVYzSx2k8_Hr.DKHA5txcJrGm
 YoRzIA3kxCv_OYVWQyLgVhl4RN7bTBjCZL9bpmc8drUqwEw2pgZZHWEn0TeC7oUJYQTnAaYdCFM7
 L8N2BaABRTiHU2oK8fNAF37RtZukN2wXe8mPUsetflpeVFkOHsxveZA952a5uiF1FLmr5bVDVLZZ
 0rpcDIq9K3P921r9Xod.BCvI4O.2wH0529Oo7wLE1CO6IHkVWAcCWWhg0r2vOue4S9os5g5PJozG
 4bx17TUpQ2BYD2N4ThC64N1YuTHcpOmJQMx9nZd_xqjlPxx.P7ULiS5T9ACnkf75OLRdEZwx9NzV
 xsFEfzCpW64p.CGuCIYErlw3GqlzG2ITfYe2Lwvjd6XBwFVxJMJi2LBsxMnEDzqosQO0tRA1z23D
 AZNYOst9UNu._hKMSHhAAxKMZzuJyilW3O4VQh7Wit3KAK3uZSTfv9HaAcnVmxKMoKT7rOXXd3Be
 voNfCahcmUlxvcVHrliUcB_eu3IKKp8VaBH1AV0TD0IRdDyMZtR5uyQ50BF5lC5lCyuRAUix3yUE
 4zYTUdfo.0QIdTWwv3W_P9utPiG1STW8VPjDTYHPEI7TzjXPelYDurJ3AznGjzwTTwHBgu3t2XjV
 xptnJImEGDFheLFtexEQxRR602L3v268eDpFws9IAd_A_S0NRTLzFlNtG4OYL1yf_61oARidoBPR
 6M7q0YloOHjaxJ7R7YDG47jFR
X-Sonic-MF: <chazste@yahoo.com>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic312.consmr.mail.bf2.yahoo.com with HTTP; Mon, 27 Dec 2021 21:25:10 +0000
Date: Mon, 27 Dec 2021 21:24:42 +0000 (UTC)
From: Charles Stevens <chazste@yahoo.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Message-ID: <1447972770.1013185.1640640282374@mail.yahoo.com>
Subject: Renesas rcar-du and DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE
MIME-Version: 1.0
Content-Type: multipart/alternative; 
 boundary="----=_Part_1013184_1748114199.1640640282373"
References: <1447972770.1013185.1640640282374.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.19498 YMailNorrin
X-Mailman-Approved-At: Thu, 30 Dec 2021 17:17:01 +0000
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

------=_Part_1013184_1748114199.1640640282373
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi All,=C2=A0 =C2=A0 =C2=A0I am working on a platform based on the Renesas =
RZ/G2 SoC family. This chip uses the rcar-du driver for the display. I woul=
d like to submit a patch to address the fact that the driver does not check=
/honor the flag=C2=A0DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE. My issue is that I=
 would like to make as small a change to the driver as possible, but the pa=
nel bus_flags don't seem to even make it to the crtc driver. The crtc drive=
r seems to use adjusted_mode to set the HSYNC and VSYNC polarity and as I s=
aid ignores the pixel clock polarity leaving it at the default of driving o=
n the falling edge. In my investigations so far I have not figured out how =
to chase the pointers from the CRTC to the bridge to the panel in order to =
be able to look at bus_flags. My current approach also modifies the encoder=
 initialization to cache the needed panel and then find the attached encode=
r during CRTC initialization to find the bus flags. This seems like a lot o=
f work and not something that would be accepted as a patch. The OMAP DSS se=
ems to have problems accessing this flag as well. The TI driver goes so far=
 as to document the current approach as a HACK and suggest a fairly large c=
hange to the driver to address the problem. Am I missing something? Is ther=
e an easy way to get from a drm_crtc to a drm_panel that is in the same pip=
eline?=C2=A0
=C2=A0 =C2=A0 Any pointers would be greatly appreciated!
Thanks!
-charles
------=_Part_1013184_1748114199.1640640282373
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html><head></head><body><div class=3D"yahoo-style-wrap" style=3D"font-fami=
ly:Helvetica Neue, Helvetica, Arial, sans-serif;font-size:13px;"><div dir=
=3D"ltr" data-setdir=3D"false">Hi All,</div><div dir=3D"ltr" data-setdir=3D=
"false">&nbsp; &nbsp; &nbsp;I am working on a platform based on the Renesas=
 RZ/G2 SoC family. This chip uses the rcar-du driver for the display. I wou=
ld like to submit a patch to address the fact that the driver does not chec=
k/honor the flag&nbsp;<a href=3D"https://elixir.bootlin.com/linux/latest/C/=
ident/DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE" rel=3D"nofollow" target=3D"_blank=
" style=3D"font-family: &quot;Ubuntu Mono&quot;, monospace; font-size: 0.9e=
m; white-space: pre-wrap; background-color: initial; background-position: i=
nitial; background-size: initial; background-repeat: initial; background-at=
tachment: initial; background-origin: initial; background-clip: initial; co=
lor: inherit; border-radius: 0.2em;"><b>DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE<=
/b></a>. My issue is that I would like to make as small a change to the dri=
ver as possible, but the panel bus_flags don't seem to even make it to the =
crtc driver. The crtc driver seems to use adjusted_mode to set the HSYNC an=
d VSYNC polarity and as I said ignores the pixel clock polarity leaving it =
at the default of driving on the falling edge. In my investigations so far =
I have not figured out how to chase the pointers from the CRTC to the bridg=
e to the panel in order to be able to look at bus_flags. My current approac=
h also modifies the encoder initialization to cache the needed panel and th=
en find the attached encoder during CRTC initialization to find the bus fla=
gs. This seems like a lot of work and not something that would be accepted =
as a patch. The OMAP DSS seems to have problems accessing this flag as well=
. The TI driver goes so far as to document the current approach as a HACK a=
nd suggest a fairly large change to the driver to address the problem. Am I=
 missing something? Is there an easy way to get from a drm_crtc to a drm_pa=
nel that is in the same pipeline?&nbsp;</div><div dir=3D"ltr" data-setdir=
=3D"false"><br></div><div dir=3D"ltr" data-setdir=3D"false">&nbsp; &nbsp; A=
ny pointers would be greatly appreciated!</div><div dir=3D"ltr" data-setdir=
=3D"false"><br></div><div dir=3D"ltr" data-setdir=3D"false">Thanks!</div><d=
iv dir=3D"ltr" data-setdir=3D"false"><br></div><div dir=3D"ltr" data-setdir=
=3D"false">-charles</div></div></body></html>
------=_Part_1013184_1748114199.1640640282373--
