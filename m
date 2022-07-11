Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 78C1756FFBA
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 13:11:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DC1C14ADF7;
	Mon, 11 Jul 2022 11:11:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4316D14ADF6
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 11:11:16 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E6B9D22100;
 Mon, 11 Jul 2022 11:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1657537874; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3Eg9VvSyO87wZPs1qkZ8b/C0Ac9yQ3/4PAshHpiUcDA=;
 b=lVJB6KWFAAHNodIxGAw1AeZ/+BEhUPjnjCBTz6Lgpasfu+ZRfzeph8AuuVMEUtmmpOOnGa
 vzzEaDLw/QOsPO/6BAA6S62FVfHi1OEIkiZXOqD/SXByy9HOUbb5WXX0aFOPoXXkLWaqQI
 bBeiuC5Z9+i6K+snZRT19EZDSclrk5c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1657537874;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3Eg9VvSyO87wZPs1qkZ8b/C0Ac9yQ3/4PAshHpiUcDA=;
 b=fBRkxFTpHXdJWHBMzkRC9GhGsjozzJpFzvkqoeuaHX7J2GXB7FUr8D3GxtnjPTGWd4una+
 Rs6ZFacKUuLhCsCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A72F713322;
 Mon, 11 Jul 2022 11:11:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id KQfIJ1IFzGIdbAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 11 Jul 2022 11:11:14 +0000
Message-ID: <43d75dce-988a-0a95-cb0a-0d0a7c81ca63@suse.de>
Date: Mon, 11 Jul 2022 13:11:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 4/5] drm/modes: Add support for driver-specific named modes
Content-Language: en-US
To: Maxime Ripard <maxime@cerno.tech>
References: <cover.1657301107.git.geert@linux-m68k.org>
 <68923c8a129b6c2a70b570103679a1cf7876bbc2.1657301107.git.geert@linux-m68k.org>
 <ef2aada2-96e4-c2e4-645f-39bc9094e93a@suse.de>
 <20220711093513.wilv6e6aqcuyg52w@houat>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220711093513.wilv6e6aqcuyg52w@houat>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------fZLfiuohfoRNFbm4jbfVP1DO"
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
Cc: linux-fbdev@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-m68k@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------fZLfiuohfoRNFbm4jbfVP1DO
Content-Type: multipart/mixed; boundary="------------z0gLTlSOVm5fZzU01TQrIgZw";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Maxime Ripard <maxime@cerno.tech>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Hans de Goede <hdegoede@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-m68k@vger.kernel.org,
 linux-kernel@vger.kernel.org
Message-ID: <43d75dce-988a-0a95-cb0a-0d0a7c81ca63@suse.de>
Subject: Re: [PATCH 4/5] drm/modes: Add support for driver-specific named
 modes
References: <cover.1657301107.git.geert@linux-m68k.org>
 <68923c8a129b6c2a70b570103679a1cf7876bbc2.1657301107.git.geert@linux-m68k.org>
 <ef2aada2-96e4-c2e4-645f-39bc9094e93a@suse.de>
 <20220711093513.wilv6e6aqcuyg52w@houat>
In-Reply-To: <20220711093513.wilv6e6aqcuyg52w@houat>

