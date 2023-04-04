Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 190306D5EBE
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 13:13:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB74110E170;
	Tue,  4 Apr 2023 11:13:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51B1E10E117
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Apr 2023 11:13:38 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id CF5502295B;
 Tue,  4 Apr 2023 11:13:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1680606813; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gfOQeN2CPTe9bLKagYvLUZXURzIMjN3NCyrWk1vNlOk=;
 b=Qt/xsee12c9YI16EoPs5k3F0xz2lOF1ww/NcTN1SWp4sHN3VbEzAG/vwQaoKa/Zpdmo/Fe
 QWSQGlKtDv31JRNVpzToXdu7tJmB5i3momwm8gUWSm5dHpJ+vymoj6JmwZ2YaN409oFSyI
 p7Z5ki9i8BykdWaAUNTqAnMtZm8cuwY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1680606813;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gfOQeN2CPTe9bLKagYvLUZXURzIMjN3NCyrWk1vNlOk=;
 b=s4oKNnZFzMGYdVynXk55nB2AflpCsc65eo+nbT6sO5Oi13DfaueF21zXnznZnLosXen08H
 3O9yrSO87JBVNdAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A6FAF1391A;
 Tue,  4 Apr 2023 11:13:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 2KnaJ10GLGQTdQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 04 Apr 2023 11:13:33 +0000
Message-ID: <77d9b252-42ab-3669-638c-c09bcf3a2d9a@suse.de>
Date: Tue, 4 Apr 2023 13:13:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 5/5] drm/omapdrm: Implement fbdev emulation as
 in-kernel client
Content-Language: en-US
To: Emil Velikov <emil.l.velikov@gmail.com>
References: <20230403104035.15288-1-tzimmermann@suse.de>
 <20230403104035.15288-6-tzimmermann@suse.de>
 <CACvgo52vn4HAq+ZmO9xR88se--bYE9b322ucZ04jp8s3Wc_WCg@mail.gmail.com>
 <4818e04e-2209-a4fb-7caa-48ed2bcd809d@suse.de>
 <CACvgo53+GsJ+JWBvLnHLp+2Ad5aXFkVHW8GwZTjZEsx2Rt2QNA@mail.gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <CACvgo53+GsJ+JWBvLnHLp+2Ad5aXFkVHW8GwZTjZEsx2Rt2QNA@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------t5mwYx1stv07lopOn05j57ZB"
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
Cc: tomba@kernel.org, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 javierm@redhat.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------t5mwYx1stv07lopOn05j57ZB
Content-Type: multipart/mixed; boundary="------------3JdDp8O7VD0kV3BCTFtbdnWW";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Emil Velikov <emil.l.velikov@gmail.com>
Cc: tomba@kernel.org, javierm@redhat.com, airlied@gmail.com, daniel@ffwll.ch,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
Message-ID: <77d9b252-42ab-3669-638c-c09bcf3a2d9a@suse.de>
Subject: Re: [PATCH v2 5/5] drm/omapdrm: Implement fbdev emulation as
 in-kernel client
References: <20230403104035.15288-1-tzimmermann@suse.de>
 <20230403104035.15288-6-tzimmermann@suse.de>
 <CACvgo52vn4HAq+ZmO9xR88se--bYE9b322ucZ04jp8s3Wc_WCg@mail.gmail.com>
 <4818e04e-2209-a4fb-7caa-48ed2bcd809d@suse.de>
 <CACvgo53+GsJ+JWBvLnHLp+2Ad5aXFkVHW8GwZTjZEsx2Rt2QNA@mail.gmail.com>
In-Reply-To: <CACvgo53+GsJ+JWBvLnHLp+2Ad5aXFkVHW8GwZTjZEsx2Rt2QNA@mail.gmail.com>

