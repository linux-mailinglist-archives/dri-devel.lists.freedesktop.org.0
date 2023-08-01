Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A65976B1B2
	for <lists+dri-devel@lfdr.de>; Tue,  1 Aug 2023 12:26:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23D2810E107;
	Tue,  1 Aug 2023 10:25:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A00510E06E
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Aug 2023 10:25:55 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id BBD0421E45;
 Tue,  1 Aug 2023 10:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1690885553; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uDufCslytMpr3Ozo+7Vr5DMSNm0Gre7QYI8whI2kq9w=;
 b=PyK3Y2Y2O0dnpVBvZyVk28IoGRPRnDEbvWuIrruhqPhpOiduFd8AZOZwY0DcLqeIhRlnTa
 F0+qd+jVJhM7LkYmTVuAAWaFue0R7bkSrFWNQzVLpU3aZSqDQwz6ISh+8DcHxG4MZSQdWK
 sZienK6Z9d54oY0tV6eGo5e4/Cn70UE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1690885553;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uDufCslytMpr3Ozo+7Vr5DMSNm0Gre7QYI8whI2kq9w=;
 b=koJgDKbXeNkQ6CjGsm5c59+z+u0qVHEacETrz7akf5XeD+wo+p2MrQ7gjveF4Dyaw3/n2O
 WBHCqbr0SeXOfUAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9D3C5139BD;
 Tue,  1 Aug 2023 10:25:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 8NRZJbHdyGRtYgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 01 Aug 2023 10:25:53 +0000
Message-ID: <d473e398-37cc-429f-c77a-f3c060d90198@suse.de>
Date: Tue, 1 Aug 2023 12:25:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [PATCH] drm/mgag200: Increase bandwidth for G200se A rev1
Content-Language: en-US
To: Jocelyn Falempe <jfalempe@redhat.com>,
 Roger Sewell <roger.sewell@cantab.net>
References: <20230717133037.25941-1-jfalempe@redhat.com>
 <69a9ee2e-bd03-2a63-6651-0680475d7025@suse.de>
 <4f5d262c-527f-0fa6-45e3-a75aa22fcf0d@suse.de>
 <20230724215746.10928@revelation.broadband>
 <ca6cd674-d268-6210-c66d-4750e28a5c77@suse.de>
 <20230725223127.4184@revelation.broadband>
 <9c8a0a5f-fd7f-cf6d-7e6e-ca90bdf957c5@suse.de>
 <20230727223438.4658@revelation.broadband>
 <d5156750-34d4-87dc-41ff-f3c3ca1f48c3@suse.de>
 <3ff67cb3-c477-b834-3d6c-4eb99952d59b@redhat.com>
 <20230728131253.5411@revelation.broadband>
 <548751aa-6184-a5b0-2b90-d96ca04a8640@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <548751aa-6184-a5b0-2b90-d96ca04a8640@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------2jLcYvueY8FllnVOnyP6co6R"
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
Cc: airlied@redhat.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------2jLcYvueY8FllnVOnyP6co6R
Content-Type: multipart/mixed; boundary="------------FCkJxX6nBZrPb8qhQ7jXSgha";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Jocelyn Falempe <jfalempe@redhat.com>,
 Roger Sewell <roger.sewell@cantab.net>
Cc: airlied@redhat.com, dri-devel@lists.freedesktop.org
Message-ID: <d473e398-37cc-429f-c77a-f3c060d90198@suse.de>
Subject: Re: [PATCH] drm/mgag200: Increase bandwidth for G200se A rev1
References: <20230717133037.25941-1-jfalempe@redhat.com>
 <69a9ee2e-bd03-2a63-6651-0680475d7025@suse.de>
 <4f5d262c-527f-0fa6-45e3-a75aa22fcf0d@suse.de>
 <20230724215746.10928@revelation.broadband>
 <ca6cd674-d268-6210-c66d-4750e28a5c77@suse.de>
 <20230725223127.4184@revelation.broadband>
 <9c8a0a5f-fd7f-cf6d-7e6e-ca90bdf957c5@suse.de>
 <20230727223438.4658@revelation.broadband>
 <d5156750-34d4-87dc-41ff-f3c3ca1f48c3@suse.de>
 <3ff67cb3-c477-b834-3d6c-4eb99952d59b@redhat.com>
 <20230728131253.5411@revelation.broadband>
 <548751aa-6184-a5b0-2b90-d96ca04a8640@redhat.com>
In-Reply-To: <548751aa-6184-a5b0-2b90-d96ca04a8640@redhat.com>

