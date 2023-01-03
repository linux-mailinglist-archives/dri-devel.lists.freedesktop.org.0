Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 746C365C0A2
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jan 2023 14:16:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6A7910E1F4;
	Tue,  3 Jan 2023 13:16:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50B1F10E1F4
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Jan 2023 13:16:33 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 034ED38E46;
 Tue,  3 Jan 2023 13:16:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1672751792; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Rzld5ifaJBLXhEjSy+xCmPpMIoeomdI2z6jSG8ew0xc=;
 b=KKuVXr0vX2TYobDp+Gc0Aok0A4H2ILcezHNEKFifbNqOSyTsSh8gMHy8GFztZHxmLYTsZh
 qoZMejLC/nqkdS+bx9EY7grF8+wxN6RwmRcyoBsy6qfeFExpA6QLW6/m+59zN22ooGVKPM
 r8VBhbE4jfVJXf6P96b0+US7QHKVXrE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1672751792;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Rzld5ifaJBLXhEjSy+xCmPpMIoeomdI2z6jSG8ew0xc=;
 b=/dZZwafpwD4gaLFZ7hOLVH3bWlsGq+2JoRhiTTHU1KVxMe9/XgVSniN3ZVoLcV+cRcgoNR
 PWTLW5xRz3RgzdCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C99B41390C;
 Tue,  3 Jan 2023 13:16:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id /FL4L68qtGMdIQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 03 Jan 2023 13:16:31 +0000
Message-ID: <de3c30a2-d9c6-cf5c-d4bc-e90bd3993f6b@suse.de>
Date: Tue, 3 Jan 2023 14:16:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] drm/gem: Check for valid formats
To: =?UTF-8?Q?Ma=c3=adra_Canal?= <mcanal@igalia.com>,
 Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20230103125322.855089-1-mcanal@igalia.com>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230103125322.855089-1-mcanal@igalia.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------UJ03fyuEPYAQV9HEeTpMTMyP"
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
Cc: Melissa Wen <mwen@igalia.com>,
 =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@igalia.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------UJ03fyuEPYAQV9HEeTpMTMyP
Content-Type: multipart/mixed; boundary="------------s1XEkmvEEw5zcGQ0TP7zXt36";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?Q?Ma=c3=adra_Canal?= <mcanal@igalia.com>,
 Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Melissa Wen <mwen@igalia.com>, =?UTF-8?Q?Andr=c3=a9_Almeida?=
 <andrealmeid@igalia.com>, dri-devel@lists.freedesktop.org
Message-ID: <de3c30a2-d9c6-cf5c-d4bc-e90bd3993f6b@suse.de>
Subject: Re: [PATCH] drm/gem: Check for valid formats
References: <20230103125322.855089-1-mcanal@igalia.com>
In-Reply-To: <20230103125322.855089-1-mcanal@igalia.com>

