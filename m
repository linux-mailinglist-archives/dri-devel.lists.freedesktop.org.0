Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5D787656B3
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jul 2023 17:03:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C157410E5BB;
	Thu, 27 Jul 2023 15:03:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FEEE10E5B3
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 15:03:38 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B0B1321A8D;
 Thu, 27 Jul 2023 15:03:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1690470216; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HtVKHpn6WN3hMRwTOaSK+eHyRHrVFLJIgpFMhXvcwPM=;
 b=Yox6lbedr9Qey1tFISOM2w2vdBnxQgALeGbIvW+BoTafCc4Y+tNZwRZVOENWUpGnOuBsKU
 3THg5Oe8X88AhgEXhHDpujupffWuuCWtu0zWGJ6Ia8ZRaF6t9hYdcJywgE0fL/TFS9e6Tb
 iOmMKDfELX6PIr/FbP4kRUXtpKSny6w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1690470216;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HtVKHpn6WN3hMRwTOaSK+eHyRHrVFLJIgpFMhXvcwPM=;
 b=w7uzixGnzD3BrDYdgW8Kl1VBvbJ6wVIEDo6nnQ6XF9ri6IrvjpeQBgAl50hIm6X3ILCZNh
 GsZvoACLAZE2XEAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8F19B13902;
 Thu, 27 Jul 2023 15:03:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id qpoJIkiHwmSVIAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 27 Jul 2023 15:03:36 +0000
Message-ID: <0ce32153-cfc0-e701-3863-803fcdb897ff@suse.de>
Date: Thu, 27 Jul 2023 17:03:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] drm/ssd130x: Use shadow-buffer helpers when managing
 plane's state
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org
References: <20230727140453.577445-1-javierm@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230727140453.577445-1-javierm@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------YvoX32TKqnUBuFI6oynwzo4l"
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
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------YvoX32TKqnUBuFI6oynwzo4l
Content-Type: multipart/mixed; boundary="------------2tTbaUHItKBowkIkmouYxoW0";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, Maxime Ripard <mripard@kernel.org>,
 dri-devel@lists.freedesktop.org
Message-ID: <0ce32153-cfc0-e701-3863-803fcdb897ff@suse.de>
Subject: Re: [PATCH] drm/ssd130x: Use shadow-buffer helpers when managing
 plane's state
References: <20230727140453.577445-1-javierm@redhat.com>
In-Reply-To: <20230727140453.577445-1-javierm@redhat.com>

