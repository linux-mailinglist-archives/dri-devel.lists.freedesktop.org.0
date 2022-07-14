Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12F8A5749AC
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jul 2022 11:52:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E65DA3DC6;
	Thu, 14 Jul 2022 09:52:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 813D0A3DC5;
 Thu, 14 Jul 2022 09:52:12 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 300A934BCC;
 Thu, 14 Jul 2022 09:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1657792331; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aO2Y7jMlT972EroOMcaeEVBDEUL6zXuy1HwmDfXOnpY=;
 b=sLJyKfRnk/k1EO8j9ll6/asYZFpknTcFcTwOwyDPaI94enxllycQAv35+pYi1Hl6OBLsxQ
 /9UQ233aeeGvMcaMGYmgTHE7SsvtmLoI2Ro+bN/yNYl2HkN3lp81+iwc7+YSaOtBT+YmFE
 XDj09RaAVfm1P6HOrHUcIWNKDZg18BA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1657792331;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aO2Y7jMlT972EroOMcaeEVBDEUL6zXuy1HwmDfXOnpY=;
 b=snbNQdXhyJdcf9q/V4KBSH9nu3KW6RpFJoZIXfTGOjYcfPebFMvOji68pyQHuCpEiQ7fB/
 /PleKjro03TmB7Bg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 06C16133A6;
 Thu, 14 Jul 2022 09:52:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 5Hy1AEvnz2IjNQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 14 Jul 2022 09:52:11 +0000
Message-ID: <b0ee4784-03cb-1bdd-51ad-bb40783e9b93@suse.de>
Date: Thu, 14 Jul 2022 11:52:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] dma-buf: revert "return only unsignaled fences in
 dma_fence_unwrap_for_each v3"
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 karolina.drobnik@intel.com, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org,
 intel-gfx@lists.freedesktop.org
References: <20220712102849.1562-1-christian.koenig@amd.com>
 <5b8aa549-c2f1-19b2-d0f4-26d4ea1a7ade@suse.de>
 <e3accc2e-75e5-459a-ea72-116e44f73238@amd.com>
 <b16e783a-e7a2-09d5-a8c0-b3b8d18a3e1f@suse.de>
 <25194bfc-4670-02a9-f494-9eab41fd0b74@amd.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <25194bfc-4670-02a9-f494-9eab41fd0b74@amd.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------SNOfH6X9ekLIA00ffPZxeK0J"
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
--------------SNOfH6X9ekLIA00ffPZxeK0J
Content-Type: multipart/mixed; boundary="------------N2thAd21MNs1eSTlKeChtbo2";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 karolina.drobnik@intel.com, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org,
 intel-gfx@lists.freedesktop.org
Message-ID: <b0ee4784-03cb-1bdd-51ad-bb40783e9b93@suse.de>
Subject: Re: [PATCH] dma-buf: revert "return only unsignaled fences in
 dma_fence_unwrap_for_each v3"
References: <20220712102849.1562-1-christian.koenig@amd.com>
 <5b8aa549-c2f1-19b2-d0f4-26d4ea1a7ade@suse.de>
 <e3accc2e-75e5-459a-ea72-116e44f73238@amd.com>
 <b16e783a-e7a2-09d5-a8c0-b3b8d18a3e1f@suse.de>
 <25194bfc-4670-02a9-f494-9eab41fd0b74@amd.com>
In-Reply-To: <25194bfc-4670-02a9-f494-9eab41fd0b74@amd.com>