--------------FCkJxX6nBZrPb8qhQ7jXSgha
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDEuMDguMjMgdW0gMTI6MTEgc2NocmllYiBKb2NlbHluIEZhbGVtcGU6DQo+
IE9uIDI4LzA3LzIwMjMgMTQ6MTIsIFJvZ2VyIFNld2VsbCB3cm90ZToNCj4+DQo+PiBUaG9t
YXMsIEpvY2VseW4sDQo+Pg0KPj4gSkY+IEkgdGhpbmsgdGhlIGN1bHByaXQgaXMgcHJvYmFi
bHkgdGhpcyBwYXRjaDoNCj4+IEpGPiBodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5v
cmcvcGF0Y2gvNDg2MjQyLw0KPj4gSkY+DQo+PiBKRj4gYmVmb3JlIHRoaXMgcGF0Y2gsDQo+
PiBKRj4gbWdhZzIwMF9zaW1wbGVfZGlzcGxheV9waXBlX21vZGVfdmFsaWQoKSBhbHdheXMg
cmV0dXJuIE1PREVfT0sNCj4+IEpGPg0KPj4gSkY+IGFmdGVyIHRoaXMgcGF0Y2gsIGl0IGNo
ZWNrcyB0aGUgYmFuZHdpZHRoIGxpbWl0IHRvby4NCj4+DQo+PiBJdCB0dXJucyBvdXQgdG8g
YmUgbW9yZSBjb21wbGljYXRlZCB0aGFuIHRoYXQgLSBhbmQgSSBzdGlsbCB0aGluayBpdCBp
cw0KPj4gc29tZXRoaW5nIHRvIGRvIHdpdGggaG93IHRoZSB0d28gZnVuY3Rpb25zDQo+PiBt
Z2FnMjAwX3NpbXBsZV9kaXNwbGF5X3BpcGVfbW9kZV92YWxpZCBhbmQNCj4+IG1nYWcyMDBf
bW9kZV9jb25maWdfbW9kZV92YWxpZCBhcmUgbWFkZSBrbm93biB0byB0aGUgcmVzdCBvZiB0
aGUgZHJtDQo+PiBzeXN0ZW0sIGkuZS4gd2hpY2ggc2xvdHMgaW4gdGhlIHZhcmlvdXMgZnVu
Y3Rpb24gc3RydWN0dXJlcyB0aGV5IGFyZSBwdXQNCj4+IGluLg0KPj4NCj4+IEkgYXR0YWNo
IGEgY29udGlndW91cyBleGNlcnB0IGZyb20gL3Zhci9sb2cvbWVzc2FnZXMsIHJlY29yZGlu
ZyB3aGF0DQo+PiBoYXBwZW5lZCB3aGVuIEkgZGlkIHRoZSBmb2xsb3dpbmcuDQo+Pg0KPj4g
MS4gSSBpbnN0cnVtZW50ZWQgdGhlIG9sZCBtZ2FnMjAwIG1vZHVsZSB3aXRoIHByaW50ayBz
dGF0ZW1lbnRzIGluDQo+PiDCoMKgwqAgbWdhZzIwMF9zaW1wbGVfZGlzcGxheV9waXBlX21v
ZGVfdmFsaWQgYW5kIG1nYV92Z2FfbW9kZV92YWxpZCBhbmQNCj4+IMKgwqDCoCBtZ2Ffdmdh
X2NhbGN1bGF0ZV9tb2RlX2JhbmR3aWR0aCwgYW5kIGFsc28gcHV0IGluIGEgY2FsbCB0byB0
aGUNCj4+IMKgwqDCoCBsYXR0ZXIgaW4gbWdhZzIwMF9zaW1wbGVfZGlzcGxheV9waXBlX21v
ZGVfdmFsaWQgc28gdGhhdCBJIGNvdWxkIHNlZQ0KPj4gwqDCoMKgIHdoYXQgcGFyYW1ldGVy
cyBpdCBoYWQgYmVlbiBjYWxsZWQgd2l0aC4gSSB0aGVuIHJlYm9vdGVkIHRoZSBzeXN0ZW0s
DQo+PiDCoMKgwqAgZ2V0dGluZyB0aGUgbWVzc2FnZXMgc3RhcnRpbmcgYXQgSnVsIDI4IDEw
OjQyOjQ1IC4gQXMgeW91IHdpbGwgc2VlLA0KPj4gwqDCoMKgIGFsbW9zdCBldmVyeSB0aW1l
IG1nYWcyMDBfc2ltcGxlX2Rpc3BsYXlfcGlwZV9tb2RlX3ZhbGlkIGlzIGNhbGxlZCBpdA0K
Pj4gwqDCoMKgIGlzIGltbWVkaWF0ZWx5IGZvbGxvd2luZyBhIHJldHVybiBvZiBNT0RFX09L
IGZyb20gbWdhX3ZnYV9tb2RlX3ZhbGlkDQo+PiDCoMKgwqAgd2l0aCB0aGUgc2FtZSBkaXNw
bGF5IHBhcmFtZXRlcnMgLSB0aGUgdHdvIGV4Y2VwdGlvbnMgYXJlOg0KPj4NCj4+IMKgwqDC
oCBhKSBhdCBsaW5lIDExNTYgaXMgd2hlbiBpdCBpcyBjYWxsZWQgYWZ0ZXIgImZiY29uOiBt
Z2FnMjAwZHJtZmIgKGZiMCkNCj4+IMKgwqDCoMKgwqDCoCBpcyBwcmltYXJ5IGRldmljZSIs
IGFuZA0KPj4NCj4+IMKgwqDCoCBiKSB3aXRoIHRoZSBtb2RlIGFjdHVhbGx5IGJlaW5nIHNl
dCAoMTQ0MHg5MDApIGF0IGxpbmUgMjY4MSB3aGVuIGl0DQo+PiDCoMKgwqDCoMKgwqAgb2Yg
Y291cnNlIHJldHVybnMgTU9ERV9PSyAoYXMgdGhhdCBpcyB3aGF0IGl0IGFsd2F5cyByZXR1
cm5zLCBhcw0KPj4gwqDCoMKgwqDCoMKgIHlvdSBzYXkpLg0KPj4NCj4+IDIuIEkgdGhlbiBz
d2l0Y2hlZCB0byB0aGUgbmV3IG1nYWcyMDAgbW9kdWxlIHNpbWlsYXJseSBpbnN0cnVtZW50
ZWQsIGJ1dA0KPj4gwqDCoMKgIHdpdGggdGhlIHVuaXF1ZV9yZXZfaWQgaW5jcmVhc2VkIGJ5
IDEgdG8gZ2V0IHN1ZmZpY2llbnQgYmFuZHdpZHRoIHRvDQo+PiDCoMKgwqAgbWFrZSAxNDQw
eDkwMCB1c2FibGUuIEkgdGhlbiByZWJvb3RlZCB0aGUgc3lzdGVtLCBnZXR0aW5nIHRoZQ0K
Pj4gwqDCoMKgIG1lc3NhZ2VzIHN0YXJ0aW5nIGF0IEp1bCAyOCAxMTo0Njo1MyAuIEFnYWlu
LCBhbG1vc3QgZXZlcnkgdGltZQ0KPj4gwqDCoMKgIG1nYWcyMDBfc2ltcGxlX2Rpc3BsYXlf
cGlwZV9tb2RlX3ZhbGlkIGlzIGNhbGxlZCBpdCBpcyBpbW1lZGlhdGVseQ0KPj4gwqDCoMKg
IGFmdGVyIGEgcmV0dXJuIG9mIE1PREVfT0sgZnJvbSBtZ2FnMjAwX21vZGVfY29uZmlnX21v
ZGVfdmFsaWQsIGFuZCB3ZQ0KPj4gwqDCoMKgIHN0aWxsIGhhdmUgZXhjZXB0aW9uIHR5cGUg
KGEpIGF0IGxpbmUgNTY3Mi4gSG93ZXZlciwgdGhlIGV4Y2VwdGlvbg0KPj4gwqDCoMKgIHR5
cGUgKGIpIGlzIG5vIGxvbmdlciBwcmVzZW50LCBhcyBhdCBsaW5lIDY1OTAsIG9uIHNldHRp
bmcgdGhlDQo+PiDCoMKgwqAgMTQ0MHg5MDAgbW9kZSwgdGhlcmUgaXMgbm93IGEgY2FsbCBv
ZiBtZ2FnMjAwX21vZGVfY29uZmlnX21vZGVfdmFsaWQNCj4+IMKgwqDCoCBwcmVjZWRpbmcg
dGhlIGNhbGwgb2YgbWdhZzIwMF9zaW1wbGVfZGlzcGxheV9waXBlX21vZGVfdmFsaWQuDQo+
Pg0KPj4gMy4gSSB0aGVuIG1vZGlmaWVkIHRoYXQgbWdhZzIwMCBtb2R1bGUgYnkgZm9yY2lu
ZyBhIHJldHVybiBvZiBNT0RFX09LDQo+PiDCoMKgwqAgZnJvbSBtZ2FnMjAwX3NpbXBsZV9k
aXNwbGF5X3BpcGVfbW9kZV92YWxpZCBhbmQgcmVtb3ZpbmcgdGhlDQo+PiDCoMKgwqAgaW5j
cmVtZW50IHRvIHVuaXF1ZV9yZXZfaWQsIHNvIHRoYXQgMTQ0MHg5MDAgaXMgbm8gbG9uZ2Vy
ICJ2YWxpZCINCj4+IMKgwqDCoCBhY2NvcmRpbmcgdG8gdGhlIGNyaXRlcmlhIGJlaW5nIHVz
ZWQuIEkgcmVib290ZWQsIGdldHRpbmcgdGhlDQo+PiDCoMKgwqAgbWVzc2FnZXMgc3RhcnRp
bmcgYXQgSnVsIDI4IDEyOjEyOjM0IC4gTm93IGF0IGxpbmUgMTEwMDQgd2UgaGF2ZSBhDQo+
PiDCoMKgwqAgZmFpbHVyZSB0byBzZXQgbW9kZSBpbW1lZGlhdGVseSBmb2xsb3dlZCBieSBh
IHJldHVybiBvZiBNT0RFX0JBRCwgbm90DQo+PiDCoMKgwqAgZnJvbSBtZ2FnMjAwX3NpbXBs
ZV9kaXNwbGF5X3BpcGVfbW9kZV92YWxpZCBidXQgZnJvbQ0KPj4gwqDCoMKgIG1nYWcyMDBf
bW9kZV9jb25maWdfbW9kZV92YWxpZC4NCj4+DQo+PiBUaHVzIGJldHdlZW4gdGhlIG9sZCBt
Z2FnMjAwIG1vZHVsZSBhbmQgdGhlIG5ldyBvbmUsIHRoZXJlIGlzIGEgY2hhbmdlDQo+PiBp
biB3aGVuIHRoZSBtb2RlX2NvbmZpZ19tb2RlX3ZhbGlkIGZ1bmN0aW9uIGdldHMgY2FsbGVk
IC0gdGhlcmUgYmVpbmcNCj4+IG9uZSBleHRyYSBjYWxsLiBTbyBldmVuIGlmIG9uZSB3ZXJl
IHRvIHJldmVydCB0bw0KPj4gbWdhZzIwMF9zaW1wbGVfZGlzcGxheV9waXBlX21vZGVfdmFs
aWQganVzdCBhbHdheXMgcmV0dXJuaW5nIE1PREVfT0sgaXQNCj4+IHdvdWxkbid0IGZpeCB0
aGUgcHJvYmxlbS4NCj4+DQo+PiBBdCBwcmVzZW50IEkgZG9uJ3Qgc2VlIGhvdyB0aGUgY2hh
bmdlIG9mIGJlaGF2aW91ciBjYW4gYmUgYW55dGhpbmcgb3RoZXINCj4+IHRoYW4gdG8gZG8g
d2l0aCB0aGUgd2F5IHRoZXNlIGZ1bmN0aW9uIG5hbWVzIGFyZSBwYXNzZWQgdG8gdGhlIHJl
c3Qgb2YNCj4+IHRoZSBkcm0gc3lzdGVtICh0aG91Z2ggb2YgY291cnNlIGV2ZW4gaWYgdGhh
dCB3ZXJlIHJldmVydGVkLCB0aGUgZmFjdA0KPj4gdGhhdCBtZ2FnMjAwX3NpbXBsZV9kaXNw
bGF5X3BpcGVfbW9kZV92YWxpZCBub3cgdGVzdHMgYmFuZHdpZHRoIHdvdWxkDQo+PiBzdGls
bCBjYXVzZSB3aGF0IEkgd2FudCB0byBkbyB0byBmYWlsKS4NCj4+DQo+PiBTYWRseSBJIGRv
bid0IHVuZGVyc3RhbmQgaG93IHRoZSBkcm0gc3lzdGVtIHdvcmtzLCBzbyBJJ20gbm90IHN1
cmUgdGhhdA0KPj4gSSBjYW4gc2hlZCBhbnkgbW9yZSBsaWdodCAtIGJ1dCBpZiB0aGVyZSBh
cmUgYW55IG1vcmUgZXhwZXJpbWVudHMgdGhhdA0KPj4gd291bGQgaGVscCwgcGxlYXNlIGRv
IGxldCBtZSBrbm93Lg0KPiANCj4gSSB0aGluayB0aGUgaXNzdWUgaXMgdGhhdCBpbiB2NS4x
OCwgdGhlIG1lbW9yeSBjaGVjayB3YXMgZG9uZSBvbiB0aGUgDQo+IGNvbm5lY3RvciBtb2Rl
X3ZhbGlkKCkgY2FsbGJhY2ssIGFuZCBpbiB2Ni4wLCBpdCdzIGRvbmUgaW4gdGhlIA0KPiBt
b2RlX2NvbmZpZyBtb2RlX3ZhbGlkKCkgY2FsbGJhY2suDQo+IA0KPiBDYW4geW91IHBsZWFz
ZSB0cnkgdGhlIHBhdGNoIGF0dGFjaGVkLCBJIG1vdmVkIHRoZSBiYW5kd2lkdGggY2hlY2sg
YmFjayANCj4gdG8gdGhlIGNvbm5lY3RvciBjYWxsYmFjay4NCg0KSXQgc2hvdWxkIG5vdCBt
YWtlIGRpZmZlcmVuY2UuIEknZCBiZSBzdXJwcmlzZWQgaWYgaXQgZG9lcy4gQW5kIGluIGFu
eSANCmNhc2UsIHRoZSBiYW5kd2lkdGggY2hlY2sgYmVsb25ncyBpbiB0byB0aGUgbW9kZV9j
b25maWcgdGVzdCwgYXMgaXQgaXMgYSANCmRldmljZS13aWRlIGxpbWl0Lg0KDQpGWUkgSSBp
bnRlbmQgdG8gY2xvc2UgdGhpcyBidWcgcmVwb3J0IGFzIElOVkFMSUQuIFRoZSBoYXJkd2Fy
ZSBhbmQgDQpkcml2ZXIgd29yayBhY2NvcmRpbmcgdG8gdGhlIGtub3duIHNwZWNzLCBzbyB0
aGVyZSdzIG5vIGJ1ZyBoZXJlLg0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQo+IA0KPiBC
ZXN0IHJlZ2FyZHMsDQo+IA0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBE
cml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgN
CkZyYW5rZW5zdHJhc3NlIDE0NiwgOTA0NjEgTnVlcm5iZXJnLCBHZXJtYW55DQpHRjogSXZv
IFRvdGV2LCBBbmRyZXcgTXllcnMsIEFuZHJldyBNY0RvbmFsZCwgQm91ZGllbiBNb2VybWFu
DQpIUkIgMzY4MDkgKEFHIE51ZXJuYmVyZykNCg==

