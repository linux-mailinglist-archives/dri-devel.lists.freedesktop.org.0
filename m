Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D744870F481
	for <lists+dri-devel@lfdr.de>; Wed, 24 May 2023 12:47:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18B8710E658;
	Wed, 24 May 2023 10:47:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB18E10E641
 for <dri-devel@lists.freedesktop.org>; Wed, 24 May 2023 10:47:37 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 88CE01F896;
 Wed, 24 May 2023 10:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1684925256; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=B6eofjmVUUNyLVYqaAyecwdLrDjG/xIisa/ISnr9R3w=;
 b=i5DzOO5IUGWY11coV46xM2v1dZTVvivjtQjtvHKF2RZvDVoAq8wgXYwR9DJNy0cwZjeHUC
 n021bMPaOazVIjMQEFVu5CBp01ZCVzA+b0u+2CuYTxE1vEPFaIJVNMomKkvAh8hJF5ht8t
 bPC8uydePERM7+5xz0YhlLNC0KBjFqo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1684925256;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=B6eofjmVUUNyLVYqaAyecwdLrDjG/xIisa/ISnr9R3w=;
 b=ocknsgsHyitBwRsrSK0dOT2s//PoN/27t60ftL4Kgx82BjE9d25ZnbFFVLOEDRHhB+d8wa
 zyslt7AF6XLgsyBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6B2FC133E6;
 Wed, 24 May 2023 10:47:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id J3BJGUjrbWTbLQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 24 May 2023 10:47:36 +0000
Message-ID: <2f516118-2183-400f-7efd-04c2766fa9d6@suse.de>
Date: Wed, 24 May 2023 12:47:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] drm/ast: Fix modeset failed on DisplayPort
Content-Language: en-US
To: Jammy Huang <jammy_huang@aspeedtech.com>, airlied@redhat.com
References: <20230425070330.8520-1-jammy_huang@aspeedtech.com>
 <d43c0c09-ff6b-e2d1-01ae-68fe93188896@suse.de>
 <d285566b-ed7c-8e2a-a078-7bdd5bac13e3@aspeedtech.com>
 <1e4ca9bc-0e39-2708-8da8-b402139fe7ff@aspeedtech.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <1e4ca9bc-0e39-2708-8da8-b402139fe7ff@aspeedtech.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------h3sRk7wcYjp8AoDlXc0WzKbw"
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------h3sRk7wcYjp8AoDlXc0WzKbw
Content-Type: multipart/mixed; boundary="------------3FTifAi8yA0mKGX0gRMnKnrK";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Jammy Huang <jammy_huang@aspeedtech.com>, airlied@redhat.com
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Message-ID: <2f516118-2183-400f-7efd-04c2766fa9d6@suse.de>
Subject: Re: [PATCH] drm/ast: Fix modeset failed on DisplayPort
References: <20230425070330.8520-1-jammy_huang@aspeedtech.com>
 <d43c0c09-ff6b-e2d1-01ae-68fe93188896@suse.de>
 <d285566b-ed7c-8e2a-a078-7bdd5bac13e3@aspeedtech.com>
 <1e4ca9bc-0e39-2708-8da8-b402139fe7ff@aspeedtech.com>
In-Reply-To: <1e4ca9bc-0e39-2708-8da8-b402139fe7ff@aspeedtech.com>

