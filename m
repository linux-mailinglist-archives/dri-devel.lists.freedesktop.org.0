Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EDDC3CF692
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jul 2021 11:09:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C1B789FFD;
	Tue, 20 Jul 2021 09:09:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14C5F89FFD
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jul 2021 09:09:22 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E02C72203E;
 Tue, 20 Jul 2021 09:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1626772160; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=h8burl5rFSPfo8AX543uxpJDYmoPjSzulxfjliuxEik=;
 b=10vN7291Pb1iRI81ru6f2Dgj0V9RHSO6vC7zFhu/KS7/qn6DgSChVsNt/lOs3hROn5Nd/R
 CnDSWIKdNQvFUwBM7HdOZSvSlistsccdlF0n71HldsM0GstxRk7lQ15gx/hC5gn5cHpvZ+
 h4/iuEhvnzINjG/uKa+wuC2wK0FjmlY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1626772160;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=h8burl5rFSPfo8AX543uxpJDYmoPjSzulxfjliuxEik=;
 b=9o4OPANkAFpavlXGGTIaJ0HKY7BXbOa+u+QUYBsK9XevHyW7Kee4kirEpTSajaBRctxiL0
 U33C4C0l2u2nILAg==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 8583A13A2E;
 Tue, 20 Jul 2021 09:09:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id tfJuHcCS9mCmFwAAGKfGzw
 (envelope-from <tzimmermann@suse.de>); Tue, 20 Jul 2021 09:09:20 +0000
Subject: Re: [PATCH] drm/ast: Return value when do not get edid
To: Ainux Wang <ainux.wang@gmail.com>
References: <20210716095522.27187-1-ainux.wang@gmail.com>
 <227ae846-c8a4-876a-2d4b-363aec33eca9@suse.de>
 <CAPWE4_ytU9qz_FLg3ru90nW+0G=mkGoSgerCnniks+H+2_Ba-A@mail.gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <f805fbdd-46bd-b293-a6b4-d83bc69fd367@suse.de>
Date: Tue, 20 Jul 2021 11:09:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAPWE4_ytU9qz_FLg3ru90nW+0G=mkGoSgerCnniks+H+2_Ba-A@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="kWgHNvfF2vICAiT0vElk6Vk3aB0LnyeJJ"
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
Cc: airlied@linux.ie, teng sterling <sterlingteng@gmail.com>,
 Huacai Chen <chenhuacai@kernel.org>, dri-devel@lists.freedesktop.org,
 airlied@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--kWgHNvfF2vICAiT0vElk6Vk3aB0LnyeJJ
Content-Type: multipart/mixed; boundary="7Rqvt7fa3lTZyaVxoQ8A6k8Vr5p3AOCXk";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Ainux Wang <ainux.wang@gmail.com>
Cc: airlied@linux.ie, teng sterling <sterlingteng@gmail.com>,
 Huacai Chen <chenhuacai@kernel.org>, dri-devel@lists.freedesktop.org,
 airlied@redhat.com
Message-ID: <f805fbdd-46bd-b293-a6b4-d83bc69fd367@suse.de>
Subject: Re: [PATCH] drm/ast: Return value when do not get edid
References: <20210716095522.27187-1-ainux.wang@gmail.com>
 <227ae846-c8a4-876a-2d4b-363aec33eca9@suse.de>
 <CAPWE4_ytU9qz_FLg3ru90nW+0G=mkGoSgerCnniks+H+2_Ba-A@mail.gmail.com>
In-Reply-To: <CAPWE4_ytU9qz_FLg3ru90nW+0G=mkGoSgerCnniks+H+2_Ba-A@mail.gmail.com>

--7Rqvt7fa3lTZyaVxoQ8A6k8Vr5p3AOCXk
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



Am 17.07.21 um 03:14 schrieb Ainux Wang:
> Thomas Zimmermann <tzimmermann@suse.de> =E4=BA=8E2021=E5=B9=B47=E6=9C=88=
16=E6=97=A5=E5=91=A8=E4=BA=94 =E4=B8=8B=E5=8D=888:00=E5=86=99=E9=81=93=EF=
=BC=9A
>>
>> Hi
>>
>> Am 16.07.21 um 11:55 schrieb ainux.wang@gmail.com:
>>> From: "Ainux.Wang" <ainux.wang@gmail.com>
>>>
>>> There is should a status when do not get edid.
>>
>> Well, not really.
>>
>> So, the problem is that VGA is not hotplug-able. It's supposed to be
>> connected when the computer gets switched on. And there's no interface=

