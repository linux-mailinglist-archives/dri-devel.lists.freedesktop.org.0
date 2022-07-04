Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 97365565BD0
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jul 2022 18:22:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8743F10E98B;
	Mon,  4 Jul 2022 16:16:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF2BD10E046
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Jul 2022 12:27:25 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 54707227E3;
 Mon,  4 Jul 2022 12:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1656937644; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ritgXjdV8euR4wsYfGj1ZYgQh9ZB5o9NkTMpFVDZ9Bg=;
 b=IQV8wRDIbYV5TzcIv3N2AmdrstLU4koWv9T0ClTHuNd0M9QJX0ozp8e+dpVIp6GP38NPuH
 sOHMVLn0Im6uXVy+F+VN6YC6Dy9qthXQhknrD1iUktskonL62PcFyYLXe/lSAlv2ozKmWf
 AgbPAacLQ2aK8bTP44PqPQBV2zkPIxA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1656937644;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ritgXjdV8euR4wsYfGj1ZYgQh9ZB5o9NkTMpFVDZ9Bg=;
 b=97uBXNZSRg28RhHXCSNm+YDCF0jDPDCPMxEdSlGlrrgsDLU7qBM8vBKzqEqD6ZGi8PZB0N
 x4DNmU9V9h+Y1CBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2A5FD13451;
 Mon,  4 Jul 2022 12:27:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id CT1kCazcwmKcKwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 04 Jul 2022 12:27:24 +0000
Message-ID: <7ae9ae81-f99f-adc4-85be-a6ac9ad9b72f@suse.de>
Date: Mon, 4 Jul 2022 14:27:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/2] drm: Use size_t type for len variable in
 drm_copy_field()
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org
References: <20220701120755.2135100-1-javierm@redhat.com>
 <20220701120755.2135100-2-javierm@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220701120755.2135100-2-javierm@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Mjfcx5V02sroLKSiZG0wD8Wc"
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Peter Robinson <pbrobinson@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------Mjfcx5V02sroLKSiZG0wD8Wc
Content-Type: multipart/mixed; boundary="------------V3ytlyzeQJV1cOyU1gLzRZWs";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org
Cc: Peter Robinson <pbrobinson@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org
Message-ID: <7ae9ae81-f99f-adc4-85be-a6ac9ad9b72f@suse.de>
Subject: Re: [PATCH 1/2] drm: Use size_t type for len variable in
 drm_copy_field()
References: <20220701120755.2135100-1-javierm@redhat.com>
 <20220701120755.2135100-2-javierm@redhat.com>
In-Reply-To: <20220701120755.2135100-2-javierm@redhat.com>

