Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 845D569A818
	for <lists+dri-devel@lfdr.de>; Fri, 17 Feb 2023 10:28:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 828DD10E1B8;
	Fri, 17 Feb 2023 09:28:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C659610E1B8
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Feb 2023 09:28:46 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id l3so430653ljq.9
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Feb 2023 01:28:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=6yPDnPny5pMZyxMY+0NgWfxxFItdRXSG/+PBedtB31A=;
 b=OACPO7HG0SttbaJrsxXSC1OwITxJmkbgDGcf8WPhLYJYW9sxzp16Q3CIfH7H01nlJG
 /Jhe2g+Ljz6/YSgaQzrtkBU7ETE7CLgqMDN3EeP7H9Iv3b18snTaFJkMZG23/Z2/2GsO
 654AbQrEFK2WmVi2X7FqxCJHm5MiTr/NNEpc2XmAhgqkrIfRLlaWeKXQpPx+IFJjTS2Z
 BYbZyU1crlDAqogAmjObSj3JdQA9JU8FeIN0xhYVAIc+D6DVi5h8EW+P+LQREruOtB6r
 4MDF2IOH/1deoAiG5Sg94yjlxyHwHLRuk3PEbBk7mRYu73oYVugnbTr4I3pag5swS7ts
 96jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6yPDnPny5pMZyxMY+0NgWfxxFItdRXSG/+PBedtB31A=;
 b=wLPmFLk1kj+AXtre5NAal8uS+1FaGatuT3DVwUsEOe/dbSOlURnmT8x1jamYVvI+nX
 ABElIl2uyr5HA6iC/5d+dXR8qLUUeptVTqIF5scRxqO5pqOBJvWg87fTPJyF1DHozkUn
 sKK3tc6VKHaL2Ly6cs9wQ3qHBJiNrJ2sOGdNfKXHfy2Z2QAv39sJDOgukDW0qPNnrPam
 i9mkP2JP2jqzgFD1A2p2/dzW4DAPfnN6IFREOTTVlQXxpMuq+GsjqRbxDpjDp635uWjC
 KiQNOKOtnzPZaohfD29blsoqjhArYMXc2qgAKhNR/qN5CntuW1tEQDEDFgLIDE8DLmfX
 mapw==
X-Gm-Message-State: AO0yUKUp8fRM/UoxZhuNzpViT08Zv/18KuA0rJHl+KLEsNoFso+Q4Lpm
 omEGrCf4VWswpoQ4AgxC57k=
X-Google-Smtp-Source: AK7set/hNq7PQLBGY1JIbBYh/PVEk1KwMpeR9uI2tWH/7+4VO3VXrtK0nBO8mzA9s/qYy7fooMov3A==
X-Received: by 2002:a2e:be91:0:b0:293:4450:6672 with SMTP id
 a17-20020a2ebe91000000b0029344506672mr3539425ljr.29.1676626124825; 
 Fri, 17 Feb 2023 01:28:44 -0800 (PST)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 d6-20020a05651221c600b004dc4c1e1e97sm614577lft.264.2023.02.17.01.28.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Feb 2023 01:28:43 -0800 (PST)
Date: Fri, 17 Feb 2023 11:28:29 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH 2/2] drm: document DRM_IOCTL_GEM_CLOSE
Message-ID: <20230217112829.04ac7fe7@eldfell>
In-Reply-To: <Y+6IdQz1MNj9k+8K@phenom.ffwll.local>
References: <20230216130934.156541-1-contact@emersion.fr>
 <20230216130934.156541-2-contact@emersion.fr>
 <Y+6IdQz1MNj9k+8K@phenom.ffwll.local>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/2VA6tBM8t6yl61tNIzB5G6o";
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/2VA6tBM8t6yl61tNIzB5G6o
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 16 Feb 2023 20:48:05 +0100
Daniel Vetter <daniel@ffwll.ch> wrote:

> On Thu, Feb 16, 2023 at 01:09:45PM +0000, Simon Ser wrote:
> > This is a bit tricky, because of the ref'counting considerations.
> > See also [1] for more discussion about this topic. Since this is
> > kernel docs, I've decided to elaborate a bit less on the user-space
> > details.
> >=20
> > [1]: https://gitlab.freedesktop.org/mesa/drm/-/merge_requests/110
> >=20
> > Signed-off-by: Simon Ser <contact@emersion.fr>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Cc: Pekka Paalanen <ppaalanen@gmail.com>
> > Cc: Daniel Stone <daniel@fooishbar.org>
> > ---
> >  include/uapi/drm/drm.h | 13 +++++++++++++
> >  1 file changed, 13 insertions(+)
> >=20
> > diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
> > index 54b2313c8332..4829f1fa9570 100644
> > --- a/include/uapi/drm/drm.h
> > +++ b/include/uapi/drm/drm.h
> > @@ -972,6 +972,19 @@ extern "C" {
> >  #define DRM_IOCTL_GET_STATS             DRM_IOR( 0x06, struct drm_stat=
s)
> >  #define DRM_IOCTL_SET_VERSION		DRM_IOWR(0x07, struct drm_set_version)
> >  #define DRM_IOCTL_MODESET_CTL           DRM_IOW(0x08, struct drm_modes=
et_ctl)
> > +/**
> > + * DRM_IOCTL_GEM_CLOSE - Close a GEM handle.
> > + *
> > + * GEM handles are not reference-counted by the kernel. User-space is
> > + * responsible for managing their lifetime. For example, if user-space=
 imports
> > + * the same memory object twice on the same DRM file description, the =
same GEM
> > + * handle is returned by both imports, and user-space needs to ensure
> > + * &DRM_IOCTL_GEM_CLOSE is performed once only. The same situation can=
 happen
> > + * when a memory object is allocated, then exported and imported again=
 on the
> > + * same DRM file description. The &DRM_IOCTL_MODE_GETFB2 IOCTL is an e=
xception
> > + * and always returns fresh new GEM handles even if an existing GEM ha=
ndle
> > + * already refers to the same memory object before the IOCTL is perfor=
med. =20
>=20
> I'd duplicate the relevant parts into each ioctl doc too, just to increase
> the chances people notice these caveats. But that's stuf for these other
> patches. for this one:
>=20
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>=20
> btw do the links from on ioctl text to the other work?
> -Daniel

This one

Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>

I agree with Daniel's comments to both patches, and nothing else came
to my mind.


Thanks,
pq


>=20
> > + */
> >  #define DRM_IOCTL_GEM_CLOSE		DRM_IOW (0x09, struct drm_gem_close)
> >  #define DRM_IOCTL_GEM_FLINK		DRM_IOWR(0x0a, struct drm_gem_flink)
> >  #define DRM_IOCTL_GEM_OPEN		DRM_IOWR(0x0b, struct drm_gem_open)
> > --=20
> > 2.39.1
> >=20
> >  =20
>=20


--Sig_/2VA6tBM8t6yl61tNIzB5G6o
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmPvSL0ACgkQI1/ltBGq
qqc+oA//eLkAWz7UwzPUTajUn4D9kypXP5Z+9B1Z8Xa96z6QbOTe7ezi6gbPMLY/
0GSHZ6BEo7vV5fmF50L5AFZ5zDACi9Dr3W1m80tPWpci3s7j/6/MRltCzfBnieBb
Ol2gXssCZnCHJX8cf8FjnTeHky+5uuxW4TYGSiid1OYbxMkLdVaPGpxarhAkKpk7
PoEAcOFEMdRbm0L5tG3NzBoZkreyax+dN0QhIY2qA//q+NM7inLlj2mLZLnGshTR
qpqmBnDAi9B2rNl+szvU5DEEGxgzKIDjzR1E1E9Y8pUzEyMbGZN/oKsholiSXDSm
Zdbl8Mr942+9kurPntGSnGmvC/sfhpRKtAKgv0iCDj1rKKAYVhYbLfNPYXB5aVez
4RS3pTZJvWh+nBefXxpcfFFwSfgu1wje9Yr98kjSQ3Bm31IvhcrIq59MIqPJOfQP
4W5jpgOpvYgpjS1NAnkgBJHyDZtulfFqgNiTUoOAud1m/b2eSXJHbcW56qGry9Qs
W1YFjbjXrkxTUwMumVktqZdEBzRHAxg7E45Azk5v+XQIN7gwLtnTPsNj7yxwzWnF
2nkKI19C91eagd9YF7NYzM7ZVWX47JgNo+DDKz+TNqRb7LLbadnQKLVuUeAXRW1w
dFGvb6bFaH6/UZOcmm75WZ1yTTmoVQ9IvySoKq4BzqmOfxNlbaw=
=U36G
-----END PGP SIGNATURE-----

--Sig_/2VA6tBM8t6yl61tNIzB5G6o--
