Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3465954AAB8
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jun 2022 09:35:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 355E310FAFA;
	Tue, 14 Jun 2022 07:35:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2239A10FAFA
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jun 2022 07:35:52 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C65781F8D7;
 Tue, 14 Jun 2022 07:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1655192150; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1YIDMPDVy/fBIlVID+Pky251uKaN9RvyRtLqGEXHgIU=;
 b=c1CNl6D9mN4lfzRs5gCw3hNXw+2X7VnzoiEkVYsw5m8tmqmQ3ee3+58fJ+S6Mx3PHAu2vv
 MYCrl4r4dJEaHd2ow9iW9GTSesvSYfQH2OMw7BBO+nUl+gJAal0E+2tMo3jFsReRPJjHtp
 +PTAdxsF1vKdIzMDBViWBlr/mpwEwUA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1655192150;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1YIDMPDVy/fBIlVID+Pky251uKaN9RvyRtLqGEXHgIU=;
 b=MeQuJ8S3POS0CDQj8KLJ8sMppjivjVj1laxhCgK2Nnf94eh1bsxmfuknf1WCQS/FvQWb6p
 NFG6m1pAYzbQ/KAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A3C0D139EC;
 Tue, 14 Jun 2022 07:35:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id MTbvJlY6qGIYBgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 14 Jun 2022 07:35:50 +0000
Message-ID: <b28ff5fb-c6f3-0d3b-c177-14bfa1c98006@suse.de>
Date: Tue, 14 Jun 2022 09:35:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 00/19] drm/gma500: Unify most of the lvds code
Content-Language: en-US
To: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 dri-devel@lists.freedesktop.org
References: <20220613123436.15185-1-patrik.r.jakobsson@gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220613123436.15185-1-patrik.r.jakobsson@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------3MTWVVAZFd2WWECiRfzBSOWY"
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
Cc: daniel.vetter@ffwll.ch, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------3MTWVVAZFd2WWECiRfzBSOWY
Content-Type: multipart/mixed; boundary="------------BKjvZgr1KxEpaEoeYJ61EXsF";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 dri-devel@lists.freedesktop.org
Cc: daniel.vetter@ffwll.ch, sam@ravnborg.org
Message-ID: <b28ff5fb-c6f3-0d3b-c177-14bfa1c98006@suse.de>
Subject: Re: [PATCH 00/19] drm/gma500: Unify most of the lvds code
References: <20220613123436.15185-1-patrik.r.jakobsson@gmail.com>
In-Reply-To: <20220613123436.15185-1-patrik.r.jakobsson@gmail.com>

