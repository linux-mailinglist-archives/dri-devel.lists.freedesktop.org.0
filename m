Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A1AAA5760D6
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jul 2022 13:48:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89F9C113681;
	Fri, 15 Jul 2022 11:48:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66A70113681
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jul 2022 11:48:37 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id CB10B1FD4A;
 Fri, 15 Jul 2022 11:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1657885715; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=I6emiE1OvRQ7Dr116hW7HFw/Q0RMHUu+yZWV2lYhhPg=;
 b=KmE61r4+gAntO9y2fHALZgiNVfUkQ5ioPFVheJxO5MpibGFC+vDaRHFj2I8ceTnzo9FJ5I
 /4tj4Sx45ebIidbmdpdAb98aqyxZUL/N6AWFG+NlEkBEWDhmPuWb4pASHmJSixfFtQuqJ2
 3aK6v5Pbbb2v/yX73EbO5ZWyPw6rFi0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1657885715;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=I6emiE1OvRQ7Dr116hW7HFw/Q0RMHUu+yZWV2lYhhPg=;
 b=Yx4n/xDJZZqnO6ezPH4oHDuPxPadk4Y97lx3SYdWzM4wzmiJ/lxj2DQ8cvtPeWmYmayRVq
 qbLi76XapvaIytDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A084713754;
 Fri, 15 Jul 2022 11:48:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id cSolJhNU0WKUfAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 15 Jul 2022 11:48:35 +0000
Message-ID: <558097f5-95bc-fa3c-d08e-1ca0a4d6eec2@suse.de>
Date: Fri, 15 Jul 2022 13:48:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 05/11] fbdev: Convert drivers to aperture helpers
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>, deller@gmx.de,
 daniel@ffwll.ch, sam@ravnborg.org, maxime@cerno.tech
References: <20220707153952.32264-1-tzimmermann@suse.de>
 <20220707153952.32264-6-tzimmermann@suse.de>
 <8ebc1f33-f654-6b93-8a41-1aa66ab1901c@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <8ebc1f33-f654-6b93-8a41-1aa66ab1901c@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------jRVaGE0pGaoJywHo1QHL3jPM"
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
Cc: linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------jRVaGE0pGaoJywHo1QHL3jPM
Content-Type: multipart/mixed; boundary="------------hNbxzFAcuD13tZo1nmDXwXye";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>, deller@gmx.de,
 daniel@ffwll.ch, sam@ravnborg.org, maxime@cerno.tech
Cc: linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 dri-devel@lists.freedesktop.org
Message-ID: <558097f5-95bc-fa3c-d08e-1ca0a4d6eec2@suse.de>
Subject: Re: [PATCH 05/11] fbdev: Convert drivers to aperture helpers
References: <20220707153952.32264-1-tzimmermann@suse.de>
 <20220707153952.32264-6-tzimmermann@suse.de>
 <8ebc1f33-f654-6b93-8a41-1aa66ab1901c@redhat.com>
In-Reply-To: <8ebc1f33-f654-6b93-8a41-1aa66ab1901c@redhat.com>

