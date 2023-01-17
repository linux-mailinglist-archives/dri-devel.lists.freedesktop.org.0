Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D892266DB43
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jan 2023 11:36:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC95310E46B;
	Tue, 17 Jan 2023 10:36:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B976C10E06B;
 Tue, 17 Jan 2023 10:36:04 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 55EE4684CF;
 Tue, 17 Jan 2023 10:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1673951763; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=m7FsluwkJu0yidaKtHiLwAfSD8O/evg3nH97MdSWSxI=;
 b=McgLaBl8g8aerxwEJtKmeUNqZLlgOmw55wAeQB5hJ7wCfSxdWaquDRp36xhLhlvxlYO3hK
 EKQa+Lx4c6V7T0bcVA7zXAjZNYm0YtvOojiqC1+8ZjSvk3NGT5wj0N47mwWpYd8QV69tze
 qc28uHchGOr6ZPb1auL4W1bQV9eSpR8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1673951763;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=m7FsluwkJu0yidaKtHiLwAfSD8O/evg3nH97MdSWSxI=;
 b=oyLjoKmxOb/0RrqoezZT0o7bM59EoqL1VjA99cueUJTKj3uQUO1yQd/hrEk74HE+FAL92U
 2yITtWi8NEQKFrCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E48EA1390C;
 Tue, 17 Jan 2023 10:36:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id DzGCNhJ6xmOPIAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 17 Jan 2023 10:36:02 +0000
Message-ID: <a714aa55-71b4-7f0b-c25a-23e3b9c14c09@suse.de>
Date: Tue, 17 Jan 2023 11:36:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 3/3] drm: Call vga_switcheroo_process_delayed_switch()
 in drm_lastclose
Content-Language: en-US
To: Lukas Wunner <lukas@wunner.de>
References: <20230112201156.26849-1-tzimmermann@suse.de>
 <20230112201156.26849-4-tzimmermann@suse.de>
 <20230117094440.GA30914@wunner.de>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230117094440.GA30914@wunner.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------ppNCEqAK6nP4o1Y0NY3V832g"
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
Cc: tvrtko.ursulin@linux.intel.com, kherbst@redhat.com,
 nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Xinhui.Pan@amd.com, amd-gfx@lists.freedesktop.org, alexander.deucher@amd.com,
 rodrigo.vivi@intel.com, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>, jose.souza@intel.com,
 evan.quan@amd.com, christian.koenig@amd.com, bskeggs@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------ppNCEqAK6nP4o1Y0NY3V832g
Content-Type: multipart/mixed; boundary="------------RW3kpQ0nqBpwFFCPJvFxo8Ni";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Lukas Wunner <lukas@wunner.de>
Cc: tvrtko.ursulin@linux.intel.com, dri-devel@lists.freedesktop.org,
 kherbst@redhat.com, amd-gfx@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Xinhui.Pan@amd.com, Daniel Vetter <daniel.vetter@ffwll.ch>,
 jose.souza@intel.com, rodrigo.vivi@intel.com, alexander.deucher@amd.com,
 evan.quan@amd.com, christian.koenig@amd.com, bskeggs@redhat.com
Message-ID: <a714aa55-71b4-7f0b-c25a-23e3b9c14c09@suse.de>
Subject: Re: [PATCH v2 3/3] drm: Call vga_switcheroo_process_delayed_switch()
 in drm_lastclose
References: <20230112201156.26849-1-tzimmermann@suse.de>
 <20230112201156.26849-4-tzimmermann@suse.de>
 <20230117094440.GA30914@wunner.de>
In-Reply-To: <20230117094440.GA30914@wunner.de>

