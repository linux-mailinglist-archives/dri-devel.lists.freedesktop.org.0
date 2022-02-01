Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 703134A5A26
	for <lists+dri-devel@lfdr.de>; Tue,  1 Feb 2022 11:37:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1D0510ED76;
	Tue,  1 Feb 2022 10:37:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3881A10ED6F;
 Tue,  1 Feb 2022 10:37:40 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D9D4E210F5;
 Tue,  1 Feb 2022 10:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1643711858; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ucOSE/khhWXaiCP2YLiLU6ZnEjJtK5wnKj89bfNOk8g=;
 b=yWZp6oNvvYGJV8SYyO2CZ/G9EhOinB0pB/3BINzQZ6tvYWqajIiN0YB0yQj/RpAJWa3wiv
 Pnnl6TPplVTFoCFpyicOjlJbP2vbg1E/dLZFZqa+0+Ba/kTguop8pkSAQNg9qRBuZHSAF2
 ZTQt6UddUR6ZEwKUvU/Zt7D1s5GFQOc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1643711858;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ucOSE/khhWXaiCP2YLiLU6ZnEjJtK5wnKj89bfNOk8g=;
 b=1m4q5O69lEjqilNVlI1WJ+i+3qiIsClkB5+Qn5a6r6PcYmaaTYJglGlHKOBgaDyF5OfBC8
 n1xGIHn1+m4DB5CQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A019313D54;
 Tue,  1 Feb 2022 10:37:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Qw4aJnIN+WH+FAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 01 Feb 2022 10:37:38 +0000
Message-ID: <723422bf-eb13-095f-66c5-e4011653e21d@suse.de>
Date: Tue, 1 Feb 2022 11:37:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 09/21] fbcon: Replace FBCON_FLAGS_INIT with a boolean
Content-Language: en-US
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20220131210552.482606-1-daniel.vetter@ffwll.ch>
 <20220131210552.482606-10-daniel.vetter@ffwll.ch>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220131210552.482606-10-daniel.vetter@ffwll.ch>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------p38YX7IZ0Eb4SpD5Fdiu14aQ"
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
Cc: linux-fbdev@vger.kernel.org, Du Cheng <ducheng2@gmail.com>,
 Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, Claudio Suarez <cssk@net-c.es>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------p38YX7IZ0Eb4SpD5Fdiu14aQ
Content-Type: multipart/mixed; boundary="------------ZuqnsJBSz9brMpRJ7r9KWedE";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 linux-fbdev@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Daniel Vetter <daniel.vetter@intel.com>, Daniel Vetter <daniel@ffwll.ch>,
 Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Du Cheng <ducheng2@gmail.com>, Claudio Suarez <cssk@net-c.es>
Message-ID: <723422bf-eb13-095f-66c5-e4011653e21d@suse.de>
Subject: Re: [PATCH 09/21] fbcon: Replace FBCON_FLAGS_INIT with a boolean
References: <20220131210552.482606-1-daniel.vetter@ffwll.ch>
 <20220131210552.482606-10-daniel.vetter@ffwll.ch>
In-Reply-To: <20220131210552.482606-10-daniel.vetter@ffwll.ch>

