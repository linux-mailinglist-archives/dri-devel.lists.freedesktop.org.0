Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 019447D8FA
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2019 12:05:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42C806E453;
	Thu,  1 Aug 2019 10:05:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B74146E44E;
 Thu,  1 Aug 2019 10:05:07 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id t28so68766646lje.9;
 Thu, 01 Aug 2019 03:05:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=qvdkbdV6sNEZfwB1qmYYdKipaAw3M7SMSsECBN25X00=;
 b=LfJDS2XKxU65cRMa4mvAjKNvPBS14ipAKiTf+/LOEorp7nTZZiVbgfZ9AbhDsSBkqx
 MTxWx4RpgvpjmrUCUSSACP1RfYwehF+XAXxLaKhsLcA9F5oQM3OQnJgdb84rATcBIeCS
 CGckEMaTrh4zhHHFujeHpyQKMCyXJjKXM7UFb+pkxyjZNfs9edPNvKb2pJZ8uRXoS8mq
 G2+xBUBiO4QLp/77NHV8g53iNMSbcyrp8dxWzJ5wZset18EqAO1JDcJt1oEv4rr95Lhf
 0hmy7HKeKqt6OXbVDQKX53ynU2DmpdrLH032M4vgcmDW9s7dyjTrS/0QXbQxqU1XqUkS
 TJKQ==
X-Gm-Message-State: APjAAAXkxQLPmVigb65Rg3zIYtJJgw9x9ZukVY+HgVUeMMPaWOQ2bWlu
 4QetDsuSA0F+2yHRJb8bk3c=
X-Google-Smtp-Source: APXvYqxYf/LSyNoW4G6F+YfErKWg2VnTxBScO+N0Yj/0Zkp4Jgf/cJRorHYivV3QT/rKZrOcajW+xA==
X-Received: by 2002:a2e:9048:: with SMTP id n8mr20521306ljg.37.1564653905895; 
 Thu, 01 Aug 2019 03:05:05 -0700 (PDT)
Received: from ferris.localdomain (85-156-247-180.elisa-laajakaista.fi.
 [85.156.247.180])
 by smtp.gmail.com with ESMTPSA id k82sm14473328lje.30.2019.08.01.03.05.05
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 01 Aug 2019 03:05:05 -0700 (PDT)
Date: Thu, 1 Aug 2019 13:05:02 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Ramalingam C <ramalingam.c@intel.com>
Subject: Re: [PATCH v11 1/6] drm: Add Content protection type property
Message-ID: <20190801130502.1a4d4a4e@ferris.localdomain>
In-Reply-To: <20190729093316.GB14727@intel.com>
References: <20190712070026.13088-2-ramalingam.c@intel.com>
 <20190714110008.19647-1-ramalingam.c@intel.com>
 <20190729172040.48257318@eldfell.localdomain>
 <20190729093316.GB14727@intel.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version;
 bh=qvdkbdV6sNEZfwB1qmYYdKipaAw3M7SMSsECBN25X00=;
 b=aHLyVDPuq3PquVKI485mQMuRckUCoGRlcCr6CNu5PLr+hdlJ7xGR1q76bxD8Qf0Kke
 h/g0Juardr86JxAwEibEROO6pPRcF3WEFjeQvQHUxGmLGIYnDodgs2cX4qGErmPhWiO0
 gQR5MWHuIjisV0Dz8hejwA7ARb9teHLNNdELz2ydQEHgib/iCVht0+IsHRMPibi/T0kg
 nJXpgQHu3qtu09uP63DRYz17slSToGDo1vXgX+Y2sJqMIMWoSECdXdQcDzy/uP/Rz07a
 p1B+xYxAUXM2vrQt4jhYXqImPt009ovUznkd78zXaR6QBbyPsFqIctecioxcaY7YJKmu
 o6Aw==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============1799798704=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1799798704==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/JxIIB2U1todT+QBGfp4cJ/4"; protocol="application/pgp-signature"

--Sig_/JxIIB2U1todT+QBGfp4cJ/4
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 29 Jul 2019 15:03:16 +0530
Ramalingam C <ramalingam.c@intel.com> wrote:

