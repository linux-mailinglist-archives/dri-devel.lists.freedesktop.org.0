Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3658773F7FE
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jun 2023 11:00:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73C1D10E2C2;
	Tue, 27 Jun 2023 09:00:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FE6910E2C2
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jun 2023 09:00:06 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 11FAE2189C;
 Tue, 27 Jun 2023 09:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1687856403; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6KUO+iiY3CsNa4u7sLnFrbSYuR7HbQKob1X2SfZukQo=;
 b=bArtQ0c8JI0V0+LkY1iGDA/EapOg9pKK8UotxOYXRWecxXYgiqygLcjuD33J66Nh63ZQtn
 pODNPmvun3D4F+MeiSfFtioDow8hCjZNt28Yixndcg0Ssx/Oyglg3nGN2Omb/Wa8UmwqCk
 9lU507G1dnKATpIWfdHcvZ2QW9lIXM8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1687856403;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6KUO+iiY3CsNa4u7sLnFrbSYuR7HbQKob1X2SfZukQo=;
 b=JKV4Bpkle155og+HviMx+NZNtAIIwLTs+extd7Ln1ga0um+Z+bQIxfVQiWTtcuaXwBOnm+
 1miFoB6pwZ20W6DQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D205E13276;
 Tue, 27 Jun 2023 09:00:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id mAMoMhKlmmS0TQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 27 Jun 2023 09:00:02 +0000
Message-ID: <e6031336-3ac1-4279-7eac-221552859dff@suse.de>
Date: Tue, 27 Jun 2023 11:00:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] drm/drm_gem.c: remove surplus else after return clause
To: Maxime Ripard <mripard@kernel.org>
References: <20230314125305.2278964-1-15330273260@189.cn>
 <cde47fd0-a8e4-36cf-3f0b-a1b473799db3@loongson.cn>
 <163af01e-01cc-008d-333f-964cba9f9130@suse.de>
 <670a1763-181a-0133-9b31-b790072b3af8@loongson.cn>
 <c2bdf8ea-b770-23a1-222b-1791ab0e3cec@suse.de>
 <ixkyytoxpsnw3ffumacdyyoj4qbs3zqob73oj6hzuzuwi25axm@roghs7ruhnik>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <ixkyytoxpsnw3ffumacdyyoj4qbs3zqob73oj6hzuzuwi25axm@roghs7ruhnik>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------yP4wjHdy5IDzv4WoRJ2WR7Rj"
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
Cc: David Airlie <airlied@linux.ie>, liyi <liyi@loongson.cn>,
 Sui Jingfeng <suijingfeng@loongson.cn>, dri-devel@lists.freedesktop.org,
 Sui Jingfeng <15330273260@189.cn>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------yP4wjHdy5IDzv4WoRJ2WR7Rj
Content-Type: multipart/mixed; boundary="------------KPd8AVEXBoK4dwPPN9dQNxil";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Maxime Ripard <mripard@kernel.org>
Cc: Sui Jingfeng <suijingfeng@loongson.cn>, David Airlie <airlied@linux.ie>,
 liyi <liyi@loongson.cn>, dri-devel@lists.freedesktop.org,
 Sui Jingfeng <15330273260@189.cn>
Message-ID: <e6031336-3ac1-4279-7eac-221552859dff@suse.de>
Subject: Re: [PATCH] drm/drm_gem.c: remove surplus else after return clause
References: <20230314125305.2278964-1-15330273260@189.cn>
 <cde47fd0-a8e4-36cf-3f0b-a1b473799db3@loongson.cn>
 <163af01e-01cc-008d-333f-964cba9f9130@suse.de>
 <670a1763-181a-0133-9b31-b790072b3af8@loongson.cn>
 <c2bdf8ea-b770-23a1-222b-1791ab0e3cec@suse.de>
 <ixkyytoxpsnw3ffumacdyyoj4qbs3zqob73oj6hzuzuwi25axm@roghs7ruhnik>
In-Reply-To: <ixkyytoxpsnw3ffumacdyyoj4qbs3zqob73oj6hzuzuwi25axm@roghs7ruhnik>

