Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C853B1EFFA7
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jun 2020 20:08:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10B246E478;
	Fri,  5 Jun 2020 18:08:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABDA16E478
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jun 2020 18:08:47 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id b6so12895998ljj.1
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Jun 2020 11:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=OCtNHoQrfkaROBdALDRSIbPR/D7hHGMh1PMxyiGwDhA=;
 b=eVQtNISoy+dWaiHA1cLfPw1BStwbHZEcAtJx9bVYyThCFSTFVCtgdsgJYrx6TnU5GL
 C/S8hcglGyBgZ8KMY5/JVEpWCCOJ1YPDjv2yxlO3ksVTXfzm0CTPT2ZGKGj8mTD2z3/j
 v3ak99spEmsYxhsj3alzsIB12+SL1tl5IVbPMRuVmQvnnRAlNldxT292uYN/W77kwjRL
 U2bjNiz6trXfvE93ibO6a0ZKKvylpD+z+I8sD9p2qKzerML3C0HbP3Gsy58UQBbZ/e6v
 VlSZQhAD/yieKvVytV/ayPWoxFVCQEomJoFQzuDpZMYha4SeLL2jf4gHsrCwdUPR2Xof
 +hTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=OCtNHoQrfkaROBdALDRSIbPR/D7hHGMh1PMxyiGwDhA=;
 b=LFltoZYAIuy9UKw8ob7fYmFYcTgCZO1OphetFx/RdVRjqvukf3IJK8yh1yBzS7JoXw
 maEJXXQSFe8OVfSfGM28LygF2+tVOm6fcIZRrNTXeOqqp37RYiZPiZFhlCPWIprMcXWX
 jE6JrRVuFoYtYUnqX3vh82r1G7hUdgjpq4tfmj8RCU9NoJcQClMwgOeWl+cCmSFSq168
 4b4gymamH/glLjhAfRjs5oT74c1VUL6GRV3IMamVrVgCq6QcCdyFvbJ4FMzC9iC0JFuv
 E2vpkxI6xBAmBlVJ+8mVcXMIaTeUGQWwqBlds57y22UNrALAyJtQAAy54uK9GWBrvRhC
 iGlw==
X-Gm-Message-State: AOAM531sV/HCmtOgGrf4ngPEXfpsVsS/2aOEdz+1dF6wTPMlBTzOgenT
 w0NynQRp/rS9HdCBRb+TEZM=
X-Google-Smtp-Source: ABdhPJy74MZfWMQabt21caXpC76P02uJSVFB3uWo/XcNMgipBgfcipjv6Lr0pFDBx/VA87EFTR/vyA==
X-Received: by 2002:a2e:9a04:: with SMTP id o4mr5201516lji.133.1591380526093; 
 Fri, 05 Jun 2020 11:08:46 -0700 (PDT)
Received: from ferris.localdomain (85-156-247-180.elisa-laajakaista.fi.
 [85.156.247.180])
 by smtp.gmail.com with ESMTPSA id 22sm1070953lju.5.2020.06.05.11.08.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jun 2020 11:08:45 -0700 (PDT)
Date: Fri, 5 Jun 2020 21:08:34 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v3] drm: document how user-space should use link-status
Message-ID: <20200605210834.358fe0b3@ferris.localdomain>
In-Reply-To: <CAKMK7uH9EhEpyogAzt=XKR9T3zjFgPXrr_aED+rF=5tpLkZdpg@mail.gmail.com>
References: <kFylMmeRMGJk-oi8f-Td8A7GNa1C-GsK23-vjKg77VhWfwpkLJg7QxFlQ_g9KdVxZiyWl9eJWpUGa5PYasR9YcyvIbuBmHVfKeHb4rH0yTM=@emersion.fr>
 <CAKMK7uH9EhEpyogAzt=XKR9T3zjFgPXrr_aED+rF=5tpLkZdpg@mail.gmail.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
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
Cc: Manasi Navare <manasi.d.navare@intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============1232664922=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1232664922==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/t96/17ZyrO7uKFIKfSahMyw"; protocol="application/pgp-signature"

--Sig_/t96/17ZyrO7uKFIKfSahMyw
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

