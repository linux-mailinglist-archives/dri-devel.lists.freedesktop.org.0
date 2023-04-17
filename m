Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38D9F6E411D
	for <lists+dri-devel@lfdr.de>; Mon, 17 Apr 2023 09:34:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65F8610E111;
	Mon, 17 Apr 2023 07:34:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 480BF10E111
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Apr 2023 07:34:16 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id DC7BD21A4F;
 Mon, 17 Apr 2023 07:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1681716854; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PXf6nC3f/AfL8mH3L4z1c58SKiviJZJqCyp5V5IGE0A=;
 b=QMEgGKxaPACEEvKJwFbhkg4B59coItG1kmt57zoD3MWenBl3jjKSjxkWLD2o4aq3Nq3gNb
 0KJJEHG7dS2ZDcSUDpFMMIglZ6VrI1WRJUwFGxl5M7TryPPXp1CpIEjzjbyDvlvoczSUKT
 SVYsTcAginvSuSsYxjIyjtPKV+K7rZA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1681716854;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PXf6nC3f/AfL8mH3L4z1c58SKiviJZJqCyp5V5IGE0A=;
 b=U1Qh1Z8fHlHrZYruL3w2shm8ENsPHQdutkQnCPUYMW2P+KL27nU5qrLlfYWtGzT7EaDeRX
 Duf4SZZGaRIjlyDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B631F1390E;
 Mon, 17 Apr 2023 07:34:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id OR0ZK3b2PGR7IwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 17 Apr 2023 07:34:14 +0000
Message-ID: <8124f39d-cd64-be21-2f3c-bad590a3ccf3@suse.de>
Date: Mon, 17 Apr 2023 09:34:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v3 01/13] firmware/sysfb: Fix EFI/VESA format selection
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>,
 Pierre Asselin <pa@panix.com>
References: <20230102112927.26565-1-tzimmermann@suse.de>
 <20230102112927.26565-2-tzimmermann@suse.de>
 <4Psm6B6Lqkz1QXM@panix3.panix.com>
 <2ca4fbdb87a335522c22551658576e55.squirrel@mail.panix.com>
 <87zg7es99j.fsf@minerva.mail-host-address-is-not-set>
 <dfb4f25ca8dfb0d81d778d6315f104ad.squirrel@mail.panix.com>
 <87sfd5s5tu.fsf@minerva.mail-host-address-is-not-set>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <87sfd5s5tu.fsf@minerva.mail-host-address-is-not-set>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------BjDFW0GWl3barCg08hybWN3Q"
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
Cc: mairacanal@riseup.net, dri-devel@lists.freedesktop.org,
 jose.exposito89@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------BjDFW0GWl3barCg08hybWN3Q
Content-Type: multipart/mixed; boundary="------------HzeREKMspwBftuh8a5vvjeWt";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>,
 Pierre Asselin <pa@panix.com>
Cc: mairacanal@riseup.net, dri-devel@lists.freedesktop.org,
 jose.exposito89@gmail.com
Message-ID: <8124f39d-cd64-be21-2f3c-bad590a3ccf3@suse.de>
Subject: Re: [PATCH v3 01/13] firmware/sysfb: Fix EFI/VESA format selection
References: <20230102112927.26565-1-tzimmermann@suse.de>
 <20230102112927.26565-2-tzimmermann@suse.de>
 <4Psm6B6Lqkz1QXM@panix3.panix.com>
 <2ca4fbdb87a335522c22551658576e55.squirrel@mail.panix.com>
 <87zg7es99j.fsf@minerva.mail-host-address-is-not-set>
 <dfb4f25ca8dfb0d81d778d6315f104ad.squirrel@mail.panix.com>
 <87sfd5s5tu.fsf@minerva.mail-host-address-is-not-set>
In-Reply-To: <87sfd5s5tu.fsf@minerva.mail-host-address-is-not-set>

--------------HzeREKMspwBftuh8a5vvjeWt
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

