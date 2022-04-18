Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5756B505DDD
	for <lists+dri-devel@lfdr.de>; Mon, 18 Apr 2022 20:09:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1395089C84;
	Mon, 18 Apr 2022 18:09:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D53289C84
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Apr 2022 18:09:31 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 979D11F37C;
 Mon, 18 Apr 2022 18:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1650305369; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XRWAll3cRM0fEt+86roWxVLbr8d1Y6gI2JaM6RMC2GE=;
 b=qxInrmW71zuEDnd19WGfw3JLaQLa6toY8MGLNPe3MYEXm3+ndAhf41G6CBGlrsDNjKPPgZ
 1XRIx9w8CVQijhu/38J0wmeC7X8mCeInvkXKPNJ0gvXgyMjCjfk5yHwG65ercER+/bMYtG
 hle8FxSZABUToA4lJv4yIX8dO0IiNcA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1650305369;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XRWAll3cRM0fEt+86roWxVLbr8d1Y6gI2JaM6RMC2GE=;
 b=bBx1bJ1p3C0O6DDYunQDREpW7ZUeOOjEpNr9GqmgUMWdFuOZpcrp93JYDX/qavD9ZstPtR
 zvgGkJBDrgV2rYCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5882C13ACB;
 Mon, 18 Apr 2022 18:09:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id /+F/FFmpXWLceAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 18 Apr 2022 18:09:29 +0000
Message-ID: <2951f153-609f-ad8a-dc6e-feafb8aabca1@suse.de>
Date: Mon, 18 Apr 2022 20:09:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/2] of: Create platform devices for OF framebuffers
Content-Language: en-US
To: Rob Herring <robh+dt@kernel.org>
References: <20220413092454.1073-1-tzimmermann@suse.de>
 <20220413092454.1073-2-tzimmermann@suse.de>
 <CAL_JsqK4oT47Q=XFTZ0a=g3-DiB1JsW7_j9M1qRzpeahhz0muA@mail.gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <CAL_JsqK4oT47Q=XFTZ0a=g3-DiB1JsW7_j9M1qRzpeahhz0muA@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------rprr3qXUNrc3UlEJIlw8bi8k"
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
Cc: devicetree@vger.kernel.org,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>, Frank Rowand <frowand.list@gmail.com>,
 Helge Deller <deller@gmx.de>, dri-devel <dri-devel@lists.freedesktop.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------rprr3qXUNrc3UlEJIlw8bi8k
Content-Type: multipart/mixed; boundary="------------aZPMTyhvY1SIWpwEhr8aWvvJ";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Frank Rowand <frowand.list@gmail.com>, Helge Deller <deller@gmx.de>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Sam Ravnborg <sam@ravnborg.org>, Guenter Roeck <linux@roeck-us.net>
Message-ID: <2951f153-609f-ad8a-dc6e-feafb8aabca1@suse.de>
Subject: Re: [PATCH 1/2] of: Create platform devices for OF framebuffers
References: <20220413092454.1073-1-tzimmermann@suse.de>
 <20220413092454.1073-2-tzimmermann@suse.de>
 <CAL_JsqK4oT47Q=XFTZ0a=g3-DiB1JsW7_j9M1qRzpeahhz0muA@mail.gmail.com>
In-Reply-To: <CAL_JsqK4oT47Q=XFTZ0a=g3-DiB1JsW7_j9M1qRzpeahhz0muA@mail.gmail.com>

