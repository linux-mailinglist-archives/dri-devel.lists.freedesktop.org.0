Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36E7244812F
	for <lists+dri-devel@lfdr.de>; Mon,  8 Nov 2021 15:17:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABAF66E937;
	Mon,  8 Nov 2021 14:17:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B4596E958
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Nov 2021 14:17:16 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B750B21AFE;
 Mon,  8 Nov 2021 14:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1636381034; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dzE7GGHLQBEyBOLnCWyCu0rN9yodtjHuv+WavXQWZSQ=;
 b=pyPTb2KNskk7HEFOa6IY85/jXdK7/TzjUuYbbHKMpwxMYPxle4Zja5JCFyHAR4xlwlyd76
 dBsCve9LKgC8FJcdHrt8pzTkxKqQp1tNk9sBgG5DH1p2vSm9iW5SEBAHAZyBEAeH4VZonv
 HqAVMldDmrlDT8BVV21xnuwsYbNXT5g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1636381034;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dzE7GGHLQBEyBOLnCWyCu0rN9yodtjHuv+WavXQWZSQ=;
 b=+50B5tJW4z8LSfZa+P5kg2jN7vcZ0e5eoNbtHfNGC2F8ngmOticWbAwiz/BKjSMDFvbyRT
 ov+8QClfdR4cGbAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8A6E613BA0;
 Mon,  8 Nov 2021 14:17:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id FVC7IGoxiWHuHwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 08 Nov 2021 14:17:14 +0000
Message-ID: <a8d93a19-c7e6-f651-a1cb-9e2742383c73@suse.de>
Date: Mon, 8 Nov 2021 15:17:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH v4 0/6] Cleanups for the nomodeset kernel command line
 parameter logic
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org
References: <20211108140648.795268-1-javierm@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20211108140648.795268-1-javierm@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------LzvQxASQTYvAuymSNlzcRHq4"
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
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>,
 Jani Nikula <jani.nikula@intel.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 dri-devel@lists.freedesktop.org, Peter Robinson <pbrobinson@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------LzvQxASQTYvAuymSNlzcRHq4
Content-Type: multipart/mixed; boundary="------------y92svsweMqVWM6hjsqzPBUar";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Peter Robinson <pbrobinson@gmail.com>, Jani Nikula <jani.nikula@intel.com>,
 =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>
Message-ID: <a8d93a19-c7e6-f651-a1cb-9e2742383c73@suse.de>
Subject: Re: [PATCH v4 0/6] Cleanups for the nomodeset kernel command line
 parameter logic
References: <20211108140648.795268-1-javierm@redhat.com>
In-Reply-To: <20211108140648.795268-1-javierm@redhat.com>

