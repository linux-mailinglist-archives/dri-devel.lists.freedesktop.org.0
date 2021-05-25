Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B350239005A
	for <lists+dri-devel@lfdr.de>; Tue, 25 May 2021 13:53:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C76A89364;
	Tue, 25 May 2021 11:53:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACD3189364;
 Tue, 25 May 2021 11:53:31 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1621943610; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0z5nxqVTKyOw1uO1RT1x+0CkKryqp8rTdMNuI8V8fis=;
 b=2XnDjqTvZvJdBXuNuAGIS6hKQoQarF4LoYZm9nx1iX2IeFSddrxNibSYHyKDdz/Nb4Maa4
 dIuzAJ0GfBM+eYIhTMKHQJsqKIBuUiQvBKffSMtunNSOcPlVPCIDPQ4fV2Z+VcOo4xtSSr
 b51942qh+q2BdB1tVHJ+e6As687fGns=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1621943610;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0z5nxqVTKyOw1uO1RT1x+0CkKryqp8rTdMNuI8V8fis=;
 b=Y/qofScj9paG0FPHh25yKLkDg3lbt3ps8+yBh2V90OrXsdOqwnD7zg8W5EjcMBXL6JjEl7
 AxibTBYzTJFINJDg==
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 148C3AF03;
 Tue, 25 May 2021 11:53:30 +0000 (UTC)
Subject: Re: i915 gvt broke drm-tip; Fix ASAP
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>
References: <58f039e1-225f-4542-8355-1ae91a225206@suse.de>
 <20210524030901.GC27293@zhen-hp.sh.intel.com> <87k0nocv2f.fsf@intel.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <a13379b8-2827-4eb9-1395-18ed1b9756e8@suse.de>
Date: Tue, 25 May 2021 13:53:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <87k0nocv2f.fsf@intel.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="qZm1DnloFXpLxDkOywZQpV2tnvBt2Y0eD"
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
Cc: intel-gfx@lists.freedesktop.org,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@redhat.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 zhi.a.wang@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--qZm1DnloFXpLxDkOywZQpV2tnvBt2Y0eD
Content-Type: multipart/mixed; boundary="3VwOj3tN0z6zzgWm65bDSH6UnIWOiG156";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@redhat.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 zhi.a.wang@intel.com
Message-ID: <a13379b8-2827-4eb9-1395-18ed1b9756e8@suse.de>
Subject: Re: i915 gvt broke drm-tip; Fix ASAP
References: <58f039e1-225f-4542-8355-1ae91a225206@suse.de>
 <20210524030901.GC27293@zhen-hp.sh.intel.com> <87k0nocv2f.fsf@intel.com>
In-Reply-To: <87k0nocv2f.fsf@intel.com>

--3VwOj3tN0z6zzgWm65bDSH6UnIWOiG156
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 24.05.21 um 11:58 schrieb Jani Nikula:
> On Mon, 24 May 2021, Zhenyu Wang <zhenyuw@linux.intel.com> wrote:
>> On 2021.05.22 21:19:38 +0200, Thomas Zimmermann wrote:
>>> Hi,
>>>
>>> after creating drm-tip today as part of [1], building drm-tip is now =
broken
>>> with the error message shown below.
>>>
>>> Some register constants appear to be missing from the GVT code. Pleas=
e fix
>>> ASAP.
>>>
>>
>> Thanks, Thomas. Looks DMC rename missed gvt part. We need to ask CI to=20
have
>> at least build test with gvt.
>=20
> Indeed. This is fixed now with 273895109a04 ("drm/i915/gvt: Add missing=

> macro name changes").

Ok, it builds again. Thanks to both of you.

Best regards
Thomas

>=20
> BR,
> Jani.
>=20
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--3VwOj3tN0z6zzgWm65bDSH6UnIWOiG156--

--qZm1DnloFXpLxDkOywZQpV2tnvBt2Y0eD
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmCs5TkFAwAAAAAACgkQlh/E3EQov+D3
/w/9G5et1YwRspSJiSqKI6zm3aEKuSsv/ZN62nW530vWWxREbv70p5oNWB8A+EkUIiVrZWoYmEnG
CxaRy2qBad7AzM+TcEs8aO+QENt8szFWSvrKqJTUO/LwCj7WjcT/fHo0xqnrBUp5fQeLULzYI42L
ussUUif7oAmes9mfF6U5hfCRXuhkwkhBkkeUTGVu6g161KEu9iRCsSTSH+/17ssiSN8ZKogDKyKv
DXBt+q3jqyul+QBG3/OMByKVOQYUgoX7Y7mgpf7d4zQ/GuKlhcFT/RmTTx5bYDjofCNHRjMOrtAa
YTEiV67p2RRSr2IRUnal6VE4XRi9FDiJxWquAqk7NPaCI+Cu50Wan79Wt+hRK34jlSMN5/u9K61e
qU/1RAdf+5DCTf2RpjWt5hXD3cHkHOZhCP3ZOq4OOiu9ss6BrgugcNKZ1GY9MzepFvILyOM/4E76
C1J+lPq2WYkFO2kcjwcXm6u6LOU8ERi+rfJCHOmTA1NUkRwPten44dwWccwelbSzTkcyrdGaRXQg
0AnWRdjB8zBzzb/GxsKEs+oplw9WP4nk+btQTnTdRYIrEVpqg67kLUWNkAgbxgIZdbPR0gCChVhb
ime70rFNWuHJl4iqmanRkoE6T2ElbAR67o5sf5GliVW6Wjxf8Bew4CumfB2mXEcztRp8sMc5RTK2
80Q=
=Tssr
-----END PGP SIGNATURE-----

--qZm1DnloFXpLxDkOywZQpV2tnvBt2Y0eD--
