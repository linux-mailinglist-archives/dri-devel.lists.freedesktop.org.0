Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B00A7204EA
	for <lists+dri-devel@lfdr.de>; Fri,  2 Jun 2023 16:53:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30DC010E01F;
	Fri,  2 Jun 2023 14:53:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8D8810E01F
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Jun 2023 14:53:32 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 25A1B1FDAF;
 Fri,  2 Jun 2023 14:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1685717611; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tWaTh2H4pP6rcbLy7AaUAANU1Bq0aVWzKPokoGoPa9Y=;
 b=BIhyn/STwSvEfzBV52mY3ZvLjHOCPn1yuoj0YnENldsO/6reTob9RyZ2IBoxMWspZ2ALUb
 aW0GOhQI1kMq+klnaOV7eV1r8a8ODKpR3GPktqujkpTsb1/V++SDPS6mHjLVlNlM7V/wdo
 krwwrpY3uMuYce/LV98ptBIPolkXsLg=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AC48D13A2E;
 Fri,  2 Jun 2023 14:53:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id EimDKGoCemTyXwAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 02 Jun 2023 14:53:30 +0000
Message-ID: <5083c051-dfcf-ae23-195f-4c92bb875009@suse.com>
Date: Fri, 2 Jun 2023 16:53:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [RESUBMIT][PATCH] x86/mm: Fix PAT bit missing from page
 protection modify mask
Content-Language: en-US
From: Juergen Gross <jgross@suse.com>
To: Borislav Petkov <bp@alien8.de>
References: <20230519183634.190364-1-janusz.krzysztofik@linux.intel.com>
 <20230531181412.GFZHeOdMHIGOXB2hwL@fat_crate.local>
 <cfd19da7-4148-f277-0cf8-507b94d214a3@suse.com>
 <20230602144357.GCZHoALQjO+xx3YxAz@fat_crate.local>
 <bd70e7b8-1971-6982-979a-ce1eb4c93465@suse.com>
In-Reply-To: <bd70e7b8-1971-6982-979a-ce1eb4c93465@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------lhnldzDRTHsO7Jdr8OKhwULx"
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
Cc: x86@kernel.org, Yu Zhao <yuzhao@google.com>,
 David Hildenbrand <david@redhat.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, drm-intel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>,
 Ingo Molnar <mingo@redhat.com>, Andi Shyti <andi.shyti@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andrew Morton <akpm@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------lhnldzDRTHsO7Jdr8OKhwULx
Content-Type: multipart/mixed; boundary="------------fT044I1EYHXbcyFBdqakATdw";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Borislav Petkov <bp@alien8.de>
Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>, Yu Zhao <yuzhao@google.com>,
 linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, Andi Shyti <andi.shyti@linux.intel.com>,
 drm-intel@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Message-ID: <5083c051-dfcf-ae23-195f-4c92bb875009@suse.com>
Subject: Re: [RESUBMIT][PATCH] x86/mm: Fix PAT bit missing from page
 protection modify mask
References: <20230519183634.190364-1-janusz.krzysztofik@linux.intel.com>
 <20230531181412.GFZHeOdMHIGOXB2hwL@fat_crate.local>
 <cfd19da7-4148-f277-0cf8-507b94d214a3@suse.com>
 <20230602144357.GCZHoALQjO+xx3YxAz@fat_crate.local>
 <bd70e7b8-1971-6982-979a-ce1eb4c93465@suse.com>
In-Reply-To: <bd70e7b8-1971-6982-979a-ce1eb4c93465@suse.com>

--------------fT044I1EYHXbcyFBdqakATdw
Content-Type: multipart/mixed; boundary="------------SWSMr8KW8i5BF6nddV0xXjMS"