--------------y92svsweMqVWM6hjsqzPBUar
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDguMTEuMjEgdW0gMTU6MDYgc2NocmllYiBKYXZpZXIgTWFydGluZXogQ2Fu
aWxsYXM6DQo+IFRoZXJlIGlzIGEgbG90IG9mIGhpc3RvcmljYWwgYmFnZ2FnZSBvbiB0aGlz
IHBhcmFtZXRlci4gSXQgaXMgZGVmaW5lZCBpbg0KPiB0aGUgdmdhY29uIGRyaXZlciBhcyBu
b21vZGVzZXQsIGJ1dCBpdHMgc2V0IGZ1bmN0aW9uIGlzIGNhbGxlZCB0ZXh0X21vZGUoKQ0K
PiBhbmQgdGhlIHZhbHVlIHF1ZXJpZWQgd2l0aCBhIGZ1bmN0aW9uIG5hbWVkIHZnYWNvbl90
ZXh0X2ZvcmNlKCkuDQo+IA0KPiBBbGwgdGhpcyBpbXBsaWVzIHRoYXQgaXQncyBhYm91dCBm
b3JjaW5nIHRleHQgbW9kZSBmb3IgVkdBLCB5ZXQgaXQgaXMgbm90DQo+IHVzZWQgaW4gbmVp
dGhlciB2Z2Fjb24gbm9yIG90aGVyIGNvbnNvbGUgZHJpdmVyLiBUaGUgb25seSB1c2VycyBm
b3IgdGhlc2UNCj4gYXJlIERSTSBkcml2ZXJzLCB0aGF0IGNoZWNrIGZvciB0aGUgdmdhY29u
X3RleHRfZm9yY2UoKSByZXR1cm4gdmFsdWUgdG8NCj4gZGV0ZXJtaW5lIHdoZXRoZXIgdGhl
IGRyaXZlciBzaG91bGQgYmUgbG9hZGVkIG9yIG5vdC4NCj4gDQo+IFRoYXQgbWFrZXMgaXQg
cXVpdGUgY29uZnVzaW5nIHRvIHJlYWQgdGhlIGNvZGUsIGJlY2F1c2UgdGhlIHZhcmlhYmxl
cyBhbmQNCj4gZnVuY3Rpb24gbmFtZXMgZG9uJ3QgcmVmbGVjdCB3aGF0IHRoZXkgYWN0dWFs
bHkgZG8gYW5kIGFsc28gYXJlIG5vdCBpbiB0aGUNCj4gc2FtZSBzdWJzeXN0ZW0gYXMgdGhl
IGRyaXZlcnMgdGhhdCBtYWtlIHVzZSBvZiB0aGVtLg0KPiANCj4gVGhpcyBwYXRjaC1zZXQg
YXR0ZW1wdHMgdG8gY2xlYW51cCB0aGUgY29kZSBieSBtb3ZpbmcgdGhlIG5vbW9kc2VzZXQg
cGFyYW0NCj4gdG8gdGhlIERSTSBzdWJzeXN0ZW0gYW5kIGRvIHNvbWUgcmVuYW1pbmcgdG8g
bWFrZSB0aGVpciBpbnRlbnRpb24gY2xlYXJlci4NCj4gDQo+IFRoaXMgaXMgYSB2NCBvZiB0
aGUgcGF0Y2hlcywgdGhhdCBhZGRyZXNzIGlzc3VlcyBwb2ludGVkIG91dCBieSBUaG9tYXMN
Cj4gWmltbWVybWFubiBpbiB2MzogaHR0cHM6Ly9sa21sLm9yZy9sa21sLzIwMjEvMTEvOC8z
ODQNCj4gDQo+IFBhdGNoICMxIGFuZCAjMiBhcmUganVzdCB0cml2aWFsIGNsZWFudXBzLg0K
PiANCj4gUGF0Y2ggIzMgbW92ZXMgdGhlIG5vbW9kZXNldCBib290IG9wdGlvbiB0byB0aGUg
RFJNIHN1YnN5c3RlbSBhbmQgcmVuYW1lcw0KPiB0aGUgdmFyaWFibGVzIGFuZCBmdW5jdGlv
bnMgbmFtZXMuDQo+IA0KPiBQYXRjaCAjNCByZW1vdmVzIHRoZSByZWxhdGlvbnNoaXAgYmV0
d2VlbiB0aGUgbm9tb2Rlc2V0IHBhcmFtZXRlciBhbmQgdGhlDQo+IENPTkZJR19WR0FfQ09O
U09MRSBLY29uZmlnIHN5bWJvbC4NCj4gDQo+IFBhdGNoICM1IGFkZHMgbm9tb2Rlc2V0IHRv
IHRoZSBrZXJuZWwgcGFyYW1ldGVycyBkb2N1bWVudGF0aW9uLg0KPiANCj4gUGF0Y2ggIzYg
aW1wcm92ZXMgdGhlIG1lc3NhZ2Ugd2hlbiBub21vZGVzZXQgaXMgZW5hYmxlZCB0byBtYWtl
IGl0IG1vcmUNCj4gYWNjdXJhdGUgYW5kIGxlc3Mgc2Vuc2F0aW9uYWwuDQoNCkFja2VkLWJ5
OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4NCg0KQmVzdCByZWdh
cmRzDQpUaG9tYXMNCg0KPiANCj4gQ2hhbmdlcyBpbiB2NDoNCj4gLSBEb24ndCBtZW50aW9u
IHRoZSBzaW1wbGVkcm0gZHJpdmVyIGFuZCBpbnN0ZWFkIGV4cGxhaW4gaW4gaGlnaCBsZXZl
bA0KPiAgICB0ZXJtcyB3aGF0IHRoZSBub21vZGVzZXQgb3B0aW9uIGlzIGFib3V0Lg0KPiAt
IERvbid0IG1lbnRpb24gRFJNIGRyaXZlcnMgaW4gdGhlIGtlcm5lbCBtZXNzYWdlIGFuZCBp
bnN0ZWFkIGV4cGxhaW4NCj4gICAgdGhhdCBvbmx5IHRoZSBzeXN0ZW0gZnJhbWVidWZmZXIg
d2lsbCBiZSBhdmFpbGFibGUuDQo+IA0KPiBDaGFuZ2VzIGluIHYzOg0KPiAtIERyb3AgdGhl
IGRybV9kcnZfZW5hYmxlZCgpIGZ1bmN0aW9uIGFuZCBqdXN0IGNhbGwgdG8gZHJtX2dldF9t
b2Rlc2V0KCkuDQo+IC0gTWFrZSBkcm1fZ2V0X21vZGVzZXQoKSBqdXN0IGEgZ2V0dGVyIGZ1
bmN0aW9uIGFuZCBkb24ndCByZXR1cm4gYW4gZXJyb3IuDQo+IC0gTW92ZSBpbmRlcGVuZGVu
dCBjbGVhbnVwcyBpbiBkcml2ZXJzIGFzIHNlcGFyYXRlIHByZXBhcmF0b3J5IHBhdGNoZXMu
DQo+IA0KPiBDaGFuZ2VzIGluIHYyOg0KPiAtIENvbmRpdGlvbmFsbHkgYnVpbGQgZHJtX25v
bW9kZXNldC5vIGlmIENPTkZJR19WR0FfQ09OU09MRSBpcyBzZXQuDQo+IC0gU3F1YXNoIHBh
dGNoZXMgdG8gbW92ZSBub21vZGVzZXQgbG9naWMgdG8gRFJNIGFuZCBkbyB0aGUgcmVuYW1p
bmcuDQo+IC0gTmFtZSB0aGUgZnVuY3Rpb24gZHJtX2NoZWNrX21vZGVzZXQoKSBhbmQgbWFr
ZSBpdCByZXR1cm4gLUVOT0RFVi4NCj4gLSBTcXVhc2ggcGF0Y2ggdG8gYWRkIGRybV9kcnZf
ZW5hYmxlZCgpIGFuZCBtYWtlIGRyaXZlcnMgdXNlIGl0Lg0KPiAtIE1ha2UgdGhlIGRyaXZl
cnMgY2hhbmdlcyBiZWZvcmUgbW92aW5nIG5vbW9kZXNldCBsb2dpYyB0byBEUk0uDQo+IC0g
TWFrZSBkcm1fZHJ2X2VuYWJsZWQoKSByZXR1cm4gYW4gZXJybm8gYW5kIC1FTk9ERVYgaWYg
bm9tb2Rlc2V0Lg0KPiAtIFJlbW92ZSBkZWJ1ZyBhbmQgZXJyb3IgbWVzc2FnZXMgaW4gZHJp
dmVycy4NCj4gDQo+IEphdmllciBNYXJ0aW5leiBDYW5pbGxhcyAoNik6DQo+ICAgIGRybTog
RG9uJ3QgcHJpbnQgbWVzc2FnZXMgaWYgZHJpdmVycyBhcmUgZGlzYWJsZWQgZHVlIG5vbW9k
ZXNldA0KPiAgICBkcm0vdmJveHZpZGVvOiBEcm9wIENPTkZJR19WR0FfQ09OU09MRSBndWFy
ZCB0byBjYWxsDQo+ICAgICAgdmdhY29uX3RleHRfZm9yY2UoKQ0KPiAgICBkcm06IE1vdmUg
bm9tb2Rlc2V0IGtlcm5lbCBwYXJhbWV0ZXIgdG8gdGhlIERSTSBzdWJzeXN0ZW0NCj4gICAg
ZHJtOiBEZWNvdXBsZSBub21vZGVzZXQgZnJvbSBDT05GSUdfVkdBX0NPTlNPTEUNCj4gICAg
RG9jdW1lbnRhdGlvbi9hZG1pbi1ndWlkZTogRG9jdW1lbnQgbm9tb2Rlc2V0IGtlcm5lbCBw
YXJhbWV0ZXINCj4gICAgZHJtOiBNYWtlIHRoZSBub21vZGVzZXQgbWVzc2FnZSBsZXNzIHNl
bnNhdGlvbmFsDQo+IA0KPiAgIC4uLi9hZG1pbi1ndWlkZS9rZXJuZWwtcGFyYW1ldGVycy50
eHQgICAgICAgICB8ICA3ICsrKysrKw0KPiAgIGRyaXZlcnMvZ3B1L2RybS9LY29uZmlnICAg
ICAgICAgICAgICAgICAgICAgICB8ICA2ICsrKysrDQo+ICAgZHJpdmVycy9ncHUvZHJtL01h
a2VmaWxlICAgICAgICAgICAgICAgICAgICAgIHwgIDIgKysNCj4gICBkcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMgICAgICAgfCAgNiArKy0tLQ0KPiAgIGRyaXZl
cnMvZ3B1L2RybS9hc3QvYXN0X2Rydi5jICAgICAgICAgICAgICAgICB8ICA0ICsrLS0NCj4g
ICBkcml2ZXJzL2dwdS9kcm0vZHJtX25vbW9kZXNldC5jICAgICAgICAgICAgICAgfCAyNCAr
KysrKysrKysrKysrKysrKysrDQo+ICAgZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9tb2R1
bGUuYyAgICAgICAgICAgIHwgIDQgKystLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9tZ2FnMjAw
L21nYWcyMDBfZHJ2LmMgICAgICAgICB8ICA0ICsrLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0v
bm91dmVhdS9ub3V2ZWF1X2RybS5jICAgICAgICAgfCAgNCArKy0tDQo+ICAgZHJpdmVycy9n
cHUvZHJtL3F4bC9xeGxfZHJ2LmMgICAgICAgICAgICAgICAgIHwgIDQgKystLQ0KPiAgIGRy
aXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2Rydi5jICAgICAgICAgICB8IDEwICsrKy0t
LS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL3RpbnkvYm9jaHMuYyAgICAgICAgICAgICAgICAg
IHwgIDQgKystLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS90aW55L2NpcnJ1cy5jICAgICAgICAg
ICAgICAgICB8ICA1ICsrLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vdmJveHZpZGVvL3Zib3hf
ZHJ2LmMgICAgICAgICAgfCAgNiArKy0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS92aXJ0aW8v
dmlydGdwdV9kcnYuYyAgICAgICAgICB8ICA0ICsrLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0v
dm13Z2Z4L3Ztd2dmeF9kcnYuYyAgICAgICAgICAgfCAgNCArKy0tDQo+ICAgZHJpdmVycy92
aWRlby9jb25zb2xlL3ZnYWNvbi5jICAgICAgICAgICAgICAgIHwgMjEgLS0tLS0tLS0tLS0t
LS0tLQ0KPiAgIGluY2x1ZGUvZHJtL2RybV9tb2RlX2NvbmZpZy5oICAgICAgICAgICAgICAg
ICB8ICAyICsrDQo+ICAgaW5jbHVkZS9saW51eC9jb25zb2xlLmggICAgICAgICAgICAgICAg
ICAgICAgIHwgIDYgLS0tLS0NCj4gICAxOSBmaWxlcyBjaGFuZ2VkLCA2NyBpbnNlcnRpb25z
KCspLCA2MCBkZWxldGlvbnMoLSkNCj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9n
cHUvZHJtL2RybV9ub21vZGVzZXQuYw0KPiANCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0K
R3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2Vy
bWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihI
UkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYN
Cg==

