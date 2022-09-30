Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 57AA65F0935
	for <lists+dri-devel@lfdr.de>; Fri, 30 Sep 2022 12:36:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6523210EC63;
	Fri, 30 Sep 2022 10:36:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1E9110EC6E
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Sep 2022 10:36:46 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 9A9051F892;
 Fri, 30 Sep 2022 10:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1664534205; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AT445ebE2pp9qyC8/d+ixktRCo5qvzpBz4YH1nxOPbo=;
 b=FPLWYAW7dML1eSZ4shpeJIFYjt9Hle+1JV5mczhbnfgfPM6CEIc1bXkFb3vnxF/Qju8j7Y
 fH/vrmEfMf01RijH623qjOOn5/wZueEm86DbQBtQci6IpPTJ5qXk6W7h8PSi4mjm44Leid
 OeJqM2v7W73JkEPJ8eyNEDgFrkLygRw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1664534205;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AT445ebE2pp9qyC8/d+ixktRCo5qvzpBz4YH1nxOPbo=;
 b=bI6eupsFPR/vvE4FSKB53D+CHHDW9KSFgwDUW7X4ym6iiF82wg74AlcSfGn5aFBlpcBkds
 +BYFVa/SznDbVSDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7A05913776;
 Fri, 30 Sep 2022 10:36:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id apPkHL3GNmOYeAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 30 Sep 2022 10:36:45 +0000
Message-ID: <20a4ba1c-a813-151e-9118-702fbf9c1b3e@suse.de>
Date: Fri, 30 Sep 2022 12:36:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH] drm/atomic-helper: Don't allocated plane state in CRTC
 check
Content-Language: en-US
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <20220929140714.14794-1-tzimmermann@suse.de>
 <YzXsFOjOuRUdeNo6@intel.com> <7e01f298-152c-d2b3-057c-b788c6f577b8@suse.de>
 <Yzay6XYpfuZrknUZ@intel.com> <YzbEYyUQIJX1ut1q@intel.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <YzbEYyUQIJX1ut1q@intel.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------2fosMhomwcTJDQA3YVFhd8vB"
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
--------------2fosMhomwcTJDQA3YVFhd8vB
Content-Type: multipart/mixed; boundary="------------0ifJH0KdlMjghs9Qj1V2nwFo";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: David Airlie <airlied@linux.ie>, jfalempe@redhat.com, javierm@redhat.com,
 dri-devel@lists.freedesktop.org
Message-ID: <20a4ba1c-a813-151e-9118-702fbf9c1b3e@suse.de>
Subject: Re: [PATCH] drm/atomic-helper: Don't allocated plane state in CRTC
 check
References: <20220929140714.14794-1-tzimmermann@suse.de>
 <YzXsFOjOuRUdeNo6@intel.com> <7e01f298-152c-d2b3-057c-b788c6f577b8@suse.de>
 <Yzay6XYpfuZrknUZ@intel.com> <YzbEYyUQIJX1ut1q@intel.com>
In-Reply-To: <YzbEYyUQIJX1ut1q@intel.com>