cGluZw0KDQpBbSAxMi4wNC4yMyB1bSAxMzoyMiBzY2hyaWViIEphdmllciBNYXJ0aW5leiBD
YW5pbGxhczoNCj4gIlBpZXJyZSBBc3NlbGluIiA8cGFAcGFuaXguY29tPiB3cml0ZXM6DQo+
IA0KPj4+IENhbiB5b3UgcGxlYXNlIHNoYXJlIHlvdSBncnViIGNvbmZpZyBmaWxlPyBJdCBz
ZWVtcyB0aGF0IGlzIHNldCB0bw0KPj4+IEdSVUJfR0ZYTU9ERT0xMDI0eDc2OHgzMiBidXQg
dGhlIGFjdHVhbCBtb2RlIGlzIHNldCB0byAxMDI0eDc2OHgyNCA/DQo+Pg0KPj4gT2theSwg
YnV0IHlvdSdsbCBiZSBzb3JyeS4uLiAgVGhlIGdmeG1vZGUgaXMgc2V0IHRvICJrZWVwIiBp
biBhbGwgdGhlDQo+PiBlbnRyaWVzLiAgaHR0cHM6Ly93d3cucGFuaXguY29tL35wYS9saW51
eC02LjMtc2ltcGxlZmIvZ3J1Yi5jZmcgLg0KPj4NCj4+IFRoZSAiVEVTVCIgZW50cnkgd2Fz
IHVzZWQgdG8gYmlzZWN0LiAgVGhlICJQUkUtVEVTVCIgd2FzIHRvIHNldCB0aGluZ3MNCj4+
IHVwLCB0byByZWNlaXZlIHRoZSBiekltYWdlcyBjb21waWxlZCBvbiBhIGZhc3RlciBtYWNo
aW5lLiBOb3cgSSBib290DQo+PiB0aGUgIkxpbnV4IDYuMy4wLXJjNS14ODYiLg0KPj4NCj4+
DQo+Pj4gVGhhdCBpcywgaXQgZmFpbHMgd2hlbiB0aGUgcGlja2VkIGZvcm1hdCBpcyBEUk1f
Rk9STUFUX1JHQjg4ODggYnV0DQo+Pj4gd29ya3Mgd2hlbiBpcyBEUk1fRk9STUFUX1hSR0I4
ODguIEkgY2FuJ3Qgc3BvdCBhbnkgZXJyb3IgaW4gVGhvbWFzJw0KPj4+IHBhdGNoIHNvIEkg
d29uZGVyIGlmIHRoZSBwcm9ibGVtIGlzIHdpdGggd2hhdCBncnViIGlzIHBhc3NpbmcgdG8g
dGhlDQo+Pj4ga2VybmVsLg0KPj4+DQo+Pj4gVGhlIG1lbnRpb25lZCB2Z2E9MHgzMTggd29y
a2Fyb3VuZCB0aGF0IHlvdSBtZW50aW9uZWQgbWFrZXMgdGhlIG1vZGUNCj4+PiBwYXNzZWQg
dG8gbWF0Y2ggdGhlIHNlbGVjdGVkIERSTV9GT1JNQVRfUkdCODg4IHdoaWNoIEkgZ3Vlc3Mg
aXMgd2h5DQo+Pj4gdGhhdCB3b3JrZWQgZm9yIHlvdS4NCj4+DQo+PiBBbGwgcmlnaHQsIEkg
ZGlkIGEgc2VyaWVzIG9mIHJlYm9vdHMsIGVkaXRpbmcgdGhlIGdydWIgY29tbWFuZCBsaW5l
DQo+PiB0byBjaGFuZ2UgdGhlICJnZnhwYXlsb2FkPSIgZ3J1YiBvcHRpb24gb3IgdGhlICJ2
Z2E9IiBrZXJuZWwgb3B0aW9uLg0KPj4gSW4gZWFjaCBjYXNlIEkgY2FwdHVyZWQgdGhlIG91
dHB1dCBvZg0KPj4gICAgImRtZXNnIHwgZWdyZXAgLWkgJ2ZiY29ufGNvbnNvbGV8ZmIwfGZy
YW1lYnxzaW1wbGV8dmdhfHZlc2EnDQo+Pg0KPj4gaHR0cHM6Ly93d3cucGFuaXguY29tL35w
YS9saW51eC02LjMtc2ltcGxlZmIvc2VsZWN0ZWQtbW9kZXMNCj4+DQo+PiAoRCdvaC4gIE15
IHNjcmlwdCBwcmludGVkICJ2Z2E9dmdhPSIgdHdpY2Ugd2hlbiB0aGF0IG9wdGlvbiB3YXMg
c2V0Lg0KPj4gR29vZCBlbm91Z2ggYXMgaXMuKQ0KPj4NCj4+IE5vdGUgdGhlIGRpZmZlcmVu
Y2UgaW4gbGluZWxlbmd0aD0gYmV0d2VlbiB0aGUgYmFkIGFuZCBnb29kIHI4ZzhiOC4NCj4+
IERvZXMgaXQgbWVhbiBhbnl0aGluZyA/DQo+PiAgIChiYWQpPiBmb3JtYXQ9cjhnOGI4LCBt
b2RlPTEwMjR4NzY4eDI0LCBsaW5lbGVuZ3RoPTQwOTYNCj4+IChnb29kKT4gZm9ybWF0PXI4
ZzhiOCwgbW9kZT0xMDI0eDc2OHgyNCwgbGluZWxlbmd0aD0zMDcyDQo+Pg0KPiANCj4gQWgh
IFRoYXQncyBhIGdvb2QgZGF0YSBwb2ludCBhbmQgSSBiZWxpZXZlIHRoYXQgZm91bmQgYSBw
b3NzaWJsZSBpc3N1ZSBpbg0KPiB0aGUgc3lzZmIgZm9ybWF0IHNlbGVjdGlvbiBsb2dpYy4g
Q2FuIHlvdSBwbGVhc2UgdHJ5IHRoZSBmb2xsb3dpbmcgcGF0Y2g/DQo+IA0KPiAgRnJvbSA1
NWI1Mzc1YzUyOGI0MTI4MzUwZGZhMjEyNjI3NzA0OWY4ODIxMzQ5IE1vbiBTZXAgMTcgMDA6
MDA6MDAgMjAwMQ0KPiBGcm9tOiBKYXZpZXIgTWFydGluZXogQ2FuaWxsYXMgPGphdmllcm1A
cmVkaGF0LmNvbT4NCj4gRGF0ZTogV2VkLCAxMiBBcHIgMjAyMyAxMzoyMDo0OCArMDIwMA0K
PiBTdWJqZWN0OiBbUEFUQ0hdIGZpcm13YXJlL3N5c2ZiOiBGaXggd3Jvbmcgc3RyaWRlIHdo
ZW4gYml0cy1wZXItcGl4ZWwgaXMNCj4gICBjYWxjdWxhdGVkDQo+IA0KPiBUaGUgY29tbWl0
IGYzNWNkM2ZhNzcyOSAoImZpcm13YXJlL3N5c2ZiOiBGaXggRUZJL1ZFU0EgZm9ybWF0IHNl
bGVjdGlvbiIpDQo+IGZpeGVkIGZvcm1hdCBzZWxlY3Rpb24gYnkgY2FsY3VsYXRpbmcgdGhl
IGJpdHMtcGVyLXBpeGVsIGluc3RlYWQgb2YganVzdA0KPiB1c2luZyB0aGUgcmVwb3J0ZWQg
Y29sb3IgZGVwdGguDQo+IA0KPiBCdXQgdW5mb3J0dW5hdGVseSB0aGlzIGJyb2tlIHNvbWUg
bW9kZXMgYmVjYXVzZSB0aGUgc3RyaWRlIGlzIGFsd2F5cyBzZXQNCj4gdG8gdGhlIHJlcG9y
dGVkIGxpbmUgbGVuZ3RoIChpbiBieXRlcyksIHdoaWNoIGNvdWxkIG5vdCBtYXRjaCB0aGUg
YWN0dWFsDQo+IHN0cmlkZSBpZiB0aGUgY2FsY3VsYXRlZCBiaXRzLXBlci1waXhlbCBkb2Vz
bid0IG1hdGNoIHRoZSByZXBvcnRlZCBkZXB0aC4NCj4gDQo+IEZpeGVzOiBjb21taXQgZjM1
Y2QzZmE3NzI5ICgiZmlybXdhcmUvc3lzZmI6IEZpeCBFRkkvVkVTQSBmb3JtYXQgc2VsZWN0
aW9uIikNCj4gUmVwb3J0ZWQtYnk6IFBpZXJyZSBBc3NlbGluIDxwYUBwYW5peC5jb20+DQo+
IFNpZ25lZC1vZmYtYnk6IEphdmllciBNYXJ0aW5leiBDYW5pbGxhcyA8amF2aWVybUByZWRo
YXQuY29tPg0KPiAtLS0NCj4gICBkcml2ZXJzL2Zpcm13YXJlL3N5c2ZiX3NpbXBsZWZiLmMg
fCA5ICsrKysrKystLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDIg
ZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9maXJtd2FyZS9zeXNm
Yl9zaW1wbGVmYi5jIGIvZHJpdmVycy9maXJtd2FyZS9zeXNmYl9zaW1wbGVmYi5jDQo+IGlu
ZGV4IDgyYzY0Y2I5ZjUzMS4uNWRjMjNlNTcwODlmIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJz
L2Zpcm13YXJlL3N5c2ZiX3NpbXBsZWZiLmMNCj4gKysrIGIvZHJpdmVycy9maXJtd2FyZS9z
eXNmYl9zaW1wbGVmYi5jDQo+IEBAIC0yOCw3ICsyOCw3IEBAIF9faW5pdCBib29sIHN5c2Zi
X3BhcnNlX21vZGUoY29uc3Qgc3RydWN0IHNjcmVlbl9pbmZvICpzaSwNCj4gICAJCQkgICAg
IHN0cnVjdCBzaW1wbGVmYl9wbGF0Zm9ybV9kYXRhICptb2RlKQ0KPiAgIHsNCj4gICAJX191
OCB0eXBlOw0KPiAtCXUzMiBiaXRzX3Blcl9waXhlbDsNCj4gKwl1MzIgYml0c19wZXJfcGl4
ZWwsIHN0cmlkZTsNCj4gICAJdW5zaWduZWQgaW50IGk7DQo+ICAgDQo+ICAgCXR5cGUgPSBz
aS0+b3JpZ192aWRlb19pc1ZHQTsNCj4gQEAgLTU0LDE0ICs1NCwxOSBAQCBfX2luaXQgYm9v
bCBzeXNmYl9wYXJzZV9tb2RlKGNvbnN0IHN0cnVjdCBzY3JlZW5faW5mbyAqc2ksDQo+ICAg
CSAqIGJpdHNfcGVyX3BpeGVsIGhlcmUgYW5kIGlnbm9yZSBsZmJfZGVwdGguIEluIHRoZSBs
b29wIGJlbG93LA0KPiAgIAkgKiBpZ25vcmUgc2ltcGxlZmIgZm9ybWF0cyB3aXRoIGFscGhh
IGJpdHMsIGFzIEVGSSBhbmQgVkVTQQ0KPiAgIAkgKiBkb24ndCBzcGVjaWZ5IGFscGhhIGNo
YW5uZWxzLg0KPiArCSAqDQo+ICsJICogSWYgYSBjYWxjdWxhdGVkIGJpdHNfcGVyX3BpeGVs
IGlzIHVzZWQgaW5zdGVhZCBvZiBsZmJfZGVwdGgsDQo+ICsJICogdGhlbiBhbHNvIGlnbm9y
ZSBsZmJfbGluZWxlbmd0aCBhbmQgY2FsY3VsYXRlIHRoZSBzdHJpZGUuDQo+ICAgCSAqLw0K
PiAgIAlpZiAoc2ktPmxmYl9kZXB0aCA+IDgpIHsNCj4gICAJCWJpdHNfcGVyX3BpeGVsID0g
bWF4KG1heDMoc2ktPnJlZF9zaXplICsgc2ktPnJlZF9wb3MsDQo+ICAgCQkJCQkgIHNpLT5n
cmVlbl9zaXplICsgc2ktPmdyZWVuX3BvcywNCj4gICAJCQkJCSAgc2ktPmJsdWVfc2l6ZSAr
IHNpLT5ibHVlX3BvcyksDQo+ICAgCQkJCSAgICAgc2ktPnJzdmRfc2l6ZSArIHNpLT5yc3Zk
X3Bvcyk7DQo+ICsJCXN0cmlkZSA9IERJVl9ST1VORF9VUChzaS0+bGZiX3dpZHRoICogYml0
c19wZXJfcGl4ZWwsIDgpOw0KPiAgIAl9IGVsc2Ugew0KPiAgIAkJYml0c19wZXJfcGl4ZWwg
PSBzaS0+bGZiX2RlcHRoOw0KPiArCQlzdHJpZGUgPSBzaS0+bGZiX2xpbmVsZW5ndGg7DQo+
ICAgCX0NCj4gICANCj4gICAJZm9yIChpID0gMDsgaSA8IEFSUkFZX1NJWkUoZm9ybWF0cyk7
ICsraSkgew0KPiBAQCAtODAsNyArODUsNyBAQCBfX2luaXQgYm9vbCBzeXNmYl9wYXJzZV9t
b2RlKGNvbnN0IHN0cnVjdCBzY3JlZW5faW5mbyAqc2ksDQo+ICAgCQkJbW9kZS0+Zm9ybWF0
ID0gZi0+bmFtZTsNCj4gICAJCQltb2RlLT53aWR0aCA9IHNpLT5sZmJfd2lkdGg7DQo+ICAg
CQkJbW9kZS0+aGVpZ2h0ID0gc2ktPmxmYl9oZWlnaHQ7DQo+IC0JCQltb2RlLT5zdHJpZGUg
PSBzaS0+bGZiX2xpbmVsZW5ndGg7DQo+ICsJCQltb2RlLT5zdHJpZGUgPSBzdHJpZGU7DQo+
ICAgCQkJcmV0dXJuIHRydWU7DQo+ICAgCQl9DQo+ICAgCX0NCj4gDQo+IGJhc2UtY29tbWl0
OiBmZDM1MTc0ZTEzZjk4ZjkyMzJjNGFhNjY2ODk4MTY3MzFkMzRjYTI4DQoNCi0tIA0KVGhv
bWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdh
cmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5i
ZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8
aHJlcjogSXZvIFRvdGV2DQo=

