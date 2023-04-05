Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AA3F6D7EDA
	for <lists+dri-devel@lfdr.de>; Wed,  5 Apr 2023 16:12:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A470B10E980;
	Wed,  5 Apr 2023 14:12:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FA9C10E980
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Apr 2023 14:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=HQOM+smZKr6PNkobWqRjvK0BV96kQ/Zj4PMKFTD9dzs=; b=ZS2pjToMfcuIxBUHPTTHoK5Jnb
 1tIDKZYlxAwabdVXaYXFtI56pVAbZT0KBij9yl3iYRfEF2sdDCAQPdhz9K454MZ00MRgJtQbd+AYZ
 65wEgHBDEpZAIRvTQsx3CvIqX4SD0dgxjAksCN7C0faSRqaHqb1sO/ClUf8nRYfJ+BjynKNkd0Tyx
 q/Ee7lNQNA41Nhf6kRA86F7wKOTN1fJsjwn6GDGNhJ2GJL2O+7EID01pXFO23ENjLMN1leLC/zmuP
 cUGiTAVMhF1tXzE9sA9KsRHspo7VejHbcD5KLlua1TT4QhDH2oPI18bzeSWhYfXL4HabqkOQ+xpdj
 OEVZ1i8A==;
Received: from [38.44.66.31] (helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pk3s4-006HKj-3N; Wed, 05 Apr 2023 16:12:19 +0200
Date: Wed, 5 Apr 2023 13:12:08 -0100
From: Melissa Wen <mwen@igalia.com>
To: =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>
Subject: Re: [PATCH v2 0/2] Update the handling of the primary plane
Message-ID: <20230405141208.hssx5tnlnw6jvgoi@mail.igalia.com>
References: <20230324164226.256084-1-mcanal@igalia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="dsjq2nbnimmem2pu"
Content-Disposition: inline
In-Reply-To: <20230324164226.256084-1-mcanal@igalia.com>
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
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 dri-devel@lists.freedesktop.org, Melissa Wen <melissa.srw@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--dsjq2nbnimmem2pu
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 03/24, Ma=EDra Canal wrote:
> This patchset focus on the proper handling of the primary plane after the
> modifications introduced in commit bc0d7fdefec6 ("drm: vkms: Supports to =
the
> case where primary plane doesn't match the CRTC"). Before this commit, the
> composition was executed on top of the primary plane. Therefore, the prim=
ary
> plane needed to cover the entire CRTC and it needed to be visible. After =
commit
> bc0d7fdefec6, this is no longer necessary, as the composition is now exec=
uted on
> top of the CRTC. So, remove those restrictions to the primary plane.
>=20
> This patchset increased the vkms IGT test coverage. The following tests a=
re now
> passing:
>=20
> - igt@kms_atomic_transition@plane-toggle-modeset-transition
> - igt@kms_atomic_transition@modeset-transition
> - igt@kms_atomic_transition@modeset-transition-fencing
> - igt@kms_atomic_transition@modeset-transition-nonblocking
> - igt@kms_atomic_transition@modeset-transition-nonblocking-fencing
> - igt@kms_universal_plane@disable-primary-vs-flip-pipe-a
> - igt@kms_universal_plane@universal-plane-pageflip-windowed-pipe-a
> - igt@kms_universal_plane@universal-plane-pipe-a-functional
>=20
> Moreover, this patchset was tested with the vkms IGT testlist and all tes=
ts
> passed successfully.

Nice catch. Thanks!

This series is:

Reviewed-by: Melissa Wen <mwen@igalia.com>

>=20
> Best Regards,
> - Ma=EDra Canal
>=20
> v1 -> v2: https://lore.kernel.org/dri-devel/20230320195558.134768-1-mcana=
l@igalia.com/T/
>=20
> * Introduce a second patch to allow the primary plane to be positioned.
>=20
> ---
>=20
> Ma=EDra Canal (2):
>   drm/vkms: remove the need for the primary plane to be visible
>   drm/vkms: allow the primary plane to be positioned
>=20
>  drivers/gpu/drm/vkms/vkms_plane.c | 10 +---------
>  1 file changed, 1 insertion(+), 9 deletions(-)
>=20
> --=20
> 2.39.2
>=20

--dsjq2nbnimmem2pu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEd8WOo/JViG+Tu+XIwqF3j0dLehwFAmQtgaQACgkQwqF3j0dL
ehwitA/9H3oqpWYQA0Ho2B7uwTcov5h79hV/6lvi2pwwgL4iA/BUIS1hjMiNNu6J
bp2zsEY0S48Y7W1Lb6+XVmczpAsek3RbmtAC03LwJ284qsjY5Ixu4HbJsFaxiOC0
G68pt6WgnhXuyL6uxqXNCpeKil3CHW1fyV1i+ZehfpdcSmv6+u7QdlFsWlze0UpE
C81XDj3GAne5GtYz4iMRZcIuDNgRg930TPTeFd+/nss9bTqHOhYkGeFpLA2wzPcl
STLzlsnDFi5Y5JnPWFoIu5E8mevZ1087UAZAyAw5UG3V/WVPBHx1O7zMOQx56uZC
gjwfk9ZSxXGSHyHWu67irEBZ20r8jAejOZzZhGMJpvjCcTAIHNwSsfpZSLctcx+3
zNfiM/7UHu6TQ1ohaGqyxoRoeTVq38377dbJ0Tf7+UUxEfcdUJHJFQ2jFlI8j1hv
gv1MqbhvXPDKUillCWQKpMveKs+i7Ie5VwGgkmSMzBiyQUM2JW5xi5vMTMS+S3Kd
efQtZVEWqXszSIbtuJXzXmiG6V+NslZYXYAiGUd4kXWElIItt4a01Yg5jF/X63st
qWXm3UH7Iwp1PIGj/XdZcMtt2ACs+Fz4NduSlnpffE4YXP0Z4bJ4shC1ClYZ5/UD
eOba9HS+vGhhQLaVLQe+c5AfpeGZvBfxttwBKgYlT/QOOh95SME=
=FFRx
-----END PGP SIGNATURE-----

--dsjq2nbnimmem2pu--
