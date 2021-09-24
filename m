Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4768F417AD8
	for <lists+dri-devel@lfdr.de>; Fri, 24 Sep 2021 20:19:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B43F36E202;
	Fri, 24 Sep 2021 18:19:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E23486E202
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Sep 2021 18:19:30 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 289D922452;
 Fri, 24 Sep 2021 18:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1632507569; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4OUNd2A87jzhl2MVuQw1GA68HwMuRJ/nKCmF8qTFQsw=;
 b=JfYd73ClXHfSXd/PmHV+Q0he7vuexGrOEwn5iEf3aIxtN66JAKfYMGXlNileGuGemk5PjZ
 ew7cz+MAMPHSnPdneU9XPvK3BzOUSiy+1SWbirOA7xHjmHJbQVUQG3m2YUb6sjRXfvr+NZ
 2XA/trqVmLMYUgR1G48E09ryA7vqgbA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1632507569;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4OUNd2A87jzhl2MVuQw1GA68HwMuRJ/nKCmF8qTFQsw=;
 b=zX/cPxOiTGylfWIEtXOf3kT8ysCrvqwkbuMxY2GkqOuZHfilnFsTb8iStbCdKpScX8TdDS
 hBKH2OWCpFMtnrDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E304713BA9;
 Fri, 24 Sep 2021 18:19:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id b1a6M7AWTmFjLQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 24 Sep 2021 18:19:28 +0000
Message-ID: <ad933c42-a02e-b818-7f42-98620036b0d3@suse.de>
Date: Fri, 24 Sep 2021 20:19:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: drm: simpledrm: fbdev emulation error with CONFIG_DRM_SIMPLEDRM
 enabled
Content-Language: en-US
To: =?UTF-8?B?Wm9sdMOhbiBLxZF2w6Fnw7M=?= <dirty.ice.hu@gmail.com>,
 Amanoel Dawod <kernel@amanoeldawod.com>
Cc: dri-devel@lists.freedesktop.org
References: <5186020a-192f-4e04-adc2-25a34305fea6@www.fastmail.com>
 <e80ae664-7184-69dd-5e6e-e228c720bb85@suse.de>
 <2ec3ae15-e8d7-4db3-baef-04b8ab9dc467@www.fastmail.com>
 <e3343649-a96d-7306-67d0-5f8fc9427429@suse.de>
 <ab196ef1-44d5-4aef-a1ab-e43bed2a87e4@www.fastmail.com>
 <7486abc7-ce39-915f-b697-b9adb356f98f@suse.de>
 <4c161178-4d15-4ca6-9069-9c9a781c7019@www.fastmail.com>
 <f80168a3-02e3-1c79-98e3-11b9f7573a6e@suse.de>
 <a9839860-6e13-4809-9a85-96821ae5372e@www.fastmail.com>
 <dee32db0-fb9c-4b09-0c8f-e602c60b23d8@gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <dee32db0-fb9c-4b09-0c8f-e602c60b23d8@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------EXDvMU0vZ9qM8q88UH3YFvAf"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------EXDvMU0vZ9qM8q88UH3YFvAf
Content-Type: multipart/mixed; boundary="------------rvycenQq8W5BV1JcNyRD0pPF";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?B?Wm9sdMOhbiBLxZF2w6Fnw7M=?= <dirty.ice.hu@gmail.com>,
 Amanoel Dawod <kernel@amanoeldawod.com>
Cc: dri-devel@lists.freedesktop.org
Message-ID: <ad933c42-a02e-b818-7f42-98620036b0d3@suse.de>
Subject: Re: drm: simpledrm: fbdev emulation error with CONFIG_DRM_SIMPLEDRM
 enabled
References: <5186020a-192f-4e04-adc2-25a34305fea6@www.fastmail.com>
 <e80ae664-7184-69dd-5e6e-e228c720bb85@suse.de>
 <2ec3ae15-e8d7-4db3-baef-04b8ab9dc467@www.fastmail.com>
 <e3343649-a96d-7306-67d0-5f8fc9427429@suse.de>
 <ab196ef1-44d5-4aef-a1ab-e43bed2a87e4@www.fastmail.com>
 <7486abc7-ce39-915f-b697-b9adb356f98f@suse.de>
 <4c161178-4d15-4ca6-9069-9c9a781c7019@www.fastmail.com>
 <f80168a3-02e3-1c79-98e3-11b9f7573a6e@suse.de>
 <a9839860-6e13-4809-9a85-96821ae5372e@www.fastmail.com>
 <dee32db0-fb9c-4b09-0c8f-e602c60b23d8@gmail.com>
