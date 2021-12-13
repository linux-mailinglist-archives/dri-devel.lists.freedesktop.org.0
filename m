Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D98C64725DC
	for <lists+dri-devel@lfdr.de>; Mon, 13 Dec 2021 10:47:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83FDF10E712;
	Mon, 13 Dec 2021 09:47:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DEC910E721
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Dec 2021 09:47:11 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 00B7E210E6;
 Mon, 13 Dec 2021 09:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1639388830; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PzHLrYaz9bHO/2aWJHbhv+jzKaT2GSRHB9B+UdXbU5A=;
 b=CjdZi9gstin9qp9Hhf1mlnJuzQmzzcCBfAWmk/HowtzE7AcwEtb9NqtHHbSFKYlMPpMW5F
 15qqha6x8ng9ql7vU0yRiBzp+SE4BzASBU2jnaFZPwntk6BZEWOmbTCctGwgpbJb7AClpV
 5O+XkFzO7uS3fHsEUQJUTUV67RjkjjE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1639388830;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PzHLrYaz9bHO/2aWJHbhv+jzKaT2GSRHB9B+UdXbU5A=;
 b=IIMC5IOqacOI9/ivCsBq3Sa+WZBldHlQU/ixM5ofberpd1Bp4rwIQ97ePYV+Uapw3ZcY9U
 zQKIaNnE98Pvw7Bw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7E0CB13CCB;
 Mon, 13 Dec 2021 09:47:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 2EiTHZ0Wt2E5LAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 13 Dec 2021 09:47:09 +0000
Message-ID: <f3514f59-5b97-26f8-ab9e-e592571cc13f@suse.de>
Date: Mon, 13 Dec 2021 10:47:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH v3 2/3] drm/vc4: Remove conflicting framebuffers before
 callind bind_all
Content-Language: en-US
To: Maxime Ripard <maxime@cerno.tech>, Ray Jui <rjui@broadcom.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Scott Branden <sbranden@broadcom.com>, Rob Herring <robh+dt@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>
References: <20211213092503.57379-1-maxime@cerno.tech>
 <20211213092503.57379-3-maxime@cerno.tech>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20211213092503.57379-3-maxime@cerno.tech>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------cZVaPsWLMQY8pJclBDvlqnUJ"
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
--------------cZVaPsWLMQY8pJclBDvlqnUJ
Content-Type: multipart/mixed; boundary="------------eTk85dGDI0MuIQRcDjw0Or02";
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
Message-ID: <f3514f59-5b97-26f8-ab9e-e592571cc13f@suse.de>
Subject: Re: [PATCH v3 2/3] drm/vc4: Remove conflicting framebuffers before
 callind bind_all
References: <20211213092503.57379-1-maxime@cerno.tech>
 <20211213092503.57379-3-maxime@cerno.tech>
In-Reply-To: <20211213092503.57379-3-maxime@cerno.tech>

