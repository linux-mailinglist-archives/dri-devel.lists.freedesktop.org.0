Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 90DAA677737
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jan 2023 10:17:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15E3210E038;
	Mon, 23 Jan 2023 09:17:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEB8D10E038
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 09:16:57 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 70C3E341F5;
 Mon, 23 Jan 2023 09:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1674465416; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=80r1f0rQn7nrpu7IF0YQeoGPriIYd2yInVPCwHFzhMo=;
 b=xRsEAaZJMrmW/Il0mYVgIkJ1rWW2HMf8+ihXjFXFQflbS2YBHFNVY7JEZeJc4a322gxFWM
 BX4V4JBwcivC/MfCcaGnN5GJ3lDDf/aDCDtCZAt5R+t3qHbfpnnIr3m9xK8Jlau0rFYeCN
 zV9uEOmvnnG1P3foYCVdJ7/H0SBMZYA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1674465416;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=80r1f0rQn7nrpu7IF0YQeoGPriIYd2yInVPCwHFzhMo=;
 b=ME0eYPeR/0lQ0c4HAoB9Xg8ZkPrDjBCM7wxt0AdQOK2+ojv+t7Y5QRNMTvlY/K2r6z0bEe
 aocInHq5kFeEMTAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3AAA1134F5;
 Mon, 23 Jan 2023 09:16:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id KPxtDYhQzmNEcAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 23 Jan 2023 09:16:56 +0000
Message-ID: <1f372af0-9220-9a98-3495-08dca7729e7e@suse.de>
Date: Mon, 23 Jan 2023 10:16:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v4 7/8] drm/simpledrm: Support the XB24/AB24 format
Content-Language: en-US
To: Thierry Reding <thierry.reding@gmail.com>,
 David Airlie <airlied@redhat.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20230120173103.4002342-1-thierry.reding@gmail.com>
 <20230120173103.4002342-8-thierry.reding@gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230120173103.4002342-8-thierry.reding@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------3pJHEkH4fBLlvcwgXeyRpNRi"
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
--------------3pJHEkH4fBLlvcwgXeyRpNRi
Content-Type: multipart/mixed; boundary="------------ZGBuJ2cTk5xBkmY0i0QRYMjt";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Thierry Reding <thierry.reding@gmail.com>,
 David Airlie <airlied@redhat.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 Robin Murphy <robin.murphy@arm.com>, dri-devel@lists.freedesktop.org,
 Jon Hunter <jonathanh@nvidia.com>
Message-ID: <1f372af0-9220-9a98-3495-08dca7729e7e@suse.de>
Subject: Re: [PATCH v4 7/8] drm/simpledrm: Support the XB24/AB24 format
References: <20230120173103.4002342-1-thierry.reding@gmail.com>
 <20230120173103.4002342-8-thierry.reding@gmail.com>
In-Reply-To: <20230120173103.4002342-8-thierry.reding@gmail.com>

