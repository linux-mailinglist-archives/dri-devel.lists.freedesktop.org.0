Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D41975F9D8
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jul 2023 16:27:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2D6389E36;
	Mon, 24 Jul 2023 14:27:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD41289E36
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jul 2023 14:27:32 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 61D8E21879;
 Mon, 24 Jul 2023 14:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1690208851; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=G5/Wqj8g7HBy9OetDzWJZJrM4czQekeGCqJ1tMFNRiQ=;
 b=z1XvGTz74Mvtt5kszolPZxQ0Q2TQb+CDaAwMygZgvlbhx4uBmAJpo4um2OEheK0YMIrJQW
 1MshgLbpv2zdirXAMTvrt/YzREu5OZ7tDTHpXK5FgdUmLZTQMHPF5hnnou/YnaKfDKMwth
 1hwQWsk2C5zhASofFkULCPldfJ7jYwk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1690208851;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=G5/Wqj8g7HBy9OetDzWJZJrM4czQekeGCqJ1tMFNRiQ=;
 b=y22gDFTv1JbDlFxE3kzzeXxwOjvd0dnUoQ4rhcOAnu4AadYk0XBZxIaP8SVe7gKr6MQGEB
 cTPezthPrbtQ3LDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 346AC138E8;
 Mon, 24 Jul 2023 14:27:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Xw7DC1OKvmToXQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 24 Jul 2023 14:27:31 +0000
Message-ID: <fb90dd22-b908-d65a-5272-c2f94aa0113d@suse.de>
Date: Mon, 24 Jul 2023 16:27:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH -next] drm/fb-helper: Remove unused inline function
 drm_fb_helper_defio_init()
To: YueHaibing <yuehaibing@huawei.com>, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, daniel@ffwll.ch
References: <20230721120902.32920-1-yuehaibing@huawei.com>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230721120902.32920-1-yuehaibing@huawei.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------q495lpsBuTbuNPWhItYd10zh"
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------q495lpsBuTbuNPWhItYd10zh
Content-Type: multipart/mixed; boundary="------------FwRuAiwu8Fnd0TU9htv3REIJ";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: YueHaibing <yuehaibing@huawei.com>, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Message-ID: <fb90dd22-b908-d65a-5272-c2f94aa0113d@suse.de>
Subject: Re: [PATCH -next] drm/fb-helper: Remove unused inline function
 drm_fb_helper_defio_init()
References: <20230721120902.32920-1-yuehaibing@huawei.com>
In-Reply-To: <20230721120902.32920-1-yuehaibing@huawei.com>

