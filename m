Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B9D84704E95
	for <lists+dri-devel@lfdr.de>; Tue, 16 May 2023 15:04:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89B4D10E0C6;
	Tue, 16 May 2023 13:03:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA89910E0C6;
 Tue, 16 May 2023 13:03:57 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 6A0A121CD4;
 Tue, 16 May 2023 13:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1684242233; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7MYn1TIkHwneNzd3IUFWyvJO6ujcXL9z7oe8mMJjl9I=;
 b=rIS29l2tl1/rMbpZezKb+W7BXqoiArjaYsN5ryXaIiA5rilS5d4S6hznjNZlz1sXUV+VFC
 msk7yo4qSVRpee24pFWY575z6vxyKarUaLo1JWYVePf8+xE9NyZFqG44XtpW6ua3fG7gGS
 qiXR1WEsjqP0O5bO4lEY+utWv0ykpLw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1684242233;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7MYn1TIkHwneNzd3IUFWyvJO6ujcXL9z7oe8mMJjl9I=;
 b=78N1hjwcL7ApVsl7Ktj5ecxO0Vs4iwZZYGyfUz7ydDZT8pCXnR9/QqhdP4lVVNfisi7p6R
 WNZjj49SATigS/DQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0ACE0138F9;
 Tue, 16 May 2023 13:03:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id F0pMATl/Y2TuOwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 16 May 2023 13:03:53 +0000
Message-ID: <72d1535b-45ee-1556-d97f-6d3dfdcd7ed4@suse.de>
Date: Tue, 16 May 2023 15:03:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v2 02/12] drm/armada: Use regular fbdev I/O helpers
To: Sam Ravnborg <sam@ravnborg.org>
References: <20230515094033.2133-1-tzimmermann@suse.de>
 <20230515094033.2133-3-tzimmermann@suse.de>
 <20230515175544.GB1745913@ravnborg.org>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230515175544.GB1745913@ravnborg.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------TF15ECY1lmCvOkLrbIq0MhSY"
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
Cc: freedreno@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, javierm@redhat.com,
 Russell King <linux@armlinux.org.uk>, dri-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------TF15ECY1lmCvOkLrbIq0MhSY
Content-Type: multipart/mixed; boundary="------------x19kmCONrIOVY1mx13KTewaz";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: daniel@ffwll.ch, airlied@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, javierm@redhat.com, linux-samsung-soc@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 Russell King <linux@armlinux.org.uk>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Message-ID: <72d1535b-45ee-1556-d97f-6d3dfdcd7ed4@suse.de>
Subject: Re: [PATCH v2 02/12] drm/armada: Use regular fbdev I/O helpers
References: <20230515094033.2133-1-tzimmermann@suse.de>
 <20230515094033.2133-3-tzimmermann@suse.de>
 <20230515175544.GB1745913@ravnborg.org>
In-Reply-To: <20230515175544.GB1745913@ravnborg.org>