--------------3FTifAi8yA0mKGX0gRMnKnrK
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGksDQoNCnRoaXMgcGF0Y2ggYWxzbyBmZWxsIHRocm91Z2ggdGhlIGNyYWNrcy4gQXBvbG9n
aWVzLg0KDQpBbSAyNC4wNS4yMyB1bSAwNDoyOSBzY2hyaWViIEphbW15IEh1YW5nOg0KPiBI
aSBUaG9tYXMsDQo+IA0KPiBEbyB5b3UgaGF2ZSBvdGhlciBzdWdnZXN0aW9uIGZvciB0aGlz
IHBhdGNoPz8NCg0KVGhlIG1haW4gaXNzdWUgd2FzIHRoYXQgc3RydWN0IGFzdF9wcml2YXRl
IGlzIG5vdyBjYWxsZWQgc3RydWN0IA0KYXN0X2RldmljZS4gIFNvIHRoZSBjdXJyZW50IHBh
dGNoIGNhbm5vdCBiZSBhcHBsaWVkLg0KDQo+IA0KPiBQbGVhc2Uga2luZGx5IGFkdmlzZS4N
Cj4gDQo+IE9uIDIwMjMvNC8yNSDkuIvljYggMDM6MzksIEphbW15IEh1YW5nIHdyb3RlOg0K
Pj4gSGkgVGhvbWFzLA0KPj4NCj4+IEkgdGhpbmsgRFA1MDEgaXMgT0suIEl0IGRvZXNuJ3Qg
dXNlIGlvcmVncyBpbiBhc3RfZHA1MDFfcmVhZF9lZGlkKCkuDQo+Pg0KPj4gT24gMjAyMy80
LzI1IOS4i+WNiCAwMzoyNywgVGhvbWFzIFppbW1lcm1hbm4gd3JvdGU6DQo+Pj4gSGkNCj4+
Pg0KPj4+IEFtIDI1LjA0LjIzIHVtIDA5OjAzIHNjaHJpZWIgSmFtbXkgSHVhbmc6DQo+Pj4+
IElmIHdlIHN3aXRjaCBkaXNwbGF5IGFuZCB1cGRhdGUgY3Vyc29yIHRvZ2V0aGVyLCBpdCBj
b3VsZCBsZWFkIHRvDQo+Pj4+IG1vZGVzZXQgZmFpbGVkIGJlY2F1c2Ugb2YgY29uY3VycmVu
dCBhY2Nlc3MgdG8gSU8gcmVnaXN0ZXJzLg0KPj4+Pg0KPj4+PiBBZGQgbG9jayBwcm90ZWN0
aW9uIGluIERQJ3MgZWRpZCBhY2Nlc3MgdG8gYXZvaWQgdGhpcyBwcm9ibGVtLg0KPj4+DQo+
Pj4gVGhhbmtzIGZvciB0aGUgcGF0Y2guIEkgdGhvdWdodCBJIGZpeGVkIHRoaXMgaXNzdWUg
YWxyZWFkeSwgYnV0IHRoYXQgDQo+Pj4gYXBwYXJlbnRseSBvbmx5IGhhcHBlbmVkIGZvciBT
SUwxNjQgYW5kIFZHQS4NCj4+Pg0KPj4+IFdoYXQgYWJvdXQgYXN0X2RwNTAxX2Nvbm5lY3Rv
cl9oZWxwZXJfZ2V0X21vZGVzKCk/IERvZXMgaXQgcmVxdWlyZSANCj4+PiB0aGUgbG9ja2lu
ZyBhcyB3ZWxsPw0KPj4+DQo+Pj4+DQo+Pj4+IFNpZ25lZC1vZmYtYnk6IEphbW15IEh1YW5n
IDxqYW1teV9odWFuZ0Bhc3BlZWR0ZWNoLmNvbT4NCj4+Pj4gLS0tDQo+Pj4+IMKgIGRyaXZl
cnMvZ3B1L2RybS9hc3QvYXN0X21vZGUuYyB8IDExICsrKysrKysrKysrDQo+Pj4+IMKgIDEg
ZmlsZSBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspDQo+Pj4+DQo+Pj4+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9tb2RlLmMgDQo+Pj4+IGIvZHJpdmVycy9ncHUv
ZHJtL2FzdC9hc3RfbW9kZS5jDQo+Pj4+IGluZGV4IDk4NGVjNTkwYTdlNy4uZmU1ZjFmZDYx
MzYxIDEwMDY0NA0KPj4+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9tb2RlLmMN
Cj4+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FzdC9hc3RfbW9kZS5jDQo+Pj4+IEBAIC0x
NjM1LDYgKzE2MzUsOCBAQCBzdGF0aWMgaW50IGFzdF9kcDUwMV9vdXRwdXRfaW5pdChzdHJ1
Y3QgDQo+Pj4+IGFzdF9wcml2YXRlICphc3QpDQo+Pj4+IMKgIHN0YXRpYyBpbnQgYXN0X2Fz
dGRwX2Nvbm5lY3Rvcl9oZWxwZXJfZ2V0X21vZGVzKHN0cnVjdCANCj4+Pj4gZHJtX2Nvbm5l
Y3RvciAqY29ubmVjdG9yKQ0KPj4+PiDCoCB7DQo+Pj4+IMKgwqDCoMKgwqAgdm9pZCAqZWRp
ZDsNCj4+Pj4gK8KgwqDCoCBzdHJ1Y3QgZHJtX2RldmljZSAqZGV2ID0gY29ubmVjdG9yLT5k
ZXY7DQo+Pj4+ICvCoMKgwqAgc3RydWN0IGFzdF9wcml2YXRlICphc3QgPSB0b19hc3RfcHJp
dmF0ZShkZXYpOw0KPj4+DQo+Pj4gV2UndmUgbWVhbndoaWxlIHJlbmFtZWQgYXN0X3ByaXZh
dGUgdG8gYXN0X2RldmljZS4gQ291bGQgeW91IHBsZWFzZSANCj4+PiBwcm92aWRlIGFuIHVw
ZGF0ZWQgcGF0Y2ggZm9yIHRoZSBkcm0tbWlzYy1uZXh0IHRyZWU/DQo+Pj4NCj4+PiBCZXN0
IHJlZ2FyZHMNCj4+PiBUaG9tYXMNCj4+Pg0KPj4+PiDCoCDCoMKgwqDCoMKgIGludCBzdWNj
Ow0KPj4+PiDCoMKgwqDCoMKgIGludCBjb3VudDsNCj4+Pj4gQEAgLTE2NDMsMTAgKzE2NDUs
MTggQEAgc3RhdGljIGludCANCj4+Pj4gYXN0X2FzdGRwX2Nvbm5lY3Rvcl9oZWxwZXJfZ2V0
X21vZGVzKHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IpDQo+Pj4+IMKgwqDCoMKg
wqAgaWYgKCFlZGlkKQ0KPj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgZ290byBlcnJfZHJtX2Nv
bm5lY3Rvcl91cGRhdGVfZWRpZF9wcm9wZXJ0eTsNCj4+Pj4gwqAgK8KgwqDCoCAvKg0KPj4+
PiArwqDCoMKgwqAgKiBQcm90ZWN0IGFjY2VzcyB0byBJL08gcmVnaXN0ZXJzIGZyb20gY29u
Y3VycmVudCBtb2Rlc2V0dGluZw0KPj4+PiArwqDCoMKgwqAgKiBieSBhY3F1aXJpbmcgdGhl
IEkvTy1yZWdpc3RlciBsb2NrLg0KPj4+PiArwqDCoMKgwqAgKi8NCj4+Pj4gK8KgwqDCoCBt
dXRleF9sb2NrKCZhc3QtPmlvcmVnc19sb2NrKTsNCj4+Pj4gKw0KPj4+PiDCoMKgwqDCoMKg
IHN1Y2MgPSBhc3RfYXN0ZHBfcmVhZF9lZGlkKGNvbm5lY3Rvci0+ZGV2LCBlZGlkKTsNCj4+
Pj4gwqDCoMKgwqDCoCBpZiAoc3VjYyA8IDApDQo+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBn
b3RvIGVycl9rZnJlZTsNCj4+Pj4gwqAgK8KgwqDCoCBtdXRleF91bmxvY2soJmFzdC0+aW9y
ZWdzX2xvY2spOw0KPj4+PiArDQo+Pj4+IMKgwqDCoMKgwqAgZHJtX2Nvbm5lY3Rvcl91cGRh
dGVfZWRpZF9wcm9wZXJ0eShjb25uZWN0b3IsIGVkaWQpOw0KPj4+PiDCoMKgwqDCoMKgIGNv
dW50ID0gZHJtX2FkZF9lZGlkX21vZGVzKGNvbm5lY3RvciwgZWRpZCk7DQo+Pj4+IMKgwqDC
oMKgwqAga2ZyZWUoZWRpZCk7DQo+Pj4+IEBAIC0xNjU0LDYgKzE2NjQsNyBAQCBzdGF0aWMg
aW50IA0KPj4+PiBhc3RfYXN0ZHBfY29ubmVjdG9yX2hlbHBlcl9nZXRfbW9kZXMoc3RydWN0
IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvcikNCj4+Pj4gwqDCoMKgwqDCoCByZXR1cm4gY291
bnQ7DQo+Pj4+IMKgIMKgIGVycl9rZnJlZToNCg0KSGVyZSdzIGEgbWlub3IgaXNzdWUgdGhh
dCB0aGUgZ290byBsYWJlbCBzaG91bGQgbm93IGJlIGNhbGxlZCANCmVycl9tdXRleF91bmxv
Y2suDQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCj4+Pj4gK8KgwqDCoCBtdXRleF91bmxv
Y2soJmFzdC0+aW9yZWdzX2xvY2spOw0KPj4+PiDCoMKgwqDCoMKgIGtmcmVlKGVkaWQpOw0K
Pj4+PiDCoCBlcnJfZHJtX2Nvbm5lY3Rvcl91cGRhdGVfZWRpZF9wcm9wZXJ0eToNCj4+Pj4g
wqDCoMKgwqDCoCBkcm1fY29ubmVjdG9yX3VwZGF0ZV9lZGlkX3Byb3BlcnR5KGNvbm5lY3Rv
ciwgTlVMTCk7DQo+Pj4+DQo+Pj4+IGJhc2UtY29tbWl0OiA2MWQzMjVkY2JjMDVkOGZlZjg4
MTEwZDM1ZWY3Nzc2ZjNhYzNmNjhiDQo+Pj4NCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0K
R3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2Vy
bWFueSBHbWJIDQpGcmFua2Vuc3RyYXNzZSAxNDYsIDkwNDYxIE51ZXJuYmVyZywgR2VybWFu
eQ0KR0Y6IEl2byBUb3RldiwgQW5kcmV3IE15ZXJzLCBBbmRyZXcgTWNEb25hbGQsIEJvdWRp
ZW4gTW9lcm1hbg0KSFJCIDM2ODA5IChBRyBOdWVybmJlcmcpDQo=

