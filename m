Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FF0A585CD8
	for <lists+dri-devel@lfdr.de>; Sun, 31 Jul 2022 03:55:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 836C610E131;
	Sun, 31 Jul 2022 01:55:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8249E10E131
 for <dri-devel@lists.freedesktop.org>; Sun, 31 Jul 2022 01:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1659232515;
 bh=uHnOYdvfdr9ZZr+cT2mHOuhF4dXZohJsAIQPPgzE8Pg=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=M/6K12FxvlOa0Qcxdrxn4HR9AXnwkRGw+ya0EyH/2KGOQ8toj4xJdkYC9phG1zNAT
 c452GkdYsH8dAKLuOK2E/jtVcKyDZPPLOCbcol+Yh5UtoDoeZSGoljamjhGI188rmf
 yLNgmqCv/Ntckij/+gDww+/3Md1fdp2TODvTfPw0=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [68.251.140.185] ([68.251.140.185]) by web-mail.gmx.net
 (3c-app-mailcom-bs13.server.lan [172.19.170.181]) (via HTTP); Sun, 31 Jul
 2022 03:55:15 +0200
MIME-Version: 1.0
Message-ID: <trinity-d0a1eb01-acf2-44a3-a102-c41969f7ab5a-1659232514872@3c-app-mailcom-bs13>
From: Kevin Brace <kevinbrace@gmx.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v3 31/32] drm/via: Add Makefile
Content-Type: text/plain; charset=UTF-8
Date: Sun, 31 Jul 2022 03:55:15 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <01d9f4a3-0c92-f5e2-c8f2-e6dded0b6ae8@suse.de>
References: <20220725235359.20516-1-kevinbrace@gmx.com>
 <20220725235359.20516-12-kevinbrace@gmx.com>
 <01d9f4a3-0c92-f5e2-c8f2-e6dded0b6ae8@suse.de>
Content-Transfer-Encoding: quoted-printable
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:EEirSS1FAwbmPHgUOOon8F30MzHWdBBYoIfuZLKkMh2mTg905kyrCxFqlPknzOJn4zOWh
 Lgo2Y81pDXHB7vmOTKfb/MNlpsqFnuUxAS/I4Mwgk7GbJ0x8f1bg0IeV/smraBeVvllqO/bwTeXi
 3vf8MMnun/opwIhbskDT3zTyz+3eF8pXTNspRfDF636Kb0RiBv+Q8BbILaSx4ep6gBko2d5g+cC2
 6i6C6UHfp+RZyWvVsXnphUXZWVGK+hDazJ95jflrGNPsNwYIYj/oQi4lUymFJ5vdcEzQOlwNOfbo
 q8=
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Uv/p2OQsoYs=:dXcVSt80YqcYkNVREq4NTf
 HeHmoG9ASZA1vLZilVIZFHZ0AIyMJvPylGQEUjeZhAwBsG0SSgHEpIJOloAMbtiDv1qYID6XN
 4x8LLWyGxN5eMHIbH/WlrWKe9Mff/FtWjN+4Z11xG59pOpbj02YqKHyhKCsNpazq0Oe6xgMQl
 oJUsSMhBOvCDXNlauwzPVQQOmBwGzr1lvYl9MOfD/4VaaGPTxyX6s5MYU3rsATF3aKqlVHMTa
 u6Ea4PwJ7qDuhoXn5ewb/f1cQ0KUsDZAo7QWROjTtQ9sMW2eDxn4vUw2cNDi66P8Rwsx8eoYS
 wKfhyzdMtHxlNV3ryKFP7qJLWT71rQzxY16UY9ODxnLLW1GF31xTEIH0Xxi7gvEDjs/LdK/MU
 L5lwQTqrMYGHt8elmp100frHAQVgPt2gFVBMwDgK6nRhCvsT53txcg2HjftWfJfeMCs4PELPi
 LbbzyJ3MVueRe+6Usg55/tHPb+CQBGLojsP6AgIiJ5XzhMZLgcgr1MvD3Z9/jNWy7JoviP0HT
 LWXAgsXv4gIACnNUbR9fumeu4a4fT/Vcp4wm92FSIS5u0BOX1jP+nip0K5vU0lRnCgbBjIZjI
 vMFGXB7B/BoWItRGjWudqM76m2hYPwYkICCyLOuKvR+4mXaZ/+GJFAIbCLAJQJHZRlWqnvmvq
 faef+e3bzHK8WF0Y7bSrAsdKIjb0TA6Z8zxzM5nn+cRZUQG6N+IEleQ+5EdyQODm/eLwGmS/G
 9+mXZenW1rZe+d9i6cC9Ty1iknrgZqtOx1kL4WnVCN23QEDNxt4u7koKARnXgJfQDr/t2SY5U
 12VU4f6
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

