Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB9FC652E52
	for <lists+dri-devel@lfdr.de>; Wed, 21 Dec 2022 10:16:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01BEA10E056;
	Wed, 21 Dec 2022 09:16:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A2BC10E056
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Dec 2022 09:16:14 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 926236B385;
 Wed, 21 Dec 2022 09:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1671614172; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tQPhJsXlJ8nIGf3Gj7KLpRC4+rkxxzApUWv/ShWFato=;
 b=uyZB8yvcuEHofpCrgYI+Dr2DdJd3j8aNrzbj4zqGrD4PwDCktqwiUV7xeQtRK/WQk/+9eb
 439MprVZty8PK1S3ZhLUnl/+iDBVuP4Ri9QC/Ubu8H5OnoPU0SIjHtlXH414kCjdfxpRUx
 wEecllHgdaBokPkyK87jqmkMdvRSB4g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1671614172;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tQPhJsXlJ8nIGf3Gj7KLpRC4+rkxxzApUWv/ShWFato=;
 b=A2PYH3PJP+BGA4Fiu3NJwKQTVtPtEbMRHUjDcz9k5+DG0mYPzTZhhpR+B0yyP+YqyJiMHy
 g0QF3j6kcos7aUCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6C59A1390E;
 Wed, 21 Dec 2022 09:16:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Ab+fGdzOomN8BAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 21 Dec 2022 09:16:12 +0000
Message-ID: <339505f3-9005-df0b-3c73-b54320568db2@suse.de>
Date: Wed, 21 Dec 2022 10:16:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 00/10] drm: Remove usage of deprecated DRM_* macros
To: Siddh Raman Pant <code@siddh.me>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <cover.1671566741.git.code@siddh.me>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <cover.1671566741.git.code@siddh.me>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------I3ChNFs7EuQa0iv0Ge6dvhoo"
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
Cc: linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------I3ChNFs7EuQa0iv0Ge6dvhoo
Content-Type: multipart/mixed; boundary="------------1NQvk9UEaQ4wwMzeiyX0I103";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Siddh Raman Pant <code@siddh.me>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
Message-ID: <339505f3-9005-df0b-3c73-b54320568db2@suse.de>
Subject: Re: [PATCH 00/10] drm: Remove usage of deprecated DRM_* macros
References: <cover.1671566741.git.code@siddh.me>
In-Reply-To: <cover.1671566741.git.code@siddh.me>

