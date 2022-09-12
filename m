Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F6A15B5C24
	for <lists+dri-devel@lfdr.de>; Mon, 12 Sep 2022 16:23:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95FC610E546;
	Mon, 12 Sep 2022 14:22:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B412610E546
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Sep 2022 14:22:51 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4622933915;
 Mon, 12 Sep 2022 14:22:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1662992570; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VGUypKVHeGpWpoCP7mLpRont+CgrqEM8rwaODFR4RRU=;
 b=khfgAcmH/sB1H3iC0x+Y5oplmI6i+lHHgDPaL7+3zuqqsuBfOVK4CznLY9DnrLVfDxlgxW
 NvNVGmUBmcyBREimNt0ndrIIugLexnHgj6kFLifEoY2u2Q8yfR77sDSF+0sd6t0fWJFFhe
 cOxFgDv32DWI54kVGZRn3+qKbU0Gzjs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1662992570;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VGUypKVHeGpWpoCP7mLpRont+CgrqEM8rwaODFR4RRU=;
 b=TtIdFbjQJyTHZeXUkEa3KXsjsant03u98B0F0CVX9gXcfJ182HL1ZszjPyTOsSkbZmXOCY
 /NHbmtGC3R71WBAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 25C84139C8;
 Mon, 12 Sep 2022 14:22:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id g0ohCLpAH2PcRQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 12 Sep 2022 14:22:50 +0000
Message-ID: <d4c00bb6-03be-0348-6a75-c678608114f1@suse.de>
Date: Mon, 12 Sep 2022 16:22:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH] drm/plane-helper: Add a drm_plane_helper_atomic_check()
 helper
Content-Language: en-US
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <20220912101522.69482-1-javierm@redhat.com>
 <Yx8Ms2jhgwpiDqA6@intel.com> <c6ce4e99-571b-e046-6f03-ab87bd173869@suse.de>
 <Yx8Vo4x7frhbElPq@intel.com> <4002a4d6-04cb-b342-952f-b42ef3188df4@suse.de>
 <Yx8nXZnTDEwuPEvP@intel.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <Yx8nXZnTDEwuPEvP@intel.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------RmvCyu9CQzHUTw4ek078r59I"
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
Cc: David Airlie <airlied@linux.ie>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------RmvCyu9CQzHUTw4ek078r59I
Content-Type: multipart/mixed; boundary="------------TtTWUjEhbdYmQQfL23uX0vlu";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: David Airlie <airlied@linux.ie>,
 Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Message-ID: <d4c00bb6-03be-0348-6a75-c678608114f1@suse.de>
Subject: Re: [PATCH] drm/plane-helper: Add a drm_plane_helper_atomic_check()
 helper
References: <20220912101522.69482-1-javierm@redhat.com>
 <Yx8Ms2jhgwpiDqA6@intel.com> <c6ce4e99-571b-e046-6f03-ab87bd173869@suse.de>
 <Yx8Vo4x7frhbElPq@intel.com> <4002a4d6-04cb-b342-952f-b42ef3188df4@suse.de>
 <Yx8nXZnTDEwuPEvP@intel.com>
In-Reply-To: <Yx8nXZnTDEwuPEvP@intel.com>

