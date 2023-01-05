Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B55965E682
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 09:14:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B07010E6C6;
	Thu,  5 Jan 2023 08:14:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AA3E10E6C6
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jan 2023 08:14:04 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B08B52675D;
 Thu,  5 Jan 2023 08:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1672906442; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=msSzuEocX0SC5x38CJEFMznsJXlZeuRK9AQQp5AUtl0=;
 b=YeGan3ccEbfQ5F+oRxdhUhhU08gkLHWl/FBpi+nJgJDrN5BJu2tm+sysiA5OgFcK+PB85j
 3SQkjNrPEQ0zDo0gfZQy+NbBfgk/K8gJZ1nYgLGIE4SEqea3qhjueHjv9FzT+o79lKixW6
 f/UwE9PJbymc2Pp5WjF39+FOrRuKkQw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1672906442;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=msSzuEocX0SC5x38CJEFMznsJXlZeuRK9AQQp5AUtl0=;
 b=k8PtgIfTlAMEuuSZ7k4stb9UTQ2sFXaf/q8TW1SIlXtULSGDa2sxOXks7nPqVt0qfsXcnq
 bhVjziHOLezjAMAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7B5EC13338;
 Thu,  5 Jan 2023 08:14:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id r8UVHcqGtmMxFAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 05 Jan 2023 08:14:02 +0000
Message-ID: <e4b5d6d5-75d0-e022-619a-d56b3315b753@suse.de>
Date: Thu, 5 Jan 2023 09:14:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] drm/vc4: Start console with 32 bpp / 24 depth
To: mripard@kernel.org, emma@anholt.net, airlied@gmail.com, daniel@ffwll.ch
References: <20230105080734.23554-1-tzimmermann@suse.de>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230105080734.23554-1-tzimmermann@suse.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------U0hAhHMRnblPoMXDBf25AQSH"
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
Cc: =?UTF-8?Q?Ma=c3=adra_Canal?= <mcanal@igalia.com>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------U0hAhHMRnblPoMXDBf25AQSH
Content-Type: multipart/mixed; boundary="------------nzN0xCbPhcLsydeq4AD0c29f";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: mripard@kernel.org, emma@anholt.net, airlied@gmail.com, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, =?UTF-8?Q?Ma=c3=adra_Canal?=
 <mcanal@igalia.com>, Javier Martinez Canillas <javierm@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <e4b5d6d5-75d0-e022-619a-d56b3315b753@suse.de>
Subject: Re: [PATCH] drm/vc4: Start console with 32 bpp / 24 depth
References: <20230105080734.23554-1-tzimmermann@suse.de>
In-Reply-To: <20230105080734.23554-1-tzimmermann@suse.de>