--------------x19kmCONrIOVY1mx13KTewaz
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTUuMDUuMjMgdW0gMTk6NTUgc2NocmllYiBTYW0gUmF2bmJvcmc6DQo+IEhp
IFRob21hcywNCj4gDQo+IE9uIE1vbiwgTWF5IDE1LCAyMDIzIGF0IDExOjQwOjIzQU0gKzAy
MDAsIFRob21hcyBaaW1tZXJtYW5uIHdyb3RlOg0KPj4gVXNlIHRoZSByZWd1bGFyIGZiZGV2
IGhlbHBlcnMgZm9yIGZyYW1lYnVmZmVyIEkvTyBpbnN0ZWFkIG9mIERSTSdzDQo+PiBoZWxw
ZXJzLiBBcm1hZGEgZG9lcyBub3QgdXNlIGRhbWFnZSBoYW5kbGluZywgc28gRFJNJ3MgZmJk
ZXYgaGVscGVycw0KPj4gYXJlIG1lcmUgd3JhcHBlcnMgYXJvdW5kIHRoZSBmYmRldiBjb2Rl
Lg0KPj4NCj4+IEJ5IHVzaW5nIGZiZGV2IGhlbHBlcnMgZGlyZWN0bHkgd2l0aGluIGVhY2gg
RFJNIGZiZGV2IGVtdWxhdGlvbiwNCj4+IHdlIGNhbiBldmVudHVhbGx5IHJlbW92ZSBEUk0n
cyB3cmFwcGVyIGZ1bmN0aW9ucyBlbnRpcmVseS4NCj4+DQo+PiB2MjoNCj4+IAkqIHVzZSBG
Ql9JT19IRUxQRVJTIG9wdGlvbg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBaaW1t
ZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPg0KPj4gQ2M6IFJ1c3NlbGwgS2luZyA8bGlu
dXhAYXJtbGludXgub3JnLnVrPg0KPj4gLS0tDQo+PiAgIGRyaXZlcnMvZ3B1L2RybS9hcm1h
ZGEvS2NvbmZpZyAgICAgICAgfCAxICsNCj4+ICAgZHJpdmVycy9ncHUvZHJtL2FybWFkYS9h
cm1hZGFfZmJkZXYuYyB8IDkgKysrKy0tLS0tDQo+PiAgIDIgZmlsZXMgY2hhbmdlZCwgNSBp
bnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vYXJtYWRhL0tjb25maWcgYi9kcml2ZXJzL2dwdS9kcm0vYXJtYWRhL0tj
b25maWcNCj4+IGluZGV4IGY1YzY2ZDg5YmE5OS4uNWFmYWRlMjVlMjE3IDEwMDY0NA0KPj4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2FybWFkYS9LY29uZmlnDQo+PiArKysgYi9kcml2ZXJz
L2dwdS9kcm0vYXJtYWRhL0tjb25maWcNCj4+IEBAIC0zLDYgKzMsNyBAQCBjb25maWcgRFJN
X0FSTUFEQQ0KPj4gICAJdHJpc3RhdGUgIkRSTSBzdXBwb3J0IGZvciBNYXJ2ZWxsIEFybWFk
YSBTb0NzIg0KPj4gICAJZGVwZW5kcyBvbiBEUk0gJiYgSEFWRV9DTEsgJiYgQVJNICYmIE1N
VQ0KPj4gICAJc2VsZWN0IERSTV9LTVNfSEVMUEVSDQo+PiArCXNlbGVjdCBGQl9JT19IRUxQ
RVJTIGlmIERSTV9GQkRFVl9FTVVMQVRJT04NCj4+ICAgCWhlbHANCj4+ICAgCSAgU3VwcG9y
dCB0aGUgIkxDRCIgY29udHJvbGxlcnMgZm91bmQgb24gdGhlIE1hcnZlbGwgQXJtYWRhIDUx
MA0KPj4gICAJICBkZXZpY2VzLiAgVGhlcmUgYXJlIHR3byBjb250cm9sbGVycyBvbiB0aGUg
ZGV2aWNlLCBlYWNoIGNvbnRyb2xsZXINCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vYXJtYWRhL2FybWFkYV9mYmRldi5jIGIvZHJpdmVycy9ncHUvZHJtL2FybWFkYS9hcm1h
ZGFfZmJkZXYuYw0KPj4gaW5kZXggMGE1ZmQxYWE4NmViLi42YzNiYmFmNTM1NjkgMTAwNjQ0
DQo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXJtYWRhL2FybWFkYV9mYmRldi5jDQo+PiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0vYXJtYWRhL2FybWFkYV9mYmRldi5jDQo+PiBAQCAtNSw2
ICs1LDcgQEANCj4+ICAgICovDQo+PiAgIA0KPj4gICAjaW5jbHVkZSA8bGludXgvZXJybm8u
aD4NCj4+ICsjaW5jbHVkZSA8bGludXgvZmIuaD4NCj4+ICAgI2luY2x1ZGUgPGxpbnV4L2tl
cm5lbC5oPg0KPj4gICAjaW5jbHVkZSA8bGludXgvbW9kdWxlLmg+DQo+PiAgIA0KPj4gQEAg
LTM0LDExICszNSw5IEBAIHN0YXRpYyB2b2lkIGFybWFkYV9mYmRldl9mYl9kZXN0cm95KHN0
cnVjdCBmYl9pbmZvICppbmZvKQ0KPj4gICBzdGF0aWMgY29uc3Qgc3RydWN0IGZiX29wcyBh
cm1hZGFfZmJfb3BzID0gew0KPj4gICAJLm93bmVyCQk9IFRISVNfTU9EVUxFLA0KPj4gICAJ
RFJNX0ZCX0hFTFBFUl9ERUZBVUxUX09QUywNCj4+IC0JLmZiX3JlYWQJPSBkcm1fZmJfaGVs
cGVyX2NmYl9yZWFkLA0KPj4gLQkuZmJfd3JpdGUJPSBkcm1fZmJfaGVscGVyX2NmYl93cml0
ZSwNCj4gSSBoYWQgZXhwZWN0ZWQgdG8gc2VlDQo+IC5mYl9yZWFkID0gZmJfaW9fcmVhZCwN
Cj4gDQo+IEJ1dCBtYXliZSB0aGlzIG9ubHkgdXNlZCB3aGVuIHVzaW5nIGRhbWFnZSBoYW5k
bGluZz8NCg0KZmJfaW9fcmVhZCgpIGFuZCBmYl9pb193cml0ZSgpIGFyZSB0aGUgZGVmYXVs
dCBpbXBsZW1lbnRhdGlvbnMuIFRoZXkgYXJlIA0KY2FsbGVkIHdoZW4gbm8gY2FsbGJhY2sg
aGFzIGJlZW4gc2V0LiAgQWxsIHRoZSBvdGhlciBmYmRldiBkcml2ZXJzIGxlYXZlIA0KdGhl
bSBvdXQsIHNvIEkga2VwdCB0aGlzIHBhdHRlcm4gZm9yIHRoZSBEUk0gc2lkZSBhcyB3ZWxs
Lg0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQo+IA0KPiBMaWtld2lzZSBmb3IgZHJtX2Zi
X2hlbHBlcl9jZmJfd3JpdGUuDQo+IA0KPiA/Pw0KPiANCj4+IC0JLmZiX2ZpbGxyZWN0CT0g
ZHJtX2ZiX2hlbHBlcl9jZmJfZmlsbHJlY3QsDQo+PiAtCS5mYl9jb3B5YXJlYQk9IGRybV9m
Yl9oZWxwZXJfY2ZiX2NvcHlhcmVhLA0KPj4gLQkuZmJfaW1hZ2VibGl0CT0gZHJtX2ZiX2hl
bHBlcl9jZmJfaW1hZ2VibGl0LA0KPj4gKwkuZmJfZmlsbHJlY3QJPSBjZmJfZmlsbHJlY3Qs
DQo+PiArCS5mYl9jb3B5YXJlYQk9IGNmYl9jb3B5YXJlYSwNCj4+ICsJLmZiX2ltYWdlYmxp
dAk9IGNmYl9pbWFnZWJsaXQsDQo+IA0KPiBUaGlzIHBhcnQgaXMgYXMgZXhwZWN0ZWQuDQo+
IA0KPiAJU2FtDQo+IA0KPj4gICAJLmZiX2Rlc3Ryb3kJPSBhcm1hZGFfZmJkZXZfZmJfZGVz
dHJveSwNCj4+ICAgfTsNCj4+ICAgDQo+PiAtLSANCj4+IDIuNDAuMQ0KDQotLSANClRob21h
cyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJl
IFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCkZyYW5rZW5zdHJhc3NlIDE0NiwgOTA0NjEgTnVl
cm5iZXJnLCBHZXJtYW55DQpHRjogSXZvIFRvdGV2LCBBbmRyZXcgTXllcnMsIEFuZHJldyBN
Y0RvbmFsZCwgQm91ZGllbiBNb2VybWFuDQpIUkIgMzY4MDkgKEFHIE51ZXJuYmVyZykNCg==


