Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F38C6403EE1
	for <lists+dri-devel@lfdr.de>; Wed,  8 Sep 2021 20:10:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 182BC8808E;
	Wed,  8 Sep 2021 18:10:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BB698808E
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Sep 2021 18:10:14 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 22D9D1FDA8;
 Wed,  8 Sep 2021 18:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1631124613; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dizqVgFBYFLYTed6obzXrjaAx0nlAPsKDSnwkzN9k5M=;
 b=gyEPqLJUS72T1jHXGt1DbVxzNThpE9jwXL1i85QVYkt+gqGC7I5qpL9wanIEL6j9boO8zA
 jaVF1UyzMyGKdWzD0fJemY9l4VT1mK++fCHK3JLtMLaG85gFuk3DJyxmSebZmU64yVs8Zv
 93SwlkcCOPBMf2f8UxmJyGQHTMftzDg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1631124613;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dizqVgFBYFLYTed6obzXrjaAx0nlAPsKDSnwkzN9k5M=;
 b=SFNmk3xsCZihSf4yZC7zCqTLjKyneo2lmkCRrU8POB7g43EVykAzzRFZlfGTvkKjEKkZK5
 LbXDkt93MgL/pKCw==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id EF70F13A9F;
 Wed,  8 Sep 2021 18:10:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id wcG0OIT8OGG2YQAAGKfGzw
 (envelope-from <tzimmermann@suse.de>); Wed, 08 Sep 2021 18:10:12 +0000
Message-ID: <3428e1f0-7586-a0e2-6334-b7362cdb75b4@suse.de>
Date: Wed, 8 Sep 2021 20:10:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.0.1
Subject: Re: [PATCH v2 7/7] drm/gud: Add module parameter to control
 emulation: xrgb8888
Content-Language: en-US
To: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 dri-devel@lists.freedesktop.org
Cc: peter@stuge.se, linus.walleij@linaro.org
References: <20210907115752.6181-1-noralf@tronnes.org>
 <20210907115752.6181-8-noralf@tronnes.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20210907115752.6181-8-noralf@tronnes.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------yyB200HxG8GxHHxrGFi7UwbG"
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
--------------yyB200HxG8GxHHxrGFi7UwbG
Content-Type: multipart/mixed; boundary="------------ScpCl9DXNBX15BZNsLhts750";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 dri-devel@lists.freedesktop.org
Cc: peter@stuge.se, linus.walleij@linaro.org
Message-ID: <3428e1f0-7586-a0e2-6334-b7362cdb75b4@suse.de>
Subject: Re: [PATCH v2 7/7] drm/gud: Add module parameter to control
 emulation: xrgb8888
References: <20210907115752.6181-1-noralf@tronnes.org>
 <20210907115752.6181-8-noralf@tronnes.org>
In-Reply-To: <20210907115752.6181-8-noralf@tronnes.org>

