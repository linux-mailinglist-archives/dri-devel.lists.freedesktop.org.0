Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E16449E1C4
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jan 2022 12:58:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E64810E444;
	Thu, 27 Jan 2022 11:58:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3B7910E444
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jan 2022 11:58:32 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 51B871F37F;
 Thu, 27 Jan 2022 11:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1643284711; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cFG5yLDYvub7lmC/nCBWVnHmeKWnY89dQQhDG/TIwCk=;
 b=BnnIt/7bOrxety65nNImFXpz0iXK1WLoBAfDwuwaAtwDMwq3F703C/Imro6RCde6MeTR4l
 pQ1ybXBN2D8fyLviidkSa1VXgWdTaBler9yeqzp1B9Rtw/UZUZCcheR7CI+lcCGZ+LKkT3
 dnFieq2k7+Fe8xul92gbAbtSftML+iQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1643284711;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cFG5yLDYvub7lmC/nCBWVnHmeKWnY89dQQhDG/TIwCk=;
 b=eQHEYQ9DPoxru0+pfd/Op3EouTeNlvjJtROGE8OWPB3+yAhh3e+d7CmE4mVtwlRTATGsd1
 ly0Sy0svFB6L4CDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 30EB113BEB;
 Thu, 27 Jan 2022 11:58:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id HTN4CueI8mGGcQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 27 Jan 2022 11:58:31 +0000
Message-ID: <b3c508df-53ee-7fcd-2cdb-297d603a5f96@suse.de>
Date: Thu, 27 Jan 2022 12:58:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] drm/fb-helper: Mark screen buffers in system memory with
 FB_VIRTFB
Content-Language: en-US
To: Daniel Vetter <daniel@ffwll.ch>
References: <20220127102621.30047-1-tzimmermann@suse.de>
 <YfKFP2DW/g6tXLQw@phenom.ffwll.local>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <YfKFP2DW/g6tXLQw@phenom.ffwll.local>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Rjg1v0UNqzHmif5Jb5w4JKkg"
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------Rjg1v0UNqzHmif5Jb5w4JKkg
Content-Type: multipart/mixed; boundary="------------Tnp5qOTl9pcvEQYiGsKcxYRI";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org
Message-ID: <b3c508df-53ee-7fcd-2cdb-297d603a5f96@suse.de>
Subject: Re: [PATCH] drm/fb-helper: Mark screen buffers in system memory with
 FB_VIRTFB
References: <20220127102621.30047-1-tzimmermann@suse.de>
 <YfKFP2DW/g6tXLQw@phenom.ffwll.local>
In-Reply-To: <YfKFP2DW/g6tXLQw@phenom.ffwll.local>

