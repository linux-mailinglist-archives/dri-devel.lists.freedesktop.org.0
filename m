Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB3C8529F18
	for <lists+dri-devel@lfdr.de>; Tue, 17 May 2022 12:14:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE85C113020;
	Tue, 17 May 2022 10:14:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EB08113020
 for <dri-devel@lists.freedesktop.org>; Tue, 17 May 2022 10:14:09 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A07D121D3A;
 Tue, 17 May 2022 10:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1652782446; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PtgIK/WXLURXNK4FrQAMVEGgXxyq5asgvTYPdrz4/7k=;
 b=ekTbMV5KFWBIeHqwjK3ExJlzYyRAST0bw1MkX+mxVtJ91xaIrc5Csh0kK1iCwJYtIFC8gG
 kLriYwkDOe26PXQE7wKpLiwHx3eRzNAu92aoS4NVKKJbUoTOLENEVg/15STfXJTzCPEoX/
 ih/ij2qSbDyo7hn729DZzz314WG5xak=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1652782446;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PtgIK/WXLURXNK4FrQAMVEGgXxyq5asgvTYPdrz4/7k=;
 b=J/A80bqXBjlYxzxeIGdvqkX9W54zQN8BrfCOs2xvpUf3vRTQMBPdBREkjrk5YNtR1EAUDh
 Um0LsipA1Bt7uuAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6DC9713305;
 Tue, 17 May 2022 10:14:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 61X4GW51g2KcSwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 17 May 2022 10:14:06 +0000
Message-ID: <76df9a88-e09f-b2e0-001e-0619769828f6@suse.de>
Date: Tue, 17 May 2022 12:14:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 1/4] drm/gem: Share code between drm_gem_fb_{begin,
 end}_cpu_access()
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>, daniel@ffwll.ch,
 airlied@linux.ie, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 noralf@tronnes.org, christian.koenig@amd.com
References: <20220509081602.474-1-tzimmermann@suse.de>
 <20220509081602.474-2-tzimmermann@suse.de>
 <bb2862d5-e35f-fb3e-be8b-181bb18993a8@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <bb2862d5-e35f-fb3e-be8b-181bb18993a8@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------4ijm5n9Y41AAKqlTXF8wJNjZ"
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------4ijm5n9Y41AAKqlTXF8wJNjZ
Content-Type: multipart/mixed; boundary="------------7s0dSJFdDl1VzpkkVImf0Bdl";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>, daniel@ffwll.ch,
 airlied@linux.ie, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 noralf@tronnes.org, christian.koenig@amd.com
Cc: dri-devel@lists.freedesktop.org
Message-ID: <76df9a88-e09f-b2e0-001e-0619769828f6@suse.de>
Subject: Re: [PATCH 1/4] drm/gem: Share code between drm_gem_fb_{begin,
 end}_cpu_access()
References: <20220509081602.474-1-tzimmermann@suse.de>
 <20220509081602.474-2-tzimmermann@suse.de>
 <bb2862d5-e35f-fb3e-be8b-181bb18993a8@redhat.com>
In-Reply-To: <bb2862d5-e35f-fb3e-be8b-181bb18993a8@redhat.com>

