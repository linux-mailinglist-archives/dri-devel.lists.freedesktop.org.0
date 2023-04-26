Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D35B26EF773
	for <lists+dri-devel@lfdr.de>; Wed, 26 Apr 2023 17:06:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BAB110E99E;
	Wed, 26 Apr 2023 15:06:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11E0010E99E
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Apr 2023 15:06:29 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 9A39C1FDD2;
 Wed, 26 Apr 2023 15:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1682521588; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+FH2kz2J/j6o/wPVOyeJutn89PZiJ36fgd3yf/d+JfA=;
 b=W4Qj9Ld/jmeCJfD87Xn9nJ7FzdDJnCsCGNzhIHiw373INqZ5XSSl3CVFXJM4xvStMOAP/+
 lyVi0mswxX0nvZt4dRnnPhittgB0RKunQJX7OjDeXFG/hl/Tii7a4wzSDuKF0JpjJTh2jl
 Bwwrt3kC+mPZGwPxtZ2W1K8eUIfTCeQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1682521588;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+FH2kz2J/j6o/wPVOyeJutn89PZiJ36fgd3yf/d+JfA=;
 b=b50vz4zPsjTnE0y/AElrqRPdjYYrrh/KX3EUAtc36au+OVuYug4b058AUOSU5d3nTVvx9n
 DapltiRhFBtlx+Ag==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 620B913421;
 Wed, 26 Apr 2023 15:06:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id WrXiFvQ9SWQ6dwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 26 Apr 2023 15:06:28 +0000
Message-ID: <1d81e4cc-5079-12a7-4cf5-c31879396e56@suse.de>
Date: Wed, 26 Apr 2023 17:06:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 5/6] fbdev: Move CFB read and write code into helper
 functions
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <20230425142846.730-1-tzimmermann@suse.de>
 <20230425142846.730-6-tzimmermann@suse.de>
 <CAMuHMdU-_w9yQHYhOCD3cz4CEY6ag-dTXjuHSLnzty0hAMBbXw@mail.gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <CAMuHMdU-_w9yQHYhOCD3cz4CEY6ag-dTXjuHSLnzty0hAMBbXw@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------r5TkLtDRp0yqxLfwSn0Scbim"
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
Cc: linux-fbdev@vger.kernel.org, teddy.wang@siliconmotion.com, deller@gmx.de,
 javierm@redhat.com, dri-devel@lists.freedesktop.org,
 sudipm.mukherjee@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------r5TkLtDRp0yqxLfwSn0Scbim
Content-Type: multipart/mixed; boundary="------------MdMefs1OOZp0W1ibMx4XFf4E";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch, javierm@redhat.com, deller@gmx.de,
 sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Message-ID: <1d81e4cc-5079-12a7-4cf5-c31879396e56@suse.de>
Subject: Re: [PATCH 5/6] fbdev: Move CFB read and write code into helper
 functions
References: <20230425142846.730-1-tzimmermann@suse.de>
 <20230425142846.730-6-tzimmermann@suse.de>
 <CAMuHMdU-_w9yQHYhOCD3cz4CEY6ag-dTXjuHSLnzty0hAMBbXw@mail.gmail.com>
In-Reply-To: <CAMuHMdU-_w9yQHYhOCD3cz4CEY6ag-dTXjuHSLnzty0hAMBbXw@mail.gmail.com>

