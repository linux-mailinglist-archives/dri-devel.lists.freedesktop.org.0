Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2475549E5DC
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jan 2022 16:19:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA47110F11C;
	Thu, 27 Jan 2022 15:19:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F02C10F132
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jan 2022 15:18:59 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B6ADF210F6;
 Thu, 27 Jan 2022 15:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1643296737; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NPiVFHFuGvggHaaowtVy3Xd95dqHVaHDZOWKpF4cIWk=;
 b=WPJNomTiBo/X6aKoHb3n1fhitxC0BhVvKAsztIOkN4cxCxi+EhAk2Cop7KX4nCiHOCMbOv
 8Izv6CrtqOnkaQ8t54CtKdMunBbHcLGpmVM6wjWYn5vEtAYBqO3oTk/MZSMAKHDWMmhdao
 vmuCAYwmHrhtq0lQri70BIEXXij2VMg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1643296737;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NPiVFHFuGvggHaaowtVy3Xd95dqHVaHDZOWKpF4cIWk=;
 b=6hpUdJQaUTouY0avVK2DnQfJ/oLGMDPbKW0Ld+VmxZ9cRKyHN60h8Vl1CrhmQVPZwLhyBo
 Qy1czGA37b5/p0Cw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9A64F13C08;
 Thu, 27 Jan 2022 15:18:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id tOPZI+G38mH5XAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 27 Jan 2022 15:18:57 +0000
Message-ID: <b59ac6ae-f080-0a22-3ad6-e0de65ebf621@suse.de>
Date: Thu, 27 Jan 2022 16:18:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] drm/fb-helper: Mark screen buffers in system memory with
 FB_VIRTFB
Content-Language: en-US
To: Daniel Vetter <daniel@ffwll.ch>
References: <20220127102621.30047-1-tzimmermann@suse.de>
 <YfKFP2DW/g6tXLQw@phenom.ffwll.local>
 <b3c508df-53ee-7fcd-2cdb-297d603a5f96@suse.de>
 <YfK0N21rJ69rclJE@phenom.ffwll.local>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <YfK0N21rJ69rclJE@phenom.ffwll.local>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------V0s2F47w8DVzWoSKL0TLgDyn"
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------V0s2F47w8DVzWoSKL0TLgDyn
Content-Type: multipart/mixed; boundary="------------t2jtcFBrud4KH5YUPUs0j0SL";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org
Message-ID: <b59ac6ae-f080-0a22-3ad6-e0de65ebf621@suse.de>
Subject: Re: [PATCH] drm/fb-helper: Mark screen buffers in system memory with
 FB_VIRTFB
References: <20220127102621.30047-1-tzimmermann@suse.de>
 <YfKFP2DW/g6tXLQw@phenom.ffwll.local>
 <b3c508df-53ee-7fcd-2cdb-297d603a5f96@suse.de>
 <YfK0N21rJ69rclJE@phenom.ffwll.local>
In-Reply-To: <YfK0N21rJ69rclJE@phenom.ffwll.local>

