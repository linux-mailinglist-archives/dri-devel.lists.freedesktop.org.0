Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FDB563B0E7
	for <lists+dri-devel@lfdr.de>; Mon, 28 Nov 2022 19:16:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88A8110E31E;
	Mon, 28 Nov 2022 18:16:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E49110E31E
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Nov 2022 18:16:14 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 838EC21B97;
 Mon, 28 Nov 2022 18:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1669659372; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PUQIB+R6qTsg6FPVAzh0VGApvHml/NLUxWGKTzABhGU=;
 b=CRHayQa4xuJGBz2FGOG3fa3vRILOar2W0276nbTgdbMi395RANszfGck5vRQXmKui5xuBm
 XSw5kwy/Sbn3t+iB8nzaQzqCxANqRA95TaO6xF8ZMbqe4NXjJdKyBkUhkQhiVpXjZ3N3Pv
 9OjFNfanuiIwQqNy4bcwNy1gdQS541Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1669659372;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PUQIB+R6qTsg6FPVAzh0VGApvHml/NLUxWGKTzABhGU=;
 b=DqED/QVGOYrRYc1wdZS3XNO4SAwjUfaOy1aw/Zy9cJp1edcLk4A5Dllfqz8uVbetCaUTN5
 IzgI5j/NBgwZvoDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5148913273;
 Mon, 28 Nov 2022 18:16:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id R/7CEuz6hGOdHgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 28 Nov 2022 18:16:12 +0000
Message-ID: <12b18ff8-532e-66bd-1c34-2880c1762a22@suse.de>
Date: Mon, 28 Nov 2022 19:16:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2] drm: Only select I2C_ALGOBIT for drivers that actually
 need it
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20220912091505.149423-1-u.kleine-koenig@pengutronix.de>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220912091505.149423-1-u.kleine-koenig@pengutronix.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Q00hcGZJ3erXJ39iTtfyBf0b"
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
Cc: dri-devel@lists.freedesktop.org, kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------Q00hcGZJ3erXJ39iTtfyBf0b
Content-Type: multipart/mixed; boundary="------------EyX02tuSgXBrKwVvj2MM2u0W";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: kernel@pengutronix.de, dri-devel@lists.freedesktop.org
Message-ID: <12b18ff8-532e-66bd-1c34-2880c1762a22@suse.de>
Subject: Re: [PATCH v2] drm: Only select I2C_ALGOBIT for drivers that actually
 need it
References: <20220912091505.149423-1-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20220912091505.149423-1-u.kleine-koenig@pengutronix.de>

