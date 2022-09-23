Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 327AA5E7537
	for <lists+dri-devel@lfdr.de>; Fri, 23 Sep 2022 09:52:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B97510E48A;
	Fri, 23 Sep 2022 07:52:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79FE510E4A2
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Sep 2022 07:52:34 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 1B7FE219B8;
 Fri, 23 Sep 2022 07:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1663919553; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=h3Hal7CV52CBRbUK2k0C0dTEoUX9cA13Vg+15iwmEDo=;
 b=NE8VRAl+XulE9AHwZrvtQdD316YXgoyHddOtulcTL8esirf2CQ5BVIt4FhCLiqSvx3S1NX
 kslyVoniiJPPn21D832bqlj15YNdVmiaNPZYjHlocYJUzeuP09+oeoqQyA3MT+PjeY6nyn
 /wn57WfZC9kvffQnaQj+mr8TTzKPSMw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1663919553;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=h3Hal7CV52CBRbUK2k0C0dTEoUX9cA13Vg+15iwmEDo=;
 b=MeOz8JIOCCPvvqihTtd2LJMitH5y4PrDojS59CzVSLGIJRDM/zxsUT8keCGuRe8b9/b4zy
 cExYjgb28AM4RDAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id EE01613A00;
 Fri, 23 Sep 2022 07:52:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id aJ8VOcBlLWNreQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 23 Sep 2022 07:52:32 +0000
Message-ID: <e902eb9d-f30f-1121-1e3f-64c154061e5f@suse.de>
Date: Fri, 23 Sep 2022 09:52:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 2/5] drm/simpledrm: Use drm_atomic_get_new_plane_state()
Content-Language: en-US
To: "Ruhl, Michael J" <michael.j.ruhl@intel.com>,
 "javierm@redhat.com" <javierm@redhat.com>,
 "airlied@linux.ie" <airlied@linux.ie>, "daniel@ffwll.ch" <daniel@ffwll.ch>
References: <20220922130944.27138-1-tzimmermann@suse.de>
 <20220922130944.27138-3-tzimmermann@suse.de>
 <DM5PR11MB1324460C022C2BF66196D4F8C14E9@DM5PR11MB1324.namprd11.prod.outlook.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <DM5PR11MB1324460C022C2BF66196D4F8C14E9@DM5PR11MB1324.namprd11.prod.outlook.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------21YtzijpMha8pcbHo3v3VMIB"
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------21YtzijpMha8pcbHo3v3VMIB
Content-Type: multipart/mixed; boundary="------------jL4I3MacIhHXUekRYExyX0iK";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: "Ruhl, Michael J" <michael.j.ruhl@intel.com>,
 "javierm@redhat.com" <javierm@redhat.com>,
 "airlied@linux.ie" <airlied@linux.ie>, "daniel@ffwll.ch" <daniel@ffwll.ch>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Message-ID: <e902eb9d-f30f-1121-1e3f-64c154061e5f@suse.de>
Subject: Re: [PATCH 2/5] drm/simpledrm: Use drm_atomic_get_new_plane_state()
References: <20220922130944.27138-1-tzimmermann@suse.de>
 <20220922130944.27138-3-tzimmermann@suse.de>
 <DM5PR11MB1324460C022C2BF66196D4F8C14E9@DM5PR11MB1324.namprd11.prod.outlook.com>
In-Reply-To: <DM5PR11MB1324460C022C2BF66196D4F8C14E9@DM5PR11MB1324.namprd11.prod.outlook.com>

