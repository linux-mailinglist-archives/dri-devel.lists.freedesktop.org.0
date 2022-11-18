Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AACC62F691
	for <lists+dri-devel@lfdr.de>; Fri, 18 Nov 2022 14:48:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A64D210E1FD;
	Fri, 18 Nov 2022 13:48:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24C2C10E0C7
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Nov 2022 13:48:19 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D52DD1FA8D;
 Fri, 18 Nov 2022 13:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1668779297; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tM0Ewy/eZUuzJxHnPntSufeGK0IfrvYjnhg/6aHStSs=;
 b=Udn+UdM16vuSyngAiN80ZgozmuwQqs3Hy5Mz8lhsIrvltQnGyn95Y1ZrDNrCpv9JjO2yyW
 pFm8wOvu2fsSH/xibDm4VkeWORnmTW9Cjw2bV2olGCBhYZ3LF9enBIS+VxffvDN5ZuGQ14
 BYdo/fqgUkQvgyznV1/mzed15MF4FHM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1668779297;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tM0Ewy/eZUuzJxHnPntSufeGK0IfrvYjnhg/6aHStSs=;
 b=sri4nJaViX750TREfBPleluHXnP5liadCSqhLlgicz+VTSgTZzah0deCXdqAm7qwND7XT1
 upj+GeWl3ySXkCBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8F42113A66;
 Fri, 18 Nov 2022 13:48:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id xPM2IiGNd2OUMwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 18 Nov 2022 13:48:17 +0000
Message-ID: <2d2bf68d-6a6a-d00c-a277-4ebc492e8fae@suse.de>
Date: Fri, 18 Nov 2022 14:48:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 2/7] drm/logicvc: Fix preferred fbdev cpp
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>, daniel@ffwll.ch,
 airlied@gmail.com, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 xinliang.liu@linaro.org, tiantao6@hisilicon.com, jstultz@google.com,
 kong.kongxinwei@hisilicon.com, puck.chen@hisilicon.com,
 paul.kocialkowski@bootlin.com, airlied@redhat.com, kraxel@redhat.com
References: <20221116160917.26342-1-tzimmermann@suse.de>
 <20221116160917.26342-3-tzimmermann@suse.de>
 <521e43bb-0c76-f3b7-aa78-8ed97edce613@redhat.com>
 <10c809cb-2ea9-273c-bfd2-a267e6219f22@suse.de>
 <5893d46d-ca8a-81e4-2884-aa682ef69872@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <5893d46d-ca8a-81e4-2884-aa682ef69872@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------FdsHi2fvw8MWgJmF7oLjrKIx"
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
Cc: dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------FdsHi2fvw8MWgJmF7oLjrKIx
Content-Type: multipart/mixed; boundary="------------fbbf0mNiTZO5hKOS9fgtD2ag";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>, daniel@ffwll.ch,
 airlied@gmail.com, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 xinliang.liu@linaro.org, tiantao6@hisilicon.com, jstultz@google.com,
 kong.kongxinwei@hisilicon.com, puck.chen@hisilicon.com,
 paul.kocialkowski@bootlin.com, airlied@redhat.com, kraxel@redhat.com
Cc: dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
Message-ID: <2d2bf68d-6a6a-d00c-a277-4ebc492e8fae@suse.de>
Subject: Re: [PATCH 2/7] drm/logicvc: Fix preferred fbdev cpp
References: <20221116160917.26342-1-tzimmermann@suse.de>
 <20221116160917.26342-3-tzimmermann@suse.de>
 <521e43bb-0c76-f3b7-aa78-8ed97edce613@redhat.com>
 <10c809cb-2ea9-273c-bfd2-a267e6219f22@suse.de>
 <5893d46d-ca8a-81e4-2884-aa682ef69872@redhat.com>
In-Reply-To: <5893d46d-ca8a-81e4-2884-aa682ef69872@redhat.com>

