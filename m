Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A18D75FF6E
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jul 2023 20:57:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30F4610E086;
	Mon, 24 Jul 2023 18:57:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38D9910E086
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jul 2023 18:57:34 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C74B61FDF0;
 Mon, 24 Jul 2023 18:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1690225052; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Dn4RRPm6JQxmeubGRohwnTCwA6DMt18SI5jdD/soZK4=;
 b=DEvn+OF9niDWDdTfCkXFqMki85UPWZNRpsUeIHlDSsd1csJo5dRxIOj//N9uPEMX9lXuTb
 5xi7HYOPB8hTnl8YjohdQNlxVBDXcwE+eLKfvquqBToPlIi17Gjn5p/HYgDRFM21/fpbaW
 x5y+KD0VqCWxtoX14uEQDejF9X8EkLQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1690225052;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Dn4RRPm6JQxmeubGRohwnTCwA6DMt18SI5jdD/soZK4=;
 b=L17MAO5mOgHscCYBLAgOR4tKOpasBJ6oWGj1Ux5qWK61p2PZni8twdg9n9TlYoIt3r5D7f
 rPwAyjgFo93u18Cg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A81B813476;
 Mon, 24 Jul 2023 18:57:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id A1IEKJzJvmQ1ZgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 24 Jul 2023 18:57:32 +0000
Message-ID: <4f5d262c-527f-0fa6-45e3-a75aa22fcf0d@suse.de>
Date: Mon, 24 Jul 2023 20:57:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] drm/mgag200: Increase bandwidth for G200se A rev1
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Jocelyn Falempe <jfalempe@redhat.com>, airlied@redhat.com, daniel@ffwll.ch
References: <20230717133037.25941-1-jfalempe@redhat.com>
 <69a9ee2e-bd03-2a63-6651-0680475d7025@suse.de>
In-Reply-To: <69a9ee2e-bd03-2a63-6651-0680475d7025@suse.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------JU0zVZlXKWrEpiStdL9Rs0rq"
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
Cc: Roger Sewell <roger.sewell@cantab.net>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------JU0zVZlXKWrEpiStdL9Rs0rq
Content-Type: multipart/mixed; boundary="------------V0p0M0uMb6SsnRGqVtokkTR7";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Jocelyn Falempe <jfalempe@redhat.com>, airlied@redhat.com, daniel@ffwll.ch
Cc: Roger Sewell <roger.sewell@cantab.net>, dri-devel@lists.freedesktop.org
Message-ID: <4f5d262c-527f-0fa6-45e3-a75aa22fcf0d@suse.de>
Subject: Re: [PATCH] drm/mgag200: Increase bandwidth for G200se A rev1
References: <20230717133037.25941-1-jfalempe@redhat.com>
 <69a9ee2e-bd03-2a63-6651-0680475d7025@suse.de>
In-Reply-To: <69a9ee2e-bd03-2a63-6651-0680475d7025@suse.de>

