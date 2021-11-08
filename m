Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B040447FD4
	for <lists+dri-devel@lfdr.de>; Mon,  8 Nov 2021 13:50:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 575F96E21A;
	Mon,  8 Nov 2021 12:50:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FC1F6E3F5
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Nov 2021 12:50:46 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B912721AFE;
 Mon,  8 Nov 2021 12:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1636375844; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=D3nGUz8Urxbvnk53+LwoxVs9vmUbCRCslHgqBDjnCMU=;
 b=XN+u3Oy10dSb1JMLGJjNwudYu32B3IB6WhiGc1soEQ2Cd0tmeNGwfx7i8OOo/DkmJNVEea
 wOPc9wZy/BlSZT7wEOLwoeuEA6dr6jU64UcmZXuXfzUbeZvFHGoSKfgJmfER0ZjkPmCJtL
 vOaHuTlDNuJuqiVUUtQ67sLR3fBCVug=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1636375844;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=D3nGUz8Urxbvnk53+LwoxVs9vmUbCRCslHgqBDjnCMU=;
 b=3A7W0vFbGKwWScQIm6JOk7EE+XAq0PNH26u8fE1do4U2SWbs8KULkqwn+5HjPDXS04drH6
 /x/HhcqpkwSnXVBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8C5D013BA0;
 Mon,  8 Nov 2021 12:50:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id +Z/6ICQdiWHCbwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 08 Nov 2021 12:50:44 +0000
Message-ID: <509f58a5-5276-5608-e3ba-4694956f6c50@suse.de>
Date: Mon, 8 Nov 2021 13:50:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH v3 0/6] Cleanups for the nomodeset kernel command line
 parameter logic
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org
References: <20211108121544.776590-1-javierm@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20211108121544.776590-1-javierm@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------sKSGqfSI363d96m0X09c6KGk"
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
--------------sKSGqfSI363d96m0X09c6KGk
Content-Type: multipart/mixed; boundary="------------VBWtUHbigLU10wQbw96cFNPF";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>,
 Jani Nikula <jani.nikula@intel.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 dri-devel@lists.freedesktop.org, Peter Robinson <pbrobinson@gmail.com>
Message-ID: <509f58a5-5276-5608-e3ba-4694956f6c50@suse.de>
Subject: Re: [PATCH v3 0/6] Cleanups for the nomodeset kernel command line
 parameter logic
References: <20211108121544.776590-1-javierm@redhat.com>
In-Reply-To: <20211108121544.776590-1-javierm@redhat.com>

