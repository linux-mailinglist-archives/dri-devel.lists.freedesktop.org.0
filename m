Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82C6D77C844
	for <lists+dri-devel@lfdr.de>; Tue, 15 Aug 2023 09:10:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F7BE10E0CC;
	Tue, 15 Aug 2023 07:10:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72DBA10E0C6
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Aug 2023 07:10:37 +0000 (UTC)
Received: from xpredator (unknown
 [IPv6:2a02:2f08:470d:cf00:7656:3cff:fe3f:7ce9])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 (Authenticated sender: mvlad)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 9838D66071E7;
 Tue, 15 Aug 2023 08:10:35 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1692083436;
 bh=0u3+160xZMEGghTqSGh6eI8lfhv/O9H7bF1e8kOR1hs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jm1WaL2MxdxMFXaG7DRcKgZ2UE+8ule7LmTqkmDn4ilYIqMDBnxXTFbSwfw8Q1STZ
 TJvhwvSxSN/5p/2pqwrT1T6JuQYWvKp7UEE8wCkU5FQ+j21v6jAdbL6o3ci1GI14Dq
 5dTKMu0Dm4z94AAPfmqeXNRLq2YLRWhGCWZ1ielucN8f3GYqkvq5sZfvgla5G56S5M
 h7rBZFGpaHe/XKj6atl7yhOmek8TDsD2ihhltId+ouJl80UmH90blZzXqflhv33ora
 vi64g5E2+Cz4erEFlog+tjDHdH07mNnJDWaEi+MMFFBC1sO+cCpa9t7HvHMS5M51uF
 ugDHik3yAaNqw==
Date: Tue, 15 Aug 2023 10:10:32 +0300
From: Marius Vlad <marius.vlad@collabora.com>
To: Brandon Ross Pollack <brpol@chromium.org>, jshargo@chromium.org,
 yixie@chromium.org
Subject: Re: [PATCH v2 0/6] Adds support for ConfigFS to VKMS!
Message-ID: <ZNsk6PDfJNxBJ97Z@xpredator>
References: <20230623222353.97283-1-jshargo@chromium.org>
 <17326fa0-b0f9-1a6b-e9c5-d7801b383f04@chromium.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="x5xBW3ITDXSHDQyO"
Content-Disposition: inline
In-Reply-To: <17326fa0-b0f9-1a6b-e9c5-d7801b383f04@chromium.org>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--x5xBW3ITDXSHDQyO
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Brandon,

Is Jim Shargo no longer able to follow-up with these anymore? Can you
reach out to him? Maybe he's on holiday/vacation at this point?

If you decide to follow-up we need a v3 -- and possibly a few more, but
I'd just focus on getting the ConfigFS infrastructure in, addressing
current comments, re-base on top of drm-misc as they do not apply
anymore, and further polishing the patches.

After that gets in, I'd then focus of getting on expanding on it and
getting hot-plug. You'd need also some i-g-t tests for that.

There's also bunch of i-g-t tests sitting in a MR but those need to be=20
posted to igt-dev@lists.freedesktop.org rather than on gitlab. We'd need
that in as well.

