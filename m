Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D88542DAFB
	for <lists+dri-devel@lfdr.de>; Thu, 14 Oct 2021 15:58:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F8806EB12;
	Thu, 14 Oct 2021 13:58:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ABEF6EB12
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Oct 2021 13:58:39 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id DA14D1FD29;
 Thu, 14 Oct 2021 13:58:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1634219917; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9A+GQeaFgonmZoQA1BJNWLgEss6Z/Jtafc/0hYNUu4Y=;
 b=Jw2sjnBCXAWISc+DK4rVtikmY9lEX1FPmZRRQdo4II2PfKP7mWQ/wRVMSxtC+j5yCYLmSM
 y7L4kXi05iGRK3cV4He62a9sTcF8iEsX/C6kzLguIHZnIeMwafKO3FOwzkFfTJYM1Uo+ol
 cguefB3ALh1fV8kwX77EjQYbq0P7ayc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1634219917;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9A+GQeaFgonmZoQA1BJNWLgEss6Z/Jtafc/0hYNUu4Y=;
 b=3JWZomZAlwpzJqHYa9IvRFuBKdAe6Y2jQkUnyTaBdWM2L/Yfwq5zCVpIKQIfJngTgEyJeG
 ctzsH6yvHYSFWJAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B4E4C13D97;
 Thu, 14 Oct 2021 13:58:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id cTFEK403aGE+awAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 14 Oct 2021 13:58:37 +0000
Message-ID: <8742cda5-1fc7-ae44-076c-e4a522ca43f5@suse.de>
Date: Thu, 14 Oct 2021 15:58:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.2
Subject: Re: [PATCH] video: smscufx: Fix null-ptr-deref in ufx_usb_probe()
Content-Language: en-US
To: Wang Hai <wanghai38@huawei.com>, steve.glendinning@shawell.net,
 FlorianSchandinat@gmx.de, gregkh@suse.de
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20211014132231.555138-1-wanghai38@huawei.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20211014132231.555138-1-wanghai38@huawei.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------ffM8l0TxRYwhGR0oMWNe03pk"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------ffM8l0TxRYwhGR0oMWNe03pk
Content-Type: multipart/mixed; boundary="------------dzQNDPAH6MVNLQ7iZa2Lns6c";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Wang Hai <wanghai38@huawei.com>, steve.glendinning@shawell.net,
 FlorianSchandinat@gmx.de, gregkh@suse.de
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Message-ID: <8742cda5-1fc7-ae44-076c-e4a522ca43f5@suse.de>
Subject: Re: [PATCH] video: smscufx: Fix null-ptr-deref in ufx_usb_probe()
References: <20211014132231.555138-1-wanghai38@huawei.com>
In-Reply-To: <20211014132231.555138-1-wanghai38@huawei.com>

