Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD7567919D1
	for <lists+dri-devel@lfdr.de>; Mon,  4 Sep 2023 16:39:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9367C10E13A;
	Mon,  4 Sep 2023 14:39:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A872010E13A
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Sep 2023 14:39:49 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 622EC21858;
 Mon,  4 Sep 2023 14:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1693838388; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sJSCniwowIBdxCnGCeV30HlMeuNSsKb4LI/CNJcrPTo=;
 b=zauq3QQpuS9s43Xy0nHfiVYiZXWLgrz+ovDaQ/x1qcuT/BqjRKZjOU5T+98DRp0EUhWzYV
 J3cw1TOYU5S0CSuI153gE1uso2CkkPZgdsp5z9IDVgLR5u3PWSrbQtqlpCUynNnG6/rmEc
 ncQnPIkSr/4LMsdRiTsmemXtI5C3InE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1693838388;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sJSCniwowIBdxCnGCeV30HlMeuNSsKb4LI/CNJcrPTo=;
 b=O/RMfNATrMDS4+bkOSqeT5tmorYdWxB+G7dlCE282jHW8qhcWwuGJkuPoFGdmRq+NHj9kS
 VV+w5Zkitm5GfACA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2B98A13425;
 Mon,  4 Sep 2023 14:39:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id eGHECTTs9WSLNAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 04 Sep 2023 14:39:48 +0000
Message-ID: <b9b985e7-4f60-7c59-3121-b26b07b13b03@suse.de>
Date: Mon, 4 Sep 2023 16:39:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 1/8] fbdev/smscufx: Use fb_ops helpers for deferred I/O
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>, deller@gmx.de,
 daniel@ffwll.ch, sam@ravnborg.org
References: <20230828132131.29295-1-tzimmermann@suse.de>
 <20230828132131.29295-2-tzimmermann@suse.de>
 <877cp66qmp.fsf@minerva.mail-host-address-is-not-set>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <877cp66qmp.fsf@minerva.mail-host-address-is-not-set>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------cXE055oJU0rZjtgnL3Gx5lFo"
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
Cc: Steve Glendinning <steve.glendinning@shawell.net>,
 linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-hyperv@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-input@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------cXE055oJU0rZjtgnL3Gx5lFo
Content-Type: multipart/mixed; boundary="------------ZcrhN05QyR790ZNGxuBfzWJi";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>, deller@gmx.de,
 daniel@ffwll.ch, sam@ravnborg.org
Cc: Steve Glendinning <steve.glendinning@shawell.net>,
 linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-hyperv@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-input@vger.kernel.org
Message-ID: <b9b985e7-4f60-7c59-3121-b26b07b13b03@suse.de>
Subject: Re: [PATCH 1/8] fbdev/smscufx: Use fb_ops helpers for deferred I/O
References: <20230828132131.29295-1-tzimmermann@suse.de>
 <20230828132131.29295-2-tzimmermann@suse.de>
 <877cp66qmp.fsf@minerva.mail-host-address-is-not-set>
In-Reply-To: <877cp66qmp.fsf@minerva.mail-host-address-is-not-set>

