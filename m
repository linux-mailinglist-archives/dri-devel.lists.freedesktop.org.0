Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0966F486260
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jan 2022 10:50:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1E2710E891;
	Thu,  6 Jan 2022 09:50:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EDD110E88C;
 Thu,  6 Jan 2022 09:50:29 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id ECB9321117;
 Thu,  6 Jan 2022 09:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1641462627; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XeRGaJ4BzBGirefhs04qAle9dYc4DeHvng0QSkt1zLQ=;
 b=zzHsfAUeUIrQjd+iWTpbkiAdAbZVw1XE+Muhl8m+P3OPvNVMFZEhj7TtThakmQHGW8b60y
 FQq/OH6b4JF4T06QDQcn0yUhjyEygyWlThGQIRZXRk+HHk/QqS355uAUqkjqUby1E+K0hU
 mopB7EkRcRmAs1KPecxo87yVUxHJH5I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1641462627;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XeRGaJ4BzBGirefhs04qAle9dYc4DeHvng0QSkt1zLQ=;
 b=RFOnbQ8imbge8VLWkUbtMMhWaF9FvX6HbyK7YOn20Rv8NEaaSx04RRb754e3Os/NNrqv5h
 e63uO/jAcSTiCKAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D4D3D13A07;
 Thu,  6 Jan 2022 09:50:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id cQjpMmO71mEscQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 06 Jan 2022 09:50:27 +0000
Message-ID: <4c02eca8-e680-213a-7d2e-0bc19243db53@suse.de>
Date: Thu, 6 Jan 2022 10:50:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH 1/2] fbdev: fbmem: add a helper to determine if an
 aperture is used by a fw fb
Content-Language: en-US
To: Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20211227182506.2110551-1-alexander.deucher@amd.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20211227182506.2110551-1-alexander.deucher@amd.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------iUe1NvH0MF9XdRLqORUT6Ylp"
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
--------------iUe1NvH0MF9XdRLqORUT6Ylp
Content-Type: multipart/mixed; boundary="------------GBJckDTN70HY37BwEasGb6Wx";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Message-ID: <4c02eca8-e680-213a-7d2e-0bc19243db53@suse.de>
Subject: Re: [PATCH 1/2] fbdev: fbmem: add a helper to determine if an
 aperture is used by a fw fb
References: <20211227182506.2110551-1-alexander.deucher@amd.com>
In-Reply-To: <20211227182506.2110551-1-alexander.deucher@amd.com>