--------------7s0dSJFdDl1VzpkkVImf0Bdl
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgSmF2aWVyDQoNCkFtIDE2LjA1LjIyIHVtIDE1OjAwIHNjaHJpZWIgSmF2aWVyIE1hcnRp
bmV6IENhbmlsbGFzOg0KPiBIZWxsbyBUaG9tYXMsDQo+IA0KPiBPbiA1LzkvMjIgMTA6MTUs
IFRob21hcyBaaW1tZXJtYW5uIHdyb3RlOg0KPj4gVGhlIGVycm9yLXJlY292ZXJ5IGNvZGUg
aW4gZHJtX2dlbV9mYl9iZWdpbigpIGlzIHRoZSBzYW1lIHBhdHRlcm4NCj4+IGFzIGRybV9n
ZW1fZmJfZW5kKCkuIEltcGxlbWVudCBib3RoIHRoaXMgYW4gaW50ZXJuYWwgaGVscGVyLiBO
bw0KPiANCj4gTWF5YmUgImJvdGggb2YgdGhlc2UgdXNpbmcgdXNpbmcgYW4iIG9yIHNvbWV0
aGluZyBsaWtlIHRoYXQgPw0KDQpPZiBjb3Vyc2UuDQoNCj4gDQo+PiBmdW5jdGlvbmFsIGNo
YW5nZXMuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1t
ZXJtYW5uQHN1c2UuZGU+DQo+PiAtLS0NCj4+ICAgZHJpdmVycy9ncHUvZHJtL2RybV9nZW1f
ZnJhbWVidWZmZXJfaGVscGVyLmMgfCA2MiArKysrKysrKy0tLS0tLS0tLS0tLQ0KPj4gICAx
IGZpbGUgY2hhbmdlZCwgMjYgaW5zZXJ0aW9ucygrKSwgMzYgZGVsZXRpb25zKC0pDQo+Pg0K
PiANCj4gTmljZSBjbGVhbnVwLiBGb3IgdGhlIHBhdGNoOg0KPiANCj4gUmV2aWV3ZWQtYnk6
IEphdmllciBNYXJ0aW5leiBDYW5pbGxhcyA8amF2aWVybUByZWRoYXQuY29tPg0KPiANCj4g
SSBqdXN0IGhhdmUgYSBmZXcgbWlub3IgY29tbWVudHMgYmVsb3cuDQo+IA0KPj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtX2ZyYW1lYnVmZmVyX2hlbHBlci5jIGIv
ZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fZnJhbWVidWZmZXJfaGVscGVyLmMNCj4+IGluZGV4
IGY0NjE5ODAzYWNkMC4uMmZjYWNhYjlmODEyIDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2RybV9nZW1fZnJhbWVidWZmZXJfaGVscGVyLmMNCj4+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS9kcm1fZ2VtX2ZyYW1lYnVmZmVyX2hlbHBlci5jDQo+PiBAQCAtNDAzLDYgKzQw
MywyNyBAQCB2b2lkIGRybV9nZW1fZmJfdnVubWFwKHN0cnVjdCBkcm1fZnJhbWVidWZmZXIg
KmZiLA0KPj4gICB9DQo+PiAgIEVYUE9SVF9TWU1CT0woZHJtX2dlbV9mYl92dW5tYXApOw0K
Pj4gICANCj4+ICtzdGF0aWMgdm9pZCBfX2RybV9nZW1fZmJfZW5kX2NwdV9hY2Nlc3Moc3Ry
dWN0IGRybV9mcmFtZWJ1ZmZlciAqZmIsIGVudW0gZG1hX2RhdGFfZGlyZWN0aW9uIGRpciwN
Cj4+ICsJCQkJCXVuc2lnbmVkIGludCBudW1fcGxhbmVzKQ0KPj4gK3sNCj4+ICsJc3RydWN0
IGRtYV9idWZfYXR0YWNobWVudCAqaW1wb3J0X2F0dGFjaDsNCj4+ICsJc3RydWN0IGRybV9n
ZW1fb2JqZWN0ICpvYmo7DQo+PiArCWludCByZXQ7DQo+PiArDQo+PiArCXdoaWxlIChudW1f
cGxhbmVzKSB7DQo+PiArCQktLW51bV9wbGFuZXM7DQo+PiArCQlvYmogPSBkcm1fZ2VtX2Zi
X2dldF9vYmooZmIsIG51bV9wbGFuZXMpOw0KPj4gKwkJaWYgKCFvYmopDQo+PiArCQkJY29u
dGludWU7DQo+PiArCQlpbXBvcnRfYXR0YWNoID0gb2JqLT5pbXBvcnRfYXR0YWNoOw0KPj4g
KwkJaWYgKCFpbXBvcnRfYXR0YWNoKQ0KPj4gKwkJCWNvbnRpbnVlOw0KPj4gKwkJcmV0ID0g
ZG1hX2J1Zl9lbmRfY3B1X2FjY2VzcyhpbXBvcnRfYXR0YWNoLT5kbWFidWYsIGRpcik7DQo+
PiArCQlpZiAocmV0KQ0KPj4gKwkJCWRybV9lcnIoZmItPmRldiwgImRtYV9idWZfZW5kX2Nw
dV9hY2Nlc3MoKSBmYWlsZWQ6ICVkXG4iLCByZXQpOw0KPiANCj4gSSB3b25kZXIgaWYgd291
bGQgYmUgdXNlZnVsIHRvIGFsc28gcHJpbnQgdGhlIHBsYW5lIGluZGV4IGFuZCBhY2Nlc3Mg
bW9kZSBoZXJlLg0KDQpPay4NCg0KPiANCj4+ICsJfQ0KPj4gK30NCj4+ICsNCj4+ICAgLyoq
DQo+PiAgICAqIGRybV9nZW1fZmJfYmVnaW5fY3B1X2FjY2VzcyAtIHByZXBhcmVzIEdFTSBi
dWZmZXIgb2JqZWN0cyBmb3IgQ1BVIGFjY2Vzcw0KPj4gICAgKiBAZmI6IHRoZSBmcmFtZWJ1
ZmZlcg0KPj4gQEAgLTQyMiw3ICs0NDMsNyBAQCBpbnQgZHJtX2dlbV9mYl9iZWdpbl9jcHVf
YWNjZXNzKHN0cnVjdCBkcm1fZnJhbWVidWZmZXIgKmZiLCBlbnVtIGRtYV9kYXRhX2RpcmVj
dA0KPj4gICAJc3RydWN0IGRtYV9idWZfYXR0YWNobWVudCAqaW1wb3J0X2F0dGFjaDsNCj4+
ICAgCXN0cnVjdCBkcm1fZ2VtX29iamVjdCAqb2JqOw0KPj4gICAJc2l6ZV90IGk7DQo+PiAt
CWludCByZXQsIHJldDI7DQo+PiArCWludCByZXQ7DQo+PiAgIA0KPj4gICAJZm9yIChpID0g
MDsgaSA8IEFSUkFZX1NJWkUoZmItPm9iaik7ICsraSkgew0KPj4gICAJCW9iaiA9IGRybV9n
ZW1fZmJfZ2V0X29iaihmYiwgaSk7DQo+PiBAQCAtNDMzLDI4ICs0NTQsMTMgQEAgaW50IGRy
bV9nZW1fZmJfYmVnaW5fY3B1X2FjY2VzcyhzdHJ1Y3QgZHJtX2ZyYW1lYnVmZmVyICpmYiwg
ZW51bSBkbWFfZGF0YV9kaXJlY3QNCj4+ICAgCQkJY29udGludWU7DQo+PiAgIAkJcmV0ID0g
ZG1hX2J1Zl9iZWdpbl9jcHVfYWNjZXNzKGltcG9ydF9hdHRhY2gtPmRtYWJ1ZiwgZGlyKTsN
Cj4+ICAgCQlpZiAocmV0KQ0KPj4gLQkJCWdvdG8gZXJyX2RtYV9idWZfZW5kX2NwdV9hY2Nl
c3M7DQo+PiArCQkJZ290byBlcnJfX19kcm1fZ2VtX2ZiX2VuZF9jcHVfYWNjZXNzOw0KPiAN
Cj4gSSB3b3VsZG4ndCByZW5hbWUgdGhpcy4gQXMgSSByZWFkIGl0LCB0aGUgZ290byBsYWJl
bCBkb2Vzbid0IGRlbm90ZSB3aGF0DQo+IGZ1bmN0aW9uIGlzIGNhbGxlZCBidXQgcmF0aGVy
IHdoYXQgYWN0aW9uIGlzIGJlaW5nIHRha2VuIGluIGFuIGVycm9yIHBhdGguDQo+IA0KPiBT
aW5jZSBmaW5hbGx5IHdoYXQncyBiZWluZyBkb25lIGlzIGEgZG1hX2J1Zl9lbmRfY3B1X2Fj
Y2VzcyBpbiB0aGUgaGVscGVyLA0KPiBJIHRoaW5rIHRoYXQganVzdCBrZWVwaW5nIGVycl9k
bWFfYnVmX2VuZF9jcHVfYWNjZXNzIGlzIGVub3VnaC4gQWxzbywgdGhlDQo+IGFkZGl0aW9u
YWwgdW5kZXJzY29yZXMgYWRkZWQgbWFrZSBpdCBoYXJkZXIgdG8gcmVhZCBJTU8uDQoNCkkg
dXN1YWxseSBuYW1lIHRoZSBnb3RvIGxhYmVscyBhZnRlciB0aGUgZnVuY3Rpb24gdGhhdCBj
b21lcyBuZXh0LiBJdCdzIA0Kbm90IHJlYWxseSBwcmV0dHkgaGVyZSwgYnV0IGJlaW5nIGlu
Y29uc2lzdGVudCB3b3VsZCBwcm9iYWJseSBhbm5veSBtZSANCm1vcmUgdGhhbiB0aGUgdW5k
ZXJzY29yZXMuDQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCj4gDQoNCi0tIA0KVGhvbWFz
IFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUg
U29sdXRpb25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJn
LCBHZXJtYW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8aHJl
cjogSXZvIFRvdGV2DQo=