--------------t2jtcFBrud4KH5YUPUs0j0SL
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjcuMDEuMjIgdW0gMTY6MDMgc2NocmllYiBEYW5pZWwgVmV0dGVyOg0KPiBP
biBUaHUsIEphbiAyNywgMjAyMiBhdCAxMjo1ODozMFBNICswMTAwLCBUaG9tYXMgWmltbWVy
bWFubiB3cm90ZToNCj4+IEhpDQo+Pg0KPj4gQW0gMjcuMDEuMjIgdW0gMTI6NDIgc2Nocmll
YiBEYW5pZWwgVmV0dGVyOg0KPj4+IE9uIFRodSwgSmFuIDI3LCAyMDIyIGF0IDExOjI2OjIx
QU0gKzAxMDAsIFRob21hcyBaaW1tZXJtYW5uIHdyb3RlOg0KPj4+PiBNYXJrIHNjcmVlbiBi
dWZmZXJzIGluIHN5c3RlbSBtZW1vcnkgd2l0aCBGQl9WSVJURkIuIE90aGVyd2lzZSwgdGhl
DQo+Pj4+IGJ1ZmZlcnMgYXJlIG1tYXAnZWQgYXMgSS9PIG1lbW9yeSAoaS5lLiwgVk1fSU8p
LiBGb3Igc2hhZG93IGJ1ZmZlcnMsDQo+Pj4+IGFsc28gc2V0IHRoZSBGQl9SRUFEU19GQVNU
IGhpbnQuDQo+Pj4NCj4+PiBNYXliZSBjbGFyaWZ5IHRoYXQgdGhpcyBvbmx5IGhvbGRzIGZv
ciB0aGUgZGVmaW8gY2FzZSwgYW5kIHNpbmNlIHdlIGhhdmUNCj4+PiBvdXIgb3duIHNoYWRv
dyBjb3B5IGZvciB0aGF0IGFueXdheSBpdCBzaG91bGRuJ3QgbWF0dGVyLiBJJ20gYWxzbyBu
b3Qgc3VyZQ0KPj4+IGhvdyBtdWNoIHRoZSBtZW1jcHkgZ2FpbnMgdXMgY29tcGFyZWQgdG8g
anVzdCByZWRyYXdpbmcgLi4uDQo+Pj4NCj4+PiBXaGF0J3MgdGhlIG1vdGl2YXRpb24gaGVy
ZSwgb3IganVzdCBzb21ldGhpbmcgeW91IHNwb3R0ZWQ/DQo+Pg0KPj4gQ29ycmVjdG5lc3Mg
bW9zdGx5LiBmYmRldidzIGZiZGVmaW8gdGVzdHMgZm9yICh0aGUgYWJzZW5jZSBvZikgdGhp
cyBmbGFnIGFuZA0KPj4gc2V0cyBWTV9JTyBhY2NvcmRpbmdseS4NCj4+DQo+PiBJdCdzIGFj
dHVhbGx5IGZvciB1c2Vyc3BhY2UuIE1heWJlIHVzZXJzcGFjZSB0ZXN0cyB0aGVzZSBmbGFn
cyBhcyB3ZWxsIGFuZA0KPj4gY2FuIG9wdGltaXplIG1lbWNweSBwYXR0ZXJuIGZvciBkaWZm
ZXJlbnQgdHlwZXMgb2YgY2FjaGluZy4gQnV0IEkgd291bGRuJ3QNCj4+IGV4cGVjdCBpdCBU
QkguDQo+IA0KPiBIbSBJIHRob3VnaHQgc28gdG9vLCBidXQgdGhlICNkZWZpbmUgaXMgaW4g
dGhlIGludGVybmFsIGhlYWRlciwgbm90IHRoZQ0KPiB1YXBpIGhlYWRlci4gQW5kIEkgZG9u
J3Qgc2VlIGFueSBpb2N0bCBjb2RlIGluIGZibWVtLmMgdGhhdCB3b3VsZCBzaG92ZQ0KPiBm
Yl9pbmZvLT5mbGFncyB0byB1c2Vyc3BhY2UuIFRoYXQncyB3aHkgSSB3b25kZXJlZCB3aHkg
eW91IGNhcmUgYWJvdXQNCj4gdGhpcz8gT3IgZGlkIEkgbWlzcyBzb21ldGhpbmcgc29tZXdo
ZXJlPw0KDQpZb3UgZGlkbid0LiAgSSBqdXN0IGdyZXBwZWQgaXQgbXlzZWxmIGFuZCB0aGUg
b25seSB1c2VyIG9mIFZJUlRGQiBpcyB0aGUgDQptbWFwIGNvZGUgaW4gZmJfZGVmZXJpby5j
LCB3aGljaCAobm90KSBzZXRzIFZNX0lPLiBSRUFEU19GQVNUIGlzIHVudXNlZC4gDQpJJ2Qg
dGhlbiBzZXQgdGhlIGZvcm1lciwgYnV0IG5vdCB0aGUgbGF0dGVyLiBPaz8NCg0KQmVzdCBy
ZWdhcmRzDQpUaG9tYXMNCg0KPiAtRGFuaWVsDQo+IA0KPj4NCj4+IEJlc3QgcmVnYXJkcw0K
Pj4gVGhvbWFzDQo+Pg0KPj4+IC1EYW5pZWwNCj4+Pg0KPj4+Pg0KPj4+PiBTaWduZWQtb2Zm
LWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4NCj4+Pj4gLS0t
DQo+Pj4+ICAgIGRyaXZlcnMvZ3B1L2RybS9kcm1fZmJfaGVscGVyLmMgfCA5ICsrKysrKy0t
LQ0KPj4+PiAgICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9u
cygtKQ0KPj4+Pg0KPj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9mYl9o
ZWxwZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZmJfaGVscGVyLmMNCj4+Pj4gaW5kZXgg
ZWQ0M2I5ODdkMzA2Li5mMTUxMjdhMzJmN2EgMTAwNjQ0DQo+Pj4+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9kcm1fZmJfaGVscGVyLmMNCj4+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2Ry
bV9mYl9oZWxwZXIuYw0KPj4+PiBAQCAtMjM0Niw2ICsyMzQ2LDcgQEAgc3RhdGljIGludCBk
cm1fZmJfaGVscGVyX2dlbmVyaWNfcHJvYmUoc3RydWN0IGRybV9mYl9oZWxwZXIgKmZiX2hl
bHBlciwNCj4+Pj4gICAgCWZiaS0+ZmJvcHMgPSAmZHJtX2ZiZGV2X2ZiX29wczsNCj4+Pj4g
ICAgCWZiaS0+c2NyZWVuX3NpemUgPSBzaXplcy0+c3VyZmFjZV9oZWlnaHQgKiBmYi0+cGl0
Y2hlc1swXTsNCj4+Pj4gICAgCWZiaS0+Zml4LnNtZW1fbGVuID0gZmJpLT5zY3JlZW5fc2l6
ZTsNCj4+Pj4gKwlmYmktPmZsYWdzID0gRkJJTkZPX0RFRkFVTFQ7DQo+Pj4+ICAgIAlkcm1f
ZmJfaGVscGVyX2ZpbGxfaW5mbyhmYmksIGZiX2hlbHBlciwgc2l6ZXMpOw0KPj4+PiBAQCAt
MjM1MywxOSArMjM1NCwyMSBAQCBzdGF0aWMgaW50IGRybV9mYl9oZWxwZXJfZ2VuZXJpY19w
cm9iZShzdHJ1Y3QgZHJtX2ZiX2hlbHBlciAqZmJfaGVscGVyLA0KPj4+PiAgICAJCWZiaS0+
c2NyZWVuX2J1ZmZlciA9IHZ6YWxsb2MoZmJpLT5zY3JlZW5fc2l6ZSk7DQo+Pj4+ICAgIAkJ
aWYgKCFmYmktPnNjcmVlbl9idWZmZXIpDQo+Pj4+ICAgIAkJCXJldHVybiAtRU5PTUVNOw0K
Pj4+PiArCQlmYmktPmZsYWdzIHw9IEZCSU5GT19WSVJURkIgfCBGQklORk9fUkVBRFNfRkFT
VDsNCj4+Pj4gICAgCQlmYmktPmZiZGVmaW8gPSAmZHJtX2ZiZGV2X2RlZmlvOw0KPj4+PiAt
DQo+Pj4+ICAgIAkJZmJfZGVmZXJyZWRfaW9faW5pdChmYmkpOw0KPj4+PiAgICAJfSBlbHNl
IHsNCj4+Pj4gICAgCQkvKiBidWZmZXIgaXMgbWFwcGVkIGZvciBIVyBmcmFtZWJ1ZmZlciAq
Lw0KPj4+PiAgICAJCXJldCA9IGRybV9jbGllbnRfYnVmZmVyX3ZtYXAoZmJfaGVscGVyLT5i
dWZmZXIsICZtYXApOw0KPj4+PiAgICAJCWlmIChyZXQpDQo+Pj4+ICAgIAkJCXJldHVybiBy
ZXQ7DQo+Pj4+IC0JCWlmIChtYXAuaXNfaW9tZW0pDQo+Pj4+ICsJCWlmIChtYXAuaXNfaW9t
ZW0pIHsNCj4+Pj4gICAgCQkJZmJpLT5zY3JlZW5fYmFzZSA9IG1hcC52YWRkcl9pb21lbTsN
Cj4+Pj4gLQkJZWxzZQ0KPj4+PiArCQl9IGVsc2Ugew0KPj4+PiAgICAJCQlmYmktPnNjcmVl
bl9idWZmZXIgPSBtYXAudmFkZHI7DQo+Pj4+ICsJCQlmYmktPmZsYWdzIHw9IEZCSU5GT19W
SVJURkI7DQo+Pj4+ICsJCX0NCj4+Pj4gICAgCQkvKg0KPj4+PiAgICAJCSAqIFNoYW1lbGVz
c2x5IGxlYWsgdGhlIHBoeXNpY2FsIGFkZHJlc3MgdG8gdXNlci1zcGFjZS4gQXMNCj4+Pj4g
LS0gDQo+Pj4+IDIuMzQuMQ0KPj4+Pg0KPj4+DQo+Pg0KPj4gLS0gDQo+PiBUaG9tYXMgWmlt
bWVybWFubg0KPj4gR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KPj4gU1VTRSBTb2Z0d2Fy
ZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQo+PiBNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xy
bmJlcmcsIEdlcm1hbnkNCj4+IChIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCj4+IEdlc2No
w6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCj4gDQo+IA0KPiANCj4gDQoNCi0tIA0KVGhvbWFz
IFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUg
U29sdXRpb25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJn
LCBHZXJtYW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8aHJl
cjogSXZvIFRvdGV2DQo=

