Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 285ED55BF90
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jun 2022 10:43:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79E7C12A86B;
	Tue, 28 Jun 2022 08:43:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 710E412A868;
 Tue, 28 Jun 2022 08:43:07 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 6A7A91FE2B;
 Tue, 28 Jun 2022 08:43:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1656405785; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2/WAc+0tDRfg69rCtTNIC/4JWl1NTH8TjQLYD11HaMY=;
 b=VL2oXW4PlDEe4kpqmIQhBfS1DuyJSDCJm3b2a5MtIjhtUOheV/89BQgZg4I2WH9FYw9TJx
 ISGvUA7FKLhq7bs7t4xcdXvHGuI7z2cV4dMGA06SecEhwfQsWBzVKBH2JuyHdHikXY9cPH
 BvE5giGtQ204UeWARYPG4DxuN++FCrQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1656405785;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2/WAc+0tDRfg69rCtTNIC/4JWl1NTH8TjQLYD11HaMY=;
 b=N9Wg711M6QJWBk0qB6FCHqHDzhqhEAzwBLAJUN+0TTchj2fBDLTAwVmC9yjYgS7LI8X+Ie
 71zUupls/7S1gUCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 41CDB13ACA;
 Tue, 28 Jun 2022 08:43:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id GNIqDxm/umJdNQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 28 Jun 2022 08:43:05 +0000
Message-ID: <561af3c0-c7cf-3580-ce35-320cb13a037c@suse.de>
Date: Tue, 28 Jun 2022 10:43:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: Annoying AMDGPU boot-time warning due to simplefb / amdgpu
 resource clash
Content-Language: en-US
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Javier Martinez Canillas <javierm@redhat.com>
References: <CAHk-=wh42rU5mKU6=PCK5tdkYjh7r31dGNmYdHwqpFnRFvVudA@mail.gmail.com>
 <3920df43-37f5-618d-70ba-de34a886e8ab@redhat.com>
 <CAHk-=wjxzafG-=J8oT30s7upn4RhBs6TX-uVFZ5rME+L5_DoJA@mail.gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <CAHk-=wjxzafG-=J8oT30s7upn4RhBs6TX-uVFZ5rME+L5_DoJA@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------JNaPufGqVaVrKB0vttDzOZtX"
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Hans de Goede <hdegoede@redhat.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------JNaPufGqVaVrKB0vttDzOZtX
Content-Type: multipart/mixed; boundary="------------aJThtEcf2VTPjFN3SShYH9Ff";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Javier Martinez Canillas <javierm@redhat.com>
Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Hans de Goede <hdegoede@redhat.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <561af3c0-c7cf-3580-ce35-320cb13a037c@suse.de>
Subject: Re: Annoying AMDGPU boot-time warning due to simplefb / amdgpu
 resource clash
References: <CAHk-=wh42rU5mKU6=PCK5tdkYjh7r31dGNmYdHwqpFnRFvVudA@mail.gmail.com>
 <3920df43-37f5-618d-70ba-de34a886e8ab@redhat.com>
 <CAHk-=wjxzafG-=J8oT30s7upn4RhBs6TX-uVFZ5rME+L5_DoJA@mail.gmail.com>
In-Reply-To: <CAHk-=wjxzafG-=J8oT30s7upn4RhBs6TX-uVFZ5rME+L5_DoJA@mail.gmail.com>

