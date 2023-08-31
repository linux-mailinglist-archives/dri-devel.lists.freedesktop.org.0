Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E67A578E7D6
	for <lists+dri-devel@lfdr.de>; Thu, 31 Aug 2023 10:24:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03B1E10E5C6;
	Thu, 31 Aug 2023 08:24:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAF5010E5C7
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Aug 2023 08:24:21 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 6C2B421860;
 Thu, 31 Aug 2023 08:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1693470260; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=j7I+sD8PCqK24WP0JsqbnNm6ZTawzNHh251ipGBCY5k=;
 b=Jp93a0xzhgBHXCp0qyKiM/jxCcpfgGwJ5CGPFc/0IPeBSCHawNWkkYjhMEyiuC8nwUnEKj
 8QT2AEvPRKdW9JRXM5eBtvoS+RSq80T0wdz1M/ep/lAETQUX1efDs7bY08jcl6pXQvppv4
 LOZ0lZeb3Txu42q8fVOGqVntIYiB33o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1693470260;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=j7I+sD8PCqK24WP0JsqbnNm6ZTawzNHh251ipGBCY5k=;
 b=WWtqouBsXVtJh1dpuscFhkkgT3n93OzM/GtWvpkBETJbiUItTZ+Cz1gqjY1VJZE36CKHIn
 pDX7pNYFQac6K3DQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 40F4613587;
 Thu, 31 Aug 2023 08:24:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id WtHjDjRO8GQrdAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 31 Aug 2023 08:24:20 +0000
Message-ID: <e08780cb-9121-e917-2619-80e2c767c451@suse.de>
Date: Thu, 31 Aug 2023 10:24:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v2 6/8] drm/fb-helper: Pass buffer format via
 drm_fb_helper_surface_size
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <cover.1692888745.git.geert@linux-m68k.org>
 <df91abce8e86bdf71b9062718b7643c3c143788b.1692888745.git.geert@linux-m68k.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <df91abce8e86bdf71b9062718b7643c3c143788b.1692888745.git.geert@linux-m68k.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------mPyLR7tYc5tvlKqZVyqmmLtW"
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
--------------mPyLR7tYc5tvlKqZVyqmmLtW
Content-Type: multipart/mixed; boundary="------------r3mMLIG7gprTr3ocRFGyDusF";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Message-ID: <e08780cb-9121-e917-2619-80e2c767c451@suse.de>
Subject: Re: [PATCH v2 6/8] drm/fb-helper: Pass buffer format via
 drm_fb_helper_surface_size
References: <cover.1692888745.git.geert@linux-m68k.org>
 <df91abce8e86bdf71b9062718b7643c3c143788b.1692888745.git.geert@linux-m68k.org>
In-Reply-To: <df91abce8e86bdf71b9062718b7643c3c143788b.1692888745.git.geert@linux-m68k.org>