--------------BKjvZgr1KxEpaEoeYJ61EXsF
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgUGF0cmlrLA0KDQpJJ3ZlIHNlbmQgY29tbWVudHMgb24gYSBmZXcgcGF0Y2hlcy4gRm9y
IHRoZSBvdGhlciBwYXRjaGVzLCB5b3UgY2FuIGFkZA0KDQpBY2tlZC1ieTogVGhvbWFzIFpp
bW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+DQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFz
DQoNCkFtIDEzLjA2LjIyIHVtIDE0OjM0IHNjaHJpZWIgUGF0cmlrIEpha29ic3NvbjoNCj4g
TXVjaCBvZiB0aGUgbHZkcyBjb2RlIGZvciBQb3Vsc2JvLCBPYWt0cmFpbCBhbmQgQ2VkYXJ2
aWV3IGFyZSBhbG1vc3QNCj4gaWRlbnRpY2FsIHNvIHRoZXJlIGlzIG5vIG5lZWQgdG8ga2Vl
cCB0aHJlZSBjb3BpZXMgb2YgaXQuIFVuaWZ5IGFzIG11Y2gNCj4gYXMgcG9zc2libGUgaW50
byBvbmUgaW1wbGVtZW50YXRpb24uIFRoZXJlIGFyZSBzdGlsbCB0aGluZ3MgbGlrZSB0aGUN
Cj4gaW5pdCBjb2RlIHRoYXQgY2FuIGJlIHVuaWZpZWQgYnV0IHRoYXQgcmVxdWlyZXMgdW5p
Znlpbmcgb3RoZXIgcGFydHMgb2YNCj4gdGhlIGRyaXZlciBmaXJzdC4NCj4gDQo+IFBhdHJp
ayBKYWtvYnNzb24gKDE5KToNCj4gICAgZHJtL2dtYTUwMDogVW5pZnkgKl9sdmRzX2dldF9t
YXhfYmFja2xpZ2h0KCkNCj4gICAgZHJtL2dtYTUwMDogVW5pZnkgKl9sdmRzX3NldF9iYWNr
bGlnaHQoKQ0KPiAgICBkcm0vZ21hNTAwOiBVbmlmeSAqX2x2ZHNfc2V0X3Bvd2VyKCkNCj4g
ICAgZHJtL2dtYTUwMDogVW5pZnkgKl9sdmRzX21vZGVfdmFsaWQoKQ0KPiAgICBkcm0vZ21h
NTAwOiBVbmlmeSAqX2x2ZHNfZW5jb2Rlcl9kcG1zKCkNCj4gICAgZHJtL2dtYTUwMDogVW5p
ZnkgKl9pbnRlbF9sdmRzX3NhdmUoKQ0KPiAgICBkcm0vZ21hNTAwOiBVbmlmeSBzdHJ1Y3Qg
Kl9pbnRlbF9sdmRzX3ByaXYNCj4gICAgZHJtL2dtYTUwMDogVW5pZnkgKl9pbnRlbF9sdmRz
X3Jlc3RvcmUoKQ0KPiAgICBkcm0vZ21hNTAwOiBVbmlmeSAqX2ludGVsX2x2ZHNfbW9kZV9m
aXh1cCgpDQo+ICAgIGRybS9nbWE1MDA6IFVuaWZ5ICpfaW50ZWxfbHZkc19wcmVwYXJlKCkN
Cj4gICAgZHJtL2dtYTUwMDogVW5pZnkgKl9pbnRlbF9sdmRzX2NvbW1pdCgpDQo+ICAgIGRy
bS9nbWE1MDA6IFVuaWZ5ICpfaW50ZWxfbHZkc19tb2RlX3NldCgpDQo+ICAgIGRybS9nbWE1
MDA6IFVuaWZ5IHN0cnVjdCAqX2ludGVsX2x2ZHNfaGVscGVyX2Z1bmNzDQo+ICAgIGRybS9n
bWE1MDA6IFVuaWZ5ICpfaW50ZWxfbHZkc19nZXRfbW9kZXMoKQ0KPiAgICBkcm0vZ21hNTAw
OiBVbmlmeSBzdHJ1Y3QgKl9pbnRlbF9sdmRzX2Nvbm5lY3Rvcl9oZWxwZXJfZnVuY3MNCj4g
ICAgZHJtL2dtYTUwMDogVXNlIGkyY19idXMgaW4gZ21hX2VuY29kZXIgZm9yIFBTQg0KPiAg
ICBkcm0vZ21hNTAwOiBVbmlmeSAqX2ludGVsX2x2ZHNfZGVzdHJveSgpDQo+ICAgIGRybS9n
bWE1MDA6IFVuaWZ5ICpfaW50ZWxfbHZkc19zZXRfcHJvcGVydHkoKQ0KPiAgICBkcm0vZ21h
NTAwOiBVbmlmeSBzdHJ1Y3QgKl9pbnRlbF9sdmRzX2Nvbm5lY3Rvcl9mdW5jcw0KPiANCj4g
ICBkcml2ZXJzL2dwdS9kcm0vZ21hNTAwL01ha2VmaWxlICAgICAgICAgfCAgIDEgKw0KPiAg
IGRyaXZlcnMvZ3B1L2RybS9nbWE1MDAvY2R2X2ludGVsX2x2ZHMuYyB8IDM5MCArLS0tLS0t
LS0tLS0tLS0tLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vZ21hNTAwL2dtYV9sdmRzLmMgICAg
ICAgfCA0NjIgKysrKysrKysrKysrKysrKysrKysrDQo+ICAgZHJpdmVycy9ncHUvZHJtL2dt
YTUwMC9nbWFfbHZkcy5oICAgICAgIHwgIDM4ICsrDQo+ICAgZHJpdmVycy9ncHUvZHJtL2dt
YTUwMC9vYWt0cmFpbF9sdmRzLmMgIHwgMTEyICstLS0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2Ry
bS9nbWE1MDAvcHNiX2Rydi5oICAgICAgICB8ICAgMSAtDQo+ICAgZHJpdmVycy9ncHUvZHJt
L2dtYTUwMC9wc2JfaW50ZWxfZHJ2LmggIHwgICAyIC0NCj4gICBkcml2ZXJzL2dwdS9kcm0v
Z21hNTAwL3BzYl9pbnRlbF9sdmRzLmMgfCA1MDcgKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
DQo+ICAgOCBmaWxlcyBjaGFuZ2VkLCA1MzAgaW5zZXJ0aW9ucygrKSwgOTgzIGRlbGV0aW9u
cygtKQ0KPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vZ21hNTAwL2dt
YV9sdmRzLmMNCj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL2dtYTUw
MC9nbWFfbHZkcy5oDQo+IA0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBE
cml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgN
Ck1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0KKEhSQiAzNjgwOSwg
QUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rldg0K

--------------BKjvZgr1KxEpaEoeYJ61EXsF--

--------------3MTWVVAZFd2WWECiRfzBSOWY
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmKoOlYFAwAAAAAACgkQlh/E3EQov+AE
6BAAw7By/s0HwzRihGQDxjUHm/cHqtsluKgDnjPRv63NbQOEA1A7u9PjGa1Ok5BsAugy30jYyo6e
bYAYNCmb9u1iyr02UcgQM6xHD7e/ioRTATJvx7pVlOg6cC4InskANDmZxiH6kl6DaVMEkV0kIndX
VEwjehhSUmKUa159f6sBWDPjb5U8TwZYgcAhK5pDSdkAhK+4slrszORTwleZb5yj4rmpZPf3Hi3R
OvOzjLSRBDc4Qu/xA17l62pcC0sX2bYD9sHf/TIQgM+MFB7qrQ22RlkuJtHvZYJ7O003fnzXNXw8
2jR5FNvft+TxeFacPc6VsBbrAx3VkyRbSAv0O4X/giNNKK8IxZStqrN9yQiBdkTyQ12fQoAjpqEJ
5GGJk77Z/3WF5NUHKH2Eg4ahxd4sLHeEeRFucxZpmiItixiWnQCrAKJ2NXWxlZN3oDwEo//EvTPd
TL6zr6gP9eDqKmkBy9gPwERYSw4TtHXInFXNLX6CuqBy3vsowT/puXDfyUSR+vvHISZYKARlLveg
UGCamb4whP03ABDA+n20LMANBar/QSb/LME4O6zMLPi23p8Ak4CxWT4kc2QlbVZxn6qMhb+WagEt
XFk7skciU9rKdA7VchIEPxCKn4qjSeOLfSr2G2hTCHKdZ6VTWk85UuewPPDOF8QtffOkl8GrzajA
C+c=
=5USS
-----END PGP SIGNATURE-----

--------------3MTWVVAZFd2WWECiRfzBSOWY--
