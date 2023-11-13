Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 08E2B7E99ED
	for <lists+dri-devel@lfdr.de>; Mon, 13 Nov 2023 11:15:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CBA910E33C;
	Mon, 13 Nov 2023 10:15:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E81D910E041;
 Mon, 13 Nov 2023 10:15:15 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-50a6ff9881fso4521443e87.1; 
 Mon, 13 Nov 2023 02:15:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699870514; x=1700475314; darn=lists.freedesktop.org;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=4rzaUs2XAqeA/RwRAkAgsgiaQodYWE7wdOheKWd5RMI=;
 b=Y5kQWucqyvEK1iYWCHwTJDN253TVfi69CYCabWyZrawKgRc6WszEsTlZljvDUMARDi
 qKcmrNLnVbhu2HbTJy5qiL43XMFCHsLCHenEJnfTMWzR7nSZsS/I0akcz8RFJ3VHOd7X
 faQ4h/WlYhLj9oSEioTpTKwVCjqDc3geMm9b/e7kdPkmnIbNt+PayGjhweZRpE26z8HK
 qQmsYFFdmP7WDL9G1gb4V0ueTkammRJI/wqtwd9WrnRo5ffGyDA+RB23XJSc0lUIx3el
 3HS2HYfgBMf0mNodsEOi5x44UJPa+/7tEzzaRvBxTSo5EA47pFXz/CDC7Bea253Blnv3
 1bOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699870514; x=1700475314;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4rzaUs2XAqeA/RwRAkAgsgiaQodYWE7wdOheKWd5RMI=;
 b=VDvWbOP9RbTmihbu4AvpsQaSIOy88smRw6Np7V3WrEPg0hlkqYXQ7x3r42eUJrE5FK
 FV6qzhAM2v0BjC7wp5mqobkMmmPwqWstsBz+Q6q4Iljbd9oDM9EaCzrVk9oh8v/lBv3D
 rV8bQEqPuHZvNUWN1JdseFvefKx9sS3R0h7nuh08bKCrqdt3L+YBHDy5jrdxzRrf6MFv
 JqNdPUhzjGf8RBZFUfFNOUKfBIgCg5AVbz8F7drysPG1tCOiSXQJb5AYABwNSf8SwY/I
 UjHiya51d7QIGL4UkPvbFCBW955jD5jnH3qCz6VFSXEP/M+YTvz8qA4axc0F6/Ok/xq1
 92Yw==
X-Gm-Message-State: AOJu0YzEU7oRj5tzStZzMksJTE3JWuO1cvwAsFWAOusFJnsA9d/fnEz2
 V8V9Fcp5vL1Y3y+b89403L8=
X-Google-Smtp-Source: AGHT+IHtYW+7Xf0/srPPhEqOEnKJaAXNGJ9qvsN45itd/Zr75+AjH5CsC3G+tdXul0NcVxuVwX18aQ==
X-Received: by 2002:a2e:bc25:0:b0:2c5:23f8:1111 with SMTP id
 b37-20020a2ebc25000000b002c523f81111mr5497470ljf.41.1699870513595; 
 Mon, 13 Nov 2023 02:15:13 -0800 (PST)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 a16-20020a2e8610000000b002c0055834b3sm941568lji.4.2023.11.13.02.15.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Nov 2023 02:15:13 -0800 (PST)
Date: Mon, 13 Nov 2023 12:15:08 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v6 6/6] drm/doc: Define KMS atomic state set
Message-ID: <20231113121508.16a75352@eldfell>
In-Reply-To: <ha7UwaZ0eilF_Hl6wWqJXJQ0oy9_rD1FKUNDwIlNxC-vT3InSP4bpTRwVnZG9QvzZBsX4W-p_vz5FfByoAXuGewyhVtwVd4KyRSMJ4G8cQ4=@emersion.fr>
References: <20230815185710.159779-1-andrealmeid@igalia.com>
 <aa424bf8-5652-4a44-9b93-bdc0a31d835a@igalia.com>
 <20231016175222.7a89e6ab@eldfell> <ZS1ST6XAUHilBg3d@intel.com>
 <8NqDNz1Y8H5I_WhNhOj0ERarBH7nJhGQAsDHbmSnwzoOFtXPBPILwxLlF8-vDPKR06Uknp1BDSt7-6gTmHls62k79ETajXDfPRsmIP-cZN0=@emersion.fr>
 <ZS55mXTSxpXKYbsd@intel.com>
 <mawSNnD1hQ6vCVrNVMAvuQESnTToKPXrtiHIXXdqC-mq_LkxWOizPCcXx_KiEASVX-Mbm0LgjfTYkMNOjSAKCldpkXHAd9MmRzbC8ECPsTs=@emersion.fr>
 <5_NYn1PEc-XUYiRf5fC9oQqTaJxoAuvHVvw1PVTume5m8_cbOyku2Q2XKdCm66g0WcMq_RL8oSp52AowBzX9WAEiVBgdmYtPeXI9SWnD6Ts=@emersion.fr>
 <20231113113804.6e2adfa8@eldfell>
 <ha7UwaZ0eilF_Hl6wWqJXJQ0oy9_rD1FKUNDwIlNxC-vT3InSP4bpTRwVnZG9QvzZBsX4W-p_vz5FfByoAXuGewyhVtwVd4KyRSMJ4G8cQ4=@emersion.fr>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/6bNbi9WwCvCAexOid30925v";
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
Cc: pierre-eric.pelloux-prayer@amd.com,
 =?UTF-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>,
 'Marek =?UTF-8?B?T2w=?= =?UTF-8?B?xaHDoWsn?= <maraeo@gmail.com>,
 Michel =?UTF-8?B?RMOkbnplcg==?= <michel.daenzer@mailbox.org>,
 Randy Dunlap <rdunlap@infradead.org>, xaver.hugl@gmail.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, kernel-dev@igalia.com,
 alexander.deucher@amd.com, joshua@froggi.es,
 wayland-devel@lists.freedesktop.org, hwentlan@amd.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/6bNbi9WwCvCAexOid30925v
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 13 Nov 2023 09:44:15 +0000
Simon Ser <contact@emersion.fr> wrote:

> On Monday, November 13th, 2023 at 10:38, Pekka Paalanen <ppaalanen@gmail.=
com> wrote:
>=20
> > On Mon, 13 Nov 2023 09:18:39 +0000
> > Simon Ser contact@emersion.fr wrote:
> >  =20
> > > On Monday, October 23rd, 2023 at 10:25, Simon Ser contact@emersion.fr=
 wrote:
> > >  =20
> > > > > > > > > > > > > +An atomic commit with the flag DRM_MODE_PAGE_FLI=
P_ASYNC is allowed to
> > > > > > > > > > > > > +effectively change only the FB_ID property on an=
y planes. No-operation changes
> > > > > > > > > > > > > +are ignored as always. [...]
> > > > > > > > > > > > > During the hackfest in Brno, it was mentioned tha=
t a commit which re-sets the same FB_ID could actually have an effect with =
VRR: It could trigger scanout of the next frame before vertical blank has r=
eached its maximum duration. Some kind of mechanism is required for this in=
 order to allow user space to perform low frame rate compensation. =20
> > > > > > > > > > >=20
> > > > > > > > > > > Xaver tested this hypothesis in a flipping the same f=
b in a VRR monitor
> > > > > > > > > > > and it worked as expected, so this shouldn't be a con=
cern.
> > > > > > > > > > > Right, so it must have some effect. It cannot be simp=
ly ignored like in
> > > > > > > > > > > the proposed doc wording. Do we special-case re-setti=
ng the same FB_ID
> > > > > > > > > > > as "not a no-op" or "not ignored" or some other way?
> > > > > > > > > > > There's an effect in the refresh rate, the image won'=
t change but it
> > > > > > > > > > > will report that a flip had happened asynchronously s=
o the reported
> > > > > > > > > > > framerate will be increased. Maybe an additional word=
ing could be like: =20
> > > > > > > > >=20
> > > > > > > > > Flipping to the same FB_ID will result in a immediate fli=
p as if it was
> > > > > > > > > changing to a different one, with no effect on the image =
but effecting
> > > > > > > > > the reported frame rate. =20
> > > > > > > >=20
> > > > > > > > Re-setting FB_ID to its current value is a special case reg=
ardless of
> > > > > > > > PAGE_FLIP_ASYNC, is it not? =20
> > > > > > >=20
> > > > > > > No. The rule has so far been that all side effects are observ=
ed
> > > > > > > even if you flip to the same fb. And that is one of my annoya=
nces
> > > > > > > with this proposal. The rules will now be different for async=
 flips
> > > > > > > vs. everything else. =20
> > > > > >=20
> > > > > > Well with the patches the async page-flip case is exactly the s=
ame as
> > > > > > the non-async page-flip case. In both cases, if a FB_ID is incl=
uded in
> > > > > > an atomic commit then the side effects are triggered even if th=
e property
> > > > > > value didn't change. The rules are the same for everything. =20
> > > > >=20
> > > > > I see it only checking if FB_ID changes or not. If it doesn't
> > > > > change then the implication is that the side effects will in
> > > > > fact be skipped as not all planes may even support async flips. =
=20
> > > >=20
> > > > Hm right. So the problem is that setting any prop =3D same value as
> > > > previous one will result in a new page-flip for asynchronous page-f=
lips,
> > > > but will not result in any side-effect for asynchronous page-flips.
> > > >=20
> > > > Does it actually matter though? For async page-flips, I don't think=
 this