--------------r3mMLIG7gprTr3ocRFGyDusF
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjQuMDguMjMgdW0gMTc6MDggc2NocmllYiBHZWVydCBVeXR0ZXJob2V2ZW46
DQo+IGRybV9mYl9oZWxwZXJfc2luZ2xlX2ZiX3Byb2JlKCkgZmlyc3QgY2FsbHMgZHJtX2Zi
X2hlbHBlcl9maW5kX3NpemVzKCksDQo+IGZvbGxvd2VkIGJ5IGRybV9mYmRldl9nZW5lcmlj
X2hlbHBlcl9mYl9wcm9iZSgpOg0KPiAgICAtIFRoZSBmb3JtZXIgdHJpZXMgdG8gZmluZCBh
IHN1aXRhYmxlIGJ1ZmZlciBmb3JtYXQsIHRha2luZyBpbnRvDQo+ICAgICAgYWNjb3VudCBs
aW1pdGF0aW9ucyBvZiB0aGUgd2hvbGUgZGlzcGxheSBwaXBlbGluZSwNCj4gICAgLSBUaGUg
bGF0dGVyIGp1c3QgY2FsbHMgZHJtX21vZGVfbGVnYWN5X2ZiX2Zvcm1hdCgpIGFnYWluLg0K
PiANCj4gU2ltcGxpZnkgdGhpcyBieSBwYXNzaW5nIHRoZSBidWZmZXIgZm9ybWF0IGJldHdl
ZW4gdGhlc2UgZnVuY3Rpb25zDQo+IHZpYSBhIG5ldyBidWZmZXIgZm9ybWF0IG1lbWJlciBp
biB0aGUgZHJtX2ZiX2hlbHBlcl9zdXJmYWNlX3NpemUNCj4gc3RydWN0dXJlLg0KDQpUaGF0
IGlzIGEgYml0IHByZW1hdHVyZSBhbmQgSSdkIGxpa2UgdG8gbm90IG1lcmdlIHRoaXMgcGF0
Y2guDQoNCkEgbnVtYmVyIG9mIGRyaXZlcnMgaW1wbGVtZW50IGZiZGV2IGVtdWxhdGlvbiB3
aXRoIHRoZWlyIG93biB3b3JrYXJvdW5kcyANCmZvciBzdXJmYWNlX2JwcCBhbmQgc3VyZmFj
ZV9kZXB0aC4gTXkgcGxhbiBoYXMgYmVlbiB0byBwdXNoIA0KX2ZpbmRfc2l6ZXMoKSBpbnRv
IHRoZSBkcml2ZXJzJyBmYl9wcm9iZSBoZWxwZXJzIGFuZCBsZXQgdGhlbSBoYW5kbGUgDQpl
dmVyeXRoaW5nLiBPbmNlIGV2ZXJ5dGhpbmcgaGFzIGJlZW4gY2xlYW5lZCB1cCwgc3VyZmFj
ZV9icHAgYW5kIA0Kc3VyZmFjZV9kZXB0aCBjYW4gaG9wZWZ1bGx5IGJlIHJlbW92ZWQgZW50
aXJlbHkuDQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCj4gDQo+IFNpZ25lZC1vZmYtYnk6
IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4ay5vcmc+DQo+IFJldmlld2Vk
LWJ5OiBKYXZpZXIgTWFydGluZXogQ2FuaWxsYXMgPGphdmllcm1AcmVkaGF0LmNvbT4NCj4g
VGVzdGVkLWJ5OiBKYXZpZXIgTWFydGluZXogQ2FuaWxsYXMgPGphdmllcm1AcmVkaGF0LmNv
bT4NCj4gLS0tDQo+IHYyOg0KPiAgICAtIEZpeCBhY2NpZGVudGFsIGRlYnVnIGxldmVsIGlu
Y3JlYXNlLA0KPiAgICAtIEFkZCBSZXZpZXdlZC1ieSwgVGVzdGVkLWJ5Lg0KPiAtLS0NCj4g
ICBkcml2ZXJzL2dwdS9kcm0vZHJtX2ZiX2hlbHBlci5jICAgICB8IDEgKw0KPiAgIGRyaXZl
cnMvZ3B1L2RybS9kcm1fZmJkZXZfZ2VuZXJpYy5jIHwgOSArKysrLS0tLS0NCj4gICBpbmNs
dWRlL2RybS9kcm1fZmJfaGVscGVyLmggICAgICAgICB8IDIgKysNCj4gICAzIGZpbGVzIGNo
YW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2ZiX2hlbHBlci5jIGIvZHJpdmVycy9ncHUvZHJt
L2RybV9mYl9oZWxwZXIuYw0KPiBpbmRleCBkNjEyMTMzZTJjZjdlYzk5Li40ZGMyOGZkY2Mx
ZTBhNmE0IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2ZiX2hlbHBlci5j
DQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZmJfaGVscGVyLmMNCj4gQEAgLTE1NjQs
NiArMTU2NCw3IEBAIHN0YXRpYyBpbnQgX19kcm1fZmJfaGVscGVyX2ZpbmRfc2l6ZXMoc3Ry
dWN0IGRybV9mYl9oZWxwZXIgKmZiX2hlbHBlciwNCj4gICAJaW5mbyA9IGRybV9mb3JtYXRf
aW5mbyhzdXJmYWNlX2Zvcm1hdCk7DQo+ICAgCXNpemVzLT5zdXJmYWNlX2JwcCA9IGRybV9m
b3JtYXRfaW5mb19icHAoaW5mbywgMCk7DQo+ICAgCXNpemVzLT5zdXJmYWNlX2RlcHRoID0g
aW5mby0+ZGVwdGg7DQo+ICsJc2l6ZXMtPnN1cmZhY2VfZm9ybWF0ID0gc3VyZmFjZV9mb3Jt
YXQ7DQo+ICAgDQo+ICAgCS8qIGZpcnN0IHVwIGdldCBhIGNvdW50IG9mIGNydGNzIG5vdyBp
biB1c2UgYW5kIG5ldyBtaW4vbWF4ZXMgd2lkdGgvaGVpZ2h0cyAqLw0KPiAgIAljcnRjX2Nv
dW50ID0gMDsNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZmJkZXZfZ2Vu
ZXJpYy5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9mYmRldl9nZW5lcmljLmMNCj4gaW5kZXgg
ZDY0N2Q4OTc2NGNiOTg5NC4uMzgzMGQyNWJjYzNhZDAzNSAxMDA2NDQNCj4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2RybV9mYmRldl9nZW5lcmljLmMNCj4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2RybV9mYmRldl9nZW5lcmljLmMNCj4gQEAgLTc3LDE2ICs3NywxNSBAQCBzdGF0aWMg
aW50IGRybV9mYmRldl9nZW5lcmljX2hlbHBlcl9mYl9wcm9iZShzdHJ1Y3QgZHJtX2ZiX2hl
bHBlciAqZmJfaGVscGVyLA0KPiAgIAlzdHJ1Y3QgZmJfaW5mbyAqaW5mbzsNCj4gICAJc2l6
ZV90IHNjcmVlbl9zaXplOw0KPiAgIAl2b2lkICpzY3JlZW5fYnVmZmVyOw0KPiAtCXUzMiBm
b3JtYXQ7DQo+ICAgCWludCByZXQ7DQo+ICAgDQo+IC0JZHJtX2RiZ19rbXMoZGV2LCAic3Vy
ZmFjZSB3aWR0aCglZCksIGhlaWdodCglZCkgYW5kIGJwcCglZClcbiIsDQo+ICsJZHJtX2Ri
Z19rbXMoZGV2LCAic3VyZmFjZSB3aWR0aCglZCksIGhlaWdodCglZCksIGJwcCglZCkgYW5k
IGZvcm1hdCglcDRjYylcbiIsDQo+ICAgCQkgICAgc2l6ZXMtPnN1cmZhY2Vfd2lkdGgsIHNp
emVzLT5zdXJmYWNlX2hlaWdodCwNCj4gLQkJICAgIHNpemVzLT5zdXJmYWNlX2JwcCk7DQo+
ICsJCSAgICBzaXplcy0+c3VyZmFjZV9icHAsICZzaXplcy0+c3VyZmFjZV9mb3JtYXQpOw0K
PiAgIA0KPiAtCWZvcm1hdCA9IGRybV9tb2RlX2xlZ2FjeV9mYl9mb3JtYXQoc2l6ZXMtPnN1
cmZhY2VfYnBwLCBzaXplcy0+c3VyZmFjZV9kZXB0aCk7DQo+ICAgCWJ1ZmZlciA9IGRybV9j
bGllbnRfZnJhbWVidWZmZXJfY3JlYXRlKGNsaWVudCwgc2l6ZXMtPnN1cmZhY2Vfd2lkdGgs
DQo+IC0JCQkJCSAgICAgICBzaXplcy0+c3VyZmFjZV9oZWlnaHQsIGZvcm1hdCk7DQo+ICsJ
CQkJCSAgICAgICBzaXplcy0+c3VyZmFjZV9oZWlnaHQsDQo+ICsJCQkJCSAgICAgICBzaXpl
cy0+c3VyZmFjZV9mb3JtYXQpOw0KPiAgIAlpZiAoSVNfRVJSKGJ1ZmZlcikpDQo+ICAgCQly
ZXR1cm4gUFRSX0VSUihidWZmZXIpOw0KPiAgIA0KPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9k
cm0vZHJtX2ZiX2hlbHBlci5oIGIvaW5jbHVkZS9kcm0vZHJtX2ZiX2hlbHBlci5oDQo+IGlu
ZGV4IDM3NTczN2ZkNmMzNmVkMTkuLmFhM2Q2MmE1MzFkMTJmMzcgMTAwNjQ0DQo+IC0tLSBh
L2luY2x1ZGUvZHJtL2RybV9mYl9oZWxwZXIuaA0KPiArKysgYi9pbmNsdWRlL2RybS9kcm1f
ZmJfaGVscGVyLmgNCj4gQEAgLTQ1LDYgKzQ1LDcgQEAgc3RydWN0IGRybV9mYl9oZWxwZXI7
DQo+ICAgICogQHN1cmZhY2VfaGVpZ2h0OiBzY2Fub3V0IGJ1ZmZlciBoZWlnaHQNCj4gICAg
KiBAc3VyZmFjZV9icHA6IHNjYW5vdXQgYnVmZmVyIGJwcA0KPiAgICAqIEBzdXJmYWNlX2Rl
cHRoOiBzY2Fub3V0IGJ1ZmZlciBkZXB0aA0KPiArICogQHN1cmZhY2VfZm9ybWF0OiBzY2Fu
b3V0IGJ1ZmZlciBmb3JtYXQgKG9wdGlvbmFsKQ0KPiAgICAqDQo+ICAgICogTm90ZSB0aGF0
IHRoZSBzY2Fub3V0IHN1cmZhY2Ugd2lkdGgvaGVpZ2h0IG1heSBiZSBsYXJnZXIgdGhhbiB0
aGUgZmJkZXYNCj4gICAgKiB3aWR0aC9oZWlnaHQuICBJbiBjYXNlIG9mIG11bHRpcGxlIGRp
c3BsYXlzLCB0aGUgc2Nhbm91dCBzdXJmYWNlIGlzIHNpemVkDQo+IEBAIC02MSw2ICs2Miw3
IEBAIHN0cnVjdCBkcm1fZmJfaGVscGVyX3N1cmZhY2Vfc2l6ZSB7DQo+ICAgCXUzMiBzdXJm
YWNlX2hlaWdodDsNCj4gICAJdTMyIHN1cmZhY2VfYnBwOw0KPiAgIAl1MzIgc3VyZmFjZV9k
ZXB0aDsNCj4gKwl1MzIgc3VyZmFjZV9mb3JtYXQ7DQo+ICAgfTsNCj4gICANCj4gICAvKioN
Cg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0K
U1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpGcmFua2Vuc3RyYXNzZSAx
NDYsIDkwNDYxIE51ZXJuYmVyZywgR2VybWFueQ0KR0Y6IEl2byBUb3RldiwgQW5kcmV3IE15
ZXJzLCBBbmRyZXcgTWNEb25hbGQsIEJvdWRpZW4gTW9lcm1hbg0KSFJCIDM2ODA5IChBRyBO
dWVybmJlcmcpDQo=

