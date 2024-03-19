Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58DEE87FD2C
	for <lists+dri-devel@lfdr.de>; Tue, 19 Mar 2024 12:50:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1562910FA18;
	Tue, 19 Mar 2024 11:50:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=kapsi.fi header.i=@kapsi.fi header.b="NeZtWqFo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 2727 seconds by postgrey-1.36 at gabe;
 Tue, 19 Mar 2024 11:50:42 UTC
Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C77510FA19
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Mar 2024 11:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Subject:References:Cc:To:Message-ID:From:
 Content-Transfer-Encoding:Content-Type:Date:MIME-Version:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hqNvcnOHaosVevdOhD4ehWiyHbdebFeC+o+lc/LFjDE=; b=NeZtWqFoMsihJQtEgteCfePfU/
 GlvXlpjtsV6fzVEFN/R1GUVLiXxE2z54MF5Xxl/VnpQXUK45UIXDo7KopLODSOzOD0yT64G79quAd
 OLVbQgn9IByJNd7vtlmjhmTiFklo9Jso/PVyO6ytWLJC9x5QkxT74p6VIaC1cW7e1WAm21dMS7cma
 J+VrcTNApnYnfYrlLSGVbi6CTiW26Kp5upEAzBjKdHJ/Uq6egz90YngtZVr1sTg2iu+3lrfH2Sibq
 1N6P6BpHX2IL5rDlNG2OwT0lzsNlPi5HELgS9bY7toYuhqfhUaGRU6esB9s2otAMwIAqzusHxqMHr
 fzBbUzgQ==;
Received: from [2001:67c:1be8::200] (helo=rainloop.kapsi.fi)
 by mail.kapsi.fi with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <sarha@kapsi.fi>) id 1rmXHG-001U2c-2b;
 Tue, 19 Mar 2024 13:05:07 +0200
MIME-Version: 1.0
Date: Tue, 19 Mar 2024 11:05:06 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
From: sarha@kapsi.fi
Message-ID: <60505d851dabcb597c5c4c1e7f76e859ff5d05a9@kapsi.fi>
To: "Frej Drejhammar" <frej.drejhammar@gmail.com>, "Kevin Hao"
 <haokexin@gmail.com>
Cc: dri-devel@lists.freedesktop.org, "Jyri Sarha" <jyri.sarha@iki.fi>,
 "Tomi  Valkeinen" <tomi.valkeinen@ideasonboard.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Daniel Vetter" <daniel@ffwll.ch>,
 "=?utf-8?B?TWHDrXJhIENhbmFs?=" <mcanal@igalia.com>
References: undefined <20240317033918.535716-1-haokexin@gmail.com>
X-SA-Exim-Connect-IP: 2001:67c:1be8::200
X-SA-Exim-Mail-From: sarha@kapsi.fi
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on mail
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00,
 T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=4.0.0
Subject: Re: [PATCH] drm/tilcdc: Set preferred depth
X-SA-Exim-Version: 4.2.1 (built Wed, 06 Jul 2022 17:57:39 +0000)
X-SA-Exim-Scanned: Yes (on mail.kapsi.fi)
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

March 17, 2024 at 9:18 PM, "Frej Drejhammar" <frej.drejhammar@gmail.com m=
ailto:frej.drejhammar@gmail.com?to=3D%22Frej%20Drejhammar%22%20%3Cfrej.dr=
ejhammar%40gmail.com%3E > wrote:
>=20
>=20Hi Kevin,
>=20
>=20Kevin Hao <haokexin@gmail.com> writes:
>=20
>=20>=20
>=20> But after kernel commit c91acda3a380, the FB will not be created
> > successfully due to the check of the valid pixel format. Then the bpp
> > is set to 24, but the 'depth =3D 16' and 'bpp =3D 24' combo is not a =
valid
> > pixel format.
> >=20
>=20> Fix this issue by explicitly setting the preferred_depth in this dr=
iver.
> > With this change, the modesetting driver would choose the correct
> > depth/bpp combo based on our setting in xorg.conf.
> >=20
>=20
> Check the fix in [1], with it not only does the X-server work with a
> color depth of 16 bits, it also enables the use of a 24 bit color depth=
.
>=20
>=20As I'm the author of the solution in [1] I'm partial to it as it is a
> more general solution to the regression. I have no standing in this
> community as [1] is my first contribution to the DRM system, but if I
> had, I would NAK this patch as it only fixes the regression for one
> driver and does not enable the use of a 24 bit color depth which is
> something the hardware is capable of.
>=20
>=20Best regards,
>=20

So=20the trouble here is the 16bpp and 24/32bpp color wiring being crosse=
d, right? I'd just like to remind that there is another option to overcom=
e the issue by editing device tree files. The current configuration from =
some 8 years back supports RG16, BG24, and XB24 formats, but on Beaglebon=
e-Black its possible - thanks to tda998x - change the support to BG16, RG=
24, and XR24, by changing these lines before building a new dtb-file:

Change value of blue-and-red-wiring to "crossed" here:
https://github.com/torvalds/linux/blob/b3603fcb79b1036acae10602bffc4855a4=
b9af80/arch/arm/boot/dts/ti/omap/am335x-boneblack-hdmi.dtsi#L61

and comment this this line:
https://github.com/torvalds/linux/blob/b3603fcb79b1036acae10602bffc4855a4=
b9af80/arch/arm/boot/dts/ti/omap/am335x-boneblack-hdmi.dtsi#L82

There is also the option of removing the blue-and-red-wiring property all=
 together if one does not really mind about the colors. In this case the =
driver reports the formats RG16, RG24, and XR24 being supported, despite =
the colors being wrong in either 16-bit or 24-bit color modes.

Please let me know If Frej's patch does not make it (I am not in CC and I=
 do not have the bandwidth to follow dri-devel), and I will merge Kevin's=
 patch through drm-misc-next.

Best regards,
Jyri

> --Frej
>=20
>=20[1] https://lore.kernel.org/all/e7ef6d422365986f49746b596735f7a0b9395=
74d.1710698387.git.frej.drejhammar@gmail.com/
>
