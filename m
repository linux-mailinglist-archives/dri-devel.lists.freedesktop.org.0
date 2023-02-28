Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 90A126A595D
	for <lists+dri-devel@lfdr.de>; Tue, 28 Feb 2023 13:47:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A438710E6A0;
	Tue, 28 Feb 2023 12:47:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8753810E6A0
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Feb 2023 12:47:20 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 3F2841FDC9;
 Tue, 28 Feb 2023 12:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1677588439; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6Wv3/gc28gTr9+vYN5g7yFA5FfRbxf9cyh6K6dL5Mx8=;
 b=yTSsK1oY6C/TBmeffE5+9HTl67GD9wfjY7+PDc6fEKmluueZFz10rKIn6ewSUGG3h3s3gQ
 Wn7KA1qoO639D7ro3Rc6Gx8ms66rDhHSr+g+o1+WShVzJi+pMgZJevO4cEjjeld24RbFuf
 0cExsWFQJ/pWE+6ttBXdlbjQtO6EHYk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1677588439;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6Wv3/gc28gTr9+vYN5g7yFA5FfRbxf9cyh6K6dL5Mx8=;
 b=vzlYeJtifK98QKCuJUtzETWAm35afZDkUm4nBNO4Q+iKuV7LWo2wcEszTQMzcQTR0UN4TG
 xq7Om5zw/a60ymBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 11C5A1333C;
 Tue, 28 Feb 2023 12:47:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id uz6DA9f3/WPeGgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 28 Feb 2023 12:47:19 +0000
Message-ID: <a4bbfe5e-36b1-ed94-f805-42728a8b820d@suse.de>
Date: Tue, 28 Feb 2023 13:47:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3] drm/virtio: Add option to disable KMS support
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Rob Clark <robdclark@gmail.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>
References: <20230227173800.2809727-1-robdclark@gmail.com>
 <44e67d88-fce6-a1c1-79a9-a937e64a32bb@collabora.com>
 <CAF6AEGsT8_o+v0vzGu1nyh6Z82pj8FnGUdMFc0Lq+4OWoSjRBQ@mail.gmail.com>
 <fb70356e-4e13-1858-9e1a-e886f5918030@suse.de>
In-Reply-To: <fb70356e-4e13-1858-9e1a-e886f5918030@suse.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------MymaBzxJWDFlUepZ0xSR3Ybp"
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
Cc: Rob Clark <robdclark@chromium.org>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Ryan Neph <ryanneph@chromium.org>,
 David Airlie <airlied@redhat.com>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------MymaBzxJWDFlUepZ0xSR3Ybp
Content-Type: multipart/mixed; boundary="------------nBW0wihuX0zi4PycN12m8YJ5";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Rob Clark <robdclark@gmail.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc: Rob Clark <robdclark@chromium.org>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Ryan Neph <ryanneph@chromium.org>,
 David Airlie <airlied@redhat.com>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>
Message-ID: <a4bbfe5e-36b1-ed94-f805-42728a8b820d@suse.de>
Subject: Re: [PATCH v3] drm/virtio: Add option to disable KMS support
References: <20230227173800.2809727-1-robdclark@gmail.com>
 <44e67d88-fce6-a1c1-79a9-a937e64a32bb@collabora.com>
 <CAF6AEGsT8_o+v0vzGu1nyh6Z82pj8FnGUdMFc0Lq+4OWoSjRBQ@mail.gmail.com>
 <fb70356e-4e13-1858-9e1a-e886f5918030@suse.de>
In-Reply-To: <fb70356e-4e13-1858-9e1a-e886f5918030@suse.de>

