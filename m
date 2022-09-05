Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 17F5B5AD19C
	for <lists+dri-devel@lfdr.de>; Mon,  5 Sep 2022 13:34:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5151B10E316;
	Mon,  5 Sep 2022 11:34:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86A6F10E316
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Sep 2022 11:34:16 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 318695FBBF;
 Mon,  5 Sep 2022 11:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1662377655; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=f6e6SRaWzucF4xpDGQSoVBhm0fUWYqEMXHU9rRqNGqw=;
 b=aECDMYIVk3GeGWShr96dsEGGARLR5QNnRQqw4RQLv6e/suogkZ+oJz+z1DhCbVG+4kopp4
 xLWfw3eU34dLjQ+DJpwkzgO/DGMhMr/lO3mcN6E151L85Sbki1Bb+OKu2AdGeNhCSqzjaq
 u9sLMcATGKGJLGyWB1RCDYMQDjg4XdY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1662377655;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=f6e6SRaWzucF4xpDGQSoVBhm0fUWYqEMXHU9rRqNGqw=;
 b=aNu1VJN58KNAaIDdpSOtZRgSiu+9bsOd9n1cfwzLzmg1dP7jJibfik5U59hCXBB8IOsqGz
 +jod7uZHnnwVAvBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 16BFD139C7;
 Mon,  5 Sep 2022 11:34:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id deqlBLfeFWNZZwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 05 Sep 2022 11:34:15 +0000
Message-ID: <bd987b93-ebcc-8fad-ee5e-2e25f4d64eaf@suse.de>
Date: Mon, 5 Sep 2022 13:34:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH] drm/ssd130x: Replace simple display helpers with the
 atomic helpers
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org
References: <20220828151114.1141510-1-javierm@redhat.com>
 <6f499b1e-daa4-7de1-6ffc-151663807910@suse.de>
 <03b207a8-e09c-2858-fd54-b95f2e8e8d11@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <03b207a8-e09c-2858-fd54-b95f2e8e8d11@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------R04xhX0jJBVK3PAMCXVUf0LE"
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------R04xhX0jJBVK3PAMCXVUf0LE
Content-Type: multipart/mixed; boundary="------------EBvFm4floGQoG5KfO4URs4s2";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org
Message-ID: <bd987b93-ebcc-8fad-ee5e-2e25f4d64eaf@suse.de>
Subject: Re: [PATCH] drm/ssd130x: Replace simple display helpers with the
 atomic helpers
References: <20220828151114.1141510-1-javierm@redhat.com>
 <6f499b1e-daa4-7de1-6ffc-151663807910@suse.de>
 <03b207a8-e09c-2858-fd54-b95f2e8e8d11@redhat.com>
In-Reply-To: <03b207a8-e09c-2858-fd54-b95f2e8e8d11@redhat.com>