--------------nzN0xCbPhcLsydeq4AD0c29f
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQoNCkFtIDA1LjAxLjIzIHVtIDA5OjA3IHNjaHJpZWIgVGhvbWFzIFppbW1lcm1hbm46DQo+
IEludm9rZSB0aGUgZ2VuZXJpYyBjb25zb2xlIGVtdWxhdGlvbiB3aXRoIGEgMzIgYml0cyBw
ZXIgcGl4ZWwuIFRoZQ0KPiBwcmVmZXJyZWQgY29sb3IgZGVwdGggaXMgMjQsIHNvIHRoZSBj
dXJyZW50IHZhbHVlIG9mIDE2IGJwcCBpcyB0b28NCj4gc21hbGwuIFRoaXMgcmVzdWx0cyBp
biB0aGUgZm9sbG93aW5nIGVycm9yIG1lc3NhZ2UNCj4gDQo+IHZjNC1kcm0gZ3B1OiBbZHJt
XSBicHAvZGVwdGggdmFsdWUgb2YgMTYvMjQgbm90IHN1cHBvcnRlZA0KPiB2YzQtZHJtIGdw
dTogW2RybV0gTm8gY29tcGF0aWJsZSBmb3JtYXQgZm91bmQNCj4gLS0tLS0tLS0tLS0tWyBj
dXQgaGVyZSBdLS0tLS0tLS0tLS0tDQo+IFdBUk5JTkc6IENQVTogMiBQSUQ6IDY2IGF0IGRy
aXZlcnMvZ3B1L2RybS9kcm1fYXRvbWljLmM6MTYwNCBfX2RybV9hdG9taWNfaGVscGVyX3Nl
dF9jb25maWcrMHgyZTgvMHgzMTQgW2RybV0NCj4gDQo+IFRoZSBwcm9ibGVtIGhhcyBiZWVu
IHByZXNlbnQgZm9yIGEgbG9uZywgYnV0IGhhcyBvbmx5IG5vdyBzdXJmYWNlZA0KDQonZm9y
IGEgbG9uZyB0aW1lJw0KDQo+IGFzIGNvbW1pdCAzN2M5MGQ1ODlkYzAgKCJkcm0vZmItaGVs
cGVyOiBGaXggc2luZ2xlLXByb2JlIGNvbG9yLWZvcm1hdA0KPiBzZWxlY3Rpb24iKSBhdHRl
bXB0cyB0byBpbXByb3ZlIHNlbGVjdGlvbiBvZiB0aGUgY29sb3IgZm9ybWF0Lg0KPiANCj4g
U2VlIFsxXSBmb3IgdGhlIGluaXRpYWwgYnVnIHJlcG9ydC4NCj4gDQo+IFJlcG9ydGVkLWJ5
OiBNYcOtcmEgQ2FuYWwgPG1jYW5hbEBpZ2FsaWEuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBU
aG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4NCj4gVGVzdGVkLWJ5OiBN
YcOtcmEgQ2FuYWwgPG1jYW5hbEBpZ2FsaWEuY29tPg0KPiBGaXhlczogMzdjOTBkNTg5ZGMw
ICgiZHJtL2ZiLWhlbHBlcjogRml4IHNpbmdsZS1wcm9iZSBjb2xvci1mb3JtYXQgc2VsZWN0
aW9uIikNCj4gQ2M6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPg0K
PiBDYzogSmF2aWVyIE1hcnRpbmV6IENhbmlsbGFzIDxqYXZpZXJtQHJlZGhhdC5jb20+DQo+
IENjOiBNYWFydGVuIExhbmtob3JzdCA8bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwu
Y29tPg0KPiBDYzogTWF4aW1lIFJpcGFyZCA8bXJpcGFyZEBrZXJuZWwub3JnPg0KPiBMaW5r
OiBodHRwczovL2xvcmUua2VybmVsLm9yZy9kcmktZGV2ZWwvMjAyMzAxMDIxMTI5MjcuMjY1
NjUtMS10emltbWVybWFubkBzdXNlLmRlL1QvI21iMDllYjZmNjE1ZjRiMDMwMmM3OGYyNTBi
NDI0MWVlNDhkMTkxNWY4ICMgMQ0KPiAtLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vdmM0L3Zj
NF9kcnYuYyB8IDIgKy0NCj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEg
ZGVsZXRpb24oLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdmM0L3Zj
NF9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS92YzQvdmM0X2Rydi5jDQo+IGluZGV4IDBjY2Fl
ZTU3ZmU5YS4uNjQ0MjNiNzk5ODJmIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
dmM0L3ZjNF9kcnYuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vdmM0L3ZjNF9kcnYuYw0K
PiBAQCAtMzg3LDcgKzM4Nyw3IEBAIHN0YXRpYyBpbnQgdmM0X2RybV9iaW5kKHN0cnVjdCBk
ZXZpY2UgKmRldikNCj4gICAJaWYgKHJldCA8IDApDQo+ICAgCQlnb3RvIHVuYmluZF9hbGw7
DQo+ICAgDQo+IC0JZHJtX2ZiZGV2X2dlbmVyaWNfc2V0dXAoZHJtLCAxNik7DQo+ICsJZHJt
X2ZiZGV2X2dlbmVyaWNfc2V0dXAoZHJtLCAzMik7DQo+ICAgDQo+ICAgCXJldHVybiAwOw0K
PiAgIA0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxv
cGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIu
IDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJn
KQ0KR2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rldg0K

--------------nzN0xCbPhcLsydeq4AD0c29f--

--------------U0hAhHMRnblPoMXDBf25AQSH
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmO2hskFAwAAAAAACgkQlh/E3EQov+CB
hg/7BC37n4OTmPpeJ9xXh8aLOWakmUqdaR7sErXcAHhah4vnJ1kcFbgoNw1YNymidTsKi+Dqq1Kg
ZYlsUfWeiqSJtPzeEb8ng5yt/YNsa7hapz6qou6Tn51H06PovhTSnup7seAIifj4V4ciX9VwjFVb
pL1rx6yCcFmLF5aIFPf0qA6oDtjbRgvTws+kreCND0FNtj7gZdvclUZNNR2Q2GWfgH6rl8klcyAU
HY81cqxAhDskgmb9jWq9SxD/0bTzcDWTVQJlJEZElcsnGDtz+yesCdd/ypEz+vt4ange1K3VfVbV
nnyZ3UYF+DYQ0ALiq1Dl88UQYstm+K6SbihvvSVjie2gz0D1FILf8ikowdjhdUzN3Eh869xWILMy
ZqiWyH//7seM88XY2BbFRHKkH4b4yMu3Vq9zLwf8Rl3I+mqLxQbawLRY0KNMnSci2/tZ4cySnigx
AAD+gkI3ZSwtHYmA9r8Wo4VLV7bMg1jFpM/LT0aUf1jUyWXI6WT+kNO3lJeHRSGtBgpzQ5HJq8ml
mHOv9NEnU9Bzm8k9UVI5vKu97vRUgkBW6jNhQFvlJS3Nuqg0IVhorUK6bCtIzvTU3msFOqiKue8g
DxnQJ9wuEyEwpS8TWLoa0VIFyFQJZa8Ai5FW7KnvNk2T3tNHoD7aMd05EZg+bR3nsGAz7S7zUuQy
3pM=
=fYcI
-----END PGP SIGNATURE-----

--------------U0hAhHMRnblPoMXDBf25AQSH--
