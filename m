Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E237665FDD
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jan 2023 16:59:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 238AF10E2B9;
	Wed, 11 Jan 2023 15:59:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F94010E2B9;
 Wed, 11 Jan 2023 15:59:32 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E543B229C3;
 Wed, 11 Jan 2023 15:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1673452770; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/HTBltF58i7LUrPAUCrtSR4KiHvUGIaCssrQvyPf0Y8=;
 b=1qWC+RAJZ+EP2Sq6vyhuO75N9X7w+srQDHNr+a78cCAzZGJ7lDbf7s3snvLe4bNBNpNZqE
 zszpa3NB1BeZgvbqzZo1BWzet1RTuzHMgibWgwHgKeV3RdrTWjrEZJ9n05mExszMkGIXnu
 F3md/NzOA0vX53EOiHY0DOEdbnPvsyc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1673452770;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/HTBltF58i7LUrPAUCrtSR4KiHvUGIaCssrQvyPf0Y8=;
 b=42+I24GLIBM8vA7hF6VRYCoqNyMCbqoVQkXYiS3JieqPPkCLj3WQM6rRA4LS5MayN3Y14U
 V6K2RIUcfvMs0kDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9DE831358A;
 Wed, 11 Jan 2023 15:59:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id UFiBJOLcvmN8RAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 11 Jan 2023 15:59:30 +0000
Message-ID: <e0c0e249-30bc-c310-0175-92ea379ef0d6@suse.de>
Date: Wed, 11 Jan 2023 16:59:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 04/11] video/aperture: use generic code to figure out the
 vga default device
Content-Language: en-US
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20230111154112.90575-1-daniel.vetter@ffwll.ch>
 <20230111154112.90575-4-daniel.vetter@ffwll.ch>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230111154112.90575-4-daniel.vetter@ffwll.ch>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------aLlWn0UCCGF9KGvwr0HJNdgi"
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
Cc: linux-fbdev@vger.kernel.org, linux-pci@vger.kernel.org,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Helge Deller <deller@gmx.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------aLlWn0UCCGF9KGvwr0HJNdgi
Content-Type: multipart/mixed; boundary="------------e0BQCwu0JWreKuzdprfSHEQY";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, Daniel Vetter
 <daniel.vetter@intel.com>, Javier Martinez Canillas <javierm@redhat.com>,
 Helge Deller <deller@gmx.de>, linux-fbdev@vger.kernel.org,
 Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org
Message-ID: <e0c0e249-30bc-c310-0175-92ea379ef0d6@suse.de>
Subject: Re: [PATCH 04/11] video/aperture: use generic code to figure out the
 vga default device
References: <20230111154112.90575-1-daniel.vetter@ffwll.ch>
 <20230111154112.90575-4-daniel.vetter@ffwll.ch>
In-Reply-To: <20230111154112.90575-4-daniel.vetter@ffwll.ch>

