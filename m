Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B596472633
	for <lists+dri-devel@lfdr.de>; Mon, 13 Dec 2021 10:51:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 369BE10E731;
	Mon, 13 Dec 2021 09:51:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E71010E730
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Dec 2021 09:51:27 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B674B1F3BB;
 Mon, 13 Dec 2021 09:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1639389085; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=n3o3Ap6ZafSV2t0C6/1gPv7skxzJxUElwWKKmLwscj8=;
 b=dtP1TVSbLtTSVypadD2H+/9Z71Pex7hkcYWddYwtFQv4hK+611YDfw05ItD4DtVbFGnqpE
 UV4RWfk8KY8K/YpoOOswJZ2rXDRT41sZn1k6uBKp4B8KtnQ4Juk48cCiB8baw1AWjMCokt
 KrmZ9PLf1sZnU5B12cZPHTbGD/Uopck=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1639389085;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=n3o3Ap6ZafSV2t0C6/1gPv7skxzJxUElwWKKmLwscj8=;
 b=aIVZ9tG+zyvMBhdZjfeIbZ+Zot6OzTYG+uia2Oi6lcsMKNMfsTjCOhGx6fS6bSEneHSiWO
 PKVIoVRt20wK1YBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5145213AFF;
 Mon, 13 Dec 2021 09:51:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id DlrIEp0Xt2FULgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 13 Dec 2021 09:51:25 +0000
Message-ID: <2fe38e9f-372d-462e-783c-3e0432b704e5@suse.de>
Date: Mon, 13 Dec 2021 10:51:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH v3 2/3] drm/vc4: Remove conflicting framebuffers before
 callind bind_all
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Maxime Ripard <maxime@cerno.tech>, Ray Jui <rjui@broadcom.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Scott Branden <sbranden@broadcom.com>, Rob Herring <robh+dt@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>
References: <20211213092503.57379-1-maxime@cerno.tech>
 <20211213092503.57379-3-maxime@cerno.tech>
 <f3514f59-5b97-26f8-ab9e-e592571cc13f@suse.de>
In-Reply-To: <f3514f59-5b97-26f8-ab9e-e592571cc13f@suse.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------eex7iFbxDw0B6AIWcosOIOk0"
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
Cc: devicetree@vger.kernel.org, Dom Cobley <dom@raspberrypi.com>,
 Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------eex7iFbxDw0B6AIWcosOIOk0
Content-Type: multipart/mixed; boundary="------------nsSrEQmc3VudFkud8EN0kbnk";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Maxime Ripard <maxime@cerno.tech>, Ray Jui <rjui@broadcom.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Scott Branden <sbranden@broadcom.com>, Rob Herring <robh+dt@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>
Cc: devicetree@vger.kernel.org, Dom Cobley <dom@raspberrypi.com>,
 Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>,
 linux-arm-kernel@lists.infradead.org
Message-ID: <2fe38e9f-372d-462e-783c-3e0432b704e5@suse.de>
Subject: Re: [PATCH v3 2/3] drm/vc4: Remove conflicting framebuffers before
 callind bind_all
References: <20211213092503.57379-1-maxime@cerno.tech>
 <20211213092503.57379-3-maxime@cerno.tech>
 <f3514f59-5b97-26f8-ab9e-e592571cc13f@suse.de>
In-Reply-To: <f3514f59-5b97-26f8-ab9e-e592571cc13f@suse.de>