--------------RW3kpQ0nqBpwFFCPJvFxo8Ni
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTcuMDEuMjMgdW0gMTA6NDQgc2NocmllYiBMdWthcyBXdW5uZXI6DQo+IE9u
IFRodSwgSmFuIDEyLCAyMDIzIGF0IDA5OjExOjU2UE0gKzAxMDAsIFRob21hcyBaaW1tZXJt
YW5uIHdyb3RlOg0KPj4gU2V2ZXJhbCBsYXN0Y2xvc2UgaGVscGVycyBjYWxsIHZnYV9zd2l0
Y2hlcm9vX3Byb2Nlc3NfZGVsYXllZF9zd2l0Y2goKS4NCj4+IEl0J3MgYmV0dGVyIHRvIGNh
bGwgdGhlIGhlbHBlciBmcm9tIGRybV9sYXN0Y2xvc2UoKSBhZnRlciB0aGUga2VybmVsDQo+
PiBjbGllbnQncyBzY3JlZW4gaGFzIGJlZW4gcmVzdG9yZWQuIFRoaXMgd2F5LCBhbGwgZHJp
dmVycyBjYW4gYmVuZWZpdA0KPj4gd2l0aG91dCBoYXZpbmcgdG8gaW1wbGVtZW50IHRoZWly
IG93biBsYXN0Y2xvc2UgaGVscGVyLiBGb3IgZHJpdmVycw0KPj4gd2l0aG91dCB2Z2Etc3dp
dGNoZXJvbywgdmdhX3N3aXRjaGVyb29fcHJvY2Vzc19kZWxheWVkX3N3aXRjaCgpIGRvZXMN
Cj4+IG5vdGhpbmcuDQo+IFsuLi5dDQo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2Zp
bGUuYw0KPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9maWxlLmMNCj4+IEBAIC0zOCw2
ICszOCw3IEBADQo+PiAgICNpbmNsdWRlIDxsaW51eC9wY2kuaD4NCj4+ICAgI2luY2x1ZGUg
PGxpbnV4L3BvbGwuaD4NCj4+ICAgI2luY2x1ZGUgPGxpbnV4L3NsYWIuaD4NCj4+ICsjaW5j
bHVkZSA8bGludXgvdmdhX3N3aXRjaGVyb28uaD4NCj4+ICAgDQo+PiAgICNpbmNsdWRlIDxk
cm0vZHJtX2NsaWVudC5oPg0KPj4gICAjaW5jbHVkZSA8ZHJtL2RybV9kcnYuaD4NCj4+IEBA
IC00NjAsNiArNDYxLDggQEAgdm9pZCBkcm1fbGFzdGNsb3NlKHN0cnVjdCBkcm1fZGV2aWNl
ICogZGV2KQ0KPj4gICAJCWRybV9sZWdhY3lfZGV2X3JlaW5pdChkZXYpOw0KPj4gICANCj4+
ICAgCWRybV9jbGllbnRfZGV2X3Jlc3RvcmUoZGV2KTsNCj4+ICsNCj4+ICsJdmdhX3N3aXRj
aGVyb29fcHJvY2Vzc19kZWxheWVkX3N3aXRjaCgpOw0KPj4gICB9DQo+IA0KPiBIbSwgdGhp
cyBsb29rcyBsaWtlIGEgY2FzZSBvZiBtaWRsYXllciBmYWxsYWN5Og0KPiANCj4gaHR0cHM6
Ly9ibG9nLmZmd2xsLmNoLzIwMTYvMTIvbWlkbGF5ZXJzLW9uY2UtbW9yZS13aXRoLWZlZWxp
bmcuaHRtbA0KPiANCj4gSXQgaXMgYSBkZXBhcnR1cmUgZnJvbSB0aGUgb3B0LWluIGxpYnJh
cnkgYXBwcm9hY2ggd2UndmUgaGFkIHNvIGZhci4NCj4gDQo+IEZvciBzd2l0Y2hlcm9vLWF3
YXJlIEVESUQgcmV0cmlldmFsLCB0aGVyZSdzIGEgZHJtX2dldF9lZGlkX3N3aXRjaGVyb28o
KQ0KPiBoZWxwZXIuICBIb3cgYWJvdXQgaW50cm9kdWNpbmcgYSBzd2l0Y2hlcm9vLWF3YXJl
IGxhc3RjbG9zZSBoZWxwZXIgd2hpY2gNCj4gZHJpdmVycyBjYW4gcmVmZXJlbmNlPw0KDQpD
b25zb2xlIGVtdWxhdGlvbiBpcyBhIG1lc3MuIEknbSB3b3JraW5nIG9uIGl0LCBidXQgaXQg
dGFrZXMgdGltZS4gDQpUaGVyZWZvcmUgYSBuaWNlIHNvbHV0aW9uIGlzIHByb2JhYmx5IG5v
dCBwb3NzaWJsZSBBVE0uDQoNCldlIGNvdWxkIGhhdmUgc29tZXRoaW5nIGxpa2UgZHJtX2Zi
X2hlbHBlcl9sYXN0Y2xvc2Vfc3dpdGNoZXJvbygpLCB3aGljaCANCmRvZXMgZHJtX2ZiX2hl
bHBlcl9sYXN0Y2xvc2UoKSArIA0KdmdhX3N3aXRjaGVyb29fcHJvY2Vzc19kZWxheWVkX3N3
aXRjaCgpLiBpOTE1IGFuZCByYWRlb24gY291bGQgdXNlIHRoYXQgDQphcy1pcy4gYW1kZ3B1
IGFuZCBub3V2ZWF1IGhhdmUgYWxyZWFkeSBzd2l0Y2hlZCB0byBnZW5lcmljIGZiZGV2IA0K
ZW11bGF0aW9uLiBXZSBjb3VsZCB1c2UgZHJtX2ZiX2hlbHBlcl9sYXN0Y2xvc2Vfc3dpdGNo
ZXJvbygpIGZyb20gdGhlIA0KZ2VuZXJpYyBjb2RlIGFzIHdlbGwsIGJ1dCBpdCB3aWxsIHN0
aWxsIGJlIHNvbWV3aGF0IG1pZGxheWVyaXNoLg0KDQpCdXQgd2l0aCBhbGwgdGhhdCwgaXQn
cyBwcm9iYWJseSBiZXR0ZXIgdG8gbm90IGxhbmQgcGF0Y2ggMyBhdCBhbGwuIFRoZSANCmhv
b2sgZHJtX2RyaXZlci5sYXN0Y2xvc2UgaXMganVzdCBmb3IgdGhlIG9sZCBmYmRldiBlbXVs
YXRpb24uIEZvciB0aGUgDQpuZXcgZmJkZXYgZW11bGF0aW9uLCB3ZSBoYXZlIGJldHRlciBk
YXRhIHN0cnVjdHVyZXMgKHNlZSBkcm1fY2xpZW50X2RldikuDQoNClRoZSBjb3JyZWN0IGRl
c2lnbiB3b3VsZCBiZSB0byBzd2l0Y2ggYW1kZ3B1IGFuZCBub3V2ZWF1IGJhY2sgdG8gdGhl
aXIgDQpvd24gZmJkZXYgZW11bGF0aW9uIGFuZCBoYW5kbGUgc3dpdGNoZXJvbyB0aGVyZS4g
QnV0IHRoZWlyIG9sZCBmYmRldiANCmNvZGUgbmVlZGVkIGFuIG92ZXJoYXVsLCBzbyBqdXN0
IHJldmVydGluZyBpc24ndCBhbiBvcHRpb24uDQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoN
Cj4gDQo+IFRoYW5rcywNCj4gDQo+IEx1a2FzDQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4N
CkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdl
cm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55DQoo
SFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8aHJlcjogSXZvIFRvdGV2
DQo=

