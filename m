Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4309755F916
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 09:34:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 056F110E622;
	Wed, 29 Jun 2022 07:34:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C30A10E622
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 07:34:30 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 694EB1FA8D;
 Wed, 29 Jun 2022 07:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1656488067; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6JsYNHbheEycz5I3lv48lcpBuEAhWNnLM1heli5QFZw=;
 b=eYOclx6HkNSwNwnzu/RlAPTy/jq6Iry7yjLn8cPJCubRM9BCQiLqTPkfKuve/iCg6kRhwN
 jZhdyT4oQzTZwWG2fItVFmbPIvJm8mpW996wdaLPtppS7tMTlbHA0l8FkAcngI1jQDYNwL
 wQCkCxIoP3XjciIzyz+CpcfY9zMnBPU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1656488067;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6JsYNHbheEycz5I3lv48lcpBuEAhWNnLM1heli5QFZw=;
 b=+F6Zvkd/LPdif7sEnA7LKR9egdmdFlEm6itbqf6G5WJpXtgApXIB1qWMtvI/I03F/w5EXZ
 BiykLL05YrAba3BQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 31F65133D1;
 Wed, 29 Jun 2022 07:34:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Vg5uC4MAvGLRUwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 29 Jun 2022 07:34:27 +0000
Message-ID: <26ad3117-8cf4-012e-9c72-e08f03803aa4@suse.de>
Date: Wed, 29 Jun 2022 09:34:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 4/4] drm/format-helper: Add KUnit tests for
 drm_fb_xrgb8888_to_rgb565()
Content-Language: en-US
To: =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>,
 javierm@redhat.com
References: <20220627161132.33256-1-jose.exposito89@gmail.com>
 <20220627161132.33256-5-jose.exposito89@gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220627161132.33256-5-jose.exposito89@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------1gPg0VYGZym0Pr29hJcKrGxW"
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
Cc: magalilemes00@gmail.com, airlied@linux.ie, maira.canal@usp.br,
 dlatypov@google.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, davidgow@google.com,
 tales.aparecida@gmail.com, isabbasso@riseup.net, kunit-dev@googlegroups.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------1gPg0VYGZym0Pr29hJcKrGxW
Content-Type: multipart/mixed; boundary="------------oecQKF7pSPWKEssFx0VqVFWS";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>,
 javierm@redhat.com
Cc: dri-devel@lists.freedesktop.org, magalilemes00@gmail.com,
 airlied@linux.ie, maira.canal@usp.br, dlatypov@google.com,
 linux-kernel@vger.kernel.org, tales.aparecida@gmail.com,
 davidgow@google.com, isabbasso@riseup.net, kunit-dev@googlegroups.com
Message-ID: <26ad3117-8cf4-012e-9c72-e08f03803aa4@suse.de>
Subject: Re: [PATCH 4/4] drm/format-helper: Add KUnit tests for
 drm_fb_xrgb8888_to_rgb565()
References: <20220627161132.33256-1-jose.exposito89@gmail.com>
 <20220627161132.33256-5-jose.exposito89@gmail.com>
In-Reply-To: <20220627161132.33256-5-jose.exposito89@gmail.com>

