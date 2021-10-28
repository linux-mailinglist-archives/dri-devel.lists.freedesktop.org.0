Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A87043DC0F
	for <lists+dri-devel@lfdr.de>; Thu, 28 Oct 2021 09:33:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43E936E04B;
	Thu, 28 Oct 2021 07:32:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 999766E04B
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Oct 2021 07:32:58 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id e2so9053878ljg.13
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Oct 2021 00:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=ODyAUOuP0ncKZozvTDWUdBPaIGXm9x9RHRcqJB2sl+4=;
 b=YUgvM44kQdGGV0hr6jz42Uq5692eG+G8iQh7XYRcXmzcnNSjlLt1/egvb9vjRxDMVa
 R0SF1S4Oh5bAFHF/wzYCu+J5AvXQpMCkXA1oxTP6xdiHNTYk1iSkLEU2ylbLgj50G4Io
 o8MpDEqJwDw4pll8rcks4PxsquQsvFIMMoWqK8dp+kKuSVKk2Rr0KkZQc8fjlkrG2Kw2
 gm8OYHzzEoGMzLPuzlGjMBYyP8sV0UjmS++SZh/mi4y84Q9jtZ77yyg/IcNtKQ5J9L7U
 vAx37NIXWV0eFcq1rpddBIH4vSD6t7QzQTy5kciatqQO6agk3yChtzpeImrqrfOHjjt9
 i/aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=ODyAUOuP0ncKZozvTDWUdBPaIGXm9x9RHRcqJB2sl+4=;
 b=w3hy6uddvu5lwrb96/PFrUDyZsYNuV6ZaSuZYAGo++qJaakcMWQLf+cDEhPDyoURtW
 1lAtaz337/jEopdXWdt4a+QBMZ71fCl4HrJCPeRikSVw0Tjp9ga49yijto1xGtbSoEBM
 pi3vuk5OngXUA8Fb2Q7aDdd2NPCkygbiSYADTDQDetmj3O4N/SLF60F8jNkXaCnfIKcf
 BTBeA9YZI17wcLbBGH52dF2UINrlz//nQ8g91uFkaSyRbKH9KyIV07SCzZ5/S0CpreFz
 vkvhUkazGgHqox0jfhj+73iaSGbr1MJLtCiNtE7RNTMAE1pD1ss+fxumM3/ifRTH43mR
 chXw==
X-Gm-Message-State: AOAM530cGWkaWEYsw8jvqurY6NkXO9Ghg+LY15fex5UTFDQ2XrzAsP6M
 feyNQT14+kdAvtm7jrR+BEg=
X-Google-Smtp-Source: ABdhPJz75trqZRaJV+u7zRvJQvhbuWgNMd0XvFNbp+Xnx4ypcUGU7gfJii7J76icvRp9pkHAsxCyXA==
X-Received: by 2002:a2e:8096:: with SMTP id i22mr541725ljg.174.1635406376828; 
 Thu, 28 Oct 2021 00:32:56 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id v138sm228815lfa.97.2021.10.28.00.32.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 00:32:56 -0700 (PDT)
Date: Thu, 28 Oct 2021 10:32:46 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Simon Ser <contact@emersion.fr>
Cc: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 3/6] drm/connector: use
 drm_sysfs_connector_hotplug_event
Message-ID: <20211028103246.72ed596c@eldfell>
In-Reply-To: <RNH9PbVxj91eP3_LRm6KWpGuf5SLZnuzaspNJAqn_F9J_SqZ3n3sjt6Aa-S3WKd1fnz_sCuOBZNt9dBS72YXMn4QM5lHWb5Fwdz4tFDDrOo=@emersion.fr>
References: <20211015163336.95188-1-contact@emersion.fr>
 <20211015163336.95188-4-contact@emersion.fr>
 <20211027161514.431a5851@eldfell>
 <RNH9PbVxj91eP3_LRm6KWpGuf5SLZnuzaspNJAqn_F9J_SqZ3n3sjt6Aa-S3WKd1fnz_sCuOBZNt9dBS72YXMn4QM5lHWb5Fwdz4tFDDrOo=@emersion.fr>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/acbOIXnsjpIYrPeH2uB2y_+";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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

--Sig_/acbOIXnsjpIYrPeH2uB2y_+
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 27 Oct 2021 13:26:45 +0000
Simon Ser <contact@emersion.fr> wrote:

> On Wednesday, October 27th, 2021 at 15:15, Pekka Paalanen <ppaalanen@gmai=
l.com> wrote:
>=20
> > On Fri, 15 Oct 2021 16:33:43 +0000
> > Simon Ser <contact@emersion.fr> wrote:
> > =20
> > > In drm_connector_register, use drm_sysfs_connector_hotplug_event
> > > instead of drm_sysfs_hotplug_event, because the hotplug event
> > > only updates a single connector.
> > >
> > > Signed-off-by: Simon Ser <contact@emersion.fr>
> > > ---
> > >  drivers/gpu/drm/drm_connector.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_co=
nnector.c
> > > index ec3973e8963c..a50c82bc2b2f 100644
> > > --- a/drivers/gpu/drm/drm_connector.c
> > > +++ b/drivers/gpu/drm/drm_connector.c
> > > @@ -547,7 +547,7 @@ int drm_connector_register(struct drm_connector *=
connector)
> > >  	connector->registration_state =3D DRM_CONNECTOR_REGISTERED;
> > >
> > >  	/* Let userspace know we have a new connector */
> > > -	drm_sysfs_hotplug_event(connector->dev);
> > > +	drm_sysfs_connector_hotplug_event(connector);
> > >
> > >  	if (connector->privacy_screen)
> > >  		drm_privacy_screen_register_notifier(connector->privacy_screen, =20
> >
> > Hi Simon,
> >
> > this might not work for Weston if I understand this right. Kernel is
> > adding a new connector, which means userspace does not recognise the
> > connector id in the uevent. Weston as it is right now would ignore the
> > event rather than add the connector.
> >
> > The missing piece is for Weston to revert to the old fashioned "recheck
> > everything" behaviour when hotplug uevent carries anything
> > unrecognised. Grep for drm_backend_update_conn_props if you want to see
> > for yourself.
> >
> > However, I wouldn't NAK this patch just for Weston, but I wonder if
> > other software would ignore events because of this as well.
> >
> > A whole another question is, would anyone notice. I guess this can only
> > be an issue with MST. =20
>=20
> I think Weston should be fine: udev_event_is_conn_prop_change returns fal=
se
> if there's no PROPERTY in the uevent. An uevent with just a CONNECTOR and=
 no
> PROPERTY is something new. Weston already falls back to the old "reprobe =
the
> world" approach in this case.
>=20
> So far the CONNECTOR+PROPERTY uevent fields have only been used for conte=
nt
> protection stuff. I'm not aware of other user-space using it (checked Kodi
> just in case, it doesn't do content protection nor handles uevents at all=
).
>=20
> > All the other changes in this series look fine to me, so them I can give
> > Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com> =20

Hi Simon,

you're right! Therefore my Ack applies to this patch too.


Thanks,
pq

--Sig_/acbOIXnsjpIYrPeH2uB2y_+
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmF6Uh4ACgkQI1/ltBGq
qqdb3A//ds/dnoHXhCNTGofG3hJP54Y/7Y0XnGy4eNkq9tYc+jaRqCvf78uJe+cD
Rx0Q7PXTsURsNMIwB/J81ew/WIxeFpCyjtHlZYXiGtcNpycVCUFSTcz/QJjYU9CV
Ep3fTnv76djxn3OGcDAhr1ltDdtz2WgBCJ9I8v9qZry3RRNYiwK37GfkLOhgDKE/
OalCqU78Za7n3sfyIFMn4SIflMf5o4t9aLJOfVIlwA4ihR2ESorfHT4pCWdAwJdC
QCC+JupVjVUTtqtmM1EMY7SquRsbf0/rn+sKMzDVjVUi0m9Zs0i9uc+5K0TSbcdZ
VaD0sTKpijgtEf9sMtnad2XX9RR9ctlQdI9XE8+TjyQsBRrVOPlm/6C7HZH7g7pg
FFdUJWK64oUUFWxdv6ZcqThSvJWYp3CKLJW9/meOVI+cQ1Nu7W0mYnZGnHeXz1aM
gCOyO1hU/u8kK31rqEasq/DP3NqFVfMt1hickALx8/O4WIPxzOBdJwySsIAec2gm
1q8aF/FyxrFAGGIxw+t/jF7twlQLLd7tL991fVDheJIB6ZTrkuvydOdFQS+KK7V0
FmBsSEuxj6OD1MpluJe2HmbgQXF1XcBbZL/y7Rn2mvnbKJ6vDOCiL0yYUvfdVn0k
tbFKSAdqgYFJNDguBN/hGgaIsPi7dFx0OAPgvNXL7blmDc+dbyE=
=TWZi
-----END PGP SIGNATURE-----

--Sig_/acbOIXnsjpIYrPeH2uB2y_+--
