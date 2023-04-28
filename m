Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D0E026F1684
	for <lists+dri-devel@lfdr.de>; Fri, 28 Apr 2023 13:25:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0427C10ECE7;
	Fri, 28 Apr 2023 11:25:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D71F910ECE8
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Apr 2023 11:25:36 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 1476520065;
 Fri, 28 Apr 2023 11:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1682681135; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BEN9REyCBqZHieYcmzMVHdo7PZZ14yso6XVayqOiqeI=;
 b=uhfdCIH1dXH/+v0PUPgHFfgb9RD4/IxO8A3NGDHJ7o9nID5rmpl7UIar1RvcWW/CI/V/82
 rXJIcf6ewXhplttqGulAp44ByIdhYk3I35NKnrhrVAfLKtTumVYtDE2QHjuTPT32X1gEQE
 LJ/MR28kBhPcczSV95vltiEoz2ueKDo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1682681135;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BEN9REyCBqZHieYcmzMVHdo7PZZ14yso6XVayqOiqeI=;
 b=FqY44D3XTkRdo0PWPE8Q62tOho7YBMd8NfKwMQGAO+hitKnERnW9UrPEsNCO9A0i14khbU
 e8J43bZKe9HD4vAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D0E92138FA;
 Fri, 28 Apr 2023 11:25:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id nQQBMi6tS2TuVwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 28 Apr 2023 11:25:34 +0000
Message-ID: <44b5d355-f565-527e-f63a-f06136dc25b4@suse.de>
Date: Fri, 28 Apr 2023 13:25:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 6/6] drm/fb-helper: Use fb_{cfb,sys}_{read, write}()
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <20230425142846.730-1-tzimmermann@suse.de>
 <20230425142846.730-7-tzimmermann@suse.de>
 <CAMuHMdWDRB8kyLb39rku2FJ3uKid__O=jmBXJ_85cct1zFkaYA@mail.gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <CAMuHMdWDRB8kyLb39rku2FJ3uKid__O=jmBXJ_85cct1zFkaYA@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------87IkghRKsdKRjZqWO75TGlDV"
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
Cc: linux-fbdev@vger.kernel.org, teddy.wang@siliconmotion.com, deller@gmx.de,
 javierm@redhat.com, dri-devel@lists.freedesktop.org,
 sudipm.mukherjee@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------87IkghRKsdKRjZqWO75TGlDV
Content-Type: multipart/mixed; boundary="------------bTUVJb9SBXD2CTMv0Fw0nv0b";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch, javierm@redhat.com, deller@gmx.de,
 sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Message-ID: <44b5d355-f565-527e-f63a-f06136dc25b4@suse.de>
Subject: Re: [PATCH 6/6] drm/fb-helper: Use fb_{cfb,sys}_{read, write}()
References: <20230425142846.730-1-tzimmermann@suse.de>
 <20230425142846.730-7-tzimmermann@suse.de>
 <CAMuHMdWDRB8kyLb39rku2FJ3uKid__O=jmBXJ_85cct1zFkaYA@mail.gmail.com>
In-Reply-To: <CAMuHMdWDRB8kyLb39rku2FJ3uKid__O=jmBXJ_85cct1zFkaYA@mail.gmail.com>