--------------VBWtUHbigLU10wQbw96cFNPF
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDguMTEuMjEgdW0gMTM6MTUgc2NocmllYiBKYXZpZXIgTWFydGluZXogQ2Fu
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
bWFrZSB0aGVpciBpbnRlbnRpb24gY2xlYXJlci4NCj4gDQo+IFRoaXMgaXMgYSB2MyBvZiB0
aGUgcGF0Y2hlcywgdGhhdCBhZGRyZXNzIGlzc3VlcyBwb2ludGVkIG91dCBieSBKYW5pIE5p
a3VsYQ0KPiBpbiB2MjogaHR0cHM6Ly9sa21sLm9yZy9sa21sLzIwMjEvMTEvNC81OTQNCj4g
DQo+IFBhdGNoICMxIGFuZCAjMiBhcmUganVzdCB0cml2aWFsIGNsZWFudXBzLg0KPiANCj4g
UGF0Y2ggIzMgbW92ZXMgdGhlIG5vbW9kZXNldCBib290IG9wdGlvbiB0byB0aGUgRFJNIHN1
YnN5c3RlbSBhbmQgcmVuYW1lcw0KPiB0aGUgdmFyaWFibGVzIGFuZCBmdW5jdGlvbnMgbmFt
ZXMuDQo+IA0KPiBQYXRjaCAjNCByZW1vdmVzIHRoZSByZWxhdGlvbnNoaXAgYmV0d2VlbiB0
aGUgbm9tb2Rlc2V0IHBhcmFtZXRlciBhbmQgdGhlDQo+IENPTkZJR19WR0FfQ09OU09MRSBL
Y29uZmlnIHN5bWJvbC4NCg0KT24gcGF0Y2hlcyAxIHRvIDQNCg0KQWNrZWQtYnk6IFRob21h
cyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPg0KDQo+IA0KPiBQYXRjaCAjNSBh
ZGRzIG5vbW9kZXNldCB0byB0aGUga2VybmVsIHBhcmFtZXRlcnMgZG9jdW1lbnRhdGlvbi4N
Cj4gDQo+IFBhdGNoICM2IGltcHJvdmVzIHRoZSBtZXNzYWdlIHdoZW4gbm9tb2Rlc2V0IGlz
IGVuYWJsZWQgdG8gbWFrZSBpdCBtb3JlDQo+IGFjY3VyYXRlIGFuZCBsZXNzIHNlbnNhdGlv
bmFsLg0KDQpTZWUgbXkgY29tbWVudHMgb24gdGhlc2UgcGF0Y2hlcy4NCg0KQmVzdCByZWdh
cmRzDQpUaG9tYXMNCg0KPiANCj4gQ2hhbmdlcyBpbiB2MzoNCj4gLSBEcm9wIHRoZSBkcm1f
ZHJ2X2VuYWJsZWQoKSBmdW5jdGlvbiBhbmQganVzdCBjYWxsIHRvIGRybV9nZXRfbW9kZXNl
dCgpLg0KPiAtIE1ha2UgZHJtX2dldF9tb2Rlc2V0KCkganVzdCBhIGdldHRlciBmdW5jdGlv
biBhbmQgZG9uJ3QgcmV0dXJuIGFuIGVycm9yLg0KPiAtIE1vdmUgaW5kZXBlbmRlbnQgY2xl
YW51cHMgaW4gZHJpdmVycyBhcyBzZXBhcmF0ZSBwcmVwYXJhdG9yeSBwYXRjaGVzLg0KPiAN
Cj4gQ2hhbmdlcyBpbiB2MjoNCj4gLSBDb25kaXRpb25hbGx5IGJ1aWxkIGRybV9ub21vZGVz
ZXQubyBpZiBDT05GSUdfVkdBX0NPTlNPTEUgaXMgc2V0Lg0KPiAtIFNxdWFzaCBwYXRjaGVz
IHRvIG1vdmUgbm9tb2Rlc2V0IGxvZ2ljIHRvIERSTSBhbmQgZG8gdGhlIHJlbmFtaW5nLg0K
PiAtIE5hbWUgdGhlIGZ1bmN0aW9uIGRybV9jaGVja19tb2Rlc2V0KCkgYW5kIG1ha2UgaXQg
cmV0dXJuIC1FTk9ERVYuDQo+IC0gU3F1YXNoIHBhdGNoIHRvIGFkZCBkcm1fZHJ2X2VuYWJs
ZWQoKSBhbmQgbWFrZSBkcml2ZXJzIHVzZSBpdC4NCj4gLSBNYWtlIHRoZSBkcml2ZXJzIGNo
YW5nZXMgYmVmb3JlIG1vdmluZyBub21vZGVzZXQgbG9naWMgdG8gRFJNLg0KPiAtIE1ha2Ug
ZHJtX2Rydl9lbmFibGVkKCkgcmV0dXJuIGFuIGVycm5vIGFuZCAtRU5PREVWIGlmIG5vbW9k
ZXNldC4NCj4gLSBSZW1vdmUgZGVidWcgYW5kIGVycm9yIG1lc3NhZ2VzIGluIGRyaXZlcnMu
DQo+IA0KPiBKYXZpZXIgTWFydGluZXogQ2FuaWxsYXMgKDYpOg0KPiAgICBkcm06IERvbid0
IHByaW50IG1lc3NhZ2VzIGlmIGRyaXZlcnMgYXJlIGRpc2FibGVkIGR1ZSBub21vZGVzZXQN
Cj4gICAgZHJtL3Zib3h2aWRlbzogRHJvcCBDT05GSUdfVkdBX0NPTlNPTEUgZ3VhcmQgdG8g
Y2FsbA0KPiAgICAgIHZnYWNvbl90ZXh0X2ZvcmNlKCkNCj4gICAgZHJtOiBNb3ZlIG5vbW9k
ZXNldCBrZXJuZWwgcGFyYW1ldGVyIHRvIHRoZSBEUk0gc3Vic3lzdGVtDQo+ICAgIGRybTog
RGVjb3VwbGUgbm9tb2Rlc2V0IGZyb20gQ09ORklHX1ZHQV9DT05TT0xFDQo+ICAgIERvY3Vt
ZW50YXRpb24vYWRtaW4tZ3VpZGU6IERvY3VtZW50IG5vbW9kZXNldCBrZXJuZWwgcGFyYW1l
dGVyDQo+ICAgIGRybTogTWFrZSB0aGUgbm9tb2Rlc2V0IG1lc3NhZ2UgbGVzcyBzZW5zYXRp
b25hbA0KPiANCj4gICAuLi4vYWRtaW4tZ3VpZGUva2VybmVsLXBhcmFtZXRlcnMudHh0ICAg
ICAgICAgfCAgNCArKysrDQo+ICAgZHJpdmVycy9ncHUvZHJtL0tjb25maWcgICAgICAgICAg
ICAgICAgICAgICAgIHwgIDYgKysrKysNCj4gICBkcml2ZXJzL2dwdS9kcm0vTWFrZWZpbGUg
ICAgICAgICAgICAgICAgICAgICAgfCAgMiArKw0KPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV9kcnYuYyAgICAgICB8ICA2ICsrLS0tDQo+ICAgZHJpdmVycy9ncHUv
ZHJtL2FzdC9hc3RfZHJ2LmMgICAgICAgICAgICAgICAgIHwgIDQgKystLQ0KPiAgIGRyaXZl
cnMvZ3B1L2RybS9kcm1fbm9tb2Rlc2V0LmMgICAgICAgICAgICAgICB8IDI0ICsrKysrKysr
KysrKysrKysrKysNCj4gICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X21vZHVsZS5jICAg
ICAgICAgICAgfCAgNCArKy0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL21nYWcyMDAvbWdhZzIw
MF9kcnYuYyAgICAgICAgIHwgIDQgKystLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1
L25vdXZlYXVfZHJtLmMgICAgICAgICB8ICA0ICsrLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0v
cXhsL3F4bF9kcnYuYyAgICAgICAgICAgICAgICAgfCAgNCArKy0tDQo+ICAgZHJpdmVycy9n
cHUvZHJtL3JhZGVvbi9yYWRlb25fZHJ2LmMgICAgICAgICAgIHwgMTAgKysrLS0tLS0NCj4g
ICBkcml2ZXJzL2dwdS9kcm0vdGlueS9ib2Nocy5jICAgICAgICAgICAgICAgICAgfCAgNCAr
Ky0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL3RpbnkvY2lycnVzLmMgICAgICAgICAgICAgICAg
IHwgIDUgKystLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS92Ym94dmlkZW8vdmJveF9kcnYuYyAg
ICAgICAgICB8ICA2ICsrLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1
X2Rydi5jICAgICAgICAgIHwgIDQgKystLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS92bXdnZngv
dm13Z2Z4X2Rydi5jICAgICAgICAgICB8ICA0ICsrLS0NCj4gICBkcml2ZXJzL3ZpZGVvL2Nv
bnNvbGUvdmdhY29uLmMgICAgICAgICAgICAgICAgfCAyMSAtLS0tLS0tLS0tLS0tLS0tDQo+
ICAgaW5jbHVkZS9kcm0vZHJtX21vZGVfY29uZmlnLmggICAgICAgICAgICAgICAgIHwgIDIg
KysNCj4gICBpbmNsdWRlL2xpbnV4L2NvbnNvbGUuaCAgICAgICAgICAgICAgICAgICAgICAg
fCAgNiAtLS0tLQ0KPiAgIDE5IGZpbGVzIGNoYW5nZWQsIDY0IGluc2VydGlvbnMoKyksIDYw
IGRlbGV0aW9ucygtKQ0KPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0v
ZHJtX25vbW9kZXNldC5jDQo+IA0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGlj
cyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdt
YkgNCk1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0KKEhSQiAzNjgw
OSwgQUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rldg0K

