Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E0D0F763B4E
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jul 2023 17:40:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8129810E48C;
	Wed, 26 Jul 2023 15:40:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6844310E490
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jul 2023 15:40:13 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 2E3E721CBE;
 Wed, 26 Jul 2023 15:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1690386012; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uqVGkexvcaO1XGyhmiSrefoqAGWjO+X0SfsPI64ug68=;
 b=dYsZrOiuXcsxQyncsT/aulTW2cJ250biE0RHagiR2Zu4XPncgwE4b5aQDzShfUXQKBp1jT
 Edzat2bra27mdnpaFK99A/RDRmj8+lA9GPhFTvJ5F2n/OqFvJRSqxOiZpaAt/I1NBXB9Tw
 +3tz/rDO1ze6dSPbSKNhvYopzjJwiYI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1690386012;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uqVGkexvcaO1XGyhmiSrefoqAGWjO+X0SfsPI64ug68=;
 b=8JnZ2W3phRTzu34qM9eZVyhty8bVIR01Zsr8/Xlt7LjPa1efapItWOWN/AU3Cjza268yaV
 Kw54KRUfIOkwY9Cw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 12A9F139BD;
 Wed, 26 Jul 2023 15:40:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id a8KYA1w+wWT8LgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 26 Jul 2023 15:40:12 +0000
Message-ID: <9c8a0a5f-fd7f-cf6d-7e6e-ca90bdf957c5@suse.de>
Date: Wed, 26 Jul 2023 17:40:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] drm/mgag200: Increase bandwidth for G200se A rev1
Content-Language: en-US
To: Roger Sewell <roger.sewell@cantab.net>
References: <20230717133037.25941-1-jfalempe@redhat.com>
 <69a9ee2e-bd03-2a63-6651-0680475d7025@suse.de>
 <4f5d262c-527f-0fa6-45e3-a75aa22fcf0d@suse.de>
 <20230724215746.10928@revelation.broadband>
 <ca6cd674-d268-6210-c66d-4750e28a5c77@suse.de>
 <20230725223127.4184@revelation.broadband>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230725223127.4184@revelation.broadband>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------sG4f0tq0iyutos2F2x5cbrq4"
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
Cc: airlied@redhat.com, jfalempe@redhat.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------sG4f0tq0iyutos2F2x5cbrq4
Content-Type: multipart/mixed; boundary="------------5aQ00kaC0ilcXHmuQ2k2JhuN";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Roger Sewell <roger.sewell@cantab.net>
Cc: airlied@redhat.com, jfalempe@redhat.com, dri-devel@lists.freedesktop.org
Message-ID: <9c8a0a5f-fd7f-cf6d-7e6e-ca90bdf957c5@suse.de>
Subject: Re: [PATCH] drm/mgag200: Increase bandwidth for G200se A rev1
References: <20230717133037.25941-1-jfalempe@redhat.com>
 <69a9ee2e-bd03-2a63-6651-0680475d7025@suse.de>
 <4f5d262c-527f-0fa6-45e3-a75aa22fcf0d@suse.de>
 <20230724215746.10928@revelation.broadband>
 <ca6cd674-d268-6210-c66d-4750e28a5c77@suse.de>
 <20230725223127.4184@revelation.broadband>
In-Reply-To: <20230725223127.4184@revelation.broadband>