--------------1NQvk9UEaQ4wwMzeiyX0I103
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjAuMTIuMjIgdW0gMjE6MTYgc2NocmllYiBTaWRkaCBSYW1hbiBQYW50Og0K
PiBUaGlzIHBhdGNoc2V0IGFpbXMgdG8gcmVtb3ZlIHVzYWdlcyBvZiBkZXByZWNhdGVkIERS
TV8qIG1hY3JvcyBmcm9tIHRoZQ0KPiBmaWxlcyByZXNpZGluZyBpbiBkcml2ZXJzL2dwdS9k
cm0gcm9vdC4NCj4gDQo+IEluIHByb2Nlc3MsIEkgZm91bmQgb3V0IHRoYXQgTlVMTCBhcyBm
aXJzdCBhcmd1bWVudCBvZiBkcm1fZGJnXyogd2Fzbid0DQo+IHdvcmtpbmcsIGJ1dCBpdCB3
YXMgbGlzdGVkIGFzIHRoZSBhbHRlcm5hdGl2ZSBpbiBkZXByZWNhdGlvbiBjb21tZW50LA0K
PiBzbyBJIGZpeGVkIHRoYXQgYmVmb3JlIHJlbW92aW5nIHVzYWdlcyBvZiBEUk1fREVCVUdf
KiBtYWNyb3MuDQo+IA0KPiBUaGlzIHBhdGNoc2V0IHNob3VsZCBiZSBhcHBsaWVkIGluIG9y
ZGVyIGFzIGNoYW5nZXMgbWlnaHQgYmUgZGVwZW5kZW50Lg0KPiANCj4gUGxlYXNlIHJldmll
dyBhbmQgbGV0IG1lIGtub3cgaWYgYW55IGVycm9ycyBhcmUgdGhlcmUsIGFuZCBob3BlZnVs
bHkNCj4gdGhpcyBnZXRzIGFjY2VwdGVkLg0KDQpUaGFua3MgZm9yIHRoZSBwYXRjaHNldC4g
T3ZlcmFsbCB0aGlzIGxvb2tzIGZpbmUuDQoNCkJ1dCB0aGUgdXNlIG9mIHByXygpIGZ1bmN0
aW9ucyBpcyBub3Qgb3B0aW1hbCBpbiBteSBvcGluaW9uLiBJIGtub3cgdGhhdCANCkkgcmVj
b21tZW5kZWQgdXNpbmcgaXQsIGJ1dCBhdCBhIGNsb3NlciBsb29rLCBJIHRoaW5rIHdlIG1p
Z2h0IHdhbnQgdG8gDQpyZWNvbnNpZGVyIHRoYXQuIEkgd291bGRuJ3QgbGlrZSBsb3Npbmcg
dGhlICdbZHJtXScgdGFnLCBidXQgYWRkaW5nIHRoZW0gDQp0byBlYWNoIHByXygpIGNhbGwg
aXNuJ3QgYSBnb29kIGlkZWEgZWl0aGVyLg0KDQpJIHRoaW5rIGl0IHdvdWxkIGJlIG5pY2Vy
IHRvIHJlcGxhY2UgRFJNX0lORk8gd2l0aCBkcm1faW5mbyhOVUxMLCApLiANCkRlcGVuZGlu
ZyBvbiB0aGUgZGV2aWNlIGJlaW5nIE5VTEwsIHRoZSBoZWxwZXJzIHdvdWxkIHNlbGVjdCBk
ZXYtYmFzZWQgDQptZXNzYWdlcyBvciBwcmludGstYmFzZWQgbWVzc2FnZXMuIEl0IHdvdWxk
IHRoZW4gd29yayBsaWtlIGRybV9kYmdfKCkuIA0KQnV0IGl0IG5lZWRzIHNvbWUgYWRkaXRp
b25hbCBjaGFuZ2VzLg0KDQpDYW4geW91IGZpcnN0IG1vdmUgYWxsIHByXygpIHJlbGF0ZWQg
Y2hhbmdlcyBpbnRvIGEgbmV3IHBhdGNoc2V0PyBUaGUgDQp0cml2aWFsIGNvbnZlcnNpb24g
d2VyZSB0aGUgZGV2aWNlIGlzIGtub3duIGFuZCBub3QgTlVMTCBjYW4gcmVtYWluIGluIA0K
dGhpcyBwYXRjaHNldCBhbmQgYmUgbWVyZ2VkIHNvb24uIFdlIGNhbiBhZnRlcndhcmRzIGhh
dmUgYSBzZXBhcmF0ZSANCmRpc2N1c3Npb24gZm9yIHRoZSBjaGFuZ2VzIHRoYXQgY3VycmVu
dGx5IGludm9sdmUgcHJfKCkuDQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCj4gDQo+IFNp
ZGRoIFJhbWFuIFBhbnQgKDEwKToNCj4gICAgZHJtOiBSZW1vdmUgdXNhZ2Ugb2YgZGVwcmVj
YXRlZCBEUk1fSU5GTw0KPiAgICBkcm06IFJlbW92ZSB1c2FnZSBvZiBkZXByZWNhdGVkIERS
TV9OT1RFDQo+ICAgIGRybTogUmVtb3ZlIHVzYWdlIG9mIGRlcHJlY2F0ZWQgRFJNX0VSUk9S
DQo+ICAgIGRybS9wcmludDogRml4IHN1cHBvcnQgZm9yIE5VTEwgYXMgZmlyc3QgYXJndW1l
bnQgb2YgZHJtX2RiZ18qDQo+ICAgIGRybTogUmVtb3ZlIHVzYWdlIG9mIGRlcHJlY2F0ZWQg
RFJNX0RFQlVHDQo+ICAgIGRybTogUmVtb3ZlIHVzYWdlIG9mIGRlcHJlY2F0ZWQgRFJNX0RF
QlVHX0RSSVZFUg0KPiAgICBkcm06IFJlbW92ZSB1c2FnZSBvZiBkZXByZWNhdGVkIERSTV9E
RUJVR19LTVMNCj4gICAgZHJtOiBSZW1vdmUgdXNhZ2Ugb2YgZGVwcmVjYXRlZCBEUk1fREVC
VUdfUFJJTUUNCj4gICAgZHJtL2RybV9ibGVuZDogUmVtb3ZlIHVzYWdlIG9mIGRlcHJlY2F0
ZWQgRFJNX0RFQlVHX0FUT01JQw0KPiAgICBkcm0vZHJtX2xlYXNlOiBSZW1vdmUgdXNhZ2Ug
b2YgZGVwcmVjYXRlZCBEUk1fREVCVUdfTEVBU0UNCj4gDQo+ICAgZHJpdmVycy9ncHUvZHJt
L2RybV9hZ3BzdXBwb3J0LmMgICAgICAgIHwgICA0ICstDQo+ICAgZHJpdmVycy9ncHUvZHJt
L2RybV9ibGVuZC5jICAgICAgICAgICAgIHwgIDEzICsrLQ0KPiAgIGRyaXZlcnMvZ3B1L2Ry
bS9kcm1fYnJpZGdlLmMgICAgICAgICAgICB8ICAgOCArLQ0KPiAgIGRyaXZlcnMvZ3B1L2Ry
bS9kcm1fYnVmcy5jICAgICAgICAgICAgICB8IDEyMiArKysrKysrKysrKystLS0tLS0tLS0t
LS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vZHJtX2NsaWVudF9tb2Rlc2V0LmMgICAgfCAxMTgg
KysrKysrKysrKysrKy0tLS0tLS0tLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vZHJtX2NvbG9y
X21nbXQuYyAgICAgICAgfCAgIDQgKy0NCj4gICBkcml2ZXJzL2dwdS9kcm0vZHJtX2Nvbm5l
Y3Rvci5jICAgICAgICAgfCAgMjggKysrLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL2RybV9j
b250ZXh0LmMgICAgICAgICAgIHwgIDE4ICsrLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vZHJt
X2NydGMuYyAgICAgICAgICAgICAgfCAgMzYgKysrKy0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2Ry
bS9kcm1fY3J0Y19oZWxwZXIuYyAgICAgICB8ICA2MiArKysrKystLS0tLS0NCj4gICBkcml2
ZXJzL2dwdS9kcm0vZHJtX2RlYnVnZnNfY3JjLmMgICAgICAgfCAgIDggKy0NCj4gICBkcml2
ZXJzL2dwdS9kcm0vZHJtX2Rpc3BsYXlpZC5jICAgICAgICAgfCAgIDYgKy0NCj4gICBkcml2
ZXJzL2dwdS9kcm0vZHJtX2RtYS5jICAgICAgICAgICAgICAgfCAgMTAgKy0NCj4gICBkcml2
ZXJzL2dwdS9kcm0vZHJtX2Rydi5jICAgICAgICAgICAgICAgfCAgMjggKysrLS0tDQo+ICAg
ZHJpdmVycy9ncHUvZHJtL2RybV9lZGlkLmMgICAgICAgICAgICAgIHwgIDE3ICsrLS0NCj4g
ICBkcml2ZXJzL2dwdS9kcm0vZHJtX2ZpbGUuYyAgICAgICAgICAgICAgfCAgMTggKystLQ0K
PiAgIGRyaXZlcnMvZ3B1L2RybS9kcm1fZmxpcF93b3JrLmMgICAgICAgICB8ICAgMiArLQ0K
PiAgIGRyaXZlcnMvZ3B1L2RybS9kcm1fZnJhbWVidWZmZXIuYyAgICAgICB8ICAgMyArLQ0K
PiAgIGRyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtLmMgICAgICAgICAgICAgICB8ICAgNyArLQ0K
PiAgIGRyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtX2RtYV9oZWxwZXIuYyAgICB8ICAgNiArLQ0K
PiAgIGRyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtX3NobWVtX2hlbHBlci5jICB8ICAgNiArLQ0K
PiAgIGRyaXZlcnMvZ3B1L2RybS9kcm1faGFzaHRhYi5jICAgICAgICAgICB8ICAxMCArLQ0K
PiAgIGRyaXZlcnMvZ3B1L2RybS9kcm1faW9jMzIuYyAgICAgICAgICAgICB8ICAxMyArLS0N
Cj4gICBkcml2ZXJzL2dwdS9kcm0vZHJtX2lvY3RsLmMgICAgICAgICAgICAgfCAgMjQgKyst
LS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vZHJtX2lycS5jICAgICAgICAgICAgICAgfCAgIDQg
Ky0NCj4gICBkcml2ZXJzL2dwdS9kcm0vZHJtX2ttc19oZWxwZXJfY29tbW9uLmMgfCAgIDIg
Ky0NCj4gICBkcml2ZXJzL2dwdS9kcm0vZHJtX2xlYXNlLmMgICAgICAgICAgICAgfCAgNjgg
KysrKysrLS0tLS0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9kcm1fbGVnYWN5X21pc2MuYyAg
ICAgICB8ICAgNCArLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9kcm1fbG9jay5jICAgICAgICAg
ICAgICB8ICAzNiArKystLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL2RybV9taXBpX2RiaS5j
ICAgICAgICAgIHwgIDE5ICsrLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vZHJtX21tLmMgICAg
ICAgICAgICAgICAgfCAgIDggKy0NCj4gICBkcml2ZXJzL2dwdS9kcm0vZHJtX21vZGVfY29u
ZmlnLmMgICAgICAgfCAgIDIgKy0NCj4gICBkcml2ZXJzL2dwdS9kcm0vZHJtX21vZGVfb2Jq
ZWN0LmMgICAgICAgfCAgIDYgKy0NCj4gICBkcml2ZXJzL2dwdS9kcm0vZHJtX21vZGVzLmMg
ICAgICAgICAgICAgfCAgMTAgKy0NCj4gICBkcml2ZXJzL2dwdS9kcm0vZHJtX21vZGVzZXRf
aGVscGVyLmMgICAgfCAgIDIgKy0NCj4gICBkcml2ZXJzL2dwdS9kcm0vZHJtX3BjaS5jICAg
ICAgICAgICAgICAgfCAgMTQgKy0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL2RybV9wbGFuZS5j
ICAgICAgICAgICAgIHwgIDQ2ICsrKystLS0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9kcm1f
cHJvYmVfaGVscGVyLmMgICAgICB8ICAzOSArKysrLS0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2Ry
bS9kcm1fcmVjdC5jICAgICAgICAgICAgICB8ICAgNCArLQ0KPiAgIGRyaXZlcnMvZ3B1L2Ry
bS9kcm1fc2NhdHRlci5jICAgICAgICAgICB8ICAxOSArKy0tDQo+ICAgZHJpdmVycy9ncHUv
ZHJtL2RybV9zeW5jb2JqLmMgICAgICAgICAgIHwgICAyICstDQo+ICAgZHJpdmVycy9ncHUv
ZHJtL2RybV9zeXNmcy5jICAgICAgICAgICAgIHwgIDIyICsrLS0tDQo+ICAgZHJpdmVycy9n
cHUvZHJtL2RybV92bS5jICAgICAgICAgICAgICAgIHwgIDQ1ICsrKysrLS0tLQ0KPiAgIGlu
Y2x1ZGUvZHJtL2RybV9wcmludC5oICAgICAgICAgICAgICAgICB8ICA5MSArKysrKysrKysr
KysrKy0tLS0NCj4gICA0NCBmaWxlcyBjaGFuZ2VkLCA1NDkgaW5zZXJ0aW9ucygrKSwgNDY1
IGRlbGV0aW9ucygtKQ0KPiANCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3Mg
RHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJI
DQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDks
IEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCg==

