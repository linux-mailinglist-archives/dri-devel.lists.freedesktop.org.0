Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4150A590907
	for <lists+dri-devel@lfdr.de>; Fri, 12 Aug 2022 01:17:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F9588E7D0;
	Thu, 11 Aug 2022 23:17:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 543 seconds by postgrey-1.36 at gabe;
 Thu, 11 Aug 2022 23:16:43 UTC
Received: from gimli.rothwell.id.au (gimli.rothwell.id.au [103.230.158.156])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E2FC12A202
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Aug 2022 23:16:43 +0000 (UTC)
Received: from authenticated.rothwell.id.au (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.rothwell.id.au (Postfix) with ESMTPSA id 4M3jBY2S2CzyZt;
 Fri, 12 Aug 2022 09:07:33 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rothwell.id.au;
 s=201702; t=1660259255;
 bh=MQdGlv7/KuLvICsIqGjekw2CdHuPtmyaZo7g6m/4FjI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=adZNluClMa2RHl848Ly9cmmxaBRWrS5jN925SdAWWhmWEqgqt1j6UPqyrhqmTz7dx
 5/OLBxkgKq0xH+1eeUdBZkuhyMZ6W33mnxSu+fPSPNXEiixZMceZ9S/ONjEGAScSWq
 fQ34MLaIPk3soIwNg5I/x8Z5iovR/F+idT0otWFtHsiEOrN/GEpoMVrKzeniPK8foV
 uKaaFFVdJkGqulsfxrpHZbdNDVSbIYC9eVLwOe/dzR0IjlMRiOAc2VHLSzWh3GvDQq
 jzl/WG7CdoDbDm4z2Da/8yZnUMmvlMF3k1MY5bX7boTxbH1evSclE2TEWbk2sZQ+WQ
 5jx5A7bpu5c+w==
Date: Fri, 12 Aug 2022 09:07:31 +1000
From: Stephen Rothwell <sfr@rothwell.id.au>
To: Alex Deucher <alexander.deucher@amd.com>
Subject: Re: build failure of next-20220811 due to b1a63a0b48ad
 ("drm/amd/display: consider DSC pass-through during mode validation")
Message-ID: <20220812090731.31da7d85@oak.ozlabs.ibm.com>
In-Reply-To: <YvU4GD8HtZ1A4dhI@debian>
References: <YvU4GD8HtZ1A4dhI@debian>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/lBwBYWJZfaTJxqb/SqOb3za";
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org,
 "Sudip Mukherjee \(Codethink\)" <sudipm.mukherjee@gmail.com>,
 Fangzhi Zuo <Jerry.Zuo@amd.com>, linux-next@vger.kernel.org,
 Hamza Mahfooz <hamza.mahfooz@amd.com>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/lBwBYWJZfaTJxqb/SqOb3za
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 11 Aug 2022 18:10:48 +0100 "Sudip Mukherjee (Codethink)" <sudipm.mu=
kherjee@gmail.com> wrote:
>
> Not sure if it has been reported, builds of riscv, alpha, s390, arm,
> arm64, xtensa, mips, csky allmodconfig have failed to build next-20220811
> with the error:
>=20
> ERROR: modpost: "dc_dsc_compute_bandwidth_range" [drivers/gpu/drm/amd/amd=
gpu/amdgpu.ko] undefined!
> ERROR: modpost: "dc_dsc_get_policy_for_timing" [drivers/gpu/drm/amd/amdgp=
u/amdgpu.ko] undefined!
>=20
> git bisect pointed to b1a63a0b48ad ("drm/amd/display: consider DSC pass-t=
hrough during mode validation")
> And, reverting that commit has fixed the build failure.
>=20
> I will be happy to test any patch or provide any extra log if needed.

I have reverted that commit in today's linux-next.

--=20
Cheers,
Stephen Rothwell

--Sig_/lBwBYWJZfaTJxqb/SqOb3za
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmL1i7MACgkQAVBC80lX
0GzSzAf8DKPebARHzdTqD13VNr3O67jzPL8ES7pQodgFmZMSKK3Y+vrG88X3EVSk
ix+XD73wo/KvGZwASDZf7CMKj84ihNm3re6hPjsLcHMeZ4bpwJi46enWVl+EA3zQ
cDzSOP++Vl1dm/RNZXMVm30CIvVjX8MgDuwGqXhWvbWL2Q0yq1xg3dddCYLl9y4p
R3MSWvVXijrkQSdsM0v6oYI80x5GpcQPk+H+fpsmkd0EwKDKG0sNste7Sbk9XfqM
ljtDoOkgQ85wzHC8IExlgQnjDMswtlW/b78kzXfdysl8KIQrHjo5aOsds0ZeHkCZ
tbr3b9HgZktRYDXh16COSYyVZFzJKg==
=Mbox
-----END PGP SIGNATURE-----

--Sig_/lBwBYWJZfaTJxqb/SqOb3za--
