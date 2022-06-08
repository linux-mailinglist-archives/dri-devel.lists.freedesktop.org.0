Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8724C542EDD
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jun 2022 13:11:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E73BD10E7B7;
	Wed,  8 Jun 2022 11:11:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F44310E7C0
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jun 2022 11:11:24 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D8B651F45B;
 Wed,  8 Jun 2022 11:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1654686682; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DzkXLFii6Lzd4vFsVvb/Wv8MqSqwg25Cm/LqRcSLJMU=;
 b=ZMBCvYQT55MY1yhIhT7KQeyuFvjN9ZK9wLwj78teR9I1jgfeqSGNqWfSHqujrsmQX4zAw/
 BmcETWKm9XSwTjcINv1k6eUYKZ+YwF/GVooYq+SeBDy6og2GLDnbIU2+dN8iHHqRd9JrPv
 xAu/QnvPCS2FpebWQVrMhUeYblIAWuE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1654686682;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DzkXLFii6Lzd4vFsVvb/Wv8MqSqwg25Cm/LqRcSLJMU=;
 b=V3m+TWAoMoCDm2UqwvX93rW5dqdoSWq+HmYLCMPyAHiS40NRWAKFi8zC817hSsFjtWQoJ9
 P0uf576Mxt+hRpDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A9BFC13AD9;
 Wed,  8 Jun 2022 11:11:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id vI5AKNqDoGKxFwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 08 Jun 2022 11:11:22 +0000
Message-ID: <0c45183c-cdb8-4578-e346-bc4855be038f@suse.de>
Date: Wed, 8 Jun 2022 13:11:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 2/2] vfio/pci: Remove console drivers
Content-Language: en-US
To: Alex Williamson <alex.williamson@redhat.com>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie,
 daniel@ffwll.ch
References: <165453797543.3592816.6381793341352595461.stgit@omen>
 <165453800875.3592816.12944011921352366695.stgit@omen>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <165453800875.3592816.12944011921352366695.stgit@omen>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------tliJen0oz07WPohuNiKYlJYQ"
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
Cc: dri-devel@lists.freedesktop.org, Laszlo Ersek <lersek@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------tliJen0oz07WPohuNiKYlJYQ
Content-Type: multipart/mixed; boundary="------------8TfJUIQWUEA0lruZrkU3Iboj";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Alex Williamson <alex.williamson@redhat.com>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie,
 daniel@ffwll.ch
Cc: kvm@vger.kernel.org, Laszlo Ersek <lersek@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Message-ID: <0c45183c-cdb8-4578-e346-bc4855be038f@suse.de>
Subject: Re: [PATCH 2/2] vfio/pci: Remove console drivers
References: <165453797543.3592816.6381793341352595461.stgit@omen>
 <165453800875.3592816.12944011921352366695.stgit@omen>
In-Reply-To: <165453800875.3592816.12944011921352366695.stgit@omen>

