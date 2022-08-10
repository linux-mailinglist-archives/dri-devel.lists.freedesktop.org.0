Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2C4E58E790
	for <lists+dri-devel@lfdr.de>; Wed, 10 Aug 2022 09:02:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E7319B588;
	Wed, 10 Aug 2022 07:02:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC720EDBE2
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Aug 2022 07:02:20 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 3C42F37F05;
 Wed, 10 Aug 2022 07:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1660114939; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yMF5IdxcxKsczLi8wc1TXuwAg3af6Om3Rc6m4Le3D4I=;
 b=wh/VPkZPDO0DeAn9dV/dVU9QLoKuTDMDZA85VncX15wYytsG2oIOc00GQEX61F/7HBxSI/
 aqfpIt8AhB58n3lqj+Mp5wmoVOYVkjCCGFj3bLwOyiMPYlZkh/bXQ/CF9pCXLjEO3P427a
 fZiKEbScukjaIJ3Ak2Rxc9A5lS2P+9A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1660114939;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yMF5IdxcxKsczLi8wc1TXuwAg3af6Om3Rc6m4Le3D4I=;
 b=Gm0d/Jl5XJpXQxvnFMtGvSnjl8EyZSNFMCFlrFhzjKEwJrElFXOt2Asucrb248PSS+4+/2
 TITPQffNLP4F0MBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1A2C413AB3;
 Wed, 10 Aug 2022 07:02:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 50L9BPtX82ICVwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 10 Aug 2022 07:02:19 +0000
Message-ID: <fe5e7df5-8396-c95d-728e-01cf0556880b@suse.de>
Date: Wed, 10 Aug 2022 09:02:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.0
Subject: Re: tiny drm driver for NOKIA-5110 LCD
Content-Language: en-US
To: Andy Shevchenko <andy.shevchenko@gmail.com>,
 Aliliche Larbi <alilichelarbi@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
References: <CAPEqGQr5iPZizmcR8GndjO4VpJNxW461uoxTZvGwDVvEoepFMQ@mail.gmail.com>
 <CAHp75VdjOfBD2tJfydX7GTuAZ9gyzSr5vBnGA8qy5LT8AJhypA@mail.gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <CAHp75VdjOfBD2tJfydX7GTuAZ9gyzSr5vBnGA8qy5LT8AJhypA@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------kS3PSzmZ0kr0e7SUok6qgzFb"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------kS3PSzmZ0kr0e7SUok6qgzFb
Content-Type: multipart/mixed; boundary="------------RMhxXlPqiw6lswZ7XyW1r07a";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Andy Shevchenko <andy.shevchenko@gmail.com>,
 Aliliche Larbi <alilichelarbi@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Message-ID: <fe5e7df5-8396-c95d-728e-01cf0556880b@suse.de>
Subject: Re: tiny drm driver for NOKIA-5110 LCD
References: <CAPEqGQr5iPZizmcR8GndjO4VpJNxW461uoxTZvGwDVvEoepFMQ@mail.gmail.com>
 <CAHp75VdjOfBD2tJfydX7GTuAZ9gyzSr5vBnGA8qy5LT8AJhypA@mail.gmail.com>
In-Reply-To: <CAHp75VdjOfBD2tJfydX7GTuAZ9gyzSr5vBnGA8qy5LT8AJhypA@mail.gmail.com>