--------------jL4I3MacIhHXUekRYExyX0iK
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjIuMDkuMjIgdW0gMTg6MTIgc2NocmllYiBSdWhsLCBNaWNoYWVsIEo6DQo+
PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPj4gRnJvbTogZHJpLWRldmVsIDxkcmkt
ZGV2ZWwtYm91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBPZg0KPj4g
VGhvbWFzIFppbW1lcm1hbm4NCj4+IFNlbnQ6IFRodXJzZGF5LCBTZXB0ZW1iZXIgMjIsIDIw
MjIgOToxMCBBTQ0KPj4gVG86IGphdmllcm1AcmVkaGF0LmNvbTsgYWlybGllZEBsaW51eC5p
ZTsgZGFuaWVsQGZmd2xsLmNoDQo+PiBDYzogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJt
YW5uQHN1c2UuZGU+OyBkcmktDQo+PiBkZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4+
IFN1YmplY3Q6IFtQQVRDSCAyLzVdIGRybS9zaW1wbGVkcm06IFVzZQ0KPj4gZHJtX2F0b21p
Y19nZXRfbmV3X3BsYW5lX3N0YXRlKCkNCj4+DQo+PiBMb29rdXAgdGhlIHBsYW5lJ3Mgc3Rh
dGUgaW4gYXRvbWljX3VwZGF0ZSB3aXRoIHRoZSBoZWxwZXINCj4+IGRybV9hdG9taWNfZ2V0
X25ld19wbGFuZV9zdGF0ZSgpLiBBbHNvIHJlbmFtZSB0aGUgaGVscGVycycNCj4+IHN0YXRl
IGFyZ3VtZW50cy4gTm8gZnVuY3Rpb25hbCBjaGFuZ2VzLg0KPj4NCj4+IFNpZ25lZC1vZmYt
Ynk6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPg0KPj4gLS0tDQo+
PiBkcml2ZXJzL2dwdS9kcm0vdGlueS9zaW1wbGVkcm0uYyB8IDggKysrKy0tLS0NCj4+IDEg
ZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pDQo+Pg0KPj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS90aW55L3NpbXBsZWRybS5jDQo+PiBiL2Ry
aXZlcnMvZ3B1L2RybS90aW55L3NpbXBsZWRybS5jDQo+PiBpbmRleCA1MWQwMWUzNGQ1ZWIu
LjE0NzgyYTUwZjgxNiAxMDA2NDQNCj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS90aW55L3Np
bXBsZWRybS5jDQo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vdGlueS9zaW1wbGVkcm0uYw0K
Pj4gQEAgLTQ3MCwxMCArNDcwLDEwIEBAIHN0YXRpYyBjb25zdCB1aW50NjRfdA0KPj4gc2lt
cGxlZHJtX3ByaW1hcnlfcGxhbmVfZm9ybWF0X21vZGlmaWVyc1tdID0gew0KPj4gfTsNCj4+
DQo+PiBzdGF0aWMgdm9pZCBzaW1wbGVkcm1fcHJpbWFyeV9wbGFuZV9oZWxwZXJfYXRvbWlj
X3VwZGF0ZShzdHJ1Y3QNCj4+IGRybV9wbGFuZSAqcGxhbmUsDQo+PiAtCQkJCQkJCSBzdHJ1
Y3QNCj4+IGRybV9hdG9taWNfc3RhdGUgKm9sZF9zdGF0ZSkNCj4+ICsJCQkJCQkJIHN0cnVj
dA0KPj4gZHJtX2F0b21pY19zdGF0ZSAqc3RhdGUpDQo+PiB7DQo+PiAtCXN0cnVjdCBkcm1f
cGxhbmVfc3RhdGUgKnBsYW5lX3N0YXRlID0gcGxhbmUtPnN0YXRlOw0KPj4gLQlzdHJ1Y3Qg
ZHJtX3BsYW5lX3N0YXRlICpvbGRfcGxhbmVfc3RhdGUgPSBkcm1fYXRvbWljX2dldF9vbGRf
cGxhbmVfc3RhdGUob2xkX3N0YXRlLCBwbGFuZSk7DQo+PiArCXN0cnVjdCBkcm1fcGxhbmVf
c3RhdGUgKnBsYW5lX3N0YXRlID0gZHJtX2F0b21pY19nZXRfbmV3X3BsYW5lX3N0YXRlKHN0
YXRlLCBwbGFuZSk7DQo+IA0KPiBHb2luZyBmcm9tIHBsYW5lLT5zdGF0ZSB0byBkcm1fYXRv
bWljX2dldF9uZXdfcGxhbmVfc3RhdGUgc2VlbXMgbGlrZSBhIHNsaWdodCBmdW5jdGlvbiBj
aGFuZ2UuDQo+IA0KPiBJZiB0aGlzIGlzIHRoZSBlcXVpdmFsZW50IGFuZCB0aGUgInJpZ2h0
IiB3YXkgdG8gZG8gdGhpcywgc2hvdWxkIHRoZSAtPnN0YXRlIHBhcnQgb2YgdGhlIGRhdGEN
Cj4gc3RydWN0dXJlIGJlIHBydW5lZD8NCg0KVGhlIHBsYW5lLT5zdGF0ZSBmaWVsZCBpcyBz
dGlsbCByZWxldmFudC4gSSByZWNlbnRseSBsZWFybmVkIHRoYXQgdGhlIA0Kc3RhdGUtbG9v
a3VwIGhlbHBlcnMgYXJlIHN1cHBvc2VkIHRvIGJlIHVzZWQgaW4gYWxsIGF0b21pY19jaGVj
ay9jb21taXQgDQpmdW5jdGlvbnMuIFZpbGxlIGdhdmUgYSBkZXNjcmlwdGlvbiBoZXJlOg0K
DQogICBodHRwczovL2xvcmUua2VybmVsLm9yZy9kcmktZGV2ZWwvWXg5cGlqNExtRkhycTgx
VkBpbnRlbC5jb20vDQoNCj4gDQo+IFRoZSBjb21tZW50IGZvciBkcm1fYXRvbWljX2dldF9u
ZXdfcGxhbmVfc3RhdGUgYWxzbyBzYXlzIHRoYXQgaXQgY2FuIHJldHVybiBOVUxMLg0KPiAN
Cj4gd291bGQgcGxhbmUtPnN0YXRlIGJlIE5VTEwgaW4gdGhpcyBjYXNlPw0KDQpJIGRvbid0
IHRoaW5rIHNvLiBJbiBhdG9taWNfdXBkYXRlLCB3ZSBrbm93IHRoYXQgd2UncmUgc3VwcG9z
ZWQgdG8gDQpjaGFuZ2UgdGhlIHBsYW5lLiBUaGF0IHJlcXVpcmVzIHRoZSBzdGF0ZS4gTWF5
YmUgaXQncyBkaWZmZXJlbnQgaW4gdGhlIA0KcGxhbmUncyBhdG9taWNfZGlzYWJsZSBoZWxw
ZXIsIHdlIGRvbid0IGFjY2VzcyB0aGUgc3RhdGUgdGhlcmUuDQoNCkJlc3QgcmVnYXJkcw0K
VGhvbWFzDQoNCj4gDQo+IFRoYW5rcywNCj4gDQo+IE0NCj4gDQo+PiArCXN0cnVjdCBkcm1f
cGxhbmVfc3RhdGUgKm9sZF9wbGFuZV9zdGF0ZSA9IGRybV9hdG9taWNfZ2V0X29sZF9wbGFu
ZV9zdGF0ZShzdGF0ZSwgcGxhbmUpOw0KPj4gCXN0cnVjdCBkcm1fc2hhZG93X3BsYW5lX3N0
YXRlICpzaGFkb3dfcGxhbmVfc3RhdGUgPSB0b19kcm1fc2hhZG93X3BsYW5lX3N0YXRlKHBs
YW5lX3N0YXRlKTsNCj4+IAlzdHJ1Y3QgZHJtX2ZyYW1lYnVmZmVyICpmYiA9IHBsYW5lX3N0
YXRlLT5mYjsNCj4+IAlzdHJ1Y3QgZHJtX2RldmljZSAqZGV2ID0gcGxhbmUtPmRldjsNCj4+
IEBAIC01MDMsNyArNTAzLDcgQEAgc3RhdGljIHZvaWQNCj4+IHNpbXBsZWRybV9wcmltYXJ5
X3BsYW5lX2hlbHBlcl9hdG9taWNfdXBkYXRlKHN0cnVjdCBkcm1fcGxhbmUgKnBsYW5lDQo+
PiB9DQo+Pg0KPj4gc3RhdGljIHZvaWQgc2ltcGxlZHJtX3ByaW1hcnlfcGxhbmVfaGVscGVy
X2F0b21pY19kaXNhYmxlKHN0cnVjdA0KPj4gZHJtX3BsYW5lICpwbGFuZSwNCj4+IC0JCQkJ
CQkJICBzdHJ1Y3QNCj4+IGRybV9hdG9taWNfc3RhdGUgKm9sZF9zdGF0ZSkNCj4+ICsJCQkJ
CQkJICBzdHJ1Y3QNCj4+IGRybV9hdG9taWNfc3RhdGUgKnN0YXRlKQ0KPj4gew0KPj4gCXN0
cnVjdCBkcm1fZGV2aWNlICpkZXYgPSBwbGFuZS0+ZGV2Ow0KPj4gCXN0cnVjdCBzaW1wbGVk
cm1fZGV2aWNlICpzZGV2ID0gc2ltcGxlZHJtX2RldmljZV9vZl9kZXYoZGV2KTsNCj4+IC0t
DQo+PiAyLjM3LjMNCj4gDQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERy
aXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0K
TWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5LCBB
RyBOw7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8aHJlcjogSXZvIFRvdGV2DQo=

