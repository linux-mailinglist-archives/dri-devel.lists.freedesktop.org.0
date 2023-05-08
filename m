Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2D436FA06D
	for <lists+dri-devel@lfdr.de>; Mon,  8 May 2023 09:03:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3C0510E124;
	Mon,  8 May 2023 07:03:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D69810E11D
 for <dri-devel@lists.freedesktop.org>; Mon,  8 May 2023 07:03:49 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 00E401FDB7;
 Mon,  8 May 2023 07:03:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1683529428; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4ZoagW2l4sQ4Yfa743xpduPz2NZx8KCyLUMIb4OVuMM=;
 b=au6Qz3Km0IdBu+8T3OAbLd3mMhHEk0YxUH0VJsIfbrpwmk4m3WzY+As4gPPXe1ql9lRJsC
 Rwm3yoIZtsSOPuX/dsm/KtMh5pLg9oHHMooVkVoWXRHciltB77qY0+A0f0H7jH1DsIGMPa
 Es7SSaWiddvjSwhc6QCf2EiYQLUAdRk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1683529428;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4ZoagW2l4sQ4Yfa743xpduPz2NZx8KCyLUMIb4OVuMM=;
 b=/VvBlpXASJ1lpY0so6R1PDjhJ9CMK3Pp2afrtVFVAsaopP4ILtRhWc9qNvcLvDJzQfex0d
 R7ffobwFYdQ99mDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CF65A1346B;
 Mon,  8 May 2023 07:03:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 59pzMdOeWGSTKQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 08 May 2023 07:03:47 +0000
Message-ID: <61e936c4-6e24-4ea5-03b5-942821a30fa3@suse.de>
Date: Mon, 8 May 2023 09:03:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 48/53] drm/tiny: Convert to platform remove callback
 returning void
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Alexey Brodkin <abrodkin@synopsys.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
 <20230507162616.1368908-49-u.kleine-koenig@pengutronix.de>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230507162616.1368908-49-u.kleine-koenig@pengutronix.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------17PkmhhEQnE3yiCoqeGSJTXn"
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
--------------17PkmhhEQnE3yiCoqeGSJTXn
Content-Type: multipart/mixed; boundary="------------jEu6m0Pog90l6Y08MpzbTCJT";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Alexey Brodkin <abrodkin@synopsys.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: kernel@pengutronix.de, dri-devel@lists.freedesktop.org
Message-ID: <61e936c4-6e24-4ea5-03b5-942821a30fa3@suse.de>
Subject: Re: [PATCH 48/53] drm/tiny: Convert to platform remove callback
 returning void
References: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
 <20230507162616.1368908-49-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230507162616.1368908-49-u.kleine-koenig@pengutronix.de>