--------------oecQKF7pSPWKEssFx0VqVFWS
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjcuMDYuMjIgdW0gMTg6MTEgc2NocmllYiBKb3PDqSBFeHDDs3NpdG86DQo+
IEV4dGVuZCB0aGUgZXhpc3RpbmcgdGVzdCBjYXNlcyB0byB0ZXN0IHRoZSBjb252ZXJzaW9u
IGZyb20gWFJHQjg4ODggdG8NCj4gUkdCNTY1Lg0KPiANCj4gVGhlIGRvY3VtZW50YXRpb24g
YW5kIHRoZSBjb2xvciBwaWNrZXIgYXZhaWxhYmxlIG9uIFsxXSBhcmUgdXNlZnVsDQo+IHJl
c291cmNlcyB0byB1bmRlcnN0YW5kIHRoaXMgcGF0Y2ggYW5kIHZhbGlkYXRlIHRoZSB2YWx1
ZXMgcmV0dXJuZWQgYnkNCj4gdGhlIGNvbnZlcnNpb24gZnVuY3Rpb24uDQo+IA0KPiBbMV0g
aHR0cDovL3d3dy5iYXJ0aC1kZXYuZGUvb25saW5lL3JnYjU2NS1jb2xvci1waWNrZXIvDQoN
ClVSTHMgaW4gY29tbWl0IG1lc3NhZ2VzIGFyZSB1c3VhbGx5IGdpdmVuIGFzIExpbmsgdGFn
IGxpa2UgdGhpczoNCg0KTGluazogaHR0cDovL3d3dy5iYXJ0aC1kZXYuZGUvb25saW5lL3Jn
YjU2NS1jb2xvci1waWNrZXIvICMgWzFdDQoNClB1dCB0aGlzIHNvbWV3aGVyZSBiZWxvdyB5
b3VyIHNpZ25lZC1vZmYtYnkgdGFnLg0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQo+IA0K
PiBTaWduZWQtb2ZmLWJ5OiBKb3PDqSBFeHDDs3NpdG8gPGpvc2UuZXhwb3NpdG84OUBnbWFp
bC5jb20+DQo+IC0tLQ0KPiAgIC4uLi9ncHUvZHJtL3Rlc3RzL2RybV9mb3JtYXRfaGVscGVy
X3Rlc3QuYyAgICB8IDEwMCArKysrKysrKysrKysrKysrKy0NCj4gICAxIGZpbGUgY2hhbmdl
ZCwgOTkgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS90ZXN0cy9kcm1fZm9ybWF0X2hlbHBlcl90ZXN0LmMgYi9kcml2
ZXJzL2dwdS9kcm0vdGVzdHMvZHJtX2Zvcm1hdF9oZWxwZXJfdGVzdC5jDQo+IGluZGV4IDUy
ZGM0MWNjN2M2MC4uM2ZiZTgwMjZiY2NjIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vdGVzdHMvZHJtX2Zvcm1hdF9oZWxwZXJfdGVzdC5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS90ZXN0cy9kcm1fZm9ybWF0X2hlbHBlcl90ZXN0LmMNCj4gQEAgLTQ4LDcgKzQ4LDcg
QEAgc3RydWN0IGNvbnZlcnRfeHJnYjg4ODhfY2FzZSB7DQo+ICAgCXVuc2lnbmVkIGludCBw
aXRjaDsNCj4gICAJc3RydWN0IGRybV9yZWN0IGNsaXA7DQo+ICAgCWNvbnN0IHUzMiB4cmdi
ODg4OFtURVNUX0JVRl9TSVpFXTsNCj4gLQlzdHJ1Y3QgY29udmVydF94cmdiODg4OF9yZXN1
bHQgcmVzdWx0c1sxXTsNCj4gKwlzdHJ1Y3QgY29udmVydF94cmdiODg4OF9yZXN1bHQgcmVz
dWx0c1szXTsNCj4gICB9Ow0KPiAgIA0KPiAgIHN0YXRpYyBzdHJ1Y3QgY29udmVydF94cmdi
ODg4OF9jYXNlIGNvbnZlcnRfeHJnYjg4ODhfY2FzZXNbXSA9IHsNCj4gQEAgLTY0LDYgKzY0
LDI2IEBAIHN0YXRpYyBzdHJ1Y3QgY29udmVydF94cmdiODg4OF9jYXNlIGNvbnZlcnRfeHJn
Yjg4ODhfY2FzZXNbXSA9IHsNCj4gICAJCQkJLmRzdF9waXRjaCA9IDAsDQo+ICAgCQkJCS5l
eHBlY3RlZCA9IHsgMHhFMCB9LA0KPiAgIAkJCX0sDQo+ICsJCQl7DQo+ICsJCQkJLmRzdF9m
b3JtYXQgPSBEUk1fRk9STUFUX1JHQjU2NSwNCj4gKwkJCQkuaGFzX3N3YWIgPSB0cnVlLA0K
PiArCQkJCS5jb252X3N3YWIgPSB7DQo+ICsJCQkJCS5mdW5jID0gZHJtX2ZiX3hyZ2I4ODg4
X3RvX3JnYjU2NSwNCj4gKwkJCQkJLnN3YWIgPSBmYWxzZSwNCj4gKwkJCQl9LA0KPiArCQkJ
CS5kc3RfcGl0Y2ggPSAwLA0KPiArCQkJCS5leHBlY3RlZCA9IHsgMHgwMCwgMHhGOCB9LA0K
PiArCQkJfSwNCj4gKwkJCXsNCj4gKwkJCQkuZHN0X2Zvcm1hdCA9IERSTV9GT1JNQVRfUkdC
NTY1LA0KPiArCQkJCS5oYXNfc3dhYiA9IHRydWUsDQo+ICsJCQkJLmNvbnZfc3dhYiA9IHsN
Cj4gKwkJCQkJLmZ1bmMgPSBkcm1fZmJfeHJnYjg4ODhfdG9fcmdiNTY1LA0KPiArCQkJCQku
c3dhYiA9IHRydWUsDQo+ICsJCQkJfSwNCj4gKwkJCQkuZHN0X3BpdGNoID0gMCwNCj4gKwkJ
CQkuZXhwZWN0ZWQgPSB7IDB4RjgsIDB4MDAgfSwNCj4gKwkJCX0sDQo+ICAgCQl9LA0KPiAg
IAl9LA0KPiAgIAl7DQo+IEBAIC04MSw2ICsxMDEsMjYgQEAgc3RhdGljIHN0cnVjdCBjb252
ZXJ0X3hyZ2I4ODg4X2Nhc2UgY29udmVydF94cmdiODg4OF9jYXNlc1tdID0gew0KPiAgIAkJ
CQkuZHN0X3BpdGNoID0gMCwNCj4gICAJCQkJLmV4cGVjdGVkID0geyAweEUwIH0sDQo+ICAg
CQkJfSwNCj4gKwkJCXsNCj4gKwkJCQkuZHN0X2Zvcm1hdCA9IERSTV9GT1JNQVRfUkdCNTY1
LA0KPiArCQkJCS5oYXNfc3dhYiA9IHRydWUsDQo+ICsJCQkJLmNvbnZfc3dhYiA9IHsNCj4g
KwkJCQkJLmZ1bmMgPSBkcm1fZmJfeHJnYjg4ODhfdG9fcmdiNTY1LA0KPiArCQkJCQkuc3dh
YiA9IGZhbHNlLA0KPiArCQkJCX0sDQo+ICsJCQkJLmRzdF9waXRjaCA9IDAsDQo+ICsJCQkJ
LmV4cGVjdGVkID0geyAweDAwLCAweEY4IH0sDQo+ICsJCQl9LA0KPiArCQkJew0KPiArCQkJ
CS5kc3RfZm9ybWF0ID0gRFJNX0ZPUk1BVF9SR0I1NjUsDQo+ICsJCQkJLmhhc19zd2FiID0g
dHJ1ZSwNCj4gKwkJCQkuY29udl9zd2FiID0gew0KPiArCQkJCQkuZnVuYyA9IGRybV9mYl94
cmdiODg4OF90b19yZ2I1NjUsDQo+ICsJCQkJCS5zd2FiID0gdHJ1ZSwNCj4gKwkJCQl9LA0K
PiArCQkJCS5kc3RfcGl0Y2ggPSAwLA0KPiArCQkJCS5leHBlY3RlZCA9IHsgMHhGOCwgMHgw
MCB9LA0KPiArCQkJfSwNCj4gICAJCX0sDQo+ICAgCX0sDQo+ICAgCXsNCj4gQEAgLTExMCw2
ICsxNTAsMzYgQEAgc3RhdGljIHN0cnVjdCBjb252ZXJ0X3hyZ2I4ODg4X2Nhc2UgY29udmVy
dF94cmdiODg4OF9jYXNlc1tdID0gew0KPiAgIAkJCQkJMHhGQywgMHgxRiwNCj4gICAJCQkJ
fSwNCj4gICAJCQl9LA0KPiArCQkJew0KPiArCQkJCS5kc3RfZm9ybWF0ID0gRFJNX0ZPUk1B
VF9SR0I1NjUsDQo+ICsJCQkJLmhhc19zd2FiID0gdHJ1ZSwNCj4gKwkJCQkuY29udl9zd2Fi
ID0gew0KPiArCQkJCQkuZnVuYyA9IGRybV9mYl94cmdiODg4OF90b19yZ2I1NjUsDQo+ICsJ
CQkJCS5zd2FiID0gZmFsc2UsDQo+ICsJCQkJfSwNCj4gKwkJCQkuZHN0X3BpdGNoID0gMCwN
Cj4gKwkJCQkuZXhwZWN0ZWQgPSB7DQo+ICsJCQkJCTB4RkYsIDB4RkYsIDB4MDAsIDB4MDAs
DQo+ICsJCQkJCTB4MDAsIDB4RjgsIDB4RTAsIDB4MDcsDQo+ICsJCQkJCTB4MUYsIDB4MDAs
IDB4MUYsIDB4RjgsDQo+ICsJCQkJCTB4RTAsIDB4RkYsIDB4RkYsIDB4MDcsDQo+ICsJCQkJ
fSwNCj4gKwkJCX0sDQo+ICsJCQl7DQo+ICsJCQkJLmRzdF9mb3JtYXQgPSBEUk1fRk9STUFU
X1JHQjU2NSwNCj4gKwkJCQkuaGFzX3N3YWIgPSB0cnVlLA0KPiArCQkJCS5jb252X3N3YWIg
PSB7DQo+ICsJCQkJCS5mdW5jID0gZHJtX2ZiX3hyZ2I4ODg4X3RvX3JnYjU2NSwNCj4gKwkJ
CQkJLnN3YWIgPSB0cnVlLA0KPiArCQkJCX0sDQo+ICsJCQkJLmRzdF9waXRjaCA9IDAsDQo+
ICsJCQkJLmV4cGVjdGVkID0gew0KPiArCQkJCQkweEZGLCAweEZGLCAweDAwLCAweDAwLA0K
PiArCQkJCQkweEY4LCAweDAwLCAweDA3LCAweEUwLA0KPiArCQkJCQkweDAwLCAweDFGLCAw
eEY4LCAweDFGLA0KPiArCQkJCQkweEZGLCAweEUwLCAweDA3LCAweEZGLA0KPiArCQkJCX0s
DQo+ICsJCQl9LA0KPiAgIAkJfSwNCj4gICAJfSwNCj4gICAJew0KPiBAQCAtMTMzLDYgKzIw
MywzNCBAQCBzdGF0aWMgc3RydWN0IGNvbnZlcnRfeHJnYjg4ODhfY2FzZSBjb252ZXJ0X3hy
Z2I4ODg4X2Nhc2VzW10gPSB7DQo+ICAgCQkJCQkweEEwLCAweDZELCAweDBBLCAweDAwLCAw
eDAwLA0KPiAgIAkJCQl9LA0KPiAgIAkJCX0sDQo+ICsJCQl7DQo+ICsJCQkJLmRzdF9mb3Jt
YXQgPSBEUk1fRk9STUFUX1JHQjU2NSwNCj4gKwkJCQkuaGFzX3N3YWIgPSB0cnVlLA0KPiAr
CQkJCS5jb252X3N3YWIgPSB7DQo+ICsJCQkJCS5mdW5jID0gZHJtX2ZiX3hyZ2I4ODg4X3Rv
X3JnYjU2NSwNCj4gKwkJCQkJLnN3YWIgPSBmYWxzZSwNCj4gKwkJCQl9LA0KPiArCQkJCS5k
c3RfcGl0Y2ggPSAxMCwNCj4gKwkJCQkuZXhwZWN0ZWQgPSB7DQo+ICsJCQkJCTB4MzMsIDB4
MEEsIDB4NjAsIDB4MTIsIDB4MDAsIDB4QTgsIDB4MDAsIDB4MDAsIDB4MDAsIDB4MDAsDQo+
ICsJCQkJCTB4OEUsIDB4NkIsIDB4MzMsIDB4MEEsIDB4NjAsIDB4MTIsIDB4MDAsIDB4MDAs
IDB4MDAsIDB4MDAsDQo+ICsJCQkJCTB4MDAsIDB4QTgsIDB4OEUsIDB4NkIsIDB4MzMsIDB4
MEEsIDB4MDAsIDB4MDAsIDB4MDAsIDB4MDAsDQo+ICsJCQkJfSwNCj4gKwkJCX0sDQo+ICsJ
CQl7DQo+ICsJCQkJLmRzdF9mb3JtYXQgPSBEUk1fRk9STUFUX1JHQjU2NSwNCj4gKwkJCQku
aGFzX3N3YWIgPSB0cnVlLA0KPiArCQkJCS5jb252X3N3YWIgPSB7DQo+ICsJCQkJCS5mdW5j
ID0gZHJtX2ZiX3hyZ2I4ODg4X3RvX3JnYjU2NSwNCj4gKwkJCQkJLnN3YWIgPSB0cnVlLA0K
PiArCQkJCX0sDQo+ICsJCQkJLmRzdF9waXRjaCA9IDEwLA0KPiArCQkJCS5leHBlY3RlZCA9
IHsNCj4gKwkJCQkJMHgwQSwgMHgzMywgMHgxMiwgMHg2MCwgMHhBOCwgMHgwMCwgMHgwMCwg
MHgwMCwgMHgwMCwgMHgwMCwNCj4gKwkJCQkJMHg2QiwgMHg4RSwgMHgwQSwgMHgzMywgMHgx
MiwgMHg2MCwgMHgwMCwgMHgwMCwgMHgwMCwgMHgwMCwNCj4gKwkJCQkJMHhBOCwgMHgwMCwg
MHg2QiwgMHg4RSwgMHgwQSwgMHgzMywgMHgwMCwgMHgwMCwgMHgwMCwgMHgwMCwNCj4gKwkJ
CQl9LA0KPiArCQkJfSwNCj4gICAJCX0sDQo+ICAgCX0sDQo+ICAgfTsNCg0KLS0gDQpUaG9t
YXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2Fy
ZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJl
cmcsIEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNmw7xo
cmVyOiBJdm8gVG90ZXYNCg==