--------------r3mMLIG7gprTr3ocRFGyDusF--

--------------mPyLR7tYc5tvlKqZVyqmmLtW
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmTwTjMFAwAAAAAACgkQlh/E3EQov+D4
pxAAxx5YiMPzdibP7QLNQG24ot5HrcAWxkx/JdHc1+YSk9thIep5bSNXJTpBPWzLPghCa2haS5Zf
QkaIEuR8BwCzO8PYfbj4nDNDU7Q4+N0xgRU5md30z7JLwDQTIwHqq8KesIcGQHb6/xAQhiPgu5Ft
oRIqrj/4DmTLyS02jTEctOStGoa0WG8DjC/jiw67or4u1lNWTWvSvbdi3xLtFtNcMAZHunQQ2Wjj
8RoiAnLZZ9IVslroZfRcRtZzCKXyuPAa8tpwd+b8ufmW75YGl++Olv2wB0sZBHKGkpT441jkfdRz
7VCGOTz1ZgqzL5zG1lcL4Nzq86dd0tPPQMjJOOnkP2eDRaIXNxVquoCtunlWBtKePEo7S+Ef88wA
hy+qtcfGHOhuYpWyYSUQBuXYAh0GbK/BgF6xa98p6m29SZazW3c3FxDIkWWBZra1g8XJvV5X76He
D1fzppxqIeQDOj9IyZP6s8V+8D1QUYiWDR7oNpEwxEm2VXniLSlyNKoMiZtZviLp5u+d2OLuE9pi
bjM9CLXdX8iXqavXPizTl92RbJZHR9dxwFAN4czY1p0aaLYg9s4eu3htqPgrgLDh5PI/Qv5T3VUX
JlzO89dG8Ef45NXaY/spROiE3avOUnLkXiFn56Wl5w0gaJuvElVyZQ6FuV40kUs5lbMsIqn16R/7
REs=
=WX4z
-----END PGP SIGNATURE-----

--------------mPyLR7tYc5tvlKqZVyqmmLtW--