--------------5aQ00kaC0ilcXHmuQ2k2JhuN
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjUuMDcuMjMgdW0gMjM6MzEgc2NocmllYiBSb2dlciBTZXdlbGw6DQo+IFRo
b21hcywNCj4gDQo+IFRoYW5rIHlvdSBmb3IgeW91ciByZXBseS4NCj4gDQo+Pj4gVGFibGUg
MTAgaW4gdGhlIGZvbGxvd2luZyBkb2N1bWVudCBzYXlzIHRoYXQgIDE0NDB4OTAwQDYwSHog
aXMNCj4+PiBzdXBwb3J0ZWQ6DQo+Pj4gaHR0cHM6Ly93d3cuaW50ZWwuY29tL2NvbnRlbnQv
ZGFtL3N1cHBvcnQvdXMvZW4vZG9jdW1lbnRzL21vdGhlcmJvYXJkcy9zZXJ2ZXIvczU1MjB1
ci9zYi9lNDQwMzEwMTJfczU1MjB1cl9zNTUyMHVydF90cHNfcjFfOS5wZGYNCj4+DQo+PiBU
aGF0IG1hbnVhbCBzYXlzIHRoYXQgdGhlIHJlc29sdXRpb24gaXMgb25seSBzdXBwb3J0ZWQg
d2l0aCBhdCBtb3N0DQo+PiAyNC1iaXQgY29sb3JzLiBUaGUgb2xkIFggY29kZSBzdGlsbCBz
dXBwb3J0cyB0aGF0IHRvIHNvbWUgZXh0ZW5kLCBidXQNCj4+IG1vZGVybiB1c2Vyc3BhY2Ug
ZG9lc24ndC4NCj4gDQo+IEhvdyBjYW4gSSBjaGVjayBmb3Igc3VyZSB3aGV0aGVyIEkgYW0g
dXNpbmcgMjQgb3IgMzIgYml0cyBwZXIgcGl4ZWwgPw0KDQpDb3VsZCB5b3UgcHJvdmlkZSB1
cyB3aXRoIHRoZSBYb3JnIGxvZ3MgZnJvbSAvdmFyL2xvZy9Yb3JnLjAubG9nICwgcGxlYXNl
Pw0KDQpTcGVjaWZpY2FsbHksIEknZCBiZSBpbnRlcmVzdGVkIGluIGRpZmZlcmVudCBsb2dz
IGZyb20gY29tYmluYXRpb25zIG9mIA0KdGhlIG9sZCBhbmQgbmV3IGtlcm5lbCBhbmQgdGhl
IG9sZCBhbmQgbmV3IHVzZXJzcGFjZS4NCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KPiAN
Cj4+PiBzbyBpbiBwYXJ0aWN1bGFyIHRoZSBjaGlwIGlzIHNhaWQgdG8gYmUgYSBHMjAwZSwg
bm90IHRoZSBHMjAwU0UtQQ0KPj4+IHRoYXQgdGhlIGtlcm5lbCBtb2R1bGUgc2VlbXMgdG8g
YmUgaW50ZXJwcmV0aW5nIGl0IGFzLg0KPiANCj4+IEl0IGFjdHVhbGx5IGlzIHRoZSBHMjAw
U0UtQS4gSXQncyBqdXN0IG5hbWVkIGRpZmZlcmVudGx5IGJ5IGxzcGNpLiBUaGUNCj4+IFBD
SSBkZXZpY2UgaWQgc2hvdWxkIGJlIDB4MDUyMi4NCj4gDQo+IEl0IGlzIGluZGVlZCAweDA1
MjIuDQo+IA0KPj4gU28gdGhlIG9sZCBrZXJuZWwgYWxyZWFkeSBkaWQgdGhlIHJpZ2h0IHRo
aW5nLg0KPiANCj4gKGJ1dCBpZiBJIHVuZGVyc3RhbmQgdGhlIHNpdHVhdGlvbiByaWdodCBY
b3JnIGRpZG4ndCA/KQ0KPiANCj4+IFlvdSBjYW4gZG8NCj4+DQo+PiAgICBjYXQgL3N5cy9j
bGFzcy9kcm0vY2FyZDEtVkdBLTEvbW9kZXMNCj4+DQo+PiBvbiB0aGUgb2xkIGFuZCBuZXcg
a2VybmVsLiBXaXRoIGEgbW9uaXRvciBjb25uZWN0b3IsIGl0IHdpbGwgdGVsbCB5b3UNCj4+
IHRoZSBzdXBwb3J0ZWQgcmVzb2x1dGlvbnMuDQo+IA0KPiBXaXRoIHRoZSBuZXcga2VybmVs
IGFuZCB0aGUgdW5tb2RpZmllZCBtZ2FnMjAwIG1vZHVsZSBpdCB0ZWxscyBtZSB0aGF0DQo+
IDE0NDB4OTAwIGlzIG5vdCBvbiB0aGUgbGlzdCAtIGJ1dCBYb3JnIHN0aWxsIGxpc3RzIGl0
IHVuZGVyDQo+IFNldHRpbmdzLT5EaXNwbGF5IChhbmQgV2F5bGFuZCBkb2Vzbid0KS4gV2l0
aCB0aGUgaW5jcmVhc2VkIGJhbmR3aWR0aA0KPiBtb2R1bGUgaW4gcGxhY2UgaXQgdGVsbHMg
bWUgMTQ0MHg5MDAgaXMgb24gdGhlIGxpc3QuIEkgdGhpbmsgdGhpcyBpcyBhcw0KPiB5b3Ug
ZXhwZWN0IGFzIGZhciBhcyB0aGUga2VybmVsIHJhdGhlciB0aGFuIFhvcmcgaXMgY29uY2Vy
bmVkLg0KPiANCj4gVGhhbmtzLA0KPiBSb2dlci4NCg0KLS0gDQpUaG9tYXMgWmltbWVybWFu
bg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMg
R2VybWFueSBHbWJIDQpGcmFua2Vuc3RyYXNzZSAxNDYsIDkwNDYxIE51ZXJuYmVyZywgR2Vy
bWFueQ0KR0Y6IEl2byBUb3RldiwgQW5kcmV3IE15ZXJzLCBBbmRyZXcgTWNEb25hbGQsIEJv
dWRpZW4gTW9lcm1hbg0KSFJCIDM2ODA5IChBRyBOdWVybmJlcmcpDQo=

