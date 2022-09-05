Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E6C65AD0DE
	for <lists+dri-devel@lfdr.de>; Mon,  5 Sep 2022 12:58:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B35A10E2E8;
	Mon,  5 Sep 2022 10:58:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C10A10E2E6
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Sep 2022 10:58:00 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 5D3005F7F3;
 Mon,  5 Sep 2022 10:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1662375479; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2H00c0/BXWo+WWiT/xWuj//ItLop5u+QtC70MjUaVLw=;
 b=vp4NkvRVNaoqAxpTTqrGyvn4ycNyy6VCOu3PWpshLSgJVYO8Dgpq2iYYABBQDd1+CUVNj8
 6PdvvwSsliaSaXL9moLuw1r5+g6J2EbQfnWRF8DK8xB+TsuDJdI4EjC+Tx1bdRGmwJWY9K
 llkIwTsLXlJT78+gUdjUkHJFbsI/+P4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1662375479;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2H00c0/BXWo+WWiT/xWuj//ItLop5u+QtC70MjUaVLw=;
 b=Gahc9kcUdi0xAqJ6Uk0w8zlIZssdta0zvr1MLLlzAHnI9W5qkAKT2qA0v8t7S6qzDbt3Z9
 oxFzt/w9KvS0zZDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 42FCE139C7;
 Mon,  5 Sep 2022 10:57:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id uHaIDzfWFWM5VQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 05 Sep 2022 10:57:59 +0000
Message-ID: <43e3dead-6089-c342-5050-34d7325bcb24@suse.de>
Date: Mon, 5 Sep 2022 12:57:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH] drm/simpledrm: Drop superfluous primary plane
 .atomic_check return logic
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org
References: <20220831111243.1530620-1-javierm@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220831111243.1530620-1-javierm@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------eH0JlHo9LqVVTwAfaxMgH0hW"
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------eH0JlHo9LqVVTwAfaxMgH0hW
Content-Type: multipart/mixed; boundary="------------yZ9kezxGfEZhlpsxCe0SkGlO";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org
Cc: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org
Message-ID: <43e3dead-6089-c342-5050-34d7325bcb24@suse.de>
Subject: Re: [PATCH] drm/simpledrm: Drop superfluous primary plane
 .atomic_check return logic
References: <20220831111243.1530620-1-javierm@redhat.com>
In-Reply-To: <20220831111243.1530620-1-javierm@redhat.com>

