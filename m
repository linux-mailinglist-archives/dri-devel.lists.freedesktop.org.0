Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8C7F3C624C
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jul 2021 20:02:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C662089CF8;
	Mon, 12 Jul 2021 18:02:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEF7189CF8
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jul 2021 18:01:59 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 9E78022161;
 Mon, 12 Jul 2021 18:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1626112918; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tvZvYJpgRMhBifMTFr6Vf3lYXwJM9OTMPCJIJLHtnEg=;
 b=bKYUJsjxMJRTATl/9k29oFTIv/X6VknBnEdwO1qRlLAPNzo6w+hziLCLdtuDwvYVJxxRRE
 c2l6Z8w8ClgCyRn+ebAG8ygY8NS0on82GfcS+Zt5WwsXJHiSAbI2bZ184qojZUTwOcm6u8
 JvRsN/+qk8GVz8mFAEoPDz7dQmMx0DQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1626112918;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tvZvYJpgRMhBifMTFr6Vf3lYXwJM9OTMPCJIJLHtnEg=;
 b=Q4A82UBx2MAigcbamswIdmEqCBJ/b/oaiV1qMFeaFEOUGODy4GIRdC+2RZMPkKk/TI0isy
 T6hiemH2ZOJSf/Dw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6500213BB5;
 Mon, 12 Jul 2021 18:01:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id /dDlFpaD7GBQMQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 12 Jul 2021 18:01:58 +0000
To: Sumera Priyadarsini <sylphrenadin@gmail.com>
References: <20210705074633.9425-1-tzimmermann@suse.de>
 <CACAkLur8SVqZt69CrfN+0rE4AstPBQPHbwJMnBM_TDTBFXVqdA@mail.gmail.com>
 <a8aadd02-b80b-cd55-b2fd-9c8c7c86b334@suse.de>
 <CACAkLuq+GO8S8GKVg1_AOeGAuQUVbYgf4-ni7MayOTmCm=ezEA@mail.gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 0/4] vkms: Switch to shadow-buffered plane state
Message-ID: <70f5aca8-800a-a20d-512d-bcbaef510b2e@suse.de>
Date: Mon, 12 Jul 2021 20:01:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CACAkLuq+GO8S8GKVg1_AOeGAuQUVbYgf4-ni7MayOTmCm=ezEA@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="Jk74EENx8qCpPjZhzGSC2wjoLzVW3Z6UD"
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
--Jk74EENx8qCpPjZhzGSC2wjoLzVW3Z6UD
Content-Type: multipart/mixed; boundary="9knjUKwz4HPl3Z5Jcgya04jGaqmGHkE86";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sumera Priyadarsini <sylphrenadin@gmail.com>
Cc: Melissa Wen <melissa.srw@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 dri-devel@lists.freedesktop.org
Message-ID: <70f5aca8-800a-a20d-512d-bcbaef510b2e@suse.de>
Subject: Re: [PATCH 0/4] vkms: Switch to shadow-buffered plane state
References: <20210705074633.9425-1-tzimmermann@suse.de>
 <CACAkLur8SVqZt69CrfN+0rE4AstPBQPHbwJMnBM_TDTBFXVqdA@mail.gmail.com>
 <a8aadd02-b80b-cd55-b2fd-9c8c7c86b334@suse.de>
 <CACAkLuq+GO8S8GKVg1_AOeGAuQUVbYgf4-ni7MayOTmCm=ezEA@mail.gmail.com>
In-Reply-To: <CACAkLuq+GO8S8GKVg1_AOeGAuQUVbYgf4-ni7MayOTmCm=ezEA@mail.gmail.com>

--9knjUKwz4HPl3Z5Jcgya04jGaqmGHkE86
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 12.07.21 um 16:26 schrieb Sumera Priyadarsini:
> On Mon, Jul 12, 2021 at 6:53 PM Thomas Zimmermann <tzimmermann@suse.de>=
 wrote:
>>
>> Hi
>>
>> Am 12.07.21 um 13:56 schrieb Sumera Priyadarsini:
>>> On Mon, Jul 5, 2021 at 1:16 PM Thomas Zimmermann <tzimmermann@suse.de=
> wrote:
>>>>
>>>> Vkms copies each plane's framebuffer into the output buffer; essenti=
ally
>>>> using a shadow buffer. DRM provides struct drm_shadow_plane_state, w=
hich
>>>> handles the details of mapping/unmapping shadow buffers into memory =
for
>>>> active planes.
>>>>
>>>> Convert vkms to the helpers. Makes vkms use shared code and gives mo=
re
>>>> test exposure to shadow-plane helpers.
>>>>
>>>> Thomas Zimmermann (4):
>>>>     drm/gem: Export implementation of shadow-plane helpers
>>>>     drm/vkms: Inherit plane state from struct drm_shadow_plane_state=

