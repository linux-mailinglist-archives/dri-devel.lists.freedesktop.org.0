Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FDF06D456E
	for <lists+dri-devel@lfdr.de>; Mon,  3 Apr 2023 15:14:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17DF810E0F0;
	Mon,  3 Apr 2023 13:14:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDB0E10E155
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Apr 2023 13:14:24 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 56C7421C60;
 Mon,  3 Apr 2023 13:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1680527663; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dK1mW2U1fuKTTzQCJrkI6ES5a1IUIgGEmxklFFyWTE8=;
 b=KWInf08Va6zfedTNfa2B4/yu/bfV4f/MG5RGWNapg9lqltc3pCtNIcVsqQC7xtbJ1IMQQY
 oSwCWtO7CWiKijyLFfaN8p/ZFXrwxDOv+5cULgqPEQGXeHgPBnLBqHYc0tAbuIWkgwfucX
 5vptceokG1Ll9f7FyXZnL56YwmEfNH4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1680527663;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dK1mW2U1fuKTTzQCJrkI6ES5a1IUIgGEmxklFFyWTE8=;
 b=K0cm9tTGaZz6m26c5a4kMbBm0FeSYJTA+cj1iLw5Fh7jl4eJbfhmJG8aWVro3BFLx4iuJR
 5s3I7JAjDk02CYAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2AAD81331A;
 Mon,  3 Apr 2023 13:14:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id vf5ZCS/RKmSlZwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 03 Apr 2023 13:14:23 +0000
Message-ID: <01484ce3-2366-5000-3aa6-727448145f36@suse.de>
Date: Mon, 3 Apr 2023 15:14:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 0/5] drm: shmobile: Fixes and enhancements
Content-Language: en-US
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <cover.1680273039.git.geert+renesas@glider.be>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <cover.1680273039.git.geert+renesas@glider.be>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------dMBPv2tUDcPke7H09l1ZZyn1"
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
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------dMBPv2tUDcPke7H09l1ZZyn1
Content-Type: multipart/mixed; boundary="------------DhMD5KGvcChrberQ5M70FzgZ";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Message-ID: <01484ce3-2366-5000-3aa6-727448145f36@suse.de>
Subject: Re: [PATCH 0/5] drm: shmobile: Fixes and enhancements
References: <cover.1680273039.git.geert+renesas@glider.be>
In-Reply-To: <cover.1680273039.git.geert+renesas@glider.be>

