Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A611F3CB4A3
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jul 2021 10:50:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A70456E947;
	Fri, 16 Jul 2021 08:50:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B31B86E947
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jul 2021 08:50:10 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 482201FD37;
 Fri, 16 Jul 2021 08:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1626425409; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=07Av3HN6QGQhumlMU9OI17/+qPIxv62ajS0v7Al+WAY=;
 b=hThjncWmBvTnJuE+QYx+ujDMTA5xC/MIR25FB9l4UHT+i5fhSRVv4V7LtbHajaIvI+E/Vp
 3WWspOi30UJp2C1PgkXXtstoLk++2goa2PXrk1WXBPA05tRuk8i3e0pS9FDcr++e+UgpQ3
 PUH+wAF7kKTfcwCkI9Iuigf1uEPPotQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1626425409;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=07Av3HN6QGQhumlMU9OI17/+qPIxv62ajS0v7Al+WAY=;
 b=eseBHaApW/9Eggnel9l5XrntKkOy6/JJEme11PoKKSsGGrk31rCHp8yWXlCV5q7aGobloI
 rQ0ipYxSpgZvk+Ag==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 2080813748;
 Fri, 16 Jul 2021 08:50:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id wHvnBkFI8WBgZwAAGKfGzw
 (envelope-from <tzimmermann@suse.de>); Fri, 16 Jul 2021 08:50:09 +0000
Subject: Re: [PATCH 1/5] drm: Define DRM_FORMAT_MAX_PLANES
To: Maxime Ripard <maxime@cerno.tech>
References: <20210715180133.3675-1-tzimmermann@suse.de>
 <20210715180133.3675-2-tzimmermann@suse.de>
 <20210716073044.ff3avcrd5swruele@gilmour>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <a7c7da93-5728-513a-7f6a-f54f42a7fb50@suse.de>
Date: Fri, 16 Jul 2021 10:50:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210716073044.ff3avcrd5swruele@gilmour>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="tGx9Xl2c5iZOJo6wTkrvMuoS222JX3kjM"
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
Cc: hamohammed.sa@gmail.com, rodrigosiqueiramelo@gmail.com, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, melissa.srw@gmail.com, noralf@tronnes.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--tGx9Xl2c5iZOJo6wTkrvMuoS222JX3kjM
Content-Type: multipart/mixed; boundary="aYIM1akLChnrmr5UlH7QaTVeIhLnxw6Lq";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Maxime Ripard <maxime@cerno.tech>
Cc: hamohammed.sa@gmail.com, rodrigosiqueiramelo@gmail.com, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, melissa.srw@gmail.com, noralf@tronnes.org
Message-ID: <a7c7da93-5728-513a-7f6a-f54f42a7fb50@suse.de>
Subject: Re: [PATCH 1/5] drm: Define DRM_FORMAT_MAX_PLANES
References: <20210715180133.3675-1-tzimmermann@suse.de>
 <20210715180133.3675-2-tzimmermann@suse.de>
 <20210716073044.ff3avcrd5swruele@gilmour>
In-Reply-To: <20210716073044.ff3avcrd5swruele@gilmour>

--aYIM1akLChnrmr5UlH7QaTVeIhLnxw6Lq
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 16.07.21 um 09:30 schrieb Maxime Ripard:
> Hi,
>=20
> On Thu, Jul 15, 2021 at 08:01:29PM +0200, Thomas Zimmermann wrote:
>> DRM uses a magic number of 4 for the maximum number of planes per colo=
r
>> format. Declare this constant via DRM_FORMAT_MAX_PLANES and update the=