--------------s1XEkmvEEw5zcGQ0TP7zXt36
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGksDQoNCnRoYW5rcyBmb3IgdGhlIGZvbGxvdy11cCBwYXRjaC4NCg0KQW0gMDMuMDEuMjMg
dW0gMTM6NTMgc2NocmllYiBNYcOtcmEgQ2FuYWw6DQo+IEN1cnJlbnRseSwgZHJtX2dlbV9m
Yl9jcmVhdGUoKSBkb2Vzbid0IGNoZWNrIGlmIHRoZSBwaXhlbCBmb3JtYXQgaXMNCj4gc3Vw
cG9ydGVkLCB3aGljaCBjYW4gbGVhZCB0byB0aGUgYWNjZXB0YW5jZSBvZiBpbnZhbGlkIHBp
eGVsIGZvcm1hdHMNCj4gZS5nLiB0aGUgYWNjZXB0YW5jZSBvZiBpbnZhbGlkIG1vZGlmaWVy
cy4gVGhlcmVmb3JlLCBhZGQgYSBjaGVjayBmb3INCj4gdmFsaWQgZm9ybWF0cyBvbiBkcm1f
Z2VtX2ZiX2NyZWF0ZSgpLg0KPiANCj4gTW9yZW92ZXIsIG5vdGUgdGhhdCB0aGlzIGNoZWNr
IGlzIG9ubHkgdmFsaWQgZm9yIGF0b21pYyBkcml2ZXJzLA0KPiBiZWNhdXNlLCBmb3Igbm9u
LWF0b21pYyBkcml2ZXJzLCBjaGVja2luZyBkcm1fYW55X3BsYW5lX2hhc19mb3JtYXQoKSBp
cw0KPiBub3QgcG9zc2libGUgc2luY2UgdGhlIGZvcm1hdCBsaXN0IGZvciB0aGUgcHJpbWFy
eSBwbGFuZSBpcyBmYWtlLCBhbmQNCj4gd2UnZCB0aGVyZWZvciByZWplY3QgdmFsaWQgZm9y
bWF0cy4NCj4gDQo+IFN1Z2dlc3RlZC1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJt
YW5uQHN1c2UuZGU+DQo+IFNpZ25lZC1vZmYtYnk6IE1hw61yYSBDYW5hbCA8bWNhbmFsQGln
YWxpYS5jb20+DQo+IC0tLQ0KPiAgIERvY3VtZW50YXRpb24vZ3B1L3RvZG8ucnN0ICAgICAg
ICAgICAgICAgICAgIHwgNyArKy0tLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL2RybV9nZW1f
ZnJhbWVidWZmZXJfaGVscGVyLmMgfCA5ICsrKysrKysrKw0KPiAgIDIgZmlsZXMgY2hhbmdl
ZCwgMTEgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQg
YS9Eb2N1bWVudGF0aW9uL2dwdS90b2RvLnJzdCBiL0RvY3VtZW50YXRpb24vZ3B1L3RvZG8u
cnN0DQo+IGluZGV4IDFmOGE1ZWJlMTg4ZS4uNjhiZGFmYTAyODRmIDEwMDY0NA0KPiAtLS0g
YS9Eb2N1bWVudGF0aW9uL2dwdS90b2RvLnJzdA0KPiArKysgYi9Eb2N1bWVudGF0aW9uL2dw
dS90b2RvLnJzdA0KPiBAQCAtMjc2LDExICsyNzYsOCBAQCBWYXJpb3VzIGhvbGQtdXBzOg0K
PiAgIC0gTmVlZCB0byBzd2l0Y2ggdG8gZHJtX2ZiZGV2X2dlbmVyaWNfc2V0dXAoKSwgb3Ro
ZXJ3aXNlIGEgbG90IG9mIHRoZSBjdXN0b20gZmINCj4gICAgIHNldHVwIGNvZGUgY2FuJ3Qg
YmUgZGVsZXRlZC4NCj4gICANCj4gLS0gTWFueSBkcml2ZXJzIHdyYXAgZHJtX2dlbV9mYl9j
cmVhdGUoKSBvbmx5IHRvIGNoZWNrIGZvciB2YWxpZCBmb3JtYXRzLiBGb3INCj4gLSAgYXRv
bWljIGRyaXZlcnMgd2UgY291bGQgY2hlY2sgZm9yIHZhbGlkIGZvcm1hdHMgYnkgY2FsbGlu
Zw0KPiAtICBkcm1fcGxhbmVfY2hlY2tfcGl4ZWxfZm9ybWF0KCkgYWdhaW5zdCBhbGwgcGxh
bmVzLCBhbmQgcGFzcyBpZiBhbnkgcGxhbmUNCj4gLSAgc3VwcG9ydHMgdGhlIGZvcm1hdC4g
Rm9yIG5vbi1hdG9taWMgdGhhdCdzIG5vdCBwb3NzaWJsZSBzaW5jZSBsaWtlIHRoZSBmb3Jt
YXQNCj4gLSAgbGlzdCBmb3IgdGhlIHByaW1hcnkgcGxhbmUgaXMgZmFrZSBhbmQgd2UnZCB0
aGVyZWZvciByZWplY3QgdmFsaWQgZm9ybWF0cy4NCj4gKy0gTmVlZCB0byBzd2l0Y2ggdG8g
ZHJtX2dlbV9mYl9jcmVhdGUoKSwgYXMgbm93IGRybV9nZW1fZmJfY3JlYXRlKCkgY2hlY2tz
IGZvcg0KPiArICB2YWxpZCBmb3JtYXRzIGZvciBhdG9taWMgZHJpdmVycy4NCj4gICANCj4g
ICAtIE1hbnkgZHJpdmVycyBzdWJjbGFzcyBkcm1fZnJhbWVidWZmZXIsIHdlJ2QgbmVlZCBh
IGVtYmVkZGluZyBjb21wYXRpYmxlDQo+ICAgICB2ZXJzaW9uIG9mIHRoZSB2YXJpb3MgZHJt
X2dlbV9mYl9jcmVhdGUgZnVuY3Rpb25zLiBNYXliZSBjYWxsZWQNCj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtX2ZyYW1lYnVmZmVyX2hlbHBlci5jIGIvZHJpdmVy
cy9ncHUvZHJtL2RybV9nZW1fZnJhbWVidWZmZXJfaGVscGVyLmMNCj4gaW5kZXggZTkzNTMz
Yjg2MDM3Li5iOGE2MTVhMTM4Y2QgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9k
cm1fZ2VtX2ZyYW1lYnVmZmVyX2hlbHBlci5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9k
cm1fZ2VtX2ZyYW1lYnVmZmVyX2hlbHBlci5jDQo+IEBAIC05LDYgKzksNyBAQA0KPiAgICNp
bmNsdWRlIDxsaW51eC9tb2R1bGUuaD4NCj4gICANCj4gICAjaW5jbHVkZSA8ZHJtL2RybV9k
YW1hZ2VfaGVscGVyLmg+DQo+ICsjaW5jbHVkZSA8ZHJtL2RybV9kcnYuaD4NCj4gICAjaW5j
bHVkZSA8ZHJtL2RybV9mb3VyY2MuaD4NCj4gICAjaW5jbHVkZSA8ZHJtL2RybV9mcmFtZWJ1
ZmZlci5oPg0KPiAgICNpbmNsdWRlIDxkcm0vZHJtX2dlbS5oPg0KPiBAQCAtMTY0LDYgKzE2
NSwxNCBAQCBpbnQgZHJtX2dlbV9mYl9pbml0X3dpdGhfZnVuY3Moc3RydWN0IGRybV9kZXZp
Y2UgKmRldiwNCj4gICAJCXJldHVybiAtRUlOVkFMOw0KPiAgIAl9DQo+ICAgDQo+ICsJaWYg
KGRybV9kcnZfdXNlc19hdG9taWNfbW9kZXNldChkZXYpICYmDQo+ICsJICAgICFkcm1fYW55
X3BsYW5lX2hhc19mb3JtYXQoZGV2LCBtb2RlX2NtZC0+cGl4ZWxfZm9ybWF0LA0KPiArCQkJ
CSAgICAgIG1vZGVfY21kLT5tb2RpZmllclswXSkpIHsNCg0KQmVjYXVzZSB0aGlzIGlzIGEg
Z2VuZXJpYyBoZWxwZXIsIGl0IGhhcyB0byBoYW5kbGUgdGhlIG9kZCBjYXNlcyBhcyANCndl
bGwuIEhlcmUgd2UgY2Fubm90IGFzc3VtZSBtb2RpZmllclswXSwgYmVjYXVzZSB0aGVyZSdz
IGEgbW9kaWZpZXIgZm9yIA0KZWFjaCBwaXhlbCBwbGFuZSBpbiBtdWx0aS1wbGFuZSBmb3Jt
YXRzLiAoVGhhdCdzIGEgZGlmZmVyZW50IHR5cGUgb2YgDQpwbGFuZSB0aGFuIHRoZSBzdHJ1
Y3QgcGxhbmUgd2UncmUgcGFzc2luZyBpbi4pIElmIG9uZSBjb21iaW5hdGlvbiBpc24ndCAN
CnN1cHBvcnRlZCwgdGhlIGhlbHBlciBzaG91bGQgZmFpbC4NCg0KV2UgZ2V0IHRoZSBudW1i
ZXIgb2YgcGl4ZWwgcGxhbmVzIGZyb20gdGhlIGZvcm1hdCBpbmZvLiBTbyB0aGUgY29ycmVj
dCANCmltcGxlbWVudGF0aW9uIGlzIHNvbWV0aGluZyBsaWtlIHRoYXQNCg0KaWYgKGRybV9k
cnZfdXNlc19hdG9taWNfbW9kZXNldCgpKSkgew0KCWZvciAoaSA9IDA7IGkgPCBpbmZvLT5u
dW1fcGxhbmVzOyArK2kpIHsNCiAgICAgICAgIAlpZiAoIWRybV9hbnlfcGxhbmVfaGFzX2Zv
cm1hdChkZXYsIHBpeGVsX2Zvcm1hdCwgXA0KCQkJCW1vZGlmaWVyW2ldKSB7DQoJCQlkcm1f
ZGJnX2ttcyhkZXYsICJlcnJvciBtc2ciKTsNCgkJCXJldHVybiAtRUlOVkFMOw0KCQl9DQog
ICAgICAgICB9DQp9DQoNCg0KPiArCQlkcm1fZGJnKGRldiwgIlVuc3VwcG9ydGVkIHBpeGVs
IGZvcm1hdCAlcDRjYyAvIG1vZGlmaWVyIDB4JWxseFxuIiwNCg0KZHJtX2RiZygpIGlzIGZv
ciBkcml2ZXJzLiBVc2UgZHJtX2RiZ19rbXMoKSBwbGVhc2UuDQoNCkJlc3QgcmVnYXJkcw0K
VGhvbWFzDQoNCg0KPiArCQkJJm1vZGVfY21kLT5waXhlbF9mb3JtYXQsIG1vZGVfY21kLT5t
b2RpZmllclswXSk7DQo+ICsJCXJldHVybiAtRUlOVkFMOw0KPiArCX0NCj4gKw0KPiAgIAlm
b3IgKGkgPSAwOyBpIDwgaW5mby0+bnVtX3BsYW5lczsgaSsrKSB7DQo+ICAgCQl1bnNpZ25l
ZCBpbnQgd2lkdGggPSBtb2RlX2NtZC0+d2lkdGggLyAoaSA/IGluZm8tPmhzdWIgOiAxKTsN
Cj4gICAJCXVuc2lnbmVkIGludCBoZWlnaHQgPSBtb2RlX2NtZC0+aGVpZ2h0IC8gKGkgPyBp
bmZvLT52c3ViIDogMSk7DQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERy
aXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0K
TWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5LCBB
RyBOw7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8aHJlcjogSXZvIFRvdGV2DQo=