--------------3FTifAi8yA0mKGX0gRMnKnrK--

--------------h3sRk7wcYjp8AoDlXc0WzKbw
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmRt60cFAwAAAAAACgkQlh/E3EQov+AW
xxAAy/ziqgA6zei6EXLe1AECLwK4wKA4yQhL87KBle1Se+eAuUQFWnQSCjao/Zv7nGuxGXnlJgFJ
mnfHewlgoUzQnEJS8QgqTU3z9BEOsgr7MnBWHqrEUE3omDPsnx0Fo2QP4ukjvbBMwgPTdm4QzzzB
XnXweFlgLKhM1957qRCbFTNetS6P9mQZZ1dPh4WTrXjTFBdY1geM8LqpE87f2ZcZsNc3oLwqvJv0
s2D4oO5jXB39tLmqz+TZ9msKuytulukuGydBOq47SjHq2SUUU6u1a60ffBkjRkVgYMXceP6I636Y
s66BKL+d2lya/J2MIleqsR5twBUJ41Dw9+N16HbAlt+1kwwOG5C7FMljn5eBdYUCfQ++Vw1aIgYm
EzX03xXD4vRwvVPrAtSlyVhY3wYuNb6rBqXKEE6t9RjCfuu7yaxP4uxjniBJV3LpXTHpw/q6y7jl
ZT8VNRbwMtW/UMxxNwsQNG+gzo65DdRVBMrC2AkRgg4XrQYKvYGWh0NbOzheIA0+++c0W8PlV+7v
Lm9ap2PZuHncRNUaFvqVSR6V3qW1djgrlBIhyFFkm8Oi8M3KuxF/4ZFbtFoY8LUNxyA2YO/eWsXL
E0OR/sT4nEKUMIoV/DfOm4oKa5lS6JlwePXdOv33usxtsq7yQdxIvhXa1npjB9/chmQ38KOQ3GvX
loc=
=lOPq
-----END PGP SIGNATURE-----

--------------h3sRk7wcYjp8AoDlXc0WzKbw--
