Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 49EE34E9CE3
	for <lists+dri-devel@lfdr.de>; Mon, 28 Mar 2022 18:55:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14F2A10E56D;
	Mon, 28 Mar 2022 16:55:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3827710E56D;
 Mon, 28 Mar 2022 16:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=MCoY5af/0/WpfdevJ/eXEvjFhKMbch6UR8rwljhktwg=; b=nffUmPLCCk09mW4tpBzYtuzsmN
 CnCrcjddcRWLiXiI7wA9k1OwprhFSPg2TCzFzRztlKZd92tRn2M1DGHwoxwe/HBkeo2hoX0B5aZ67
 s7YyWUMDJEOfmBV2Aonp1nWkbXByCYkRti+fzKCrxOYPReBf7tqf+khKhm2rmQX9oW8xm9x15AQ3t
 DA+NJZCUZGevBb+C4YBK0+5QrPwsRsyYjMDrtreVDhToxiwlRtZXMGfIQxu69jwLB7ePDCnx9pI2N
 6JbisCePL50sUffuTUrMTCb//51aMEuSoL/TurQmhry6YDMgXs5I/ILGGc1TYCjCrHdlNjkjuuXjd
 rDI/WfiQ==;
Received: from [165.90.126.25] (helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1nYse7-0005fS-Ux; Mon, 28 Mar 2022 18:55:12 +0200
Date: Mon, 28 Mar 2022 15:54:50 -0100
From: Melissa Wen <mwen@igalia.com>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [RFC PATCH] drm/amd/display: dont ignore alpha property
Message-ID: <20220328165450.lix5hybt3egtpowr@mail.igalia.com>
References: <20220325204450.kq7kjb7ez63p5srm@mail.igalia.com>
 <Bq9Aj2IM-iCzmSHMJzvYjL_qmyPoAjbrRh8JNExHmqJW5kxFbtOSjC4WFoeB2R_lUKQszrEuHsFKNHAtXvhdUwp_8ejTnKqKRmVPiiS8Cqs=@emersion.fr>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="5hfnreocpnadvfxf"
Content-Disposition: inline
In-Reply-To: <Bq9Aj2IM-iCzmSHMJzvYjL_qmyPoAjbrRh8JNExHmqJW5kxFbtOSjC4WFoeB2R_lUKQszrEuHsFKNHAtXvhdUwp_8ejTnKqKRmVPiiS8Cqs=@emersion.fr>
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
Cc: Zhan Liu <Zhan.Liu@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Agustin Gutierrez <agustin.gutierrez@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--5hfnreocpnadvfxf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 03/28, Simon Ser wrote:
> Thanks a lot for you patch! I've noticed as well that amdgpu ignores
> the plane alpha property [1]. I'll try to find time to test it.
Hi Simon,

So you've faced this kind of issue many times :/
Let me know the results from your side, so we can use it to find the
correct approach to solve this issue.
>=20
> [1]: https://gitlab.freedesktop.org/drm/amd/-/issues/1734
Yeah, it looks like the same problem.

I also think the IGT test case (alpha-7efc) is not the best one because
results can be affected by rounding issues. Maybe the test should be
reworked, but first this alpha property issue should be clarified.

Thanks for the inputs!

Melissa

--5hfnreocpnadvfxf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEd8WOo/JViG+Tu+XIwqF3j0dLehwFAmJB6FYACgkQwqF3j0dL
ehx3OQ/9H/qEQIlDsgSmAMiXBLoL4sWWg6RBH/AlPUaiw8dkDM+Mpld5woAn/FH5
pVb+XK9F90L0g+9IeReg320Xjx7/ClELKqjcmWWxc7aWdZ7QBz+0D4DUYia4HXV6
j+si9xELXGngYujuaRiqKfnx86DDmvVq2xUrIPPTltFZoCurOKWgfcH2qBQ3eIuJ
CeqU0/OaBuv+2LVQEBW3yywvirWpHbCm9khlIpT3X/rJ5kx16UHjBZHU/4T/UEfw
Q7jKPIGiC2ph89mGdvYHfYtDday3RA90zRpG6f6SF9/TLxhaefto8VJXX7E39Rug
kpaNq8TQb9D1FUMPWaJ9Cg7eA9OHDpfEpXaAudOEw9wk4zh2uI8bBzqxkq68za3e
cdtxOLWGxXp7OSrF1sAXHpIJ3I4U/7awpLsQ289G7jadi4hPaB7pH8v2TUmEDD4S
d3hmpC7qqcvFKC7BekWuDpV6/aGgYH3MzPo0SEURVhURMM4w/dE9rrWL8loCQM/k
v2s7UW/U1apHkCJfk9Pb1JvqgFZiTIkdueOgcP55FenEJxhSMQf1ANYrnZKQX77J
KzGlKuMusWCZk1l5ZC/KT4NQCEwYU0l0g2DYKxTZGslSDmLONuu4PBrFWxvy0t9z
CW2egxU3YvFu/ccwwHQ5NkJdGShSImCFcV8+ITe9zahfWAVgobA=
=Nf+V
-----END PGP SIGNATURE-----

--5hfnreocpnadvfxf--