--------------jL4I3MacIhHXUekRYExyX0iK--

--------------21YtzijpMha8pcbHo3v3VMIB
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmMtZcAFAwAAAAAACgkQlh/E3EQov+Dt
YBAAuXuqYT2h6cYIl4jjoywjpHMmD1/Ds60VFCN9sxhrPI3KnravHe33cNoLnZpTa+exkBT1Y+tC
AFhTwInx//zJ75HADUSjc6p3o7MtrX8z/5CDryYMfVxkcCXlDKFnksKwxthuD9R50ATfFqpRLYKo
sW39Pbb0TDsc04i8fauAATAQuhlGqhBU1R3tS7TfkuamXglv5vkQGW6tAKFx554DGbE9q9gfwHn0
iCAxm8ov8HK9CLrmJKJM2nE5m0vpUUq32y6vXXveuoHHMSruGl8lC4Vq6d5/1Hh8MX4/yHw5g9Dg
sfsuFVmc5fnvwplA29CHpMTyYHFrPkIbGNiz1t8uZCuV+l1rh7Vkzw0Fj8XeupEKxtDXbRzkIdCe
f+pzqupw92xg6cXCaaFtwXb8TnoKHsmO/TxJzldifT9xzRsBwmbUK2FJwzuwS0YQG3ESxhtY8QIO
1kyyu+IIBeKRc0yjKPAiNT8oWR7kT3AEujpztWXlb49B120oECyyTRcCkP2H1VwADDcfWGP5AnIo
/9vNRXz8ir0sK4TxfpHjcQ2C37NW9Cp1sv3ZAB+4p5OKcIZrdAOqzELErJtPEVynJvcLsb217XE6
xNyOHcZuFxenw7Cnk+tA4F/kQOkuuQB1dzoL88eSQmr4MkokpYH3u9TPEMLGKJsTvJ5nqgwFluE1
0wY=
=S+hl
-----END PGP SIGNATURE-----

--------------21YtzijpMha8pcbHo3v3VMIB--
