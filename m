Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DB046C2DED
	for <lists+dri-devel@lfdr.de>; Tue, 21 Mar 2023 10:34:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F332510E35C;
	Tue, 21 Mar 2023 09:33:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6B4410E35C;
 Tue, 21 Mar 2023 09:33:52 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 998D51FD6A;
 Tue, 21 Mar 2023 09:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1679391231; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=42uwnf0tR+DZ6xGSj2S7FuJC3WSJZsjFVW0rVpfVb8M=;
 b=bB7DK24RSDnm4sUTcMlQfbr+gXII2Oeh+tfR52+K8lfdn0BJtqZtoZnMZCM0gL5x11v1QG
 Ba/aEMhBUscEYy0y7/f/WFHxhGiL2bxvtMt0I0sqofWlGqSV+NUijizssvyt3DVQTY2t2y
 S+rMDU85iqchMGAZw1Mjr5re9bIgV1o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1679391231;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=42uwnf0tR+DZ6xGSj2S7FuJC3WSJZsjFVW0rVpfVb8M=;
 b=/nxm9YKCrmYBlyeuv+wZFcMJ9M66pFjNON/HLAVAaq2g64zgGZoMxSL6QqrE5xIu2wIo06
 aYXHIDy5oY8npcCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6CED213451;
 Tue, 21 Mar 2023 09:33:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 5mKJGf95GWQWDwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 21 Mar 2023 09:33:51 +0000
Message-ID: <55157c5c-69ee-50eb-f5ea-c3b0aebcf948@suse.de>
Date: Tue, 21 Mar 2023 10:33:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 00/10] drm/radeon: Convert fbdev to DRM client
Content-Language: en-US
To: Alex Deucher <alexdeucher@gmail.com>
References: <20230316093738.28866-1-tzimmermann@suse.de>
 <e84bdd5b-6615-33c0-bfff-208d6165a183@amd.com>
 <2d04d39a-ff1c-59b1-acde-4fef5870a260@suse.de>
 <8cc926f5-ccee-b5ea-b217-297829051a7f@gmail.com>
 <1b85517d-1847-a779-2a13-b7cb5c7a592b@suse.de>
 <CADnq5_O-x8EYf0bR9JeJbHtc4P-uomUYdFLQ0CAeHu74Frc4EA@mail.gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <CADnq5_O-x8EYf0bR9JeJbHtc4P-uomUYdFLQ0CAeHu74Frc4EA@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------wmbaYeMnEUhtlcGzgHOTfphw"
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
Cc: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Xinhui.Pan@amd.com, javierm@redhat.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, alexander.deucher@amd.com,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------wmbaYeMnEUhtlcGzgHOTfphw
Content-Type: multipart/mixed; boundary="------------Z73LoQfofDhTkMzVY7Pli6LU";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Alex Deucher <alexdeucher@gmail.com>
Cc: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Xinhui.Pan@amd.com, javierm@redhat.com, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, alexander.deucher@amd.com,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <55157c5c-69ee-50eb-f5ea-c3b0aebcf948@suse.de>
Subject: Re: [PATCH 00/10] drm/radeon: Convert fbdev to DRM client
References: <20230316093738.28866-1-tzimmermann@suse.de>
 <e84bdd5b-6615-33c0-bfff-208d6165a183@amd.com>
 <2d04d39a-ff1c-59b1-acde-4fef5870a260@suse.de>
 <8cc926f5-ccee-b5ea-b217-297829051a7f@gmail.com>
 <1b85517d-1847-a779-2a13-b7cb5c7a592b@suse.de>
 <CADnq5_O-x8EYf0bR9JeJbHtc4P-uomUYdFLQ0CAeHu74Frc4EA@mail.gmail.com>
In-Reply-To: <CADnq5_O-x8EYf0bR9JeJbHtc4P-uomUYdFLQ0CAeHu74Frc4EA@mail.gmail.com>

