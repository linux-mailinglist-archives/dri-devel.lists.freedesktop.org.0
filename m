Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D86E03321BB
	for <lists+dri-devel@lfdr.de>; Tue,  9 Mar 2021 10:14:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC4826E8B9;
	Tue,  9 Mar 2021 09:14:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B52E56E8BA;
 Tue,  9 Mar 2021 09:14:03 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id e2so19688636ljo.7;
 Tue, 09 Mar 2021 01:14:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=DECOcKkhPYROy2kkZmOqLzGelZ84ra67c5Cn74hNMyQ=;
 b=FotOsJ+Dw+mv6c2i5FXzppR/ZYPd+UrxIUcs6i7m0Bssm28DFDDEUtjZ1xR0MYmY+d
 jWSmmoxoQCJP4Qvh1I1/CiDglBLYTJmBqdm9SORNPhc8NiwBOIus8Tb8IqwmjR19uCMh
 GP430Yn3/PGkNPdMr5nj+Jg2RWVTvgkbPnGW1LoCR52MThaAznpgo13uCSab6VLTek3O
 7S9a8S7ppSU5YBksaNiwqHB5W2HnXP19llKZaezNHoSdfNMNo8/+z1CJf4mliNZWqKSQ
 yRh77XivlCChBvJCCOuwjE1miPpcA3ZkDgpjtKtwecf/YJJp8YfNLEGv47LNjHTvwuIA
 srkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=DECOcKkhPYROy2kkZmOqLzGelZ84ra67c5Cn74hNMyQ=;
 b=QObN3WxziQC1rN45MfdZ0w9o20Nhp/u3yWmnyC1NkS0d0vn8mQEdpXAuYaJ2jTkZQ9
 CRdn1N1N8sF2FP/jG2zRz/QwkZRDSiKoDeTfVrxwvUfY10LiXQp1K5+wv8LuM/t7V28E
 tqtGG+CX68OtTiKrPU6ewcoTeJqiR2ZKYr+87W5bih+Fh/T4pnCYt9mrUQP+EyKhorEq
 jFXbAeUlixU0EP+dSEFVtOgp3ALrj9UHueonY3vWabzXhrcSpWgGrxHDLuh3eee4VsAj
 qxetJR9zCv88gVdQb2LgqvRsVKyc2Uk7+CKo6fZ3FDwtOkApVo1bCHeWnKf1Bgucjtob
 /edQ==
X-Gm-Message-State: AOAM531cuc8MwGUfkc0rabssGCGKHYEjgwszRi6NfYYebqdEBF3yJcfn
 xkv+4GTRLJSzGd/dkCHdTFw=
X-Google-Smtp-Source: ABdhPJzy0bcYi/UsOOc0tFpCzKIWZnFcawvviREpOIeC/Q+O0szGkjbWdeq7mwHTqUB9BHUTeWco7w==
X-Received: by 2002:a2e:7409:: with SMTP id p9mr15810422ljc.165.1615281242109; 
 Tue, 09 Mar 2021 01:14:02 -0800 (PST)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id r27sm1683066lfm.188.2021.03.09.01.14.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 01:14:01 -0800 (PST)
Date: Tue, 9 Mar 2021 11:13:50 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: "Navare, Manasi" <manasi.d.navare@intel.com>
Subject: Re: [PATCH] drm/atomic: Add the crtc to affected crtc only if
 uapi.enable = true
Message-ID: <20210309111350.3be0543f@eldfell>
In-Reply-To: <20210309005252.GA27491@labuser-Z97X-UD5H>
References: <20210302204132.12058-1-manasi.d.navare@intel.com>
 <20210303104744.2c064f09@eldfell>
 <20210303204433.GA15819@labuser-Z97X-UD5H>
 <20210304104223.6b3490bc@eldfell>
 <20210309005252.GA27491@labuser-Z97X-UD5H>
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
Cc: Daniel Vetter <daniel.vetter@intel.com>, intel-gfx@lists.freedesktop.org,
 Daniel Stone <daniels@collabora.com>, dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0122331738=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0122331738==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/fJs4hDQmYkbr/_MAKjqf_7A"; protocol="application/pgp-signature"

--Sig_/fJs4hDQmYkbr/_MAKjqf_7A
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 8 Mar 2021 16:52:58 -0800
"Navare, Manasi" <manasi.d.navare@intel.com> wrote:

> On Thu, Mar 04, 2021 at 10:42:23AM +0200, Pekka Paalanen wrote:
> > On Wed, 3 Mar 2021 12:44:33 -0800
> > "Navare, Manasi" <manasi.d.navare@intel.com> wrote:
> >  =20
> > > On Wed, Mar 03, 2021 at 10:47:44AM +0200, Pekka Paalanen wrote: =20
> > > > On Tue,  2 Mar 2021 12:41:32 -0800
> > > > Manasi Navare <manasi.d.navare@intel.com> wrote:
> > > >    =20
> > > > > In case of a modeset where a mode gets split across mutiple CRTCs
> > > > > in the driver specific implementation (bigjoiner in i915) we wron=
gly count
> > > > > the affected CRTCs based on the drm_crtc_mask and indicate the st=
olen CRTC as
> > > > > an affected CRTC in atomic_check_only().
> > > > > This triggers a warning since affected CRTCs doent match requeste=
d CRTC.
> > > > >=20
> > > > > To fix this in such bigjoiner configurations, we should only
> > > > > increment affected crtcs if that CRTC is enabled in UAPI not
> > > > > if it is just used internally in the driver to split the mode.   =
=20
> > > >=20
> > > > Hi,
> > > >=20
> > > > I think that makes sense to me. Stealing CRTCs that are not current=
ly
> > > > used by the userspace (display server) should be ok, as long as that
> > > > is completely invisible to userspace: meaning that it does not cause
> > > > userspace to unexpectedly e.g. receive or miss per-crtc atomic
> > > > completion events.   =20
> > >=20
> > > Yes since we are only doing atomic_check_only() here, the stolen =20
> >=20
> > But the real not-test-only commit will follow if this test-only commit
> > succeeds, and keeping the guarantees for the real commit are important.=
 =20