--------------HzeREKMspwBftuh8a5vvjeWt--

--------------BjDFW0GWl3barCg08hybWN3Q
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmQ89nYFAwAAAAAACgkQlh/E3EQov+AR
MxAAxiBvJz/lHle2k4Dv5ruA/CimvyJjpHCW8xZy7GQR7l8hxYI30F82t7L7TS6XrxIyKxE/WDh9
sINUYVcIt2WkjMw/EtsQG6BlB8+ZeG5sqdiDfZlOC+SGWn/MSZN6DBAHdiDDEC5LsFgBwlNWJRDG
3rqaFkNS/3rq6XX3rp6ZWb1gsfCqtqsEpPuyPOQ17EB3INXa3fecWnNKSerPzsPSHRVdFduDwDZi
dod95O4riqAjvMpDYnYb/Vgbo+eUALyL8Hk+LdeNvYQRvxNP0n2rz5/a4GZl2xqQw+lo9YstThGO
ZLeTAL1wgfzVS4qOBQex0it1lWHoHtC6Eg2aBcxKXIjgsS6QYiUvt5m+sjEOWiBnDdhCFXdp2H1o
fo/hYiKx8oDTNwFcc8u76H6vgtkgwK+SI15b2fE09esFY3frbK/KH1CDy7KNnxfqbpHc3y/v4gMk
3i8wdKbJnILJSK3k3Barr6nGZhQpnYOSDONjy/RV4lmgDhcfuVSGgeO5YgWxhpP+KorlnX1Whxgg
T0nhqzjl1ZTGeN3IprlC0M677KXt7FrM8mc5Ulkb/TQYwETtBcxFTmVmxCqfCVl87ZLq/WI3+c8G
MeXTsaNh7TpOG7UC2JCjKl/bFtTq+lRPjZdJJ9UkELueYOHThQ6JLep1n9MasEMPNt7jk6xq11lk
+Cw=
=RfJz
-----END PGP SIGNATURE-----

--------------BjDFW0GWl3barCg08hybWN3Q--