--------------dzQNDPAH6MVNLQ7iZa2Lns6c
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTQuMTAuMjEgdW0gMTU6MjIgc2NocmllYiBXYW5nIEhhaToNCj4gSSBnb3Qg
YSBudWxsLXB0ci1kZXJlZiByZXBvcnQ6DQo+IA0KPiBCVUc6IGtlcm5lbCBOVUxMIHBvaW50
ZXIgZGVyZWZlcmVuY2UsIGFkZHJlc3M6IDAwMDAwMDAwMDAwMDAwMDANCj4gLi4uDQo+IFJJ
UDogMDAxMDpmYl9kZXN0cm95X21vZGVsaXN0KzB4MzgvMHgxMDANCj4gLi4uDQo+IENhbGwg
VHJhY2U6DQo+ICAgdWZ4X3VzYl9wcm9iZS5jb2xkKzB4MmI1LzB4YWMxIFtzbXNjdWZ4XQ0K
PiAgIHVzYl9wcm9iZV9pbnRlcmZhY2UrMHgxYWEvMHgzYzAgW3VzYmNvcmVdDQo+ICAgcmVh
bGx5X3Byb2JlKzB4MTY3LzB4NDYwDQo+IC4uLg0KPiAgIHJldF9mcm9tX2ZvcmsrMHgxZi8w
eDMwDQo+IA0KPiBJZiBmYl9hbGxvY19jbWFwKCkgZmFpbHMgaW4gdWZ4X3VzYl9wcm9iZSgp
LCBmYl9kZXN0cm95X21vZGVsaXN0KCkgd2lsbA0KPiBiZSBjYWxsZWQgdG8gZGVzdHJveSBt
b2RlbGlzdCBpbiB0aGUgZXJyb3IgaGFuZGxpbmcgcGF0aC4gQnV0IG1vZGVsaXN0DQo+IGhh
cyBub3QgYmVlbiBpbml0aWFsaXplZCB5ZXQsIHNvIGl0IHdpbGwgcmVzdWx0IGluIG51bGwt
cHRyLWRlcmVmLg0KPiANCj4gSW5pdGlhbGl6ZSBtb2RlbGlzdCBiZWZvcmUgY2FsbGluZyBm
Yl9hbGxvY19jbWFwKCkgdG8gZml4IHRoaXMgYnVnLg0KPiANCj4gRml4ZXM6IDNjOGE2M2Uy
MmEwOCAoIkFkZCBzdXBwb3J0IGZvciBTTVNDIFVGWDYwMDAvNzAwMCBVU0IgZGlzcGxheSBh
ZGFwdGVycyIpDQo+IFJlcG9ydGVkLWJ5OiBIdWxrIFJvYm90IDxodWxrY2lAaHVhd2VpLmNv
bT4NCj4gU2lnbmVkLW9mZi1ieTogV2FuZyBIYWkgPHdhbmdoYWkzOEBodWF3ZWkuY29tPg0K
DQpBY2tlZC1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+DQoN
CkkgZ290IG9uZSBvZiB0aGVzZSBkZXZpY2VzIGJ1dCB0aGUgZHJpdmVyIGRpZG4ndCBwcm9k
dWNlIGFueSBvdXRwdXQgZm9yIA0KbWUuIEFyZSBhY3R1YWxseSBhYmxlIHRvIHVzZSB0aGUg
ZHJpdmVyPw0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQo+IC0tLQ0KPiAgIGRyaXZlcnMv
dmlkZW8vZmJkZXYvc21zY3VmeC5jIHwgMyArLS0NCj4gICAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKyksIDIgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy92aWRlby9mYmRldi9zbXNjdWZ4LmMgYi9kcml2ZXJzL3ZpZGVvL2ZiZGV2L3Ntc2N1Zngu
Yw0KPiBpbmRleCBiZmFjM2VlNGE2NDIuLjI4NzY4YzI3MmI3MyAxMDA2NDQNCj4gLS0tIGEv
ZHJpdmVycy92aWRlby9mYmRldi9zbXNjdWZ4LmMNCj4gKysrIGIvZHJpdmVycy92aWRlby9m
YmRldi9zbXNjdWZ4LmMNCj4gQEAgLTE2NTYsNiArMTY1Niw3IEBAIHN0YXRpYyBpbnQgdWZ4
X3VzYl9wcm9iZShzdHJ1Y3QgdXNiX2ludGVyZmFjZSAqaW50ZXJmYWNlLA0KPiAgIAlpbmZv
LT5wYXIgPSBkZXY7DQo+ICAgCWluZm8tPnBzZXVkb19wYWxldHRlID0gZGV2LT5wc2V1ZG9f
cGFsZXR0ZTsNCj4gICAJaW5mby0+ZmJvcHMgPSAmdWZ4X29wczsNCj4gKwlJTklUX0xJU1Rf
SEVBRCgmaW5mby0+bW9kZWxpc3QpOw0KPiAgIA0KPiAgIAlyZXR2YWwgPSBmYl9hbGxvY19j
bWFwKCZpbmZvLT5jbWFwLCAyNTYsIDApOw0KPiAgIAlpZiAocmV0dmFsIDwgMCkgew0KPiBA
QCAtMTY2Niw4ICsxNjY3LDYgQEAgc3RhdGljIGludCB1ZnhfdXNiX3Byb2JlKHN0cnVjdCB1
c2JfaW50ZXJmYWNlICppbnRlcmZhY2UsDQo+ICAgCUlOSVRfREVMQVlFRF9XT1JLKCZkZXYt
PmZyZWVfZnJhbWVidWZmZXJfd29yaywNCj4gICAJCQkgIHVmeF9mcmVlX2ZyYW1lYnVmZmVy
X3dvcmspOw0KPiAgIA0KPiAtCUlOSVRfTElTVF9IRUFEKCZpbmZvLT5tb2RlbGlzdCk7DQo+
IC0NCj4gICAJcmV0dmFsID0gdWZ4X3JlZ19yZWFkKGRldiwgMHgzMDAwLCAmaWRfcmV2KTsN
Cj4gICAJY2hlY2tfd2Fybl9nb3RvX2Vycm9yKHJldHZhbCwgImVycm9yICVkIHJlYWRpbmcg
MHgzMDAwIHJlZ2lzdGVyIGZyb20gZGV2aWNlIiwgcmV0dmFsKTsNCj4gICAJZGV2X2RiZyhk
ZXYtPmdkZXYsICJJRF9SRVYgcmVnaXN0ZXIgdmFsdWUgMHglMDh4IiwgaWRfcmV2KTsNCj4g
DQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXIN
ClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwg
OTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpH
ZXNjaMOkZnRzZsO8aHJlcjogRmVsaXggSW1lbmTDtnJmZmVyDQo=

--------------dzQNDPAH6MVNLQ7iZa2Lns6c--

--------------ffM8l0TxRYwhGR0oMWNe03pk
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmFoN40FAwAAAAAACgkQlh/E3EQov+Be
XQ/8CUvzhqSHEvJvOGEFy749mT9d2yCS3FIAdnNGwOLlnqt8tHlweLEknX/sEpxQ7t5GEKQV7azT
QQqs/O5MKKi1HKuRv4q81OZZW69EqLP+LDJ4kKYiViCin7KoUxIiu+71vtequhqeF3e3fqa700iS
bWgOHD3qVU1xdQTJMQ1mBH1v2h+WWjAeTzb/xh4EqYxq1yV4SDX4JdpD35uPYF7g2PMfd5M6s9ga
fc3breWN6vNjWckWRoebn7wXK33t1YStpweWlJ42aytyrLy2eD4M8F2t2Rl8F5d1qmiuhkz6sv/F
rfS9NWl2dfT6fYbb+kWRSyLnhPSEVjiM0OeyCLAA4FeGY9B5VnMFo/oEphbS1UINXsLwWTlaYYs7
gcIc3lzQOsJZS0iqF1SkzOZNItQzEbaLUpJjKLl7Ph/HMpIuy0CZBt8iW2KgOlOrYh9L8WFttj/b
hEjGbsJqXu09MxzX800ai3cStk4g6thnZTKLtxcQAEWXId4cz/8sV5sB4W606CfbiNukPiy0M8R7
xKZvfBRU49t2nDdaBMAGqfQeibLoz35/d37M6nHuARmxQmJEfIpHVu+7ihVpSkmM8rDMsSuBy1b8
7eXF9Syv78m1VGVGZQg6teDlPQkAMtbwfieM2qELKh95Mb3SvVsgYsZlqxpSMfG/YL1fuam9o2Wp
5w0=
=EdCo
-----END PGP SIGNATURE-----

--------------ffM8l0TxRYwhGR0oMWNe03pk--
