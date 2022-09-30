Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BDED45F0920
	for <lists+dri-devel@lfdr.de>; Fri, 30 Sep 2022 12:28:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0474E10EC62;
	Fri, 30 Sep 2022 10:28:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5882410EC62
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Sep 2022 10:28:00 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 1464E1F8D2;
 Fri, 30 Sep 2022 10:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1664533679; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GQXb0NH4bgQerWedjxM0gkZ49TI9Z+wGh9VA60xNhyc=;
 b=Z8Y+wxrL3MrdPepXOLJ3Hq3aeBSBtE0afC9ol2gvWWjfMBppaZfDVw1PXikgg/TvBkxeOx
 46ibxQuMH8Nta0dLodBeE1P4+TtT5CUMf0aya2Ngk/Q9wao0MBVpCrnXw4RQIiMVDGIwnQ
 fzpOMQCSGTYyITPs1GnUedIFp/nQYOk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1664533679;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GQXb0NH4bgQerWedjxM0gkZ49TI9Z+wGh9VA60xNhyc=;
 b=o9tW6+uxYxsHGrE7Cjy+rq50GvFKDDur6z7q087TkzwiakZK5j2Yma/ZzruLBRtt3JeT9g
 BxTIMBNHlfN8YABQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E851113776;
 Fri, 30 Sep 2022 10:27:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id WImmN67ENmModQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 30 Sep 2022 10:27:58 +0000
Message-ID: <748ca958-d592-737c-198e-6f71dcd49305@suse.de>
Date: Fri, 30 Sep 2022 12:27:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH] drm/atomic-helper: Don't allocated plane state in CRTC
 check
Content-Language: en-US
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <20220929140714.14794-1-tzimmermann@suse.de>
 <YzXsFOjOuRUdeNo6@intel.com> <7e01f298-152c-d2b3-057c-b788c6f577b8@suse.de>
 <Yzay6XYpfuZrknUZ@intel.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <Yzay6XYpfuZrknUZ@intel.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------36oSExKdjABEYvU0bfIoRgLq"
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
Cc: David Airlie <airlied@linux.ie>, jfalempe@redhat.com, javierm@redhat.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------36oSExKdjABEYvU0bfIoRgLq
Content-Type: multipart/mixed; boundary="------------861bArSijhZ1xW25PWroP1P3";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: jfalempe@redhat.com, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, javierm@redhat.com
Message-ID: <748ca958-d592-737c-198e-6f71dcd49305@suse.de>
Subject: Re: [PATCH] drm/atomic-helper: Don't allocated plane state in CRTC
 check
References: <20220929140714.14794-1-tzimmermann@suse.de>
 <YzXsFOjOuRUdeNo6@intel.com> <7e01f298-152c-d2b3-057c-b788c6f577b8@suse.de>
 <Yzay6XYpfuZrknUZ@intel.com>
In-Reply-To: <Yzay6XYpfuZrknUZ@intel.com>

