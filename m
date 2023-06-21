Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E2B78737CA9
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 10:05:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5B5710E3EE;
	Wed, 21 Jun 2023 08:05:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD41410E3EE
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jun 2023 08:05:13 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B078C1F8BE;
 Wed, 21 Jun 2023 08:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1687334710; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/UOGF/fBdoJSP4GOxQ5y1vF6kj0XToldCJHuDmB8qB8=;
 b=WZxW+xd4Ac40YKLCLHMpFujDpjd2OCDRM1D7ZSnoQ9dxU5CZGl17M7gz7OeVLgGfvGVYcW
 i5CiTSQ8VtpzJW0cJIpAvRPS6IBTzPRnmQOMv58bkdUVRWyUpLiOJ1bKhdYLQ3Ie+NIzdd
 1wYnNSZxldgeChM//SZuugb16HtEGNs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1687334710;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/UOGF/fBdoJSP4GOxQ5y1vF6kj0XToldCJHuDmB8qB8=;
 b=PUhxvFdVBV0kWK/bNTb5adD2A+xl7yEQMJM6jrWmx0cVmXOTBacK1Efp523v+NnTuEhAKO
 YYKvbOpSc/7eUbAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 815F5133E6;
 Wed, 21 Jun 2023 08:05:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id LFCGHjavkmTKSQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 21 Jun 2023 08:05:10 +0000
Message-ID: <710e85a5-83fe-289c-0d19-ed055870d9a3@suse.de>
Date: Wed, 21 Jun 2023 10:05:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 1/3] drm/rcar-du: Import buffers with GEM DMA's helpers
Content-Language: en-US
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20230620121202.28263-1-tzimmermann@suse.de>
 <20230620121202.28263-2-tzimmermann@suse.de>
 <20230620164750.GE26467@pendragon.ideasonboard.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230620164750.GE26467@pendragon.ideasonboard.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------YDHwQhDyvzcbvyoOnaX35Z7F"
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
Cc: hjc@rock-chips.com, dri-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 kieran.bingham+renesas@ideasonboard.com, mripard@kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------YDHwQhDyvzcbvyoOnaX35Z7F
Content-Type: multipart/mixed; boundary="------------pWvH0lI0OoXjUoTqqfqqaLI6";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: hjc@rock-chips.com, mripard@kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 kieran.bingham+renesas@ideasonboard.com, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Message-ID: <710e85a5-83fe-289c-0d19-ed055870d9a3@suse.de>
Subject: Re: [PATCH 1/3] drm/rcar-du: Import buffers with GEM DMA's helpers
References: <20230620121202.28263-1-tzimmermann@suse.de>
 <20230620121202.28263-2-tzimmermann@suse.de>
 <20230620164750.GE26467@pendragon.ideasonboard.com>
In-Reply-To: <20230620164750.GE26467@pendragon.ideasonboard.com>