--------------eTk85dGDI0MuIQRcDjw0Or02
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgTWF4aW1lDQoNCkFtIDEzLjEyLjIxIHVtIDEwOjI1IHNjaHJpZWIgTWF4aW1lIFJpcGFy
ZDoNCj4gVGhlIGJpbmQgaG9va3Mgd2lsbCBtb2RpZnkgdGhlaXIgY29udHJvbGxlciByZWdp
c3RlcnMsIHNvIHNpbXBsZWZiIGlzDQo+IGdvaW5nIHRvIGJlIHVudXNhYmxlIGFueXdheS4g
TGV0J3MgYXZvaWQgYW55IHRyYW5zaWVudCBzdGF0ZSB3aGVyZSBpdA0KPiBjb3VsZCBzdGls
bCBiZSBpbiB0aGUgc3lzdGVtIGJ1dCBubyBsb25nZXIgZnVuY3Rpb25uYWwuDQo+IA0KPiBB
Y2tlZC1ieTogTmljb2xhcyBTYWVueiBKdWxpZW5uZSA8bnNhZW56QGtlcm5lbC5vcmc+DQo+
IFNpZ25lZC1vZmYtYnk6IE1heGltZSBSaXBhcmQgPG1heGltZUBjZXJuby50ZWNoPg0KPiAt
LS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vdmM0L3ZjNF9kcnYuYyB8IDggKysrKy0tLS0NCj4g
ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQ0KPiAN
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS92YzQvdmM0X2Rydi5jIGIvZHJpdmVy
cy9ncHUvZHJtL3ZjNC92YzRfZHJ2LmMNCj4gaW5kZXggMTZhYmMzYTNkNjAxLi44YWI4OWY4
MDU4MjYgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS92YzQvdmM0X2Rydi5jDQo+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS92YzQvdmM0X2Rydi5jDQo+IEBAIC0yNTEsNiArMjUx
LDEwIEBAIHN0YXRpYyBpbnQgdmM0X2RybV9iaW5kKHN0cnVjdCBkZXZpY2UgKmRldikNCg0K
U2luY2UgeW91IHdvcmsgb24gdGhpcywgSSdkIGxpa2UgdG8gc3VnZ2VzdCB0byBjYWxsIA0K
ZHJtX2Zpcm13YXJlX2RyaXZlcnNfb25seSgpIGF0IHRoZSB2ZXJ5IHRvcCBvZiB0aGlzIGZ1
bmN0aW9uLiBJdCdzIG91ciANCm5ldyBpbnRlcmZhY2UgZm9yIHRoZSBrZXJuZWwncyBub21v
ZGVzZXQgYXJndW1lbnQuIElmIGl0IHJldHVybnMgZmFsc2UsIA0KdGhlIHVzZXIgaGFzIGRp
c2FibGVkIG5hdGl2ZSBkcml2ZXJzIGZvciB0aGlzIGJvb3QuIFRoZSBnZW5lcmljIERSTSAN
CmRyaXZlciB3aWxsIGNvbnRpbnVlIHRvIHJ1biB0aGUgZGV2aWNlLg0KDQo+ICAgCWlmIChy
ZXQpDQo+ICAgCQlyZXR1cm4gcmV0Ow0KPiAgIA0KPiArCXJldCA9IGRybV9hcGVydHVyZV9y
ZW1vdmVfZnJhbWVidWZmZXJzKGZhbHNlLCAmdmM0X2RybV9kcml2ZXIpOw0KPiArCWlmIChy
ZXQpDQo+ICsJCXJldHVybiByZXQ7DQo+ICsNCg0KVGhlcmUncyBxdWl0ZSBhIGJpdCBvZiB3
b3JrIGJlaW5nIGRvbmUgYmVmb3JlIGNhbGxpbmcgdGhpcyBmdW5jdGlvbi4gDQpOb25lIG9m
IGl0IGlzIGFsbG93ZWQgdG8gdG91Y2ggSFcuDQoNCklzIHRoYXQgcmVsaWFibGU/IElmIHNv
LCB0aGUgY29kZSBpcyBmaW5lLCBvdGhlcndpc2UgdGhlIGNhbGwgc2hvdWxkIGdvIA0KdG8g
dGhlIHRvcCBvZiB0aGUgZnVuY3Rpb24uDQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCj4g
ICAJcmV0ID0gY29tcG9uZW50X2JpbmRfYWxsKGRldiwgZHJtKTsNCj4gICAJaWYgKHJldCkN
Cj4gICAJCXJldHVybiByZXQ7DQo+IEBAIC0yNTksMTAgKzI2Myw2IEBAIHN0YXRpYyBpbnQg
dmM0X2RybV9iaW5kKHN0cnVjdCBkZXZpY2UgKmRldikNCj4gICAJaWYgKHJldCkNCj4gICAJ
CWdvdG8gdW5iaW5kX2FsbDsNCj4gICANCj4gLQlyZXQgPSBkcm1fYXBlcnR1cmVfcmVtb3Zl
X2ZyYW1lYnVmZmVycyhmYWxzZSwgJnZjNF9kcm1fZHJpdmVyKTsNCj4gLQlpZiAocmV0KQ0K
PiAtCQlnb3RvIHVuYmluZF9hbGw7DQo+IC0NCj4gICAJcmV0ID0gdmM0X2ttc19sb2FkKGRy
bSk7DQo+ICAgCWlmIChyZXQgPCAwKQ0KPiAgIAkJZ290byB1bmJpbmRfYWxsOw0KPiANCg0K
LS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VT
RSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQw
OSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2No
w6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCg==

--------------eTk85dGDI0MuIQRcDjw0Or02--

--------------cZVaPsWLMQY8pJclBDvlqnUJ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmG3FpwFAwAAAAAACgkQlh/E3EQov+Dl
shAA0SMo8dNtWVtccyGM6EYrLCZW4bg54QQWtmLRy85u+C/3OVD3PBm7PAJAlejl0Z/w4T4pj1W3
f87kjihz7Ke2yzYlwaMUAulxRDK1VCr7wbNihw1gipAlwRfOVeqwhswAbznakz8TCWM+OTLZeQwq
5tlSm4i8sJf44nngCqgVssz9Ej3+3gkTV9zXgdwiP76aG8p0Vv4w8ibN10DDI9oUlk8kpgvXMwYD
/+wB/viRfu2RuRvmkuJVCWTR2nVMBqOnJcnZxVvyWj0MiphpwJotuXzJzdjZoh5Uk0VjvkRhDT+S
k+PUbHrgalH30l1Pn9eP9nxUCe5PmSJdGC/6wJTAvBI4uZ4foa0fG5wM3k6i0OFCr9Uk53UH5va8
rNgtIEPb1V2oSkHkSoHKMT1ZMlhvhafzRo7FUJfsJ6yyPUWTCg8+RjhD3Ht7cZNqF/hgtsHULldZ
6DbINaiKFEcbG1QsYtEkRNgaA56OSBR5CHkMh3blz49H9FgWtSloPn+oKfv4fC7VjZCEa9cs5MeI
GUKJd2O6La0i46d88B2FrKZ4+jdlN0QdHU8snUwIycT97w/gOupuE5blcF4ArwN6SQxWDklYQKua
CAaXB3umzw0EqUyRTSvJQnzkYMGK2ESLJ2vCYSZPQ+zePBXW0po83Tx8XOYDtvH4mfiwV0X0fFR8
D70=
=7BZD
-----END PGP SIGNATURE-----

--------------cZVaPsWLMQY8pJclBDvlqnUJ--