--------------aJThtEcf2VTPjFN3SShYH9Ff
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjcuMDYuMjIgdW0gMTk6MjUgc2NocmllYiBMaW51cyBUb3J2YWxkczoNCj4g
T24gTW9uLCBKdW4gMjcsIDIwMjIgYXQgMTowMiBBTSBKYXZpZXIgTWFydGluZXogQ2FuaWxs
YXMNCj4gPGphdmllcm1AcmVkaGF0LmNvbT4gd3JvdGU6DQo+Pg0KPj4gVGhlIGZsYWcgd2Fz
IGRyb3BwZWQgYmVjYXVzZSBpdCB3YXMgY2F1c2luZyBkcml2ZXJzIHRoYXQgcmVxdWVzdGVk
IHRoZWlyDQo+PiBtZW1vcnkgcmVzb3VyY2Ugd2l0aCBwY2lfcmVxdWVzdF9yZWdpb24oKSB0
byBmYWlsIHdpdGggLUVCVVNZIChlLmc6IHRoZQ0KPj4gdm13Z2Z4IGRyaXZlcik6DQo+Pg0K
Pj4gaHR0cHM6Ly93d3cuc3Bpbmljcy5uZXQvbGlzdHMvZHJpLWRldmVsL21zZzMyOTY3Mi5o
dG1sDQo+IA0KPiBTZWUsICp0aGF0KiBsaW5rIHdvdWxkIGhhdmUgYmVlbiB1c2VmdWwgaW4g
dGhlIGNvbW1pdC4NCj4gDQo+IFJhdGhlciB0aGFuIHRoZSB1c2VsZXNzIGxpbmsgaXQgaGFz
Lg0KPiANCj4gQW55d2F5LCByZW1vdmluZyB0aGUgYnVzeSBiaXQganVzdCBtYWRlIHRoaW5n
cyB3b3JzZS4NCj4gDQo+Pj4gSWYgc2ltcGxlZmIgaXMgYWN0dWFsbHkgc3RpbGwgdXNpbmcg
dGhhdCBmcmFtZSBidWZmZXIsIGl0J3MgYSBwcm9ibGVtLg0KPj4+IElmIGl0IGlzbid0LCB0
aGVuIG1heWJlIHRoYXQgcmVzb3VyY2Ugc2hvdWxkIGhhdmUgYmVlbiByZWxlYXNlZD8NCj4+
DQo+PiBJdCdzIHN1cHBvc2VkIHRvIGJlIHJlbGVhc2VkIG9uY2UgYW1kZ3B1IGFza3MgZm9y
IGNvbmZsaWN0aW5nIGZyYW1lYnVmZmVycw0KPj4gdG8gYmUgcmVtb3ZlZCBjYWxsaW5nIGRy
bV9hcGVydHVyZV9yZW1vdmVfY29uZmxpY3RpbmdfcGNpX2ZyYW1lYnVmZmVycygpLg0KPiAN
Cj4gVGhhdCBtb3N0IGRlZmluaXRlbHkgZG9lc24ndCBoYXBwZW4uIFRoaXMgaXMgb24gYSBy
dW5uaW5nIHN5c3RlbToNCj4gDQo+ICAgIFt0b3J2YWxkc0ByeXplbiBsaW51eF0kIGNhdCAv
cHJvYy9pb21lbSB8IGdyZXAgQk9PVEZCDQo+ICAgICAgICAgIDAwMDAwMDAwLTAwMDAwMDAw
IDogQk9PVEZCDQo+IA0KPiBzbyBJIHN1c3BlY3QgdGhhdCB0aGUgQlVTWSBiaXQgd2FzIG5l
dmVyIHRoZSBwcm9ibGVtIC0gZXZlbiBmb3INCj4gdm13Z2Z4KS4gVGhlIHByb2JsZW0gd2Fz
IHRoYXQgc2ltcGxlZmIgZG9lc24ndCByZW1vdmUgaXRzIHJlc291cmNlLg0KPiANCj4gR3V5
cywgdGhlICpyZWFzb24qIGZvciByZXNvdXJjZSBtYW5hZ2VtZW50IGlzIHRvIGNhdGNoIHBl
b3BsZSB0aGF0DQo+IHRyYW1wbGUgb3ZlciBlYWNoIG90aGVyJ3MgcmVzb3VyY2VzLg0KPiAN
Cj4gWW91IGxpdGVyYWxseSBiYXNpY2FsbHkgZGlzYWJsZWQgdGhlIGNvZGUgdGhhdCBjaGVj
a2VkIGZvciBpdCBieQ0KPiByZW1vdmluZyB0aGUgQlVTWSBmbGFnLCBhbmQganVzdCBjb250
aW51ZWQgdG8gaGF2ZSBjb25mbGljdGluZw0KPiByZXNvdXJjZXMuDQo+IA0KPiBUaGF0IGlz
bid0IGEgImZpeCIsIHRoYXQgaXMgbGl0ZXJhbGx5ICJ3ZSBhcmUgaWdub3JpbmcgYW5kIGJy
ZWFraW5nDQo+IHRoZSB3aG9sZSByZWFzb24gdGhhdCB0aGUgcmVzb3VyY2UgdHJlZSBleGlz
dHMsIGJ1dCB3ZSdsbCBzdGlsbCB1c2UgaXQNCj4gZm9yIG5vIGdvb2QgcmVhc29uIi4NCg0K
VGhlIEVGSS9WRVNBIGZyYW1lYnVmZmVyIGlzIHJlcHJlc2VudGVkIGJ5IGEgcGxhdGZvcm0g
ZGV2aWNlLiBUaGUgQlVTWSANCmZsYWcgd2UgcmVtb3ZlZCBpcyBpbiB0aGUgJ3N5c2ZiJyBj
b2RlIHRoYXQgY3JlYXRlcyB0aGlzIGRldmljZS4gVGhlIA0KQk9PVEZCIHJlc291cmNlIHlv
dSBzZWUgaW4geW91ciAvcHJvYy9pb21lbSBpcyB0aGUgZnJhbWVidWZmZXIgbWVtb3J5LiAN
ClRoZSBjb2RlIGlzIGluIHN5c2ZiX2NyZWF0ZV9zaW1wbGVmYigpIFsxXQ0KDQpMYXRlciBk
dXJpbmcgYm9vdCBhIGRldmljZSBkcml2ZXIsICdzaW1wbGVmYicgb3IgJ3NpbXBsZWRybScs
IGJpbmRzIHRvIA0KdGhlIGRldmljZSBhbmQgcmVzZXJ2ZXMgdGhlIGZyYW1lYnVmZmVyIG1l
bW9yeSBmb3IgcmVuZGVyaW5nIGludG8gaXQuIA0KRm9yIGV4YW1wbGUgaW4gc2ltcGxlZHJt
LiBbMl0gQXQgdGhhdCBwb2ludCBhIEJVU1kgZmxhZyBpcyBzZXQgZm9yIHRoYXQgDQpyZXNl
cnZhdGlvbi4NCg0KPiANCj4gWWVhaCwgeWVhaCwgbW9zdCBtb2Rlcm4gZHJpdmVycyBpZ25v
cmUgdGhlIElPIHJlc291cmNlIHRyZWUsIGJlY2F1c2UNCj4gdGhleSBlbmQgdXAgd29ya2lu
ZyBvbiBhbm90aGVyIHJlc291cmNlIGxldmVsIGVudGlyZWx5OiB0aGV5IHdvcmsgb24NCj4g
bm90IHRoZSBJTyByZXNvdXJjZXMsIGJ1dCBvbiB0aGUgImRyaXZlciBsZXZlbCIgaW5zdGVh
ZCwgYW5kIGp1c3QNCj4gYXR0YWNoIHRvIFBDSSBkZXZpY2VzLg0KPiANCj4gU28gdGhlc2Ug
ZGF5cywgZmV3IGVub3VnaCBkcml2ZXJzIGV2ZW4gY2FyZSBhYm91dCB0aGUgSU8gcmVzb3Vy
Y2UNCj4gdHJlZSwgYW5kIGl0J3MgbW9zdGx5IHVzZWQgZm9yIChhKSBsZWdhY3kgZGV2aWNl
cyAodGhpbmsgSVNBKSBhbmQgKGIpDQo+IHRoZSBhY3R1YWwgYnVzIHJlc291cmNlIGhhbmRs
aW5nIChzbyB0aGUgUENJIGNvZGUgaXRzZWxmIHVzZXMgaXQgdG8NCj4gc29ydCBvdXQgcmVz
b3VyY2UgdXNlIGFuZCBhdm9pZCBjb25mbGljdHMsIGJ1dCBQQ0kgZHJpdmVycyB0aGVtc2Vs
dmVzDQo+IGdlbmVyYWxseSB0aGVuIGRvbid0IGNhcmUsIGJlY2F1c2UgdGhlIGJ1cyBoYXMg
InRha2VuIGNhcmUgb2YgaXQiLg0KPiANCj4gU28gdGhhdCdzIHdoeSB0aGUgYW1kZ3B1IGRy
aXZlciBpdHNlbGYgZG9lc24ndCBjYXJlIGFib3V0IHJlc291cmNlDQo+IGFsbG9jYXRpb25z
LCBhbmQgd2Ugb25seSBnZXQgYSB3YXJuaW5nIGZvciB0aGF0IG1lbW9yeSB0eXBlIGNhc2Us
IG5vdA0KPiBmb3IgYW55IGRlZXBlciByZXNvdXJjZSBjYXNlLg0KPiANCj4gQW5kIGFwcGFy
ZW50bHkgdGhlIHZtd2dmeCBkcml2ZXIgc3RpbGwgdXNlcyB0aGF0IGxlZ2FjeSAibGV0J3Mg
Y2xhaW0NCj4gYWxsIFBDSSByZXNvdXJjZXMgaW4gdGhlIHJlc291cmNlIHRyZWUiIGluc3Rl
YWQgb2YganVzdCBjbGFpbWluZyB0aGUNCj4gZGV2aWNlIGl0c2VsZi4gV2hpY2ggaXMgd2h5
IGl0IGhpdCB0aGlzIHdob2xlIEJPT1RGQiByZXNvdXJjZSB0aGluZw0KPiBldmVuIGhhcmRl
ci4NCj4gDQo+IEJ1dCB0aGUgcmVhbCBidWcgaXMgdGhhdCBCT09URkIgc2VlbXMgdG8gY2xh
aW0gdGhpcyByZXNvdXJjZSBldmVuDQo+IGFmdGVyIGl0IGlzIGRvbmUgd2l0aCBpdCBhbmQg
b3RoZXIgZHJpdmVycyB3YW50IHRvIHRha2Ugb3Zlci4NCg0KT25jZSBhbWRncHUgd2FudHMg
dG8gdGFrZSBvdmVyLCBpdCBoYXMgdG8gcmVtb3ZlIHRoZSB0aGUgcGxhdGZvcm0gZGV2aWNl
IA0KdGhhdCByZXByZXNlbnRzIHRoZSBFRkkgZnJhbWVidWZmZXIuIEl0IGRvZXMgc28gYnkg
Y2FsbGluZyB0aGUgDQpkcm1fYXBlcnR1cmVfIGZ1bmN0aW9uLCB3aGljaCBpbiB0dXJuIGNh
bGxzIA0KcGxhdGZvcm1fZGV2aWNlX3VucmVnaXN0ZXIoKS4gQWZ0ZXJ3YXJkcywgdGhlIHBs
YXRmb3JtIGRldmljZSwgZHJpdmVyIA0KYW5kIEJPT1RGQiByYW5nZSBhcmUgc3VwcG9zZWQg
dG8gYmUgZW50aXJlbHkgZ29uZS4NCg0KVW5mb3J0dW5hdGVseSwgdGhpcyBjdXJyZW50bHkg
b25seSB3b3JrcyBpZiBhIGRyaXZlciBpcyBib3VuZCB0byB0aGUgDQpwbGF0Zm9ybSBkZXZp
Y2UuIFdpdGhvdXQgc2ltcGxlZHJtIG9yIHNpbXBsZWZiLCBhbWRncHUgd29uJ3QgZmluZCB0
aGUgDQpwbGF0Zm9ybSBkZXZpY2UgdG8gcmVtb3ZlLg0KDQpJIGd1ZXNzLCB3aGF0IGhhcHBl
bnMgb24geW91ciBzeXN0ZW0gaXMgdGhhdCBzeXNmYiBjcmVhdGUgYSBkZXZpY2UgZm9yIA0K
dGhlIEVGSSBmcmFtZWJ1ZmZlciBhbmQgdGhlbiBhbWRncHUgY29tZXMgYW5kIGRvZXNuJ3Qg
ZmluZCBpdCBmb3IgDQpyZW1vdmFsLiBBbmQgbGF0ZXIgeW91IHNlZSB0aGVzZSB3YXJuaW5n
cyBiZWNhdXNlIEJPT1RGQiBpcyBzdGlsbCBhcm91bmQuDQoNCkphdmllciBhbHJlYWR5IHBy
b3ZpZGVkIHBhdGNoZXMgZm9yIHRoaXMgc2NlbmFyaW8sIHdoaWNoIGFyZSBpbiB0aGUgRFJN
IA0KdHJlZS4gRnJvbSBkcm0tbmV4dCwgcGxlYXNlIGNoZXJyeS1waWNrDQoNCiAgIDA5NDll
ZTc1ZGE2YyAoImZpcm13YXJlOiBzeXNmYjogTWFrZSBzeXNmYl9jcmVhdGVfc2ltcGxlZmIo
KSByZXR1cm4gYSANCnBkZXYgcG9pbnRlciIpDQoNCiAgIGJjODI0OTIyYjI2NCAoImZpcm13
YXJlOiBzeXNmYjogQWRkIHN5c2ZiX2Rpc2FibGUoKSBoZWxwZXIgZnVuY3Rpb24iKQ0KDQog
ICA4NzNlYjNiMTE4NjAgKCJmYmRldjogRGlzYWJsZSBzeXNmYiBkZXZpY2UgcmVnaXN0cmF0
aW9uIHdoZW4gcmVtb3ZpbmcgDQpjb25mbGljdGluZyBGQnMiKQ0KDQpmb3IgdGVzdGluZy4g
V2l0aCB0aGVzZSBwYXRjaGVzLCBhbWRncHUgd2lsbCBmaW5kIHRoZSBzeXNmYiBkZXZpY2Ug
YW5kIA0KdW5yZWdpc3RlciBpdC4NCg0KVGhlIHBhdGNoZXMgYXJlIHF1ZXVlZCB1cCBmb3Ig
dGhlIG5leHQgbWVyZ2Ugd2luZG93LiBJZiB0aGV5IHJlc29sdmUgdGhlIA0KaXNzdWUsIHdl
J2xsIGFscmVhZHkgc2VuZCB3aXRoIHRoZSBuZXh0IHJvdW5kIG9mIGZpeGVzLg0KDQpCZXN0
IHJlZ2FyZHMNClRob21hcw0KDQpbMV0gDQpodHRwczovL2VsaXhpci5ib290bGluLmNvbS9s
aW51eC9sYXRlc3Qvc291cmNlL2RyaXZlcnMvZmlybXdhcmUvc3lzZmJfc2ltcGxlZmIuYyNM
MTE1DQpbMl0gDQpodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC9sYXRlc3Qvc291
cmNlL2RyaXZlcnMvZ3B1L2RybS90aW55L3NpbXBsZWRybS5jI0w1NDQNCg0KPiANCj4gTm90
IHRoZSBCVVNZIGJpdC4NCj4gDQo+ICAgICAgICAgICAgICAgICAgICAgICBMaW51cw0KDQot
LSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNF
IFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIuIDUsIDkwNDA5
IE7DvHJuYmVyZywgR2VybWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KR2VzY2jD
pGZ0c2bDvGhyZXI6IEl2byBUb3Rldg0K

