Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEF156671D9
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jan 2023 13:15:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF5A310E2E4;
	Thu, 12 Jan 2023 12:15:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A537610E2E4;
 Thu, 12 Jan 2023 12:15:50 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 426553F26A;
 Thu, 12 Jan 2023 12:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1673525749; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=J/EiKam3sZue+l+klqKh2zvhcKpCKWR8ZcRcUwtxsFE=;
 b=JlN9l9zJTdDM+1y2gEtmls7UuqwrV4sCuKswMEeMLRro3SnNjOVuqXHEDlUxjIGCAoVHyA
 AmMaquy8RH2XhA0seaEx3nh2UN/11F0MX3mvFiu9mLvMIcqMazrARtIxzqXfXq59c0c3Ti
 axEcmenhO95/7mfmhKvgGZDGvpUGPIE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1673525749;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=J/EiKam3sZue+l+klqKh2zvhcKpCKWR8ZcRcUwtxsFE=;
 b=mrvVASDrcxD1F/F7FPE2jhtOGlxSUwAlfdbW1MEtEXmW6ok+dYyXKz18BawdDujcPRsIgo
 zLkDgJ9eKH9EarBw==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 241E4136AE;
 Thu, 12 Jan 2023 12:15:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id ygfQB/X5v2MFWQAAGKfGzw
 (envelope-from <tzimmermann@suse.de>); Thu, 12 Jan 2023 12:15:49 +0000
Message-ID: <c4f8ffde-2226-cc1f-a5a8-d7462b92cb24@suse.de>
Date: Thu, 12 Jan 2023 13:15:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 02/11] drm/gma500: Use
 drm_aperture_remove_conflicting_pci_framebuffers
Content-Language: en-US
To: DRI Development <dri-devel@lists.freedesktop.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, Daniel Vetter <daniel.vetter@intel.com>
References: <20230111154112.90575-1-daniel.vetter@ffwll.ch>
 <20230111154112.90575-2-daniel.vetter@ffwll.ch>
 <bad82927-1c58-4c2a-c265-571e10d1f67d@suse.de>
 <Y7/Z5dvADG6AspV3@phenom.ffwll.local>
 <8a154783-b433-c9b8-bfe5-286dde1258e9@suse.de>
 <Y7/kw+JdGCHJdptI@phenom.ffwll.local>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <Y7/kw+JdGCHJdptI@phenom.ffwll.local>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------ypSpHYAck0gxNmzFnbMJOqYF"
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
--------------ypSpHYAck0gxNmzFnbMJOqYF
Content-Type: multipart/mixed; boundary="------------pBFFBLeS18imoopHCeEattG0";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: DRI Development <dri-devel@lists.freedesktop.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, Daniel Vetter <daniel.vetter@intel.com>
Message-ID: <c4f8ffde-2226-cc1f-a5a8-d7462b92cb24@suse.de>
Subject: Re: [PATCH 02/11] drm/gma500: Use
 drm_aperture_remove_conflicting_pci_framebuffers
References: <20230111154112.90575-1-daniel.vetter@ffwll.ch>
 <20230111154112.90575-2-daniel.vetter@ffwll.ch>
 <bad82927-1c58-4c2a-c265-571e10d1f67d@suse.de>
 <Y7/Z5dvADG6AspV3@phenom.ffwll.local>
 <8a154783-b433-c9b8-bfe5-286dde1258e9@suse.de>
 <Y7/kw+JdGCHJdptI@phenom.ffwll.local>
In-Reply-To: <Y7/kw+JdGCHJdptI@phenom.ffwll.local>

