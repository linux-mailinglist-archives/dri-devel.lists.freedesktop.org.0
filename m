Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6005852837B
	for <lists+dri-devel@lfdr.de>; Mon, 16 May 2022 13:47:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D292010F888;
	Mon, 16 May 2022 11:46:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11E2710F888
 for <dri-devel@lists.freedesktop.org>; Mon, 16 May 2022 11:46:56 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B4CDC21FD2;
 Mon, 16 May 2022 11:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1652701614; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=j830Fd2rLci+B5lZ1yKTLpSrijqWvIuQmBZfwbqmAmY=;
 b=wmaSrqnwXjqgtHJvejPrj7+wHbPKRqqM50oSwuUBiOmv+exAogiTMf3dwKQGnSxNStSO9q
 4iR530TgBMHU5rLuLf9PtAZ7v+JR+pDYSsTdyWOU7RBARWW8n1oRwwct8DwFPHC9+bllN/
 WHqeMQjMQYXuQOfHgFCVJC36Y2SbGoY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1652701614;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=j830Fd2rLci+B5lZ1yKTLpSrijqWvIuQmBZfwbqmAmY=;
 b=ogYHzJOyG63JBTPTmN9F8CuvuQBoJOSuKU6R3Vy3onJq02vEH7JUWAUPPEqiLdGlcaAcyc
 uaEq8vVK0IKdkVDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8F30D13AAB;
 Mon, 16 May 2022 11:46:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id k9kYIq45gmLqTAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 16 May 2022 11:46:54 +0000
Message-ID: <116e5d17-6ac3-f189-7992-099d1c04eea6@suse.de>
Date: Mon, 16 May 2022 13:46:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 0/4] drm: Ignore non-existing color planes in helpers
Content-Language: en-US
To: daniel@ffwll.ch, airlied@linux.ie, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, noralf@tronnes.org,
 christian.koenig@amd.com
References: <20220509081602.474-1-tzimmermann@suse.de>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220509081602.474-1-tzimmermann@suse.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------FSa5bL30oSe6K8wEb0MAcqjw"
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------FSa5bL30oSe6K8wEb0MAcqjw
Content-Type: multipart/mixed; boundary="------------hKxivxncFmpqTQniBk1hLuWO";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@linux.ie, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, noralf@tronnes.org,
 christian.koenig@amd.com
Cc: dri-devel@lists.freedesktop.org
Message-ID: <116e5d17-6ac3-f189-7992-099d1c04eea6@suse.de>
Subject: Re: [PATCH 0/4] drm: Ignore non-existing color planes in helpers
References: <20220509081602.474-1-tzimmermann@suse.de>
In-Reply-To: <20220509081602.474-1-tzimmermann@suse.de>

--------------hKxivxncFmpqTQniBk1hLuWO
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

