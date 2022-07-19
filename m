Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4283F5793F8
	for <lists+dri-devel@lfdr.de>; Tue, 19 Jul 2022 09:19:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB71C10E2D8;
	Tue, 19 Jul 2022 07:19:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C99F210E2D8
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Jul 2022 07:19:02 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 74D7B1F8D0;
 Tue, 19 Jul 2022 07:19:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1658215141; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Pnhkd/04C+oRqNWt4f3v5cEyQFjRdcVmPA8R+h+BFDo=;
 b=rpo8msC7/WkuCVUqEZDrc9OQplKwRzJX97WLsuiNNlZ4r6tssKowMv47pBwdFZFNgqxyNz
 iV6b7X6DSJYYNmcdKfJfvwCErfX7HmBmpgK3MsXyuu9yeb51Oqs6FoY910QssJVMiry9m/
 rcPY9TvNbv2l9P1SsVvXnvJahbvdi9U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1658215141;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Pnhkd/04C+oRqNWt4f3v5cEyQFjRdcVmPA8R+h+BFDo=;
 b=SNHW/ACUoMNZQHgHiiCAFyZCbBUY+HbLQbSjyxyfS8QJ0w+XtFH0VSqmcu97FLXL7U+Id+
 0Oo1JyVtfhXaYMAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 56A1C13A72;
 Tue, 19 Jul 2022 07:19:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id OsEyFOVa1mJaKgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 19 Jul 2022 07:19:01 +0000
Message-ID: <55a2564c-d4fa-dbcc-a33a-3148a7de386c@suse.de>
Date: Tue, 19 Jul 2022 09:19:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/2] drm/ttm: fix locking in vmap/vunmap TTM GEM helpers
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org
References: <20220715111533.467012-1-christian.koenig@amd.com>
 <e71431ef-bcb9-012a-ff0d-4ef350cd232e@suse.de>
 <5bdedd05-3620-5082-1e6f-c3f6bbae9cc5@amd.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <5bdedd05-3620-5082-1e6f-c3f6bbae9cc5@amd.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------opsnTRMI3XNOlr1DpK1liQpc"
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
Cc: dmitry.osipenko@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------opsnTRMI3XNOlr1DpK1liQpc
Content-Type: multipart/mixed; boundary="------------c4j04I06LHEyXdX1Bzrbv0Dk";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org
Cc: dmitry.osipenko@collabora.com
Message-ID: <55a2564c-d4fa-dbcc-a33a-3148a7de386c@suse.de>
Subject: Re: [PATCH 1/2] drm/ttm: fix locking in vmap/vunmap TTM GEM helpers
References: <20220715111533.467012-1-christian.koenig@amd.com>
 <e71431ef-bcb9-012a-ff0d-4ef350cd232e@suse.de>
 <5bdedd05-3620-5082-1e6f-c3f6bbae9cc5@amd.com>
In-Reply-To: <5bdedd05-3620-5082-1e6f-c3f6bbae9cc5@amd.com>

