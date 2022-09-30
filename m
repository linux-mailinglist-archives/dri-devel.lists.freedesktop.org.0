Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAB855F0704
	for <lists+dri-devel@lfdr.de>; Fri, 30 Sep 2022 11:02:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F0EF10EBEB;
	Fri, 30 Sep 2022 09:02:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C454B10EBEF
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Sep 2022 09:01:54 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 78DB41F8CB;
 Fri, 30 Sep 2022 09:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1664528513; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=I2bkR9li5H+EDih5LX7aBzYDB9R5da6TbnPSBaldyqU=;
 b=faCGgH/JEs7TbnMJt3vUC8Fz6XjF54DXtMUsaIohXANm8JXe1rX4HAiwF6k7jgRU02u2gt
 8amLJXcZ5ZbOHjJdea6XphGPRIcG0foLZeqnvD+QN1e46L+x0IW7rmHPWBrhwEbFVc6wuO
 Xi8sjCHqJBDQHijnFKY8BRTgoAw7ZEw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1664528513;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=I2bkR9li5H+EDih5LX7aBzYDB9R5da6TbnPSBaldyqU=;
 b=LeeA8sG/cY4JtaGeSlHvqEhg94zrRj2vHcgU+7+rISXuQaccj4RNnWO60M/E7Ya0cM44VW
 zKQlPuM9GUXbrwBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 58FA713776;
 Fri, 30 Sep 2022 09:01:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id jhu6FIGwNmOaUgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 30 Sep 2022 09:01:53 +0000
Message-ID: <7e01f298-152c-d2b3-057c-b788c6f577b8@suse.de>
Date: Fri, 30 Sep 2022 11:01:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH] drm/atomic-helper: Don't allocated plane state in CRTC
 check
Content-Language: en-US
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <20220929140714.14794-1-tzimmermann@suse.de>
 <YzXsFOjOuRUdeNo6@intel.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <YzXsFOjOuRUdeNo6@intel.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------t71YawVdSZU1miLJAqq3WZMM"
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
--------------t71YawVdSZU1miLJAqq3WZMM
Content-Type: multipart/mixed; boundary="------------j9ovpu0v30mzB3TjnjudCrcL";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: jfalempe@redhat.com, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, javierm@redhat.com
Message-ID: <7e01f298-152c-d2b3-057c-b788c6f577b8@suse.de>
Subject: Re: [PATCH] drm/atomic-helper: Don't allocated plane state in CRTC
 check
References: <20220929140714.14794-1-tzimmermann@suse.de>
 <YzXsFOjOuRUdeNo6@intel.com>
In-Reply-To: <YzXsFOjOuRUdeNo6@intel.com>