--------------RMhxXlPqiw6lswZ7XyW1r07a
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDkuMDguMjIgdW0gMTg6MjMgc2NocmllYiBBbmR5IFNoZXZjaGVua286DQo+
IE9uIFR1ZSwgQXVnIDksIDIwMjIgYXQgNjoxNCBQTSBBbGlsaWNoZSBMYXJiaSA8YWxpbGlj
aGVsYXJiaUBnbWFpbC5jb20+IHdyb3RlOg0KPj4NCj4+IEdvb2QgbW9ybmluZyBzaXIsDQo+
Pg0KPj4gSSBhbSBkZXZlbG9waW5nIGEgbGludXggZHJpdmVyIGZvciB0aGUgbm9raWEgNTEx
MCBsY2QobW9ub2Nocm9tZSksDQo+PiBJIHdvdWxkIGxpa2UgdG8ga25vdyBpZiBJIGNhbiB1
c2UgdGhlIGRybSBBUEkgb3IgdGlueSBkcm0gZm9yIHRoaXMgbGNkLg0KPj4gSSdtIHdyaXRp
bmcgdG8geW91IGJlY2F1c2UgSSBzYXcgeW91ciBjb21taXQgaW4gL3N0YWdpbmcvZmJ0ZnQv
VE9ETw0KPj4gd2hlcmUgeW91IHRhbGsgYWJvdXQgY29udmVydGluZyBhbGwgZmJ0ZnQgZHJp
dmVycyB0byBkcm1fc2ltcGxlX2Rpc3BsYXlfcGlwZS4NCj4+DQo+PiBJcyB0aGlzIHBvc3Np
YmxlIGZvciBzaW1wbGUgbW9ub2Nocm9tZSBsY2RzIGxpa2UgdGhlIDUxMTAgb25lPw0KDQpG
b3Igc3VjaCBzaW1wbGUgaGFyZHdhcmUsIHRoZSB0aW55LURSTSBoZWxwZXJzIGFyZSBlcXVp
dmFsZW50IHRvIHRoZSANCmZ1bGwgaGVscGVycy4gU28gZWl0aGVyIGlzIHBvc3NpYmxlLiBU
aW55IGhlbHBlcnMgYXJlIGJ1aWxkIG9uIHRvcCBvZiANCnRoZSByZWd1bGFyIGhlbHBlcnMg
YW5kIGluIHRoZSBlbmQgdGhlIGRpZmZlcmVuY2UgaXMgc21hbGwuDQoNCkFuZCB0byBhZGQg
YSBwZXJzb25hbCBvcGluaW9uLCBJJ3ZlIHVzZWQgYm90aCBhbmQgY29tZSB0byBkaXNsaWtl
IHRoZSANCnRpbnktaGVscGVycy4gVGhleSBzZWVtIGVhc2llciB0byB1c2UsIGJ1dCB0aGF0
IGltcHJlc3Npb24gbW9zdGx5IGNvbWVzIA0KZnJvbSBjb25mbGF0aW5nIENSVENzIGFuZCBw
bGFuZXMuIE1peGluZyBib3RoIG1ha2VzIGlzIGhhcmRlciB0byBzaGFyZSANCmNvZGUgd2l0
aCBvdGhlciBkcml2ZXJzLiBJIHRoZW4gaGFkIHRvIGJ1aWxkIGV4dHJhIHdyYXBwZXJzIGFy
b3VuZCANCmV4aXN0aW5nIGhlbHBlcnMgb25seSB0byB1c2UgdGhlbSB3aXRoIHRpbnktRFJN
IChzZWUgDQpEUk1fR0VNX1NIQURPV19QTEFORV9GVU5DUywgWzFdIERSTV9HRU1fU0hBRE9X
X1BMQU5FX0hFTFBFUl9GVU5DUyBbMl0gDQphbmQgRFJNX0dFTV9TSU1QTEVfRElTUExBWV9Q
SVBFX1NIQURPV19QTEFORV9GVU5DUyBbM10gZm9yIGFuIGV4YW1wbGUuKQ0KDQpUaW55LURS
TSBoZWxwZXJzIGFyZSBhbHNvIG5vdCB0aGF0IG11Y2ggbW9yZSB0aW55LiBQYXRjaGVzIHRv
IGNvbnZlcnQgDQpmcm9tIHRpbnkgRFJNIHRvIHJlZ3VsYXIgaGVscGVycyBvbmx5IGVubGFy
Z2UgZHJpdmVycyBieSBhIGZldyBkb3plbiANCmxpbmVzLiBbNF1bNV0NCg0KRm9yIHRoZSBk
cml2ZXJzIHRoYXQgSSdtIHJlc3BvbnNpYmxlLCBJIGJlZ2FuIHRvIHJlcGxhY2UgdGhlbSB3
aXRoIHRoZSANCmZ1bGwgaGVscGVycy4gVXNpbmcgdGlueSBEUk0gd29uJ3QgYmxvY2sgeW91
ciBkcml2ZXIgZnJvbSBiZWluZyBtZXJnZWQsIA0KYnV0IGluIG15IChlbnRpcmVseSBzdWJq
ZWN0aXZlKSBvcGluaW9uLCB3ZSBzaG91bGQgcmF0aGVyIG1ha2UgYSBwdXNoIA0KdG93YXJk
cyByZW1vdmluZyB0aW55LURSTSBlbnRpcmVseS4NCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMN
Cg0KWzFdIA0KaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvdjUuMTkvc291cmNl
L2luY2x1ZGUvZHJtL2RybV9nZW1fYXRvbWljX2hlbHBlci5oI0wxMDENClsyXSANCmh0dHBz
Oi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L3Y1LjE5L3NvdXJjZS9pbmNsdWRlL2RybS9k
cm1fZ2VtX2F0b21pY19oZWxwZXIuaCNMMTE3DQpbM10gDQpodHRwczovL2VsaXhpci5ib290
bGluLmNvbS9saW51eC92NS4xOS9zb3VyY2UvaW5jbHVkZS9kcm0vZHJtX2dlbV9hdG9taWNf
aGVscGVyLmgjTDEzOQ0KWzRdIGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9w
YXRjaC80OTU4MzkvP3Nlcmllcz0xMDYxMDAmcmV2PTMNCls1XSBodHRwczovL3BhdGNod29y
ay5mcmVlZGVza3RvcC5vcmcvc2VyaWVzLzEwNjg4MC8NCg0KDQo+IA0KPiBZb3UgbWF5IGNv
bnZlcnQgX2V4aXN0aW5nXyBkcml2ZXIgWzFdIHRvIHJlYWwgRFJNLCBsaWtlIGl0J3MgZG9u
ZSBmb3INCj4gU1NEMTMweCBbMl0uDQo+IA0KPiBbMV06IGh0dHBzOi8vZWxpeGlyLmJvb3Rs
aW4uY29tL2xpbnV4L2xhdGVzdC9zb3VyY2UvZHJpdmVycy9zdGFnaW5nL2ZidGZ0L2ZiX3Bj
ZDg1NDQuYw0KPiBbMl06IGh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L2xhdGVz
dC9zb3VyY2UvZHJpdmVycy9ncHUvZHJtL3NvbG9tb24NCj4gDQoNCi0tIA0KVGhvbWFzIFpp
bW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29s
dXRpb25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBH
ZXJtYW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8aHJlcjog
SXZvIFRvdGV2DQo=