--------------yZ9kezxGfEZhlpsxCe0SkGlO
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgSmF2aWVyDQoNCkFtIDMxLjA4LjIyIHVtIDEzOjEyIHNjaHJpZWIgSmF2aWVyIE1hcnRp
bmV6IENhbmlsbGFzOg0KPiBUaGUgc2ltcGxlZHJtX3ByaW1hcnlfcGxhbmVfaGVscGVyX2F0
b21pY19jaGVjaygpIGZ1bmN0aW9uIGlzIG1vcmUgY29tcGxleA0KPiB0aGFuIG5lZWRlZC4g
SXQgZmlyc3QgY2hlY2tzIGRybV9hdG9taWNfaGVscGVyX2NoZWNrX3BsYW5lX3N0YXRlKCkg
cmV0dXJucw0KPiB2YWx1ZSB0byBkZWNpZGUgd2hldGhlciB0byByZXR1cm4gdGhpcyBvciB6
ZXJvLg0KPiANCj4gQnV0IGl0IGNvdWxkIGp1c3QgcmV0dXJuIHRoYXQgZnVuY3Rpb24gcmV0
dXJuIHZhbHVlIGRpcmVjdGx5LiBJdCBhbHNvIGRvZXMNCj4gYSBjaGVjayBpZiBuZXdfcGxh
bmVfc3RhdGUtPnZpc2libGUgaXNuJ3Qgc2V0LCBidXQgcmV0dXJucyB6ZXJvIHJlZ2FyZGxl
c3MuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBKYXZpZXIgTWFydGluZXogQ2FuaWxsYXMgPGph
dmllcm1AcmVkaGF0LmNvbT4NCj4gLS0tDQo+IA0KPiAgIGRyaXZlcnMvZ3B1L2RybS90aW55
L3NpbXBsZWRybS5jIHwgMTUgKysrKy0tLS0tLS0tLS0tDQo+ICAgMSBmaWxlIGNoYW5nZWQs
IDQgaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL3Rpbnkvc2ltcGxlZHJtLmMgYi9kcml2ZXJzL2dwdS9kcm0vdGlu
eS9zaW1wbGVkcm0uYw0KPiBpbmRleCBhODFmOTE4MTQ1OTUuLjBiZTQ3ZjQwMjQ3YSAxMDA2
NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3Rpbnkvc2ltcGxlZHJtLmMNCj4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL3Rpbnkvc2ltcGxlZHJtLmMNCj4gQEAgLTQ4NSwyMSArNDg1LDE0
IEBAIHN0YXRpYyBpbnQgc2ltcGxlZHJtX3ByaW1hcnlfcGxhbmVfaGVscGVyX2F0b21pY19j
aGVjayhzdHJ1Y3QgZHJtX3BsYW5lICpwbGFuZSwNCj4gICAJc3RydWN0IGRybV9wbGFuZV9z
dGF0ZSAqbmV3X3BsYW5lX3N0YXRlID0gZHJtX2F0b21pY19nZXRfbmV3X3BsYW5lX3N0YXRl
KG5ld19zdGF0ZSwgcGxhbmUpOw0KPiAgIAlzdHJ1Y3QgZHJtX2NydGMgKm5ld19jcnRjID0g
bmV3X3BsYW5lX3N0YXRlLT5jcnRjOw0KPiAgIAlzdHJ1Y3QgZHJtX2NydGNfc3RhdGUgKm5l
d19jcnRjX3N0YXRlID0gTlVMTDsNCj4gLQlpbnQgcmV0Ow0KPiAgIA0KPiAgIAlpZiAobmV3
X2NydGMpDQo+ICAgCQluZXdfY3J0Y19zdGF0ZSA9IGRybV9hdG9taWNfZ2V0X25ld19jcnRj
X3N0YXRlKG5ld19zdGF0ZSwgbmV3X2NydGMpOw0KPiAgIA0KPiAtCXJldCA9IGRybV9hdG9t
aWNfaGVscGVyX2NoZWNrX3BsYW5lX3N0YXRlKG5ld19wbGFuZV9zdGF0ZSwgbmV3X2NydGNf
c3RhdGUsDQo+IC0JCQkJCQkgIERSTV9QTEFORV9OT19TQ0FMSU5HLA0KPiAtCQkJCQkJICBE
Uk1fUExBTkVfTk9fU0NBTElORywNCj4gLQkJCQkJCSAgZmFsc2UsIGZhbHNlKTsNCj4gLQlp
ZiAocmV0KQ0KPiAtCQlyZXR1cm4gcmV0Ow0KPiAtCWVsc2UgaWYgKCFuZXdfcGxhbmVfc3Rh
dGUtPnZpc2libGUpDQo+IC0JCXJldHVybiAwOw0KPiAtDQo+IC0JcmV0dXJuIDA7DQo+ICsJ
cmV0dXJuIGRybV9hdG9taWNfaGVscGVyX2NoZWNrX3BsYW5lX3N0YXRlKG5ld19wbGFuZV9z
dGF0ZSwgbmV3X2NydGNfc3RhdGUsDQo+ICsJCQkJCQkgICBEUk1fUExBTkVfTk9fU0NBTElO
RywNCj4gKwkJCQkJCSAgIERSTV9QTEFORV9OT19TQ0FMSU5HLA0KPiArCQkJCQkJICAgZmFs
c2UsIGZhbHNlKTsNCg0KSSdtIHVuZGVjaWRlZCBvbiB0aGlzIGNoYW5nZS4gSSBrbm93IGl0
J3MgY29ycmVjdCBhbmQgbW9yZSB0byB0aGUgcG9pbnQuIA0KQnV0IHRoZSBjYWxsJ3MgbG9n
aWMgaXMgbm9uLWludHVpdGl2ZTogdGhlIGNhbGwgZWl0aGVyIHJldHVybnMgYW4gZXJyb3Ig
DQpvciB3ZSBoYXZlIHRvIHRlc3QgLT52aXNpYmxlIGFmdGVyd2FyZHMuIFNvIEkgd3JvdGUg
aXQgZXhwbGljaXRseS4NCg0KSSBzYXcgdGhhdCB5b3VyIGNoYW5nZSB0byBzc2QxMzB4IGFs
c28gdXNlcyB0aGUgcGF0dGVybi4gSWYgd2UgZmluZCBtb3JlIA0Kc3VjaCBkcml2ZXJzLCB3
ZSBjb3VsZCBpbXBsZW1lbnQgdGhlIGF0b21pYyBjaGVjayBhcyBhIGhlbHBlci4gSSBzdWdn
ZXN0IA0KZHJtX3BsYW5lX2hlbHBlcl9hdG9taWNfY2hlY2tfZml4ZWQoKSBpbiBkcm1fcGxh
bmVfaGVscGVyLmMNCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KPiAgIH0NCj4gICANCj4g
ICBzdGF0aWMgdm9pZCBzaW1wbGVkcm1fcHJpbWFyeV9wbGFuZV9oZWxwZXJfYXRvbWljX3Vw
ZGF0ZShzdHJ1Y3QgZHJtX3BsYW5lICpwbGFuZSwNCg0KLS0gDQpUaG9tYXMgWmltbWVybWFu
bg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMg
R2VybWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkN
CihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90
ZXYNCg==

