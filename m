Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9FED70B944
	for <lists+dri-devel@lfdr.de>; Mon, 22 May 2023 11:43:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DD8010E116;
	Mon, 22 May 2023 09:43:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 483CA10E116;
 Mon, 22 May 2023 09:43:26 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C9441219BA;
 Mon, 22 May 2023 09:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1684748604; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dRCAb8mZD4KRjkD6YRsq6oXIUZObzV1AWD24A+ABi00=;
 b=BHMQQMGuVovOIm35weDocziFBGPgfIAvLUpecnmGzyXPK3aY7w0ji+j2PNh+0k0Q41umzF
 4JbiqkCNvh81GvOEgMttRy5Q+qNP7jGWZHv6UvloVSYkxfCoL1L//uqMjcPJPfqrzUXnql
 a3HlmxGgI0UrDHQPVeqwyDIMzNII51E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1684748604;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dRCAb8mZD4KRjkD6YRsq6oXIUZObzV1AWD24A+ABi00=;
 b=/DeJkky2sSBwgPMq41vtKzJ1s6euy8v18jke3bGj5ijWXojCPVidTClFc4olgQcKf7Ek1O
 9k+Bsr6RgMrJlnAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 963A813336;
 Mon, 22 May 2023 09:43:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ZPmTIzw5a2RregAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 22 May 2023 09:43:24 +0000
Message-ID: <3a7ff212-eda8-1196-3009-0fce68dda7aa@suse.de>
Date: Mon, 22 May 2023 11:43:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2] drm: fix drmm_mutex_init()
To: Matthew Auld <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org
References: <20230519090733.489019-1-matthew.auld@intel.com>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230519090733.489019-1-matthew.auld@intel.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------JP02lJomYmzqGylzc4O8eAy1"
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
Cc: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 Jocelyn Falempe <jfalempe@redhat.com>, Sarah Walker <sarah.walker@imgtec.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 Boris Brezillon <boris.brezillon@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------JP02lJomYmzqGylzc4O8eAy1
Content-Type: multipart/mixed; boundary="------------pnciCsYe5mERvSE3JhUcyKXc";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Matthew Auld <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org
Cc: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 Sarah Walker <sarah.walker@imgtec.com>,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Jocelyn Falempe <jfalempe@redhat.com>, Daniel Vetter
 <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org
Message-ID: <3a7ff212-eda8-1196-3009-0fce68dda7aa@suse.de>
Subject: Re: [PATCH v2] drm: fix drmm_mutex_init()
References: <20230519090733.489019-1-matthew.auld@intel.com>
In-Reply-To: <20230519090733.489019-1-matthew.auld@intel.com>

