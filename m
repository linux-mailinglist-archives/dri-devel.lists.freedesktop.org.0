Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25E4078E748
	for <lists+dri-devel@lfdr.de>; Thu, 31 Aug 2023 09:40:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E5BF10E17F;
	Thu, 31 Aug 2023 07:40:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDA8510E17E
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Aug 2023 07:40:21 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 354DB1F45E;
 Thu, 31 Aug 2023 07:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1693467620; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3Mb/+GLhiWSZbycgMGS19cUQ5prv6SddRIOrfO+XQ9k=;
 b=STJ84M+RFphvH2eI+UMQQCdk1b3vJlbCd/jZNKQ6zYijbFBGFCPf569XpXRkPZXKnJAKa2
 GHLqDDa8hjSch9XmHNf7s8TugG3tdE+qZ6RpkXhn7Grnm30IrKvxR5RypIGSVIWI+qi7n1
 u0ROVVzq6j0r4M/TtmEZvd2scmA8gRM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1693467620;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3Mb/+GLhiWSZbycgMGS19cUQ5prv6SddRIOrfO+XQ9k=;
 b=hkO0IbXjX7iJ0iAk0n30kowhr4KsurSP6rYz8+t+qYTe6yF9g2JE0CMjCWj+MiJURx9O0A
 j/Jc6B7Qgk74yXAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 08DFE13587;
 Thu, 31 Aug 2023 07:40:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Jrc6AeRD8GRdWwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 31 Aug 2023 07:40:20 +0000
Message-ID: <1a98bb80-9990-dc65-5f14-066315a7e7d8@suse.de>
Date: Thu, 31 Aug 2023 09:40:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v2 1/8] drm/dumb-buffers: Fix drm_mode_create_dumb() for
 bpp < 8
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <cover.1692888745.git.geert@linux-m68k.org>
 <16d488639e99f43ca3977ee7b8f76fc26c34aa86.1692888745.git.geert@linux-m68k.org>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <16d488639e99f43ca3977ee7b8f76fc26c34aa86.1692888745.git.geert@linux-m68k.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------PSncTkiKSf6vH11O5L4YSqbe"
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------PSncTkiKSf6vH11O5L4YSqbe
Content-Type: multipart/mixed; boundary="------------mxMUxbexaJGl0UyRZmCdUbcy";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Message-ID: <1a98bb80-9990-dc65-5f14-066315a7e7d8@suse.de>
Subject: Re: [PATCH v2 1/8] drm/dumb-buffers: Fix drm_mode_create_dumb() for
 bpp < 8
References: <cover.1692888745.git.geert@linux-m68k.org>
 <16d488639e99f43ca3977ee7b8f76fc26c34aa86.1692888745.git.geert@linux-m68k.org>
In-Reply-To: <16d488639e99f43ca3977ee7b8f76fc26c34aa86.1692888745.git.geert@linux-m68k.org>

