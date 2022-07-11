Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA1EF56D513
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 09:01:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51B368BFFF;
	Mon, 11 Jul 2022 07:01:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86AF28BFFB
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 07:01:53 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id DF8E422798;
 Mon, 11 Jul 2022 07:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1657522910; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=j61ev+swPLVDVmD7yLL1EUhJFw4QRbCvk5PO/axVV2A=;
 b=b2rSW+frVXcOFsMsxKJJtCR1g6EDRB9JPP3ytoiRxD/9WpcIjOfirHyX91psXRh+WkceRS
 pDzNiSJQSVyllAfLrDyWJvfLJZB2mTpkQmPNV447WQSyVkOv7L2ON9ZxGtk+baKqfDx0Qm
 Skec6JeLOS3mSauOxEKXLEXwvf10V+E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1657522910;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=j61ev+swPLVDVmD7yLL1EUhJFw4QRbCvk5PO/axVV2A=;
 b=gIJ3aR96t2kUCnxPKERovhbYBp/t+dmCIaOlqq8oeRbN5Q7OtQH99+T+ECbmgyxQcdDbOh
 JHs24cPNS9TnLSDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C19EC13524;
 Mon, 11 Jul 2022 07:01:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id lO1VLt7Ky2IufgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 11 Jul 2022 07:01:50 +0000
Message-ID: <f7f2e4ce-fced-78d7-258f-a4e723b1bbbf@suse.de>
Date: Mon, 11 Jul 2022 09:01:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1 0/11] drm/via: Make via a single file driver
Content-Language: en-US
To: Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org
References: <20220710085506.1384056-1-sam@ravnborg.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220710085506.1384056-1-sam@ravnborg.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------ghMPMo5tMpxHkpx0ZbjC2eew"
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
Cc: Kevin Brace <kevinbrace@bracecomputerlab.com>,
 Javier Martinez Canillas <javierm@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------ghMPMo5tMpxHkpx0ZbjC2eew
Content-Type: multipart/mixed; boundary="------------kiZXt3z5bqiRRowMBbhizPs1";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org
Cc: Kevin Brace <kevinbrace@bracecomputerlab.com>,
 Javier Martinez Canillas <javierm@redhat.com>
Message-ID: <f7f2e4ce-fced-78d7-258f-a4e723b1bbbf@suse.de>
Subject: Re: [PATCH v1 0/11] drm/via: Make via a single file driver
References: <20220710085506.1384056-1-sam@ravnborg.org>
In-Reply-To: <20220710085506.1384056-1-sam@ravnborg.org>