--------------c4j04I06LHEyXdX1Bzrbv0Dk
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTUuMDcuMjIgdW0gMTc6NTggc2NocmllYiBDaHJpc3RpYW4gS8O2bmlnOg0K
PiBBbSAxNS4wNy4yMiB1bSAxNzozNiBzY2hyaWViIFRob21hcyBaaW1tZXJtYW5uOg0KPj4g
SGkNCj4+DQo+PiBBbSAxNS4wNy4yMiB1bSAxMzoxNSBzY2hyaWViIENocmlzdGlhbiBLw7Zu
aWc6DQo+Pj4gSSd2ZSBzdHVtYmxlZCBvdmVyIHRoaXMgd2hpbGUgcmV2aWV3aW5nIHBhdGNo
ZXMgZm9yIERNQS1idWYgYW5kIGl0IGxvb2tzDQo+Pj4gbGlrZSB3ZSBjb21wbGV0ZWx5IG1l
c3NlZCB0aGUgbG9ja2luZyB1cCBoZXJlLg0KPj4+DQo+Pj4gSW4gZ2VuZXJhbCBtb3N0IFRU
TSBmdW5jdGlvbiBzaG91bGQgb25seSBiZSBjYWxsZWQgd2hpbGUgaG9sZGluZyB0aGUNCj4+
PiBhcHByb3ByaWF0ZSBCTyByZXN2IGxvY2suIFdpdGhvdXQgdGhpcyB3ZSBjb3VsZCBicmVh
ayB0aGUgaW50ZXJuYWwNCj4+PiBidWZmZXIgb2JqZWN0IHN0YXRlIGhlcmUuDQo+Pg0KPj4g
SSByZW1lbWJlciB0aGF0IEkgdHJpZWQgdG8gZml4IHRoaXMgYmVmb3JlIGFuZCB5b3UgbWVu
dGlvbmVkIHRoYXQgaXQncyANCj4+IG5vdCBhbGxvd2VkIHRvIGhvbGQgdGhpcyBsb2NrIGhl
cmUuIEl0IHdvdWxkIHBvc3NpYmx5IGRlYWRsb2NrIHdpdGggDQo+PiBleHBvcnRlZCBidWZm
ZXJzLiBEaWQgdGhpcyBjaGFuZ2Ugd2l0aCBEbWl0cnkncyByZXdvcmsgb2YgdGhlIGxvY2tp
bmcgDQo+PiBzZW1hbnRpY3M/DQo+IA0KPiBObywgY2FuIHlvdSBwb2ludCBtZSB0byB0aGF0
Pw0KDQpJIHRob3VnaHQgaXQgd2FzIHNvbWV3aGVyZSBpbiB0aGUgbGVuZ3RoeSBkaXNjdXNz
aW9uIGF0DQoNCiANCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2RyaS1kZXZlbC8yMDIwMTEx
MjEzMjExNy4yNzIyOC0xLXR6aW1tZXJtYW5uQHN1c2UuZGUvDQoNCmJ1dCBub3cgSSBjYW5u
b3QgZmluZCBpdCBhbnkgbG9uZ2VyLiA6Lw0KDQo+IA0KPiBNeSBhc3N1bXB0aW9uIHdhcyB0
aGF0IGRybV9nZW1fdm1hcCgpL3Z1bm1hcCgpIGlzIGFsd2F5cyBjYWxsZWQgd2l0aCB0aGUg
DQo+IGxvY2sgaGVsZCwgYnV0IERtaXRyeSdzIHdvcmsgaXMgbm93IHN1Z2dlc3Rpbmcgb3Ro
ZXJ3aXNlLg0KDQpJSVJDIHRoZSBsb2NrIHdhcyBzdXBwb3NlZCB0byBiZSBoZWxkLCBidXQg
ZXZlcnkgZHJpdmVycyBkb2VzIGl0IA0KZGlmZmVyZW50bHkuIEFuZCBkbWEtYnVmIGxvY2tp
bmcgZXNzZW50aWFsbHkgd29ya2VkIGJ5IGNoYW5jZS4NCg0KQmVzdCByZWdhcmRzDQpUaG9t
YXMNCg0KPiANCj4gV2UgY2VydGFpbmx5IG5lZWQgdG8gaG9sZCB0aGUgbG9jayB3aGVuIHdl
IGNhbGwgdHRtX2JvX3ZtYXAoKS92dW5tYXAoKSANCj4gYmVjYXVzZSBpdCBuZWVkcyB0byBh
Y2Nlc3MgdGhlIGJvLT5yZXNvdXJjZS4NCj4gDQo+IFRoYW5rcywNCj4gQ2hyaXN0aWFuLg0K
PiANCj4+DQo+PiBCZXN0IHJlZ2FyZHMNCj4+IFRob21hcw0KPj4NCj4+Pg0KPj4+IE9ubHkg
Y29tcGlsZSB0ZXN0ZWQhDQo+Pj4NCj4+PiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gS8O2
bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+DQo+Pj4gRml4ZXM6IDQzNjc2NjA1Zjg5
MCBkcm0vdHRtOiBBZGQgdm1hcC92dW5tYXAgdG8gVFRNIGFuZCBUVE0gR0VNIGhlbHBlcnMN
Cj4+PiAtLS0NCj4+PiDCoCBkcml2ZXJzL2dwdS9kcm0vZHJtX2dlbV90dG1faGVscGVyLmMg
fCA5ICsrKysrKysrLQ0KPj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyks
IDEgZGVsZXRpb24oLSkNCj4+Pg0KPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
ZHJtX2dlbV90dG1faGVscGVyLmMgDQo+Pj4gYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2dlbV90
dG1faGVscGVyLmMNCj4+PiBpbmRleCBkNTk2MmEzNGMwMWQuLmU1ZmM4NzU5OTBjNCAxMDA2
NDQNCj4+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2dlbV90dG1faGVscGVyLmMNCj4+
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2dlbV90dG1faGVscGVyLmMNCj4+PiBAQCAt
NjQsOCArNjQsMTMgQEAgaW50IGRybV9nZW1fdHRtX3ZtYXAoc3RydWN0IGRybV9nZW1fb2Jq
ZWN0ICpnZW0sDQo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3QgaW9z
eXNfbWFwICptYXApDQo+Pj4gwqAgew0KPj4+IMKgwqDCoMKgwqAgc3RydWN0IHR0bV9idWZm
ZXJfb2JqZWN0ICpibyA9IGRybV9nZW1fdHRtX29mX2dlbShnZW0pOw0KPj4+ICvCoMKgwqAg
aW50IHJldDsNCj4+PiArDQo+Pj4gK8KgwqDCoCBkbWFfcmVzdl9sb2NrKGdlbS0+cmVzdiwg
TlVMTCk7DQo+Pj4gK8KgwqDCoCByZXQgPSB0dG1fYm9fdm1hcChibywgbWFwKTsNCj4+PiAr
wqDCoMKgIGRtYV9yZXN2X3VubG9jayhnZW0tPnJlc3YpOw0KPj4+IMKgIC3CoMKgwqAgcmV0
dXJuIHR0bV9ib192bWFwKGJvLCBtYXApOw0KPj4+ICvCoMKgwqAgcmV0dXJuIHJldDsNCj4+
PiDCoCB9DQo+Pj4gwqAgRVhQT1JUX1NZTUJPTChkcm1fZ2VtX3R0bV92bWFwKTsNCj4+PiDC
oCBAQCAtODIsNyArODcsOSBAQCB2b2lkIGRybV9nZW1fdHRtX3Z1bm1hcChzdHJ1Y3QgZHJt
X2dlbV9vYmplY3QgKmdlbSwNCj4+PiDCoCB7DQo+Pj4gwqDCoMKgwqDCoCBzdHJ1Y3QgdHRt
X2J1ZmZlcl9vYmplY3QgKmJvID0gZHJtX2dlbV90dG1fb2ZfZ2VtKGdlbSk7DQo+Pj4gwqAg
K8KgwqDCoCBkbWFfcmVzdl9sb2NrKGdlbS0+cmVzdiwgTlVMTCk7DQo+Pj4gwqDCoMKgwqDC
oCB0dG1fYm9fdnVubWFwKGJvLCBtYXApOw0KPj4+ICvCoMKgwqAgZG1hX3Jlc3ZfdW5sb2Nr
KGdlbS0+cmVzdik7DQo+Pj4gwqAgfQ0KPj4+IMKgIEVYUE9SVF9TWU1CT0woZHJtX2dlbV90
dG1fdnVubWFwKTsNCj4+DQo+IA0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGlj
cyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdt
YkgNCk1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0KKEhSQiAzNjgw
OSwgQUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rldg0K

