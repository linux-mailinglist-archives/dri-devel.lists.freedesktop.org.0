Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B7C53C5D2B
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jul 2021 15:23:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAD2989B12;
	Mon, 12 Jul 2021 13:23:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5074789B12
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jul 2021 13:23:15 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id DAD691FF9C;
 Mon, 12 Jul 2021 13:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1626096193; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QegSuDdlpTpq94YLc81H7M4md+nNxfBSOY2l31I+oT0=;
 b=EVPmWk2V2Omi3Z38xLqrZbK/N0KJWOYOpj9r90xv3pJSq7wKLcMCEaU83jUko6XpczMdTi
 A8PwO8gb8EZ+U0p2OSJOE7kCt2j89q5iPbVflFyr/Z5bNul6Ozd3tvS+axuUDW/uUaE3zi
 OB1G/D6YUG53w1my5AFvgdQJysI8D0s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1626096193;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QegSuDdlpTpq94YLc81H7M4md+nNxfBSOY2l31I+oT0=;
 b=HEkA8I4zLIqPBavqJDtzwkoZtsqL1O1mbnexN0hn/7bGKQBUDyidBvKLP0oBhPIR/ASmcV
 enO3OfYcnPUGDYDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A2E2013BA8;
 Mon, 12 Jul 2021 13:23:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id MfQGJkFC7GB/ZwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 12 Jul 2021 13:23:13 +0000
Subject: Re: [PATCH 0/4] vkms: Switch to shadow-buffered plane state
To: Sumera Priyadarsini <sylphrenadin@gmail.com>
References: <20210705074633.9425-1-tzimmermann@suse.de>
 <CACAkLur8SVqZt69CrfN+0rE4AstPBQPHbwJMnBM_TDTBFXVqdA@mail.gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <a8aadd02-b80b-cd55-b2fd-9c8c7c86b334@suse.de>
Date: Mon, 12 Jul 2021 15:23:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CACAkLur8SVqZt69CrfN+0rE4AstPBQPHbwJMnBM_TDTBFXVqdA@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="5ivPDJGnuOggGqGmKNOfFoteinYqbcAJG"
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
 David Airlie <airlied@linux.ie>, Melissa Wen <melissa.srw@gmail.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--5ivPDJGnuOggGqGmKNOfFoteinYqbcAJG
Content-Type: multipart/mixed; boundary="xzshKkVv4E8VDOzZocwwoM1QytFK7rBrR";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sumera Priyadarsini <sylphrenadin@gmail.com>
Cc: Melissa Wen <melissa.srw@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 dri-devel@lists.freedesktop.org
Message-ID: <a8aadd02-b80b-cd55-b2fd-9c8c7c86b334@suse.de>
Subject: Re: [PATCH 0/4] vkms: Switch to shadow-buffered plane state
References: <20210705074633.9425-1-tzimmermann@suse.de>
 <CACAkLur8SVqZt69CrfN+0rE4AstPBQPHbwJMnBM_TDTBFXVqdA@mail.gmail.com>
In-Reply-To: <CACAkLur8SVqZt69CrfN+0rE4AstPBQPHbwJMnBM_TDTBFXVqdA@mail.gmail.com>

--xzshKkVv4E8VDOzZocwwoM1QytFK7rBrR
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 12.07.21 um 13:56 schrieb Sumera Priyadarsini:
> On Mon, Jul 5, 2021 at 1:16 PM Thomas Zimmermann <tzimmermann@suse.de> =
wrote:
>>
>> Vkms copies each plane's framebuffer into the output buffer; essential=
ly
>> using a shadow buffer. DRM provides struct drm_shadow_plane_state, whi=
ch
>> handles the details of mapping/unmapping shadow buffers into memory fo=
r
>> active planes.
>>
>> Convert vkms to the helpers. Makes vkms use shared code and gives more=

