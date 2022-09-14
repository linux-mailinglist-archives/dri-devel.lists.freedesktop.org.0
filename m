Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A1BE45B828A
	for <lists+dri-devel@lfdr.de>; Wed, 14 Sep 2022 09:59:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B552410E8AE;
	Wed, 14 Sep 2022 07:59:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D91110E8AE
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Sep 2022 07:59:41 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 1837E337AA;
 Wed, 14 Sep 2022 07:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1663142380; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ht8IAwVL6I82vld4KtNjAdRP3Pp9p14iMQBWZz4BIxg=;
 b=EIk6KIV+Q0FsuNJMInzPyfQRRJhwWI+4GBPSnTOupdK5jpo6JBm5wY3oLJ6bBOmFw7gPL1
 xcH36bb+o4lBdPgwmmWV7tPsdNzrk8N1XyjQdmqd1Ov/+f+p2pBJxU0wsKS6r9TVvQcCyI
 XfacRA+pQzxO7P06HRkLWFfP1OS2CCI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1663142380;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ht8IAwVL6I82vld4KtNjAdRP3Pp9p14iMQBWZz4BIxg=;
 b=Jp8IkfYAu0U00toHqPQ69STNRaqKS22yfEqRJLX0LcIA7UkxjFslsxwDGUBUREj/f642FM
 JNBVHVNBT0q1i4AA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 080AC134B3;
 Wed, 14 Sep 2022 07:59:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id y/8nAeyJIWNFegAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 14 Sep 2022 07:59:40 +0000
Message-ID: <86e3a684-7a50-ed05-a89d-eeef154b2e67@suse.de>
Date: Wed, 14 Sep 2022 09:59:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: mgag200 broken on kernel-6.0-rc3 on DELL/T620
To: Wang Yugui <wangyugui@e16-tech.com>
References: <20220913222506.6C72.409509F4@e16-tech.com>
 <613ca1d0-8680-9f45-9317-d6b316f307ce@suse.de>
 <20220913231522.7CAA.409509F4@e16-tech.com>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220913231522.7CAA.409509F4@e16-tech.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------x5CDKk7qDTw2FXjPxX7vEXz3"
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------x5CDKk7qDTw2FXjPxX7vEXz3
Content-Type: multipart/mixed; boundary="------------YApalSggpA4lreOapmaJg3fE";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Wang Yugui <wangyugui@e16-tech.com>
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Message-ID: <86e3a684-7a50-ed05-a89d-eeef154b2e67@suse.de>
Subject: Re: mgag200 broken on kernel-6.0-rc3 on DELL/T620
References: <20220913222506.6C72.409509F4@e16-tech.com>
 <613ca1d0-8680-9f45-9317-d6b316f307ce@suse.de>
 <20220913231522.7CAA.409509F4@e16-tech.com>
In-Reply-To: <20220913231522.7CAA.409509F4@e16-tech.com>