--------------7s0dSJFdDl1VzpkkVImf0Bdl--

--------------4ijm5n9Y41AAKqlTXF8wJNjZ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmKDdW0FAwAAAAAACgkQlh/E3EQov+Ct
+w/9HCLCgAde2zKxXO15ck6BHK8gDtecSD3MNiKY8QGMbmuJ9H9918IdKOx0Ad6kZDo3ZKWsxq0U
Yn3zNaBK2MKEnANMgLNio3PArBJWWQpHE5/56khS+3Bt+HUu2kt+dPHv2s1tN3/rIbYR3kkIwumm
O9kMCn7bku7kSJklQUxFSZTLmA2ix/emFL5m5yrtyzMtk3IQr1NmEdo3PH8bIWBsN1u2ewSQCHpv
6GlojLjsumuAGu7YZon9dfo17ex/dZLMvEy1vhiOrn3+GltNG5rlY45iZe/Rq0kXYZKqlxSshQpU
KZvE6/A0nJi7URttnfYt73BmaZ6Attrd8uGg8n6rYDOnZSL/xuI5dRPH9UKr7Izzv2opshQ5MUdR
RfCeC+aVo12GYljbMGcFwEQj6ZK0/WQD85rktntfSe3Z3m2enZxv2qLrrlf/PjtfBLMHYbBWDiMb
nkY5MU6z5IxXx4rfUcBUZCLwDdDG7iBHWIR7IBU1C2lr7Jpg49UKRustnOowKU1S7YMI70G0r11g
dlYTMkseW5CRtTi8C5rwHE3nZ2BtENOC65t63Y0KR8tMu0yuNu3zjxKdX8z0+I5FZs9xgG1VP70i
/QXtvisPs6Z1CPlzXMS83Oca+5WSTrAZi2+aCj3R/petSUBUqk9Q5LcdZojb6OKZ0D1UH3Np53RO
DkE=
=69Qw
-----END PGP SIGNATURE-----

--------------4ijm5n9Y41AAKqlTXF8wJNjZ--
