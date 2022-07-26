Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 04410580E2E
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jul 2022 09:46:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7431E10E53E;
	Tue, 26 Jul 2022 07:46:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF7D010E19E;
 Tue, 26 Jul 2022 07:46:42 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B03FE1FA37;
 Tue, 26 Jul 2022 07:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1658821600; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vUFDxQBrHTFiLqs1EXBJGueNd761cI2ghNoeDs/5BOs=;
 b=urBc2eyAIWHjtfpOWFGRjyAIac+T9ULXzYXPCyK2p5M6nhhKL2BD5xBwlFkBLVx/7mHlzA
 Ti2PiYKfVLHQGJmJ1d+y6W8oOexbT3MUV1/HK4m5Im15oIlGboblvHY0LOa7jLA+o8eCB5
 lMfTY4Zlux1fAOmAWoCdjDgIVXb9TgU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1658821600;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vUFDxQBrHTFiLqs1EXBJGueNd761cI2ghNoeDs/5BOs=;
 b=ISbUsaPlFXuAIv36SIUyjKvwzteSkuWJQA86ePX522Apmi6UWswSL0dN+QguxOrxE91B1X
 QRpiTrJWZknwkrCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8609613322;
 Tue, 26 Jul 2022 07:46:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id uBh0H+Cb32KqcgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 26 Jul 2022 07:46:40 +0000
Message-ID: <d78e0eab-74b8-443b-950a-7adaf963e595@suse.de>
Date: Tue, 26 Jul 2022 09:46:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/3] Revert "drm/amdgpu: move internal vram_mgr function
 into the C file"
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20220708093047.492662-1-Arunpravin.PaneerSelvam@amd.com>
 <a56afc27-3556-38ea-0d10-f7069091967e@suse.de>
 <476c4e58-ba0c-0736-2618-e7899dd5b60f@linux.intel.com>
 <ceba1244-33a8-9b74-6379-4d0569ca9bdb@amd.com>
 <b7b44b45-4143-963c-3279-87bdc6f727c1@suse.de>
 <3b66f6fe-422a-62e9-ff55-74d9f631d6e3@linux.intel.com>
 <3897e61d-6e30-8626-aac0-4ac1ef9957c2@gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <3897e61d-6e30-8626-aac0-4ac1ef9957c2@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------6eS9w77QuD4th14vDKPnVU8v"
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
Cc: alexander.deucher@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------6eS9w77QuD4th14vDKPnVU8v
Content-Type: multipart/mixed; boundary="------------w0nHKuIZmxu89EvWjLDU0kAy";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Cc: alexander.deucher@amd.com
Message-ID: <d78e0eab-74b8-443b-950a-7adaf963e595@suse.de>
Subject: Re: [PATCH 1/3] Revert "drm/amdgpu: move internal vram_mgr function
 into the C file"
References: <20220708093047.492662-1-Arunpravin.PaneerSelvam@amd.com>
 <a56afc27-3556-38ea-0d10-f7069091967e@suse.de>
 <476c4e58-ba0c-0736-2618-e7899dd5b60f@linux.intel.com>
 <ceba1244-33a8-9b74-6379-4d0569ca9bdb@amd.com>
 <b7b44b45-4143-963c-3279-87bdc6f727c1@suse.de>
 <3b66f6fe-422a-62e9-ff55-74d9f631d6e3@linux.intel.com>
 <3897e61d-6e30-8626-aac0-4ac1ef9957c2@gmail.com>
In-Reply-To: <3897e61d-6e30-8626-aac0-4ac1ef9957c2@gmail.com>

