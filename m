Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A7CD34F781C
	for <lists+dri-devel@lfdr.de>; Thu,  7 Apr 2022 09:49:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACF9510E5C4;
	Thu,  7 Apr 2022 07:49:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DF7910E58A;
 Thu,  7 Apr 2022 07:49:52 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A8E3B1F859;
 Thu,  7 Apr 2022 07:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1649317790; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dU8qfm3E4gJpTxGlF0aK4r+yOYxZCKE2tkU6nbuBDNQ=;
 b=LzEdfKzl6tzSI7MrSeOV4/SAyhPcsMMZzR9EI4Yilwv4VdnRVaPPi3JP8+PSCs6lT1Noow
 ZRAYZqJCMSPKd34+2L/Iy6vOIiV9zRbyT9C88M0Rnk3yEJutJvq6sbyUzpU2lecYsAiJdo
 ypELZdkTw/pjq2wUNFfAV6qhBNCfQac=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1649317790;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dU8qfm3E4gJpTxGlF0aK4r+yOYxZCKE2tkU6nbuBDNQ=;
 b=e6vmV0YKa6HPkbhDAULkLw/4eyIuJE8hyZf+VGb+UR2ha+iiH6tgP8e80VtiiNl/HPsDMK
 dIUT/2aS/120l9Cw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 629EC13485;
 Thu,  7 Apr 2022 07:49:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id bw1KFp6XTmJgewAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 07 Apr 2022 07:49:50 +0000
Message-ID: <d5657091-0b57-9492-1e81-df34053306f5@suse.de>
Date: Thu, 7 Apr 2022 09:49:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH] drm/atomic-helpers: remove legacy_cursor_update hacks
Content-Language: en-US
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 KuoHsiang Chou <kuohsiang_chou@aspeedtech.com>
References: <20220331152021.2671937-1-daniel.vetter@ffwll.ch>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220331152021.2671937-1-daniel.vetter@ffwll.ch>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------ivwy0XzAvSdZtyfsbA664cLR"
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
Cc: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 Maxime Ripard <maxime@cerno.tech>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Daniel Vetter <daniel.vetter@intel.com>, mikita.lipski@amd.com,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>, "Kazlauskas,
 Nicholas" <nicholas.kazlauskas@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------ivwy0XzAvSdZtyfsbA664cLR
Content-Type: multipart/mixed; boundary="------------nl3IwifATAFFGQzTB7OR0yVU";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 KuoHsiang Chou <kuohsiang_chou@aspeedtech.com>
Cc: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 "Kazlauskas, Nicholas" <nicholas.kazlauskas@amd.com>,
 Maxime Ripard <maxime@cerno.tech>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Daniel Vetter <daniel.vetter@intel.com>, mikita.lipski@amd.com,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Message-ID: <d5657091-0b57-9492-1e81-df34053306f5@suse.de>
Subject: Re: [PATCH] drm/atomic-helpers: remove legacy_cursor_update hacks
References: <20220331152021.2671937-1-daniel.vetter@ffwll.ch>
In-Reply-To: <20220331152021.2671937-1-daniel.vetter@ffwll.ch>