--------------2tTbaUHItKBowkIkmouYxoW0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgSmF2aWVyDQoNCkFtIDI3LjA3LjIzIHVtIDE2OjA0IHNjaHJpZWIgSmF2aWVyIE1hcnRp
bmV6IENhbmlsbGFzOg0KPiBUaGUgY29tbWl0IDQ1YjU4NjY5ZTUzMiAoImRybS9zc2QxMzB4
OiBBbGxvY2F0ZSBidWZmZXIgaW4gdGhlIHBsYW5lJ3MNCj4gLmF0b21pY19jaGVjaygpIGNh
bGxiYWNrIikgbW92ZWQgdGhlIGJ1ZmZlcnMgYWxsb2NhdGlvbiB0byBiZSBkb25lIGluDQo+
IHRoZSBwcmltYXJ5IHBsYW5lJ3MgLmF0b21pY19jaGVjaygpIGNhbGxiYWNrLg0KPiANCj4g
QnV0IGl0IG1pc3NlZCB0aGF0IHNpbmNlIHRoZSBkcml2ZXIgdXNlcyBhIHNoYWRvdy1idWZm
ZXJlZCBwbGFuZSwgdGhlDQo+IF9fZHJtX2dlbV97cmVzZXQsZHVwbGljYXRlLGRlc3Ryb3l9
X3NoYWRvd19wbGFuZSgpIGhlbHBlciBmdW5jdGlvbnMNCj4gbXVzdCBiZSB1c2VkIGluIHRo
ZSBzdHJ1Y3QgZHJtX3BsYW5lX2Z1bmNzIGhhbmRsZXJzLg0KPiANCj4gVGhpcyB3YXMgbWlz
c2VkIGJlY2F1c2UgdGhlIG1lbnRpb25lZCBjb21taXQgZGlkIG5vdCByZW1vdmUgdGhlIG1h
Y3JvDQo+IERSTV9HRU1fU0hBRE9XX1BMQU5FX0ZVTkNTLCB3aGljaCBsZWFkcyB0byB0aGUg
Y3VzdG9tIHBsYW5lJ3MgYXRvbWljDQo+IHN0YXRlIG1hbmFnZW1lbnQgaGFuZGxlcnMgdG8g
bm90IGJlIHVzZWQuDQo+IA0KPiBGaXhlczogNDViNTg2NjllNTMyICgiZHJtL3NzZDEzMHg6
IEFsbG9jYXRlIGJ1ZmZlciBpbiB0aGUgcGxhbmUncyAuYXRvbWljX2NoZWNrKCkgY2FsbGJh
Y2siKQ0KPiBSZXBvcnRlZC1ieTogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4NCg0K
UmVwb3J0ZWQtYnkgbmVlZHMgdG8gYmUgZm9sbG93ZWQgYnkNCg0KQ2xvc2VzOiA8dXJsPg0K
DQp3aGVyZSA8dXJsPiB3b3VsZCBwb2ludCB0byBBcm5kJ3MgYnVnIHJlcG9ydCBvbiBkcmkt
ZGV2ZWwuDQoNCj4gU3VnZ2VzdGVkLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1h
bm5Ac3VzZS5kZT4NCj4gU2lnbmVkLW9mZi1ieTogSmF2aWVyIE1hcnRpbmV6IENhbmlsbGFz
IDxqYXZpZXJtQHJlZGhhdC5jb20+DQoNClRoaXMgbG9va3MgY29ycmVjdCBub3cuIFRoYW5r
cyBmb3IgZml4aW5nIHRoaXMgYnVnIHF1aWNrbHkuIFdpdGggdGhlIA0KQ2xvc2UgYWRkZWQ6
DQoNClJldmlld2VkLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5k
ZT4NCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KPiAtLS0NCj4gDQo+ICAgZHJpdmVycy9n
cHUvZHJtL3NvbG9tb24vc3NkMTMweC5jIHwgMTYgKysrKysrKysrLS0tLS0tLQ0KPiAgIDEg
ZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pDQo+IA0KPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3NvbG9tb24vc3NkMTMweC5jIGIvZHJpdmVy
cy9ncHUvZHJtL3NvbG9tb24vc3NkMTMweC5jDQo+IGluZGV4IGQyZjhkZDZhNjM0Ny4uOTcx
YzQyNTM0MGMxIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vc29sb21vbi9zc2Qx
MzB4LmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3NvbG9tb24vc3NkMTMweC5jDQo+IEBA
IC0xNDIsNyArMTQyLDcgQEAgY29uc3Qgc3RydWN0IHNzZDEzMHhfZGV2aWNlaW5mbyBzc2Qx
MzB4X3ZhcmlhbnRzW10gPSB7DQo+ICAgRVhQT1JUX1NZTUJPTF9OU19HUEwoc3NkMTMweF92
YXJpYW50cywgRFJNX1NTRDEzMFgpOw0KPiAgIA0KPiAgIHN0cnVjdCBzc2QxMzB4X3BsYW5l
X3N0YXRlIHsNCj4gLQlzdHJ1Y3QgZHJtX3BsYW5lX3N0YXRlIGJhc2U7DQo+ICsJc3RydWN0
IGRybV9zaGFkb3dfcGxhbmVfc3RhdGUgYmFzZTsNCj4gICAJLyogSW50ZXJtZWRpYXRlIGJ1
ZmZlciB0byBjb252ZXJ0IHBpeGVscyBmcm9tIFhSR0I4ODg4IHRvIEhXIGZvcm1hdCAqLw0K
PiAgIAl1OCAqYnVmZmVyOw0KPiAgIAkvKiBCdWZmZXIgdG8gc3RvcmUgcGl4ZWxzIGluIEhX
IGZvcm1hdCBhbmQgd3JpdHRlbiB0byB0aGUgcGFuZWwgKi8NCj4gQEAgLTE1MSw3ICsxNTEs
NyBAQCBzdHJ1Y3Qgc3NkMTMweF9wbGFuZV9zdGF0ZSB7DQo+ICAgDQo+ICAgc3RhdGljIGlu
bGluZSBzdHJ1Y3Qgc3NkMTMweF9wbGFuZV9zdGF0ZSAqdG9fc3NkMTMweF9wbGFuZV9zdGF0
ZShzdHJ1Y3QgZHJtX3BsYW5lX3N0YXRlICpzdGF0ZSkNCj4gICB7DQo+IC0JcmV0dXJuIGNv
bnRhaW5lcl9vZihzdGF0ZSwgc3RydWN0IHNzZDEzMHhfcGxhbmVfc3RhdGUsIGJhc2UpOw0K
PiArCXJldHVybiBjb250YWluZXJfb2Yoc3RhdGUsIHN0cnVjdCBzc2QxMzB4X3BsYW5lX3N0
YXRlLCBiYXNlLmJhc2UpOw0KPiAgIH0NCj4gICANCj4gICBzdGF0aWMgaW5saW5lIHN0cnVj
dCBzc2QxMzB4X2RldmljZSAqZHJtX3RvX3NzZDEzMHgoc3RydWN0IGRybV9kZXZpY2UgKmRy
bSkNCj4gQEAgLTY4OSwxMSArNjg5LDEyIEBAIHN0YXRpYyB2b2lkIHNzZDEzMHhfcHJpbWFy
eV9wbGFuZV9yZXNldChzdHJ1Y3QgZHJtX3BsYW5lICpwbGFuZSkNCj4gICAJaWYgKCFzc2Qx
MzB4X3N0YXRlKQ0KPiAgIAkJcmV0dXJuOw0KPiAgIA0KPiAtCV9fZHJtX2F0b21pY19oZWxw
ZXJfcGxhbmVfcmVzZXQocGxhbmUsICZzc2QxMzB4X3N0YXRlLT5iYXNlKTsNCj4gKwlfX2Ry
bV9nZW1fcmVzZXRfc2hhZG93X3BsYW5lKHBsYW5lLCAmc3NkMTMweF9zdGF0ZS0+YmFzZSk7
DQo+ICAgfQ0KPiAgIA0KPiAgIHN0YXRpYyBzdHJ1Y3QgZHJtX3BsYW5lX3N0YXRlICpzc2Qx
MzB4X3ByaW1hcnlfcGxhbmVfZHVwbGljYXRlX3N0YXRlKHN0cnVjdCBkcm1fcGxhbmUgKnBs
YW5lKQ0KPiAgIHsNCj4gKwlzdHJ1Y3QgZHJtX3NoYWRvd19wbGFuZV9zdGF0ZSAqbmV3X3No
YWRvd19wbGFuZV9zdGF0ZTsNCj4gICAJc3RydWN0IHNzZDEzMHhfcGxhbmVfc3RhdGUgKm9s
ZF9zc2QxMzB4X3N0YXRlOw0KPiAgIAlzdHJ1Y3Qgc3NkMTMweF9wbGFuZV9zdGF0ZSAqc3Nk
MTMweF9zdGF0ZTsNCj4gICANCj4gQEAgLTcwOSw5ICs3MTAsMTEgQEAgc3RhdGljIHN0cnVj
dCBkcm1fcGxhbmVfc3RhdGUgKnNzZDEzMHhfcHJpbWFyeV9wbGFuZV9kdXBsaWNhdGVfc3Rh
dGUoc3RydWN0IGRybV8NCj4gICAJc3NkMTMweF9zdGF0ZS0+YnVmZmVyID0gTlVMTDsNCj4g
ICAJc3NkMTMweF9zdGF0ZS0+ZGF0YV9hcnJheSA9IE5VTEw7DQo+ICAgDQo+IC0JX19kcm1f
YXRvbWljX2hlbHBlcl9wbGFuZV9kdXBsaWNhdGVfc3RhdGUocGxhbmUsICZzc2QxMzB4X3N0
YXRlLT5iYXNlKTsNCj4gKwluZXdfc2hhZG93X3BsYW5lX3N0YXRlID0gJnNzZDEzMHhfc3Rh
dGUtPmJhc2U7DQo+ICAgDQo+IC0JcmV0dXJuICZzc2QxMzB4X3N0YXRlLT5iYXNlOw0KPiAr
CSBfX2RybV9nZW1fZHVwbGljYXRlX3NoYWRvd19wbGFuZV9zdGF0ZShwbGFuZSwgbmV3X3No
YWRvd19wbGFuZV9zdGF0ZSk7DQo+ICsNCj4gKwlyZXR1cm4gJm5ld19zaGFkb3dfcGxhbmVf
c3RhdGUtPmJhc2U7DQo+ICAgfQ0KPiAgIA0KPiAgIHN0YXRpYyB2b2lkIHNzZDEzMHhfcHJp
bWFyeV9wbGFuZV9kZXN0cm95X3N0YXRlKHN0cnVjdCBkcm1fcGxhbmUgKnBsYW5lLA0KPiBA
QCAtNzIyLDcgKzcyNSw3IEBAIHN0YXRpYyB2b2lkIHNzZDEzMHhfcHJpbWFyeV9wbGFuZV9k
ZXN0cm95X3N0YXRlKHN0cnVjdCBkcm1fcGxhbmUgKnBsYW5lLA0KPiAgIAlrZnJlZShzc2Qx
MzB4X3N0YXRlLT5kYXRhX2FycmF5KTsNCj4gICAJa2ZyZWUoc3NkMTMweF9zdGF0ZS0+YnVm
ZmVyKTsNCj4gICANCj4gLQlfX2RybV9hdG9taWNfaGVscGVyX3BsYW5lX2Rlc3Ryb3lfc3Rh
dGUoJnNzZDEzMHhfc3RhdGUtPmJhc2UpOw0KPiArCV9fZHJtX2dlbV9kZXN0cm95X3NoYWRv
d19wbGFuZV9zdGF0ZSgmc3NkMTMweF9zdGF0ZS0+YmFzZSk7DQo+ICAgDQo+ICAgCWtmcmVl
KHNzZDEzMHhfc3RhdGUpOw0KPiAgIH0NCj4gQEAgLTc0MSw3ICs3NDQsNiBAQCBzdGF0aWMg
Y29uc3Qgc3RydWN0IGRybV9wbGFuZV9mdW5jcyBzc2QxMzB4X3ByaW1hcnlfcGxhbmVfZnVu
Y3MgPSB7DQo+ICAgCS5hdG9taWNfZHVwbGljYXRlX3N0YXRlID0gc3NkMTMweF9wcmltYXJ5
X3BsYW5lX2R1cGxpY2F0ZV9zdGF0ZSwNCj4gICAJLmF0b21pY19kZXN0cm95X3N0YXRlID0g
c3NkMTMweF9wcmltYXJ5X3BsYW5lX2Rlc3Ryb3lfc3RhdGUsDQo+ICAgCS5kZXN0cm95ID0g
ZHJtX3BsYW5lX2NsZWFudXAsDQo+IC0JRFJNX0dFTV9TSEFET1dfUExBTkVfRlVOQ1MsDQo+
ICAgfTsNCj4gICANCj4gICBzdGF0aWMgZW51bSBkcm1fbW9kZV9zdGF0dXMgc3NkMTMweF9j
cnRjX2hlbHBlcl9tb2RlX3ZhbGlkKHN0cnVjdCBkcm1fY3J0YyAqY3J0YywNCg0KLS0gDQpU
aG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0
d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpGcmFua2Vuc3RyYXNzZSAxNDYsIDkwNDYx
IE51ZXJuYmVyZywgR2VybWFueQ0KR0Y6IEl2byBUb3RldiwgQW5kcmV3IE15ZXJzLCBBbmRy
ZXcgTWNEb25hbGQsIEJvdWRpZW4gTW9lcm1hbg0KSFJCIDM2ODA5IChBRyBOdWVybmJlcmcp
DQo=

