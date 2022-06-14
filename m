Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D083A54AF79
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jun 2022 13:47:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B23E10E2EF;
	Tue, 14 Jun 2022 11:47:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12DD210E433
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jun 2022 11:47:30 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id AB74D1F460;
 Tue, 14 Jun 2022 11:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1655207248; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6MLMgFjYbe6DijSmBSzraYulMHqebS9keXMkxnqcd6w=;
 b=XXERb3plklhJrIrKAd1FJYG+0I/MV8pxFcBlFxgl0QxijJa2XoyCuO3Z0WSc/YWXLKBIaN
 siwAmWnYF+aFcVlgsqe8uD8hpynnsd/meLqTqWwIXQrXNDr+OeNgWOQr7SSQi4YlMNqsmf
 NysaEUfcDFsz/YyWEUWSgasaVI8E8tE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1655207248;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6MLMgFjYbe6DijSmBSzraYulMHqebS9keXMkxnqcd6w=;
 b=URQugF+wTVJARP9+kVIvvhVqMjLIdNgRbApPwPnovxU09JXh6fjQFAd6PIaHSKr5W8TzVP
 MaBEhgnNvEGvooCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 90763139EC;
 Tue, 14 Jun 2022 11:47:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id a3NUIlB1qGK6eQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 14 Jun 2022 11:47:28 +0000
Message-ID: <07fca319-f6b4-e022-3291-24c3f6439a86@suse.de>
Date: Tue, 14 Jun 2022 13:47:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 02/64] drm/crtc: Introduce drmm_crtc_init_with_planes
Content-Language: en-US
To: Maxime Ripard <maxime@cerno.tech>
References: <20220610092924.754942-1-maxime@cerno.tech>
 <20220610092924.754942-3-maxime@cerno.tech>
 <d975dc1d-7573-7976-427f-e941cbfa0caf@suse.de>
 <20220614073716.zwshdcf3q5fjobuq@houat>
 <ef19ba8b-ec66-9a00-5456-b4eefbec95cd@suse.de>
 <20220614090440.dwfvsmqnsd7fo24c@houat>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220614090440.dwfvsmqnsd7fo24c@houat>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------fUgvMxMK574KAAzid4J0UzAh"
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------fUgvMxMK574KAAzid4J0UzAh
Content-Type: multipart/mixed; boundary="------------e65495j3LrFXwG98G1zSthp5";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Maxime Ripard <maxime@cerno.tech>
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@intel.com>,
 dri-devel@lists.freedesktop.org
Message-ID: <07fca319-f6b4-e022-3291-24c3f6439a86@suse.de>
Subject: Re: [PATCH 02/64] drm/crtc: Introduce drmm_crtc_init_with_planes
References: <20220610092924.754942-1-maxime@cerno.tech>
 <20220610092924.754942-3-maxime@cerno.tech>
 <d975dc1d-7573-7976-427f-e941cbfa0caf@suse.de>
 <20220614073716.zwshdcf3q5fjobuq@houat>
 <ef19ba8b-ec66-9a00-5456-b4eefbec95cd@suse.de>
 <20220614090440.dwfvsmqnsd7fo24c@houat>
In-Reply-To: <20220614090440.dwfvsmqnsd7fo24c@houat>