--------------EBvFm4floGQoG5KfO4URs4s2
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDUuMDkuMjIgdW0gMTM6MDAgc2NocmllYiBKYXZpZXIgTWFydGluZXogQ2Fu
aWxsYXM6DQo+IEhlbGxvIFRob21hcywNCj4gDQo+IFRoYW5rcyBmb3IgeW91ciBmZWVkYmFj
ayBhbmQgY29tbWVudHMuDQo+IA0KPiBPbiA5LzUvMjIgMTI6NDEsIFRob21hcyBaaW1tZXJt
YW5uIHdyb3RlOg0KPj4gSGkgSmF2aWVyDQo+Pg0KPj4gQW0gMjguMDguMjIgdW0gMTc6MTEg
c2NocmllYiBKYXZpZXIgTWFydGluZXogQ2FuaWxsYXM6DQo+Pj4gVGhlIHNpbXBsZSBkaXNw
bGF5IHBpcGVsaW5lIGlzIGEgc2V0IG9mIGhlbHBlcnMgdGhhdCBjYW4gYmUgdXNlZCBieSBE
Uk0NCj4+PiBkcml2ZXJzIHRvIGF2b2lkIGRlYWxpbmcgd2l0aCBhbGwgdGhlIG5lZWRlZCBj
b21wb25lbnRzIGFuZCBqdXN0IGRlZmluZQ0KPj4+IGEgZmV3IGZ1bmN0aW9ucyB0byBvcGVy
YXRlIGEgc2ltcGxlIGRpc3BsYXkgZGV2aWNlIHdpdGggb25lIGZ1bGwtc2NyZWVuDQo+Pj4g
c2Nhbm91dCBidWZmZXIgZmVlZGluZyBhIHNpbmdsZSBvdXRwdXQuDQo+Pj4NCj4+PiBCdXQg
aXQgaXMgYXJndWFibGUgdGhhdCB0aGlzIHByb3ZpZGVzIHRoZSBjb3JyZWN0IGxldmVsIG9m
IGFic3RyYWN0aW9uDQo+Pj4gZm9yIHNpbXBsZSBkcml2ZXJzLCBhbmQgcmVjZW50bHkgc29t
ZSBoYXZlIGJlZW4gcG9ydGVkIGZyb20gdXNpbmcgdGhlc2UNCj4+PiBzaW1wbGUgZGlzcGxh
eSBoZWxwZXJzIHRvIHVzZSB0aGUgcmVndWxhciBhdG9taWMgaGVscGVycyBpbnN0ZWFkLg0K
Pj4+DQo+Pj4gVGhlIHJhdGlvbmFsZSBmb3IgdGhpcyBpcyB0aGF0IHRoZSBzaW1wbGUgZGlz
cGxheSBwaXBlbGluZSBoZWxwZXJzIGRvbid0DQo+Pj4gaGlkZSB0aGF0IG11Y2ggb2YgdGhl
IERSTSBjb21wbGV4aXR5LCB3aGlsZSBhZGRpbmcgYW4gaW5kaXJlY3Rpb24gbGF5ZXINCj4+
PiB0aGF0IGNvbmZsYXRlcyB0aGUgY29uY2VwdHMgb2YgQ1JUQ3MgYW5kIHBsYW5lcy4gVGhp
cyBtYWtlcyB0aGUgaGVscGVycw0KPj4+IGxlc3MgZmxleGlibGUgYW5kIGhhcmRlciB0byBi
ZSByZXVzZWQgYW1vbmcgZGlmZmVyZW50IGdyYXBoaWNzIGRyaXZlcnMuDQo+Pj4NCj4+PiBB
bHNvLCBmb3Igc2ltcGxlIGRyaXZlcnMsIHVzaW5nIHRoZSBmdWxsIGF0b21pYyBoZWxwZXJz
IGRvZXNuJ3QgcmVxdWlyZQ0KPj4+IGEgbG90IG9mIGFkZGl0aW9uYWwgY29kZS4gU28gYWRk
aW5nIGEgc2ltcGxlIGRpc3BsYXkgcGlwZWxpbmUgbGF5ZXIgbWF5DQo+Pj4gbm90IGJlIHdv
cnRoIGl0Lg0KPj4+DQo+Pj4gRm9yIHRoZXNlIHJlYXNvbnMsIGxldCdzIGZvbGxvdyB0aGF0
IHRyZW5kIGFuZCBtYWtlIHNzZDEzMHggYSBwbGFpbiBEUk0NCj4+PiBkcml2ZXIgdGhhdCBj
cmVhdGVzIGl0cyBvd24gcHJpbWFyeSBwbGFuZSwgQ1JUQywgZW5jb25kZXIgYW5kIGNvbm5l
Y3Rvci4NCj4+DQo+PiBUaGFua3MgZm9yIGNvbnNpZGVyaW5nIHRoaXMgY2hhbmdlLg0KPj4N
Cj4gDQo+IFlvdSBhcmUgd2VsY29tZSBhbmQgdGhhbmtzIHRvIHlvdSBmb3IgbWVudGlvbmlu
ZyB0aGlzIHRvIG1lLiBBZnRlciBkb2luZw0KPiB0aGlzIEknbSBjb252aW5jZWQgYXMgd2Vs
bCB0aGF0IHRoZSBzaW1wbGUtS01TIC8gc2ltcGxlIGRpc3BsYXkgcGlwZWxpbmUNCj4gYWJz
dHJhY3Rpb24gZG9lc24ndCBhZGQgYW55IHZhbHVlIGFuZCB3ZSBzaG91bGQganVzdCBkcm9w
IGl0IGluIGZhdm9yIG9mDQo+IHRoZSBmdWxsIGF0b21pYyBoZWxwZXJzLg0KPiANCj4+Pg0K
Pj4+IFN1Z2dlc3RlZC1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2Uu
ZGU+DQo+Pj4gU2lnbmVkLW9mZi1ieTogSmF2aWVyIE1hcnRpbmV6IENhbmlsbGFzIDxqYXZp
ZXJtQHJlZGhhdC5jb20+DQo+Pg0KPj4gQWNrZWQtYnk6IFRob21hcyBaaW1tZXJtYW5uIDx0
emltbWVybWFubkBzdXNlLmRlPg0KPj4NCj4gDQo+IFRoYW5rcyENCj4gICANCj4+IFRoZXJl
IGFyZSBhIGZldyBxdWVzdGlvbnMgYmVsb3cuDQo+Pg0KPiANCj4gWy4uLl0NCj4gDQo+Pj4g
K3N0YXRpYyB2b2lkIHNzZDEzMHhfcHJpbWFyeV9wbGFuZV9oZWxwZXJfYXRvbWljX3VwZGF0
ZShzdHJ1Y3QgZHJtX3BsYW5lICpwbGFuZSwNCj4+PiArCQkJCQkJICAgICAgIHN0cnVjdCBk
cm1fYXRvbWljX3N0YXRlICpvbGRfc3RhdGUpDQo+Pj4gICAgew0KPj4+IC0Jc3RydWN0IHNz
ZDEzMHhfZGV2aWNlICpzc2QxMzB4ID0gZHJtX3RvX3NzZDEzMHgocGlwZS0+Y3J0Yy5kZXYp
Ow0KPj4+ICsJc3RydWN0IGRybV9wbGFuZV9zdGF0ZSAqcGxhbmVfc3RhdGUgPSBwbGFuZS0+
c3RhdGU7DQo+Pj4gKwlzdHJ1Y3QgZHJtX3BsYW5lX3N0YXRlICpvbGRfcGxhbmVfc3RhdGUg
PSBkcm1fYXRvbWljX2dldF9vbGRfcGxhbmVfc3RhdGUob2xkX3N0YXRlLCBwbGFuZSk7DQo+
Pj4gICAgCXN0cnVjdCBkcm1fc2hhZG93X3BsYW5lX3N0YXRlICpzaGFkb3dfcGxhbmVfc3Rh
dGUgPSB0b19kcm1fc2hhZG93X3BsYW5lX3N0YXRlKHBsYW5lX3N0YXRlKTsNCj4+PiAtCXN0
cnVjdCBkcm1fZGV2aWNlICpkcm0gPSAmc3NkMTMweC0+ZHJtOw0KPj4+IC0JaW50IGlkeCwg
cmV0Ow0KPj4+ICsJc3RydWN0IGRybV9mcmFtZWJ1ZmZlciAqZmIgPSBwbGFuZV9zdGF0ZS0+
ZmI7DQo+Pj4gKwlzdHJ1Y3QgZHJtX2RldmljZSAqZHJtID0gcGxhbmUtPmRldjsNCj4+PiAr
CXN0cnVjdCBkcm1fcmVjdCBzcmNfY2xpcCwgZHN0X2NsaXA7DQo+Pj4gKwlpbnQgaWR4Ow0K
Pj4+ICAgIA0KPj4+IC0JcmV0ID0gc3NkMTMweF9wb3dlcl9vbihzc2QxMzB4KTsNCj4+PiAt
CWlmIChyZXQpDQo+Pj4gKwlpZiAoIWZiKQ0KPj4NCj4+IEkga25vdyB0aGF0IHNvbWUgb3Ro
ZXIgZHJpdmVycyBkbyB0aGlzIGNoZWNrLiBCdXQgZnJvbSByZWFkaW5nDQo+PiBkcm1fYXRv
bWljX2hlbHBlci5jLCBpdCBzaG91bGRuJ3QgYmUgbmVjZXNhcnkuIElmICFmYiwgdGhlIHBs
YW5lIGhhcw0KPj4gYmVlbiBkaXNhYmxlZC4gQW5kIGJlY2F1c2UgdGhlcmUncyBhbiBpbXBs
ZW1lbnRhdGlvbiBvZiBhdG9taWNfZGlzYWJsZSwNCj4+IHRoZSBoZWxwZXJzIHNob3VsZCBu
ZXZlciBjYWxsIGF0b21pY191cGRhdGUgb24gZGlzYWJsZWQgcGxhbmVzLiBJIHRoaW5rDQo+
PiB0aGUgdGVzdCBjYW4gYmUgcmVtb3ZlZC4NCj4+DQo+IA0KPiBZZXMsIEkganVzdCBhZGRl
ZCBiZWNhdXNlIG5vdGljZWQgdGhhdCBvdGhlcnMgZHJpdmVycyBkaWQuIEknbGwgZHJvcCBp
dA0KPiB3aGVuIHBvc3RpbmcgYSB2Mi4NCj4gDQo+IFsuLi5dDQo+IA0KPj4+ICtzdGF0aWMg
dm9pZCBzc2QxMzB4X2VuY29kZXJfaGVscGVyX2F0b21pY19lbmFibGUoc3RydWN0IGRybV9l
bmNvZGVyICplbmNvZGVyLA0KPj4+ICsJCQkJCQkgc3RydWN0IGRybV9hdG9taWNfc3RhdGUg
KnN0YXRlKQ0KPj4+ICt7DQo+Pj4gKwlzdHJ1Y3QgZHJtX2RldmljZSAqZHJtID0gZW5jb2Rl
ci0+ZGV2Ow0KPj4+ICsJc3RydWN0IHNzZDEzMHhfZGV2aWNlICpzc2QxMzB4ID0gZHJtX3Rv
X3NzZDEzMHgoZHJtKTsNCj4+PiArCWludCByZXQ7DQo+Pj4gKw0KPj4+ICsJcmV0ID0gc3Nk
MTMweF9wb3dlcl9vbihzc2QxMzB4KTsNCj4+PiArCWlmIChyZXQpDQo+Pj4gICAgCQlyZXR1
cm47DQo+Pj4gICAgDQo+Pj4gLQlzc2QxMzB4X2ZiX2JsaXRfcmVjdChwbGFuZV9zdGF0ZS0+
ZmIsICZzaGFkb3dfcGxhbmVfc3RhdGUtPmRhdGFbMF0sICZkc3RfY2xpcCk7DQo+Pj4gKwly
ZXQgPSBzc2QxMzB4X2luaXQoc3NkMTMweCk7DQo+Pj4gKwlpZiAocmV0KQ0KPj4+ICsJCXJl
dHVybiBzc2QxMzB4X3Bvd2VyX29mZihzc2QxMzB4KTsNCj4+DQo+PiBJdCByZXR1cm5zIGEg
dmFsdWUgZnJvbSBhIGZ1bmN0aW9uIHJldHVybmluZyAndm9pZCc/DQo+Pg0KPiANCj4gUmln
aHQuIEknbGwgZml4IGl0IGluIHYyIGFzIHdlbGwuDQo+ICAgDQo+PiBJcyB0aGlzIGZ1bmN0
aW9uIHRoZSBjb3JyZWN0IHBsYWNlIGZvciBzc2QxMzB4X2luaXQoKSA/IEl0IGxvb2tzIGEg
Yml0DQo+PiBoZWF2eSBmb3IgYSBzaW1wbGUgZW5hYmxlIG9wZXJhdGlvbi4NCj4+DQo+IA0K
PiBZZXMsIEkgd2FzIGFidXNpbmcgdGhlIGNvbmNlcHQgb2YgZW5jb2RlciBoZXJlIGp1c3Qg
dG8gaGF2ZSBhIHBsYWNlIHdoZXJlDQo+IEkgY291bGQgaG9vayB0aGUgZW5hYmxlIC8gZGlz
YWJsZSBsb2dpYywgc2luY2UgSSB3YXMgbG9va2luZyBhdCB0aGUgb3RoZXINCj4gRFJNIG9i
amVjdHMgaGVscGVyIG9wZXJhdGlvbnMgc3RydWN0dXJlcyBhbmQgZm91bmQgdGhhdCB0aGVz
ZSB3ZXJlIG9ubHkNCj4gZGVmaW5lZCBmb3IgdGhlIGVuY29kZXIuDQoNCkkgbGlrZWQgdGhl
IGlkZWEgb2YgaGFuZGxpbmcgYmFja2xpZ2h0aW5nIGhlcmUuIFBvd2VyIG9uL29mZiBhbHNv
IHNlZW1zIA0Kc2Vuc2libGUuDQoNCj4gDQo+IEJ1dCB0aGVyZSBpcyB0ZWNobmljYWxseSBu
byBlbmNvZGVyIG9uIHRoaXMgZGV2aWNlLiBBcyB5b3UgY2FuIHNlZSwgSSB3YXMNCj4gdXNp
bmcgRFJNX01PREVfRU5DT0RFUl9OT05FIHdoZW4gdGhlIGVuY29kZXIgaXMgaW5pdGlhbGl6
ZWQuDQo+IA0KPiBCdXQgSSBub3RpY2Ugbm93IHRoYXQgdGhlIHN0cnVjdCBkcm1fY3J0Y19o
ZWxwZXJfZnVuY3MgYWxzbyBoYXZlIC5lbmFibGUNCj4gYW5kIC5kaXNhYmxlIGNhbGxiYWNr
cywgaXQgc2VlbXMgSSB3YXMganVzdCBibGluZCBhbmQgZGlkbid0IHNlZSBiZWZvcmUuDQoN
CllvdSBjZXJ0YWlubHkgd2FudCB0byB1c2UgYXRvbWljX2VuYWJsZS9hdG9taWNfZGlzYWJs
ZS4gVGhleSBhcmUgDQptdXR1YWxseSBleGNsdXNpdmUgd2l0aCB0aGUgb3RoZXIgZW5hYmxl
L2Rpc2FibGUgZnVuY3Rpb25zLg0KDQo+IA0KPiBXb3VsZCBoYXZpbmcgdGhlIGluaXQgYW5k
IHBvd2Vyb2ZmIGxvZ2ljIGluIHRoZSBDUlRDIGhlbHBlcnMgYmUgY29ycmVjdA0KPiB0byB5
b3Ugb3Igd2FzIGRvIHlvdSBoYXZlIGluIG1pbmQgPw0KDQpUaGVyZSdzIHF1aXRlIGEgYml0
IGhhcHBlbmluZyBpbiB0aGUgaW5pdCBmdW5jdGlvbi4gRG9lcyBpdCBoYXZlIHRvIGJlIA0K
cmUtaW5pdGlhbGl6ZWQgb24gZWFjaCBlbmFibGUgb3BlcmF0aW9uPyAgSWYgaXQgc3Vydml2
ZXMgdGhlIHBvd2VyLW9mZiANCmNhbGwsIHRoZSBpbml0aWFsIGluaXQgY2FuIGJlIGRvbmUg
aW4gdGhlIENSVEMgcmVzZXQgZnVuY3Rpb24uIEl0J3MgDQpwdXJwb3NlIGlzIHRvIHNldCBo
YXJkd2FyZSBhbmQgc29mdHdhcmUgdG8gYSBjbGVhbiBzdGF0ZS4NCg0KQmVzdCByZWdhcmRz
DQpUaG9tYXMNCg0KPiANCj4+IEJlc3QgcmVnYXJkcw0KPj4gVGhvbWFzDQoNCi0tIA0KVGhv
bWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdh
cmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5i
ZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8
aHJlcjogSXZvIFRvdGV2DQo=