--------------0ifJH0KdlMjghs9Qj1V2nwFo
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMzAuMDkuMjIgdW0gMTI6MjYgc2NocmllYiBWaWxsZSBTeXJqw6Rsw6Q6DQo+
IE9uIEZyaSwgU2VwIDMwLCAyMDIyIGF0IDEyOjEyOjA5UE0gKzAzMDAsIFZpbGxlIFN5cmrD
pGzDpCB3cm90ZToNCj4+IE9uIEZyaSwgU2VwIDMwLCAyMDIyIGF0IDExOjAxOjUyQU0gKzAy
MDAsIFRob21hcyBaaW1tZXJtYW5uIHdyb3RlOg0KPj4+IEhpLA0KPj4+DQo+Pj4gdGhhbmtz
IGZvciByZXZpZXdpbmcuDQo+Pj4NCj4+PiBBbSAyOS4wOS4yMiB1bSAyMTowMyBzY2hyaWVi
IFZpbGxlIFN5cmrDpGzDpDoNCj4+Pj4gT24gVGh1LCBTZXAgMjksIDIwMjIgYXQgMDQ6MDc6
MTRQTSArMDIwMCwgVGhvbWFzIFppbW1lcm1hbm4gd3JvdGU6DQo+Pj4+PiBJbiBkcm1fYXRv
bWljX2hlbHBlcl9jaGVja19jcnRjX3N0YXRlKCksIGRvIG5vdCBhZGQgYSBuZXcgcGxhbmUg
c3RhdGUNCj4+Pj4+IHRvIHRoZSBnbG9iYWwgc3RhdGUgaWYgaXQgZG9lcyBub3QgZXhpc3Qg
YWxyZWFkeS4gQWRkaW5nIGEgbmV3IHBsYW5lDQo+Pj4+PiBzdGF0ZSB3aWxsIHJlc3VsdHMg
aW4gb3ZlcmhlYWQgZm9yIHRoZSBwbGFuZSBkdXJpbmcgdGhlIGF0b21pYy1jb21taXQNCj4+
Pj4+IHN0ZXAuDQo+Pj4+Pg0KPj4+Pj4gRm9yIHRoZSB0ZXN0IGluIGRybV9hdG9taWNfaGVs
cGVyX2NoZWNrX2NydGNfc3RhdGUoKSB0byBzdWNjZWVkLCBpdCBpcw0KPj4+Pj4gaW1wb3J0
YW50IHRoYXQgdGhlIENSVEMgaGFzIGFuIGVuYWJsZWQgcHJpbWFyeSBwbGFuZSBhZnRlciB0
aGUgY29tbWl0Lg0KPj4+Pj4gVGhpcyBjYW4gYmUgYSBuZXdseSBlbmFibGVkIHBsYW5lIG9y
IGFuIGFscmVhZHkgZW5hYmxlZCBwbGFuZS4gU28gaWYgYQ0KPj4+Pj4gcGxhbmUgaXMgbm90
IHBhcnQgb2YgdGhlIGNvbW1pdCwgdXNlIHRoZSBwbGFuZSdzIGV4aXN0aW5nIHN0YXRlLiBU
aGUgbmV3DQo+Pj4+PiBoZWxwZXIgZHJtX2F0b21pY19nZXRfbmV4dF9wbGFuZV9zdGF0ZSgp
IHJldHVybnMgdGhlIGNvcnJlY3QgaW5zdGFuY2UuDQo+Pj4+Pg0KPj4+Pj4gU2lnbmVkLW9m
Zi1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+DQo+Pj4+PiBG
aXhlczogZDZiOWFmMTA5N2ZlICgiZHJtL2F0b21pYy1oZWxwZXI6IEFkZCBoZWxwZXIgZHJt
X2F0b21pY19oZWxwZXJfY2hlY2tfY3J0Y19zdGF0ZSgpIikNCj4+Pj4+IENjOiBUaG9tYXMg
WmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4NCj4+Pj4+IENjOiBKb2NlbHluIEZh
bGVtcGUgPGpmYWxlbXBlQHJlZGhhdC5jb20+DQo+Pj4+PiBDYzogTWFhcnRlbiBMYW5raG9y
c3QgPG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4LmludGVsLmNvbT4NCj4+Pj4+IENjOiBNYXhp
bWUgUmlwYXJkIDxtcmlwYXJkQGtlcm5lbC5vcmc+DQo+Pj4+PiBDYzogRGF2aWQgQWlybGll
IDxhaXJsaWVkQGxpbnV4LmllPg0KPj4+Pj4gQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBm
ZndsbC5jaD4NCj4+Pj4+IENjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+
Pj4+PiAtLS0NCj4+Pj4+ICAgIGRyaXZlcnMvZ3B1L2RybS9kcm1fYXRvbWljX2hlbHBlci5j
IHwgIDQgKy0tLQ0KPj4+Pj4gICAgaW5jbHVkZS9kcm0vZHJtX2F0b21pYy5oICAgICAgICAg
ICAgfCAyMCArKysrKysrKysrKysrKysrKysrKw0KPj4+Pj4gICAgMiBmaWxlcyBjaGFuZ2Vk
LCAyMSBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQ0KPj4+Pj4NCj4+Pj4+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2F0b21pY19oZWxwZXIuYyBiL2RyaXZlcnMv
Z3B1L2RybS9kcm1fYXRvbWljX2hlbHBlci5jDQo+Pj4+PiBpbmRleCA5OGNjMzEzN2MwNjIu
LjQ2M2Q0ZjNmYTQ0MyAxMDA2NDQNCj4+Pj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1f
YXRvbWljX2hlbHBlci5jDQo+Pj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2F0b21p
Y19oZWxwZXIuYw0KPj4+Pj4gQEAgLTk2MCw5ICs5NjAsNyBAQCBpbnQgZHJtX2F0b21pY19o
ZWxwZXJfY2hlY2tfY3J0Y19zdGF0ZShzdHJ1Y3QgZHJtX2NydGNfc3RhdGUgKmNydGNfc3Rh
dGUsDQo+Pj4+PiAgICANCj4+Pj4+ICAgIAkJCWlmIChwbGFuZS0+dHlwZSAhPSBEUk1fUExB
TkVfVFlQRV9QUklNQVJZKQ0KPj4+Pj4gICAgCQkJCWNvbnRpbnVlOw0KPj4+Pj4gLQkJCXBs
YW5lX3N0YXRlID0gZHJtX2F0b21pY19nZXRfcGxhbmVfc3RhdGUoc3RhdGUsIHBsYW5lKTsN
Cj4+Pj4+IC0JCQlpZiAoSVNfRVJSKHBsYW5lX3N0YXRlKSkNCj4+Pj4+IC0JCQkJcmV0dXJu
IFBUUl9FUlIocGxhbmVfc3RhdGUpOw0KPj4+Pj4gKwkJCXBsYW5lX3N0YXRlID0gZHJtX2F0
b21pY19nZXRfbmV4dF9wbGFuZV9zdGF0ZShzdGF0ZSwgcGxhbmUpOw0KPj4+Pj4gICAgCQkJ
aWYgKHBsYW5lX3N0YXRlLT5mYiAmJiBwbGFuZV9zdGF0ZS0+Y3J0Yykgew0KPj4+Pg0KPj4+
PiBIbW0uIFdoeSB0aGlzIGlzIGV2ZW4gbG9va2luZyBhdCB0aGVzZS4gSWYgdGhlIHBsYW5l
IGlzIGluIHRoZSBjcnRjJ3MNCj4+Pj4gcGxhbmVfbWFzayB0aGVuIHN1cmVseSBwbGFuZV9z
dGF0ZS0+Y3J0YyBtdXN0IGFscmVhZHkgcG9pbnQgdG8gdGhpcw0KPj4+PiBjcnRjPyBBbmQg
SSBkb24ndCB0aGluayAtPmZiIGFuZCAtPmNydGMgYXJlIGFsbG93ZWQgdG8gZGlzYWdyZWUs
IHNvDQo+Pj4+IGlmIG9uZSBpcyBzZXQgdGhlbiBzdXJlbHkgdGhlIG90aGVyIG9uZSBtdXN0
IGJlIGFzIHdlbGwgb3Igd2UnZA0KPj4+PiByZXR1cm4gYW4gZXJyb3IgYXQgc29tZSBwb2lu
dCBzb21ld2hlcmU/DQo+Pj4NCj4+PiBZZWFoLCB0aGUgY3J0YyB0ZXN0IGlzIGRvbmUgZm9y
IGtlZXBpbmcgY29uc2lzdGVuY3kuIE90aGVyIHBsYWNlcyBhbHNvDQo+Pj4gc29tZXRpbWVz
IHZhbGlkYXRlIHRoYXQgdGhlc2UgZmllbGRzIGRvbid0IGRpc2FncmVlLiBJJ2xsIHJlbW92
ZSB0aGUNCj4+PiBjcnRjIHRlc3QgaW4gdGhlIG5leHQgdmVyc2lvbi4gVGhlIGZiIHRlc3Qg
aXMgdGhlIGltcG9ydGFudCBvbmUuDQo+Pg0KPj4gV2hhdCBJJ20gYXNraW5nIGhvdyBjYW4g
eW91IGhhdmUgY3J0YyE9TlVMTCAmJiBmYj09TlVMTCBhdCBhbGwgaGVyZT8NCj4+IFNvbWUg
b3RoZXIgcGxhbmUgc3RhdGUgY2hlY2sgZnVuY3Rpb24gKGNhbid0IHJlbWVtYmVyIHdoaWNo
IG9uZQ0KPj4gc3BlY2lmaWNhbGx5KSBzaG91bGQgaGF2ZSByZWplY3RlZCB0aGF0LiBTbyBl
aXRoZXIgeW91J3JlIGNoZWNraW5nDQo+PiBmb3IgaW1wb3NzaWJsZSB0aGluZ3MsIG9yIHRo
ZXJlIGlzIGEgYnVnIHNvbWV3aGVyZSBlbHNlLg0KPiANCj4gT2ggYW5kIGJ0dywgZmIgIT0g
TlVMTCBkb2Vzbid0IGd1YXJhbnRlZSB0aGUgcGxhbmUgaXMgYWN0dWFsbHkNCj4gdmlzaWJs
ZSAoY291bGQgaGF2ZSBiZWVuIGZ1bGx5IGNsaXBwZWQpLCBpZiB0aGF0IGlzIHdoYXQgeW91
J3JlDQo+IHRyeWluZyB0byBjaGVjayBoZXJlLg0KPiANCg0KTm8sIGl0J3MgcmVhbGx5IGp1
c3QgYWJvdXQgaGF2aW5nIGEgcHJpbWFyeSBwbGFuZSBlbmFibGVkIG9uIHRoZSBDUlRDLg0K
DQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFw
aGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55
IEdtYkgNCk1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0KKEhSQiAz
NjgwOSwgQUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rldg0K

