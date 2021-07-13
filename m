Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A5D53C70ED
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jul 2021 15:05:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B3F989FE3;
	Tue, 13 Jul 2021 13:05:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9879389FE3;
 Tue, 13 Jul 2021 13:05:35 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 6BC602048D;
 Tue, 13 Jul 2021 13:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1626181534; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hg7sI/AKsuDjOtnDcjGgb8bPU62RtTSIOchsBPJEiQ0=;
 b=HYqZ1+4YgM1kcKra3GtMRS3X9P+mM62Y6IX3muUb5ZLOUebOCTxBYZG7JMQ5MaeACOLXEu
 gGrjEfrwwn2yvGj09NF2aq0zjMKpOVPvcMpW/xLLGbI20hzJyOMg4vdzGwpFkjFnpeJ5je
 F9uS3Y/dVmgJCVO1glv1DhLXSbs8Nw0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1626181534;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hg7sI/AKsuDjOtnDcjGgb8bPU62RtTSIOchsBPJEiQ0=;
 b=QMoLpd0KIdvRorn43N7gY2vKik5D+nIU+/p7S1LS/5r++GmJT27oAuZ/oIynxyLZ9V5uYB
 DDcGnG69ZFxsLRBA==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 4179913A3F;
 Tue, 13 Jul 2021 13:05:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id 6x80Dp6P7WDvYwAAGKfGzw
 (envelope-from <tzimmermann@suse.de>); Tue, 13 Jul 2021 13:05:34 +0000
Subject: Re: [PATCH] dim/drm-misc: Add rule to not push patches with issues
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20210709081116.4170288-1-daniel.vetter@ffwll.ch>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <8fe7ad87-950a-0235-839c-ec2821419bd8@suse.de>
Date: Tue, 13 Jul 2021 15:05:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210709081116.4170288-1-daniel.vetter@ffwll.ch>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="m5T0ZrIitOuBGQqB9XQReu8yYnq20fAWQ"
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
Cc: Daniel Vetter <daniel.vetter@intel.com>, dim-tools@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--m5T0ZrIitOuBGQqB9XQReu8yYnq20fAWQ
Content-Type: multipart/mixed; boundary="oD894NxEXqRGrX4SWfmfGmuz1WzCB3Ap1";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
Cc: dim-tools@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <8fe7ad87-950a-0235-839c-ec2821419bd8@suse.de>
Subject: Re: [PATCH] dim/drm-misc: Add rule to not push patches with issues
References: <20210709081116.4170288-1-daniel.vetter@ffwll.ch>
In-Reply-To: <20210709081116.4170288-1-daniel.vetter@ffwll.ch>

--oD894NxEXqRGrX4SWfmfGmuz1WzCB3Ap1
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



Am 09.07.21 um 10:11 schrieb Daniel Vetter:
> We kinda left this out, and I like the wording from the drm-intel
> side, so add that. Motivated by a discussion with Christian.

I always thought this goes without saying.

>=20
> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

> ---
>   committer-drm-misc.rst | 3 +++
>   1 file changed, 3 insertions(+)
>=20
> diff --git a/committer-drm-misc.rst b/committer-drm-misc.rst
> index 9497a5d26a9d..110ca8b0525e 100644
> --- a/committer-drm-misc.rst
> +++ b/committer-drm-misc.rst
> @@ -21,6 +21,9 @@ Merge Criteria
>  =20
>   Right now the only hard merge criteria are:
>  =20
> +* There must not be open issues or unresolved or conflicting feedback =
from
> +  anyone. Clear them up first. Defer to maintainers as needed.
> +
>   * Patch is properly reviewed or at least Ack, i.e. don't just push yo=
ur own
>     stuff directly. This rule holds even more for bugfix patches - it w=
ould be
>     embarrassing if the bugfix contains a small gotcha that review woul=
d have
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--oD894NxEXqRGrX4SWfmfGmuz1WzCB3Ap1--

--m5T0ZrIitOuBGQqB9XQReu8yYnq20fAWQ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmDtj50FAwAAAAAACgkQlh/E3EQov+Dp
8RAAr3abpsUOz6dIJOnUinB1laqYwX/8pVgoQ6GkcT/rVRo13d1KM5EzKUdqfcion48db2Qv7LeY
VCggsUoy7gaL0kbxCJjZ+tIAXkU8YSgXrUK8asGi6i567w3u0fjia0q5yAZfKEjNO8Au5/8AxsA6
dCTVg4143SD24OIqNe6QUWj82jAZEwA1dQkHAwN3xWUN4DvS35ebhQ3y808yJSm3PIPW6F36cFxe
EtU7uq3RAwFeD3J1Mp/hcDYE1JqAHNVaPeIkH+BQnGCKR4+bgRtP7BXrhe5J/Qr/PBVsu4mLTEzE
CbmsGa0VyyA3wNk3dcndfWqXpIXoBsjM1t2r2PwdlHQxNRiVCb9/meZlNykKzfzTIdfOKoZ0hqC0
GZwBwmJoAup+z/4TlAE/y9z0Dx5xgdbWKR50+3RT2PhlrUlP3AJ2SIJ14iKyBam+eMoYhDL3K4kZ
LULoUyBXCmNEmxpt/P6M2ehhGL/YcM6qE/27/Rj9FD5vq0BgZ8Y8qgfbzLqnn1o1heYheJOjeZPu
tWBb1Jp3XjcBLZPeTzEaC7PsdlmHrFb9+0Yvv2lXsTatR2cmCLYm+nMTOKcziu8PuMmkTzploq3f
x0XuSUe5LqXpOyjjUjRXH3kBFqjyqxzuWW/Khc7bELT+8fJeemRiQ1tO/hPXdSYSvuUOSVjtFduW
r8k=
=a2gi
-----END PGP SIGNATURE-----

--m5T0ZrIitOuBGQqB9XQReu8yYnq20fAWQ--
