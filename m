Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96DAC6EDC7C
	for <lists+dri-devel@lfdr.de>; Tue, 25 Apr 2023 09:27:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 664A510E67B;
	Tue, 25 Apr 2023 07:27:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47BA410E67B
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Apr 2023 07:27:07 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 5ED19219A7;
 Tue, 25 Apr 2023 07:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1682407625; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oEv8ITodsWIhDcRrkpQ+xWHYdagi2N5AX0Kq6I6nAFM=;
 b=ugvLbl3f+5SW4o41p7jrJM9/CTUSDjSw51V5YuUTan4/f91EkT587ArdPBl+MKKAPepjYB
 EZWdW52j2TLSTTSGOYkteLAPmSLF/ltiZYfMgpid9aSr926Fi3Ke1osPisG2luJNU+xVch
 sKv7B0iP1eBByFkojhQLCfpw+57SEDo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1682407625;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oEv8ITodsWIhDcRrkpQ+xWHYdagi2N5AX0Kq6I6nAFM=;
 b=7Q1Hazg2r27UccBAIqqyfo8HVHivbFCvmL0HuttuaUQoCJ6LESEq67lhs1MCITbsXdk3IA
 SCAPkXaB5Q2vhUCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 36E7C138E3;
 Tue, 25 Apr 2023 07:27:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 78cFDMmAR2RbOwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 25 Apr 2023 07:27:05 +0000
Message-ID: <d43c0c09-ff6b-e2d1-01ae-68fe93188896@suse.de>
Date: Tue, 25 Apr 2023 09:27:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] drm/ast: Fix modeset failed on DisplayPort
To: Jammy Huang <jammy_huang@aspeedtech.com>, airlied@redhat.com
References: <20230425070330.8520-1-jammy_huang@aspeedtech.com>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230425070330.8520-1-jammy_huang@aspeedtech.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------PxfkerZ3zaJRlZv1rWTKclyW"
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
--------------PxfkerZ3zaJRlZv1rWTKclyW
Content-Type: multipart/mixed; boundary="------------02nKpVuvcpnRadYyJ0pN0BUR";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Jammy Huang <jammy_huang@aspeedtech.com>, airlied@redhat.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Message-ID: <d43c0c09-ff6b-e2d1-01ae-68fe93188896@suse.de>
Subject: Re: [PATCH] drm/ast: Fix modeset failed on DisplayPort
References: <20230425070330.8520-1-jammy_huang@aspeedtech.com>
In-Reply-To: <20230425070330.8520-1-jammy_huang@aspeedtech.com>