--------------kiZXt3z5bqiRRowMBbhizPs1
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgU2FtLA0KDQp0aGlzIGxvb2tzIGxpa2UgYSBnb29kIHNvbHV0aW9uIHRvIG1lLiBJJ2Qg
Z2l2ZSB5b3UgYSBkZXRhaWxlZCByZXZpZXcsIA0KYnV0IGRyaS1kZXZlbCBkZWNpZGVkIHRv
IG9ubHkgc2VuZCBtZSB0aGUgY29sb3IgbGV0dGVyLiBJIGhhZCB0byB1c2UgDQpwYXRjaHdv
cmsgZ2V0IHRoZSBwYXRjaGVzLg0KDQpGb3IgdGhlIHNlcmllcw0KDQpBY2tlZC1ieTogVGhv
bWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+DQoNCndpdGggc3VnZ2VzdGlv
bnMgYmVsb3cuDQoNCkFtIDEwLjA3LjIyIHVtIDEwOjU0IHNjaHJpZWIgU2FtIFJhdm5ib3Jn
Og0KPiBXZSBoYXZlIGFuIHVwY29taW5nIG9wZW5jaHJvbWUgZHJpdmVyIGZvciBWSUEgd2hl
cmUgc29tZQ0KPiBvZiB0aGUgZmlsZXMgY29uZmxpY3RzIHdpdGggdGhlIGV4aXN0aW5nIHZp
YSBkcml2ZXIuDQo+IA0KPiBJdCBpcyBub3QgYWNjZXB0YWJsZSB0byBqdXN0IGRlbGV0ZSB0
aGUgZXhpc3RpbmcgRFJJMQ0KPiBiYXNlZCBkcml2ZXIgYXMgdGhlcmUgYXJlIG1vc3QgbGlr
ZWx5IHVzZXJzIG91dCB0aGVyZSwNCj4gc28gYSBkaWZmZXJlbnQgYXBwcm9hY2ggd2FzIHJl
cXVpcmVkLg0KPiANCj4gSXQgd2FzIGRpc2NjdXNzZWQgd2hhdCB0byBkbyBhbmQgdGhlIGxl
YXN0IGludmFzaXZlDQo+IHNvbHV0aW9uIHdhcyB0byBrZWVwIHRoZSBEUkkxIGRyaXZlciBp
biB0aGUgY3VycmVudA0KPiBkaXJlY3RvcnkgYXMgYSBzaW5nbGUgZmlsZS4NCj4gDQo+IFRo
b21hcyBaaW1tZXJtYW5uIGFscmVhZHkgcG9zdGVkIGEgcGF0Y2ggdG8gZG8gdGhlDQo+IHNh
bWUgYnV0IGl0IGF0dGVtcGVkIHRvIGhhdmUgYSBzaW5nbGUgZHJpdmVyDQo+IGZvciB0aGUg
RFJJMSBhbmQgdGhlIHVwY29taW5nIG5ldyBkcml2ZXIuDQoNCkFmdGVyIHRoZSBvcGVuY2hy
b21lIHBhdGNoZXMgbGFuZCwgdGhlcmUgd2lsbCBiZSBhbiBvcHRpb24gaW4gS2NvbmZpZyB0
byANCmJ1aWxkIHRoZSBvbGQgZHJpdmVyIGluc3RlYWQgb2Ygb2YgdGhlIG5ldyBvbmU/DQoN
Cj4gDQo+IFRoaXMgcGF0Y2hzZXQgZW1iZWRzIHRoZSBmaWxlcyBvbmUgYnkgb25lIHRvIG1h
a2UgdGhlDQo+IGRpZmZzIHJlbW90ZWx5IHJlYWRhYmxlIGFuZCBlbmQgdXAgd2l0aCBhbiBp
bmRlcGVuZGVudA0KPiBEUkkxIGRyaXZlci4NCj4gDQo+IFRoZSBkcml2ZXIgd2FzIGJ1aWx0
IHRlc3RlZCBmb3IgZWFjaCBzdGVwLg0KPiANCj4gVGhlIGRyaXZlciBpcyBpbiB0aGUgZW5k
IHJlbmFtZWQgdG8gdmlhX2RyaTEuDQo+IFNvbWUgZmVlZGJhY2sgb24gdGhpcyB3b3VsZCBi
ZSBnb29kIGFzIEkgZG8gbm90IGtub3cNCj4gd2hhdCBpbXBhY3QgaXQgd2lsbCBoYXZlIG9u
IHVzZXJzLg0KDQpJIGRvbid0IGtub3cgaG93IE1lc2EgZGVjaWRlcyBhYm91dCB3aGljaCB1
c2Vyc3BhY2UgZHJpdmVyIHRvIGxvYWQsIGJ1dCANCkl0IHNlZW1zIHJlbGF0ZWQgdG8gdGhl
IG5hbWUgb2YgdGhlIGtlcm5lbCBkcml2ZXIuIFJlbmFtaW5nIHRoZSBtb2R1bGUgDQptaWdo
dCBpbnRlcmZlcmUgc29tZWhvdy4gIEJ1dCBpZiB0aGUgb2xkIGFuZCBuZXcgZHJpdmVyIGFy
ZSBtdXR1YWxseSANCmV4Y2x1c2l2ZSBhdCBidWlsZCB0aW1lLCBpdCBzaG91bGQgbm90IGJl
IGEgcHJvYmxlbSB0byB1c2UgdGhlIHNhbWUgbmFtZSANCmZvciBib3RoIG1vZHVsZXMuDQoN
Cj4gDQo+IFRoZSB2ZXJ5IGxhc3QgcGF0Y2ggc3luY2hyb25pemUgdGhlIHZpYV8zZF9yZWcg
aGVhZGVyDQo+IGZpbGUgd2l0aCB0aGUgb25lIHVzZWQgaW4gdGhlIG9wZW5jaHJvbWUgZHJp
dmVyLg0KPiBUaGlzIHdhcyBhZGRlZCB0byB2ZXJpZnkgdGhhdCB0aGUgbmV3IGhlYWRlciB3
b3VsZCBub3QNCj4gYnJlYWsgdGhlIERSSTEgZHJpdmVyLg0KDQpTb21lIG9mIHRoZSBtYWNy
b3MgaW50cm9kdWNlIGxpbmUgd3JhcHMuIEkgZG9uJ3Qga25vdyBpZiB5b3UgZGlkIHRoYXQg
DQppbnRlbnRpb25hbGx5LCBidXQgaXQgc2hvdWxkbid0IGJlIG5lY2Vzc2FyeS4gV2UgaGF2
ZSBhIDEwMC1jaGFyYWN0ZXIgDQpsaW1pdCBwZXIgbGluZS4NCg0KTWF5YmUgeW91IGNhbiBh
bHNvIGFkZCBhbiBleHRyYSBwYXRjaCB0aGF0IGFkZHMgU1BEWCBsaWNlbnNlIHRhZ3MgYXQg
dGhlIA0KdG9wIG9mIHRoZSBmaWxlcy4NCg0KQmVzdCByZWdhcmQNClRob21hcw0KDQo+IA0K
PiAJU2FtDQo+IA0KPiBTYW0gUmF2bmJvcmcgKDExKToNCj4gICAgICAgIGRybS92aWE6IFJl
bmFtZSB2aWFfZHJ2IHRvIHZpYV9kcmkxDQo+ICAgICAgICBkcm0vdmlhOiBFbWJlZCB2aWFf
ZG1hIGluIHZpYV9kcmkxDQo+ICAgICAgICBkcm0vdmlhOiBFbWJlZCB2aWFfbWFwIGluIHZp
YV9kcmkxDQo+ICAgICAgICBkcm0vdmlhOiBFbWJlZCB2aWFfbW0gaW4gdmlhX2RyaTENCj4g
ICAgICAgIGRybS92aWE6IEVtYmVkIHZpYV92aWRlbyBpbiB2aWFfZHJpMQ0KPiAgICAgICAg
ZHJtL3ZpYTogRW1iZWQgdmlhX2lycSBpbiB2aWFfZHJpMQ0KPiAgICAgICAgZHJtL3ZpYTog
RW1iZWQgdmlhX2RtYWJsaXQgaW4gdmlhX2RyaTENCj4gICAgICAgIGRybS92aWE6IEVtYmVk
IHZpYV92ZXJpZmllciBpbiB2aWFfZHJpMQ0KPiAgICAgICAgZHJtL3ZpYTogRW1iZWQgdmlh
X2Rydi5oIGluIHZpYV9kcmkxDQo+ICAgICAgICBkcm0vdmlhOiBSZW5hbWUgdGhlIHZpYSBk
cml2ZXIgdG8gdmlhX2RyaTENCj4gICAgICAgIGRybS92aWE6IFVwZGF0ZSB0byB0aGUgbGF0
ZXN0IHZpYV8zZF9yZWcgZmlsZQ0KPiANCj4gICBkcml2ZXJzL2dwdS9kcm0vdmlhL01ha2Vm
aWxlICAgICAgIHwgICAgNCArLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS92aWEvdmlhXzNkX3Jl
Zy5oICAgfCAgMzk1ICsrKy0NCj4gICBkcml2ZXJzL2dwdS9kcm0vdmlhL3ZpYV9kbWEuYyAg
ICAgIHwgIDc0NCAtLS0tLS0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS92aWEvdmlhX2RtYWJs
aXQuYyAgfCAgODA3IC0tLS0tLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL3ZpYS92aWFfZG1h
YmxpdC5oICB8ICAxNDAgLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vdmlhL3ZpYV9kcmkxLmMg
ICAgIHwgMzYzMCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4gICBk
cml2ZXJzL2dwdS9kcm0vdmlhL3ZpYV9kcnYuYyAgICAgIHwgIDEyNCAtLQ0KPiAgIGRyaXZl
cnMvZ3B1L2RybS92aWEvdmlhX2Rydi5oICAgICAgfCAgMjI5IC0tLQ0KPiAgIGRyaXZlcnMv
Z3B1L2RybS92aWEvdmlhX2lycS5jICAgICAgfCAgMzg4IC0tLS0NCj4gICBkcml2ZXJzL2dw
dS9kcm0vdmlhL3ZpYV9tYXAuYyAgICAgIHwgIDEzMiAtLQ0KPiAgIGRyaXZlcnMvZ3B1L2Ry
bS92aWEvdmlhX21tLmMgICAgICAgfCAgMjQxIC0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS92
aWEvdmlhX3ZlcmlmaWVyLmMgfCAxMTEwIC0tLS0tLS0tLS0tDQo+ICAgZHJpdmVycy9ncHUv
ZHJtL3ZpYS92aWFfdmVyaWZpZXIuaCB8ICAgNjIgLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS92
aWEvdmlhX3ZpZGVvLmMgICAgfCAgIDk0IC0NCj4gICAxNCBmaWxlcyBjaGFuZ2VkLCAzOTM1
IGluc2VydGlvbnMoKyksIDQxNjUgZGVsZXRpb25zKC0pDQo+IA0KPiANCg0KLS0gDQpUaG9t
YXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2Fy
ZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJl
cmcsIEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNmw7xo
cmVyOiBJdm8gVG90ZXYNCg==