--------------s1XEkmvEEw5zcGQ0TP7zXt36--

--------------UJ03fyuEPYAQV9HEeTpMTMyP
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmO0Kq4FAwAAAAAACgkQlh/E3EQov+DE
HxAAmNG+zV0IjqWNbKvvyNsmtshZGBWXwp5++VxaMBQSAMyAMdSPDVDnxfObhILuSktXAJsAQjvK
cew66wxKLuX0JiVZyrnSPgwN+YUnbhFk76iqyW5WRs0GR9/Oi8aKcldbAOquig0mLx+aeVMsOte6
AT5DGjrsQJDAlPgZACiJmDENhj9lRZjmbNrLhoWmCM51JWc1y0GyWLgHaCSi2jaeQH3TPvgt1LCr
9RdwlZ+uexYwVqjN8YWWMW1vuKOCnLTHFGmNqILjf83DOCjUydpBK5WWb9ezsbX+rK5CRnj1UBSw
CMsQGE9vTf7CnCfxy8bmf1oamBIf5dZzyNYO8/oX5JG5Akoi7cHUjN+uomFiF4yNt9YN3ThpkriO
whvDeEWZGd9pkiwPCw3zGC9uCfpVk7vjnt9J881zSMic1Tn6hLvC7+Vz3KZv0r5VogsiqcEQ5Dys
GKCi5+s22mlzYu58Ick9ER/LmZWCaJn1iZdesk9wFNtMIcxyPMpFdcrrWecYyLudbI7nNQQ/DbSv
KmNAWJzBMkYq4ZM9tVfAHPT5m2sdJDuHgKYTFofyMjBynCp2znbJZGOVpQRq/Efe3u+OHU0HP4QI
r+30e3SA7mJguytK4m/3vOp4/tuzedXpnJ86tJD4/MJE+HDcH4zhMPDQXXC2V5iadWGRr6iUV5PT
/6s=
=4OIP
-----END PGP SIGNATURE-----

--------------UJ03fyuEPYAQV9HEeTpMTMyP--