--------------EyX02tuSgXBrKwVvj2MM2u0W
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTIuMDkuMjIgdW0gMTE6MTUgc2NocmllYiBVd2UgS2xlaW5lLUvDtm5pZzoN
Cj4gV2hpbGUgd29ya2luZyBvbiBhIGRybSBkcml2ZXIgdGhhdCBkb2Vzbid0IG5lZWQgdGhl
IGkyYyBhbGdvYml0IHN0dWZmIEkNCj4gbm90aWNlZCB0aGF0IERSTSBzZWxlY3RzIHRoaXMg
Y29kZSBldmVuIHRvdWdoIG9ubHkgOCBkcml2ZXJzIGFjdHVhbGx5IHVzZQ0KPiBpdC4gV2hp
bGUgYWxzbyBvbmx5IHNvbWUgZHJpdmVycyB1c2UgaTJjLCBrZWVwIHRoZSBzZWxlY3QgZm9y
IEkyQyBmb3IgdGhlDQo+IG5leHQgY2xlYW51cCBwYXRjaC4gU3RpbGwgcHJlcGFyZSB0aGlz
IGFscmVhZHkgYnkgYWxzbyBzZWxlY3RpbmcgSTJDIGZvcg0KPiB0aGUgaW5kaXZpZHVhbCBk
cml2ZXJzLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xl
aW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4NCj4gLS0tDQo+IENoYW5nZXMgc2luY2UgdjEN
Cj4gKDIwMjEwNTE0MTAwMTQyLjExODI5OTctMS11LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9u
aXguZGUpIGZyb20NCj4gMjAyMS0wNS0xNDoNCj4gDQo+ICAgLSByZWJhc2VkIHRvIG5leHQt
MjAyMjA5MDkNCj4gICAgIHdhcyBzb21ldGhpbmcgYXJvdW5kIHY1LjEzLXJjMiBiZWZvcmUs
IHJlcXVpcmVkIHRvIGZpeCBjb250ZXh0DQo+ICAgICBjaGFuZ2VzIGluIHRoZSBub3V2ZWF1
IEtjb25maWcgZmlsZS4gZ2l0IGFtIC0zIGhhbmRsZWQgaXQganVzdCBmaW5lLg0KPiANCj4g
SSByZXZlcmlmaWVkIHRoYXQgbm8gbmV3IGRyaXZlcnMgd2VyZSBhZGRlZCB0aGF0IG5lZWQg
YSBjb3JyZXNwb25kaW5nDQo+IHNlbGVjdC4NCj4gDQo+IEJlc3QgcmVnYXJkcw0KPiBVd2UN
Cj4gDQo+ICAgZHJpdmVycy9ncHUvZHJtL0tjb25maWcgICAgICAgICAgICAgICAgIHwgNSAr
KysrLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9hc3QvS2NvbmZpZyAgICAgICAgICAgICB8IDIg
KysNCj4gICBkcml2ZXJzL2dwdS9kcm0vZ21hNTAwL0tjb25maWcgICAgICAgICAgfCAyICsr
DQo+ICAgZHJpdmVycy9ncHUvZHJtL2hpc2lsaWNvbi9oaWJtYy9LY29uZmlnIHwgMiArKw0K
PiAgIGRyaXZlcnMvZ3B1L2RybS9pOTE1L0tjb25maWcgICAgICAgICAgICB8IDIgKysNCj4g
ICBkcml2ZXJzL2dwdS9kcm0vbWdhZzIwMC9LY29uZmlnICAgICAgICAgfCAyICsrDQo+ICAg
ZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvS2NvbmZpZyAgICAgICAgIHwgMiArKw0KPiAgIDcg
ZmlsZXMgY2hhbmdlZCwgMTYgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KDQphbWRn
cHUgYW5kIHJhZGVvbiBhbHNvIGluY2x1ZGUgPGxpbnV4L2kyYy1hbGdvLWJpdC5oPi4gQXJl
IHRoZXkgc3BlY2lhbCANCmluIHNvbWUgd2F5Pw0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0K
DQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL0tjb25maWcgYi9kcml2ZXJz
L2dwdS9kcm0vS2NvbmZpZw0KPiBpbmRleCAxOThiYTg0NmQzNGIuLjU5M2Q3MzM1YjEwYSAx
MDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL0tjb25maWcNCj4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL0tjb25maWcNCj4gQEAgLTEzLDcgKzEzLDYgQEAgbWVudWNvbmZpZyBEUk0N
Cj4gICAJc2VsZWN0IEhETUkNCj4gICAJc2VsZWN0IEZCX0NNRExJTkUNCj4gICAJc2VsZWN0
IEkyQw0KPiAtCXNlbGVjdCBJMkNfQUxHT0JJVA0KPiAgIAlzZWxlY3QgRE1BX1NIQVJFRF9C
VUZGRVINCj4gICAJc2VsZWN0IFNZTkNfRklMRQ0KPiAgICMgZ2FsbGl1bSB1c2VzIFNZU19r
Y21wIGZvciBvc19zYW1lX2ZpbGVfZGVzY3JpcHRpb24oKSB0byBkZS1kdXBsaWNhdGUNCj4g
QEAgLTIzMSw2ICsyMzAsOCBAQCBjb25maWcgRFJNX1JBREVPTg0KPiAgICAgICAgICAgc2Vs
ZWN0IERSTV9LTVNfSEVMUEVSDQo+ICAgICAgICAgICBzZWxlY3QgRFJNX1RUTQ0KPiAgIAlz
ZWxlY3QgRFJNX1RUTV9IRUxQRVINCj4gKwlzZWxlY3QgSTJDDQo+ICsJc2VsZWN0IEkyQ19B
TEdPQklUDQo+ICAgCXNlbGVjdCBQT1dFUl9TVVBQTFkNCj4gICAJc2VsZWN0IEhXTU9ODQo+
ICAgCXNlbGVjdCBCQUNLTElHSFRfQ0xBU1NfREVWSUNFDQo+IEBAIC0yNjIsNiArMjYzLDgg
QEAgY29uZmlnIERSTV9BTURHUFUNCj4gICAJc2VsZWN0IERSTV9TQ0hFRA0KPiAgIAlzZWxl
Y3QgRFJNX1RUTQ0KPiAgIAlzZWxlY3QgRFJNX1RUTV9IRUxQRVINCj4gKwlzZWxlY3QgSTJD
DQo+ICsJc2VsZWN0IEkyQ19BTEdPQklUDQo+ICAgCXNlbGVjdCBQT1dFUl9TVVBQTFkNCj4g
ICAJc2VsZWN0IEhXTU9ODQo+ICAgCXNlbGVjdCBCQUNLTElHSFRfQ0xBU1NfREVWSUNFDQo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXN0L0tjb25maWcgYi9kcml2ZXJzL2dw
dS9kcm0vYXN0L0tjb25maWcNCj4gaW5kZXggZmJjZjJmNDVjZWY1Li5iY2MyNWRlY2Q0ODUg
MTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hc3QvS2NvbmZpZw0KPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vYXN0L0tjb25maWcNCj4gQEAgLTYsNiArNiw4IEBAIGNvbmZpZyBE
Uk1fQVNUDQo+ICAgCXNlbGVjdCBEUk1fVlJBTV9IRUxQRVINCj4gICAJc2VsZWN0IERSTV9U
VE0NCj4gICAJc2VsZWN0IERSTV9UVE1fSEVMUEVSDQo+ICsJc2VsZWN0IEkyQw0KPiArCXNl
bGVjdCBJMkNfQUxHT0JJVA0KPiAgIAloZWxwDQo+ICAgCSBTYXkgeWVzIGZvciBleHBlcmlt
ZW50YWwgQVNUIEdQVSBkcml2ZXIuIERvIG5vdCBlbmFibGUNCj4gICAJIHRoaXMgZHJpdmVy
IHdpdGhvdXQgaGF2aW5nIGEgd29ya2luZyAtbW9kZXNldHRpbmcsDQo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vZ21hNTAwL0tjb25maWcgYi9kcml2ZXJzL2dwdS9kcm0vZ21h
NTAwL0tjb25maWcNCj4gaW5kZXggODA3Yjk4OWUzYzc3Li4yZWZjMGViNDFjNjQgMTAwNjQ0
DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9nbWE1MDAvS2NvbmZpZw0KPiArKysgYi9kcml2
ZXJzL2dwdS9kcm0vZ21hNTAwL0tjb25maWcNCj4gQEAgLTMsNiArMyw4IEBAIGNvbmZpZyBE
Uk1fR01BNTAwDQo+ICAgCXRyaXN0YXRlICJJbnRlbCBHTUE1MDAvNjAwLzM2MDAvMzY1MCBL
TVMgRnJhbWVidWZmZXIiDQo+ICAgCWRlcGVuZHMgb24gRFJNICYmIFBDSSAmJiBYODYgJiYg
TU1VDQo+ICAgCXNlbGVjdCBEUk1fS01TX0hFTFBFUg0KPiArCXNlbGVjdCBJMkMNCj4gKwlz
ZWxlY3QgSTJDX0FMR09CSVQNCj4gICAJIyBHTUE1MDAgZGVwZW5kcyBvbiBBQ1BJX1ZJREVP
IHdoZW4gQUNQSSBpcyBlbmFibGVkLCBqdXN0IGxpa2UgaTkxNQ0KPiAgIAlzZWxlY3QgQUNQ
SV9WSURFTyBpZiBBQ1BJDQo+ICAgCXNlbGVjdCBCQUNLTElHSFRfQ0xBU1NfREVWSUNFIGlm
IEFDUEkNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9oaXNpbGljb24vaGlibWMv
S2NvbmZpZyBiL2RyaXZlcnMvZ3B1L2RybS9oaXNpbGljb24vaGlibWMvS2NvbmZpZw0KPiBp
bmRleCAwNzNhZGZlNDM4ZGQuLjkwYjllNmNjZTQ5YyAxMDA2NDQNCj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2hpc2lsaWNvbi9oaWJtYy9LY29uZmlnDQo+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS9oaXNpbGljb24vaGlibWMvS2NvbmZpZw0KPiBAQCAtNiw2ICs2LDggQEAgY29uZmln
IERSTV9ISVNJX0hJQk1DDQo+ICAgCXNlbGVjdCBEUk1fVlJBTV9IRUxQRVINCj4gICAJc2Vs
ZWN0IERSTV9UVE0NCj4gICAJc2VsZWN0IERSTV9UVE1fSEVMUEVSDQo+ICsJc2VsZWN0IEky
Qw0KPiArCXNlbGVjdCBJMkNfQUxHT0JJVA0KPiAgIAloZWxwDQo+ICAgCSAgQ2hvb3NlIHRo
aXMgb3B0aW9uIGlmIHlvdSBoYXZlIGEgSGlzaWxpY29uIEhpYm1jIHNvYyBjaGlwc2V0Lg0K
PiAgIAkgIElmIE0gaXMgc2VsZWN0ZWQgdGhlIG1vZHVsZSB3aWxsIGJlIGNhbGxlZCBoaWJt
Yy1kcm0uDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9LY29uZmlnIGIv
ZHJpdmVycy9ncHUvZHJtL2k5MTUvS2NvbmZpZw0KPiBpbmRleCAzZWZjZTA1ZDdiNTcuLmM2
ZTM3OTI2MjJmMiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvS2NvbmZp
Zw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9LY29uZmlnDQo+IEBAIC0xOCw2ICsx
OCw4IEBAIGNvbmZpZyBEUk1fSTkxNQ0KPiAgIAlzZWxlY3QgRFJNX1BBTkVMDQo+ICAgCXNl
bGVjdCBEUk1fTUlQSV9EU0kNCj4gICAJc2VsZWN0IFJFTEFZDQo+ICsJc2VsZWN0IEkyQw0K
PiArCXNlbGVjdCBJMkNfQUxHT0JJVA0KPiAgIAlzZWxlY3QgSVJRX1dPUksNCj4gICAJIyBp
OTE1IGRlcGVuZHMgb24gQUNQSV9WSURFTyB3aGVuIEFDUEkgaXMgZW5hYmxlZA0KPiAgIAkj
IGJ1dCBmb3Igc2VsZWN0IHRvIHdvcmssIG5lZWQgdG8gc2VsZWN0IEFDUElfVklERU8ncyBk
ZXBlbmRlbmNpZXMsIGljaw0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21nYWcy
MDAvS2NvbmZpZyBiL2RyaXZlcnMvZ3B1L2RybS9tZ2FnMjAwL0tjb25maWcNCj4gaW5kZXgg
ZWVjNTk2NThhOTM4Li5iMjhjNWU0ODI4ZjQgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9tZ2FnMjAwL0tjb25maWcNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21nYWcyMDAv
S2NvbmZpZw0KPiBAQCAtNCw2ICs0LDggQEAgY29uZmlnIERSTV9NR0FHMjAwDQo+ICAgCWRl
cGVuZHMgb24gRFJNICYmIFBDSSAmJiBNTVUNCj4gICAJc2VsZWN0IERSTV9HRU1fU0hNRU1f
SEVMUEVSDQo+ICAgCXNlbGVjdCBEUk1fS01TX0hFTFBFUg0KPiArCXNlbGVjdCBJMkMNCj4g
KwlzZWxlY3QgSTJDX0FMR09CSVQNCj4gICAJaGVscA0KPiAgIAkgVGhpcyBpcyBhIEtNUyBk
cml2ZXIgZm9yIE1hdHJveCBHMjAwIGNoaXBzLiBJdCBzdXBwb3J0cyB0aGUgb3JpZ2luYWwN
Cj4gICAJIE1HQSBHMjAwIGRlc2t0b3AgY2hpcHMgYW5kIHRoZSBzZXJ2ZXIgdmFyaWFudHMu
IEl0IHJlcXVpcmVzIDAuMy4wDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbm91
dmVhdS9LY29uZmlnIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvS2NvbmZpZw0KPiBpbmRl
eCAwM2QxMmNhZjllMjYuLmEwYmIzOTg3YmY2MyAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL25vdXZlYXUvS2NvbmZpZw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVh
dS9LY29uZmlnDQo+IEBAIC0xMCw2ICsxMCw4IEBAIGNvbmZpZyBEUk1fTk9VVkVBVQ0KPiAg
IAlzZWxlY3QgRFJNX0tNU19IRUxQRVINCj4gICAJc2VsZWN0IERSTV9UVE0NCj4gICAJc2Vs
ZWN0IERSTV9UVE1fSEVMUEVSDQo+ICsJc2VsZWN0IEkyQw0KPiArCXNlbGVjdCBJMkNfQUxH
T0JJVA0KPiAgIAlzZWxlY3QgQkFDS0xJR0hUX0NMQVNTX0RFVklDRSBpZiBEUk1fTk9VVkVB
VV9CQUNLTElHSFQNCj4gICAJc2VsZWN0IFg4Nl9QTEFURk9STV9ERVZJQ0VTIGlmIEFDUEkg
JiYgWDg2DQo+ICAgCXNlbGVjdCBBQ1BJX1dNSSBpZiBBQ1BJICYmIFg4Ng0KDQotLSANClRo
b21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3
YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJu
YmVyZywgR2VybWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bD
vGhyZXI6IEl2byBUb3Rldg0K

