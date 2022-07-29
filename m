Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 981CB585186
	for <lists+dri-devel@lfdr.de>; Fri, 29 Jul 2022 16:25:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAAC410EFC2;
	Fri, 29 Jul 2022 14:25:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E5A210F2DD
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Jul 2022 14:25:48 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 04EED2105E;
 Fri, 29 Jul 2022 14:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1659104747; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=brxv0Il7aXuaoEfSMewGeVS/r64cW73YuICcYwVyi7I=;
 b=SO9f3fOuAnftNQ8R8q2Cic7KqH+8EHRwWbJBZHLPMJgGCKNW4E6pyuN+jEF4N3HPy/jSFR
 BOJvH9SRTbSVS8eTJCCBa6hb74D4chqQFkLrcU89mQcjlJBG+57e/VQl/egioC06bBfq2m
 dUdwfeVIj510NLlX5tlseZVipnI3bTw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1659104747;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=brxv0Il7aXuaoEfSMewGeVS/r64cW73YuICcYwVyi7I=;
 b=1WXFxXC/fpCEBNrNKBk8J9H2mFvWmwFkyPh0Jz8YW03D1SjPCm9S9ptcsCShPyAHyHeoWP
 q6GLBhr/AKFQKcAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id BEACC13A1B;
 Fri, 29 Jul 2022 14:25:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id x26ELert42JQZQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 29 Jul 2022 14:25:46 +0000
Message-ID: <fef74b28-80f1-9184-efa5-25f3343ace40@suse.de>
Date: Fri, 29 Jul 2022 16:25:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] drm/kmb: fix dereference before NULL check in
 kmb_plane_atomic_update()
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Zeng Jingxiang <zengjx95@gmail.com>, anitha.chrisanthus@intel.com,
 edmund.j.dea@intel.com, airlied@linux.ie, daniel@ffwll.ch,
 laurent.pinchart@ideasonboard.com, maxime@cerno.tech,
 ville.syrjala@linux.intel.com
References: <20220729030711.2117849-1-zengjx95@gmail.com>
 <a68022f4-28d0-7743-27fe-6df652082184@suse.de>
In-Reply-To: <a68022f4-28d0-7743-27fe-6df652082184@suse.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------8XYdnNgb7h3hVjAfqSJlMFec"
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
Cc: Zeng Jingxiang <linuszeng@tencent.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------8XYdnNgb7h3hVjAfqSJlMFec
Content-Type: multipart/mixed; boundary="------------QsDYZ0Y0WtwqwbmmpqeTelLL";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Zeng Jingxiang <zengjx95@gmail.com>, anitha.chrisanthus@intel.com,
 edmund.j.dea@intel.com, airlied@linux.ie, daniel@ffwll.ch,
 laurent.pinchart@ideasonboard.com, maxime@cerno.tech,
 ville.syrjala@linux.intel.com
Cc: Zeng Jingxiang <linuszeng@tencent.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Message-ID: <fef74b28-80f1-9184-efa5-25f3343ace40@suse.de>
Subject: Re: [PATCH] drm/kmb: fix dereference before NULL check in
 kmb_plane_atomic_update()
References: <20220729030711.2117849-1-zengjx95@gmail.com>
 <a68022f4-28d0-7743-27fe-6df652082184@suse.de>
In-Reply-To: <a68022f4-28d0-7743-27fe-6df652082184@suse.de>