--------------fbbf0mNiTZO5hKOS9fgtD2ag
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTguMTEuMjIgdW0gMTQ6NDEgc2NocmllYiBKYXZpZXIgTWFydGluZXogQ2Fu
aWxsYXM6DQo+IE9uIDExLzE4LzIyIDE0OjIyLCBUaG9tYXMgWmltbWVybWFubiB3cm90ZToN
Cj4gDQo+IFsuLi5dDQo+IA0KPj4+DQo+Pj4gSSdtIGFsc28gbm90IHN1cmUgaWYgdGhpcyBp
cyBuZWVkZWQuIFNpbmNlIElJVUMgaW4gbG9naWN2Y19tb2RlX2luaXQoKSB0aGUNCj4+PiBk
cml2ZXIgZG9lczoNCj4+Pg0KPj4+IAlwcmVmZXJyZWRfZGVwdGggPSBsYXllcl9wcmltYXJ5
LT5mb3JtYXRzLT5kZXB0aDsNCj4+Pg0KPj4+IAkvKiBEUk0gY291bnRzIGFscGhhIGluIGRl
cHRoLCBvdXIgZHJpdmVyIGRvZXNuJ3QuICovDQo+Pj4gCWlmIChsYXllcl9wcmltYXJ5LT5m
b3JtYXRzLT5hbHBoYSkNCj4+PiAJCXByZWZlcnJlZF9kZXB0aCArPSA4Ow0KPj4+DQo+Pj4g
CS4uLg0KPj4+IAltb2RlX2NvbmZpZy0+cHJlZmVycmVkX2RlcHRoID0gcHJlZmVycmVkX2Rl
cHRoOw0KPj4+DQo+Pj4gU28gaXQgc2VlbXMgdGhpcyBwYXRjaCBpcyBub3QgbmVlZGVkPyBV
bmxlc3MgSSdtIG1pc3VuZGVyc3RhbmRpbmcgdGhlIGNvZGUuDQo+Pg0KPj4gVGhlIGRyaXZl
ciB1c2VzIFhSR0I4ODg4LCBzbyB0aGUgMjQtYml0IGNvbG9yIGRlcHRoIGhhcyBhIDMyLWJp
dCBicHANCj4+IHZhbHVlLiBIZW5jZSB0aGUgc3dpdGNoLg0KPj4NCj4gDQo+IEFoLCBJIHNl
ZS4gU28gaXMgdG8gc2V0IDMyLWJpdCBicHAgZm9yIGJvdGggWFJHQjg4ODggYW5kIEFSR0I4
ODg4LiBCdXQgdGhlbg0KPiBJIHRoaW5rIHRoYXQgeW91IGFsc28gbmVlZCB0byBmaXggbG9n
aWN2Y19tb2RlX2luaXQoKSB0byByZW1vdmUgdGhhdCArPSA4Pw0KPiANCj4gQmVjYXVzZSBy
aWdodCBub3cgdGhlIHByZWZlcnJlZF9kZXB0aCArPSA4IHdvdWxkIHNldCBhIHByZWZlcnJl
ZF9kZXB0aCBvZiAzMg0KPiB3aGVuIHNob3VsZCBiZSBqdXN0IDI0IGV2ZW4gaWYgYWxwaGEg
aXMgZW5hYmxlZD8NCj4gDQo+IE9yIGFtIEkgY29uZnVzaW5nIGFnYWluIHRoZSBtZWFuaW5n
IG9mIHRoZSBjb2xvciBkZXB0aD8NCg0KRm9yIERSTSwgaXQncyBkZWZpbmVkIGluIGRybV9m
b3VyY2MuYy4gQVJHQjg4ODggaGFzIGEgZGVwdGggb2YgMzIgYW5kIA0KWFJHQjg4ODggaGFz
IGEgZGVwdGggb2YgMjQuIEJvdGggaGF2ZSBhIGJwcCBvZiAzMi4NCg0KQlVUIGluIGxvZ2lj
dmMncyBpbnRlcm5hbCBkYXRhIHN0cnVjdHVyZSwgYm90aCBmb3JtYXRzIGhhdmUgYSBjb2xv
ciANCmRlcHRoIG9mIDI0IGFuZCBhIGJwcCBvZiAzMi4NCg0KQmVzdCByZWdhcmRzDQpUaG9t
YXMNCg0KPiANCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERl
dmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxk
c3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJu
YmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCg==

--------------fbbf0mNiTZO5hKOS9fgtD2ag--

--------------FdsHi2fvw8MWgJmF7oLjrKIx
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmN3jSEFAwAAAAAACgkQlh/E3EQov+BD
Pg/+Ov5aMDuFeawJPAGZt4y/eT83vkSfiWcviT4c2xUrUK04kkt9+qzI85mMbBdeGTrZdxd3QIc9
14KhwwwrmPdezBUhS3I1ro4c5Qk9KV9i+eBZJjK/etLKethnPBYTLiu2dB9XexNwv7WoKYg2/TRm
wqLMbEs4icHvl3e052oC4bUTkLo4Jc+ZWTDzV5tl03yK7Hxx636WIsOV9nSRiOkU7yeqKEKYEOQo
FotgqSrQLROpg9jG5SwGBMziQM8n2RpnqriP5a/LvtN4GeOk79IhQtTigYF8X8iJSq+4QUNs8aU9
ye1QbGnlFFHjAt9usduscvplDwEWNVnt9+QhQ4JxwO9BNIYGy6TV8wM1Eyj9wt8hy/suQ3KM9ffT
+vD2sVbTH6qLGzmHKv9qtw0CsBW4gPJ+GGbMIaeqjqPbydHMUz6yT+5x8Ulnq1vcLShlpEUO+Mx9
C20P0bW4hoWMqZxVAk597oMUs/h92bRPgr+rkYgavBwk8ySiySwqDGHTQJbl6ubmWHkyKgZdijEj
0WcbjODBcYmV8kGJZ9a4z3rR2vx1u2insHO0iRLS5MhtMwSBmTWrgUw1uysDpP7upO12o50Z+LL7
LrFISRWbt7OfDwxPu4Pr6waozlZuJoonZTAgZWL4D70eozQtK9Y1YaplvcjaFbE3JE9RgOLYCwMR
6Ik=
=ttL6
-----END PGP SIGNATURE-----

--------------FdsHi2fvw8MWgJmF7oLjrKIx--
