Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50E98389F25
	for <lists+dri-devel@lfdr.de>; Thu, 20 May 2021 09:51:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B143F6EF3F;
	Thu, 20 May 2021 07:51:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E31DC6EF38
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 07:51:27 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id s25so18556051ljo.11
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 00:51:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=gel51XWd9NtGUEe3j1eRY44VnFFOXWInaJv9QHx6M7w=;
 b=fNit6Lrr6UHkH5PVK8T/6Ah6Gs7HUfduY8elrA+RFpNOcAXgMGoazUS/a1uT2acB95
 Fp4LDkEhyUOYIVaaO0Lxi4RWDnrdApfwPxwdVcR6WNWf7o5/rvPUX87pqhMVlN/Mv1OI
 LNkniyVIsn3YfLg/XBkKqSL0sNSMJDu5Ml1YiZZWNA3Ud1rQ6JBLySckSzSeB1rR2lDm
 T1pCEyBT5qwv18zeeBxxomJ9CHGEb3aIvgG2y3lEd4ATTXGYrxNBf9o+UUEfdeJNqgL+
 juiqMrYH7ZwchtO7UIBHYy3SpQKgp+G5x3S2Eh4Gdy3DBZ1Px40vrLqePEeE+1LaCTA0
 UhJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=gel51XWd9NtGUEe3j1eRY44VnFFOXWInaJv9QHx6M7w=;
 b=amXT/LD73mYXuLDYdXx5WLeI77mrV3YBeo4xSMIrFPncmsjUCComMKIb3HZ5o6vULX
 +jODmHPXVaIdeDljKivR9DP5lI58+xDlgoYMLCjA2wXeNNj8vOSPZURLHS9/E01UTaST
 hEJAK7GGAuDjPSliD+Ufr0m48x0tpi26ANJsqN0yygciREpRCOFx5p+tpmKbdrPE0crC
 EMAz7MaPvUmuQ8oWGw3WwtxykHfbWBms8ec/6cVDUij+5c6rNuyDSXM1o4RplVzq1OLK
 R0DSDB5tiaP1EIiCTzkQ31C4Cc/txkg4PKCCs/Io2f4ct5SXq/6GkiRyIFoVWG/Gy5ol
 YmQg==
X-Gm-Message-State: AOAM5338fClgtXyWVc5ow9cBIeJOeoZ5Sa/bhrZ+52xA5qGAN3knr737
 d1rJ9IR7Oj1aSrUnuZcW50o=
X-Google-Smtp-Source: ABdhPJw43dWKbFZOpyo4VLZTfLB5V+tT6sicTDhfmmin80XCaoGfB7qT0b2f28c8SXyJx7LTgn7o+w==
X-Received: by 2002:a2e:7605:: with SMTP id r5mr2121015ljc.414.1621497086262; 
 Thu, 20 May 2021 00:51:26 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id p36sm216761lfa.227.2021.05.20.00.51.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 00:51:25 -0700 (PDT)
Date: Thu, 20 May 2021 10:51:15 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Leandro Ribeiro <leandro.ribeiro@collabora.com>
Subject: Re: [PATCH 2/2] drm/doc: document drm_mode_get_plane
Message-ID: <20210520105115.78f49054@eldfell>
In-Reply-To: <cb41184d-8625-698f-1cd6-5f3d6728debf@collabora.com>
References: <20210428213651.55467-1-leandro.ribeiro@collabora.com>
 <20210428213651.55467-3-leandro.ribeiro@collabora.com>
 <20210506121003.4ab918bb@eldfell>
 <cb41184d-8625-698f-1cd6-5f3d6728debf@collabora.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/5BEvK1WAHi9T3VYJ397Np1v"; protocol="application/pgp-signature"
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
Cc: airlied@linux.ie, kernel@collabora.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/5BEvK1WAHi9T3VYJ397Np1v
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 19 May 2021 10:30:40 -0300
Leandro Ribeiro <leandro.ribeiro@collabora.com> wrote:

> On 5/6/21 6:10 AM, Pekka Paalanen wrote:
> > On Wed, 28 Apr 2021 18:36:51 -0300
> > Leandro Ribeiro <leandro.ribeiro@collabora.com> wrote:
> >  =20
> >> Add a small description and document struct fields of
> >> drm_mode_get_plane.
> >>
> >> Signed-off-by: Leandro Ribeiro <leandro.ribeiro@collabora.com> =20
> >=20
> > Hi,
> >=20
> > thanks a lot for revising these.
> >  =20
> >> ---
> >>  include/uapi/drm/drm_mode.h | 22 ++++++++++++++++++++++
> >>  1 file changed, 22 insertions(+)
> >>
> >> diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
> >> index a5e76aa06ad5..8fa6495cd948 100644
> >> --- a/include/uapi/drm/drm_mode.h
> >> +++ b/include/uapi/drm/drm_mode.h
> >> @@ -312,16 +312,38 @@ struct drm_mode_set_plane {
> >>  	__u32 src_w;
> >>  };
> >>
> >> +/**
> >> + * struct drm_mode_get_plane - Get plane metadata.
> >> + *
> >> + * Userspace can perform a GETPLANE ioctl to retrieve information abo=
ut a
> >> + * plane.
> >> + */
> >>  struct drm_mode_get_plane {
> >> +	/** @plane_id: Object ID of the plane. */ =20
> >=20
> > This is an "in" field, right?
> >=20
> > "in" meaning that userspace sets it to the ID of the plane it wants
> > information on.
> >=20
> > "out" field is a field written by the kernel as a response.
> >=20
> > I'm not sure if the kernel has a habit of documenting these, because we
> > use libdrm to abstract this so users do not need to care, but I think
> > it would be nice.
> >  =20
>=20
> In a quick look, I couldn't find anything. But I can change the phrasing
> to the following:
>=20
> "@plane_id: Object ID of the plane whose information should be
> retrieved. IN field, set by userspace."

I think "set by userspace" or "set by caller" would be enough.


> >>  	__u32 plane_id;
> >>
> >> +	/** @crtc_id: Object ID of the current CRTC. */
> >>  	__u32 crtc_id;
> >> +	/** @fb_id: Object ID of the current fb. */
> >>  	__u32 fb_id;
> >>
> >> +	/**
> >> +	 * @possible_crtcs: Bitmask of CRTC's compatible with the plane. CRT=
C's
> >> +	 * are created and they receive an index, which corresponds to their
> >> +	 * position in the bitmask. CRTC with index 0 will be in bit 0, and =
so
> >> +	 * on. To learn how to find out the index of a certain CRTC, please =
see
> >> +	 * :ref:`crtc_index`. =20
> >=20
> > This could be shortened to something like bit N corresponds to CRTC
> > index N, and make "CRTC index N" a hyperlink.
> >  =20
>=20
> Nice, I'll apply this change.
>=20
> >> +	 */
> >>  	__u32 possible_crtcs;
> >> +	/** @gamma_size: Number of entries of the legacy gamma lookup table.=
 */
> >>  	__u32 gamma_size;
> >>
> >> +	/** @count_format_types: Number of formats. */
> >>  	__u32 count_format_types;
> >> +	/**
> >> +	 * @format_type_ptr: Pointer to ``__u32`` array of formats that are
> >> +	 * supported by the plane. These formats do not require modifiers.
> >> +	 */
> >>  	__u64 format_type_ptr; =20
> >=20
> > The count/ptr fields have an interesting usage pattern, which I suppose
> > is common for all DRM ioctls. Makes me wonder if it should be documente=
d.
> >=20
> > AFAIU, count is in+out field: when set to 0, the kernel uses it to
> > return the count needed. Then userspace allocates space and calls the
> > ioctl again with the right count and ptr set to point to the allocated
> > array of count elements. This is so that kernel never allocates memory
> > on behalf of userspace for the return data, making things much simpler
> > at the cost of maybe needing to call the ioctl twice to first figure
> > out long the array should be.
> >=20
> > This can be seen in libdrm code for drmModeGetPlane().
> >
> > There is certainly no point in explaining all that here, that is too
> > much. But if there was a way to annotate the count member as in+out,
> > that would be nice. And the ptr member as "in".
> >  =20
>=20
> This is documented in the description of struct drm_mode_get_connector:
>=20
> https://www.kernel.org/doc/html/latest/gpu/drm-uapi.html#c.drm_mode_get_c=
onnector
>=20
> Would be enough to have something similar in struct drm_mode_get_plane?

That would be really nice!


Thanks,
pq

--Sig_/5BEvK1WAHi9T3VYJ397Np1v
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmCmFPMACgkQI1/ltBGq
qqdj2RAAtDXkDaI9+uuQRaynV0Nq9XQNJOUgPu/0K5m3vvPe6l5b6QqryrJYRhYr
t3O/TpcwLmucJ2NGyY+Nyetbbya1xstIG+LT735MOrzEFCN55P0px5nxU2zYpqD2
PDVa0txi6OZYZDMd4p/+Ox3XJymCOYg85zrxzuCwq3jxC4egiz9ZZ0BuDZP1KGau
K5wBrWYtj++TALdvjdS5NzlrXRu33VRFlXLUz0Qg9ptzSNi3N2Xz9Xt1uY2ZIGme
S+NnIqb3ETP5Re1s8xFxFbaSNwxleAKUaCPdv4c39qRWXRXEdNL8aLRGp0CGUyhI
a52yQKqxMxru3XvDqdcx30l3kEZDbnv7MBF0e3f/haM5MuFdl4Mc2DiGigYXciIj
9/hlmkPM6wVmd4OCqumvFulpDVLfcGfSSyoc2bffXZoXOU7L1ETV6LoUkvxXFtGQ
kJn6O8+/T4izcDnc9s4xyKAzw7tDaXnv5s9Ee1xLsM4CR0ufxAz4WArrSncpmWhK
GYh5krms+qBb1gVRuvKjt0k2ht6i85/yN2x8wtJ4i6sX7jC90PRQWFq2PMcnpiLh
9JM7bSPah9Zc4FyP2PfNBMX/ErVlvhx11sPMMnXY4AgTf/EqTZr9VT0ug9JqusHy
e8+rIANIN25zRfhi08BwM9+2XiHhTCoxtrnR6h/HoGmDGIMKjUg=
=M3EE
-----END PGP SIGNATURE-----

--Sig_/5BEvK1WAHi9T3VYJ397Np1v--