--------------e0BQCwu0JWreKuzdprfSHEQY
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTEuMDEuMjMgdW0gMTY6NDEgc2NocmllYiBEYW5pZWwgVmV0dGVyOg0KPiBT
aW5jZSB2Z2FhcmIgaGFzIGJlZW4gcHJvbW90ZWQgdG8gYmUgYSBjb3JlIHBpZWNlIG9mIHRo
ZSBwY2kgc3Vic3lzdGVtDQo+IHdlIGRvbid0IGhhdmUgdG8gb3BlbiBjb2RlIHJhbmRvbSBn
dWVzc2VzIGFueW1vcmUsIHdlIGFjdHVhbGx5IGtub3cNCj4gdGhpcyBpbiBhIHBsYXRmb3Jt
IGFnbm9zdGljIHdheSwgYW5kIHRoZXJlJ3Mgbm8gbmVlZCBmb3IgYW4geDg2DQo+IHNwZWNp
ZmljIGhhY2suIFNlZSBhbHNvIDFkMzhmZTZlZTZhOCAoIlBDSS9WR0E6IE1vdmUgdmdhYXJi
IHRvDQo+IGRyaXZlcnMvcGNpIikNCj4gDQo+IFRoaXMgc2hvdWxkIG5vdCByZXN1bHQgaW4g
YW55IGZ1bmN0aW9uYWwgY2hhbmdlLCBhbmQgdGhlIG5vbi14ODYNCj4gbXVsdGktZ3B1IHBj
aSBzeXN0ZW1zIGFyZSBwcm9iYWJseSByYXJlIGVub3VnaCB0byBub3QgbWF0dGVyIChJIGRv
bid0DQo+IGtub3cgb2YgYW55IHRiaCkuIEJ1dCBpdCdzIGEgbmljZSBjbGVhbnVwLCBzbyBs
ZXQncyBkbyBpdC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmll
bC52ZXR0ZXJAaW50ZWwuY29tPg0KPiBDYzogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJt
YW5uQHN1c2UuZGU+DQo+IENjOiBKYXZpZXIgTWFydGluZXogQ2FuaWxsYXMgPGphdmllcm1A
cmVkaGF0LmNvbT4NCj4gQ2M6IEhlbGdlIERlbGxlciA8ZGVsbGVyQGdteC5kZT4NCj4gQ2M6
IGxpbnV4LWZiZGV2QHZnZXIua2VybmVsLm9yZw0KPiBDYzogQmpvcm4gSGVsZ2FhcyA8Ymhl
bGdhYXNAZ29vZ2xlLmNvbT4NCj4gQ2M6IGxpbnV4LXBjaUB2Z2VyLmtlcm5lbC5vcmcNCj4g
LS0tDQo+ICAgZHJpdmVycy92aWRlby9hcGVydHVyZS5jIHwgNiArKy0tLS0NCj4gICAxIGZp
bGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvdmlkZW8vYXBlcnR1cmUuYyBiL2RyaXZlcnMvdmlkZW8vYXBl
cnR1cmUuYw0KPiBpbmRleCA0MWU3N2RlMWVhODIuLjNkOGM5MjVjNzM2NSAxMDA2NDQNCj4g
LS0tIGEvZHJpdmVycy92aWRlby9hcGVydHVyZS5jDQo+ICsrKyBiL2RyaXZlcnMvdmlkZW8v
YXBlcnR1cmUuYw0KPiBAQCAtMzI0LDEzICszMjQsMTEgQEAgRVhQT1JUX1NZTUJPTChhcGVy
dHVyZV9yZW1vdmVfY29uZmxpY3RpbmdfZGV2aWNlcyk7DQo+ICAgICovDQo+ICAgaW50IGFw
ZXJ0dXJlX3JlbW92ZV9jb25mbGljdGluZ19wY2lfZGV2aWNlcyhzdHJ1Y3QgcGNpX2RldiAq
cGRldiwgY29uc3QgY2hhciAqbmFtZSkNCj4gICB7DQo+IC0JYm9vbCBwcmltYXJ5ID0gZmFs
c2U7DQo+ICsJYm9vbCBwcmltYXJ5Ow0KPiAgIAlyZXNvdXJjZV9zaXplX3QgYmFzZSwgc2l6
ZTsNCj4gICAJaW50IGJhciwgcmV0Ow0KPiAgIA0KPiAtI2lmZGVmIENPTkZJR19YODYNCj4g
LQlwcmltYXJ5ID0gcGRldi0+cmVzb3VyY2VbUENJX1JPTV9SRVNPVVJDRV0uZmxhZ3MgJiBJ
T1JFU09VUkNFX1JPTV9TSEFET1c7DQo+IC0jZW5kaWYNCj4gKwlwcmltYXJ5ID0gcGRldiA9
PSB2Z2FfZGVmYXVsdF9kZXZpY2UoKTsNCg0KdmdhX2RlZmF1bHRfZGV2aWNlKCkgaXMgcGFy
dCBvZiB2Z2FhcmIgYW5kIGNhbiByZXR1cm4gTlVMTC4gWzFdIFRoYXQgbmV3IA0KdGVzdCBp
cyBsaWtlbHkgdG8gYmUgaW5jb3JyZWN0IG9uIG1hbnkgc3lzdGVtcy4NCg0KSSBzdWdnZXN0
IHRvIGltcGxlbWVudCBhIGhlbHBlciBsaWtlIGZiX2lzX3ByaW1hcnlfZGV2aWNlKCkgb24g
eDg2OiBpdCANCnVzZXMgdGhlIGRlZmF1bHQgVkdBIGlmIHNldCwgb3IgZmFsbHMgYmFjayB0
byB0aGUgb3JpZ2luYWwgdGVzdC4gWzJdDQoNCkl0J3Mgbm90ZXdvcnRoeSB0aGF0IG9uIG1v
c3QgYXJjaGl0ZWN0dXJlcywgZmJfaXNfcHJpbWFyeV9kZXZpY2UoKSANCnJldHVybnMgMC4g
QnV0IGF0IGxlYXN0IG9uIFNwYXJjIFszXSBhbmQgc29tZSBQYXJpc2MgWzRdIG1hY2hpbmVz
LCBpdCANCmRvZXMgbm90Lg0KDQpJJ3ZlIGxvbmcgd2FudGVkIHRvIHJld29yayB0aGlzIGhl
bHBlciBhbnl3YXkuIFNvIHRoaXMgaXMgYSBnb29kIA0Kb3Bwb3J0dW5pdHkuDQoNCkJlc3Qg
cmVnYXJkcw0KVGhvbWFzDQoNClsxXSANCmh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xp
bnV4L2xhdGVzdC9zb3VyY2UvaW5jbHVkZS9saW51eC92Z2FhcmIuaCNMNjkNClsyXSANCmh0
dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L2xhdGVzdC9zb3VyY2UvYXJjaC94ODYv
dmlkZW8vZmJkZXYuYyNMMTQNClszXSANCmh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xp
bnV4L2xhdGVzdC9zb3VyY2UvYXJjaC9zcGFyYy9pbmNsdWRlL2FzbS9mYi5oI0wxOA0KWzRd
IA0KaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvbGF0ZXN0L3NvdXJjZS9kcml2
ZXJzL3ZpZGVvL2NvbnNvbGUvc3RpY29yZS5jI0wxMTUzDQoNCg0KPiAgIA0KPiAgIAlmb3Ig
KGJhciA9IDA7IGJhciA8IFBDSV9TVERfTlVNX0JBUlM7ICsrYmFyKSB7DQo+ICAgCQlpZiAo
IShwY2lfcmVzb3VyY2VfZmxhZ3MocGRldiwgYmFyKSAmIElPUkVTT1VSQ0VfTUVNKSkNCg0K
LS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VT
RSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQw
OSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2No
w6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCg==

