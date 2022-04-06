Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F5864F582A
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 11:02:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2185610EC2C;
	Wed,  6 Apr 2022 09:02:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6961310EC2C
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Apr 2022 09:02:46 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 11D681F38A;
 Wed,  6 Apr 2022 09:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1649235765; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LvPHiMQvcfSO8TWmP9Ks2okavI2zoxOWYoWwGVo/UyQ=;
 b=QCbaig784JLVqctC7bOHGBWuy09zjbhjO5rLg8LxScFq+U//ZzoVv4iUW8bUdt38fIif4k
 9T+lM70aBY1bb2q7WUT41f+tFOxJl4edlYL6ai9fDagZYTyw9RyuvFIwUW2ScS8l9ylkyY
 ujoE4amePJfcs5DkERODOv7QDAB/miA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1649235765;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LvPHiMQvcfSO8TWmP9Ks2okavI2zoxOWYoWwGVo/UyQ=;
 b=1EgDWeVV9A3xN79E+qFw/XdHPrbjk0zunsJ31MNJn7l4kYHVxtqadSEC69uKD0aJdFIBWX
 ATVRupxA2sa1xPBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AAF2B139F5;
 Wed,  6 Apr 2022 09:02:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id NeIKKDRXTWIpeQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 06 Apr 2022 09:02:44 +0000
Message-ID: <8cba63bd-9572-caf5-de85-8d60be7bab26@suse.de>
Date: Wed, 6 Apr 2022 11:02:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH 3/6] drm/vc4: txp: Force alpha to be 0xff if it's disabled
Content-Language: en-US
To: Maxime Ripard <maxime@cerno.tech>, dri-devel@lists.freedesktop.org
References: <20220328153659.2382206-1-maxime@cerno.tech>
 <20220328153659.2382206-4-maxime@cerno.tech>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220328153659.2382206-4-maxime@cerno.tech>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------2pQZBC6u6M0GxukFP0PUfwSm"
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------2pQZBC6u6M0GxukFP0PUfwSm
Content-Type: multipart/mixed; boundary="------------RaFZyZdYfWhatsDO8sdkwJbM";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Maxime Ripard <maxime@cerno.tech>, dri-devel@lists.freedesktop.org
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@intel.com>
Message-ID: <8cba63bd-9572-caf5-de85-8d60be7bab26@suse.de>
Subject: Re: [PATCH 3/6] drm/vc4: txp: Force alpha to be 0xff if it's disabled
References: <20220328153659.2382206-1-maxime@cerno.tech>
 <20220328153659.2382206-4-maxime@cerno.tech>
In-Reply-To: <20220328153659.2382206-4-maxime@cerno.tech>

