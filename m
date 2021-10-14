Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E23042D97F
	for <lists+dri-devel@lfdr.de>; Thu, 14 Oct 2021 14:50:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E73226E16D;
	Thu, 14 Oct 2021 12:50:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C43C6E16D
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Oct 2021 12:50:24 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 48B641FD33;
 Thu, 14 Oct 2021 12:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1634215823; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Yt2TYuRnN5itaGbtgaV8pVQSGYp7qazmQcveVk85am0=;
 b=CQfrTMbW82SvhPgoVHCSr5qRgucLMpLq9SZoBTYvoi61RV810U3vEu9pfuyjenj0+MDg+8
 nC+8BrUPBr1jj60ynmtPlMTnBJzBwMX1ydh8zUYnYIUAFVCvjMpfvjX+eQzzhMV0r1o3S6
 ZiL0GNWTVFBoNWdThDrz8kOOB5mf2wA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1634215823;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Yt2TYuRnN5itaGbtgaV8pVQSGYp7qazmQcveVk85am0=;
 b=14ozMyQiWFLPkeRCbdpJjyH403q2Zo8/+pOe5zDMpdambUpNmg9T1/U6EGq4y7F/8o8mi8
 lU3jh6dSYH+Cu7AA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2BC8713D8A;
 Thu, 14 Oct 2021 12:50:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id RVd6CY8naGGRSAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 14 Oct 2021 12:50:23 +0000
Message-ID: <81a14354-e03a-7768-ed90-effc5adf19f2@suse.de>
Date: Thu, 14 Oct 2021 14:50:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.2
Subject: Re: [PATCH v3 7/7] drm/kmb: Enable support for framebuffer console
Content-Language: en-US
To: Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
 dri-devel@lists.freedesktop.org
Cc: sam@ravnborg.org, edmund.j.dea@intel.com
References: <20211013233632.471892-1-anitha.chrisanthus@intel.com>
 <20211013233632.471892-7-anitha.chrisanthus@intel.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20211013233632.471892-7-anitha.chrisanthus@intel.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------bhrvPp8fPJxAz6B1EvRa0vZh"
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
--------------bhrvPp8fPJxAz6B1EvRa0vZh
Content-Type: multipart/mixed; boundary="------------M11tOGIRejLV7bINMrtw0vW0";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
 dri-devel@lists.freedesktop.org
Cc: sam@ravnborg.org, edmund.j.dea@intel.com
Message-ID: <81a14354-e03a-7768-ed90-effc5adf19f2@suse.de>
Subject: Re: [PATCH v3 7/7] drm/kmb: Enable support for framebuffer console
References: <20211013233632.471892-1-anitha.chrisanthus@intel.com>
 <20211013233632.471892-7-anitha.chrisanthus@intel.com>
In-Reply-To: <20211013233632.471892-7-anitha.chrisanthus@intel.com>