> > > > would result in any actual difference in behavior? =20
> >=20
> >=20
> > Hi Simon,
> >=20
> > a fly-by question...
> >  =20
> > > To sum this up, here is a matrix of behavior as seen by user-space:
> > >=20
> > > - Sync atomic page-flip
> > > - Set FB_ID to different value: programs hw for page-flip, sends ueve=
nt
> > > - Set FB_ID to same value: same (important for VRR)
> > > - Set another plane prop to same value: same
> > > - Set another plane prop to different value: maybe rejected if modese=
t required
> > > - Async atomic page-flip
> > > - Set FB_ID to different value: updates hw with new FB address, sends
> > > immediate uevent
> > > - Set FB_ID to same value: same (no-op for the hw) =20
> >=20
> > It should not be a no-op for the hw, because the hw might be in the
> > middle of a VRR front-porch waiting period, and the commit needs to end
> > the waiting immediately rather than time out? =20
>=20
> I'm not sure=20

Would people not want to use async commits to trigger new VRR scanout
cycles without content updates?

I seem to recall previous comments that switching between sync and
async commit modes may take a moment (intel's one last sync flip), so
using sync once in a while then using async otherwise is probably not a
good idea.

> > > - Set another plane prop to same value: ignored, sends immediate ueve=
nt
> > > (special codepath) =20
> >=20
> > If the sync case says "same", then shouldn't this say "same" as well to
> > be consistent? =20
>=20
> Okay, I think I chose my words badly. By "same" I meant "same as
> previous item in the list".
>=20
> Here I tried to be more explicit and explain why it's the same behavior.
> We have a special path in the kernel code that ignores the change, but
> the effective result is that it doesn't differ from the sync case.
>=20
> Here's a fixed matrix where I don't use confusing words:
>=20
> - Sync atomic page-flip
>   - Set FB_ID to different value: programs hw for page-flip, sends uevent
>   - Set FB_ID to same value: programs hw for page-flip, sends uevent (imp=
ortant
>     for VRR)
>   - Set another plane prop to same value: programs hw for page-flip, sends
>     uevent

Programming hw for page-flip probably triggers a new VRR scanout cycle,
even if the FB address didn't change.

>   - Set another plane prop to different value: maybe rejected if modeset =
required
> - Async atomic page-flip
>   - Set FB_ID to different value: updates hw with new FB address, sends
>     immediate uevent
>   - Set FB_ID to same value: updates hw with new FB address (no-op for th=
e hw),
>     sends immediate uevent
>   - Set another plane prop to same value: ignored, sends immediate uevent
>     (special codepath)

Just like Michel points out: if this case has a special case ignoring
the set, then this case will not trigger a new VRR scanout cycle like
the corresponding sync case does.

>   - Set another plane prop to different value: always rejected


Thanks,
pq

--Sig_/6bNbi9WwCvCAexOid30925v
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmVR9ywACgkQI1/ltBGq
qqcOLg//aENH/YGXJFSAaa7U/b5a15bjSk0KT6YsWFgdxSVo+At/1BIdx8tPVQuo
s/haxSzjuNba/YLevARZVFsGBCyYQG+BLqE1M1q5g6umjjgS9Yhw2B8Ik2elnxSY
U8o575TWYmq+9SMVK2qxXUNKbomxGtLUSCNC67yLRD+Xtz2prBgox/QCkxSZTPcz
W/x+rLN/93IdU5sEF73uoH7rGReovDupVimwEnCRIxlwEMT4xtZmRVDRVITkx16I
+oZaZnLZE4V8G6BaFtMFkhN33Z13g/lxA71MbCNdVAamSOepQaC+MP0BqF49QEnr
NXkKckUK7dx+sjVEpW/6CHKZ/7u8ewxBjdtxKMFKSMuYFpIASZeaUz3QSK+Ke2py
zWji+lFYgtr/HIKbkdVHjI0Q/4OtQPmujzAPFioM2VD4r1p/apkeW1Ikf+ZrxlWk
XXvxBVyMyTker23+EQC97g+CyDNApinc88V5ab0GrzQMC9gWQBCLn34/TqRq2tsZ
ymxYWI3R4YOKqSXLPesE0e/sVDyN1sURAWNvUz1W3Ymm4Y7L/LF5YZbDH/UbcZhW
0J3+JgrCDoHOKTPmAx6OTyGZxZ/QH4I/5c00JOlxbtl1D/8xF7/OfbGCACIhZoY0
QWa6q1cMsPd4O1hKBHAvkSWHBV7PQEf6ljHq/5MlzDDLLAAJNZs=
=LCPG
-----END PGP SIGNATURE-----

--Sig_/6bNbi9WwCvCAexOid30925v--