--------------pBFFBLeS18imoopHCeEattG0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTIuMDEuMjMgdW0gMTE6NDUgc2NocmllYiBEYW5pZWwgVmV0dGVyOg0KPiBP
biBUaHUsIEphbiAxMiwgMjAyMyBhdCAxMToyNDoxM0FNICswMTAwLCBUaG9tYXMgWmltbWVy
bWFubiB3cm90ZToNCj4+IEhpDQo+Pg0KPj4gQW0gMTIuMDEuMjMgdW0gMTA6NTkgc2Nocmll
YiBEYW5pZWwgVmV0dGVyOg0KPj4+IE9uIFRodSwgSmFuIDEyLCAyMDIzIGF0IDEwOjA0OjQ4
QU0gKzAxMDAsIFRob21hcyBaaW1tZXJtYW5uIHdyb3RlOg0KPj4+PiBIaQ0KPj4+Pg0KPj4+
PiBBbSAxMS4wMS4yMyB1bSAxNjo0MSBzY2hyaWViIERhbmllbCBWZXR0ZXI6DQo+Pj4+PiBU
aGlzIG9uZSBudWtlcyBhbGwgZnJhbWVidWZmZXJzLCB3aGljaCBpcyBhIGJpdCBtdWNoLiBJ
biByZWFsaXR5DQo+Pj4+PiBnbWE1MDAgaXMgaWdwdSBhbmQgbmV2ZXIgc2hpcHBlZCB3aXRo
IGFueXRoaW5nIGRpc2NyZXRlLCBzbyB0aGVyZSBzaG91bGQNCj4+Pj4+IG5vdCBiZSBhbnkg
ZGlmZmVyZW5jZS4NCj4+Pj4+DQo+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgVmV0dGVy
IDxkYW5pZWwudmV0dGVyQGludGVsLmNvbT4NCj4+Pj4+IC0tLQ0KPj4+Pj4gICAgIGRyaXZl
cnMvZ3B1L2RybS9nbWE1MDAvcHNiX2Rydi5jIHwgMiArLQ0KPj4+Pj4gICAgIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPj4+Pj4NCj4+Pj4+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZ21hNTAwL3BzYl9kcnYuYyBiL2RyaXZlcnMv
Z3B1L2RybS9nbWE1MDAvcHNiX2Rydi5jDQo+Pj4+PiBpbmRleCBjZDljNzNmNWE2NGEuLjli
MGRhZjkwZGM1MCAxMDA2NDQNCj4+Pj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9nbWE1MDAv
cHNiX2Rydi5jDQo+Pj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZ21hNTAwL3BzYl9kcnYu
Yw0KPj4+Pj4gQEAgLTQyOSw3ICs0MjksNyBAQCBzdGF0aWMgaW50IHBzYl9wY2lfcHJvYmUo
c3RydWN0IHBjaV9kZXYgKnBkZXYsIGNvbnN0IHN0cnVjdCBwY2lfZGV2aWNlX2lkICplbnQp
DQo+Pj4+PiAgICAgCSAqIFRPRE86IFJlZmFjdG9yIHBzYl9kcml2ZXJfbG9hZCgpIHRvIG1h
cCB2ZGNfcmVnIGVhcmxpZXIuIFRoZW4gd2UNCj4+Pj4+ICAgICAJICogICAgICAgbWlnaHQg
YmUgYWJsZSB0byByZWFkIHRoZSBmcmFtZWJ1ZmZlciByYW5nZSBmcm9tIHRoZSBkZXZpY2Uu
DQo+Pj4+PiAgICAgCSAqLw0KPj4+Pj4gLQlyZXQgPSBkcm1fYXBlcnR1cmVfcmVtb3ZlX2Zy
YW1lYnVmZmVycyh0cnVlLCAmZHJpdmVyKTsNCj4+Pj4+ICsJcmV0ID0gZHJtX2FwZXJ0dXJl
X3JlbW92ZV9jb25mbGljdGluZ19wY2lfZnJhbWVidWZmZXJzKHBkZXYsICZkcml2ZXIpOw0K
Pj4+Pg0KPj4+PiBUaGlzIGRvZXMgbm90IHdvcmsuIFRoZSBjb21tZW50IGp1c3QgYWJvdmUg
dGhlIGNoYW5nZWQgbGluZSBleHBsYWlucyB3aHkuDQo+Pj4+IFRoZSBkZXZpY2UgdXNlcyBz
aGFyZWQgbWVtb3J5IHNpbWlsYXIgdG8gb3RoZXIgaW50ZWdyYXRlZCBJbnRlbCBjaGlwcy4g
VGhlDQo+Pj4+IGNvbnNvbGUgaXMgc29tZXdoZXJlIGluIGEgMTYgTWlCIHJhbmdlLCB3aGlj
aCBoYXMgYmVlbiBzdG9sZW4gYnkgdGhlIEJJT1MNCj4+Pj4gZnJvbSBtYWluIG1lbW9yeS4g
VGhlcmUncyBvbmx5IGEgMSBNaUIgbWVtb3J5IHJhbmdlIG9uIHRoZSBkZXZpY2UgdG8gcHJv
Z3JhbQ0KPj4+PiB0aGUgZGV2aWNlLiBVbmxlc3MgeW91IHdhbnQgdG8gcmVmYWN0b3IgYXMg
ZGVzY3JpYmVkLCB0aGlzIGNhbGwgaGFzIHRvIGNvdmVyDQo+Pj4+IHRoZSB3aG9sZSBtZW1v
cnkgZm9yIG5vdy4NCj4+Pg0KPj4+IFVoLiBTbyBpdCdzIG1heWJlIG5vdCBzbyBwcmV0dHks
IGJ1dCB3aGF0IGlmIEkganVzdCBjYWxsIGJvdGggZnVuY3Rpb25zPw0KPj4NCj4+IFRoYXQn
cyB3YXlzIG1vcmUgdWdseSBJTUhPLg0KPj4NCj4+PiBUaGF0IHdheSB3ZSBnZXQgdGhlIHZn
YSBoYW5kbGluZyB0aHJvdWdoIHRoZSBwY2kgb25lLCBhbmQgdGhlICJtYWtlIHN1cmUNCj4+
PiB0aGVyZSdzIG5vIGZiIGxlZnQiIHRocm91Z2ggdGhlIG90aGVyIG9uZS4gUGx1cyBjb21t
ZW50IG9mIGNvdXJzZS4NCj4+Pg0KPj4+IE90aGVyd2lzZSB3ZSdkIG5lZWQgdG8gc29tZWhv
dyBrZWVwIHRoZSB2Z2Egc3R1ZmYgaW4gdGhlIG5vbi1wY2kgcGF0aHMsDQo+Pj4gYW5kIHRo
YXQganVzdCBmZWVscyBhbGwga2luZHMgb2Ygd3JvbmcgdG8gbWUuDQo+Pg0KPj4gV2l0aCB5
b3VyIHBhdGNoIGFwcGxpZWQsIGFwZXJ0dXJlX2RldGFjaF9kZXZpY2VzKCkgZG9lcyBhbGwg
dGhlIHdvcmsgb2YNCj4+IHJlbW92aW5nLiBJJ2QgYWRkIHRoZSBmb2xsb3dpbmcgaW50ZXJu
YWwgZnVuY3Rpb25zOg0KPj4NCj4+IHN0YXRpYyB2b2lkIGFwZXJ0dXJlX2RldGFjaF9oZWFk
KGJvb2wgaXNfcHJpbWFyeSkNCj4+IHsNCj4+IAkvKg0KPj4gCSAqIGxlbmd0aHkgY29tbWVu
dCBoZXJlDQo+PiAJICovDQo+PiAJaWYgKGlzX3ByaW1hcnkpDQo+PiAJCXN5c2ZiX2Rpc2Fi
bGUoKQ0KPj4gfQ0KPj4NCj4+IHN0YXRpYyB2b2lkIGFwZXJ0dXJlX2RldGFjaF90YWlsKGJv
b2wgcmVtb3ZlX3ZnYSkNCj4+IHsNCj4+IAlpZiAocmVtb3ZlX3ZnYSkgew0KPj4gCQlhcGVy
dHVyZV9kZXRhY2hfZGV2aWNlcyhWR0FfUEhZU18pDQo+PiAJCXZnYV9yZW1vdmVfdmdhY29u
KCkNCj4+IAl9DQo+PiB9DQo+Pg0KPj4gQW5kIGNhbGwgYm90aCBvZiB0aGVtIGF0IHRoZSBi
ZWdpbm5pbmcvZW5kIG9mDQo+PiBhcGVydHVyZV9yZW1vdmVfY29uZmxpY3RpbmdfZGV2aWNl
cygpIGFuZA0KPj4gYXBlcnR1cmVfcmVtb3ZlX2NvbmZsaWN0aW5nX3BjaV9kZXZpY2VzKCku
DQo+Pg0KPj4gWW91J2Qgc3RpbGwgbmVlZCB0byBwcmltYXJ5IGFyZ3VtZW50IHRvDQo+PiBh
cGVydHVyZV9yZW1vdmVfY29uZmxpY3RpbmdfZGV2aWNlcygpLCBidXQgdGhlcmUgd2lsbCBi
ZSBubyBjb2RlIGR1cGxpY2F0aW9uDQo+PiB3aXRoIHRoZSBhcGVydHVyZSBoZWxwZXJzIGFu
ZCB0aGUgcHVycG9zZSBvZiBlYWNoIGNvZGUgZnJhZ21lbnQgd2lsbCBiZQ0KPj4gY2xlYXJl
ci4NCj4gDQo+IFllYWggSSBkb24ndCB3YW50IHRoZSBwcmltYXJ5IGFyZ3VtZW50LiBBc2lk
ZSBmcm9tIHRoaXMgb25lIGNhc2UgaGVyZSBpdCdzDQo+IG5vdCBuZWVkZWQuIEFsc28gYnkg
cHVzaGluZyB0aGlzIHNwZWNpYWwgY2FzZSBpbnRvIHRoZSBvbmUgZHJpdmVyIHRoYXQNCj4g
bmVlZHMgaXQgd2Uga2VlcCBpdCBjb250YWluZWQsIGluc3RlYWQgb2Ygc3ByZWFkaW5nIGl0
IGFsbCBhcm91bmQuDQo+IEluZmxpY3RpbmcgYSBwYXJhbWV0ZXIgb24gZXZlcnkgKGFuZCBp
biB0b3RhbCB3ZSBoYXZlIGEgbG90IG9mIGNhbGxlcnMgb2YNCj4gdGhpcyBzdHVmZikganVz
dCBiZWNhdXNlIG9mIGdtYTUwMCBkb2VzIG5vdCBzZWVtIGxpa2UgYSBnb29kIGlkZWEgdG8g
bWUuDQoNClVuZm9ydHVuYXRlbHksIHZnYWNvbiBhbmQgdmdhYXJiIHJlcXVpcmUgYSBQQ0kg
ZGV2aWNlLiBJIGRvbid0IGxpa2UgdGhlIA0KcHJvcG9zYWwsIGJ1dCBtYXliZSBpdCdzIHRo
ZSBiZXN0IGZvciBub3cuIFNvIGdvIGFoZWFkIGlmIHlvdSBsaWtlLiBJIGRvIA0KZXhwZWN0
IHRoYXQgdGhpcyBuZWVkcyBhZGRpdGlvbmFsIHdvcmsgaW4gZnV0dXJlLCBob3dldmVyLg0K
DQpKdXN0IHNvbWUgbW9yZSB0aG91Z2h0cy4NCg0KR3JlcCBmb3IgZHJtX2FwZXJ0dXJlX3Jl
bW92ZV9mcmFtZWJ1ZmZlcnMoKS4gV2l0aGluIERSTSB0aGVyZSBhcmUgcmVhbGx5IA0KanVz
dCAxMCBkcml2ZXJzIGNhbGxpbmcgdGhpcyBmdW5jdGlvbiAodnMuIDEyIGNhbGxlcnMgb2Yg
DQpkcm1fYXBlcnR1cmVfcmVtb3ZlX2NvbmZsaWN0aW5nX3BjaV9mcmFtZWJ1ZmZlcnMoKSku
IEluIGZiZGV2LCB0aGVyZSBhcmUgDQptYW55IGNhbGxlcnMgb2YgdGhlIFBDSSBoZWxwZXIg
KH40MCkgYW5kIGFwcGFyZW50bHkgb25seSAzIGZvciB0aGUgDQpub24tUENJIG9uZS4gVGhl
IG90aGVyIGRyaXZlcnMgYXJlIHBhbmVscywgVVNCLCBNSVBJLCBldGMgYW5kIGRvbid0IA0K
aW50ZXJhY3Qgd2l0aCB0aGUgc3lzdGVtIGZyYW1lYnVmZmVyLiBDb21wYXJlZCB0byB0aGUg
b3ZlcmFsbCBudW1iZXIgb2YgDQpkcml2ZXJzLCB3ZSBoYXZlIHN1cnByaXNpbmdseSBmZXcg
J3RyYWRpdGlvbmFsIGdyYXBoaWNzIGNhcmRzJyBpbiBEUk0uDQoNCkFub3RoZXIgdGhpbmcg
aXMgdGhhdCBnbWE1MDAgYW5kIHRoZSBvdGhlciA5IGRyaXZlcnMgc2ltcGx5IGRvbid0IGJv
dGhlciANCnRvIGdldCB0aGUgZnJhbWVidWZmZXIgcmFuZ2UuIFRoZXkgc2hvdWxkIGJlIHJl
d29ya2VkIHRvIGZldGNoIHRoZSANCmNvbmZpZ3VyZWQgZnJhbWVidWZmZXIgZnJvbSB0aGUg
ZGV2aWNlIGFuZCByZWxlYXNlIHRoYXQgcmVnaW9uIG9ubHkuIFRoZSANCnByYWN0aWNhbCBp
bXBhY3QgaXMgY2xvc2UgdG8gemVybywgc28gaXQgaGFzbid0IGhhcHBlbmVkLg0KDQpCZXN0
IHJlZ2FyZHMNClRob21hcw0KDQoNCj4gLURhbmllbA0KDQotLSANClRob21hcyBaaW1tZXJt
YW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9u
cyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFu
eQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBU
b3Rldg0K