--------------ScpCl9DXNBX15BZNsLhts750
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDcuMDkuMjEgdW0gMTM6NTcgc2NocmllYiBOb3JhbGYgVHLDuG5uZXM6DQo+
IEZvciBkZXZpY2VzIHRoYXQgZG9uJ3Qgc3VwcG9ydCBYUkdCODg4OCBnaXZlIHRoZSB1c2Vy
IHRoZSBhYmlsaXR5IHRvDQo+IGNob29zZSB3aGF0J3MgbW9zdCBpbXBvcnRhbnQ6IENvbG9y
IGRlcHRoIG9yIGZyYW1lcyBwZXIgc2Vjb25kLg0KPiANCj4gQWRkIGFuICd4cmdiODg4OCcg
bW9kdWxlIHBhcmFtZXRlciB0byBvdmVycmlkZSB0aGUgZW11bGF0aW9uIGZvcm1hdC4NCj4g
DQo+IEFzc3VtZSB0aGUgdXNlciB3YW50cyBmdWxsIGNvbnRyb2wgaWYgeHJnYjg4ODggaXMg
c2V0IGFuZCBkb24ndCBzZXQNCj4gRFJNX0NBUF9EVU1CX1BSRUZFUlJFRF9ERVBUSCBpZiBS
R0I1NjUgaXMgc3VwcG9ydGVkIChBRkFJSyBvbmx5IFgub3JnDQo+IHN1cHBvcnRzIHRoaXMp
Lg0KDQpNb3JlIG9mIGEgZ2VuZXJhbCBzdGF0ZW1lbnQ6IHdvdWxkbid0IGl0IG1ha2UgbW9y
ZSBzZW5zZSB0byBhdXRvLWRldGVjdCANCnRoaXMgZW50aXJlbHk/IFRoZSBHVUQgcHJvdG9j
b2wgY291bGQgb3JkZXIgdGhlIGxpc3Qgb2Ygc3VwcG9ydGVkIA0KZm9ybWF0cyBieSBwcmVm
ZXJlbmNlIChtYXliZSBpdCBkb2VzIGFscmVhZHkpLiBPciB5b3UgY291bGQgdGFrZSB0aGUg
DQp0eXBlIG9mIFVTQiBjb25uZWN0aW9uIGludG8gYWNjb3VudC4NCg0KQWRkaXRpb25hbGx5
LCB4cmdiODg4OCBpcyByZWFsbHkgYSBmYWxsLWJhY2sgZm9yIGxhenkgdXNlcnNwYWNlIA0K
cHJvZ3JhbXMsIGJ1dCB1c2Vyc3BhY2Ugc2hvdWxkIGRvIGJldHRlciBJTUhPLg0KDQpCZXN0
IHJlZ2FyZHMNClRob21hcw0KDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBOb3JhbGYgVHLDuG5u
ZXMgPG5vcmFsZkB0cm9ubmVzLm9yZz4NCj4gLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL2d1
ZC9ndWRfZHJ2LmMgfCAxMyArKysrKysrKysrLS0tDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDEw
IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2d1ZC9ndWRfZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vZ3VkL2d1ZF9k
cnYuYw0KPiBpbmRleCAzZjlkNGI5YTFlM2QuLjYwZDI3ZWU1ZGRiZCAxMDA2NDQNCj4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2d1ZC9ndWRfZHJ2LmMNCj4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2d1ZC9ndWRfZHJ2LmMNCj4gQEAgLTMwLDYgKzMwLDEwIEBADQo+ICAgDQo+ICAgI2lu
Y2x1ZGUgImd1ZF9pbnRlcm5hbC5oIg0KPiAgIA0KPiArc3RhdGljIGludCBndWRfeHJnYjg4
ODg7DQo+ICttb2R1bGVfcGFyYW1fbmFtZWQoeHJnYjg4ODgsIGd1ZF94cmdiODg4OCwgaW50
LCAwNjQ0KTsNCj4gK01PRFVMRV9QQVJNX0RFU0MoeHJnYjg4ODgsICJYUkdCODg4OCBlbXVs
YXRpb24gZm9ybWF0OiBHVURfUElYRUxfRk9STUFUXyogdmFsdWUsIDA9YXV0bywgLTE9ZGlz
YWJsZSBbZGVmYXVsdD1hdXRvXSIpOw0KPiArDQo+ICAgLyogT25seSB1c2VkIGludGVybmFs
bHkgKi8NCj4gICBzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9mb3JtYXRfaW5mbyBndWRfZHJt
X2Zvcm1hdF9yMSA9IHsNCj4gICAJLmZvcm1hdCA9IEdVRF9EUk1fRk9STUFUX1IxLA0KPiBA
QCAtNTMwLDEyICs1MzQsMTIgQEAgc3RhdGljIGludCBndWRfcHJvYmUoc3RydWN0IHVzYl9p
bnRlcmZhY2UgKmludGYsIGNvbnN0IHN0cnVjdCB1c2JfZGV2aWNlX2lkICppZCkNCj4gICAJ
CWNhc2UgRFJNX0ZPUk1BVF9SR0IzMzI6DQo+ICAgCQkJZmFsbHRocm91Z2g7DQo+ICAgCQlj
YXNlIERSTV9GT1JNQVRfUkdCODg4Og0KPiAtCQkJaWYgKCF4cmdiODg4OF9lbXVsYXRpb25f
Zm9ybWF0KQ0KPiArCQkJaWYgKCFndWRfeHJnYjg4ODggJiYgIXhyZ2I4ODg4X2VtdWxhdGlv
bl9mb3JtYXQpDQo+ICAgCQkJCXhyZ2I4ODg4X2VtdWxhdGlvbl9mb3JtYXQgPSBpbmZvOw0K
PiAgIAkJCWJyZWFrOw0KPiAgIAkJY2FzZSBEUk1fRk9STUFUX1JHQjU2NToNCj4gICAJCQly
Z2I1NjVfc3VwcG9ydGVkID0gdHJ1ZTsNCj4gLQkJCWlmICgheHJnYjg4ODhfZW11bGF0aW9u
X2Zvcm1hdCkNCj4gKwkJCWlmICghZ3VkX3hyZ2I4ODg4ICYmICF4cmdiODg4OF9lbXVsYXRp
b25fZm9ybWF0KQ0KPiAgIAkJCQl4cmdiODg4OF9lbXVsYXRpb25fZm9ybWF0ID0gaW5mbzsN
Cj4gICAJCQlicmVhazsNCj4gICAJCWNhc2UgRFJNX0ZPUk1BVF9YUkdCODg4ODoNCj4gQEAg
LTU0Myw2ICs1NDcsOSBAQCBzdGF0aWMgaW50IGd1ZF9wcm9iZShzdHJ1Y3QgdXNiX2ludGVy
ZmFjZSAqaW50ZiwgY29uc3Qgc3RydWN0IHVzYl9kZXZpY2VfaWQgKmlkKQ0KPiAgIAkJCWJy
ZWFrOw0KPiAgIAkJfQ0KPiAgIA0KPiArCQlpZiAoZ3VkX3hyZ2I4ODg4ID09IGZvcm1hdHNf
ZGV2W2ldKQ0KPiArCQkJeHJnYjg4ODhfZW11bGF0aW9uX2Zvcm1hdCA9IGluZm87DQo+ICsN
Cj4gICAJCWZtdF9idWZfc2l6ZSA9IGRybV9mb3JtYXRfaW5mb19taW5fcGl0Y2goaW5mbywg
MCwgZHJtLT5tb2RlX2NvbmZpZy5tYXhfd2lkdGgpICoNCj4gICAJCQkgICAgICAgZHJtLT5t
b2RlX2NvbmZpZy5tYXhfaGVpZ2h0Ow0KPiAgIAkJbWF4X2J1ZmZlcl9zaXplID0gbWF4KG1h
eF9idWZmZXJfc2l6ZSwgZm10X2J1Zl9zaXplKTsNCj4gQEAgLTU1OSw3ICs1NjYsNyBAQCBz
dGF0aWMgaW50IGd1ZF9wcm9iZShzdHJ1Y3QgdXNiX2ludGVyZmFjZSAqaW50ZiwgY29uc3Qg
c3RydWN0IHVzYl9kZXZpY2VfaWQgKmlkKQ0KPiAgIAl9DQo+ICAgDQo+ICAgCS8qIFByZWZl
ciBzcGVlZCBvdmVyIGNvbG9yIGRlcHRoICovDQo+IC0JaWYgKHJnYjU2NV9zdXBwb3J0ZWQp
DQo+ICsJaWYgKCFndWRfeHJnYjg4ODggJiYgcmdiNTY1X3N1cHBvcnRlZCkNCj4gICAJCWRy
bS0+bW9kZV9jb25maWcucHJlZmVycmVkX2RlcHRoID0gMTY7DQo+ICAgDQo+ICAgCWlmICgh
eHJnYjg4ODhfc3VwcG9ydGVkICYmIHhyZ2I4ODg4X2VtdWxhdGlvbl9mb3JtYXQpIHsNCj4g
DQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXIN
ClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwg
OTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpH
ZXNjaMOkZnRzZsO8aHJlcjogRmVsaXggSW1lbmTDtnJmZmVyDQo=

