Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 51B0C67CE29
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jan 2023 15:32:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 683F910E911;
	Thu, 26 Jan 2023 14:32:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 459F610E911
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 14:32:21 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 07A4C21EB4;
 Thu, 26 Jan 2023 14:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1674743540; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rjXGCqOH+EtfjH83MjWh/IfwdoqpyRNuWzLIvB0Hiow=;
 b=PjW6O+sHpaQJwHdJlbWonqq6OeXHxlEgeNEcp0J1DMwR7ZVfLh8h2gRdbcEwESWxksXKaN
 aOKzKBGr77UHMRRDU33X9xYKfCnwwoupLDo12aIseEq4eK7NqToOuqT4pfuMxEwMkfyDCE
 zqHydz6BR4VB929jx19xJuf5AzTsJLA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1674743540;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rjXGCqOH+EtfjH83MjWh/IfwdoqpyRNuWzLIvB0Hiow=;
 b=AeMVJ+MFRp/Wv88wJYRdHEz6SSC4MLxAn61HATVgM7w7sEiOGff+vNAc2o8OOliqe4x5nJ
 OKw9A+l0OtM8b6Bw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E11FF13A09;
 Thu, 26 Jan 2023 14:32:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id y4oYNvOO0mNSBwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 26 Jan 2023 14:32:19 +0000
Message-ID: <51c71e8b-21c8-d127-87b7-a02f45987ce2@suse.de>
Date: Thu, 26 Jan 2023 15:32:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 2/2] drm: remove dumb_destroy callback
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 noralf@tronnes.org, dri-devel@lists.freedesktop.org
References: <20230126102814.8722-1-christian.koenig@amd.com>
 <20230126102814.8722-2-christian.koenig@amd.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230126102814.8722-2-christian.koenig@amd.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------t3NEo5JHnvWg110PWJjzmydm"
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
--------------t3NEo5JHnvWg110PWJjzmydm
Content-Type: multipart/mixed; boundary="------------oX0gySIFgBZLnz0woIl57E9K";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 noralf@tronnes.org, dri-devel@lists.freedesktop.org
Message-ID: <51c71e8b-21c8-d127-87b7-a02f45987ce2@suse.de>
Subject: Re: [PATCH 2/2] drm: remove dumb_destroy callback
References: <20230126102814.8722-1-christian.koenig@amd.com>
 <20230126102814.8722-2-christian.koenig@amd.com>
In-Reply-To: <20230126102814.8722-2-christian.koenig@amd.com>

