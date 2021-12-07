Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 94A8F46B8B3
	for <lists+dri-devel@lfdr.de>; Tue,  7 Dec 2021 11:20:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84AAAEA7F3;
	Tue,  7 Dec 2021 10:20:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6A73EA7F3
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Dec 2021 10:20:10 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 889331FD2F;
 Tue,  7 Dec 2021 10:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1638872409; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qM7yciPPFvBZvKovAKZtxhDTcu1tDT01ZYjgVWk4dKI=;
 b=UkLgYoYVwGNXfFrMr1C1cmGz+wi/t9QYBjMF0O/xWjA7d00rgLL8cXPDsug1W5o4kXpsOD
 z4A7yOhg5Lb0pxC66iw7cL1JCAnzMC1Nyy04YlAJt9l2Y7UooESKW9i+PUeXTjKRELrkZ7
 uF/oTlyX5e4fTAYJKFqqK1UvfwmI48k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1638872409;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qM7yciPPFvBZvKovAKZtxhDTcu1tDT01ZYjgVWk4dKI=;
 b=hxkreLcM485+LsCFmv193fS6ONW63/nHAR5oWrO6lBiv19vZMsjiQt352G72USH9GN0Grt
 voigXuueWJ3bbWAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 464A613A1F;
 Tue,  7 Dec 2021 10:20:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id /RchEFk1r2E9awAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 07 Dec 2021 10:20:09 +0000
Message-ID: <afce9a18-8819-56ba-91d9-71b061186d69@suse.de>
Date: Tue, 7 Dec 2021 11:20:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH v2 2/3] drm/format-helper: Add
 drm_fb_xrgb8888_to_xrgb2101010_toio()
Content-Language: en-US
To: Hector Martin <marcan@marcan.st>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>
References: <20211207072943.121961-1-marcan@marcan.st>
 <20211207072943.121961-3-marcan@marcan.st>
 <03a52a64-7be3-b401-7711-b7b1452f433d@suse.de>
 <c339c133-25d0-3c8e-e776-b61108836528@marcan.st>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <c339c133-25d0-3c8e-e776-b61108836528@marcan.st>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------DgLD0puFfDYxxaTlS4GDixHV"
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
Cc: Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Javier Martinez Canillas <javier@dowhile0.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------DgLD0puFfDYxxaTlS4GDixHV
Content-Type: multipart/mixed; boundary="------------uDUCbj8QGgjfhgqmezVXXbZm";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Hector Martin <marcan@marcan.st>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Javier Martinez Canillas <javier@dowhile0.org>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>
Message-ID: <afce9a18-8819-56ba-91d9-71b061186d69@suse.de>
Subject: Re: [PATCH v2 2/3] drm/format-helper: Add
 drm_fb_xrgb8888_to_xrgb2101010_toio()
References: <20211207072943.121961-1-marcan@marcan.st>
 <20211207072943.121961-3-marcan@marcan.st>
 <03a52a64-7be3-b401-7711-b7b1452f433d@suse.de>
 <c339c133-25d0-3c8e-e776-b61108836528@marcan.st>
In-Reply-To: <c339c133-25d0-3c8e-e776-b61108836528@marcan.st>