>> related code.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> ---
>>   drivers/gpu/drm/drm_gem_framebuffer_helper.c | 14 ++++++++------
>>   include/drm/drm_fourcc.h                     | 13 +++++++++----
>>   include/drm/drm_framebuffer.h                |  8 ++++----
>>   include/drm/drm_gem_atomic_helper.h          |  2 +-
>>   4 files changed, 22 insertions(+), 15 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_gem_framebuffer_helper.c b/drivers/gp=
u/drm/drm_gem_framebuffer_helper.c
>> index e2c68822e05c..975a3df0561e 100644
>> --- a/drivers/gpu/drm/drm_gem_framebuffer_helper.c
>> +++ b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
>> @@ -48,7 +48,7 @@
>>   struct drm_gem_object *drm_gem_fb_get_obj(struct drm_framebuffer *fb=
,
>>   					  unsigned int plane)
>>   {
>> -	if (plane >=3D 4)
>> +	if (plane >=3D ARRAY_SIZE(fb->obj))
>>   		return NULL;
>=20
> This doesn't look related to what's mentionned in the commit log though=
?
>=20
>>   	return fb->obj[plane];
>> @@ -62,7 +62,8 @@ drm_gem_fb_init(struct drm_device *dev,
>>   		 struct drm_gem_object **obj, unsigned int num_planes,
>>   		 const struct drm_framebuffer_funcs *funcs)
>>   {
>> -	int ret, i;
>> +	unsigned int i;
>> +	int ret;
>>  =20
>>   	drm_helper_mode_fill_fb_struct(dev, fb, mode_cmd);
>>  =20
>> @@ -86,9 +87,9 @@ drm_gem_fb_init(struct drm_device *dev,
>>    */
>>   void drm_gem_fb_destroy(struct drm_framebuffer *fb)
>>   {
>> -	int i;
>> +	size_t i;
>>  =20
>> -	for (i =3D 0; i < 4; i++)
>> +	for (i =3D 0; i < ARRAY_SIZE(fb->obj); i++)
>>   		drm_gem_object_put(fb->obj[i]);
>=20
> Ditto
>=20
> Both these changes look fine though, but I guess you should just mentio=
n it

Well, good point. I thought it would be cleaner than using=20
FORMAT_MAX_PLANES here. I'll leave a note in the commit log.

Best regards
Thomas

>=20
> Maxime
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--aYIM1akLChnrmr5UlH7QaTVeIhLnxw6Lq--

--tGx9Xl2c5iZOJo6wTkrvMuoS222JX3kjM
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmDxSEAFAwAAAAAACgkQlh/E3EQov+AY
TA//ZHyu0STqIAIoN86izfQ4biMnqokGegjnaTk/sP66bFloylIhV8jT49csFeHNo7EHGGprDncW
b+0Tjrcz33vM+pyu80yazqV2ZwpaRaofUCiHipfB2lf8zhlJcWWhj60XVefuMHHnhZQ1NSTI0iMh
2IdERNLmNE1jVNfBy6plon8dvWdR5Z5bO5c5W/05+EsOwDX2B4anZ9RB+FEDAYEZiovhDeaku85x
rv7VZTSQLZIkrY2CGrnImw1iwCtuos3r+xhHAl0i+AXn2GyouBPXJB/RY12fvcK8v1Km9ZFyobtS
Q7UtccYKTq9vWzUM4T8Xlg2OJ9DmL+yt3YRnEgu+0kSw7kY2wKvMIc6uS0uug434KiHWGSLL7OVx
ozdA+M+6DMSgvxNnVMMwCc8GWGi4lROt5YsU8Hm/C63hBoQh10CpjKSMxEe42UlkLmzbctZaQdRL
WP+oRW+wEyQaHtMLlPvelwkiCWWwfuhQl7hxUo48TzxzaGn9EmBG4kFC4QQGKW9Guhxok+eoadAS
+rLMLHAH7mqpzdRp2OWi309SL3MI09hf5PEsQe0Mk3uw6LTxFb6ZF++YbVCRN2FO8ypNR+pRuzTo
BfpcTC4NDZ5ZRU4ZSN6QEvt4SWhJHDt0G3b6adr14U6gobKgJtkaig4h0fhurZMQ0URa1B4wySlJ
LG8=
=jpuK
-----END PGP SIGNATURE-----

--tGx9Xl2c5iZOJo6wTkrvMuoS222JX3kjM--