--------------j9ovpu0v30mzB3TjnjudCrcL
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGksDQoNCnRoYW5rcyBmb3IgcmV2aWV3aW5nLg0KDQpBbSAyOS4wOS4yMiB1bSAyMTowMyBz
Y2hyaWViIFZpbGxlIFN5cmrDpGzDpDoNCj4gT24gVGh1LCBTZXAgMjksIDIwMjIgYXQgMDQ6
MDc6MTRQTSArMDIwMCwgVGhvbWFzIFppbW1lcm1hbm4gd3JvdGU6DQo+PiBJbiBkcm1fYXRv
bWljX2hlbHBlcl9jaGVja19jcnRjX3N0YXRlKCksIGRvIG5vdCBhZGQgYSBuZXcgcGxhbmUg
c3RhdGUNCj4+IHRvIHRoZSBnbG9iYWwgc3RhdGUgaWYgaXQgZG9lcyBub3QgZXhpc3QgYWxy
ZWFkeS4gQWRkaW5nIGEgbmV3IHBsYW5lDQo+PiBzdGF0ZSB3aWxsIHJlc3VsdHMgaW4gb3Zl
cmhlYWQgZm9yIHRoZSBwbGFuZSBkdXJpbmcgdGhlIGF0b21pYy1jb21taXQNCj4+IHN0ZXAu
DQo+Pg0KPj4gRm9yIHRoZSB0ZXN0IGluIGRybV9hdG9taWNfaGVscGVyX2NoZWNrX2NydGNf
c3RhdGUoKSB0byBzdWNjZWVkLCBpdCBpcw0KPj4gaW1wb3J0YW50IHRoYXQgdGhlIENSVEMg
aGFzIGFuIGVuYWJsZWQgcHJpbWFyeSBwbGFuZSBhZnRlciB0aGUgY29tbWl0Lg0KPj4gVGhp
cyBjYW4gYmUgYSBuZXdseSBlbmFibGVkIHBsYW5lIG9yIGFuIGFscmVhZHkgZW5hYmxlZCBw
bGFuZS4gU28gaWYgYQ0KPj4gcGxhbmUgaXMgbm90IHBhcnQgb2YgdGhlIGNvbW1pdCwgdXNl
IHRoZSBwbGFuZSdzIGV4aXN0aW5nIHN0YXRlLiBUaGUgbmV3DQo+PiBoZWxwZXIgZHJtX2F0
b21pY19nZXRfbmV4dF9wbGFuZV9zdGF0ZSgpIHJldHVybnMgdGhlIGNvcnJlY3QgaW5zdGFu
Y2UuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJt
YW5uQHN1c2UuZGU+DQo+PiBGaXhlczogZDZiOWFmMTA5N2ZlICgiZHJtL2F0b21pYy1oZWxw
ZXI6IEFkZCBoZWxwZXIgZHJtX2F0b21pY19oZWxwZXJfY2hlY2tfY3J0Y19zdGF0ZSgpIikN
Cj4+IENjOiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4NCj4+IENj
OiBKb2NlbHluIEZhbGVtcGUgPGpmYWxlbXBlQHJlZGhhdC5jb20+DQo+PiBDYzogTWFhcnRl
biBMYW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4LmludGVsLmNvbT4NCj4+IENj
OiBNYXhpbWUgUmlwYXJkIDxtcmlwYXJkQGtlcm5lbC5vcmc+DQo+PiBDYzogRGF2aWQgQWly
bGllIDxhaXJsaWVkQGxpbnV4LmllPg0KPj4gQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBm
ZndsbC5jaD4NCj4+IENjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+PiAt
LS0NCj4+ICAgZHJpdmVycy9ncHUvZHJtL2RybV9hdG9taWNfaGVscGVyLmMgfCAgNCArLS0t
DQo+PiAgIGluY2x1ZGUvZHJtL2RybV9hdG9taWMuaCAgICAgICAgICAgIHwgMjAgKysrKysr
KysrKysrKysrKysrKysNCj4+ICAgMiBmaWxlcyBjaGFuZ2VkLCAyMSBpbnNlcnRpb25zKCsp
LCAzIGRlbGV0aW9ucygtKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
ZHJtX2F0b21pY19oZWxwZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fYXRvbWljX2hlbHBl
ci5jDQo+PiBpbmRleCA5OGNjMzEzN2MwNjIuLjQ2M2Q0ZjNmYTQ0MyAxMDA2NDQNCj4+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fYXRvbWljX2hlbHBlci5jDQo+PiArKysgYi9kcml2
ZXJzL2dwdS9kcm0vZHJtX2F0b21pY19oZWxwZXIuYw0KPj4gQEAgLTk2MCw5ICs5NjAsNyBA
QCBpbnQgZHJtX2F0b21pY19oZWxwZXJfY2hlY2tfY3J0Y19zdGF0ZShzdHJ1Y3QgZHJtX2Ny
dGNfc3RhdGUgKmNydGNfc3RhdGUsDQo+PiAgIA0KPj4gICAJCQlpZiAocGxhbmUtPnR5cGUg
IT0gRFJNX1BMQU5FX1RZUEVfUFJJTUFSWSkNCj4+ICAgCQkJCWNvbnRpbnVlOw0KPj4gLQkJ
CXBsYW5lX3N0YXRlID0gZHJtX2F0b21pY19nZXRfcGxhbmVfc3RhdGUoc3RhdGUsIHBsYW5l
KTsNCj4+IC0JCQlpZiAoSVNfRVJSKHBsYW5lX3N0YXRlKSkNCj4+IC0JCQkJcmV0dXJuIFBU
Ul9FUlIocGxhbmVfc3RhdGUpOw0KPj4gKwkJCXBsYW5lX3N0YXRlID0gZHJtX2F0b21pY19n
ZXRfbmV4dF9wbGFuZV9zdGF0ZShzdGF0ZSwgcGxhbmUpOw0KPj4gICAJCQlpZiAocGxhbmVf
c3RhdGUtPmZiICYmIHBsYW5lX3N0YXRlLT5jcnRjKSB7DQo+IA0KPiBIbW0uIFdoeSB0aGlz
IGlzIGV2ZW4gbG9va2luZyBhdCB0aGVzZS4gSWYgdGhlIHBsYW5lIGlzIGluIHRoZSBjcnRj
J3MNCj4gcGxhbmVfbWFzayB0aGVuIHN1cmVseSBwbGFuZV9zdGF0ZS0+Y3J0YyBtdXN0IGFs
cmVhZHkgcG9pbnQgdG8gdGhpcw0KPiBjcnRjPyBBbmQgSSBkb24ndCB0aGluayAtPmZiIGFu
ZCAtPmNydGMgYXJlIGFsbG93ZWQgdG8gZGlzYWdyZWUsIHNvDQo+IGlmIG9uZSBpcyBzZXQg
dGhlbiBzdXJlbHkgdGhlIG90aGVyIG9uZSBtdXN0IGJlIGFzIHdlbGwgb3Igd2UnZA0KPiBy
ZXR1cm4gYW4gZXJyb3IgYXQgc29tZSBwb2ludCBzb21ld2hlcmU/DQoNClllYWgsIHRoZSBj
cnRjIHRlc3QgaXMgZG9uZSBmb3Iga2VlcGluZyBjb25zaXN0ZW5jeS4gT3RoZXIgcGxhY2Vz
IGFsc28gDQpzb21ldGltZXMgdmFsaWRhdGUgdGhhdCB0aGVzZSBmaWVsZHMgZG9uJ3QgZGlz
YWdyZWUuIEknbGwgcmVtb3ZlIHRoZSANCmNydGMgdGVzdCBpbiB0aGUgbmV4dCB2ZXJzaW9u
LiBUaGUgZmIgdGVzdCBpcyB0aGUgaW1wb3J0YW50IG9uZS4NCg0KPiANCj4+ICAgCQkJCWhh
c19wcmltYXJ5X3BsYW5lID0gdHJ1ZTsNCj4+ICAgCQkJCWJyZWFrOw0KPj4gZGlmZiAtLWdp
dCBhL2luY2x1ZGUvZHJtL2RybV9hdG9taWMuaCBiL2luY2x1ZGUvZHJtL2RybV9hdG9taWMu
aA0KPj4gaW5kZXggMTBiMTk5MGJjMWY2Li40MDA2ZjJkNDU5ZTMgMTAwNjQ0DQo+PiAtLS0g
YS9pbmNsdWRlL2RybS9kcm1fYXRvbWljLmgNCj4+ICsrKyBiL2luY2x1ZGUvZHJtL2RybV9h
dG9taWMuaA0KPj4gQEAgLTYyMyw2ICs2MjMsMjYgQEAgZHJtX2F0b21pY19nZXRfbmV3X3Bs
YW5lX3N0YXRlKHN0cnVjdCBkcm1fYXRvbWljX3N0YXRlICpzdGF0ZSwNCj4+ICAgCXJldHVy
biBzdGF0ZS0+cGxhbmVzW2RybV9wbGFuZV9pbmRleChwbGFuZSldLm5ld19zdGF0ZTsNCj4+
ICAgfQ0KPj4gICANCj4+ICsvKioNCj4+ICsgKiBkcm1fYXRvbWljX2dldF9uZXh0X3BsYW5l
X3N0YXRlIC0gZ2V0IHBsYW5lIHN0YXRlIGFmdGVyIGF0b21pYyBjb21taXQNCj4+ICsgKiBA
c3RhdGU6IGdsb2JhbCBhdG9taWMgc3RhdGUgb2JqZWN0DQo+PiArICogQHBsYW5lOiBwbGFu
ZSB0byBncmFiDQo+PiArICoNCj4+ICsgKiBUaGlzIGZ1bmN0aW9uIHJldHVybnMgdGhlIHBs
YW5lIHN0YXRlIHRoYXQgdGhlIGdpdmVuIHBsYW5lIHdpbGwgaGF2ZQ0KPj4gKyAqIGFmdGVy
IHRoZSBhdG9taWMgY29tbWl0LiBUaGlzIHdpbGwgYmUgdGhlIG5ldyBwbGFuZSBzdGF0ZSBp
ZiB0aGUgcGxhbmUNCj4+ICsgKiBpcyBwYXJ0IG9mIHRoZSBnbG9iYWwgYXRvbWljIHN0YXRl
LCBvciB0aGUgY3VycmVudCBzdGF0ZSBvdGhlcndpc2UuDQo+PiArICovDQo+PiArc3RhdGlj
IGlubGluZSBzdHJ1Y3QgZHJtX3BsYW5lX3N0YXRlICoNCj4+ICtkcm1fYXRvbWljX2dldF9u
ZXh0X3BsYW5lX3N0YXRlKHN0cnVjdCBkcm1fYXRvbWljX3N0YXRlICpzdGF0ZSwNCj4+ICsJ
CQkJc3RydWN0IGRybV9wbGFuZSAqcGxhbmUpDQo+PiArew0KPj4gKwlzdHJ1Y3QgZHJtX3Bs
YW5lX3N0YXRlICpwbGFuZV9zdGF0ZSA9IGRybV9hdG9taWNfZ2V0X25ld19wbGFuZV9zdGF0
ZShzdGF0ZSwgcGxhbmUpOw0KPj4gKw0KPj4gKwlpZiAocGxhbmVfc3RhdGUpDQo+PiArCQly
ZXR1cm4gcGxhbmVfc3RhdGU7DQo+PiArCXJldHVybiBwbGFuZS0+c3RhdGU7DQo+IA0KPiBZ
b3UncmUgbm90IGhvbGRpbmcgdGhlIGFwcHJvcHJpYXRlIGxvY2sgc28gdGhhdCBkb2VzIG5v
dCBsb29rIHNhZmUuIEV2ZW4NCj4gaWYgeW91IGtub3cgc29tZXdoZXJlLCBzb21laG93IHRo
aXMgc29ydCBvZiB0aGluZyB0byBiZSBzYWZlIEkgZG9uJ3QNCj4gdGhpbmsgaXQncyBhIGdv
b2QgaWRlYSB0byBwcm9tb3RlIHRoaXMgd2l0aCBhbnkga2luZCBvZiBvZmZpY2lhbA0KPiBm
dW5jdGlvbiBiZWNhdXNlIHNvbWVvbmUgd2lsbCBzaG9vdCB0aGVtc2VsdmVzIGluIHRoZSBm
b290IHdpdGggaXQuDQoNCk9LLiBJdCdsbCBiZSBpbmxpbmVkIHdpdGggbG9ja2luZyBhZGRl
ZC4NCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KPiANCj4+ICt9DQo+PiArDQo+PiAgIC8q
Kg0KPj4gICAgKiBkcm1fYXRvbWljX2dldF9leGlzdGluZ19jb25uZWN0b3Jfc3RhdGUgLSBn
ZXQgY29ubmVjdG9yIHN0YXRlLCBpZiBpdCBleGlzdHMNCj4+ICAgICogQHN0YXRlOiBnbG9i
YWwgYXRvbWljIHN0YXRlIG9iamVjdA0KPj4gLS0gDQo+PiAyLjM3LjMNCj4gDQoNCi0tIA0K
VGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29m
dHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8
cm5iZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOkZnRz
ZsO8aHJlcjogSXZvIFRvdGV2DQo=