--------------pWvH0lI0OoXjUoTqqfqqaLI6
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjAuMDYuMjMgdW0gMTg6NDcgc2NocmllYiBMYXVyZW50IFBpbmNoYXJ0Og0K
PiBIaSBUaG9tYXMsDQo+IA0KPiBUaGFuayB5b3UgZm9yIHRoZSBwYXRjaC4NCj4gDQo+IA0K
PiBPbiBUdWUsIEp1biAyMCwgMjAyMyBhdCAwMjowMzoyMVBNICswMjAwLCBUaG9tYXMgWmlt
bWVybWFubiB3cm90ZToNCj4+IENhbGwgX19kcm1fZ2VtX2RtYV9jcmVhdGUoKSB0byBjcmVh
dGUgYW4gb2JqZWN0IGZvciBpbXBvcnRlZCBidWZmZXJzLA0KPj4gaW5zdGVhZCBvZiByZWlt
cGxlbWVudGluZyB0aGUgZnVuY3Rpb24gd2l0aGluIHRoZSBkcml2ZXIuIFJlZHVjZXMNCj4+
IGNvZGUgZHVwbGljYXRpb24gYW5kIHdpbGwgbGF0ZXIgYWxsb3cgdG8gdW4tZXhwb3J0IGEg
bnVtYmVyIG9mIHN5bWJvbHMNCj4+IGZyb20gdGhlIEdFTSBETUEgaGVscGVycy4NCj4+DQo+
PiBTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5k
ZT4NCj4gDQo+IE5pY2Ugc2ltcGxpZmljYXRpb24uDQo+IA0KPiBSZXZpZXdlZC1ieTogTGF1
cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPg0KPiAN
Cj4gSSBhc3N1bWUgeW91J2xsIG1lcmdlIHRoZSB3aG9sZSBzZXJpZXMgdGhyb3VnaCBkcm0t
bWlzYywgcGxlYXNlIGxldCBtZQ0KPiBrbm93IGlmIHRoYXQncyBub3QgY29ycmVjdC4NCg0K
VGhhbmtzIGZvciB0aGUgcmV2aWV3cy4gVGhlIHBhdGNoc2V0IGNhbiBob3BlZnVsbHkgZ28g
dGhyb3VnaCBkcm0tbWlzYy1uZXh0Lg0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQo+IA0K
Pj4gLS0tDQo+PiAgIGRyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtX2RtYV9oZWxwZXIuYyAgICAg
ICAgICB8ICA1ICstLQ0KPj4gICBkcml2ZXJzL2dwdS9kcm0vcmVuZXNhcy9yY2FyLWR1L3Jj
YXJfZHVfa21zLmMgfCAzMyArKystLS0tLS0tLS0tLS0tLS0tDQo+PiAgIGluY2x1ZGUvZHJt
L2RybV9nZW1fZG1hX2hlbHBlci5oICAgICAgICAgICAgICB8ICAzICsrDQo+PiAgIDMgZmls
ZXMgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgMzEgZGVsZXRpb25zKC0pDQo+Pg0KPj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtX2RtYV9oZWxwZXIuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9kcm1fZ2VtX2RtYV9oZWxwZXIuYw0KPj4gaW5kZXggODcwYjkwYjc4
YmM0ZS4uZTlhYTNhYzE0MDY1NCAxMDA2NDQNCj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9k
cm1fZ2VtX2RtYV9oZWxwZXIuYw0KPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9nZW1f
ZG1hX2hlbHBlci5jDQo+PiBAQCAtNjcsOCArNjcsOCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0
IGRybV9nZW1fb2JqZWN0X2Z1bmNzIGRybV9nZW1fZG1hX2RlZmF1bHRfZnVuY3MgPSB7DQo+
PiAgICAqIEEgc3RydWN0IGRybV9nZW1fZG1hX29iamVjdCAqIG9uIHN1Y2Nlc3Mgb3IgYW4g
RVJSX1BUUigpLWVuY29kZWQgbmVnYXRpdmUNCj4+ICAgICogZXJyb3IgY29kZSBvbiBmYWls
dXJlLg0KPj4gICAgKi8NCj4+IC1zdGF0aWMgc3RydWN0IGRybV9nZW1fZG1hX29iamVjdCAq
DQo+PiAtX19kcm1fZ2VtX2RtYV9jcmVhdGUoc3RydWN0IGRybV9kZXZpY2UgKmRybSwgc2l6
ZV90IHNpemUsIGJvb2wgcHJpdmF0ZSkNCj4+ICtzdHJ1Y3QgZHJtX2dlbV9kbWFfb2JqZWN0
ICpfX2RybV9nZW1fZG1hX2NyZWF0ZShzdHJ1Y3QgZHJtX2RldmljZSAqZHJtLA0KPj4gKwkJ
CQkJCXNpemVfdCBzaXplLCBib29sIHByaXZhdGUpDQo+PiAgIHsNCj4+ICAgCXN0cnVjdCBk
cm1fZ2VtX2RtYV9vYmplY3QgKmRtYV9vYmo7DQo+PiAgIAlzdHJ1Y3QgZHJtX2dlbV9vYmpl
Y3QgKmdlbV9vYmo7DQo+PiBAQCAtMTEyLDYgKzExMiw3IEBAIF9fZHJtX2dlbV9kbWFfY3Jl
YXRlKHN0cnVjdCBkcm1fZGV2aWNlICpkcm0sIHNpemVfdCBzaXplLCBib29sIHByaXZhdGUp
DQo+PiAgIAlrZnJlZShkbWFfb2JqKTsNCj4+ICAgCXJldHVybiBFUlJfUFRSKHJldCk7DQo+
PiAgIH0NCj4+ICtFWFBPUlRfU1lNQk9MX0dQTChfX2RybV9nZW1fZG1hX2NyZWF0ZSk7DQo+
PiAgIA0KPj4gICAvKioNCj4+ICAgICogZHJtX2dlbV9kbWFfY3JlYXRlIC0gYWxsb2NhdGUg
YW4gb2JqZWN0IHdpdGggdGhlIGdpdmVuIHNpemUNCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vcmVuZXNhcy9yY2FyLWR1L3JjYXJfZHVfa21zLmMgYi9kcml2ZXJzL2dwdS9k
cm0vcmVuZXNhcy9yY2FyLWR1L3JjYXJfZHVfa21zLmMNCj4+IGluZGV4IGFkZmIzNmIwZTgx
NTQuLmVhNzQ4N2UyNzBmMTMgMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vcmVu
ZXNhcy9yY2FyLWR1L3JjYXJfZHVfa21zLmMNCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9y
ZW5lc2FzL3JjYXItZHUvcmNhcl9kdV9rbXMuYw0KPj4gQEAgLTM1Niw0OSArMzU2LDI0IEBA
IGNvbnN0IHN0cnVjdCByY2FyX2R1X2Zvcm1hdF9pbmZvICpyY2FyX2R1X2Zvcm1hdF9pbmZv
KHUzMiBmb3VyY2MpDQo+PiAgICAqIEZyYW1lIGJ1ZmZlcg0KPj4gICAgKi8NCj4+ICAgDQo+
PiAtc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1fZ2VtX29iamVjdF9mdW5jcyByY2FyX2R1X2dl
bV9mdW5jcyA9IHsNCj4+IC0JLmZyZWUgPSBkcm1fZ2VtX2RtYV9vYmplY3RfZnJlZSwNCj4+
IC0JLnByaW50X2luZm8gPSBkcm1fZ2VtX2RtYV9vYmplY3RfcHJpbnRfaW5mbywNCj4+IC0J
LmdldF9zZ190YWJsZSA9IGRybV9nZW1fZG1hX29iamVjdF9nZXRfc2dfdGFibGUsDQo+PiAt
CS52bWFwID0gZHJtX2dlbV9kbWFfb2JqZWN0X3ZtYXAsDQo+PiAtCS5tbWFwID0gZHJtX2dl
bV9kbWFfb2JqZWN0X21tYXAsDQo+PiAtCS52bV9vcHMgPSAmZHJtX2dlbV9kbWFfdm1fb3Bz
LA0KPj4gLX07DQo+PiAtDQo+PiAgIHN0cnVjdCBkcm1fZ2VtX29iamVjdCAqcmNhcl9kdV9n
ZW1fcHJpbWVfaW1wb3J0X3NnX3RhYmxlKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsDQo+PiAg
IAkJCQlzdHJ1Y3QgZG1hX2J1Zl9hdHRhY2htZW50ICphdHRhY2gsDQo+PiAgIAkJCQlzdHJ1
Y3Qgc2dfdGFibGUgKnNndCkNCj4+ICAgew0KPj4gICAJc3RydWN0IHJjYXJfZHVfZGV2aWNl
ICpyY2R1ID0gdG9fcmNhcl9kdV9kZXZpY2UoZGV2KTsNCj4+ICAgCXN0cnVjdCBkcm1fZ2Vt
X2RtYV9vYmplY3QgKmRtYV9vYmo7DQo+PiAtCXN0cnVjdCBkcm1fZ2VtX29iamVjdCAqZ2Vt
X29iajsNCj4+IC0JaW50IHJldDsNCj4+ICAgDQo+PiAgIAlpZiAoIXJjYXJfZHVfaGFzKHJj
ZHUsIFJDQVJfRFVfRkVBVFVSRV9WU1AxX1NPVVJDRSkpDQo+PiAgIAkJcmV0dXJuIGRybV9n
ZW1fZG1hX3ByaW1lX2ltcG9ydF9zZ190YWJsZShkZXYsIGF0dGFjaCwgc2d0KTsNCj4+ICAg
DQo+PiAtCS8qIENyZWF0ZSBhIERNQSBHRU0gYnVmZmVyLiAqLw0KPj4gLQlkbWFfb2JqID0g
a3phbGxvYyhzaXplb2YoKmRtYV9vYmopLCBHRlBfS0VSTkVMKTsNCj4+IC0JaWYgKCFkbWFf
b2JqKQ0KPj4gLQkJcmV0dXJuIEVSUl9QVFIoLUVOT01FTSk7DQo+PiAtDQo+PiAtCWdlbV9v
YmogPSAmZG1hX29iai0+YmFzZTsNCj4+IC0JZ2VtX29iai0+ZnVuY3MgPSAmcmNhcl9kdV9n
ZW1fZnVuY3M7DQo+PiAtDQo+PiAtCWRybV9nZW1fcHJpdmF0ZV9vYmplY3RfaW5pdChkZXYs
IGdlbV9vYmosIGF0dGFjaC0+ZG1hYnVmLT5zaXplKTsNCj4+IC0JZG1hX29iai0+bWFwX25v
bmNvaGVyZW50ID0gZmFsc2U7DQo+PiAtDQo+PiAtCXJldCA9IGRybV9nZW1fY3JlYXRlX21t
YXBfb2Zmc2V0KGdlbV9vYmopOw0KPj4gLQlpZiAocmV0KSB7DQo+PiAtCQlkcm1fZ2VtX29i
amVjdF9yZWxlYXNlKGdlbV9vYmopOw0KPj4gLQkJa2ZyZWUoZG1hX29iaik7DQo+PiAtCQly
ZXR1cm4gRVJSX1BUUihyZXQpOw0KPj4gLQl9DQo+PiArCWRtYV9vYmogPSBfX2RybV9nZW1f
ZG1hX2NyZWF0ZShkZXYsIGF0dGFjaC0+ZG1hYnVmLT5zaXplLCB0cnVlKTsNCj4+ICsJaWYg
KElTX0VSUihkbWFfb2JqKSkNCj4+ICsJCXJldHVybiBFUlJfQ0FTVChkbWFfb2JqKTsNCj4+
ICAgDQo+PiAgIAlkbWFfb2JqLT5kbWFfYWRkciA9IDA7DQo+PiAgIAlkbWFfb2JqLT5zZ3Qg
PSBzZ3Q7DQo+PiAgIA0KPj4gLQlyZXR1cm4gZ2VtX29iajsNCj4+ICsJcmV0dXJuICZkbWFf
b2JqLT5iYXNlOw0KPj4gICB9DQo+PiAgIA0KPj4gICBpbnQgcmNhcl9kdV9kdW1iX2NyZWF0
ZShzdHJ1Y3QgZHJtX2ZpbGUgKmZpbGUsIHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsDQo+PiBk
aWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vZHJtX2dlbV9kbWFfaGVscGVyLmggYi9pbmNsdWRl
L2RybS9kcm1fZ2VtX2RtYV9oZWxwZXIuaA0KPj4gaW5kZXggNjFkYTU5Njc4MGI2NC4uMzg3
N2NiZjBlOTI3YyAxMDA2NDQNCj4+IC0tLSBhL2luY2x1ZGUvZHJtL2RybV9nZW1fZG1hX2hl
bHBlci5oDQo+PiArKysgYi9pbmNsdWRlL2RybS9kcm1fZ2VtX2RtYV9oZWxwZXIuaA0KPj4g
QEAgLTMyLDYgKzMyLDkgQEAgc3RydWN0IGRybV9nZW1fZG1hX29iamVjdCB7DQo+PiAgICNk
ZWZpbmUgdG9fZHJtX2dlbV9kbWFfb2JqKGdlbV9vYmopIFwNCj4+ICAgCWNvbnRhaW5lcl9v
ZihnZW1fb2JqLCBzdHJ1Y3QgZHJtX2dlbV9kbWFfb2JqZWN0LCBiYXNlKQ0KPj4gICANCj4+
ICtzdHJ1Y3QgZHJtX2dlbV9kbWFfb2JqZWN0ICpfX2RybV9nZW1fZG1hX2NyZWF0ZShzdHJ1
Y3QgZHJtX2RldmljZSAqZHJtLA0KPj4gKwkJCQkJCXNpemVfdCBzaXplLCBib29sIHByaXZh
dGUpOw0KPj4gKw0KPj4gICBzdHJ1Y3QgZHJtX2dlbV9kbWFfb2JqZWN0ICpkcm1fZ2VtX2Rt
YV9jcmVhdGUoc3RydWN0IGRybV9kZXZpY2UgKmRybSwNCj4+ICAgCQkJCQkgICAgICBzaXpl
X3Qgc2l6ZSk7DQo+PiAgIHZvaWQgZHJtX2dlbV9kbWFfZnJlZShzdHJ1Y3QgZHJtX2dlbV9k
bWFfb2JqZWN0ICpkbWFfb2JqKTsNCj4gDQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdy
YXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1h
bnkgR21iSA0KRnJhbmtlbnN0cmFzc2UgMTQ2LCA5MDQ2MSBOdWVybmJlcmcsIEdlcm1hbnkN
CkdGOiBJdm8gVG90ZXYsIEFuZHJldyBNeWVycywgQW5kcmV3IE1jRG9uYWxkLCBCb3VkaWVu
IE1vZXJtYW4NCkhSQiAzNjgwOSAoQUcgTnVlcm5iZXJnKQ0K