--------------z0gLTlSOVm5fZzU01TQrIgZw
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgTWF4aW1lDQoNCkFtIDExLjA3LjIyIHVtIDExOjM1IHNjaHJpZWIgTWF4aW1lIFJpcGFy
ZDoNCj4gSGkgVGhvbWFzLA0KPiANCj4gT24gTW9uLCBKdWwgMTEsIDIwMjIgYXQgMTE6MDM6
MzhBTSArMDIwMCwgVGhvbWFzIFppbW1lcm1hbm4gd3JvdGU6DQo+PiBBbSAwOC4wNy4yMiB1
bSAyMDoyMSBzY2hyaWViIEdlZXJ0IFV5dHRlcmhvZXZlbjoNCj4+PiBUaGUgbW9kZSBwYXJz
aW5nIGNvZGUgcmVjb2duaXplcyBuYW1lZCBtb2RlcyBvbmx5IGlmIHRoZXkgYXJlIGV4cGxp
Y2l0bHkNCj4+PiBsaXN0ZWQgaW4gdGhlIGludGVybmFsIHdoaXRlbGlzdCwgd2hpY2ggaXMg
Y3VycmVudGx5IGxpbWl0ZWQgdG8gIk5UU0MiDQo+Pj4gYW5kICJQQUwiLg0KPj4+DQo+Pj4g
UHJvdmlkZSBhIG1lY2hhbmlzbSBmb3IgZHJpdmVycyB0byBvdmVycmlkZSB0aGlzIGxpc3Qg
dG8gc3VwcG9ydCBjdXN0b20NCj4+PiBtb2RlIG5hbWVzLg0KPj4+DQo+Pj4gSWRlYWxseSwg
dGhpcyBsaXN0IHNob3VsZCBqdXN0IGNvbWUgZnJvbSB0aGUgZHJpdmVyJ3MgYWN0dWFsIGxp
c3Qgb2YNCj4+PiBtb2RlcywgYnV0IGNvbm5lY3Rvci0+cHJvYmVkX21vZGVzIGlzIG5vdCB5
ZXQgcG9wdWxhdGVkIGF0IHRoZSB0aW1lIG9mDQo+Pj4gcGFyc2luZy4NCj4+DQo+PiBJJ3Zl
IGxvb2tlZCBmb3IgY29kZSB0aGF0IHVzZXMgdGhlc2UgbmFtZXMsIGNvdWxkbid0IGZpbmQg
YW55LiBIb3cgaXMgdGhpcw0KPj4gYmVpbmcgdXNlZCBpbiBwcmFjdGljZT8gRm9yIGV4YW1w
bGUsIGlmIEkgc2F5ICJQQUwiIG9uIHRoZSBjb21tYW5kIGxpbmUsIGlzDQo+PiB0aGVyZSBE
Uk0gY29kZSB0aGF0IGZpbGxzIGluIHRoZSBQQUwgbW9kZSBwYXJhbWV0ZXJzPw0KPiANCj4g
V2UgaGF2ZSBzb21lIGNvZGUgdG8gZGVhbCB3aXRoIHRoaXMgaW4gc3VuNGk6DQo+IGh0dHBz
Oi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L2xhdGVzdC9zb3VyY2UvZHJpdmVycy9ncHUv
ZHJtL3N1bjRpL3N1bjRpX3R2LmMjTDI5Mg0KPiANCj4gSXQncyBhIGJpdCBvZmYgdG9waWMs
IGJ1dCBmb3IgVFYgc3RhbmRhcmRzLCBJJ20gc3RpbGwgbm90IHN1cmUgd2hhdCB0aGUNCj4g
YmVzdCBjb3Vyc2Ugb2YgYWN0aW9uIGlzLiBUaGVyZSdzIHNldmVyYWwgaW50ZXJhY3Rpb25z
IHRoYXQgbWFrZSB0aGlzIGENCj4gYml0IHRyb3VibGVzb21lOg0KPiANCj4gICAgKiBTb21l
IFRWIHN0YW5kYXJkcyBkaWZmZXIgYnkgdGhlaXIgbW9kZSAoaWUsIFBBTCB2cyBOU1RDKSwg
YnV0IHNvbWUNCj4gICAgICBvdGhlciBkaWZmZXIgYnkgcGFyYW1ldGVycyB0aGF0IGFyZSBu
b3QgcGFydCBvZiBkcm1fZGlzcGxheV9tb2RlDQo+ICAgICAgKE5UU0MgdnMgTlNUQy1KIHdo
ZXJlIHRoZSBvbmx5IGRpZmZlcmVuY2UgaXMgdGhlIGJsYWNrIGFuZCBibGFua2luZw0KPiAg
ICAgIHNpZ25hbCBsZXZlbHMgZm9yIGV4YW1wbGUpLg0KPiANCj4gICAgKiBUaGUgbW9kZSBu
YW1lcyBhbGxvdyB0byBwcm92aWRlIGEgZmFpcmx5IGNvbnZlbmllbnQgd2F5IHRvIGFkZCB0
aGF0DQo+ICAgICAgZXh0cmEgaW5mb3JtYXRpb24sIGJ1dCB0aGUgdXNlcnNwYWNlIGlzIGZy
ZWUgdG8gY3JlYXRlIGl0cyBvd24gbW9kZQ0KPiAgICAgIGFuZCBtaWdodCBvbWl0IHRoZSBt
b2RlIG5hbWUgZW50aXJlbHkuDQo+IA0KPiBTbyBpbiB0aGUgY29kZSBhYm92ZSwgaWYgdGhl
IG5hbWUgaGFzIGJlZW4gcHJlc2VydmVkIHdlIG1hdGNoIGJ5IG5hbWUsDQo+IGJ1dCB3ZSBm
YWxsIGJhY2sgdG8gbWF0Y2hpbmcgYnkgbW9kZSBpZiBpdCBoYXNuJ3QgYmVlbiwgd2hpY2gg
aW4gdGhpcw0KPiBjYXNlIG1lYW5zIHRoYXQgd2UgaGF2ZSBubyB3YXkgdG8gZGlmZmVyZW50
aWF0ZSBiZXR3ZWVuIE5UU0MsIE5UU0MtSiwNCj4gUEFMLU0gaW4gdGhpcyBjYXNlLg0KPiAN
Cj4gV2UgaGF2ZSBzb21lIHBhdGNoZXMgZG93bnN0cmVhbSBmb3IgdGhlIFJhc3BiZXJyeVBp
IHRoYXQgaGFzIHRoZSBUVg0KPiBzdGFuZGFyZCBhcyBhIHByb3BlcnR5LiBUaGVyZSdzIGEg
ZmV3IGV4dHJhIGxvZ2ljIHJlcXVpcmVkIGZvciB0aGUNCj4gdXNlcnNwYWNlIChsaWtlIHNl
dHRpbmcgdGhlIFBBTCBwcm9wZXJ0eSwgd2l0aCB0aGUgTlRTQyBtb2RlKSBzbyBJJ20gbm90
DQo+IHN1cmUgaXQncyBwcmVmZXJhYmxlLg0KPiANCj4gT3Igd2UgY291bGQgZG8gc29tZXRo
aW5nIGxpa2UgYSBwcm9wZXJ0eSB0byB0cnkgdGhhdCBzdGFuZGFyZCwgYW5kDQo+IGFub3Ro
ZXIgdGhhdCByZXBvcnRzIHRoZSBvbmUgd2UgYWN0dWFsbHkgY2hvc2UuDQo+IA0KPj4gQW5k
IGFub3RoZXIgcXVlc3Rpb24gSSBoYXZlIGlzIHdoZXRoZXIgdGhpcyB3aGl0ZWxpc3QgYmVs
b25ncyBpbnRvIHRoZQ0KPj4gZHJpdmVyIGF0IGFsbC4gU3RhbmRhcmQgbW9kZXMgZXhpc3Qg
aW5kZXBlbmRlbnQgZnJvbSBkcml2ZXJzIG9yIGhhcmR3YXJlLg0KPj4gU2hvdWxkbid0IHRo
ZXJlIHNpbXBseSBiZSBhIGdsb2JhbCBsaXN0IG9mIGFsbCBwb3NzaWJsZSBtb2RlIG5hbWVz
PyBEcml2ZXJzDQo+PiB3b3VsZCBmaWx0ZXIgb3V0IHRoZSB1bnN1cHBvcnRlZCBtb2RlcyBh
bnl3YXkuDQo+IA0KPiBXZSBzaG91bGQgdG90YWxseSBkbyBzb21ldGhpbmcgbGlrZSB0aGF0
LCB5ZWFoDQoNClRoYXQgc3VuIGNvZGUgYWxyZWFkeSBsb29rcyBsaWtlIHNvbWV0aWhuZyB0
aGUgRFJNIGNvcmUvaGVscGVycyBzaG91bGQgDQpiZSBkb2luZy4gQW5kIGlmIHdlIHdhbnQg
dG8gc3VwcG9ydCBuYW1lZCBtb2RlcyB3ZWxsLCB0aGVyZSdzIGEgbG9uZyANCmxpc3Qgb2Yg
bW9kZXMgaW4gV2lraXBlZGlhLg0KDQogDQpodHRwczovL2VuLndpa2lwZWRpYS5vcmcvd2lr
aS9WaWRlb19HcmFwaGljc19BcnJheSMvbWVkaWEvRmlsZTpWZWN0b3JfVmlkZW9fU3RhbmRh
cmRzMi5zdmcNCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KPiANCj4gTWF4aW1lDQoNCi0t
IA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0Ug
U29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkg
TsO8cm5iZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOk
ZnRzZsO8aHJlcjogSXZvIFRvdGV2DQo=

