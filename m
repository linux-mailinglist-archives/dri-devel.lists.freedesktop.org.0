Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 715795F0847
	for <lists+dri-devel@lfdr.de>; Fri, 30 Sep 2022 12:11:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B1F810EC34;
	Fri, 30 Sep 2022 10:11:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B37DF10EC34
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Sep 2022 10:11:02 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 7214B1F86B;
 Fri, 30 Sep 2022 10:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1664532661; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ipPL8K7GWD7doGo6TpSeoTpSR79g8wTtKq37M8sYqRY=;
 b=NRA1IjLWqDII1XYk54w2vUbGDGIM/mUV6zILTr8aAGE69vRaJ63Y71VAkijbPyszOmfPpo
 iau11436PD0j45a8HK5U4GTPqU6uj2hc262bzR1c+ASdV3k4afav8cVKiCDXCDwrBAzkgz
 RKFqreVZI1yYeNj8nUdcfjWliYIterI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1664532661;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ipPL8K7GWD7doGo6TpSeoTpSR79g8wTtKq37M8sYqRY=;
 b=lLo2kvnAZusskLKo2jBQ3vx0NDIa7YPw8z7QntiwYjoR0SeMg7lfN9/yuhPIdHygIhbqaS
 XK2LdQm1FL/w9xAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5329013677;
 Fri, 30 Sep 2022 10:11:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id EpZ4E7XANmN1bgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 30 Sep 2022 10:11:01 +0000
Message-ID: <65fd4526-f223-d425-3e69-04fe5485c87c@suse.de>
Date: Fri, 30 Sep 2022 12:11:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH] drm/ssd130x: Iterate over damage clips instead of using a
 merged rect
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org
References: <20220930080123.2441629-1-javierm@redhat.com>
 <a72d4736-74e1-1485-e952-f39909d94fbc@suse.de>
 <da9fddaa-2329-c91b-a89d-c998c5720917@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <da9fddaa-2329-c91b-a89d-c998c5720917@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Wmym8a30k7p3Wl5HBMYto2M8"
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
Cc: David Airlie <airlied@linux.ie>, Jocelyn Falempe <jfalempe@redhat.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------Wmym8a30k7p3Wl5HBMYto2M8
Content-Type: multipart/mixed; boundary="------------zrPzZb4Gou7T986Fk91LhYPN";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org
Cc: David Airlie <airlied@linux.ie>, Jocelyn Falempe <jfalempe@redhat.com>,
 dri-devel@lists.freedesktop.org
Message-ID: <65fd4526-f223-d425-3e69-04fe5485c87c@suse.de>
Subject: Re: [PATCH] drm/ssd130x: Iterate over damage clips instead of using a
 merged rect
References: <20220930080123.2441629-1-javierm@redhat.com>
 <a72d4736-74e1-1485-e952-f39909d94fbc@suse.de>
 <da9fddaa-2329-c91b-a89d-c998c5720917@redhat.com>
In-Reply-To: <da9fddaa-2329-c91b-a89d-c998c5720917@redhat.com>