--------------02nKpVuvcpnRadYyJ0pN0BUR
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjUuMDQuMjMgdW0gMDk6MDMgc2NocmllYiBKYW1teSBIdWFuZzoNCj4gSWYg
d2Ugc3dpdGNoIGRpc3BsYXkgYW5kIHVwZGF0ZSBjdXJzb3IgdG9nZXRoZXIsIGl0IGNvdWxk
IGxlYWQgdG8NCj4gbW9kZXNldCBmYWlsZWQgYmVjYXVzZSBvZiBjb25jdXJyZW50IGFjY2Vz
cyB0byBJTyByZWdpc3RlcnMuDQo+IA0KPiBBZGQgbG9jayBwcm90ZWN0aW9uIGluIERQJ3Mg
ZWRpZCBhY2Nlc3MgdG8gYXZvaWQgdGhpcyBwcm9ibGVtLg0KDQpUaGFua3MgZm9yIHRoZSBw
YXRjaC4gSSB0aG91Z2h0IEkgZml4ZWQgdGhpcyBpc3N1ZSBhbHJlYWR5LCBidXQgdGhhdCAN
CmFwcGFyZW50bHkgb25seSBoYXBwZW5lZCBmb3IgU0lMMTY0IGFuZCBWR0EuDQoNCldoYXQg
YWJvdXQgYXN0X2RwNTAxX2Nvbm5lY3Rvcl9oZWxwZXJfZ2V0X21vZGVzKCk/IERvZXMgaXQg
cmVxdWlyZSB0aGUgDQpsb2NraW5nIGFzIHdlbGw/DQoNCj4gDQo+IFNpZ25lZC1vZmYtYnk6
IEphbW15IEh1YW5nIDxqYW1teV9odWFuZ0Bhc3BlZWR0ZWNoLmNvbT4NCj4gLS0tDQo+ICAg
ZHJpdmVycy9ncHUvZHJtL2FzdC9hc3RfbW9kZS5jIHwgMTEgKysrKysrKysrKysNCj4gICAx
IGZpbGUgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9hc3QvYXN0X21vZGUuYyBiL2RyaXZlcnMvZ3B1L2RybS9hc3QvYXN0
X21vZGUuYw0KPiBpbmRleCA5ODRlYzU5MGE3ZTcuLmZlNWYxZmQ2MTM2MSAxMDA2NDQNCj4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2FzdC9hc3RfbW9kZS5jDQo+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS9hc3QvYXN0X21vZGUuYw0KPiBAQCAtMTYzNSw2ICsxNjM1LDggQEAgc3RhdGlj
IGludCBhc3RfZHA1MDFfb3V0cHV0X2luaXQoc3RydWN0IGFzdF9wcml2YXRlICphc3QpDQo+
ICAgc3RhdGljIGludCBhc3RfYXN0ZHBfY29ubmVjdG9yX2hlbHBlcl9nZXRfbW9kZXMoc3Ry
dWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvcikNCj4gICB7DQo+ICAgCXZvaWQgKmVkaWQ7
DQo+ICsJc3RydWN0IGRybV9kZXZpY2UgKmRldiA9IGNvbm5lY3Rvci0+ZGV2Ow0KPiArCXN0
cnVjdCBhc3RfcHJpdmF0ZSAqYXN0ID0gdG9fYXN0X3ByaXZhdGUoZGV2KTsNCg0KV2UndmUg
bWVhbndoaWxlIHJlbmFtZWQgYXN0X3ByaXZhdGUgdG8gYXN0X2RldmljZS4gQ291bGQgeW91
IHBsZWFzZSANCnByb3ZpZGUgYW4gdXBkYXRlZCBwYXRjaCBmb3IgdGhlIGRybS1taXNjLW5l
eHQgdHJlZT8NCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KPiAgIA0KPiAgIAlpbnQgc3Vj
YzsNCj4gICAJaW50IGNvdW50Ow0KPiBAQCAtMTY0MywxMCArMTY0NSwxOCBAQCBzdGF0aWMg
aW50IGFzdF9hc3RkcF9jb25uZWN0b3JfaGVscGVyX2dldF9tb2RlcyhzdHJ1Y3QgZHJtX2Nv
bm5lY3RvciAqY29ubmVjdG9yKQ0KPiAgIAlpZiAoIWVkaWQpDQo+ICAgCQlnb3RvIGVycl9k
cm1fY29ubmVjdG9yX3VwZGF0ZV9lZGlkX3Byb3BlcnR5Ow0KPiAgIA0KPiArCS8qDQo+ICsJ
ICogUHJvdGVjdCBhY2Nlc3MgdG8gSS9PIHJlZ2lzdGVycyBmcm9tIGNvbmN1cnJlbnQgbW9k
ZXNldHRpbmcNCj4gKwkgKiBieSBhY3F1aXJpbmcgdGhlIEkvTy1yZWdpc3RlciBsb2NrLg0K
PiArCSAqLw0KPiArCW11dGV4X2xvY2soJmFzdC0+aW9yZWdzX2xvY2spOw0KPiArDQo+ICAg
CXN1Y2MgPSBhc3RfYXN0ZHBfcmVhZF9lZGlkKGNvbm5lY3Rvci0+ZGV2LCBlZGlkKTsNCj4g
ICAJaWYgKHN1Y2MgPCAwKQ0KPiAgIAkJZ290byBlcnJfa2ZyZWU7DQo+ICAgDQo+ICsJbXV0
ZXhfdW5sb2NrKCZhc3QtPmlvcmVnc19sb2NrKTsNCj4gKw0KPiAgIAlkcm1fY29ubmVjdG9y
X3VwZGF0ZV9lZGlkX3Byb3BlcnR5KGNvbm5lY3RvciwgZWRpZCk7DQo+ICAgCWNvdW50ID0g
ZHJtX2FkZF9lZGlkX21vZGVzKGNvbm5lY3RvciwgZWRpZCk7DQo+ICAgCWtmcmVlKGVkaWQp
Ow0KPiBAQCAtMTY1NCw2ICsxNjY0LDcgQEAgc3RhdGljIGludCBhc3RfYXN0ZHBfY29ubmVj
dG9yX2hlbHBlcl9nZXRfbW9kZXMoc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvcikN
Cj4gICAJcmV0dXJuIGNvdW50Ow0KPiAgIA0KPiAgIGVycl9rZnJlZToNCj4gKwltdXRleF91
bmxvY2soJmFzdC0+aW9yZWdzX2xvY2spOw0KPiAgIAlrZnJlZShlZGlkKTsNCj4gICBlcnJf
ZHJtX2Nvbm5lY3Rvcl91cGRhdGVfZWRpZF9wcm9wZXJ0eToNCj4gICAJZHJtX2Nvbm5lY3Rv
cl91cGRhdGVfZWRpZF9wcm9wZXJ0eShjb25uZWN0b3IsIE5VTEwpOw0KPiANCj4gYmFzZS1j
b21taXQ6IDYxZDMyNWRjYmMwNWQ4ZmVmODgxMTBkMzVlZjc3NzZmM2FjM2Y2OGINCg0KLS0g
DQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBT
b2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpGcmFua2Vuc3RyYXNzZSAxNDYsIDkw
NDYxIE51ZXJuYmVyZywgR2VybWFueQ0KR0Y6IEl2byBUb3RldiwgQW5kcmV3IE15ZXJzLCBB
bmRyZXcgTWNEb25hbGQsIEJvdWRpZW4gTW9lcm1hbg0KSFJCIDM2ODA5IChBRyBOdWVybmJl
cmcpDQo=