--------------c4j04I06LHEyXdX1Bzrbv0Dk--

--------------opsnTRMI3XNOlr1DpK1liQpc
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmLWWuQFAwAAAAAACgkQlh/E3EQov+AL
BhAArjJ8DiYgbVILDkD/Hksg+4E3545ybt7Fxi7DliORenipCr4TmsAGgT0+FnpaN8J6Ff5rzH4R
IWUywGUWZuf5+SD9XR2oPmwvLZvknEak9on6AEfgmOyR93Xlgign2rG9ja33CqdDSHoHFQ+CmZSw
ED/UD0bAN85wBzG8tBMXoGdgrVmAKzW2GfirD8ZapyREMVwf7Fw7pm7YqYVxSN7zjqFcpVCvfDp4
0xdFjZiIMv7B6WopFqBU20LMlQv1UyHS6B1Hgv1eKoys+XXrrpGUAKQlzzc0sEIL4N9fSDvAwgf/
ej5CCUOMa3IbT3+rPs/vXCGP4nBeM3xj9qkxRblzXi+5WHOc+5O7EwZnJqOpQwLol9aSvulcIGZ7
Sm/uPWtaJiPxCInb6qa2eSJvAv/LXZFy1T3NK+mQAn/o147gcgMvoQl5Zyg5pwdsUuvzvARr3Al+
iJcxO4rvVMC5WxQyXZWgVJcrH779w13kMAnnk/MQICU5n++TzDETX63xxjxYQ928D9v/apxYl3w+
muQUoAwzx2+XTUM871HXCbmMsjMTwML4nD7WLtW9Me8cG3hA5jWfhaFmR1UyTkeqnGb09gClbQhk
SZpkFJt41jTtSebYYBqFD8a2wBAWPXvx1N8g6sZPD+JEDkX2yLD9bFbkhMi51ZUsbj6o1JADNS//
bcQ=
=4mVS
-----END PGP SIGNATURE-----

--------------opsnTRMI3XNOlr1DpK1liQpc--