--------------861bArSijhZ1xW25PWroP1P3
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMzAuMDkuMjIgdW0gMTE6MTIgc2NocmllYiBWaWxsZSBTeXJqw6Rsw6Q6DQo+
IE9uIEZyaSwgU2VwIDMwLCAyMDIyIGF0IDExOjAxOjUyQU0gKzAyMDAsIFRob21hcyBaaW1t
ZXJtYW5uIHdyb3RlOg0KPj4gSGksDQo+Pg0KPj4gdGhhbmtzIGZvciByZXZpZXdpbmcuDQo+
Pg0KPj4gQW0gMjkuMDkuMjIgdW0gMjE6MDMgc2NocmllYiBWaWxsZSBTeXJqw6Rsw6Q6DQo+
Pj4gT24gVGh1LCBTZXAgMjksIDIwMjIgYXQgMDQ6MDc6MTRQTSArMDIwMCwgVGhvbWFzIFpp
bW1lcm1hbm4gd3JvdGU6DQo+Pj4+IEluIGRybV9hdG9taWNfaGVscGVyX2NoZWNrX2NydGNf
c3RhdGUoKSwgZG8gbm90IGFkZCBhIG5ldyBwbGFuZSBzdGF0ZQ0KPj4+PiB0byB0aGUgZ2xv
YmFsIHN0YXRlIGlmIGl0IGRvZXMgbm90IGV4aXN0IGFscmVhZHkuIEFkZGluZyBhIG5ldyBw
bGFuZQ0KPj4+PiBzdGF0ZSB3aWxsIHJlc3VsdHMgaW4gb3ZlcmhlYWQgZm9yIHRoZSBwbGFu
ZSBkdXJpbmcgdGhlIGF0b21pYy1jb21taXQNCj4+Pj4gc3RlcC4NCj4+Pj4NCj4+Pj4gRm9y
IHRoZSB0ZXN0IGluIGRybV9hdG9taWNfaGVscGVyX2NoZWNrX2NydGNfc3RhdGUoKSB0byBz
dWNjZWVkLCBpdCBpcw0KPj4+PiBpbXBvcnRhbnQgdGhhdCB0aGUgQ1JUQyBoYXMgYW4gZW5h
YmxlZCBwcmltYXJ5IHBsYW5lIGFmdGVyIHRoZSBjb21taXQuDQo+Pj4+IFRoaXMgY2FuIGJl
IGEgbmV3bHkgZW5hYmxlZCBwbGFuZSBvciBhbiBhbHJlYWR5IGVuYWJsZWQgcGxhbmUuIFNv
IGlmIGENCj4+Pj4gcGxhbmUgaXMgbm90IHBhcnQgb2YgdGhlIGNvbW1pdCwgdXNlIHRoZSBw
bGFuZSdzIGV4aXN0aW5nIHN0YXRlLiBUaGUgbmV3DQo+Pj4+IGhlbHBlciBkcm1fYXRvbWlj
X2dldF9uZXh0X3BsYW5lX3N0YXRlKCkgcmV0dXJucyB0aGUgY29ycmVjdCBpbnN0YW5jZS4N
Cj4+Pj4NCj4+Pj4gU2lnbmVkLW9mZi1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJt
YW5uQHN1c2UuZGU+DQo+Pj4+IEZpeGVzOiBkNmI5YWYxMDk3ZmUgKCJkcm0vYXRvbWljLWhl
bHBlcjogQWRkIGhlbHBlciBkcm1fYXRvbWljX2hlbHBlcl9jaGVja19jcnRjX3N0YXRlKCki
KQ0KPj4+PiBDYzogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+DQo+
Pj4+IENjOiBKb2NlbHluIEZhbGVtcGUgPGpmYWxlbXBlQHJlZGhhdC5jb20+DQo+Pj4+IENj
OiBNYWFydGVuIExhbmtob3JzdCA8bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwuY29t
Pg0KPj4+PiBDYzogTWF4aW1lIFJpcGFyZCA8bXJpcGFyZEBrZXJuZWwub3JnPg0KPj4+PiBD
YzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPg0KPj4+PiBDYzogRGFuaWVsIFZl
dHRlciA8ZGFuaWVsQGZmd2xsLmNoPg0KPj4+PiBDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZw0KPj4+PiAtLS0NCj4+Pj4gICAgZHJpdmVycy9ncHUvZHJtL2RybV9hdG9t
aWNfaGVscGVyLmMgfCAgNCArLS0tDQo+Pj4+ICAgIGluY2x1ZGUvZHJtL2RybV9hdG9taWMu
aCAgICAgICAgICAgIHwgMjAgKysrKysrKysrKysrKysrKysrKysNCj4+Pj4gICAgMiBmaWxl
cyBjaGFuZ2VkLCAyMSBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQ0KPj4+Pg0KPj4+
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9hdG9taWNfaGVscGVyLmMgYi9k
cml2ZXJzL2dwdS9kcm0vZHJtX2F0b21pY19oZWxwZXIuYw0KPj4+PiBpbmRleCA5OGNjMzEz
N2MwNjIuLjQ2M2Q0ZjNmYTQ0MyAxMDA2NDQNCj4+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2RybV9hdG9taWNfaGVscGVyLmMNCj4+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9h
dG9taWNfaGVscGVyLmMNCj4+Pj4gQEAgLTk2MCw5ICs5NjAsNyBAQCBpbnQgZHJtX2F0b21p
Y19oZWxwZXJfY2hlY2tfY3J0Y19zdGF0ZShzdHJ1Y3QgZHJtX2NydGNfc3RhdGUgKmNydGNf
c3RhdGUsDQo+Pj4+ICAgIA0KPj4+PiAgICAJCQlpZiAocGxhbmUtPnR5cGUgIT0gRFJNX1BM
QU5FX1RZUEVfUFJJTUFSWSkNCj4+Pj4gICAgCQkJCWNvbnRpbnVlOw0KPj4+PiAtCQkJcGxh
bmVfc3RhdGUgPSBkcm1fYXRvbWljX2dldF9wbGFuZV9zdGF0ZShzdGF0ZSwgcGxhbmUpOw0K
Pj4+PiAtCQkJaWYgKElTX0VSUihwbGFuZV9zdGF0ZSkpDQo+Pj4+IC0JCQkJcmV0dXJuIFBU
Ul9FUlIocGxhbmVfc3RhdGUpOw0KPj4+PiArCQkJcGxhbmVfc3RhdGUgPSBkcm1fYXRvbWlj
X2dldF9uZXh0X3BsYW5lX3N0YXRlKHN0YXRlLCBwbGFuZSk7DQo+Pj4+ICAgIAkJCWlmIChw
bGFuZV9zdGF0ZS0+ZmIgJiYgcGxhbmVfc3RhdGUtPmNydGMpIHsNCj4+Pg0KPj4+IEhtbS4g
V2h5IHRoaXMgaXMgZXZlbiBsb29raW5nIGF0IHRoZXNlLiBJZiB0aGUgcGxhbmUgaXMgaW4g
dGhlIGNydGMncw0KPj4+IHBsYW5lX21hc2sgdGhlbiBzdXJlbHkgcGxhbmVfc3RhdGUtPmNy
dGMgbXVzdCBhbHJlYWR5IHBvaW50IHRvIHRoaXMNCj4+PiBjcnRjPyBBbmQgSSBkb24ndCB0
aGluayAtPmZiIGFuZCAtPmNydGMgYXJlIGFsbG93ZWQgdG8gZGlzYWdyZWUsIHNvDQo+Pj4g
aWYgb25lIGlzIHNldCB0aGVuIHN1cmVseSB0aGUgb3RoZXIgb25lIG11c3QgYmUgYXMgd2Vs
bCBvciB3ZSdkDQo+Pj4gcmV0dXJuIGFuIGVycm9yIGF0IHNvbWUgcG9pbnQgc29tZXdoZXJl
Pw0KPj4NCj4+IFllYWgsIHRoZSBjcnRjIHRlc3QgaXMgZG9uZSBmb3Iga2VlcGluZyBjb25z
aXN0ZW5jeS4gT3RoZXIgcGxhY2VzIGFsc28NCj4+IHNvbWV0aW1lcyB2YWxpZGF0ZSB0aGF0
IHRoZXNlIGZpZWxkcyBkb24ndCBkaXNhZ3JlZS4gSSdsbCByZW1vdmUgdGhlDQo+PiBjcnRj
IHRlc3QgaW4gdGhlIG5leHQgdmVyc2lvbi4gVGhlIGZiIHRlc3QgaXMgdGhlIGltcG9ydGFu
dCBvbmUuDQo+IA0KPiBXaGF0IEknbSBhc2tpbmcgaG93IGNhbiB5b3UgaGF2ZSBjcnRjIT1O
VUxMICYmIGZiPT1OVUxMIGF0IGFsbCBoZXJlPw0KPiBTb21lIG90aGVyIHBsYW5lIHN0YXRl
IGNoZWNrIGZ1bmN0aW9uIChjYW4ndCByZW1lbWJlciB3aGljaCBvbmUNCj4gc3BlY2lmaWNh
bGx5KSBzaG91bGQgaGF2ZSByZWplY3RlZCB0aGF0LiBTbyBlaXRoZXIgeW91J3JlIGNoZWNr
aW5nDQo+IGZvciBpbXBvc3NpYmxlIHRoaW5ncywgb3IgdGhlcmUgaXMgYSBidWcgc29tZXdo
ZXJlIGVsc2UuDQo+IA0KPiBTbyB0byBtZSBpdCBsb29rcyBsaWtlIGl0IHNob3VsZCBiZSBl
bm91Z2ggdG8ganVzdCBjaGVjayB0aGUgcGxhbmVfbWFzaw0KPiBhbmQgbm90IGV2ZW4gYm90
aGVyIGxvb2tpbmcgYXQgdGhlIHBsYW5lIHN0YXRlIGF0IGFsbC4NCg0KSW5kZWVkLiBTb21l
aG93IEkgY29uZnVzZWQgcGxhbmVfbWFzayB3aXRoICdtYXNrIG9mIGFsbCBwbGFuZXMgcG9z
c2libGUnLg0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQo+IA0KPiANCj4+DQo+Pj4NCj4+
Pj4gICAgCQkJCWhhc19wcmltYXJ5X3BsYW5lID0gdHJ1ZTsNCj4+Pj4gICAgCQkJCWJyZWFr
Ow0KPj4+PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vZHJtX2F0b21pYy5oIGIvaW5jbHVk
ZS9kcm0vZHJtX2F0b21pYy5oDQo+Pj4+IGluZGV4IDEwYjE5OTBiYzFmNi4uNDAwNmYyZDQ1
OWUzIDEwMDY0NA0KPj4+PiAtLS0gYS9pbmNsdWRlL2RybS9kcm1fYXRvbWljLmgNCj4+Pj4g
KysrIGIvaW5jbHVkZS9kcm0vZHJtX2F0b21pYy5oDQo+Pj4+IEBAIC02MjMsNiArNjIzLDI2
IEBAIGRybV9hdG9taWNfZ2V0X25ld19wbGFuZV9zdGF0ZShzdHJ1Y3QgZHJtX2F0b21pY19z
dGF0ZSAqc3RhdGUsDQo+Pj4+ICAgIAlyZXR1cm4gc3RhdGUtPnBsYW5lc1tkcm1fcGxhbmVf
aW5kZXgocGxhbmUpXS5uZXdfc3RhdGU7DQo+Pj4+ICAgIH0NCj4+Pj4gICAgDQo+Pj4+ICsv
KioNCj4+Pj4gKyAqIGRybV9hdG9taWNfZ2V0X25leHRfcGxhbmVfc3RhdGUgLSBnZXQgcGxh
bmUgc3RhdGUgYWZ0ZXIgYXRvbWljIGNvbW1pdA0KPj4+PiArICogQHN0YXRlOiBnbG9iYWwg
YXRvbWljIHN0YXRlIG9iamVjdA0KPj4+PiArICogQHBsYW5lOiBwbGFuZSB0byBncmFiDQo+
Pj4+ICsgKg0KPj4+PiArICogVGhpcyBmdW5jdGlvbiByZXR1cm5zIHRoZSBwbGFuZSBzdGF0
ZSB0aGF0IHRoZSBnaXZlbiBwbGFuZSB3aWxsIGhhdmUNCj4+Pj4gKyAqIGFmdGVyIHRoZSBh
dG9taWMgY29tbWl0LiBUaGlzIHdpbGwgYmUgdGhlIG5ldyBwbGFuZSBzdGF0ZSBpZiB0aGUg
cGxhbmUNCj4+Pj4gKyAqIGlzIHBhcnQgb2YgdGhlIGdsb2JhbCBhdG9taWMgc3RhdGUsIG9y
IHRoZSBjdXJyZW50IHN0YXRlIG90aGVyd2lzZS4NCj4+Pj4gKyAqLw0KPj4+PiArc3RhdGlj
IGlubGluZSBzdHJ1Y3QgZHJtX3BsYW5lX3N0YXRlICoNCj4+Pj4gK2RybV9hdG9taWNfZ2V0
X25leHRfcGxhbmVfc3RhdGUoc3RydWN0IGRybV9hdG9taWNfc3RhdGUgKnN0YXRlLA0KPj4+
PiArCQkJCXN0cnVjdCBkcm1fcGxhbmUgKnBsYW5lKQ0KPj4+PiArew0KPj4+PiArCXN0cnVj
dCBkcm1fcGxhbmVfc3RhdGUgKnBsYW5lX3N0YXRlID0gZHJtX2F0b21pY19nZXRfbmV3X3Bs
YW5lX3N0YXRlKHN0YXRlLCBwbGFuZSk7DQo+Pj4+ICsNCj4+Pj4gKwlpZiAocGxhbmVfc3Rh
dGUpDQo+Pj4+ICsJCXJldHVybiBwbGFuZV9zdGF0ZTsNCj4+Pj4gKwlyZXR1cm4gcGxhbmUt
PnN0YXRlOw0KPj4+DQo+Pj4gWW91J3JlIG5vdCBob2xkaW5nIHRoZSBhcHByb3ByaWF0ZSBs
b2NrIHNvIHRoYXQgZG9lcyBub3QgbG9vayBzYWZlLiBFdmVuDQo+Pj4gaWYgeW91IGtub3cg
c29tZXdoZXJlLCBzb21laG93IHRoaXMgc29ydCBvZiB0aGluZyB0byBiZSBzYWZlIEkgZG9u
J3QNCj4+PiB0aGluayBpdCdzIGEgZ29vZCBpZGVhIHRvIHByb21vdGUgdGhpcyB3aXRoIGFu
eSBraW5kIG9mIG9mZmljaWFsDQo+Pj4gZnVuY3Rpb24gYmVjYXVzZSBzb21lb25lIHdpbGwg
c2hvb3QgdGhlbXNlbHZlcyBpbiB0aGUgZm9vdCB3aXRoIGl0Lg0KPj4NCj4+IE9LLiBJdCds
bCBiZSBpbmxpbmVkIHdpdGggbG9ja2luZyBhZGRlZC4NCj4+DQo+PiBCZXN0IHJlZ2FyZHMN
Cj4+IFRob21hcw0KPj4NCj4+Pg0KPj4+PiArfQ0KPj4+PiArDQo+Pj4+ICAgIC8qKg0KPj4+
PiAgICAgKiBkcm1fYXRvbWljX2dldF9leGlzdGluZ19jb25uZWN0b3Jfc3RhdGUgLSBnZXQg
Y29ubmVjdG9yIHN0YXRlLCBpZiBpdCBleGlzdHMNCj4+Pj4gICAgICogQHN0YXRlOiBnbG9i
YWwgYXRvbWljIHN0YXRlIG9iamVjdA0KPj4+PiAtLSANCj4+Pj4gMi4zNy4zDQo+Pj4NCj4+
DQo+PiAtLSANCj4+IFRob21hcyBaaW1tZXJtYW5uDQo+PiBHcmFwaGljcyBEcml2ZXIgRGV2
ZWxvcGVyDQo+PiBTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCj4+IE1h
eGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0KPj4gKEhSQiAzNjgwOSwg
QUcgTsO8cm5iZXJnKQ0KPj4gR2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rldg0KPiANCj4g
DQo+IA0KPiANCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERl
dmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxk
c3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJu
YmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCg==