Okay, I will try to remember this=2E

Regards,

Kevin Brace
Brace Computer Laboratory blog
https://bracecomputerlab=2Ecom


> Sent: Tuesday, July 26, 2022 at 12:29 AM
> From: "Thomas Zimmermann" <tzimmermann@suse=2Ede>
> To: "Kevin Brace" <kevinbrace@gmx=2Ecom>, dri-devel@lists=2Efreedesktop=
=2Eorg
> Cc: "Kevin Brace" <kevinbrace@bracecomputerlab=2Ecom>
> Subject: Re: [PATCH v3 31/32] drm/via: Add Makefile
>
> Hi
>=20
> Am 26=2E07=2E22 um 01:53 schrieb Kevin Brace:
> > From: Kevin Brace <kevinbrace@bracecomputerlab=2Ecom>
> >=20
> > Signed-off-by: Kevin Brace <kevinbrace@bracecomputerlab=2Ecom>
>=20
> I suggest to merge patches 30, 31 and 32 into one to make it easier to=
=20
> review=2E
>=20
> Best regards
> Thomas
>=20
> > ---
> >   drivers/gpu/drm/via/Makefile | 26 ++++++++++++++++++++++++++
> >   1 file changed, 26 insertions(+)
> >   create mode 100644 drivers/gpu/drm/via/Makefile
> >=20
> > diff --git a/drivers/gpu/drm/via/Makefile b/drivers/gpu/drm/via/Makefi=
le
> > new file mode 100644
> > index 000000000000=2E=2E73ccacb4cd11
> > --- /dev/null
> > +++ b/drivers/gpu/drm/via/Makefile
> > @@ -0,0 +1,26 @@
> > +#
> > +# Makefile for the drm device driver=2E  This driver provides support=
 for the
> > +# Direct Rendering Infrastructure (DRI) in XFree86 4=2E1=2E0 and high=
er=2E
> > +
> > +ccflags-y :=3D -Iinclude/drm
> > +via-y :=3D via_crtc=2Eo \
> > +		via_crtc_hw=2Eo \
> > +		via_cursor=2Eo \
> > +		via_dac=2Eo \
> > +		via_display=2Eo \
> > +		via_drv=2Eo \
> > +		via_encoder=2Eo \
> > +		via_hdmi=2Eo \
> > +		via_i2c=2Eo \
> > +		via_init=2Eo \
> > +		via_ioctl=2Eo \
> > +		via_lvds=2Eo \
> > +		via_object=2Eo \
> > +		via_pll=2Eo \
> > +		via_pm=2Eo \
> > +		via_sii164=2Eo \
> > +		via_tmds=2Eo \
> > +		via_ttm=2Eo \
> > +		via_vt1632=2Eo
> > +
> > +obj-$(CONFIG_DRM_OPENCHROME)	+=3D via=2Eo
> > --
> > 2=2E35=2E1
> >=20
>=20
> --=20
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr=2E 5, 90409 N=C3=BCrnberg, Germany
> (HRB 36809, AG N=C3=BCrnberg)
> Gesch=C3=A4ftsf=C3=BChrer: Ivo Totev
>