--------------RaFZyZdYfWhatsDO8sdkwJbM
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgTWF4aW1lDQoNCkFtIDI4LjAzLjIyIHVtIDE3OjM2IHNjaHJpZWIgTWF4aW1lIFJpcGFy
ZDoNCj4gSWYgd2UgdXNlIGEgZm9ybWF0IHRoYXQgaGFzIHBhZGRpbmcgaW5zdGVhZCBvZiB0
aGUgYWxwaGEgY29tcG9uZW50IChzdWNoDQo+IGFzIFhSR0I4ODg4KSwgaXQgYXBwZWFycyB0
aGF0IHRoZSBUcmFuc3Bvc2VyIHdpbGwgZmlsbCB0aGUgcGFkZGluZyB0byAwLA0KPiBkaXNy
ZWdhcmRpbmcgd2hhdCB3YXMgc3RvcmVkIGluIHRoZSBpbnB1dCBidWZmZXIgcGFkZGluZy4N
Cj4gDQo+IFRoaXMgbGVhZHMgdG8gaXNzdWVzIHdpdGggSUdULCBzaW5jZSBpdCB3aWxsIHNl
dCB0aGUgcGFkZGluZyB0byAweGZmLA0KPiBidXQgd2lsbCB0aGVuIGNvbXBhcmUgdGhlIENS
QyBvZiB0aGUgdHdvIGZyYW1lcyB3aGljaCB3aWxsIHRodXMgZmFpbC4NCj4gQW5vdGhlciBu
aWNlIHNpZGUgZWZmZWN0IGlzIHRoYXQgaXQgaXMgbm93IHBvc3NpYmxlIHRvIGp1c3QgdXNl
IHRoZQ0KPiBidWZmZXIgYXMgQVJHQi4NCj4gDQo+IEZpeGVzOiAwMDgwOTVlMDY1YTggKCJk
cm0vdmM0OiBBZGQgc3VwcG9ydCBmb3IgdGhlIHRyYW5zcG9zZXIgYmxvY2siKQ0KPiBTaWdu
ZWQtb2ZmLWJ5OiBNYXhpbWUgUmlwYXJkIDxtYXhpbWVAY2Vybm8udGVjaD4NCj4gLS0tDQo+
ICAgZHJpdmVycy9ncHUvZHJtL3ZjNC92YzRfdHhwLmMgfCAyICsrDQo+ICAgMSBmaWxlIGNo
YW5nZWQsIDIgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS92YzQvdmM0X3R4cC5jIGIvZHJpdmVycy9ncHUvZHJtL3ZjNC92YzRfdHhwLmMNCj4g
aW5kZXggYWNlMmQwMzY0OWJhLi41YjRkZDY0NDIxNGYgMTAwNjQ0DQo+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS92YzQvdmM0X3R4cC5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS92YzQv
dmM0X3R4cC5jDQo+IEBAIC0zMDQsNiArMzA0LDggQEAgc3RhdGljIHZvaWQgdmM0X3R4cF9j
b25uZWN0b3JfYXRvbWljX2NvbW1pdChzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubiwNCj4g
ICANCj4gICAJaWYgKGZiLT5mb3JtYXQtPmhhc19hbHBoYSkNCj4gICAJCWN0cmwgfD0gVFhQ
X0FMUEhBX0VOQUJMRTsNCj4gKwllbHNlDQo+ICsJCWN0cmwgfD0gVFhQX0FMUEhBX0lOVkVS
VDsNCg0KJ0ludmVydCcgaXMgc29tZXdoYXQgbWlzbGVhZGluZyBoZXJlLCBidXQgeW91ciBj
b21taXQgbWVzc2FnZSBuaWNlbHkgDQpleHBsYWlucyB3aGF0IHRoaXMgY29kZSBkb2VzLiBN
YXliZSBhZGQgYSBzaG9ydCBjb21tZW50IHdpdGggdGhlIA0KZXhwbGFuYXRpb24uDQoNCkJl
c3QgcmVnYXJkcw0KVGhvbWFzDQoNCj4gICANCj4gICAJZ2VtID0gZHJtX2ZiX2NtYV9nZXRf
Z2VtX29iaihmYiwgMCk7DQo+ICAgCVRYUF9XUklURShUWFBfRFNUX1BUUiwgZ2VtLT5wYWRk
ciArIGZiLT5vZmZzZXRzWzBdKTsNCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhp
Y3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBH
bWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4
MDksIEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCg==

--------------RaFZyZdYfWhatsDO8sdkwJbM--

--------------2pQZBC6u6M0GxukFP0PUfwSm
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmJNVzMFAwAAAAAACgkQlh/E3EQov+D3
ng//VX10UQfB1AEscq6iKhL90PE0tH559EnrpX0Ke1VaIqPMlRrdD47QzM3Qgcr9puUXaVn+ooUx
TmB29nLFU9L7YKtruJq57Ok+rEpmjk8Puvv1HtxqR1NuSIC1h8HDl0RYdUYk4cAFJg+EwRH884fm
wga5deE6R4kO+CtFsYUHn9rf0I5/y4GeAAMFIqutcXR3+M3X8PRGGlizK/oj8MP4Z6k4ZkFtzR2c
MO1E3Ec0e6AIf0BmhKd2p8F0x5Hv7w6F6jHDSt3H1QLTriX0taE3WLIeMpBUknI/m3uajEEk5hqV
kI1shNH7h21QsgnAu9J6KZaRHUMlwIMucjCqDYlTEP9fnUPdasNrfbwtfT7OylaKDrmCar+Nh5TH
aDRvWoL07ZLkD20Pgpvhi6Dq2i/CaHWE4CndGAH4Gyyy77M76JBeLyYOlD5JERele4v5e78E81Pz
uMvVaIaq4DeozET8nTjqZikbmWGn5921shwgbFbeahw1HNDKAYNT/eB9SyAzUN+aVjdSOmRIh4sx
6wjEGo9aFHebUbbyk9c7XrNGez8IjpKI1FIcXxwhCCX6r5AM199rzb/G5L5J62M7UeX99WBVZu+y
YskKuuMo6Ba6i2Ox5I5iNDhrUXh6CBav1rJYGoTPppPNB9/qe80udqSToDvrBwJDbL+krWeoWpuD
Yjg=
=+KrW
-----END PGP SIGNATURE-----

--------------2pQZBC6u6M0GxukFP0PUfwSm--