--------------uDUCbj8QGgjfhgqmezVXXbZm
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDcuMTIuMjEgdW0gMTA6NTQgc2NocmllYiBIZWN0b3IgTWFydGluOg0KPiBI
aSwgdGhhbmtzIGZvciB0aGUgcmV2aWV3IQ0KPiANCj4gT24gMDcvMTIvMjAyMSAxOC40MCwg
VGhvbWFzIFppbW1lcm1hbm4gd3JvdGU6DQo+PiBIaQ0KPj4NCj4+IEFtIDA3LjEyLjIxIHVt
IDA4OjI5IHNjaHJpZWIgSGVjdG9yIE1hcnRpbjoNCj4+PiBBZGQgWFJHQjg4ODggZW11bGF0
aW9uIHN1cHBvcnQgZm9yIGRldmljZXMgdGhhdCBjYW4gb25seSBkbyBYUkdCMjEwMTAxMC4N
Cj4+Pg0KPj4+IFRoaXMgaXMgY2hpZWZseSB1c2VmdWwgZm9yIHNpbXBsZWRybSBvbiBBcHBs
ZSBkZXZpY2VzIHdoZXJlIHRoZQ0KPj4+IGJvb3Rsb2FkZXItcHJvdmlkZWQgZnJhbWVidWZm
ZXIgaXMgMTAtYml0Lg0KPj4+DQo+Pj4gU2lnbmVkLW9mZi1ieTogSGVjdG9yIE1hcnRpbiA8
bWFyY2FuQG1hcmNhbi5zdD4NCj4+PiAtLS0NCj4+PiDCoMKgIGRyaXZlcnMvZ3B1L2RybS9k
cm1fZm9ybWF0X2hlbHBlci5jIHwgNjIgDQo+Pj4gKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysNCj4+PiDCoMKgIGluY2x1ZGUvZHJtL2RybV9mb3JtYXRfaGVscGVyLmjCoMKgwqDC
oCB8wqAgMyArKw0KPj4+IMKgwqAgMiBmaWxlcyBjaGFuZ2VkLCA2NSBpbnNlcnRpb25zKCsp
DQo+Pj4NCj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9mb3JtYXRfaGVs
cGVyLmMgDQo+Pj4gYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2Zvcm1hdF9oZWxwZXIuYw0KPj4+
IGluZGV4IGRiZTNlODMwMDk2ZS4uZWRkNjExZDNhYjZhIDEwMDY0NA0KPj4+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9kcm1fZm9ybWF0X2hlbHBlci5jDQo+Pj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL2RybV9mb3JtYXRfaGVscGVyLmMNCj4+PiBAQCAtNDA5LDYgKzQwOSw1OSBAQCB2
b2lkIGRybV9mYl94cmdiODg4OF90b19yZ2I4ODhfdG9pbyh2b2lkIF9faW9tZW0gDQo+Pj4g
KmRzdCwgdW5zaWduZWQgaW50IGRzdF9waXRjaCwNCj4+PiDCoMKgIH0NCj4+PiDCoMKgIEVY
UE9SVF9TWU1CT0woZHJtX2ZiX3hyZ2I4ODg4X3RvX3JnYjg4OF90b2lvKTsNCj4+PiArc3Rh
dGljIHZvaWQgZHJtX2ZiX3hyZ2I4ODg4X3RvX3hyZ2IyMTAxMDEwX2xpbmUodTMyICpkYnVm
LCBjb25zdCB1MzIgDQo+Pj4gKnNidWYsDQo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdW5zaWduZWQgaW50IHBpeGVscykNCj4+PiArew0K
Pj4+ICvCoMKgwqAgdW5zaWduZWQgaW50IHg7DQo+Pj4gKw0KPj4+ICvCoMKgwqAgZm9yICh4
ID0gMDsgeCA8IHBpeGVsczsgeCsrKSB7DQo+Pj4gK8KgwqDCoMKgwqDCoMKgICpkYnVmKysg
PSAoKHNidWZbeF0gJiAweDAwMDAwMEZGKSA8PCAyKSB8DQo+Pj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgICgoc2J1Zlt4XSAmIDB4MDAwMEZGMDApIDw8IDQpIHwNCj4+PiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKChzYnVmW3hdICYgMHgwMEZGMDAwMCkgPDwgNik7
DQo+Pg0KPj4gVGhpcyBpc24ndCBxdWl0ZSByaWdodC4gVGhlIGxvd2VzdCB0d28gZGVzdGlu
YXRpb24gYml0cyBpbiBlYWNoDQo+PiBjb21wb25lbnQgd2lsbCBhbHdheXMgYmUgemVyby4g
WW91IGhhdmUgdG8gZG8gdGhlIHNoaWZ0aW5nIGFzIGFib3ZlIGFuZA0KPj4gZm9yIGVhY2gg
Y29tcG9uZW50IHRoZSB0d28gaGlnaGVzdCBzb3VyY2UgYml0cyBoYXZlIHRvIGJlIE9SJ2Vk
IGludG8gdGhlDQo+PiB0d28gbG93ZXN0IGRlc3RpbmF0aW9uIGJpdHMuIEZvciBleGFtcGxl
IHRoZSBzb3VyY2UgYml0cyBpbiBhIGNvbXBvbmVudA0KPj4gYXJlIG51bWJlcmVkIDcgdG8g
MA0KPj4NCj4+IMKgwqAgfCA3IDYgNSA0IDMgMiAxIDAgfA0KPj4NCj4+IHRoZW4gdGhlIGRl
c3RpbmF0aW9uIGJpdHMgc2hvdWxkIGJlDQo+Pg0KPj4gwqDCoCB8IDcgNiA1IDQgMyAyIDEg
MCA3IDYgfA0KPj4NCj4gDQo+IEkgdGhpbmsgYm90aCBhcHByb2FjaGVzIGhhdmUgcHJvcyBh
bmQgY29ucy4gTGVhdmluZyB0aGUgdHdvIExTQnMgYWx3YXlzIA0KPiBhdCAwIHlpZWxkcyBh
IGZ1bGx5IGxpbmVhciB0cmFuc2ZlciBjdXJ2ZSB3aXRoIG5vIGRpc2NvbnRpbnVpdGllcywg
YnV0IA0KPiBtZWFucyB0aGUgbWF4aW11bSBicmlnaHRuZXNzIGlzIHNsaWdodGx5IGxlc3Mg
dGhhbiBmdWxsLiBTZXR0aW5nIHRoZW0gDQo+IGZ1bGx5IG1hcHMgdGhlIGJyaWdodG5lc3Mg
cmFuZ2UsIGJ1dCBjcmVhdGVzIDQgZG91YmxlIHdpZGUgc3RlcHMgaW4gdGhlIA0KPiB0cmFu
c2ZlciBjdXJ2ZSAoYWxzbyBpdCdzIHBvdGVudGlhbGx5IHNsaWdodGx5IHNsb3dlciBDUFUt
d2lzZSkuDQo+IA0KPiBJZiB5b3UgcHJlZmVyIHRoZSBsYXR0ZXIgSSdsbCBkbyB0aGF0IGZv
ciB2Mi4NCg0KV2UgZG9uJ3QgZ2l2ZSBndWFyYW50ZWVzIGZvciBjb2xvciBvdXRwdXQgdW5s
ZXNzIGNvbG9yIHNwYWNlcyBhcmUgDQppbnZvbHZlZC4gQnV0IHRoZSBsYWNrIG9mIExTQiBi
aXRzIGNhbiBiZSBtb3JlIHZpc2libGUgdGhhbiBsYXJnZXIgc3RlcHMgDQppbiB0aGUgY3Vy
dmUuIFdpdGggdGhlIGN1cnJlbnQgZm9ybWF0cyBoZXJlLCBpdCdzIHByb2JhYmx5IGEgbm9u
LWlzc3VlLiANCkJ1dCB0aGVyZSBjYW4gYmUgY29udmVyc2lvbnMsIHN1Y2ggYXMgUkdCNDQ0
IHRvIFJHQjg4LCB3aGVyZSB0aGVzZSANCm1pc3NpbmcgTFNCcyBtYWtlIGEgdmlzaWJsZSBk
aWZmZXJlbmNlLg0KDQpUaGVyZWZvcmUsIHBsZWFzZSBjaGFuZ2UgdGhlIGFsZ29yaXRobS4g
SXQgcHJvZHVjZXMgbW9yZSBjb25zaXN0ZW50IA0KcmVzdWx0cyBvdmVyIGEgdmFyaWV0eSBv
ZiBmb3JtYXQgY29udmVyc2lvbi4gSXQncyBiZXR0ZXIgdG8gaGF2ZSB0aGUgDQpzYW1lIChk
ZWZhdWx0KSBhbGdvcml0aG0gZm9yIGFsbCBvZiB0aGVtLg0KDQpCZXN0IHJlZ2FyZHMNClRo
b21hcw0KDQo+IA0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIg
RGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCk1heGZl
bGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8
cm5iZXJnKQ0KR2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rldg0K