>=20
> Hmm well after the actual real commit, since the second crtc is stolen
> even though it is not being used for the display output, it is
> used for joiner so the uapi.enable will be true after the real commit.
>=20
> so actually the assertion would fail in this case.
>=20
> @Ville @Danvet any suggestions here in that case?


Hi,

that is not what I was talking about, but sounds like you found a
different problem. It seems like the problem you are talking about
would be guaranteed to be hit if bigjoiner was used. Have you not
tested this?

However, I was talking about the real commit itself, not what happens
on commits after it, see below.

> > > crtc is completely invisible to the userspace and hence that is=20
> > > indicated by uapi.enable which is not true for this stolen
> > > crtc. However if allow modeset flag set, then it will do a full
> > > modeset and indicate the uapi.enable for this stolen crtc as well
> > > since that cannot be used for other modeset requested by userspace.
> > >  =20
> > > >=20
> > > > Can that also be asserted somehow, or does this already do that?   =
=20
> > >=20
> > > Not clear what you want the assertion for? Could you elaborate =20
> >=20
> > As assertion that when the real atomic commit happens and then
> > completion events are fired, they match exactly the affected crtcs mask.

This is my concern and a question, although like I say below, only
tangential to this patch.

However, as this patch aims to allow bigjoiner usage, naturally the
question will arise whether the completion events then match what
userspace expects or not. Userspace does not expect completion events
referring to the stolen CRTCs.

> > I understand this may be off-topic for this particular patch, but since
> > we are discussing the topic, such checks would be really nice. I'm
> > curious if such checks already exist.


Thanks,
pq

> > > > > ---
> > > > >  drivers/gpu/drm/drm_atomic.c | 6 ++++--
> > > > >  1 file changed, 4 insertions(+), 2 deletions(-)
> > > > >=20
> > > > > diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_a=
tomic.c
> > > > > index 5b4547e0f775..d7acd6bbd97e 100644
> > > > > --- a/drivers/gpu/drm/drm_atomic.c
> > > > > +++ b/drivers/gpu/drm/drm_atomic.c
> > > > > @@ -1358,8 +1358,10 @@ int drm_atomic_check_only(struct drm_atomi=
c_state *state)
> > > > >  		}
> > > > >  	}
> > > > > =20
> > > > > -	for_each_new_crtc_in_state(state, crtc, new_crtc_state, i)
> > > > > -		affected_crtc |=3D drm_crtc_mask(crtc);
> > > > > +	for_each_new_crtc_in_state(state, crtc, new_crtc_state, i) {
> > > > > +		if (new_crtc_state->enable)
> > > > > +			affected_crtc |=3D drm_crtc_mask(crtc);
> > > > > +	}
> > > > > =20
> > > > >  	/*
> > > > >  	 * For commits that allow modesets drivers can add other CRTCs =
to the   =20

--Sig_/fJs4hDQmYkbr/_MAKjqf_7A
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmBHPE4ACgkQI1/ltBGq
qqc6RA/8DfWvzxtc+zuK25kyEbjpgB6rk+fvxzKEZ/+1c7JLSxVJ1QH5cOhjVlB+
9d8tqvNAWoQqUu5klLoQxIrrYo6vckC7n0UiXhAy4/Rey8DSo1X45OjrptBJACef
V+LIE361mBtGYjd+0cFn75vv9nilQxjPSqFCRLnKmotpgaMDxSlrLwS9LQh/2Rjb
lM8PcurpDKU3kCblPgbLDb50u84S3OYep9L9IFXieF9LSPpDDf1EXSJdu9PrWngr
ZqZj9q1LZCXB4m8tM5ZPOXuQcrF62oNaMbjjR/dhzdUaXWuzdFbsokAQU+QdM3dx
7qi76uudqfdA2Ddzb7arzQ/trsMMN2dhylQaALIan9gf0gG8P3IkDVzhpaWMgD56
RtnuniTp03C1/3vtO5sqnNJN2FhjSGkbx8KKsLQSvJlOVVmCXek7fLIXSUbG6X2D
pSlBjqxOk6fSQe6Eq3EP+ubRa4ztaHCgKHuAu0ykI2FrqyGzAO3gqBgIfwvtioWo
DIs5B3HlRwranoaIBq5YhkCy9YHNnF24yyIC8yy+edKSRhTKMKA8KJV8itaKn4t1
n0QdqDcn8r5TO2Y4fJdhO6a7ogEXGGaY2ysfz+yOTyXKGEIN8SQhxty2x8w1TJM2
MgeB/i7ONxHvS43nEOj622BbevfxT3+1PIOezNfs4bUIhYGCfIk=
=Km5P
-----END PGP SIGNATURE-----

--Sig_/fJs4hDQmYkbr/_MAKjqf_7A--

--===============0122331738==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0122331738==--
