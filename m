Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F11E551F3D
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jun 2022 16:43:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55D8210E349;
	Mon, 20 Jun 2022 14:43:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47A2C10E2FA
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jun 2022 14:43:20 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id EC7601F74D;
 Mon, 20 Jun 2022 14:43:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1655736198; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+judOiMiJ4zoZ8IkuuIGw4BY8wpcVhZqh6/fw6aOpjA=;
 b=PkFXK8PXjWlalBDKH4mGsDIMLTA2evj/s1p2GB53fL/sajDeJK5pXyG5wTzKA1CXI210Sg
 JT3HkXl/V8k5JEizRTqxPupUcE9cQNSnsx3+G7OC5c145b83cilqmBRp3wBiG/p864BZXr
 RVucZDlAGo9e25RDks7zsruEtRNz4xI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1655736198;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+judOiMiJ4zoZ8IkuuIGw4BY8wpcVhZqh6/fw6aOpjA=;
 b=f4kjBusJigW06A/ZqFT/QPVbswCYWbxNVsWD21NWscKBy5B9xn13/HF4tri2O5+ZpxIyI/
 is5+Tcm24L4enxAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CF15513638;
 Mon, 20 Jun 2022 14:43:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id a21xMYaHsGKhZgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 20 Jun 2022 14:43:18 +0000
Message-ID: <f5c36f65-598c-c8bc-d925-e471ae8dcd18@suse.de>
Date: Mon, 20 Jun 2022 16:43:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 05/64] drm/connector: Mention the cleanup after
 drm_connector_init
Content-Language: en-US
To: Maxime Ripard <maxime@cerno.tech>
References: <20220610092924.754942-1-maxime@cerno.tech>
 <20220610092924.754942-6-maxime@cerno.tech>
 <ede82148-dc9c-2944-ced3-9f7ce9c03e93@suse.de>
 <20220620121836.2bxmnyrfrfgvdyd2@houat>
 <d03ad37d-d658-712e-d02e-82c5af3c2b1c@suse.de>
 <20220620144045.xo5pdvvwvjtnijsg@houat>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220620144045.xo5pdvvwvjtnijsg@houat>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------IIkFWAt03cSxrpEAtH7UGkQ7"
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------IIkFWAt03cSxrpEAtH7UGkQ7
Content-Type: multipart/mixed; boundary="------------UQvQs4jPNh0YEJXx6EClbdMa";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Maxime Ripard <maxime@cerno.tech>
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@intel.com>,
 dri-devel@lists.freedesktop.org
Message-ID: <f5c36f65-598c-c8bc-d925-e471ae8dcd18@suse.de>
Subject: Re: [PATCH 05/64] drm/connector: Mention the cleanup after
 drm_connector_init
References: <20220610092924.754942-1-maxime@cerno.tech>
 <20220610092924.754942-6-maxime@cerno.tech>
 <ede82148-dc9c-2944-ced3-9f7ce9c03e93@suse.de>
 <20220620121836.2bxmnyrfrfgvdyd2@houat>
 <d03ad37d-d658-712e-d02e-82c5af3c2b1c@suse.de>
 <20220620144045.xo5pdvvwvjtnijsg@houat>
In-Reply-To: <20220620144045.xo5pdvvwvjtnijsg@houat>