--------------QsDYZ0Y0WtwqwbmmpqeTelLL
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjkuMDcuMjIgdW0gMTY6MjMgc2NocmllYiBUaG9tYXMgWmltbWVybWFubjoN
Cj4gSGkNCj4gDQo+IEFtIDI5LjA3LjIyIHVtIDA1OjA3IHNjaHJpZWIgWmVuZyBKaW5neGlh
bmc6DQo+PiBGcm9tOiBaZW5nIEppbmd4aWFuZyA8bGludXN6ZW5nQHRlbmNlbnQuY29tPg0K
Pj4NCj4+IFRoZSAicGxhbmUiIHBvaW50ZXIgd2FzIGFjY2VzcyBiZWZvcmUgY2hlY2tpbmcg
aWYgaXQgd2FzIE5VTEwuDQo+Pg0KPj4gVGhlIGRybV9hdG9taWNfZ2V0X29sZF9wbGFuZV9z
dGF0ZSgpIGZ1bmN0aW9uIHdpbGwgZGVyZWZlcmVuY2UNCj4+IHRoZSBwb2ludGVyICJwbGFu
ZSIuDQo+PiAzNDXCoMKgwqAgc3RydWN0IGRybV9wbGFuZV9zdGF0ZSAqb2xkX3BsYW5lX3N0
YXRlID0NCj4+IMKgwqDCoMKgwqDCoMKgIGRybV9hdG9taWNfZ2V0X29sZF9wbGFuZV9zdGF0
ZShzdGF0ZSwgcGxhbmUpOw0KPj4gMzQ2wqDCoMKgIHN0cnVjdCBkcm1fcGxhbmVfc3RhdGUg
Km5ld19wbGFuZV9zdGF0ZSA9DQo+PiDCoMKgwqDCoMKgwqDCoCBkcm1fYXRvbWljX2dldF9u
ZXdfcGxhbmVfc3RhdGUoc3RhdGUsIHBsYW5lKTsNCj4+DQo+PiBBIE5VTEwgY2hlY2sgZm9y
ICJwbGFuZSIgaW5kaWNhdGVzIHRoYXQgaXQgbWF5IGJlIE5VTEwNCj4+IDM2M8KgwqDCoCBp
ZiAoIXBsYW5lIHx8ICFuZXdfcGxhbmVfc3RhdGUgfHwgIW9sZF9wbGFuZV9zdGF0ZSkNCj4g
DQo+IElzIHRoaXMgYW4gYWN0dWFsIGJ1ZyB0aGF0IGhhcHBlbnM/DQo+IA0KPiBBbGwgcGxh
bmVzIHNob3VsZCBhbHdheXMgaGF2ZSBhIHN0YXRlLiBUaGVyZWZvcmUgdGhlIHRlc3RzIGZv
ciANCj4gIW5ld19wbGFuZV9zdGF0ZSBhbmQgIW9sZF9wbGFuZV9zdGF0ZSBjYW4gYmUgcmVt
b3ZlZCwgSSdkIHNheS4NCg0KSnVzdCB0byBjbGFyaWZ5OiBtb3ZpbmcgdGhlIHRlc3QgZm9y
ICFwbGFuZSBiZWZvcmUgdXNpbmcgb25lIG9mIHRoZSANCmdldF9wbGFuZV9zdGF0ZSBmdW5j
dGlvbnMgaXMgYSBjb3JyZWN0IGJ1Z2ZpeC4NCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0K
PiANCj4gQmVzdCByZWdhcmRzDQo+IFRob21hcw0KPiANCj4+DQo+PiBGaXhlczogOTc3Njk3
ZTIwYjNkICgiZHJtL2F0b21pYzogUGFzcyB0aGUgZnVsbCBzdGF0ZSB0byBwbGFuZXMgYXRv
bWljIA0KPj4gZGlzYWJsZSBhbmQgdXBkYXRlIikNCj4+IEZpeGVzOiAzNzQxOGJmMTRjMTMg
KCJkcm06IFVzZSBzdGF0ZSBoZWxwZXIgaW5zdGVhZCBvZiB0aGUgcGxhbmUgc3RhdGUgDQo+
PiBwb2ludGVyIikNCj4+IFNpZ25lZC1vZmYtYnk6IFplbmcgSmluZ3hpYW5nIDxsaW51c3pl
bmdAdGVuY2VudC5jb20+DQo+PiAtLS0NCj4+IMKgIGRyaXZlcnMvZ3B1L2RybS9rbWIva21i
X3BsYW5lLmMgfCAxMyArKysrKysrKy0tLS0tDQo+PiDCoCAxIGZpbGUgY2hhbmdlZCwgOCBp
bnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0va21iL2ttYl9wbGFuZS5jIA0KPj4gYi9kcml2ZXJzL2dwdS9kcm0va21i
L2ttYl9wbGFuZS5jDQo+PiBpbmRleCAyNzM1YjhlYjM1MzcuLmQyYmM5OThiNjVjZSAxMDA2
NDQNCj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9rbWIva21iX3BsYW5lLmMNCj4+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS9rbWIva21iX3BsYW5lLmMNCj4+IEBAIC0zNDIsMTAgKzM0Miw3
IEBAIHN0YXRpYyB2b2lkIGttYl9wbGFuZV9zZXRfYWxwaGEoc3RydWN0IA0KPj4ga21iX2Ry
bV9wcml2YXRlICprbWIsDQo+PiDCoCBzdGF0aWMgdm9pZCBrbWJfcGxhbmVfYXRvbWljX3Vw
ZGF0ZShzdHJ1Y3QgZHJtX3BsYW5lICpwbGFuZSwNCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3QgZHJtX2F0b21pY19zdGF0ZSAqc3RhdGUp
DQo+PiDCoCB7DQo+PiAtwqDCoMKgIHN0cnVjdCBkcm1fcGxhbmVfc3RhdGUgKm9sZF9wbGFu
ZV9zdGF0ZSA9IA0KPj4gZHJtX2F0b21pY19nZXRfb2xkX3BsYW5lX3N0YXRlKHN0YXRlLA0K
Pj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHBsYW5lKTsNCj4+IC3CoMKgwqAgc3Ry
dWN0IGRybV9wbGFuZV9zdGF0ZSAqbmV3X3BsYW5lX3N0YXRlID0gDQo+PiBkcm1fYXRvbWlj
X2dldF9uZXdfcGxhbmVfc3RhdGUoc3RhdGUsDQo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgcGxhbmUpOw0KPj4gK8KgwqDCoCBzdHJ1Y3QgZHJtX3BsYW5lX3N0YXRlICpvbGRf
cGxhbmVfc3RhdGUsICpuZXdfcGxhbmVfc3RhdGU7DQo+PiDCoMKgwqDCoMKgIHN0cnVjdCBk
cm1fZnJhbWVidWZmZXIgKmZiOw0KPj4gwqDCoMKgwqDCoCBzdHJ1Y3Qga21iX2RybV9wcml2
YXRlICprbWI7DQo+PiDCoMKgwqDCoMKgIHVuc2lnbmVkIGludCB3aWR0aDsNCj4+IEBAIC0z
NjAsNyArMzU3LDEzIEBAIHN0YXRpYyB2b2lkIGttYl9wbGFuZV9hdG9taWNfdXBkYXRlKHN0
cnVjdCANCj4+IGRybV9wbGFuZSAqcGxhbmUsDQo+PiDCoMKgwqDCoMKgIHN0YXRpYyBkbWFf
YWRkcl90IGFkZHJbTUFYX1NVQl9QTEFORVNdOw0KPj4gwqDCoMKgwqDCoCBzdHJ1Y3QgZGlz
cF9jZmcgKmluaXRfZGlzcF9jZmc7DQo+PiAtwqDCoMKgIGlmICghcGxhbmUgfHwgIW5ld19w
bGFuZV9zdGF0ZSB8fCAhb2xkX3BsYW5lX3N0YXRlKQ0KPj4gK8KgwqDCoCBpZiAoIXBsYW5l
KQ0KPj4gK8KgwqDCoMKgwqDCoMKgIHJldHVybjsNCj4+ICsNCj4+ICvCoMKgwqAgb2xkX3Bs
YW5lX3N0YXRlID0gZHJtX2F0b21pY19nZXRfb2xkX3BsYW5lX3N0YXRlKHN0YXRlLCBwbGFu
ZSk7DQo+PiArwqDCoMKgIG5ld19wbGFuZV9zdGF0ZSA9IGRybV9hdG9taWNfZ2V0X25ld19w
bGFuZV9zdGF0ZShzdGF0ZSwgcGxhbmUpOw0KPj4gKw0KPj4gK8KgwqDCoCBpZiAoIW5ld19w
bGFuZV9zdGF0ZSB8fCAhb2xkX3BsYW5lX3N0YXRlKQ0KPj4gwqDCoMKgwqDCoMKgwqDCoMKg
IHJldHVybjsNCj4+IMKgwqDCoMKgwqAgZmIgPSBuZXdfcGxhbmVfc3RhdGUtPmZiOw0KPiAN
Cg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0K
U1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5
MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdl
c2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCg==

