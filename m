Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F0EB87F50A5
	for <lists+dri-devel@lfdr.de>; Wed, 22 Nov 2023 20:34:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DEB210E0AB;
	Wed, 22 Nov 2023 19:34:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3235A10E0AA
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Nov 2023 19:34:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 52345B821E7;
 Wed, 22 Nov 2023 19:34:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22B28C433C8;
 Wed, 22 Nov 2023 19:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1700681668;
 bh=OEAiAa4+BwBMz9R5kgZq2H6MuqYGiQaaeYPalWgnvGw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=g5/McEbnVAr0rRTefhGKIsY8JT9nkZgdJKBOeirfuosID8rlZbfrRwtNTSKQGWGIW
 7wvgi0iZN/JtmI3iI1IH1/cfAcUbnbcGWS187Q5XMhaKgpW57iH9nFL34H7vogqgOV
 WMh2pFzG0Ud11YWYUPk8NAC/eN7Jf5JxoSqWkwXySDcrXP6aGVmC/WQNLgRlM0nVbC
 v6V9u4nUuv85UeI8R61ga7ytnAvRry7knVpZ1hkevE6NxoAchdOwvpQ5ir3GS71pZZ
 nUykG7UD8hdH8PxDxX4lgNo7csx7DhNGWk+XWVrUANv9dHrcH+fR0LLRasjhiEK2LL
 5T6vS5xtb1u2Q==
Date: Wed, 22 Nov 2023 20:34:25 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Donald Robson <donald.robson@imgtec.com>
Subject: Re: [PATCH v9 00/20] Imagination Technologies PowerVR DRM driver
Message-ID: <jl4igixnszibpq5hindyjvrh6eten7mjr6hj32fst4irjbg2t6@gdks4ydvhshw>
References: <cover.1700668843.git.donald.robson@imgtec.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="yhpbdcvhvn7tgvwg"
Content-Disposition: inline
In-Reply-To: <cover.1700668843.git.donald.robson@imgtec.com>
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
Cc: linux-doc@vger.kernel.org, hns@goldelico.com,
 dri-devel@lists.freedesktop.org, krzysztof.kozlowski+dt@linaro.org,
 matthew.brost@intel.com, corbet@lwn.net, luben.tuikov@amd.com, dakr@redhat.com,
 devicetree@vger.kernel.org, conor+dt@kernel.org, matt.coster@imgtec.com,
 robh+dt@kernel.org, faith.ekstrand@collabora.com, linux-kernel@vger.kernel.org,
 afd@ti.com, boris.brezillon@collabora.com, tzimmermann@suse.de,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--yhpbdcvhvn7tgvwg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Nov 22, 2023 at 04:34:21PM +0000, Donald Robson wrote:
> This patch series adds the initial DRM driver for Imagination Technologie=
s PowerVR
> GPUs, starting with those based on our Rogue architecture. It's worth poi=
nting
> out that this is a new driver, written from the ground up, rather than a
> refactored version of our existing downstream driver (pvrsrvkm).
>=20
> This new DRM driver supports:
> - GEM shmem allocations
> - dma-buf / PRIME
> - Per-context userspace managed virtual address space
> - DRM sync objects (binary and timeline)
> - Power management suspend / resume
> - GPU job submission (geometry, fragment, compute, transfer)
> - META firmware processor
> - MIPS firmware processor
> - GPU hang detection and recovery
>=20
> Currently our main focus is on the AXE-1-16M GPU. Testing so far has been=
 done
> using a TI SK-AM62 board (AXE-1-16M GPU). The driver has also been confir=
med to
> work on the BeaglePlay board. Firmware for the AXE-1-16M can be found her=
e:
> https://gitlab.freedesktop.org/frankbinns/linux-firmware/-/tree/powervr
>=20
> A Vulkan driver that works with our downstream kernel driver has already =
been
> merged into Mesa [1][2]. Support for this new DRM driver is being maintai=
ned in
> a merge request [3], with the branch located here:
> https://gitlab.freedesktop.org/frankbinns/mesa/-/tree/powervr-winsys
>=20
> Vulkan driver links referred to above:
> [1] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/15243
> [2] https://gitlab.freedesktop.org/mesa/mesa/-/tree/main/src/imagination/=
vulkan
> [3] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/15507
>=20
> Job stream formats are documented at:
> https://gitlab.freedesktop.org/mesa/mesa/-/blob/f8d2b42ae65c2f16f36a43e0a=
e39d288431e4263/src/imagination/csbgen/rogue_kmd_stream.xml
>=20
> The Vulkan driver is progressing towards Vulkan 1.0. The current combinat=
ion of this
> kernel driver with the Mesa Vulkan driver (powervr-mesa-next branch) succ=
essfully
> completes Vulkan CTS 1.3.4.1 in our local runs. The driver is expected to=
 pass the
> Khronos Conformance Process once the submission is made.
>=20
> The code in this patch series, along with the needed dts changes can be f=
ound here:
> https://gitlab.freedesktop.org/frankbinns/powervr/-/tree/dev/v9_dts
> The full development history can be found here:
> https://gitlab.freedesktop.org/frankbinns/powervr/-/tree/powervr-next

I just merged all the patches to drm-misc-next.

Congrats :)

Maxime

--yhpbdcvhvn7tgvwg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZV5XwQAKCRDj7w1vZxhR
xQRDAPwJJyRpMcbHjTq7UnC2OyBaXf8KMwPzhe509wvPJWD7vwD/VaDJvd9wF7Pb
syxg6XJXQ0MCnmWfXybmQk07JbFNKws=
=qJrP
-----END PGP SIGNATURE-----

--yhpbdcvhvn7tgvwg--
