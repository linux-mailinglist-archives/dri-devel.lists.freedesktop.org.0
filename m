Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 165C0551724
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jun 2022 13:17:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 182A410E747;
	Mon, 20 Jun 2022 11:17:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A610210E461
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jun 2022 11:17:53 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 5884A21BB2;
 Mon, 20 Jun 2022 11:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1655723872; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=//gRniEXycrsw2YDT7Cu3MIJErpMziUlBMbR3tNHMAU=;
 b=w/HAE3Jpg9a09QdeJGdNeQ62BlAuiPdx5xTZ48uxWCsBveSOpDhF8neTRW7zWQUDMmCvcO
 CAGVoDiO8BP7bfUQg1BReaQ7iDyTAdW4KrPC37k+8hm1nMbM5PwC8oWftJwVMPQWm632bo
 dj/2LeRuuImA45fTM3GS/8jrDJB7fEw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1655723872;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=//gRniEXycrsw2YDT7Cu3MIJErpMziUlBMbR3tNHMAU=;
 b=4iIk2ViUM8HhN5vEhSyhp8YMnt8DPLK9tc6EHTLDKxJ91NHl/i8mFQ14vfXWxvmg51LuZF
 3xgWYdGIBM+n6fBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3633B134CA;
 Mon, 20 Jun 2022 11:17:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id iw1iDGBXsGLVewAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 20 Jun 2022 11:17:52 +0000
Message-ID: <4821a0f1-be26-1e0b-4361-fc1b4060dce2@suse.de>
Date: Mon, 20 Jun 2022 13:17:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 47/64] drm/vc4: txp: Switch to drmm_kzalloc
Content-Language: en-US
To: Maxime Ripard <maxime@cerno.tech>, Daniel Vetter
 <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
References: <20220610092924.754942-1-maxime@cerno.tech>
 <20220610092924.754942-48-maxime@cerno.tech>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220610092924.754942-48-maxime@cerno.tech>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------3HtKh4lFcFpkQrpm1RdzHzeZ"
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------3HtKh4lFcFpkQrpm1RdzHzeZ
Content-Type: multipart/mixed; boundary="------------hyiRq8Vim0HaIwjYOXH2IWif";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Maxime Ripard <maxime@cerno.tech>, Daniel Vetter
 <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org
Message-ID: <4821a0f1-be26-1e0b-4361-fc1b4060dce2@suse.de>
Subject: Re: [PATCH 47/64] drm/vc4: txp: Switch to drmm_kzalloc
References: <20220610092924.754942-1-maxime@cerno.tech>
 <20220610092924.754942-48-maxime@cerno.tech>
In-Reply-To: <20220610092924.754942-48-maxime@cerno.tech>