--------------KPd8AVEXBoK4dwPPN9dQNxil
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjYuMDYuMjMgdW0gMTQ6MzIgc2NocmllYiBNYXhpbWUgUmlwYXJkOg0KPiBI
aSwNCj4gDQo+IE9uIFR1ZSwgSnVuIDIwLCAyMDIzIGF0IDA2OjE4OjMxUE0gKzAyMDAsIFRo
b21hcyBaaW1tZXJtYW5uIHdyb3RlOg0KPj4gQW0gMjAuMDYuMjMgdW0gMTg6MDYgc2Nocmll
YiBTdWkgSmluZ2Zlbmc6DQo+Pj4gSGksDQo+Pj4NCj4+PiBPbiAyMDIzLzYvMjAgMjI6NDMs
IFRob21hcyBaaW1tZXJtYW5uIHdyb3RlOg0KPj4+PiBIaQ0KPj4+Pg0KPj4+PiBBbSAyMC4w
Ni4yMyB1bSAwNjowOCBzY2hyaWViIFN1aSBKaW5nZmVuZzoNCj4+Pj4+IHBpbmcgPw0KPj4+
Pj4NCj4+Pj4+IE9uIDIwMjMvMy8xNCAyMDo1MywgU3VpIEppbmdmZW5nIHdyb3RlOg0KPj4+
Pj4+ICDCoCBlbHNlIGlzIG5vdCBnZW5lcmFsbHkgdXNlZnVsIGFmdGVyIHJldHVybg0KPj4+
Pg0KPj4+PiBObyBpbmRlbnRpb24gcGxlYXNlLg0KPj4+Pg0KPj4+IE9LLCB3aWxsIGJlIGZp
eGVkIGF0IHRoZSBuZXh0IHZlcnNpb24uDQo+Pj4+Pj4NCj4+Pj4+PiBTaWduZWQtb2ZmLWJ5
OiBTdWkgSmluZ2ZlbmcgPDE1MzMwMjczMjYwQDE4OS5jbj4NCj4+Pj4+PiAtLS0NCj4+Pj4+
PiAgwqAgZHJpdmVycy9ncHUvZHJtL2RybV9nZW0uYyB8IDcgKysrKy0tLQ0KPj4+Pj4+ICDC
oCAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQ0KPj4+
Pj4+DQo+Pj4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtLmMgYi9k
cml2ZXJzL2dwdS9kcm0vZHJtX2dlbS5jDQo+Pj4+Pj4gaW5kZXggYTYyMDhlMmMwODliLi4z
NjRlMzczM2FmOTggMTAwNjQ0DQo+Pj4+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9n
ZW0uYw0KPj4+Pj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtLmMNCj4+Pj4+PiBA
QCAtMTE1MCw4ICsxMTUwLDggQEAgaW50IGRybV9nZW1fcGluKHN0cnVjdCBkcm1fZ2VtX29i
amVjdCAqb2JqKQ0KPj4+Pj4+ICDCoCB7DQo+Pj4+Pj4gIMKgwqDCoMKgwqAgaWYgKG9iai0+
ZnVuY3MtPnBpbikNCj4+Pj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiBvYmotPmZ1
bmNzLT5waW4ob2JqKTsNCj4+Pj4+PiAtwqDCoMKgIGVsc2UNCj4+Pj4+PiAtwqDCoMKgwqDC
oMKgwqAgcmV0dXJuIDA7DQo+Pj4+Pj4gKw0KPj4+Pj4+ICvCoMKgwqAgcmV0dXJuIDA7DQo+
Pj4+DQo+Pj4+IFRoaXMgY2hhbmdlIGlzIG9rLg0KPj4+Pg0KPj4+Pj4+ICDCoCB9DQo+Pj4+
Pj4gIMKgIHZvaWQgZHJtX2dlbV91bnBpbihzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKm9iaikN
Cj4+Pj4+PiBAQCAtMTE3Miw3ICsxMTcyLDggQEAgaW50IGRybV9nZW1fdm1hcChzdHJ1Y3Qg
ZHJtX2dlbV9vYmplY3QNCj4+Pj4+PiAqb2JqLCBzdHJ1Y3QgaW9zeXNfbWFwICptYXApDQo+
Pj4+Pj4gIMKgwqDCoMKgwqAgcmV0ID0gb2JqLT5mdW5jcy0+dm1hcChvYmosIG1hcCk7DQo+
Pj4+Pj4gIMKgwqDCoMKgwqAgaWYgKHJldCkNCj4+Pj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKg
IHJldHVybiByZXQ7DQo+Pj4+Pj4gLcKgwqDCoCBlbHNlIGlmIChpb3N5c19tYXBfaXNfbnVs
bChtYXApKQ0KPj4+Pj4+ICsNCj4+Pj4+PiArwqDCoMKgIGlmIChpb3N5c19tYXBfaXNfbnVs
bChtYXApKQ0KPj4+Pj4+ICDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIC1FTk9NRU07DQo+
Pj4+DQo+Pj4+IFRoaXMgaXMgbm90IGNvcnJlY3QuIENhbGxpbmcgaW9zeXNfbWFwX2lzX251
bGwoKSBpcyBwYXJ0IG9mIGhhbmRsaW5nDQo+Pj4+IHRoZSByZXR1cm4gdmFsdWUgZnJvbSB2
bWFwLCBzbyB0aGUgZWxzZSBpcyBmaW5lLg0KPj4+Pg0KPj4+IEFyZSB5b3Ugc2VyaW91cyA/
DQo+Pj4NCj4+Pg0KPj4+IDEuIEJlZm9yZSBhcHBseSB0aGlzIHBhdGNoOg0KPj4+DQo+Pj4N
Cj4+PiBJZiB0aGUgJ3JldCcgaXMgMCzCoCBpdCBzdGFuZCBmb3Igb2JqLT5mdW5jcy0+dm1h
cCgpIGlzIHN1Y2Nlc3NmdWwsIHRoZW4NCj4+PiBpZiAoaW9zeXNfbWFwX2lzX251bGwobWFw
KSkgd2lsbCBiZSBydW4uDQo+Pj4NCj4+PiBJZiB0aGUgJ3JldCcgaXMgTk9UIDAsIHRoZW4g
aXQgcmV0dXJuIGltbWVkaWF0ZWx5Lg0KPj4+DQo+Pj4NCj4+PiAyLiBBZnRlciBhcHBseSB0
aGlzIHBhdGNoOg0KPj4+DQo+Pj4NCj4+PiBJZiB0aGUgJ3JldCcgaXMgTk9UIDAsIGl0IHN0
YW5kIGZvciBvYmotPmZ1bmNzLT52bWFwKCkgZmFpbGVkLCB0aGVuIGl0DQo+Pj4gcmV0dXJu
IGltbWVkaWF0ZWx5Lg0KPj4+DQo+Pj4gSWYgdGhlICdyZXQnIGlzIDAsIGl0IHN0YW5kIGZv
ciBvYmotPmZ1bmNzLT52bWFwKCkgaXMgc3VjY2Vzc2Z1bCwgdGhlbg0KPj4+IHRoZSBjaGVj
ayBpZiAoaW9zeXNfbWFwX2lzX251bGwobWFwKSkNCj4+Pg0KPj4+IHdpbGwgYmUgcnVuIQ0K
Pj4+DQo+Pj4NCj4+PiBJIGZlZWwgc3RyYW5nZSBhYm91dCB0aGUgY29yZSBoZXJlLCBJIHRo
aW5rIHRoZSBjaGVjayAnIGlmDQo+Pj4gKGlvc3lzX21hcF9pc19udWxsKG1hcCkpJyBpcyBu
b3QgbmVlZGVkLA0KPj4+DQo+Pj4gdGhlIGltcGxlbWVudCBzaG91bGQgcmVzcG9uc2libGUg
dG8gaGFuZGxlIGFsbCBvZiBwb3NzaWJsZSBlcnJvcnMuDQo+Pg0KPj4gVGhlIC0+dm1hcCgp
IGNhbGxiYWNrIGNhbiBzdWNjZWVkIHdpdGggcmV0PTAsIGJ1dCB3ZSBzdGlsbCBoYXZlIG5v
IG1lbW9yeS4NCj4+IFRoZW4gd2UgcmV0dXJuIC1FTk9NRU0uIFRoZSBjYWxsIHRvIF9pc19u
dWxsKG1hcCkgaXMgcGFydCBvZiB0aGUgZXJyb3INCj4+IGhhbmRsaW5nIGZvciAtPnZtYXAo
KS4gVGhhdCBpcyBhIGJpdCBzdHJhbmdlLCBidXQgaXQgYXMgYWx3YXlzIHdvcmtlZCBsaWtl
DQo+PiB0aGF0LiBLZWVwaW5nIGFsbCBlcnJvciBoYW5kbGluZyBpbiB0aGUgc2FtZSBpZi1l
bHNlIGJsb2NrIG1ha2UgYWxsIHRoaXMNCj4+IG1vcmUgb2J2aW91cy4NCj4gDQo+IFJlYWRp
bmcgdGhhdCBwYXRjaCwgaXQgd2Fzbid0IG9idmlvdXMgdG8gbWUgYXQgYWxsIGFuZCBjb3Vs
ZCBoYXZlIG1hZGUNCj4gdGhlIHNhbWUgcGF0Y2guDQoNClRoZSB2bWFwIGNhbGxiYWNrIGNv
dWxkIHJldHVybiBhbnkgZXJybm8gY29kZTsgcGx1cyBhIDAgd2l0aCBhIE5VTEwgDQpwb2lu
dGVyIG1lYW5zIC1FTk9NRU0uICBEb2luZyB0aGlzIGhlcmUgc2ltcGxpZmllcyB0aGUgY2Fs
bGVycyBvZiANCmRybV9nZW1fdm1hcCBhbmQgbWFrZXMgdGhlbSBtb3JlIHJvYnVzdC4gIFdl
J2Qgb3RoZXJ3aXNlIGR1cGxpY2F0ZSB0aGUgDQp0ZXN0IGZvciBOVUxMIGluIGVhY2ggY2Fs
bGVyLg0KDQo+IA0KPiBDb3VsZCB3ZSBhZGQgYSBjb21tZW50IG1heWJlIHRvIG1ha2UgaXQg
bW9yZSBvYnZpb3VzPw0KDQpBIG9uZS1saW5lciB0aGF0IHN0YXRlcyB0aGUgZ2l2ZW4gcmF0
aW9uYWwgbWlnaHQgbWFrZSBzZW5zZS4NCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KPiAN
Cj4gTWF4aW1lDQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBE
ZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KRnJhbmtl
bnN0cmFzc2UgMTQ2LCA5MDQ2MSBOdWVybmJlcmcsIEdlcm1hbnkNCkdGOiBJdm8gVG90ZXYs
IEFuZHJldyBNeWVycywgQW5kcmV3IE1jRG9uYWxkLCBCb3VkaWVuIE1vZXJtYW4NCkhSQiAz
NjgwOSAoQUcgTnVlcm5iZXJnKQ0K

