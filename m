Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F6E45AD1A5
	for <lists+dri-devel@lfdr.de>; Mon,  5 Sep 2022 13:37:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 305D110E30F;
	Mon,  5 Sep 2022 11:37:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BEE110E30F
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Sep 2022 11:37:12 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 3E8B95FD5D;
 Mon,  5 Sep 2022 11:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1662377831; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dpyXUkUsaaRutfqjV6W1iIcL178PpZOZ8fQb9Uq20uo=;
 b=CyEfYSmg6Nrg/AeIHnfEJnMfA1qnHxap++qaR/tDcJvTLveJlp/LltGExMqGbceMGvVkPq
 yXbvMlGmfuQUoYlyWNYQpNHtFptywHw9OD7VUFPk0es2oPIwLa6/XEhO2T2KNo8f7IrUgP
 jKkPtSJr8aJpphURVg5+dgOKxhlVuhM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1662377831;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dpyXUkUsaaRutfqjV6W1iIcL178PpZOZ8fQb9Uq20uo=;
 b=ts/T2kms5SvTnn7K/kh0/TYHAgZOUfxBwOPQCt6dFsadz8Ax4cjs4dXd43tw/shEvDSI4m
 1MqKJaOfO3KfX4DQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1F6F6139C7;
 Mon,  5 Sep 2022 11:37:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id hFW1BmffFWOtaAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 05 Sep 2022 11:37:11 +0000
Message-ID: <7e77aa04-8a0d-8d48-d156-2ed551d10e7c@suse.de>
Date: Mon, 5 Sep 2022 13:37:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH] drm/simpledrm: Drop superfluous primary plane
 .atomic_check return logic
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org
References: <20220831111243.1530620-1-javierm@redhat.com>
 <43e3dead-6089-c342-5050-34d7325bcb24@suse.de>
 <3cb956d7-aac0-6a1a-6be1-098057e2fd03@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <3cb956d7-aac0-6a1a-6be1-098057e2fd03@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------omzYe0mLMGP7iBaqYFIlsPt3"
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------omzYe0mLMGP7iBaqYFIlsPt3
Content-Type: multipart/mixed; boundary="------------mkeeQD290vK9QGE52fesv4R0";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org
Cc: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org
Message-ID: <7e77aa04-8a0d-8d48-d156-2ed551d10e7c@suse.de>
Subject: Re: [PATCH] drm/simpledrm: Drop superfluous primary plane
 .atomic_check return logic
References: <20220831111243.1530620-1-javierm@redhat.com>
 <43e3dead-6089-c342-5050-34d7325bcb24@suse.de>
 <3cb956d7-aac0-6a1a-6be1-098057e2fd03@redhat.com>
In-Reply-To: <3cb956d7-aac0-6a1a-6be1-098057e2fd03@redhat.com>