--------------yZ9kezxGfEZhlpsxCe0SkGlO--

--------------eH0JlHo9LqVVTwAfaxMgH0hW
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmMV1jYFAwAAAAAACgkQlh/E3EQov+Ad
yA//WNTxjCFksNK0MN68U6VkpWnZD/mFgLYhCrga1PqE6p8sc0pSL12ll4SO5im51Ym/pCrWhN8J
D6hhWnFmuV717A/jDgb0G6Hqfqj8I/jAHTWvjr2ZjuhGzfjt1EybdEv2FRLoUMCaA9gZGOI5U94p
n31dDxSBmxRzbc8Rf3Alevl/dRdzRy8SBs7hQMKiAuUq82SHhG+cCKIT+9HipZyVpABnQM1BualE
pyQyXeXLvUDpYufwuER0sxaVAhNK0MAU1wClMsdFJILfQsT83fFCKbEuTu46ylJZ1XZSUcpVkDZm
Rw2yi9N8ut+GKSwBE2jrGW7NQ0H1NbgTEFIMC5av6yoUL+Knvda+PyqdwUOryd3vhGFm70ZnwZZp
ASbPUJFaluaYEWg4x0dZ4RuTrU0G6W3wVOjr+MrCqR5BrZeFfK22OAXqLXJqLYi63D/s7F7jYSrk
kCiTXeZcCltGeLDZ3qAnQkg/Sh7AnNf0Cw8Q2dC+bmSWJs8BSgK3V9gzDmKxZqX6aabQnL5X9Ru7
9TV4HedxKUpfO6nNRcekIkIiRvj2l94cT/HwAF9kIaH2yr1LJf/KnJPFfdchKSoEgz6pftRt5P4O
I5vK568hhckA+MsI0pO8nsWXGQxZlwIRPq5yj+y9KEad342cTtkydHFhFYwfdJN26fFzQgmFI3sH
1k4=
=1QSj
-----END PGP SIGNATURE-----

--------------eH0JlHo9LqVVTwAfaxMgH0hW--
