Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC4AEB07055
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jul 2025 10:22:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9663B10E6CA;
	Wed, 16 Jul 2025 08:22:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Ju9r0yge";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3D1E10E6CA
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jul 2025 08:22:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 6DC9744E70;
 Wed, 16 Jul 2025 08:22:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3AC8C4CEF9;
 Wed, 16 Jul 2025 08:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752654150;
 bh=V4D522z6UUEGIW4Wg6YSnm8NKzfzikRtghcHIDH2hWc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Ju9r0ygeIoehctwwAmdbT/gnfDwO9Wx9CcOiz8KdX+fbbUUW44D3fiXaJL6ORkQll
 NStAgkyukkjf0jmlnc+7NmUNmVnsxXJtXtjpIEZfICw+MgHB6EukkgT+gI0GlE0ymn
 0sB/lbzBlumLdjrsptDrl/3BbpnNY4NxBxXo79i7geNfD4Ip4W7E7vNPGo6MQ+HL3s
 XNk3X9dbyeUezh1dNqRL+ALj9ijiDE+UH1Ko4if/JVXnV6dkA0fqgeaxcUjfplQznk
 hmsDIryCvejDyEO1edOecCZ/ea1g5mxVBovVrHfR3gaLjaG7eJTDw3g71cPoAdDVUf
 HMZZxthoAuLpg==
Date: Wed, 16 Jul 2025 10:22:27 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Mario Limonciello <superm1@kernel.org>
Cc: David Airlie <airlied@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, 
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, 
 Simona Vetter <simona@ffwll.ch>, Lukas Wunner <lukas@wunner.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Woodhouse <dwmw2@infradead.org>, Lu Baolu <baolu.lu@linux.intel.com>, 
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>,
 Alex Williamson <alex.williamson@redhat.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>, 
 "open list:INTEL IOMMU (VT-d)" <iommu@lists.linux.dev>,
 "open list:PCI SUBSYSTEM" <linux-pci@vger.kernel.org>, 
 "open list:VFIO DRIVER" <kvm@vger.kernel.org>,
 "open list:SOUND" <linux-sound@vger.kernel.org>, 
 Daniel Dadap <ddadap@nvidia.com>, Mario Limonciello <mario.limonciello@amd.com>
Subject: Re: [PATCH v8 9/9] PCI: Add a new 'boot_display' attribute
Message-ID: <20250716-upbeat-tody-of-psychology-93e2a2@houat>
References: <20250714212147.2248039-1-superm1@kernel.org>
 <20250714212147.2248039-10-superm1@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="k6j22jwrkd2tjfpl"
Content-Disposition: inline
In-Reply-To: <20250714212147.2248039-10-superm1@kernel.org>
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


--k6j22jwrkd2tjfpl
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v8 9/9] PCI: Add a new 'boot_display' attribute
MIME-Version: 1.0

Hi Mario,

On Mon, Jul 14, 2025 at 04:21:46PM -0500, Mario Limonciello wrote:
> From: Mario Limonciello <mario.limonciello@amd.com>
>=20
> On systems with multiple GPUs there can be uncertainty which GPU is the
> primary one used to drive the display at bootup. In order to disambiguate
> this add a new sysfs attribute 'boot_display' that uses the output of
> video_is_primary_device() to populate whether a PCI device was used for
> driving the display.
>=20
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
> v7:
>  * fix lkp failure
>  * Add tag
> v6:
>  * Only show for the device that is boot display
>  * Only create after PCI device sysfs files are initialized to ensure
>    that resources are ready.
> v4:
>  * new patch
> ---
>  Documentation/ABI/testing/sysfs-bus-pci |  8 +++++
>  drivers/pci/pci-sysfs.c                 | 46 +++++++++++++++++++++++++
>  2 files changed, 54 insertions(+)
>=20
> diff --git a/Documentation/ABI/testing/sysfs-bus-pci b/Documentation/ABI/=
testing/sysfs-bus-pci
> index 69f952fffec72..8b455b1a58852 100644
> --- a/Documentation/ABI/testing/sysfs-bus-pci
> +++ b/Documentation/ABI/testing/sysfs-bus-pci
> @@ -612,3 +612,11 @@ Description:
> =20
>  		  # ls doe_features
>  		  0001:01        0001:02        doe_discovery
> +
> +What:		/sys/bus/pci/devices/.../boot_display
> +Date:		October 2025
> +Contact:	Linux PCI developers <linux-pci@vger.kernel.org>
> +Description:
> +		This file indicates the device was used as a boot
> +		display. If the device was used as the boot display, the file
> +		will be present and contain "1".

It would probably be a good idea to define what a "boot display" here
is. I get what you mean, but it's pretty vague and could easily be
misunderstood.

Maxime

--k6j22jwrkd2tjfpl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaHdhQwAKCRAnX84Zoj2+
dmq9AYDxe/0Z5T43z0PYAkTEFn17IfyWd5PSFPwPt5sbAZu5sPFpkiTIYzsW8zQO
FdVNAZgBgMbsfM0ASem/uZk2LHVlbNAmBeJms8JHF/ENscuRsyCN5ltCZOVlNZM0
tOdrKjIKvw==
=zc9C
-----END PGP SIGNATURE-----

--k6j22jwrkd2tjfpl--