--------------M11tOGIRejLV7bINMrtw0vW0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTQuMTAuMjEgdW0gMDE6MzYgc2NocmllYiBBbml0aGEgQ2hyaXNhbnRodXM6
DQo+IEVuYWJsZSBzdXBwb3J0IGZvciBmYmNvbiAoZnJhbWVidWZmZXIgY29uc29sZSkuDQo+
IFRoZSB1c2VyIGNhbiBpbml0aWFsaXplIGZiY29uIGJ5IGxvYWRpbmcga21iLWRybSB3aXRo
IHRoZSBwYXJhbWV0ZXINCj4gY29uc29sZT0xLg0KPiANCj4gdjI6IGFkZGVkIG1pc3Npbmcg
c3RhdGljIGNsa19lbmFibGUNCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEVkbXVuZCBEZWEgPGVk
bXVuZC5qLmRlYUBpbnRlbC5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IEFuaXRoYSBDaHJpc2Fu
dGh1cyA8YW5pdGhhLmNocmlzYW50aHVzQGludGVsLmNvbT4NCj4gLS0tDQo+ICAgZHJpdmVy
cy9ncHUvZHJtL2ttYi9rbWJfZHJ2LmMgfCAxMSArKysrKysrKysrKw0KPiAgIDEgZmlsZSBj
aGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2ttYi9rbWJfZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0va21iL2ttYl9kcnYuYw0K
PiBpbmRleCA5NjFhYzZmYjVmY2YuLmI0ZTY2ZWFjNjNiNSAxMDA2NDQNCj4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2ttYi9rbWJfZHJ2LmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2tt
Yi9rbWJfZHJ2LmMNCj4gQEAgLTUsNiArNSw3IEBADQo+ICAgDQo+ICAgI2luY2x1ZGUgPGxp
bnV4L2Nsay5oPg0KPiAgICNpbmNsdWRlIDxsaW51eC9tb2R1bGUuaD4NCj4gKyNpbmNsdWRl
IDxsaW51eC9tb2R1bGVwYXJhbS5oPg0KPiAgICNpbmNsdWRlIDxsaW51eC9vZl9ncmFwaC5o
Pg0KPiAgICNpbmNsdWRlIDxsaW51eC9vZl9wbGF0Zm9ybS5oPg0KPiAgICNpbmNsdWRlIDxs
aW51eC9vZl9yZXNlcnZlZF9tZW0uaD4NCj4gQEAgLTE1LDYgKzE2LDcgQEANCj4gICANCj4g
ICAjaW5jbHVkZSA8ZHJtL2RybV9hdG9taWNfaGVscGVyLmg+DQo+ICAgI2luY2x1ZGUgPGRy
bS9kcm1fZHJ2Lmg+DQo+ICsjaW5jbHVkZSA8ZHJtL2RybV9mYl9oZWxwZXIuaD4NCj4gICAj
aW5jbHVkZSA8ZHJtL2RybV9nZW1fY21hX2hlbHBlci5oPg0KPiAgICNpbmNsdWRlIDxkcm0v
ZHJtX2dlbV9mcmFtZWJ1ZmZlcl9oZWxwZXIuaD4NCj4gICAjaW5jbHVkZSA8ZHJtL2RybV9w
cm9iZV9oZWxwZXIuaD4NCj4gQEAgLTI0LDYgKzI2LDEyIEBADQo+ICAgI2luY2x1ZGUgImtt
Yl9kc2kuaCINCj4gICAjaW5jbHVkZSAia21iX3JlZ3MuaCINCj4gICANCj4gKy8qIE1vZHVs
ZSBQYXJhbWV0ZXJzICovDQo+ICtzdGF0aWMgYm9vbCBjb25zb2xlOw0KPiArbW9kdWxlX3Bh
cmFtKGNvbnNvbGUsIGJvb2wsIDA0MDApOw0KPiArTU9EVUxFX1BBUk1fREVTQyhjb25zb2xl
LA0KPiArCQkgIkVuYWJsZSBmcmFtZWJ1ZmZlciBjb25zb2xlIHN1cHBvcnQgKDA9ZGlzYWJs
ZSBbZGVmYXVsdF0sIDE9b24pIik7DQoNClRoZXJlJ3MgYWxyZWFkeSBmYmRldl9lbXVsYXRp
b24gaW4gZHJtX2ZiX2hlbHBlci5jLiBObyBuZWVkIGZvciBhIA0Kc2VwYXJhdGUgcGFyYW1l
dGVyIGhlcmUuDQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCj4gKw0KPiAgIHN0YXRpYyBp
bnQga21iX2Rpc3BsYXlfY2xrX2VuYWJsZShzdHJ1Y3Qga21iX2RybV9wcml2YXRlICprbWIp
DQo+ICAgew0KPiAgIAlpbnQgcmV0ID0gMDsNCj4gQEAgLTU1OSw2ICs1NjcsOSBAQCBzdGF0
aWMgaW50IGttYl9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiAgIAlp
ZiAocmV0KQ0KPiAgIAkJZ290byBlcnJfcmVnaXN0ZXI7DQo+ICAgDQo+ICsJaWYgKGNvbnNv
bGUpDQo+ICsJCWRybV9mYmRldl9nZW5lcmljX3NldHVwKCZrbWItPmRybSwgMzIpOw0KPiAr
DQo+ICAgCXJldHVybiAwOw0KPiAgIA0KPiAgICBlcnJfcmVnaXN0ZXI6DQo+IA0KDQotLSAN
ClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNv
ZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIuIDUsIDkwNDA5IE7D
vHJuYmVyZywgR2VybWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0
c2bDvGhyZXI6IEZlbGl4IEltZW5kw7ZyZmZlcg0K

--------------M11tOGIRejLV7bINMrtw0vW0--

--------------bhrvPp8fPJxAz6B1EvRa0vZh
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmFoJ44FAwAAAAAACgkQlh/E3EQov+DI
hA//cqaFqytY31lItJUQZGq7rHhfvHc7P8icuRG6NqU4wu46SQCnsFp1PVX4M/vVxg+LttkdLZwE
fNWkZzibGGbCdf6H4vIqlL9AuGgRiWbYdHlZSnP3z9yiJ2bOJP9Z9CQUJ7vgR65AyW/xeFogR1jt
o6ZJXpqhU7VDmbq5tcRQ2dR6z9bk9QRy/xsoRWdPuSrMhsJxqHYMH6Bih0alVXf0LHzfe2B5IFyd
YKeMwE6oA5ktJAFfx6p1fkPbq32mKQHJXH3VAqOsh+DkKXx6WWbs+SBZNwQpNUyxW0yGphG7oSLI
jBONVIngWVgw44tENpvj0K+nwqWNyGwb3wTTsh1tlZzFH3pIzAPAzrE7BtOOkijSgK5tCj1mmzkE
SYFyEuNwF4jJVZ9fLafMSURd294qUmcmQcXCXQLv74pWTBZg8IxdLtjW1pe5OReX1xIAp4uMLzQh
9LhK4Wp5b5mXnaZ2KJcS6/T61uNBp8bYFlDtRjP5zxafkr8ok9njxqUFDQYSaSuOwebqFvMab+C3
oTZ31ULqwtB+MDOzLRrga2s00L4KyDSVxqXCmqDBfn8szG9UZ6wi/Ludh2pr9LKF3keYbXXFqCNW
MEGd+u0UDpiAMdUFEU8aV5aDdw+qCg9uzaMNf8nK87G/40SUcylAQxuwijw5kxMpTsccSiAbbBNz
mV8=
=0x2/
-----END PGP SIGNATURE-----

--------------bhrvPp8fPJxAz6B1EvRa0vZh--