--------------EBvFm4floGQoG5KfO4URs4s2--

--------------R04xhX0jJBVK3PAMCXVUf0LE
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmMV3rYFAwAAAAAACgkQlh/E3EQov+AP
bxAAoND+HAi97wwG5fFm4VYbn4GQWxEIqDj78M5MIk2tcvfP1q33pFiCX4FTGR2dqr9zjLtdLR1Q
rTsWzL6F6nBgh7EhNmxBOHhb0JeRbDvhq+/dfRsqAF0m9uLp1Rc7osB+7RGsTa1PwmXD1rNs80rx
ZXjlw2lf5aCtDKpEJ1NL+gaVglKA6VBceTtPui95JIcSoPnUCmI1ErR6s2nZlmcbKcSIPYVUhadQ
y3WXcczbLnVD55lDwQ+ny7nxsO3AwZ2kAoyNH+tfJQwkPXvITFxyPkK8afbOp70MxzIZZFvuJVDx
OI1vwW/H6XKsGwYM+rwJu2JeUbV/uZC6gBuZDjTuxmPMxn9xofw6cUojMxlpWa2hND29bhRcnnVF
dETGI7mqZG1v7cVED29HRh/5+28/xkKphnkrTTdKXVZK9g4bDr6c3cs7As616eW2pLkpwv54v6+4
WHkYDlNaNwZbhmfM/aNNK0H2+LKMTyWJD6JxND+BSoTzb1oxRLDTODaSGUydi7xAQW3hyNFaUwsq
LpJgjT81Xai9r5/XJNuS/nxcIcspHejenDwxal2Tx7wVJA8JBbVex5np2CefPblJIFt1bgjJKG+M
/Nu0JWO8pgl7X0DGNnPMZ48QdfQUeG/E7UT8MdKgGto1obJZUlToN/F4pxkLSZ+eqME7u/SnstaY
Knc=
=Y1VN
-----END PGP SIGNATURE-----

--------------R04xhX0jJBVK3PAMCXVUf0LE--