--------------uDUCbj8QGgjfhgqmezVXXbZm--

--------------DgLD0puFfDYxxaTlS4GDixHV
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmGvNVgFAwAAAAAACgkQlh/E3EQov+Bs
0RAAwF27/E6srIzBbLxzjirh0AlUNPritli3cKtZScS5z/YFYYdrO4yTbo5EeTacUXR7YyDx02Kd
wTMtk9n0eP5neQgm+dhfLK7hWxPtyxJAqdnAKRkhiVVjOwuKGoXMazyMoQ2PV0jNVa01zNprPp8t
qd9sQPDCvts9TaXep4PnQ5wak4UrYIB8ZHsob65f/to273N8aWeHycEzHh0DGIo+sgGb5YgjFxfX
OFlsmsFbTX/QHc9FqJS86fkMnejNWsYnx8vhxE8CwJKKhGQjK+nbSskSlHK0lQgjtpvOjvANq6HP
bkJ1+yTccAnAQMUE4bxknWY1DYQLwhsIH4Ct/DS6m04/Oi9DyRNiCXqNOZMmtJS/ErW0oS140x3D
Ub8mf7WHxyiCv0SlJkFbesnTAl79u8v5CjJ899hokEAw0BXMU3FeHZxTW/kXRcx24HJQU4dgo6/N
QAHuTzAmBS3XX3tRnO3nd6sccfpzfaOXL7QzVkvicyZWkfuIMwRSjSB5fKUZPcpE8rNoBncdpKiu
OYwmtkoovLsQdx/vkPH6ozckTMY8VB95KzXOEP5x7upnqPHGaJrL61JtSvxIjaEgsQd+UjTZvL6i
p+W+V5eGpAd5HmrxRjcAemIJqK+nCJMWrP/wfK9DOBxxPQfk6sCCDkvw/9TBxvqVOZHzFqG38aJ6
Pzw=
=BHJh
-----END PGP SIGNATURE-----

--------------DgLD0puFfDYxxaTlS4GDixHV--