--------------nBW0wihuX0zi4PycN12m8YJ5
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQoNCkFtIDI4LjAyLjIzIHVtIDEzOjM0IHNjaHJpZWIgVGhvbWFzIFppbW1lcm1hbm46DQo+
IEhpDQo+IA0KPiBBbSAyNy4wMi4yMyB1bSAxOToxNSBzY2hyaWViIFJvYiBDbGFyazoNCj4+
IE9uIE1vbiwgRmViIDI3LCAyMDIzIGF0IDk6NTcgQU0gRG1pdHJ5IE9zaXBlbmtvDQo+PiA8
ZG1pdHJ5Lm9zaXBlbmtvQGNvbGxhYm9yYS5jb20+IHdyb3RlOg0KPj4+DQo+Pj4gT24gMi8y
Ny8yMyAyMDozOCwgUm9iIENsYXJrIHdyb3RlOg0KPj4+IC4uLg0KPj4+PiArwqDCoMKgwqAg
aWYgKElTX0VOQUJMRUQoQ09ORklHX0RSTV9WSVJUSU9fR1BVX0tNUykpIHsNCj4+Pj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAvKiBnZXQgZGlzcGxheSBpbmZvICovDQo+Pj4+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdmlydGlvX2NyZWFkX2xlKHZnZGV2LT52ZGV2LCBz
dHJ1Y3QgdmlydGlvX2dwdV9jb25maWcsDQo+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBudW1fc2Nhbm91dHMsICZudW1f
c2Nhbm91dHMpOw0KPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHZnZGV2LT5udW1f
c2Nhbm91dHMgPSBtaW5fdCh1aW50MzJfdCwgbnVtX3NjYW5vdXRzLA0KPj4+PiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgVklSVElPX0dQVV9NQVhfU0NBTk9VVFMpOw0KPj4+PiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmICghdmdkZXYtPm51bV9zY2Fub3V0cykgew0K
Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAvKg0KPj4+
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICogSGF2aW5n
IGFuIEVESUQgYnV0IG5vIHNjYW5vdXRzIGlzIA0KPj4+PiBub24tc2Vuc2ljYWwsDQo+Pj4+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKiBidXQgaXQg
aXMgcGVybWl0dGVkIHRvIGhhdmUgbm8gc2Nhbm91dHMgYW5kIG5vDQo+Pj4+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKiBFRElEIChpbiB3aGljaCBj
YXNlIERSSVZFUl9NT0RFU0VUIGFuZA0KPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgICogRFJJVkVSX0FUT01JQyBhcmUgbm90IGFkdmVydGlzZWQp
DQo+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKi8N
Cj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKHZn
ZGV2LT5oYXNfZWRpZCkgew0KPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgRFJNX0VSUk9SKCJudW1fc2Nhbm91dHMgaXMg
emVyb1xuIik7DQo+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCByZXQgPSAtRUlOVkFMOw0KPj4+PiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZ290byBlcnJf
c2Nhbm91dHM7DQo+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIH0NCj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
ZGV2LT5kcml2ZXJfZmVhdHVyZXMgJj0gfihEUklWRVJfTU9ERVNFVCB8IA0KPj4+PiBEUklW
RVJfQVRPTUlDKTsNCj4+Pg0KPj4+IElmIGl0J3Mgbm93IGNvbmZpZ3VyYWJsZSBieSBob3N0
LCB3aHkgZG8gd2UgbmVlZCB0aGUNCj4+PiBDT05GSUdfRFJNX1ZJUlRJT19HUFVfS01TPw0K
Pj4NCj4+IEJlY2F1c2UgYSBrZXJuZWwgY29uZmlnIG9wdGlvbiBtYWtlcyBpdCBtb3JlIG9i
dmlvdXMgdGhhdA0KPj4gbW9kZXNldC9hdG9taWMgaW9jdGxzIGFyZSBibG9ja2VkLsKgIFdo
aWNoIG1ha2VzIGl0IG1vcmUgb2J2aW91cyBhYm91dA0KPj4gd2hlcmUgYW55IHBvdGVudGlh
bCBzZWN1cml0eSBpc3N1ZXMgYXBwbHkgYW5kIHdoZXJlIGZpeGVzIG5lZWQgdG8gZ2V0DQo+
PiBiYWNrcG9ydGVkIHRvLsKgIFRoZSBjb25maWcgb3B0aW9uIGlzIHRoZSBvbmx5IHRoaW5n
IF9JXyB3YW50LA0KPj4gZXZlcnl0aGluZyBlbHNlIGlzIGp1c3QgYSBib251cyB0byBoZWxw
IG90aGVyIHBlb3BsZSdzIHVzZS1jYXNlcy4NCj4gDQo+IEkgZmluZCB0aGlzIHZlcnkgdmFn
dWUuIFdoYXQncyB0aGUgc2VjdXJpdHkgdGhyZWFkPw0KPiANCj4gQW5kIGlmIHRoZSBjb25m
aWcgb3B0aW9uIGlzIHVzZWZ1bCwgc2hvdWxkbid0IGl0IGJlIERSTS13aWRlPyBUaGUgDQo+
IG1vZGVzZXR0aW5nIGlvY3RsIGNhbGxzIGFyZSBzaGFyZWQgYW1vbmcgYWxsIGRyaXZlcnMu
DQoNCkZvciByZWZlcmVuY2UsIGhlcmUncyBhbiBvbGRlciBkaXNjdXNzaW9uIGFib3V0IHJl
bmRlci1vbmx5IGRldmljZXMuDQoNCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2RyaS1kZXZl
bC8yMDIyMTAxMTExMDQzNy4xNTI1OC0xLWNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbS8NCg0K
PiANCj4gQmVzdCByZWdhcmRzDQo+IFRob21hcw0KPiANCj4+DQo+PiBCUiwNCj4+IC1SDQo+
IA0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVy
DQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIuIDUs
IDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0K
R2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rldg0K

--------------nBW0wihuX0zi4PycN12m8YJ5--

--------------MymaBzxJWDFlUepZ0xSR3Ybp
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmP999YFAwAAAAAACgkQlh/E3EQov+Cj
/RAAhVUR8LRJP35wWuW88UmUN1kp0OSpE/lPx0wso8vvO0ZI6J6k5aTD3NSVHdHBkg8N6JO6eDns
QZSl0OCSoXSLbRUCGE6lm69i1BpeXdxUs3jZah844rSy0jg8zOW2KtThI78BVeaz5vchjV8XNwlk
GrgsMwSvA2bsmPmb/bk8kSfMf3WClA+ygdckjbKp7eWpcYCc5nEpfe3RxndawbCUdkYhKyipP+3m
2G3+wX3oct+h8Qj5UbTttadVRc8TEaNGn4K0XnRYU4pC7mlXdWdAdSTg/nt8Q1lgepL6iQVT2Dev
4HSuKol6O4nEdFFbUaEwGieyeln1laK1xLoC4fv96EwOxkH0gfPhtNhHjOxvKa/ClIgIouQJYu3b
Yp/gxbLWG/YbI7LsPo9lYxAqAgd5eM6xEKo7kUez4QRvMwc1RD258fyi8a2ciVzOuSOshrmZzREj
XMg4dc6rbLZ9VaT+bbiZGfH24YeVmEUt6epFVfTHbHQoD2eatxCnwNyXSvPjiW7pnptha0pyfKWH
JF3/qW4AUjxw3JgQST3lZHvQgTmdps0ifnRDO/diRP3z13Zk7ME31ZcUwmC2QAghLBTo6nyy1WWt
ts8UwDk56wx+nGkYJtM8lsuwdl5gpvE2EDTnulk4hTsIqy6ZZCQje+BikIHCwb7h70Rshta/k6gh
cno=
=GLvI
-----END PGP SIGNATURE-----

--------------MymaBzxJWDFlUepZ0xSR3Ybp--
