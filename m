Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4161538DC88
	for <lists+dri-devel@lfdr.de>; Sun, 23 May 2021 21:05:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FDA66E0E4;
	Sun, 23 May 2021 19:05:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABBD06E0E4
 for <dri-devel@lists.freedesktop.org>; Sun, 23 May 2021 19:05:32 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1621796731; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TfDEjh8Edc8n6G25yB0/E5uyLkJQwAyMS7nv835M3R8=;
 b=d7ct/PH63zW4M6GXjtRrg1w5hE8JAdO4NeG5D8Q2U6UoRkWkgeD5DZwBAeS/jDqffD+8/Z
 s44/AIKJCtzAGnd4zpXnUpGGLDL314BeRlndwEtAduk6V0woNB5qTDX+Pm4CEh+ImeW5LP
 7v5IFSuXkLvu2YFcJqPl5lUEeOMwjwc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1621796731;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TfDEjh8Edc8n6G25yB0/E5uyLkJQwAyMS7nv835M3R8=;
 b=fg3R0Gth6AmN0baZQ+4denqZZ8mt5zhCn7k3cZWn53s3E7AMK82n+ZEscx+18KPtLZbS/W
 OS+8vJ1dx9+Z7qAg==
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 14FF8AC4B;
 Sun, 23 May 2021 19:05:31 +0000 (UTC)
Subject: Re: [PATCH v5 0/3] Add option to mmap GEM buffers cached
To: Paul Cercueil <paul@crapouillou.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20210523170415.90410-1-paul@crapouillou.net>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <452b2228-2415-69d7-9212-51707daf8616@suse.de>
Date: Sun, 23 May 2021 21:05:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210523170415.90410-1-paul@crapouillou.net>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="tO3yJqMMNdhBkipXAOrrBGhEvUSorR1WW"
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
Cc: Christoph Hellwig <hch@infradead.org>, list@opendingux.net,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mips@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--tO3yJqMMNdhBkipXAOrrBGhEvUSorR1WW
Content-Type: multipart/mixed; boundary="vqRHPQ5m214gQNy0qa5LGHU5IM9KUWj6w";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Paul Cercueil <paul@crapouillou.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mips@vger.kernel.org, Christoph Hellwig <hch@infradead.org>,
 list@opendingux.net
Message-ID: <452b2228-2415-69d7-9212-51707daf8616@suse.de>
Subject: Re: [PATCH v5 0/3] Add option to mmap GEM buffers cached
References: <20210523170415.90410-1-paul@crapouillou.net>
In-Reply-To: <20210523170415.90410-1-paul@crapouillou.net>

--vqRHPQ5m214gQNy0qa5LGHU5IM9KUWj6w
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 23.05.21 um 19:04 schrieb Paul Cercueil:
> V5 of my patchset which adds the option for having GEM buffers backed b=
y
> non-coherent memory.
>=20
> Changes from V4:
>=20
> - [2/3]:
>      - Rename to drm_fb_cma_sync_non_coherent
>      - Invert loops for better cache locality
>      - Only sync BOs that have the non-coherent flag
>      - Properly sort includes
>      - Move to drm_fb_cma_helper.c to avoid circular dependency

I'm pretty sure it's still not the right place. That would be something=20
like drm_gem_cma_atomic_helper.c, but creating a new file just for a=20
single function doesn't make sense.

>=20
> - [3/3]:
>      - Fix drm_atomic_get_new_plane_state() used to retrieve the old
>        state
>      - Use custom drm_gem_fb_create()

It's often a better choice to express such differences via different=20
data structures (i.e., different instances of drm_mode_config_funcs) but =

it's not a big deal either.

Please go ahaed and merge if no one objects. All patches:

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

Best regards
Thomas

>      - Only check damage clips and sync DMA buffers if non-coherent
>        buffers are used
>=20
> Cheers,
> -Paul
>=20
> Paul Cercueil (3):
>    drm: Add support for GEM buffers backed by non-coherent memory
>    drm: Add and export function drm_fb_cma_sync_non_coherent
>    drm/ingenic: Add option to alloc cached GEM buffers
>=20
>   drivers/gpu/drm/drm_fb_cma_helper.c       | 46 ++++++++++++++++++
>   drivers/gpu/drm/drm_gem_cma_helper.c      | 38 +++++++++++----
>   drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 59 +++++++++++++++++++++-=
-
>   drivers/gpu/drm/ingenic/ingenic-drm.h     |  1 +
>   drivers/gpu/drm/ingenic/ingenic-ipu.c     | 21 ++++++--
>   include/drm/drm_fb_cma_helper.h           |  4 ++
>   include/drm/drm_gem_cma_helper.h          |  3 ++
>   7 files changed, 156 insertions(+), 16 deletions(-)
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--vqRHPQ5m214gQNy0qa5LGHU5IM9KUWj6w--

--tO3yJqMMNdhBkipXAOrrBGhEvUSorR1WW
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmCqp3oFAwAAAAAACgkQlh/E3EQov+Ck
ghAAiNKiPgu9BgY9V6Xd0rmmP3VM2BO5tWKZREZjhikSApcXWRnXdKVxHb8QQZ9kbpmPSSvHzwG8
4NMCBBHQC79hYjSm6hvtkGCQ51Tl45WIUn6ohHQA3/FqgG9BlvLo8Z8/nezcis07SLl3k7Fb8Jmu
lKGb9yYeIMW7LlRZLyaTi9Q9FWLx6ccp5ZP8HU/RFYzkT3L1riUOyktzRWNdoj0z1ryyVpJEGkiX
LvhtjK4zkak/45nSEYxlZ0kuBOxmRCGY2Fv3mPQiCslW4HEEqp0bbdGN8NzN0VPRNZtoMZXQoX1u
x2cGWo7LmdJsXJ3H4DMv615XZJEeha2aC06oXJedKsmBh69DT6t867hJexbftT28/HwvA0Yf7kQl
DmubAtoHPWOmhJ0kaih/M2659vqcGkRDkLlvkXivg3Q5BU66AV9Nt04JcsMoqCKe1L4IsgP8BDRx
A5qFhqFkcGAsDwwJ5o6aTItYTtDZ+xpYwxXIV41bGF2CteIFQqCWSscFL7pv5AhuakG4WHBNqWw5
fWRDvGP9HbbpD4hUu3LLFwLb0kLsPiawf65digva9F22SxQqqXiRT+wK9qz4vdxwOwZDT5NaPk8e
B/uji0tn30ok4JI8b46v5wS/04hkcxJIVIZgOglonQCtThC8dm18YMu7jXERuAn4ie7fj2AYgmrV
T2s=
=IEz2
-----END PGP SIGNATURE-----

--tO3yJqMMNdhBkipXAOrrBGhEvUSorR1WW--
