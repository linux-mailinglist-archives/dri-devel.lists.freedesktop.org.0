Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E2DE967CB48
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jan 2023 13:52:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14D6C10E02D;
	Thu, 26 Jan 2023 12:52:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B66610E02D
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 12:52:06 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A45C21FF3F;
 Thu, 26 Jan 2023 12:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1674737524; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kClzY75js7aJiKLg/LKVoj+cBTiR9hjjvCqhmX7urHU=;
 b=KJOUE8L29pNygRJbHtanSbjApBXzGzKgY8+qaYymFEkFJmqZXwEp604mECVafle1BqRVaH
 CWfs/uFuCArmuFObK/KE+9fmUrY1mArc9xFS9z57KxW1cTtjD3KqfT75m3SjwK2LvhYRt+
 Lqb2RIhA13AUtyYC3UaAtVMk50VDUN0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1674737524;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kClzY75js7aJiKLg/LKVoj+cBTiR9hjjvCqhmX7urHU=;
 b=wiAhwhdaOctBFBQQpNs8w0g7YiOp3up2Q/TkZAajvEu9D4uVg8r1CB2YUy2yw2A2yA/w47
 N/SLxWgcsDN7DWCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7A7A3139B3;
 Thu, 26 Jan 2023 12:52:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id hkfvHHR30mNhTgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 26 Jan 2023 12:52:04 +0000
Message-ID: <8af99e7e-c84a-ee52-5885-4b208451c7a2@suse.de>
Date: Thu, 26 Jan 2023 13:52:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] drm/simpledrm: Fix an NULL vs IS_ERR() bug
Content-Language: en-US
To: Dan Carpenter <error27@gmail.com>, Thierry Reding <treding@nvidia.com>
References: <Y9JHzImRcUaa0mi1@kili>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <Y9JHzImRcUaa0mi1@kili>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------WoVsUO0nYZssglI9T0oXGqwt"
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
Cc: kernel-janitors@vger.kernel.org,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------WoVsUO0nYZssglI9T0oXGqwt
Content-Type: multipart/mixed; boundary="------------0SdfjjfTvS7yWr2y4Zr1JDYX";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dan Carpenter <error27@gmail.com>, Thierry Reding <treding@nvidia.com>
Cc: kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Javier Martinez Canillas <javierm@redhat.com>
Message-ID: <8af99e7e-c84a-ee52-5885-4b208451c7a2@suse.de>
Subject: Re: [PATCH] drm/simpledrm: Fix an NULL vs IS_ERR() bug
References: <Y9JHzImRcUaa0mi1@kili>
In-Reply-To: <Y9JHzImRcUaa0mi1@kili>

