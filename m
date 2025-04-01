Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9C1BA77EAA
	for <lists+dri-devel@lfdr.de>; Tue,  1 Apr 2025 17:15:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BAE010E5D3;
	Tue,  1 Apr 2025 15:15:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="EF80fyL5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A03710E5D3
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Apr 2025 15:14:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id B763DA44EB6;
 Tue,  1 Apr 2025 15:09:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB00CC4CEE4;
 Tue,  1 Apr 2025 15:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1743520498;
 bh=3vOGzyOMUi7Kk8j91wUMi2xfu2rBG44Pcyvg5olju1E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EF80fyL5ZzjtJ0r2Tv4ohwp8/FD071ieG9zwDDVik2v20fXObEII+9imyHPMOHYUu
 EWxz7mVh9nZX4u4LxSx4YHcvsE7Qme9fRg0uLmyvhIsSWjxG7P1/NxeFRlKBNxjMiq
 G3ikBPixl3grdorzxlruohiyrfBCbOy0LSSd5JAsdw7p79YZew/BEtuMBfiRmiTd8T
 SacfGNEig+1QPLoJ8DY9c3U5RcbLolD9JItdRnnkg73a7Ntue+48O/7D3JbLrvBFRP
 AhaD4d0Ta+zjAcjXe4fIr4SPy20xKp1NRX7bjoZCNsx5UpCb4PJXfeTVFEoEYRJM88
 5zD1BMUUSgjUg==
Date: Tue, 1 Apr 2025 17:14:55 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Vignesh Raman <vignesh.raman@collabora.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 dri-devel@lists.freedesktop.org, daniels@collabora.com,
 helen.fornazier@gmail.com, 
 airlied@gmail.com, simona.vetter@ffwll.ch, robdclark@gmail.com, 
 guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com,
 valentine.burley@collabora.com, 
 lumag@kernel.org, quic_abhinavk@quicinc.com, maarten.lankhorst@linux.intel.com,
 tzimmermann@suse.de, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/3] drm/ci: Add jobs to validate devicetrees
Message-ID: <20250401-devious-victorious-bullfinch-bab3a6@houat>
References: <20250327160117.945165-1-vignesh.raman@collabora.com>
 <20250327160117.945165-3-vignesh.raman@collabora.com>
 <v4dhuuuvfk63bakncz43z3ndjdze5ac7nrv6qvtpdnonfpetsx@5hh3vzcj336x>
 <482f82a0-3f60-47bc-965b-bbf282414d6c@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="h2xvljlagbq7p25w"
Content-Disposition: inline
In-Reply-To: <482f82a0-3f60-47bc-965b-bbf282414d6c@collabora.com>
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


--h2xvljlagbq7p25w
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1 2/3] drm/ci: Add jobs to validate devicetrees
MIME-Version: 1.0

On Tue, Apr 01, 2025 at 07:26:44AM +0530, Vignesh Raman wrote:
> Hi Dmitry,
>=20
> On 30/03/25 22:36, Dmitry Baryshkov wrote:
> > On Thu, Mar 27, 2025 at 09:31:11PM +0530, Vignesh Raman wrote:
> > > Add jobs to run dt_binding_check and dtbs_check. If warnings are seen,
> > > exit with a non-zero error code while configuring them as warning in
> > > the GitLab CI pipeline.
> >=20
> > Can it really succeed or is it going to be an always-failing job? The
> > dt_binding_check generally succeed, dtbs_check generates tons of
> > warnings. We are trying to make progress there, but it's still very far
> > from being achevable.
>=20
> Even though it fails, it will be shown as a warning in the pipeline.
> https://gitlab.freedesktop.org/vigneshraman/linux/-/pipelines/1390797

I think what Dmitry was pointing out is that a warning that is always
warning is going to be completely ignored, and thus doesn't add any
value.

Maxime

--h2xvljlagbq7p25w
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZ+wC7wAKCRDj7w1vZxhR
xZaJAQDcUCyYhsn60wx3cqYfs7lND2nKJA2b07y8i0BkG+CpPQEAtW9h8SMmHOcx
S1l9KZDtrKavcAqqRwZ3AwIlS2mXWAk=
=JJzv
-----END PGP SIGNATURE-----

--h2xvljlagbq7p25w--
