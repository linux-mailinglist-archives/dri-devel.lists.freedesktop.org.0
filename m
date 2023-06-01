Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 328E2719655
	for <lists+dri-devel@lfdr.de>; Thu,  1 Jun 2023 11:04:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00F2B10E21B;
	Thu,  1 Jun 2023 09:04:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF88C10E21B
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Jun 2023 09:04:43 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 8B58321985;
 Thu,  1 Jun 2023 09:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1685610281; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Rz7freKA1+2v0T9mj5JS7fcoX0COXAEGRmV8ZldKUlY=;
 b=qlT3RK6BvGSSML4nFNrWelnh4sKeXbH4WlY3s7KwAt3RHMS2RDlZ7P4I4PvuLWG6IgZqY7
 N61vB0MgA1Y4Ipq1klSjqLC9carwVUzrkGodOgXaFEkaUQtxvGIvrsaiDGhFNhQ9H6uexQ
 W+zdDQbGN+4D8KwNUSJsZ4ip4WUMCDs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1685610281;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Rz7freKA1+2v0T9mj5JS7fcoX0COXAEGRmV8ZldKUlY=;
 b=2PVQWe1CbSGqVpSqydRSw8oAUxNUZfxZbPasAW4FhIAZwwwMTaIBaXgR7U7UDAX8tbKbf7
 8VvVz6ehRhiJ8yAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6822E13441;
 Thu,  1 Jun 2023 09:04:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id kXc3GClfeGTCGQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 01 Jun 2023 09:04:41 +0000
Message-ID: <2ddf5210-a130-d496-53d9-29b7a068c182@suse.de>
Date: Thu, 1 Jun 2023 11:04:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v3] drm/ast: Fix modeset failed on DisplayPort
To: Jammy Huang <jammy_huang@aspeedtech.com>, airlied@redhat.com,
 airlied@gmail.com, daniel@ffwll.ch
References: <20230601004847.1115-1-jammy_huang@aspeedtech.com>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230601004847.1115-1-jammy_huang@aspeedtech.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------tAY3WyZt822BDJic0jH0JYma"
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
--------------tAY3WyZt822BDJic0jH0JYma
Content-Type: multipart/mixed; boundary="------------VdrbKW5ihEJuyslJsZdEZPUN";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Jammy Huang <jammy_huang@aspeedtech.com>, airlied@redhat.com,
 airlied@gmail.com, daniel@ffwll.ch
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Message-ID: <2ddf5210-a130-d496-53d9-29b7a068c182@suse.de>
Subject: Re: [PATCH v3] drm/ast: Fix modeset failed on DisplayPort
References: <20230601004847.1115-1-jammy_huang@aspeedtech.com>
In-Reply-To: <20230601004847.1115-1-jammy_huang@aspeedtech.com>

