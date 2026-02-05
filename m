Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sH83G1xehGnS2gMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Feb 2026 10:09:48 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E897F057F
	for <lists+dri-devel@lfdr.de>; Thu, 05 Feb 2026 10:09:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DE0610E814;
	Thu,  5 Feb 2026 09:09:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="t3Do5o/M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45B5C10E811;
 Thu,  5 Feb 2026 09:09:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id D557A43CF5;
 Thu,  5 Feb 2026 09:09:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32E74C4CEF7;
 Thu,  5 Feb 2026 09:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1770282582;
 bh=zl4sbHSqQvdTaC6HnQvBhEdXXeHWBp1tuYx5j590apM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=t3Do5o/MafD9ehMBYLDcL6lkwnhLhq7e7CmVmXfx/72tZJIqUv0eb4X4EeXtXm6vR
 RW63+1NuIBUrTq/eu2tKZJX7YOLZ4jCHshKJiDziCMI7d2kSZoMljOFXHIhL8er+PL
 W0NP4t1bUDCB0r4tjLPDezoShXIZBslt6MlSwgXiNS/TfvuBrka/LlOGHMCiUg0J9B
 I9/4K4mDBsgkY5QtcDjK1pxQyBBpl88WhiQ93+9sO1V7VsPbg0yxw4A8X9M0dD8+E7
 ny/rIA++tFugaFGRpyADPPMod8asmBnydKD5SndU2jZkxE+f+ci7rQ0voN9C2YD9CD
 IoEXJlcdZHU+A==
Date: Thu, 5 Feb 2026 10:09:40 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Leon Romanovsky <leon@kernel.org>, 
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, 
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Gerd Hoffmann <kraxel@redhat.com>, 
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, 
 Chia-I Wu <olvaffe@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>,
 Lucas De Marchi <lucas.demarchi@intel.com>, 
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Kevin Tian <kevin.tian@intel.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Felix Kuehling <Felix.Kuehling@amd.com>, 
 Alex Williamson <alex@shazbot.org>, Ankit Agrawal <ankita@nvidia.com>, 
 Vivek Kasireddy <vivek.kasireddy@intel.com>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, 
 virtualization@lists.linux.dev, intel-xe@lists.freedesktop.org,
 linux-rdma@vger.kernel.org, iommu@lists.linux.dev, kvm@vger.kernel.org
Subject: Re: [PATCH v7 0/8] dma-buf: Use revoke mechanism to invalidate
 shared buffers
Message-ID: <20260205-nocturnal-poetic-chamois-f566ad@houat>
References: <20260131-dmabuf-revoke-v7-0-463d956bd527@nvidia.com>
 <20260202160425.GO34749@unreal> <20260204081630.GA6771@unreal>
 <20260204-icy-classic-crayfish-68da6d@houat>
 <20260204115212.GG6771@unreal>
 <20260204-clever-butterfly-of-mastery-0cdc19@houat>
 <20260204121354.GH6771@unreal>
 <20260204-bloodhound-of-major-realization-9852ab@houat>
 <20260204135657.GE2328995@ziepe.ca>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="tnyg2jepdblvcibb"
Content-Disposition: inline
In-Reply-To: <20260204135657.GE2328995@ziepe.ca>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.91 / 15.00];
	SIGNED_PGP(-2.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[kernel.org,amd.com,linaro.org,gmail.com,ffwll.ch,redhat.com,collabora.com,chromium.org,linux.intel.com,suse.de,intel.com,8bytes.org,arm.com,shazbot.org,nvidia.com,vger.kernel.org,lists.freedesktop.org,lists.linaro.org,lists.linux.dev];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[mripard@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[34];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 1E897F057F
X-Rspamd-Action: no action


--tnyg2jepdblvcibb
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v7 0/8] dma-buf: Use revoke mechanism to invalidate
 shared buffers
MIME-Version: 1.0

On Wed, Feb 04, 2026 at 09:56:57AM -0400, Jason Gunthorpe wrote:
> On Wed, Feb 04, 2026 at 02:44:42PM +0100, Maxime Ripard wrote:
> > > From what I have seen, subsystems such as netdev, the block layer, an=
d RDMA continue
> > > to accept code that is ready for merging, especially when it has been=
 thoroughly
> > > reviewed by multiple maintainers across different subsystems.
> >=20
> > He said it multiple times, but here's one of such examples:
> >=20
> > https://lore.kernel.org/all/CA+55aFwdd30eBsnMLB=3DncExY0-P=3DeAsxkn_O6i=
r10JUyVSYdhA@mail.gmail.com/
>=20
> Woah, nobody is saying to skip linux-next. It is Wednesday, if it
> lands in the public tree today it will be in linux next probably for a
> week before a PR is sent. This is a fairly normal thing for many trees
> in Linux.
>=20
> Linus is specifically complaining about people *entirely* skipping
> linux-next.
>=20
> > So, yeah, we can make exceptions. But you should ask and justify for
> > one, instead of expecting us to pick up a patch submission that was
> > already late.
>=20
> I think Leon is only pointing out that a hard cut off two weeks before
> the merge window even opens is a DRMism, not a kernel wide convention.

arm-soc has had the same kind of rule since pretty much forever too.

Maxime

--tnyg2jepdblvcibb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaYReTwAKCRAnX84Zoj2+
dplgAX9hHIFQbqLK+fxvL0TIdlxKHnC96b/mM0HwLMbHd0IAQvPbbGrZJ2/A2X06
zK51PYIBgNEjofrl7KBPxkMocbEwYn4jvc85iFf17a3flZDzCXRl//ksV9ObDYVt
vXboJHIz/Q==
=MSKg
-----END PGP SIGNATURE-----

--tnyg2jepdblvcibb--
