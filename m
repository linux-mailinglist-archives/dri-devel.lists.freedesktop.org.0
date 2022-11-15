Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C733629766
	for <lists+dri-devel@lfdr.de>; Tue, 15 Nov 2022 12:30:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 643A610E145;
	Tue, 15 Nov 2022 11:30:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 555A810E3B3
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Nov 2022 11:30:41 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id EBDC82201D;
 Tue, 15 Nov 2022 11:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1668511839; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=G+hs4UChPNhhdg/Z06r8C9a6T0u+gfkejEqQcNOhajc=;
 b=ZNXaViR4S/rqCcbuOKxXMcGymHAZEUzkU03NO+JMOl+rv4sd1Lcb++if3JhTyaV02amzjD
 OeDBv/XW/2yQW70tgu90TcSAWvOj1NF3KmhfvPZX7gqdy/MEA++gS8POvf34STISwOSfnZ
 Y4Iiaw2pIKtKEHyHLZJ4yKbqQK4wWYo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1668511839;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=G+hs4UChPNhhdg/Z06r8C9a6T0u+gfkejEqQcNOhajc=;
 b=gqPP9sR5idD/LITQpBzdEfez5VYP0SQH2HTK7R/AfOLaJlM9en+7l/e1GY9EvSyMur9Tni
 07malO0MkzyvNDBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B84B613273;
 Tue, 15 Nov 2022 11:30:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id EY26KV94c2MOIAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 15 Nov 2022 11:30:39 +0000
Message-ID: <cc224202-b296-4aae-6f90-52910cba6e68@suse.de>
Date: Tue, 15 Nov 2022 12:30:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 5/5] drm/fb-helper: Remove damage worker
Content-Language: en-US
To: Daniel Vetter <daniel@ffwll.ch>
References: <20221110135519.30029-1-tzimmermann@suse.de>
 <20221110135519.30029-6-tzimmermann@suse.de>
 <Y24Y6J5pctUt1mFB@phenom.ffwll.local>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <Y24Y6J5pctUt1mFB@phenom.ffwll.local>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------3gagFUo49CrTwQqRm0V6fWDv"
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
Cc: javierm@redhat.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------3gagFUo49CrTwQqRm0V6fWDv
Content-Type: multipart/mixed; boundary="------------dFeQbtJKNTrwN3um02dAhRsB";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: javierm@redhat.com, dri-devel@lists.freedesktop.org
Message-ID: <cc224202-b296-4aae-6f90-52910cba6e68@suse.de>
Subject: Re: [PATCH 5/5] drm/fb-helper: Remove damage worker
References: <20221110135519.30029-1-tzimmermann@suse.de>
 <20221110135519.30029-6-tzimmermann@suse.de>
 <Y24Y6J5pctUt1mFB@phenom.ffwll.local>
In-Reply-To: <Y24Y6J5pctUt1mFB@phenom.ffwll.local>