--------------nsSrEQmc3VudFkud8EN0kbnk
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQoNCkFtIDEzLjEyLjIxIHVtIDEwOjQ3IHNjaHJpZWIgVGhvbWFzIFppbW1lcm1hbm46DQo+
IEhpIE1heGltZQ0KPiANCj4gQW0gMTMuMTIuMjEgdW0gMTA6MjUgc2NocmllYiBNYXhpbWUg
UmlwYXJkOg0KPj4gVGhlIGJpbmQgaG9va3Mgd2lsbCBtb2RpZnkgdGhlaXIgY29udHJvbGxl
ciByZWdpc3RlcnMsIHNvIHNpbXBsZWZiIGlzDQo+PiBnb2luZyB0byBiZSB1bnVzYWJsZSBh
bnl3YXkuIExldCdzIGF2b2lkIGFueSB0cmFuc2llbnQgc3RhdGUgd2hlcmUgaXQNCj4+IGNv
dWxkIHN0aWxsIGJlIGluIHRoZSBzeXN0ZW0gYnV0IG5vIGxvbmdlciBmdW5jdGlvbm5hbC4N
Cj4+DQo+PiBBY2tlZC1ieTogTmljb2xhcyBTYWVueiBKdWxpZW5uZSA8bnNhZW56QGtlcm5l
bC5vcmc+DQo+PiBTaWduZWQtb2ZmLWJ5OiBNYXhpbWUgUmlwYXJkIDxtYXhpbWVAY2Vybm8u
dGVjaD4NCj4+IC0tLQ0KPj4gwqAgZHJpdmVycy9ncHUvZHJtL3ZjNC92YzRfZHJ2LmMgfCA4
ICsrKystLS0tDQo+PiDCoCAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRl
bGV0aW9ucygtKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdmM0L3Zj
NF9kcnYuYyANCj4+IGIvZHJpdmVycy9ncHUvZHJtL3ZjNC92YzRfZHJ2LmMNCj4+IGluZGV4
IDE2YWJjM2EzZDYwMS4uOGFiODlmODA1ODI2IDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL3ZjNC92YzRfZHJ2LmMNCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS92YzQvdmM0
X2Rydi5jDQo+PiBAQCAtMjUxLDYgKzI1MSwxMCBAQCBzdGF0aWMgaW50IHZjNF9kcm1fYmlu
ZChzdHJ1Y3QgZGV2aWNlICpkZXYpDQo+IA0KPiBTaW5jZSB5b3Ugd29yayBvbiB0aGlzLCBJ
J2QgbGlrZSB0byBzdWdnZXN0IHRvIGNhbGwgDQo+IGRybV9maXJtd2FyZV9kcml2ZXJzX29u
bHkoKSBhdCB0aGUgdmVyeSB0b3Agb2YgdGhpcyBmdW5jdGlvbi4gSXQncyBvdXIgDQo+IG5l
dyBpbnRlcmZhY2UgZm9yIHRoZSBrZXJuZWwncyBub21vZGVzZXQgYXJndW1lbnQuIElmIGl0
IHJldHVybnMgZmFsc2UsIA0KDQpzL2ZhbHNlL3RydWUNCg0KPiB0aGUgdXNlciBoYXMgZGlz
YWJsZWQgbmF0aXZlIGRyaXZlcnMgZm9yIHRoaXMgYm9vdC4gVGhlIGdlbmVyaWMgRFJNIA0K
PiBkcml2ZXIgd2lsbCBjb250aW51ZSB0byBydW4gdGhlIGRldmljZS4NCj4gDQo+PiDCoMKg
wqDCoMKgIGlmIChyZXQpDQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIHJldDsNCj4+
ICvCoMKgwqAgcmV0ID0gZHJtX2FwZXJ0dXJlX3JlbW92ZV9mcmFtZWJ1ZmZlcnMoZmFsc2Us
ICZ2YzRfZHJtX2RyaXZlcik7DQo+PiArwqDCoMKgIGlmIChyZXQpDQo+PiArwqDCoMKgwqDC
oMKgwqAgcmV0dXJuIHJldDsNCj4+ICsNCj4gDQo+IFRoZXJlJ3MgcXVpdGUgYSBiaXQgb2Yg
d29yayBiZWluZyBkb25lIGJlZm9yZSBjYWxsaW5nIHRoaXMgZnVuY3Rpb24uIA0KPiBOb25l
IG9mIGl0IGlzIGFsbG93ZWQgdG8gdG91Y2ggSFcuDQo+IA0KPiBJcyB0aGF0IHJlbGlhYmxl
PyBJZiBzbywgdGhlIGNvZGUgaXMgZmluZSwgb3RoZXJ3aXNlIHRoZSBjYWxsIHNob3VsZCBn
byANCj4gdG8gdGhlIHRvcCBvZiB0aGUgZnVuY3Rpb24uDQo+IA0KPiBCZXN0IHJlZ2FyZHMN
Cj4gVGhvbWFzDQo+IA0KPj4gwqDCoMKgwqDCoCByZXQgPSBjb21wb25lbnRfYmluZF9hbGwo
ZGV2LCBkcm0pOw0KPj4gwqDCoMKgwqDCoCBpZiAocmV0KQ0KPj4gwqDCoMKgwqDCoMKgwqDC
oMKgIHJldHVybiByZXQ7DQo+PiBAQCAtMjU5LDEwICsyNjMsNiBAQCBzdGF0aWMgaW50IHZj
NF9kcm1fYmluZChzdHJ1Y3QgZGV2aWNlICpkZXYpDQo+PiDCoMKgwqDCoMKgIGlmIChyZXQp
DQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgZ290byB1bmJpbmRfYWxsOw0KPj4gLcKgwqDCoCBy
ZXQgPSBkcm1fYXBlcnR1cmVfcmVtb3ZlX2ZyYW1lYnVmZmVycyhmYWxzZSwgJnZjNF9kcm1f
ZHJpdmVyKTsNCj4+IC3CoMKgwqAgaWYgKHJldCkNCj4+IC3CoMKgwqDCoMKgwqDCoCBnb3Rv
IHVuYmluZF9hbGw7DQo+PiAtDQo+PiDCoMKgwqDCoMKgIHJldCA9IHZjNF9rbXNfbG9hZChk
cm0pOw0KPj4gwqDCoMKgwqDCoCBpZiAocmV0IDwgMCkNCj4+IMKgwqDCoMKgwqDCoMKgwqDC
oCBnb3RvIHVuYmluZF9hbGw7DQo+Pg0KPiANCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0K
R3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2Vy
bWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihI
UkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYN
Cg==

