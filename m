Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58CC5519DA6
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 13:08:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D11810E0AB;
	Wed,  4 May 2022 11:08:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C442710E0AB
 for <dri-devel@lists.freedesktop.org>; Wed,  4 May 2022 11:08:45 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 71DCB210EB;
 Wed,  4 May 2022 11:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1651662524; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yGux/NDVJ5qImFxzSCAdzpn2rPw4/jEzHA5wE0M6XQ8=;
 b=gXfhhXWXLutgJ+SPFRn80E1EsAKGZE70AMNZAterEg4/ANuZvPHLkohkPl/8vwZo7iR8Nu
 /8++1CInI0DhQelcmilS4iRor773tKGYfC5tWspW7/XsXskzYBuOqqq5B9kEUNXeyRMDCn
 8hZDagJEuTiEYJAiNH7x47Wf75D5uII=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1651662524;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yGux/NDVJ5qImFxzSCAdzpn2rPw4/jEzHA5wE0M6XQ8=;
 b=PK/I9Y8HxmQfVnYUScgH+oE7Ak/A6cBnzp2wItDHWLsgwraP4Ipg+oXjB6Ej/vufbZJvdQ
 +Kqph0KvWq/rPlAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4AA0E132C4;
 Wed,  4 May 2022 11:08:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id hgBrEbxecmIFNwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 04 May 2022 11:08:44 +0000
Message-ID: <d47a3cab-4f21-3b8b-2834-030663677070@suse.de>
Date: Wed, 4 May 2022 13:08:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2] fbdev: Use helper to get fb_info in all file operations
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
 Junxiao Chang <junxiao.chang@intel.com>, dri-devel@lists.freedesktop.org,
 Maxime Ripard <maxime@cerno.tech>, Sam Ravnborg <sam@ravnborg.org>
References: <20220503201934.681276-1-javierm@redhat.com>
 <YnJBGpvlViLV+0/a@phenom.ffwll.local>
 <038f8365-b23b-9d81-f7b2-8f8c6eb3a065@redhat.com>
 <YnJbvb5TlHs4ckPM@phenom.ffwll.local>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <YnJbvb5TlHs4ckPM@phenom.ffwll.local>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------SemERBSZaWaNoPn20igjAYtJ"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------SemERBSZaWaNoPn20igjAYtJ
Content-Type: multipart/mixed; boundary="------------XyJXHb9zTGLtwU7EOaFzfZXZ";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
 Junxiao Chang <junxiao.chang@intel.com>, dri-devel@lists.freedesktop.org,
 Maxime Ripard <maxime@cerno.tech>, Sam Ravnborg <sam@ravnborg.org>
Message-ID: <d47a3cab-4f21-3b8b-2834-030663677070@suse.de>
Subject: Re: [PATCH v2] fbdev: Use helper to get fb_info in all file
 operations
References: <20220503201934.681276-1-javierm@redhat.com>
 <YnJBGpvlViLV+0/a@phenom.ffwll.local>
 <038f8365-b23b-9d81-f7b2-8f8c6eb3a065@redhat.com>
 <YnJbvb5TlHs4ckPM@phenom.ffwll.local>
In-Reply-To: <YnJbvb5TlHs4ckPM@phenom.ffwll.local>

