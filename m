Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 760256D91F6
	for <lists+dri-devel@lfdr.de>; Thu,  6 Apr 2023 10:49:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6453410EB3A;
	Thu,  6 Apr 2023 08:49:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9270A10EB43;
 Thu,  6 Apr 2023 08:49:44 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 1EC1A21D21;
 Thu,  6 Apr 2023 08:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1680770983; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7mZRkScsIV+Ew5xY/hlkHQIc0aEZGd9wXqDJsJeKdeY=;
 b=rCiUWNPN15EPeHH5+Gj4zvpiAUyZIdmEu5GqwxDYrpFNS2RpqiDRmLPnUTKVH/QYtkykBT
 2g/z59+E1H1NC7gdfgKzuwpo9rcz/OpRMH59R6VS7TGE9LxNHjUpwC2+/+p1DHyjaMkSwp
 5DNKeE73XsY9p3KLcbnHE5OcYWwL06o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1680770983;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7mZRkScsIV+Ew5xY/hlkHQIc0aEZGd9wXqDJsJeKdeY=;
 b=sIHLlpNnJmq5Z+f26kXA07PfTREhbVBcWcTv+pAfBVrqT8eS9vX73IHu0xnd8iwCAM0JKN
 yIUsSW/2TT5+FKDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id EFC43133E5;
 Thu,  6 Apr 2023 08:49:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ab9yOaaHLmT6bwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 06 Apr 2023 08:49:42 +0000
Message-ID: <f5f9fe8e-9df2-e201-b7f3-be717fa4bdb8@suse.de>
Date: Thu, 6 Apr 2023 10:49:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 1/8] drm/gma500: Use
 drm_aperture_remove_conflicting_pci_framebuffers
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20230404201842.567344-1-daniel.vetter@ffwll.ch>
 <66f9196e-df2b-19ce-e2ec-15f7a81d63c7@suse.de>
 <87ttxt8kxr.fsf@minerva.mail-host-address-is-not-set>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <87ttxt8kxr.fsf@minerva.mail-host-address-is-not-set>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------3pqiXyAbefLy4A8bvbKDlY30"
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------3pqiXyAbefLy4A8bvbKDlY30
Content-Type: multipart/mixed; boundary="------------we12hGAWYzl8ff05agrkT3T0";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Message-ID: <f5f9fe8e-9df2-e201-b7f3-be717fa4bdb8@suse.de>
Subject: Re: [PATCH 1/8] drm/gma500: Use
 drm_aperture_remove_conflicting_pci_framebuffers
References: <20230404201842.567344-1-daniel.vetter@ffwll.ch>
 <66f9196e-df2b-19ce-e2ec-15f7a81d63c7@suse.de>
 <87ttxt8kxr.fsf@minerva.mail-host-address-is-not-set>
In-Reply-To: <87ttxt8kxr.fsf@minerva.mail-host-address-is-not-set>

