Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3077542EA8E
	for <lists+dri-devel@lfdr.de>; Fri, 15 Oct 2021 09:50:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC0C36ECF4;
	Fri, 15 Oct 2021 07:50:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE9056ECF4
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Oct 2021 07:50:19 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id y26so38197612lfa.11
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Oct 2021 00:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=8UcXyUJOJyHLZcL7XHiMxsZihSQMsZ/mdQO2yul5dEc=;
 b=eifC28c72AnknZ7WhAusrcrd/VhMLpW497syZCwTvCZ4Ph60Z1lz6hJezrq9Jm23V8
 SSIw85PuuehqO/M/lECcfMnqbz09lO0pTmNic7RO1WK31/wkBd+ePh2ALuT00t81idSm
 p56uRp6KSnFoC2kyCrkjikikPKgRYKtm1CmyR3Xg3iTF0LlELcv+qHMzn1urRggMfN8P
 VyJpJY4W2/MU8dq6g7ps5sXzIUKkvFLeLeDkis1UeRZLRT1PqNnFZd51lAimzTHTCQJA
 1QqH7O9UOASKC2sEmsHaHmz38op1/EVRMpcqwP+ts3o/CiW3GHHPGg+1M1KSKf8OxHxp
 VFGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=8UcXyUJOJyHLZcL7XHiMxsZihSQMsZ/mdQO2yul5dEc=;
 b=Ctr+UIkyTRQZgX/c8k4m61cjVBL6I8gS2vupjJBwHvt8yeBD8T4+E4bruCmU3I12FC
 AQUxgqdiogXpmAxUfsVWuzNnvmwiI/kffDsWIalEs4p1R8HJf+fCe+0ayd8Cx1lBrkcq
 RbF+TMf2yv/scmxN3XS/9yG2SGbcJbWxRMK+PApy4Le+Px2vGiAJIEIHZT9qmjkR3nKL
 tHaoI7Fttw8M7d+sf7oAmZVnOtn0A9bwi82HjqpTkr0FFu+EU3vaxyduWL0uSTWpVmYq
 R9DZNGZ9YLLezjSxQMvNbe8qFbtqJoQ3tzSZHAkbTYEHtPoNKSUcfeicofv2RLxUtHG0
 AEIQ==
X-Gm-Message-State: AOAM5331XNPkxNz920LFAyCRgSBcKln/RPmDO9iDGSsYD8EjHUv3z3Cm
 IXTA8e/H1xxS3vsejcV6pwE=
X-Google-Smtp-Source: ABdhPJxqFThpEyPbTIk3Sq6VOSC0Qhbs6TZaIL40B5CP2nxSXe77vKzWg6xzxp6NVDub5ZZEpDu5Vg==
X-Received: by 2002:a05:6512:3107:: with SMTP id
 n7mr10359250lfb.179.1634284218156; 
 Fri, 15 Oct 2021 00:50:18 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id f8sm433989lfq.168.2021.10.15.00.50.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 00:50:17 -0700 (PDT)
Date: Fri, 15 Oct 2021 10:50:14 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: [RFC v1 3/6] drm: Add a capability flag to support additional
 flip completion signalling
Message-ID: <20211015105014.0375d196@eldfell>
In-Reply-To: <6a78da70ffab4b35b0e78a1e6570cb59@intel.com>
References: <20210913233529.3194401-1-vivek.kasireddy@intel.com>
 <20210913233529.3194401-4-vivek.kasireddy@intel.com>
 <20211014124402.46f95ebc@eldfell>
 <6a78da70ffab4b35b0e78a1e6570cb59@intel.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/aKAOnXrgXsR.o/YY7kC30HL";
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

--Sig_/aKAOnXrgXsR.o/YY7kC30HL
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri, 15 Oct 2021 03:37:01 +0000
"Kasireddy, Vivek" <vivek.kasireddy@intel.com> wrote:

> Hi Pekka,
> Thank you for reviewing this patch.
> =20

Hi Vivek!

