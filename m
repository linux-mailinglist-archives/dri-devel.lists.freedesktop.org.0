Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E14E77E51BC
	for <lists+dri-devel@lfdr.de>; Wed,  8 Nov 2023 09:14:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B453D10E3CA;
	Wed,  8 Nov 2023 08:14:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5970810E3CA
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Nov 2023 08:14:50 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id CA4891F8AB;
 Wed,  8 Nov 2023 08:14:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1699431288; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=qPFCyPOqy56S+AhcVEN9A89/YUJ5iTRdYxG+067kdpA=;
 b=tKjaNMDN0n4tei3HiLY1c4iReGusqnAXYSe/3LoIKmo4n81TeA5bXVzAhL9hbYxIbhwTYd
 ngD8S0CerpzFnxZfQq/ExKJ5iEhzoCLQyAsHnv64QiJR5YFkORMpi7uZnIweP3FRtQijX/
 0pMYY+a2RGCIys6lvSofvtOaKxfVQtY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1699431288;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=qPFCyPOqy56S+AhcVEN9A89/YUJ5iTRdYxG+067kdpA=;
 b=UMXE6xEvx5ZHSAm054w1U+aHr9opb9iMX11+LkjUOHVylkTq2oApb+qL8m7ESYA2RXk1Cr
 KzLk2UbcIDq2dRDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id EE0EB133F5;
 Wed,  8 Nov 2023 08:14:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id wLB3NXdDS2WXLgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 08 Nov 2023 08:14:47 +0000
Message-ID: <f461f122-d3e4-4ffb-a252-543f9b6e4e5a@suse.de>
Date: Wed, 8 Nov 2023 09:14:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/Makefile: Move tiny drivers before native drivers
To: Huacai Chen <chenhuacai@loongson.cn>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Javier Martinez Canillas <javierm@redhat.com>
References: <20231108024613.2898921-1-chenhuacai@loongson.cn>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
Autocrypt: addr=tzimmermann@suse.de; keydata=
 xsBNBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAHNJ1Rob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPsLAjgQTAQgAOAIb
 AwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftODH
 AAoJEGgNwR1TC3ojx1wH/0hKGWugiqDgLNXLRD/4TfHBEKmxIrmfu9Z5t7vwUKfwhFL6hqvo
 lXPJJKQpQ2z8+X2vZm/slsLn7J1yjrOsoJhKABDi+3QWWSGkaGwRJAdPVVyJMfJRNNNIKwVb
 U6B1BkX2XDKDGffF4TxlOpSQzdtNI/9gleOoUA8+jy8knnDYzjBNOZqLG2FuTdicBXblz0Mf
 vg41gd9kCwYXDnD91rJU8tzylXv03E75NCaTxTM+FBXPmsAVYQ4GYhhgFt8S2UWMoaaABLDe
 7l5FdnLdDEcbmd8uLU2CaG4W2cLrUaI4jz2XbkcPQkqTQ3EB67hYkjiEE6Zy3ggOitiQGcqp
 j//OwE0EWznS4AEIAMYmP4M/V+T5RY5at/g7rUdNsLhWv1APYrh9RQefODYHrNRHUE9eosYb
 T6XMryR9hT8XlGOYRwKWwiQBoWSDiTMo/Xi29jUnn4BXfI2px2DTXwc22LKtLAgTRjP+qbU6
 3Y0xnQN29UGDbYgyyK51DW3H0If2a3JNsheAAK+Xc9baj0LGIc8T9uiEWHBnCH+RdhgATnWW
 GKdDegUR5BkDfDg5O/FISymJBHx2Dyoklv5g4BzkgqTqwmaYzsl8UxZKvbaxq0zbehDda8lv
 hFXodNFMAgTLJlLuDYOGLK2AwbrS3Sp0AEbkpdJBb44qVlGm5bApZouHeJ/+n+7r12+lqdsA
 EQEAAcLAdgQYAQgAIAIbDBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftOH6AAoJEGgNwR1T
 C3ojVSkIALpAPkIJPQoURPb1VWjh34l0HlglmYHvZszJWTXYwavHR8+k6Baa6H7ufXNQtThR
 yIxJrQLW6rV5lm7TjhffEhxVCn37+cg0zZ3j7zIsSS0rx/aMwi6VhFJA5hfn3T0TtrijKP4A
 SAQO9xD1Zk9/61JWk8OysuIh7MXkl0fxbRKWE93XeQBhIJHQfnc+YBLprdnxR446Sh8Wn/2D
 Ya8cavuWf2zrB6cZurs048xe0UbSW5AOSo4V9M0jzYI4nZqTmPxYyXbm30Kvmz0rYVRaitYJ
 4kyYYMhuULvrJDMjZRvaNe52tkKAvMevcGdt38H4KSVXAylqyQOW5zvPc4/sq9c=
