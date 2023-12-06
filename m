Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 719C580699C
	for <lists+dri-devel@lfdr.de>; Wed,  6 Dec 2023 09:28:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14A6110E6C6;
	Wed,  6 Dec 2023 08:28:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BCE310E6C6
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Dec 2023 08:28:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 2C497CE1408;
 Wed,  6 Dec 2023 08:28:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 180D6C433C7;
 Wed,  6 Dec 2023 08:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701851296;
 bh=sU8+eqKAhaWBMNLJPx1p/1ISVUYieuL8KIL5od5DX0s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZmccKKebKM5mwg2/B4Y8Wt19A+wDmKYBEndZHThNUSPRD+aizPTHPiFYaHOkanIhf
 6fk/KzaSMhoU9X8wZiuhhDulopW0qaHa1Be3bG6dj5fyJZvLe81aMUpsmT5LnQiYBw
 tWnTp410gLyXPIUrCmGm/yDtYb0e/hrxR22kpfJOE8zPwFEtx4LvePguhXEFoiHXMB
 bGAbIQ6MhIZ4IGqsJlv8bACi1n8FHFdqR+jT54lvam4d29JLOvEdRggO9I3/VNWQ6/
 nDADTavqce6b9fuu5xQP3jogTtXTOco1+WcxkhNIz21cqI5JPCRInE/T+iAbvxe9lI
 uMEgHoZwNrsiQ==
Date: Wed, 6 Dec 2023 09:28:13 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Danilo Krummrich <dakr@redhat.com>
Subject: Re: [PATCH drm-misc-next v2 0/2] PowerVR VM fixes
Message-ID: <z247vadh756u7hxwiwzhpo2xya4cvdol52x3uosgn4skqlfd4x@qhysktnkid4w>
References: <20231129220835.297885-1-dakr@redhat.com>
 <j6w6ccewlvoosop77ug56r3sqoi4hglj3ejkyfw4dj3s3pdsw5@b473njzq5u3d>
 <ZW9EeFWWZ0BMWIPq@pollux>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="sl2scc7rzqim4vqm"
Content-Disposition: inline
In-Reply-To: <ZW9EeFWWZ0BMWIPq@pollux>
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
Cc: matt.coster@imgtec.com, sarah.walker@imgtec.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 donald.robson@imgtec.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--sl2scc7rzqim4vqm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 05, 2023 at 04:40:40PM +0100, Danilo Krummrich wrote:
> On Tue, Dec 05, 2023 at 04:35:00PM +0100, Maxime Ripard wrote:
> > Hi,
> >=20
> > On Wed, Nov 29, 2023 at 11:07:59PM +0100, Danilo Krummrich wrote:
> > > Some major GPUVM changes landed just before v8 of the PowerVR series.=
 Since v8
> > > went in rather quickly (review process was finished otherwise) I have=
n't had the
> > > chance to review the subsequent code changes.
> > >=20
> > > Hence, this series with a few fixes in this context. Plus a minor GPU=
VM patch to
> > > make the drm_gpuvm_prepare_* helpers useful for PowerVR.
> >=20
> > This doesn't apply on drm-misc-next anymore, could you rebase and
> > resend?
>=20
> I already applied the two patches to drm-misc-next.

Uh, sorry I didn't notice it.

Maxime

--sl2scc7rzqim4vqm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZXAwnQAKCRDj7w1vZxhR
xekkAQCzruxmg1F6tADUsr1XprRFoSPeNc6XlaOPn6dfRfmN4QD+LW2eApk5qMiJ
WhaqDwKz5pCmoUDgCZu6yVhzGtUVdgo=
=LRs+
-----END PGP SIGNATURE-----

--sl2scc7rzqim4vqm--
