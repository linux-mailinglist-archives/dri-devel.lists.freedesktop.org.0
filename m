Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B496476BA15
	for <lists+dri-devel@lfdr.de>; Tue,  1 Aug 2023 18:54:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2E0D10E122;
	Tue,  1 Aug 2023 16:54:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4612210E417
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Aug 2023 16:54:48 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 081301FD5F;
 Tue,  1 Aug 2023 16:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1690908887; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/sSxWXnos2C3LaM9B8COH4+J1mbQGedIatbgz0p8y/I=;
 b=g2yBgBbJTofFR/Mst+nP9o4kuH9G3VUx+hm30cV8tEKMZNKpeh+aAPTUC2ogY0ilg0nJuN
 VNwDBc4HILGRgiENmyxpgWCf8AxjwJyf2HIG0QqYxxF4KmmqxRB/0WbVlMz3ocxXDUE8al
 +pinDE7rwyHOsYXcZtxh9MRzoWZhJL0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1690908887;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/sSxWXnos2C3LaM9B8COH4+J1mbQGedIatbgz0p8y/I=;
 b=DpiA8M79ApWFok24SvMaba1xXjDLIkAb9omAcSaNZ/C+YkA7ly1k2iuQZXDJfggJN+3Xj9
 Zc7KjteokCG3vzAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B9BA4139BD;
 Tue,  1 Aug 2023 16:54:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id iZFVLNY4yWRnMAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 01 Aug 2023 16:54:46 +0000
Message-ID: <0f2521b6-3d72-923c-df89-d94ca7f2fe52@suse.de>
Date: Tue, 1 Aug 2023 18:54:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [PATCH v2 01/47] media/vivid: Use fbdev I/O helpers
Content-Language: en-US
To: Hans Verkuil <hverkuil@xs4all.nl>, deller@gmx.de, javierm@redhat.com,
 sam@ravnborg.org
References: <20230801101541.900-1-tzimmermann@suse.de>
 <20230801101541.900-2-tzimmermann@suse.de>
 <ee03c6c9-4e6a-2732-0416-43fd5418c950@xs4all.nl>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <ee03c6c9-4e6a-2732-0416-43fd5418c950@xs4all.nl>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------iwNcB0Sz3ywuWPE00MR0IPpC"
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
Cc: linux-fbdev@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 kvm@vger.kernel.org, linux-geode@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------iwNcB0Sz3ywuWPE00MR0IPpC
Content-Type: multipart/mixed; boundary="------------7l50s5PQ0VEsdPaucWByG1hf";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Hans Verkuil <hverkuil@xs4all.nl>, deller@gmx.de, javierm@redhat.com,
 sam@ravnborg.org
Cc: linux-media@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-geode@lists.infradead.org, linux-omap@vger.kernel.org,
 kvm@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>
Message-ID: <0f2521b6-3d72-923c-df89-d94ca7f2fe52@suse.de>
Subject: Re: [PATCH v2 01/47] media/vivid: Use fbdev I/O helpers
References: <20230801101541.900-1-tzimmermann@suse.de>
 <20230801101541.900-2-tzimmermann@suse.de>
 <ee03c6c9-4e6a-2732-0416-43fd5418c950@xs4all.nl>
In-Reply-To: <ee03c6c9-4e6a-2732-0416-43fd5418c950@xs4all.nl>