--------------we12hGAWYzl8ff05agrkT3T0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDYuMDQuMjMgdW0gMTA6Mzggc2NocmllYiBKYXZpZXIgTWFydGluZXogQ2Fu
aWxsYXM6DQo+IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPiB3cml0
ZXM6DQo+IA0KPiBbLi4uXQ0KPiANCj4+IEFtIDA0LjA0LjIzIHVtIDIyOjE4IHNjaHJpZWIg
RGFuaWVsIFZldHRlcjoNCj4+IEdtYTUwMCB0aGVyZWZvcmUgY2FsbHMgYm90aCBoZWxwZXJz
IHRvIGNhdGNoIGFsbCBjYXNlcy4gSXQncyBjb25mdXNpbmcNCj4+IGFzIGl0IGltcGxpZXMg
dGhhdCB0aGVyZSdzIHNvbWV0aGluZyBhYm91dCB0aGUgUENJIGRldmljZSB0aGF0IHJlcXVp
cmVzDQo+PiBvd25lcnNoaXAgbWFuYWdlbWVudC4gVGhlIHJlbGF0aW9uc2hpcCBiZXR3ZWVu
IHRoZSBQQ0kgZGV2aWNlIGFuZCB0aGUNCj4+IFZHQSBkZXZpY2VzIGlzIG5vbi1vYnZpb3Vz
LiBBdCB3b3JzdCwgcmVhZGVycyBtaWdodCBhc3N1bWUgdGhhdCBjYWxsaW5nDQo+PiB0d28g
ZnVuY3Rpb25zIGZvciBhcGVydHVyZSBjbGVhcmluZyBvd25lcnNoaXAgaXMgYSBidWcgaW4g
dGhlIGRyaXZlci4NCj4+DQo+IA0KPiBZZWFoLCBvciBzb21lb25lIGxvb2tpbmcgYXMgdGhl
IGRyaXZlciBmb3IgcmVmZXJlbmNlIG1heSB3cm9uZ2x5IHRoaW5rDQo+IHRoYXQgY2FsbGlu
ZyBib3RoIGFwZXJ0dXJlIGhlbHBlcnMgYXJlIG5lZWRlZCBmb3IgUENJIGRyaXZlcnMgYW5k
IHRoYXQNCj4gaXMgbm90IHRoZSBjYXNlLg0KPiANCj4+IEhlbmNlLCBtb3ZlIHRoZSBQQ0kg
cmVtb3ZhbCBoZWxwZXIncyBjb2RlIGZvciBWR0EgZnVuY3Rpb25hbGl0eSBpbnRvDQo+PiBh
IHNlcGFyYXRlIGZ1bmN0aW9uIGFuZCBjYWxsIHRoaXMgZnVuY3Rpb24gZnJvbSBnbWE1MDAu
IERvY3VtZW50cyB0aGUNCj4+IHB1cnBvc2Ugb2YgZWFjaCBjYWxsIHRvIGFwZXJ0dXJlIGhl
bHBlcnMuIFRoZSBjaGFuZ2UgY29udGFpbnMgY29tbWVudHMNCj4+IGFuZCBleGFtcGxlIGNv
ZGUgZm9ybSB0aGUgZGlzY3Vzc2lvbiBhdCBbMV0uDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTog
VGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+DQo+PiBMaW5rOiBodHRw
czovL3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3QvZHJpLWRldmVsL3BhdGNoLzIwMjMw
NDA0MjAxODQyLjU2NzM0NC0xLWRhbmllbC52ZXR0ZXJAZmZ3bGwuY2gvICMgMQ0KPj4gLS0t
DQo+IA0KPiBMb29rcyBnb29kIHRvIG1lIGFuZCBJIGFncmVlIHRoYXQgaXQgbWFrZXMgdGhl
IGNvZGUgZWFzaWVyIHRvIHVuZGVyc3RhbmQuDQo+IA0KPiBSZXZpZXdlZC1ieTogSmF2aWVy
IE1hcnRpbmV6IENhbmlsbGFzIDxqYXZpZXJtQHJlZGhhdC5jb20+DQoNClRoYW5rcyBmb3Ig
dGhlIHJldmlldy4NCg0KPiANCj4gSSd2ZSBhIGNvdXBsZSBvZiBjb21tZW50cyBiZWxvdyB0
aG91Z2g6DQo+IA0KPiBbLi4uXQ0KPiANCj4+ICsgKiBIYXJkd2FyZSBmb3IgZ21hNTAwIGlz
IGEgaHlicmlkIGRldmljZSwgd2hpY2ggYm90aCBhY3RzIGFzIGEgUENJDQo+PiArICogZGV2
aWNlIChmb3IgbGVnYWN5IHZnYSBmdW5jdGlvbmFsaXR5KSBidXQgYWxzbyBtb3JlIGxpa2Ug
YW4NCj4+ICsgKiBpbnRlZ3JhdGVkIGRpc3BsYXkgb24gYSBTb0Mgd2hlcmUgdGhlIGZyYW1l
YnVmZmVyIHNpbXBseQ0KPj4gKyAqIHJlc2lkZXMgaW4gbWFpbiBtZW1vcnkgYW5kIG5vdCBp
biBhIHNwZWNpYWwgUENJIGJhciAodGhhdA0KPj4gKyAqIGludGVybmFsbHkgcmVkaXJlY3Rz
IHRvIGEgc3RvbGVuIHJhbmdlIG9mIG1haW4gbWVtb3J5KSBsaWtlIGFsbA0KPj4gKyAqIG90
aGVyIGludGVncmF0ZWQgUENJIGRpc3BsYXkgZGV2aWNlcyBoYXZlLg0KPj4gKyAqDQo+IA0K
PiBJcyAiaGF2ZSIgdGhlIGNvcnJlY3Qgd29yZCBoZXJlIG9yICJkbyIgPyBPciBtYXliZSAi
YXJlIGltcGxlbWVudGVkIiA/DQoNClJpZ2h0LiBJJ2xsIHVwZGF0ZSB0aGlzLg0KDQo+IA0K
Pj4gKyAqIFRvIGNhdGNoIGFsbCBjYXNlcyB3ZSBuZWVkIHRvIHJlbW92ZSBjb25mbGljdGlu
ZyBmaXJtd2FyZSBkZXZpY2VzDQo+PiArICogZm9yIHRoZSBzdG9sZW4gc3lzdGVtIG1lbW9y
eSBhbmQgZm9yIHRoZSBWR0EgZnVuY3Rpb25hbGl0eS4gQXMgd2UNCj4+ICsgKiBjdXJyZW50
bHkgY2Fubm90IGVhc2lseSBmaW5kIHRoZSBmcmFtZWJ1ZmZlcidzIGxvY2F0aW9uIGluIHN0
b2xlbg0KPj4gKyAqIG1lbW9yeSwgd2UgcmVtb3ZlIGFsbCBmcmFtZWJ1ZmZlcnMgaGVyZS4N
Cj4+ICsgKg0KPj4gKyAqIFRPRE86IFJlZmFjdG9yIHBzYl9kcml2ZXJfbG9hZCgpIHRvIG1h
cCB2ZGNfcmVnIGVhcmxpZXIuIFRoZW4NCj4+ICsgKiAgICAgICB3ZSBtaWdodCBiZSBhYmxl
IHRvIHJlYWQgdGhlIGZyYW1lYnVmZmVyIHJhbmdlIGZyb20gdGhlDQo+PiArICogICAgICAg
ZGV2aWNlLg0KPj4gKyAqLw0KPj4gK3N0YXRpYyBpbnQgZ21hX3JlbW92ZV9jb25mbGljdGlu
Z19mcmFtZWJ1ZmZlcnMoc3RydWN0IHBjaV9kZXYgKnBkZXYsDQo+PiArCQkJCQkgICAgICAg
Y29uc3Qgc3RydWN0IGRybV9kcml2ZXIgKnJlcV9kcml2ZXIpDQo+PiAgIHsNCj4+IC0Jc3Ry
dWN0IGRybV9wc2JfcHJpdmF0ZSAqZGV2X3ByaXY7DQo+PiAtCXN0cnVjdCBkcm1fZGV2aWNl
ICpkZXY7DQo+PiArCXJlc291cmNlX3NpemVfdCBiYXNlID0gMDsNCj4+ICsJcmVzb3VyY2Vf
c2l6ZV90IHNpemUgPSBQSFlTX0FERFJfTUFYOw0KPj4gKwljb25zdCBjaGFyICpuYW1lID0g
cmVxX2RyaXZlci0+bmFtZTsNCj4+ICAgCWludCByZXQ7DQo+PiAgIA0KPj4gLQkvKg0KPj4g
LQkgKiBXZSBjYW5ub3QgeWV0IGVhc2lseSBmaW5kIHRoZSBmcmFtZWJ1ZmZlcidzIGxvY2F0
aW9uIGluIG1lbW9yeS4gU28NCj4+IC0JICogcmVtb3ZlIGFsbCBmcmFtZWJ1ZmZlcnMgaGVy
ZS4gTm90ZSB0aGF0IHdlIHN0aWxsIHdhbnQgdGhlIHBjaSBzcGVjaWFsDQo+PiAtCSAqIGhh
bmRsaW5nIHRvIGtpY2sgb3V0IHZnYWNvbi4NCj4+IC0JICoNCj4+IC0JICogVE9ETzogUmVm
YWN0b3IgcHNiX2RyaXZlcl9sb2FkKCkgdG8gbWFwIHZkY19yZWcgZWFybGllci4gVGhlbiB3
ZQ0KPj4gLQkgKiAgICAgICBtaWdodCBiZSBhYmxlIHRvIHJlYWQgdGhlIGZyYW1lYnVmZmVy
IHJhbmdlIGZyb20gdGhlIGRldmljZS4NCj4+IC0JICovDQo+PiAtCXJldCA9IGRybV9hcGVy
dHVyZV9yZW1vdmVfZnJhbWVidWZmZXJzKCZkcml2ZXIpOw0KPj4gKwlyZXQgPSBhcGVydHVy
ZV9yZW1vdmVfY29uZmxpY3RpbmdfZGV2aWNlcyhiYXNlLCBzaXplLCBuYW1lKTsNCj4+ICAg
CWlmIChyZXQpDQo+PiAgIAkJcmV0dXJuIHJldDsNCj4+ICAgDQo+PiAtCXJldCA9IGRybV9h
cGVydHVyZV9yZW1vdmVfY29uZmxpY3RpbmdfcGNpX2ZyYW1lYnVmZmVycyhwZGV2LCAmZHJp
dmVyKTsNCj4+ICsJcmV0dXJuIF9fYXBlcnR1cmVfcmVtb3ZlX2xlZ2FjeV92Z2FfZGV2aWNl
cyhwZGV2KTsNCj4gDQo+IEkgZG9uJ3QgbGlrZSB0aGUgX18gcHJlZml4IGZvciB0aGlzIGZ1
bmN0aW9uIG5hbWUsIGFzIGl0IHVzdWFsbHkgaW1wbGllcw0KPiB0aGF0IGlzIGEgZnVuY3Rp
b24gdGhhdCBpcyBvbmx5IGxvY2FsIHRvIHRoZSBjb21waWxhdGlvbiB1bml0LiBCdXQgaXQg
aXMNCj4gYW4gZXhwb3J0ZWQgc3ltYm9sIGZyb20gdGhlIGFwZXJ0dXJlIGluZnJhc3RydWN0
dXJlLg0KPiANCj4gWy4uLl0NCj4gICAgDQo+PiArLyoqDQo+PiArICogX19hcGVydHVyZV9y
ZW1vdmVfbGVnYWN5X3ZnYV9kZXZpY2VzIC0gcmVtb3ZlIGxlZ2FjeSBWR0EgZGV2aWNlcyBv
ZiBhIFBDSSBkZXZpY2VzDQo+PiArICogQHBkZXY6IFBDSSBkZXZpY2UNCj4+ICsgKg0KPj4g
KyAqIFRoaXMgZnVuY3Rpb24gcmVtb3ZlcyBWR0EgZGV2aWNlcyBwcm92aWRlZCBieSBAcGRl
diwgc3VjaCBhcyBhIFZHQQ0KPj4gKyAqIGZyYW1lYnVmZmVyIG9yIGEgY29uc29sZS4gVGhp
cyBpcyB1c2VmdWwgaWYgeW91IGhhdmUgYSBWR0EtY29tcGF0aWJsZQ0KPj4gKyAqIFBDSSBn
cmFwaGljcyBkZXZpY2Ugd2l0aCBmcmFtZWJ1ZmZlcnMgaW4gbm9uLUJBUiBsb2NhdGlvbnMu
IERyaXZlcnMNCj4+ICsgKiBzaG91bGQgYWNxdWlyZSBvd25lcnNoaXAgb2YgdGhvc2UgbWVt
b3J5IGFyZWFzIGFuZCBhZnRlcndhcmRzIGNhbGwNCj4+ICsgKiB0aGlzIGhlbHBlciB0byBy
ZWxlYXNlIHJlbWFpbmluZyBWR0EgZGV2aWNlcy4NCj4+ICsgKg0KPj4gKyAqIElmIHlvdXIg
aGFyZHdhcmUgaGFzIGl0cyBmcmFtZWJ1ZmZlcnMgYWNjZXNzaWJsZSB2aWEgUENJIEJBUlMs
IHVzZQ0KPj4gKyAqIGFwZXJ0dXJlX3JlbW92ZV9jb25mbGljdGluZ19wY2lfZGV2aWNlcygp
IGluc3RlYWQuIFRoZSBmdW5jdGlvbiB3aWxsDQo+PiArICogcmVsZWFzZSBhbnkgVkdBIGRl
dmljZXMgYXV0b21hdGljYWxseS4NCj4+ICsgKg0KPj4gKyAqIFdBUk5JTkc6IEFwcGFyZW50
bHkgd2UgbXVzdCByZW1vdmUgZ3JhcGhpY3MgZHJpdmVycyBiZWZvcmUgY2FsbGluZw0KPj4g
KyAqICAgICAgICAgIHRoaXMgaGVscGVyLiBPdGhlcndpc2UgdGhlIHZnYSBmYmRldiBkcml2
ZXIgZmFsbHMgb3ZlciBpZg0KPj4gKyAqICAgICAgICAgIHdlIGhhdmUgdmdhY29uIGNvbmZp
Z3VyZWQuDQo+PiArICoNCj4+ICsgKiBSZXR1cm5zOg0KPj4gKyAqIDAgb24gc3VjY2Vzcywg
b3IgYSBuZWdhdGl2ZSBlcnJubyBjb2RlIG90aGVyd2lzZQ0KPj4gKyAqLw0KPj4gK2ludCBf
X2FwZXJ0dXJlX3JlbW92ZV9sZWdhY3lfdmdhX2RldmljZXMoc3RydWN0IHBjaV9kZXYgKnBk
ZXYpDQo+PiArew0KPj4gKwkvKiBWR0EgZnJhbWVidWZmZXIgKi8NCj4+ICsJYXBlcnR1cmVf
ZGV0YWNoX2RldmljZXMoVkdBX0ZCX1BIWVNfQkFTRSwgVkdBX0ZCX1BIWVNfU0laRSk7DQo+
PiArDQo+PiArCS8qIFZHQSB0ZXh0bW9kZSBjb25zb2xlICovDQo+PiArCXJldHVybiB2Z2Ff
cmVtb3ZlX3ZnYWNvbihwZGV2KTsNCj4+ICt9DQo+PiArRVhQT1JUX1NZTUJPTChfX2FwZXJ0
dXJlX3JlbW92ZV9sZWdhY3lfdmdhX2RldmljZXMpOw0KPiANCj4gSSB3b3VsZCBqdXN0IGNh
bGwgdGhpcyBzeW1ib2wgYXBlcnR1cmVfcmVtb3ZlX2xlZ2FjeV92Z2FfZGV2aWNlcygpIGFz
DQo+IG1lbnRpb25lZCwgdGhlIGZhY3QgdGhhdCBhcGVydHVyZV9yZW1vdmVfY29uZmxpY3Rp
bmdfcGNpX2RldmljZXMoKSB1c2UgaXQNCj4gaW50ZXJuYWxseSBpcyBhbiBpbXBsZW1lbnRh
dGlvbiBkZXRhaWwgSU1PLiBCdXQgaXQncyBhbiBleHBvcnRlZCBzeW1ib2wgc28NCj4gdGhl
IG5hbWluZyBzaG91bGQgYmUgY29uc2lzdGVudC4NCg0KVGhhdCBwcmVmaXggX18gaXMgc3Vw
cG9zZWQgdG8gaW5kaWNhdGUgdGhhdCBpdCdzIG5vdCBhIGFsbC1pbi1vbmUgDQpzb2x1dGlv
bi4gTW9zdCBvZiBhbGwsIGl0IGRvZXNuJ3QgZG8gc3lzZmJfZGlzYWJsZSgpLiBUaGUgaGVs
cGVyIGlzIA0KbWVhbnQgdG8gYmUgdXNlZCBhcyBwYXJ0IG9mIGEgbGFyZ2VyIGZ1bmN0aW9u
LiBJIHRyaWVkIHRvIG91dGxpbmUgdGhpcyANCmluIHRoZSBjb21tZW50LCB3aGVyZSBJIHNh
eSB0aGF0IGRyaXZlcnMgc2hvdWxkIGZpcnN0IGFxdWlyZSBmcmFtZWJ1ZmZlciANCm93bmVy
c2hpcCBhbmQgdGhlbiBjYWxsIHRoaXMgaGVscGVyLiBJZiBuYW1pbmcgaXNuJ3QgYSBzaG93
c3RvcHBlciwgSSdkIA0KbGlrZSB0byBrZWVwIHRoZSB1bmRlcnNjb3Jlcy4NCg0KQmVzdCBy
ZWdhcmRzDQpUaG9tYXMNCg0KPiANCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhp
Y3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBH
bWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4
MDksIEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCg==