--------------FwRuAiwu8Fnd0TU9htv3REIJ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjEuMDcuMjMgdW0gMTQ6MDkgc2NocmllYiBZdWVIYWliaW5nOg0KPiBTaW5j
ZSBjb21taXQgOGU4NmRlZTAyMjUzICgiZHJtL2ZiLWhlbHBlcjogUmVtb3ZlIGRybV9mYl9o
ZWxwZXJfZGVmaW9faW5pdCgpIGFuZCB1cGRhdGUgZG9jcyIpDQo+IHRoaXMgaW5saW5lIGhl
bHBlciBub3QgdXNlZCBhbnltb3JlLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogWXVlSGFpYmlu
ZyA8eXVlaGFpYmluZ0BodWF3ZWkuY29tPg0KDQpZb3UgbmVlZCB0byBhZGQgYSBGaXhlczog
dGFnIGhlcmUgd2l0aCB0aGUgY29tbWl0IHlvdSBtZW50aW9uZWQgaW4gdGhlIA0KZGVzY3Jp
cHRpb24uDQoNCldpdGggdGhpcyBmaXhlZCwgeW91IGNhbiBhbHNvIGFkZA0KDQpSZXZpZXdl
ZC1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+DQoNCkJlc3Qg
cmVnYXJkcw0KVGhvbWFzDQoNCj4gLS0tDQo+ICAgaW5jbHVkZS9kcm0vZHJtX2ZiX2hlbHBl
ci5oIHwgNSAtLS0tLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCA1IGRlbGV0aW9ucygtKQ0KPiAN
Cj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2RybV9mYl9oZWxwZXIuaCBiL2luY2x1ZGUv
ZHJtL2RybV9mYl9oZWxwZXIuaA0KPiBpbmRleCA0ODYzYjBmODI5OWUuLjM3NTczN2ZkNmMz
NiAxMDA2NDQNCj4gLS0tIGEvaW5jbHVkZS9kcm0vZHJtX2ZiX2hlbHBlci5oDQo+ICsrKyBi
L2luY2x1ZGUvZHJtL2RybV9mYl9oZWxwZXIuaA0KPiBAQCAtMzY4LDExICszNjgsNiBAQCBz
dGF0aWMgaW5saW5lIHZvaWQgZHJtX2ZiX2hlbHBlcl9kZWZlcnJlZF9pbyhzdHJ1Y3QgZmJf
aW5mbyAqaW5mbywNCj4gICB7DQo+ICAgfQ0KPiAgIA0KPiAtc3RhdGljIGlubGluZSBpbnQg
ZHJtX2ZiX2hlbHBlcl9kZWZpb19pbml0KHN0cnVjdCBkcm1fZmJfaGVscGVyICpmYl9oZWxw
ZXIpDQo+IC17DQo+IC0JcmV0dXJuIC1FTk9ERVY7DQo+IC19DQo+IC0NCj4gICBzdGF0aWMg
aW5saW5lIHZvaWQgZHJtX2ZiX2hlbHBlcl9zZXRfc3VzcGVuZChzdHJ1Y3QgZHJtX2ZiX2hl
bHBlciAqZmJfaGVscGVyLA0KPiAgIAkJCQkJICAgICBib29sIHN1c3BlbmQpDQo+ICAgew0K
DQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpT
VVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCkZyYW5rZW5zdHJhc3NlIDE0
NiwgOTA0NjEgTnVlcm5iZXJnLCBHZXJtYW55DQpHRjogSXZvIFRvdGV2LCBBbmRyZXcgTXll
cnMsIEFuZHJldyBNY0RvbmFsZCwgQm91ZGllbiBNb2VybWFuDQpIUkIgMzY4MDkgKEFHIE51
ZXJuYmVyZykNCg==

--------------FwRuAiwu8Fnd0TU9htv3REIJ--

--------------q495lpsBuTbuNPWhItYd10zh
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmS+ilIFAwAAAAAACgkQlh/E3EQov+Bk
fxAAsWTfoKbmTMl6gphpxk0rCn+ZWj8Sq2xpBiaQA+IWe/3MaxDwetfodNiiQvYwzQQXIog1G6EN
TvsilfLh3Y0CP8OgGvMHpa2V5e8Ujagdn7j1kOvHHqpfaN4Am22Eoj3i4zgA9sdh/jJLKGmwDKx4
sLk+6ueZcO8OjR4Lo3L8e3noJlmC5RCj9WbJUK4SJZ2DTx/M3MVznkSW1QvEMUcZcHiPCWC7egQl
ihkWds3M3oX8kTsooUVkwdsKayEvfSyHfg4byKvv6oZavWb6uaHap33Gj7Nl82TPigbmx5i2zHkB
GZDmQ4knpRqS9WC673h/Onusb+vtA4VEJCKnPegLkeKSVw8SkL3n+Wna53IGF4PoSc0WjZqKKVIG
n9noqgPbjOzAH9X2z3miMwu/z9eLSJGefyFK1NtdRvMedz3b+kYxcJ+2XamPUlB9cdtTCuYS1VEq
gfjdlPeyv+CDYVWiEWr/rWd+OphWewM7X9gSOimJWC1aVOCrwT1y/XRssxvYo+M1yonGcDBUKjAp
sDJ0vNsrENyLsazUVdnJIDDxZJWbfF33WA7olQ1fyLhPRu5RBoUyTo8cl+v2rXx/Gvj1zGV5rSgU
d9V8xT2QIY0AC4l/diF0Jbll3kV6Cyy6cgxwVVVaktC0ByrDpHNq1xk3e8N60Aiv0sdbYF2LTbLk
YRo=
=LhwO
-----END PGP SIGNATURE-----

--------------q495lpsBuTbuNPWhItYd10zh--