--------------V0p0M0uMb6SsnRGqVtokkTR7
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQoNCkFtIDI0LjA3LjIzIHVtIDIwOjQ4IHNjaHJpZWIgVGhvbWFzIFppbW1lcm1hbm46DQo+
IEhpIEpvY2VseW4NCj4gDQo+IEFtIDE3LjA3LjIzIHVtIDE1OjI5IHNjaHJpZWIgSm9jZWx5
biBGYWxlbXBlOg0KPj4gQSBHMjAwU0VfQSByZXYgMSB1c2VyIHJlcG9ydGVkIHRoYXQgcHJp
b3IgdG8gdjYuMCwgaGUgd2FzIGFibGUgdG8gZ2V0IA0KPj4gWG9yZw0KPj4gd29ya2luZyBh
dCAxNDQweDkwMEA2MEh6LiBUaGlzIHNvbWVob3cgYnlwYXNzZWQgdGhlIGJhbmR3aWR0aCB0
ZXN0IGluIHRoZQ0KPj4gZHJpdmVyLiBBZnRlciB2Ni4wLCBhbmQgdGhlIGRyaXZlciByZWZh
Y3RvciwgaXQncyBubyBsb25nZXIgcG9zc2libGUuDQo+IA0KPiBJIHRvb2sgdGhhdCBiYW5k
d2lkdGggbnVtYmVyIGZyb20gdGhlIG9sZCBzb3VyY2UgY29kZSBhdA0KPiANCj4gDQo+IGh0
dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L3Y1LjE5L3NvdXJjZS9kcml2ZXJzL2dw
dS9kcm0vbWdhZzIwMC9tZ2FnMjAwX21vZGUuYyNMNzI1DQo+IA0KPiAgRnJvbSB0aGlzIGNv
ZGUsIEkgZG9uJ3Qgc2VlIGhvdyBpdCBza2lwcGVkIHRoaXMgdGVzdC4gTWF5YmUgdGhlIA0K
PiByZWZhY3RvcmluZyBpcyBpbmNvcnJlY3QuDQoNClRoZXJlJ3MgYSBkaWZmZXJlbmNlIHRo
YXQgbWlnaHQgYmUgd29ydGggaW52ZXN0aWdhdGluZzogaWYgdGhlIHVuaXF1ZSANCnJldiBl
cXVhbHMgMHgwMCwgdGhlIGN1cnJlbnQgY29kZSB3aWxsIHVzZSB0aGUgc2V0dGluZ3MgZm9y
IHJldiAxLg0KDQogDQpodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC92Ni40L3Nv
dXJjZS9kcml2ZXJzL2dwdS9kcm0vbWdhZzIwMC9tZ2FnMjAwX2cyMDBzZS5jI0w1MTQNCg0K
Q29tcGFyZSB0aGlzIHRvIHRoZSBvbGQgY29kZSwgd2hpY2ggd291bGQgaGF2ZSB0YWtlbiB0
aGUgc2V0dGluZ3MgZm9yIA0KcmV2IDMgYW5kIGxhdGVyOg0KDQpodHRwczovL2VsaXhpci5i
b290bGluLmNvbS9saW51eC92NS4xOS9zb3VyY2UvZHJpdmVycy9ncHUvZHJtL21nYWcyMDAv
bWdhZzIwMF9tb2RlLmMjTDcxOQ0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQo+IA0KPiBE
byB5b3UgaGF2ZSB0aGUgb3Bwb3J0dW5pdHkgdG8gZnVydGhlciBkZWJ1ZyB0aGlzIGlzc3Vl
IG9uIHRoZSB1c2VycyANCj4gbWFjaGluZT/CoCBJJ2QgYmUgaW50ZXJlc3RlZCBpbiB0aGUg
ZXhhY3QgbW9kZWwgYW5kIHRoZSB1bmlxdWVfcmV2X2lkIA0KPiAoeW91IHNhaWQgQSwgcmV2
MSA/KSBhbmQgaWYgdGhlIGVhcmx5LW91dCBicmFuY2hlcyBpbiANCj4gbWdhX3ZnYV9jYWxj
dWxhdGVfbW9kZV9iYW5kd2lkdGgoKSBhcmUgYmVpbmcgdGFrZW4uIENhbiB5b3UgZmlndXJl
IG91dCANCj4gaG93IGV4YWN0bHkgdGhlIENQVSBtb3ZlcyB0aHJvdWdoIG1nYV92Z2FfbW9k
ZV92YWxpZCgpLg0KPiANCj4gQmVzdCByZWdhcmRzDQo+IFRob21hcw0KPiANCj4+IFNvIGlu
Y3JlYXNlIHRoZSBiYW5kd2lkdGgsIGFzIHRoZSBoYXJkd2FyZSBpcyBhYmxlIHRvIGRvIGl0
Lg0KPj4NCj4+IEluIG1nYWcyMDBfY2FsY3VsYXRlX21vZGVfYmFuZHdpZHRoKCksIHRoZSBi
YW5kd2lkdGggZm9yIDE0NDB4OTAwQDYwIGlzDQo+PiAzMDMxODAxOSwgd2hpbGUgMjQ0MDAg
KiAxMDI0ID0gMjQ5ODU2MDAgYW5kIDMwMTAwICogMTAyNCA9IDMwODIyNDAwLg0KPj4gUmFp
c2luZyB0aGUgYmFuZHdpZHRoIGZyb20gMjQ0MDAgdG8gMzAxMDAgaXMgZW5vdWdoIHRvIGFs
bG93IHRoaXMgbW9kZS4NCj4+DQo+PiBSZXBvcnRlZC1ieTogUm9nZXIgU2V3ZWxsIDxyb2dl
ci5zZXdlbGxAY2FudGFiLm5ldD4NCj4+IFRlc3RlZC1ieTogUm9nZXIgU2V3ZWxsIDxyb2dl
ci5zZXdlbGxAY2FudGFiLm5ldD4NCj4+IFNpZ25lZC1vZmYtYnk6IEpvY2VseW4gRmFsZW1w
ZSA8amZhbGVtcGVAcmVkaGF0LmNvbT4NCj4+IC0tLQ0KPj4gwqAgZHJpdmVycy9ncHUvZHJt
L21nYWcyMDAvbWdhZzIwMF9nMjAwc2UuYyB8IDIgKy0NCj4+IMKgIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vbWdhZzIwMC9tZ2FnMjAwX2cyMDBzZS5jIA0KPj4gYi9kcml2ZXJz
L2dwdS9kcm0vbWdhZzIwMC9tZ2FnMjAwX2cyMDBzZS5jDQo+PiBpbmRleCBiZDZlNTczYzlh
MWEuLjNiNDllMzA5MzFlMSAxMDA2NDQNCj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZ2Fn
MjAwL21nYWcyMDBfZzIwMHNlLmMNCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZ2FnMjAw
L21nYWcyMDBfZzIwMHNlLmMNCj4+IEBAIC00MzcsNyArNDM3LDcgQEAgc3RhdGljIGludCBt
Z2FnMjAwX2cyMDBzZV9waXBlbGluZV9pbml0KHN0cnVjdCANCj4+IG1nYV9kZXZpY2UgKm1k
ZXYpDQo+PiDCoMKgICovDQo+PiDCoCBzdGF0aWMgY29uc3Qgc3RydWN0IG1nYWcyMDBfZGV2
aWNlX2luZm8gDQo+PiBtZ2FnMjAwX2cyMDBzZV9hXzAxX2RldmljZV9pbmZvID0NCj4+IC3C
oMKgwqAgTUdBRzIwMF9ERVZJQ0VfSU5GT19JTklUKDE2MDAsIDEyMDAsIDI0NDAwLCBmYWxz
ZSwgMCwgMSwgdHJ1ZSk7DQo+PiArwqDCoMKgIE1HQUcyMDBfREVWSUNFX0lORk9fSU5JVCgx
NjAwLCAxMjAwLCAzMDEwMCwgZmFsc2UsIDAsIDEsIHRydWUpOw0KPj4gwqAgc3RhdGljIGNv
bnN0IHN0cnVjdCBtZ2FnMjAwX2RldmljZV9pbmZvIA0KPj4gbWdhZzIwMF9nMjAwc2VfYV8w
Ml9kZXZpY2VfaW5mbyA9DQo+PiDCoMKgwqDCoMKgIE1HQUcyMDBfREVWSUNFX0lORk9fSU5J
VCgxOTIwLCAxMjAwLCAzMDEwMCwgZmFsc2UsIDAsIDEsIHRydWUpOw0KPj4NCj4+IGJhc2Ut
Y29tbWl0OiBjMjI2OGRhYTY1ZmI0MTVjZmQ0NjMwMTZhZDU0YzIwYWZlZjhmNzVlDQo+IA0K
DQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpT
VVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCkZyYW5rZW5zdHJhc3NlIDE0
NiwgOTA0NjEgTnVlcm5iZXJnLCBHZXJtYW55DQpHRjogSXZvIFRvdGV2LCBBbmRyZXcgTXll
cnMsIEFuZHJldyBNY0RvbmFsZCwgQm91ZGllbiBNb2VybWFuDQpIUkIgMzY4MDkgKEFHIE51
ZXJuYmVyZykNCg==