--------------hNbxzFAcuD13tZo1nmDXwXye
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTEuMDcuMjIgdW0gMTM6MDEgc2NocmllYiBKYXZpZXIgTWFydGluZXogQ2Fu
aWxsYXM6DQo+IE9uIDcvNy8yMiAxNzozOSwgVGhvbWFzIFppbW1lcm1hbm4gd3JvdGU6DQo+
PiBDb252ZXJ0IGZiZGV2IGRyaXZlcnMgZnJvbSBmYmRldidzIHJlbW92ZV9jb25mbGljdGlu
Z19mcmFtZWJ1ZmZlcnMoKSB0bw0KPj4gdGhlIGZyYW1ld29yay1pbmRlcGVuZGVudCBhcGVy
dHVyZV9yZW1vdmVfY29uZmxpY3RpbmdfZGV2aWNlcygpLiBDYWxsaW5nDQo+PiB0aGlzIGZ1
bmN0aW9uIHdpbGwgYWxzbyByZW1vdmUgY29uZmxpY3RpbmcgRFJNIGRyaXZlcnMuDQo+Pg0K
Pj4gU2lnbmVkLW9mZi1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2Uu
ZGU+DQo+PiAtLS0NCj4gDQo+IFsuLi5dDQo+IA0KPj4gICBzdGF0aWMgaW50IGx5bnhmYl9r
aWNrX291dF9maXJtd2FyZV9mYihzdHJ1Y3QgcGNpX2RldiAqcGRldikNCj4+ICAgew0KPj4g
LQlzdHJ1Y3QgYXBlcnR1cmVzX3N0cnVjdCAqYXA7DQo+PiArCXJlc291cmNlX3NpemVfdCBi
YXNlID0gcGNpX3Jlc291cmNlX3N0YXJ0KHBkZXYsIDApOw0KPj4gKwlyZXNvdXJjZV9zaXpl
X3Qgc2l6ZSA9IHBjaV9yZXNvdXJjZV9sZW4ocGRldiwgMCk7DQo+PiAgIAlib29sIHByaW1h
cnkgPSBmYWxzZTsNCj4+ICAgDQo+PiAtCWFwID0gYWxsb2NfYXBlcnR1cmVzKDEpOw0KPj4g
LQlpZiAoIWFwKQ0KPj4gLQkJcmV0dXJuIC1FTk9NRU07DQo+PiAtDQo+PiAtCWFwLT5yYW5n
ZXNbMF0uYmFzZSA9IHBjaV9yZXNvdXJjZV9zdGFydChwZGV2LCAwKTsNCj4+IC0JYXAtPnJh
bmdlc1swXS5zaXplID0gcGNpX3Jlc291cmNlX2xlbihwZGV2LCAwKTsNCj4+ICAgI2lmZGVm
IENPTkZJR19YODYNCj4+ICAgCXByaW1hcnkgPSBwZGV2LT5yZXNvdXJjZVtQQ0lfUk9NX1JF
U09VUkNFXS5mbGFncyAmDQo+PiAgIAkJCQkJSU9SRVNPVVJDRV9ST01fU0hBRE9XOw0KPj4g
ICAjZW5kaWYNCj4+IC0JcmVtb3ZlX2NvbmZsaWN0aW5nX2ZyYW1lYnVmZmVycyhhcCwgInNt
NzUwX2ZiMSIsIHByaW1hcnkpOw0KPj4gLQlrZnJlZShhcCk7DQo+PiAtCXJldHVybiAwOw0K
Pj4gKw0KPj4gKwlyZXR1cm4gYXBlcnR1cmVfcmVtb3ZlX2NvbmZsaWN0aW5nX2RldmljZXMo
YmFzZSwgc2l6ZSwgcHJpbWFyeSwgInNtNzUwX2ZiMSIpOw0KPiANCj4gRG8geW91IGtub3cg
d2h5IHRoaXMgY2FuJ3QganVzdCB1c2UgYXBlcnR1cmVfcmVtb3ZlX2NvbmZsaWN0aW5nX3Bj
aV9kZXZpY2VzKCkgPw0KDQpJIHNpbXBseSBkb24ndCB3YW50IGNoYW5nZSB0b28gbXVjaCBh
dCBvbmNlLCBiZWNhdXNlIHRoZXJlIHdhcyB0aGlzIA0KcHJvYmxlbSB3aXRoIHRoZSBQQ0kg
aGVscGVyIG9uIGFzdC4NCg0KQXQgc29tZSBwb2ludCB3ZSBjYW4gbWFrZSBhIHB1c2ggdG8g
cmVhbGx5IGZpeCB0aGlzIHRocm91Z2hvdXQgdGhlIGNvZGUgDQpiYXNlLiBBbmQgdGhhdCB3
b3VsZCBpbmNsdWRlIGFuIHVwZGF0ZSB0byBmYl9pc19wcmltYXJ5X2RldmljZSgpLCBbMV0g
DQp3aGljaCBkb2Vzbid0IGZpbGwgd2VsbCBpbnRvIHRoZSBuZXcgaW50ZXJmYWNlcy4NCg0K
QmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KWzFdIA0KaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5j
b20vbGludXgvbGF0ZXN0L3NvdXJjZS9hcmNoL3g4Ni92aWRlby9mYmRldi5jI0wxNA0KDQo+
IA0KPiBJdCBzZWVtcyB0aGF0IHRoZSBkcml2ZXIgaXMgb3BlbiBjb2RpbmcgcGFydCBvZiB0
aGUgbG9naWMgYWxyZWFkeSBpbiB0aGF0IGhlbHBlci4NCj4gRm9yIGV4YW1wbGUsIGZpZ3Vy
aW5nIG91dCBpZiBpcyBhIHByaW1hcnkgYnkgY2hlY2tpbmcgdGhlIElPUkVTT1VSQ0VfUk9N
X1NIQURPVw0KPiBmbGFnIGluIHRoZSBQQ0lfUk9NX1JFU09VUkNFLg0KPiANCj4gQnV0IGFs
c28gZ2V0dGluZyB0aGUgYmFzZSBhbmQgc2l6ZSBmb3IgUENJIEJBUiAwLCBzaW5jZSB0aGUg
bG9vcCBpbiB0aGF0IGhlbHBlcg0KPiB3b3VsZCBhbHJlYWR5IHRha2UgY2FyZSBvZiB0aGF0
IChpdCBhbHNvIHN0YXJ0cyBhdCBCQVIgMCkuDQo+IA0KPj4gICB9DQo+PiAgIA0KPj4gICBz
dGF0aWMgaW50IGx5bnhmYl9wY2lfcHJvYmUoc3RydWN0IHBjaV9kZXYgKnBkZXYsDQo+PiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy92aWRlby9mYmRldi9hdHkvcmFkZW9uX2Jhc2UuYyBiL2Ry
aXZlcnMvdmlkZW8vZmJkZXYvYXR5L3JhZGVvbl9iYXNlLmMNCj4+IGluZGV4IGIzMTFjMDdm
ZTY2ZC4uZTVlMzYyYjhjOWRhIDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy92aWRlby9mYmRl
di9hdHkvcmFkZW9uX2Jhc2UuYw0KPj4gKysrIGIvZHJpdmVycy92aWRlby9mYmRldi9hdHkv
cmFkZW9uX2Jhc2UuYw0KPj4gQEAgLTU0LDYgKzU0LDcgQEANCj4+ICAgDQo+PiAgICNpbmNs
dWRlICJyYWRlb25mYi5oIg0KPj4gICANCj4+ICsjaW5jbHVkZSA8bGludXgvYXBlcnR1cmUu
aD4NCj4+ICAgI2luY2x1ZGUgPGxpbnV4L21vZHVsZS5oPg0KPj4gICAjaW5jbHVkZSA8bGlu
dXgvbW9kdWxlcGFyYW0uaD4NCj4+ICAgI2luY2x1ZGUgPGxpbnV4L2tlcm5lbC5oPg0KPj4g
QEAgLTIyMzksMjAgKzIyNDAsMTAgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBiaW5fYXR0cmli
dXRlIGVkaWQyX2F0dHIgPSB7DQo+PiAgIA0KPj4gICBzdGF0aWMgaW50IHJhZGVvbl9raWNr
X291dF9maXJtd2FyZV9mYihzdHJ1Y3QgcGNpX2RldiAqcGRldikNCj4+ICAgew0KPj4gLQlz
dHJ1Y3QgYXBlcnR1cmVzX3N0cnVjdCAqYXA7DQo+PiArCXJlc291cmNlX3NpemVfdCBiYXNl
ID0gcGNpX3Jlc291cmNlX3N0YXJ0KHBkZXYsIDApOw0KPj4gKwlyZXNvdXJjZV9zaXplX3Qg
c2l6ZSA9IHBjaV9yZXNvdXJjZV9sZW4ocGRldiwgMCk7DQo+PiAgIA0KPj4gLQlhcCA9IGFs
bG9jX2FwZXJ0dXJlcygxKTsNCj4+IC0JaWYgKCFhcCkNCj4+IC0JCXJldHVybiAtRU5PTUVN
Ow0KPj4gLQ0KPj4gLQlhcC0+cmFuZ2VzWzBdLmJhc2UgPSBwY2lfcmVzb3VyY2Vfc3RhcnQo
cGRldiwgMCk7DQo+PiAtCWFwLT5yYW5nZXNbMF0uc2l6ZSA9IHBjaV9yZXNvdXJjZV9sZW4o
cGRldiwgMCk7DQo+PiAtDQo+PiAtCXJlbW92ZV9jb25mbGljdGluZ19mcmFtZWJ1ZmZlcnMo
YXAsIEtCVUlMRF9NT0ROQU1FLCBmYWxzZSk7DQo+PiAtDQo+PiAtCWtmcmVlKGFwKTsNCj4+
IC0NCj4+IC0JcmV0dXJuIDA7DQo+PiArCXJldHVybiBhcGVydHVyZV9yZW1vdmVfY29uZmxp
Y3RpbmdfZGV2aWNlcyhiYXNlLCBzaXplLCBLQlVJTERfTU9ETkFNRSwgZmFsc2UpOw0KPiAN
Cj4gU2FtZSBmb3IgdGhpcy4NCj4gDQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBo
aWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkg
R21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55DQooSFJCIDM2
ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8aHJlcjogSXZvIFRvdGV2DQo=