--------------GBJckDTN70HY37BwEasGb6Wx
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjcuMTIuMjEgdW0gMTk6MjUgc2NocmllYiBBbGV4IERldWNoZXI6DQo+IEFk
ZCBhIGZ1bmN0aW9uIGZvciBkcml2ZXJzIHRvIGNoZWNrIGlmIHRoZSBhIGZpcm13YXJlIGlu
aXRpYWxpemVkDQo+IGZiIGlzIGNvcnJlc3BvbmRzIHRvIHRoZWlyIGFwZXJ0dXJlLiAgVGhp
cyBhbGxvd3MgZHJpdmVycyB0byBjaGVjayBpZiB0aGUNCj4gZGV2aWNlIGNvcnJlc3BvbmRz
IHRvIHdoYXQgdGhlIGZpcm13YXJlIHNldCB1cCBhcyB0aGUgZGlzcGxheSBkZXZpY2UuDQoN
CklmIHNpbXBsZWRybSBpcyBpbiB1c2UsIGl0IHdpbGwgcmVnaXN0ZXIgdmlhIERSTSBhcGVy
dHVyZSBoZWxwZXJzLiBZb3UgDQpwcm9iYWJseSBuZWVkIGEgc2ltaWxhciBmdW5jdGlvbiBp
biBkcm1fYXBlcnR1cmUuYyB0byBoYW5kbGUgdGhpcy4NCg0KQmVzdCByZWdhcmRzDQpUaG9t
YXMNCg0KPiANCj4gQnVnOiBodHRwczovL2J1Z3ppbGxhLmtlcm5lbC5vcmcvc2hvd19idWcu
Y2dpP2lkPTIxNTIwMw0KPiBCdWc6IGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9k
cm0vYW1kLy0vaXNzdWVzLzE4NDANCj4gU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxh
bGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPg0KPiAtLS0NCj4gICBkcml2ZXJzL3ZpZGVvL2Zi
ZGV2L2NvcmUvZmJtZW0uYyB8IDQ3ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
DQo+ICAgaW5jbHVkZS9saW51eC9mYi5oICAgICAgICAgICAgICAgfCAgMSArDQo+ICAgMiBm
aWxlcyBjaGFuZ2VkLCA0OCBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy92aWRlby9mYmRldi9jb3JlL2ZibWVtLmMgYi9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2Nv
cmUvZmJtZW0uYw0KPiBpbmRleCA4MjYxNzVhZDg4YTIuLjBmYTdlZGU5NGZhNiAxMDA2NDQN
Cj4gLS0tIGEvZHJpdmVycy92aWRlby9mYmRldi9jb3JlL2ZibWVtLmMNCj4gKysrIGIvZHJp
dmVycy92aWRlby9mYmRldi9jb3JlL2ZibWVtLmMNCj4gQEAgLTE3NjIsNiArMTc2Miw1MyBA
QCBpbnQgcmVtb3ZlX2NvbmZsaWN0aW5nX2ZyYW1lYnVmZmVycyhzdHJ1Y3QgYXBlcnR1cmVz
X3N0cnVjdCAqYSwNCj4gICB9DQo+ICAgRVhQT1JUX1NZTUJPTChyZW1vdmVfY29uZmxpY3Rp
bmdfZnJhbWVidWZmZXJzKTsNCj4gICANCj4gKy8qKg0KPiArICogaXNfZmlybXdhcmVfZnJh
bWVidWZmZXIgLSBkZXRlY3QgaWYgZmlybXdhcmUtY29uZmlndXJlZCBmcmFtZWJ1ZmZlciBt
YXRjaGVzDQo+ICsgKiBAYTogbWVtb3J5IHJhbmdlLCB1c2VycyBvZiB3aGljaCBhcmUgdG8g
YmUgY2hlY2tlZA0KPiArICoNCj4gKyAqIFRoaXMgZnVuY3Rpb24gY2hlY2tzIGZyYW1lYnVm
ZmVyIGRldmljZXMgKGluaXRpYWxpemVkIGJ5IGZpcm13YXJlL2Jvb3Rsb2FkZXIpDQo+ICsg
KiB3aGljaCB1c2UgbWVtb3J5IHJhbmdlIGRlc2NyaWJlZCBieSBAYS4gSWYgQGEgbWF0Y2hl
c20gdGhlIGZ1bmN0aW9uIHJldHVybnMNCj4gKyAqIHRydWUsIG90aGVyd2lzZSBmYWxzZS4N
Cj4gKyAqLw0KPiArYm9vbCBpc19maXJtd2FyZV9mcmFtZWJ1ZmZlcihzdHJ1Y3QgYXBlcnR1
cmVzX3N0cnVjdCAqYSkNCj4gK3sNCj4gKwlib29sIGRvX2ZyZWUgPSBmYWxzZTsNCj4gKwli
b29sIGZvdW5kID0gZmFsc2U7DQo+ICsJaW50IGk7DQo+ICsNCj4gKwlpZiAoIWEpIHsNCj4g
KwkJYSA9IGFsbG9jX2FwZXJ0dXJlcygxKTsNCj4gKwkJaWYgKCFhKQ0KPiArCQkJcmV0dXJu
IGZhbHNlOw0KPiArDQo+ICsJCWEtPnJhbmdlc1swXS5iYXNlID0gMDsNCj4gKwkJYS0+cmFu
Z2VzWzBdLnNpemUgPSB+MDsNCj4gKwkJZG9fZnJlZSA9IHRydWU7DQo+ICsJfQ0KPiArDQo+
ICsJbXV0ZXhfbG9jaygmcmVnaXN0cmF0aW9uX2xvY2spOw0KPiArCS8qIGNoZWNrIGFsbCBm
aXJtd2FyZSBmYnMgYW5kIGtpY2sgb2ZmIGlmIHRoZSBiYXNlIGFkZHIgb3ZlcmxhcHMgKi8N
Cj4gKwlmb3JfZWFjaF9yZWdpc3RlcmVkX2ZiKGkpIHsNCj4gKwkJc3RydWN0IGFwZXJ0dXJl
c19zdHJ1Y3QgKmdlbl9hcGVyOw0KPiArDQo+ICsJCWlmICghKHJlZ2lzdGVyZWRfZmJbaV0t
PmZsYWdzICYgRkJJTkZPX01JU0NfRklSTVdBUkUpKQ0KPiArCQkJY29udGludWU7DQo+ICsN
Cj4gKwkJZ2VuX2FwZXIgPSByZWdpc3RlcmVkX2ZiW2ldLT5hcGVydHVyZXM7DQo+ICsJCWlm
IChmYl9kb19hcGVydHVyZXNfb3ZlcmxhcChnZW5fYXBlciwgYSkpIHsNCj4gKwkJCWZvdW5k
ID0gdHJ1ZTsNCj4gKwkJCWJyZWFrOw0KPiArCQl9DQo+ICsJfQ0KPiArCW11dGV4X3VubG9j
aygmcmVnaXN0cmF0aW9uX2xvY2spOw0KPiArDQo+ICsJaWYgKGRvX2ZyZWUpDQo+ICsJCWtm
cmVlKGEpOw0KPiArDQo+ICsJcmV0dXJuIGZvdW5kOw0KPiArfQ0KPiArRVhQT1JUX1NZTUJP
TChpc19maXJtd2FyZV9mcmFtZWJ1ZmZlcik7DQo+ICsNCj4gICAvKioNCj4gICAgKiByZW1v
dmVfY29uZmxpY3RpbmdfcGNpX2ZyYW1lYnVmZmVycyAtIHJlbW92ZSBmaXJtd2FyZS1jb25m
aWd1cmVkIGZyYW1lYnVmZmVycyBmb3IgUENJIGRldmljZXMNCj4gICAgKiBAcGRldjogUENJ
IGRldmljZQ0KPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9mYi5oIGIvaW5jbHVkZS9s
aW51eC9mYi5oDQo+IGluZGV4IDZmM2RiOTlhYjk5MC4uM2RhOTU4NDJiMjA3IDEwMDY0NA0K
PiAtLS0gYS9pbmNsdWRlL2xpbnV4L2ZiLmgNCj4gKysrIGIvaW5jbHVkZS9saW51eC9mYi5o
DQo+IEBAIC02MTAsNiArNjEwLDcgQEAgZXh0ZXJuIGludCByZW1vdmVfY29uZmxpY3Rpbmdf
cGNpX2ZyYW1lYnVmZmVycyhzdHJ1Y3QgcGNpX2RldiAqcGRldiwNCj4gICAJCQkJCSAgICAg
ICBjb25zdCBjaGFyICpuYW1lKTsNCj4gICBleHRlcm4gaW50IHJlbW92ZV9jb25mbGljdGlu
Z19mcmFtZWJ1ZmZlcnMoc3RydWN0IGFwZXJ0dXJlc19zdHJ1Y3QgKmEsDQo+ICAgCQkJCQkg
ICBjb25zdCBjaGFyICpuYW1lLCBib29sIHByaW1hcnkpOw0KPiArZXh0ZXJuIGJvb2wgaXNf
ZmlybXdhcmVfZnJhbWVidWZmZXIoc3RydWN0IGFwZXJ0dXJlc19zdHJ1Y3QgKmEpOw0KPiAg
IGV4dGVybiBpbnQgZmJfcHJlcGFyZV9sb2dvKHN0cnVjdCBmYl9pbmZvICpmYl9pbmZvLCBp
bnQgcm90YXRlKTsNCj4gICBleHRlcm4gaW50IGZiX3Nob3dfbG9nbyhzdHJ1Y3QgZmJfaW5m
byAqZmJfaW5mbywgaW50IHJvdGF0ZSk7DQo+ICAgZXh0ZXJuIGNoYXIqIGZiX2dldF9idWZm
ZXJfb2Zmc2V0KHN0cnVjdCBmYl9pbmZvICppbmZvLCBzdHJ1Y3QgZmJfcGl4bWFwICpidWYs
IHUzMiBzaXplKTsNCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVy
IERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhm
ZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7D
vHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCg==