--------------861bArSijhZ1xW25PWroP1P3--

--------------36oSExKdjABEYvU0bfIoRgLq
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmM2xK4FAwAAAAAACgkQlh/E3EQov+Az
kg//XZEoF2WPAWrA9xG45rCbCdkGYIZAMOhHzhYqwjmkjfHHBl/qNzB/VeVRA3J5vxfJNDlk5Pfg
3kyGcn5/GWP1I4waB4b1MCxmtfuVTseIUpm/3rMM56nLEFwMKUaNy+ZYTnS8fdyRO/ngld/WE5sV
9jQ1spO8BNmQaKIQJ5VQ5zcfdDNYc9D8D5OVZPMlFyVUAFPglb9i8wA+1K4a/Y34I7nIU1dV8sZa
E/nD6E5thsyOtiDnkFk/T4IOFKrCqb5u06IsxZYUVJGD3/cpYkW5q55EWxjKU5cYvl5JkxxGambp
xe2VbabCr4oFUQdKWhOj1XgBJ27spKe5v4vH20JOXnGtZmt4mV8Syaemlrzr+tgLkzCcEprMhxsM
ojLUxFkFs8d3SuBMoGb+iBuouSIR6F72ZtqY9pHPOphsvqj3rScgZgqfg6k0n/FSJpIrBXvaMNFw
6g5VnR7yvMUSDrokQsejDeFzKevBFJ/KTWZhNdKfSu4XvBta1/hZCLj/QkpGeFQOKnI4BKYOu/Km
dQrCJL06C9Dsehpx6EW8UL3k9FgeMXEL9HAx4EUnlFSOIwrn+0QX3NA51CmvDI3q3Sg7xASuHMYV
c+QuFHxrYr1detFgCOfOX5QM9JOtTKcr1jHxoegskDxInsBICyF2snrPEv7+2cGpMR4w/1p8DCul
Ex8=
=WoSn
-----END PGP SIGNATURE-----

--------------36oSExKdjABEYvU0bfIoRgLq--