--------------QsDYZ0Y0WtwqwbmmpqeTelLL--

--------------8XYdnNgb7h3hVjAfqSJlMFec
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmLj7eoFAwAAAAAACgkQlh/E3EQov+CX
ahAAsVg3sE20LkP7C2n34XDLir22oTldIpn7EwNbpONH1oEg/yOy3QjHZ+pt+rz6k4k7fsWqOlIk
LG8LGFdhJX/cS5V/4uWv4QctHrT1w1QcU6l5GkgHyB7kSgtxOBCnbfY8wyO/NoZ5+Z8xJ2+/SDFn
nFgkOdb2D14N7iNZvagD8l0gZB4WssQxXXwdjExZQEd2Uj+xiWyRnNf2crbrp1XmhV18p/zMtZ7t
AvsSNM/ZfxrxZ1msdKJlT+G+roPSLcfDYyv5rLk9+rCRairK+hWH2TGxaBr8WV1Z28T6IWdQYAyV
9urzlTlT7+Q2UZXkWTN7pZOWVyaGk4GObcwn4sWr3J5cUTVatSeLEVGGSZFzKRsmwDGp8JRCTsEj
UGFHN4zqNIK6ZGHR/5rcigR3CZoxn+vT6bV/QiNXkghN0qUQVw6cz2+Ey8jOEDARoOkzTy28nUjP
Ft9dB9f6YW6OioCN1w4yhyvph84Jy74B8AP5f6vcVkkLl8GYuQ22FNFnMW4V1PpBEl0Gx7tn1gJn
MzReHC04J6bU77zUyFVcf9Z+zIZy6EMeyRRs5vwdQgGDrtfZ9XEUkOM87NcPOLo8DNZAyKc6OhDY
XjWcUGPxUlgFVd/KoCWAv71OcFK4FDV5L2VwTKZ1QBqxJ4PZ8FWXF/mklE+CbyIwoVimd7qSWknO
U7A=
=YDPy
-----END PGP SIGNATURE-----

--------------8XYdnNgb7h3hVjAfqSJlMFec--