--------------ZuqnsJBSz9brMpRJ7r9KWedE
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQoNCkFtIDMxLjAxLjIyIHVtIDIyOjA1IHNjaHJpZWIgRGFuaWVsIFZldHRlcjoNCj4gSXQn
cyBvbmx5IG9uZSBmbGFnIGFuZCBzbGlnaHRseSB0aWRpZXIgY29kZS4NCj4gDQo+IFNpZ25l
ZC1vZmYtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAaW50ZWwuY29tPg0KPiBD
YzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPg0KPiBDYzogVGV0c3VvIEhhbmRh
IDxwZW5ndWluLWtlcm5lbEBJLWxvdmUuU0FLVVJBLm5lLmpwPg0KPiBDYzogR3JlZyBLcm9h
aC1IYXJ0bWFuIDxncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZz4NCj4gQ2M6IER1IENoZW5n
IDxkdWNoZW5nMkBnbWFpbC5jb20+DQo+IENjOiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1l
cm1hbm5Ac3VzZS5kZT4NCj4gQ2M6IENsYXVkaW8gU3VhcmV6IDxjc3NrQG5ldC1jLmVzPg0K
DQpBY2tlZC1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+DQoN
Cj4gLS0tDQo+ICAgZHJpdmVycy92aWRlby9mYmRldi9jb3JlL2ZiY29uLmMgfCAxMSArKysr
Ky0tLS0tLQ0KPiAgIGRyaXZlcnMvdmlkZW8vZmJkZXYvY29yZS9mYmNvbi5oIHwgIDQgKy0t
LQ0KPiAgIDIgZmlsZXMgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygt
KQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmlkZW8vZmJkZXYvY29yZS9mYmNvbi5j
IGIvZHJpdmVycy92aWRlby9mYmRldi9jb3JlL2ZiY29uLmMNCj4gaW5kZXggYWZmYjQwNjU4
ZmVlLi5mYTMwZTE5MDkxNjQgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvdmlkZW8vZmJkZXYv
Y29yZS9mYmNvbi5jDQo+ICsrKyBiL2RyaXZlcnMvdmlkZW8vZmJkZXYvY29yZS9mYmNvbi5j
DQo+IEBAIC03NzMsNyArNzczLDcgQEAgc3RhdGljIHZvaWQgY29uMmZiX2luaXRfZGlzcGxh
eShzdHJ1Y3QgdmNfZGF0YSAqdmMsIHN0cnVjdCBmYl9pbmZvICppbmZvLA0KPiAgIA0KPiAg
IAlvcHMtPmN1cnJjb24gPSBmZ19jb25zb2xlOw0KPiAgIA0KPiAtCWlmIChpbmZvLT5mYm9w
cy0+ZmJfc2V0X3BhciAmJiAhKG9wcy0+ZmxhZ3MgJiBGQkNPTl9GTEFHU19JTklUKSkgew0K
PiArCWlmIChpbmZvLT5mYm9wcy0+ZmJfc2V0X3BhciAmJiAhb3BzLT5pbml0aWFsaXplZCkg
ew0KPiAgIAkJcmV0ID0gaW5mby0+ZmJvcHMtPmZiX3NldF9wYXIoaW5mbyk7DQo+ICAgDQo+
ICAgCQlpZiAocmV0KQ0KPiBAQCAtNzgyLDcgKzc4Miw3IEBAIHN0YXRpYyB2b2lkIGNvbjJm
Yl9pbml0X2Rpc3BsYXkoc3RydWN0IHZjX2RhdGEgKnZjLCBzdHJ1Y3QgZmJfaW5mbyAqaW5m
bywNCj4gICAJCQkJImVycm9yIGNvZGUgJWRcbiIsIHJldCk7DQo+ICAgCX0NCj4gICANCj4g
LQlvcHMtPmZsYWdzIHw9IEZCQ09OX0ZMQUdTX0lOSVQ7DQo+ICsJb3BzLT5pbml0aWFsaXpl
ZCA9IHRydWU7DQo+ICAgCW9wcy0+Z3JhcGhpY3MgPSAwOw0KPiAgIAlmYmNvbl9zZXRfZGlz
cChpbmZvLCAmaW5mby0+dmFyLCB1bml0KTsNCj4gICANCj4gQEAgLTExMDEsOCArMTEwMSw3
IEBAIHN0YXRpYyB2b2lkIGZiY29uX2luaXQoc3RydWN0IHZjX2RhdGEgKnZjLCBpbnQgaW5p
dCkNCj4gICAJICogV2UgbmVlZCB0byBkbyBpdCBpbiBmYmNvbl9pbml0KCkgdG8gcHJldmVu
dCBzY3JlZW4gY29ycnVwdGlvbi4NCj4gICAJICovDQo+ICAgCWlmIChjb25faXNfdmlzaWJs
ZSh2YykgJiYgdmMtPnZjX21vZGUgPT0gS0RfVEVYVCkgew0KPiAtCQlpZiAoaW5mby0+ZmJv
cHMtPmZiX3NldF9wYXIgJiYNCj4gLQkJICAgICEob3BzLT5mbGFncyAmIEZCQ09OX0ZMQUdT
X0lOSVQpKSB7DQo+ICsJCWlmIChpbmZvLT5mYm9wcy0+ZmJfc2V0X3BhciAmJiAhb3BzLT5p
bml0aWFsaXplZCkgew0KPiAgIAkJCXJldCA9IGluZm8tPmZib3BzLT5mYl9zZXRfcGFyKGlu
Zm8pOw0KPiAgIA0KPiAgIAkJCWlmIChyZXQpDQo+IEBAIC0xMTExLDcgKzExMTAsNyBAQCBz
dGF0aWMgdm9pZCBmYmNvbl9pbml0KHN0cnVjdCB2Y19kYXRhICp2YywgaW50IGluaXQpDQo+
ICAgCQkJCQkiZXJyb3IgY29kZSAlZFxuIiwgcmV0KTsNCj4gICAJCX0NCj4gICANCj4gLQkJ
b3BzLT5mbGFncyB8PSBGQkNPTl9GTEFHU19JTklUOw0KPiArCQlvcHMtPmluaXRpYWxpemVk
ID0gdHJ1ZTsNCj4gICAJfQ0KPiAgIA0KPiAgIAlvcHMtPmdyYXBoaWNzID0gMDsNCj4gQEAg
LTExODYsNyArMTE4NSw3IEBAIHN0YXRpYyB2b2lkIGZiY29uX2RlaW5pdChzdHJ1Y3QgdmNf
ZGF0YSAqdmMpDQo+ICAgCWlmIChjb25faXNfdmlzaWJsZSh2YykpDQo+ICAgCQlmYmNvbl9k
ZWxfY3Vyc29yX3dvcmsoaW5mbyk7DQo+ICAgDQo+IC0Jb3BzLT5mbGFncyAmPSB+RkJDT05f
RkxBR1NfSU5JVDsNCj4gKwlvcHMtPmluaXRpYWxpemVkID0gZmFsc2U7DQo+ICAgZmluaXNo
ZWQ6DQo+ICAgDQo+ICAgCWZiY29uX2ZyZWVfZm9udChwLCBmcmVlX2ZvbnQpOw0KPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy92aWRlby9mYmRldi9jb3JlL2ZiY29uLmggYi9kcml2ZXJzL3Zp
ZGVvL2ZiZGV2L2NvcmUvZmJjb24uaA0KPiBpbmRleCBkY2U1Y2U0MTA5M2UuLmIxOGQwY2Jm
NzNiNiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy92aWRlby9mYmRldi9jb3JlL2ZiY29uLmgN
Cj4gKysrIGIvZHJpdmVycy92aWRlby9mYmRldi9jb3JlL2ZiY29uLmgNCj4gQEAgLTE4LDgg
KzE4LDYgQEANCj4gICANCj4gICAjaW5jbHVkZSA8YXNtL2lvLmg+DQo+ICAgDQo+IC0jZGVm
aW5lIEZCQ09OX0ZMQUdTX0lOSVQgICAgICAgICAxDQo+IC0NCj4gICAgICAvKg0KPiAgICAg
ICAqICAgIFRoaXMgaXMgdGhlIGludGVyZmFjZSBiZXR3ZWVuIHRoZSBsb3ctbGV2ZWwgY29u
c29sZSBkcml2ZXIgYW5kIHRoZQ0KPiAgICAgICAqICAgIGxvdy1sZXZlbCBmcmFtZSBidWZm
ZXIgZGV2aWNlDQo+IEBAIC03Nyw3ICs3NSw3IEBAIHN0cnVjdCBmYmNvbl9vcHMgew0KPiAg
IAlpbnQgICAgYmxhbmtfc3RhdGU7DQo+ICAgCWludCAgICBncmFwaGljczsNCj4gICAJaW50
ICAgIHNhdmVfZ3JhcGhpY3M7IC8qIGZvciBkZWJ1ZyBlbnRlci9sZWF2ZSAqLw0KPiAtCWlu
dCAgICBmbGFnczsNCj4gKwlib29sICAgaW5pdGlhbGl6ZWQ7DQoNClRoaXMgd2lsbCBhZGQg
MyBieXRlcyBvZiBwYWRkaW5nLiBNYXliZSB5b3UgY2FuIHB1dCB0aGUgYm9vbCBlbHNld2hl
cmUuDQoNCj4gICAJaW50ICAgIHJvdGF0ZTsNCj4gICAJaW50ICAgIGN1cl9yb3RhdGU7DQo+
ICAgCWNoYXIgICpjdXJzb3JfZGF0YTsNCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3Jh
cGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFu
eSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIg
MzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCg==