--------------EyX02tuSgXBrKwVvj2MM2u0W--

--------------Q00hcGZJ3erXJ39iTtfyBf0b
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmOE+usFAwAAAAAACgkQlh/E3EQov+BX
vA/8CBtuTFY4uHyYKbT9/8FxWkZ8pwp+zzejLCjtk6zBVusfP8byh+P+ZjHDwWvR0H45EHp+8JzR
CL8CdQ9dlu7gkyJWDxDXd1gNdonEL8Lu+Osm9MmqRpY4CLh9XGZOpk5cDyI5Vz5T+KQBfbEWOhnN
3wEYoGcwaxN01YlZ5frx+MTUVB22fw7CxFD0RgRnQGy1LS68N5x1pddMB+m+o8Op6V9Ae2LoikiX
8rViGLni/tYGzyJUoFQGFJ5uBxfynzb8xAHYWX+es+RZPkkx1OZ3bBC3WqahxprdzvrXxrbu2s2q
hRGrHHMAKyLweopAOrSmisEd2pbIAu6qhJOeROaTvUOasOFz+eZEFVOoe4Z6lD5/g90zeFkbuwX3
CCRj7i1epUUdykNq7zR+5+/01CRi5fJ+nzTGyL4R2Wx0pQGGjDbPwEq/kCTbbQMLu1LBKG5pgqOV
4kBBZVX6DWLPDlGrZ/LR0RJqnu4D8sMpThXK/1Whk2LZfpZ4guXaeK1UZx2aGuHg9AAKweSCz/ql
c83TB929PXCH9l6IU90JUTezkNnc1RchA9AAv5JOv9BCkH305Lp4bMjdtUSMdh6J4qQhM2Yjaorf
kg4ScNoBiYzChTrZvAq6ZAYh0b1JtUlg9oiaN0ToMJidivUc61QwUTmiRLiz33/KRMdLyuQO16Vz
YRA=
=bbCJ
-----END PGP SIGNATURE-----

--------------Q00hcGZJ3erXJ39iTtfyBf0b--