--------------XyJXHb9zTGLtwU7EOaFzfZXZ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDQuMDUuMjIgdW0gMTI6NTUgc2NocmllYiBEYW5pZWwgVmV0dGVyOg0KPiBP
biBXZWQsIE1heSAwNCwgMjAyMiBhdCAxMToyODowN0FNICswMjAwLCBKYXZpZXIgTWFydGlu
ZXogQ2FuaWxsYXMgd3JvdGU6DQo+PiBIZWxsbyBEYW5pZWwsDQo+Pg0KPj4gT24gNS80LzIy
IDExOjAyLCBEYW5pZWwgVmV0dGVyIHdyb3RlOg0KPj4+IE9uIFR1ZSwgTWF5IDAzLCAyMDIy
IGF0IDEwOjE5OjM0UE0gKzAyMDAsIEphdmllciBNYXJ0aW5leiBDYW5pbGxhcyB3cm90ZToN
Cj4+Pj4gQSByZWZlcmVuY2UgdG8gdGhlIGZyYW1lYnVmZmVyIGRldmljZSBzdHJ1Y3QgZmJf
aW5mbyBpcyBzdG9yZWQgaW4gdGhlIGZpbGUNCj4+Pj4gcHJpdmF0ZSBkYXRhLCBidXQgdGhp
cyByZWZlcmVuY2UgY291bGQgbm8gbG9uZ2VyIGJlIHZhbGlkIGFuZCBtdXN0IG5vdCBiZQ0K
Pj4+PiBhY2Nlc3NlZCBkaXJlY3RseS4gSW5zdGVhZCwgdGhlIGZpbGVfZmJfaW5mbygpIGFj
Y2Vzc29yIGZ1bmN0aW9uIG11c3QgYmUNCj4+Pj4gdXNlZCBzaW5jZSBpdCBkb2VzIHNhbml0
eSBjaGVja2luZyB0byBtYWtlIHN1cmUgdGhhdCB0aGUgZmJfaW5mbyBpcyB2YWxpZC4NCj4+
Pj4NCj4+Pj4gVGhpcyBjYW4gaGFwcGVuIGZvciBleGFtcGxlIGlmIHRoZSByZWdpc3RlcmVk
IGZyYW1lYnVmZmVyIGRldmljZSBpcyBmb3IgYQ0KPj4+PiBkcml2ZXIgdGhhdCBqdXN0IHVz
ZXMgYSBmcmFtZWJ1ZmZlciBwcm92aWRlZCBieSB0aGUgc3lzdGVtIGZpcm13YXJlLiBJbg0K
Pj4+PiB0aGF0IGNhc2UsIHRoZSBmYmRldiBjb3JlIHdvdWxkIHVucmVnaXN0ZXIgdGhlIGZy
YW1lYnVmZmVyIGRldmljZSB3aGVuIGENCj4+Pj4gcmVhbCB2aWRlbyBkcml2ZXIgaXMgcHJv
YmVkIGFuZCBhc2sgdG8gcmVtb3ZlIGNvbmZsaWN0aW5nIGZyYW1lYnVmZmVycy4NCj4+Pj4N
Cj4+Pj4gTW9zdCBmYmRldiBmaWxlIG9wZXJhdGlvbnMgYWxyZWFkeSB1c2UgdGhlIGhlbHBl
ciB0byBnZXQgdGhlIGZiX2luZm8gYnV0DQo+Pj4+IGdldF9mYl91bm1hcHBlZF9hcmVhKCkg
YW5kIGZiX2RlZmVycmVkX2lvX2ZzeW5jKCkgZG9uJ3QuIEZpeCB0aG9zZSB0d28uDQo+Pj4+
DQo+Pj4+IFNpbmNlIGZiX2RlZmVycmVkX2lvX2ZzeW5jKCkgaXMgbm90IGluIGZibWVtLm8s
IHRoZSBoZWxwZXIgaGFzIHRvIGJlDQo+Pj4+IGV4cG9ydGVkLiBSZW5hbWUgaXQgYW5kIGFk
ZCBhIGZiXyBwcmVmaXggdG8gZGVub3RlIHRoYXQgaXMgcHVibGljIG5vdy4NCj4+Pj4NCj4+
Pj4gUmVwb3J0ZWQtYnk6IEp1bnhpYW8gQ2hhbmcgPGp1bnhpYW8uY2hhbmdAaW50ZWwuY29t
Pg0KPj4+PiBTaWduZWQtb2ZmLWJ5OiBKYXZpZXIgTWFydGluZXogQ2FuaWxsYXMgPGphdmll
cm1AcmVkaGF0LmNvbT4NCj4+Pg0KPj4+IE5vdGUgdGhhdCBmYl9maWxlX2luZm8gaXMgaGls
YXJpb3VzbHkgcmFjeSBzaW5jZSB0aGVyZSdzIG5vdGhpbmcNCj4+PiBwcmV2ZW50aW5nIGEg
Y29uY3VycmVuY3QgZnJhbWVidWZmZXJfdW5yZWdpc3Rlci4gT3IgYXQgbGVhc3QgSSdtIG5v
dA0KPj4+IHNlZWluZyBhbnl0aGluZy4gU2VlIGNmNGEzYWU0ZWYzMyAoImZiZGV2OiBsb2Nr
X2ZiX2luZm8gY2Fubm90IGZhaWwiKSBmb3INCj4+PiBjb250ZXh0LCBtYXliZSByZWZlcmVu
Y2UgdGhhdCBjb21taXQgaGVyZSBpbiB5b3VyIHBhdGNoLg0KPj4+DQo+Pj4gRWl0aGVyIHdh
eSB0aGlzIGRvZXNuJ3QgcmVhbGx5IG1ha2UgYW55dGhpbmcgd29yc2UsIHNvDQo+Pj4gQWNr
ZWQtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+DQo+Pj4NCj4+
DQo+PiBZZXMsIEkgbm90aWNlZCBpcyByYWN5IGJ1dCBhdCBsZWFzdCBjaGVja2luZyB0aGlz
IG1ha2VzIGxlc3MgbGlrZWx5IHRvDQo+PiBvY2N1ci4gQW5kIHRoYW5rcywgSSdsbCByZWZl
cmVuY2UgdGhhdCBjb21taXQgaW4gdGhlIGRlc2NyaXB0aW9uIG9mIHYzLg0KPj4NCj4+IEJU
VywgSSBhbHNvIG5vdGljZWQgdGhhdCB0aGUgc2FtZSByYWNlIHRoYXQgaGFwcGVucyB3aXRo
IG9wZW4oKSxyZWFkKCksDQo+PiBjbG9zZSgpLCBldGMgaGFwcGVucyB3aXRoIHRoZSBWTSBv
cGVyYXRpb25zOg0KPj4NCj4+IGludCBmYl9kZWZlcnJlZF9pb19tbWFwKHN0cnVjdCBmYl9p
bmZvICppbmZvLCBzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSkNCj4+IHsNCj4+IC4uLg0K
Pj4gCXZtYS0+dm1fcHJpdmF0ZV9kYXRhID0gaW5mbzsNCj4+IC4uLg0KPj4gfQ0KPj4NCj4+
IHN0YXRpYyB2bV9mYXVsdF90IGZiX2RlZmVycmVkX2lvX2ZhdWx0KHN0cnVjdCB2bV9mYXVs
dCAqdm1mKQ0KPj4gew0KPj4gLi4uDQo+PiAJc3RydWN0IGZiX2luZm8gKmluZm8gPSB2bWYt
PnZtYS0+dm1fcHJpdmF0ZV9kYXRhOw0KPj4gLi4uDQo+PiB9DQo+Pg0KPj4gc3RhdGljIHZt
X2ZhdWx0X3QgZmJfZGVmZXJyZWRfaW9fbWt3cml0ZShzdHJ1Y3Qgdm1fZmF1bHQgKnZtZikN
Cj4+IHsNCj4+IC4uLg0KPj4gCXN0cnVjdCBmYl9pbmZvICppbmZvID0gdm1mLT52bWEtPnZt
X3ByaXZhdGVfZGF0YTsNCj4+IC4uLg0KPj4gfQ0KPj4NCj4+IFNvIHNvbWV0aGluZyBzaW1p
bGFyIHRvIGZiX2ZpbGVfZmJfaW5mbygpIGlzIG5lZWRlZCB0byBjaGVjayBpZg0KPj4gdGhl
IHZtX3ByaXZhdGVfZGF0YSBpcyBzdGlsbCB2YWxpZC4gSSBndWVzcyB0aGF0IGNvdWxkIGJl
IGRvbmUNCj4+IGJ5IHVzaW5nIHRoZSB2bWYtPnZtYS0+dm1fZmlsZSBhbmQgYXR0ZW1wdGlu
ZyB0aGUgc2FtZSB0cmljayB0aGF0DQo+PiBmYl9maWxlX2ZiX2luZm8oKSBkb2VzID8NCj4g
DQo+IFllYWggc2hvdWxkIHdvcmssIGV4Y2VwdCBpZiB0aGUgcHRlcyBhcmUgc2V0IHVwIGFs
cmVhZHkgdGhlcmUncyBraW5kYSBub3QNCj4gbXVjaCB0aGF0IHRoaXMgd2lsbCBwcmV2ZW50
LiBXZSdkIG5lZWQgdG8gdGVhciBkb3duIG1hcHBpbmdzIGFuZCBTSUdCVVMgb3INCj4gYWx0
ZXJuYXRpdmVseSBoYXZlIHNvbWV0aGluZyBlbHNlIGluIHBsYWNlIHRoZXJlIHNvIHVzZXJz
cGFjZSBkb2Vzbid0IGJsb3cNCj4gdXAgaW4gZnVubnkgd2F5cyAod2hpY2ggaXMgd2hhdCB3
ZSdyZSBkb2luZyBvbiB0aGUgZHJtIHNpZGUsIG9yIGF0IGxlYXN0DQo+IHRyeWluZyB0byku
DQo+IA0KPiBJJ20gYWxzbyBub3Qgc3VyZSBob3cgbXVjaCB3ZSBzaG91bGQgY2FyZSwgc2lu
Y2UgaWRlYWxseSBmb3IgZHJtIGRyaXZlcnMNCj4gdGhpcyBpcyBhbGwgdGFrZW4gY2FyZSBv
ZiBieSBkcm1fZGV2X2VudGVyIGluIHRoZSByaWdodCBwbGFjZXMuIEl0IGRvZXMNCj4gbWVh
biB0aG91Z2ggdGhhdCBmYmRldiBtbWFwIGVpdGhlciBuZWVkcyB0byBoYXZlIGl0J3Mgb3du
IG1lbW9yeSBvciBiZQ0KPiBmdWxseSByZWRpcmVjdGVkIHRvIHRoZSBkcm0gZ2VtIG1tYXAu
DQo+IA0KPiBBbmQgdGhlbiB3ZSBjYW4gYWZmb3JkIHRvIGp1c3Qgbm90IGNhcmUgdG8gZml4
IGZiZGV2IGl0c2VsZi4NCg0KV2hpbGUgdGhlIHByb2JsZW0gaGFzIGJlZW4gdGhlcmUgZXZl
ciBzaW5jZSwgdGhlIGJ1ZyBkaWRuJ3QgaGFwcGVuIHVudGlsIA0Kd2UgZml4ZWQgaG90LXVu
cGx1Z2dpbmcgZm9yIGZiZGV2LiBOb3QgZG9pbmcgYW55dGhpbmcgaXMgcHJvYmFibHkgbm90
IA0KdGhlIHJpZ2h0IHRoaW5nLg0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQo+IC1EYW5p
ZWwNCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Bl
cg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1
LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykN
Ckdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCg==