--------------V3ytlyzeQJV1cOyU1gLzRZWs
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQoNCkFtIDAxLjA3LjIyIHVtIDE0OjA3IHNjaHJpZWIgSmF2aWVyIE1hcnRpbmV6IENhbmls
bGFzOg0KPiBUaGUgc3RybGVuKCkgZnVuY3Rpb24gcmV0dXJucyBhIHNpemVfdCB3aGljaCBp
cyBhbiB1bnNpZ25lZCBpbnQgb24gMzItYml0DQo+IGFyY2hlcyBhbmQgYW4gdW5zaWduZWQg
bG9uZyBvbiA2NC1iaXQgYXJjaGVzLiBCdXQgaW4gdGhlIGRybV9jb3B5X2ZpZWxkKCkNCj4g
ZnVuY3Rpb24sIHRoZSBzdHJsZW4oKSByZXR1cm4gdmFsdWUgaXMgYXNzaWduZWQgdG8gYW4g
J2ludCBsZW4nIHZhcmlhYmxlLg0KPiANCj4gTGF0ZXIsIHRoZSBsZW4gdmFyaWFibGUgaXMg
cGFzc2VkIGFzIGNvcHlfZnJvbV91c2VyKCkgdGhpcmQgYXJndW1lbnQgdGhhdA0KPiBpcyBh
biB1bnNpZ25lZCBsb25nIHBhcmFtZXRlciBhcyB3ZWxsLg0KPiANCj4gSW4gdGhlb3J5LCB0
aGlzIGNhbiBsZWFkIHRvIGFuIGludGVnZXIgb3ZlcmZsb3cgdmlhIHR5cGUgY29udmVyc2lv
bi4gU2luY2UNCj4gdGhlIGFzc2lnbm1lbnQgaGFwcGVucyB0byBhIHNpZ25lZCBpbnQgbHZh
bHVlIGluc3RlYWQgb2YgYSBzaXplX3QgbHZhbHVlLg0KPiANCj4gSW4gcHJhY3RpY2UgdGhv
dWdoLCB0aGF0J3MgdW5saWtlbHkgc2luY2UgdGhlIHZhbHVlcyBjb3BpZWQgYXJlIHNldCBi
eSBEUk0NCj4gZHJpdmVycyBhbmQgbm90IGNvbnRyb2xsZWQgYnkgdXNlcnNwYWNlLiBCdXQg
dXNpbmcgYSBzaXplX3QgZm9yIGxlbiBpcyB0aGUNCj4gY29ycmVjdCB0aGluZyB0byBkbyBh
bnl3YXlzLg0KPiANCj4gUmVwb3J0ZWQtYnk6IFBldGVyIFJvYmluc29uIDxwYnJvYmluc29u
QGdtYWlsLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogSmF2aWVyIE1hcnRpbmV6IENhbmlsbGFz
IDxqYXZpZXJtQHJlZGhhdC5jb20+DQoNClJldmlld2VkLWJ5OiBUaG9tYXMgWmltbWVybWFu
biA8dHppbW1lcm1hbm5Ac3VzZS5kZT4NCg0KPiAtLS0NCj4gDQo+ICAgZHJpdmVycy9ncHUv
ZHJtL2RybV9pb2N0bC5jIHwgMiArLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKSwgMSBkZWxldGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9kcm1faW9jdGwuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1faW9jdGwuYw0KPiBpbmRleCA4
ZmFhZDIzZGMxZDguLmUxYjlhMDNlNjE5YyAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2RybV9pb2N0bC5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1faW9jdGwuYw0K
PiBAQCAtNDcyLDcgKzQ3Miw3IEBAIEVYUE9SVF9TWU1CT0woZHJtX2ludmFsaWRfb3ApOw0K
PiAgICAqLw0KPiAgIHN0YXRpYyBpbnQgZHJtX2NvcHlfZmllbGQoY2hhciBfX3VzZXIgKmJ1
Ziwgc2l6ZV90ICpidWZfbGVuLCBjb25zdCBjaGFyICp2YWx1ZSkNCj4gICB7DQo+IC0JaW50
IGxlbjsNCj4gKwlzaXplX3QgbGVuOw0KPiAgIA0KPiAgIAkvKiBkb24ndCBvdmVyZmxvdyB1
c2VyYnVmICovDQo+ICAgCWxlbiA9IHN0cmxlbih2YWx1ZSk7DQoNCi0tIA0KVGhvbWFzIFpp
bW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29s
dXRpb25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBH
ZXJtYW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8aHJlcjog
SXZvIFRvdGV2DQo=

--------------V3ytlyzeQJV1cOyU1gLzRZWs--

--------------Mjfcx5V02sroLKSiZG0wD8Wc
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmLC3KsFAwAAAAAACgkQlh/E3EQov+Cp
yg//TB6ns+Snqm2PVFxlcVAszrvtyueihPBLCv/AYZCnVb2wExG1fgy0sct5CrjCScuwgJSA/c+L
I4MIteWhZTGttY6YQbHM9UbgCmpIypeT37SW0BmKUMx1EI4VocWsh89MZm2hIJhqIrICcsZIKZxu
uEpjRR5wSwSJzUdR9JyoOvD5Ki0U7M4SAR0ZMuN0npzsOPzXg+Ln67QyfWj47zgkdEFV/BT7pFZc
ogwUBCxN9PRX4r1EnBiJeFjKLXuWD5SdnYdaGYsyORa6LIRYk1t1H+9UNGHCxvf0Flph0D9TKT79
qQb7FCNh0Ezxm5fqklhAfVWWgOnSs1k3bprOYGu9zV5y6SGpBlmcFTYFZ1HJwMt4P8Tn2OnzWXQM
qs/uMbJg8TxjFgXL/O/rq1O5hDR4ndsbD+jW6PdaGavjJhVip1kGmsXSsIrw7Y5ipvOEDzu11abc
933RCF1gYEAmVnhbm0Xczawm4AXJ9biYgu4DqI7hnDJ20j9iDHA4hdMcgJ/+tXfaojHUBHT6lHQb
WAZ4gV3vsOZ0eHYHS505oISe48ai3AzFAzMowqvG0MOoGpt/yLlg4sJEB1ywPjwl5WW/kK9o3f/s
qlJAQFPoX5A0C5YeXWsVMjnnTcpFmHuw/SxdR9DuMt9giGiSpzQ0J/J1gm/3kA+WiWzcTH2A2qiS
vBQ=
=N9kY
-----END PGP SIGNATURE-----

--------------Mjfcx5V02sroLKSiZG0wD8Wc--