On Tue, Aug 08, 2023 at 12:30:38PM +0900, Brandon Ross Pollack wrote:
> Some of these comments have been sitting for a while.=A0 Would it be ok if
> yixie@chromium.org and myself picked these up and did an iteration so we
> could also get https://patchwork.kernel.org/project/dri-devel/patch/20230=
711013148.3155572-1-brpol@chromium.org/
> submitted?=A0 These will enable a lot of virtual multi display testing in
> linux! :)
>=20
> On 6/24/23 07:23, Jim Shargo wrote:
> > Intro
> > =3D=3D=3D=3D=3D
> >=20
> > At long last, we're back!
> >=20
> > This patchset adds basic ConfigFS support to VKMS, allowing users to
> > build new DRM devices with user-defined DRM objects and object
> > relationships by creating, writing, and symlinking files.
> >=20
> > Usageubmitted
> > =3D=3D=3D=3D=3D
> >=20
> > After installing these patches, you can create a VKMS device with two
> > displays and a movable overlay like so (this is documented in the
> > patches):
> >=20
> >    $ modprobe vkms enable_overlay=3D1 enable_cursor=3D1 enable_writebac=
k=3D1
> >    $ mkdir -p /config/
> >    $ mount -t configfs none /config
> >=20
> >    $ export DRM_PLANE_TYPE_PRIMARY=3D1
> >    $ export DRM_PLANE_TYPE_CURSOR=3D2
> >    $ export DRM_PLANE_TYPE_OVERLAY=3D0
> >=20
> >    $ mkdir /config/vkms/test
> >=20
> >    $ mkdir /config/vkms/test/planes/primary
> >    $ echo $DRM_PLANE_TYPE_PRIMARY > /config/vkms/test/planes/primary/ty=
pe
> >=20
> >    $ mkdir /config/vkms/test/planes/other_primary
> >    $ echo $DRM_PLANE_TYPE_PRIMARY > /config/vkms/test/planes/other_prim=
ary/type
> >=20
> >    $ mkdir /config/vkms/test/planes/cursor
> >    $ echo $DRM_PLANE_TYPE_CURSOR > /config/vkms/test/planes/cursor/type
> >=20
> >    $ mkdir /config/vkms/test/planes/overlay
> >    $ echo $DRM_PLANE_TYPE_OVERLAY > /config/vkms/test/planes/overlay/ty=
pe
> >=20
> >    $ mkdir /config/vkms/test/crtcs/crtc
> >    $ mkdir /config/vkms/test/crtcs/crtc_other
> >    $ mkdir /config/vkms/test/encoders/encoder
> >    $ mkdir /config/vkms/test/connectors/connector
> >=20
> >    $ ln -s /config/vkms/test/encoders/encoder /config/vkms/test/connect=
ors/connector/possible_encoders
> >    $ ln -s /config/vkms/test/crtcs/crtc /config/vkms/test/encoders/enco=
der/possible_crtcs/
> >    $ ln -s /config/vkms/test/crtcs/crtc /config/vkms/test/planes/primar=
y/possible_crtcs/
> >    $ ln -s /config/vkms/test/crtcs/crtc /config/vkms/test/planes/cursor=
/possible_crtcs/
> >    $ ln -s /config/vkms/test/crtcs/crtc /config/vkms/test/planes/overla=
y/possible_crtcs/
> >    $ ln -s /config/vkms/test/crtcs/crtc_other /config/vkms/test/planes/=
overlay/possible_crtcs/
> >    $ ln -s /config/vkms/test/crtcs/crtc_other /config/vkms/test/planes/=
other_primary/possible_crtcs/
> >=20
> >    $ echo 1 > /config/vkms/test/enabled
> >=20
> > Changes within core VKMS
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >=20
> > This introduces a few important changes to the overall structure of
> > VKMS:
> >=20
> >    - Devices are now memory managed!
> >    - Support for multiple CRTCs and other objects has been added
> >=20
> > Since v1
> > =3D=3D=3D=3D=3D=3D=3D=3D
> >=20
> >    - Added DRMM memory management to automatically clean up resources
> >    - Added a param to disable the default device
> >    - Renamed "cards" to "devices" to improve legibility
> >    - Added a lock for the configfs setup handler
> >    - Moved all the new docs into the relevant .c file
> >    - Addressed as many of sean@poorly.run as possible
> >=20
> > Testing
> > =3D=3D=3D=3D=3D=3D=3D
> >=20
> >    - New IGT tests (see
> >      gitlab.freedesktop.org/jshargo/igt-gpu-tools/-/merge_requests/1)
> >    - Existing IGT tests (excluding .*suspend.*, including .*kms_flip.*
> >      .*kms_writeback.* .*kms_cursor_crc.*, .*kms_plane.*)
> >=20
> > Outro
> > =3D=3D=3D=3D=3D
> >=20
> > I'm excited to share these changes, it's my still my first kernel patch
> > and I've been putting a lot of love into these.
> >=20
> > Jim Shargo (6):
> >    drm/vkms: Back VKMS with DRM memory management instead of static
> >      objects
> >    drm/vkms: Support multiple DRM objects (crtcs, etc.) per VKMS device
> >    drm/vkms: Provide platform data when creating VKMS devices
> >    drm/vkms: Add ConfigFS scaffolding to VKMS
> >    drm/vkms: Support enabling ConfigFS devices
> >    drm/vkms: Add a module param to enable/disable the default device
> >=20
> >   Documentation/gpu/vkms.rst            |  17 +-
> >   drivers/gpu/drm/Kconfig               |   1 +
> >   drivers/gpu/drm/vkms/Makefile         |   1 +
> >   drivers/gpu/drm/vkms/vkms_composer.c  |  28 +-
> >   drivers/gpu/drm/vkms/vkms_configfs.c  | 657 ++++++++++++++++++++++++++
> >   drivers/gpu/drm/vkms/vkms_crtc.c      |  97 ++--
> >   drivers/gpu/drm/vkms/vkms_drv.c       | 208 +++++---
> >   drivers/gpu/drm/vkms/vkms_drv.h       | 166 +++++--
> >   drivers/gpu/drm/vkms/vkms_output.c    | 299 ++++++++++--
> >   drivers/gpu/drm/vkms/vkms_plane.c     |  44 +-
> >   drivers/gpu/drm/vkms/vkms_writeback.c |  26 +-
> >   11 files changed, 1312 insertions(+), 232 deletions(-)
> >   create mode 100644 drivers/gpu/drm/vkms/vkms_configfs.c

--x5xBW3ITDXSHDQyO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEcDKHej6x6uPk3J379jQS5glH1u8FAmTbJOUACgkQ9jQS5glH
1u/nFRAAvZjbB/sQZVwni9H7odnbTUEGKasiZW6zLv9uBDCfNycgCDQqV7Pq8Xiy
VCiN5MqAJXko8xaVjrb9woFxr/Lbj+zOMXPEaq6E7nkUa4prDElNN0jQwsilrM8K
xWv9EqMBibjeGe4IugJLxaJCqgK8X3YlNGwKJBbOOBxd1sLH/nm0dxzupMVO/s+P
nt1ND1e55pGRHviVwx6gI64Ln2GiSLimNCQ+5gvtD6vWvX9vbviAimply7ANg6tW
mZq3/HdjwnxRtbdK2fwaEAncSdjt8VCreweJtAgt7HI13ZVnyLJ6L45l77DFGqzN
UHlMSTx2X/9uubo3hSMayXLEfEsemWxkFWoDrB7IxWflhnoJBBD+fYKCb5xtCZIw
BUgGwPPX5imwCR6X0LRpWtRqNGxUlogWwhJoO7X0LzAh6zbbRZGsjTYRJu6GC9+B
xS4Nvs9CaYmQ82vIKv/IMRx3Cw40ctSaIKNJ7PLxOg602XSbS9/odPm9LpdcEBWd
Bw+9gwJKuPNYx1QYcszcmozR2YOBy+P2UrkcjK0NCZtLCSZEAnV6xMERoGJZsUj6
L6XIWlzZoVHAOTzDeCQ83dspUuPuH0QYmtPKIKtlGXIfK2q96dr8FoPOJd96qMbF
QQU14duh2LmuAT/6jOF9fICisiIgR39RWSkrEVIOstZXaS74NdQ=
=lDW9
-----END PGP SIGNATURE-----

--x5xBW3ITDXSHDQyO--
