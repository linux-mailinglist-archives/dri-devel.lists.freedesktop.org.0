Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A633997E8C
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2024 09:36:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21E0C10E05C;
	Thu, 10 Oct 2024 07:36:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="gOwBeTUx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F56310E05C
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2024 07:36:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B565F5C56C8;
 Thu, 10 Oct 2024 07:36:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5548CC4CEC5;
 Thu, 10 Oct 2024 07:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1728545813;
 bh=Ea4qSJvAdBfCrIwJhim3xJyP+57MaWINdYFbudKMjmc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gOwBeTUxnFsqKIAHi6BybIAZj6t4XstPmCH7wtqpKxKXaiAzQcsmRRpf2IYLtvRZw
 RaiEfJnlEQe9pNjsAOCOB3NCqFyrlue4n59JpCdtFVZbxAINXTkIfPHJoao56/PlL9
 Ege/j2diggRChIpsApUvxHRwomIciHLXKONYUV/5qoVO1w5UWLL5FI8ITpG91RZkqB
 tWBM5/f1iYgrJvZgEAU6EkYtNb2S+Vwzr+9Gajjg7vKyYBO1wqZ0Sh1E7Lk63vpV8Z
 kBpR6n79M9uMsZDjJ89pnVL6nkb76sfK73aFLb0gNKSdDLKgeaPy+2oKv7KXCSA0oa
 TUBd5/MTt3OUg==
Date: Thu, 10 Oct 2024 09:36:50 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
Subject: Re: [PATCH 2/2] MAINTAINERS: Fix VC4's mailing lists
Message-ID: <20241010-majestic-pronghorn-of-genius-d24067@houat>
References: <20241009141240.1948482-1-mcanal@igalia.com>
 <20241009141240.1948482-2-mcanal@igalia.com>
 <CAPY8ntA4PwVbUUTiDxez7ooUegOKc=Hj1PnrXYP2KNrYJ2uLQA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="ggxthl3ritsxvcat"
Content-Disposition: inline
In-Reply-To: <CAPY8ntA4PwVbUUTiDxez7ooUegOKc=Hj1PnrXYP2KNrYJ2uLQA@mail.gmail.com>
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


--ggxthl3ritsxvcat
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 09, 2024 at 04:13:01PM GMT, Dave Stevenson wrote:
> Hi Ma=EDra
>=20
> On Wed, 9 Oct 2024 at 15:12, Ma=EDra Canal <mcanal@igalia.com> wrote:
> >
> > VC4 has two relevant mailing list: kernel-list@raspberrypi.com and
> > dri-devel@lists.freedesktop.org. Therefore, list those two mailing
> > lists in the VC4 section.
>=20
> dri-devel@lists.freedesktop.org is automatically picked up by
> get_maintainer.pl due to vc4 living under /drivers/gpu/drm. Likewise
> the DT bindings are covered. AIUI that means we don't need to list it
> explicitly.
>=20
> > Actually, Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
> > was already listed in the VC4 section, but it was listed as a reviewer.
> > List it as a mailing list.
>=20
> I had this debate with Maxime in v1 when I added this [1].
> It's not an open list as most L: entries are. The top of MAINTAINERS
> lists as "L: *Mailing list* that is relevant to this area". That
> mailing list is dri-devel.
> You also get "Broadcom internal kernel review list
> <bcm-kernel-feedback-list@broadcom.com>" listed as R: in various
> MAINTAINERS entries.
>=20
> I don't know the definitive answer here, but it seemed to fit reasonably =
as R:.

Yeah, I told you last time, it's going to be a recurring discussion
because it's super unusual :)

Maxime

--ggxthl3ritsxvcat
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZweEEgAKCRAnX84Zoj2+
drkQAX0RBlSnqaSuX2iJH4aJRhnVae+7itAB8E3a0T4La0rNO1YZTWK3TgqzV4Wy
JEoqH4sBf2DZGyA3tZaTnfl/0oqBZO1P/TkIniYgpKFatI84Hf0Dpsn4tyafsuZp
eJJnslZ4eg==
=PrrV
-----END PGP SIGNATURE-----

--ggxthl3ritsxvcat--