--------------02nKpVuvcpnRadYyJ0pN0BUR--

--------------PxfkerZ3zaJRlZv1rWTKclyW
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmRHgMgFAwAAAAAACgkQlh/E3EQov+Bn
yRAAs0xz5+H8C8CAgKNKLjWEl9yirdNPOEEW9ch7Gtmfi/zuuds3vltmJ9vnaIUEH6dgiZ1fHqAr
gG/dvhuIhkw8kabHIFEH/t3tlPu690S6UHPOtzf5yU5c+Po0+fJ3Ba2IEpfCS2yTESPE8TiVjpPa
QJ77y61Pi6rYlrQCDpAao4aRV71bQ1/FQ24eXVxxkUoSNUTWJO8uigamq0bdTso9iuAlEEAr21kb
iIOsaByBMfEE8J/xdqm8gM9oQIzrBAuTFOOsSuNDaRxaZKMGsK9xljcTXETWBxpmNtPD1AbVV4Rt
YUblc74UbegQ+Nr80AKOfvdjHpSCu/mb2BvT3rnpvAGmwY370+U8Y7O4py034NTG8B+R1WfBCQxj
nvuk+taJMs0EqIZmX/QNlY/bW1kxdKUt7e0kCDMP7zKfJf99IA7tRex8RXSMCrv6r4luAFqd5nYa
2Dmb8uImtOQHWLTFhafuJOY9TihmuYyj6yUkWaX1Ft2TPSfyXfSiWYL5moND/dQ2x+VHPR/+oChx
Kx83rp4Yu1mQha/nVqcflGgbdP2V0aRZAZNqdH31qcA3R1BNAEe8loEXm0OJo2qb8aimP5I/9PGm
Ge6d6mQkz8gLWmxW40C8UbARoN51esdjF4n/yOdAYGt6mTaEhxDi/qtMTJfKbkKd5372LH0yPrq2
IWQ=
=TGa/
-----END PGP SIGNATURE-----

--------------PxfkerZ3zaJRlZv1rWTKclyW--