--------------kiZXt3z5bqiRRowMBbhizPs1--

--------------ghMPMo5tMpxHkpx0ZbjC2eew
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmLLyt4FAwAAAAAACgkQlh/E3EQov+A1
+g//UyQiuM4y0rIPY5u7PbOy/geIhp+VjwKP9D0DRqRGFvjmtmbXdks7LciVl5Z8X9yMMjKsz/xa
Zukcx8PlDzfmuum1QTIhPuBAbhrMufTKB4aoPDGJxxECfrsUgh99qw6H16zOtXTX3eYyDJIv6gBm
WnIDdBlLrvYSk/Ric+eLIRW588r5yYOJtOd+6kEEufp89OZcWifv27mFi3n/NAm6xgkYcQHQEq7f
iqBE+eG/yEQkrzEIfTGliKfHFuUe+QQa75QcuO11hMIodhUU3zxJ345SFWjyyhQRRARALMNx76V8
Voi7OiEXrPlEcLPirkaohe91t5J6tF9U5EfjehsDdjYBhlz4rMdyf4kClamml0FJFiPNpRkpCA+n
8U5WgA7XsA1Uy0XlmvFEjGGlJ0R73mnuL3dOHlGznepgLqBrmhXI57Y/B2P9VBFZ6YUZ5tM+y4Nz
xwIbvGBzWlzX4pldxKCPrd9thltQf5AhemkJRPU+HoO9IOEd5F8sZ7fWY+ptd+Oz8/xPikyy6AIu
kEq/ppPifRljt+GFVb1wOLNv/hRdwND0JzbBYdP3sCnYABwcFgKb37ZNt87ot9qD43TvrZsWavoz
UHnF49GDjIWztuQpWk/iTfj2NvP88HL7OHSUwtS82+49MkeNLl6atI8v92fBaEhFkhSW5zcZAx/L
+i8=
=YtSF
-----END PGP SIGNATURE-----

--------------ghMPMo5tMpxHkpx0ZbjC2eew--