--------------pWvH0lI0OoXjUoTqqfqqaLI6--

--------------YDHwQhDyvzcbvyoOnaX35Z7F
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmSSrzUFAwAAAAAACgkQlh/E3EQov+Bo
8xAAksNuldsDZwr7XYgc4KcH7Izt1a2FfWSFFmvmg2BpLyl7ypTOElqZH+nNDrEJjXfVGkDmF0fP
4x3WyRMqb42KSsWj0WTWOpQDkNfMHXQj8DXgJ9RuDtyg3sxwtZXywY5W+jnSw9qVVCxrBza2L/Xs
kXNJ7q6WqMhuL2Yd750oJSke5MN+dFgT14D5lYLozOFj7FIXB7/h4Jjn2jyBdoXhE3i6mG7EWzsF
Znr0lz0q/K+6ZRiBQD3O8xC6A9jUHJaw726xp8fBOXf0FXUqeyWuQoOyQx3V17eFYaYilibGOq9f
GHCMqOzZa46kpBOrdIdjTWf1s31iE+Ctgcbb9N3E6iGcYAPTQYOmyQo5+m9fNcjGvh/BDwsQ3jwG
ZbvETi/YK8GD2+YKnJHEomMgl3ai/mUcCfTKt97HA0Eom7sV5DdMzvUd1omsA5VBR3J1SW1h2F9d
yUY+a4x1TgPQS/zmayAK3/rYMVmMP/uyFIz3/3hegwxwN9F20BIoofkimiU/8gC9l8afya6tiNE+
WzeutEMuzRofDUeTIz7Cz1aU/HRTkq5GRpPhsLDc45nttUq6g8EB1TvjQ6dgHtoZzAcAW7lJ90SH
fUhI+7Nb+hjzQDMnX3wmd0vpGvyxos1XUiZJyt5bcihCSxO009sP90pHALmynik3x3fDyRh/athW
xhs=
=HSpV
-----END PGP SIGNATURE-----

--------------YDHwQhDyvzcbvyoOnaX35Z7F--