--------------e0BQCwu0JWreKuzdprfSHEQY--

--------------aLlWn0UCCGF9KGvwr0HJNdgi
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmO+3OIFAwAAAAAACgkQlh/E3EQov+BP
0A//UE6PoqEAcTqpNAgiktgdxW78OLw49B8NivQxxGx0K/I3Gpc8JgvTRo49z+BolE4gYljskS2Q
kpLjVJRT7dNVU2v1/hNB0VcAKZaKjF90TFvbp4e1TmnMQoei/1gUrJJPIDlHWCh0mJ2UZ5/d9ZHG
6GGtSsfrX1qyaiG55U2DgBUlQQ72UZp61UFUhIw6LKTgvJyJMlIpkDvicP2PAQNGxwNA/IAR02Tg
BMDHjZozc/wKfyNkmT4YhJhzioitBcHUEmXS+xcdmAEn/eeAiFnRZLq/euI9kffcOEmBEabDJ5kW
YSQmshlAxsj9yAJs0cDlOtaq2KG0ze4MCHaFoc9Izl+wZiv2rEcNxHBvCnS399YkuFL9GM6cPb/f
nKEHwWDkmUYjqk5fqavGEGeOxx+Mj3EsdNb+M4djSJTDurtyJFAA8cbs977NZuzrA3/HndIdDgE4
ObwLQwGhmieD9jxsU6fyLjS0frDxQE9cEuIo3MVb/8h3CPJJy68iTKhhomofDRoYZQOIxdgzv63s
IL5BBkFt9Tjh5v8l+rnuaVCbzy5FhdAMOjM+0NAnQatDNhx+x6d23dG2BPir5ZcTYUsmQbHTNAZw
csYYe+JEEth/cPafQNmn3XkAYCuJoQCpmdcvESHEsMKuqDbNKkZALaQERWQ0f8/Lgq6FwyiGMwX1
m2o=
=KYQw
-----END PGP SIGNATURE-----

--------------aLlWn0UCCGF9KGvwr0HJNdgi--
