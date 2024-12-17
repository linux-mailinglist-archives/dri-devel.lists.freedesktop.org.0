Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFB909F4EB7
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2024 16:02:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1D8310E23E;
	Tue, 17 Dec 2024 15:02:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="RqQWliJY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C292D10E23E
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2024 15:02:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B8D245C4BB4;
 Tue, 17 Dec 2024 15:01:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41D8EC4CED3;
 Tue, 17 Dec 2024 15:02:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1734447743;
 bh=ARZxDTKwcrtJRmGfSLGzQJE1LGMCzV+FHKBTe+Cfy1c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RqQWliJY0C9K4Xu+VSJPhnAIlil4VSlAt8+nzsmVua4BVFT95zgqOc4XpryJV81iT
 CtRVQUSMLfZoSSf0+wdVrkGMI8ahToWUnzgg+3xXVQTnqm95Hl6PJDHiI78/XHEPXc
 q6ONHxtFQ3J62oGccTBrhbS3EwJCzimZ1XPX1u9hcnbXeu2L+HaLv0pmrrSSjgf8hr
 diOSb/Gt9ydHj7lDiwRSkmoOiswfWjSlkZBvUnmeZY99s48OBSRRZBBcMqui+i4acD
 CXPI0ZhNlkH8DHA98s4AQ56sVB3SESs5pI6l9b8byJ0yIA3zJk1A+TJclPEHX1LXJi
 vxRWihj6+I0bw==
Date: Tue, 17 Dec 2024 16:02:21 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, dmitry.baryshkov@linaro.org, robdclark@gmail.com
Subject: Re: [PATCH v3 0/2] drm: Allow encoder modeset when connectors are
 changed
Message-ID: <20241217-fervent-hot-teal-dc3516@houat>
References: <20241211-abhinavk-modeset-fix-v3-0-0de4bf3e7c32@quicinc.com>
 <20241216-daring-opalescent-herring-bfdc8f@houat>
 <8484df79-6ad8-4702-853f-31d985178607@quicinc.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="evowgftqcey6meiq"
Content-Disposition: inline
In-Reply-To: <8484df79-6ad8-4702-853f-31d985178607@quicinc.com>
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


--evowgftqcey6meiq
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 0/2] drm: Allow encoder modeset when connectors are
 changed
MIME-Version: 1.0

On Mon, Dec 16, 2024 at 10:27:44AM -0800, Abhinav Kumar wrote:
>=20
>=20
> On 12/16/2024 3:06 AM, Maxime Ripard wrote:
> > On Wed, Dec 11, 2024 at 01:18:41PM -0800, Jessica Zhang wrote:
> > > Call encoder mode_set() when connectors are changed. This avoids issu=
es
> > > for cases where the connectors are changed but CRTC mode is not.
> >=20
> > Looks great, thanks a lot for doing the tests :)
> >=20
> > Reviewed-by: Maxime Ripard <mripard@kernel.org>
> >=20
> > Maxime
>=20
> Thanks for your feedback.
>=20
> Can we get an ack to land this through msm tree as part of the series whi=
ch
> needed it?

If possible, I'd rather merge it through drm-misc. We merge a
significant number of patches affecting the framework there, so a
conflict would be less likely there.

Maxime

--evowgftqcey6meiq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ2GSfAAKCRAnX84Zoj2+
dlidAYC/XbhyMAkyZHI74Sg0WUgq8YO/a98h5oA7AWtzou8q/eVbVGW04jMEEN8Z
bhMxJpYBgMelkeecYMqiu8NR9/Nyl+AqXRh7Acrp3jpFU7byFh+/DoMfGo2LEGCc
0/wS6heh4A==
=eOA/
-----END PGP SIGNATURE-----

--evowgftqcey6meiq--