--------------N2thAd21MNs1eSTlKeChtbo2
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTQuMDcuMjIgdW0gMTE6MTMgc2NocmllYiBDaHJpc3RpYW4gS8O2bmlnOg0K
PiBBbSAxNC4wNy4yMiB1bSAxMTowNiBzY2hyaWViIFRob21hcyBaaW1tZXJtYW5uOg0KPj4g
SGkNCj4+DQo+PiBBbSAxNC4wNy4yMiB1bSAxMDo0OSBzY2hyaWViIENocmlzdGlhbiBLw7Zu
aWc6DQo+Pj4gSGkgVGhvbWFzLA0KPj4+DQo+Pj4gQW0gMTQuMDcuMjIgdW0gMTA6NDAgc2No
cmllYiBUaG9tYXMgWmltbWVybWFubjoNCj4+Pj4gSGkgQ2hyaXN0aWFuDQo+Pj4+DQo+Pj4+
IEFtIDEyLjA3LjIyIHVtIDEyOjI4IHNjaHJpZWIgQ2hyaXN0aWFuIEvDtm5pZzoNCj4+Pj4+
IFRoaXMgcmV2ZXJ0cyBjb21taXQgOGY2MTk3MzcxODQ4NWYzZTg5YmM0ZjQwOGY5MjkwNDhi
N2I0N2M4My4NCj4+Pj4NCj4+Pj4gSSBvbmx5IGZvdW5kIHRoaXMgY29tbWl0IGluIGRybS1t
aXNjLW5leHQuIFNob3VsZCB0aGUgcmV2ZXJ0IGJlIA0KPj4+PiBjaGVycnktcGlja2VkIGlu
dG8gZHJtLW1pc2MtbmV4dC1maXhlcz8NCj4+Pg0KPj4+IHllcyBmb3IgYWxsIHRocmVlIHBh
dGNoZXMgeW91IGp1c3QgcGluZ2VkIG1lLg0KPj4+DQo+Pj4gSSd2ZSBhbHJlYWR5IHRyaWVk
IHRvIHB1c2ggdGhlbSB0byBkcm0tbWlzYy1uZXh0LWZpeGVzLCBidXQgdGhlIA0KPj4+IHBh
dGNoZXMgc29tZWhvdyB3b3VsZG4ndCBhcHBseS4gSSB0aGluayB0aGUgLW5leHQtZml4ZXMg
YnJhbmNoIHdhcyANCj4+PiBzb21laG93IGxhZ2dpbmcgYmVoaW5kLg0KPj4NCj4+IEkganVz
dCBmb3J3YXJkZWQgZHJtLW1pc2MtbmV4dC1maXhlcyB0byB0aGUgbGF0ZXN0IHN0YXRlIG9m
IGRybS1uZXh0LiANCj4+IENoYW5jZXMgYXJlLCB0aGVzZSBwYXRjaGVzIHdpbGwgYXBwbHkg
bm93Lg0KPiANCj4gVGhhbmtzLCBzaG91bGQgSSBjaGVycnkgcGljayB0aGVtIG9yIGFyZSB5
b3UgZ29pbmcgdG8gZG8gaXQ/DQoNClBsZWFzZSBnbyBhaGVhZC4gWW91IGtub3cgYmVzdCB3
aGF0IG5lZWRzIHRvIGJlIHJldmVydGVkLg0KDQo+IA0KPiBBbmQgY2FuIHdlIHNvbWVob3cg
bWFrZSBzdXJlIHRoYXQgd2hlbiB0aGUgZHJtLW1pc2MtbmV4dCBpcyBtZXJnZWQgaW50byAN
Cj4gZHJtLW5leHQgZm9yIHVwc3RyZWFtaW5nIHRoYXQgZHJtLW1pc2MtbmV4dC1maXhlcyBp
cyB1cCB0byBkYXRlIGFzIHdlbGw/IA0KPiBUaGF0IHdvdWxkIG1ha2UgdGhpbmdzIG11Y2gg
ZWFzaWVyLg0KDQpJdCdzIHRoZSBkcm0tbWlzYyBtYWludGFpbmVyJ3Mgam9iOyBtZSBpbiB0
aGlzIGNhc2UuIEkgc2ltcGx5IHdhcyBsYXRlLiANCkkgZG9uJ3Qga25vdyBpZiB0aGlzIHVw
ZGF0ZSBjYW4gYmUgYXV0b21hdGVkLiBGb3IgZXhhbXBsZSwgc3VjaCB0aGF0IGl0IA0KYXV0
b21hdGljYWxseSBtZXJnZXMgZHJtLW5leHQgYmFjayBpbnRvIGRybS1taXNjLW5leHQtZml4
ZXMgYWZlciAtcmM2LiANCkJ1dCBhZ3JlZSB0aGF0IHRoZSB0cmFuc2l0aW9uIHBlcmlvZCBh
cm91bmQgLXJjNiBpcyBhIGJpdCBvZiBhIHByb2JsZW0gDQplYWNoIHRpbWUuDQoNCkJlc3Qg
cmVnYXJkcw0KVGhvbWFzDQoNCj4gDQo+IFRoYW5rcywNCj4gQ2hyaXN0aWFuLg0KPiANCj4+
DQo+PiBCZXN0IHJlZ2FyZHMNCj4+IFRob21hcw0KPj4NCj4+Pg0KPj4+IFRoYW5rcywNCj4+
PiBDaHJpc3RpYW4uDQo+Pj4NCj4+Pj4NCj4+Pj4gQmVzdCByZWdhcmRzDQo+Pj4+IFRob21h
cw0KPj4+Pg0KPj4+Pj4NCj4+Pj4+IEl0IHR1cm5lZCBvdXQgdGhhdCB0aGlzIGlzIG5vdCBj
b3JyZWN0LiBFc3BlY2lhbGx5IHRoZSBzeW5jX2ZpbGUgaW5mbw0KPj4+Pj4gSU9DVEwgbmVl
ZHMgdG8gc2VlIGV2ZW4gc2lnbmFsZWQgZmVuY2VzIHRvIGNvcnJlY3RseSByZXBvcnQgYmFj
ayB0aGVpcg0KPj4+Pj4gc3RhdHVzIHRvIHVzZXJzcGFjZS4NCj4+Pj4+DQo+Pj4+PiBJbnN0
ZWFkIGFkZCB0aGUgZmlsdGVyIGluIHRoZSBtZXJnZSBmdW5jdGlvbiBhZ2FpbiB3aGVyZSBp
dCBtYWtlcyANCj4+Pj4+IHNlbnNlLg0KPj4+Pj4NCj4+Pj4+IFNpZ25lZC1vZmYtYnk6IENo
cmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4NCj4+Pj4+IC0tLQ0K
Pj4+Pj4gwqAgZHJpdmVycy9kbWEtYnVmL2RtYS1mZW5jZS11bndyYXAuYyB8IDMgKystDQo+
Pj4+PiDCoCBpbmNsdWRlL2xpbnV4L2RtYS1mZW5jZS11bndyYXAuaMKgwqAgfCA2ICstLS0t
LQ0KPj4+Pj4gwqAgMiBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDYgZGVsZXRp
b25zKC0pDQo+Pj4+Pg0KPj4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZG1hLWJ1Zi9kbWEt
ZmVuY2UtdW53cmFwLmMgDQo+Pj4+PiBiL2RyaXZlcnMvZG1hLWJ1Zi9kbWEtZmVuY2UtdW53
cmFwLmMNCj4+Pj4+IGluZGV4IDUwMmE2NWVhNmQ0NC4uNzAwMmJjYTc5MmZmIDEwMDY0NA0K
Pj4+Pj4gLS0tIGEvZHJpdmVycy9kbWEtYnVmL2RtYS1mZW5jZS11bndyYXAuYw0KPj4+Pj4g
KysrIGIvZHJpdmVycy9kbWEtYnVmL2RtYS1mZW5jZS11bndyYXAuYw0KPj4+Pj4gQEAgLTcy
LDcgKzcyLDggQEAgc3RydWN0IGRtYV9mZW5jZSANCj4+Pj4+ICpfX2RtYV9mZW5jZV91bndy
YXBfbWVyZ2UodW5zaWduZWQgaW50IG51bV9mZW5jZXMsDQo+Pj4+PiDCoMKgwqDCoMKgIGNv
dW50ID0gMDsNCj4+Pj4+IMKgwqDCoMKgwqAgZm9yIChpID0gMDsgaSA8IG51bV9mZW5jZXM7
ICsraSkgew0KPj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIGRtYV9mZW5jZV91bndyYXBfZm9y
X2VhY2godG1wLCAmaXRlcltpXSwgZmVuY2VzW2ldKQ0KPj4+Pj4gLcKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgKytjb3VudDsNCj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmICgh
ZG1hX2ZlbmNlX2lzX3NpZ25hbGVkKHRtcCkpDQo+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgICsrY291bnQ7DQo+Pj4+PiDCoMKgwqDCoMKgIH0NCj4+Pj4+IMKgIMKg
wqDCoMKgwqAgaWYgKGNvdW50ID09IDApDQo+Pj4+PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9s
aW51eC9kbWEtZmVuY2UtdW53cmFwLmggDQo+Pj4+PiBiL2luY2x1ZGUvbGludXgvZG1hLWZl
bmNlLXVud3JhcC5oDQo+Pj4+PiBpbmRleCAzOTBkZTFlZTlkMzUuLjY2YjFlNTZmYmI4MSAx
MDA2NDQNCj4+Pj4+IC0tLSBhL2luY2x1ZGUvbGludXgvZG1hLWZlbmNlLXVud3JhcC5oDQo+
Pj4+PiArKysgYi9pbmNsdWRlL2xpbnV4L2RtYS1mZW5jZS11bndyYXAuaA0KPj4+Pj4gQEAg
LTQzLDE0ICs0MywxMCBAQCBzdHJ1Y3QgZG1hX2ZlbmNlICpkbWFfZmVuY2VfdW53cmFwX25l
eHQoc3RydWN0IA0KPj4+Pj4gZG1hX2ZlbmNlX3Vud3JhcCAqY3Vyc29yKTsNCj4+Pj4+IMKg
wqAgKiBVbndyYXAgZG1hX2ZlbmNlX2NoYWluIGFuZCBkbWFfZmVuY2VfYXJyYXkgY29udGFp
bmVycyBhbmQgZGVlcCANCj4+Pj4+IGRpdmUgaW50byBhbGwNCj4+Pj4+IMKgwqAgKiBwb3Rl
bnRpYWwgZmVuY2VzIGluIHRoZW0uIElmIEBoZWFkIGlzIGp1c3QgYSBub3JtYWwgZmVuY2Ug
b25seSANCj4+Pj4+IHRoYXQgb25lIGlzDQo+Pj4+PiDCoMKgICogcmV0dXJuZWQuDQo+Pj4+
PiAtICoNCj4+Pj4+IC0gKiBOb3RlIHRoYXQgc2lnbmFsbGVkIGZlbmNlcyBhcmUgb3Bwb3J0
dW5pc3RpY2FsbHkgZmlsdGVyZWQgb3V0LCANCj4+Pj4+IHdoaWNoDQo+Pj4+PiAtICogbWVh
bnMgdGhlIGl0ZXJhdGlvbiBpcyBwb3RlbnRpYWxseSBvdmVyIG5vIGZlbmNlIGF0IGFsbC4N
Cj4+Pj4+IMKgwqAgKi8NCj4+Pj4+IMKgICNkZWZpbmUgZG1hX2ZlbmNlX3Vud3JhcF9mb3Jf
ZWFjaChmZW5jZSwgY3Vyc29yLCBoZWFkKcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXA0KPj4+
Pj4gwqDCoMKgwqDCoCBmb3IgKGZlbmNlID0gZG1hX2ZlbmNlX3Vud3JhcF9maXJzdChoZWFk
LCBjdXJzb3IpOyBmZW5jZTvCoMKgwqAgXA0KPj4+Pj4gLcKgwqDCoMKgwqDCoMKgwqAgZmVu
Y2UgPSBkbWFfZmVuY2VfdW53cmFwX25leHQoY3Vyc29yKSkgXA0KPj4+Pj4gLcKgwqDCoMKg
wqDCoMKgIGlmICghZG1hX2ZlbmNlX2lzX3NpZ25hbGVkKGZlbmNlKSkNCj4+Pj4+ICvCoMKg
wqDCoMKgwqDCoMKgIGZlbmNlID0gZG1hX2ZlbmNlX3Vud3JhcF9uZXh0KGN1cnNvcikpDQo+
Pj4+PiDCoCDCoCBzdHJ1Y3QgZG1hX2ZlbmNlICpfX2RtYV9mZW5jZV91bndyYXBfbWVyZ2Uo
dW5zaWduZWQgaW50IA0KPj4+Pj4gbnVtX2ZlbmNlcywNCj4+Pj4+IMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3QgZG1hX2ZlbmNlICoq
ZmVuY2VzLA0KPj4+Pg0KPj4+DQo+Pg0KPiANCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0K
R3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2Vy
bWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihI
UkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYN
Cg==