--------------GBJckDTN70HY37BwEasGb6Wx--

--------------iUe1NvH0MF9XdRLqORUT6Ylp
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmHWu2MFAwAAAAAACgkQlh/E3EQov+B1
xhAAxCRY08R7gCBOPIZfugXxsGV1BO9JqHbsc/kZsUyFn+PIUa26HhtLhh+RtDD1fkrdkCR1ELC8
EnBFfxsH3wdO1lQ66T5XhUruoyWHHaXT7vfZTcgYajNgd7rrSU+MIOyO3Ni4ZeZzSSu2YPxOguL3
d0z6GaDU9dJLJhNIaowgdxTdql6MwaFLITrY2qP/DWfJfwftBEmV7yam4O5uxQSTjalTPH5LOzzW
mC30FFFZogK2hhynINiEp2ITC5ZzhCSiuu0HcE+AociEJi+hlu+PmLBPZwg2weM6ZJY0aa1SBBg0
gG4aeRDk/pihg7nndPLKe+XvQiDSzz6No6Lcfs+nAYBX9NhErZ/6+IHUx01k3cXknmaUcFlUYehe
clAOZlX0d/qGrl3cYe84bFW/BfTRJmLRDqkW8ddFmCeNPMYzloB9rT/xWN+RhY1Nuqfw49x0EF8E
NXpetxzfR6+cGLDFuP1CLvrY1NbLSFfzX0Dp1kqO8jmkIHP1ql1bZjfLmEIHxXoTfHnryA3tUbse
816S7As+Dk/DQlkT41ntjtiGltVWs3gMhvqbTN9RtoHQW+DqfZmscduyv7By+pMIFDfSzH4VQ0Fb
F3ZiuwbA30OV4UQI4/D9YUxOZ68WJvnBxeAtTL3OcceRYhBXopDYUE5bldzkcbYAm1yfXwOY9f67
x8k=
=RlYS
-----END PGP SIGNATURE-----

--------------iUe1NvH0MF9XdRLqORUT6Ylp--