--------------V0p0M0uMb6SsnRGqVtokkTR7--

--------------JU0zVZlXKWrEpiStdL9Rs0rq
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmS+yZsFAwAAAAAACgkQlh/E3EQov+B4
mRAAgn1pUPNFaSoFtCXHvwNi3q+UGI4Ypswo0fw67iHzepZy5HK0owImB6YS0mUbXw2V9Q4Lp2B/
EmGLJbb0AmpgrbnEXZ9jqf6Rj8v3W2cmZsnvS/sxu9j9v2Hy5hWggqKd+EPGFGr0WWXZYvdRwyDu
OMZCJkDI7qBbh2P5hOydGlhyJ8fVyaYFNBlmQkY8DSkjj6PiFjTGUyxXqE+/Un+92h8vdb1O7+XR
lPxWCGlrlcFyezYqXkkESqr8fQYW2IFxKevum7tbxUNCvz9tjBvA1qBQb5Fx9/FI4q6QyxMxYY7e
DgA5xwJ/pp5llQgKe/DPJZKm9G/AJzB79nMJh4wyshS9bI2V/3zAuuREB/VYLt5FdovZ4xkhQ2EA
+4UMbT9+HVjQBgOuEaoj24pDgBV5xqjgndt/eDDx7LDYpsil+rYyskTIyDoHnXuS4IAC3WF0BZbx
YPHXDe0NcffiYkJyz6X5e+T9rpN6ov6BLPF9Jts7xi279Rw0wB7JGDWqOU8j5bhpYamlj5+RBmL3
tT9wc+GOAdPpuIXqXHx1J6ErABgq1REvGahJZDtH3rTu4DQsmGoKe0SLGkSayLKu/o6exc5RawHp
tRy+gUrqt3BE8ybexHeNIG48yNrfKwIJbhx59rdfvzgzOIy1nLjmWxgIrqAYkNkvmGzvTYAcvbtp
z5g=
=dAh9
-----END PGP SIGNATURE-----

--------------JU0zVZlXKWrEpiStdL9Rs0rq--