--------------dFeQbtJKNTrwN3um02dAhRsB
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTEuMTEuMjIgdW0gMTA6NDIgc2NocmllYiBEYW5pZWwgVmV0dGVyOg0KPiBP
biBUaHUsIE5vdiAxMCwgMjAyMiBhdCAwMjo1NToxOVBNICswMTAwLCBUaG9tYXMgWmltbWVy
bWFubiB3cm90ZToNCj4+IFRoZSBmYmRldiBkYW1hZ2Ugd29ya2VyIGlzIHVudXNlZCwgc28g
cmVtb3ZlIGl0Lg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBaaW1tZXJtYW5uIDx0
emltbWVybWFubkBzdXNlLmRlPg0KPiANCj4gSSdkIHNxdWFzaCB0aGlzIGludG8gdGhlIHBy
ZXZpb3VzIHBhdGNoLCB3aGljaCBnZXRzIHJpZCBvZiB0aGUNCj4gc2NoZWR1bGVfd29yaygp
LCBpZiB5b3UgbGltaXQgdGhlIHByZXZpb3VzIHBhdGNoIHRvIHJlYWxseSBqdXN0IHRoYXQN
Cj4gY2hhbmdlLiBCdXQgc3BsaXQgb3V0IGlzIGZpbmUgdG9vLg0KPiANCj4gUmV2aWV3ZWQt
Ynk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+DQoNClRoYW5rcyBm
b3IgcmV2aWV3aW5nIHRoZSBwYXRjaHNldC4gQWZ0ZXIgZ29pbmcgdGhyb3VnaCBhbGwgdGhl
IGNvbW1lbnRzLCANCnRoZSBwYXRjaGVzIGxvb2sgbXVjaCBiZXR0ZXIgdGhhbiBiZWZvcmUu
DQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCj4gDQo+PiAtLS0NCj4+ICAgZHJpdmVycy9n
cHUvZHJtL2RybV9mYl9oZWxwZXIuYyB8IDkgLS0tLS0tLS0tDQo+PiAgIGluY2x1ZGUvZHJt
L2RybV9mYl9oZWxwZXIuaCAgICAgfCAyIC0tDQo+PiAgIDIgZmlsZXMgY2hhbmdlZCwgMTEg
ZGVsZXRpb25zKC0pDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1f
ZmJfaGVscGVyLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2ZiX2hlbHBlci5jDQo+PiBpbmRl
eCA4Y2I2NDRlNGVjZjkwLi40N2I4ZWYwM2ExZjg5IDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2RybV9mYl9oZWxwZXIuYw0KPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2Ry
bV9mYl9oZWxwZXIuYw0KPj4gQEAgLTQwMywxMyArNDAzLDYgQEAgc3RhdGljIHZvaWQgZHJt
X2ZiX2hlbHBlcl9mYl9kaXJ0eShzdHJ1Y3QgZHJtX2ZiX2hlbHBlciAqaGVscGVyKQ0KPj4g
ICAJc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgmaGVscGVyLT5kYW1hZ2VfbG9jaywgZmxhZ3Mp
Ow0KPj4gICB9DQo+PiAgIA0KPj4gLXN0YXRpYyB2b2lkIGRybV9mYl9oZWxwZXJfZGFtYWdl
X3dvcmsoc3RydWN0IHdvcmtfc3RydWN0ICp3b3JrKQ0KPj4gLXsNCj4+IC0Jc3RydWN0IGRy
bV9mYl9oZWxwZXIgKmhlbHBlciA9IGNvbnRhaW5lcl9vZih3b3JrLCBzdHJ1Y3QgZHJtX2Zi
X2hlbHBlciwgZGFtYWdlX3dvcmspOw0KPj4gLQ0KPj4gLQlkcm1fZmJfaGVscGVyX2ZiX2Rp
cnR5KGhlbHBlcik7DQo+PiAtfQ0KPj4gLQ0KPj4gICAvKioNCj4+ICAgICogZHJtX2ZiX2hl
bHBlcl9wcmVwYXJlIC0gc2V0dXAgYSBkcm1fZmJfaGVscGVyIHN0cnVjdHVyZQ0KPj4gICAg
KiBAZGV2OiBEUk0gZGV2aWNlDQo+PiBAQCAtNDI1LDcgKzQxOCw2IEBAIHZvaWQgZHJtX2Zi
X2hlbHBlcl9wcmVwYXJlKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHN0cnVjdCBkcm1fZmJf
aGVscGVyICpoZWxwZXIsDQo+PiAgIAlJTklUX0xJU1RfSEVBRCgmaGVscGVyLT5rZXJuZWxf
ZmJfbGlzdCk7DQo+PiAgIAlzcGluX2xvY2tfaW5pdCgmaGVscGVyLT5kYW1hZ2VfbG9jayk7
DQo+PiAgIAlJTklUX1dPUksoJmhlbHBlci0+cmVzdW1lX3dvcmssIGRybV9mYl9oZWxwZXJf
cmVzdW1lX3dvcmtlcik7DQo+PiAtCUlOSVRfV09SSygmaGVscGVyLT5kYW1hZ2Vfd29yaywg
ZHJtX2ZiX2hlbHBlcl9kYW1hZ2Vfd29yayk7DQo+PiAgIAloZWxwZXItPmRhbWFnZV9jbGlw
LngxID0gaGVscGVyLT5kYW1hZ2VfY2xpcC55MSA9IH4wOw0KPj4gICAJbXV0ZXhfaW5pdCgm
aGVscGVyLT5sb2NrKTsNCj4+ICAgCWhlbHBlci0+ZnVuY3MgPSBmdW5jczsNCj4+IEBAIC01
NTcsNyArNTQ5LDYgQEAgdm9pZCBkcm1fZmJfaGVscGVyX2Zpbmkoc3RydWN0IGRybV9mYl9o
ZWxwZXIgKmZiX2hlbHBlcikNCj4+ICAgCQlyZXR1cm47DQo+PiAgIA0KPj4gICAJY2FuY2Vs
X3dvcmtfc3luYygmZmJfaGVscGVyLT5yZXN1bWVfd29yayk7DQo+PiAtCWNhbmNlbF93b3Jr
X3N5bmMoJmZiX2hlbHBlci0+ZGFtYWdlX3dvcmspOw0KPj4gICANCj4+ICAgCWluZm8gPSBm
Yl9oZWxwZXItPmluZm87DQo+PiAgIAlpZiAoaW5mbykgew0KPj4gZGlmZiAtLWdpdCBhL2lu
Y2x1ZGUvZHJtL2RybV9mYl9oZWxwZXIuaCBiL2luY2x1ZGUvZHJtL2RybV9mYl9oZWxwZXIu
aA0KPj4gaW5kZXggZWNmY2QyYzU2ZDk1YS4uZjM3YmIyODMyYmE0MSAxMDA2NDQNCj4+IC0t
LSBhL2luY2x1ZGUvZHJtL2RybV9mYl9oZWxwZXIuaA0KPj4gKysrIGIvaW5jbHVkZS9kcm0v
ZHJtX2ZiX2hlbHBlci5oDQo+PiBAQCAtMTE2LDcgKzExNiw2IEBAIHN0cnVjdCBkcm1fZmJf
aGVscGVyX2Z1bmNzIHsNCj4+ICAgICogQGRhbWFnZV9jbGlwOiBjbGlwIHJlY3RhbmdsZSB1
c2VkIHdpdGggZGVmZXJyZWRfaW8gdG8gYWNjdW11bGF0ZSBkYW1hZ2UgdG8NCj4+ICAgICog
ICAgICAgICAgICAgICAgdGhlIHNjcmVlbiBidWZmZXINCj4+ICAgICogQGRhbWFnZV9sb2Nr
OiBzcGlubG9jayBwcm90ZWN0aW5nIEBkYW1hZ2VfY2xpcA0KPj4gLSAqIEBkYW1hZ2Vfd29y
azogd29ya2VyIHVzZWQgdG8gZmx1c2ggdGhlIGZyYW1lYnVmZmVyDQo+PiAgICAqIEByZXN1
bWVfd29yazogd29ya2VyIHVzZWQgZHVyaW5nIHJlc3VtZSBpZiB0aGUgY29uc29sZSBsb2Nr
IGlzIGFscmVhZHkgdGFrZW4NCj4+ICAgICoNCj4+ICAgICogVGhpcyBpcyB0aGUgbWFpbiBz
dHJ1Y3R1cmUgdXNlZCBieSB0aGUgZmJkZXYgaGVscGVycy4gRHJpdmVycyBzdXBwb3J0aW5n
DQo+PiBAQCAtMTQ2LDcgKzE0NSw2IEBAIHN0cnVjdCBkcm1fZmJfaGVscGVyIHsNCj4+ICAg
CXUzMiBwc2V1ZG9fcGFsZXR0ZVsxN107DQo+PiAgIAlzdHJ1Y3QgZHJtX2NsaXBfcmVjdCBk
YW1hZ2VfY2xpcDsNCj4+ICAgCXNwaW5sb2NrX3QgZGFtYWdlX2xvY2s7DQo+PiAtCXN0cnVj
dCB3b3JrX3N0cnVjdCBkYW1hZ2Vfd29yazsNCj4+ICAgCXN0cnVjdCB3b3JrX3N0cnVjdCBy
ZXN1bWVfd29yazsNCj4+ICAgDQo+PiAgIAkvKioNCj4+IC0tIA0KPj4gMi4zOC4wDQo+Pg0K
PiANCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Bl
cg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1
LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykN
Ckdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCg==