--------------VBWtUHbigLU10wQbw96cFNPF--

--------------sKSGqfSI363d96m0X09c6KGk
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmGJHSMFAwAAAAAACgkQlh/E3EQov+Ad
lhAAuyOJLKQeldLgmyLb/0UzSR7FSmHlvDXNMis+AkSQ3faiwlTS+OlvkdVNfLY+TU46CauZYazg
N5gYKsLJh9JrZUAxKPBNnrVBH0DMKAwJVVI5yDbzlcuXJ47a6sOEUQyTyNxCebn4pikz0M+ZhPem
zRgQV2S3NIa0K79TqWkfOwrza8fOQ6cAnwfgmgw3m/OIPHK74C3pp5JpfZS/r1fj0gXD5lpy5vrs
/0ihLiywz2vxygCYBGUIz47BUVXwISTjN6f5C9f6NAFM2DCM1nk9garYHnPnH682t9wTpnNQR3cw
o5MVHKXxQOkQgHviO7jsLsnqDdJQHYe7a5JGCzQOERDqA6lbIMLeQTUVk2PPXjx6wWj85hbmOuXu
MJr7s4t9zR59ox94vkLGEx4nX72Hru0hGaXK1w7BMYaQ3UaPwF/g9g+UIR/RI7C1WgriAUTx7FAn
8bfnphicpKb2UEkx6omfYVvM/jlqCIO0Rllm7lGIvTZqnrZmIlzTUBfoVxZKurhsww26D1Xwzo7s
oUx7OAb5Oygae0q5nTLScJIA5Ge+pIQv/QFzF+HCyohfcW8WAjnOKDEcUFThFcGM/W3NVWj6k9CP
/FXl/ZZKU/mS4vt5OTh+krr3LPHE6GQHxZypZiXZGJ1ozbTMCurLOmtntNDeD51GwszcChQlaRbq
AWc=
=S40B
-----END PGP SIGNATURE-----

--------------sKSGqfSI363d96m0X09c6KGk--