>>>>     drm/vkms: Let shadow-plane helpers prepare the plane's FB
>>>>     drm/vkms: Use dma-buf mapping from shadow-plane state for compos=
ing
>>>>
>>>>    drivers/gpu/drm/drm_gem_atomic_helper.c | 55 ++++++++++++++++++++=
++--
>>>>    drivers/gpu/drm/vkms/vkms_composer.c    | 26 ++++++-----
>>>>    drivers/gpu/drm/vkms/vkms_drv.h         |  6 ++-
>>>>    drivers/gpu/drm/vkms/vkms_plane.c       | 57 ++++++--------------=
-----
>>>>    include/drm/drm_gem_atomic_helper.h     |  6 +++
>>>>    5 files changed, 86 insertions(+), 64 deletions(-)
>>>>
>>>>
>>>> base-commit: 3d3b5479895dd6dd133571ded4318adf595708ba
>>>> --
>>>> 2.32.0
>>>>
>>> Hi,
>>>
>>> Thanks for the patches. The switch to shadow-plane helpers also solve=
d
>>> a bug that was causing a kernel
>>> panic during some IGT kms_flip subtests on the vkms virtual hw patch.=

>>
>> Melissa mention something like that as well and I don't really
>> understand. Patch 3 removes an error message from the code, but is the=

>> actual bug also gone?
>=20
> Yes, I think so. Earlier, while testing the vkms virtual hw patch, the
> tests were
> not just failing, but the vmap fail also preceeded a page fault which r=
equired a
> whole restart. Check these logs around line 303:
> https://pastebin.pl/view/03b750be.
>=20

With the help of your log, I can see what's happening. The current vkms=20
code reports an error in vmap, but does nothing about it. [1] So later=20
during the commit, it operates with a bogus value for vaddr.

The shared helper returns the error into the atomic modesetting=20
machinery, [2] which then aborts the commit. It never gets to the point=20
of using an invalid address. So no kernel panic occurs.

> I could be wrong but I think if the same bug was still present, then
> the kernel panic
> would also happen even if the error message was not being returned.

I'm pretty sure the vmap issue is still there. But as the shared code=20
handles it correctly without a notice to the kernel log; and it doesn't=20
crash the kernel any longer.

But the vmap problem is caused by some other factor unrelated to vkms.
Booting the test kernel with drm.debug=3D0x1ff on the kernel command line=
=20
would probably turn up some sort of error message.

Best regards
Thomas

[1]=20
https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/vkms/vkms_=
plane.c#L166
[2]=20
https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/drm_gem_at=
omic_helper.c#L299

>=20
> Cheers,
> Sumera
>=20
>>
>> There's little difference between vkms' original code and the shared
>> helper; except for the order of operations in prepare_fb. The shared
>> helper synchronizes fences before mapping; vkms mapped first.
>>
>> (Maybe the shared helper should warn about failed vmaps as well. But
>> that's for another patch.)
>>
>> Best regards
>> Thomas
>>
>>>
>>> Tested-by: Sumera Priyadarsini <sylphrenadin@gmail.com>
>>>
>>> Cheers,
>>> Sumera
>>>
>>
>> --
>> Thomas Zimmermann
>> Graphics Driver Developer
>> SUSE Software Solutions Germany GmbH
>> Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
>> (HRB 36809, AG N=C3=BCrnberg)
>> Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer
>>

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--9knjUKwz4HPl3Z5Jcgya04jGaqmGHkE86--

--Jk74EENx8qCpPjZhzGSC2wjoLzVW3Z6UD
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmDsg5UFAwAAAAAACgkQlh/E3EQov+Cl
Ig//a4roBm66wrpX4ijIJArBINQJ6fKYrOiHbixBmPzjvFyCGvtJ9FH4l01Ilh8WezYhGbsXnnqy
o/lioAIh0+ywCDgblSsF5OQCVXWwdaDEo36D3S2h+RhDi/BTbT0woEEFTlYtECWDpKcSIPy1yUaB
vF0FW2eV6qZK/G/eomV4HHo4FiR070WkNDtWTRcYTSXX0meleoqp0dgdPNUulcPomSTM8I5720AK
ctM7ZvCe9o7msmDalFD7zQMvf7FAvx5IBF6/zPb1cSxkHqL6Lc7atJ1ldt2f9+tsyj/kh9xGwcQA
+F3UL2fdtaNxNDHKNKJ9kaCGGugKu833NUtIx3TI+dTXxsJwuivQYjff4iKNXZ1qP/ub++IXm7FA
nPuN6fJXEnRKY1n1cLLN6q+s/Rbe+ctGV/QkB04PXzmmHpZqDRmx6qv2N/6j/ytke0wWE9qjBrBF
TPy4F3P9lvKABUgKS7IOvuj2jNFI5NQXKZ2+nLZQfFkP+wRoLrx4LD69upGZ4hVDShzg37LSLl7U
JsUYmOvfBlwTXgoqLy2rIcTNbZ1j6/sO78KP/9WlxgGeWDdZLnPuy3+EenM0aqDquS5ZCxXo1B0E
rt4mknTWJAwQdEQ8pezdl7usjIteV8zE/ZgmznzSW8XZFF8NMjqXOGLZWAILx0jyh06jnEP9e5Iy
/Tg=
=pIex
-----END PGP SIGNATURE-----

--Jk74EENx8qCpPjZhzGSC2wjoLzVW3Z6UD--