--------------zrPzZb4Gou7T986Fk91LhYPN
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMzAuMDkuMjIgdW0gMTE6MjUgc2NocmllYiBKYXZpZXIgTWFydGluZXogQ2Fu
aWxsYXM6DQo+IEhlbGxvIFRob21hcywNCj4gDQo+IFRoYW5rcyBhIGxvdCBmb3IgeW91ciBm
ZWVkYmFjay4NCj4gDQo+IE9uIDkvMzAvMjIgMTA6MjYsIFRob21hcyBaaW1tZXJtYW5uIHdy
b3RlOg0KPj4gSGkNCj4+DQo+PiBBbSAzMC4wOS4yMiB1bSAxMDowMSBzY2hyaWViIEphdmll
ciBNYXJ0aW5leiBDYW5pbGxhczoNCj4+PiBUaGUgZHJtX2F0b21pY19oZWxwZXJfZGFtYWdl
X21lcmdlZCgpIGhlbHBlciBtZXJnZXMgYWxsIHRoZSBkYW1hZ2UgY2xpcHMNCj4+PiBpbnRv
IG9uZSByZWN0YW5nbGUuIElmIHRoZXJlIGFyZSBtdWx0aXBsZSBkYW1hZ2UgY2xpcHMgdGhh
dCBhcmVuJ3QgY2xvc2UNCj4+PiB0byBlYWNoIG90aGVyLCB0aGUgcmVzdWx0aW5nIHJlY3Rh
bmdsZSBjb3VsZCBiZSBxdWl0ZSBiaWcuDQo+Pj4NCj4+PiBJbnN0ZWFkIG9mIHVzaW5nIHRo
YXQgZnVuY3Rpb24gaGVscGVyLCBpdGVyYXRlIG92ZXIgYWxsIHRoZSBkYW1hZ2UgY2xpcHMN
Cj4+PiBhbmQgdXBkYXRlIHRoZW0gb25lIGJ5IG9uZS4NCj4+Pg0KPj4+IFN1Z2dlc3RlZC1i
eTogSm9jZWx5biBGYWxlbXBlIDxqZmFsZW1wZUByZWRoYXQuY29tPg0KPj4+IFNpZ25lZC1v
ZmYtYnk6IEphdmllciBNYXJ0aW5leiBDYW5pbGxhcyA8amF2aWVybUByZWRoYXQuY29tPg0K
Pj4+IC0tLQ0KPj4+DQo+Pj4gICAgZHJpdmVycy9ncHUvZHJtL3NvbG9tb24vc3NkMTMweC5j
IHwgMTggKysrKysrKysrKy0tLS0tLS0tDQo+Pj4gICAgMSBmaWxlIGNoYW5nZWQsIDEwIGlu
c2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pDQo+Pj4NCj4+PiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL3NvbG9tb24vc3NkMTMweC5jIGIvZHJpdmVycy9ncHUvZHJtL3NvbG9t
b24vc3NkMTMweC5jDQo+Pj4gaW5kZXggYmM0MWE1YWU4MTBhLi4yNDI4ZjE4MTNhOGQgMTAw
NjQ0DQo+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3NvbG9tb24vc3NkMTMweC5jDQo+Pj4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL3NvbG9tb24vc3NkMTMweC5jDQo+Pj4gQEAgLTU3OCwy
MSArNTc4LDIzIEBAIHN0YXRpYyB2b2lkIHNzZDEzMHhfcHJpbWFyeV9wbGFuZV9oZWxwZXJf
YXRvbWljX3VwZGF0ZShzdHJ1Y3QgZHJtX3BsYW5lICpwbGFuZSwNCj4+PiAgICAJc3RydWN0
IGRybV9wbGFuZV9zdGF0ZSAqcGxhbmVfc3RhdGUgPSBkcm1fYXRvbWljX2dldF9uZXdfcGxh
bmVfc3RhdGUoc3RhdGUsIHBsYW5lKTsNCj4+PiAgICAJc3RydWN0IGRybV9wbGFuZV9zdGF0
ZSAqb2xkX3BsYW5lX3N0YXRlID0gZHJtX2F0b21pY19nZXRfb2xkX3BsYW5lX3N0YXRlKHN0
YXRlLCBwbGFuZSk7DQo+Pj4gICAgCXN0cnVjdCBkcm1fc2hhZG93X3BsYW5lX3N0YXRlICpz
aGFkb3dfcGxhbmVfc3RhdGUgPSB0b19kcm1fc2hhZG93X3BsYW5lX3N0YXRlKHBsYW5lX3N0
YXRlKTsNCj4+PiArCXN0cnVjdCBkcm1fYXRvbWljX2hlbHBlcl9kYW1hZ2VfaXRlciBpdGVy
Ow0KPj4+ICAgIAlzdHJ1Y3QgZHJtX2RldmljZSAqZHJtID0gcGxhbmUtPmRldjsNCj4+PiAt
CXN0cnVjdCBkcm1fcmVjdCBzcmNfY2xpcCwgZHN0X2NsaXA7DQo+Pj4gKwlzdHJ1Y3QgZHJt
X3JlY3QgZHN0X2NsaXA7DQo+Pj4gKwlzdHJ1Y3QgZHJtX3JlY3QgZGFtYWdlOw0KPj4+ICAg
IAlpbnQgaWR4Ow0KPj4+ICAgIA0KPj4+IC0JaWYgKCFkcm1fYXRvbWljX2hlbHBlcl9kYW1h
Z2VfbWVyZ2VkKG9sZF9wbGFuZV9zdGF0ZSwgcGxhbmVfc3RhdGUsICZzcmNfY2xpcCkpDQo+
Pj4gLQkJcmV0dXJuOw0KPj4+IC0NCj4+PiAgICAJZHN0X2NsaXAgPSBwbGFuZV9zdGF0ZS0+
ZHN0Ow0KPj4+IC0JaWYgKCFkcm1fcmVjdF9pbnRlcnNlY3QoJmRzdF9jbGlwLCAmc3JjX2Ns
aXApKQ0KPj4+IC0JCXJldHVybjsNCj4+PiAtDQo+Pj4gICAgCWlmICghZHJtX2Rldl9lbnRl
cihkcm0sICZpZHgpKQ0KPj4+ICAgIAkJcmV0dXJuOw0KPj4+ICAgIA0KPj4+IC0Jc3NkMTMw
eF9mYl9ibGl0X3JlY3QocGxhbmVfc3RhdGUtPmZiLCAmc2hhZG93X3BsYW5lX3N0YXRlLT5k
YXRhWzBdLCAmZHN0X2NsaXApOw0KPj4+ICsJZHJtX2F0b21pY19oZWxwZXJfZGFtYWdlX2l0
ZXJfaW5pdCgmaXRlciwgb2xkX3BsYW5lX3N0YXRlLCBwbGFuZV9zdGF0ZSk7DQo+Pj4gKwlk
cm1fYXRvbWljX2Zvcl9lYWNoX3BsYW5lX2RhbWFnZSgmaXRlciwgJmRhbWFnZSkgew0KPj4+
ICsJCWlmICghZHJtX3JlY3RfaW50ZXJzZWN0KCZkc3RfY2xpcCwgJmRhbWFnZSkpDQo+Pj4g
KwkJCWNvbnRpbnVlOw0KPj4NCj4+IGRzdF9jbGlwIHdpbGwgYmUgb3ZlcndyaXR0ZW4gaGVy
ZS4gU28gbmVlZCB0byBpbml0IGl0IHdpdGhpbiB0aGUgbG9vcCBmaXJzdC4NCj4+DQo+IA0K
PiBPaCwgaW5kZWVkLiBJJ2xsIG1vdmUgaXQgaW5zaWRlIHRoZSBsb29wLiBUaGFua3MgZm9y
IGNhdGNoaW5nIHRoaXMuDQo+IA0KPj4+ICsNCj4+PiArCQlzc2QxMzB4X2ZiX2JsaXRfcmVj
dChwbGFuZV9zdGF0ZS0+ZmIsICZzaGFkb3dfcGxhbmVfc3RhdGUtPmRhdGFbMF0sICZkYW1h
Z2UpOw0KPj4NCj4+IEluIHNpbXBsZWRybSwgd2UgYWRqdXN0IHRoZSBkZXN0aW5hdGlvbiBh
ZGRyZXNzIHdpdGggZHN0X2NsaXAgbGlrZSB0aGlzOg0KPj4NCj4+ICAgICBpb3N5c19tYXBf
aW5jcigmZHN0LCBkcm1fZmJfY2xpcF9vZmZzZXQoc2Rldi0+cGl0Y2gsIHNkZXYtPmZvcm1h
dCwNCj4+ICZkc3RfY2xpcCkpOw0KPj4NCj4+IEhvdyBkb2VzIHRoaXMgd29yayBpbiBzc2Qx
MzB4PyBZb3UgbmV2ZXIgdXNlIGRzdF9jbGlwIHRvIGFkanVzdCB0byB0aGUNCj4+IGNoYW5n
ZWQgbG9jYXRpb24uIFdvbid0IHlvdSBoYXZlIG91dC1vZi1ib3VuZHMgd3JpdGVzIG9uIHRo
ZSBkZXZpY2U/DQo+Pg0KPiANCj4gUmlnaHQsIGluIHNzZDEzMHggd2hhdCBJIGRvIGlzOg0K
PiANCj4gc3RhdGljIGludCBzc2QxMzB4X2ZiX2JsaXRfcmVjdChzdHJ1Y3QgZHJtX2ZyYW1l
YnVmZmVyICpmYiwgY29uc3Qgc3RydWN0IGlvc3lzX21hcCAqdm1hcCwNCj4gCQkJCXN0cnVj
dCBkcm1fcmVjdCAqcmVjdCkNCj4gew0KPiAJc3RydWN0IGlvc3lzX21hcCBkc3Q7DQo+IC4u
Lg0KPiAJdTggKmJ1ZiA9IE5VTEw7DQo+IC4uLg0KPiAJYnVmID0ga2NhbGxvYyhkc3RfcGl0
Y2gsIGRybV9yZWN0X2hlaWdodChyZWN0KSwgR0ZQX0tFUk5FTCk7DQo+IC4uLg0KPiAJaW9z
eXNfbWFwX3NldF92YWRkcigmZHN0LCBidWYpOw0KPiAJZHJtX2ZiX3hyZ2I4ODg4X3RvX21v
bm8oJmRzdCwgJmRzdF9waXRjaCwgdm1hcCwgZmIsIHJlY3QpOw0KPiAuLi4NCj4gCXNzZDEz
MHhfdXBkYXRlX3JlY3Qoc3NkMTMweCwgYnVmLCByZWN0KTsNCj4gfQ0KPiANCj4gSSB1bmRl
cnN0YW5kIHRoYXQncyBjb3JyZWN0IHRvbz8NCg0KIEZyb20gd2hhdCBJIHVuZGVyc3RhbmQg
YWJvdXQgc3NkMTMweCwgYmxpdF9yZWN0IGxvb2tzIGNvcnJlY3QgdXAgdG8gdGhlIA0KY2Fs
bCB0byB1cGRhdGVfcmVjdC4gIFRoZSB2YWx1ZXMgaW4gdGhlIHJlY3QgcGFyYW1ldGVyIGFy
ZSBmb3IgdGhlIA0KZGFtYWdlIGFyZWEgb2YgdGhlIHBsYW5lLiBJbiB1cGRhdGVfcmVjdCwg
dGhlIGRlc3RpbmF0aW9uIGNvb3JkcyB4IGFuZCB5IA0KYXJlIGFsc28gdGFrZW4gZnJvbSBy
ZWN0LiBCdXQgdGhleSBzaG91bGQgY29tZSBmcm9tIGRzdF9jbGlwLCB3aGljaCBpcyANCnRo
ZSBvbi1zY3JlZW4gbG9jYXRpb24uIERvZXMgdGhhdCBtYWtlIHNlbnNlPw0KDQpCZXN0IHJl
Z2FyZHMNClRob21hcw0KDQo+IA0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGlj
cyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdt
YkgNCk1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0KKEhSQiAzNjgw
OSwgQUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rldg0K