--------------0SdfjjfTvS7yWr2y4Zr1JDYX
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQoNCkFtIDI2LjAxLjIzIHVtIDEwOjI4IHNjaHJpZWIgRGFuIENhcnBlbnRlcjoNCj4gVGhl
IGRldm1fbWVtcmVtYXAoKSBmdW5jdGlvbiBkb2Vzbid0IHJldHVybiBOVUxMLCBpdCByZXR1
cm5zIGVycm9yDQo+IHBvaW50ZXJzLg0KPiANCj4gRml4ZXM6IDlhMTBjN2U2NTE5YiAoImRy
bS9zaW1wbGVkcm06IEFkZCBzdXBwb3J0IGZvciBzeXN0ZW0gbWVtb3J5IGZyYW1lYnVmZmVy
cyIpDQo+IFNpZ25lZC1vZmYtYnk6IERhbiBDYXJwZW50ZXIgPGVycm9yMjdAZ21haWwuY29t
Pg0KDQpSZXZpZXdlZC1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2Uu
ZGU+DQoNCj4gLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL3Rpbnkvc2ltcGxlZHJtLmMgfCA0
ICsrLS0NCj4gICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9u
cygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS90aW55L3NpbXBsZWRy
bS5jIGIvZHJpdmVycy9ncHUvZHJtL3Rpbnkvc2ltcGxlZHJtLmMNCj4gaW5kZXggMmFjYzBl
YjMyNDg5Li42Mzg4MWEzNzU0ZjggMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS90
aW55L3NpbXBsZWRybS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS90aW55L3NpbXBsZWRy
bS5jDQo+IEBAIC03MTksOCArNzE5LDggQEAgc3RhdGljIHN0cnVjdCBzaW1wbGVkcm1fZGV2
aWNlICpzaW1wbGVkcm1fZGV2aWNlX2NyZWF0ZShzdHJ1Y3QgZHJtX2RyaXZlciAqZHJ2LA0K
PiAgIAkJZHJtX2RiZyhkZXYsICJ1c2luZyBzeXN0ZW0gbWVtb3J5IGZyYW1lYnVmZmVyIGF0
ICVwclxuIiwgbWVtKTsNCj4gICANCj4gICAJCXNjcmVlbl9iYXNlID0gZGV2bV9tZW1yZW1h
cChkZXYtPmRldiwgbWVtLT5zdGFydCwgcmVzb3VyY2Vfc2l6ZShtZW0pLCBNRU1SRU1BUF9X
Qyk7DQo+IC0JCWlmICghc2NyZWVuX2Jhc2UpDQo+IC0JCQlyZXR1cm4gRVJSX1BUUigtRU5P
TUVNKTsNCj4gKwkJaWYgKElTX0VSUihzY3JlZW5fYmFzZSkpDQo+ICsJCQlyZXR1cm4gc2Ny
ZWVuX2Jhc2U7DQo+ICAgDQo+ICAgCQlpb3N5c19tYXBfc2V0X3ZhZGRyKCZzZGV2LT5zY3Jl
ZW5fYmFzZSwgc2NyZWVuX2Jhc2UpOw0KPiAgIAl9IGVsc2Ugew0KDQotLSANClRob21hcyBa
aW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNv
bHV0aW9ucyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywg
R2VybWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bDvGhyZXI6
IEl2byBUb3Rldg0K

--------------0SdfjjfTvS7yWr2y4Zr1JDYX--

--------------WoVsUO0nYZssglI9T0oXGqwt
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmPSd3QFAwAAAAAACgkQlh/E3EQov+Cx
ZRAAn60jnMLPuToD0isiHiNCmDhtLMi5v+NBh8gE4/zYTA2j/0vmX1SEtrRTs+9iISvNB0wdkb6S
XRC15CtpB7wuSi7CUWJ5jZn2UtfhKC4kIURlvQUQ1G5SvIX6fh/ykBxW/c8j2AAjKYAoLyjaGhOK
TL5PmK5G6rdwMTTyd5rHUuBV4UT6RPSp0BebsoPXP9Bqq0VVT/GaQBSQMNRxmCKevqTsMmhOWaQI
8PSViylAoKQnZD65nEImOHsBG8QCuiwq9uaApUkY309n/AnDQaTiow8TYvryA983vmDEnJ/+nG8F
kBIEIoegbBPtE5hxmjNp9+d3Pij8aJZFpTtsVHd6dkUbSKhn8VJZG8/kKZddyky8CseyL+pNQma1
sV5JZRWQ9mSzgTpcxzRzwz0pxW7yANGruVA+iHuKOWrndQCws5B+xKNgALMjR5Cx0kMAQZJ4SEeV
Wb/+Rff77lQJ2V80e95detL6YnT4AQc/6tvZc9iUJ/RoPx0mI37+7EcqUA0fWtWKo5kZTOExN8xD
hL7XvJUBsP+NbHchY3O/cu+T1ZhMcpcMFCtMi3h+Ab7Tf/AAO7qLYEhsM6PsqVXrE4vcJrJ61CJQ
hEY/dGfW87wK6q0CZoeEfBtIBP5W2I0svUVR0D8aNxJMdrwbO4Wzg1zJOmEqFQ9aNm/5scRHEFjn
0GM=
=0S73
-----END PGP SIGNATURE-----

--------------WoVsUO0nYZssglI9T0oXGqwt--