--------------1NQvk9UEaQ4wwMzeiyX0I103--

--------------I3ChNFs7EuQa0iv0Ge6dvhoo
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmOiztwFAwAAAAAACgkQlh/E3EQov+DT
fQ/+LzEuOigzviveiSdWilVyukK6yaNuIUQxTmrp/1zGdLHCWtqJaMiTUIeskhvJtt3p/d+uyE5W
eVlVCxiu9n4JwL7eF8fLtv9DPLocfDRkignVSt4w9IaqiEiL8HtHOz2+xcOZqcXfK84kizvvQB+0
Pvd+V552IZin4EDnj6rcjRI0QPOwcoBg9Z8APeMYLhv74gHLGB6lkXa1Tle86bnGrCmz19riSveJ
TGaXRu0raBzh5uQtvpxrlNxShbdeSYRg26u9pIiqXIEX2fQrngV97ZzZqx6NOpyBwl2VvTc0Yqxj
JhNhzGTyE/snT4R9IaGCtXbff36xj9p9J5V5VRCr8R+J8+DALiqQEvACc4/B4iolge7/jkSar5Oe
D6MJmoiWGXS+nhUOQ6nJCROrt36lN0NWWCcSRqTEsGGlNKsWBkGdDrhUEBdY3ULsA4+HPjV2Rk8V
Ljw/kwQH5JViKrCPfzkeHHsP44E5tJqvlMLY9wuxhtaIcJyFNrqsLj0/glrAvNZ/aIpiwLtBTzRE
Hs75zu3vfJnNzM54mrVJUCjtl7nzreuGMZsF3r4TySaPH8zK83Il5P8lQVrtGLb77EVgmoJxaOKK
Qrv1FD8mzZdUNUniq3cPaAw9x8oV1ko5DTFVpQKqMG3xNo63JfKKWUaijGbZk/IZZuaKK1W+hvPQ
zEM=
=2vmz
-----END PGP SIGNATURE-----

--------------I3ChNFs7EuQa0iv0Ge6dvhoo--