In-Reply-To: <20231108024613.2898921-1-chenhuacai@loongson.cn>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------uy0C0yxFsFUw09rnQR1v5MkI"
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
Cc: Jaak Ristioja <jaak@ristioja.ee>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------uy0C0yxFsFUw09rnQR1v5MkI
Content-Type: multipart/mixed; boundary="------------eCFLK4SqwjuuVD0L7ZbTqKt0";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Huacai Chen <chenhuacai@loongson.cn>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Javier Martinez Canillas <javierm@redhat.com>
Cc: dri-devel@lists.freedesktop.org, Jaak Ristioja <jaak@ristioja.ee>
Message-ID: <f461f122-d3e4-4ffb-a252-543f9b6e4e5a@suse.de>
Subject: Re: [PATCH] drm/Makefile: Move tiny drivers before native drivers
References: <20231108024613.2898921-1-chenhuacai@loongson.cn>
In-Reply-To: <20231108024613.2898921-1-chenhuacai@loongson.cn>

--------------eCFLK4SqwjuuVD0L7ZbTqKt0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGksDQoNCnRoYW5rcyBmb3IgdGhlIHBhdGNoLg0KDQpBbSAwOC4xMS4yMyB1bSAwMzo0NiBz
Y2hyaWViIEh1YWNhaSBDaGVuOg0KPiBBZnRlciBjb21taXQgNjBhZWJjOTU1OTQ5MmNlYSAo
ImRyaXZlcnMvZmlybXdhcmU6IE1vdmUgc3lzZmJfaW5pdCgpIGZyb20NCj4gZGV2aWNlX2lu
aXRjYWxsIHRvIHN1YnN5c19pbml0Y2FsbF9zeW5jIikgc29tZSBMZW5vdm8gbGFwdG9wcyBn
ZXQgYSBibGFuaw0KPiBzY3JlZW4gdW50aWwgdGhlIGRpc3BsYXkgbWFuYWdlciBzdGFydHMu
DQo+IA0KPiBUaGlzIHJlZ3Jlc3Npb24gb2NjdXJzIHdpdGggc3VjaCBhIEtjb25maWcgY29t
YmluYXRpb246DQo+IENPTkZJR19TWVNGQj15DQo+IENPTkZJR19TWVNGQl9TSU1QTEVGQj15
DQo+IENPTkZJR19EUk1fU0lNUExFRFJNPXkNCj4gQ09ORklHX0RSTV9JOTE1PXkgICAgICAj
IE9yIG90aGVyIG5hdGl2ZSBkcml2ZXJzIHN1Y2ggYXMgcmFkZW9uLCBhbWRncHUNCj4gDQo+
IElmIHJlcGxhY2UgQ09ORklHX0RSTV9TSU1QTEVEUk0gd2l0aCBDT05GSUdfRkJfU0lNUExF
ICh0aGV5IHVzZSB0aGUgc2FtZQ0KPiBkZXZpY2UpLCB0aGVyZSBpcyBubyBibGFuayBzY3Jl
ZW4uIFRoZSByb290IGNhdXNlIGlzIHRoZSBpbml0aWFsaXphdGlvbg0KPiBvcmRlciwgYW5k
IHRoaXMgb3JkZXIgZGVwZW5kcyBvbiB0aGUgTWFrZWZpbGUuDQo+IA0KPiBGQl9TSU1QTEUg
aXMgYmVmb3JlIG5hdGl2ZSBEUk0gZHJpdmVycyAoZS5nLiBpOTE1LCByYWRlb24sIGFtZGdw
dSwgYW5kDQo+IHNvIG9uKSwgYnV0IERSTV9TSU1QTEVEUk0gaXMgYWZ0ZXIgdGhlbS4gVGh1
cywgaWYgd2UgdXNlIEZCX1NJTVBMRSwgSTkxNQ0KPiB3aWxsIHRha2VvdmVyIEZCX1NJTVBM
RSwgdGhlbiBubyBwcm9ibGVtOyBhbmQgaWYgd2UgdXNlIERSTV9TSU1QTEVEUk0sDQo+IERS
TV9TSU1QTEVEUk0gd2lsbCB0cnkgdG8gdGFrZW92ZXIgSTkxNSwgYnV0IGZhaWxzIHRvIHdv
cmsuDQoNCkJ1dCB3aGF0IGV4YWN0bHkgaXMgdGhlIHByb2JsZW0/IEZyb20gdGhlIGxlbmd0
aHkgZGlzY3Vzc2lvbiB0aHJlYXQsIGl0IA0KbG9va3MgbGlrZSB5b3UndmUgc3R1bWJsZWQg
YWNyb3NzIGEgbG9uZy1rbm93biBwcm9ibGVtLCB3aGVyZSB0aGUgDQpmaXJtd2FyZSBkcml2
ZXIgcHJvYmVzIGEgZGV2aWNlIHRoYXQgaGFzIGFscmVhZHkgYmVlbiB0YWtlbiBieSBhIG5h
dGl2ZSANCmRyaXZlci4gQnV0IHRoYXQgc2hvdWxkIG5vdCBiZSBwb3NzaWJsZS4NCg0KQXMg
eW91IGtub3csIHRoZXJlJ3MgYSBwbGF0Zm9ybSBkZXZpY2UgdGhhdCByZXByZXNlbnRzIHRo
ZSBmaXJtd2FyZSANCmZyYW1lYnVmZmVyLiBUaGUgZmlybXdhcmUgZHJpdmVycywgc3VjaCBh
cyBzaW1wbGVkcm0sIGJpbmQgdG8gaXQuIEluIA0KaTkxNSBhbmQgdGhlIG90aGVyIG5hdGl2
ZSBkcml2ZXJzIHdlIHJlbW92ZSB0aGF0IHBsYXRmb3JtIGRldmljZSwgc28gDQp0aGF0IHNp
bXBsZWRybSBkb2VzIG5vdCBydW4uDQoNCldlIGNhbGwgdGhlIERSTSBhcGVydHVyZSBoZWxw
ZXJzIGF0IFsxXS4gSXQncyBpbXBsZW1lbnRlZCBhdCBbMl0uIFRoZSANCmZ1bmN0aW9uIGNv
bnRhaW5zIGEgY2FsbCB0byBzeXNmYl9kaXNhYmxlKCksIFszXSB3aGljaCBzaG91bGQgYmUg
aW52b2tlZCANCmZvciB0aGUgaTkxNSBkZXZpY2UgYW5kIHJlbW92ZSB0aGUgcGxhdGZvcm0g
ZGV2aWNlLg0KDQpbMV0gDQpodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC92Ni41
L3NvdXJjZS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X2RyaXZlci5jI0w0ODkNClsyXSAN
Cmh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L3Y2LjUvc291cmNlL2RyaXZlcnMv
dmlkZW8vYXBlcnR1cmUuYyNMMzQ3DQpbM10gDQpodHRwczovL2VsaXhpci5ib290bGluLmNv
bS9saW51eC92Ni41L3NvdXJjZS9kcml2ZXJzL2Zpcm13YXJlL3N5c2ZiLmMjTDYzDQoNCkNh
biB5b3UgaW52ZXN0aWdhdGUgd2h5IHRoaXMgZG9lcyBub3Qgd29yaz8gSXMgc3lzZmJfZGlz
YWJsZSgpIG5vdCBiZWluZyANCmNhbGxlZD8gRG9lcyBpdCByZW1vdmUgdGhlIHBsYXRmb3Jt
IGRldmljZT8NCg0KPiANCj4gU28gd2UgY2FuIG1vdmUgdGhlICJ0aW55IiBkaXJlY3Rvcnkg
YmVmb3JlIG5hdGl2ZSBEUk0gZHJpdmVycyB0byBzb2x2ZQ0KPiB0aGlzIHByb2JsZW0uDQoN
ClJlbHlpbmcgb24gbGlua2luZyBvcmRlciBpcyBqdXN0IGFzIHVucmVsaWFibGUuIFRoZSB1
c3VhbCB3b3JrYXJvdW5kIGlzIA0KdG8gYnVpbGQgbmF0aXZlIGRyaXZlcnMgYXMgbW9kdWxl
cy4gQnV0IGZpcnN0LCBwbGVhc2UgaW52ZXN0aWdhdGUgd2hlcmUgDQp0aGUgY3VycmVudCBj
b2RlIGZhaWxzLg0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQo+IA0KPiBGaXhlczogNjBh
ZWJjOTU1OTQ5MmNlYSAoImRyaXZlcnMvZmlybXdhcmU6IE1vdmUgc3lzZmJfaW5pdCgpIGZy
b20gZGV2aWNlX2luaXRjYWxsIHRvIHN1YnN5c19pbml0Y2FsbF9zeW5jIikNCj4gQ2xvc2Vz
OiBodHRwczovL2xvcmUua2VybmVsLm9yZy9kcmktZGV2ZWwvWlVuTmkzcTN5QjN6WmZUbEBQ
NzAubG9jYWxkb21haW4vVC8jdA0KPiBSZXBvcnRlZC1ieTogSmFhayBSaXN0aW9qYSA8amFh
a0ByaXN0aW9qYS5lZT4NCj4gU2lnbmVkLW9mZi1ieTogSHVhY2FpIENoZW4gPGNoZW5odWFj
YWlAbG9vbmdzb24uY24+DQo+IC0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9NYWtlZmlsZSB8
IDIgKy0NCj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24o
LSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vTWFrZWZpbGUgYi9kcml2
ZXJzL2dwdS9kcm0vTWFrZWZpbGUNCj4gaW5kZXggOGUxYmRlMDU5MTcwLi5kYjBmM2QzYWZm
NDMgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9NYWtlZmlsZQ0KPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vTWFrZWZpbGUNCj4gQEAgLTE0MSw2ICsxNDEsNyBAQCBvYmoteQkJ
CSs9IGFybS8NCj4gICBvYmoteQkJCSs9IGRpc3BsYXkvDQo+ICAgb2JqLSQoQ09ORklHX0RS
TV9UVE0pCSs9IHR0bS8NCj4gICBvYmotJChDT05GSUdfRFJNX1NDSEVEKQkrPSBzY2hlZHVs
ZXIvDQo+ICtvYmoteQkJCSs9IHRpbnkvDQo+ICAgb2JqLSQoQ09ORklHX0RSTV9SQURFT04p
Kz0gcmFkZW9uLw0KPiAgIG9iai0kKENPTkZJR19EUk1fQU1ER1BVKSs9IGFtZC9hbWRncHUv
DQo+ICAgb2JqLSQoQ09ORklHX0RSTV9BTURHUFUpKz0gYW1kL2FtZHhjcC8NCj4gQEAgLTE4
Miw3ICsxODMsNiBAQCBvYmotJChDT05GSUdfRFJNX0ZTTF9EQ1UpICs9IGZzbC1kY3UvDQo+
ICAgb2JqLSQoQ09ORklHX0RSTV9FVE5BVklWKSArPSBldG5hdml2Lw0KPiAgIG9iai15CQkJ
Kz0gaGlzaWxpY29uLw0KPiAgIG9iai15CQkJKz0gbXhzZmIvDQo+IC1vYmoteQkJCSs9IHRp
bnkvDQo+ICAgb2JqLSQoQ09ORklHX0RSTV9QTDExMSkgKz0gcGwxMTEvDQo+ICAgb2JqLSQo
Q09ORklHX0RSTV9UVkUyMDApICs9IHR2ZTIwMC8NCj4gICBvYmotJChDT05GSUdfRFJNX1hF
TikgKz0geGVuLw0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIg
RGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCkZyYW5r
ZW5zdHJhc3NlIDE0NiwgOTA0NjEgTnVlcm5iZXJnLCBHZXJtYW55DQpHRjogSXZvIFRvdGV2
LCBBbmRyZXcgTXllcnMsIEFuZHJldyBNY0RvbmFsZCwgQm91ZGllbiBNb2VybWFuDQpIUkIg
MzY4MDkgKEFHIE51ZXJuYmVyZykNCg==