--------------y92svsweMqVWM6hjsqzPBUar--

--------------LzvQxASQTYvAuymSNlzcRHq4
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmGJMWkFAwAAAAAACgkQlh/E3EQov+BP
VBAAm9tHnjlRANhSY8Wbzl1MumtQ/XkyVCjZj9Hy9FgRsKglPRMF08PcgPYw9I7NWw9e/jeak6zD
psj4OSoCgqxSTTXE97Qt+PZfGNa9BCTzG70KKzVWs0u7Alrv1gyAnkGeyCLAhe173onwjOgXzZhZ
RwSlcHY2SAvpUO5y2Lqaj2M2JWIuFRs9v9d105DEXCD0Emrrw5+bYfhwkQwRf/fVQdwn/+8T3GPE
kQRPzdE4B9HCTCOdRWGmLyO4yNqT1/NfOW8IvYrWFkRu4yGAcHb09fGSBzCs7wNfb5XW7tHcQ1QS
KW6r661eIxr8gGjdIxstRDhvUJ+ajyAK8/Ys59cXkTRKG/QWQ7DQvwCnP2FYbRi9susSBifnvaxm
EhH7D9yJcJvDc8/rnJJbvG5wL4rzZNsICdAMoIv0i3R1yiTi/nIq0n+WyMTkTdpBQ5JinBwD61yW
nYBKvV2WrLRWA1jSZ0H8Fxl938xihRfx+jwiMhqs7PAVlOcPkaA4tSwGcq/jRwWJEXw1Se0BWZY1
qivLrksjisW002NZ2ZqP+VyJSTn1d+ymguHLRTAUxonkHMhtx6kYYF/Lnwt+MhCE5rAYUDBmRMme
6WQUimOBHKA06cbiKhlP5twVTJNpUePc7G9QE1a9boI0J5t88fOtCohqMQ6F0zvEDf7ZS2FmL6k8
etY=
=GM4C
-----END PGP SIGNATURE-----

--------------LzvQxASQTYvAuymSNlzcRHq4--