In-Reply-To: <dee32db0-fb9c-4b09-0c8f-e602c60b23d8@gmail.com>

--------------rvycenQq8W5BV1JcNyRD0pPF
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGksDQoNCnRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQpBbSAyNC4wOS4yMSB1bSAyMDow
MyBzY2hyaWViIFpvbHTDoW4gS8WRdsOhZ8OzOg0KPiBIaSwNCj4gDQo+IERpZCBhbnl0aGlu
ZyBoYXBwZW4gd2l0aCB0aGlzIGlzc3VlPyBJJ3ZlIHVwZGF0ZWQgbGludXgga2VybmVsIHRv
IDUuMTQuNyANCj4gZnJvbSA1LjEzIHRvZGF5LCBhbmQgSSd2ZSBiZWVuIGhpdCB3aXRoIGEg
dmVyeSBzaW1pbGFyIHByb2JsZW0gKGV2ZW4gDQo+IGluc2lkZSBxZW11KSwgZXhjZXB0IGlu
IG15IGNhc2UgdGhlIGhlaWdodCByZXBvcnRlZCBpbiAiYmFkIGZyYW1lYnVmZmVyIA0KPiBo
ZWlnaHQiIHdhcyB0d2ljZSB0aGUgYWN0dWFsIGhlaWdodCwgbm90IHRocmVlIHRpbWVzLiBB
ZnRlciBzb21lIGRpZ2dpbmcgDQo+IGFyb3VuZCBJJ3ZlIGZpZ3VyZWQgb3V0IHRoYXQgYXQg
dGhlIGVuZCBvZiANCj4gZHJtX2ZiX2hlbHBlcl9zaW5nbGVfZmJfcHJvYmUsIHN1cmZhY2Vf
aGVpZ2h0IGlzIG11bHRpcGxpZWQgYnkgDQo+IENPTkZJR19EUk1fRkJERVZfT1ZFUkFMTE9D
LzEwMCwgd2hpY2ggd2FzIHNvbWV3aHkgc2V0IHRvIDIwMCBpbiBteSANCj4ga2VybmVsIGNv
bmZpZy4gU2V0dGluZyBpdCB0byAxMDAgZml4ZWQgdGhhdCBwcm9ibGVtLiAoSXQgbG9va3Mg
bGlrZSB0aGUgDQo+IGRlZmF1bHQgbm93LCBJIGRvbid0IGtub3cgd2h5IHdhcyBpdCBzZXQg
dG8gMjAwIGluIG15IGNvbmZpZywgbWF5YmUgdGhlIA0KPiBvbGQgZGVmYXVsdCB3YXMgZGlm
ZmVyZW50KS4NCg0KSSB3YXMgYXdheSBmb3IgYSB3aGlsZSBhbmQgSSBoYXZlbid0IHRyaWVk
IHRoaXMuIEJ1dCBpdCB3YXMgbXkgbmV4dCANCmlkZWEuIFRoYW5rcyBmb3IgY29uZmlybWlu
Zy4NCg0KPiANCj4gSG93ZXZlciBpdCdzIHN0aWxsIHZlcnkgYnVnZ3ksIGV2ZW4gYWZ0ZXIg
c2V0dGluZyANCj4gQ09ORklHX0RSTV9GQkRFVl9PVkVSQUxMT0MgdG8gMTAwLiBPbiBteSBu
b3RlYm9vayAoQVNVUyBHNTUxSlcsIHdpdGggYSANCj4gNHRoIGdlbiBpNyBjcHUpLCB0aGlz
IGlzIHdoYXQgSSBvYnNlcnZlOg0KPiAqIGFmdGVyIHRoZSBrZXJuZWwgYm9vdHMsIHRoZSB0
dXggbG9nb3MgcmFwaWRseSBmbGlja2VyIGF0IHRoZSB0b3Agb2YgDQo+IHRoZSBzY3JlZW4g
YW5kIEkgb25seSBzZWUgdGV4dCBhdCB0aGUgYm90dG9tIG9mIHRoZSBzY3JlZW4uIEFmdGVy
IGEgZmV3IA0KPiBzZWNvbmRzIGl0IHJldHVybnMgdG8gbm9ybWFsLg0KPiAqIHdoZW4gc3Rh
cnRpbmcgWCwgd2hldCBpdCBzd2l0Y2hlcyB0byBhIG5ldyBWVCB0aGUgdHV4IGxvZ29zIHJl
YXBwZWFyIA0KPiBhbG9uZyB3aXRoIHNvbWUgdGV4dCwgYnV0IG9ubHkgaW4gdGhlIHVwcGVy
IGxlZnQgY29ybmVyLiBUaGlzIGlzIGFsc28gDQo+IG9ubHkgaGFwcGVucyBmb3IgYSBzZWNv
bmQgb3Igc28sIHVudGlsIFggb3ZlcnRha2VzIHRoZSBkaXNwbGF5Lg0KPiAqIHdoZW4gdGVy
bWluYXRpbmcgWCwgdGhlIHR1eCBsb2dvcyB3aXRoIHRoZSBnYXJiYWdlIHRleHQgcmVtYWlu
IGluIHRoZSANCj4gdXBwZXIgbGVmdCBjb3JuZXIsIGJ1dCB0aGUgcmVzdCBvZiB0aGUgc2Ny
ZWVuIGlzIHJlcGxhY2VkIHdpdGggdGhlIA0KPiBjb3JyZWN0IGNvbnRlbnRzLiBUaGUgZ2Fy
YmFnZSBpbiB0aGUgdG9wIGxlZnQgY29ybmVyIHJlbWFpbnMgdW50aWwgDQo+IHNvbWV0aGlu
ZyBvdmVyd3JpdGVzIGl0IChsaWtlIHNjcm9sbGluZyB0aGUgdGVybWluYWwpLg0KPiBTbyBp
dCB3b3JrcywgYnV0IGJ1Z2d5IGFzIGhlbGwgYW5kIGF0IHRoaXMgcG9pbnQgSSdtIGJldHRl
ciBkaXNhYmxpbmcgDQo+IHNpbXBsZWRybSBhbmQganVzdCByZWx5aW5nIG9uIHRoZSBpOTE1
IGRyaXZlciwgbG9zaW5nIGVhcmx5IGNvbnNvbGUuIEkgDQo+IHRyaWVkIGJvb3Rpbmcgd2l0
aCBkcm0uZGVidWc9MHgxZmYsIGJ1dCBieSB0aGUgdGltZSBJIGNvdWxkIHJ1biBkbWVzZyBp
dCANCj4gZ2VuZXJhdGVkIHNvIG1hbnkgbWVzc2FnZXMgdGhhdCB0aGUgZWFybHkgYm9vdCBt
ZXNzYWdlcyB3ZXJlIGFscmVhZHkgbG9zdC4NCg0KSXQncyBhbGwgYnVpbGQgYXJvdW5kIGNv
cmUgRFJNIGhlbHBlcnMuIEkgZG9uJ3Qga25vdyB3aHkgc2ltcGxlZHJtIHNlZW1zIA0KZXJy
b3IgcHJvbmUsIHdoaWxlIHRoZSBvdGhlciBkcml2ZXJzIHdvcmsgd2l0aCB0aGVzZSBzYW1l
IGhlbHBlcnMuIA0KU29tZXRoaW5nIHRvIGV4cGxvcmUuLi4NCg0KPiANCj4gTm93LCBteSBk
ZXNrdG9wIGlzIGV2ZW4gd29yc2UuIE1vdGhlcmJvYXJkIGlzIGFuIEFTUm9jayBaODdNIEV4
dHJlbWU0LCANCj4gd2l0aCBhIEdlRm9yY2UgR1QgNjQwIGFuZCBHVFggOTgwIGNhcmRzICh0
aGUgaW50ZWdyYXRlZCBHUFUgaW4gdGhlIGludGVsIA0KPiBDUFUgaXMgZGlzYWJsZWQgaW4g
VUVGSSBzZXR0aW5ncykuIFVuZm9ydHVuYXRlbHkgdGhpcyByZXF1aXJlcyB0aGUgDQo+IHBy
b3ByaWV0YXJ5IG52aWRpYSBkcml2ZXJzLCBzbyBpdCdzIHByb2JhYmx5IG15IG93biBwcm9i
bGVtLCBidXQgYW55d2F5IA0KPiBpdCB3b3JrcyB1bnRpbCBJIGl0IGxvYWRzIHRoZSBudmlk
aWEgZHJpdmVycywgdGhlbiBhZnRlcndhcmRzICh3aGlsZSANCj4gc3RpbGwgaW4gZmJjb24p
IEkgaW5zdGVhZCBnZXQgNCBvciA1IHNtYWxsIGNvcGllcyBvZiBteSB0ZXJtaW5hbCBpbiB0
aGUgDQo+IHVwcGVyIHBhcnQgb2YgdGhlIHNjcmVlbiB3aXRoIHdyb25nIHN0cmlkZSwgc28g
aXQncyBjb21wbGV0ZWx5IA0KPiB1bnJlYWRhYmxlLiBBbmQgaWYgSSBldmVyIHN0YXJ0IFgs
IEkgd29uJ3QgaGF2ZSBhbnkgZmJjb24gdW50aWwgcmVib290LiANCj4gU28gNS4xNCBpcyBi
YXNpY2FsbHkgdW51c2FibGUgb24gdGhpcyBtYWNoaW5lLg0KQXNrIE52aWRpYS4NCg0KPiBB
bnkgaWRlYXMgd2hhdCBzaG91bGQgSSB0cnk/IEV2ZXJ5dGhpbmcgd29ya2VkIHdlbGwgd2l0
aCA1LjEzIGFuZCBpdHMgDQo+IHNpbXBsZWZiLg0KDQpJJ2Qgc3VnZ2VzdCB0byBnbyBiYWNr
IHRvIHNpbXBsZWZiIGZvciBhIHdoaWxlIGFuZCBtYXliZSB0cnkgc2ltcGxlZHJtIA0Kb2Nj
YXNpb25hbGx5Lg0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQo+IA0KPiBUaGFua3MsDQo+
IFpvbHRhbg0KPiANCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVy
IERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhm
ZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7D
vHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBGZWxpeCBJbWVuZMO2cmZmZXINCg==