--------------0ifJH0KdlMjghs9Qj1V2nwFo--

--------------2fosMhomwcTJDQA3YVFhd8vB
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmM2xr0FAwAAAAAACgkQlh/E3EQov+AQ
yg/+LCLvGLvuWp0IJXoPlLjsc6o4HdoFGIaYgz2p15hM3wkk4/Q4N9jyTQgAzzNU0IyBnqtRnyyk
EMia+QEbMjR1iluthLZarm9XKm8N7yUdjSDpQemg/blOq7A4dWLKbxK2UwpvY88UVDLRIofopF+n
zMueT8cf0gMBEqGhLT0nCcw5iK5H9JNRyW3H/PzJUjjvxXnjWLQOQFdhWS2wZMvaWkInaFEVFkci
Uu+KQ1CJHToIAdUik1UTUK975BndwczbOne5RM1wy0Jia+RbQHHxNhmClB5W3w44g5sSfEBJzZ4Z
Yc6dUHAjGiIgWwgO8JkRyC25Wjj/YmsdLqgyvKWB6SBsSmVFKbc4x9nDitFj6W4Ls0LnxvAC8lJX
1PizPYsaad1j2+JAHtClPOSnF3M5Mv1nrT3QIlMKocTFD5eBbtPNswvXB1SdTIC96bC6fY6IDxUT
QCiNJbSKQJykbcSqWsB8LAiv7CVQTGphe1qP/iZ/Lrs+RIlMB/1o7jLPBHsE6aDGsD6//vKMCxti
knOKKFT48HZRVmT22QnQD8DFMo+orWqmWq5JVMu3acDu3sIEYHb28sHc/qc0oKlzNBZHU2+GPAlP
h4IvOJ3viOcp0fIG0jP98ZXX0ZvdXVk3vIkEN62K3HgYgtLrTrklfLsCcQsLXc3S3J32XMuPw0ZC
gA0=
=QMw6
-----END PGP SIGNATURE-----

--------------2fosMhomwcTJDQA3YVFhd8vB--