cGluZ2luZyBmb3IgcmV2aWV3DQoNCkFtIDA5LjA1LjIyIHVtIDEwOjE1IHNjaHJpZWIgVGhv
bWFzIFppbW1lcm1hbm46DQo+IFNvbWUgRFJNIGhlbHBlcnMgYXNzdW1lIHRoYXQgYWxsIHBv
dGVudGlhbCBjb2xvciBwbGFuZXMgb2YgYSBmcmFtZWJ1ZmZlcg0KPiBhcmUgYXZhaWxhYmxl
OyBldmVuIGlmIHRoZSBjb2xvciBmb3JtYXQgZGlkbid0IHNwZWNpZnkgdGhlbS4gTm9uLWV4
aXN0aW5nDQo+IHBsYW5lcyBhcmUgc2lsZW50bHkgaWdub3JlZC4gVGhpcyBiZWhhdmlvciBp
cyBpbmNvbnNpc3RlbnQgd2l0aCBvdGhlcg0KPiBoZWxwZXJzIGFuZCBhcHBhcmVudGx5IGxl
YWRzIHRvIHN1YnRsZSBidWdzIHdpdGggdW5pbml0aWFsaXplZCBHRU0gYnVmZmVyDQo+IG1h
cHBpbmdzLiBbMV0NCj4gDQo+IENoYW5nZSBhbGwgYWZmZWN0ZWQgY29kZSB0byBsb29rIGF0
IHRoZSBmcmFtZWJ1ZmZlciBmb3JtYXQncyBudW1iZXIgb2YNCj4gY29sb3IgcGxhbmVzIGFu
ZCBvbmx5IHByb2Nlc3MgdGhlc2UgcGxhbmVzLiBUaGUgdXBkYXRlIGhhcyBiZWVuIGRpc2N1
c3NlZA0KPiBpbiBbMl0gYmVmb3JlLg0KPiANCj4gVGVzdGVkIHdpdGggR0VNIFNITUVNIGhl
bHBlcnMgb24gc2ltcGxlZHJtLg0KPiANCj4gWzFdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3Jn
L2RyaS1kZXZlbC8yMDIxMDczMDE4MzUxMS4yMDA4MC0xLXR6aW1tZXJtYW5uQHN1c2UuZGUv
VC8jbWQwMTcyYjEwYmI1ODhkOGYyMGY0ZjQ1NmUzMDRmMDhkMmE0NTA1ZjcNCj4gWzJdIGh0
dHBzOi8vbG9yZS5rZXJuZWwub3JnL2RyaS1kZXZlbC84NzdkYzBkOS1jNmM2LTAyMmMtMjBk
OC0xNGIzM2U4NjM5MzRAc3VzZS5kZS8NCj4gDQo+IFRob21hcyBaaW1tZXJtYW5uICg0KToN
Cj4gICAgZHJtL2dlbTogU2hhcmUgY29kZSBiZXR3ZWVuIGRybV9nZW1fZmJfe2JlZ2luLGVu
ZH1fY3B1X2FjY2VzcygpDQo+ICAgIGRybS9nZW06IElnbm9yZSBjb2xvciBwbGFuZXMgdGhh
dCBhcmUgdW51c2VkIGJ5IGZyYW1lYnVmZmVyIGZvcm1hdA0KPiAgICBkcm0vZ2VtLXZyYW06
IElnbm9yZSBwbGFuZXMgdGhhdCBhcmUgdW51c2VkIGJ5IGZyYW1lYnVmZmVyIGZvcm1hdA0K
PiAgICBkcm0vZ2VtOiBXYXJuIG9uIHRyeWluZyB0byB1c2UgYSBub24tZXhpc3RpbmcgZnJh
bWVidWZmZXIgcGxhbmUNCj4gDQo+ICAgZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fYXRvbWlj
X2hlbHBlci5jICAgICAgfCAgIDYgKy0NCj4gICBkcml2ZXJzL2dwdS9kcm0vZHJtX2dlbV9m
cmFtZWJ1ZmZlcl9oZWxwZXIuYyB8IDEwMyArKysrKysrKystLS0tLS0tLS0tDQo+ICAgZHJp
dmVycy9ncHUvZHJtL2RybV9nZW1fdnJhbV9oZWxwZXIuYyAgICAgICAgfCAgMzYgKysrKy0t
LQ0KPiAgIGluY2x1ZGUvZHJtL2RybV9nZW1fZnJhbWVidWZmZXJfaGVscGVyLmggICAgIHwg
IDEwICstDQo+ICAgNCBmaWxlcyBjaGFuZ2VkLCA4MSBpbnNlcnRpb25zKCspLCA3NCBkZWxl
dGlvbnMoLSkNCj4gDQo+IA0KPiBiYXNlLWNvbW1pdDogYjBiOTM4NjVhMjRjOTEwZmNiZmE2
ZTZmYTA5NTVmYWU5MzBhNTZkMw0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGlj
cyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdt
YkgNCk1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0KKEhSQiAzNjgw
OSwgQUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rldg0K

--------------hKxivxncFmpqTQniBk1hLuWO--

--------------FSa5bL30oSe6K8wEb0MAcqjw
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmKCOa4FAwAAAAAACgkQlh/E3EQov+C/
gxAAy7wXvsF8afBhK9UXxuXo2eOqAx18/JxRPYKqIeS6KtRNY+b7i5S7pP3gwEyT6oBj3llZQ3YO
Rpgm641/P+3IvySHUrKMTr/y2/G1mzmVgjJS9ZZc/JvXnEg6nyIQ65esI93ZloK6upv8qKGI8Ogf
4M5ukyG+WEX78JHXiH53XLjQprgovOt8ceP42g/AIhawn4EOAqizU/jkoooGGQIkXnVSAuNjcPCn
tzriVsyToz4G3Ui/3+x+YM0rFR8cGonEi22t8lhw7/YkG2Vpsme0Zr8/e7Rzb3E+er87XUZkn4CR
2flxAYFiVhD68XtL5IW5ZP1t78N6mfKA3xLI/ux4fFQ7zl6I8E3QFmm2ZHv1kNMLsNBLn9uH0n+D
aEn/ipf9Eoq7oPpPseBbJo2EjfKkYFtKWo0N1iecD4MLf2LiPbJ0QOhmynTnTZfDg+oRwbQ3opKE
hiAeL0htg3II3qVjSe0rAYSgpouEy0T1fd6+ZQnL0u+YuWfGUv3bHSnXZRblfwp9lwO3h4b2W7k2
+3zzzWuG+PUEyu+TCpafK2wnlmNINbZr+sXgS9YnyQY/C/5U+9zCWCThemxAJPqwIP4D/B5e3NJa
oJ2fnANOD+eJjKFPZUyeyiFt4lQKm1GwQx+rP04a6Awym60het6EViPM3LYvQYzzrM0VvxlvWnww
eTA=
=QBfw
-----END PGP SIGNATURE-----

--------------FSa5bL30oSe6K8wEb0MAcqjw--
