Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 534B83A5A1A
	for <lists+dri-devel@lfdr.de>; Sun, 13 Jun 2021 20:54:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C700489E33;
	Sun, 13 Jun 2021 18:54:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7452E89E2B;
 Sun, 13 Jun 2021 18:54:06 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B24552195D;
 Sun, 13 Jun 2021 18:54:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1623610444; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GM0Lu0js7Wu59v5Vv8o1kdiC3OZyFAo/4QR4ql0wijg=;
 b=o591rvnAOG9vaxLW+djJnhCTQ8TZI/kfV3WXnxDOQbRsmAZZuC1UAiQTadK8PQlVPFeO7K
 kubDThdL03wap3yFD8TNwQtHqY9ufB6Jkio9slveRYWALt+0hGzuMGRhkJfSE+4HMe3TmZ
 X7v94uXqos2USk/rOSSbJpZ4u1n3yfg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1623610444;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GM0Lu0js7Wu59v5Vv8o1kdiC3OZyFAo/4QR4ql0wijg=;
 b=I0ULQagMS3qSqtnrhEVXLu/3f2iuUBCYY9QFbRoF/Kakh+8SEwRFKhGUXff3SXY+3mDhMM
 dpIOdrgqsK0L5ZAw==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 6B66C118DD;
 Sun, 13 Jun 2021 18:54:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1623610444; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GM0Lu0js7Wu59v5Vv8o1kdiC3OZyFAo/4QR4ql0wijg=;
 b=o591rvnAOG9vaxLW+djJnhCTQ8TZI/kfV3WXnxDOQbRsmAZZuC1UAiQTadK8PQlVPFeO7K
 kubDThdL03wap3yFD8TNwQtHqY9ufB6Jkio9slveRYWALt+0hGzuMGRhkJfSE+4HMe3TmZ
 X7v94uXqos2USk/rOSSbJpZ4u1n3yfg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1623610444;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GM0Lu0js7Wu59v5Vv8o1kdiC3OZyFAo/4QR4ql0wijg=;
 b=I0ULQagMS3qSqtnrhEVXLu/3f2iuUBCYY9QFbRoF/Kakh+8SEwRFKhGUXff3SXY+3mDhMM
 dpIOdrgqsK0L5ZAw==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id ufS5GExUxmBCCwAALh3uQQ
 (envelope-from <tzimmermann@suse.de>); Sun, 13 Jun 2021 18:54:04 +0000
Subject: Re: [PULL] topic/i915-ttm
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Dave Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
References: <eb71ee2d-3413-6ca8-0b7c-a58695f00b77@linux.intel.com>
 <162340805657.68262.6607541005525077753@jlahtine-mobl.ger.corp.intel.com>
 <162340998262.68262.6045527397253780242@jlahtine-mobl.ger.corp.intel.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <dbdd436a-523d-f7d2-db2e-15ea45f435ca@suse.de>
Date: Sun, 13 Jun 2021 20:54:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <162340998262.68262.6045527397253780242@jlahtine-mobl.ger.corp.intel.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="qVcaaBXKZ15UwkSodNf6bsw6XK3gVkDeI"
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
Cc: Thomas Hellstrom <thellstrom@vmware.com>, dim-tools@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--qVcaaBXKZ15UwkSodNf6bsw6XK3gVkDeI
Content-Type: multipart/mixed; boundary="u8OF8LLvAycMyjcpL6g9hSuvhK1UzopT1";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Dave Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Thomas Hellstrom <thellstrom@vmware.com>,
 dim-tools@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Sean Paul <sean@poorly.run>
Message-ID: <dbdd436a-523d-f7d2-db2e-15ea45f435ca@suse.de>
Subject: Re: [PULL] topic/i915-ttm
References: <eb71ee2d-3413-6ca8-0b7c-a58695f00b77@linux.intel.com>
 <162340805657.68262.6607541005525077753@jlahtine-mobl.ger.corp.intel.com>
 <162340998262.68262.6045527397253780242@jlahtine-mobl.ger.corp.intel.com>
In-Reply-To: <162340998262.68262.6045527397253780242@jlahtine-mobl.ger.corp.intel.com>

--u8OF8LLvAycMyjcpL6g9hSuvhK1UzopT1
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Joonas