--------------aZPMTyhvY1SIWpwEhr8aWvvJ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTMuMDQuMjIgdW0gMTQ6NTEgc2NocmllYiBSb2IgSGVycmluZzoNCi4uLg0K
Pj4gKw0KPj4gICAvKioNCj4+ICAgICogb2ZfcGxhdGZvcm1fcG9wdWxhdGUoKSAtIFBvcHVs
YXRlIHBsYXRmb3JtX2RldmljZXMgZnJvbSBkZXZpY2UgdHJlZSBkYXRhDQo+PiAgICAqIEBy
b290OiBwYXJlbnQgb2YgdGhlIGZpcnN0IGxldmVsIHRvIHByb2JlIG9yIE5VTEwgZm9yIHRo
ZSByb290IG9mIHRoZSB0cmVlDQo+PiBAQCAtNTQxLDkgKzU5NSw3IEBAIHN0YXRpYyBpbnQg
X19pbml0IG9mX3BsYXRmb3JtX2RlZmF1bHRfcG9wdWxhdGVfaW5pdCh2b2lkKQ0KPj4gICAg
ICAgICAgICAgICAgICBvZl9ub2RlX3B1dChub2RlKTsNCj4+ICAgICAgICAgIH0NCj4+DQo+
PiAtICAgICAgIG5vZGUgPSBvZl9nZXRfY29tcGF0aWJsZV9jaGlsZChvZl9jaG9zZW4sICJz
aW1wbGUtZnJhbWVidWZmZXIiKTsNCj4+IC0gICAgICAgb2ZfcGxhdGZvcm1fZGV2aWNlX2Ny
ZWF0ZShub2RlLCBOVUxMLCBOVUxMKTsNCj4+IC0gICAgICAgb2Zfbm9kZV9wdXQobm9kZSk7
DQo+PiArICAgICAgIG9mX3BsYXRmb3JtX3BvcHVsYXRlX2ZyYW1lYnVmZmVycygpOw0KPj4N
Cj4+ICAgICAgICAgIC8qIFBvcHVsYXRlIGV2ZXJ5dGhpbmcgZWxzZS4gKi8NCj4+ICAgICAg
ICAgIG9mX3BsYXRmb3JtX2RlZmF1bHRfcG9wdWxhdGUoTlVMTCwgTlVMTCwgTlVMTCk7DQo+
IA0KPiBJJ20gcHJldHR5IHN1cmUgaXQncyBqdXN0IHRoaXMgY2FsbCB0aGF0J3MgdGhlIHBy
b2JsZW0gZm9yIFBQQyB0aG91Z2gNCj4gbm9uZSBvZiB0aGUgYWJvdmUgZXhpc3RlZCB3aGVu
IGFkZGluZyB0aGlzIGNhdXNlZCBhIHJlZ3Jlc3Npb24uIENhbiB3ZQ0KPiByZW1vdmUgdGhl
IGlmZGVmIGFuZCBqdXN0IG1ha2UgdGhpcyBjYWxsIGNvbmRpdGlvbmFsIG9uDQo+ICFJU19F
TkFCTEVEKENPTkZJR19QUEMpLg0KDQpUaGF0IGRpZG4ndCB3b3JrLiBUaGUgYm9vdCBwcm9j
ZXNzIHN0b3BzIGF0IHNvbWUgcG9pbnQuIEknbGwgc2VuZCB5b3UgYW4gDQp1cGRhdGVkIHBh
dGNoIHRoYXQgY292ZXJzIG1vc3Qgb2YgdGhlIGZ1bmN0aW9uIHdpdGggSVNfRU5BQkxFRChD
T05GSUdfUFBDKQ0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQo+IA0KPiANCj4+IEBAIC01
NTEsNiArNjAzLDIwIEBAIHN0YXRpYyBpbnQgX19pbml0IG9mX3BsYXRmb3JtX2RlZmF1bHRf
cG9wdWxhdGVfaW5pdCh2b2lkKQ0KPj4gICAgICAgICAgcmV0dXJuIDA7DQo+PiAgIH0NCj4+
ICAgYXJjaF9pbml0Y2FsbF9zeW5jKG9mX3BsYXRmb3JtX2RlZmF1bHRfcG9wdWxhdGVfaW5p
dCk7DQo+PiArI2Vsc2UNCj4+ICtzdGF0aWMgaW50IF9faW5pdCBvZl9wbGF0Zm9ybV9kZWZh
dWx0X3BvcHVsYXRlX2luaXQodm9pZCkNCj4+ICt7DQo+PiArICAgICAgIGRldmljZV9saW5r
c19zdXBwbGllcl9zeW5jX3N0YXRlX3BhdXNlKCk7DQo+PiArDQo+PiArICAgICAgIGlmICgh
b2ZfaGF2ZV9wb3B1bGF0ZWRfZHQoKSkNCj4+ICsgICAgICAgICAgICAgICByZXR1cm4gLUVO
T0RFVjsNCj4+ICsNCj4+ICsgICAgICAgb2ZfcGxhdGZvcm1fcG9wdWxhdGVfZnJhbWVidWZm
ZXJzKCk7DQo+PiArDQo+PiArICAgICAgIHJldHVybiAwOw0KPj4gK30NCj4+ICthcmNoX2lu
aXRjYWxsX3N5bmMob2ZfcGxhdGZvcm1fZGVmYXVsdF9wb3B1bGF0ZV9pbml0KTsNCj4+ICsj
ZW5kaWYNCj4+DQo+PiAgIHN0YXRpYyBpbnQgX19pbml0IG9mX3BsYXRmb3JtX3N5bmNfc3Rh
dGVfaW5pdCh2b2lkKQ0KPj4gICB7DQo+PiBAQCAtNTU4LDcgKzYyNCw2IEBAIHN0YXRpYyBp
bnQgX19pbml0IG9mX3BsYXRmb3JtX3N5bmNfc3RhdGVfaW5pdCh2b2lkKQ0KPj4gICAgICAg
ICAgcmV0dXJuIDA7DQo+PiAgIH0NCj4+ICAgbGF0ZV9pbml0Y2FsbF9zeW5jKG9mX3BsYXRm
b3JtX3N5bmNfc3RhdGVfaW5pdCk7DQo+PiAtI2VuZGlmDQo+Pg0KPj4gICBpbnQgb2ZfcGxh
dGZvcm1fZGV2aWNlX2Rlc3Ryb3koc3RydWN0IGRldmljZSAqZGV2LCB2b2lkICpkYXRhKQ0K
Pj4gICB7DQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZl
bG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0
ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJl
cmcpDQpHZXNjaMOkZnRzZsO8aHJlcjogSXZvIFRvdGV2DQo=