--------------w0nHKuIZmxu89EvWjLDU0kAy
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjUuMDcuMjIgdW0gMTk6MTQgc2NocmllYiBDaHJpc3RpYW4gS8O2bmlnOg0K
PiBBbSAyNS4wNy4yMiB1bSAxNzoyNyBzY2hyaWViIFR2cnRrbyBVcnN1bGluOg0KPj4NCj4+
IE9uIDI0LzA3LzIwMjIgMTk6MjgsIFRob21hcyBaaW1tZXJtYW5uIHdyb3RlOg0KPj4+IEhp
DQo+Pj4NCj4+PiBBbSAyMi4wNy4yMiB1bSAxNzo0NyBzY2hyaWViIENocmlzdGlhbiBLw7Zu
aWc6DQo+Pj4+IEhpIFR2cnRrbywNCj4+Pj4NCj4+Pj4gc2NyYXRjaGluZyBteSBoZWFkIHdo
YXQgZXhhY3RseSBpcyBnb2luZyBvbiBoZXJlLg0KPj4+Pg0KPj4+PiBJJ3ZlIGJ1aWxkIHRl
c3RlZCBkcm0tdGlwIGEgY291cGxlIG9mIHRlc3QgaW4gdGhlIGxhc3Qgd2VlayBhbmQgaXQg
DQo+Pj4+IGFsd2F5cyB3b3JrZWQgZmxhd2xlc3NseS4NCj4+Pj4NCj4+Pj4gSXQgbG9va3Mg
bGlrZSB0aGF0IHNvbWUgY29uZmxpY3QgcmVzb2x1dGlvbiBpcyBzb21ldGltZXMgbm90IGFw
cGxpZWQgDQo+Pj4+IGNvcnJlY3RseSwgYnV0IEkgaGF2ZSBubyBpZGVhIHdoeS4NCj4+Pg0K
Pj4+IEl0IHdvcmtlZCBsYXN0IHdlZWssIGJ1dCBtdXN0IGhhdmUgYmVlbiByZWludHJvZHVj
ZWQgbWVhbmh3aWxlLg0KPj4+IFBsZWFzZSBmZXRjaCB0aGUgbGF0ZXN0IGRybS10aXAgYW5k
IHJlYnVpbGQuIFRoZSBhdHRhY2hlZCBjb25maWcgDQo+Pj4gcHJvZHVjZXMgdGhlIGVycm9y
IG9uIG15IHN5c3RlbS4NCj4+DQo+PiBXaGF0IGlzIHRoZSBzdGF0dXMgd2l0aCB0aGlzPyBJ
IGhpdCBhIGNvbmZsaWN0IG9uIGFuIGltcGxpY2F0ZWQgZmlsZSANCj4+IGp1c3Qgbm93IHRy
eWluZyB0byByZWJ1aWxkIGRybS10aXA6DQo+Pg0KPj4gVW5tZXJnZWQgcGF0aHM6DQo+PiDC
oCAodXNlICJnaXQgYWRkL3JtIDxmaWxlPi4uLiIgYXMgYXBwcm9wcmlhdGUgdG8gbWFyayBy
ZXNvbHV0aW9uKQ0KPj4gwqDCoMKgwqDCoMKgwqAgZGVsZXRlZCBieSB1czogZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZyYW1fbWdyLmgNCj4+DQo+PiBJIGhhZCBhbiBv
dGhlciBpOTE1IGNvbmZsaWN0IHRvIHNvbHZlIGFuZCBhcyBncmVwIGFtZGdwdV92cmFtX21n
ci5oIA0KPj4gZHJpdmVycy9ncHUvZHJtL2FtZCBwcm9kdWNlZCBub3RoaW5nIEkganVzdCBk
aWQgYSBnaXQgcm0gb24gaXQgYW5kIA0KPj4gcHVzaGVkIHRoZSByZXNvbHV0aW9uLg0KPj4N
Cj4+IExldCBtZSBrbm93IGlmIEkgYnJva2Ugc29tZXRoaW5nLCByZS1icm9rZSBzb21ldGhp
bmcsIG9yIHdoYXRldmVyLi4gDQo+PiBCdWlsZCBvZiBhbWRncHUgY2VydGFpbmx5IHN0aWxs
IGxvb2tzIGJyb2tlbiBvbiBteSBlbmQsIGJvdGggYmVmb3JlIA0KPj4gYW5kIGFmdGVyIG1l
IHJlYnVpbGRpbmcgZHJtLXRpcCBzbyBtYXliZSBJIGp1c3QgcHJlc2VydmVkIHRoZSBicmVh
a2FnZS4NCj4gDQo+IEl0IGxvb2tzIGxpa2UgdGhhdCBzb21laG93IHJlLWJyb2tlLCBidXQg
SSdtIG5vdCBzdXJlIGhvdy4NCj4gDQo+IEkndmUgZmV0Y2hlZCBkcm0tdGlwIG9uIEZyaWRh
eSBhdCBhcm91bmQgMXBtIENFVCBhbmQgYnVpbGQgaXQgYW5kIHRoYXQgDQo+IHdvcmtlZCBw
ZXJmZWN0bHkgZmluZS4NCj4gDQo+IEVzc2VudGlhbGx5IHRoZSBzdGF0dXMgb2YgZHJtLW1p
c2MtbmV4dCBmb3IgdGhlIGZvbGxvd2luZyBmaWxlcyBzaG91bGQgDQo+IGJlIGNhcnJpZWQg
b24gaW4gZHJtLXRpcDoNCj4gDQo+IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV90dG0uaA0KPiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmVzX2N1cnNv
ci5oDQo+IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92cmFtX21nci5jDQo+
IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92cmFtX21nci5oDQoNCkkndmUg
cmVzZXQgdGhlc2UgZmlsZXMgdG8gdGhlaXIgc3RhdGUgYXMgaW4gZHJtLW1pc2MtbmV4dCBh
bmQgdXBkYXRlZCANCmRybS10aXAuIEl0IGFwcGVhcnMgdG8gYmUgd29ya2luZyBhZ2FpbiBm
cm9tIHdoYXQgSSBjb3VsZCB0ZXN0IGxvY2FsbHkuIA0KUGxlYXNlIHRyeSBhdCB5b3VyIGVh
cmxpZXN0IGNvbnZlbmllbmNlLg0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQo+IA0KPiBS
ZWdhcmRzLA0KPiBDaHJpc3RpYW4uDQo+IA0KPj4NCj4+IFJlZ2FyZHMsDQo+Pg0KPj4gVHZy
dGtvDQo+Pg0KPj4+DQo+Pj4gQmVzdCByZWdhcmRzDQo+Pj4gVGhvbWFzDQo+Pj4NCj4+Pj4N
Cj4+Pj4gUmVnYXJkcywNCj4+Pj4gQ2hyaXN0aWFuLg0KPj4+Pg0KPj4+PiBBbSAyMi4wNy4y
MiB1bSAxNjo0NiBzY2hyaWViIFR2cnRrbyBVcnN1bGluOg0KPj4+Pj4NCj4+Pj4+IE9uIDE0
LzA3LzIwMjIgMDk6NDUsIFRob21hcyBaaW1tZXJtYW5uIHdyb3RlOg0KPj4+Pj4+IEhpDQo+
Pj4+Pj4NCj4+Pj4+PiBBbSAwOC4wNy4yMiB1bSAxMTozMCBzY2hyaWViIEFydW5wcmF2aW4g
UGFuZWVyIFNlbHZhbToNCj4+Pj4+Pj4gVGhpcyByZXZlcnRzIGNvbW1pdCA3MDhkMTlkOWYz
NjI3NjYxNDdjYWI3OWVjY2FlNjA5MTJjNmQzMDY4Lg0KPj4+Pj4+DQo+Pj4+Pj4gVGhpcyBj
b21taXQgaXMgb25seSBwcmVzZW50IGluIGRybS1taXNjLW5leHQuIFNob3VsZCB0aGUgcmV2
ZXJ0IGJlIA0KPj4+Pj4+IGNoZXJyeS1waWNrZWQgaW50byBkcm0tbWlzYy1uZXh0LWZpeGVz
Pw0KPj4+Pj4NCj4+Pj4+IFNlZW1lZCBsaWtlIGFuIGFwcHJvcHJpYXRlIHRocmVhZCB0byBy
YWlzZSB0aGlzLCBpbiBjYXNlIG15IHBpbmdzIA0KPj4+Pj4gYWJvdXQgaXQgb24gI2RyaS1k
ZXZlbCBhbmQgI3JhZGVvbiBnbyB1bi1ub3RpY2VkIHNpbmNlIGl0IGlzIEZyaWRheSANCj4+
Pj4+IGFmdGVyIGFsbC4NCj4+Pj4+DQo+Pj4+PiBTbyBmb3IgbWUgZHJpLXRpcCB0b2RheSBm
YWlscyB0byBidWlsZCB0aGUgYW1kZ3B1IGRyaXZlci4NCj4+Pj4+DQo+Pj4+PiBJIGhhZCB0
byByZXZlcnQgOTI1YjZlNTkxMzhjZWZhNDcyNzVjNjc4OTFjNjVkNDhkMzI2NmQ1NyB0byBt
YWtlIGl0IA0KPj4+Pj4gYnVpbGQuIFRoaXMgY29uZmxpY3RzIGEgYml0IGJ1dCBzZWVtcyB0
cml2aWFsLiBXaXRob3V0IHRoaXMgcmV2ZXJ0IA0KPj4+Pj4gY29kZSBzZWVtcyBjb25mdXNl
ZCB3aXRoIGRpZmZlcmVudCB2ZXJzaW9ucyBvZiBzdHJ1Y3QgDQo+Pj4+PiBhbWRncHVfdnJh
bV9tZ3IgYW5kIGJ1aWxkIGZhaWxzIHZpb2xlbnRseSAoaW5jcmVhc2UgeW91ciBzY3JvbGwg
DQo+Pj4+PiBiYWNrIGJ1ZmZlcnMgdG8gc2VlIGl0IGFsbCkuDQo+Pj4+Pg0KPj4+Pj4gUmVn
YXJkcywNCj4+Pj4+DQo+Pj4+PiBUdnJ0a28NCj4+Pj4+DQo+Pj4+Pj4gQmVzdCByZWdhcmRz
DQo+Pj4+Pj4gVGhvbWFzDQo+Pj4+Pj4NCj4+Pj4+Pj4NCj4+Pj4+Pj4gVGhpcyBpcyBwYXJ0
IG9mIGEgcmV2ZXJ0IG9mIHRoZSBmb2xsb3dpbmcgY29tbWl0czoNCj4+Pj4+Pj4gY29tbWl0
IDcwOGQxOWQ5ZjM2MiAoImRybS9hbWRncHU6IG1vdmUgaW50ZXJuYWwgdnJhbV9tZ3IgZnVu
Y3Rpb24gDQo+Pj4+Pj4+IGludG8gdGhlIEMgZmlsZSIpDQo+Pj4+Pj4+IGNvbW1pdCA1ZTNm
MWU3NzI5ZWMgKCJkcm0vYW1kZ3B1OiBmaXggc3RhcnQgY2FsY3VsYXRpb24gaW4gDQo+Pj4+
Pj4+IGFtZGdwdV92cmFtX21ncl9uZXciKQ0KPj4+Pj4+PiBjb21taXQgYzljYWQ5MzdjMGM1
ICgiZHJtL2FtZGdwdTogYWRkIGRybSBidWRkeSBzdXBwb3J0IHRvIGFtZGdwdSIpDQo+Pj4+
Pj4+DQo+Pj4+Pj4+IFtXSFldDQo+Pj4+Pj4+IEZldyB1c2VycyByZXBvcnRlZCBnYXJiYWdl
ZCBncmFwaGljcyBhcyBzb29uIGFzIHggc3RhcnRzLA0KPj4+Pj4+PiByZXZlcnRpbmcgdW50
aWwgdGhpcyBjYW4gYmUgcmVzb2x2ZWQuDQo+Pj4+Pj4+DQo+Pj4+Pj4+IFNpZ25lZC1vZmYt
Ynk6IEFydW5wcmF2aW4gUGFuZWVyIFNlbHZhbSANCj4+Pj4+Pj4gPEFydW5wcmF2aW4uUGFu
ZWVyU2VsdmFtQGFtZC5jb20+DQo+Pj4+Pj4+IC0tLQ0KPj4+Pj4+PiDCoCBkcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdnJhbV9tZ3IuYyB8IDI5IA0KPj4+Pj4+PiAtLS0t
LS0tLS0tLS0tLS0tLS0tLQ0KPj4+Pj4+PiDCoCBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfdnJhbV9tZ3IuaCB8IDI3IA0KPj4+Pj4+PiArKysrKysrKysrKysrKysrKysN
Cj4+Pj4+Pj4gwqAgMiBmaWxlcyBjaGFuZ2VkLCAyNyBpbnNlcnRpb25zKCspLCAyOSBkZWxl
dGlvbnMoLSkNCj4+Pj4+Pj4NCj4+Pj4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV92cmFtX21nci5jIA0KPj4+Pj4+PiBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92cmFtX21nci5jDQo+Pj4+Pj4+IGluZGV4IDdhNWU4
YTdiNGExYi4uNTFkOWQzYTQ0NTZjIDEwMDY0NA0KPj4+Pj4+PiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdnJhbV9tZ3IuYw0KPj4+Pj4+PiArKysgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdnJhbV9tZ3IuYw0KPj4+Pj4+PiBAQCAt
NTAsMzUgKzUwLDYgQEAgdG9fYW1kZ3B1X2RldmljZShzdHJ1Y3QgYW1kZ3B1X3ZyYW1fbWdy
ICptZ3IpDQo+Pj4+Pj4+IMKgwqDCoMKgwqAgcmV0dXJuIGNvbnRhaW5lcl9vZihtZ3IsIHN0
cnVjdCBhbWRncHVfZGV2aWNlLCBtbWFuLnZyYW1fbWdyKTsNCj4+Pj4+Pj4gwqAgfQ0KPj4+
Pj4+PiAtc3RhdGljIGlubGluZSBzdHJ1Y3QgZHJtX2J1ZGR5X2Jsb2NrICoNCj4+Pj4+Pj4g
LWFtZGdwdV92cmFtX21ncl9maXJzdF9ibG9jayhzdHJ1Y3QgbGlzdF9oZWFkICpsaXN0KQ0K
Pj4+Pj4+PiAtew0KPj4+Pj4+PiAtwqDCoMKgIHJldHVybiBsaXN0X2ZpcnN0X2VudHJ5X29y
X251bGwobGlzdCwgc3RydWN0IA0KPj4+Pj4+PiBkcm1fYnVkZHlfYmxvY2ssIGxpbmspOw0K
Pj4+Pj4+PiAtfQ0KPj4+Pj4+PiAtDQo+Pj4+Pj4+IC1zdGF0aWMgaW5saW5lIGJvb2wgYW1k
Z3B1X2lzX3ZyYW1fbWdyX2Jsb2Nrc19jb250aWd1b3VzKHN0cnVjdCANCj4+Pj4+Pj4gbGlz
dF9oZWFkICpoZWFkKQ0KPj4+Pj4+PiAtew0KPj4+Pj4+PiAtwqDCoMKgIHN0cnVjdCBkcm1f
YnVkZHlfYmxvY2sgKmJsb2NrOw0KPj4+Pj4+PiAtwqDCoMKgIHU2NCBzdGFydCwgc2l6ZTsN
Cj4+Pj4+Pj4gLQ0KPj4+Pj4+PiAtwqDCoMKgIGJsb2NrID0gYW1kZ3B1X3ZyYW1fbWdyX2Zp
cnN0X2Jsb2NrKGhlYWQpOw0KPj4+Pj4+PiAtwqDCoMKgIGlmICghYmxvY2spDQo+Pj4+Pj4+
IC3CoMKgwqDCoMKgwqDCoCByZXR1cm4gZmFsc2U7DQo+Pj4+Pj4+IC0NCj4+Pj4+Pj4gLcKg
wqDCoCB3aGlsZSAoaGVhZCAhPSBibG9jay0+bGluay5uZXh0KSB7DQo+Pj4+Pj4+IC3CoMKg
wqDCoMKgwqDCoCBzdGFydCA9IGFtZGdwdV92cmFtX21ncl9ibG9ja19zdGFydChibG9jayk7
DQo+Pj4+Pj4+IC3CoMKgwqDCoMKgwqDCoCBzaXplID0gYW1kZ3B1X3ZyYW1fbWdyX2Jsb2Nr
X3NpemUoYmxvY2spOw0KPj4+Pj4+PiAtDQo+Pj4+Pj4+IC3CoMKgwqDCoMKgwqDCoCBibG9j
ayA9IGxpc3RfZW50cnkoYmxvY2stPmxpbmsubmV4dCwgc3RydWN0IA0KPj4+Pj4+PiBkcm1f
YnVkZHlfYmxvY2ssIGxpbmspOw0KPj4+Pj4+PiAtwqDCoMKgwqDCoMKgwqAgaWYgKHN0YXJ0
ICsgc2l6ZSAhPSBhbWRncHVfdnJhbV9tZ3JfYmxvY2tfc3RhcnQoYmxvY2spKQ0KPj4+Pj4+
PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gZmFsc2U7DQo+Pj4+Pj4+IC3CoMKg
wqAgfQ0KPj4+Pj4+PiAtDQo+Pj4+Pj4+IC3CoMKgwqAgcmV0dXJuIHRydWU7DQo+Pj4+Pj4+
IC19DQo+Pj4+Pj4+IC0NCj4+Pj4+Pj4gLQ0KPj4+Pj4+PiAtDQo+Pj4+Pj4+IMKgIC8qKg0K
Pj4+Pj4+PiDCoMKgICogRE9DOiBtZW1faW5mb192cmFtX3RvdGFsDQo+Pj4+Pj4+IMKgwqAg
Kg0KPj4+Pj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X3ZyYW1fbWdyLmggDQo+Pj4+Pj4+IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X3ZyYW1fbWdyLmgNCj4+Pj4+Pj4gaW5kZXggNGIyNjdiZjFjNWRiLi45YTJkYjg3
MTg2YzcgMTAwNjQ0DQo+Pj4+Pj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV92cmFtX21nci5oDQo+Pj4+Pj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV92cmFtX21nci5oDQo+Pj4+Pj4+IEBAIC01Myw2ICs1MywzMyBAQCBz
dGF0aWMgaW5saW5lIHU2NCANCj4+Pj4+Pj4gYW1kZ3B1X3ZyYW1fbWdyX2Jsb2NrX3NpemUo
c3RydWN0IGRybV9idWRkeV9ibG9jayAqYmxvY2spDQo+Pj4+Pj4+IMKgwqDCoMKgwqAgcmV0
dXJuIFBBR0VfU0laRSA8PCBkcm1fYnVkZHlfYmxvY2tfb3JkZXIoYmxvY2spOw0KPj4+Pj4+
PiDCoCB9DQo+Pj4+Pj4+ICtzdGF0aWMgaW5saW5lIHN0cnVjdCBkcm1fYnVkZHlfYmxvY2sg
Kg0KPj4+Pj4+PiArYW1kZ3B1X3ZyYW1fbWdyX2ZpcnN0X2Jsb2NrKHN0cnVjdCBsaXN0X2hl
YWQgKmxpc3QpDQo+Pj4+Pj4+ICt7DQo+Pj4+Pj4+ICvCoMKgwqAgcmV0dXJuIGxpc3RfZmly
c3RfZW50cnlfb3JfbnVsbChsaXN0LCBzdHJ1Y3QgDQo+Pj4+Pj4+IGRybV9idWRkeV9ibG9j
aywgbGluayk7DQo+Pj4+Pj4+ICt9DQo+Pj4+Pj4+ICsNCj4+Pj4+Pj4gK3N0YXRpYyBpbmxp
bmUgYm9vbCBhbWRncHVfaXNfdnJhbV9tZ3JfYmxvY2tzX2NvbnRpZ3VvdXMoc3RydWN0IA0K
Pj4+Pj4+PiBsaXN0X2hlYWQgKmhlYWQpDQo+Pj4+Pj4+ICt7DQo+Pj4+Pj4+ICvCoMKgwqAg
c3RydWN0IGRybV9idWRkeV9ibG9jayAqYmxvY2s7DQo+Pj4+Pj4+ICvCoMKgwqAgdTY0IHN0
YXJ0LCBzaXplOw0KPj4+Pj4+PiArDQo+Pj4+Pj4+ICvCoMKgwqAgYmxvY2sgPSBhbWRncHVf
dnJhbV9tZ3JfZmlyc3RfYmxvY2soaGVhZCk7DQo+Pj4+Pj4+ICvCoMKgwqAgaWYgKCFibG9j
aykNCj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgIHJldHVybiBmYWxzZTsNCj4+Pj4+Pj4gKw0K
Pj4+Pj4+PiArwqDCoMKgIHdoaWxlIChoZWFkICE9IGJsb2NrLT5saW5rLm5leHQpIHsNCj4+
Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgIHN0YXJ0ID0gYW1kZ3B1X3ZyYW1fbWdyX2Jsb2NrX3N0
YXJ0KGJsb2NrKTsNCj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgIHNpemUgPSBhbWRncHVfdnJh
bV9tZ3JfYmxvY2tfc2l6ZShibG9jayk7DQo+Pj4+Pj4+ICsNCj4+Pj4+Pj4gK8KgwqDCoMKg
wqDCoMKgIGJsb2NrID0gbGlzdF9lbnRyeShibG9jay0+bGluay5uZXh0LCBzdHJ1Y3QgDQo+
Pj4+Pj4+IGRybV9idWRkeV9ibG9jaywgbGluayk7DQo+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDC
oCBpZiAoc3RhcnQgKyBzaXplICE9IGFtZGdwdV92cmFtX21ncl9ibG9ja19zdGFydChibG9j
aykpDQo+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiBmYWxzZTsNCj4+
Pj4+Pj4gK8KgwqDCoCB9DQo+Pj4+Pj4+ICsNCj4+Pj4+Pj4gK8KgwqDCoCByZXR1cm4gdHJ1
ZTsNCj4+Pj4+Pj4gK30NCj4+Pj4+Pj4gKw0KPj4+Pj4+PiDCoCBzdGF0aWMgaW5saW5lIHN0
cnVjdCBhbWRncHVfdnJhbV9tZ3JfcmVzb3VyY2UgKg0KPj4+Pj4+PiDCoCB0b19hbWRncHVf
dnJhbV9tZ3JfcmVzb3VyY2Uoc3RydWN0IHR0bV9yZXNvdXJjZSAqcmVzKQ0KPj4+Pj4+PiDC
oCB7DQo+Pj4+Pj4NCj4+Pj4NCj4+Pg0KPiANCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0K
R3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2Vy
bWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihI
UkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYN
Cg==

