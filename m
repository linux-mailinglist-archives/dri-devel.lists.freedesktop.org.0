Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 161533920C1
	for <lists+dri-devel@lfdr.de>; Wed, 26 May 2021 21:21:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A14F6E083;
	Wed, 26 May 2021 19:21:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E5156E083
 for <dri-devel@lists.freedesktop.org>; Wed, 26 May 2021 19:21:13 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D7E4E1FD2E;
 Wed, 26 May 2021 19:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1622056871; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=K+JRyDtb43BK8hz5sxtefi1nsKcbhydV8fxocpZ+PH4=;
 b=JEhs7MtgZiPRF+vg409OxyR5gfxPdEETSplBVwvwEF9qnrLONQpFyTFFIuN6RUTeF7UP1O
 I73KAFLCE+D4xn1OTGF1ysWrhIt6bov4hStzwmU+RlNexqREFctO1+Qvk0ZL/lRBI/XEQO
 brnEknd5WYLR87BAnC4W6q1PZQfmRZ0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1622056871;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=K+JRyDtb43BK8hz5sxtefi1nsKcbhydV8fxocpZ+PH4=;
 b=/VM3ExnbBXtJ+AvE5bqz4CL+/5vlTfQ1jhH634EIZnJ3zfIHMTyWAmvbr7nzvhzd7D9Eud
 0uITj5Ohy3rZm/DQ==
Received: from director2.suse.de (director2.suse-dmz.suse.de [192.168.254.72])
 by imap.suse.de (Postfix) with ESMTPSA id 95EC211A98;
 Wed, 26 May 2021 19:21:11 +0000 (UTC)
Subject: Re: [PATCH 0/4] drm: Finally retire struct drm_format_name_buf
To: airlied@linux.ie, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, alexander.deucher@amd.com, christian.koenig@amd.com,
 sakari.ailus@linux.intel.com
References: <20210516121315.30321-1-tzimmermann@suse.de>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <057a9a16-3ed7-b159-22d7-33f1dc523d14@suse.de>
Date: Wed, 26 May 2021 21:21:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210516121315.30321-1-tzimmermann@suse.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="MI1sSn2GKxbjEmxRDTmzleGqKZcAUJUKO"
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--MI1sSn2GKxbjEmxRDTmzleGqKZcAUJUKO
Content-Type: multipart/mixed; boundary="dX6T4z4iU9tsVAV89Djob5TO4xnerYbx6";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@linux.ie, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, alexander.deucher@amd.com, christian.koenig@amd.com,
 sakari.ailus@linux.intel.com
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Message-ID: <057a9a16-3ed7-b159-22d7-33f1dc523d14@suse.de>
Subject: Re: [PATCH 0/4] drm: Finally retire struct drm_format_name_buf
References: <20210516121315.30321-1-tzimmermann@suse.de>
In-Reply-To: <20210516121315.30321-1-tzimmermann@suse.de>

--dX6T4z4iU9tsVAV89Djob5TO4xnerYbx6
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

ping for further a-bs / r-bs

Am 16.05.21 um 14:13 schrieb Thomas Zimmermann:
> This is a cleanup patchset to remove drm_format_name_buf et al. There
> are two instances in drivers that need to be replaced with the %4cc
> printk format modifier. Patch 3 was left over back from an earlier
> patchset. [1] Patch 4 removes struct drm_format_name_buf.
>=20
> I built-tested with drm-tip. The patchsetcan be mered through drm-misc.=

>=20
> [1] https://lore.kernel.org/dri-devel/20210216155723.17109-1-sakari.ail=
us@linux.intel.com/
>=20
> Sakari Ailus (1):
>    drm: Remove drm_get_format_name()
>=20
> Thomas Zimmermann (3):
>    drm/amdgpu: Use %p4cc to print 4CC format
>    drm/simpledrm: Use %p4cc to print 4CC format
>    drm/fourcc: Remove struct drm_format_buf_name
>=20
>   drivers/gpu/drm/amd/amdgpu/amdgpu_display.c |  7 ++----
>   drivers/gpu/drm/drm_fourcc.c                | 25 --------------------=
-
>   drivers/gpu/drm/tiny/simpledrm.c            |  6 ++---
>   include/drm/drm_fourcc.h                    |  9 --------
>   4 files changed, 4 insertions(+), 43 deletions(-)
>=20
> --
> 2.31.1
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--dX6T4z4iU9tsVAV89Djob5TO4xnerYbx6--

--MI1sSn2GKxbjEmxRDTmzleGqKZcAUJUKO
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmCun6cFAwAAAAAACgkQlh/E3EQov+C/
3w/+L8qbXyDeMUaqfn8SYyXoj3Px0NPnKYvufflVQXnNXTq3NkP4s3BeWCDYsKeat5uLCgJx9Uj7
wtBdtvI7Nh+bCSZR55KHL02hu0iSiaNM+Tnj34sJ9pSo+gWiDx8YgDCYtOFRjw6xmElVsuPieZs8
ciQXr5cHc0kCFHdArQD0ECbt8xqmrlXC8SqlE3c5vWhNFnIKv19LLG/Ns2r2HN3IxYXH1qRNT8lH
ErFmbuuV0Udxir6TMgBeD8obXs/rF1XAfVWNPVPVPnRWweyBW13xhRq2sSsenXC68e1jqTCxCu9n
/WhrxXWLYIAB1Ip7jjKrA8c0sUr8ycYKm3fLkppa5uXqaZxOR2SsiVMCYjNTFToEBsnTD4TolBzp
CmQvC1bTymI0GgtJadhE6hL50gIIOxMy1XWMGTHqIT610pBmDFdoN0+JABkvzCf+mVvOaa3H+YJb
7ZGnSlMdpWvLelckSx7bXH1xRvrAYbHanKR+yzMHpKKxvnHLulf1SocfJMOpfttbGDMqFS8fN791
vDH6rgEyRI78YDrplC4S6jDT+qdwtES+bNHFhrTQRtgefxi3uAic10cwpMZ2nrL9vt+Ck0B0WemS
sO/KObixvB+odf7XC865fIYTIQmWHRkv4WQBakFSp6aCGKByHpVQzSjPfKjK4hXWy0TTS73loipc
SpI=
=NRYE
-----END PGP SIGNATURE-----

--MI1sSn2GKxbjEmxRDTmzleGqKZcAUJUKO--