--------------pnciCsYe5mERvSE3JhUcyKXc
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTkuMDUuMjMgdW0gMTE6MDcgc2NocmllYiBNYXR0aGV3IEF1bGQ6DQo+IElu
IG11dGV4X2luaXQoKSBsb2NrZGVwIGlkZW50aWZpZXMgYSBsb2NrIGJ5IGRlZmluaW5nIGEg
c3BlY2lhbCBzdGF0aWMNCj4ga2V5IGZvciBlYWNoIGxvY2sgY2xhc3MuIEhvd2V2ZXIgaWYg
d2Ugd3JhcCB0aGUgbWFjcm8gaW4gYSBmdW5jdGlvbiwNCj4gbGlrZSBpbiBkcm1tX211dGV4
X2luaXQoKSwgd2UgZW5kIHVwIGdlbmVyYXRpbmc6DQo+IA0KPiBpbnQgZHJtbV9tdXRleF9p
bml0KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHN0cnVjdCBtdXRleCAqbG9jaykNCj4gew0K
PiAgICAgICAgc3RhdGljIHN0cnVjdCBsb2NrX2NsYXNzX2tleSBfX2tleTsNCj4gDQo+ICAg
ICAgICBfX211dGV4X2luaXQoKGxvY2spLCAibG9jayIsICZfX2tleSk7DQo+ICAgICAgICAu
Li4uDQo+IH0NCj4gDQo+IFRoZSBzdGF0aWMgX19rZXkgaGVyZSBpcyB3aGF0IGxvY2tkZXAg
dXNlcyB0byBpZGVudGlmeSB0aGUgbG9jayBjbGFzcywNCj4gaG93ZXZlciBzaW5jZSB0aGlz
IGlzIGp1c3QgYSBub3JtYWwgZnVuY3Rpb24gdGhlIGtleSBoZXJlIHdpbGwgYmUNCj4gY3Jl
YXRlZCBvbmNlLCB3aGVyZSBhbGwgY2FsbGVycyB0aGVuIHVzZSB0aGUgc2FtZSBrZXkuIElu
IGVmZmVjdCB0aGUNCj4gbXV0ZXgtPmRlcG1hcC5rZXkgd2lsbCBiZSB0aGUgc2FtZSBwb2lu
dGVyIGZvciBkaWZmZXJlbnQNCj4gZHJtbV9tdXRleF9pbml0KCkgY2FsbGVycy4gVGhpcyB0
aGVuIHJlc3VsdHMgaW4gaW1wb3NzaWJsZSBsb2NrZGVwDQo+IHNwbGF0cyBzaW5jZSBsb2Nr
ZGVwIHRoaW5rcyBjb21wbGV0ZWx5IHVucmVsYXRlZCBsb2NrcyBhcmUgdGhlIHNhbWUgbG9j
aw0KPiBjbGFzcy4NCj4gDQo+IFRvIGZpeCB0aGlzIHR1cm4gZHJtbV9tdXRleF9pbml0KCkg
aW50byBhIG1hY3JvIHN1Y2ggdGhhdCBpdCBnZW5lcmF0ZXMgYQ0KPiBkaWZmZXJlbnQgInN0
YXRpYyBzdHJ1Y3QgbG9ja19jbGFzc19rZXkgX19rZXkiIGZvciBlYWNoIGludm9jYXRpb24s
DQo+IHdoaWNoIGxvb2tzIHRvIGJlIGlubGluZSB3aXRoIHdoYXQgbXV0ZXhfaW5pdCgpIHdh
bnRzLg0KPiANCj4gdjI6DQo+ICAgIC0gUmV2YW1wIHRoZSBjb21taXQgbWVzc2FnZSB3aXRo
IGNsZWFyZXIgZXhwbGFuYXRpb24gb2YgdGhlIGlzc3VlLg0KPiAgICAtIFJhdGhlciBleHBv
cnQgX19kcm1tX211dGV4X3JlbGVhc2UoKSB0aGFuIHN0YXRpYyBpbmxpbmUuDQo+IA0KPiBS
ZXBvcnRlZC1ieTogVGhvbWFzIEhlbGxzdHLDtm0gPHRob21hcy5oZWxsc3Ryb21AbGludXgu
aW50ZWwuY29tPg0KPiBSZXBvcnRlZC1ieTogU2FyYWggV2Fsa2VyIDxzYXJhaC53YWxrZXJA
aW1ndGVjLmNvbT4NCj4gRml4ZXM6IGUxM2YxM2UwMzlkYyAoImRybTogQWRkIERSTS1tYW5h
Z2VkIG11dGV4X2luaXQoKSIpDQo+IENjOiBTdGFuaXNsYXcgR3J1c3prYSA8c3RhbmlzbGF3
LmdydXN6a2FAbGludXguaW50ZWwuY29tPg0KPiBDYzogQm9yaXMgQnJlemlsbG9uIDxib3Jp
cy5icmV6aWxsb25AY29sbGFib3JhLmNvbT4NCj4gQ2M6IFRob21hcyBaaW1tZXJtYW5uIDx0
emltbWVybWFubkBzdXNlLmRlPg0KPiBDYzogSm9jZWx5biBGYWxlbXBlIDxqZmFsZW1wZUBy
ZWRoYXQuY29tPg0KPiBDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5j
aD4NCj4gQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gU2lnbmVkLW9m
Zi1ieTogTWF0dGhldyBBdWxkIDxtYXR0aGV3LmF1bGRAaW50ZWwuY29tPg0KDQpBY2tlZC1i
eTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+DQoNClNoYWxsIEkg
YWRkIHRoZSBwYXRjaCB0byBkcm0tbWlzYy1maXhlcz8NCg0KQmVzdCByZWdhcmRzDQpUaG9t
YXMNCg0KPiAtLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vZHJtX21hbmFnZWQuYyB8IDIyICsr
LS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gICBpbmNsdWRlL2RybS9kcm1fbWFuYWdlZC5oICAg
ICB8IDE4ICsrKysrKysrKysrKysrKysrLQ0KPiAgIDIgZmlsZXMgY2hhbmdlZCwgMTkgaW5z
ZXJ0aW9ucygrKSwgMjEgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2RybV9tYW5hZ2VkLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX21hbmFnZWQu
Yw0KPiBpbmRleCA0Y2YyMTRkZTUwYzQuLmMyMWMzZjYyMzAzMyAxMDA2NDQNCj4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2RybV9tYW5hZ2VkLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L2RybV9tYW5hZ2VkLmMNCj4gQEAgLTI2NCwyOCArMjY0LDEwIEBAIHZvaWQgZHJtbV9rZnJl
ZShzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCB2b2lkICpkYXRhKQ0KPiAgIH0NCj4gICBFWFBP
UlRfU1lNQk9MKGRybW1fa2ZyZWUpOw0KPiAgIA0KPiAtc3RhdGljIHZvaWQgZHJtbV9tdXRl
eF9yZWxlYXNlKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHZvaWQgKnJlcykNCj4gK3ZvaWQg
X19kcm1tX211dGV4X3JlbGVhc2Uoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgdm9pZCAqcmVz
KQ0KPiAgIHsNCj4gICAJc3RydWN0IG11dGV4ICpsb2NrID0gcmVzOw0KPiAgIA0KPiAgIAlt
dXRleF9kZXN0cm95KGxvY2spOw0KPiAgIH0NCj4gLQ0KPiAtLyoqDQo+IC0gKiBkcm1tX211
dGV4X2luaXQgLSAmZHJtX2RldmljZS1tYW5hZ2VkIG11dGV4X2luaXQoKQ0KPiAtICogQGRl
djogRFJNIGRldmljZQ0KPiAtICogQGxvY2s6IGxvY2sgdG8gYmUgaW5pdGlhbGl6ZWQNCj4g
LSAqDQo+IC0gKiBSZXR1cm5zOg0KPiAtICogMCBvbiBzdWNjZXNzLCBvciBhIG5lZ2F0aXZl
IGVycm5vIGNvZGUgb3RoZXJ3aXNlLg0KPiAtICoNCj4gLSAqIFRoaXMgaXMgYSAmZHJtX2Rl
dmljZS1tYW5hZ2VkIHZlcnNpb24gb2YgbXV0ZXhfaW5pdCgpLiBUaGUgaW5pdGlhbGl6ZWQN
Cj4gLSAqIGxvY2sgaXMgYXV0b21hdGljYWxseSBkZXN0cm95ZWQgb24gdGhlIGZpbmFsIGRy
bV9kZXZfcHV0KCkuDQo+IC0gKi8NCj4gLWludCBkcm1tX211dGV4X2luaXQoc3RydWN0IGRy
bV9kZXZpY2UgKmRldiwgc3RydWN0IG11dGV4ICpsb2NrKQ0KPiAtew0KPiAtCW11dGV4X2lu
aXQobG9jayk7DQo+IC0NCj4gLQlyZXR1cm4gZHJtbV9hZGRfYWN0aW9uX29yX3Jlc2V0KGRl
diwgZHJtbV9tdXRleF9yZWxlYXNlLCBsb2NrKTsNCj4gLX0NCj4gLUVYUE9SVF9TWU1CT0wo
ZHJtbV9tdXRleF9pbml0KTsNCj4gK0VYUE9SVF9TWU1CT0woX19kcm1tX211dGV4X3JlbGVh
c2UpOw0KPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vZHJtX21hbmFnZWQuaCBiL2luY2x1
ZGUvZHJtL2RybV9tYW5hZ2VkLmgNCj4gaW5kZXggMzU5ODgzOTQyNjEyLi5hZDA4ZjgzNGFm
NDAgMTAwNjQ0DQo+IC0tLSBhL2luY2x1ZGUvZHJtL2RybV9tYW5hZ2VkLmgNCj4gKysrIGIv
aW5jbHVkZS9kcm0vZHJtX21hbmFnZWQuaA0KPiBAQCAtMTA1LDYgKzEwNSwyMiBAQCBjaGFy
ICpkcm1tX2tzdHJkdXAoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgY29uc3QgY2hhciAqcywg
Z2ZwX3QgZ2ZwKTsNCj4gICANCj4gICB2b2lkIGRybW1fa2ZyZWUoc3RydWN0IGRybV9kZXZp
Y2UgKmRldiwgdm9pZCAqZGF0YSk7DQo+ICAgDQo+IC1pbnQgZHJtbV9tdXRleF9pbml0KHN0
cnVjdCBkcm1fZGV2aWNlICpkZXYsIHN0cnVjdCBtdXRleCAqbG9jayk7DQo+ICt2b2lkIF9f
ZHJtbV9tdXRleF9yZWxlYXNlKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHZvaWQgKnJlcyk7
DQo+ICsNCj4gKy8qKg0KPiArICogZHJtbV9tdXRleF9pbml0IC0gJmRybV9kZXZpY2UtbWFu
YWdlZCBtdXRleF9pbml0KCkNCj4gKyAqIEBkZXY6IERSTSBkZXZpY2UNCj4gKyAqIEBsb2Nr
OiBsb2NrIHRvIGJlIGluaXRpYWxpemVkDQo+ICsgKg0KPiArICogUmV0dXJuczoNCj4gKyAq
IDAgb24gc3VjY2Vzcywgb3IgYSBuZWdhdGl2ZSBlcnJubyBjb2RlIG90aGVyd2lzZS4NCj4g
KyAqDQo+ICsgKiBUaGlzIGlzIGEgJmRybV9kZXZpY2UtbWFuYWdlZCB2ZXJzaW9uIG9mIG11
dGV4X2luaXQoKS4gVGhlIGluaXRpYWxpemVkDQo+ICsgKiBsb2NrIGlzIGF1dG9tYXRpY2Fs
bHkgZGVzdHJveWVkIG9uIHRoZSBmaW5hbCBkcm1fZGV2X3B1dCgpLg0KPiArICovDQo+ICsj
ZGVmaW5lIGRybW1fbXV0ZXhfaW5pdChkZXYsIGxvY2spICh7CQkJCQkgICAgIFwNCj4gKwlt
dXRleF9pbml0KGxvY2spOwkJCQkJCSAgICAgXA0KPiArCWRybW1fYWRkX2FjdGlvbl9vcl9y
ZXNldChkZXYsIF9fZHJtbV9tdXRleF9yZWxlYXNlLCBsb2NrKTsJICAgICBcDQo+ICt9KQkJ
CQkJCQkJCSAgICAgXA0KPiAgIA0KPiAgICNlbmRpZg0KDQotLSANClRob21hcyBaaW1tZXJt
YW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9u
cyBHZXJtYW55IEdtYkgNCkZyYW5rZW5zdHJhc3NlIDE0NiwgOTA0NjEgTnVlcm5iZXJnLCBH
ZXJtYW55DQpHRjogSXZvIFRvdGV2LCBBbmRyZXcgTXllcnMsIEFuZHJldyBNY0RvbmFsZCwg
Qm91ZGllbiBNb2VybWFuDQpIUkIgMzY4MDkgKEFHIE51ZXJuYmVyZykNCg==