--------------ZcrhN05QyR790ZNGxuBfzWJi
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgSmF2aWVyDQoNCkFtIDA0LjA5LjIzIHVtIDE0OjU5IHNjaHJpZWIgSmF2aWVyIE1hcnRp
bmV6IENhbmlsbGFzOg0KPiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5k
ZT4gd3JpdGVzOg0KPiANCj4gSGVsbG8gVGhvbWFzLA0KPiANCj4+IEdlbmVyYXRlIGNhbGxi
YWNrIGZ1bmN0aW9ucyBmb3Igc3RydWN0IGZiX29wcyB3aXRoIHRoZSBmYmRldiBtYWNybw0K
Pj4gRkJfR0VOX0RFRkFVTFRfREVGRVJSRURfU1lTTUVNX09QUygpLiBJbml0aWFsaXplIHN0
cnVjdCBmYl9vcHMgdG8NCj4+IHRoZSBnZW5lcmF0ZWQgZnVuY3Rpb25zIHdpdGggZmJkZXYg
aW5pdGlhbGl6ZXIgbWFjcm9zLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBaaW1t
ZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPg0KPj4gQ2M6IFN0ZXZlIEdsZW5kaW5uaW5n
IDxzdGV2ZS5nbGVuZGlubmluZ0BzaGF3ZWxsLm5ldD4NCj4+IC0tLQ0KPiANCj4gVGhlIHBh
dGNoIGxvb2tzIGdvb2QgdG8gbWUsIGJ1dCBJJ3ZlIGEgcXVlc3Rpb24gYmVsb3cuDQo+IA0K
PiBBY2tlZC1ieTogSmF2aWVyIE1hcnRpbmV6IENhbmlsbGFzIDxqYXZpZXJtQHJlZGhhdC5j
b20+DQo+IA0KPj4gICBkcml2ZXJzL3ZpZGVvL2ZiZGV2L3Ntc2N1ZnguYyB8IDg1ICsrKysr
KysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+PiAgIDEgZmlsZSBjaGFuZ2VkLCAy
MiBpbnNlcnRpb25zKCspLCA2MyBkZWxldGlvbnMoLSkNCj4+DQo+PiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy92aWRlby9mYmRldi9zbXNjdWZ4LmMgYi9kcml2ZXJzL3ZpZGVvL2ZiZGV2L3Nt
c2N1ZnguYw0KPiANCj4gWy4uLl0NCj4gDQo+PiAgIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZmJf
b3BzIHVmeF9vcHMgPSB7DQo+PiAgIAkub3duZXIgPSBUSElTX01PRFVMRSwNCj4+IC0JLmZi
X3JlYWQgPSBmYl9zeXNfcmVhZCwNCj4+IC0JLmZiX3dyaXRlID0gdWZ4X29wc193cml0ZSwN
Cj4+ICsJX19GQl9ERUZBVUxUX0RFRkVSUkVEX09QU19SRFdSKHVmeF9vcHMpLA0KPj4gICAJ
LmZiX3NldGNvbHJlZyA9IHVmeF9vcHNfc2V0Y29scmVnLA0KPj4gLQkuZmJfZmlsbHJlY3Qg
PSB1Znhfb3BzX2ZpbGxyZWN0LA0KPj4gLQkuZmJfY29weWFyZWEgPSB1Znhfb3BzX2NvcHlh
cmVhLA0KPj4gLQkuZmJfaW1hZ2VibGl0ID0gdWZ4X29wc19pbWFnZWJsaXQsDQo+PiArCV9f
RkJfREVGQVVMVF9ERUZFUlJFRF9PUFNfRFJBVyh1Znhfb3BzKSwNCj4+ICAgCS5mYl9tbWFw
ID0gdWZ4X29wc19tbWFwLA0KPiANCj4gVGhlcmUgYXJlIG5vIGdlbmVyYXRlZCBmdW5jdGlv
bnMgZm9yIC5mYl9tbWFwLCBJIHdvbmRlciB3aGF0J3MgdGhlIHZhbHVlDQo+IG9mIF9fRkJf
REVGQVVMVF9ERUZFUlJFRF9PUFNfTU1BUCgpID8gTWF5YmUganVzdCByZW1vdmluZyB0aGF0
IG1hY3JvIGFuZA0KPiBzZXR0aW5nIC5mYl9tbWFwID0gZmJfZGVmZXJyZWRfaW9fbW1hcCBp
bnN0ZWFkIGlmIHRoZXJlJ3Mgbm8gY3VzdG9tIG1tYXANCj4gaGFuZGxlciB3b3VsZCBiZSBl
YXNpZXIgdG8gcmVhZCA/DQoNCkF0IGxlYXN0IHR3byBkcml2ZXJzIGNvdWxkIHVzZSBfX0ZC
X0RFRkFVTFRfREVGRVJSRURfT1BTX01NQVA6IA0KcGljb2xjZC1mYiBhbmQgaHlwZXJ2X2Zi
LiBBdCBzb21lIHBvaW50LCB3ZSBtaWdodCB3YW50IHRvIHNldC9jbGVhciANCmZiX21tYXAg
ZGVwZW5kaW5nIG9uIHNvbWUgS2NvbmZpZyB2YWx1ZS4gSGF2aW5nIA0KX19GQl9ERUZBVUxU
X0RFRkVSUkVEX09QU19NTUFQIG1pZ2h0IGJlIGhlbHBmdWwgdGhlbi4NCg0KPiANCj4gQWx0
ZXJuYXRpdmVseSwgX19GQl9ERUZBVUxUX0RFRkVSUkVEX09QU19NTUFQKCkgY291bGQgc3Rp
bGwgYmUgbGVmdCBidXQNCj4gbm90IHRha2luZyBhIF9fcHJlZml4IGFyZ3VtZW50IHNpbmNl
IHRoYXQgaXMgbm90IHVzZWQgYW55d2F5cyA/DQoNClRoZSBkcml2ZXIgb3B0aW9uYWxseSBw
cm92aWRlcyBtbWFwIHdpdGhvdXQgZGVmZXJyZWQgSS9PLCBoZW5jZSB0aGUgbW1hcCANCmZ1
bmN0aW9uLiBUaGF0IG1ha2VzIG5vIHNlbnNlLCBhcyB0aGVzZSB3cml0ZXMgdG8gdGhlIGJ1
ZmZlciB3b3VsZCBuZXZlciANCm1ha2UgaXQgdG8gdGhlIGRldmljZSBtZW1vcnkuIEJ1dCBJ
IGRpZG4ndCB3YW50IHRvIHJlbW92ZSB0aGUgY29kZSANCmVpdGhlci4gU28gSSBqdXN0IGxl
ZnQgdGhlIGV4aXN0aW5nIGZ1bmN0aW9uIGFzLWlzLiBVc3VhbGx5LCB0aGUgDQpkZWZlcnJl
ZC1JL08gbW1hcCBpcyBjYWxsZWQgaW1tZWRpYXRlbHkuIFsxXQ0KDQpCZXN0IHJlZ2FyZHMN
ClRob21hcw0KDQpbMV0gDQpodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC92Ni41
LjEvc291cmNlL2RyaXZlcnMvdmlkZW8vZmJkZXYvc21zY3VmeC5jI0w3ODQNCg0KPiANCg0K
LS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VT
RSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpGcmFua2Vuc3RyYXNzZSAxNDYs
IDkwNDYxIE51ZXJuYmVyZywgR2VybWFueQ0KR0Y6IEl2byBUb3RldiwgQW5kcmV3IE15ZXJz
LCBBbmRyZXcgTWNEb25hbGQsIEJvdWRpZW4gTW9lcm1hbg0KSFJCIDM2ODA5IChBRyBOdWVy
bmJlcmcpDQo=

