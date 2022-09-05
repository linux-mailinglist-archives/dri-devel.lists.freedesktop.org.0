Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E62F75ACD7C
	for <lists+dri-devel@lfdr.de>; Mon,  5 Sep 2022 10:16:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E4A210E205;
	Mon,  5 Sep 2022 08:16:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B69310E205
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Sep 2022 08:16:22 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C99EB38537;
 Mon,  5 Sep 2022 08:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1662365780; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/5hSJMyKVQK2uJfNaEGkm0zGdqWR5G0A/y2dmAYpPyk=;
 b=jXQ6MM47HXSy0pqC8Hb2bHy994deUhCywSWmzedZ2ggsLDpsi66YcRQEDr0uvypUJ9EDnN
 p+1TFrEAU/bJ8lg0Hd6kWpDH5FS932MUc7RkKaMzCAS6Sa3O8Ab3IuCfyZROYZUKHSt0Qb
 epe8zUbhI2PudUPIUMS8hoNZ06ZEraM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1662365780;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/5hSJMyKVQK2uJfNaEGkm0zGdqWR5G0A/y2dmAYpPyk=;
 b=uAKOmLx/b/t2X8tR4IzGWosKqQj20R0305uJysBmVSoU8sjUMfzhsKiq5S4zQY2DSsvA5b
 PohNlRumqBPXjhAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AA55B13A66;
 Mon,  5 Sep 2022 08:16:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id TMGOKFSwFWNNBgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 05 Sep 2022 08:16:20 +0000
Message-ID: <2a30fbbd-07bf-65e4-f72c-fe3d3d93b7be@suse.de>
Date: Mon, 5 Sep 2022 10:16:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH 09/12] drm/udl: Fix potential URB leaks
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>
References: <20220816153655.27526-1-tiwai@suse.de>
 <20220816153655.27526-10-tiwai@suse.de>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220816153655.27526-10-tiwai@suse.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------0Y0LpqhWM2FCLoynCZh05PFr"
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
--------------0Y0LpqhWM2FCLoynCZh05PFr
Content-Type: multipart/mixed; boundary="------------JCAUSmpW00bF7EX6zkVvC34x";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Message-ID: <2a30fbbd-07bf-65e4-f72c-fe3d3d93b7be@suse.de>
Subject: Re: [PATCH 09/12] drm/udl: Fix potential URB leaks
References: <20220816153655.27526-1-tiwai@suse.de>
 <20220816153655.27526-10-tiwai@suse.de>
In-Reply-To: <20220816153655.27526-10-tiwai@suse.de>