--------------aJThtEcf2VTPjFN3SShYH9Ff--

--------------JNaPufGqVaVrKB0vttDzOZtX
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmK6vxgFAwAAAAAACgkQlh/E3EQov+BY
whAAgB/stJFyfL2BJ766TDYcNe6FUJodFUiuVQ4nhlMZmZRTaV3aVICnPLQSs/Yf4XSW/IbfolR6
hs+K+g1IUmDSEAFQ1o2PhPukGuVQ3lLdDIwpbhjUXT60wpJMyqyjVFiAbxd6gvKTgjqWe7knUPFL
pQ3hXd8FCvT/0QgcUOb3vNde4uuCgSDITiN/byygz1EpR0MV7yDIGk0cJA9iWpLj1mKhO+BU7aHS
oFLueu05Y6VCmUD5aUhoEYtmvHO6/2WEx0O+AcMfNV7Gw6Rbu+NbYBhJHvIQl59i925inTqqldn6
GigYe9h7dWSVZQRgpuK/oNDgXioHEQwrKoEF3opbx9QC/buJknRmRO8FKiuVjfoV/51Xvqz8tJDm
4exiRqzhAAbLGaEu2qHMw6G6HCzLYCtGByt8zQ8bVk/qDv6z7sEtMDbV8tybDs4dcGaUBkOtqkqR
hSkV6vXw+zFopjiLvi0MAwQug2LugGFfGU8kEjNGvZkj+C5H1WsnFfUBe8XmihZdhTmqtdwqhCGc
inVeKFlTm0kSZceOMSMjGQBaBaNnpruDh7GP5/DsnQHbqBk+qKunVYiHxV7kt97VgN42w7WcGP+z
CxtalH1dxgZ6aZGJN0Za6zAmNVBm/kG56S27JR3KV+OEMVFnH4mKEOGZwNoIFlRFCYR2x0gCztYV
NOs=
=NBjq
-----END PGP SIGNATURE-----

--------------JNaPufGqVaVrKB0vttDzOZtX--