--------------eCFLK4SqwjuuVD0L7ZbTqKt0--

--------------uy0C0yxFsFUw09rnQR1v5MkI
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmVLQ3cFAwAAAAAACgkQlh/E3EQov+Dz
jA//Qp9tEYHouNx0ySgFpk+kEf4yH34Um6AUsIC6mOfQ39Pb3gFNwL031PM+IYncKX/39x6ePo8Q
P1lkM0f7yEnAq3EGcpHUm93UtUq4VHAwhywL9zKp+7rCN7POQKROToRNmpuZ8GBfFg66xaOYpB3x
oTZyEABdkR3rYel7vkv9vh1o7WcP53JfhoYnVhukxEJ21yyvCgrp57qD7/gnnPBWHNCS0o1UD4fl
9q1sHFdG6gl03R662s312gV+N0OBCIpb8tvWbRreCMoIClwRbEqCA6/90u2HSrTokl/jmI9Oj+oE
elqqP4kRUJ3kuA4H+k0vMTGPubX9AaPa03HNfUtQd44Q6KZM1Cp795lNfQsBe3GTl0aaal/qKxn7
bd9pExhgv1A99IUzjcbL6d/3OFyS5GroVWf8e8mkBGbKCFEUn2UF/LjfYuqLxbcJmG/73jtIRqUN
aV2OLgWWpI4Bf/oLBYHvdAX8cBACRD97h4Fcg1GNm804JrsSBzdNXR8v2bwwpVV+tgYJ7PbCo7SP
XIz2AtOMFHZ7ooyQrxhiBNZ2P8z5fL8JiLF8XiF42tFUM6hUz7ob2svG00O+ts1FDNGJCqfZDP6B
k/EZIooH9189N08NluOagU2LWlvwvPyTdYDbh2QaR17o4TuX/AeIBzXe8v+5wS5XwwNn3G9KvCbw
6Jc=
=MmFk
-----END PGP SIGNATURE-----

--------------uy0C0yxFsFUw09rnQR1v5MkI--