--------------8TfJUIQWUEA0lruZrkU3Iboj
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgQWxleA0KDQpBbSAwNi4wNi4yMiB1bSAxOTo1MyBzY2hyaWViIEFsZXggV2lsbGlhbXNv
bjoNCj4gQ29uc29sZSBkcml2ZXJzIGNhbiBjcmVhdGUgY29uZmxpY3RzIHdpdGggUENJIHJl
c291cmNlcyByZXN1bHRpbmcgaW4NCj4gdXNlcnNwYWNlIGdldHRpbmcgbW1hcCBmYWlsdXJl
cyB0byBtZW1vcnkgQkFScy4gIFRoaXMgaXMgZXNwZWNpYWxseSBldmlkZW50DQo+IHdoZW4g
dHJ5aW5nIHRvIHJlLXVzZSB0aGUgc3lzdGVtIHByaW1hcnkgY29uc29sZSBmb3IgdXNlcnNw
YWNlIGRyaXZlcnMuDQo+IEF0dGVtcHQgdG8gcmVtb3ZlIGFsbCBuYXR1cmUgb2YgY29uZmxp
Y3RpbmcgZHJpdmVycyBhcyBwYXJ0IG9mIG91ciBWR0ENCj4gaW5pdGlhbGl6YXRpb24uDQoN
CkZpcnN0IGEgZHVtYiBxdWVzdGlvbiBhYm91dCB5b3VyIHVzZSBjYXNlLiAgWW91IHdhbnQg
dG8gYXNzaWduIGEgUENJIA0KZ3JhcGhpY3MgY2FyZCB0byBhIHZpcnR1YWwgbWFjaGluZSBh
bmQgbmVlZCB0byByZW1vdmUgdGhlIGdlbmVyaWMgZHJpdmVyIA0KZnJvbSB0aGUgZnJhbWVi
dWZmZXI/DQoNCj4gDQo+IFJlcG9ydGVkLWJ5OiBMYXN6bG8gRXJzZWsgPGxlcnNla0ByZWRo
YXQuY29tPg0KPiBUZXN0ZWQtYnk6IExhc3psbyBFcnNlayA8bGVyc2VrQHJlZGhhdC5jb20+
DQo+IFN1Z2dlc3RlZC1ieTogR2VyZCBIb2ZmbWFubiA8a3JheGVsQHJlZGhhdC5jb20+DQo+
IFNpZ25lZC1vZmYtYnk6IEFsZXggV2lsbGlhbXNvbiA8YWxleC53aWxsaWFtc29uQHJlZGhh
dC5jb20+DQo+IC0tLQ0KPiAgIGRyaXZlcnMvdmZpby9wY2kvdmZpb19wY2lfY29yZS5jIHwg
ICAxNyArKysrKysrKysrKysrKysrKw0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxNyBpbnNlcnRp
b25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92ZmlvL3BjaS92ZmlvX3BjaV9j
b3JlLmMgYi9kcml2ZXJzL3ZmaW8vcGNpL3ZmaW9fcGNpX2NvcmUuYw0KPiBpbmRleCBhMGQ2
OWRkYWY5MGQuLmUwY2JjYmMyYWVlMSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy92ZmlvL3Bj
aS92ZmlvX3BjaV9jb3JlLmMNCj4gKysrIGIvZHJpdmVycy92ZmlvL3BjaS92ZmlvX3BjaV9j
b3JlLmMNCj4gQEAgLTEzLDYgKzEzLDcgQEANCj4gICAjaW5jbHVkZSA8bGludXgvZGV2aWNl
Lmg+DQo+ICAgI2luY2x1ZGUgPGxpbnV4L2V2ZW50ZmQuaD4NCj4gICAjaW5jbHVkZSA8bGlu
dXgvZmlsZS5oPg0KPiArI2luY2x1ZGUgPGxpbnV4L2ZiLmg+DQo+ICAgI2luY2x1ZGUgPGxp
bnV4L2ludGVycnVwdC5oPg0KPiAgICNpbmNsdWRlIDxsaW51eC9pb21tdS5oPg0KPiAgICNp
bmNsdWRlIDxsaW51eC9tb2R1bGUuaD4NCj4gQEAgLTI5LDYgKzMwLDggQEANCj4gICANCj4g
ICAjaW5jbHVkZSA8bGludXgvdmZpb19wY2lfY29yZS5oPg0KPiAgIA0KPiArI2luY2x1ZGUg
PGRybS9kcm1fYXBlcnR1cmUuaD4NCj4gKw0KPiAgICNkZWZpbmUgRFJJVkVSX0FVVEhPUiAg
ICJBbGV4IFdpbGxpYW1zb24gPGFsZXgud2lsbGlhbXNvbkByZWRoYXQuY29tPiINCj4gICAj
ZGVmaW5lIERSSVZFUl9ERVNDICJjb3JlIGRyaXZlciBmb3IgVkZJTyBiYXNlZCBQQ0kgZGV2
aWNlcyINCj4gICANCj4gQEAgLTE3OTMsNiArMTc5NiwyMCBAQCBzdGF0aWMgaW50IHZmaW9f
cGNpX3ZnYV9pbml0KHN0cnVjdCB2ZmlvX3BjaV9jb3JlX2RldmljZSAqdmRldikNCj4gICAJ
aWYgKCF2ZmlvX3BjaV9pc192Z2EocGRldikpDQo+ICAgCQlyZXR1cm4gMDsNCj4gICANCj4g
KyNpZiBJU19SRUFDSEFCTEUoQ09ORklHX0RSTSkNCj4gKwlkcm1fYXBlcnR1cmVfZGV0YWNo
X3BsYXRmb3JtX2RyaXZlcnMocGRldik7DQo+ICsjZW5kaWYNCj4gKw0KPiArI2lmIElTX1JF
QUNIQUJMRShDT05GSUdfRkIpDQo+ICsJcmV0ID0gcmVtb3ZlX2NvbmZsaWN0aW5nX3BjaV9m
cmFtZWJ1ZmZlcnMocGRldiwgdmRldi0+dmRldi5vcHMtPm5hbWUpOw0KPiArCWlmIChyZXQp
DQo+ICsJCXJldHVybiByZXQ7DQo+ICsjZW5kaWYNCj4gKw0KPiArCXJldCA9IHZnYV9yZW1v
dmVfdmdhY29uKHBkZXYpOw0KPiArCWlmIChyZXQpDQo+ICsJCXJldHVybiByZXQ7DQo+ICsN
Cg0KWW91IHNob3VsZG4ndCBoYXZlIHRvIGNvcHkgYW55IG9mIHRoZSBpbXBsZW1lbnRhdGlv
biBvZiB0aGUgYXBlcnR1cmUgDQpoZWxwZXJzLg0KDQpJZiB5b3UgY2FsbCBkcm1fYXBlcnR1
cmVfcmVtb3ZlX2NvbmZsaWN0aW5nX3BjaV9mcmFtZWJ1ZmZlcnMoKSBpdCBzaG91bGQgDQp3
b3JrIGNvcnJlY3RseS4gVGhlIG9ubHkgcmVhc29uIHdoeSBpdCByZXF1aXJlcyBhIERSTSBk
cml2ZXIgc3RydWN0dXJlIA0KYXMgc2Vjb25kIGFyZ3VtZW50IGlzIGZvciB0aGUgZHJpdmVy
J3MgbmFtZS4gWzFdIEFuZCB0aGF0IG5hbWUgaXMgb25seSANCnVzZWQgZm9yIHByaW50aW5n
IGFuIGluZm8gbWVzc2FnZS4gWzJdDQoNClRoZSBwbGFuIGZvcndhcmQgd291bGQgYmUgdG8g
ZHJvcCBwYXRjaCAxIGVudGlyZWx5Lg0KDQpGb3IgcGF0Y2ggMiwgdGhlIG1vc3QgdHJpdmlh
bCB3b3JrYXJvdW5kIGlzIHRvIGluc3RhbmNpYXRlIHN0cnVjdCANCmRybV9kcml2ZXIgaGVy
ZSBhbmQgc2V0IHRoZSBuYW1lIGZpZWxkIHRvICd2ZGV2LT52ZGV2Lm9wcy0+bmFtZScuIElu
IHRoZSANCmxvbmdlciB0ZXJtLCB0aGUgYXBlcnR1cmUgaGVscGVycyB3aWxsIGJlIG1vdmVk
IG91dCBvZiBEUk0gYW5kIGludG8gYSANCm1vcmUgcHJvbWluZW50IGxvY2F0aW9uLiBUaGF0
IHdvcmthcm91bmQgd2lsbCBiZSBjbGVhbmVkIHVwIHRoZW4uDQoNCkFsdGVybmF0aXZlbHks
IGRybV9hcGVydHVyZV9yZW1vdmVfY29uZmxpY3RpbmdfcGNpX2ZyYW1lYnVmZmVycygpIGNv
dWxkIA0KYmUgY2hhbmdlZCB0byBhY2NlcHQgdGhlIG5hbWUgc3RyaW5nIGFzIHNlY29uZCBh
cmd1bWVudCwgYnV0IHRoYXQncyANCnF1aXRlIGEgYml0IG9mIGNodXJuIHdpdGhpbiB0aGUg
RFJNIGNvZGUuDQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNClsxXSANCmh0dHBzOi8vZWxp
eGlyLmJvb3RsaW4uY29tL2xpbnV4L3Y1LjE4LjIvc291cmNlL2RyaXZlcnMvZ3B1L2RybS9k
cm1fYXBlcnR1cmUuYyNMMzQ3DQpbMl0gDQpodHRwczovL2VsaXhpci5ib290bGluLmNvbS9s
aW51eC92NS4xOC4yL3NvdXJjZS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUvZmJtZW0uYyNM
MTU3MA0KDQoNCj4gICAJcmV0ID0gdmdhX2NsaWVudF9yZWdpc3RlcihwZGV2LCB2ZmlvX3Bj
aV9zZXRfZGVjb2RlKTsNCj4gICAJaWYgKHJldCkNCj4gICAJCXJldHVybiByZXQ7DQo+IA0K
PiANCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Bl
cg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1
LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykN
Ckdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCg==