--------------MdMefs1OOZp0W1ibMx4XFf4E
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjYuMDQuMjMgdW0gMTc6MDEgc2NocmllYiBHZWVydCBVeXR0ZXJob2V2ZW46
DQo+IEhpIFRob21hcywNCj4gDQo+IE9uIFR1ZSwgQXByIDI1LCAyMDIzIGF0IDQ6MjjigK9Q
TSBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4gd3JvdGU6DQo+PiBN
b3ZlIHRoZSBleGlzdGluZyBDRkIgcmVhZCBhbmQgd3JpdGUgY29kZSBmb3IgSS9PIG1lbW9y
eSBpbnRvDQo+PiB0aGUgbmV3IGhlbHBlcnMgZmJfY2ZiX3JlYWQoKSBhbmQgZmJfY2ZiX3dy
aXRlKCkuIE1ha2UgdGhlbSB0aGUNCj4+IGRlZmF1bHQgZnBfb3BzLiBObyBmdW5jdGlvbmFs
IGNoYW5nZXMuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6
aW1tZXJtYW5uQHN1c2UuZGU+DQo+PiAtLS0NCj4+ICAgZHJpdmVycy92aWRlby9mYmRldi9j
b3JlL01ha2VmaWxlICAgICAgfCAgIDIgKy0NCj4+ICAgZHJpdmVycy92aWRlby9mYmRldi9j
b3JlL2ZiX2NmYl9mb3BzLmMgfCAxMjYgKysrKysrKysrKysrKysrKysrKysrKysrKw0KPj4g
ICBkcml2ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUvZmJtZW0uYyAgICAgICB8IDExMyArLS0tLS0t
LS0tLS0tLS0tLS0tLS0tDQo+PiAgIGluY2x1ZGUvbGludXgvZmIuaCAgICAgICAgICAgICAg
ICAgICAgIHwgIDEwICsrDQo+PiAgIDQgZmlsZXMgY2hhbmdlZCwgMTM5IGluc2VydGlvbnMo
KyksIDExMiBkZWxldGlvbnMoLSkNCj4+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMv
dmlkZW8vZmJkZXYvY29yZS9mYl9jZmJfZm9wcy5jDQo+IA0KPiBXaGlsZSB0aGUgZ2VuZXJh
bCBpZGVhIGlzIGZpbmUsIHBsZWFzZSBkbyBub3QgY2FsbCBhbnkgb2YgdGhpcyAiY2ZiIiwN
Cj4gYXMgaXQgaXMgbm90IHJlbGF0ZWQgdG8gY2h1bmt5IGNvbG9yIGZyYW1lIGJ1ZmZlciBm
b3JtYXRzLg0KPiBBbGwgb2YgdGhlc2Ugb3BlcmF0ZSBvbiB0aGUgcmF3IGZyYW1lIGJ1ZmZl
ciBjb250ZW50cy4NCg0KU2hhbGwgSSBjYWxsIGl0IGZiX3Jhd18oKSBvciBmYl9pb18oKT8N
Cg0KQ0ZCIGlzIHVzZWQgYnkgdGhlIGRyYXdpbmcgaGVscGVycywgd2hpY2ggYXJlIHVzdWFs
bHkgdXNlZCB0b2dldGhlciB3aXRoIA0KdGhpcyBjb2RlLiBIZW5jZSB0aGUgY3VycmVudCBu
YW1pbmcuDQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCg0KPiANCj4+IC0tLSAvZGV2L251
bGwNCj4+ICsrKyBiL2RyaXZlcnMvdmlkZW8vZmJkZXYvY29yZS9mYl9jZmJfZm9wcy5jDQo+
PiBAQCAtMCwwICsxLDEyNiBAQA0KPj4gKy8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBH
UEwtMi4wDQo+PiArDQo+PiArI2luY2x1ZGUgPGxpbnV4L2ZiLmg+DQo+PiArI2luY2x1ZGUg
PGxpbnV4L21vZHVsZS5oPg0KPj4gKyNpbmNsdWRlIDxsaW51eC91YWNjZXNzLmg+DQo+PiAr
DQo+PiArc3NpemVfdCBmYl9jZmJfcmVhZChzdHJ1Y3QgZmJfaW5mbyAqaW5mbywgY2hhciBf
X3VzZXIgKmJ1Ziwgc2l6ZV90IGNvdW50LCBsb2ZmX3QgKnBwb3MpDQo+PiArew0KPiANCj4g
Wy4uLl0NCj4gDQo+PiArICAgICAgIHdoaWxlIChjb3VudCkgew0KPj4gKyAgICAgICAgICAg
ICAgIGMgID0gKGNvdW50ID4gUEFHRV9TSVpFKSA/IFBBR0VfU0laRSA6IGNvdW50Ow0KPj4g
KyAgICAgICAgICAgICAgIGRzdCA9IGJ1ZmZlcjsNCj4+ICsgICAgICAgICAgICAgICBmYl9t
ZW1jcHlfZnJvbWZiKGRzdCwgc3JjLCBjKTsNCj4+ICsgICAgICAgICAgICAgICBkc3QgKz0g
YzsNCj4+ICsgICAgICAgICAgICAgICBzcmMgKz0gYzsNCj4+ICsNCj4+ICsgICAgICAgICAg
ICAgICBpZiAoY29weV90b191c2VyKGJ1ZiwgYnVmZmVyLCBjKSkgew0KPiANCj4gU28gaGVy
ZSdzIHN0aWxsIHRoZSBidWdneSBjb3B5X3RvX3VzZXIoKSBoYW5kbGluZywgY29waWVkIGZy
b20gZmJfcmVhZCgpLg0KPiANCj4+ICsgICAgICAgICAgICAgICAgICAgICAgIGVyciA9IC1F
RkFVTFQ7DQo+PiArICAgICAgICAgICAgICAgICAgICAgICBicmVhazsNCj4+ICsgICAgICAg
ICAgICAgICB9DQo+PiArICAgICAgICAgICAgICAgKnBwb3MgKz0gYzsNCj4+ICsgICAgICAg
ICAgICAgICBidWYgKz0gYzsNCj4+ICsgICAgICAgICAgICAgICBjbnQgKz0gYzsNCj4+ICsg
ICAgICAgICAgICAgICBjb3VudCAtPSBjOw0KPj4gKyAgICAgICB9DQo+PiArDQo+PiArICAg
ICAgIGtmcmVlKGJ1ZmZlcik7DQo+PiArDQo+PiArICAgICAgIHJldHVybiBjbnQgPyBjbnQg
OiBlcnI7DQo+PiArfQ0KPj4gK0VYUE9SVF9TWU1CT0woZmJfY2ZiX3JlYWQpOw0KPj4gKw0K
Pj4gK3NzaXplX3QgZmJfY2ZiX3dyaXRlKHN0cnVjdCBmYl9pbmZvICppbmZvLCBjb25zdCBj
aGFyIF9fdXNlciAqYnVmLCBzaXplX3QgY291bnQsIGxvZmZfdCAqcHBvcykNCj4+ICt7DQo+
IA0KPiBbLi4uXQ0KPiANCj4+ICsgICAgICAgd2hpbGUgKGNvdW50KSB7DQo+PiArICAgICAg
ICAgICAgICAgYyA9IChjb3VudCA+IFBBR0VfU0laRSkgPyBQQUdFX1NJWkUgOiBjb3VudDsN
Cj4+ICsgICAgICAgICAgICAgICBzcmMgPSBidWZmZXI7DQo+PiArDQo+PiArICAgICAgICAg
ICAgICAgaWYgKGNvcHlfZnJvbV91c2VyKHNyYywgYnVmLCBjKSkgew0KPiANCj4gQW5kIGNv
cHlfZnJvbV91c2VyKCksIHRvby4uLg0KPiANCj4+ICsgICAgICAgICAgICAgICAgICAgICAg
IGVyciA9IC1FRkFVTFQ7DQo+PiArICAgICAgICAgICAgICAgICAgICAgICBicmVhazsNCj4+
ICsgICAgICAgICAgICAgICB9DQo+PiArDQo+PiArICAgICAgICAgICAgICAgZmJfbWVtY3B5
X3RvZmIoZHN0LCBzcmMsIGMpOw0KPj4gKyAgICAgICAgICAgICAgIGRzdCArPSBjOw0KPj4g
KyAgICAgICAgICAgICAgIHNyYyArPSBjOw0KPj4gKyAgICAgICAgICAgICAgICpwcG9zICs9
IGM7DQo+PiArICAgICAgICAgICAgICAgYnVmICs9IGM7DQo+PiArICAgICAgICAgICAgICAg
Y250ICs9IGM7DQo+PiArICAgICAgICAgICAgICAgY291bnQgLT0gYzsNCj4+ICsgICAgICAg
fQ0KPj4gKw0KPj4gKyAgICAgICBrZnJlZShidWZmZXIpOw0KPj4gKw0KPj4gKyAgICAgICBy
ZXR1cm4gKGNudCkgPyBjbnQgOiBlcnI7DQo+PiArfQ0KPiANCj4gR3J7b2V0amUsZWV0aW5n
fXMsDQo+IA0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQNCj4gDQoNCi0tIA0K
VGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29m
dHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KRnJhbmtlbnN0cmFzc2UgMTQ2LCA5MDQ2
MSBOdWVybmJlcmcsIEdlcm1hbnkNCkdGOiBJdm8gVG90ZXYsIEFuZHJldyBNeWVycywgQW5k
cmV3IE1jRG9uYWxkLCBCb3VkaWVuIE1vZXJtYW4NCkhSQiAzNjgwOSAoQUcgTnVlcm5iZXJn
KQ0K

