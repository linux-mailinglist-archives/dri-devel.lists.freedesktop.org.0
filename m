Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D41BFA1396B
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2025 12:50:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3956F10E947;
	Thu, 16 Jan 2025 11:50:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="eUF6RhYB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [IPv6:2604:1380:45d1:ec00::3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CEA410E947;
 Thu, 16 Jan 2025 11:50:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 4F45FA417D6;
 Thu, 16 Jan 2025 11:48:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B787C4CED6;
 Thu, 16 Jan 2025 11:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1737028213;
 bh=3urIvcjjKWnB2qJRr7oQPOXeUZvw36gw6qaU2DNqvRc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eUF6RhYBJd+0hRDL1DgEvHe+FvsaO+v8bq4HS1x9MR74PmLYswK2RYhSde1yiuf8w
 jzITDmyb37rVju1CR9IJd+kqtLrvmHFRhAL5ttua0kB8ITrLJXdLsrNYL7vgickQem
 7Cnubso7LLqYZd/TiLNBAZdN1tDw8cGdYh2kxMQgDO3SRytauekolVfZGPGYA9/NPd
 6oSCae7anL4lw0mDW1pN4GyJje529layBTlllhskxYEwsFo8dvqXyQ6OAnPIFHhCVD
 QnAFlVJqBpnlUnpaBuosbLYO5CMh0A9xQWj9UNjwvO/P3nAVEd8OZgNZf4FTaTTGUK
 hDc6DicvYdkVQ==
Date: Thu, 16 Jan 2025 12:50:10 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Simona Vetter <simona.vetter@ffwll.ch>, Dave Airlie <airlied@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>, 
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 DRI <dri-devel@lists.freedesktop.org>
Subject: Re: linux-next: build warnings after merge of the drm-misc tree
Message-ID: <20250116-rampant-versatile-butterfly-f1166c@houat>
References: <20241220154208.720d990b@canb.auug.org.au>
 <20250114164149.6459996d@canb.auug.org.au>
 <beed4438-2416-4994-bb18-a7dfdbe3d9e8@ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="xr74ivsemsid3src"
Content-Disposition: inline
In-Reply-To: <beed4438-2416-4994-bb18-a7dfdbe3d9e8@ideasonboard.com>
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


--xr74ivsemsid3src
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: linux-next: build warnings after merge of the drm-misc tree
MIME-Version: 1.0

On Thu, Jan 16, 2025 at 12:34:39PM +0200, Tomi Valkeinen wrote:
> Hi drm maintainers,
>=20
> On 14/01/2025 07:41, Stephen Rothwell wrote:
> > Hi all,
> >=20
> > On Fri, 20 Dec 2024 15:42:08 +1100 Stephen Rothwell <sfr@canb.auug.org.=
au> wrote:
> > >=20
> > > After merging the drm-misc tree, today's linux-next build (htmldocs)
> > > produced these warnings:
> > >=20
> > > drivers/gpu/drm/xlnx/zynqmp_dpsub.h:86: warning: Function parameter o=
r struct member 'audio' not described in 'zynqmp_dpsub'
> > > drivers/gpu/drm/xlnx/zynqmp_dpsub.c:1: warning: no structured comment=
s found
> > >=20
> > > Introduced by commit
> > >=20
> > >    3ec5c1579305 ("drm: xlnx: zynqmp_dpsub: Add DP audio support")
> >=20
> > I am still seeing these warnings.  That commit is now in the drm tree.
>=20
> Can 96b5d2e807f667320c66f41ddc1c473023a73ab2 from drm-misc-next be picked=
 to
> a -fixes branch? It fixes 3ec5c1579305, which is in drm-misc-next and in
> drm-next.

Done, thanks

Maxime

--xr74ivsemsid3src
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ4jycQAKCRAnX84Zoj2+
dv/VAYCyN7mP6B9dpcKCjMH+UsajZWr3P+rR5kULKVOnHzqVA+dd7URfeKTwrR20
ewOxPfgBfAuzoNGQOsm/lFOOyDpOcobmUuKV7TYzEMfXLQ5Qvq0MwP8cnH30CIFv
CInigMdcXw==
=eHBa
-----END PGP SIGNATURE-----

--xr74ivsemsid3src--