--------------3JdDp8O7VD0kV3BCTFtbdnWW
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDMuMDQuMjMgdW0gMTc6MDcgc2NocmllYiBFbWlsIFZlbGlrb3Y6DQo+IE9u
IE1vbiwgMyBBcHIgMjAyMyBhdCAxNTo1MCwgVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJt
YW5uQHN1c2UuZGU+IHdyb3RlOg0KPj4NCj4+IEhpDQo+Pg0KPj4gQW0gMDMuMDQuMjMgdW0g
MTY6Mjcgc2NocmllYiBFbWlsIFZlbGlrb3Y6DQo+Pj4gT24gTW9uLCAzIEFwciAyMDIzIGF0
IDExOjQxLCBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4gd3JvdGU6
DQo+Pj4+DQo+Pj4+IE1vdmUgY29kZSBmcm9tIGFkLWhvYyBmYmRldiBjYWxsYmFja3MgaW50
byBEUk0gY2xpZW50IGZ1bmN0aW9ucw0KPj4+PiBhbmQgcmVtb3ZlIHRoZSBvbGQgY2FsbGJh
Y2tzLiBUaGUgZnVuY3Rpb25zIGluc3RydWN0IHRoZSBjbGllbnQNCj4+Pj4gdG8gcG9sbCBm
b3IgY2hhbmdlZCBvdXRwdXQgb3IgcmVzdG9yZSB0aGUgZGlzcGxheS4gVGhlIERSTSBjb3Jl
DQo+Pj4+IGNhbGxzIGJvdGgsIHRoZSBvbGQgY2FsbGJhY2tzIGFuZCB0aGUgbmV3IGNsaWVu
dCBoZWxwZXJzLCBmcm9tDQo+Pj4+IHRoZSBzYW1lIHBsYWNlcy4gVGhlIG5ldyBmdW5jdGlv
bnMgcGVyZm9ybSB0aGUgc2FtZSBvcGVyYXRpb24gYXMNCj4+Pj4gYmVmb3JlLCBzbyB0aGVy
ZSdzIG5vIGNoYW5nZSBpbiBmdW5jdGlvbmFsaXR5Lg0KPj4+Pg0KPj4+PiBSZXBsYWNlIGFs
bCBjb2RlIHRoYXQgaW5pdGlhbGl6ZXMgb3IgcmVsZWFzZXMgZmJkZXYgZW11bGF0aW9uDQo+
Pj4+IHRocm91Z2hvdXQgdGhlIGRyaXZlci4gSW5zdGVhZCBpbml0aWFsaXplIHRoZSBmYmRl
diBjbGllbnQgYnkgYQ0KPj4+PiBzaW5nbGUgY2FsbCB0byBvbWFwZHJtX2ZiZGV2X3NldHVw
KCkgYWZ0ZXIgb21hcGRybSBoYXMgcmVnaXN0ZXJlZA0KPj4+PiBpdHMgRFJNIGRldmljZS4g
QXMgaW4gbW9zdCBkcml2ZXJzLCBvbWFwZHJtJ3MgZmJkZXYgZW11bGF0aW9uIG5vdw0KPj4+
PiBhY3RzIGxpa2UgYSByZWd1bGFyIERSTSBjbGllbnQuDQo+Pj4+DQo+Pj4+IFRoZSBmYmRl
diBjbGllbnQgc2V0dXAgY29uc2lzdHMgb2YgdGhlIGluaXRpYWwgcHJlcGFyYXRpb24gYW5k
IHRoZQ0KPj4+PiBob3QtcGx1Z2dpbmcgb2YgdGhlIGRpc3BsYXkuIFRoZSBsYXR0ZXIgY3Jl
YXRlcyB0aGUgZmJkZXYgZGV2aWNlDQo+Pj4+IGFuZCBzZXRzIHVwIHRoZSBmYmRldiBmcmFt
ZWJ1ZmZlci4gVGhlIHNldHVwIHBlcmZvcm1zIGRpc3BsYXkNCj4+Pj4gaG90LXBsdWdnaW5n
IG9uY2UuIElmIG5vIGRpc3BsYXkgY2FuIGJlIGRldGVjdGVkLCBEUk0gcHJvYmUgaGVscGVy
cw0KPj4+PiByZS1ydW4gdGhlIGRldGVjdGlvbiBvbiBlYWNoIGhvdHBsdWcgZXZlbnQuDQo+
Pj4+DQo+Pj4+IEEgY2FsbCB0byBkcm1fZGV2X3VucmVnaXN0ZXIoKSByZWxlYXNlcyB0aGUg
Y2xpZW50IGF1dG9tYXRpY2FsbHkuDQo+Pj4+IE5vIGZ1cnRoZXIgYWN0aW9uIGlzIHJlcXVp
cmVkIHdpdGhpbiBvbWFwZHJtLiBJZiB0aGUgZmJkZXYNCj4+Pj4gZnJhbWVidWZmZXIgaGFz
IGJlZW4gZnVsbHkgc2V0IHVwLCBzdHJ1Y3QgZmJfb3BzLmZiX2Rlc3Ryb3kNCj4+Pj4gaW1w
bGVtZW50cyB0aGUgcmVsZWFzZS4gRm9yIHBhcnRpYWxseSBpbml0aWFsaXplZCBlbXVsYXRp
b24sIHRoZQ0KPj4+PiBmYmRldiBjbGllbnQgcmV2ZXJ0cyB0aGUgaW5pdGlhbCBzZXR1cC4N
Cj4+Pj4NCj4+Pj4gdjI6DQo+Pj4+ICAgICAgICAgICAqIGluaXQgZHJtX2NsaWVudCBpbiB0
aGlzIHBhdGNoIChUb21pKQ0KPj4+PiAgICAgICAgICAgKiBkb24ndCBoYW5kbGUgbm9uLWF0
b21pYyBtb2Rlc2V0dGluZyAoVG9taSkNCj4+Pj4NCj4+Pj4gU2lnbmVkLW9mZi1ieTogVGhv
bWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+DQo+Pj4+IFJldmlld2VkLWJ5
OiBUb21pIFZhbGtlaW5lbiA8dG9taS52YWxrZWluZW5AaWRlYXNvbmJvYXJkLmNvbT4NCj4+
Pj4gLS0tDQo+Pj4+ICAgIGRyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL29tYXBfZHJ2LmMgICB8
ICAxMSArLS0NCj4+Pj4gICAgZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vb21hcF9mYmRldi5j
IHwgMTMyICsrKysrKysrKysrKysrKysrLS0tLS0tLS0tLQ0KPj4+PiAgICBkcml2ZXJzL2dw
dS9kcm0vb21hcGRybS9vbWFwX2ZiZGV2LmggfCAgIDkgKy0NCj4+Pj4gICAgMyBmaWxlcyBj
aGFuZ2VkLCA5MCBpbnNlcnRpb25zKCspLCA2MiBkZWxldGlvbnMoLSkNCj4+Pj4NCj4+Pg0K
Pj4+PiArc3RhdGljIHZvaWQgb21hcF9mYmRldl9mYl9kZXN0cm95KHN0cnVjdCBmYl9pbmZv
ICppbmZvKQ0KPj4+PiArew0KPj4+PiArICAgICAgIHN0cnVjdCBkcm1fZmJfaGVscGVyICpo
ZWxwZXIgPSBpbmZvLT5wYXI7DQo+Pj4+ICsgICAgICAgc3RydWN0IGRybV9mcmFtZWJ1ZmZl
ciAqZmIgPSBoZWxwZXItPmZiOw0KPj4+PiArICAgICAgIHN0cnVjdCBkcm1fZ2VtX29iamVj
dCAqYm8gPSBkcm1fZ2VtX2ZiX2dldF9vYmooZmIsIDApOw0KPj4+PiArICAgICAgIHN0cnVj
dCBvbWFwX2ZiZGV2ICpmYmRldiA9IHRvX29tYXBfZmJkZXYoaGVscGVyKTsNCj4+Pj4gKw0K
Pj4+PiArICAgICAgIERCRygpOw0KPj4+PiArDQo+Pj4NCj4+PiBXaGF0IGEgbG92ZWx5IGxp
dHRsZSBzdXJwcmlzZS4gSXQncyBhIHByZS1leGlzdGluZyAiZmVhdHVyZSIsIHNvIGxldCdz
DQo+Pj4gaWdub3JlIHRoYXQgZm9yIG5vdyA7LSkNCj4+DQo+PiBJIGhhdmUgbm8gaWRlYSB3
aGF0IHlvdSdyZSB0YWxraW5nIGFib3V0LiBUaGlzIGNvZGUgd2FzIGluIHRoZSBvcmlnaW5h
bA0KPj4gY2xlYW4tdXAgZnVuY3Rpb24uIElmIGl0IGlzIG5vdCBzdXBwb3NlZCB0byBiZSBo
ZXJlLCBJIGNhbiByZW1vdmUgaXQuDQo+Pg0KPiANCj4gUHJlY2lzZWx5IC0gdGhlIG9yaWdp
bmFsIGNvZGUgaGFkIHRoZSBEQkcoKSBhbmQgeW91ciBjaGFuZ2UgcHJlc2VydmVzDQo+IGl0
LiBCYXNlZCBvbiBteSByZWFkaW5nLCBpdCBzaG91bGRuJ3QgYmUgdGhlcmUgLi4uIHRoZW4g
YWdhaW4gZG9uJ3QNCj4gcmVhZCB0b28gbXVjaCBpbnRvIHRoYXQuDQo+IA0KPj4+DQo+Pj4+
ICsgICAgICAgZHJtX2ZiX2hlbHBlcl9maW5pKGhlbHBlcik7DQo+Pj4+ICsNCj4+Pj4gKyAg
ICAgICBvbWFwX2dlbV91bnBpbihibyk7DQo+Pj4+ICsgICAgICAgZHJtX2ZyYW1lYnVmZmVy
X3JlbW92ZShmYik7DQo+Pj4+ICsNCj4+Pj4gKyAgICAgICBkcm1fY2xpZW50X3JlbGVhc2Uo
JmhlbHBlci0+Y2xpZW50KTsNCj4+Pj4gKyAgICAgICBkcm1fZmJfaGVscGVyX3VucHJlcGFy
ZShoZWxwZXIpOw0KPj4+PiArICAgICAgIGtmcmVlKGZiZGV2KTsNCj4+Pj4gK30NCj4+Pg0K
Pj4+DQo+Pj4+IC12b2lkIG9tYXBfZmJkZXZfZmluaShzdHJ1Y3QgZHJtX2RldmljZSAqZGV2
KQ0KPj4+PiArc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1fY2xpZW50X2Z1bmNzIG9tYXBfZmJk
ZXZfY2xpZW50X2Z1bmNzID0gew0KPj4+PiArICAgICAgIC5vd25lciAgICAgICAgICA9IFRI
SVNfTU9EVUxFLA0KPj4+PiArICAgICAgIC51bnJlZ2lzdGVyICAgICA9IG9tYXBfZmJkZXZf
Y2xpZW50X3VucmVnaXN0ZXIsDQo+Pj4+ICsgICAgICAgLnJlc3RvcmUgICAgICAgID0gb21h
cF9mYmRldl9jbGllbnRfcmVzdG9yZSwNCj4+Pj4gKyAgICAgICAuaG90cGx1ZyAgICAgICAg
PSBvbWFwX2ZiZGV2X2NsaWVudF9ob3RwbHVnLA0KPj4+DQo+Pj4gQUZBSUNUIHRoZSBmYmRl
diBjbGllbnQgaGVscGVycyBhYm92ZSBhcmUgaWRlbnRpY2FsIHRvIHRoZSBnZW5lcmljDQo+
Pj4gb25lcyBpbiBkcm1fZmJkZXZfZ2VuZXJpYy5jLiBXaHkgYXJlbid0IHdlIHJldXNpbmcg
dGhvc2UgYnV0DQo+Pj4gY29weS9wYXN0aW5nIHRoZW0gaW4gdGhlIGRyaXZlcj8NCj4+DQo+
PiBUaGUgY29kZSBpbiBkcm1fZmJkZXZfZ2VuZXJpYy5jIChhbmQgb3RoZXIgZmJkZXYgZmls
ZXMpIG1pZ2h0IGJlDQo+PiBzaGFyZWFibGUgYXQgc29tZSBwb2ludCB3aGVuIEkga25vdyB3
aGF0IGV4YWN0bHkgSSBuZWVkLg0KPiANCj4+IEkgYWxyZWFkeSBwbGFuDQo+PiB0byBtb3Zl
IHNvbWUgb2YgdGhlIGRhbWFnZSBoYW5kbGluZyBmcm9tIGRybV9mYl9oZWxwZXIuYyB0bw0K
Pj4gZHJtX2ZiZGV2X2dlbmVyaWMuYyBhbmQgdGhhdCB3aWxsIGFmZmVjdCB0aGUgaGVscGVy
cyB0aGF0IGFyZSBjdXJyZW50bHkNCj4+IGlkZW50aWNhbC4NCj4gDQo+IE5vdyB0aGF0J3Mg
dGhlIHBpZWNlIHRoYXQgSSB3YXMgbWlzc2luZy4NCj4gDQo+PiBUaGVyZSdzIGxpdHRsZSBw
b2ludCBpbiBjb2RlIHNoYXJpbmcgcmlnaHQgbm93Lg0KPj4NCj4+IEkga25vdyB0aGF0IHRo
ZSBmYmRldiBlbXVsYXRpb24gaXMgY29udm9sdXRlZCBhbmQgY29uZnVzaW5nIGF0IHRpbWVz
Lg0KPj4gSXQncyB0aGUgcmVzdWx0IG9mIHZhcmlvdXMgcmVkZXNpZ25zIGFuZCBmYWxzZSBz
dGFydHMuIFRoaW5ncyBhcmUNCj4+IGdldHRpbmcgYmV0dGVyLCB0aG91Z2guDQo+Pg0KPiAN
Cj4gQmVlbiBrZWVwaW5nIGFuIGV5ZSBvbiB5b3VyIHdvcmsgYW5kIGl0J3Mgc2hhcGluZyB1
cCBncmVhdC4gSXQncw0KPiBkZWVwbHkgYXBwcmVjaWF0ZWQuDQo+IA0KPiBGd2l3IHRoZSBz
ZXJpZXMgaXM6DQo+IFJldmlld2VkLWJ5OiBFbWlsIFZlbGlrb3YgPGVtaWwubC52ZWxpa292
QGdtYWlsLmNvbT4NCg0KVGhhbmtzIGZvciByZXZpZXdpbmcuDQoNCkJlc3QgcmVnYXJkcw0K
VGhvbWFzDQoNCj4gDQo+IC1FbWlsDQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBo
aWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkg
R21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55DQooSFJCIDM2
ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8aHJlcjogSXZvIFRvdGV2DQo=