--------------KPd8AVEXBoK4dwPPN9dQNxil--

--------------yP4wjHdy5IDzv4WoRJ2WR7Rj
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmSapRIFAwAAAAAACgkQlh/E3EQov+CF
gBAAzU8oRQOHLlkZaEzxqdQ/yOfp6gbaGdP+pW4dJC4viFe/88/VHeYhOq1xd5r3D8OalMoKmL12
4lNoCxvaV9UEHsXFZWFou4vOY9rl9rxXqwsYTIt35n71CjCgd6DN/OB8wa1mb7OBkbojxaMHaL/+
LvUuvEYkMdK3yXEGsfOmmrutphGhpC+hVz/+cZI8elcv/f42FNPdXsCKqhjObOWDodM9bNQtwkjl
1gG7GAAqFyUJVv8QK8O1USk8klUAWeYN2+aCx5ZvaaGz8x0r/5ERcI43XQyDF/9QQTXgpKxjwQWK
izrAdBIWfEncGTt73RKJH8NMZbigOKBSi5jgPvXh+CDCzVYxDsd+K1/MqXM+sf/aOeo5TzEPGGvX
WxRMCeYC6g79ZHyImB67eDPmRmLQ0bLD1ii1p0TJZKWXL7fl8w3wPDZ8oRmv9kjermKhjikIAmj9
OGEKTjAGB+NTDg/5lSBdGZ0gdp9bCikQEhL8UQP4dG5KBaL73I769CzdOaVtTRC7/QpxM3V4E80d
A2zH4DEbk015cDlUIkjjuaN1Jk5VnMLmKSGj0VrVNuFM2n4qRPBVCI6jxD3EqIVpuD6EZaRt5s6f
nx7S1WPBss7DNuMG2twI3KZZ5H3rpEIpq8ckaAMzvGPn+kcq0I3Ak63bqrsSwilcFUZWt3/8PUhy
o78=
=MblJ
-----END PGP SIGNATURE-----

--------------yP4wjHdy5IDzv4WoRJ2WR7Rj--