--------------ZcrhN05QyR790ZNGxuBfzWJi--

--------------cXE055oJU0rZjtgnL3Gx5lFo
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmT17DMFAwAAAAAACgkQlh/E3EQov+BS
Ig//RlJXd5fN6IaTPiawQb6Fd3jYLJWOZc4F/efpICMaVZrflUXT5T+CnP+4s0V01lW+95F5TmwC
x6dSfKcXNnK0YOdh/dD/IzHspipeMq9oc5DMZ81ar/4HyzrIWW+0SR/jkcBI09Unia57P1vR58ho
hRyYtdbsLx0UdiDz9DCRfpdotEMwfGnLWTIO0ScFbM7qO0u3e0W5uPfS8v0tyMYQklx5DjDggwYl
5BI0AxgoRW7D/mhM7F1tN0ux9f0LRgezeYZxEOAi0h/TEhTvwFrcnPt1OKYJEsONi36Z1qDeZ3QN
lcJBzEr40GCmo9QL8AEu635ULL7lbLfcyWeMyAuSm/l60FRUS6q4FPO01T+ukHJKvXQDi9F4h8JJ
er+Tey9b3/k75OIEz/gZ7hUmcTy+StJqPYtzEGddUfKZECqz2uyKK+p1qRhOohOW9hgpLS25565Q
iHPOMR4U5dvLAVb+HUSGlFFYtyxz7yZDVrLKAb8bbRWDCo7Radt6EYUxFgFbUDb7HnKvy62yzgqb
dq1YJQeRQ031r7L95YAvLpDzbtQ4G7cogNHGjeym44LI1h6LXaOVaifefpUKlleHxv2jvWh3JjLK
yoJWWCWkdFtSivqwUtNwPz5aYvEcEcCMzpqAfOPvvwVHEzkkIwwEUCmuQ2kLpa82ILeXfIJzFP9d
T5Y=
=sRKk
-----END PGP SIGNATURE-----

--------------cXE055oJU0rZjtgnL3Gx5lFo--