--------------TtTWUjEhbdYmQQfL23uX0vlu
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTIuMDkuMjIgdW0gMTQ6MzQgc2NocmllYiBWaWxsZSBTeXJqw6Rsw6Q6DQo+
IE9uIE1vbiwgU2VwIDEyLCAyMDIyIGF0IDAyOjA1OjM2UE0gKzAyMDAsIFRob21hcyBaaW1t
ZXJtYW5uIHdyb3RlOg0KPj4gSGkNCj4+DQo+PiBBbSAxMi4wOS4yMiB1bSAxMzoxOCBzY2hy
aWViIFZpbGxlIFN5cmrDpGzDpDoNCj4+PiBPbiBNb24sIFNlcCAxMiwgMjAyMiBhdCAwMTow
NTo0NVBNICswMjAwLCBUaG9tYXMgWmltbWVybWFubiB3cm90ZToNCj4+Pj4gSGkNCj4+Pj4N
Cj4+Pj4gQW0gMTIuMDkuMjIgdW0gMTI6NDAgc2NocmllYiBWaWxsZSBTeXJqw6Rsw6Q6DQo+
Pj4+PiBPbiBNb24sIFNlcCAxMiwgMjAyMiBhdCAxMjoxNToyMlBNICswMjAwLCBKYXZpZXIg
TWFydGluZXogQ2FuaWxsYXMgd3JvdGU6DQo+Pj4+Pj4gUHJvdmlkZXMgYSBkZWZhdWx0IHBs
YW5lIHN0YXRlIGNoZWNrIGhhbmRsZXIgZm9yIHByaW1hcnkgcGxhbmVzIHRoYXQgYXJlIGEN
Cj4+Pj4+PiBmdWxsc2NyZWVuIHNjYW5vdXQgYnVmZmVyIGFuZCB3aG9zZSBzdGF0ZSBzY2Fs
ZSBhbmQgcG9zaXRpb24gY2FuJ3QgY2hhbmdlLg0KPj4+Pj4+DQo+Pj4+Pj4gVGhlcmUgYXJl
IHNvbWUgZHJpdmVycyB0aGF0IGR1cGxpY2F0ZSB0aGlzIGxvZ2ljIGluIHRoZWlyIGhlbHBl
cnMsIHN1Y2ggYXMNCj4+Pj4+PiBzaW1wbGVkcm0gYW5kIHNzZDEzMHguIEZhY3RvciBvdXQg
dGhpcyBjb21tb24gY29kZSBpbnRvIGEgcGxhbmUgaGVscGVyIGFuZA0KPj4+Pj4+IG1ha2Ug
ZHJpdmVycyB1c2UgaXQuDQo+Pj4+Pj4NCj4+Pj4+PiBTdWdnZXN0ZWQtYnk6IFRob21hcyBa
aW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPg0KPj4+Pj4+IFNpZ25lZC1vZmYtYnk6
IEphdmllciBNYXJ0aW5leiBDYW5pbGxhcyA8amF2aWVybUByZWRoYXQuY29tPg0KPj4+Pj4+
IC0tLQ0KPj4+Pj4+DQo+Pj4+Pj4gICAgIGRyaXZlcnMvZ3B1L2RybS9kcm1fcGxhbmVfaGVs
cGVyLmMgfCAyOSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKw0KPj4+Pj4+ICAgICBk
cml2ZXJzL2dwdS9kcm0vc29sb21vbi9zc2QxMzB4LmMgIHwgMTggKy0tLS0tLS0tLS0tLS0t
LS0tDQo+Pj4+Pj4gICAgIGRyaXZlcnMvZ3B1L2RybS90aW55L3NpbXBsZWRybS5jICAgfCAy
NSArLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+Pj4+Pj4gICAgIGluY2x1ZGUvZHJtL2Ry
bV9wbGFuZV9oZWxwZXIuaCAgICAgfCAgMiArKw0KPj4+Pj4+ICAgICA0IGZpbGVzIGNoYW5n
ZWQsIDMzIGluc2VydGlvbnMoKyksIDQxIGRlbGV0aW9ucygtKQ0KPj4+Pj4+DQo+Pj4+Pj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fcGxhbmVfaGVscGVyLmMgYi9kcml2
ZXJzL2dwdS9kcm0vZHJtX3BsYW5lX2hlbHBlci5jDQo+Pj4+Pj4gaW5kZXggYzc3ODU5Njdm
NWJmLi5mYjQxZWVlNzQ2OTMgMTAwNjQ0DQo+Pj4+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2RybV9wbGFuZV9oZWxwZXIuYw0KPj4+Pj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1f
cGxhbmVfaGVscGVyLmMNCj4+Pj4+PiBAQCAtMjc4LDMgKzI3OCwzMiBAQCB2b2lkIGRybV9w
bGFuZV9oZWxwZXJfZGVzdHJveShzdHJ1Y3QgZHJtX3BsYW5lICpwbGFuZSkNCj4+Pj4+PiAg
ICAgCWtmcmVlKHBsYW5lKTsNCj4+Pj4+PiAgICAgfQ0KPj4+Pj4+ICAgICBFWFBPUlRfU1lN
Qk9MKGRybV9wbGFuZV9oZWxwZXJfZGVzdHJveSk7DQo+Pj4+Pj4gKw0KPj4+Pj4+ICsvKioN
Cj4+Pj4+PiArICogZHJtX3BsYW5lX2hlbHBlcl9hdG9taWNfY2hlY2soKSAtIEhlbHBlciB0
byBjaGVjayBwcmltYXJ5IHBsYW5lcyBzdGF0ZXMNCj4+Pj4+PiArICogQHBsYW5lOiBwbGFu
ZSB0byBjaGVjaw0KPj4+Pj4+ICsgKiBAbmV3X3N0YXRlOiBwbGFuZSBzdGF0ZSB0byBjaGVj
aw0KPj4+Pj4NCj4+Pj4+IFRoYXQgaXMgbm90IGEgcGxhbmUgc3RhdGUuIEFsc28gc2hvdWxk
IHMvbmV3Xy8vIHNpbmNlIGl0J3MganVzdA0KPj4+Pj4gdGhlIG92ZXJhbGwgYXRvbWljIHN0
YXRlIHRoaW5nIHJhdGhlciB0aGFuIHNvbWUgbmV3IG9yIG9sZCBzdGF0ZS4NCj4+Pj4NCj4+
Pj4gVXNpbmcgb25seSAnc3RhdGUnIGlzIG5vbi1pbnR1aXRpdmUgYW5kIGhhcyBsZWFkIHRv
IGJ1Z3Mgd2hlcmUgc3ViLXN0YXRlDQo+Pj4+IHdhcyByZXRyaWV2ZWQgZnJvbSB0aGUgd3Jv
bmcgc3RhdGUgaW5mb3JtYXRpb24uIFNvIHdlJ3ZlIGJlZW4gdXNpbmcNCj4+Pj4gJ25ld19z
dGF0ZScgYW5kICdvbGRfc3RhdGUnIGV4cGxpY2l0bHkgaW4gc2V2ZXJhbCBwbGFjZXMgbm93
Lg0KPj4+DQo+Pj4gVGhlcmUgaXMgbm8gb2xkIG9yIG5ldyBkcm1fYXRvbWljX3N0YXRlLiBJ
dCBjb250YWlucyBib3RoLg0KPj4NCj4+IEkgKHZhZ3VlbHkpIHJlbWVtYmVyIGEgYnVnIHdo
ZXJlIGEgZHJpdmVyIHRyaWVkDQo+PiBkcm1fYXRvbWljX2dldF9uZXdfcGxhbmVfc3RhdGUo
KSB3aXRoIHRoZSAob2xkKSBzdGF0ZSB0aGF0J3MgcGFzc2VkIHRvDQo+PiBhdG9taWNfdXBk
YXRlLiBJdCBkaWRuJ3QgcmV0dXJuIHRoZSBleHBlY3RlZCByZXN1bHRzIGFuZCBtb2Rlc2V0
dGluZw0KPj4gZ2F2ZSBzbGlnaHRseSB3cm9uZyByZXN1bHRzLg0KPiANCj4gQXMgdGhlcmUg
aXMgbm8gd3JvbmcgZHJtX2F0b21pY19zdGF0ZSB0byBwYXNzIEkgZG9uJ3QgdGhpbmsgaXQg
Y291bGQNCj4gaGF2ZSBiZWVuIHRoZSBjYXNlLg0KPiANCj4+IFNvIHdlIGJlZ2FuIHRvIGJl
IG1vcmUgcHJlY2lzZSBhYm91dCBuZXcNCj4+IGFuZCBvbGQuIEFuZCB3aGF0ZXZlciBpcyBz
dG9yZWQgaW4gJ3BsYW5lLT5zdGF0ZScgaXMgdGhlbiBqdXN0ICd0aGUgc3RhdGUnLg0KPiAN
Cj4gVGhlcmUgd2VyZSBjZXJ0YWlubHkgYSBsb3Qgb2YgY29uZnVzaW9uIGJlZm9yZSB0aGUg
ZXhwbGljaXQgbmV3L29sZA0KPiBzdGF0ZSBzdHVmZiB3YXMgYWRkZWQgd2hldGhlciBmb28t
PnN0YXRlL2V0Yy4gd2FzIHRoZSBvbGQgb3IgdGhlDQo+IG5ldyBzdGF0ZS4gQW5kIGxhYmVs
aW5nIHRoaW5ncyBhcyBleHBsaWNpdGx5IG9sZCB2cy4gbmV3IHdoZW4gcGFzc2luZw0KPiBp
biBpbmRpdmlkdWFsIG9iamVjdCBzdGF0ZXMgY2VydGFpbmx5IG1ha2VzIHNlbnNlLiBCdXQg
dGhhdCBkb2Vzbid0DQo+IHJlYWxseSBoYXZlIGFueXRoaW5nIHRvIGRvIHdpdGggbWlzbGFi
ZWxpbmcgdGhlIG92ZXJhbGwgZHJtX2F0b21pY19zdGF0ZS4NCj4gDQo+Pg0KPj4gSSB1bmRl
cnN0YW5kIHRoYXQgdGhlIHNlbWFudGljcyBvZiBhdG9taWNfY2hlY2sgYXJlIGRpZmZlcmVu
dCBmcm9tDQo+PiBhdG9taWNfdXBkYXRlLCBidXQgaXQgc3RpbGwgZG9lc24ndCBodXJ0IHRv
IHRhbGsgb2YgbmV3X3N0YXRlIElNSE8uDQo+IA0KPiBJTU8gaXQncyBqdXN0IGNvbmZ1c2lu
Zy4gTWFrZXMgdGhlIHJlYWRlciB0aGluayB0aGVyZSBpcyBzb21laG93DQo+IGRpZmZlcmVu
dCBkcm1fYXRvbWljX3N0YXRlcyBmb3Igb2xkIHZzLiBuZXcgc3RhdGVzIHdoZW4gdGhlcmUg
aXNuJ3QuDQo+IEkgYWxzbyB3b3VsZG4ndCBjYWxsIGl0IG5ld19zdGF0ZSBmb3IgLmF0b21p
Y191cGRhdGUoKSBlaXRoZXIuDQo+IA0KPiBJbiBib3RoIGNhc2VzIHlvdSBoYXZlIHRoZSBv
bGQgYW5kIG5ldyBzdGF0ZXMgaW4gdGhlcmUgYW5kIGhvdw0KPiBleGFjdGx5IHRoZXkgZ2V0
IHVzZWQgaW4gdGhlIGhvb2tzIGlzIG1vcmUgb2YgYW4gaW1wbGVtZW50YXRpb24NCj4gZGV0
YWlsLiBUaGUgb25seSBydWxlcyB5b3Ugd291bGQgaGF2ZSB0byBmb2xsb3cgaXMgdGhhdCBh
dCB0aGUNCj4gZW5kIG9mIC5hdG9taWNfdXBkYXRlKCkgdGhlIGhhcmR3YXJlIHN0YXRlIG1h
dGNoZXMgdGhlIG5ldyBzdGF0ZSwNCj4gYW5kIC5hdG9taWNfY2hlY2soKSBtYWtlcyBzdXJl
IHRoZSB0cmFuc2l0aW9uIGZyb20gdGhlIG9sZCB0byB0aGUNCj4gbmV3IHN0YXRlIGlzIHBv
c3NpYmxlLg0KDQogRnJvbSB3aGF0IEkgdW5kZXJzdGFuZDoNCg0KSW4gYXRvbWljX2NoZWNr
KCksIHBsYW5lLT5zdGF0ZSBpcyB0aGUgY3VycmVudCBzdGF0ZSBhbmQgdGhlIHN0YXRlIA0K
YXJndW1lbnQgaXMgdGhlIHN0YXRlIHRvIGJlIHZhbGlkYXRlZC4gQ2FsbGluZyANCmRybV9h
dG9taWNfZ2V0X25ld19wbGFuZV9zdGF0ZSgpIHdpbGwgcmV0dXJuIHRoZSBwbGFuZSdzIG5l
dyBzdGF0ZS4NCg0KSWYgeW91IGNhbGwgZHJtX2F0b21pY19nZXRfb2xkX3BsYW5lX3N0YXRl
KCkgZnJvbSBhdG9taWNfY2hlY2soKSwgd2hhdCANCndpbGwgaXQgcmV0dXJuPw0KDQpJbiBh
dG9taWNfdXBkYXRlKCkgcGxhbmUtPnN0YXRlIGlzIHRoZSBzdGF0ZSB0byBiZSBjb21taXR0
ZWQgYW5kIHRoZSANCnN0YXRlIGFyZ3VtZW50IGlzIHRoZSBvbGQgc3RhdGUgYmVmb3JlIHRo
ZSBzdGFydCBvZiB0aGUgYXRvbWljIGNvbW1pdC4gDQpBbmQgY2FsbGluZyBkcm1fYXRvbWlj
X2dldF9uZXdfcGxhbmVfc3RhdGUoKSB3aWxsICpub3QqIHRoZSByZXR1cm4gdGhlIA0KcGxh
bmUncyBuZXcgc3RhdGUgKGkuZS4sIHRoZSBvbmUgaW4gcGxhbmUtPnN0YXRlKSBJSVJDLiAo
QXMgSSBtZW50aW9uZWQsIA0KdGhlcmUgd2FzIGEgcmVsYXRlZCBidWcgaW4gb25lIG9mIHRo
ZSBkcml2ZXJzLikgU28gd2UgYmVnYW4gdG8gY2FsbCB0aGlzIA0KJ29sZF9zdGF0ZScuDQoN
Ck15IHBvaW50IGlzOiB0aGUgc3RhdGUgcGFzc2VkIHRvIHRoZSBjaGVjayBhbmQgY29tbWl0
IGZ1bmN0aW9ucyBhcmUgDQpkaWZmZXJlbnQgdGhpbmdzLCBldmVuIHRob3VnaCB0aGV5IGFw
cGVhciB0byBiZSB0aGUgc2FtZS4NCg0KPiANCj4gSSd2ZSBwcm9wb3NlZCByZW5hbWluZyBk
cm1fYXRvbWljX3N0YXRlIHRvIGVnLiBkcm1fYXRvbWljX3RyYW5zYWN0aW9uDQo+IGEgZmV3
IHRpbWVzIGJlZm9yZSBidXQgbm8gb25lIHRvb2sgdGhlIGJhaXQgc28gZmFyLi4uDQo+IA0K
DQpJZiB5b3UgcmVhbGx5IGRvbid0IGxpa2UgbmV3X3N0YXRlLCB0aGVuIGxldCdzIGNhbGwg
aXQgc3RhdGVfdHguDQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCg0KLS0gDQpUaG9tYXMg
WmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBT
b2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcs
IEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVy
OiBJdm8gVG90ZXYNCg==

