Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC766252927
	for <lists+dri-devel@lfdr.de>; Wed, 26 Aug 2020 10:24:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18FAC6E103;
	Wed, 26 Aug 2020 08:24:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0C1F6E103;
 Wed, 26 Aug 2020 08:24:37 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id v12so494342lfo.13;
 Wed, 26 Aug 2020 01:24:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=3Ipj/II5VYl9n/n1H5gkxgubI6iQKx/PZUESvR4EHeo=;
 b=tP5Q+AuytDC4hyZW/DV8n8gFPqVq9qo4k8NpN63MWucwusCKjFjciwL4mHwr3N/f/b
 xYm/oQOB+7rkjJt5leFbJTPbsbZzcKQC10OzFoIqFk5kwtfom/D4tnEdqXago2GecNAY
 uv66WrJ0oRqGqzkSuYbmMHwJ8u778UQ6cdCRLkS5ZmTXY7EcEc6pykbm3zSiJ5KZWUqU
 yb4fBNhncZWH8SuxhgN2AZAbOMWZ6/km82d5RpB3RTU8WNGbLdURCPuArZ4uhWnicvWX
 L/XijxV57CADUnCN02OkBitdxKUxEUEiZVeW3IopRG3roS5FkE3WXT0xQVg/RkmFMoVz
 XTaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=3Ipj/II5VYl9n/n1H5gkxgubI6iQKx/PZUESvR4EHeo=;
 b=lS9Gf/VyhzFi2HvgGwhwrApVC+t/FGN8xGImLXaR0QVKJPfhjCNPgT5dbobLG7GrKz
 rlMnMee7odg3kfloYSRn8SR0Jt5YkBmRJCn6FfCQ4EJGtd3cVGMytyOg4Bnrj7CLuJHy
 BNNF26CAdj8QTEqgNVqBOEcRLubta3Pr6kkpGhv+aaJVdYGY2sheEgxDQEVxRkzejlXD
 zNfKPPll1CQarIYVrT0eaHWWP2RhhpvVDdEvoSZStC1TDiKIxqJaB3MBQVmca/dqCCoO
 RA4Dy29W6UVCNnoEpGazrP3wSYDuXM0MKSr4DTuPVc3ymMWfhDZE07yLNKb50BpR3TYK
 uJrw==
X-Gm-Message-State: AOAM533eoHbJn/trK1YSAse2O56mWw/Hjv8dBDiZeiAF9oi/jUl98na3
 SOEfjb+xElW/SyyreH++C3M=
X-Google-Smtp-Source: ABdhPJyAQ4VkWnOAPEG5PLgarqePcKFXVE3H6wvYktaF7HFAiMM69PPW+UGKmWj0ZrV//9ixqNoBiQ==
X-Received: by 2002:a05:6512:3610:: with SMTP id
 f16mr6743780lfs.8.1598430276088; 
 Wed, 26 Aug 2020 01:24:36 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id l3sm337969lji.115.2020.08.26.01.24.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Aug 2020 01:24:35 -0700 (PDT)
Date: Wed, 26 Aug 2020 11:24:23 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: "Kazlauskas, Nicholas" <nicholas.kazlauskas@amd.com>
Subject: Re: [PATCH] drm/amdgpu/dc: Require primary plane to be enabled
 whenever the CRTC is
Message-ID: <20200826112423.6a8637a2@eldfell>
In-Reply-To: <15b4eb58-a51b-b2fd-f51d-1576d50914cc@amd.com>
References: <20200821165758.1106210-1-michel@daenzer.net>
 <58dc5ed0-307e-74c9-1a8b-1e998be04900@amd.com>
 <91391bb3-a855-1a29-2d2e-a31856c99946@daenzer.net>
 <15b4eb58-a51b-b2fd-f51d-1576d50914cc@amd.com>
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
Cc: Leo Li <sunpeng.li@amd.com>,
 Michel =?UTF-8?B?RMOkbnplcg==?= <michel@daenzer.net>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0883660942=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0883660942==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/IhHeS0+PZZ/b_0Qj=e1ITzG"; protocol="application/pgp-signature"

--Sig_/IhHeS0+PZZ/b_0Qj=e1ITzG
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 25 Aug 2020 12:58:19 -0400
"Kazlauskas, Nicholas" <nicholas.kazlauskas@amd.com> wrote:

> On 2020-08-22 5:59 a.m., Michel D=C3=A4nzer wrote:
> > On 2020-08-21 8:07 p.m., Kazlauskas, Nicholas wrote: =20
> >> On 2020-08-21 12:57 p.m., Michel D=C3=A4nzer wrote: =20
> >>> From: Michel D=C3=A4nzer <mdaenzer@redhat.com>
> >>>
> >>> Don't check drm_crtc_state::active for this either, per its
> >>> documentation in include/drm/drm_crtc.h:
> >>>
> >>>  =C2=A0 * Hence drivers must not consult @active in their various
> >>>  =C2=A0 * &drm_mode_config_funcs.atomic_check callback to reject an a=
tomic
> >>>  =C2=A0 * commit.
> >>>
> >>> The atomic helpers disable the CRTC as needed for disabling the prima=
ry
> >>> plane.
> >>>
> >>> This prevents at least the following problems if the primary plane ge=
ts
> >>> disabled (e.g. due to destroying the FB assigned to the primary plane,
> >>> as happens e.g. with mutter in Wayland mode):
> >>>
> >>> * Toggling CRTC active to 1 failed if the cursor plane was enabled
> >>>  =C2=A0=C2=A0 (e.g. via legacy DPMS property & cursor ioctl).
> >>> * Enabling the cursor plane failed, e.g. via the legacy cursor ioctl.=
 =20