--------------RW3kpQ0nqBpwFFCPJvFxo8Ni--

--------------ppNCEqAK6nP4o1Y0NY3V832g
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmPGehIFAwAAAAAACgkQlh/E3EQov+DE
eg/+KMd/ThFV+V1YGvh0Kd6a3BpmjG57gMQQXFiIHJW8xBfMKe3Foq0gouHk6XdvrRnx/jhftAwe
ft1dcJe6r5Djl97zX7T2OpjymUE2m/vsC6vgutsHfXIZcbRI7hkhO+Tu5jGObvJSyg29EsIJ5C5O
nYmkNr1M+m5ZU7J/qKxaquUu26zX3aFk+OmPwLpWBFiGsnZMs/v0E1sxJyqaaU4sy+PDacUug3vs
DQhmc4kjZitIzM7YVCiHZqwzIPxsMUNTzy6OVLXpf0kxMwShylDUr8rraJIfUR233V/eo7VezJgd
FDNhrtaeN7O9148AiXn9tRU8i46961VpTQmZ+/wVwHN2jVZweIOGNJM6E23woUSZ8dS0m2Xe9Fyx
Se4l2YA5vXdoOAnrhXMD5Oo7/8lFhBm1lU0LMBEES1oHY19gCMoWWCJNOqxMP+DgcslNk5iV1Ryq
cIKO8mWAeo9lnombAspyOyP4h7GXi3uLbeBOuK9RFoiw4UquVH6ffi+O0MaJNFyQC5Z4vucab8DF
XyD6NiAC8BiPRjU616DS+zT+Y4RGMNqvABjTfeuwop5wjTYANQjoPxEiih/lf45lwlumEys5gbS2
pFy9uVxscRgNbrche7imkHp4A7n65IARyhp5ZKD09wW8AnX0KrpxZdgrmZI2MLjKOvJVO03mEoF9
h/k=
=Dnmq
-----END PGP SIGNATURE-----

--------------ppNCEqAK6nP4o1Y0NY3V832g--