--------------mkeeQD290vK9QGE52fesv4R0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDUuMDkuMjIgdW0gMTM6MDYgc2NocmllYiBKYXZpZXIgTWFydGluZXogQ2Fu
aWxsYXM6DQo+IEhlbGxvIFRob21hcywNCj4gDQo+IE9uIDkvNS8yMiAxMjo1NywgVGhvbWFz
IFppbW1lcm1hbm4gd3JvdGU6DQo+PiBIaSBKYXZpZXINCj4+DQo+PiBBbSAzMS4wOC4yMiB1
bSAxMzoxMiBzY2hyaWViIEphdmllciBNYXJ0aW5leiBDYW5pbGxhczoNCj4+PiBUaGUgc2lt
cGxlZHJtX3ByaW1hcnlfcGxhbmVfaGVscGVyX2F0b21pY19jaGVjaygpIGZ1bmN0aW9uIGlz
IG1vcmUgY29tcGxleA0KPj4+IHRoYW4gbmVlZGVkLiBJdCBmaXJzdCBjaGVja3MgZHJtX2F0
b21pY19oZWxwZXJfY2hlY2tfcGxhbmVfc3RhdGUoKSByZXR1cm5zDQo+Pj4gdmFsdWUgdG8g
ZGVjaWRlIHdoZXRoZXIgdG8gcmV0dXJuIHRoaXMgb3IgemVyby4NCj4+Pg0KPj4+IEJ1dCBp
dCBjb3VsZCBqdXN0IHJldHVybiB0aGF0IGZ1bmN0aW9uIHJldHVybiB2YWx1ZSBkaXJlY3Rs
eS4gSXQgYWxzbyBkb2VzDQo+Pj4gYSBjaGVjayBpZiBuZXdfcGxhbmVfc3RhdGUtPnZpc2li
bGUgaXNuJ3Qgc2V0LCBidXQgcmV0dXJucyB6ZXJvIHJlZ2FyZGxlc3MuDQo+Pj4NCj4+PiBT
aWduZWQtb2ZmLWJ5OiBKYXZpZXIgTWFydGluZXogQ2FuaWxsYXMgPGphdmllcm1AcmVkaGF0
LmNvbT4NCj4+PiAtLS0NCj4+Pg0KPj4+ICAgIGRyaXZlcnMvZ3B1L2RybS90aW55L3NpbXBs
ZWRybS5jIHwgMTUgKysrKy0tLS0tLS0tLS0tDQo+Pj4gICAgMSBmaWxlIGNoYW5nZWQsIDQg
aW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25zKC0pDQo+Pj4NCj4+PiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL3Rpbnkvc2ltcGxlZHJtLmMgYi9kcml2ZXJzL2dwdS9kcm0vdGlu
eS9zaW1wbGVkcm0uYw0KPj4+IGluZGV4IGE4MWY5MTgxNDU5NS4uMGJlNDdmNDAyNDdhIDEw
MDY0NA0KPj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS90aW55L3NpbXBsZWRybS5jDQo+Pj4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL3Rpbnkvc2ltcGxlZHJtLmMNCj4+PiBAQCAtNDg1LDIx
ICs0ODUsMTQgQEAgc3RhdGljIGludCBzaW1wbGVkcm1fcHJpbWFyeV9wbGFuZV9oZWxwZXJf
YXRvbWljX2NoZWNrKHN0cnVjdCBkcm1fcGxhbmUgKnBsYW5lLA0KPj4+ICAgIAlzdHJ1Y3Qg
ZHJtX3BsYW5lX3N0YXRlICpuZXdfcGxhbmVfc3RhdGUgPSBkcm1fYXRvbWljX2dldF9uZXdf
cGxhbmVfc3RhdGUobmV3X3N0YXRlLCBwbGFuZSk7DQo+Pj4gICAgCXN0cnVjdCBkcm1fY3J0
YyAqbmV3X2NydGMgPSBuZXdfcGxhbmVfc3RhdGUtPmNydGM7DQo+Pj4gICAgCXN0cnVjdCBk
cm1fY3J0Y19zdGF0ZSAqbmV3X2NydGNfc3RhdGUgPSBOVUxMOw0KPj4+IC0JaW50IHJldDsN
Cj4+PiAgICANCj4+PiAgICAJaWYgKG5ld19jcnRjKQ0KPj4+ICAgIAkJbmV3X2NydGNfc3Rh
dGUgPSBkcm1fYXRvbWljX2dldF9uZXdfY3J0Y19zdGF0ZShuZXdfc3RhdGUsIG5ld19jcnRj
KTsNCj4+PiAgICANCj4+PiAtCXJldCA9IGRybV9hdG9taWNfaGVscGVyX2NoZWNrX3BsYW5l
X3N0YXRlKG5ld19wbGFuZV9zdGF0ZSwgbmV3X2NydGNfc3RhdGUsDQo+Pj4gLQkJCQkJCSAg
RFJNX1BMQU5FX05PX1NDQUxJTkcsDQo+Pj4gLQkJCQkJCSAgRFJNX1BMQU5FX05PX1NDQUxJ
TkcsDQo+Pj4gLQkJCQkJCSAgZmFsc2UsIGZhbHNlKTsNCj4+PiAtCWlmIChyZXQpDQo+Pj4g
LQkJcmV0dXJuIHJldDsNCj4+PiAtCWVsc2UgaWYgKCFuZXdfcGxhbmVfc3RhdGUtPnZpc2li
bGUpDQo+Pj4gLQkJcmV0dXJuIDA7DQo+Pj4gLQ0KPj4+IC0JcmV0dXJuIDA7DQo+Pj4gKwly
ZXR1cm4gZHJtX2F0b21pY19oZWxwZXJfY2hlY2tfcGxhbmVfc3RhdGUobmV3X3BsYW5lX3N0
YXRlLCBuZXdfY3J0Y19zdGF0ZSwNCj4+PiArCQkJCQkJICAgRFJNX1BMQU5FX05PX1NDQUxJ
TkcsDQo+Pj4gKwkJCQkJCSAgIERSTV9QTEFORV9OT19TQ0FMSU5HLA0KPj4+ICsJCQkJCQkg
ICBmYWxzZSwgZmFsc2UpOw0KPj4NCj4+IEknbSB1bmRlY2lkZWQgb24gdGhpcyBjaGFuZ2Uu
IEkga25vdyBpdCdzIGNvcnJlY3QgYW5kIG1vcmUgdG8gdGhlIHBvaW50Lg0KPj4gQnV0IHRo
ZSBjYWxsJ3MgbG9naWMgaXMgbm9uLWludHVpdGl2ZTogdGhlIGNhbGwgZWl0aGVyIHJldHVy
bnMgYW4gZXJyb3INCj4+IG9yIHdlIGhhdmUgdG8gdGVzdCAtPnZpc2libGUgYWZ0ZXJ3YXJk
cy4gU28gSSB3cm90ZSBpdCBleHBsaWNpdGx5Lg0KPj4NCj4gDQo+IFllcywgYnV0IHRoZSBj
aGVjayBoYXMgbm8gZWZmZWN0IHNvIEkgZm91bmQgaXQgZXZlbiBsZXNzIGludHVpdGl2ZS4g
TWF5YmUNCj4gYWRkIGEgY29tbWVudCB0aGVuIGlmIHlvdSB3YW4gdG8ga2VlcCB0aGUgY3Vy
cmVudCBjb2RlPw0KPiAgIA0KPj4gSSBzYXcgdGhhdCB5b3VyIGNoYW5nZSB0byBzc2QxMzB4
IGFsc28gdXNlcyB0aGUgcGF0dGVybi4gSWYgd2UgZmluZCBtb3JlDQo+PiBzdWNoIGRyaXZl
cnMsIHdlIGNvdWxkIGltcGxlbWVudCB0aGUgYXRvbWljIGNoZWNrIGFzIGEgaGVscGVyLiBJ
IHN1Z2dlc3QNCj4+IGRybV9wbGFuZV9oZWxwZXJfYXRvbWljX2NoZWNrX2ZpeGVkKCkgaW4g
ZHJtX3BsYW5lX2hlbHBlci5jDQo+Pg0KPiANCj4gU3VyZS4gSSBjYW4gYWRkIGEgcHJlcGFy
YXRvcnkgY2hhbmdlIGluIHYyIHRoYXQgYWRkcyB0aGF0IGhlbHBlciBhbmQgdGhlbg0KPiB1
c2UgaXQgaW4gdGhlIGZvbGxvdy11cCBwYXRjaC4NCj4gDQoNCk1heWJlIHdhaXQgZm9yIHlv
dXIgc3NkMTMweCBjaGFuZ2VzIHRvIGxhbmQgYW5kIHRoZW4geW91IGNhbiBjb252ZXJ0IA0K
Ym90aCBkcml2ZXJzIHRvIHRoZSBuZXcgaGVscGVyLg0KDQpCZXN0IHJlZ2FyZHMNClRob21h
cw0KDQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9w
ZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4g
NSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcp
DQpHZXNjaMOkZnRzZsO8aHJlcjogSXZvIFRvdGV2DQo=

