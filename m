Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 76CEC62F8E4
	for <lists+dri-devel@lfdr.de>; Fri, 18 Nov 2022 16:08:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDFD410E763;
	Fri, 18 Nov 2022 15:08:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3DDA10E763
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Nov 2022 15:08:24 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A4AF722AD0;
 Fri, 18 Nov 2022 15:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1668784103; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BtYKt3GG575eASPG0duyOJpXLAXhE7Tkzc7oQETJbeY=;
 b=0GXG4IMRXjk3WHprwN8NBwSGazifhLQzaDYCYuoBNZAdS0mh1D3ZNZWEEgXnCMDWVzMT8U
 emrv+3bPrtR7jgAyJy+FN+qJN6IKGuDwGoCd2nBkklhwpoFe3ITFXyg0FeiJAm/ZXFhD1Z
 Beg5aQKCrhNjaWCpww2ppjhyKKldaZU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1668784103;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BtYKt3GG575eASPG0duyOJpXLAXhE7Tkzc7oQETJbeY=;
 b=S/UdCmNR6vBz3lZelXSC06LdAyIJ6aaL/HLqD2UpJg1QHguR1GsO/mdb++WGO3PIvkkDBM
 IpUMLXTu7rwxM5Dg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7785713A66;
 Fri, 18 Nov 2022 15:08:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id pQoYHOefd2MPXgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 18 Nov 2022 15:08:23 +0000
Message-ID: <7018f094-e1f8-d82d-f4b2-b1ae833d1c47@suse.de>
Date: Fri, 18 Nov 2022 16:08:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3 7/8] drm/simpledrm: Support the XB24/AB24 format
Content-Language: en-US
To: Thierry Reding <thierry.reding@gmail.com>,
 David Airlie <airlied@redhat.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20221117184039.2291937-1-thierry.reding@gmail.com>
 <20221117184039.2291937-8-thierry.reding@gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20221117184039.2291937-8-thierry.reding@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------eNz17K4XSCBtUa2VtNrCyuU7"
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
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 Robin Murphy <robin.murphy@arm.com>, dri-devel@lists.freedesktop.org,
 Jon Hunter <jonathanh@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------eNz17K4XSCBtUa2VtNrCyuU7
Content-Type: multipart/mixed; boundary="------------iKOxZEwwUPyJhUHtsOSCdfNE";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Thierry Reding <thierry.reding@gmail.com>,
 David Airlie <airlied@redhat.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 Robin Murphy <robin.murphy@arm.com>, dri-devel@lists.freedesktop.org,
 Jon Hunter <jonathanh@nvidia.com>
Message-ID: <7018f094-e1f8-d82d-f4b2-b1ae833d1c47@suse.de>
Subject: Re: [PATCH v3 7/8] drm/simpledrm: Support the XB24/AB24 format
References: <20221117184039.2291937-1-thierry.reding@gmail.com>
 <20221117184039.2291937-8-thierry.reding@gmail.com>
In-Reply-To: <20221117184039.2291937-8-thierry.reding@gmail.com>