--------------nl3IwifATAFFGQzTB7OR0yVU
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgRGFuaWVsDQoNCkFtIDMxLjAzLjIyIHVtIDE3OjIwIHNjaHJpZWIgRGFuaWVsIFZldHRl
cjoNCj4gVGhlIHN0dWZmIG5ldmVyIHJlYWxseSB3b3JrZWQsIGFuZCBsZWFkcyB0byBsb3Rz
IG9mIGZ1biBiZWNhdXNlIGl0DQo+IG91dC1vZi1vcmRlciBmcmVlcyBhdG9taWMgc3RhdGVz
LiBXaGljaCB1cHNldHMgS0FTQU4sIGFtb25nIG90aGVyDQo+IHRoaW5ncy4NCj4gDQo+IEZv
ciBhc3luYyB1cGRhdGVzIHdlIG5vdyBoYXZlIGEgbW9yZSBzb2xpZCBzb2x1dGlvbiB3aXRo
IHRoZQ0KPiAtPmF0b21pY19hc3luY19jaGVjayBhbmQgLT5hdG9taWNfYXN5bmNfY29tbWl0
IGhvb2tzLiBTdXBwb3J0IGZvciB0aGF0DQo+IGZvciBtc20gYW5kIHZjNCBsYW5kZWQuIG5v
dXZlYXUgYW5kIGk5MTUgaGF2ZSB0aGVpciBvd24gY29tbWl0DQo+IHJvdXRpbmVzLCBkb2lu
ZyBzb21ldGhpbmcgc2ltaWxhci4NCj4gDQo+IEZvciBldmVyeW9uZSBlbHNlIGl0J3MgcHJv
YmFibHkgYmV0dGVyIHRvIHJlbW92ZSB0aGUgdXNlLWFmdGVyLWZyZWUNCj4gYnVnLCBhbmQg
ZW5jb3VyYWdlIGZvbGtzIHRvIHVzZSB0aGUgYXN5bmMgc3VwcG9ydCBpbnN0ZWFkLiBUaGUN
Cj4gYWZmZWN0ZWQgZHJpdmVycyB3aGljaCByZWdpc3RlciBhIGxlZ2FjeSBjdXJzb3IgcGxh
bmUgYW5kIGRvbid0IGVpdGhlcg0KPiB1c2UgdGhlIG5ldyBhc3luYyBzdHVmZiBvciB0aGVp
ciBvd24gY29tbWl0IHJvdXRpbmUgYXJlOiBhbWRncHUsDQo+IGF0bWVsLCBtZWRpYXRlaywg
cXhsLCByb2NrY2hpcCwgc3RpLCBzdW40aSwgdGVncmEsIHZpcnRpbywgYW5kIHZtd2dmeC4N
Cg0KQSB3aGlsZSBhZ28sIEkgcmVjZWl2ZWQgYSBwYXRjaCBmb3IgYSBidWcgaW4gYXN0LiBD
dXJzb3IgbW92ZW1lbnQgDQppbnRlcmZlcmVkIHdpdGggbW9kZXNldHRpbmcuIFsxXSBJIGRp
ZG4ndCByZWFsbHkga25ldyB3aGF0IHRvIG1ha2Ugb2YgDQppdC4gQ291bGQgdGhpcyBiZSBy
ZWxhdGVkIHRvIHRoZSBwcm9ibGVtIHlvdSdyZSBkZXNjcmliaW5nIGhlcmU/DQoNCkkgZ3Vl
c3MgdGhlIGNvcnJlY3QgZml4IHdvdWxkIGJlIHRvIGltcGxlbWVudCBhc3luYyBvcGVyYXRp
b25zIGZvciANCmN1cnNvciBwbGFuZXM/IGFzdCBkb2Vzbid0IGRvIHRoaXMgeWV0Lg0KDQpC
ZXN0IHJlZ2FyZHMNClRob21hcw0KDQpbMV0gDQpodHRwczovL2xvcmUua2VybmVsLm9yZy9k
cmktZGV2ZWwvMjAyMTA5MTcwNzIyMjYuMTczNTctMS1rdW9oc2lhbmdfY2hvdUBhc3BlZWR0
ZWNoLmNvbS8NCg0KPiANCj4gSW5zcGlyZWQgYnkgYW4gYW1kZ3B1IGJ1ZyByZXBvcnQuDQo+
IA0KPiB2MjogRHJvcCBSRkMsIEkgdGhpbmsgd2l0aCBhbWRncHUgY29udmVydGVkIG92ZXIg
dG8gdXNlDQo+IGF0b21pY19hc3luY19jaGVjay9jb21taXQgZG9uZSBpbg0KPiANCj4gY29t
bWl0IDY3NGU3OGFjYWUwZGZiNGJlYjU2MTMyZTQxY2JhZTViNjBmN2Q2NjINCj4gQXV0aG9y
OiBOaWNob2xhcyBLYXpsYXVza2FzIDxuaWNob2xhcy5rYXpsYXVza2FzQGFtZC5jb20+DQo+
IERhdGU6ICAgV2VkIERlYyA1IDE0OjU5OjA3IDIwMTggLTA1MDANCj4gDQo+ICAgICAgZHJt
L2FtZC9kaXNwbGF5OiBBZGQgZmFzdCBwYXRoIGZvciBjdXJzb3IgcGxhbmUgdXBkYXRlcw0K
PiANCj4gd2UgZG9uJ3QgaGF2ZSBhbnkgZHJpdmVyIGFueW1vcmUgd2hlcmUgd2UgaGF2ZSB1
c2Vyc3BhY2UgZXhwZWN0aW5nDQo+IHNvbGlkIGxlZ2FjeSBjdXJzb3Igc3VwcG9ydCBfYW5k
XyB0aGV5IGFyZSB1c2luZyB0aGUgYXRvbWljIGhlbHBlcnMgaW4NCj4gdGhlaXIgZnVsbHkg
Z2xvcnkuIFNvIHdlIGNhbiByZXRpcmUgdGhpcy4NCj4gDQo+IHYzOiBQYXBlciBvdmVyIG1z
bSBhbmQgaTkxNSByZWdyZXNzaW9uLiBUaGUgY29tcGxldGVfYWxsIGlzIHRoZSBvbmx5DQo+
IHRoaW5nIG1pc3NpbmcgYWZhaWN0Lg0KPiANCj4gdjQ6IEZpeHVwIGk5MTUgZml4dXAgLi4u
DQo+IA0KPiBSZWZlcmVuY2VzOiBodHRwczovL2J1Z3ppbGxhLmtlcm5lbC5vcmcvc2hvd19i
dWcuY2dpP2lkPTE5OTQyNQ0KPiBSZWZlcmVuY2VzOiBodHRwczovL2xvcmUua2VybmVsLm9y
Zy9hbGwvMjAyMjAyMjExMzQxNTUuMTI1NDQ3LTktbWF4aW1lQGNlcm5vLnRlY2gvDQo+IFJl
ZmVyZW5jZXM6IGh0dHBzOi8vYnVnemlsbGEua2VybmVsLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9
MTk5NDI1DQo+IENjOiBNYXhpbWUgUmlwYXJkIDxtYXhpbWVAY2Vybm8udGVjaD4NCj4gVGVz
dGVkLWJ5OiBNYXhpbWUgUmlwYXJkIDxtYXhpbWVAY2Vybm8udGVjaD4NCj4gQ2M6IG1pa2l0
YS5saXBza2lAYW1kLmNvbQ0KPiBDYzogTWljaGVsIETDpG56ZXIgPG1pY2hlbEBkYWVuemVy
Lm5ldD4NCj4gQ2M6IGhhcnJ5LndlbnRsYW5kQGFtZC5jb20NCj4gQ2M6IFJvYiBDbGFyayA8
cm9iZGNsYXJrQGdtYWlsLmNvbT4NCj4gQ2M6ICJLYXpsYXVza2FzLCBOaWNob2xhcyIgPG5p
Y2hvbGFzLmthemxhdXNrYXNAYW1kLmNvbT4NCj4gQ2M6IERtaXRyeSBPc2lwZW5rbyA8ZG1p
dHJ5Lm9zaXBlbmtvQGNvbGxhYm9yYS5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IERhbmllbCBW
ZXR0ZXIgPGRhbmllbC52ZXR0ZXJAaW50ZWwuY29tPg0KPiAtLS0NCj4gICBkcml2ZXJzL2dw
dS9kcm0vZHJtX2F0b21pY19oZWxwZXIuYyAgICAgICAgICB8IDEzIC0tLS0tLS0tLS0tLS0N
Cj4gICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXkuYyB8IDE0
ICsrKysrKysrKysrKysrDQo+ICAgZHJpdmVycy9ncHUvZHJtL21zbS9tc21fYXRvbWljLmMg
ICAgICAgICAgICAgfCAgMiArKw0KPiAgIDMgZmlsZXMgY2hhbmdlZCwgMTYgaW5zZXJ0aW9u
cygrKSwgMTMgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2RybV9hdG9taWNfaGVscGVyLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2F0b21pY19o
ZWxwZXIuYw0KPiBpbmRleCA5NjAzMTkzZDJmYTEuLmEyODk5YWY4MmI0YSAxMDA2NDQNCj4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9hdG9taWNfaGVscGVyLmMNCj4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL2RybV9hdG9taWNfaGVscGVyLmMNCj4gQEAgLTE0OTgsMTMgKzE0OTgs
NiBAQCBkcm1fYXRvbWljX2hlbHBlcl93YWl0X2Zvcl92YmxhbmtzKHN0cnVjdCBkcm1fZGV2
aWNlICpkZXYsDQo+ICAgCWludCBpLCByZXQ7DQo+ICAgCXVuc2lnbmVkIGludCBjcnRjX21h
c2sgPSAwOw0KPiAgIA0KPiAtCSAvKg0KPiAtCSAgKiBMZWdhY3kgY3Vyc29yIGlvY3RscyBh
cmUgY29tcGxldGVseSB1bnN5bmNlZCwgYW5kIHVzZXJzcGFjZQ0KPiAtCSAgKiByZWxpZXMg
b24gdGhhdCAoYnkgZG9pbmcgdG9ucyBvZiBjdXJzb3IgdXBkYXRlcykuDQo+IC0JICAqLw0K
PiAtCWlmIChvbGRfc3RhdGUtPmxlZ2FjeV9jdXJzb3JfdXBkYXRlKQ0KPiAtCQlyZXR1cm47
DQo+IC0NCj4gICAJZm9yX2VhY2hfb2xkbmV3X2NydGNfaW5fc3RhdGUob2xkX3N0YXRlLCBj
cnRjLCBvbGRfY3J0Y19zdGF0ZSwgbmV3X2NydGNfc3RhdGUsIGkpIHsNCj4gICAJCWlmICgh
bmV3X2NydGNfc3RhdGUtPmFjdGl2ZSkNCj4gICAJCQljb250aW51ZTsNCj4gQEAgLTIxMzUs
MTIgKzIxMjgsNiBAQCBpbnQgZHJtX2F0b21pY19oZWxwZXJfc2V0dXBfY29tbWl0KHN0cnVj
dCBkcm1fYXRvbWljX3N0YXRlICpzdGF0ZSwNCj4gICAJCQljb250aW51ZTsNCj4gICAJCX0N
Cj4gICANCj4gLQkJLyogTGVnYWN5IGN1cnNvciB1cGRhdGVzIGFyZSBmdWxseSB1bnN5bmNl
ZC4gKi8NCj4gLQkJaWYgKHN0YXRlLT5sZWdhY3lfY3Vyc29yX3VwZGF0ZSkgew0KPiAtCQkJ
Y29tcGxldGVfYWxsKCZjb21taXQtPmZsaXBfZG9uZSk7DQo+IC0JCQljb250aW51ZTsNCj4g
LQkJfQ0KPiAtDQo+ICAgCQlpZiAoIW5ld19jcnRjX3N0YXRlLT5ldmVudCkgew0KPiAgIAkJ
CWNvbW1pdC0+ZXZlbnQgPSBremFsbG9jKHNpemVvZigqY29tbWl0LT5ldmVudCksDQo+ICAg
CQkJCQkJR0ZQX0tFUk5FTCk7DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkx
NS9kaXNwbGF5L2ludGVsX2Rpc3BsYXkuYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3Bs
YXkvaW50ZWxfZGlzcGxheS5jDQo+IGluZGV4IGQyYWJlMGU0MzBiZi4uNmNhNWE2ZTc3MDNi
IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rp
c3BsYXkuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rp
c3BsYXkuYw0KPiBAQCAtODc5OSw2ICs4Nzk5LDIwIEBAIHN0YXRpYyBpbnQgaW50ZWxfYXRv
bWljX2NvbW1pdChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LA0KPiAgIAkJaW50ZWxfcnVudGlt
ZV9wbV9wdXQoJmRldl9wcml2LT5ydW50aW1lX3BtLCBzdGF0ZS0+d2FrZXJlZik7DQo+ICAg
CQlyZXR1cm4gcmV0Ow0KPiAgIAl9DQo+ICsNCj4gKwkvKg0KPiArCSAqIEZJWE1FOiBDdXQg
b3ZlciB0byAoYXN5bmMpIGNvbW1pdCBoZWxwZXJzIGluc3RlYWQgb2YgaGFuZC1yb2xsaW5n
DQo+ICsJICogZXZlcnl0aGluZy4NCj4gKwkgKi8NCj4gKwlpZiAoc3RhdGUtPmJhc2UubGVn
YWN5X2N1cnNvcl91cGRhdGUpIHsNCj4gKwkJc3RydWN0IGludGVsX2NydGNfc3RhdGUgKm5l
d19jcnRjX3N0YXRlOw0KPiArCQlzdHJ1Y3QgaW50ZWxfY3J0YyAqY3J0YzsNCj4gKwkJaW50
IGk7DQo+ICsNCj4gKwkJZm9yX2VhY2hfbmV3X2ludGVsX2NydGNfaW5fc3RhdGUoc3RhdGUs
IGNydGMsIG5ld19jcnRjX3N0YXRlLCBpKQ0KPiArCQkJY29tcGxldGVfYWxsKCZuZXdfY3J0
Y19zdGF0ZS0+dWFwaS5jb21taXQtPmZsaXBfZG9uZSk7DQo+ICsJfQ0KPiArDQo+ICAgCWlu
dGVsX3NoYXJlZF9kcGxsX3N3YXBfc3RhdGUoc3RhdGUpOw0KPiAgIAlpbnRlbF9hdG9taWNf
dHJhY2tfZmJzKHN0YXRlKTsNCj4gICANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9tc20vbXNtX2F0b21pYy5jIGIvZHJpdmVycy9ncHUvZHJtL21zbS9tc21fYXRvbWljLmMN
Cj4gaW5kZXggMTY4NmZiYjYxMWZkLi5iM2NmYWJlYmU1ZDYgMTAwNjQ0DQo+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9tc20vbXNtX2F0b21pYy5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9tc20vbXNtX2F0b21pYy5jDQo+IEBAIC0yMjIsNiArMjIyLDggQEAgdm9pZCBtc21fYXRv
bWljX2NvbW1pdF90YWlsKHN0cnVjdCBkcm1fYXRvbWljX3N0YXRlICpzdGF0ZSkNCj4gICAJ
CS8qIGFzeW5jIHVwZGF0ZXMgYXJlIGxpbWl0ZWQgdG8gc2luZ2xlLWNydGMgdXBkYXRlczog
Ki8NCj4gICAJCVdBUk5fT04oY3J0Y19tYXNrICE9IGRybV9jcnRjX21hc2soYXN5bmNfY3J0
YykpOw0KPiAgIA0KPiArCQljb21wbGV0ZV9hbGwoJmFzeW5jX2NydGMtPnN0YXRlLT5jb21t
aXQtPmZsaXBfZG9uZSk7DQo+ICsNCj4gICAJCS8qDQo+ICAgCQkgKiBTdGFydCB0aW1lciBp
ZiB3ZSBkb24ndCBhbHJlYWR5IGhhdmUgYW4gdXBkYXRlIHBlbmRpbmcNCj4gICAJCSAqIG9u
IHRoaXMgY3J0YzoNCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVy
IERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhm
ZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7D
vHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCg==