--------------XyJXHb9zTGLtwU7EOaFzfZXZ--

--------------SemERBSZaWaNoPn20igjAYtJ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmJyXrsFAwAAAAAACgkQlh/E3EQov+CE
gA/+KaO0/CRHklPoLCTpG7I/88o5n2jJ0/VWCBPo/76v7jn8U9bqGYU1hO50wp8P2WRRD08A62qv
jIBqk42zFZnm/k7CzBZA0w1BYxQBpwvQ4CgLTJvNARvZrF1lAJ3FbsXTzst53fK3SFVD4rBkvTUE
B+UpMlVqsFF7bpneRYJT0CBVe73ZopAcWZho/9hezWP2R3EEVGC3wqOqBZ54z0A46vbNFy2hT84c
gXFUboorptBfA/b88fkQywxYx1+DOuC/iURklxmyO50MU9fnIZVE7K8munYjPIPXZ/300JD/xSNV
f05S/HWMewoyy5ama8Pn8woZEEseUXl38d4S19QWmJI4HK/68c5iDAjO5ffg1dPbLXAOqQBVOpMy
tryDdYu9entOpbD3IR/tIR3+1L7kCyDST94hOLveErnmj0TNV5CQ26JEjZq1e1UCiNiLj25pLD+c
eKjCSAPFKhueg/jKHvLveE+PKvPh4fqgmXM6LM4KeA9ci1/fbjNTa9VudM3EdPIJE5owbOMUyU4Y
mjBKbUEFtD5JTQPHEhsPCpVKpO7x7UJ52oThTOfrgsylDpR3XXc6OMtGARiiHUk+5wWTtW2qCskd
hmXoXCsrP+xKh3N7gG7G4C7pQXTuasZfy0NqwsL3M1RrVWbbn1Pp+Mi6VPyWgvxAjI4x/NPGF2eH
+DU=
=11L/
-----END PGP SIGNATURE-----

--------------SemERBSZaWaNoPn20igjAYtJ--