--------------JCAUSmpW00bF7EX6zkVvC34x
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTYuMDguMjIgdW0gMTc6MzYgc2NocmllYiBUYWthc2hpIEl3YWk6DQo+IEEg
Y291cGxlIG9mIGVycm9yIGhhbmRsaW5ncyBmb3Jnb3QgdG8gcHJvY2VzcyB0aGUgVVJCIGNv
bXBsZXRpb24uDQo+IFRob3NlIGFyZSBib3RoIHdpdGggV0FSTl9PTigpIHNvIHNob3VsZCBi
ZSB2aXNpYmxlLCBidXQgd2UgbXVzdCBmaXgNCj4gdGhlbSBpbiBhbnl3YXkuDQo+IA0KPiBG
aXhlczogNzM1MGIyYTNmYmM2ICgiZHJtL3VkbDogUmVwbGFjZSBCVUdfT04oKSB3aXRoIFdB
Uk5fT04oKSIpDQo+IFNpZ25lZC1vZmYtYnk6IFRha2FzaGkgSXdhaSA8dGl3YWlAc3VzZS5k
ZT4NCg0KQWNrZWQtYnk6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRl
Pg0KDQo+IC0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS91ZGwvdWRsX21haW4uYyAgICAgfCA4
ICsrKysrLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL3VkbC91ZGxfdHJhbnNmZXIuYyB8IDUg
KysrKy0NCj4gICAyIGZpbGVzIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlv
bnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdWRsL3VkbF9tYWlu
LmMgYi9kcml2ZXJzL2dwdS9kcm0vdWRsL3VkbF9tYWluLmMNCj4gaW5kZXggM2M5N2Y2NDc4
ODNmLi44YmJiNGUyODYxZmIgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS91ZGwv
dWRsX21haW4uYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vdWRsL3VkbF9tYWluLmMNCj4g
QEAgLTI2NSwxMSArMjY1LDEzIEBAIGludCB1ZGxfc3VibWl0X3VyYihzdHJ1Y3QgZHJtX2Rl
dmljZSAqZGV2LCBzdHJ1Y3QgdXJiICp1cmIsIHNpemVfdCBsZW4pDQo+ICAgCXN0cnVjdCB1
ZGxfZGV2aWNlICp1ZGwgPSB0b191ZGwoZGV2KTsNCj4gICAJaW50IHJldDsNCj4gICANCj4g
LQlpZiAoV0FSTl9PTihsZW4gPiB1ZGwtPnVyYnMuc2l6ZSkpDQo+IC0JCXJldHVybiAtRUlO
VkFMOw0KPiAtDQo+ICsJaWYgKFdBUk5fT04obGVuID4gdWRsLT51cmJzLnNpemUpKSB7DQo+
ICsJCXJldCA9IC1FSU5WQUw7DQo+ICsJCWdvdG8gZXJyb3I7DQo+ICsJfQ0KPiAgIAl1cmIt
PnRyYW5zZmVyX2J1ZmZlcl9sZW5ndGggPSBsZW47IC8qIHNldCB0byBhY3R1YWwgcGF5bG9h
ZCBsZW4gKi8NCj4gICAJcmV0ID0gdXNiX3N1Ym1pdF91cmIodXJiLCBHRlBfQVRPTUlDKTsN
Cj4gKyBlcnJvcjoNCj4gICAJaWYgKHJldCkgew0KPiAgIAkJdWRsX3VyYl9jb21wbGV0aW9u
KHVyYik7IC8qIGJlY2F1c2Ugbm8gb25lIGVsc2Ugd2lsbCAqLw0KPiAgIAkJRFJNX0VSUk9S
KCJ1c2Jfc3VibWl0X3VyYiBlcnJvciAleFxuIiwgcmV0KTsNCj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS91ZGwvdWRsX3RyYW5zZmVyLmMgYi9kcml2ZXJzL2dwdS9kcm0vdWRs
L3VkbF90cmFuc2Zlci5jDQo+IGluZGV4IGE0MzEyMDhkZGE4NS4uYjU3ODQ0NjMyZGJkIDEw
MDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vdWRsL3VkbF90cmFuc2Zlci5jDQo+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS91ZGwvdWRsX3RyYW5zZmVyLmMNCj4gQEAgLTE4MCw4ICsx
ODAsMTEgQEAgaW50IHVkbF9yZW5kZXJfaGxpbmUoc3RydWN0IGRybV9kZXZpY2UgKmRldiwg
aW50IGxvZ19icHAsIHN0cnVjdCB1cmIgKip1cmJfcHRyLA0KPiAgIAl1OCAqY21kID0gKnVy
Yl9idWZfcHRyOw0KPiAgIAl1OCAqY21kX2VuZCA9ICh1OCAqKSB1cmItPnRyYW5zZmVyX2J1
ZmZlciArIHVyYi0+dHJhbnNmZXJfYnVmZmVyX2xlbmd0aDsNCj4gICANCj4gLQlpZiAoV0FS
Tl9PTighKGxvZ19icHAgPT0gMSB8fCBsb2dfYnBwID09IDIpKSkNCj4gKwlpZiAoV0FSTl9P
TighKGxvZ19icHAgPT0gMSB8fCBsb2dfYnBwID09IDIpKSkgew0KPiArCQkvKiBuZWVkIHRv
IGZpbmlzaCBVUkIgYXQgZXJyb3IgZnJvbSB0aGlzIGZ1bmN0aW9uICovDQo+ICsJCXVkbF91
cmJfY29tcGxldGlvbih1cmIpOw0KPiAgIAkJcmV0dXJuIC1FSU5WQUw7DQo+ICsJfQ0KPiAg
IA0KPiAgIAlsaW5lX3N0YXJ0ID0gKHU4ICopIChmcm9udCArIGJ5dGVfb2Zmc2V0KTsNCj4g
ICAJbmV4dF9waXhlbCA9IGxpbmVfc3RhcnQ7DQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4N
CkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdl
cm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55DQoo
SFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8aHJlcjogSXZvIFRvdGV2
DQo=

--------------JCAUSmpW00bF7EX6zkVvC34x--

--------------0Y0LpqhWM2FCLoynCZh05PFr
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmMVsFQFAwAAAAAACgkQlh/E3EQov+Cl
wBAA0JoYWawoe1eud2RC4n+4c947cO0yQJiqeJPcHg9GitRyCUetM92N6ZPQTCOwE/QPGj6+CvzZ
5dLUWY4jShTpTcTHfuTMwg240CRM8ZG4wfuhtQP4THmu92Han7GBkZtV9FdbV/lCnonqP2ypHzaI
QIz+7/uQi6x7dU0yjZSUmHp0jg2bB2qapv/lUtLWhkPQLRlRd7QU2RGf/h+ukfFw+cedwYUXxq4n
iA+NYAZRe/DHoFLWKswZ97qKs79/+v1i0qj1dY4cqaV7mQDjcuoWjwz+aPbHMr3rpyRJTDy5isQM
r/ePk3tkDHYwC4wJpTnrEPP2lZlxSEqaUmVLxubw091Bz5MqW8CzNWhifMUxz1HPjGCpElNwx21y
Q22BSFg+/qji3HMJm+7xCNITfkr0InlR6a/sf88wJpgBUIWqBP383xKHYikIjcD33oNGK920aHKy
M/l1Xu5jEfeaLA6P7r3ZNx9lIpvE3kS+ZQkm/mGkF3LAeyp3FOXQ71hk/V9sm7EXIGUWfSJWymG3
kgrfC9QOSIqCLyk1z/NJpKufRXVDhCxz4XfjNvVy+/ro/S8R6ouk8txQA3wbNhj9oluSvmTIwj6R
zMIl+sxJk7MW+GSxb56texDj8HU+gQR7AHi4PdFH7vkfvCgduP44A9NZfzzcqoEdKOAlpUR3/AC0
CIA=
=ihOU
-----END PGP SIGNATURE-----

--------------0Y0LpqhWM2FCLoynCZh05PFr--