--------------e65495j3LrFXwG98G1zSthp5
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgTWF4aW1lDQoNCkFtIDE0LjA2LjIyIHVtIDExOjA0IHNjaHJpZWIgTWF4aW1lIFJpcGFy
ZDoNCj4gT24gVHVlLCBKdW4gMTQsIDIwMjIgYXQgMTA6Mjk6MjBBTSArMDIwMCwgVGhvbWFz
IFppbW1lcm1hbm4gd3JvdGU6DQo+PiBIaQ0KPj4NCj4+IEFtIDE0LjA2LjIyIHVtIDA5OjM3
IHNjaHJpZWIgTWF4aW1lIFJpcGFyZDoNCj4+PiBIaSBUaG9tYXMsDQo+Pj4NCj4+PiBPbiBN
b24sIEp1biAxMywgMjAyMiBhdCAwMToyMzo1NFBNICswMjAwLCBUaG9tYXMgWmltbWVybWFu
biB3cm90ZToNCj4+Pj4gQW0gMTAuMDYuMjIgdW0gMTE6Mjggc2NocmllYiBNYXhpbWUgUmlw
YXJkOg0KPj4+Pj4gVGhlIERSTS1tYW5hZ2VkIGZ1bmN0aW9uIHRvIHJlZ2lzdGVyIGEgQ1JU
QyBpcw0KPj4+Pj4gZHJtbV9jcnRjX2FsbG9jX3dpdGhfcGxhbmVzKCksIHdoaWNoIHdpbGwg
YWxsb2NhdGUgdGhlIHVuZGVybHlpbmcNCj4+Pj4+IHN0cnVjdHVyZSBhbmQgaW5pdGlhbGlz
YXRpb24gdGhlIENSVEMuDQo+Pj4+Pg0KPj4+Pj4gSG93ZXZlciwgd2UgbWlnaHQgd2FudCB0
byBzZXBhcmF0ZSB0aGUgc3RydWN0dXJlIGNyZWF0aW9uIGFuZCB0aGUgQ1JUQw0KPj4+Pj4g
aW5pdGlhbGlzYXRpb24sIGZvciBleGFtcGxlIGlmIHRoZSBzdHJ1Y3R1cmUgaXMgc2hhcmVk
IGFjcm9zcyBtdWx0aXBsZQ0KPj4+Pj4gRFJNIGVudGl0aWVzLCBmb3IgZXhhbXBsZSBhbiBl
bmNvZGVyIGFuZCBhIGNvbm5lY3Rvci4NCj4+Pj4+DQo+Pj4+PiBMZXQncyBjcmVhdGUgYW4g
aGVscGVyIHRvIG9ubHkgaW5pdGlhbGlzZSBhIENSVEMgdGhhdCB3b3VsZCBiZSBwYXNzZWQg
YXMNCj4+Pj4+IGFuIGFyZ3VtZW50Lg0KPj4+Pg0KPj4+PiBCZWZvcmUgSSByZXZpZXcgYWxs
IG9mIHRoZXMgcGF0Y2hlcywgb25lIHF1ZXN0aW9uLiBpdCdzIHlldCBub3QgY2xlYXIgdG8g
bWUNCj4+Pj4gd2h5IGRybV9jcnRjX2luaXRfd2l0aF9wbGFuZXMoKSB3b3VsZG4ndCB3b3Jr
LiAoSSBrbm93IHdlIGRpc2N1c3NlZCB0aGlzIG9uDQo+Pj4+IElSQy4pDQo+Pj4+DQo+Pj4+
IElmIHlvdSdyZSBjYWxsaW5nIGRybW1fbW9kZV9jb25maWdfaW5pdCgpLCBpdCB3aWxsIGNs
ZWFuIHVwIGFsbCB0aGUgQ1JUQywNCj4+Pj4gZW5jb2RlciBjb25uZWN0b3IsIGV0Yy4gZGF0
YSBzdHJ1Y3R1cmVzIGZvciB5b3UuIEZvciBDUlRDIGluc3RhbmNlcyBpbg0KPj4+PiBrbWFs
bG9jZWQgbWVtb3J5LCB3b3VsZG4ndCBpdCBiZSBzaW1wbGVyIHRvIHB1dCB0aGUgY29ycmVz
cG9uZGluZyBrZnJlZSBpbnRvDQo+Pj4+IHZjNF9jcnRjX2Rlc3Ryb3koKT8NCj4+Pg0KPj4+
IE15IGludGVudCB3YXMgdG8gcmVtb3ZlIGFzIG11Y2ggb2YgdGhlIGxpZmV0aW1lIGhhbmRs
aW5nIGFuZA0KPj4+IG1lbW9yeS1tYW5hZ2VtZW50IGZyb20gZHJpdmVycyBhcyBwb3NzaWJs
ZS4NCj4+Pg0KPj4+IE15IGZlZWxpbmcgaXMgdGhhdCB3aGlsZSB0aGUgc29sdXRpb24geW91
IHN1Z2dlc3Qgd291bGQgZGVmaW5pdGVseSB3b3JrLA0KPj4+IGl0IHJlbGllcyBvbiBkcml2
ZXJzIGF1dGhvcnMgdG8ga25vdyBhYm91dCB0aGlzLCBhbmQgbWFrZSB0aGUgZWZmb3J0IHRv
DQo+Pj4gY29udmVydCB0aGUgZHJpdmVycyB0aGVtc2VsdmVzLiBBbmQgdGhlbiB3ZSB3b3Vs
ZCBoYXZlIHRvIHJldmlldyB0aGF0LA0KPj4+IHdoaWNoIHdlIHdpbGwgcHJvYmFibHkgbWlz
cyAoY29sbGVjdGl2ZWx5KSwgYmVjYXVzZSBpdCdzIGEgYml0IG9ic2N1cmUuDQo+Pj4NCj4+
PiBXaGlsZSB3aXRoIGVpdGhlciB0aGUgZHJtbV9hbGxvY18qIGZ1bmN0aW9ucywgb3IgdGhl
IG5ldyBmdW5jdGlvbnMgSQ0KPj4+IGludHJvZHVjZSB0aGVyZSwgd2UgY2FuIGp1c3QgZGVw
cmVjYXRlIHRoZSBvbGQgb25lcywgY3JlYXRlIGEgVE9ETyBlbnRyeQ0KPj4+IGFuZCBhIGNv
Y2NpbmVsbGUgc2NyaXB0IGFuZCB0cnVzdCB0aGF0IGl0IHdvcmtzIHByb3Blcmx5Lg0KPj4N
Cj4+IFRoYW5rcyBmb3IgZXhwbGFpbmluZyB0aGUgbW90aXZhdGlvbi4NCj4+DQo+PiBJIHdv
dWxkIG5vdCB3YW50IHRvIGRlcHJlY2F0ZSBhbnkgb2YgdGhlIGV4aXN0aW5nIGZ1bmN0aW9u
cywgYXMgdGhleSB3b3JrDQo+PiBmb3IgbWFueSBkcml2ZXJzLiBUaGUgZHJtbV8gZnVuY3Rp
b25zIGFkZCBhZGRpdGlvbmFsIG92ZXJoZWFkIHRoYXQgbm90DQo+PiBldmVyeW9uZSBpcyB3
aWxsaW5nIHRvIHBheS4NCj4gDQo+IEknbSBhIGJpdCBjb25mdXNlZC4gZHJtX2NydGNfaW5p
dF93aXRoX3BsYW5lcygpIGF0IHRoZSBtb21lbnQgaGFzOg0KPiANCj4gKiBOb3RlOiBjb25z
aWRlciB1c2luZyBkcm1tX2NydGNfYWxsb2Nfd2l0aF9wbGFuZXMoKSBpbnN0ZWFkIG9mDQo+
ICogZHJtX2NydGNfaW5pdF93aXRoX3BsYW5lcygpIHRvIGxldCB0aGUgRFJNIG1hbmFnZWQg
cmVzb3VyY2UgaW5mcmFzdHJ1Y3R1cmUNCj4gKiB0YWtlIGNhcmUgb2YgY2xlYW51cCBhbmQg
ZGVhbGxvY2F0aW9uLg0KPiANCj4gSnVzdCBsaWtlIGRybV9lbmNvZGVyX2luaXQoKSwgZHJt
X3NpbXBsZV9lbmNvZGVyX2luaXQoKSBhbmQNCj4gZHJtX3VuaXZlcnNhbF9wbGFuZV9pbml0
KCksIHNvIGFsbCB0aGUgZnVuY3Rpb25zIHdlIGhhdmUgYSBkcm1tXyogaGVscGVyDQo+IGZv
ci4NCj4gDQo+IEFuZCB3ZSBoYXZlIGEgVE9ETy1saXN0IGl0ZW0gdGhhdCBoZWF2aWx5IGhp
bnRzIGF0IHVzaW5nIHRoZW06DQo+IGh0dHBzOi8vZHJpLmZyZWVkZXNrdG9wLm9yZy9kb2Nz
L2RybS9ncHUvdG9kby5odG1sI29iamVjdC1saWZldGltZS1maXhlcw0KPiANCj4gU28gaXQg
bG9va3MgbGlrZSB3ZSdyZSBhbHJlYWR5IHdlbGwgb24gdGhlIGRlcHJlY2F0aW9uIHBhdGg/
DQoNCkFGQUlVIHRoYXQgVE9ETyBpdGVtIGlzIGFib3V0IHJlcGxhY2luZyBkZXZtX2t6YWxs
b2MoKSB3aXRoIA0KZHJtbV9remFsbG9jKCkuIEl0J3Mgbm90IGFib3V0IHRoZSBwbGFpbiBp
bml0IGZ1bmN0aW9ucywgc3VjaCBhcyANCmRybV9jcnRjX2luaXRfd2l0aF9wbGFuZXMoKSBv
ciBkcm1fdW5pdmVyc2FsX3BsYW5lX2luaXQoKS4gTWFueSBzaW1wbGUgDQpkcml2ZXJzIGFs
bG9jYXRlIHRoZWlyIG1vZGVzZXR0aW5nIHBpcGVsaW5lJ3MgY29tcG9uZW50cyBmaXJzdCBh
bmQgdGhlbiANCmJ1aWxkIHRoZSBwaXBlbGluZSB3aXRoIHRoZSBkcm1fIGZ1bmN0aW9ucy4g
SSBkb24ndCB0aGluayB3ZSBjYW4gdGFrZSANCnRoYXQgYXdheSBmcm9tIHRoZW0uDQoNClRo
ZSBjb25jZXJuIEkgaGF2ZSBpcyB0aGF0IHdlJ3JlIGFkZGluZyBsb3RzIG9mIGhlbHBlcnMg
Zm9yIGFsbCBraW5kIG9mIA0Kc2NlbmFyaW9zIGFuZCBlbmQgdXAgd2l0aCBhIGxvdCBvZiBk
dXBsaWNhdGlvbiAoYW5kIGZyYWdtZW50YXRpb24gYW1vbmcgDQpkcml2ZXJzKS4gRm9yIGV4
YW1wbGUsIGRybW1fY3J0Y19hbGxvY193aXRoX3BsYW5lcygpIHJlYWxseSBpc24ndCBtdWNo
IA0KdXNlZCBieSBhbnl0aGluZy4gWzFdIFNhbWUgZm9yIGRybW1fdW5pdmVyc2FsX3BsYW5l
X2FsbG9jKCkuIFsyXQ0KDQpJbnN0ZWFkIG9mIGFkZGluZyBuZXcgaGVscGVycywgaXQgd291
bGQgYmUgYmV0dGVyIHRvIGJ1aWxkIHVwb24gDQpkcm1tX2NydGNfYWxsb2Nfd2l0aF9wbGFu
ZXMoKSwgZHJtbV91bml2ZXJhbF9wbGFuZV9hbGxvYygpLCBldGMuDQoNCkZvciBleGFtcGxl
LCBhIGdvb2Qgc3RhcnRpbmcgcG9pbnQgd291bGQgYmUgdmM0X3BsYW5lX2luaXQoKS4gSXQg
Y291bGQgDQphbGxvYyB3aXRoIGRybW1fdW5pdmVyYWxfcGxhbmVfYWxsb2MoKSwgd2hpY2gg
d291bGQgcmVwbGFjZSANCmRldm1fa3phbGxvYygpIFszXSBhbmQgZHJtX3VuaXZlcmFsX3Bs
YW5lX2FsbG9jKCkgWzRdIGluIG9uZSBzdGVwLiBGcm9tIA0Kd2hhdCBJIHVuZGVyc3RhbmQs
IHRoYXQncyB3aGF0IHlvdXIgcGF0Y2hzZXQgd2FudHMgdG8gZG8uIEJ1dCBpdCBsb29rcyAN
Cmxpa2UgeW91J3JlIGVmZmVjdGl2ZWx5IG9wZW4tY29kaW5nIGRybW1fdW5pdmVyc2xfcGxh
bmVfYWxsb2MoKS4NCg0KV2l0aCB2YzRfcGxhbmVfaW5pdCgpIGNvcnJlY3RseSBtYW5hZ2Vk
LCB0aGUgbmV4dCBjYW5kaWRhdGUgY291bGQgYmUgDQp2YzRfY3J0Y19pbml0KCkuIFlvdSBw
cm9iYWJseSB3YW50IHRvIHB1bGwgdmM0X3BsYW5lX2luaXQoKSBbNV0gaW50byANCmNhbGxl
cnMuIHRvIGdldCBpdCBvdXQgb2YgdGhlIHdheS4gSWYgeW91IG1vdmUgY2FsbHMgdG8gZGV2
bV9remFsbG9jKCkgDQpbNl0gYW5kIGRybV9jcnRjX2luaXRfd2l0aF9wbGFuZXMoKSBbN10g
Y2xvc2VyIHRvZ2V0aGVyLCB5b3UgY2FuIHJlcGxhY2UgDQp0aGVtIHdpdGggZHJtbV9jcnRj
X2FsbG9jX3dpdGhfcGxhbmVzKCkuDQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCg0KWzFd
IA0KaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvbGF0ZXN0L0MvaWRlbnQvZHJt
bV9jcnRjX2FsbG9jX3dpdGhfcGxhbmVzDQpbMl0gDQpodHRwczovL2VsaXhpci5ib290bGlu
LmNvbS9saW51eC9sYXRlc3QvQS9pZGVudC9kcm1tX3VuaXZlcnNhbF9wbGFuZV9hbGxvYw0K
WzNdIA0KaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvdjUuMTguMy9zb3VyY2Uv
ZHJpdmVycy9ncHUvZHJtL3ZjNC92YzRfcGxhbmUuYyNMMTQ3OA0KWzRdIA0KaHR0cHM6Ly9l
bGl4aXIuYm9vdGxpbi5jb20vbGludXgvdjUuMTguMy9zb3VyY2UvZHJpdmVycy9ncHUvZHJt
L3ZjNC92YzRfcGxhbmUuYyNMMTQ5MQ0KWzVdIA0KaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5j
b20vbGludXgvbGF0ZXN0L3NvdXJjZS9kcml2ZXJzL2dwdS9kcm0vdmM0L3ZjNF9jcnRjLmMj
TDExMzUNCls2XSANCmh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L3Y1LjE4LjMv
c291cmNlL2RyaXZlcnMvZ3B1L2RybS92YzQvdmM0X2NydGMuYyNMMTE3Ng0KWzddIA0KaHR0
cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvdjUuMTguMy9zb3VyY2UvZHJpdmVycy9n
cHUvZHJtL3ZjNC92YzRfY3J0Yy5jI0wxMTQyDQoNCg0KDQo+IA0KPiBNYXhpbWUNCg0KLS0g
DQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBT
b2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBO
w7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2Now6Rm
dHNmw7xocmVyOiBJdm8gVG90ZXYNCg==