--------------TtTWUjEhbdYmQQfL23uX0vlu--

--------------RmvCyu9CQzHUTw4ek078r59I
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmMfQLkFAwAAAAAACgkQlh/E3EQov+DP
zg/+PpdEOQn07VVpi9r/Xsd9ih5pSapbjl7WxdV8rKz44xAddikkAYk7pQe9yxwxQAenrBohsRzm
TC7K4VEDxDjbXVjIrHTJN6zLbt1WuFyFq8lzt7EZ4Dzcm1mGJVKbKSKN0R7vX6zYLxZcaom56DlN
6j4q0D4h+kkwmWQnDWLr2cEBZDXeO4iPCrBGx90+rdNUAWllU62yhEJsIsqzGW9i9Az3j4m2xk8e
gGMOUfFlXZ1sTJ15sivalE8z7mEdZLPjKGKENeEnOa7XUMytQoP6A8GFNRTybP5QOFN+KW3RZaJb
pAFaz6eK9Z/zoi56t73INsDyczNZBoeeBEzQ6Ewm5C/2ogLDt9Y/su/YANr3W9OQ0o8UKKVHKkCW
YQ//vwvWyBdYh9b1/12z0u9ppX4WWm8HtpvqgqwfHFTwS8DUJik4PHm+HxCjWJiywSdR9Q7uIlL5
vRE3K+ZwvnNBtKW4gfli1JAdrMcveI75YHKgmlZvRtrVrmXZWBHO360rhlzGNSk1+AXq/6F7ZT7s
UBbxcN1crZbjQoUrXzZiwrGzhJSqO6/IHummNSdjOtg4cBG+Zg418uRQYEaKJksn078HmwpxV3h8
gFglDWXggBk/KGw3fHV7LBaf3xp9Ili6bZhe+2+Xy8ZAJND3acMISK7VEq3NNzUzomSFVgFKoNVn
oUg=
=sjP9
-----END PGP SIGNATURE-----

--------------RmvCyu9CQzHUTw4ek078r59I--