--------------oecQKF7pSPWKEssFx0VqVFWS--

--------------1gPg0VYGZym0Pr29hJcKrGxW
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmK8AIIFAwAAAAAACgkQlh/E3EQov+Bs
NxAAvo0uDh/Sl0xEWCbOlEW+eaW7hw+kwqFRdazTiSGvdPbvvwCUkcOShE/OHnDliGsy8BrRfb73
6965N6JHEfBmiiiqgkGCvFHtuzlJ9/DMqvidfr6tUkUJN5HRd9TuEbSnSxRpvqm3FWldJ8v2cr/y
Hy4ePFXIKtNUF5ex72c2SjPy1gNEpCyBqcNFnX+wfF/vOo+6Wrvr2AMi2vNtONEQxKOjM1vfhY4G
FHOUv5zXI7NoxX7lnhG9/IliUwT3g/jIpLX+nBBKl84iY5EaAoKuV3yOeI3D1ajBWvYBzkiYbCVp
Btc1p0pN6Eoqs1YCN8DvXiw+qUagLmOpN7T84qb6lah/DNd9aSbUlqd9+aBmXc6Rj9gwMT2A2CMs
CwiLRtxgqeaxi9LJ5jah6O1UVcjBr5yhMAqMWtoDqa4dgq/JywDlFojY0renLHWPNyZVLng154IS
Zr4kT+Tk4rGhS/U78m/i3SsYwVKwt7deePJaBrUW9vUvysnuY3xs0q1pJ3BoeYY8vATSUBEHDNxr
rTdpZnIkLVqUy3WPq9HQCzBHiTjAlH99I91841GY5tMv0mkOU2Eh7K9DMb/1xWArB45akVSBl2p1
Drkpll73jWfHXokg2BbEK9B7lieEKFNQs/90QSGxc5SXRYGALe57DCr/GshimtkkiSsU9OoftvPd
M1k=
=VaKj
-----END PGP SIGNATURE-----

--------------1gPg0VYGZym0Pr29hJcKrGxW--
