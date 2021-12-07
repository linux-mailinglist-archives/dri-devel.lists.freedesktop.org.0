Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4020446B8F3
	for <lists+dri-devel@lfdr.de>; Tue,  7 Dec 2021 11:27:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56C3DEA9AB;
	Tue,  7 Dec 2021 10:27:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD96AEA9AA
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Dec 2021 10:27:12 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 7F82A21B3F;
 Tue,  7 Dec 2021 10:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1638872831; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=B2CJA5Nc7uTm5A4oHEemmUX6vUXG5rOLhAh+B+soZWY=;
 b=nOxfNBsWnJDT7W+/8SL3NL5/fZ10foJrVSEjnDI1XFyLZYAvVbrFa69E3mYVwvnsY4Dovg
 1TzWfQgMe8SpWZslybwCMrqExLMqr4UVfdkeOQWIZfynsBHa4yl+pEETQWRaG40LqmkFrG
 yAM+ywyKxh0ub94lbzbeSoCysOvyBpg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1638872831;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=B2CJA5Nc7uTm5A4oHEemmUX6vUXG5rOLhAh+B+soZWY=;
 b=1ytn9YJnJ2DqyQsBAE+dEYIx5IDZ/D3ZVBEz0V3xYL7fMtfl55b+2f254nSX1Ev+ZpoKM8
 xax4/5/Ylo8G/fAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4433413A1F;
 Tue,  7 Dec 2021 10:27:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id BF1+D/82r2E3bwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 07 Dec 2021 10:27:11 +0000
Message-ID: <53d9f15e-bc82-6106-89d0-d928e1ecbbcb@suse.de>
Date: Tue, 7 Dec 2021 11:27:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH v2 2/3] drm/format-helper: Add
 drm_fb_xrgb8888_to_xrgb2101010_toio()
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Hector Martin <marcan@marcan.st>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>
References: <20211207072943.121961-1-marcan@marcan.st>
 <20211207072943.121961-3-marcan@marcan.st>
 <03a52a64-7be3-b401-7711-b7b1452f433d@suse.de>
 <c339c133-25d0-3c8e-e776-b61108836528@marcan.st>
 <afce9a18-8819-56ba-91d9-71b061186d69@suse.de>
In-Reply-To: <afce9a18-8819-56ba-91d9-71b061186d69@suse.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------WeUyxZULbXgg3oq0IT5qcT1e"
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
Cc: dri-devel@lists.freedesktop.org,
 Javier Martinez Canillas <javier@dowhile0.org>, linux-kernel@vger.kernel.org,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------WeUyxZULbXgg3oq0IT5qcT1e
Content-Type: multipart/mixed; boundary="------------n7bFK7M0mO0MtcGlFl05qdB0";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Hector Martin <marcan@marcan.st>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>
Cc: Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Javier Martinez Canillas <javier@dowhile0.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Message-ID: <53d9f15e-bc82-6106-89d0-d928e1ecbbcb@suse.de>
Subject: Re: [PATCH v2 2/3] drm/format-helper: Add
 drm_fb_xrgb8888_to_xrgb2101010_toio()
References: <20211207072943.121961-1-marcan@marcan.st>
 <20211207072943.121961-3-marcan@marcan.st>
 <03a52a64-7be3-b401-7711-b7b1452f433d@suse.de>
 <c339c133-25d0-3c8e-e776-b61108836528@marcan.st>
 <afce9a18-8819-56ba-91d9-71b061186d69@suse.de>
In-Reply-To: <afce9a18-8819-56ba-91d9-71b061186d69@suse.de>

