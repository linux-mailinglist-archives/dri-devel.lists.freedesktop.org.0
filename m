Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BD95C0F46D
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 17:29:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A00E110E4F5;
	Mon, 27 Oct 2025 16:29:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="lFQew1pO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FA7110E4F5
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 16:29:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 0C97A40621;
 Mon, 27 Oct 2025 16:29:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A4A1C4CEFD;
 Mon, 27 Oct 2025 16:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761582541;
 bh=NfHPlwWsM9eAJ+QfU9nW2b0sBCED7mfiC4nhVZZCd5E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lFQew1pOQYiPwFcplM/5FHAetlC7c6d06JiP3BvU7Le1oLw8gdUTBAXcLIIY0BGEa
 rWKLN5tEVCTO5dqMeXS5Yac3Yc1v8FFPc3QcyaVTqmVb7SQAgZUp6LYkPF02FQeaPn
 YbYXHGQ1/FNxMXk/SMRhOaE69BY9WBRGp3hsBboVSHDW8XkU/Z6ZTGYMx1RsVrj8yn
 e21E0d5BS7R8KmGEAKNaKAljdg+n29M3txpIrDSDL4KsTtdUl33+wPxs7qxWyNQWpw
 n+56HHnbBbJhvhbbkQNZLmNmEAonlSPtrINGV3/lMSz0CBP0OYsr5KP8mo6Ucf9+mE
 4hn+Y961Xukrg==
Date: Mon, 27 Oct 2025 17:28:58 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, 
 Francesco Valla <francesco@valla.it>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jonathan Corbet <corbet@lwn.net>, Jocelyn Falempe <jfalempe@redhat.com>, 
 Javier Martinez Canillas <javierm@redhat.com>, Sam Ravnborg <sam@ravnborg.org>,
 linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-embedded@vger.kernel.org
Subject: Re: [PATCH RFC 0/3] Add splash DRM client
Message-ID: <i7xxy33do4q4odvxxb77xv4ri5jgr6dup5kvfsjfs4h7mbmhrj@h3ke7h5whyvx>
References: <20251027-drm_client_splash-v1-0-00698933b34a@valla.it>
 <yq4btdc5qqukuqps7y53dratmu64ghyifgprlndnk5rbgml4of@rvca75sncvsm>
 <3edea192-6a3f-44f5-b570-7033776e2ce4@suse.de>
 <5ff10f7d-e9d4-4d4d-ae82-8986dc28d14b@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="7awwfwoj7c6l6xia"
Content-Disposition: inline
In-Reply-To: <5ff10f7d-e9d4-4d4d-ae82-8986dc28d14b@amd.com>
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


--7awwfwoj7c6l6xia
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH RFC 0/3] Add splash DRM client
MIME-Version: 1.0

On Mon, Oct 27, 2025 at 11:01:55AM -0500, Mario Limonciello wrote:
> On 10/27/25 7:35 AM, Thomas Zimmermann wrote:
> > > > =A0=A0 - a very simple progress bar, which can be driven through sy=
sfs;
> >=20
> > Once you have options to control these settings from user space, you
> > should do it in user space entirely. As Maxime suggested, please improve
> > plymouth for anything with animation.
> >=20
> > > > =A0=A0 - a static image (optional).
> >=20
> > Board vendors often provide an image, see /sys/firmware/acpi/bgrt/. This
> > is a candidate for display, or the penguin or a custom image. Please
> > make it configurable by Kconfig. Again, if you need policy and
> > heuristics for deciding what to display, you better do this in user
> > space.
>=20
> I'd actually argue that the static image from BGRT should be the preferred
> priority.  This can make for a nice hand off to Plymouth.
>=20
> The (UEFI) BIOS already will show this image as soon as the GOP driver is
> loaded.  Bootloaders like GRUB by default will avoid showing anything or
> will overwrite with the exact same image in the same location.  This can =
let
> the kernel do the same, and then the moment Plymouth takes over it could =
do
> the same.

And BGRT isn't typically found on embedded systems at all, so I'm not
sure it's a sensible default, let alone a priority. At most a possible
fallback.

Maxime

--7awwfwoj7c6l6xia
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaP+dygAKCRAnX84Zoj2+
dsfaAYDY9ovUiQP79ROQRhKc7BCKdMp1L3VkbIgTj4bwXt2PF9rSnPcEwQZKoNYw
zY78exEBgMDy2VGrw+RfaBKQ2UDubn6n6yMCh1ALbHFbSTM4Q8WYXU+6Znzf5awl
u8Sy5EOIyg==
=eXcr
-----END PGP SIGNATURE-----

--7awwfwoj7c6l6xia--