--------------oX0gySIFgBZLnz0woIl57E9K
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQoNCkFtIDI2LjAxLjIzIHVtIDExOjI4IHNjaHJpZWIgQ2hyaXN0aWFuIEvDtm5pZzoNCj4g
Tm90IHVzZWQgYnkgYW55IGRyaXZlciBhbnkgbW9yZS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6
IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4NCg0KU2FtZSBj
b21tZW50cyBhcyBmb3IgcGF0Y2ggMS4NCg0KUmV2aWV3ZWQtYnk6IFRob21hcyBaaW1tZXJt
YW5uIDx0emltbWVybWFubkBzdXNlLmRlPg0KVGVzdGVkLWJ5OiBUaG9tYXMgWmltbWVybWFu
biA8dHppbW1lcm1hbm5Ac3VzZS5kZT4NCg0KPiAtLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0v
ZHJtX2R1bWJfYnVmZmVycy5jIHwgIDUgKy0tLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vZHJt
X2dlbS5jICAgICAgICAgIHwgIDcgLS0tLS0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9kcm1f
aW50ZXJuYWwuaCAgICAgfCAgMyAtLS0NCj4gICBpbmNsdWRlL2RybS9kcm1fZHJ2LmggICAg
ICAgICAgICAgIHwgMTkgLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiAgIDQgZmlsZXMgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDMzIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9kcm1fZHVtYl9idWZmZXJzLmMgYi9kcml2ZXJzL2dwdS9kcm0v
ZHJtX2R1bWJfYnVmZmVycy5jDQo+IGluZGV4IGFkMTdmYTIxY2ViYi4uNzAwMzJiYmExYzk3
IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2R1bWJfYnVmZmVycy5jDQo+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHVtYl9idWZmZXJzLmMNCj4gQEAgLTEzOSwx
MCArMTM5LDcgQEAgaW50IGRybV9tb2RlX2Rlc3Ryb3lfZHVtYihzdHJ1Y3QgZHJtX2Rldmlj
ZSAqZGV2LCB1MzIgaGFuZGxlLA0KPiAgIAlpZiAoIWRldi0+ZHJpdmVyLT5kdW1iX2NyZWF0
ZSkNCj4gICAJCXJldHVybiAtRU5PU1lTOw0KPiAgIA0KPiAtCWlmIChkZXYtPmRyaXZlci0+
ZHVtYl9kZXN0cm95KQ0KPiAtCQlyZXR1cm4gZGV2LT5kcml2ZXItPmR1bWJfZGVzdHJveShm
aWxlX3ByaXYsIGRldiwgaGFuZGxlKTsNCj4gLQllbHNlDQo+IC0JCXJldHVybiBkcm1fZ2Vt
X2R1bWJfZGVzdHJveShmaWxlX3ByaXYsIGRldiwgaGFuZGxlKTsNCj4gKwlyZXR1cm4gZHJt
X2dlbV9oYW5kbGVfZGVsZXRlKGZpbGVfcHJpdiwgaGFuZGxlKTsNCj4gICB9DQo+ICAgDQo+
ICAgaW50IGRybV9tb2RlX2Rlc3Ryb3lfZHVtYl9pb2N0bChzdHJ1Y3QgZHJtX2RldmljZSAq
ZGV2LA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9nZW0uYyBiL2RyaXZl
cnMvZ3B1L2RybS9kcm1fZ2VtLmMNCj4gaW5kZXggNTlhMGJiNWViZDg1Li5hYTE1YzUyYWUx
ODIgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtLmMNCj4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2RybV9nZW0uYw0KPiBAQCAtMzM2LDEzICszMzYsNiBAQCBpbnQg
ZHJtX2dlbV9kdW1iX21hcF9vZmZzZXQoc3RydWN0IGRybV9maWxlICpmaWxlLCBzdHJ1Y3Qg
ZHJtX2RldmljZSAqZGV2LA0KPiAgIH0NCj4gICBFWFBPUlRfU1lNQk9MX0dQTChkcm1fZ2Vt
X2R1bWJfbWFwX29mZnNldCk7DQo+ICAgDQo+IC1pbnQgZHJtX2dlbV9kdW1iX2Rlc3Ryb3ko
c3RydWN0IGRybV9maWxlICpmaWxlLA0KPiAtCQkJIHN0cnVjdCBkcm1fZGV2aWNlICpkZXYs
DQo+IC0JCQkgdTMyIGhhbmRsZSkNCj4gLXsNCj4gLQlyZXR1cm4gZHJtX2dlbV9oYW5kbGVf
ZGVsZXRlKGZpbGUsIGhhbmRsZSk7DQo+IC19DQo+IC0NCj4gICAvKioNCj4gICAgKiBkcm1f
Z2VtX2hhbmRsZV9jcmVhdGVfdGFpbCAtIGludGVybmFsIGZ1bmN0aW9ucyB0byBjcmVhdGUg
YSBoYW5kbGUNCj4gICAgKiBAZmlsZV9wcml2OiBkcm0gZmlsZS1wcml2YXRlIHN0cnVjdHVy
ZSB0byByZWdpc3RlciB0aGUgaGFuZGxlIGZvcg0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2RybV9pbnRlcm5hbC5oIGIvZHJpdmVycy9ncHUvZHJtL2RybV9pbnRlcm5hbC5o
DQo+IGluZGV4IGVkMjEwM2VlMjcyYy4uZDdlMDIzYmJiMGQ1IDEwMDY0NA0KPiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vZHJtX2ludGVybmFsLmgNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L2RybV9pbnRlcm5hbC5oDQo+IEBAIC0xNzgsOSArMTc4LDYgQEAgdm9pZCBkcm1fZ2VtX3Vu
cGluKHN0cnVjdCBkcm1fZ2VtX29iamVjdCAqb2JqKTsNCj4gICBpbnQgZHJtX2dlbV92bWFw
KHN0cnVjdCBkcm1fZ2VtX29iamVjdCAqb2JqLCBzdHJ1Y3QgaW9zeXNfbWFwICptYXApOw0K
PiAgIHZvaWQgZHJtX2dlbV92dW5tYXAoc3RydWN0IGRybV9nZW1fb2JqZWN0ICpvYmosIHN0
cnVjdCBpb3N5c19tYXAgKm1hcCk7DQo+ICAgDQo+IC1pbnQgZHJtX2dlbV9kdW1iX2Rlc3Ry
b3koc3RydWN0IGRybV9maWxlICpmaWxlLCBzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LA0KPiAt
CQkJIHUzMiBoYW5kbGUpOw0KPiAtDQo+ICAgLyogZHJtX2RlYnVnZnMuYyBkcm1fZGVidWdm
c19jcmMuYyAqLw0KPiAgICNpZiBkZWZpbmVkKENPTkZJR19ERUJVR19GUykNCj4gICBpbnQg
ZHJtX2RlYnVnZnNfaW5pdChzdHJ1Y3QgZHJtX21pbm9yICptaW5vciwgaW50IG1pbm9yX2lk
LA0KPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vZHJtX2Rydi5oIGIvaW5jbHVkZS9kcm0v
ZHJtX2Rydi5oDQo+IGluZGV4IDFkNzZkMDY4NmIwMy4uNWI4NmJiNzYwM2U3IDEwMDY0NA0K
PiAtLS0gYS9pbmNsdWRlL2RybS9kcm1fZHJ2LmgNCj4gKysrIGIvaW5jbHVkZS9kcm0vZHJt
X2Rydi5oDQo+IEBAIC00MDAsMjUgKzQwMCw2IEBAIHN0cnVjdCBkcm1fZHJpdmVyIHsNCj4g
ICAJaW50ICgqZHVtYl9tYXBfb2Zmc2V0KShzdHJ1Y3QgZHJtX2ZpbGUgKmZpbGVfcHJpdiwN
Cj4gICAJCQkgICAgICAgc3RydWN0IGRybV9kZXZpY2UgKmRldiwgdWludDMyX3QgaGFuZGxl
LA0KPiAgIAkJCSAgICAgICB1aW50NjRfdCAqb2Zmc2V0KTsNCj4gLQkvKioNCj4gLQkgKiBA
ZHVtYl9kZXN0cm95Og0KPiAtCSAqDQo+IC0JICogVGhpcyBkZXN0cm95cyB0aGUgdXNlcnNw
YWNlIGhhbmRsZSBmb3IgdGhlIGdpdmVuIGR1bWIgYmFja2luZyBzdG9yYWdlIGJ1ZmZlci4N
Cj4gLQkgKiBTaW5jZSBidWZmZXIgb2JqZWN0cyBtdXN0IGJlIHJlZmVyZW5jZSBjb3VudGVk
IGluIHRoZSBrZXJuZWwgYSBidWZmZXIgb2JqZWN0DQo+IC0JICogd29uJ3QgYmUgaW1tZWRp
YXRlbHkgZnJlZWQgaWYgYSBmcmFtZWJ1ZmZlciBtb2Rlc2V0IG9iamVjdCBzdGlsbCB1c2Vz
IGl0Lg0KPiAtCSAqDQo+IC0JICogQ2FsbGVkIGJ5IHRoZSB1c2VyIHZpYSBpb2N0bC4NCj4g
LQkgKg0KPiAtCSAqIFRoZSBkZWZhdWx0IGltcGxlbWVudGF0aW9uIGlzIGRybV9nZW1fZHVt
Yl9kZXN0cm95KCkuIEdFTSBiYXNlZCBkcml2ZXJzDQo+IC0JICogbXVzdCBub3Qgb3Zlcndy
aXRlIHRoaXMuDQo+IC0JICoNCj4gLQkgKiBSZXR1cm5zOg0KPiAtCSAqDQo+IC0JICogWmVy
byBvbiBzdWNjZXNzLCBuZWdhdGl2ZSBlcnJubyBvbiBmYWlsdXJlLg0KPiAtCSAqLw0KPiAt
CWludCAoKmR1bWJfZGVzdHJveSkoc3RydWN0IGRybV9maWxlICpmaWxlX3ByaXYsDQo+IC0J
CQkgICAgc3RydWN0IGRybV9kZXZpY2UgKmRldiwNCj4gLQkJCSAgICB1aW50MzJfdCBoYW5k
bGUpOw0KPiAgIA0KPiAgIAkvKiogQG1ham9yOiBkcml2ZXIgbWFqb3IgbnVtYmVyICovDQo+
ICAgCWludCBtYWpvcjsNCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJp
dmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpN
YXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDksIEFH
IE7DvHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCg==