--------------hNbxzFAcuD13tZo1nmDXwXye--

--------------jRVaGE0pGaoJywHo1QHL3jPM
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmLRVBIFAwAAAAAACgkQlh/E3EQov+Dk
bw/9HJUhAVlTXG7NDBPn3sH+uAWHyYYKcYzq/J9PUkATfKAa+goziyeta+me76I2uvWF37eHYPM3
ZyHxESkIJ8YsNA0eKqJbFhX2DT2XbN7iRVAxmcz7G8kwNcYowEEtueAKqFvOqMn3xrp8kBHsiGuv
FKoNgDnH8mcbj8H11qxRKzkBPYPwHC45JdRzdb1xxdZidvvekWnIslWdGKTDXVg2Tg+SZ58yZiyM
MKLXlZeF8oxFLBJ+Tz9jx1t3HLRnpaBpCcxG9vV/kNlBMg3VX/pwMfWYz4bmGulJl6qJu5z8qU7R
qQIESLSyKeuLHNrjVpnhp6qoW03pn1MwuiyIfQjy5HFioyG5JImod3LaC1li2Vcss3BpyweUWe3e
LjryYM7ivoGlwCIGUuVY8//pysJcQOFtJZC57c3UklUZEcQpLBhqRoPhUiB+AANvhxdLn24O295D
o85da3CXCQteQfmHljegsHmwm3RPjEB4p4sLVHLeqRKolPvUY6ia5A7AHuXzqm0FoAZ2qVn+fuoY
XwOAkO/NlkHSEi8ZA3HFhc3e2lFL7fCGuUm2lfF3RNtv7Ra5s1crMhmGZsUeBuli6elmercL8p4g
ElA2nGuhgORb+IZcjo43Wqgf0zvCqpH5JSdwrhw3vP6fKWZxuW3P+yBpNa46oUUz2xwDfGCoxK75
XdY=
=cyZI
-----END PGP SIGNATURE-----

--------------jRVaGE0pGaoJywHo1QHL3jPM--
