Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 625B57C6760
	for <lists+dri-devel@lfdr.de>; Thu, 12 Oct 2023 10:07:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C731D10E439;
	Thu, 12 Oct 2023 08:07:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C84D810E439
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Oct 2023 08:07:44 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 755CC1F86C;
 Thu, 12 Oct 2023 08:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1697098063; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=z6bpMU4LfbUnnB1uyNm7MXyFl42BBRVstBWye8hVbXY=;
 b=QMs8lDswSsRPSR7+1i9wHI/OF9SuSnntqhIkw935sEEZcVN+EqRHrZ6IhdZ3jLWmCGEA2d
 7ZgYcUJL9L9T/cPt3PVIcWsYHfUFhQ3hVGh7coL87uZXGkaDwLDAl+5PSZNWccHzc4nhPf
 URmdweHPRPKyqjx9iVtPRF+YdBtkSs4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1697098063;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=z6bpMU4LfbUnnB1uyNm7MXyFl42BBRVstBWye8hVbXY=;
 b=+gl2KLUgNhOMiCmk783QAxmEQbBd0XbbfLrHefMXMqvcuoj8Y5OSSyLhI3PP/L2I38kebX
 d3aznzzbhLQbpvBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5AC5B139F9;
 Thu, 12 Oct 2023 08:07:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 3ks6FU+pJ2W6QQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 12 Oct 2023 08:07:43 +0000
Message-ID: <3e847355-f8c2-4dcf-837d-95fb35f866b3@suse.de>
Date: Thu, 12 Oct 2023 10:07:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] drm/tiny: correctly print `struct resource *` on error
Content-Language: en-US
To: Joey Gouly <joey.gouly@arm.com>, dri-devel@lists.freedesktop.org
References: <20231010174652.2439513-1-joey.gouly@arm.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Autocrypt: addr=tzimmermann@suse.de; keydata=
 xsBNBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAHNJ1Rob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPsLAjgQTAQgAOAIb
 AwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftODH
 AAoJEGgNwR1TC3ojx1wH/0hKGWugiqDgLNXLRD/4TfHBEKmxIrmfu9Z5t7vwUKfwhFL6hqvo
 lXPJJKQpQ2z8+X2vZm/slsLn7J1yjrOsoJhKABDi+3QWWSGkaGwRJAdPVVyJMfJRNNNIKwVb
 U6B1BkX2XDKDGffF4TxlOpSQzdtNI/9gleOoUA8+jy8knnDYzjBNOZqLG2FuTdicBXblz0Mf
 vg41gd9kCwYXDnD91rJU8tzylXv03E75NCaTxTM+FBXPmsAVYQ4GYhhgFt8S2UWMoaaABLDe
 7l5FdnLdDEcbmd8uLU2CaG4W2cLrUaI4jz2XbkcPQkqTQ3EB67hYkjiEE6Zy3ggOitiQGcqp
 j//OwE0EWznS4AEIAMYmP4M/V+T5RY5at/g7rUdNsLhWv1APYrh9RQefODYHrNRHUE9eosYb
 T6XMryR9hT8XlGOYRwKWwiQBoWSDiTMo/Xi29jUnn4BXfI2px2DTXwc22LKtLAgTRjP+qbU6
 3Y0xnQN29UGDbYgyyK51DW3H0If2a3JNsheAAK+Xc9baj0LGIc8T9uiEWHBnCH+RdhgATnWW
 GKdDegUR5BkDfDg5O/FISymJBHx2Dyoklv5g4BzkgqTqwmaYzsl8UxZKvbaxq0zbehDda8lv
 hFXodNFMAgTLJlLuDYOGLK2AwbrS3Sp0AEbkpdJBb44qVlGm5bApZouHeJ/+n+7r12+lqdsA
 EQEAAcLAdgQYAQgAIAIbDBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftOH6AAoJEGgNwR1T
 C3ojVSkIALpAPkIJPQoURPb1VWjh34l0HlglmYHvZszJWTXYwavHR8+k6Baa6H7ufXNQtThR
 yIxJrQLW6rV5lm7TjhffEhxVCn37+cg0zZ3j7zIsSS0rx/aMwi6VhFJA5hfn3T0TtrijKP4A
 SAQO9xD1Zk9/61JWk8OysuIh7MXkl0fxbRKWE93XeQBhIJHQfnc+YBLprdnxR446Sh8Wn/2D
 Ya8cavuWf2zrB6cZurs048xe0UbSW5AOSo4V9M0jzYI4nZqTmPxYyXbm30Kvmz0rYVRaitYJ
 4kyYYMhuULvrJDMjZRvaNe52tkKAvMevcGdt38H4KSVXAylqyQOW5zvPc4/sq9c=
