Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 83E7972C972
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jun 2023 17:11:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D44C810E2A3;
	Mon, 12 Jun 2023 15:10:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10CEA10E2A3
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jun 2023 15:10:56 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 9631A227E8;
 Mon, 12 Jun 2023 15:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1686582655; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tGSKOck+SrEqKXoRma9B4sg2pSv7UGa+33AGAyXmiVs=;
 b=eh9GDT1xRxIRbv8n7IrGrwcdgRzQRM4MO8gh9ifomkztA1CW6D74Kh/cj6Q5Ak3vKcZZ/C
 XQEl1a7cDVzhiyvSP6ayQpCGUcwyVEmDXZtlasn4TTifYGjJHB/aBZgNAA/6aIrKPhys68
 39ujlGlVlB+FYcDxPLuhPgC/am6JCsA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1686582655;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tGSKOck+SrEqKXoRma9B4sg2pSv7UGa+33AGAyXmiVs=;
 b=GKFZ+sVtiK/+R68Ri089Mt5SyPxrH6Qczoj+jkp7JopzPJ+LMK7YO5VERRVqSaM2OTx+6x
 rfmOkVQkGipH0NAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 708BC138EC;
 Mon, 12 Jun 2023 15:10:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id WsqrGn81h2SUMwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 12 Jun 2023 15:10:55 +0000
Message-ID: <43487178-184c-f563-e5d8-672afdfd4788@suse.de>
Date: Mon, 12 Jun 2023 17:10:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v2 1/2] drm/prime: reject DMA-BUF attach when get_sg_table
 is missing
Content-Language: en-US
To: Simon Ser <contact@emersion.fr>
References: <20230302143502.500661-1-contact@emersion.fr>
 <e5524875-1ea3-25b5-95d9-b66910e06d42@suse.de>
 <IVEn465CI7o2ndJtCsJ0c0CY4IMdqgH5ECAxHmj6i6yx1WA4IvDNDkCcJyj2NISq0iBfvIW51gSq0HeyblJ56rmgD5IOaoPh6Ib5vE_VnTg=@emersion.fr>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <IVEn465CI7o2ndJtCsJ0c0CY4IMdqgH5ECAxHmj6i6yx1WA4IvDNDkCcJyj2NISq0iBfvIW51gSq0HeyblJ56rmgD5IOaoPh6Ib5vE_VnTg=@emersion.fr>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------kcraIKo6paTq6i0CA6RVrI9a"
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Hans de Goede <hdegoede@redhat.com>, Maxime Ripard <maxime@cerno.tech>,
 Tian Tao <tiantao6@hisilicon.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------kcraIKo6paTq6i0CA6RVrI9a
Content-Type: multipart/mixed; boundary="------------KxikVghrHDmp2SRNkTF0f6xB";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Simon Ser <contact@emersion.fr>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Hans de Goede <hdegoede@redhat.com>, Maxime Ripard <maxime@cerno.tech>,
 Tian Tao <tiantao6@hisilicon.com>, =?UTF-8?Q?Christian_K=c3=b6nig?=
 <christian.koenig@amd.com>
Message-ID: <43487178-184c-f563-e5d8-672afdfd4788@suse.de>
Subject: Re: [PATCH v2 1/2] drm/prime: reject DMA-BUF attach when get_sg_table
 is missing
References: <20230302143502.500661-1-contact@emersion.fr>
 <e5524875-1ea3-25b5-95d9-b66910e06d42@suse.de>
 <IVEn465CI7o2ndJtCsJ0c0CY4IMdqgH5ECAxHmj6i6yx1WA4IvDNDkCcJyj2NISq0iBfvIW51gSq0HeyblJ56rmgD5IOaoPh6Ib5vE_VnTg=@emersion.fr>
In-Reply-To: <IVEn465CI7o2ndJtCsJ0c0CY4IMdqgH5ECAxHmj6i6yx1WA4IvDNDkCcJyj2NISq0iBfvIW51gSq0HeyblJ56rmgD5IOaoPh6Ib5vE_VnTg=@emersion.fr>