--------------iKOxZEwwUPyJhUHtsOSCdfNE
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTcuMTEuMjIgdW0gMTk6NDAgc2NocmllYiBUaGllcnJ5IFJlZGluZzoNCj4g
RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4NCj4gDQo+IEFkZCBY
QjI0IGFuZCBBQjI0IHRvIHRoZSBsaXN0IG9mIHN1cHBvcnRlZCBmb3JtYXRzLiBUaGUgZm9y
bWF0IGhlbHBlcnMNCj4gc3VwcG9ydCBjb252ZXJzaW9uIHRvIHRoZXNlIGZvcm1hdHMgYW5k
IHRoZXkgYXJlIGRvY3VtZW50ZWQgaW4gdGhlDQo+IHNpbXBsZS1mcmFtZWJ1ZmZlciBkZXZp
Y2UgdHJlZSBiaW5kaW5ncy4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFRoaWVycnkgUmVkaW5n
IDx0cmVkaW5nQG52aWRpYS5jb20+DQo+IC0tLQ0KPiBDaGFuZ2VzIGluIHYyOg0KPiAtIHRy
ZWF0IEFCMjQgYXMgWEIyNCBhbmQgc3VwcG9ydCBib3RoIGF0IHRoZSBzYW1lIHRpbWUNCj4g
DQo+ICAgZHJpdmVycy9ncHUvZHJtL3Rpbnkvc2ltcGxlZHJtLmMgICAgICAgfCAyICsrDQo+
ICAgaW5jbHVkZS9saW51eC9wbGF0Zm9ybV9kYXRhL3NpbXBsZWZiLmggfCAxICsNCj4gICAy
IGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS90aW55L3NpbXBsZWRybS5jIGIvZHJpdmVycy9ncHUvZHJtL3Rpbnkv
c2ltcGxlZHJtLmMNCj4gaW5kZXggN2YzOWJjNThkYTUyLi5iYTFjMjA1N2ZjNjUgMTAwNjQ0
DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS90aW55L3NpbXBsZWRybS5jDQo+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS90aW55L3NpbXBsZWRybS5jDQo+IEBAIC00ODMsNiArNDgzLDggQEAg
c3RhdGljIGludCBzaW1wbGVkcm1fZGV2aWNlX2luaXRfcmVndWxhdG9ycyhzdHJ1Y3Qgc2lt
cGxlZHJtX2RldmljZSAqc2RldikNCj4gICBzdGF0aWMgY29uc3QgdWludDMyX3Qgc2ltcGxl
ZHJtX3ByaW1hcnlfcGxhbmVfZm9ybWF0c1tdID0gew0KPiAgIAlEUk1fRk9STUFUX1hSR0I4
ODg4LA0KPiAgIAlEUk1fRk9STUFUX0FSR0I4ODg4LA0KPiArCURSTV9GT1JNQVRfWEJHUjg4
ODgsDQo+ICsJRFJNX0ZPUk1BVF9BQkdSODg4OCwNCg0KRG9lcyB0aGUgaGFyZHdhcmUgKnJl
YWxseSogc3VwcG9ydCBBQjQyIG9uIGl0cyBwcmltYXJ5IHBsYW5lPw0KDQpXZSByZWNlbnRs
eSBoYWQgYSBkaXNjdXNzaW9uIGFib3V0IHRoZSBleHBvcnRlZCBmb3JtYXRzIGFuZCB0aGUg
DQpjb25zZW5zdXMgaXMgdGhhdCB3ZSBvbmx5IHdhbnQgdGhlIGhhcmR3YXJlJ3MgbmF0aXZl
IGZvcm1hdHMgcGx1cyANClhSR0I4ODguIFRoYXQncyBub3QgaW1wbGVtZW50ZWQgeWV0IGlu
IHNpbXBsZWRybSwgYnV0IHRoaXMgZm9ybWF0IGxpc3QgDQp3aWxsIHNvb24gc2VlIGEgbGFy
Z2VyIGNsZWFudXAuDQoNClNvIEkgdGhpbmsgQVJHQjg4ODggbGlrZWx5IHNob3VsZG4ndCBi
ZSBvbiB0aGUgbGlzdCBoZXJlLg0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQo+ICAgCURS
TV9GT1JNQVRfUkdCNTY1LA0KPiAgIAkvL0RSTV9GT1JNQVRfWFJHQjE1NTUsDQo+ICAgCS8v
RFJNX0ZPUk1BVF9BUkdCMTU1NSwNCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvcGxh
dGZvcm1fZGF0YS9zaW1wbGVmYi5oIGIvaW5jbHVkZS9saW51eC9wbGF0Zm9ybV9kYXRhL3Np
bXBsZWZiLmgNCj4gaW5kZXggMjdlYTk5YWY2ZTFkLi40Zjk0ZDUyYWM5OWYgMTAwNjQ0DQo+
IC0tLSBhL2luY2x1ZGUvbGludXgvcGxhdGZvcm1fZGF0YS9zaW1wbGVmYi5oDQo+ICsrKyBi
L2luY2x1ZGUvbGludXgvcGxhdGZvcm1fZGF0YS9zaW1wbGVmYi5oDQo+IEBAIC0yMiw2ICsy
Miw3IEBADQo+ICAgCXsgInI4ZzhiOCIsIDI0LCB7MTYsIDh9LCB7OCwgOH0sIHswLCA4fSwg
ezAsIDB9LCBEUk1fRk9STUFUX1JHQjg4OCB9LCBcDQo+ICAgCXsgIng4cjhnOGI4IiwgMzIs
IHsxNiwgOH0sIHs4LCA4fSwgezAsIDh9LCB7MCwgMH0sIERSTV9GT1JNQVRfWFJHQjg4ODgg
fSwgXA0KPiAgIAl7ICJhOHI4ZzhiOCIsIDMyLCB7MTYsIDh9LCB7OCwgOH0sIHswLCA4fSwg
ezI0LCA4fSwgRFJNX0ZPUk1BVF9BUkdCODg4OCB9LCBcDQo+ICsJeyAieDhiOGc4cjgiLCAz
MiwgezAsIDh9LCB7OCwgOH0sIHsxNiwgOH0sIHswLCAwfSwgRFJNX0ZPUk1BVF9YQkdSODg4
OCB9LCBcDQo+ICAgCXsgImE4YjhnOHI4IiwgMzIsIHswLCA4fSwgezgsIDh9LCB7MTYsIDh9
LCB7MjQsIDh9LCBEUk1fRk9STUFUX0FCR1I4ODg4IH0sIFwNCj4gICAJeyAieDJyMTBnMTBi
MTAiLCAzMiwgezIwLCAxMH0sIHsxMCwgMTB9LCB7MCwgMTB9LCB7MCwgMH0sIERSTV9GT1JN
QVRfWFJHQjIxMDEwMTAgfSwgXA0KPiAgIAl7ICJhMnIxMGcxMGIxMCIsIDMyLCB7MjAsIDEw
fSwgezEwLCAxMH0sIHswLCAxMH0sIHszMCwgMn0sIERSTV9GT1JNQVRfQVJHQjIxMDEwMTAg
fSwgXA0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxv
cGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIu
IDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJn
KQ0KR2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rldg0K