--------------bTUVJb9SBXD2CTMv0Fw0nv0b
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjYuMDQuMjMgdW0gMTc6MTUgc2NocmllYiBHZWVydCBVeXR0ZXJob2V2ZW46
DQo+IEhpIFRob21hcywNCj4gDQo+IE9uIFR1ZSwgQXByIDI1LCAyMDIzIGF0IDQ6MjjigK9Q
TSBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4gd3JvdGU6DQo+PiBJ
bXBsZW1lbnQgRFJNIGZiZGV2IGhlbHBlcnMgZm9yIHJlYWRpbmcgYW5kIHdyaXRpbmcgZnJh
bWVidWZmZXINCj4+IG1lbW9yeSB3aXRoIHRoZSByZXNwZWN0aXZlIGZiZGV2IGZ1bmN0aW9u
cy4gUmVtb3ZlcyBkdXBsaWNhdGUNCj4+IGNvZGUuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTog
VGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+DQo+IA0KPiBUaGFua3Mg
Zm9yIHlvdXIgcGF0Y2ghDQo+IA0KPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9mYl9o
ZWxwZXIuYw0KPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9mYl9oZWxwZXIuYw0KPiAN
Cj4+IEBAIC04MTYsMjEgKzcyNywxMCBAQCBzdGF0aWMgc3NpemVfdCBkcm1fZmJfaGVscGVy
X3JlYWRfc2NyZWVuX2J1ZmZlcihzdHJ1Y3QgZmJfaW5mbyAqaW5mbywgY2hhciBfX3VzZQ0K
Pj4gICBzc2l6ZV90IGRybV9mYl9oZWxwZXJfc3lzX3JlYWQoc3RydWN0IGZiX2luZm8gKmlu
Zm8sIGNoYXIgX191c2VyICpidWYsDQo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHNpemVfdCBjb3VudCwgbG9mZl90ICpwcG9zKQ0KPj4gICB7DQo+PiAtICAgICAgIHJl
dHVybiBfX2RybV9mYl9oZWxwZXJfcmVhZChpbmZvLCBidWYsIGNvdW50LCBwcG9zLCBkcm1f
ZmJfaGVscGVyX3JlYWRfc2NyZWVuX2J1ZmZlcik7DQo+PiArICAgICAgIHJldHVybiBmYl9z
eXNfcmVhZChpbmZvLCBidWYsIGNvdW50LCBwcG9zKTsNCj4+ICAgfQ0KPj4gICBFWFBPUlRf
U1lNQk9MKGRybV9mYl9oZWxwZXJfc3lzX3JlYWQpOw0KPiANCj4gSSBndWVzcyBkcm1fZmJf
aGVscGVyX3N5c19yZWFkKCkgY2FuIGp1c3QgYmUgcmVtb3ZlZD8NCg0KWWVzLCBzb29uLg0K
DQo+IA0KPj4gQEAgLTg0OSw3ICs3NDksNyBAQCBzc2l6ZV90IGRybV9mYl9oZWxwZXJfc3lz
X3dyaXRlKHN0cnVjdCBmYl9pbmZvICppbmZvLCBjb25zdCBjaGFyIF9fdXNlciAqYnVmLA0K
Pj4gICAgICAgICAgc3NpemVfdCByZXQ7DQo+PiAgICAgICAgICBzdHJ1Y3QgZHJtX3JlY3Qg
ZGFtYWdlX2FyZWE7DQo+Pg0KPj4gLSAgICAgICByZXQgPSBfX2RybV9mYl9oZWxwZXJfd3Jp
dGUoaW5mbywgYnVmLCBjb3VudCwgcHBvcywgZHJtX2ZiX2hlbHBlcl93cml0ZV9zY3JlZW5f
YnVmZmVyKTsNCj4+ICsgICAgICAgcmV0ID0gZmJfc3lzX3dyaXRlKGluZm8sIGJ1ZiwgY291
bnQsIHBwb3MpOw0KPj4gICAgICAgICAgaWYgKHJldCA8PSAwKQ0KPj4gICAgICAgICAgICAg
ICAgICByZXR1cm4gcmV0Ow0KPj4NCj4gDQo+IGRybV9mYl9oZWxwZXJfc3lzX3dyaXRlKCkg
Y2Fubm90IGJlIHJlbW92ZWQgeWV0LCBiZWNhdXNlIGl0IGRvZXMgZGFtYWdlDQo+IGhhbmRs
aW5nIGJlbG93LiAgSWYgdGhlIGZiX29wcy5mYl9zeW5jKCkgY2FsbGJhY2sgd291bGQgYmUg
ZW5oYW5jZWQgdG8gcGFzcw0KPiBhIHJlZ2lvbiwgZHJtX2ZiX2hlbHBlciBjb3VsZCBpbXBs
ZW1lbnQgLmZiX3N5bmMoKSBpbnN0ZWFkIG9mIC5mYl93cml0ZSgpLg0KDQpNb3N0IERSTSdz
IGZiZGV2IHN1cHBvcnQgY2FuIHNvb24gdXNlIHJlZ3VsYXIgZmJkZXYgaGVscGVycyBmcm9t
IHRoaXMgDQpwYXRjaHNldC4gT25seSBEUk0ncyBpOTE1IGFuZCB0aGUgZ2VuZXJpYyBmYmRl
diBuZWVkIGRhbWFnZSBoYW5kbGluZy4gDQpCdXQgdGhleSBhcmUgYm90aCBzcGVjaWFsIGlu
IHRoZWlyIG93biB3YXksIHNvIGVhY2ggd2lsbCBnZXQgaXRzIG93biANCmltcGxlbWVudGF0
aW9uLiBJIGhhdmUgcHJvdG90eXBlIHBhdGNoZXMgdG8gbWFrZSB0aGlzIGhhcHBlbi4NCg0K
QmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KPiANCj4gTGlrZXdpc2UgZm9yIHRoZSAiY2ZiIiAo
d2hpY2ggaXMgYSBtaXNub21lcikgdmFyaWFudHMgYmVsb3cuDQo+IA0KPiBHcntvZXRqZSxl
ZXRpbmd9cywNCj4gDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICBHZWVydA0KPiANCg0K
LS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VT
RSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpGcmFua2Vuc3RyYXNzZSAxNDYs
IDkwNDYxIE51ZXJuYmVyZywgR2VybWFueQ0KR0Y6IEl2byBUb3RldiwgQW5kcmV3IE15ZXJz
LCBBbmRyZXcgTWNEb25hbGQsIEJvdWRpZW4gTW9lcm1hbg0KSFJCIDM2ODA5IChBRyBOdWVy
bmJlcmcpDQo=