Am 11.06.21 um 13:13 schrieb Joonas Lahtinen:
> Quoting Joonas Lahtinen (2021-06-11 13:40:56)
>> Quoting Maarten Lankhorst (2021-06-11 12:27:15)
>>> Pull request for drm-misc-next and drm-intel-gt-next.
>>>
>>> topic/i915-ttm-2021-06-11:
>>> drm-misc and drm-intel pull request for topic/i915-ttm:
>>> - Convert i915 lmem handling to ttm.
>>> - Add a patch to temporarily add a driver_private member to vma_node.=

>>> - Use this to allow mixed object mmap handling for i915.
>>> The following changes since commit 1bd8a7dc28c1c410f1ceefae1f2a97c06d=
1a67c2:
>>>
>>>    Merge tag 'exynos-drm-next-for-v5.14' of git://git.kernel.org/pub/=
scm/linux/kernel/git/daeinki/drm-exynos into drm-next (2021-06-11 14:19:1=
2 +1000)
>>
>> This base is not in drm-misc-next or drm-intel-gt-next, so effectively=

>> we would end up pulling 478 extra commits from drm-next as a result. A=
nd
>> also causing all the warnings for those commits. I don't think we shou=
ld
>> do that?
>>
>> The common ancestor would be ccd1950c2f7e38ae45aeefb99a08b39407cd6c63
>> "Merge tag 'drm-intel-gt-next-2021-05-28' of git://anongit.freedesktop=
=2Eorg/drm/drm-intel into drm-next"
>> Should we re-do the topic branch based on that?
>=20
> This problem seems to come from the fact that only the PR from yesterda=
y
> that got merged to drm-next had the dependency patches. The previous
> backmerge of drm-next was requested too early.
>=20
> I've solved this with least hassle by backmerging drm-next again and
> then applying the PR to drm-intel-gt-next.
>=20
> I think drm-misc-next should do the same (exact commit was
> 1bd8a7dc28c1c410f1ceefae1f2a97c06d1a67c2).

I did a backmerge from drm-next recently and drm-misc-next can merge the =

patches in tags/topic/i915-ttm-2021-06-11 without additions.

I assume you to updated drm-intel-gt-next without redoing the PR?

Best regards
Thomas

>=20
> Regards, Joonas
>=20
>> However the DIM docs[1] indeed do say: "For topic branches shared with=
in
>> the gpu/drm subsystem, base it on the latest drm-next branch." I think=

>> the docs don't take into account the current period where drm-next is
>> being actively updated as we speak.
>>
>> Should we update the docs to use 'git merge-base' or something else?
>>
>> Regards, Joonas
>>
>> [1]: https://drm.pages.freedesktop.org/maintainer-tools/dim.html#cross=
-subsystem-topic-branches
>>
>>>
>>> are available in the Git repository at:
>>>
>>>    git://anongit.freedesktop.org/drm/drm-misc tags/topic/i915-ttm-202=
1-06-11
>>>
>>> for you to fetch changes up to cf3e3e86d77970211e0983130e896ae2426010=
03:
>>>
>>>    drm/i915: Use ttm mmap handling for ttm bo's. (2021-06-11 10:53:25=
 +0200)
>>>
>>> ----------------------------------------------------------------
>>> drm-misc and drm-intel pull request for topic/i915-ttm:
>>> - Convert i915 lmem handling to ttm.
>>> - Add a patch to temporarily add a driver_private member to vma_node.=