--------------Z73LoQfofDhTkMzVY7Pli6LU
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjAuMDMuMjMgdW0gMTY6MjMgc2NocmllYiBBbGV4IERldWNoZXI6DQo+IE9u
IE1vbiwgTWFyIDIwLCAyMDIzIGF0IDExOjE54oCvQU0gVGhvbWFzIFppbW1lcm1hbm4gPHR6
aW1tZXJtYW5uQHN1c2UuZGU+IHdyb3RlOg0KPj4NCj4+IEhpDQo+Pg0KPj4gQW0gMjAuMDMu
MjMgdW0gMTY6MTEgc2NocmllYiBDaHJpc3RpYW4gS8O2bmlnOg0KPj4+IEFtIDE3LjAzLjIz
IHVtIDEwOjIwIHNjaHJpZWIgVGhvbWFzIFppbW1lcm1hbm46DQo+Pj4+IEhpIENocmlzdGlh
bg0KPj4+Pg0KPj4+PiBBbSAxNy4wMy4yMyB1bSAwOTo1MyBzY2hyaWViIENocmlzdGlhbiBL
w7ZuaWc6DQo+Pj4+PiBBbSAxNi4wMy4yMyB1bSAxMDozNyBzY2hyaWViIFRob21hcyBaaW1t
ZXJtYW5uOg0KPj4+Pj4+IENvbnZlcnQgcmFkZW9uJ3MgZmJkZXYgY29kZSB0byBkcm1fY2xp
ZW50LiBSZXBsYWNlcyB0aGUgY3VycmVudA0KPj4+Pj4+IGFkLWhvYyBpbnRlZ3JhdGlvbi4g
VGhlIGNvbnZlcnNpb24gaW5jbHVkZXMgYSBudW1iZXIgb2YgY2xlYW51cHMuDQo+Pj4+Pj4g
T25seSBidWlsZCBmYmRldiBzdXBwb3J0IGlmIHRoZSBjb25maWcgb3B0aW9uIGhhcyBiZWVu
IHNldC4NCj4+Pj4+DQo+Pj4+PiBJJ20gdG9ybiBhcGFydCBvbiB0aGF0LiBPbiB0aGUgb25l
IGhhbmQgaXQgbG9va3MgbGlrZSBhIHJlYWxseSBuaWNlDQo+Pj4+PiBjbGVhbnVwIG9uIHRo
ZSBvdGhlciBoYW5kIHdlIGRvbid0IHJlYWxseSB3YW50IHRvIHRvdWNoIHJhZGVvbiBhbnkg
bW9yZS4NCj4+Pj4NCj4+Pj4gSXQncyBhIGRyaXZlciBpbiB0aGUgdXBzdHJlYW0ga2VybmVs
LiBZb3UgaGF2ZSB0byBleHBlY3QgYXQgbGVhc3Qgc29tZQ0KPj4+PiBjaGFuZ2VzLg0KPj4+
DQo+Pj4gU29tZSBjaGFuZ2VzIGlzIG5vdCB0aGUgcHJvYmxlbSwgYnV0IHdlIG5lZWQgYSBq
dXN0aWZpY2F0aW9uIHRvIGNoYW5nZQ0KPj4+IHNvbWV0aGluZy4gSnVzdCB0aGF0IGl0J3Mg
bmljZSB0byBoYXZlIHdvbid0IGRvIGl0IHdpdGhvdXQgZXh0ZW5zaXZlDQo+Pj4gdGVzdGlu
Zy4NCj4+Pg0KPj4+Pg0KPj4+Pj4NCj4+Pj4+IEFsZXggd2hhdCBkbyB5b3UgdGhpbms/IElz
IHRoYXQgd29ydGggdGhlIHJpc2sgb2YgYnJlYWtpbmcgc3R1ZmY/DQo+Pj4+DQo+Pj4+IE1v
dmluZyBhbGwgZmJkZXYgZW11bGF0aW9uIHRvIHN0cnVjdCBkcm1fY2xpZW50IGlzIHJlcXVp
cmVkIGZvciBuZXcNCj4+Pj4gaW4ta2VybmVsIERSTSBjbGllbnRzLCBzdWNoIGFzIGEgRFJN
IGtlcm5lbCBsb2dnZXIgb3IgYSBib290IHNwbGFzaC4NCj4+Pg0KPj4+IFdlbGwgdGhhdCdz
IGEgcmF0aGVyIGdvb2QganVzdGlmaWNhdGlvbi4gSSBzdWdnZXN0IHRvIGFkZCB0aGF0IHRv
IHRoZQ0KPj4+IGNvdmVyLWxldHRlci4NCj4+DQo+PiBPaywgd2lsbCBnbyBpbnRvIGEgcG9z
c2libGUgdjIuIFRoZSBtaWQtdGVybSBwbGFuIGlzIHRvIGNvbnZlcnQgdGhlDQo+PiBmYmRl
diBjb2RlIGluIGFsbCByZW1haW5pbmcgZHJpdmVycyB0byBzdHJ1Y3QgZHJtX2NsaWVudCBh
bmQgcmVtb3ZlIHRoZQ0KPj4gb2xkIGFkLWhvYyBjYWxsYmFja3MuDQo+Pg0KPj4gV2l0aCBz
dHJ1Y3QgZHJtX2NsaWVudCwgd2UgY2FuIHNlbGVjdCBpbi1rZXJuZWwgY2xpZW50cyBhdCBj
b21waWxlIHRpbWUNCj4+IG9yIHJ1bnRpbWUganVzdCBsaWtlIHVzZXJzcGFjZSBjbGllbnRz
LiBJIGd1ZXNzLCB3ZSBjYW4gaGF2ZSBhIGJvb3R1cA0KPj4gc2NyZWVuIGFuZCB0aGVuIHN3
aXRjaCB0byB0aGUgY29uc29sZSBvciB0aGUgRFJNIGxvZ2dlci4gT3IgZ28gZnJvbSBhbnkN
Cj4+IGNsaWVudCB0byB0aGUgbG9nZ2VyIG9uIGtlcm5lbCBwYW5pY3MgKG9yIHNvbWV0aGlu
ZyBsaWtlIHRoYXQpLiBUaGVyZSdzDQo+PiBiZWVuIG9jY2FzaW9uYWwgdGFsayBhYm91dCB1
c2Vyc3BhY2UgY29uc29sZXMsIHdoaWNoIHdvdWxkIHVzZSBzdWNoDQo+PiBmdW5jdGlvbmFs
aXR5Lg0KPiANCj4gUGF0Y2hlcyBsb29rIGdvb2QgdG8gbWUuICBJIGhhdmUgYSBwcmV0dHkg
bGltaXRlZCBzZXQgb2YgSFcgSSBjYW4gdGVzdA0KPiBvbiBzaW5jZSBJIGRvbid0IGhhdmUg
YSBmdW5jdGlvbmFsIEFHUCBzeXN0ZW0gYW55bW9yZSBhbmQgbW9zdCBvZiBteQ0KPiBvbGRl
ciBQQ0llIHJhZGVvbnMgYXJlIHBhY2tlZCB1cCBpbiB0aGUgYXR0aWMuICBGZWVsIGZyZWUg
dG8gYWRkIG15Og0KDQpJJ3ZlIHRlc3RlZCB0aGUgcGF0Y2hlcyB3aXRoIGFuIFI1LWJhc2Vk
IGNhcmQuDQoNCj4gUmV2aWV3ZWQtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNo
ZXJAYW1kLmNvbT4NCj4gdG8gdGhlIHNlcmllcy4NCg0KVGhhbmsgeW91IHNvIG11Y2guIERv
IHlvdSB3YW50IHRvIHRha2UgdGhlIHBhdGNoZXMgaW50byB0aGUgYW1kIHRyZWU/DQoNCkJl
c3QgcmVnYXJkcw0KVGhvbWFzDQoNCj4gDQo+IEFsZXgNCj4gDQo+Pg0KPj4gQmVzdCByZWdh
cmRzDQo+PiBUaG9tYXMNCj4+DQo+Pj4NCj4+PiBSZWdhcmRzLA0KPj4+IENocmlzdGlhbi4N
Cj4+Pg0KPj4+Pg0KPj4+PiBCZXN0IHJlZ2FyZHMNCj4+Pj4gVGhvbWFzDQo+Pj4+DQo+Pj4+
Pg0KPj4+Pj4gQ2hyaXN0aWFuLg0KPj4+Pj4NCj4+Pj4+Pg0KPj4+Pj4+IFRob21hcyBaaW1t
ZXJtYW5uICgxMCk6DQo+Pj4+Pj4gICAgIGRybS9yYWRlb246IE1vdmUgcmFkZW9uX2FsaWdu
X3BpdGNoKCkgbmV4dCB0byBkdW1iLWJ1ZmZlciBoZWxwZXJzDQo+Pj4+Pj4gICAgIGRybS9y
YWRlb246IEltcHJvdmUgZmJkZXYgb2JqZWN0LXRlc3QgaGVscGVyDQo+Pj4+Pj4gICAgIGRy
bS9yYWRlb246IFJlbW92ZSBzdHJ1Y3QgcmFkZW9uX2ZiZGV2DQo+Pj4+Pj4gICAgIGRybS9y
YWRlb246IFJlbW92ZSB0ZXN0IGZvciAhc2NyZWVuX2Jhc2UgaW4gZmJkZXYgcHJvYmluZw0K
Pj4+Pj4+ICAgICBkcm0vcmFkZW9uOiBNb3ZlIGZiZGV2IG9iamVjdCBoZWxwZXJzIGJlZm9y
ZSBzdHJ1Y3QgZmJfb3BzIGV0IGFsDQo+Pj4+Pj4gICAgIGRybS9yYWRlb246IEZpeCBjb2Rp
bmcgc3R5bGUgaW4gZmJkZXYgZW11bGF0aW9uDQo+Pj4+Pj4gICAgIGRybS9yYWRlb246IE1v
dmUgZmJkZXYgY2xlYW51cCBjb2RlIGludG8gZmJfZGVzdHJveSBjYWxsYmFjaw0KPj4+Pj4+
ICAgICBkcm0vcmFkZW9uOiBDb3JyZWN0bHkgY2xlYW4gdXAgZmFpbGVkIGRpc3BsYXkgcHJv
YmluZw0KPj4+Pj4+ICAgICBkcm0vcmFkZW9uOiBJbXBsZW1lbnQgY2xpZW50LWJhc2VkIGZi
ZGV2IGVtdWxhdGlvbg0KPj4+Pj4+ICAgICBkcm0vcmFkZW9uOiBPbmx5IGJ1aWxkIGZiZGV2
IGlmIERSTV9GQkRFVl9FTVVMQVRJT04gaXMgc2V0DQo+Pj4+Pj4NCj4+Pj4+PiAgICBkcml2
ZXJzL2dwdS9kcm0vcmFkZW9uL01ha2VmaWxlICAgICAgICAgfCAgIDMgKy0NCj4+Pj4+PiAg
ICBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbi5oICAgICAgICAgfCAgIDIgKw0KPj4+
Pj4+ICAgIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2Rpc3BsYXkuYyB8ICAgNCAt
DQo+Pj4+Pj4gICAgZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fZHJ2LmMgICAgIHwg
ICAzICstDQo+Pj4+Pj4gICAgZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fZHJ2Lmgg
ICAgIHwgICAxIC0NCj4+Pj4+PiAgICBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9m
Yi5jICAgICAgfCA0MDAgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPj4+Pj4+ICAgIGRyaXZl
cnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2ZiZGV2LmMgICB8IDQyMg0KPj4+Pj4+ICsrKysr
KysrKysrKysrKysrKysrKysrKw0KPj4+Pj4+ICAgIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24v
cmFkZW9uX2dlbS5jICAgICB8ICAyNCArKw0KPj4+Pj4+ICAgIGRyaXZlcnMvZ3B1L2RybS9y
YWRlb24vcmFkZW9uX2ttcy5jICAgICB8ICAxOCAtDQo+Pj4+Pj4gICAgZHJpdmVycy9ncHUv
ZHJtL3JhZGVvbi9yYWRlb25fbW9kZS5oICAgIHwgIDIwICstDQo+Pj4+Pj4gICAgMTAgZmls
ZXMgY2hhbmdlZCwgNDY0IGluc2VydGlvbnMoKyksIDQzMyBkZWxldGlvbnMoLSkNCj4+Pj4+
PiAgICBkZWxldGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25f
ZmIuYw0KPj4+Pj4+ICAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vcmFk
ZW9uL3JhZGVvbl9mYmRldi5jDQo+Pj4+Pj4NCj4+Pj4+Pg0KPj4+Pj4+IGJhc2UtY29tbWl0
OiBlYzA3MDhlODQ2YjgxOWM4ZDViNjQyZGU0MjQ0OGE4N2Q3NTI2NTY0DQo+Pj4+Pg0KPj4+
Pg0KPj4+DQo+Pg0KPj4gLS0NCj4+IFRob21hcyBaaW1tZXJtYW5uDQo+PiBHcmFwaGljcyBE
cml2ZXIgRGV2ZWxvcGVyDQo+PiBTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdt
YkgNCj4+IE1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0KPj4gKEhS
QiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KPj4gR2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rl
dg0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVy
DQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIuIDUs
IDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0K
R2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rldg0K