--------------DhMD5KGvcChrberQ5M70FzgZ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgR2VlcnQNCg0KQW0gMzEuMDMuMjMgdW0gMTY6NDggc2NocmllYiBHZWVydCBVeXR0ZXJo
b2V2ZW46DQo+IAlIaSBhbGwsDQo+IA0KPiBDdXJyZW50bHksIHRoZXJlIGFyZSB0d28gZHJp
dmVycyBmb3IgdGhlIExDRCBjb250cm9sbGVyIG9uIFJlbmVzYXMNCj4gU3VwZXJILWJhc2Vk
IGFuZCBBUk0tYmFzZWQgU0gtTW9iaWxlIGFuZCBSLU1vYmlsZSBTb0NzOg0KPiAgICAxLiBz
aF9tb2JpbGVfbGNkY2ZiLCB1c2luZyB0aGUgZmJkZXYgZnJhbWV3b3JrLA0KPiAgICAyLiBz
aG1vYl9kcm0sIHVzaW5nIHRoZSBEUk0gZnJhbWV3b3JrLg0KPiBIb3dldmVyLCBvbmx5IHRo
ZSBmb3JtZXIgZHJpdmVyIGNhbiBiZSB1c2VkLCBhcyBhbGwgcGxhdGZvcm0gc3VwcG9ydA0K
PiBpbnRlZ3JhdGVzIHRoZSBmb3JtZXIuICBOb25lIG9mIHRoZXNlIGRyaXZlcnMgc3VwcG9y
dCBEVC1iYXNlZCBzeXN0ZW1zLg0KPiANCj4gVGhpcyBwYXRjaCBzZXJpZXMgaXMgYSBmaXJz
dCBzdGVwIHRvIGVuYWJsZSB0aGUgU0gtTW9iaWxlIERSTSBkcml2ZXIgZm9yDQo+IFJlbmVz
YXMgQVJNLWJhc2VkIFNILU1vYmlsZSBhbmQgUi1Nb2JpbGUgU29Dcy4gIFRoZSBuZXh0IHN0
ZXAgcGxhbm5lZCBpcw0KPiB0byBhZGQgRFQgc3VwcG9ydC4NCj4gDQo+IFRoaXMgaGFzIGJl
ZW4gdGVzdGVkIG9uIHRoZSBSLU1vYmlsZSBBMS1iYXNlZCBBdG1hcmsgVGVjaG5vDQo+IEFy
bWFkaWxsby04MDAtRVZBIGRldmVsb3BtZW50IGJvYXJkLCB1c2luZyBhIHRlbXBvcmFyeQ0K
PiBwbGF0Zm9ybS1lbmFibGVtZW50IHBhdGNoWzFdLg0KDQpTaW5jZSB5b3UgaGF2ZSB0aGUg
aGFyZHdhcmUgZm9yIHNobW9iaWxlLCB3b3VsZCB5b3UgYmUgYWJsZSB0byB0ZXN0IA0KcGF0
Y2hlcyBvY2Nhc2lvbmFsbHk/DQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCj4gDQo+IFRo
YW5rcyBmb3IgeW91ciBjb21tZW50cyENCj4gDQo+IFsxXSBodHRwczovL2xvcmUua2VybmVs
Lm9yZy9yL2MwM2Q0ZWRiZDY1MDgzNmJmNmE5NjUwNGRmODIzMzhlYzZkODAwZmYuMTY4MDI3
Mjk4MC5naXQuZ2VlcnQrcmVuZXNhc0BnbGlkZXIuYmUNCj4gDQo+IEdlZXJ0IFV5dHRlcmhv
ZXZlbiAoNSk6DQo+ICAgIGRybTogc2htb2JpbGU6IFVzZSAlcDRjYyB0byBwcmludCBmb3Vy
Y2MgY29kZXMNCj4gICAgZHJtOiBzaG1vYmlsZTogQWRkIHN1cHBvcnQgZm9yIERSTV9GT1JN
QVRfWFJHQjg4ODgNCj4gICAgZHJtOiBzaG1vYmlsZTogU3dpdGNoIHRvIGRybV9jcnRjX2lu
aXRfd2l0aF9wbGFuZXMoKQ0KPiAgICBkcm06IHNobW9iaWxlOiBBZGQgbWlzc2luZyBjYWxs
IHRvIGRybV9mYmRldl9nZW5lcmljX3NldHVwKCkNCj4gICAgZHJtOiBzaG1vYmlsZTogTWFr
ZSBEUk1fU0hNT0JJTEUgdmlzaWJsZSBvbiBSZW5lc2FzIFNvQyBwbGF0Zm9ybXMNCj4gDQo+
ICAgZHJpdmVycy9ncHUvZHJtL3NobW9iaWxlL0tjb25maWcgICAgICAgICAgIHwgIDIgKy0N
Cj4gICBkcml2ZXJzL2dwdS9kcm0vc2htb2JpbGUvc2htb2JfZHJtX2NydGMuYyAgfCAzNSAr
KysrKysrKysrKysrKysrKysrLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL3NobW9iaWxlL3No
bW9iX2RybV9kcnYuYyAgIHwgIDMgKysNCj4gICBkcml2ZXJzL2dwdS9kcm0vc2htb2JpbGUv
c2htb2JfZHJtX2ttcy5jICAgfCAgOSArKysrLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vc2ht
b2JpbGUvc2htb2JfZHJtX3BsYW5lLmMgfCAgNSArKysrDQo+ICAgNSBmaWxlcyBjaGFuZ2Vk
LCA0NyBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQ0KPiANCg0KLS0gDQpUaG9tYXMg
WmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBT
b2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcs
IEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVy
OiBJdm8gVG90ZXYNCg==

--------------DhMD5KGvcChrberQ5M70FzgZ--

--------------dMBPv2tUDcPke7H09l1ZZyn1
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmQq0S4FAwAAAAAACgkQlh/E3EQov+Ar
0RAAuSftliJH1q788Q4KH7J3xudbChbLQU9Cblw3x7T/530doeLBEtt0+kmwuscVPvCfdW6OkWAu
u6EICfmksZY63lj/1Wo/OenGOdj8oaR8j0dNrBRFU07KkpLCh016becua2+Oquol3XVoSIQLoIup
GdPDBgtPXlktW0/Sjc+n+zP2fYh4xF7VwpnD+IufcYqUjvGunQiE8exZMCrUBO2pdjuGYJnxW8pX
OZx0bxBEr8e7MhhljLf1T4y7JAchA6jY9QVP2UuEAR6Ixmk2rAlgwBFYQI8TJVaYsX2cEgvzW7/y
X3iAJ7f9yeXf+sBD9LHM+f3uiL9jmGU94bw9hSliA61Yb9kdLBKfuCzxnylT9jKFRQ+DSRt+VnPO
hu3Ffp5u31SmQ4Zn0lLV+1ai+YxHntrz3LUj+fUDt6Dbh9nJK1Zbnxed14mcQiHBNVH/5HWZxrAp
XK8lgkImUqVxmoL2h1M9JdJJhXIjWP7uoYmmVGhOp9f5xoog2kU/UXzIzscYHVZajduBygyst5Pb
vsl+hA7DFmJBhX8iFhvQDBr0A40Aj9B/6TjJUEedOpKLibaWCz6D897DWmkkJsFYferiez6cbNkW
XwSuoCElZj8HzMP8Ko5CL7WZnUSzXiWd9rph4VGXPOZy0+/sfkrBnpvOMYfCupHkNJ0t7S7juQCk
QLY=
=OGTE
-----END PGP SIGNATURE-----

--------------dMBPv2tUDcPke7H09l1ZZyn1--
