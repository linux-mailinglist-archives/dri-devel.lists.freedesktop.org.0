Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DA80A7609A
	for <lists+dri-devel@lfdr.de>; Mon, 31 Mar 2025 09:53:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3F9F10E38B;
	Mon, 31 Mar 2025 07:53:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="LRbMtQme";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2394110E38B
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Mar 2025 07:53:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A7A7A5C5A78;
 Mon, 31 Mar 2025 07:51:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEC6DC4CEE3;
 Mon, 31 Mar 2025 07:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1743407630;
 bh=pHSJnOBye+2M5W9r0QAOLNEwizHe+AOJ/A7x0NsoBYA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LRbMtQmeJestwFoj/OlDBdiajzkyM8riQrKtwWmajfMoSD3i5hdjSLMgJLAg2dQbm
 FnkmMeEqaNp+PhPBGf6iMZzY/tOFsEjBI9ZhT33XR/2q5wxsP2s/tkUtV/6QtTq98h
 aa+3AU/Wd38BKpG6tJtvjWMFW/UPVIAvE7C7lOiMX1UtlduRKcVviE1kM8DKWpz/94
 SuDCzSHjQf8O7ZK3rpqOu9wQcA4HtdLUE1IibuyjQMRokXw41UIJbFS8JgQimqwzK8
 gN/VWR/jXdBmJlukzxcRnxfpSCzRfKuyjCIxHB2R003VYbxSFdC85ZhwJTr5yoahVM
 Mk3bFnJh0wO8w==
Date: Mon, 31 Mar 2025 09:53:47 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vignesh Raman <vignesh.raman@collabora.com>, 
 dri-devel@lists.freedesktop.org, daniels@collabora.com,
 helen.fornazier@gmail.com, 
 airlied@gmail.com, simona.vetter@ffwll.ch, robdclark@gmail.com, 
 guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com,
 valentine.burley@collabora.com, 
 lumag@kernel.org, quic_abhinavk@quicinc.com, maarten.lankhorst@linux.intel.com,
 tzimmermann@suse.de, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/3] drm/ci: Add jobs to validate devicetrees
Message-ID: <20250331-amphibian-hopping-bobcat-e19a0b@houat>
References: <20250327160117.945165-1-vignesh.raman@collabora.com>
 <20250327160117.945165-3-vignesh.raman@collabora.com>
 <v4dhuuuvfk63bakncz43z3ndjdze5ac7nrv6qvtpdnonfpetsx@5hh3vzcj336x>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="wbv3572a4nxzn66s"
Content-Disposition: inline
In-Reply-To: <v4dhuuuvfk63bakncz43z3ndjdze5ac7nrv6qvtpdnonfpetsx@5hh3vzcj336x>
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


--wbv3572a4nxzn66s
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1 2/3] drm/ci: Add jobs to validate devicetrees
MIME-Version: 1.0

On Sun, Mar 30, 2025 at 08:06:45PM +0300, Dmitry Baryshkov wrote:
> On Thu, Mar 27, 2025 at 09:31:11PM +0530, Vignesh Raman wrote:
> > Add jobs to run dt_binding_check and dtbs_check. If warnings are seen,
> > exit with a non-zero error code while configuring them as warning in
> > the GitLab CI pipeline.
>=20
> Can it really succeed or is it going to be an always-failing job? The
> dt_binding_check generally succeed, dtbs_check generates tons of
> warnings. We are trying to make progress there, but it's still very far
> from being achevable.

It depends on the platforms I guess. Some are 100% covered and any
warning should be treated as a failure, and some have not started the
effort.

I guess we could solve it with some kind of expectation list, but I do
wonder if it's something *we* should be focusing on :)

Maxime

--wbv3572a4nxzn66s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZ+pKCgAKCRDj7w1vZxhR
xdagAP0XnRYBnSj/dqwFP4OvDmsR0IobwdXIfMWh/qcY9V+UwQEArf0CcTvB/9a/
mOirpItBhtP6MZgwnpQk0Hrn1eE82Q8=
=CE5q
-----END PGP SIGNATURE-----

--wbv3572a4nxzn66s--