--------------iKOxZEwwUPyJhUHtsOSCdfNE--

--------------eNz17K4XSCBtUa2VtNrCyuU7
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmN3n+cFAwAAAAAACgkQlh/E3EQov+Bm
Zg/9EuHzQRdhs0PLc5AblrAdda6Fq9s2jV5OZfGgPUUITEaMHQHbn3xCt5l/Ev8FZfS0lAIcsJAy
Yxy/CEeIj0eEY3IH+pI+pkc0r4HhKMmAaKL5vbcQY0C/3JMmkhu8y9zC8kUi/GsrfPbSwPSJ2vHp
BfF4kGzIZwrWi4vm2uhAZGf2lx7U1r3wzcbrO3p+EsrwjGTY1G8/Io9Pq6A6Klz4IU3MNAqmnR3h
VlZrWFmrf4ZXtbkZ3cJ4sRVCW+6W07ci2nu3KQhcEv4lUxaFq7kwxfVnYZHaKoodpl/BHCeh0Ii5
DZjmgdtdvgWoztqhhVG7VQOR6OGeLZqzWpqun13rMSf73zSO08QZvPnvq5MwYZH3FmzfAL6bPbtl
N65IsSEeqDD+aTjzWecxfKH338NYwinK0zDqzlS1z88YoWb1xGTnycMY8aEJ8tvJPpHljFdxJYOA
LapVCaSPjrzXal2qZTs7MQ3HDQ8uvBWC7NBaXIF5cqhec1y09lqd66fXRMtN9GgfBv2EJFCi/b0I
jERBlaf+p6k9z1dAetnWUxm2sAZa0JWDVqr2DzxOrq1QtpRjcjxrFd24IBSFE0gghDayl/BsJj0I
8AKFi/7m0RgYeUL/R8OJEg9UhJ4wJeOiIXCZ5m5TEsodSqaducfG73wAbIQ0R4YbP4yIfL8qLpYw
ti0=
=gQv6
-----END PGP SIGNATURE-----

--------------eNz17K4XSCBtUa2VtNrCyuU7--