In-Reply-To: <20231010174652.2439513-1-joey.gouly@arm.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------LZx3nzfJUvq3dwFEM5R8qSJx"
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
Cc: javierm@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------LZx3nzfJUvq3dwFEM5R8qSJx
Content-Type: multipart/mixed; boundary="------------ML85ErrWY0JtiKz4RXOdquIb";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Joey Gouly <joey.gouly@arm.com>, dri-devel@lists.freedesktop.org
Cc: javierm@redhat.com
Message-ID: <3e847355-f8c2-4dcf-837d-95fb35f866b3@suse.de>
Subject: Re: [PATCH v1] drm/tiny: correctly print `struct resource *` on error
References: <20231010174652.2439513-1-joey.gouly@arm.com>
In-Reply-To: <20231010174652.2439513-1-joey.gouly@arm.com>

--------------ML85ErrWY0JtiKz4RXOdquIb
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTAuMTAuMjMgdW0gMTk6NDYgc2NocmllYiBKb2V5IEdvdWx5Og0KPiBUaGUg
YHJlc2AgdmFyaWFibGUgaXMgYWxyZWFkeSBhIGBzdHJ1Y3QgcmVzb3VyY2UgKmAsIGRvbid0
IHRha2UgdGhlIGFkZHJlc3Mgb2YgaXQuDQo+IA0KPiBGaXhlcyBpbmNvcnJlY3Qgb3V0cHV0
Og0KPiANCj4gCXNpbXBsZS1mcmFtZWJ1ZmZlciA5ZTIwZGMwMDAuZnJhbWVidWZmZXI6IFtk
cm1dICpFUlJPUiogY291bGQgbm90IGFjcXVpcmUgbWVtb3J5IHJhbmdlIFs/Pz8gMHhmZmZm
NGJlODhhMzg3ZDAwLTB4ZmZmZmZlZmZmZGUwYTI0MCBmbGFncyAweDBdOiAtMTYNCj4gDQo+
IFRvIGJlIGNvcnJlY3Q6DQo+IA0KPiAJc2ltcGxlLWZyYW1lYnVmZmVyIDllMjBkYzAwMC5m
cmFtZWJ1ZmZlcjogW2RybV0gKkVSUk9SKiBjb3VsZCBub3QgYWNxdWlyZSBtZW1vcnkgcmFu
Z2UgW21lbSAweDllMjBkYzAwMC0weDllMzA3YmZmZiBmbGFncyAweDIwMF06IC0xNg0KPiAN
Cj4gU2lnbmVkLW9mZi1ieTogSm9leSBHb3VseSA8am9leS5nb3VseUBhcm0uY29tPg0KPiBD
YzogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+DQo+IENjOiBKYXZp
ZXIgTWFydGluZXogQ2FuaWxsYXMgPGphdmllcm1AcmVkaGF0LmNvbT4NCg0KSXQncyBhIGJ1
ZyBmaXguIEknbSBnb2luZyB0byBtZXJnZSB0aGlzIHBhdGNoIGludG8gZHJtLW1pc2MtZml4
ZXMgd2l0aCANCnRoZSBmb2xsb3dpbmcgYWRkaXRpb25hbCB0YWdzOg0KDQpGaXhlczogOWEx
MGM3ZTY1MTliICgiZHJtL3NpbXBsZWRybTogQWRkIHN1cHBvcnQgZm9yIHN5c3RlbSBtZW1v
cnkgDQpmcmFtZWJ1ZmZlcnMiKQ0KQ2M6IFRoaWVycnkgUmVkaW5nIDx0cmVkaW5nQG52aWRp
YS5jb20+DQpDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KQ2M6IDxzdGFi
bGVAdmdlci5rZXJuZWwub3JnPiAjIHY2LjMrDQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoN
Cj4gLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL3Rpbnkvc2ltcGxlZHJtLmMgfCAyICstDQo+
ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0K
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3Rpbnkvc2ltcGxlZHJtLmMgYi9kcml2
ZXJzL2dwdS9kcm0vdGlueS9zaW1wbGVkcm0uYw0KPiBpbmRleCBmZjg2YmExYWUxYjguLjhl
YTEyMGViODY3NCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3Rpbnkvc2ltcGxl
ZHJtLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3Rpbnkvc2ltcGxlZHJtLmMNCj4gQEAg
LTc0NSw3ICs3NDUsNyBAQCBzdGF0aWMgc3RydWN0IHNpbXBsZWRybV9kZXZpY2UgKnNpbXBs
ZWRybV9kZXZpY2VfY3JlYXRlKHN0cnVjdCBkcm1fZHJpdmVyICpkcnYsDQo+ICAgDQo+ICAg
CQlyZXQgPSBkZXZtX2FwZXJ0dXJlX2FjcXVpcmVfZnJvbV9maXJtd2FyZShkZXYsIHJlcy0+
c3RhcnQsIHJlc291cmNlX3NpemUocmVzKSk7DQo+ICAgCQlpZiAocmV0KSB7DQo+IC0JCQlk
cm1fZXJyKGRldiwgImNvdWxkIG5vdCBhY3F1aXJlIG1lbW9yeSByYW5nZSAlcHI6ICVkXG4i
LCAmcmVzLCByZXQpOw0KPiArCQkJZHJtX2VycihkZXYsICJjb3VsZCBub3QgYWNxdWlyZSBt
ZW1vcnkgcmFuZ2UgJXByOiAlZFxuIiwgcmVzLCByZXQpOw0KPiAgIAkJCXJldHVybiBFUlJf
UFRSKHJldCk7DQo+ICAgCQl9DQo+ICAgDQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdy
YXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1h
bnkgR21iSA0KRnJhbmtlbnN0cmFzc2UgMTQ2LCA5MDQ2MSBOdWVybmJlcmcsIEdlcm1hbnkN
CkdGOiBJdm8gVG90ZXYsIEFuZHJldyBNeWVycywgQW5kcmV3IE1jRG9uYWxkLCBCb3VkaWVu
IE1vZXJtYW4NCkhSQiAzNjgwOSAoQUcgTnVlcm5iZXJnKQ0K