--------------ZuqnsJBSz9brMpRJ7r9KWedE--

--------------p38YX7IZ0Eb4SpD5Fdiu14aQ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmH5DXIFAwAAAAAACgkQlh/E3EQov+DM
xRAAxH0KevinZZlD+cEaLyw1UbwhP9162A/N4UqiBvmTzhj/xTTk78RzNeltsslkDhdIRiBi2IEF
DfV0GxGx8CgxRcajZOBDs2a0utAkQf8kLVYRufvmxI6K/nwzaLGyPgFcrFaLWF6gH3PbzfWIf6z/
AZswoedhr0vPl0cp6f2CedyH4ZXGhslyO7uuJgdB3rYMEQPnLKZeO7KbWuWjy8+Jo7hjHrfkiQsv
GIuMvlTS7hhvLIhTtTitR4E1IngqfV7anWG6WIS5sNOeWquxvMz/hTxcton1M6k48u/Trfb+eeyN
FMPzebRfYcOBaTbz1ac/mFMy/8DX+9FBA9zXyINeRfgfGD4hMfUUAkdj7P0coiDMY7SfatJKRiLK
zruMsGx9kGYsGxdIX3qCFsWIcaiHVpfMDOZc4riqccDhOb29RD0S/TdVdMhECPPTbyv8HfiO0N/0
K1CrcNULzV9dYiJkA8sEZC7hzBOeEHhYXGzdpPlQblYOnT2hIZnWCGK74sWDNky7rXrTG/7FzCnQ
/X2HlCM76x1LQ0vh6MfSLz9FkiFx+tvaUAZyjqmrT8ATP3iagWv4a/Yf1d0CULyrKY1D3CYpAMVB
nU/JETGsBBig35pIhA3V2Sct6X5kg9iEuaU3myrRc05TueL3Fj3OXgApsUgz9KOBkLFFSPL6n69H
4cI=
=geDa
-----END PGP SIGNATURE-----

--------------p38YX7IZ0Eb4SpD5Fdiu14aQ--