--------------z0gLTlSOVm5fZzU01TQrIgZw--

--------------fZLfiuohfoRNFbm4jbfVP1DO
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmLMBVIFAwAAAAAACgkQlh/E3EQov+Bq
mBAAz1d3IjNc8P8JDQAgAZE+ZRfqW1vHZ8fjlrS0Qbgw//N14aTNAIIn/5vCFcSKLxyfZwJDkFft
WjH6nsqwTr5wx04At3JVALuhgpl0VnKSYUnQDQMsjV4MXb8pB8jK/B/rJt1YnpsreqmMdw7xNZlH
RIRyShuQMwCUfTdoLVArNg95Kg78aWbaOekpcS959EW0V6jL2cQr0bH4Zoik57Coptt004IxF0Vo
0OPHjf/If1fTHMnY+Ex735QILJEPw+Ns2EdMINSFJZFIMJAoAnqZxqMrjypR8jPusvvifDS9E++D
Jtkdgl3UPivH9R1WFQhSzCf/nkrReAUrVuJDTqiz5wWc+g+gIJi12LNR8EeiQ2lQG/zamKDc4Nug
jJRkVpxKC0v9F78rNQv8BugU3sbMiE3jKOIbIVt38r9S9IFOUwHiVDA3Ii5yVp38l7p5oZ/NmodW
k6u02K9LktxqI3WkRgO70JaQNtVJt0ArhPFBEuoolU+s7do37YcBu1jk1MUmC/9FWcQ1b8zXaIYS
LKY8K5vYpRGO4zgAA83efTnAnFt6cEwCQXEBf6yE7TQTJzHVf0Ojx2iaTCvFHAUTQb5bpr2R3W3c
WKLWGuGI0AjDNT2Nm5r1zLiFz6F/yKpJXd2QWVWpaz64LaWnlLlmSXDxlxZFNeUcbIk04ShfmCkn
48c=
=jIZf
-----END PGP SIGNATURE-----

--------------fZLfiuohfoRNFbm4jbfVP1DO--