--------------aZPMTyhvY1SIWpwEhr8aWvvJ--

--------------rprr3qXUNrc3UlEJIlw8bi8k
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmJdqVgFAwAAAAAACgkQlh/E3EQov+Dp
ug//X4Lj/BZJaEm3/ZMTdb1bXPcbNtVjKZwAyVzgU8e3kpOF46troFn26QENLQSy48vroGAK/L0K
nr3K9+rWBdFynDbO4ov7UtvUqFV0WbTGCjyuBSUWwvjonz8ZNmHzPf5J1y1vaC5ufxoZ8eUadCWF
OncuFDb3oa3JddufnTqmciNGmFukPWJ2AH8xiKW6UAzRsgBklCG0jplzZ8piD0P3hvtAR7Jd3xDL
uVQKMSRhORuXJwapPuZSS+qq/KL+MNDOTC6R/bojFBKHte1yE/Lwp0yajVStmXCwL+Z3xVOfcv3x
unlqrUyudM5a83TINLPYCTSxYLjucgHXCOWYyAPrJkiboZssLiA/8F7xw7LhiT+bzv/HgAHwJ6Nx
3inBCh6dj9quSEzKPIKKbTwyiVT6pKSevSdgKtU0a+z1AVyJuoqevbXjtxb8zc2IhQBqRCB045Pv
7Cb6miq/NGSGiN83am8+UMqXrCPKBdVah5NL+S5dsqWQ88ZObvS8eRxEkQuo42yM6EejrCkSLxVf
ZkizQdGw6VrPvUFcig9eMBPOB3Ml9mPUPtqusd9ms6uPDfV3xmjp0kMf60mTgVGzYEMgza1uDK2p
5RLpSxCk6z0g+hV5auR7p0GxZGnP1D4hwfqEMJGR9c8tV4lGzFLSkH9UgkJOsxvluMFT7NRye8WY
BfQ=
=KHBy
-----END PGP SIGNATURE-----

--------------rprr3qXUNrc3UlEJIlw8bi8k--