--------------mxMUxbexaJGl0UyRZmCdUbcy
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjQuMDguMjMgdW0gMTc6MDggc2NocmllYiBHZWVydCBVeXR0ZXJob2V2ZW46
DQo+IGRybV9tb2RlX2NyZWF0ZV9kdW1iKCkgY2FsY3VsYXRlcyB0aGUgbnVtYmVyIG9mIGNo
YXJhY3RlcnMgcGVyIHBpeGVsDQo+IGZyb20gdGhlIG51bWJlciBvZiBiaXRzIHBlciBwaXhl
bCBieSByb3VuZGluZyB1cCwgd2hpY2ggaXMgbm90IGNvcnJlY3QNCj4gYXMgdGhlIGFjdHVh
bCB2YWx1ZSBvZiBjcHAgbWF5IGJlIG5vbi1pbnRlZ2VyLiAgV2hpbGUgd2UgZG8gbm90IG5l
ZWQgdG8NCj4gY2FyZSBoZXJlIGFib3V0IGNvbXBsZXggZm9ybWF0cyBsaWtlIFlVViwgYnBw
IDwgOCBpcyBhIHZhbGlkIHVzZSBjYXNlLg0KPiANCj4gICAgLSBUaGUgb3ZlcmZsb3cgY2hl
Y2sgZm9yIHRoZSBidWZmZXIgd2lkdGggaXMgbm90IGNvcnJlY3QgaWYgYnBwIDwgOC4NCj4g
ICAgICBIb3dldmVyLCBpdCBkb2Vzbid0IGh1cnQsIGFzIHdpZHRocyBsYXJnZXIgdGhhbiBV
MzJfTUFYIC8gOCBzaG91bGQNCj4gICAgICBub3QgaGFwcGVuIGZvciByZWFsIGFueXdheS4g
IEFkZCBhIGNvbW1lbnQgdG8gY2xhcmlmeS4NCj4gICAgLSBDYWxjdWxhdGluZyB0aGUgc3Ry
aWRlIGZyb20gdGhlIG51bWJlciBvZiBjaGFyYWN0ZXJzIHBlciBwaXhlbCBpcw0KPiAgICAg
IG5vdCBjb3JyZWN0LiAgRml4IHRoaXMgYnkgY2FsY3VsYXRpbmcgaXQgZnJvbSB0aGUgbnVt
YmVyIG9mIGJpdHMgcGVyDQo+ICAgICAgcGl4ZWwgaW5zdGVhZC4NCj4gDQo+IFNpZ25lZC1v
ZmYtYnk6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4ay5vcmc+DQo+IFJl
dmlld2VkLWJ5OiBKYXZpZXIgTWFydGluZXogQ2FuaWxsYXMgPGphdmllcm1AcmVkaGF0LmNv
bT4NCj4gVGVzdGVkLWJ5OiBKYXZpZXIgTWFydGluZXogQ2FuaWxsYXMgPGphdmllcm1AcmVk
aGF0LmNvbT4NCj4gLS0tDQo+IHYyOg0KPiAgICAtIEFkZCBSZXZpZXdlZC1ieSwgVGVzdGVk
LWJ5Lg0KPiAtLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vZHJtX2R1bWJfYnVmZmVycy5jIHwg
MyArKy0NCj4gICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9u
KC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9kdW1iX2J1ZmZl
cnMuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHVtYl9idWZmZXJzLmMNCj4gaW5kZXggNzAw
MzJiYmExYzk3ZTc4Ny4uMjFhMDRjMzJhNWUzZDc4NSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2RybV9kdW1iX2J1ZmZlcnMuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
ZHJtX2R1bWJfYnVmZmVycy5jDQo+IEBAIC03MSwxMCArNzEsMTEgQEAgaW50IGRybV9tb2Rl
X2NyZWF0ZV9kdW1iKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsDQo+ICAgCS8qIG92ZXJmbG93
IGNoZWNrcyBmb3IgMzJiaXQgc2l6ZSBjYWxjdWxhdGlvbnMgKi8NCj4gICAJaWYgKGFyZ3Mt
PmJwcCA+IFUzMl9NQVggLSA4KQ0KPiAgIAkJcmV0dXJuIC1FSU5WQUw7DQo+ICsJLyogSW5j
b3JyZWN0IChlc3BlY2lhbGx5IGlmIGJwcCA8IDgpLCBidXQgZG9lc24ndCBodXJ0IG11Y2gg
Ki8NCj4gICAJY3BwID0gRElWX1JPVU5EX1VQKGFyZ3MtPmJwcCwgOCk7DQo+ICAgCWlmIChj
cHAgPiBVMzJfTUFYIC8gYXJncy0+d2lkdGgpDQo+ICAgCQlyZXR1cm4gLUVJTlZBTDsNCg0K
QXQgZmlyc3QsIEkgd2FzIGNvbmZ1c2VkIGJ5IHRoaXMuIFNvIEknZCByZWFsbHkgcHJlZmVy
IHRvIG91dHJpZ2h0IA0KZGVsZXRlIHRoaXMgY29kZS4gQXMgeW91IHNheSwgaXQncyBpbmNv
cnJlY3QgYW5kIGRvZXNuJ3QgYWRkIGFueXRoaW5nLiANClRoZSBjb25jZXB0IG9mIGNwcCBp
cyBzb21ld2hhdCB3cm9uZyBhbnl3YXkuDQoNCj4gLQlzdHJpZGUgPSBjcHAgKiBhcmdzLT53
aWR0aDsNCj4gKwlzdHJpZGUgPSBESVZfUk9VTkRfVVAoYXJncy0+YnBwICogYXJncy0+d2lk
dGgsIDgpOw0KDQpEbyB3ZSBuZWVkIGFuIG92ZXJmbG93IGNoZWNrIGZvciAoYnBwICogd2lk
dGggPCBVMzJfTUFYKSA/DQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCj4gICAJaWYgKGFy
Z3MtPmhlaWdodCA+IFUzMl9NQVggLyBzdHJpZGUpDQo+ICAgCQlyZXR1cm4gLUVJTlZBTDsN
Cj4gICANCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVs
b3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpGcmFua2Vuc3Ry
YXNzZSAxNDYsIDkwNDYxIE51ZXJuYmVyZywgR2VybWFueQ0KR0Y6IEl2byBUb3RldiwgQW5k
cmV3IE15ZXJzLCBBbmRyZXcgTWNEb25hbGQsIEJvdWRpZW4gTW9lcm1hbg0KSFJCIDM2ODA5
IChBRyBOdWVybmJlcmcpDQo=

--------------mxMUxbexaJGl0UyRZmCdUbcy--

--------------PSncTkiKSf6vH11O5L4YSqbe
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmTwQ+MFAwAAAAAACgkQlh/E3EQov+Ag
EA//VI4y6CwqjTFYKTzY/XCdqAFQB5Ck4rsWxaOcUye2V8a1z9G11FNxs7jLNpMUQbruC792IyGy
CkioLQA/48miJ+Mx5vAOOxFf2Fs6UZDx4iGtqO7y0muGuLRvQDc9leB3wAAupq1Kngks5aryuf68
/V7bUAX0k1u9Yuh1UfzjRtOKPzK6e4ajnGLL8kpDLEv2XYbm5Diy+IkgyuCdRLRfroDaakJoNAZT
6gDUgElj7fr9JUrmojRq0KiT2sy+er062Up3f0bUnKnadEGfH5nuok3R1w3EuF7vw1MxqGj/yvDZ
dMg59iBd9G/UD3kUSI1Mne6Y2WK7H1GAQlP6neVcBxRumTcm7cXZn/4SR9lyfx2gVLGXI9zrjWwl
T4M7kUxIR7GKgRzbYRpWUincddabFg9k7oJcq8sWssc1Z2Cp+cvl3QBPriGPl/9Cw0SSFj4ezV8m
iamaGi2jANWhKhAlOXCh9USW+KSQMAL7o4DobQC4PHP0ty73GU9t9AOthaJzuYa7KHlui7jYQo2S
O5y5B3a9z1abW3dmM6hk10bflw13uHF0RMGATqnenFo+S+eeWnbEulgM3NPzbI0tL2Cpx7Q3Q8a8
Ub8ovj9Bg3GIKfUMz1tRKWS95gqQWeOS/hJTyjrnu2Mz7fwwOoUnX4NM+ZONYzag7DdvvpIfYjtD
HPU=
=RVja
-----END PGP SIGNATURE-----

--------------PSncTkiKSf6vH11O5L4YSqbe--