--------------ZGBuJ2cTk5xBkmY0i0QRYMjt
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjAuMDEuMjMgdW0gMTg6MzEgc2NocmllYiBUaGllcnJ5IFJlZGluZzoNCj4g
RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4NCj4gDQo+IEFkZCBY
QjI0IGFuZCBBQjI0IHRvIHRoZSBsaXN0IG9mIHN1cHBvcnRlZCBmb3JtYXRzLiBUaGUgZm9y
bWF0IGhlbHBlcnMNCj4gc3VwcG9ydCBjb252ZXJzaW9uIHRvIHRoZXNlIGZvcm1hdHMgYW5k
IHRoZXkgYXJlIGRvY3VtZW50ZWQgaW4gdGhlDQo+IHNpbXBsZS1mcmFtZWJ1ZmZlciBkZXZp
Y2UgdHJlZSBiaW5kaW5ncy4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFRoaWVycnkgUmVkaW5n
IDx0cmVkaW5nQG52aWRpYS5jb20+DQoNClJldmlld2VkLWJ5OiBUaG9tYXMgWmltbWVybWFu
biA8dHppbW1lcm1hbm5Ac3VzZS5kZT4NCg0KPiAtLS0NCj4gQ2hhbmdlcyBpbiB2NDoNCj4g
LSByZWJhc2Ugb24gdG9wIG9mIGxhdGVzdCBkcm0tZm9ybWF0LWhlbHBlciByZXdvcmsNCj4g
DQo+IENoYW5nZXMgaW4gdjI6DQo+IC0gdHJlYXQgQUIyNCBhcyBYQjI0IGFuZCBzdXBwb3J0
IGJvdGggYXQgdGhlIHNhbWUgdGltZQ0KPiANCj4gICBpbmNsdWRlL2xpbnV4L3BsYXRmb3Jt
X2RhdGEvc2ltcGxlZmIuaCB8IDEgKw0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvcGxhdGZvcm1fZGF0YS9z
aW1wbGVmYi5oIGIvaW5jbHVkZS9saW51eC9wbGF0Zm9ybV9kYXRhL3NpbXBsZWZiLmgNCj4g
aW5kZXggMjdlYTk5YWY2ZTFkLi40Zjk0ZDUyYWM5OWYgMTAwNjQ0DQo+IC0tLSBhL2luY2x1
ZGUvbGludXgvcGxhdGZvcm1fZGF0YS9zaW1wbGVmYi5oDQo+ICsrKyBiL2luY2x1ZGUvbGlu
dXgvcGxhdGZvcm1fZGF0YS9zaW1wbGVmYi5oDQo+IEBAIC0yMiw2ICsyMiw3IEBADQo+ICAg
CXsgInI4ZzhiOCIsIDI0LCB7MTYsIDh9LCB7OCwgOH0sIHswLCA4fSwgezAsIDB9LCBEUk1f
Rk9STUFUX1JHQjg4OCB9LCBcDQo+ICAgCXsgIng4cjhnOGI4IiwgMzIsIHsxNiwgOH0sIHs4
LCA4fSwgezAsIDh9LCB7MCwgMH0sIERSTV9GT1JNQVRfWFJHQjg4ODggfSwgXA0KPiAgIAl7
ICJhOHI4ZzhiOCIsIDMyLCB7MTYsIDh9LCB7OCwgOH0sIHswLCA4fSwgezI0LCA4fSwgRFJN
X0ZPUk1BVF9BUkdCODg4OCB9LCBcDQo+ICsJeyAieDhiOGc4cjgiLCAzMiwgezAsIDh9LCB7
OCwgOH0sIHsxNiwgOH0sIHswLCAwfSwgRFJNX0ZPUk1BVF9YQkdSODg4OCB9LCBcDQo+ICAg
CXsgImE4YjhnOHI4IiwgMzIsIHswLCA4fSwgezgsIDh9LCB7MTYsIDh9LCB7MjQsIDh9LCBE
Uk1fRk9STUFUX0FCR1I4ODg4IH0sIFwNCj4gICAJeyAieDJyMTBnMTBiMTAiLCAzMiwgezIw
LCAxMH0sIHsxMCwgMTB9LCB7MCwgMTB9LCB7MCwgMH0sIERSTV9GT1JNQVRfWFJHQjIxMDEw
MTAgfSwgXA0KPiAgIAl7ICJhMnIxMGcxMGIxMCIsIDMyLCB7MjAsIDEwfSwgezEwLCAxMH0s
IHswLCAxMH0sIHszMCwgMn0sIERSTV9GT1JNQVRfQVJHQjIxMDEwMTAgfSwgXA0KDQotLSAN
ClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNv
ZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIuIDUsIDkwNDA5IE7D
vHJuYmVyZywgR2VybWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0
c2bDvGhyZXI6IEl2byBUb3Rldg0K

--------------ZGBuJ2cTk5xBkmY0i0QRYMjt--

--------------3pJHEkH4fBLlvcwgXeyRpNRi
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmPOUIcFAwAAAAAACgkQlh/E3EQov+Ca
MhAAwaEyc2xd8WCFNqAjiJx+En3vCcw1lC0+bevl4eFZmTp7iSaSdZ8swPUOaJ8Yyaxg3V3Cx0R3
bQZQLPybBx6t9MzzjcqJZHVEl3p/3nhGq+k++SpENZpCd2fXKb0IWD5nilqF37OoXTw/KugRx/Ln
szhItffcN0je1xZlhYM0VPChAF83LYOu1R5r6Mu1Z+xEawyc4xdXrEBY8e0HP1o1meU8QwKmo0tv
E4Bgs0S4kD+Q6RCKW3Y7QqtAWfa3ffhuz5/2uPwtSZKNKyFcefhsJZVUcf/Yu9jYhX7y2/iGcxuo
AAVcNTsxxwsZUndDmr9XH5sDxa14jkZr4mh687uFLr4ilyrbTh02R+M81ceYkQM8YRflbZnYI4wy
xTkzOkN9HeB2uuqpAKbunXD0sNWgxeDRx8Yst33n76qhMep2EiEOub+w8eJtsAYwII+2+8D27q0t
X5UqikZ6oSfUt6iwDDzHV2oBCjoSVP8lUo/uQiKqoDTdZvILB9BlDev3nTYw+MVSElzjpO95eYkA
A8jnVm2SApoX3KnN84VWHtaYbNhFkCN2j4FFcZJYrjXplVz2p/lDqtYvHfTEh3JK/ibAUvt9Kva+
EGxdQ60uy6U4NhGzvV0kMUxRnFYdw6/fpXC2XllDl6o9KaQ3lBNdLkJGhaE8FLNc24rgyGFZApk1
43s=
=fHau
-----END PGP SIGNATURE-----

--------------3pJHEkH4fBLlvcwgXeyRpNRi--