--------------jEu6m0Pog90l6Y08MpzbTCJT
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGksDQoNCnRoZSBzdWJqZWN0IGxpbmUgaXMgYSBiaXQgdWdseS4gWW91IG1heSB3YW50IHRv
IGNoYW5nZSB0aGUgaXQgdG8gc2F5IA0KZWl0aGVyICdkcm0vdGlueS9hcmNncHUnIG9yIGp1
c3QgJ2RybS9hcmNncHUnLiBTYW1lIGZvciB0aGUgb3RoZXIgDQp0aW55Ly1yZWxhdGVkIHBh
dGNoZXMuDQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCkFtIDA3LjA1LjIzIHVtIDE4OjI2
IHNjaHJpZWIgVXdlIEtsZWluZS1Lw7ZuaWc6DQo+IFRoZSAucmVtb3ZlKCkgY2FsbGJhY2sg
Zm9yIGEgcGxhdGZvcm0gZHJpdmVyIHJldHVybnMgYW4gaW50IHdoaWNoIG1ha2VzDQo+IG1h
bnkgZHJpdmVyIGF1dGhvcnMgd3JvbmdseSBhc3N1bWUgaXQncyBwb3NzaWJsZSB0byBkbyBl
cnJvciBoYW5kbGluZyBieQ0KPiByZXR1cm5pbmcgYW4gZXJyb3IgY29kZS4gSG93ZXZlciB0
aGUgdmFsdWUgcmV0dXJuZWQgaXMgKG1vc3RseSkgaWdub3JlZA0KPiBhbmQgdGhpcyB0eXBp
Y2FsbHkgcmVzdWx0cyBpbiByZXNvdXJjZSBsZWFrcy4gVG8gaW1wcm92ZSBoZXJlIHRoZXJl
IGlzIGENCj4gcXVlc3QgdG8gbWFrZSB0aGUgcmVtb3ZlIGNhbGxiYWNrIHJldHVybiB2b2lk
LiBJbiB0aGUgZmlyc3Qgc3RlcCBvZiB0aGlzDQo+IHF1ZXN0IGFsbCBkcml2ZXJzIGFyZSBj
b252ZXJ0ZWQgdG8gLnJlbW92ZV9uZXcoKSB3aGljaCBhbHJlYWR5IHJldHVybnMNCj4gdm9p
ZC4NCj4gDQo+IFRyaXZpYWxseSBjb252ZXJ0IHRoaXMgZHJpdmVyIGZyb20gYWx3YXlzIHJl
dHVybmluZyB6ZXJvIGluIHRoZSByZW1vdmUNCj4gY2FsbGJhY2sgdG8gdGhlIHZvaWQgcmV0
dXJuaW5nIHZhcmlhbnQuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBVd2UgS2xlaW5lLUvDtm5p
ZyA8dS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlPg0KPiAtLS0NCj4gICBkcml2ZXJz
L2dwdS9kcm0vdGlueS9hcmNwZ3UuYyB8IDYgKystLS0tDQo+ICAgMSBmaWxlIGNoYW5nZWQs
IDIgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vdGlueS9hcmNwZ3UuYyBiL2RyaXZlcnMvZ3B1L2RybS90aW55L2Fy
Y3BndS5jDQo+IGluZGV4IDYxMWJiZWUxNTA3MS4uYTFmOTk4YTg1Y2U4IDEwMDY0NA0KPiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0vdGlueS9hcmNwZ3UuYw0KPiArKysgYi9kcml2ZXJzL2dw
dS9kcm0vdGlueS9hcmNwZ3UuYw0KPiBAQCAtNDA0LDE0ICs0MDQsMTIgQEAgc3RhdGljIGlu
dCBhcmNwZ3VfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gICAJcmV0
dXJuIHJldDsNCj4gICB9DQo+ICAgDQo+IC1zdGF0aWMgaW50IGFyY3BndV9yZW1vdmUoc3Ry
dWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gK3N0YXRpYyB2b2lkIGFyY3BndV9yZW1v
dmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gICB7DQo+ICAgCXN0cnVjdCBk
cm1fZGV2aWNlICpkcm0gPSBwbGF0Zm9ybV9nZXRfZHJ2ZGF0YShwZGV2KTsNCj4gICANCj4g
ICAJZHJtX2Rldl91bnJlZ2lzdGVyKGRybSk7DQo+ICAgCWFyY3BndV91bmxvYWQoZHJtKTsN
Cj4gLQ0KPiAtCXJldHVybiAwOw0KPiAgIH0NCj4gICANCj4gICBzdGF0aWMgY29uc3Qgc3Ry
dWN0IG9mX2RldmljZV9pZCBhcmNwZ3Vfb2ZfdGFibGVbXSA9IHsNCj4gQEAgLTQyMyw3ICs0
MjEsNyBAQCBNT0RVTEVfREVWSUNFX1RBQkxFKG9mLCBhcmNwZ3Vfb2ZfdGFibGUpOw0KPiAg
IA0KPiAgIHN0YXRpYyBzdHJ1Y3QgcGxhdGZvcm1fZHJpdmVyIGFyY3BndV9wbGF0Zm9ybV9k
cml2ZXIgPSB7DQo+ICAgCS5wcm9iZSA9IGFyY3BndV9wcm9iZSwNCj4gLQkucmVtb3ZlID0g
YXJjcGd1X3JlbW92ZSwNCj4gKwkucmVtb3ZlX25ldyA9IGFyY3BndV9yZW1vdmUsDQo+ICAg
CS5kcml2ZXIgPSB7DQo+ICAgCQkgICAubmFtZSA9ICJhcmNwZ3UiLA0KPiAgIAkJICAgLm9m
X21hdGNoX3RhYmxlID0gYXJjcGd1X29mX3RhYmxlLA0KDQotLSANClRob21hcyBaaW1tZXJt
YW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9u
cyBHZXJtYW55IEdtYkgNCkZyYW5rZW5zdHJhc3NlIDE0NiwgOTA0NjEgTnVlcm5iZXJnLCBH
ZXJtYW55DQpHRjogSXZvIFRvdGV2LCBBbmRyZXcgTXllcnMsIEFuZHJldyBNY0RvbmFsZCwg
Qm91ZGllbiBNb2VybWFuDQpIUkIgMzY4MDkgKEFHIE51ZXJuYmVyZykNCg==

--------------jEu6m0Pog90l6Y08MpzbTCJT--

--------------17PkmhhEQnE3yiCoqeGSJTXn
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmRYnsIFAwAAAAAACgkQlh/E3EQov+C5
Zg/+PadtG8NFM7Maw64A+7P4KsAf+wAXuvbI5ifyXN77BXJRTWo5686swJdGz2CX7iRUvOxbo7e0
JacFGHBsRBuKZ4txqYckHAabSV5P0HhfA1BR0pSxW6mnUlTZdYkV+xQIR5P5lY9css6q13e06/JV
EhWCqNYwBTTGqaJaN6Mm6PtdW27BSmEaZJDh4XRkTI+KqrUk19keHLYeEkci2Wp7cEsEX6tXpEa9
ubQjb3CHm4vW1TjzIQN3GkvEd02afqz7r7s/J05SZC71mm2syaGZQDyC8pXtdxm76WuYuCm+yWvK
s5+txd5XIwBykSejn7OMqCk7G6vS3PEkLyQ79F0UCFR45EAYbY5wbGvYg1WxNTTXR7gaALBiWmuV
N2Bd0xKgYqF3cdECtlf0qSC8/T+whcIuqqvQnJLLg68LuQPkcC/TN3lOrDBcvRgs4/u13FJuSUXe
nJHHUsdnnOCDFUQgoiScVZCXv78xT31uRbaO4fsERKQOkcM9lNYPNWO1WQZsI8DgMkCY4ezg+uiv
2r76r0f1OsfsorRupHkqEyEnaCzQG4KWWBj7Vbm6IBSTJD18PdcAyROhsxJ6d81aKzwiZHGwBJOA
2nivmKSvCKqZMlbMyCrTpeotVoRPyeAScwufUaTUCO6iNgrvMPySFxetGm3vn8RquOlb3D08C+8P
9BY=
=EWFx
-----END PGP SIGNATURE-----

--------------17PkmhhEQnE3yiCoqeGSJTXn--