>>> - Use this to allow mixed object mmap handling for i915.
>>>
>>> ----------------------------------------------------------------
>>> Maarten Lankhorst (2):
>>>        drm/vma: Add a driver_private member to vma_node.
>>>        drm/i915: Use ttm mmap handling for ttm bo's.
>>>
>>> Thomas Hellstr=C3=B6m (2):
>>>        drm/i915/ttm: Introduce a TTM i915 gem object backend
>>>        drm/i915/lmem: Verify checks for lmem residency
>>>
>>>   drivers/gpu/drm/drm_gem.c                          |   9 -
>>>   drivers/gpu/drm/i915/Makefile                      |   1 +
>>>   drivers/gpu/drm/i915/display/intel_display.c       |   2 +-
>>>   drivers/gpu/drm/i915/gem/i915_gem_create.c         |   9 +-
>>>   drivers/gpu/drm/i915/gem/i915_gem_lmem.c           | 126 ++--
>>>   drivers/gpu/drm/i915/gem/i915_gem_lmem.h           |   5 -
>>>   drivers/gpu/drm/i915/gem/i915_gem_mman.c           |  83 ++-
>>>   drivers/gpu/drm/i915/gem/i915_gem_object.c         | 143 +++--
>>>   drivers/gpu/drm/i915/gem/i915_gem_object.h         |  19 +-
>>>   drivers/gpu/drm/i915/gem/i915_gem_object_types.h   |  30 +-
>>>   drivers/gpu/drm/i915/gem/i915_gem_pages.c          |   3 +-
>>>   drivers/gpu/drm/i915/gem/i915_gem_region.c         |   6 +-
>>>   drivers/gpu/drm/i915/gem/i915_gem_ttm.c            | 647 ++++++++++=
+++++++++++
>>>   drivers/gpu/drm/i915/gem/i915_gem_ttm.h            |  48 ++
>>>   drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c |  90 +--
>>>   drivers/gpu/drm/i915/gt/intel_region_lmem.c        |   3 +-
>>>   drivers/gpu/drm/i915/i915_gem.c                    |   5 +-
>>>   drivers/gpu/drm/i915/intel_memory_region.c         |   1 -
>>>   drivers/gpu/drm/i915/intel_memory_region.h         |   1 -
>>>   drivers/gpu/drm/i915/intel_region_ttm.c            |   8 +-
>>>   drivers/gpu/drm/i915/intel_region_ttm.h            |  11 +-
>>>   drivers/gpu/drm/i915/selftests/igt_mmap.c          |  25 +-
>>>   drivers/gpu/drm/i915/selftests/igt_mmap.h          |  12 +-
>>>   include/drm/drm_vma_manager.h                      |   2 +-
>>>   24 files changed, 1039 insertions(+), 250 deletions(-)
>>>   create mode 100644 drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>>>   create mode 100644 drivers/gpu/drm/i915/gem/i915_gem_ttm.h

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--u8OF8LLvAycMyjcpL6g9hSuvhK1UzopT1--

--qVcaaBXKZ15UwkSodNf6bsw6XK3gVkDeI
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmDGVEsFAwAAAAAACgkQlh/E3EQov+Bc
BxAAqsRMAR8653m3UsxhbUZf4AuiiQp8zTCHWoyOjGiHKX2DDINvqyQcHDQhAU6fR92hJCSDZOzm
ASZdmgz0FGYq4rtUWcjQ3shDKiBGAR7BmZOfjRW6YxFohh1yRe58iPDGi4bu4aH30gkfeTUQVMY3
0GU5dPNV08rcaHOFsYt28NtJUp2pkLg5H7ERbdxm68/CUT06uSFzKawI89v8Ue/TbmTsXPRe8NYI
uvVZP35k7vbt1VzJZQujjz0qd4sS3nqWqmDEcjXDin3hvxbje7MpIfjAds4INryom4WvTQnlifgO
JuUWL2/tHUOHtvOECooE6lsTTcwPWXPuQpf+Qwxr2RzeZZuNtn6l9nsHimkBtblQUUbVGzuf6Ioq
Xqxg3vXfONOleiulJT8D6LF9Vqjt/kBRAexElXUI/3vZOlWXYKpAh795GTxY8OUBJs5dJ3sx4aPR
Z4auxSsdCHrQxEUyaXznTY8HU9xmRuO0H2SNzUCpG5uv8dlLnlxo4d1XzK2UvQGDOEG3IXK+ekRz
zQl2fZePXzkyjHBW4oowMBbcWprobubqRiRgh/40yRvjFa8Y/poIy8mAE9hh2hAFpLJVhsMT+aFX
uFCk1W8ShT8JXiR7rH6GW5RTCIWtSqCIrKJMe38ApbFf+EZ3+Rq9A/7GLmgnPLlwFZTsmEa5LBKy
E34=
=hBmO
-----END PGP SIGNATURE-----

--qVcaaBXKZ15UwkSodNf6bsw6XK3gVkDeI--