--------------7l50s5PQ0VEsdPaucWByG1hf
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDEuMDguMjMgdW0gMTM6MjIgc2NocmllYiBIYW5zIFZlcmt1aWw6DQo+IE9u
IDAxLzA4LzIwMjMgMTI6MTMsIFRob21hcyBaaW1tZXJtYW5uIHdyb3RlOg0KPj4gU2V0IHN0
cnVjdCBmYl9vcHMgYW5kIHdpdGggRkJfREVGQVVMVF9JT19PUFMsIGZiZGV2J3MgaW5pdGlh
bGl6ZXINCj4+IGZvciBJL08gbWVtb3J5LiBTZXRzIHRoZSBjYWxsYmFja3MgdG8gdGhlIGNm
Yl8gYW5kIGZiX2lvXyBmdW5jdGlvbnMuDQo+PiBTZWxlY3QgdGhlIGNvcnJlY3QgbW9kdWxl
cyB3aXRoIEtjb25maWcncyBGQl9JT19IRUxQRVJTIHRva2VuLg0KPj4NCj4+IFRoZSBtYWNy
byBhbmQgdG9rZW4gc2V0IHRoZSBjdXJyZW50bHkgc2VsZWN0ZWQgdmFsdWVzLCBzbyB0aGVy
ZSBpcw0KPj4gbm8gZnVuY3Rpb25hbCBjaGFuZ2UuDQo+Pg0KPj4gdjI6DQo+PiAJKiB1cGRh
dGVkIHRvIHVzZSBfSU9NRU1fIHRva2Vucw0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IFRob21h
cyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPg0KPj4gUmV2aWV3ZWQtYnk6IFNh
bSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4NCj4+IEFja2VkLWJ5OiBIZWxnZSBEZWxs
ZXIgPGRlbGxlckBnbXguZGU+DQo+PiBDYzogSGFucyBWZXJrdWlsIDxodmVya3VpbEB4czRh
bGwubmw+DQo+PiBDYzogTWF1cm8gQ2FydmFsaG8gQ2hlaGFiIDxtY2hlaGFiQGtlcm5lbC5v
cmc+DQo+PiAtLS0NCj4+ICAgZHJpdmVycy9tZWRpYS90ZXN0LWRyaXZlcnMvdml2aWQvS2Nv
bmZpZyAgICAgfCA0ICstLS0NCj4+ICAgZHJpdmVycy9tZWRpYS90ZXN0LWRyaXZlcnMvdml2
aWQvdml2aWQtb3NkLmMgfCA0ICstLS0NCj4+ICAgMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2Vy
dGlvbnMoKyksIDYgZGVsZXRpb25zKC0pDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
bWVkaWEvdGVzdC1kcml2ZXJzL3ZpdmlkL0tjb25maWcgYi9kcml2ZXJzL21lZGlhL3Rlc3Qt
ZHJpdmVycy92aXZpZC9LY29uZmlnDQo+PiBpbmRleCAzMTg3OTlkMzE3YmEuLjViMDhhNWFk
MjkxZSAxMDA2NDQNCj4+IC0tLSBhL2RyaXZlcnMvbWVkaWEvdGVzdC1kcml2ZXJzL3Zpdmlk
L0tjb25maWcNCj4+ICsrKyBiL2RyaXZlcnMvbWVkaWEvdGVzdC1kcml2ZXJzL3ZpdmlkL0tj
b25maWcNCj4+IEBAIC0zLDExICszLDkgQEAgY29uZmlnIFZJREVPX1ZJVklEDQo+PiAgIAl0
cmlzdGF0ZSAiVmlydHVhbCBWaWRlbyBUZXN0IERyaXZlciINCj4+ICAgCWRlcGVuZHMgb24g
VklERU9fREVWICYmICFTUEFSQzMyICYmICFTUEFSQzY0ICYmIEZCDQo+PiAgIAlkZXBlbmRz
IG9uIEhBU19ETUENCj4+ICsJc2VsZWN0IEZCX0lPTUVNX0hFTFBFUlMNCj4+ICAgCXNlbGVj
dCBGT05UX1NVUFBPUlQNCj4+ICAgCXNlbGVjdCBGT05UXzh4MTYNCj4+IC0Jc2VsZWN0IEZC
X0NGQl9GSUxMUkVDVA0KPj4gLQlzZWxlY3QgRkJfQ0ZCX0NPUFlBUkVBDQo+PiAtCXNlbGVj
dCBGQl9DRkJfSU1BR0VCTElUDQo+PiAgIAlzZWxlY3QgVklERU9CVUYyX1ZNQUxMT0MNCj4+
ICAgCXNlbGVjdCBWSURFT0JVRjJfRE1BX0NPTlRJRw0KPj4gICAJc2VsZWN0IFZJREVPX1Y0
TDJfVFBHDQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZWRpYS90ZXN0LWRyaXZlcnMvdml2
aWQvdml2aWQtb3NkLmMgYi9kcml2ZXJzL21lZGlhL3Rlc3QtZHJpdmVycy92aXZpZC92aXZp
ZC1vc2QuYw0KPj4gaW5kZXggMDUxZjE4MDVhMTZkLi41YzkzMWI5NGE3YjUgMTAwNjQ0DQo+
PiAtLS0gYS9kcml2ZXJzL21lZGlhL3Rlc3QtZHJpdmVycy92aXZpZC92aXZpZC1vc2QuYw0K
Pj4gKysrIGIvZHJpdmVycy9tZWRpYS90ZXN0LWRyaXZlcnMvdml2aWQvdml2aWQtb3NkLmMN
Cj4+IEBAIC0yNDYsMTIgKzI0NiwxMCBAQCBzdGF0aWMgaW50IHZpdmlkX2ZiX2JsYW5rKGlu
dCBibGFua19tb2RlLCBzdHJ1Y3QgZmJfaW5mbyAqaW5mbykNCj4+ICAgDQo+PiAgIHN0YXRp
YyBjb25zdCBzdHJ1Y3QgZmJfb3BzIHZpdmlkX2ZiX29wcyA9IHsNCj4+ICAgCS5vd25lciA9
IFRISVNfTU9EVUxFLA0KPj4gKwlGQl9ERUZBVUxUX0lPTUVNX09QUywNCj4gDQo+IFRoaXMg
bWFjcm8gYWxzbyBzZXRzIGZiX3JlYWQgYW5kIGZiX3dyaXRlIG9wcyBoZXJlLCBpbiBhZGRp
dGlvbiB0byB0aGUNCj4gY2ZiXyogb3BzLCBiYXNlZCBvbiB0aGlzIHBhdGNoOg0KPiANCj4g
aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjMwNzI5MTkzMTU3LjE1NDQ2LTItdHpp
bW1lcm1hbm5Ac3VzZS5kZS8jWjJlLjoyMDIzMDcyOTE5MzE1Ny4xNTQ0Ni0yLXR6aW1tZXJt
YW5uOjo0MHN1c2UuZGU6MWluY2x1ZGU6bGludXg6ZmIuaA0KPiANCj4gQnV0IHRob3NlIHR3
byBvcHMgd2VyZSBuZXZlciBzZXQgaW4gdGhpcyBkcml2ZXIgYmVmb3JlLg0KPiANCj4gSXQn
cyBiZWVuIGFnZXMgc2luY2UgSSBsYXN0IHdvcmtlZCB3aXRoIHRoaXMsIHNvIEkgY2FuJ3Qg
dGVsbCB3aGV0aGVyIHRoYXQncw0KPiBnb29kIG9yIGJhZCwgYWxsIEkga25vdyBpcyB0aGF0
IGl0IG1ha2VzIHdoYXQgYXBwZWFycyB0byBiZSBhIGZ1bmN0aW9uYWwgY2hhbmdlLg0KPiAN
Cj4gQ2FuIHlvdSBleHBsYWluIGEgYml0IG1vcmU/IEFtIEkgbWlzc2luZyBzb21ldGhpbmc/
DQoNClRoYXQgY2hhbmdlIGlzIGludGVudGlvbmFsIGFuZCB3ZWxjb21lLiBJZiBubyBmYl9y
ZWFkL2ZiX3dyaXRlIHBvaW50ZXJzIA0KYXJlIGdpdmVuIGZiZGV2IHVzZXMgdGhlbSBhcyB0
aGVpciBkZWZhdWx0LiBTZWUNCg0KIA0KaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGlu
dXgvdjYuNS1yYzEvc291cmNlL2RyaXZlcnMvdmlkZW8vZmJkZXYvY29yZS9mYm1lbS5jI0w3
NzMNCg0KYW5kIGJlbG93LiBPbmNlIGFsbCBkcml2ZXJzIHNldCB0aGVzZSBwb2ludGVycyBl
eHBsaWNpdGx5LCB3ZSBjYW4gZHJvcCANCnRoZSBkZWZhdWx0IGFuZCBtYWtlIHRoZSBoZWxw
ZXJzIG9wdGlvbmFsIGFuZCBtb2R1bGFyLiBGb3IgdGhlIGRyaXZlcnMgDQppbiB0aGlzIHBh
dGNoc2V0IHRoZXJlJ3Mgbm8gZnVuY3Rpb25hbCBjaGFuZ2UuDQoNCkJlc3QgcmVnYXJkcw0K
VGhvbWFzDQoNCj4gDQo+IFJlZ2FyZHMsDQo+IA0KPiAJSGFucw0KPiANCj4+ICAgCS5mYl9j
aGVja192YXIgICA9IHZpdmlkX2ZiX2NoZWNrX3ZhciwNCj4+ICAgCS5mYl9zZXRfcGFyICAg
ICA9IHZpdmlkX2ZiX3NldF9wYXIsDQo+PiAgIAkuZmJfc2V0Y29scmVnICAgPSB2aXZpZF9m
Yl9zZXRjb2xyZWcsDQo+PiAtCS5mYl9maWxscmVjdCAgICA9IGNmYl9maWxscmVjdCwNCj4+
IC0JLmZiX2NvcHlhcmVhICAgID0gY2ZiX2NvcHlhcmVhLA0KPj4gLQkuZmJfaW1hZ2VibGl0
ICAgPSBjZmJfaW1hZ2VibGl0LA0KPj4gICAJLmZiX2N1cnNvciAgICAgID0gTlVMTCwNCj4+
ICAgCS5mYl9pb2N0bCAgICAgICA9IHZpdmlkX2ZiX2lvY3RsLA0KPj4gICAJLmZiX3Bhbl9k
aXNwbGF5ID0gdml2aWRfZmJfcGFuX2Rpc3BsYXksDQo+IA0KDQotLSANClRob21hcyBaaW1t
ZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0
aW9ucyBHZXJtYW55IEdtYkgNCkZyYW5rZW5zdHJhc3NlIDE0NiwgOTA0NjEgTnVlcm5iZXJn
LCBHZXJtYW55DQpHRjogSXZvIFRvdGV2LCBBbmRyZXcgTXllcnMsIEFuZHJldyBNY0RvbmFs
ZCwgQm91ZGllbiBNb2VybWFuDQpIUkIgMzY4MDkgKEFHIE51ZXJuYmVyZykNCg==