--------------RMhxXlPqiw6lswZ7XyW1r07a--

--------------kS3PSzmZ0kr0e7SUok6qgzFb
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmLzV/oFAwAAAAAACgkQlh/E3EQov+Bw
ZhAAgxZnpjc6N2+09ex9n8TpaCj1JHTlYs5bQnlh3Od7B+HUBhUryxF1wWwf9tOpOJtd2O5rJKjO
DAQ11DcxZzZhp7zhfaC7rY1qyKkO7H+RnbxshWeCXq4Cxnos25LLhQcekILXVH4JXC9+ENvbKJSn
oFPnIhXtXVD7xr6xjBw9g6Akf5/DLYwWeGXCOCrTSAojXWKdMsRJzkfGxJWGhrizSC+fz8/Ej0cA
bz7ADCOWtglSoMhVjNdN+xtcJHS9rRCPT8d+GQx2jmZQC5BxyY+Rqq4jLTZwEnlmjIHsmVy8GfaA
w1BHkNUDw+YG22dCE+9RVFnWlx4uCDVY4wJM0RZa/rPKDdfujwQe7dVEjv/jx2R9S8rA3On6fvXl
RXtVksfxVYVihRLCIHrdo4WSVV7oNC5emZC1i+NfFyrp0Fb59QnwMmJu3YZM1aalcKUkTUky7upg
P0FqI6vYXgdvSR4RSiThqhQotwx1iJmGBVxmkU7z1onhQQcLRwzuv8koFGmRaell2BlKzTXOuIvm
AVsH1NgaB2qY1HpszFB4/ZQrPEZeVY50rpXHLUw/XfwguUlTSf2CPOVhWrsje1GAC9gKZNCZRxCS
tQAHgNNAm4OrXJ/f5fEg0H3tFJg0g25wt6Wdbov7PFUnS6qA/07y7SM+D9cpfjHuaCHxmRpo27Bm
Bi0=
=JvmM
-----END PGP SIGNATURE-----

--------------kS3PSzmZ0kr0e7SUok6qgzFb--