--------------3JdDp8O7VD0kV3BCTFtbdnWW--

--------------t5mwYx1stv07lopOn05j57ZB
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmQsBl0FAwAAAAAACgkQlh/E3EQov+Ci
Xw/7Bk4VlSedM2yvdom3q1QYCQi1e6N/GIM9UYq/dtfoGkRMnsgUi5ZzQoW71vaGCH/aqFNrs9sb
O9TCxEqE59W/sgLf5FpcCMPfY2YeQUGnfMeBci7QSKAH/gcAMsHA3rrWvip8/MyGdW80Ib8/hihd
A0vR6Htx3vBTexxrRQ1aKRJuQaq2+EABO3lSyDZFjc50Lb6O4OyaY0xGyWj/EOBNA3BFXWCx1DRl
wJI8x141fHWvJQLa/P4Z6T6yx9iJQ1GKAQ2u2R94jPvGtqC3+OGkgDR4+26IJW8TrasZBp1aPrHu
pJF+EAIMPciuLJRjaKhc+T54durTPqPh8pNdmvooVnhU3tqo9mtFTKwXfHTIe9Ra5sGt5OYWji2U
6AKiAPLjxOkZaaW2KoBO773d+ZrSbyleiEUAjTSD4C9nyiqan4eNCksYzdthEtJ5AtuwwBBmQbEt
mZYeClJ5swo6klRTlmi0ASm0UfMIuGAbxj5MMGnuyyeN0pjTMXb2x9K8Y1Gr065lPmeyJgywCajE
HwE0NA9O1E95p42pxJJ5YmviRwq0rfJhsIiRqs+uPg3fGp1EJfmUklffLBUT9FKBgotn8RMaZ6X2
dIOWSssyivAvfct7623wfRd6NDzjYb/EKGNUoxWWp7+k/J2CAM+VpR3gUR32cJG0dyWGSw86UM11
k4U=
=dWZx
-----END PGP SIGNATURE-----

--------------t5mwYx1stv07lopOn05j57ZB--