--------------rvycenQq8W5BV1JcNyRD0pPF--

--------------EXDvMU0vZ9qM8q88UH3YFvAf
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmFOFrAFAwAAAAAACgkQlh/E3EQov+CT
OBAAjEwKJKJjH03/H91i5B9bieUqXZrL6tKBSSVGlqQFnGbtUglx9gXZp5I5oVU/cmqff0BzNtde
cFp6rVzf4pHtx7K1Ng6Ka+tdjEjhOWSQILeYsWF2C/ZR9HwOSwAEs3+Q7WQlyuL5VSy3ksh5nF+X
obsa+dFmb5xNlKzB13jsrrirhEJMLmDgiAU4ueBhPOZZHKYhhvznvuMjpUz+gbSswixMdL2cbyh+
vc5CbzywzuIAvQ9PgLyK8fv0ltvF0EZPSAqwtHP4/P1/uKDYmGZ/Z+mlPIXQ3D+Ir9PPD8zdVL9A
9agT0oqjNJawldleNYN5yUPay4YXXRtXZSdik9f1s3TRbnJrTFfw7fcurR2WvUxGC/i4aCpz29Ea
+USMlEfMnswTcbBS9Zi3KYPaNd0uTVXitN4tnnAa7jDzTkkN6vjU9FfgXpCOvXdZJ/aqWNicw/m8
dch4zxB1WiMW8I+XoLD1A0ZodXoM3whG4j+L710/XvygyQbzf07eKNW8OvfNYeGUBxsUbOIImCMJ
mY6JpKUmyrbW6u7mlGky9a8u9c+DXOOs2bK/wBARZDgvhbhMRAbRvC4wv7gJMyoUhH2TnITtSHLQ
vKi521VAkau/Qq2tKj9FGE4YLnoCYjyQZx5dnpJAfasB7rkhna6GSiW7OQf8kkQ8rRrwFBnx1UnW
IxE=
=tY4F
-----END PGP SIGNATURE-----

--------------EXDvMU0vZ9qM8q88UH3YFvAf--