--------------VdrbKW5ihEJuyslJsZdEZPUN
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDEuMDYuMjMgdW0gMDI6NDggc2NocmllYiBKYW1teSBIdWFuZzoNCj4gSWYg
d2Ugc3dpdGNoIGRpc3BsYXkgYW5kIHVwZGF0ZSBjdXJzb3IgdG9nZXRoZXIsIGl0IGNvdWxk
IGxlYWQgdG8NCj4gbW9kZXNldCBmYWlsZWQgYmVjYXVzZSBvZiBjb25jdXJyZW50IGFjY2Vz
cyB0byBJTyByZWdpc3RlcnMuDQo+IA0KPiBBZGQgbG9jayBwcm90ZWN0aW9uIGluIERQJ3Mg
ZWRpZCBhY2Nlc3MgdG8gYXZvaWQgdGhpcyBwcm9ibGVtLg0KDQpNZXJnZWQgaW50byBkcm0t
bWlzYy1maXhlcy4gVGhhbmtzIGZvciB0aGUgcGF0Y2guDQoNCkJlc3QgcmVnYXJkcw0KVGhv
bWFzDQoNCj4gDQo+IFJldmlld2VkLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1h
bm5Ac3VzZS5kZT4NCj4gU2lnbmVkLW9mZi1ieTogSmFtbXkgSHVhbmcgPGphbW15X2h1YW5n
QGFzcGVlZHRlY2guY29tPg0KPiAtLS0NCj4gICB2MyBjaGFuZ2VzOg0KPiAgICAtIFVwZGF0
ZSBsYWJlbCBuYW1lIGFmdGVyIG11dGV4IGFkZGVkLg0KPiAgIHYyIGNoYW5nZXM6DQo+ICAg
IC0gRml4IGJ1aWxkIGVycm9yIHNpbmNlIG5ldyBzdHJ1Y3QgYXN0X2RldmljZSBpcyB1c2Vk
Lg0KPiAtLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9tb2RlLmMgfCAxNSArKysr
KysrKysrKysrLS0NCj4gICAxIGZpbGUgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKSwgMiBk
ZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXN0L2Fz
dF9tb2RlLmMgYi9kcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9tb2RlLmMNCj4gaW5kZXggMzYz
NzQ4MjhmNmM4Li5iM2M2NzBhZjZlZjIgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9hc3QvYXN0X21vZGUuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9tb2Rl
LmMNCj4gQEAgLTE2NDcsNiArMTY0Nyw4IEBAIHN0YXRpYyBpbnQgYXN0X2RwNTAxX291dHB1
dF9pbml0KHN0cnVjdCBhc3RfZGV2aWNlICphc3QpDQo+ICAgc3RhdGljIGludCBhc3RfYXN0
ZHBfY29ubmVjdG9yX2hlbHBlcl9nZXRfbW9kZXMoc3RydWN0IGRybV9jb25uZWN0b3IgKmNv
bm5lY3RvcikNCj4gICB7DQo+ICAgCXZvaWQgKmVkaWQ7DQo+ICsJc3RydWN0IGRybV9kZXZp
Y2UgKmRldiA9IGNvbm5lY3Rvci0+ZGV2Ow0KPiArCXN0cnVjdCBhc3RfZGV2aWNlICphc3Qg
PSB0b19hc3RfZGV2aWNlKGRldik7DQo+ICAgDQo+ICAgCWludCBzdWNjOw0KPiAgIAlpbnQg
Y291bnQ7DQo+IEBAIC0xNjU1LDkgKzE2NTcsMTcgQEAgc3RhdGljIGludCBhc3RfYXN0ZHBf
Y29ubmVjdG9yX2hlbHBlcl9nZXRfbW9kZXMoc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5l
Y3RvcikNCj4gICAJaWYgKCFlZGlkKQ0KPiAgIAkJZ290byBlcnJfZHJtX2Nvbm5lY3Rvcl91
cGRhdGVfZWRpZF9wcm9wZXJ0eTsNCj4gICANCj4gKwkvKg0KPiArCSAqIFByb3RlY3QgYWNj
ZXNzIHRvIEkvTyByZWdpc3RlcnMgZnJvbSBjb25jdXJyZW50IG1vZGVzZXR0aW5nDQo+ICsJ
ICogYnkgYWNxdWlyaW5nIHRoZSBJL08tcmVnaXN0ZXIgbG9jay4NCj4gKwkgKi8NCj4gKwlt
dXRleF9sb2NrKCZhc3QtPmlvcmVnc19sb2NrKTsNCj4gKw0KPiAgIAlzdWNjID0gYXN0X2Fz
dGRwX3JlYWRfZWRpZChjb25uZWN0b3ItPmRldiwgZWRpZCk7DQo+ICAgCWlmIChzdWNjIDwg
MCkNCj4gLQkJZ290byBlcnJfa2ZyZWU7DQo+ICsJCWdvdG8gZXJyX211dGV4X3VubG9jazsN
Cj4gKw0KPiArCW11dGV4X3VubG9jaygmYXN0LT5pb3JlZ3NfbG9jayk7DQo+ICAgDQo+ICAg
CWRybV9jb25uZWN0b3JfdXBkYXRlX2VkaWRfcHJvcGVydHkoY29ubmVjdG9yLCBlZGlkKTsN
Cj4gICAJY291bnQgPSBkcm1fYWRkX2VkaWRfbW9kZXMoY29ubmVjdG9yLCBlZGlkKTsNCj4g
QEAgLTE2NjUsNyArMTY3NSw4IEBAIHN0YXRpYyBpbnQgYXN0X2FzdGRwX2Nvbm5lY3Rvcl9o
ZWxwZXJfZ2V0X21vZGVzKHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IpDQo+ICAg
DQo+ICAgCXJldHVybiBjb3VudDsNCj4gICANCj4gLWVycl9rZnJlZToNCj4gK2Vycl9tdXRl
eF91bmxvY2s6DQo+ICsJbXV0ZXhfdW5sb2NrKCZhc3QtPmlvcmVnc19sb2NrKTsNCj4gICAJ
a2ZyZWUoZWRpZCk7DQo+ICAgZXJyX2RybV9jb25uZWN0b3JfdXBkYXRlX2VkaWRfcHJvcGVy
dHk6DQo+ICAgCWRybV9jb25uZWN0b3JfdXBkYXRlX2VkaWRfcHJvcGVydHkoY29ubmVjdG9y
LCBOVUxMKTsNCj4gDQo+IGJhc2UtY29tbWl0OiBlMzM4MTQyYjM5Y2Y0MDE1NTA1NGY5NWRh
YTI4ZDIxMGQyZWUxYjJkDQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERy
aXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0K
RnJhbmtlbnN0cmFzc2UgMTQ2LCA5MDQ2MSBOdWVybmJlcmcsIEdlcm1hbnkNCkdGOiBJdm8g
VG90ZXYsIEFuZHJldyBNeWVycywgQW5kcmV3IE1jRG9uYWxkLCBCb3VkaWVuIE1vZXJtYW4N
CkhSQiAzNjgwOSAoQUcgTnVlcm5iZXJnKQ0K