--------------mkeeQD290vK9QGE52fesv4R0--

--------------omzYe0mLMGP7iBaqYFIlsPt3
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmMV32YFAwAAAAAACgkQlh/E3EQov+Ai
ahAAuiDhdKPCXsjm7Hra2eNZiOU33BvLXn4aSdTOZEgPBLeMo1FvoaUrl2+vUCANHjJGYcweZWBf
z5ho8iYL/FexyGvJgPxey44gI5Vsut69vmiciuF4bL5z2OP0h4fe7aMHNuIlO/U0wQHnRwUVrl52
2WN+Ih6lcQ5m2SsQvJ/8kn/zh9i5bfj9JoD8Y9iH1+1vLqgZ34uvp747XZ5fU2zYSaPXTpoZFzCC
ElHXyL0VK2fMzHQEeqs89zLEpcMPNJBxx4yn7oq6XO8rlNW3ApAeOyS3H7Y5SwCT8Yv4mAedw83L
+lXkyrR5ZfBJ5lp3RdAG9ZgFr1P+ucSjkrR/exhdtM0vN2LeIiJFF09WTk3dOG2IAlFQoHQsScOr
pnMsX8LbgUc12l7SzVlyqyPEvNt6JDo+D0LHDwFWdEtQMgPyBYbtwgaDjmix1rzO5Cmwj9lcjWQ+
ytL7P5sd6A8lcXx9+SECqCDMVnY0W3JReXm2OOLxIBEjLr7w7YvLLQbQMcpsfhB02Y+Rn5d0J7na
NXfHkgwTADgnR8sIvMTFKSdPHQiUfk/hWkLGk8LbXc4a4coK2QpPUhpqEjr0akKHdnzHcGNBzIzi
iuqUzpy2UVisNCbmbdnx44XGk6yzf2tXDKDqdLdIdgzQpJxdwUAM8/hb+oLRT4djhD8OwCQ1+T3Z
Glo=
=E1Zv
-----END PGP SIGNATURE-----

--------------omzYe0mLMGP7iBaqYFIlsPt3--