--------------7l50s5PQ0VEsdPaucWByG1hf--

--------------iwNcB0Sz3ywuWPE00MR0IPpC
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmTJONUFAwAAAAAACgkQlh/E3EQov+Bl
yxAAxjyvx3KQ/hKq5nEIINN2OlV9DJ1XHgfzJQrWAZxHFeTJlaHqnwO5URZWB2QEGPhRKlqwgVcs
md3nfmb6tJPGqXsJu8/a17tO9pmgfCfq2uAwDOZ/PemBHfP1j8Vpb85OnNToGgcozvgaOclA6S09
wgIS1kFu2T+VZ+I1doWLv/QgQdYBIBz2E1AsoR3S4VzDJ1/2DYiFuloqe8+TeQ7xpMmhcRv6Tyov
RxED8gQ1Fxrz8OGUpZn/yN6Z21vH8JmqkIrfQsXXtLm0ix3LdImNSj6oPpp909KfIXRQHJmexbhX
0UPghyXb4XuMT0/2rl+8g9O/Eq1+G7o8rDAitBmzyBGVEFNpJuFveeQuxstK3Yq2yTTfwJdMIYaT
mfSeGYPFJV+p0ZnHfmlczHXpuj9gC6IUmxEnVvqCjeQ51xH12qo7O3KQR5DtofHmElpXvqZu60W5
mnsA9HlikVZumsMo1oPD1+Iiin7qRvTunzmLAihjqmjHTdQN9MHoO+/Hw6rKTNQQ3JgGLkYjpT3y
f4ak1YzeShI1vTMtgttr6yOo1R9l6aC4XM3UnA3n8LjnP8ARDOFYxtMK6b6g+JOE/3PwQx3ukNON
6M24aa3kM+nOoSaUAiRJrE6jWCiickB5UnHZ5uwJ8v6gsBgj7u9k3OdzKKsnMqS2PXS35qZa9E9l
5YQ=
=lywt
-----END PGP SIGNATURE-----

--------------iwNcB0Sz3ywuWPE00MR0IPpC--