--------------2tTbaUHItKBowkIkmouYxoW0--

--------------YvoX32TKqnUBuFI6oynwzo4l
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmTCh0cFAwAAAAAACgkQlh/E3EQov+BR
TA//RjFVfd5lpyXkMoOlsyHQCs14O4GUl0iVPGxrnXJ/tiD1oC9QvxzCYx6RktCy91cGkEsbd5uO
ySvMD2XcX/QBcbpEBP51tdFz2IJ9XyWfXVpHLqwNaa5u+kmQj3UxyPhSqp6QqsCadYUPRL+pE3KY
4kZYTPARobYqUw8jkZXcSLAweKsF5QorMxdnnV6Pj/PIcztM1XrLQ6ZISCb+S59EeT1q8j5jnEIb
M+kJFwfRdxl2OiJeQSJoZjv4ZvnS0yw3thZZyy/OeyqIpKvkrpV8IxQPEkSMkf0g1tH8ruUR8l/0
H9vwO3wVfsJlFDoNCre1MemCHP77e35A9n0DgSNIVKwLmSPQBTZJS6pEfoTk78HlNquPGmN4/boW
pd3RImgSkrujInr3yCo88a7q8x8Dz802e9595cO/pr7AbbhS7MHkbtUEZo1tGU003EOaTBshefYQ
H1Xq2yKuIDONTt/skXaQ0r4b/wQKK44GEhfSwLVWezUxCCuO5h2ePP0lDSwFEo/G8a7k4jhThreo
Uf9f43+/5AFWhVoD1Kft+GeQMVSh0bBg9x9DqxRR8DBm/6xkCjjFcc4jxYmwcyMr90xi/cGWY6hJ
hbC+vjEAv4T+eNBGWFnho4N58myNL2sN7U0rdtzoi7umuUeMtvR+zRrXX3f0qZw00rXUz08hcwoX
N28=
=egm6
-----END PGP SIGNATURE-----

--------------YvoX32TKqnUBuFI6oynwzo4l--