>> for sensing the connection state.
>>
>> But in practice, the cable can be attached/detached at any time. Readi=
ng
>> out the EDID is the non-official way for detecting the connection stat=
e.
>> You either get EDID data or garbage, where the latter is interpreted a=
s
>> 'disconnected'.
>>
>> But really old monitors (maybe mid-90s and before) don't provide EDID
>> data. For those, DRM adds standard VGA modes IIRC. And they would like=
ly
>> be detected as 'disconnected'.
>>
>> I'll merge your original patch '(r <=3D 0)' and anyone who's stuck wit=
h
>> such an old monitor can probably specify a compatible EDID on the kern=
el
>> command line.
>>
>> (I'd like to hear other people's opinion about this TBH.)
>>
>> Best regards
>> Thomas
>>
> Hi=EF=BC=8C
> Thank you for your review and reply, and what is the =E2=80=98IIRC=E2=80=
=99, i do not

IIRC stands for 'if I remember correctly'

> find it in the
> kernel document.
>=20
> Best regards
> Ainux
>>>
>>> Signed-off-by: Ainux.Wang <ainux.wang@gmail.com>
>>> ---
>>>    drivers/gpu/drm/ast/ast_mode.c | 4 +++-
>>>    1 file changed, 3 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast=
_mode.c
>>> index e5996ae03c49..05df48b3d223 100644
>>> --- a/drivers/gpu/drm/ast/ast_mode.c
>>> +++ b/drivers/gpu/drm/ast/ast_mode.c
>>> @@ -1231,8 +1231,10 @@ static int ast_get_modes(struct drm_connector =
*connector)
>>>                ret =3D drm_add_edid_modes(connector, edid);
>>>                kfree(edid);
>>>                return ret;
>>> -     } else
>>> +     } else {
>>>                drm_connector_update_edid_property(&ast_connector->bas=
e, NULL);
>>> +             return -ENXIO;
>>> +     }
>>>        return 0;
>>>    }
>>>
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


--7Rqvt7fa3lTZyaVxoQ8A6k8Vr5p3AOCXk--

--kWgHNvfF2vICAiT0vElk6Vk3aB0LnyeJJ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmD2kr8FAwAAAAAACgkQlh/E3EQov+A6
nw//W29DjZdDwMCD8aEixK+EGVeReQP16DFpeyvtSmn9RAop5xzpQr1cvCCySp53W84ihTOOwSAa
BmPk0Q+cfUXgax442T+KaazdKKK0jASA3A/pu9a5YaAcdk2+C8kiBJLID6+LI+79DKzyfDMne3Yk
5RtRaDwWniPHnmYyg6k7/63XPPgpgiTmnxgnZ4GRrjnOzrtUKyNjot4+jtjZnEOJ+EzJn1LHkVMC
os+lLgySTCXCxxIb0cUQ+vykrMv3T2N+Kt1BMKY8yGJrQW6IvW4vP/QS6+BaRYaWg57njiplOlvi
lZBwy2o3KI+xotFOL1J1x9gdRpUVGX1jUNH/csE+4iU9tlVBLy4hTEhoo1sT3k4kZJrXsj/KMMKP
ipSxC1+o/Rcmkk28kA9jFwy1y5gRWEn7E5YCLpSMob3Vwd6omdj1aXcNMJfPXk/DtX5IrmP2hVdI
IZaDKyQniI9awnZ5ag/ek6JGFz94uJ1f0qEKgo0Vs1Akw9DUMg2RqYZEpzFSeYWyTzoeLUM3KlPH
J+KrAixoswmsxUFkZAkr7my6ecrrefTGvAtTOfk7jO7bbE5CUjaTOFpFzEntmNTQbYcZjn8jF7Ik
3JmpEY/jaxHur4JRENcj7Z7etbR8DxR2nmso/HfsMrONs/d380X2d3F3kxOthrm+/X1szsbr6/3l
J8o=
=hMKp
-----END PGP SIGNATURE-----

--kWgHNvfF2vICAiT0vElk6Vk3aB0LnyeJJ--
