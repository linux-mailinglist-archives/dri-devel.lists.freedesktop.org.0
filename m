Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB8435A2B44
	for <lists+dri-devel@lfdr.de>; Fri, 26 Aug 2022 17:29:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0989610E983;
	Fri, 26 Aug 2022 15:29:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40D0810E983
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Aug 2022 15:29:35 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id x24so1917580lji.9
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Aug 2022 08:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc;
 bh=tJ+pbXnz9iP/IXmR3rLb08zOF+iDHolQjxbuBDfFW3k=;
 b=UoavJ7LsN01Pdeu17b9bM39oab63PaTHrdF/kOV8Egqmx9GkG5INMefV2xu1LC5jRH
 aXW2FOLqtCUj7Dgu5ZkqPq0yWh9xsfa41rFfnkn9OcnvoeSEG9kVagnS3K9Bz5RzYOHa
 M4eX1FiedHc20Ljkm+Nb0mTvpSG3cHdRqI6LbIOyxdEkffU5VF3Pr+A6GjppN1uOUcZp
 +G3qKYIOC0Qh7JFmrmSKD5OIC0LhRBfAU56gQBZIAuCmdG7YzDzkCmZI6Wxg7bku+IoZ
 Tbp/qxVYbHtXth3unPXFZFAj4W55o9uD0GcPlUY+rBRKxyua7RG/jKx/G46tSA/HAwrX
 t9+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc;
 bh=tJ+pbXnz9iP/IXmR3rLb08zOF+iDHolQjxbuBDfFW3k=;
 b=Uee7pDRiHWNUvtWuTnwqdMrtZA2j/aPT/H8hvy2STYHP2bpSlRWWyTNPaYKY4du65P
 /Q84+VRwn0Kzy1i4FLqLR1AkVVoDXp/9asAEWxdQxoi1DAyrcxEemXdLZ7Yg1HXWrnk5
 2n2VFH/W6rum3PUM+NSFjoOr8hIwW/UhOb0fj9xX4DYaC7KgILUPLODz4ggI8fbvEIn2
 yq/sIdcyaVGwbT99IRk/6GH5ccfrHt4Ry4ccHgUzvVylzMwKSX/CF10JZEwXhGE+2ASD
 2rF7Y1SIdgwOZ3VS3Xflk0YV1jnHo4mOimEAMyRGST8LDu4kwcEmyAOOuEiPoCWAmld5
 0j+Q==
X-Gm-Message-State: ACgBeo25a83pJggqouh6GS2fceqfUEogmgdiXOr8KI7N3s6ftrx+XCpT
 Fxkf9Uwfu5ThfJSW/qrM7eE=
X-Google-Smtp-Source: AA6agR7z+9hdLosxReGnm+w8oQKz3GpBw5wpOzp/0EJCwauFNQaUDDon4sw5izV+K+2m3ndC09eYqQ==
X-Received: by 2002:a05:651c:2102:b0:25a:42ee:49ae with SMTP id
 a2-20020a05651c210200b0025a42ee49aemr2445331ljq.200.1661527773400; 
 Fri, 26 Aug 2022 08:29:33 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 y9-20020a196409000000b0048af749c060sm405243lfb.157.2022.08.26.08.29.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Aug 2022 08:29:32 -0700 (PDT)
Date: Fri, 26 Aug 2022 18:29:23 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Simon Ser <contact@emersion.fr>
Subject: Re: drm: document uAPI page-flip flags
Message-ID: <20220826182923.4a3c4d52@eldfell>
In-Reply-To: <dymn9p8A58W2u-z1I-PocnedBBSIeGHgcWLmUGTuPbL94siIRNuDF_zixDYCS6xaIuneOmVgs8Kk4kTg0foC7ud1p0_OsyHR2uzeDtbT8sM=@emersion.fr>
References: <20220824174459.441976-1-contact@emersion.fr>
 <20220826115355.668e13ca@eldfell>
 <CA+hFU4zUi42eKGbJfeB3caKXnZ_xQ5dQ_bu83EFVLM-S9SqkwQ@mail.gmail.com>
 <1mpWeZzQLcq5D99K0SJS_TB1xrG-YDLYDYcMwRpelbtZCA_PY3TSWwZKQnOBbtyiguz3bxbnDUq2PH5qbzz1Kt-xMoh4sLzzK2IbJQIRKTg=@emersion.fr>
 <CA+hFU4yjumfFPR-ke_6BCP95Xdw3COZrrTf24h4PH3-ko2UvaA@mail.gmail.com>
 <dymn9p8A58W2u-z1I-PocnedBBSIeGHgcWLmUGTuPbL94siIRNuDF_zixDYCS6xaIuneOmVgs8Kk4kTg0foC7ud1p0_OsyHR2uzeDtbT8sM=@emersion.fr>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/uGWlf=Ud.YUJ+pO3AR+c3Ag";
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Sebastian Wick <sebastian.wick@redhat.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/uGWlf=Ud.YUJ+pO3AR+c3Ag
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri, 26 Aug 2022 13:17:09 +0000
Simon Ser <contact@emersion.fr> wrote:

> On Friday, August 26th, 2022 at 15:10, Sebastian Wick <sebastian.wick@red=
hat.com> wrote:
>=20
> > On Fri, Aug 26, 2022 at 2:17 PM Simon Ser contact@emersion.fr wrote:
> >  =20
> > > On Friday, August 26th, 2022 at 11:49, Sebastian Wick sebastian.wick@=
redhat.com wrote:
> > >  =20
> > > > > > +/*
> > > > > > + * DRM_MODE_ATOMIC_ALLOW_MODESET
> > > > > > + *
> > > > > > + * Allow the update to result in visible artifacts such as a b=
lack screen. =20
> > > > >=20
> > > > > Maybe add:
> > > > >=20
> > > > > ...temporary or transient visible artifacts while the update is
> > > > > being applied. Applying the update may also take significantly
> > > > > more time than a page flip. The visual artifacts will not
> > > > > appear after the update is completed.
> > > > >=20
> > > > > This flag must be set when the KMS update might cause visible
> > > > > artifacts. Without this flag such KMS update will return EINVAL
> > > > > error. What kind of updates may cause visible artifacts depends
> > > > > on the driver and the hardware. Userspace that needs to know
> > > > > beforehand if an update might cause visible artifacts can use
> > > > > DRM_MODE_ATOMIC_TEST_ONLY without DRM_MODE_ATOMIC_ALLOW_MODESET
> > > > > to see if it fails.
> > > > >=20
> > > > > Visual artifacts are guaranteed to not appear when this flag is
> > > > > not set. =20
> > > >=20
> > > > That doesn't seem to be true, though. For example setting
> > > > HDR_OUTPUT_METADATA for example does result in visual artifacts on =
my
> > > > display no matter if the flag is specified or not because the
> > > > artifacts are not the result of a mode set but of the display react=
ing
> > > > to some AVI InfoFrame. =20
> > >=20
> > > One would need to read the HDMI spec to see if there's anything in
> > > there about artifacts on AVI InfoFrame change, then figure out whether
> > > this is a bug in the physical screen itself or whether the kernel
> > > driver should require ALLOW_MODESET when updating the HDR metadata. =
=20
> >=20
> > I'm not even sure if that's the right thing to do. ALLOW_MODESET isn't
> > really about if a commit can lead to visual artifacts but about
> > keeping the existing links alive (someone with more knowledge on this
> > subject probably has a better description for this). An async commit
> > can also introduce visual artifacts for example and there are probably
> > more cases. =20
>=20
> That's certainly not the intent of ALLOW_MODESET.

One could look at this from the perspective of who is allowed to break.
Maybe the monitor is allowed to break any time (because it is out of
our reach anyway, we can only control the electrical signals going into
the cable), but the source hardware (the display block, everything
before "the cable") is allowed to break only with ALLOW_MODESET.

IOW, if the electrical signal is kept "glitch free" in the sense that
the sink (or a human looking at a sink) cannot see artifacts, then
ALLOW_MODESET is not required. One could even change the video mode
without ALLOW_MODESET if it does not result in artifacts, like
switching from one constant refresh rate to another on VRR capable
hardware - or what I heard Intel does with some transparent power
saving by halving the refresh rate when nothing is changing.

So, at the minimum we must require that the electrical signal cannot
"break". Do we include what a monitor does in ALLOW_MODESET or not is
something I'm not sure, since different sinks presumably break on
different changes.

> See the kernel docs for atomic_check:
>=20
> > This callback also needs to correctly fill out the drm_crtc_state in
> > this update to make sure that drm_atomic_crtc_needs_modeset() reflects
> > the nature of the possible update and returns true if and only if the
> > update cannot be applied without tearing within one vblank on that
> > CRTC. The core uses that information to reject updates which require
> > a full modeset (i.e. blanking the screen, or at least pausing updates
> > for a substantial amount of time) if userspace has disallowed that in
> > its request. =20
>=20
> I'm sure Daniel Vetter can confirm this as well.

I guess the new ASYNC flag patches will fix this wording to allow
tearing in that case?


Thanks,
pq

--Sig_/uGWlf=Ud.YUJ+pO3AR+c3Ag
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmMI5tMACgkQI1/ltBGq
qqdkRg//ZgOxh7RBvj2hICzpR8EVMsRySO2lFqBRp7Imn3jQ4cS2ZQQpGNW6l5V9
Prosq63LRDtb6pt4c4CuP1odmKBFLF3UEYq2QzMQtuwf2ZKcu6QhEARTv2+m0HLV
ie0LL0vMuV1jfxKM2PbbB5fDTTQqvm8TLs+vDOjG+4j5N8PVV5/K/0+uJJ4tysc6
MNCJdnMenQ9RuD0JnI4WWqudjtCyeT/tYMLRIY6Nfe/r1zK6tTgRe/fqif/kaO+5
g20R25Nm85DnIOe4p/X1juVJDB6IGSSSA03S514m0kfmTm+9YweboWTEIpkvHH/V
A9TOtjWNNM/toqurrRgmBvcFWatOwQ2E5ZjgAhM3OEiAmIbvt0jY3BinXnDb32aW
u94c9E/Fu5JqVDRG8sKR35lPWz6GS+AThTNK+4mkr4DyybmxJ3uItW1RbpR5pFxB
pyaYxL8yNpK9MfOz/hNcGAiISgXxDIkRaWga027M7tfvYtfn1G/T2YO2YkZeXQcS
RQUwVym3BRqoYe4FVhMISNlmo37jd7YU8MkFOfqxs3un0iohxQsBVEqpcPcQUxNY
jOV9sF1RrcyELi1Chac+y0xTVzKudJt0/IJpK5gmRxpRksq8ow8W7I4rkQ+eR2iI
0i2emAjJEvPsTeVYOSPQu+5JC1vQGnn1pyPCMYicL0UCnVpeRsM=
=GLJc
-----END PGP SIGNATURE-----

--Sig_/uGWlf=Ud.YUJ+pO3AR+c3Ag--