--------------N2thAd21MNs1eSTlKeChtbo2--

--------------SNOfH6X9ekLIA00ffPZxeK0J
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmLP50oFAwAAAAAACgkQlh/E3EQov+AI
ShAAnEutwEmlusk6ANL/G5lzQ0iI4KMn8XLLf8PEOr3ESoLmNekMke0kBaVPLSdQatM5ZIjrP0On
O7bHecu27kiTVgz/pDnEQQNPgnJcFrc2VIN/0Gs3AZrEhnSer8oeOCyCZkLQUFIDwaQXF2n1jrVM
Fx9aVKAVpERW+eFjjkm+xqhYkFWtcD5Xy+CDNPlz+s56h+R6xsEkOnjXpl3sbkZXhbS574acRARt
KGpWsU4Ka6x/HiBHE/hktkxempEV7e2WN4v8q0Cu1JvjVpLspfEW5z+x7xP5+jqIT3rGUReXKyoz
Jeg/uoII+ceU+baGRNtmmo+KUtUv7A/pJtPC6V5mFCWVl3xtcInHuGlxcs9I0NksrXyZfu1hxgBy
9y+6F1xmhrTRs4p1gHEkYlszwnx0oodP6RX2M3ERORMCnnbt6LS6l3scJn26uurpuTOtuw6RxvbG
yxFRY8wxOvIkV2Tcr2F+fM6MUkTf+TlhSd2F1TS9Du3NLH5FM7irjtkmsAZlnD9Ito3D2GFeRSKq
JLGdrB2EyngbxjxNEnwojhvKsVixgkMXNqcP2YYmR15fk9iKREoETvHGyi7B3NUVbmm7QcBfeYG+
Vp4B+CzwCGIHZIk9fuSzKYNRQneRJ7qgimxMlZ9hOPKTcYEtz8W4W+x7NMy4Zph8Keq5jvlMP/6p
G3Y=
=3qYY
-----END PGP SIGNATURE-----

--------------SNOfH6X9ekLIA00ffPZxeK0J--
