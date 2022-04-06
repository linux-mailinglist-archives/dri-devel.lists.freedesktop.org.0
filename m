Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 220414F6995
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 21:08:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D30B310E11E;
	Wed,  6 Apr 2022 19:08:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E77510E11E
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Apr 2022 19:08:45 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C102321118;
 Wed,  6 Apr 2022 19:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1649272123; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0QrFSmXMs3VRPfca3/bKbmBbMDQ5s9yfnFxr8Fs6kSM=;
 b=L7ZaOlM/Yy4AUsqfmgJCUoVX42QMRORBAcqJH2tgdt5v6rgEks4On5WAEpNkX4Nm91hx8m
 /AHFqyNC1RnM8zpxbFkYNizhAiV2dHEJRZsNX9aS+GOexXYS2zLNX9lcJ5ufQHzyfwksOg
 E5xayOdnWyv6wgUaa9nz/7whcsiKYmg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1649272123;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0QrFSmXMs3VRPfca3/bKbmBbMDQ5s9yfnFxr8Fs6kSM=;
 b=fpgUOxGH5rwnMPD/yFa8ISw3ZHywu7Ux9uG8RgNqTpcPUPmnNcM6aGLxXufzyBX5ZkstLm
 Qfd5U4trr2Wi3xCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8DE6D13A8E;
 Wed,  6 Apr 2022 19:08:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id //GHITvlTWLOEAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 06 Apr 2022 19:08:43 +0000
Message-ID: <b17ead61-b7f1-d57a-d51f-c961d8ad59a1@suse.de>
Date: Wed, 6 Apr 2022 21:08:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH 3/8] drm/display: Introduce a DRM display-helper module
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>, daniel@ffwll.ch,
 airlied@linux.ie, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 jani.nikula@linux.intel.com, lyude@redhat.com
References: <20220322192743.14414-1-tzimmermann@suse.de>
 <20220322192743.14414-4-tzimmermann@suse.de>
 <e02eceb6-4bf5-3641-502e-9e5a246ae5fd@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <e02eceb6-4bf5-3641-502e-9e5a246ae5fd@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------wIWVqJiDJMs68y6oPpC7q0m0"
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
--------------wIWVqJiDJMs68y6oPpC7q0m0
Content-Type: multipart/mixed; boundary="------------KjcEDq83RLIaetFnLeidl0SX";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>, daniel@ffwll.ch,
 airlied@linux.ie, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 jani.nikula@linux.intel.com, lyude@redhat.com
Cc: dri-devel@lists.freedesktop.org
Message-ID: <b17ead61-b7f1-d57a-d51f-c961d8ad59a1@suse.de>
Subject: Re: [PATCH 3/8] drm/display: Introduce a DRM display-helper module
References: <20220322192743.14414-1-tzimmermann@suse.de>
 <20220322192743.14414-4-tzimmermann@suse.de>
 <e02eceb6-4bf5-3641-502e-9e5a246ae5fd@redhat.com>
In-Reply-To: <e02eceb6-4bf5-3641-502e-9e5a246ae5fd@redhat.com>