> >
> > I'm not 100% sure the paragraph about not resetting link-status or not
> > using ALLOW_MODESET is accurate. Just like the previous version, this
> > is just an attempt at documenting the current kernel behaviour.
> >
> >  drivers/gpu/drm/drm_connector.c | 20 ++++++++++++++++++++
> >  1 file changed, 20 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_conn=
ector.c
> > index f2b20fd66319..1df036b3353b 100644
> > --- a/drivers/gpu/drm/drm_connector.c
> > +++ b/drivers/gpu/drm/drm_connector.c
> > @@ -994,6 +994,26 @@ static const struct drm_prop_enum_list dp_colorspa=
ces[] =3D {
> >   *      after modeset, the kernel driver may set this to "BAD" and iss=
ue a
> >   *      hotplug uevent. Drivers should update this value using
> >   *      drm_connector_set_link_status_property().
> > + *
> > + *      When user-space receives the hotplug uevent and detects a "BAD"
> > + *      link-status, the sink doesn't receive pixels anymore (e.g. the=
 screen
> > + *      becomes completely black). The list of available modes may have
> > + *      changed. User-space is expected to pick a new mode if the curr=
ent one
> > + *      has disappeared and perform a new modeset with link-status set=
 to
> > + *      "GOOD" to re-enable the connector.
> > + *
> > + *      If multiple connectors share the same CRTC and one of them get=
s a "BAD"
> > + *      link-status, the other are unaffected (ie. the sinks still con=
tinue to
> > + *      receive pixels).
> > + *
> > + *      When user-space performs an atomic commit on a connector with =
a "BAD"
> > + *      link-status without resetting the property to "GOOD", the sink=
 may
> > + *      still not receive pixels. When user-space performs an atomic c=
ommit
> > + *      which resets the link-status property to "GOOD" without the
> > + *      ALLOW_MODESET flag set, it might fail because a modeset is req=
uired.
> > + *
> > + *      User-space can only change link-status to "GOOD", changing it =
to "BAD"
> > + *      is a no-op. =20
>=20
> Above reads well and is accurate I think. I think we should add
> another paragraph about the backwards compatibility hack in SETCRTC
> ioctl:
>=20
> "For backwards compatibility with non-atomic userspace the kernel
> tries to automatically set the link-status back to "GOOD" in the
> SETCRTC IOCTL. This might fail if the mode is no longer valid, similar
> to how it might fail if a different screen has been connected in the
> interim."
>=20
> With that or similar this has my r-b.

Sounds good to me too. A-b stands.


Thanks,
pq

--Sig_/t96/17ZyrO7uKFIKfSahMyw
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl7aiiIACgkQI1/ltBGq
qqcj/Q/+N2hov/ryloJmW+Sw4dUSwqdvKsv6ZSsTqEeM0Li/Uw/aMsb7JXPVqO9c
0Q9pGZKF+/KyzHHVoZ1FcKVsjQI9278iw8Z5TBArmvyDgHZF3JlIa1bGI/5uN5Pa
HSWcng5ueHrEvlDacrDNU9U2/jWY3GcIjOjf1zejS4vKWYtSSLxMd3YEa7GIabH9
MEd0G03/uUjfBmHQfO6AtbPaqzZ170+YWksSZFm/prDBSXqR2zZFVnlaX5twMrQs
H0OWd/5/SNYRTaTADdHz18PCR8YqKBVde7xqHClIXNBfihMXQH+Pl3YVUY/s0Smz
TIOcMznrQXayUz1ShGwNmXIpckskaBFoQ6JBXoLMmN8NCsKnbvk/N6zOIzXcWlMM
bSm00gwgh9bKIvVITVwDWCnjuvE8su5xsOi4+BJ2ji0b3fVUJDDrRy6oEWGyVZ1a
pbMTNYk/QdiCrRDmv/6rtusdni47Q+35JF1lWoXzFVETmAv5UfmOGQ3AOdTrZVku
9vz8WP/1nUV+/WXfa1tcm7OljaB7JpW7YGAzbsWL16DlnEg/9nfzi5dVZFSvUJdK
G/7rLRfp7LbKxqO3frYE1NIGpSo/DK91k3+EsPOVuswMmDmNEqdbV4F2hl6PFKV8
+cTd+LggLhLkhjteUq2aAVVn/ru9c7H60M1iEtY9r6DEtfy29cA=
=DQ4a
-----END PGP SIGNATURE-----

--Sig_/t96/17ZyrO7uKFIKfSahMyw--

--===============1232664922==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1232664922==--