--------------t2jtcFBrud4KH5YUPUs0j0SL--

--------------V0s2F47w8DVzWoSKL0TLgDyn
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmHyt+AFAwAAAAAACgkQlh/E3EQov+Bk
Ig//YRztrDZkiy5WsjxKeqFm0DGMGkjwBT5NOoq57AE3uX684m0ILWVVJlwGcxZKwlQCqm9DbEJh
0UZlTlVY8ofGSZdUlo7jrIf997lPdZnV9LYtDnnrThfdceaaokhNk6GeG9Ou3RirLlg+crk33n9S
vqBTUBUChR+2yteqRSV/WW6d2W/gZe6xO40TInvcpvZOW/UxM2MQuUpjy9M4Zpp7LlMaxddc9rVk
Kg/yC+CZ6QeMIzbEQQNsL0P2b9w0F74q9tevTwS4RqEmLg/ymCDa5QTMBwTr5pzURqu4VBd3wZvT
d3TRq0LMtM/Vqt9a70NoDfOihiWeYpSAAnBPds/Zg/dcGI5+KHnodOzEyd3rMzKby9wvPHyKSWlG
0U/Bxthaj+bopY1IxfjwCSQnCxL9R0AjFggYKtMKTvAGvHjrKFs6MpFeTsrhWNi36f5eJniNyA6J
oqjKn+JpjJ8jpcK9eP9oZ4QIGe//AlBXbfxkJG9/8PtnP3547aQxEogN3lzfy95DesMkgqRMxTY1
4C8T5+KDuVSyduHj9wyXCKjK4JWvmvcHFSXc+D+e6K6LRh0UTQ9eJtDko0YuJiXzfRRbTl/7VzQR
IopWjBZZe0yLkMGIPcAlovbtMfYafx0UIcJfFEFf/u3VPzo+5BrZRCwAQ2znFwYjYiAdFps/LVaW
hpM=
=zbDo
-----END PGP SIGNATURE-----

--------------V0s2F47w8DVzWoSKL0TLgDyn--
