Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9CE7A19B87
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jan 2025 00:36:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF6BE10E21C;
	Wed, 22 Jan 2025 23:36:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="D5wGxk7O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF58C10E004;
 Wed, 22 Jan 2025 23:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1737588947;
 bh=7zpYmkkaSjnnu9Zxj9TDJxfErGaLVAVs3xEygizvY1s=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=D5wGxk7OBbhuudzbEV/p1HdslqbaFa10FPFUXKneIrGiMub/mL/goIiXR9SWX2M6s
 4zBI7s8R9IdJnHyMLekdZTjZZuHWTwQPZ4ssWW4nAxqPfQtJO/Ep9jzR++GidNQtlh
 iyonN7FVcgZqdPupbXAEadKLRKA+G3UozfPJ8zfEtQ3mPJChDOnfaQ4ex2OjY+O7d/
 LPL14cP1W5PbxndBs9UM9/5oljlX3YToYkU9NDOpkQHs5KMofTGX6NIgGp6OvHva4u
 W1+v6tGuYuCoEQnZB23WiumtJPKMyLWiNtMZtlJl5esAh0Q8hnwEJgCbjQSFKwW61H
 WeTDKCKAjh4PA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4YdgS24bjhz4x4t;
 Thu, 23 Jan 2025 10:35:46 +1100 (AEDT)
Date: Thu, 23 Jan 2025 10:35:53 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Dave Airlie <airlied@redhat.com>, Simona Vetter
 <simona.vetter@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>, Joonas
 Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Intel Graphics <intel-gfx@lists.freedesktop.org>,
 DRI <dri-devel@lists.freedesktop.org>, Jani Nikula <jani.nikula@intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Yafang Shao
 <laoar.shao@gmail.com>
Subject: Re: linux-next: manual merge of the drm-intel tree with the mm tree
Message-ID: <20250123103553.32f41759@canb.auug.org.au>
In-Reply-To: <20250108121650.09a8e828@canb.auug.org.au>
References: <20250106130348.73a5fae6@canb.auug.org.au>
 <20250108121650.09a8e828@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/K7fChHFaSC5IPMG5nbYJhn3";
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

--Sig_/K7fChHFaSC5IPMG5nbYJhn3
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 8 Jan 2025 12:16:50 +1100 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> On Mon, 6 Jan 2025 13:03:48 +1100 Stephen Rothwell <sfr@canb.auug.org.au>=
 wrote:
> >
> > Today's linux-next merge of the drm-intel tree got a conflict in:
> >=20
> >   drivers/gpu/drm/i915/display/intel_display_driver.c
> >=20
> > between commit:
> >=20
> >   4fc0cee83590 ("drivers: remove get_task_comm() and print task comm di=
rectly")
> >=20
> > from the mm-nonmm-unstable branch of the mm tree and commit:
> >=20
> >   f5d38d4fa884 ("drm/i915/display: convert intel_display_driver.[ch] to=
 struct intel_display")
> >=20
> > from the drm-intel tree.
> >=20
> > I fixed it up (see below) and can carry the fix as necessary. This
> > is now fixed as far as linux-next is concerned, but any non trivial
> > conflicts should be mentioned to your upstream maintainer when your tree
> > is submitted for merging.  You may also want to consider cooperating
> > with the maintainer of the conflicting tree to minimise any particularly
> > complex conflicts.
> >=20
> > --=20
> > Cheers,
> > Stephen Rothwell
> >=20
> > diff --cc drivers/gpu/drm/i915/display/intel_display_driver.c
> > index 62596424a9aa,497b4a1f045f..000000000000
> > --- a/drivers/gpu/drm/i915/display/intel_display_driver.c
> > +++ b/drivers/gpu/drm/i915/display/intel_display_driver.c
> > @@@ -389,8 -397,9 +397,8 @@@ void intel_display_driver_resume_access
> >    * Returns %true if the current thread has display HW access, %false
> >    * otherwise.
> >    */
> > - bool intel_display_driver_check_access(struct drm_i915_private *i915)
> > + bool intel_display_driver_check_access(struct intel_display *display)
> >   {
> >  -	char comm[TASK_COMM_LEN];
> >   	char current_task[TASK_COMM_LEN + 16];
> >   	char allowed_task[TASK_COMM_LEN + 16] =3D "none";
> >  =20
> > @@@ -399,14 -408,15 +407,14 @@@
> >   		return true;
> >  =20
> >   	snprintf(current_task, sizeof(current_task), "%s[%d]",
> >  -		 get_task_comm(comm, current),
> >  -		 task_pid_vnr(current));
> >  +		 current->comm, task_pid_vnr(current));
> >  =20
> > - 	if (i915->display.access.allowed_task)
> > + 	if (display->access.allowed_task)
> >   		snprintf(allowed_task, sizeof(allowed_task), "%s[%d]",
> > - 			 i915->display.access.allowed_task->comm,
> > - 			 task_pid_vnr(i915->display.access.allowed_task));
> >  -			 get_task_comm(comm, display->access.allowed_task),
> > ++			 display->access.allowed_task->comm,
> > + 			 task_pid_vnr(display->access.allowed_task));
> >  =20
> > - 	drm_dbg_kms(&i915->drm,
> > + 	drm_dbg_kms(display->drm,
> >   		    "Reject display access from task %s (allowed to %s)\n",
> >   		    current_task, allowed_task);
> >    =20
>=20
> This is now a conflict between the drm tree and the mm-nonmm-unstable
> branch of the mm tree.

And now a conflict between Linus' tree and the mm-nonmm-stable tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/K7fChHFaSC5IPMG5nbYJhn3
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmeRgNkACgkQAVBC80lX
0GylAAf/bfQyPNsgzQXNKIyjBsnW244dYlYPM/tzFEzuDGqbaehzEPaS3D34bcTF
e8vsXPibs1xLSKC0OUgYIy32oibu8unKSj09kjjpJ0Df+ANk1Vfc5Y2oTeM/gbjP
bqqYFfR8vJjznTkfOIfnZJzeDoHLKrbHI8nDzLCRv2Etqv7KChlczOIu6QVGPHPM
PmjRm3Ha3/3ZlXr2lNQRIITylmNnx/2FuaPQVsXkyEm0cXYVgiCnfbZ0Myo/W+lw
4WAV/v0NkePLRsEv5Ut/U7qEgFeZfLXKIFyQm5y/tda8eJBAUcCtk4RgIRNrFPGM
shmpo6Ut5FEwdj2kzdBgURMQ8yWjNQ==
=oxZJ
-----END PGP SIGNATURE-----

--Sig_/K7fChHFaSC5IPMG5nbYJhn3--