--------------ML85ErrWY0JtiKz4RXOdquIb--

--------------LZx3nzfJUvq3dwFEM5R8qSJx
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmUnqU4FAwAAAAAACgkQlh/E3EQov+BP
HQ//VCqE7XlASsuT65JTkWa1gF2SlvqHblnEYez+r51c51xZA2VH8hD3igiLDV4XmavPZDkpQARp
DVppxb+xK94ZglaGT3WzmaH3P6tpdRnrJ7kWEVzh77VWLEtfkqCdNaejKmEdFs/renq2YR/DXf2W
vAYXW0l5TZaVS5MB310umNNrFbKZK7eRDA2p8cFxuAtN07FP+4zrC45lktLcq43oAJSkEOce1UWo
8orBT22fZ1Gz2w5ZNhq+YXoIshoiPbUjgaeS5mxpNyFY94BZM2/ABRY5QkrgyC+e63ueOoHR8h/Q
fCXfN3NgkaOa7V93UR19lMSTwu7lk3RVaDnigcrIqv9E+Myn30qif458vqa8zadYV2PXumiw3BgL
E3TGOsXSeEMN+p11/FBH4u67MXcT1aARzXlmGM6A9O3eye740L1W1PtIRXcKPkC17F5mQzxAQaEO
LSDdya7VqIZ696BS3JKz1Y8Ui8r2BiGUPX5jkTUKbshKE6eAY1H6n6dMBCXR0DUw4QHh/WUgN+0J
GwQOMmLxS6k1PkIj5Vm+9wpH3kF4i1qkk4moz2UkGwqcLLR2q4kWDv9injzO6wH5bdc7uS5JKFuU
8IE9qQLm5a7AeCYmP1W30vRVzKudWzgDjrpKNXWR+R8kj1THNCj+jcWxiE8lggWDzIEHm6ZXSSGF
1Mc=
=/xff
-----END PGP SIGNATURE-----

--------------LZx3nzfJUvq3dwFEM5R8qSJx--