> > On Mon, 13 Sep 2021 16:35:26 -0700
> > Vivek Kasireddy <vivek.kasireddy@intel.com> wrote:
> >  =20
> > > If a driver supports this capability, it means that there would be an
> > > additional signalling mechanism for a page flip completion in addition
> > > to out_fence or DRM_MODE_PAGE_FLIP_EVENT.
> > >
> > > This capability may only be relevant for Virtual KMS drivers and is c=
urrently
> > > used only by virtio-gpu. Also, it can provide a potential solution fo=
r:
> > > https://gitlab.freedesktop.org/wayland/weston/-/issues/514
> > >
> > > Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
> > > ---
> > >  drivers/gpu/drm/drm_ioctl.c   | 3 +++
> > >  include/drm/drm_mode_config.h | 8 ++++++++
> > >  include/uapi/drm/drm.h        | 1 +
> > >  3 files changed, 12 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
> > > index 8b8744dcf691..8a420844f8bc 100644
> > > --- a/drivers/gpu/drm/drm_ioctl.c
> > > +++ b/drivers/gpu/drm/drm_ioctl.c
> > > @@ -302,6 +302,9 @@ static int drm_getcap(struct drm_device *dev, voi=
d *data, struct =20
> > drm_file *file_ =20
> > >  	case DRM_CAP_CRTC_IN_VBLANK_EVENT:
> > >  		req->value =3D 1;
> > >  		break;
> > > +	case DRM_CAP_RELEASE_FENCE:
> > > +		req->value =3D dev->mode_config.release_fence;
> > > +		break; =20
> >=20
> > Hi Vivek,
> >=20
> > is this actually necessary?
> >=20
> > I would think that userspace figures out the existence of the release
> > fence capability by seeing that the KMS property "RELEASE_FENCE_PTR"
> > either exists or not. =20
> [Vivek] Yeah, that makes sense. However, in order for the userspace to no=
t see
> this property, we'd have to prevent drm core from exposing it; which mean=
s we
> need to check dev->mode_config.release_fence before attaching the property
> to the crtc.

Kernel implementation details, I don't bother with those personally. ;-)

Sounds right.

> >=20
> > However, would we not need a client cap instead?
> >=20
> > If a KMS driver knows that userspace is aware of "RELEASE_FENCE_PTR"
> > and will use it when necessary, then the KMS driver can send the
> > pageflip completion without waiting for the host OS to signal the old
> > buffer as free for re-use. =20
> [Vivek] Right, the KMS driver can just look at whether the release_fence =
was
> added by the userspace (in the atomic commit) to determine whether it nee=
ds
> to wait for the old fb.

You could do it that way, but is it a good idea? I'm not sure.

> > If the KMS driver does not know that userspace can handle pageflip
> > completing "too early", then it has no choice but to wait until the old
> > buffer is really free before signalling pageflip completion.
> >=20
> > Wouldn't that make sense? =20
> [Vivek] Yes; DRM_CAP_RELEASE_FENCE may not be necessary to
> implement the behavior you suggest which makes sense.
>=20
> >=20
> >=20
> > Otherwise, this proposal sounds fine to me. =20
> [Vivek] Did you get a chance to review the Weston MR:
> https://gitlab.freedesktop.org/wayland/weston/-/merge_requests/668
>=20
> Could you please take a look?

Unfortunately I cannot promise any timely feedback on that, I try to
concentrate on CM&HDR. However, I'm not the only Weston reviewer, I
hope.


Thanks,
pq

>=20
> Thanks,
> Vivek
>=20
> >=20
> >=20
> > Thanks,
> > pq
> >=20
> >  =20
> > >  	default:
> > >  		return -EINVAL;
> > >  	}
> > > diff --git a/include/drm/drm_mode_config.h b/include/drm/drm_mode_con=
fig.h
> > > index 12b964540069..944bebf359d7 100644
> > > --- a/include/drm/drm_mode_config.h
> > > +++ b/include/drm/drm_mode_config.h
> > > @@ -935,6 +935,14 @@ struct drm_mode_config {
> > >  	 */
> > >  	bool normalize_zpos;
> > >
> > > +	/**
> > > +	 * @release_fence:
> > > +	 *
> > > +	 * If this option is set, it means there would be an additional sig=
nalling
> > > +	 * mechanism for a page flip completion.
> > > +	 */
> > > +	bool release_fence;
> > > +
> > >  	/**
> > >  	 * @modifiers_property: Plane property to list support modifier/for=
mat
> > >  	 * combination.
> > > diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
> > > index 3b810b53ba8b..8b8985f65581 100644
> > > --- a/include/uapi/drm/drm.h
> > > +++ b/include/uapi/drm/drm.h
> > > @@ -767,6 +767,7 @@ struct drm_gem_open {
> > >   * Documentation/gpu/drm-mm.rst, section "DRM Sync Objects".
> > >   */
> > >  #define DRM_CAP_SYNCOBJ_TIMELINE	0x14
> > > +#define DRM_CAP_RELEASE_FENCE		0x15
> > >
> > >  /* DRM_IOCTL_GET_CAP ioctl argument type */
> > >  struct drm_get_cap { =20
>=20


--Sig_/aKAOnXrgXsR.o/YY7kC30HL
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmFpMrYACgkQI1/ltBGq
qqeWkw/+NPApyoQX0fMQS0fY/UF63FZGx299hHZJtspJlgHzhxJZBHUAxcH9rSUG
ldXFDB03ogv0s6/rWNeNRtYIUKjNQUGkZrcVrFF5iyIQpG3XMP079mfjvX78vlKH
CdusHAQecuntqtD7JnIOD8i9tMvqYtbGof8dltOP3A4oCXfp4JcdXZ6YxI2YLqTc
VC3ykZ2Q9iHp9vYQITJuJj7/LrQokmoS4WvCIJq78AANeflH2vi+Cm/YlXZmGTOm
1PzO95FTXzNAncEz4yyJwZCFYEiIN1+11zVR+Q6Br4BSeqpUalxeCxjZZR2YHkJl
27GXgqu1yufFkAwBgbt/W8BNbv7G6Zz4fwQa+KjybgHyXKM1taDr5cwVmj5wckJl
ybph6tPihjp8cOhy4I1fIC6uYU5Z/d2j5YcKwY5+3oPRcduVMWbpc4eNM9Ub8ASP
TlZL0+JscALicnNqrQKMleED8V/0bXVWFXQwN8lL5p6/vru+2rgmgCXPj/dOvVPZ
7Qhj1XvnIQxpvpWfa8zWmLr89RC32o+vb1YQGJM7jUS8H8mSGMMI+1JRLIyY1jVI
99rvZUVP9DXUf7ZkQnDuIIgL7hvGodBaZjD6gGl/HkFmWodutl6rn4IiopYMIjcH
N3Z18qs1bL9gWPASXK1+Swd1FoEOZDMSLDjrFzWcIM6A4ZoIMIM=
=lNWJ
-----END PGP SIGNATURE-----

--Sig_/aKAOnXrgXsR.o/YY7kC30HL--