--------------YApalSggpA4lreOapmaJg3fE
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTMuMDkuMjIgdW0gMTc6MTUgc2NocmllYiBXYW5nIFl1Z3VpOg0KWy4uLl0N
Cj4+Pg0KPj4+IHNvIEkgdHJpZWQgdG8gcmV2ZXJ0IHBhdGNoIG9mIG1nYWcyMDAgZHJpdmVy
IGluIGJhdGNoIG9mIDIgb3IgMywgdGhlIEkNCj4+PiBub3RpY2VkIHRoZSBwYXRjaCAnU3Vi
amVjdDogZHJtL21nYWcyMDA6IFJlbW92ZSBzcGVjaWFsIGNhc2UgZm9yIEcyMDBTRQ0KPj4+
IHdpdGggPDIgTWlCJyBhbmQgdGhlbiB0cmllZCB0aGlzIGRpcnR5IGZpeC4NCj4+DQo+PiBP
aCwgZ3JlYXQgd29yayEgVGhhbmsgeW91LiBGcm9tIGxvb2tpbmcgYXQgdGhlIHNjcmVlbnNo
b3QgdGhhdCB5b3UgcHJvdmlkZWQsIGl0IHNlZW1zIGFzIGlmIHRoZSAyNC1iaXQgbW9kZSBz
ZXR0aW5nIGlzIGJyb2tlbi4gSSdtIG5vdCBzdXJlIHdoeSB0aGUgRzIwMFNFIHdvcmthcm91
bmQgYXBwbGllcyB0byBhIEcyMDBFUiwgYnV0IHdlJ2xsIHNlZS4NCj4gDQo+IEkgdGVzdGVk
ICdwcmVmZXJyZWRfZGVwdGggPSAzMicgdG9vLiBpdCB3b3JrcyBvbiBUNjMwIHRvby4NCj4g
DQo+IHNvIGJvdGggMTYgYW5kIDMyIHdvcmssIGJ1dCAyNCBmYWlsZWQgb24gREVMTC9UNjMw
Lg0KDQpJIHRyaWVkIG9uIG15IHRlc3QgbWFjaGluZSB3aXRoIGEgNS4xOSBrZXJuZWwgYW5k
IGZvdW5kIHRoYXQgMzItYml0IGFuZCANCjI0LWJpdCBwaXhlbHMgd29yaywgYnV0IDE2LWJp
dCBsb29rcyBpbmNvcnJlY3QuDQoNCldoYXQgYXJlIHRoZSByZXN1bHRzIGlmIHlvdSBib290
IHlvdXIga2VybmVsIDUuMTkuMyB3aXRoIHRoZSBwYXJhbWV0ZXIgDQp2aWRlbz0xMDI0eDc2
OC0yND8gVGhpcyBzaG91bGQgZW5hYmxlIDI0LWJpdCBwaXhlbHMuDQoNCkhvdyBkb2VzIHZp
ZGVvPTEwMjR4NzY4LTE2IGxvb2sgd2l0aCB0aGUgNS4xOSBrZXJuZWw/DQoNCkJlc3QgcmVn
YXJkcw0KVGhvbWFzDQoNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWdh
ZzIwMC9tZ2FnMjAwX21vZGUuYw0KPiBiL2RyaXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcy
MDBfbW9kZS5jDQo+IGluZGV4IDIyNWNjYTJlZDYwZS4uNTYzZTNhYjA1ZmJjIDEwMDY0NA0K
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWdhZzIwMC9tZ2FnMjAwX21vZGUuYw0KPiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vbWdhZzIwMC9tZ2FnMjAwX21vZGUuYw0KPiBAQCAtMTA3MCw3
ICsxMDcwLDcgQEAgaW50IG1nYWcyMDBfbW9kZXNldF9pbml0KHN0cnVjdCBtZ2FfZGV2aWNl
ICptZGV2LCByZXNvdXJjZV9zaXplX3QgdnJhbV9hdmFpbGFibGUNCj4gDQo+ICAgICAgICAg
IGRldi0+bW9kZV9jb25maWcubWF4X3dpZHRoID0gTUdBRzIwMF9NQVhfRkJfV0lEVEg7DQo+
ICAgICAgICAgIGRldi0+bW9kZV9jb25maWcubWF4X2hlaWdodCA9IE1HQUcyMDBfTUFYX0ZC
X0hFSUdIVDsNCj4gLSAgICAgICBkZXYtPm1vZGVfY29uZmlnLnByZWZlcnJlZF9kZXB0aCA9
IDI0Ow0KPiArICAgICAgIGRldi0+bW9kZV9jb25maWcucHJlZmVycmVkX2RlcHRoID0gMzI7
DQo+ICAgICAgICAgIGRldi0+bW9kZV9jb25maWcuZmJfYmFzZSA9IG1kZXYtPnZyYW1fcmVz
LT5zdGFydDsNCj4gICAgICAgICAgZGV2LT5tb2RlX2NvbmZpZy5mdW5jcyA9ICZtZ2FnMjAw
X21vZGVfY29uZmlnX2Z1bmNzOw0KPiANCj4gQmVzdCBSZWdhcmRzDQo+IFdhbmcgWXVndWkg
KHdhbmd5dWd1aUBlMTYtdGVjaC5jb20pDQo+IDIwMjIvMDkvMTMNCj4gDQo+IA0KPiANCg0K
LS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VT
RSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQw
OSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2No
w6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCg==

--------------YApalSggpA4lreOapmaJg3fE--

--------------x5CDKk7qDTw2FXjPxX7vEXz3
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmMhiesFAwAAAAAACgkQlh/E3EQov+C6
nBAAxfj99tzzq/c8uD82Ll4OwM3fnfkuGzgwH7ZUWnLmgEXpEKldvP7/SPVPgpxOdxg51lUlxS9C
HDeT0HGFX1//U1PzuJ95Gfcvk4c5gTFtmcxDxls5TPsqGWAW3E4tpGPLYl1Vxf+heaWEb/tza6o9
xgc1H3vSzNTL6KYv/W9HAHE3POU029IIcPznVi5LAp0uSo9KQWAn2IE8V7CyziX/0KGukuhZT1To
PAG54hTVF1QSs4HU60yeSpKr6pWv7gQYcz7Ti9+FP7IVisAYn4wr98ttn1VIOD8jRkbINvdCTd4X
duiX8Jd3kTO5x2f1uRg7LWrqBf0pE+GtB98y9HGAlN7s8vbWWfQ/daLGjkqmx8LFHmwPj42cKx7Y
3mwl0oz/8ef2cU/HPOcDU3v/sjK/AXTc4JJvBVCoS2cYNfvazOkho7Awam9MyXCJlY1qYEN+g/jz
t+5P+PIQkOdUvV+x3Pie6EPd5OFO2nx8L8Y8zNCzjm+PLlkL8mtf1RLcvhmzIY3Cqfx2HV13CMUt
zpa2QWEcrCP82XFeiHzW5MjFyb0bu6FcykUFZ5z7rnLPg5/t03mn/Tixy7bo/0xaIcEEOgGNAJIe
E8n5MQm8wVTZjtn6/QZVJKUc8c6gAG3Cm4D0HrunMAmMJUDAJR3vBChSmKbG5I3COMMpFzz/RGJ9
y6s=
=IsRT
-----END PGP SIGNATURE-----

--------------x5CDKk7qDTw2FXjPxX7vEXz3--