--------------5aQ00kaC0ilcXHmuQ2k2JhuN--

--------------sG4f0tq0iyutos2F2x5cbrq4
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmTBPlsFAwAAAAAACgkQlh/E3EQov+CR
GA//cnJYU8PN/wkKFPsJfFkxTqTa2sSxnUVs5S/oPAai1qFbUdncOTlNFrQVze8OzqkGBWSFnMpE
gamwEqdcfxuZEvG8xoUnik8f3k7L5NfsFylXpEKg4gIP5jbd4Ed+eS1CopstLqeirVKAspVB2DTk
SR3S1JSOv4kxAUU2Uqy/yRyYzsXStk6/HfVz9bgEjkHesTREY+0ZLLYrM0bvFhbIqGyvdTryx5EA
rEwlkJ7A8ycQdEIyyXCllc6hgntO7hWP3QBoRMHzjRzAXyEzYyPBJ5Md+51avkBhMBhyXbXrLERh
ENHPX25DQXqy0UACxIOttzv5HPtvz8gc84LlbtVaobQ0nDjId0lJxYci01Aio54PBEhkvtV9R89E
5TrmKXQbRijqNvqLsPheVYZSwUeUyEpofuQinY5jiNSlZf4H/v1Y99OPWXiYoghjRUbjK0RLVKqa
zej4f2Xkdx7pb3YUHb7IvdL6TyH0sQAEaxlURKtxtZuYHJk8hAwqT4udoJtxySZfSXywo6iNcZIl
WuoKsz+xGiFSEIvucz5i+Da5u1uDed4YhzqEi4Hmhq9jOrkE0tYHbpVMVETlja0y+n6BVD3ZHJe2
gdVqMqcnk8XcaeB+KIZEbBuPxiiHrM4Z4MSEqxq96d9HCEQSuRaNd28ngYlvR8nXY0xGptIEJJCr
VhI=
=HAak
-----END PGP SIGNATURE-----

--------------sG4f0tq0iyutos2F2x5cbrq4--