--------------MdMefs1OOZp0W1ibMx4XFf4E--

--------------r5TkLtDRp0yqxLfwSn0Scbim
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmRJPfMFAwAAAAAACgkQlh/E3EQov+Dr
8g/8C7ZSWA45wtGGxSyCUoHnM4/jvmcCn3M3dJ3Wx/EsqNedEptbwpH+0iBEjjqttkHsnpKQM9uT
1q2UP3eu46qu4yAVL94wR/Ws/NdtIjIFIccgugD1uggGNV/uUobkAEAYor3hU0IhnlHiKmXOXSRU
ci7M2xaSHxvUA803DjBOu0GqAtpRRsk4Va4BMiMz4F5z6wfjotnuDz1f401u3IHh0Kz6EkwReBSc
0PDhaEhZakbqfKmiwibZ/FXn1tCug0tgA7d9P+woYumGnMd2Afx7W9d5m83AIGHplhoWG1QJJnl2
3XbBzL/xp3GNx6EDVTix+b+uYTStun4c8YjcI5Lb+A2eQX1gDrxJRGAw0bK1hfdRtQsx6BXljCfr
e+5OPuUUQPq+OsAx5rCLhivF86cXTshk4KdaC/x6/9YaBUEQJxGbQAxqJWqOeZ8NMkUjYW01LNpA
UfoPdK4dbg78tZ1VMUBIzhk3dwFcVJVCHzzrAxGOvRy+wyRkp39bHo09EmCcPABViFVv2eLfLevm
mgS+OiHGK3f+D/V+djT3DSQB4e+PCkEfvDf45e2kNoV1jXGp9H5UuODCUY19+aKFstQ6WcqowaJN
76HPCTIM7I/OcD6Fa4251Nqker0Iv9Wvrtf55+17St87D0oAtGr/CplHRwfxi6httq7eotNOxYB1
pXA=
=s5rI
-----END PGP SIGNATURE-----

--------------r5TkLtDRp0yqxLfwSn0Scbim--