--------------UQvQs4jPNh0YEJXx6EClbdMa
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjAuMDYuMjIgdW0gMTY6NDAgc2NocmllYiBNYXhpbWUgUmlwYXJkOg0KPiBP
biBNb24sIEp1biAyMCwgMjAyMiBhdCAwNDoxOTo0M1BNICswMjAwLCBUaG9tYXMgWmltbWVy
bWFubiB3cm90ZToNCj4+IEhpDQo+Pg0KPj4gQW0gMjAuMDYuMjIgdW0gMTQ6MTggc2Nocmll
YiBNYXhpbWUgUmlwYXJkOg0KPj4+ICsgKiBBdCBkcml2ZXIgdW5sb2FkIHRpbWUgdGhlIGRy
aXZlcidzICZkcm1fY29ubmVjdG9yX2Z1bmNzLmRlc3Ryb3kgaG9vaw0KPj4+ICsgKiBzaG91
bGQgY2FsbCBkcm1fY29ubmVjdG9yX3VucmVnaXN0ZXIoKSwgZHJtX2Nvbm5lY3Rvcl9jbGVh
bnVwKCkgYW5kDQo+Pj4gKyAqIGtmcmVlKCkgdGhlIGNvbm5lY3RvciBzdHJ1Y3R1cmUuDQo+
Pg0KPj4gVGhpcyBzZW50ZW5jZSBzb3VuZHMgb2RkLg0KPiANCj4gWWVhaCwgSSB3YXMgdXNp
bmcga2ZyZWUgYXMgYSB2ZXJiIHdoaWNoIGlzIHByb2JhYmx5IHdoZXJlIHRoZSB3ZWlyZG5l
c3MgY29tZXMgZnJvbS4NCj4gDQo+IFdvdWxkIHRoYXQgYmUgYmV0dGVyOg0KPiANCj4gQXQg
ZHJpdmVyIHVubG9hZCB0aW1lIHRoZSBkcml2ZXIncyAmZHJtX2Nvbm5lY3Rvcl9mdW5jcy5k
ZXN0cm95IGhvb2sgc2hvdWxkIGNhbGwNCj4gZHJtX2Nvbm5lY3Rvcl91bnJlZ2lzdGVyKCkg
YW5kIGZyZWUgdGhlIGNvbm5lY3RvciBzdHJ1Y3R1cmUuDQoNClllcy4gVGhhdCdzIGJldHRl
ci4NCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KPiANCj4gTWF4aW1lDQoNCi0tIA0KVGhv
bWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdh
cmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5i
ZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8
aHJlcjogSXZvIFRvdGV2DQo=

--------------UQvQs4jPNh0YEJXx6EClbdMa--

--------------IIkFWAt03cSxrpEAtH7UGkQ7
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmKwh4YFAwAAAAAACgkQlh/E3EQov+BX
thAAhqxJx/J7tI1YqJ3K3itT1W3H4cE/Bhau3Ez7RtSnY2uuHnOwBPxgsEMlZ/6svDRYpghE3Jcx
DyGhILJD7rAhQu24dvv7OYYrBtOjVK+t1uXEjxOR2EI/Xkw9Ey+gmUgOHTcvqZ83tRNqtVr3uqYe
+CaPMRYeKf+yysTs0g5EJ3FYqDf2Bl54vFwiBCV9ePzFa+ZR+7NgO5QbMXbgWPJDBaDfTky5FcT1
Uh97SPDJrYegtsWDveSed+ErlxmVFUX90SzHWIw0NrMvi30M9xgDQFxKqXPvNKP8jBDg9f0K5HA0
8u7NZqBuFV8XfNyMXwDaXaTV0z3UfswOFKMsECEr3O4Y4X/U4UiZIRaLetnSAv1IHGIGNgZiR6gJ
FRwsDrCywzFhkWN2FMJlbTJWG85TsdbckE+0bwK1WMUVvY5+d2TdRAdrxLuJYlyWvoXzHJBLpRDc
I2OOnUI93vQ+MhQpHfeBuS1xMBWTJZYm009pbhCU1zgZzsscAx5Em14McZrrTJ3jZePjkS4fYaTC
xmU/kmU+pSVshSOTEu9zaNNy7Ypi+yyv2w1LC1vA9diDRzL+3mQzkRuxgboRP0E9SvQJVH5Fyeyz
qodKWreU7c4KqYblZ5cH3Co/C9gZ2pz5uKsIq6jYgth7qvppNLqUSCLYV8ygQEmlyMGB7EM2oJ0t
HLk=
=CRsW
-----END PGP SIGNATURE-----

--------------IIkFWAt03cSxrpEAtH7UGkQ7--