> On 2019-07-29 at 17:20:40 +0300, Pekka Paalanen wrote:
> > On Sun, 14 Jul 2019 16:30:08 +0530
> > Ramalingam C <ramalingam.c@intel.com> wrote:
> >  =20
> > > This patch adds a DRM ENUM property to the selected connectors.
> > > This property is used for mentioning the protected content's type
> > > from userspace to kernel HDCP authentication.
> > >=20
> > > Type of the stream is decided by the protected content providers.
> > > Type 0 content can be rendered on any HDCP protected display wires.
> > > But Type 1 content can be rendered only on HDCP2.2 protected paths.
> > >=20
> > > So when a userspace sets this property to Type 1 and starts the HDCP
> > > enable, kernel will honour it only if HDCP2.2 authentication is throu=
gh
> > > for type 1. Else HDCP enable will be failed.
> > >=20
> > > Need ACK for this new conenctor property from userspace consumer.
> > >=20
> > > v2:
> > >   cp_content_type is replaced with content_protection_type [daniel]
> > >   check at atomic_set_property is removed [Maarten]
> > > v3:
> > >   %s/content_protection_type/hdcp_content_type [Pekka]
> > > v4:
> > >   property is created for the first requested connector and then reus=
ed.
> > > 	[Danvet]
> > > v5:
> > >   kernel doc nits addressed [Daniel]
> > >   Rebased as part of patch reordering.
> > > v6:
> > >   Kernel docs are modified [pekka]
> > > v7:
> > >   More details in Kernel docs. [pekka]
> > > v8:
> > >   Few more clarification into kernel doc of content type [pekka]
> > > v9:
> > >   Small fixes in coding style.
> > >=20
> > > Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
> > > Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> > > ---
> > >  drivers/gpu/drm/drm_atomic_uapi.c         |  4 ++
> > >  drivers/gpu/drm/drm_connector.c           | 51 +++++++++++++++++++++=
++
> > >  drivers/gpu/drm/drm_hdcp.c                | 36 +++++++++++++++-
> > >  drivers/gpu/drm/i915/display/intel_hdcp.c |  4 +-
> > >  include/drm/drm_connector.h               |  7 ++++
> > >  include/drm/drm_hdcp.h                    |  2 +-
> > >  include/drm/drm_mode_config.h             |  6 +++
> > >  include/uapi/drm/drm_mode.h               |  4 ++
> > >  8 files changed, 111 insertions(+), 3 deletions(-) =20
> >=20
> >=20
> > Snip - sorry, gmail simply refuses to deliver my mail without trimming
> > it hard.
> >  =20
> > > =20
> > > diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
> > > index 5ab331e5dc23..5c954394093f 100644
> > > --- a/include/uapi/drm/drm_mode.h
> > > +++ b/include/uapi/drm/drm_mode.h
> > > @@ -218,6 +218,10 @@ extern "C" {
> > >  #define DRM_MODE_CONTENT_PROTECTION_DESIRED     1
> > >  #define DRM_MODE_CONTENT_PROTECTION_ENABLED     2
> > > =20
> > > +/* Content Type classification for HDCP2.2 vs others */
> > > +#define DRM_MODE_HDCP_CONTENT_TYPE0		0
> > > +#define DRM_MODE_HDCP_CONTENT_TYPE1		1 =20
> >=20
> > Hi,
> >=20
> > I still believe that these definitions do not belong in the uapi
> > header. Userspace must use the string names instead.
> >=20
> > Otherwise the patch looks fine, though my Weston review is still
> > on-going. =20
>=20
> I assume that still we need to wait for the weston review completion.
>=20
> Hence I request you to respond here once you are comfortable with this ne=
w uAPI.

Hi,

yes.

I have completed the Weston DRM-backend review in
https://gitlab.freedesktop.org/wayland/weston/merge_requests/48 and
the UAPI for HDCP 2.2 looks good. That Weston MR has some other
not-UAPI-related bits I need to read through still, but they have
no impact on the UAPI. The userspace is accepted in Weston.

I am also happy with the documentation in these kernel patches.

Therefore, with DRM_MODE_HDCP_CONTENT_TYPE0 and
DRM_MODE_HDCP_CONTENT_TYPE1 removed from the kernel UAPI headers,
for the kernel documentation and userspace consumer in Weston I
give for these HDCP 2.2 Phase II kernel patches:

Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>

Let me know, preferably as a comment in the Weston MR, when the
kernel patches have landed in the appropriate git tree to unblock
merging in Weston, please.


Thanks,
pq

--Sig_/JxIIB2U1todT+QBGfp4cJ/4
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl1CuU4ACgkQI1/ltBGq
qqdWNA/+OYOdi8o/1IMbjUghhqTsWlvMDzawzUVfi7dxi1PiiU9zI/C99mBPc/Yc
kWAi7lSbt5lqR2DP69ylwZHTkWwSDP4ELaE7Gj8jZq0AJylWvoEa9Ivb2RG7ufi8
/cNIDiVJN64ulPb4X40xTt3CCcQI8U7SWRoDSOaVhR5IOpTWECIoJzOD3vZY07yk
6SIYF7fECThXaxTjxVQUSwDcINvQAeLFFqcMo1DhaK4KYM+prmScznmvuK/sNh+4
/KH6LVzQIC6DtYO0zA8ERn5bWua8UR3rFVWd19bLFHXaU3xtrQNmtUcyzF8CyQei
gIPxZunqcSLpD3brQqTj0BIAcvlL+NWeP5giODDkEyhstNC/Ibu6FCalM9MxzUiS
oYEG1C1KmbL1vy+CSFMTYu+xghMH6rOhwQCZSnOQRKbcnxhcQutIZUJ0PIazqKEl
MrE4h/jjfNAN8vnsM3+G5y/ogVPm1gQyFn2p/kvGDEx19+RIdwl6P3uGj09qJoC6
NnjiqZWQyEQF7wJAD82JAd1JGp9vQHVgOODjUwdKnv8dBfxk3QNckASrnGF+0nob
zBpON8dhaDItNT7988gWGpPhaRDuyawwW2y7qYekdDDvm/QViNSYXyLy9//Srerb
kY8PqinAoDaKqmIJgbb7Ggpl8/6CPko1Tcc1aaJKMWEsuKOsofQ=
=v3YP
-----END PGP SIGNATURE-----

--Sig_/JxIIB2U1todT+QBGfp4cJ/4--

--===============1799798704==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1799798704==--