--------------Tnp5qOTl9pcvEQYiGsKcxYRI
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjcuMDEuMjIgdW0gMTI6NDIgc2NocmllYiBEYW5pZWwgVmV0dGVyOg0KPiBP
biBUaHUsIEphbiAyNywgMjAyMiBhdCAxMToyNjoyMUFNICswMTAwLCBUaG9tYXMgWmltbWVy
bWFubiB3cm90ZToNCj4+IE1hcmsgc2NyZWVuIGJ1ZmZlcnMgaW4gc3lzdGVtIG1lbW9yeSB3
aXRoIEZCX1ZJUlRGQi4gT3RoZXJ3aXNlLCB0aGUNCj4+IGJ1ZmZlcnMgYXJlIG1tYXAnZWQg
YXMgSS9PIG1lbW9yeSAoaS5lLiwgVk1fSU8pLiBGb3Igc2hhZG93IGJ1ZmZlcnMsDQo+PiBh
bHNvIHNldCB0aGUgRkJfUkVBRFNfRkFTVCBoaW50Lg0KPiANCj4gTWF5YmUgY2xhcmlmeSB0
aGF0IHRoaXMgb25seSBob2xkcyBmb3IgdGhlIGRlZmlvIGNhc2UsIGFuZCBzaW5jZSB3ZSBo
YXZlDQo+IG91ciBvd24gc2hhZG93IGNvcHkgZm9yIHRoYXQgYW55d2F5IGl0IHNob3VsZG4n
dCBtYXR0ZXIuIEknbSBhbHNvIG5vdCBzdXJlDQo+IGhvdyBtdWNoIHRoZSBtZW1jcHkgZ2Fp
bnMgdXMgY29tcGFyZWQgdG8ganVzdCByZWRyYXdpbmcgLi4uDQo+IA0KPiBXaGF0J3MgdGhl
IG1vdGl2YXRpb24gaGVyZSwgb3IganVzdCBzb21ldGhpbmcgeW91IHNwb3R0ZWQ/DQoNCkNv
cnJlY3RuZXNzIG1vc3RseS4gZmJkZXYncyBmYmRlZmlvIHRlc3RzIGZvciAodGhlIGFic2Vu
Y2Ugb2YpIHRoaXMgZmxhZyANCmFuZCBzZXRzIFZNX0lPIGFjY29yZGluZ2x5Lg0KDQpJdCdz
IGFjdHVhbGx5IGZvciB1c2Vyc3BhY2UuIE1heWJlIHVzZXJzcGFjZSB0ZXN0cyB0aGVzZSBm
bGFncyBhcyB3ZWxsIA0KYW5kIGNhbiBvcHRpbWl6ZSBtZW1jcHkgcGF0dGVybiBmb3IgZGlm
ZmVyZW50IHR5cGVzIG9mIGNhY2hpbmcuIEJ1dCBJIA0Kd291bGRuJ3QgZXhwZWN0IGl0IFRC
SC4NCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KPiAtRGFuaWVsDQo+IA0KPj4NCj4+IFNp
Z25lZC1vZmYtYnk6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPg0K
Pj4gLS0tDQo+PiAgIGRyaXZlcnMvZ3B1L2RybS9kcm1fZmJfaGVscGVyLmMgfCA5ICsrKysr
Ky0tLQ0KPj4gICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9u
cygtKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2ZiX2hlbHBl
ci5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9mYl9oZWxwZXIuYw0KPj4gaW5kZXggZWQ0M2I5
ODdkMzA2Li5mMTUxMjdhMzJmN2EgMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
ZHJtX2ZiX2hlbHBlci5jDQo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2ZiX2hlbHBl
ci5jDQo+PiBAQCAtMjM0Niw2ICsyMzQ2LDcgQEAgc3RhdGljIGludCBkcm1fZmJfaGVscGVy
X2dlbmVyaWNfcHJvYmUoc3RydWN0IGRybV9mYl9oZWxwZXIgKmZiX2hlbHBlciwNCj4+ICAg
CWZiaS0+ZmJvcHMgPSAmZHJtX2ZiZGV2X2ZiX29wczsNCj4+ICAgCWZiaS0+c2NyZWVuX3Np
emUgPSBzaXplcy0+c3VyZmFjZV9oZWlnaHQgKiBmYi0+cGl0Y2hlc1swXTsNCj4+ICAgCWZi
aS0+Zml4LnNtZW1fbGVuID0gZmJpLT5zY3JlZW5fc2l6ZTsNCj4+ICsJZmJpLT5mbGFncyA9
IEZCSU5GT19ERUZBVUxUOw0KPj4gICANCj4+ICAgCWRybV9mYl9oZWxwZXJfZmlsbF9pbmZv
KGZiaSwgZmJfaGVscGVyLCBzaXplcyk7DQo+PiAgIA0KPj4gQEAgLTIzNTMsMTkgKzIzNTQs
MjEgQEAgc3RhdGljIGludCBkcm1fZmJfaGVscGVyX2dlbmVyaWNfcHJvYmUoc3RydWN0IGRy
bV9mYl9oZWxwZXIgKmZiX2hlbHBlciwNCj4+ICAgCQlmYmktPnNjcmVlbl9idWZmZXIgPSB2
emFsbG9jKGZiaS0+c2NyZWVuX3NpemUpOw0KPj4gICAJCWlmICghZmJpLT5zY3JlZW5fYnVm
ZmVyKQ0KPj4gICAJCQlyZXR1cm4gLUVOT01FTTsNCj4+ICsJCWZiaS0+ZmxhZ3MgfD0gRkJJ
TkZPX1ZJUlRGQiB8IEZCSU5GT19SRUFEU19GQVNUOw0KPj4gICANCj4+ICAgCQlmYmktPmZi
ZGVmaW8gPSAmZHJtX2ZiZGV2X2RlZmlvOw0KPj4gLQ0KPj4gICAJCWZiX2RlZmVycmVkX2lv
X2luaXQoZmJpKTsNCj4+ICAgCX0gZWxzZSB7DQo+PiAgIAkJLyogYnVmZmVyIGlzIG1hcHBl
ZCBmb3IgSFcgZnJhbWVidWZmZXIgKi8NCj4+ICAgCQlyZXQgPSBkcm1fY2xpZW50X2J1ZmZl
cl92bWFwKGZiX2hlbHBlci0+YnVmZmVyLCAmbWFwKTsNCj4+ICAgCQlpZiAocmV0KQ0KPj4g
ICAJCQlyZXR1cm4gcmV0Ow0KPj4gLQkJaWYgKG1hcC5pc19pb21lbSkNCj4+ICsJCWlmICht
YXAuaXNfaW9tZW0pIHsNCj4+ICAgCQkJZmJpLT5zY3JlZW5fYmFzZSA9IG1hcC52YWRkcl9p
b21lbTsNCj4+IC0JCWVsc2UNCj4+ICsJCX0gZWxzZSB7DQo+PiAgIAkJCWZiaS0+c2NyZWVu
X2J1ZmZlciA9IG1hcC52YWRkcjsNCj4+ICsJCQlmYmktPmZsYWdzIHw9IEZCSU5GT19WSVJU
RkI7DQo+PiArCQl9DQo+PiAgIA0KPj4gICAJCS8qDQo+PiAgIAkJICogU2hhbWVsZXNzbHkg
bGVhayB0aGUgcGh5c2ljYWwgYWRkcmVzcyB0byB1c2VyLXNwYWNlLiBBcw0KPj4gLS0gDQo+
PiAyLjM0LjENCj4+DQo+IA0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBE
cml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgN
Ck1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0KKEhSQiAzNjgwOSwg
QUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rldg0K