--------------bTUVJb9SBXD2CTMv0Fw0nv0b--

--------------87IkghRKsdKRjZqWO75TGlDV
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmRLrS4FAwAAAAAACgkQlh/E3EQov+Cx
Pg//f1WikGc/qCQ2WGkHxtJDJitZb0JXX0Iw9ekoUdunMADXHB70EwG+jrsz9Lfrh2YPB9MGCqG9
jD66pt988Bn0uQPeCr9A/pSTPzuSnbNFuHwtiEW3PuFtYqS1K8sZ/iBPy/gddShbjIZyZikKJ2No
5LDcg+tuzaLzc484jraQ9/IHf/rl9SiXvnl1AvQkH0BGL8e9g6Pp7q9x1PfIFPrMSXFNpV+T85cf
9g19m1zH3vio9v4iSCzSYX8WcUaOChd4cbzjHs1nkRilRWqEp6BpNptIs84q+dREhnmeG3y7Yc71
KTwCYfD/ROUFKOyVe1JbQJBKn6bSGGS1jHxh9F2O5NeFxgGk0iVdugFZI7JAnxPXnNEi3dGzhCb1
fOTzV1HWmPMEC0Dj+Xk7Pd9f0/aQbpvSrsf2kktPkZJj2bSxD6ssfz3Ef1KNHs+jAOtAIm4NipXE
vh2RZTnhlFSXHormO9F0RAyaiqbYiPuHNv26cvcN2nxRSQ3mrm5A0QcjiueBp9BVfXOUL4wCoimI
j58dwXnz4/1S+hdAl67H0Xm2Azczkgl3dYLTpzEyvplZzyWT3SfWhBTUQoRJz1aVe8YNs3CQ7zVr
mqysAti92B45NnGGvcSMD39bO5UALmoC4DjA7e045KwCaVfadhoLjTKn4vQYywAS5orevm+mu4tv
Ies=
=IZU1
-----END PGP SIGNATURE-----

--------------87IkghRKsdKRjZqWO75TGlDV--