--------------Z73LoQfofDhTkMzVY7Pli6LU--

--------------wmbaYeMnEUhtlcGzgHOTfphw
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmQZef8FAwAAAAAACgkQlh/E3EQov+Ce
Kw/+NpFgxZtZZTut7nPFqkH15WvvipPZg6oKE0j39nqq9sQiBhvzvNsEtAmeLc8ezjKalOnMyXVe
x2WRzp9fbHGXCWdPw7oFSEW2Rih4MDku8Dv+kb4RR9uivZGgDUzBQzosGQ0WSsUQP7U5yYVVtS0E
FHQunOfsQyitk/r9yI2ClQv5yhaZ1Nqkvu0l75y6PKjB8abp3YR/5sPRqQduqK/JHZ2uVfg93bxI
kCGGfTl0RIPqS/xt5TJ7qv/H3RBxAgexEpTQfP+xSl2VJ83Gz+3KNhc16LFF3L329hYD+Wj0HaGp
TY0em2MxLXuob6gsJzmPaIItkVHn/i6YnpbOc20JZEVfItbesuLMIQK1XUnNZVuZtN0CwED9BB92
famGdL00vhuLm8tetcPWC8b4kY3LjTcg1NaWW90jGeIB7ynYVWY616g9mXk84xrTT0D3uySJJmUC
PVa0Adv2hlUJefohX7NJPaKBjARRm8ndktogehtpFBaVgrAvwMVnUB0PvCetvVfvg2jq+WcBB6ol
x2HIdf2WPoQL/QkdgakVnik0gc7x/oUArOfaWDbaXpAUG4IkUyaVCuvoT+oDW9kbcAJiQC03kocq
3LfR+GPJ2bMMDD3xqDBv/j2ct70BG5RRhmq0g2it7Mr7w4HYpGDV9zyOl63Cz0RiPgM/6CZLwAgh
vFg=
=Hlql
-----END PGP SIGNATURE-----

--------------wmbaYeMnEUhtlcGzgHOTfphw--