--------------FCkJxX6nBZrPb8qhQ7jXSgha--

--------------2jLcYvueY8FllnVOnyP6co6R
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmTI3bAFAwAAAAAACgkQlh/E3EQov+Bl
0g//Xd6FFSKFu2P+YtwLSt8qxj7ytyFPyvs+mCfuf2JRboM76mANYw0JOz0pqRQ59ZC3b07LQ4ay
2gQCz13J44KgijVTQm/D7RByL98nKMhCjURlwpVrDb9sIkEvtOeXrOsiJoZJnIRGfVozWnBmxFXW
s2bNGpCwmRbewArXtfbaBtVGAZgOaEg0xTkKQw7kMIZscZ8lGB9InZuHdfUB/nLdxx+jNmVBxUBq
jedBG3dcT+HrX5Ien6ObHfZ6v3gJavbP/gFpcab6jg0ulbk5aPZAmZwSERLJkK9mOYfvvUxDmWot
+y1dG0LUhqEI7QEB6yLUcMXdce5u2CTAUwCfSHSGcwepQa1TKnTKtQSpcpNhO5eh8LRTYSgr20a2
43cEDgz8z/EzoyJhmByo/i2A1/y3+BqpjT90kfS+4ckTC9ACYGzhu/R69TVrf+p0SGuvxIiz5WWx
+e3g1xv90NOiFQRM8UpOIqPa0Mm84d8GrOctk/PcRzI8gByzC0x8bsZADc6mjyXSzfZE5+Y2I+uN
mL8v4K+7TR7q5xJpEHeWNj0qt6O6IH8Dz/fatDrXT/jfKe+vIXmjP3zOGvH7wsUMWSdWNu/Jw9fO
TPE/sn0dKcbifjejb1CX5aAYIwOdj1DVbW4vsDhqmDauqFwIjx4D9tS0xdCoQkZSY/gBk2aSuthW
7J8=
=kfZV
-----END PGP SIGNATURE-----

--------------2jLcYvueY8FllnVOnyP6co6R--