--------------nl3IwifATAFFGQzTB7OR0yVU--

--------------ivwy0XzAvSdZtyfsbA664cLR
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmJOl50FAwAAAAAACgkQlh/E3EQov+Ch
tBAAmuU3NWvFnVlIJcLbQtf0b4UI2wMhL6+YYVEL0cA6aRxsoH94U4a8hlsGuUxO+9zXOqFZi6by
f6NRmOqFD5CevF6mkr4uVcMeAKrUwkc09CgrVYwPgtOH3EJK6kCpEwBl9rCD2fdbvl+bgQEi9m4a
Hil7MmQCWNLkhRo+A/+b1txVeRsREl3xlWAI7J1WSz1+2tKa+Yqa9bNgfvWlGXM8kd88uuh3hwvn
BxPWJSrzHiPuMEXRDow35o5GPJgQ0WZmGcSA4xFl80uVy9pA1LhJXuuUi0xKSa/jvfOHFPtnD1tc
j/ZOwPhL3Ik2+U7r+gkGaf3oeP15mfsn6KK1t1Uv67TD8WC77YS4+kGKXyBma2PH/GF3LN26eK5B
Rrqx67/1nGPEHo7rHbd5ojSzevkedaQ8SahnV1BjUKA4bMJfHJQEVmjcv7suLg2DhHtWyRdwiHhX
/GlNJevdCrY7WG06dDcLOfPU5br0xlbHSoZilA1mMcyDbWrOSfPHR5AknsanN02kAcFWQrmnzaAY
Htx3/jN3x1sGFcRWBBy8VdFTVr4JL1EfppXzfln3Nz3rMW4H8SbWNucjBZxcxYCUbulb3XbBSeDE
8PgtF6OdHE17/Z7Jh6F6CNcP44UYWvvBZy7unCrfG2VV/vPT1c5+b9mkYq9CDSqZvBrOZmRMliH1
+wg=
=CeOV
-----END PGP SIGNATURE-----

--------------ivwy0XzAvSdZtyfsbA664cLR--