--------------n7bFK7M0mO0MtcGlFl05qdB0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQoNCkFtIDA3LjEyLjIxIHVtIDExOjIwIHNjaHJpZWIgVGhvbWFzIFppbW1lcm1hbm46DQo+
IEhpDQo+IA0KPiBBbSAwNy4xMi4yMSB1bSAxMDo1NCBzY2hyaWViIEhlY3RvciBNYXJ0aW46
DQo+PiBIaSwgdGhhbmtzIGZvciB0aGUgcmV2aWV3IQ0KPj4NCj4+IE9uIDA3LzEyLzIwMjEg
MTguNDAsIFRob21hcyBaaW1tZXJtYW5uIHdyb3RlOg0KPj4+IEhpDQo+Pj4NCj4+PiBBbSAw
Ny4xMi4yMSB1bSAwODoyOSBzY2hyaWViIEhlY3RvciBNYXJ0aW46DQo+Pj4+IEFkZCBYUkdC
ODg4OCBlbXVsYXRpb24gc3VwcG9ydCBmb3IgZGV2aWNlcyB0aGF0IGNhbiBvbmx5IGRvIA0K
Pj4+PiBYUkdCMjEwMTAxMC4NCj4+Pj4NCj4+Pj4gVGhpcyBpcyBjaGllZmx5IHVzZWZ1bCBm
b3Igc2ltcGxlZHJtIG9uIEFwcGxlIGRldmljZXMgd2hlcmUgdGhlDQo+Pj4+IGJvb3Rsb2Fk
ZXItcHJvdmlkZWQgZnJhbWVidWZmZXIgaXMgMTAtYml0Lg0KPj4+Pg0KPj4+PiBTaWduZWQt
b2ZmLWJ5OiBIZWN0b3IgTWFydGluIDxtYXJjYW5AbWFyY2FuLnN0Pg0KPj4+PiAtLS0NCj4+
Pj4gwqDCoCBkcml2ZXJzL2dwdS9kcm0vZHJtX2Zvcm1hdF9oZWxwZXIuYyB8IDYyIA0KPj4+
PiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKw0KPj4+PiDCoMKgIGluY2x1ZGUvZHJt
L2RybV9mb3JtYXRfaGVscGVyLmjCoMKgwqDCoCB8wqAgMyArKw0KPj4+PiDCoMKgIDIgZmls
ZXMgY2hhbmdlZCwgNjUgaW5zZXJ0aW9ucygrKQ0KPj4+Pg0KPj4+PiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2RybV9mb3JtYXRfaGVscGVyLmMgDQo+Pj4+IGIvZHJpdmVycy9n
cHUvZHJtL2RybV9mb3JtYXRfaGVscGVyLmMNCj4+Pj4gaW5kZXggZGJlM2U4MzAwOTZlLi5l
ZGQ2MTFkM2FiNmEgMTAwNjQ0DQo+Pj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZm9y
bWF0X2hlbHBlci5jDQo+Pj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZm9ybWF0X2hl
bHBlci5jDQo+Pj4+IEBAIC00MDksNiArNDA5LDU5IEBAIHZvaWQgZHJtX2ZiX3hyZ2I4ODg4
X3RvX3JnYjg4OF90b2lvKHZvaWQgDQo+Pj4+IF9faW9tZW0gKmRzdCwgdW5zaWduZWQgaW50
IGRzdF9waXRjaCwNCj4+Pj4gwqDCoCB9DQo+Pj4+IMKgwqAgRVhQT1JUX1NZTUJPTChkcm1f
ZmJfeHJnYjg4ODhfdG9fcmdiODg4X3RvaW8pOw0KPj4+PiArc3RhdGljIHZvaWQgZHJtX2Zi
X3hyZ2I4ODg4X3RvX3hyZ2IyMTAxMDEwX2xpbmUodTMyICpkYnVmLCBjb25zdCANCj4+Pj4g
dTMyICpzYnVmLA0KPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCB1bnNpZ25lZCBpbnQgcGl4ZWxzKQ0KPj4+PiArew0KPj4+PiArwqDCoMKg
IHVuc2lnbmVkIGludCB4Ow0KPj4+PiArDQo+Pj4+ICvCoMKgwqAgZm9yICh4ID0gMDsgeCA8
IHBpeGVsczsgeCsrKSB7DQo+Pj4+ICvCoMKgwqDCoMKgwqDCoCAqZGJ1ZisrID0gKChzYnVm
W3hdICYgMHgwMDAwMDBGRikgPDwgMikgfA0KPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgKChzYnVmW3hdICYgMHgwMDAwRkYwMCkgPDwgNCkgfA0KPj4+PiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgKChzYnVmW3hdICYgMHgwMEZGMDAwMCkgPDwgNik7DQo+Pj4N
Cj4+PiBUaGlzIGlzbid0IHF1aXRlIHJpZ2h0LiBUaGUgbG93ZXN0IHR3byBkZXN0aW5hdGlv
biBiaXRzIGluIGVhY2gNCj4+PiBjb21wb25lbnQgd2lsbCBhbHdheXMgYmUgemVyby4gWW91
IGhhdmUgdG8gZG8gdGhlIHNoaWZ0aW5nIGFzIGFib3ZlIGFuZA0KPj4+IGZvciBlYWNoIGNv
bXBvbmVudCB0aGUgdHdvIGhpZ2hlc3Qgc291cmNlIGJpdHMgaGF2ZSB0byBiZSBPUidlZCBp
bnRvIHRoZQ0KPj4+IHR3byBsb3dlc3QgZGVzdGluYXRpb24gYml0cy4gRm9yIGV4YW1wbGUg
dGhlIHNvdXJjZSBiaXRzIGluIGEgY29tcG9uZW50DQo+Pj4gYXJlIG51bWJlcmVkIDcgdG8g
MA0KPj4+DQo+Pj4gwqDCoCB8IDcgNiA1IDQgMyAyIDEgMCB8DQo+Pj4NCj4+PiB0aGVuIHRo
ZSBkZXN0aW5hdGlvbiBiaXRzIHNob3VsZCBiZQ0KPj4+DQo+Pj4gwqDCoCB8IDcgNiA1IDQg
MyAyIDEgMCA3IDYgfA0KPj4+DQo+Pg0KPj4gSSB0aGluayBib3RoIGFwcHJvYWNoZXMgaGF2
ZSBwcm9zIGFuZCBjb25zLiBMZWF2aW5nIHRoZSB0d28gTFNCcyANCj4+IGFsd2F5cyBhdCAw
IHlpZWxkcyBhIGZ1bGx5IGxpbmVhciB0cmFuc2ZlciBjdXJ2ZSB3aXRoIG5vIA0KPj4gZGlz
Y29udGludWl0aWVzLCBidXQgbWVhbnMgdGhlIG1heGltdW0gYnJpZ2h0bmVzcyBpcyBzbGln
aHRseSBsZXNzIA0KPj4gdGhhbiBmdWxsLiBTZXR0aW5nIHRoZW0gZnVsbHkgbWFwcyB0aGUg
YnJpZ2h0bmVzcyByYW5nZSwgYnV0IGNyZWF0ZXMgNCANCj4+IGRvdWJsZSB3aWRlIHN0ZXBz
IGluIHRoZSB0cmFuc2ZlciBjdXJ2ZSAoYWxzbyBpdCdzIHBvdGVudGlhbGx5IA0KPj4gc2xp
Z2h0bHkgc2xvd2VyIENQVS13aXNlKS4NCj4+DQo+PiBJZiB5b3UgcHJlZmVyIHRoZSBsYXR0
ZXIgSSdsbCBkbyB0aGF0IGZvciB2Mi4NCj4gDQo+IFdlIGRvbid0IGdpdmUgZ3VhcmFudGVl
cyBmb3IgY29sb3Igb3V0cHV0IHVubGVzcyBjb2xvciBzcGFjZXMgYXJlIA0KPiBpbnZvbHZl
ZC4gQnV0IHRoZSBsYWNrIG9mIExTQiBiaXRzIGNhbiBiZSBtb3JlIHZpc2libGUgdGhhbiBs
YXJnZXIgc3RlcHMgDQo+IGluIHRoZSBjdXJ2ZS4gV2l0aCB0aGUgY3VycmVudCBmb3JtYXRz
IGhlcmUsIGl0J3MgcHJvYmFibHkgYSBub24taXNzdWUuIA0KPiBCdXQgdGhlcmUgY2FuIGJl
IGNvbnZlcnNpb25zLCBzdWNoIGFzIFJHQjQ0NCB0byBSR0I4OCwgd2hlcmUgdGhlc2UgDQo+
IG1pc3NpbmcgTFNCcyBtYWtlIGEgdmlzaWJsZSBkaWZmZXJlbmNlLg0KPiANCj4gVGhlcmVm
b3JlLCBwbGVhc2UgY2hhbmdlIHRoZSBhbGdvcml0aG0uIEl0IHByb2R1Y2VzIG1vcmUgY29u
c2lzdGVudCANCj4gcmVzdWx0cyBvdmVyIGEgdmFyaWV0eSBvZiBmb3JtYXQgY29udmVyc2lv
bi4gSXQncyBiZXR0ZXIgdG8gaGF2ZSB0aGUgDQo+IHNhbWUgKGRlZmF1bHQpIGFsZ29yaXRo
bSBmb3IgYWxsIG9mIHRoZW0uDQoNCkZUUiwgSSBqdXN0IHRlc3RlZCB0aGlzIGluIGEgcGFp
bnRpbmcgcHJvZ3JhbS4gSSBjYW4gc2VlIGEgZGlmZmVyZW5jZSANCmJldHdlZW4gZmZmZmZm
IGFuZCBmY2ZjZmMgaWZmIGJvdGggYXJlIG5leHQgdG8gZWFjaCBvdGhlci4gZjhmOGY4IGlz
IA0Kb2J2aW91c2x5IGdyYXkuDQoNCj4gDQo+IEJlc3QgcmVnYXJkcw0KPiBUaG9tYXMNCj4g
DQo+Pg0KPiANCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERl
dmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxk
c3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJu
YmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCg==