--------------oX0gySIFgBZLnz0woIl57E9K--

--------------t3NEo5JHnvWg110PWJjzmydm
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmPSjvMFAwAAAAAACgkQlh/E3EQov+A2
Gw//S1Inhrh+Kbw5sTbPtle+e5Vz1cvFpKvmSRwK6cr/Yhahst+3yD3aXEsAkg7akjDo5dGqbJuH
ZRuWKtTIQQriT3XFTphoOas++qEwKRhtrU7InOVR5141bS/ZiiwLhJWyyVKIRBJcZk67olSM0EbV
fHsfY7LbfKKD/V1oCUoUfS/My6hz9/a0vVVD1dAW8P4JMIs4zJO3NhzI86ao3/PuX+QwNJ0kRs+Z
F0WKZb6xe1ZQ70rYMyqip4U+9Eyo2USrKaKbTxchP7jUEQE/EjimYyRFRQrK5wMVxJ45bE/UUx+o
a0DgQ4bnqI1gowamoz8NjhOdOlAgMGMghYVNEYujJ3zghqku6HIV8opQWkR+sYPaLZ/EEXz4eG7g
Gc7CmzUGJYx9iQZwjX8AV3M51mqifjHCeIGv7mLqPaxRdxN06khV24AjIDOch7Qy2FgyTxEbbQ9w
2zV2mXSkGxuir/f96OGk/9AZ3hJZyOEiDRvJLxajRyO91VytAXYnTij59PurJ8jUMj3BsJKcPPjO
7xY1wAc4xZe3p6rwQzUnqLacz/3l0ZxTPm7b+ed9P4WmvHsyeSqgQaWSXDvQFbEappDVpgcltPlm
rEXzWmskbthr7GVJtTJdjJ2KZR+06eM8J0MKuOmThckQdfOWYenIXAcRzabWwmsw+Yj+RQLZl8iN
JNI=
=52kB
-----END PGP SIGNATURE-----

--------------t3NEo5JHnvWg110PWJjzmydm--