> >>
> >> We previously had the requirement that the primary plane must be enabl=
ed
> >> but some userspace expects that they can enable just the overlay plane
> >> without anything else.
> >>
> >> I think the chromuiumos atomictest validates that this works as well:
> >>
> >> So is DRM going forward then with the expectation that this is wrong
> >> behavior from userspace?
> >>
> >> We require at least one plane to be enabled to display a cursor, but it
> >> doesn't necessarily need to be the primary. =20
> >=20
> > It's a "pick your poison" situation:
> >=20
> > 1) Currently the checks are invalid (atomic_check must not decide based
> > on drm_crtc_state::active), and it's easy for legacy KMS userspace to
> > accidentally hit errors trying to enable/move the cursor or switch DPMS
> > off =E2=86=92 on.
> >=20
> > 2) Accurately rejecting only atomic states where the cursor plane is
> > enabled but all other planes are off would break the KMS helper code,
> > which can only deal with the "CRTC on & primary plane off is not
> > allowed" case specifically.
> >=20
> > 3) This patch addresses 1) & 2) but may break existing atomic userspace
> > which wants to enable an overlay plane while disabling the primary plan=
e.
> >=20
> >=20
> > I do think in principle atomic userspace is expected to handle case 3)
> > and leave the primary plane enabled. However, this is not ideal from an
> > energy consumption PoV. Therefore, here's another idea for a possible
> > way out of this quagmire:
> >=20
> > amdgpu_dm does not reject any atomic states based on which planes are
> > enabled in it. If the cursor plane is enabled but all other planes are
> > off, amdgpu_dm internally either:
> >=20
> > a) Enables an overlay plane and makes it invisible, e.g. by assigning a
> > minimum size FB with alpha =3D 0.
> >=20
> > b) Enables the primary plane and assigns a minimum size FB (scaled up to
> > the required size) containing all black, possibly using compression.
> > (Trying to minimize the memory bandwidth)
> >=20
> >=20
> > Does either of these seem feasible? If both do, which one would be
> > preferable?
> >=20
> >  =20
>=20
> It's really the same solution since DCN doesn't make a distinction=20
> between primary or overlay planes in hardware. DCE doesn't have overlay=20
> planes enabled so this is not relevant there.
>=20
> The old behavior (pre 5.1?) was to silently accept the commit even=20
> though the screen would be completely black instead of outright=20
> rejecting the commit.
>=20
> I almost wonder if that makes more sense in the short term here since=20
> the only "userspace" affected here is IGT. We'll fail the CRC checks,=20
> but no userspace actually tries to actively use a cursor with no primary=
=20
> plane enabled from my understanding.

Hi,

I believe that there exists userspace that will *accidentally* attempt
to update the cursor plane while primary plane or whole CRTC is off.
Some versions of Mutter might do that on racy conditions, I suspect.
These are legacy KMS users, not atomic KMS.

However, I do not believe there exists any userspace that would
actually expect the display to show the cursor plane alone without a
primary plane. Therefore I'd be ok with legacy cursor ioctls silently
succeeding. Atomic commits not. So the difference has to be in the
translation from legacy UAPI to kernel internal atomic interface.

> In the long term I think we can work on getting cursor actually on the=20
> screen in this case, though I can't say I really like having to reserve=20
> some small buffer (eg. 16x16) for allowing lightup on this corner case.

Why would you bother implementing that?

Is there really an IGT test that unconditionally demands cursor plane
to be usable without any other planes?


Thanks,
pq

--Sig_/IhHeS0+PZZ/b_0Qj=e1ITzG
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl9GHDcACgkQI1/ltBGq
qqc2RQ//Vklg+9Jw32uLDkbWZT484poN+2/opcHURbpEiCSBlOHXRfrW683Kh81V
rLoXEurm7Lwy3pmNI4hwtTh/pdWSeyxggds35CKfpuuf99CNRwix8xNC3I7gOxYy
LYRP4LA0EwlzDxnuOurhjSu2W22fzzQ+NbAn9ntbNe06vwCjUJOeNq9ffXwp8EWy
ApvXbPobBBcH+krl6VcRWeaCD+Wi3SuEGhGSECdo3M17sV4jgBpyShdoci+CBlxO
78m0tEGmHE+wh6FflXV+NOyemNB8fAHsBAqisx8tDUF5rYhUKCppB2CqRYZPjPex
rLCtUfMqPHLY8c4HcjnVKtnHpgZt++NGuOqJiDE91aoE5GJpDF1YAtlqMvwQ8k7l
DJFyPdhBhHBx9A8F+GujK4ypMeQuJU+uH+sD9UNp9G5EP1ZQ6CvlpAcVsK0VpJd3
VkQ0IwkpEftahTY2Yl2b3rXvmR9srnEnLbeLzCFAFbR1z2QeHIAQ3Xf1ynrFa9bV
bAJuRBBKM+uFa3iun405tBOLsUeMIUayTaoRY07YJMBFBd9NqXEK/azf8sRvlryb
Os3qsTPAnjhWiB9QGtbIYD2wfcDP6IN1EK2iEn1r+H+b/aLxv4YRFBJeQjqsPpUy
hYqXMdXPlDP+Czr+43PhO7paraPKbCo7okTfJNlyf4Zlifnbn3U=
=2LVE
-----END PGP SIGNATURE-----

--Sig_/IhHeS0+PZZ/b_0Qj=e1ITzG--

--===============0883660942==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0883660942==--