--------------w0nHKuIZmxu89EvWjLDU0kAy--

--------------6eS9w77QuD4th14vDKPnVU8v
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmLfm+AFAwAAAAAACgkQlh/E3EQov+CY
Mw//W6iMhf2xlhGdhbkpW9CXePHi6y2pZ7vHq5MCybOOG9nphX0/zd0o3l7Vix5HFoIHnV45uS1W
336Q7HzSBl1vbUilqcdz3EpkrxYvlxVFPewDQKIvQD9ccBYx75mzujGT8wn3HfCrGQeWHkNI7iW/
TwkDl7X//P9M3MqCeZH28OhJtxVPUT6V+HVibPpFqM9P49ikx1602MHKYB1UfqYASjG7Q+8BNhXj
4bBE6QiS/MKfnuyF/Ka8cO9zFfCX15s6B/x6MkhF3W4bhH0qQje9w5RWSD2+HhcNN0kVsI1wnlTY
mHb3QqLdeuxaczdR5aRDDDDWYqpPkw5gezg8bnZl59LI4hWMEs72G2vqQqyof1qcalnuPhVWzIXw
cECfBTyn/pccP4zAYYs2ey9w/GoP6XGLovbf+Zqo5Q2Na2jLvQNQcPldf93EywVmvekwQJtZuYJq
0e282VX3+IGqNFpt2YzIG8EwwyGz9Ixh0p1T/dIirl3y/28VQrz/5e/m0m+vAMhEMJ16fKIjvuFx
Btz1ClfdkkaU5PaaZElaWeDdk05H1rD0EbBWeMfEeXjYOMQC7ivX4U6eKc9WbYTvC2AGiwe/cSko
cHW/hHiCTRgBHJJSyPNLd6yG8Wlf8YSzLLQF5OrnZfh7Yhr2F57D99YNt9smeITsk5FT9uA9aoeM
k0Y=
=Iusf
-----END PGP SIGNATURE-----

--------------6eS9w77QuD4th14vDKPnVU8v--
