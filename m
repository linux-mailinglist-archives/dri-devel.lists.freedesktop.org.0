Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 03EB160704
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jul 2019 15:59:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 634386E4C5;
	Fri,  5 Jul 2019 13:59:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87E9C6E4C5;
 Fri,  5 Jul 2019 13:59:33 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id k18so9356765ljc.11;
 Fri, 05 Jul 2019 06:59:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=nCX3LDQqCGOosRi/7XjtYEYl84Ysjuj1iofNXjKUWhg=;
 b=gAZfXjAo91WCPVVdi+oNtxVuhp1P0fP3nl74puXiUK6hCBWtHezzi7IKmnQ1D4c1KI
 9rzAZY9JINLHZ3Cu2Whtg3LMGkhvrblELtB5/+MjkOMkpPdOzWmbBGxaX8FoBAX1lt7g
 zmOPP7wYjCfB129/qBlKEwAnfhHutl3C42bR69DKfEyTmvX/Q66VLvrx2Sv6VycPUzhS
 1TylfdijeWgc299Mj6lQRVxF3AKCf6NqlqgD3mFxV/rp8yF9Etr8cGiWNwAXdc4Rd1x2
 q1skMhoirRXaq/T5YyD+vVUu9HlinmTM6bWoY/VYBsUq5qMEPTQ2qGseJNHAEJZ6QoM3
 mu0Q==
X-Gm-Message-State: APjAAAXpoRRBAl7k2mEm3XBMVsrAMuYiFaUc8it30VYw6FX0Qbm6upiW
 G5d6gLWiNe+ATP6u0mdiESi+5Own
X-Google-Smtp-Source: APXvYqzl4zU1JfCHPiFXpjtm36bI2q95QOqdpFyPJhjkTpCVo8ti8PMJTeOtOFgJhVosIte8JDe0yw==
X-Received: by 2002:a2e:9685:: with SMTP id q5mr2271179lji.227.1562335171952; 
 Fri, 05 Jul 2019 06:59:31 -0700 (PDT)
Received: from eldfell.localdomain ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id l25sm1777172lja.76.2019.07.05.06.59.31
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 05 Jul 2019 06:59:31 -0700 (PDT)
Date: Fri, 5 Jul 2019 16:59:27 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Ramalingam C <ramalingam.c@intel.com>
Subject: Re: [PATCH v7 10/11] drm/hdcp: update content protection property
 with uevent
Message-ID: <20190705165927.7934c895@eldfell.localdomain>
In-Reply-To: <20190704111115.GC27121@intel.com>
References: <20190507162745.25600-1-ramalingam.c@intel.com>
 <20190507162745.25600-11-ramalingam.c@intel.com>
 <20190704141419.145ff9bf@eldfell.localdomain>
 <20190704111115.GC27121@intel.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version;
 bh=nCX3LDQqCGOosRi/7XjtYEYl84Ysjuj1iofNXjKUWhg=;
 b=s9gXfudBDjnVl8sEqrmj7vf3J3Y1YP5tFiQ1bX09o/KVALPF8bkvb3dA75yK/HQpTF
 aZ1KjkgHUZhYuie4W6kLRGp1wVXIT4SkDm/FwY/Cfh+vcl3VvFe5QeoreF3Z51hgWf39
 qTc1A09VpD2AounkSiA3PX8UZp+SteNoclmu2cUTj3J6ZYM7QxI6zhY7W3jBiAr4kza3
 gzZmAXo0Oetb1fhcMKxoAJJ8B0+MXcwNGUr8ewfM2Y8SLy00LFbiqjS5bFhzeXlALoMl
 3cQHMBbebIVYP42iofV5JrotmmsNZYBbdBrDAuLjQuW0j/WX4naHeBc39UHqkgGEiduj
 AY1A==
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
Cc: daniel.vetter@intel.com, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, gwan-gyeong.mun@intel.com
Content-Type: multipart/mixed; boundary="===============1484395750=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1484395750==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/Y4cjzomjw8RzYODQOvjKtUG"; protocol="application/pgp-signature"

--Sig_/Y4cjzomjw8RzYODQOvjKtUG
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 4 Jul 2019 16:41:15 +0530
Ramalingam C <ramalingam.c@intel.com> wrote:

> On 2019-07-04 at 14:14:19 +0300, Pekka Paalanen wrote:
> > On Tue,  7 May 2019 21:57:44 +0530
> > Ramalingam C <ramalingam.c@intel.com> wrote:
> >  =20
> > > drm function is defined and exported to update a connector's
> > > content protection property state and to generate a uevent along
> > > with it.
> > >=20
> > > Need ACK for the uevent from userspace consumer.
> > >=20
> > > v2:
> > >   Update only when state is different from old one.
> > > v3:
> > >   KDoc is added [Daniel]
> > >=20
> > > Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
> > > Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> > > ---
> > >  drivers/gpu/drm/drm_hdcp.c | 32 ++++++++++++++++++++++++++++++++
> > >  include/drm/drm_hdcp.h     |  2 ++
> > >  2 files changed, 34 insertions(+)
> > >=20
> > > diff --git a/drivers/gpu/drm/drm_hdcp.c b/drivers/gpu/drm/drm_hdcp.c
> > > index 75402463466b..f29b7abda51f 100644
> > > --- a/drivers/gpu/drm/drm_hdcp.c
> > > +++ b/drivers/gpu/drm/drm_hdcp.c
> > > @@ -372,6 +372,10 @@ DRM_ENUM_NAME_FN(drm_get_hdcp_content_type_name,
> > >   *
> > >   * The content protection will be set to &drm_connector_state.conten=
t_protection
> > >   *
> > > + * When kernel triggered content protection state change like DESIRE=
D->ENABLED
> > > + * and ENABLED->DESIRED, will use drm_hdcp_update_content_protection=
() to update
> > > + * the content protection state of a connector. =20
> Here we indicated that drm_hdcp_update_content_protection() used for
> kernel triggered content protection state change.

Hi,

sure. I don't know how a userspace programmer could guess it is in any
way relevant to when the events are sent and when not. They wouldn't
even read the doc of this function to begin with.

> > > + *
> > >   * Returns:
> > >   * Zero on success, negative errno on failure.
> > >   */
> > > @@ -412,3 +416,31 @@ int drm_connector_attach_content_protection_prop=
erty(
> > >  	return 0;
> > >  }
> > >  EXPORT_SYMBOL(drm_connector_attach_content_protection_property);
> > > +
> > > +/**
> > > + * drm_hdcp_update_content_protection - Updates the content protecti=
on state
> > > + * of a connector
> > > + *
> > > + * @connector: drm_connector on which content protection state needs=
 an update
> > > + * @val: New state of the content protection property
> > > + *
> > > + * This function can be used by display drivers, to update the kerne=
l triggered
> > > + * content protection state change of a drm_connector.This function =
update the =20
> These lines also indicate that this function is used for kernel
> triggered content protection state change of a drm_connector.

How could any userspace programmer know to decipher what this means
for event sending?

The event semantics must be documented somewhere where userspace people
actually read. In this case it would be with the definition of the
connector property for which the event was added, lacking a proper
place for UAPI docs.

>=20
> -Ram
> > > + * new state of the property into the connector's state and generate=
 an uevent
> > > + * to notify the userspace.
> > > + */
> > > +void drm_hdcp_update_content_protection(struct drm_connector *connec=
tor,
> > > +					u64 val)
> > > +{ =20
> >=20
> > Hi,
> >=20
> > don't you need to ensure that 'val' cannot be UNDESIRED? =20
> @ https://patchwork.freedesktop.org/patch/303909/?series=3D57232&rev=3D9
> caller(I915) of this function is ensuring that.

Yes, the caller does that right now. Don't you want to catch other
callers written by someone else who don't know or forget to do the same
check as i915 does?

Isn't that what all the WARN_ON etc. macros are mostly about, to catch
badly written kernel code?

I mean, it is at least a semantic kernel bug if anyone attempts to
call this function with UNDESIRED, right? Because when they do, this
function may send the uevent.

> > > +	struct drm_device *dev =3D connector->dev;
> > > +	struct drm_connector_state *state =3D connector->state;
> > > +
> > > +	WARN_ON(!drm_modeset_is_locked(&dev->mode_config.connection_mutex));
> > > +	if (state->content_protection =3D=3D val) =20
> when val=3D=3DUNDESIRED even the state->content_protection also UNDESIRED.
> Hence explicit check is not needed here.

So it accidentally won't cause any visible harm? Until something subtly
changes elsewhere and it does.


Thanks,
pq

>=20
> -Ram
> >  =20
> > > +	struct drm_device *dev =3D connector->dev;
> > > +	struct drm_connector_state *state =3D connector->state;
> > > +
> > > +	WARN_ON(!drm_modeset_is_locked(&dev->mode_config.connection_mutex));
> > > +	if (state->content_protection =3D=3D val)
> > > +		return;
> > > +
> > > +	state->content_protection =3D val;
> > > +	drm_sysfs_connector_status_event(connector,
> > > +				 dev->mode_config.content_protection_property);
> > > +}
> > > +EXPORT_SYMBOL(drm_hdcp_update_content_protection);
> > > diff --git a/include/drm/drm_hdcp.h b/include/drm/drm_hdcp.h
> > > index 2970abdfaf12..dd864ac9ce85 100644
> > > --- a/include/drm/drm_hdcp.h
> > > +++ b/include/drm/drm_hdcp.h
> > > @@ -292,4 +292,6 @@ bool drm_hdcp_check_ksvs_revoked(struct drm_devic=
e *dev,
> > >  				 u8 *ksvs, u32 ksv_count);
> > >  int drm_connector_attach_content_protection_property(
> > >  		struct drm_connector *connector, bool hdcp_content_type);
> > > +void drm_hdcp_update_content_protection(struct drm_connector *connec=
tor,
> > > +					u64 val);
> > >  #endif =20
> >=20
> > This patch is missing all UAPI documentation.
> >=20
> > Particularly important is the detail that the kernel will not send an
> > event corresponding to userspace explicitly setting "Content
> > Protection" to "Undesired". That is what you explained to me in the
> > Weston MR !48, but I don't actually see it in the code here. It would
> > be best to enforce that in the shared DRM code.
> >=20
> >=20
> > Thanks,
> > pq =20
>=20
>=20


--Sig_/Y4cjzomjw8RzYODQOvjKtUG
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl0fV78ACgkQI1/ltBGq
qqdjsQ//c0GtvTQ0XHz4Ir6lezLBYNm6H6zGTdI8HQgDsGfVc+3L44Bkzqk/UHSa
SVJnjZW/8t4mW+pwDHLVmhBP4v0mw7ExbqXE5TekSnuaRFs+GlrEr/XZPH5NtqqW
PybTq82ZejfhNWDkPfQPeT+P5doX0bABIePJnYVp6ZqNGnSOjnD7+Oylx19IJvLz
gtIWzqwdFQ5JWDkOXBZvQhd2AvT7PGyy3oZIIXalnR/fouCj8hxOYtZG5YiTboo7
5v0EP7UwluoVhGI9TW8n8peZmoxY/NHPbLMuesvoqr4KOWDVH8Agud7FON768EHm
1M4tuRL6iMU7/HXYX4wtSLw6Gv9X3QSiQClOotyx2RlfLzvIRJDkHsHcKC/EN+/w
ZEkcwLt5AWl5fMBecf8gtuSQqUeM4nASA6RY/OhLabChsDdlbDtdBT73ci3kMEeJ
que8f4x0d0RRfJ6lPI0+1fckJ0mpyCLQl23SXmoHbY1btDHZKtiRoQAURe9XKI9x
0cmYvkijXKHSqsIk4Fnf7gf9qQGSafQO1huwbcVJdio3UM6WpcO3oYiRJRvoKALu
8H3DHA4ZGLRFMzBXdH3HTPy+/CkpVZhziCCyhQQTYUl9ibcocJQg5p8RB77pNNNU
G61Z1qx3kUjccYl1svaeX4Fw87xb/bsaIo5WPh2oqm5LX5VGfcA=
=SMaG
-----END PGP SIGNATURE-----

--Sig_/Y4cjzomjw8RzYODQOvjKtUG--

--===============1484395750==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1484395750==--