--------------we12hGAWYzl8ff05agrkT3T0--

--------------3pqiXyAbefLy4A8bvbKDlY30
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmQuh6YFAwAAAAAACgkQlh/E3EQov+D4
0w//ZWYNXnZ+VFGnJEFJw1r8z9S0WzYeNzpdL90ekjAyzQSnyjN4U8eDZCYJ/C3J72ifiwsx7p8m
2bjeWaYLXvi40mVc88Q3QiNEj0d+krujAVKLAU9pttTodVxnzoHnjVMeDPvUUsw01EWYqi5XHtrt
OXfVCTiDcYnuLndbhlbA1EZ/J2UU9lM9a5RQgWL/RUxNW8LeNDCxMQmjPKQ/EsoEtYCExJc4YOFC
TjNFBK+lRslDzHL8jxdnudQE7MqT/GaFNlPG/KEEz9XaoKyEPl1TZz9AcZCq6MXr41/cAt90dKks
E7UhSPx2R3GhaDgqU75JEnl6z2gaukaV/Svx8lWjAHqoN/gH6oSy/noWitTv5q2ODWZA707j8iC4
XSWYO5JT5TCkse1AUeE3cE3+A+zPKcXcW+/uW8k4CCot3kUTJP5Gtj2U1NglLBkBl9LGXpLZXOZ0
3JkMwwSC4/D4KgMg6KdXT7y9OidMlQZFcoywBn92dX5sXHRvDfImY4t7crEpJ6lFVLGvIHC0+GqG
vr0b4AD6/HS/Ja+RhZ4iLX9ORMnsLFDGiAoc5IqGFhs2A8ymdBiUX7GR0CmdFfoClcZ5IxDmPF5H
UsnfwX/CvcWhW57pcTzCGiiD8j9P7jY3X20UKJqx8BbgE14Yai1MVMxw3fU0SdtE8cuGg+k3vhkO
DW4=
=Zee5
-----END PGP SIGNATURE-----

--------------3pqiXyAbefLy4A8bvbKDlY30--
