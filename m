Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCA463CA07A
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jul 2021 16:18:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C47236E86A;
	Thu, 15 Jul 2021 14:18:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6CA26E869;
 Thu, 15 Jul 2021 14:18:24 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4AD1022A8B;
 Thu, 15 Jul 2021 14:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1626358703; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TQXfSsIkrTmVPDSUwdFYqSttG1hX5cRxn8pvdf1rXfQ=;
 b=J62+G4rz5G5v+OuMUVzSDAZILdguFPA70x68a7Q9I1nilVzCxjjDaoQIt0NmBvDRM9RIC6
 d5g33KBlCCRg8AjvcL79H/L2riw8sMV4c5+cBxqDWASzN8lxOoxzFDmdIdwQrgfLJ/8lTT
 nE0HcAA2Wx3wJhpGMKnh6/cETzWoNc4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1626358703;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TQXfSsIkrTmVPDSUwdFYqSttG1hX5cRxn8pvdf1rXfQ=;
 b=1OAEPbalcS+i4hoP/v5+iM6TtzFp5Bn52KnLWIpgHGIfwwH29zTvB4OYO1zWc7NiGtzkE0
 SIBOrPwdS4X1waDg==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 2777113D93;
 Thu, 15 Jul 2021 14:18:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id lfGpCK9D8GDmZAAAGKfGzw
 (envelope-from <tzimmermann@suse.de>); Thu, 15 Jul 2021 14:18:23 +0000
Subject: Re: [PATCH] drm/fb-helper: Try to protect cleanup against delayed
 setup
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20210713135922.1384264-1-daniel.vetter@ffwll.ch>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <200e709c-0a06-7ffb-bc34-4fa1088b78c3@suse.de>
Date: Thu, 15 Jul 2021 16:18:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210713135922.1384264-1-daniel.vetter@ffwll.ch>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="NLjOjlVxtlZwXHMgrCimjuQ33YvXW4Jru"
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--NLjOjlVxtlZwXHMgrCimjuQ33YvXW4Jru
Content-Type: multipart/mixed; boundary="SK5e8ch9lzjOzQBG3pvfaa7bvqhhJQH1B";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
Cc: David Airlie <airlied@linux.ie>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Daniel Vetter <daniel.vetter@intel.com>
Message-ID: <200e709c-0a06-7ffb-bc34-4fa1088b78c3@suse.de>
Subject: Re: [PATCH] drm/fb-helper: Try to protect cleanup against delayed
 setup
References: <20210713135922.1384264-1-daniel.vetter@ffwll.ch>
In-Reply-To: <20210713135922.1384264-1-daniel.vetter@ffwll.ch>

--SK5e8ch9lzjOzQBG3pvfaa7bvqhhJQH1B
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



Am 13.07.21 um 15:59 schrieb Daniel Vetter:
> Some vague evidences suggests this can go wrong. Try to prevent it by
> holding the right mutex and clearing ->deferred_setup to make sure we
> later on don't accidentally try to re-register the fbdev when the
> driver thought it had it all cleaned up already.
>=20
> v2: I realized that this is fundamentally butchered, and CI complained
> about lockdep splats. So limit the critical section again and just add
> a few notes what the proper fix is.
>=20
> References: https://intel-gfx-ci.01.org/tree/linux-next/next-20201215/f=
i-byt-j1900/igt@i915_pm_rpm@module-reload.html
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> Cc: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

> ---
>   drivers/gpu/drm/drm_fb_helper.c | 10 ++++++++++
>   1 file changed, 10 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_h=
elper.c
> index 9d82fda274eb..8f11e5abb222 100644
> --- a/drivers/gpu/drm/drm_fb_helper.c
> +++ b/drivers/gpu/drm/drm_fb_helper.c
> @@ -598,6 +598,9 @@ EXPORT_SYMBOL(drm_fb_helper_alloc_fbi);
>    * A wrapper around unregister_framebuffer, to release the fb_info
>    * framebuffer device. This must be called before releasing all resou=
rces for
>    * @fb_helper by calling drm_fb_helper_fini().
> + *
> + * Note that this is fundamentally racy on hotunload because it doen't=
 handle
> + * open fbdev file descriptors at all. Use drm_fbdev_generic_setup() i=
nstead.
>    */
>   void drm_fb_helper_unregister_fbi(struct drm_fb_helper *fb_helper)
>   {
> @@ -611,6 +614,9 @@ EXPORT_SYMBOL(drm_fb_helper_unregister_fbi);
>    * @fb_helper: driver-allocated fbdev helper, can be NULL
>    *
>    * This cleans up all remaining resources associated with @fb_helper.=

> + *
> + * Note that this is fundamentally racy on hotunload because it doen't=
 handle
> + * open fbdev file descriptors at all. Use drm_fbdev_generic_setup() i=
nstead.
>    */
>   void drm_fb_helper_fini(struct drm_fb_helper *fb_helper)
>   {
> @@ -2382,6 +2388,10 @@ static void drm_fbdev_client_unregister(struct d=
rm_client_dev *client)
>   {
>   	struct drm_fb_helper *fb_helper =3D drm_fb_helper_from_client(client=
);
>  =20
> +	mutex_lock(&fb_helper->lock);
> +	fb_helper->deferred_setup =3D false;
> +	mutex_unlock(&fb_helper->lock);
> +
>   	if (fb_helper->fbdev)
>   		/* drm_fbdev_fb_destroy() takes care of cleanup */
>   		drm_fb_helper_unregister_fbi(fb_helper);
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--SK5e8ch9lzjOzQBG3pvfaa7bvqhhJQH1B--

--NLjOjlVxtlZwXHMgrCimjuQ33YvXW4Jru
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmDwQ64FAwAAAAAACgkQlh/E3EQov+Ai
6xAArheuEhv60V3YaqNkOP9+cWIZ+qFe1ipaKfB5tvwZb1EdnrQi/csgIC29OL1mWWZpq/wz0Ulv
MBJffP9cZOVC1vIK6dLGZkGIYllPkdSnsm/37bne5fTmq9IO3Cw3fI6m4rC25heYBBYwl+sTJMNU
RkD80BSWLsyDnS23QA2WQrq+IufEJG5Bj4AfDU6qqLkFEx37onfzxQuS8ROO0CXes536eIe4gfmc
tg5MDcr7atJTule2DPdqa1mxHUb1dsOFvwPv4FDzYb75FTskO3ZqZdbVgM3iZYl1WEazwhwvo6zv
86PPhj2bcfsdSNX3Krc6C7XAmn1mn7XK/3aEJ6zXClyoi+UTpLJVOqUCfUGlibcDiA6+mBo6eOFX
wrsOiO35yjIqkC1j5s+7jE1T5vBb12l1qtHWBHdb8f7FXN0gjrTrPgd2DHtKTd3zWPCd0jDta/B+
1gntbzs99GBleYwH7X1VOgeeJWq/vduW7YRlKvqgGsc4lpqnmOqrnqScaMx06G2hhwnceEcC+SGF
aE9H+c86ZVghfd1f7sQ+xTaI1SEcs9VE4QQ8fYEhyevDcV5XCXpdZUQRmkTL7BWz+M/RDnH4xfxg
Qy4PkZSQ7jh9pQuf9GzKUhRJxCKroAXLUEshVl77tlRfwM2QHnPBSX5oX8RfWSJTshfb5g0n0pMi
+TU=
=4miC
-----END PGP SIGNATURE-----

--NLjOjlVxtlZwXHMgrCimjuQ33YvXW4Jru--