--------------ScpCl9DXNBX15BZNsLhts750--

--------------yyB200HxG8GxHHxrGFi7UwbG
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmE4/IQFAwAAAAAACgkQlh/E3EQov+B+
8A/+PpiqKqaCv6ShFYF4KN6buV1nFmQK40WJAVOsUNamJ+d8YEq1tSo0cKzgRtOTVduxVGdPk52u
C0j8eB9GBo1AeEVCtZn9fvF9N+aThJMDmFRdEEOjlok5pxJqWJVOwZkDbpjj+8mdstcSvAk9qG8e
IbqpJZE6H5xk8oyBePxFTG9fY1xIFAPi+NSmtj+5qnqxox3v+XPDanSs3MPfjXjqjFO837TguW0N
3Fv7AqWG0vtpPdANH+2emUu9f/8yeVcFvkbcYdUIhBvj6PhMJbefKMlybJYcXx3dwOAjQodpGdzv
fLwArtZvh55jnh8Vx7M8x+qYX3kt4MHWkoRmfD8r3VB9MSA2RxoHxy/04KC2Rn2078Lm2KdrImbp
0MMSyTvmc8eAGlmSbZHA3YR37OYtStPr38er2DuZzEN8MMlJ2n5GxE8V6cudFxc4xYmq+UFJRyt1
XMBqHyoJeXD23Tp+UbVDMn9t2d8YtLHk4y3rKIQrVze3RVtzc7dqYSsDUtilZ899awgtixOijIaL
spbsoatm8thE+FQFOsH+F1DjXz3r5OjBc692DBWGiJQ1Qjp1L/y9qaOQmGDede7HjOvtOFMGksCK
Mb3yz5YfAKgNcVBxE6QHH/Og7y4CmBvTu5G8WPxIdhSsy51qPkv49fF4YPxuHiyKNTMQOk502OVL
QWg=
=3mlf
-----END PGP SIGNATURE-----

--------------yyB200HxG8GxHHxrGFi7UwbG--