--------------KxikVghrHDmp2SRNkTF0f6xB
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDkuMDYuMjMgdW0gMTU6MDQgc2NocmllYiBTaW1vbiBTZXI6DQo+IEhpLA0K
PiANCj4gT24gRnJpZGF5LCBKdW5lIDl0aCwgMjAyMyBhdCAxMzozMSwgVGhvbWFzIFppbW1l
cm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+IHdyb3RlOg0KPiANCj4+IElzIHRoZXJlIGEg
djMgb2YgdGhpcyBwYXRjaHNldD8gSXQgd2FzIEFja2VkIHdpdGggdGhlIG9uZSBlcnJubyBj
b2RlDQo+PiBjaGFuZ2VkLg0KPiANCj4gU2luY2UgdGhpcyB3YXMgYSBtaW5vciBjaGFuZ2Us
IEkgZGlkIGl0IGxvY2FsbHkgYW5kIHB1c2hlZCB0aGUgcGF0Y2gNCj4gdG8gZHJtLW1pc2Mt
bmV4dCBhbHJlYWR5Lg0KDQpGb3VuZCBpdC4gVGhhbmtzIGZvciBjb21taXR0aW5nIGFuZCBz
b3JyeSBmb3IgdGhlIG5vaXNlLg0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQo+IA0KPiBT
aW1vbg0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxv
cGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCkZyYW5rZW5zdHJh
c3NlIDE0NiwgOTA0NjEgTnVlcm5iZXJnLCBHZXJtYW55DQpHRjogSXZvIFRvdGV2LCBBbmRy
ZXcgTXllcnMsIEFuZHJldyBNY0RvbmFsZCwgQm91ZGllbiBNb2VybWFuDQpIUkIgMzY4MDkg
KEFHIE51ZXJuYmVyZykNCg==

--------------KxikVghrHDmp2SRNkTF0f6xB--

--------------kcraIKo6paTq6i0CA6RVrI9a
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmSHNX4FAwAAAAAACgkQlh/E3EQov+CM
bw//T3TXTvorbgc4LFmylTJS17iLOD5Pr85yJeBwzVn/61O1EWcg6XuSe467n/ZqsiQ7YqyAS9L2
MwFJsvorS2ht1JzW2ij4lEDPOcrSzuZ6SZEWTb4c+EbPF23+z0Mvd6cc0bGf+4m20ury/MHitK6v
3zsnPOKglQFB9mgSQMybYVrBgPC4LQEln4pHlCSEEKs39xhdLojjlXl64FM0lqfODvp1jPDTN4/E
MHbPKcrPWGjOCgyZAjnqY+xH/F3CVgAI4xFPYO1a3X3u66khAunp8RCV7ZNbvSGxB/CmCdbtOQvh
YTmcGOHStnvBrrdKc0biAQr+/u33DQinjQLYmvNgQjTiOZfsd4D3qxqqhio8JYT2Z3stN4o3h7hn
b3lwm0gJBTFj9EwzAb7FfkQyDUI+Irs3v6/vvDdSCNc2AK4zGwQ8/OYyoq38J7Za1jKlLCyQekcc
vBQ+siyl2Zl5jUtm/YOG/SIGDlTzMbcKs5skh8+wswCmoZhMq25URfKV69KOV8ryOzm0PwA7oTWU
vN+199+Uymjz/T1WHgn4bZ4hE1Xoz0IsIoHCKjOzrq4KugDTXMAsgG2iLE/O22Fd4g/xtgkF/AGA
f7a51PL6ehv8NSmdcggiS6qPG/zcp4qJwtiJjzMZZoKBR8cpEoYbC2QRMHVO9kuMHKyeEJDbJgGF
fFE=
=x6+q
-----END PGP SIGNATURE-----

--------------kcraIKo6paTq6i0CA6RVrI9a--