--------------VdrbKW5ihEJuyslJsZdEZPUN--

--------------tAY3WyZt822BDJic0jH0JYma
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmR4XygFAwAAAAAACgkQlh/E3EQov+B8
6xAAnNy/afTZu9lDoy+4unmXkjy/vV01UOpoL572vBcR6XOi2RqB1XuGjOolsLDcLUqSih1/Z46R
6nEDtwV+T2IWBgfVuZganxLhHbS4ny22Xc51fBfbEqLFr6Hi+YH+uKwIAFf4ns5OXWtaJ2i4tOi9
awJVerKcN4QxV1nrKypdyx+WVyI7z+wDFlmXyWrn2cA/FIlQRvkXaF9mGCTzCgt3Zl7hVKUHaMru
F14V+/2aMnDx8G+3XcHnXfvSepSfpfbxDpyPAr5o3ZF8ZFnqpzowxzKp+VjXCznvx5vKs/QHqmSg
NvnJOKRZulABw0vUmVjRsxaj6xD6gMQQ6uMSDhVWlwTazPn043XlsIP0HaqVLN3IcnZFV7Q0SWgF
cowx0pogM9DCTdl5byWdeeOhEsIQzEFLN4LbeddhfNewdqU5rPHvfcGQZiyDBnrL/QQKCX03HdTM
IH5M+qNYqqPEu9OEKBg8OBbB/gyXX4le7oBDk/22gWUw6/qIZ2Wnr9xwCMCmRZDCZ9TxLZkfQZ11
B0nIYIBeKSfXwbV44DFKHuHzVe6/x/cb+wlQ5y1rH/LOrz0AgvJE6HJtPstfDyT50L8iMiyYfuI1
55zSN7SgttEUzK6IzQHgwmhhGTgglpbXXhsEmnhzKN2Ej4Wc79NmKrADSGiXgoWf+C+pE91B5fkq
qWk=
=Mnxh
-----END PGP SIGNATURE-----

--------------tAY3WyZt822BDJic0jH0JYma--