--------------pnciCsYe5mERvSE3JhUcyKXc--

--------------JP02lJomYmzqGylzc4O8eAy1
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmRrOTsFAwAAAAAACgkQlh/E3EQov+Be
3hAAzZUoWEOYJW5wQ58PF8XlUFwWf/yvpkDQzWmLrKTSZ6EM+lVLQ88RlVQjCf/KNCE1crxuBYwP
BKJVpxT3E5XWrt7kOjOhvlJTFYuFZ/lAIYxEuog9YRtnRTWNujr8olH9RgA5fltUGhNDYwEDOWRE
NuU8w5z5vX+LszziKKwT7ld24fCFWs4DI9LKV2dne/CipnQr24vsK7j0tUh/3zoAmgto5zu07PoR
DoKYsPzGupAt9q05YSvEeVuTkO26LdAyd3t/HkUGT1jwyYSkiL91B44yUXP1G0Fc0PXTBmbIJGmH
lvMlMOJWmBslaoCP2ijAYvSIuPrG4wB2yPpFJ7SUMagMFh9SqvvNsAkbnj0X6vyU4XLxVc25WgQP
c47Xbn4CzfyuV4aeYO9Xd7lknXRJ85IYVeoxN2hCKBGov8AMhoXF0MmmF8jHHVxf6XkJOLDZ6hHF
zDlOYHW+3ytdkpuptx39j3a/6/c3OofZNDZdhRBeZr+rM/7eqWqJN/QhUZxvFfZeXmUc6XmwZlb+
dAMAPYKIYOcctOFEY62iaZi0A4q7xmq+CgUewhbV6FCm8Yd+fXSRD1Ms4sXUmXVvjBBKHEkQM14Y
PlLaDbtRGdW7slu3Hp53RT7jmIo+Ne+nGFS9y3Z6MHucHBwBiY+ydwPFISKy+MEecwQeUMj3tw1Q
aC8=
=u8h0
-----END PGP SIGNATURE-----

--------------JP02lJomYmzqGylzc4O8eAy1--