--------------x19kmCONrIOVY1mx13KTewaz--

--------------TF15ECY1lmCvOkLrbIq0MhSY
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmRjfzgFAwAAAAAACgkQlh/E3EQov+Bq
dg//T0j2i9jbhRq04m2fkfiIt0eqsth1P5X3bkq7j9vcF0WEoiRSH9KNs0ZoDcgGyPVG9WKKbg9H
/BJ4pBhHlw2H2TZjEvnnUDl7KXpXGwL789twD6P1ypBFXFm5zVuwjxcnnHxNEo5A0x8NzfqOnai0
b29/fs3AnpcOjJx2tbztSdlmOWGI9UfygHCOVQgM9mtqzXyC779NJjfu90vttEZy22RvfebXDl6A
2bdMz9fvtvq9oz/NT6NuKPNs7q2JnqdGcrjQlbJ8LnMZAs43mRAuLTuDQvCQ5uNTdcaHL0k5eA/p
eW1rfs84MkiFIHw4WJ94hnfRQIIws0lt/RIbVEJLRNgc8RGP9LboMIP93K6+Y6rUMIrAw6IKnQAe
jbXXluwuEjwyuGPwMqQWohH/Xs6RokSdD467EROMkjqa6XJGRiBGk7CLSkRIUU/bmbdEjCCLlzaq
8P1gUsl7hzQaQoc72fROJoKHTEhhbNcYbXEuFL3SUflQaT+yWYRMSncco3+2+XMixJGNjhed7V1/
MVjX6z6dNXShnpZ211j0KV7z+qAnxnHdArBWSGb/6bXN5c7IhMXvt1Iq+Gbe4mx9GFdYjcEriyUe
Bj4O71YUHumZ9bl4YFWQumrLLT5IpT08/tLYCetynpz7mw7BNCdENjjCTNxq5XBHnhy0eLYxbZY5
g1c=
=6j7r
-----END PGP SIGNATURE-----

--------------TF15ECY1lmCvOkLrbIq0MhSY--