>> test exposure to shadow-plane helpers.
>>
>> Thomas Zimmermann (4):
>>    drm/gem: Export implementation of shadow-plane helpers
>>    drm/vkms: Inherit plane state from struct drm_shadow_plane_state
>>    drm/vkms: Let shadow-plane helpers prepare the plane's FB
>>    drm/vkms: Use dma-buf mapping from shadow-plane state for composing=

>>
>>   drivers/gpu/drm/drm_gem_atomic_helper.c | 55 ++++++++++++++++++++++-=
-
>>   drivers/gpu/drm/vkms/vkms_composer.c    | 26 ++++++-----
>>   drivers/gpu/drm/vkms/vkms_drv.h         |  6 ++-
>>   drivers/gpu/drm/vkms/vkms_plane.c       | 57 ++++++-----------------=
--
>>   include/drm/drm_gem_atomic_helper.h     |  6 +++
>>   5 files changed, 86 insertions(+), 64 deletions(-)
>>
>>
>> base-commit: 3d3b5479895dd6dd133571ded4318adf595708ba
>> --
>> 2.32.0
>>
> Hi,
>=20
> Thanks for the patches. The switch to shadow-plane helpers also solved
> a bug that was causing a kernel
> panic during some IGT kms_flip subtests on the vkms virtual hw patch.

Melissa mention something like that as well and I don't really=20
understand. Patch 3 removes an error message from the code, but is the=20
actual bug also gone?

There's little difference between vkms' original code and the shared=20
helper; except for the order of operations in prepare_fb. The shared=20
helper synchronizes fences before mapping; vkms mapped first.

(Maybe the shared helper should warn about failed vmaps as well. But=20
that's for another patch.)

Best regards
Thomas

>=20
> Tested-by: Sumera Priyadarsini <sylphrenadin@gmail.com>
>=20
> Cheers,
> Sumera
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--xzshKkVv4E8VDOzZocwwoM1QytFK7rBrR--

--5ivPDJGnuOggGqGmKNOfFoteinYqbcAJG
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmDsQkEFAwAAAAAACgkQlh/E3EQov+AV
9hAAi6SNCQIyl84kC5fm07MNsl5/9/6he7nHE5lrZotBhHTelWPTwAeDD6km3QBN6jaJUcuvqZas
2E4YJMbvGVKcuscjDKEwnrrDRwEeQxjj/wWM1X+YC4CrabwjDeLHU/xVTta2BeZ81/Pkhe4uUpCn
EL5E+mU4dwg61d/uXcrkaAuXjE4MC/8xfR68SOD7n2guh//ZFNgogao98vyp4M6nFRm20at2Sobe
TFGds+/zLyZ9uTn2KsFI+mUuA/EGdr5fYz8z/hU/KNw0eJGivrcJ/2LIB+ZsLZo4I9zbQJwQxBGq
GP6yUSD4add4coXxaxoy1dGaAHggyzTXPHPJHsJvEgHc2QPz4h4kzOXj0w4yLhapJmBM7dFZItcR
F4N+WjN6kltzCDrdTrBkSJ0GQ5BXOPkh33YRFnQlcCiEzfShk9zeCjFOnKwOYybgdw/QCdsDH+hz
iJ0pFBylDaw1WZOoY7D3MCk7N+0az/eJ+DPbWHsas31JK7Vu9IhWwzUmPWCg4Qt8AyTlNE6L4JRV
aWzuKKC2A8ASBLZitpjmFvu51qKkNcbYslb2P3uRaNVRt7GrbthEdgEawT7a7FF4QJlmD7//F2DD
HLKASqTVVFGYn/r8QRKE+wpqHJqUTG14t49n8dgS3UWjJ+AEwEN/jgtIu8PhyRRr14HHQ7joAxhH
xRQ=
=W2N5
-----END PGP SIGNATURE-----

--5ivPDJGnuOggGqGmKNOfFoteinYqbcAJG--