--------------hyiRq8Vim0HaIwjYOXH2IWif
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQoNCkFtIDEwLjA2LjIyIHVtIDExOjI5IHNjaHJpZWIgTWF4aW1lIFJpcGFyZDoNCj4gT3Vy
IGludGVybmFsIHN0cnVjdHVyZSB0aGF0IHN0b3JlcyB0aGUgRFJNIGVudGl0aWVzIHN0cnVj
dHVyZSBpcyBhbGxvY2F0ZWQNCj4gdGhyb3VnaCBhIGRldmljZS1tYW5hZ2VkIGt6YWxsb2Mu
DQo+IA0KPiBUaGlzIG1lYW5zIHRoYXQgdGhpcyB3aWxsIGV2ZW50dWFsbHkgYmUgZnJlZWQg
d2hlbmV2ZXIgdGhlIGRldmljZSBpcw0KPiByZW1vdmVkLiBJbiBvdXIgY2FzZSwgdGhlIG1v
c3QgbGlrZSBzb3VyY2Ugb2YgcmVtb3ZhbCBpcyB0aGF0IHRoZSBtYWluDQo+IGRldmljZSBp
cyBnb2luZyB0byBiZSB1bmJvdW5kLCBhbmQgY29tcG9uZW50X3VuYmluZF9hbGwoKSBpcyBi
ZWluZyBydW4uDQo+IA0KPiBIb3dldmVyLCBpdCBvY2N1cnMgd2hpbGUgdGhlIERSTSBkZXZp
Y2UgaXMgc3RpbGwgcmVnaXN0ZXJlZCwgd2hpY2ggd2lsbA0KPiBjcmVhdGUgZGFuZ2xpbmcg
cG9pbnRlcnMsIGV2ZW50dWFsbHkgcmVzdWx0aW5nIGluIHVzZS1hZnRlci1mcmVlLg0KPiAN
Cj4gU3dpdGNoIHRvIGEgRFJNLW1hbmFnZWQgYWxsb2NhdGlvbiB0byBrZWVwIG91ciBzdHJ1
Y3R1cmUgdW50aWwgdGhlIERSTQ0KPiBkcml2ZXIgZG9lc24ndCBuZWVkIGl0IGFueW1vcmUu
DQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBNYXhpbWUgUmlwYXJkIDxtYXhpbWVAY2Vybm8udGVj
aD4NCg0KQWNrZWQtYnk6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRl
Pg0KDQo+IC0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS92YzQvdmM0X3R4cC5jIHwgMiArLQ0K
PiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPiAN
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS92YzQvdmM0X3R4cC5jIGIvZHJpdmVy
cy9ncHUvZHJtL3ZjNC92YzRfdHhwLmMNCj4gaW5kZXggNTFhYzAxODM4MDkzLi42YTE2YjI3
OTg3MjQgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS92YzQvdmM0X3R4cC5jDQo+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS92YzQvdmM0X3R4cC5jDQo+IEBAIC00NzcsNyArNDc3
LDcgQEAgc3RhdGljIGludCB2YzRfdHhwX2JpbmQoc3RydWN0IGRldmljZSAqZGV2LCBzdHJ1
Y3QgZGV2aWNlICptYXN0ZXIsIHZvaWQgKmRhdGEpDQo+ICAgCWlmIChpcnEgPCAwKQ0KPiAg
IAkJcmV0dXJuIGlycTsNCj4gICANCj4gLQl0eHAgPSBkZXZtX2t6YWxsb2MoZGV2LCBzaXpl
b2YoKnR4cCksIEdGUF9LRVJORUwpOw0KPiArCXR4cCA9IGRybW1fa3phbGxvYyhkcm0sIHNp
emVvZigqdHhwKSwgR0ZQX0tFUk5FTCk7DQo+ICAgCWlmICghdHhwKQ0KPiAgIAkJcmV0dXJu
IC1FTk9NRU07DQo+ICAgCXZjNF9jcnRjID0gJnR4cC0+YmFzZTsNCg0KLS0gDQpUaG9tYXMg
WmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBT
b2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcs
IEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVy
OiBJdm8gVG90ZXYNCg==

--------------hyiRq8Vim0HaIwjYOXH2IWif--

--------------3HtKh4lFcFpkQrpm1RdzHzeZ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmKwV18FAwAAAAAACgkQlh/E3EQov+CN
5BAAlxG1RVyej6XIkdYU17oijM/cOTSkfYWM2cNjjx5kVXR7G+ubzuwNkmtZp9k5m8vZwouEBpPM
FMZ+71meeF9r1WSFQiBz/ZqU8ok3Dd7s7+TlqSW1hX60uM4lRsBWPOHUR5p+ToKB/+Ys9GCpiYpg
D+Li2BckoyfpA9cWZURqGraThofucfyvRUCs+fjV37RdwpuKvmM9pZ8/5LuJztugopzo/dTmpP3/
G2tfLwN7u/Q4bfrSHqfIY2vYOs+iTPRxU6EVdLzFhb7gn9dzqvvmz4KnK27sgfev16SheIqDAMLQ
qIiWf44sc+6yi0fk0HKxV+G7Z8I8Lt4TMagEL69fpnwRs1zH3NPyRGziER9wvlcFZPSNWxDfpjCD
oXOHIJt2IKVLzbJD0umdOWhjD7PyrxauuiaWn3Jrb4qriqKWs9oXp1GBpycJwIWXiFtvUjlhlc0c
pvJJkH/mY2NCbVUfiE0n26wQMyGuoDJJ38yk4sqPk2SqWWxxozi7nD6F0xyxwgTkgT0rY33PxvVA
1d8sjTtJE+hk7SNevYKn49Mnjlzer/19GAgvojtS1qbPH5jV/iFLYe1Hsc2gUZ6y/L6D4RA38wE7
jqsRiuB9h0+KF480q/pbLFY5X6UXc40EEG9ytToYKP3GaE3atKaXee4M/NiCmvSvCTh0M5dyl1TV
4Ig=
=eMOt
-----END PGP SIGNATURE-----

--------------3HtKh4lFcFpkQrpm1RdzHzeZ--