--------------n7bFK7M0mO0MtcGlFl05qdB0--

--------------WeUyxZULbXgg3oq0IT5qcT1e
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmGvNv4FAwAAAAAACgkQlh/E3EQov+CJ
3xAAxgBOF+nUtTiERtlBVVgl3wOCkQhh7Ir5TKjeAUlE/7InRdP3ke80gX9SRwpR6AE9j63f/pVR
paQcym8drsTHCyUlDacvmMvRtmAx9DtF8CRNQ2lde698W/YQORH9fH6i70syhyc4ipvtu7fpSpbz
xUy33EVSajSyUbeNnPOELCni6+rtac7G8kV9RarRe8hPe1V1E8CPOzP7HRqtjiWElfC6cO3OIslh
6LfAX5wqTtY8bzKjUQhUQJZZALwBBDqGf+Ye3zXfmOZw7Ts4To/2byHRW9mfHkC1MA9Gq1TrTRQU
Bmm045nQuLFZCCKQ6nHDIHzVT2Fb67rZA6kNKC7gM221Nisy4nlgizxQUKQlUNqD9jLD2X1fXo+m
xQnYMs3CC8qqj9YpVh+FG9bBuSKjr7PadOVUyRJ8wnWiVBCYEjHU/Jx6O7dTi8ptsDMBphz1kZGf
9jGqDB2UfkO94xuJHqidmImEebk7fgFvyBelu5usbuEPRgqGRC7nJKEoZWyWlIzrATJ7oE/AueCP
tBDX/if7exprqY+gqYHNUolWWDEJL+fnTghWoXW5N58CRZhLE8kH/KyPSEtiPo8BA5Fe3RALxsD9
2iRi4QMpTFwm8bxydznR8FXWsBJE1Waji/Sa2OyWXkt7YPWV6tXkZqUUhsuuQzZzTPGMiODHlr2W
weo=
=vufj
-----END PGP SIGNATURE-----

--------------WeUyxZULbXgg3oq0IT5qcT1e--