--------------e65495j3LrFXwG98G1zSthp5--

--------------fUgvMxMK574KAAzid4J0UzAh
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmKodVAFAwAAAAAACgkQlh/E3EQov+C5
6w//SdDz7LrZCjTqsMYL4OZMAMcJqwhhyVf+Ymg8bOWmfRCOp/ThuthMCki1vbGCspYlAcwPxpDZ
/L2Wbo6WYtvL4HyIroZQ6T7wI2H7Pc0Y9kLmkpvNGwFR16oH3tpsPcremeFB0iaIi3OndZ+UygSg
HmueofHEG8UojCxQ9Yqcq5krz9hl0r/heHQw2ADcVLcK0H6P1/EyHjfm4kd1aUluPc+0kvpsULHF
E1lN8VNs9j6Svt07mKloJuG6vQsXwYt6vpSylp5exLnOVrWsduHagWUylOcxIW23ml5094MZHeyw
pGG2YR4EYJmKuXZld/45s37lheU07Z0Xyc6KFhGMzVBZjSu6W7HfQ8Myd27PmffvHZh+oVrtPaQA
ijqoKAPliRDR2caDEeqJ3LpgXg7CXjB73s7HmCXJGwqW1OIkn37X/A2bkXhPkaTPyAe0RfDCq2zs
9hrGVul8EDALFu4lcUmQuuimZbulWgxH0YB7awAi+ZiBCNu/sybZK6uqulEDIiashVv0J9GNJd10
4sGRk7ES7a6H360PwxnS/gmCJU/4wWXSGJVNqMdi92liZH7ydMRUFpDgb1+KPaRou7Mmmz6pE9H+
is3nZVO2DMsDrQMdvk59RwO7h69d0EGhjquzaSZwxEMblRqHD5X1GPgWIXksbdFQDiJrlwl01U1I
K/I=
=N19a
-----END PGP SIGNATURE-----

--------------fUgvMxMK574KAAzid4J0UzAh--