--------------SWSMr8KW8i5BF6nddV0xXjMS
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDIuMDYuMjMgMTY6NDgsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+IE9uIDAyLjA2LjIz
IDE2OjQzLCBCb3Jpc2xhdiBQZXRrb3Ygd3JvdGU6DQo+PiBPbiBUaHUsIEp1biAwMSwgMjAy
MyBhdCAxMDo0NzozOUFNICswMjAwLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4+IEFzIGRl
c2NyaWJlZCBpbiB0aGUgY29tbWl0IG1lc3NhZ2UsIHRoaXMgb25seSB3b3JrcyBvbiBiYXJl
IG1ldGFsIGR1ZSB0byB0aGUNCj4+PiBQQVQgYml0IG5vdCBiZWluZyBuZWVkZWQgZm9yIFdD
IG1hcHBpbmdzLg0KPj4+DQo+Pj4gTWFraW5nIHRoaXMgcGF0Y2ggWGVuIHNwZWNpZmljIHdv
dWxkIHRyeSB0byBjdXJlIHRoZSBzeW1wdG9tcyB3aXRob3V0IGZpeGluZw0KPj4+IHRoZSB1
bmRlcmx5aW5nIHByb2JsZW06IF9QQUdFX1BBVCBzaG91bGQgYmUgcmVnYXJkZWQgdGhlIHNh
bWUgd2F5IGFzIHRoZSBiaXRzDQo+Pj4gZm9yIGNhY2hpbmcgbW9kZSAoX1BBR0VfQ0hHX01B
U0spLg0KPj4NCj4+IFNvIHdoeSBpc24ndCBfUEFHRV9QQVQgcGFydCBvZiBfUEFHRV9DSEdf
TUFTSz8NCj4gDQo+IFRoaXMgd291bGQgcmVzdWx0IGluIHByb2JsZW1zIGZvciBsYXJnZSBw
YWdlczogX1BBR0VfUFNFIGlzIGF0IHRoZSBzYW1lDQo+IHBvc2l0aW9uIGFzIF9QQUdFX1BB
VCAobGFyZ2UgcGFnZXMgYXJlIHVzaW5nIF9QQUdFX1BBVF9MQVJHRSBpbnN0ZWFkKS4NCj4g
DQo+IFllcywgeDg2IEFCSSBpcyBhIG1lc3MuDQoNCk9oLCB3YWl0OiBJIG9yaWdpbmFsbHkg
dGhvdWdodCBfUEFHRV9DSEdfTUFTSyB3b3VsZCBiZSB1c2VkIGZvciBsYXJnZSBwYWdlcywN
CnRvby4gVGhlcmUgaXMgX0hQQUdFX0NIR19NQVNLIGZvciB0aGF0IHB1cnBvc2UuDQoNClNv
IGFkZGluZyBfUEFHRV9QQVQgdG8gX1BBR0VfQ0hHX01BU0sgYW5kIF9QQUdFX1BBVF9MQVJH
RSB0byBfSFBBR0VfQ0hHX01BU0sNCnNob3VsZCBkbyB0aGUgam9iLiBBdCBsZWFzdCBJIGhv
cGUgc28uDQoNCg0KSnVlcmdlbg0K
--------------SWSMr8KW8i5BF6nddV0xXjMS
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------SWSMr8KW8i5BF6nddV0xXjMS--

--------------fT044I1EYHXbcyFBdqakATdw--

--------------lhnldzDRTHsO7Jdr8OKhwULx
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmR6AmoFAwAAAAAACgkQsN6d1ii/Ey++
CQgAgxzclUeWbUr8eBq6IDi8l4FeaaQnJ4L9HKQkPkPiQtsKdyzBnU8jmtjeIfXGWsqC8/mehDSJ
R9jmBgW2PO4DxX1IsLyn1DPVZrRq4x31i9IQlRFtOctPbrJWXhRW83jOnTrVgVPiOuNubN2wV1/K
ulSzryff6GAPSL/YSG2UhOYh/WARgt6Ib8MBzO3kVhFPHLQrBoP4h+o0lhHx0wtnl2p2vLmnlYKm
pa/m7PVUbqUxy8aPQ+ZWUumSFkZjefh11HC0W0AFfjeOupRx/JR/G4Vz+4XHMw9+Z5vqdaF9U1dm
Y7F5IZgUwedGv+Zu3luhZHBOrHLAIvmqIr18W+SisQ==
=MfTn
-----END PGP SIGNATURE-----

--------------lhnldzDRTHsO7Jdr8OKhwULx--