--------------dFeQbtJKNTrwN3um02dAhRsB--

--------------3gagFUo49CrTwQqRm0V6fWDv
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmNzeF4FAwAAAAAACgkQlh/E3EQov+DF
Vg/+O8rVuv4Z0rIKPkFIS5/vPdJl0I7tq1YIAtZS8qli8gJD5yYSh8PG/JQ01TBW6Fylw0/RjAt5
9ecKeiEBpTXNCGnAWP+Z6Orl7HNUU+hG21qcQjB/YNvvgQtmijPP/FJQjw5FgC8qxu3IBjsy/nHI
BlHaEbt7Pyazr0sTsmgTPQSopnjsDol1SsHIozZXCExlVSEq9apUip6A9zxgDIThrlcw8GcDKYZy
vcNX2MXN6AsttM8Gs0tlaqIHU7DUFfGMOh7uMXX7VhsHmJ5N3qLc96FyPcD7pZhRgSiTT2mdYAm1
Y8901iunefuRjefREdIUPORRfGwTeWoeQVfsJDNN4mP3ISbW9uQFihoOvYIuhJCG1awZcoW7xv6T
PBJXLk9jVc2ai3UYbgu1VRYIs2C009xxxaXLEGKlpNYbxMUcgYSr6AKOTxp5sCZ/dSUlLaY+GAKS
eBkrJK9usjL9SoOv+0J1+Y7+Hn5aXEndsEMem0JfcIwvJ7G6ToC/pIU3LmS+77lQCcWU4kmNBeUZ
Y/DuxwoSKE9CAqimiecLBoXEK/56hJeITf/DBUEIKbiSIKy7iLJxpO6VuzFwAyLHVNL1TNQADgbb
tCg6j88N64NEAEMslVGtH3dcDeTuK564Z4CgMtROswFPgX9OKM0Rn5Blep3EYIF3Am25+5xevmDH
f74=
=d23f
-----END PGP SIGNATURE-----

--------------3gagFUo49CrTwQqRm0V6fWDv--