--------------8TfJUIQWUEA0lruZrkU3Iboj--

--------------tliJen0oz07WPohuNiKYlJYQ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmKgg9kFAwAAAAAACgkQlh/E3EQov+DJ
oQ//YxjGxWaKR12QjJh6WmuB2ccoNkBbXVm9U2rZ+RseANh+7TR8YeYsI8FnySRUmwqGEjG5JB1z
X4axBCNNFa+cQ0E7JpUtWw8A1iKCx4Z5PQ2VBHP9BgL3O9MwPCLfYqY9NE2I/+IfcdFQIAYJV1YA
7ZWe/sSStCceuOoe/yzgLyhrnchNDbEpnswe/GSYFU/BE837smdi7RTf54mJv45nt0L4jKkxOHFt
Ar0UEwC5ltOh57nuIy/xg5lPpIaMya1NeJuyOEaJSXNaJO/W+pYfokebIoExz+TUNMQA4FCg/IU/
1o+yhK47vBaNYj377mWz4TpNGFq1SBTkUfTHcO7Z6bpm2R8inSnC0PgCMs8wJ5BtbNpdKwWoPU0V
2ROiypiOXs8TseZhZ4jVPp9pAyaFty6XpryBm9SCRM9V3MU0qfle0BbxtrUSUlAHNRWAQAqKtuC1
5ay88sFosIZhG8TbWEsdCIbUharV5x76ENUG8aszQe9H+WM2JYuqf8LvGCJlU5rxrjmiwcU510QL
5zSQNh6PJE3MnRp8XLeX96A8pGbaJo5mFWd6+4I+6lYQieYJAuVLAsG2qRoH8i6LBEQCs+J2IgKN
BCr+Wr7XwzcoAjbEaWzLfA9Wcp4YYc+9y6UsauO8kuqXEQgI13jdOF0O5GxCguxjLjTi+n0zV+S2
g5g=
=L6Rp
-----END PGP SIGNATURE-----

--------------tliJen0oz07WPohuNiKYlJYQ--