--------------zrPzZb4Gou7T986Fk91LhYPN--

--------------Wmym8a30k7p3Wl5HBMYto2M8
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmM2wLQFAwAAAAAACgkQlh/E3EQov+AP
hBAAorUwte7CSZkSjzMD6HHU3cT1O7O7ch+Iq5DS+OF2MBk48XIGZBSw6svrFWQdOIh5Wx4qcg8d
rFcPRMnv2/PZ3ivM0ZtSbsQEL+iqobS+H/krK0k4EewnOpUKY8SFrkce5h4ViNCY8AG3Qy4fLVbR
ExHeSpN6mNx2GsIz7ajRzB3l71VDb5o17UWj28MUyyLpZXmc6Z+ndOgERVRWrpVJPJ9uRnyHgkMs
QChslXJDnoOFCeLpm+E0HPJtO7gmqKB5jYqpr3OMJgkQpGuKb7CmtYCLznAxL9TBZtSV3yuP6xkP
3sQ2MCoBcN6IY4GqMGdUNorF9xC1qD152V9wwaMSE2n2INKUE+fl42dzl6eKmy61l4Hyw1neJebP
nwSYYdG91hiIZQ8fcxBpoSylO9jvQEUY/VtkatOw+1hVj8P/V8Cfi7UFXL2LOKhAouMCmfpr0WuL
UdDyai0+lxB7SmvdLTc76MzkXhqb7UAeqaOAK3nfKT2VhfjTyak2zGvZarVhO4jmDK6LbrD8KzbY
PqRjCI1qDGXwJb7TmMEy1ZAwXyxQQ5fhq3laFA4IyGvvSfWda178OzVRNsoBQ1/mwpXDlKvRoukE
rKi0IYsqFhs39lwpqkrOX3TT4ioOKXmADPrX84epwbf87BVH80lt8N4yB665+VqTJz1rlwkOx9L6
tc8=
=dqyf
-----END PGP SIGNATURE-----

--------------Wmym8a30k7p3Wl5HBMYto2M8--