--------------Tnp5qOTl9pcvEQYiGsKcxYRI--

--------------Rjg1v0UNqzHmif5Jb5w4JKkg
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmHyiOYFAwAAAAAACgkQlh/E3EQov+DP
oBAAjlVuG9G2KEbJARaL9jk3gzD6CBJfhsnRrMF1yq9akAAx2M20/W/hOsKRRxEwVD4kZ7f+P0+o
QfDZ2+q6Ti/Wr2CFhZ/Bx6QMXxOKGQFuZNLFy2Jy3kTAOtl1Ot7vuuYMYLv3/xPMQzJXaSa1KSyL
j4ISZx2zzWwkG/JuLoo6icRk5bw93sOlvG69I1kSFBDJHYNTzG72M+Tpd8U5/7plWPz2dovFyN/b
GDn2j8wZ7F9PxmCzIw6bm837sno1JPxcXel2RVA8qa9Luk2vjHMPI/ybj/xGlWWol+6Su5rs4/+i
3XCK+AuNw1ovP5CIlRoS9/oJeGJX24B0MO2icd/DuXLLmxhdUxOF5R9zKVuz1H5unUhY7U9WenGn
xjeiR9auTNB3tN9fA0WLgqX2Rx/4vOnt7K2ngkaPMv9VlILOCOAtpdNjN/v39A8+cWFdP/aZ0/oN
mjanuhbwT+rB5t7ZBz7mTFBIbOMeKyVp70xTpkvQ96wqg3uuiBv8/6ImPaspPfBUoYYttQvcPWfS
dWFpxsppFHEljkUO6iHtbaw1RJvQHGMTCBx2p5mEx94lRCq9HyTns96ZdiwZ/7hvWShikj9NWikb
B02Qr7WjGrfrWEyzKZX0k/YldjbqaMH7bAlCZ7l/W4Pb2yqSDSfwnLFl35OukwR9BYpATd8z9nK3
Rq4=
=6bT4
-----END PGP SIGNATURE-----

--------------Rjg1v0UNqzHmif5Jb5w4JKkg--