--------------pBFFBLeS18imoopHCeEattG0--

--------------ypSpHYAck0gxNmzFnbMJOqYF
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmO/+fQFAwAAAAAACgkQlh/E3EQov+Cx
DA/8DWDqClAIzHxPPwbbdoOrVUorF9scie7xZ8rmnr12fKRxsz9gFo8Qh9TCERI/xFr7ivsFuuKR
8giNF0YzSgd9MbSfpoVht5cPeKObBPjpT9nIb2MVue6TkzSf2sT0s4ky9lg0kIxF5RTHkcjSs0K9
eNArWeQRUUwMfQA4CVjmFpYNwVwPudN/uECOHG7cG3S1i95ww34MluDGYiVP3Zj/uqrZ4dDEKHvL
vsyEiRZf5Jbcjs+YWyWwR+Wt6n+Vaw5feD5nRC0NJGMhxzh/ZHBlQfwzQ+8VzDz000eGlOkyCYbP
K7u518QrVzXrUn1JcM9iwyJuZyV4npxtssRTrMJeq4XgcDaxpjH0J/Q8U/HKmZcVBLilZoELunzW
HNFS9jqf/7oWshpHiWkMgbenBJEdT2WjA20fkJwWipwikJEBshUYoM4kR6e4kYj3UYkCFeSsdthd
vBYx6NgH34M65v0ZYYP4ipXi36FhwzWgdibn/7M36/HCY1D6aeRiChJ5eLg48gP+IgIPh3y853nL
CfJjeMH5nR3O0BOLBY7BT56NzgurLK0DHhr963QanQohaRPsmD302DFpmmNDdoe/S/XV5nTLOoJh
b082VZlIbQAVPKs9dijSJq4CgyDxsVcyINJWZSdB4aDo047TaZrso509nkXAmjR7kuXNdGi349Dc
h3Q=
=0XKG
-----END PGP SIGNATURE-----

--------------ypSpHYAck0gxNmzFnbMJOqYF--