--------------KjcEDq83RLIaetFnLeidl0SX
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgSmF2aWVyDQoNCkFtIDMwLjAzLjIyIHVtIDExOjIzIHNjaHJpZWIgSmF2aWVyIE1hcnRp
bmV6IENhbmlsbGFzOg0KPiBPbiAzLzIyLzIyIDIwOjI3LCBUaG9tYXMgWmltbWVybWFubiB3
cm90ZToNCj4+IFJlcGxhY2UgdGhlIERQLWhlbHBlciBtb2R1bGUgd2l0aCBhIGRpc3BsYXkt
aGVscGVyIG1vZHVsZS4gVXBkYXRlDQo+PiBhbGwgcmVsYXRlZCBLY29uZmlnIGFuZCBNYWtl
ZmlsZSBydWxlcy4NCj4+DQo+PiBCZXNpZGVzIHRoZSBleGlzdGluZyBjb2RlIGZvciBEaXNw
bGF5UG9ydCwgdGhlIG5ldyBtb2R1bGUgd2lsbA0KPj4gY29udGFpbiBoZWxwZXJzIGZvciBv
dGhlciB2aWRlby1vdXRwdXQgc3RhbmRhcmRzLCBzdWNoIGFzIEhETUkuDQo+PiBEcml2ZXJz
IHdpbGwgc3RpbGwgYmUgYWJsZSB0byBzZWxlY3QgdGhlIHJlcXVpcmVkIHZpZGVvLW91dHB1
dA0KPj4gaGVscGVycy4gTGlua2luZyBhbGwgc3VjaCBjb2RlIGludG8gYSBzaW5nbGUgbW9k
dWxlIGF2b2lkcyB0aGUNCj4+IHByb2xpZmVyYXRpb24gb2Ygc21hbGwga2VybmVsIG1vZHVs
ZXMuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJt
YW5uQHN1c2UuZGU+DQo+PiAtLS0NCj4gDQo+IFtzbmlwXQ0KPiANCj4+ICtjb25maWcgRFJN
X0RJU1BMQVlfSEVMUEVSDQo+PiArCXRyaXN0YXRlDQo+PiArCWRlcGVuZHMgb24gRFJNDQo+
PiArCWhlbHANCj4+ICsJICBEUk0gaGVscGVycyBmb3IgZGlzcGxheSBhZGFwdGVycy4NCj4+
ICsNCj4+ICAgY29uZmlnIERSTV9EUF9IRUxQRVINCj4+ICAgCXRyaXN0YXRlDQo+PiAgIAlk
ZXBlbmRzIG9uIERSTQ0KPj4gKwlzZWxlY3QgRFJNX0RJU1BMQVlfSEVMUEVSDQo+PiAgIAlo
ZWxwDQo+PiAgIAkgIERSTSBoZWxwZXJzIGZvciBEaXNwbGF5UG9ydC4NCj4+DQo+IA0KPiBJ
IHdhcyBhYm91dCB0byBhc2sgd2h5IHRoaXMgd291bGQgc3RpbGwgYmUgbmVlZGVkIGJ1dCB0
aGVuIHJlLXJlYWQgdGhlDQo+IGNvbW1pdCBtZXNzYWdlIHRoYXQgc2F5cyBkcml2ZXJzIHdp
bGwgc3RpbGwgYmUgYWJsZSB0byBzZWxlY3QgcmVxdWlyZWQNCj4gdmlkZW8tb3V0cHV0IGhl
bHBlcnMuDQo+IA0KPiBUaGF0IG1ha2VzIHNlbnNlIHNpbmNlIHRoZSBmYWN0IHRoYXQgYWxs
IGhlbHBlcnMgd2lsbCBiZSBpbiB0aGUgc2FtZSBtb2R1bGUNCj4gd291bGQgYmUgdHJhbnNw
YXJlbnQgdG8gZHJpdmVycy4NCg0KQWZ0ZXIgc29tZSBtb3JlIHRlc3RpbmcsIGl0IHR1cm5z
IG91dCB0byBiZSBub3Qgc28gZWFzeS4gRm9yIGV4YW1wbGUsIGlmIA0Kd2UgaGF2ZSBEUF9I
RUxQRVI9bSBhbmQgSERNSV9IRUxQRVI9eSwgdGhlbiBESVNQTEFZX0hFTFBFUiB3b3VsZCBi
ZSANCmF1dG8tc2VsZWN0ZWQgYXMgJ3knLiBUaGUgY29kZSBmb3IgRFBfSEVMUEVSIHdvdWxk
IG5vdCBiZSBsaW5rZWQgY29ycmVjdGx5Lg0KDQpJJ20gZ29pbmcgdG8gbWFrZSBkcml2ZXJz
IHNlbGVjdCBESVNQTEFZX0hFTFBFUiBhbmQgdGhlIHJzcCBoZWxwZXJzIA0KZXhwbGljaXRs
eS4gVGhlIGluZGl2aWR1YWwgaGVscGVycyB3b3VsZCBiZSBjb3ZlcmVkIGJvb2xlYW4gb3B0
aW9ucyB0aGF0IA0KZW5hYmxlIHRoZSBmZWF0dXJlIGluIHRoZSBkaXNwbGF5LWhlbHBlciBs
aWJyYXJ5Lg0KDQpJZiB5b3Uga25vdyBzb21lIEtjb25maWcgbWFnaWMgdG8gZW5hYmxlIHRo
ZSBvcmlnaW5hbCBkZXNpZ24sIGxldCBtZSBrbm93Lg0KDQpCZXN0IHJlZ2FyZHMNClRob21h
cw0KDQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9w
ZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4g
NSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcp
DQpHZXNjaMOkZnRzZsO8aHJlcjogSXZvIFRvdGV2DQo=

--------------KjcEDq83RLIaetFnLeidl0SX--

--------------wIWVqJiDJMs68y6oPpC7q0m0
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmJN5ToFAwAAAAAACgkQlh/E3EQov+DE
7hAAiIIP2vDhd8TLFCDq3bCW1vC7zoBuZA1Gkod+8XPWXgyd9b8+LF3aacRavGoaTOOZCrMol+Hq
qrYAhKEfIaXv5FtfFeNK2iyIn2AIaLghTJf64ZgC469rGu+No7J7lI8ppuo2TUN4em6Aj5YBvNas
7jKbtQVA4hIVF/Uw0YT0z7AxTQI4l9KUMv7amr5pb/3wXc+yCB9g1QDtf3kyrkVRSZSRcy3Cztft
7+D+wDnBFfF2P+karanCAJhc55cFr8cdEcXeSOFmFsBjQjQPaLpvOCq8Txr+ZfLpBkLSmPcWY0UO
hZkecDMoAUQJxrDCTOXQBkxaathWZ7P8lPfi76P6iaOpWgVCfINilQAbUPC04Z2XC/gAbMqScR0n
ZlBpt8/ubp9Ou3cexa6JJckgoeYe49PyDFkYcG7yX6kO8GlDd9Hj+WBR4/V77fhIj8W4QeNM50s7
n7a37u/9KYax2nf/K/2LGLccKVXJyqOjE24bS5MDd0b/YFX1XoAdq40Vj4efwfNqxmtVIcrI4pjv
KF3AYAnUqy4BEyQHXAcuOqt+gJSbbf2+9JefX/Sppt/etClVfHFl7nhCeIW9L8HjqhonreLQUJFr
rjXZTOxrIHFToiXUFkh0j2u8dTtwbMSO7c+W9rfJ2XDa15xDLatOUkH7KT1Rln32A1CKMWeWiULd
wzs=
=vNJR
-----END PGP SIGNATURE-----

--------------wIWVqJiDJMs68y6oPpC7q0m0--