--------------j9ovpu0v30mzB3TjnjudCrcL--

--------------t71YawVdSZU1miLJAqq3WZMM
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmM2sIAFAwAAAAAACgkQlh/E3EQov+Cm
nxAAtdamkmxJav+UO+0gCpDgxWP3IUqP50dNFrotMyaZ3Fvxfs5lSF6Kiee3cUMe0ZlqExlyTnKh
XdRd48aIpZ92oH3BNINR387YM20vMH+wL21gUn8ZsivzDNuQVVi2xD/TWz1U0gJRP+uYS8VoVV/s
KKSLE35rcjjMqx8KsIoHndTrd8szi83UoMZlYvvVR3MPdKCGNUe2QF/VqeGS56xFr0hJWkPqQ57I
yGA/h65lNElpWfh+hB8bnejuhoNWBBkQ4SLP3siYoRTpf5A57UtygkvSR6VZrj4nclodTFAgBhRo
egLryOIFpQKpeDb+P0QYe0N438DgbEyMWoflWMbvY9vaL0lXiwb286XJoG8/6af1kStQTMXt0AsV
bd/PyR0gUkB0oZvzXFvqk6ABNcw0z4qGXJnSlREOOeLt8Zfdi3mSChq9V0ke1IbzGIKh+pPwA7sU
b2xbcNn1ugD+mT6EaHIrl1biIGZ5zse//OMCml9lOYdTZEAroxwhbqSNDMCDYAwcq5DFJElWEDIX
V0ONb4oK23eD9qToqdYorkkTF61dTVihfG6Sc1XB/+CRP+xK5goDkIiOeu5Q/nRDW5pKEHpijElF
kEKOc1mLlH5t8FL92Hf1iyrrumTJspHxMbOaVfDEP0LC7URGXxvMxUWTozGft9QaDhGwU2b//xt8
BFU=
=uk7U
-----END PGP SIGNATURE-----

--------------t71YawVdSZU1miLJAqq3WZMM--