--------------nsSrEQmc3VudFkud8EN0kbnk--

--------------eex7iFbxDw0B6AIWcosOIOk0
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmG3F5wFAwAAAAAACgkQlh/E3EQov+CH
dBAAr5PRxIeb0FQW+kZtgMX4CQLTYgfU7umoXclXmSXLSED299tsxFPLN9kdZaYyL2j1uj0pldlu
dId7Q/UATKUXtREK4W8kUB067xhBJy/psYR8H7wSz8IGuWFCZJ/YWtKeAX9EhdxyVgF7L1RyON76
q/82TwVsqCQ56xJwYUWi5f6W5WhQ2tbLPbnTcYbcUGzSx3J53memSIObOrpvAu4qMcwqL6exiAv3
i+zblQdfeHmuFFY4EjwP8i2qInYKNQ8xAmdA1ABFwJBjNkggZ7OAALDvyWcjTmhvKgqpcR3Zvzu2
TF+6WrTGs1smyT5wz9UqRSdVvFxHiOWcNiInbxV6AmVxZFeOhDgnWLR0mSbrvkdo+pgmy2gs8qPG
pXYsaiKoDNbjNHyCkQOonzFakQxCCpuIqa+SZaM6QP04tRJUN20al4U6Rq3pp5P2e1yjWfVLBsTH
SgUsGiPtruI6uEzd9+lROTR7bNQBiSn+Pb8a1A8Afhgr+KUXylKc59OVwreEumK1yDaqY8urEzgc
1pw6tNlzhKLSU8lcZukJmEKbd5Xg4RXtntDQr6D9qhNE8h6VqsHjDJkZ/Jk3vnhXFsDbFGeQD0eH
a6e6OJRweSiXN/lS1B5zPD5vazismtRX763rOzAmtodKR6uYObyWQcRbNmb7XKM0aIupRkdnx4xO
x9w=
=QiqR
-----END PGP SIGNATURE-----

--------------eex7iFbxDw0B6AIWcosOIOk0--
