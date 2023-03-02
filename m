Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF9E76A84D3
	for <lists+dri-devel@lfdr.de>; Thu,  2 Mar 2023 16:03:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1071F10E506;
	Thu,  2 Mar 2023 15:03:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71A6B10E506
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Mar 2023 15:03:41 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 0E0A61FE68;
 Thu,  2 Mar 2023 15:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1677769420; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6tqlPWrIpaAuj6QydAAa2YtGvRuRC1Eoti5bZ9WwWL0=;
 b=iwUO15eRjkLELQ35CNaUOT24duQi46J8C68xAIuy8rY9Q1bAUC2kjF/rC5Xvw0mmuxftXK
 RhbqMoHz1fIHhGsvTTzSAl3Yt7qY25btQlMe4soHa11vi5prS52/JkwL0/4EPV1ZadYI6b
 dq5x50Ou0Rit1aoPK9Oj/n8pZln8ff8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1677769420;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6tqlPWrIpaAuj6QydAAa2YtGvRuRC1Eoti5bZ9WwWL0=;
 b=gRdIf8DpDVwt7OokoI/vuA1aUtjK92D0AvmmWpqlGDT4OF/5oVf6anJmBERoorb6lhsiWH
 Hy/XvNvzIwd1+ZDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D938213349;
 Thu,  2 Mar 2023 15:03:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 8bwINMu6AGQ3egAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 02 Mar 2023 15:03:39 +0000
Message-ID: <fc65ed62-29d9-7630-6a5e-52612640bf9e@suse.de>
Date: Thu, 2 Mar 2023 16:03:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 1/2] drm/prime: reject DMA-BUF attach when get_sg_table
 is missing
Content-Language: en-US
To: Simon Ser <contact@emersion.fr>, dri-devel@lists.freedesktop.org
References: <20230302143502.500661-1-contact@emersion.fr>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230302143502.500661-1-contact@emersion.fr>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------ZYPV5Rpr7tmwucJHKQKfdph6"
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Tian Tao <tiantao6@hisilicon.com>, Maxime Ripard <maxime@cerno.tech>,
 Hans de Goede <hdegoede@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------ZYPV5Rpr7tmwucJHKQKfdph6
Content-Type: multipart/mixed; boundary="------------1CZHab7Q3r0lRrtPYM0gn7nH";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Simon Ser <contact@emersion.fr>, dri-devel@lists.freedesktop.org
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Hans de Goede <hdegoede@redhat.com>, Maxime Ripard <maxime@cerno.tech>,
 Tian Tao <tiantao6@hisilicon.com>, =?UTF-8?Q?Christian_K=c3=b6nig?=
 <christian.koenig@amd.com>
Message-ID: <fc65ed62-29d9-7630-6a5e-52612640bf9e@suse.de>
Subject: Re: [PATCH v2 1/2] drm/prime: reject DMA-BUF attach when get_sg_table
 is missing
References: <20230302143502.500661-1-contact@emersion.fr>
In-Reply-To: <20230302143502.500661-1-contact@emersion.fr>

--------------1CZHab7Q3r0lRrtPYM0gn7nH
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDIuMDMuMjMgdW0gMTU6MzUgc2NocmllYiBTaW1vbiBTZXI6DQo+IGRybV9n
ZW1fbWFwX2RtYV9idWYoKSByZXF1aXJlcyBkcm1fZ2VtX29iamVjdF9mdW5jcy5nZXRfc2df
dGFibGUNCj4gdG8gYmUgaW1wbGVtZW50ZWQsIG9yIGVsc2UgV0FSTnMuDQo+IA0KPiBBbGxv
dyBkcml2ZXJzIHRvIGxlYXZlIHRoaXMgaG9vayB1bmltcGxlbWVudGVkIHRvIGltcGxlbWVu
dCBwdXJlbHkNCj4gbG9jYWwgRE1BLUJVRnMgKGllLCBETUEtQlVGcyB3aGljaCBjYW5ub3Qg
YmUgaW1wb3J0ZWQgYW55d2hlcmUNCj4gZWxzZSBidXQgdGhlIGRldmljZSB3aGljaCBhbGxv
Y2F0ZWQgdGhlbSkuIEluIHRoYXQgY2FzZSwgcmVqZWN0DQo+IGltcG9ydHMgdG8gb3RoZXIg
ZGV2aWNlcyBpbiBkcm1fZ2VtX21hcF9hdHRhY2goKS4NCj4gDQo+IHYyOiBuZXcgcGF0Y2gN
Cj4gDQo+IFNpZ25lZC1vZmYtYnk6IFNpbW9uIFNlciA8Y29udGFjdEBlbWVyc2lvbi5mcj4N
Cj4gQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+DQo+IENjOiBU
aG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4NCj4gQ2M6IFRpYW4gVGFv
IDx0aWFudGFvNkBoaXNpbGljb24uY29tPg0KPiBDYzogTWF4aW1lIFJpcGFyZCA8bWF4aW1l
QGNlcm5vLnRlY2g+DQo+IENjOiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmln
QGFtZC5jb20+DQo+IENjOiBIYW5zIGRlIEdvZWRlIDxoZGVnb2VkZUByZWRoYXQuY29tPg0K
PiAtLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vZHJtX3ByaW1lLmMgfCA2ICsrKysrLQ0KPiAg
IDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gDQo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX3ByaW1lLmMgYi9kcml2ZXJzL2dw
dS9kcm0vZHJtX3ByaW1lLmMNCj4gaW5kZXggZjkyNGI4YjRhYjZiLi5hYjFkMjFkNjNhMDMg
MTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fcHJpbWUuYw0KPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vZHJtX3ByaW1lLmMNCj4gQEAgLTU0NCw3ICs1NDQsOCBAQCBpbnQg
ZHJtX3ByaW1lX2hhbmRsZV90b19mZF9pb2N0bChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCB2
b2lkICpkYXRhLA0KPiAgICAqIE9wdGlvbmFsIHBpbm5pbmcgb2YgYnVmZmVycyBpcyBoYW5k
bGVkIGF0IGRtYS1idWYgYXR0YWNoIGFuZCBkZXRhY2ggdGltZSBpbg0KPiAgICAqIGRybV9n
ZW1fbWFwX2F0dGFjaCgpIGFuZCBkcm1fZ2VtX21hcF9kZXRhY2goKS4gQmFja2luZyBzdG9y
YWdlIGl0c2VsZiBpcw0KPiAgICAqIGhhbmRsZWQgYnkgZHJtX2dlbV9tYXBfZG1hX2J1Zigp
IGFuZCBkcm1fZ2VtX3VubWFwX2RtYV9idWYoKSwgd2hpY2ggcmVsaWVzIG9uDQo+IC0gKiAm
ZHJtX2dlbV9vYmplY3RfZnVuY3MuZ2V0X3NnX3RhYmxlLg0KPiArICogJmRybV9nZW1fb2Jq
ZWN0X2Z1bmNzLmdldF9zZ190YWJsZS4gSWYgJmRybV9nZW1fb2JqZWN0X2Z1bmNzLmdldF9z
Z190YWJsZSBpcw0KPiArICogdW5pbXBsZW1lbnRlZCwgZXhwb3J0cyBpbnRvIGFub3RoZXIg
ZGV2aWNlIGFyZSByZWplY3RlZC4NCj4gICAgKg0KPiAgICAqIEZvciBrZXJuZWwtaW50ZXJu
YWwgYWNjZXNzIHRoZXJlJ3MgZHJtX2dlbV9kbWFidWZfdm1hcCgpIGFuZA0KPiAgICAqIGRy
bV9nZW1fZG1hYnVmX3Z1bm1hcCgpLiBVc2Vyc3BhY2UgbW1hcCBzdXBwb3J0IGlzIHByb3Zp
ZGVkIGJ5DQo+IEBAIC01ODMsNiArNTg0LDkgQEAgaW50IGRybV9nZW1fbWFwX2F0dGFjaChz
dHJ1Y3QgZG1hX2J1ZiAqZG1hX2J1ZiwNCj4gICB7DQo+ICAgCXN0cnVjdCBkcm1fZ2VtX29i
amVjdCAqb2JqID0gZG1hX2J1Zi0+cHJpdjsNCj4gICANCj4gKwlpZiAoIW9iai0+ZnVuY3Mt
PmdldF9zZ190YWJsZSkNCj4gKwkJcmV0dXJuIC1FT1BOT1RTVVBQOw0KDQotRU5PU1lTIHBs
ZWFzZS4NCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KPiArDQo+ICAgCXJldHVybiBkcm1f
Z2VtX3BpbihvYmopOw0KPiAgIH0NCj4gICBFWFBPUlRfU1lNQk9MKGRybV9nZW1fbWFwX2F0
dGFjaCk7DQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZl
bG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0
ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJl
cmcpDQpHZXNjaMOkZnRzZsO8aHJlcjogSXZvIFRvdGV2DQo=

--------------1CZHab7Q3r0lRrtPYM0gn7nH--

--------------ZYPV5Rpr7tmwucJHKQKfdph6
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmQAussFAwAAAAAACgkQlh/E3EQov+Cp
oBAAj/T1IjcvwGex7jk6q8TzASre9AykwN0DjxCP9EfXVs67LmxmDgTAyRbHOO/fbqsRAMy/A+IG
3dFmiawpHXTQLjckGHHEAgzo+eDTTPppyUzs6u7zSBh4cn1W2olK2O+fA7/IeRroxJRisr6rdUON
XoXMYjth68PkMnVWZGF7C+hLaursMwS3+k1EESPtvtgRrk9El/rybalqucWYtcJo0eqrOYLUl3ip
9Gq013sP4ScRbLWDwp3Q4cQ6BWhKUBQNuyHXHYinh5wc14J0QU3aCbdq/AG49bMhflC/+neobqzs
wRvV1xpoyD0W6yOyGIZmlERbaMo7+DBj2cgB1sceYZr25Jts0ulnqIjfoJscIjAwk1rp3mVEVoSI
tgCZVS4LKsYUE1QAiBWm8H9Ik15g3jFOOq7EzAz82iBRggWM0/3rIJE/JgCRRK6l5g/nJkPtgv6E
+9K902Y5zDBxYDSHQf0BQre9mnoXcBZoRWBNJ1SYPtFfiXYMJ0GxsSirQtqSKnEufn+6ioGgdice
k6146HQJK3lt3AuT2Phe75M+OLZMPOW/Jt/Ui+s5K9UCIfoQxuQHPS/Xxu4ALzgivwQF8o5BlviU
bPAsJAsRbnPjdBR+ulCnZ+wSkvZfPoWCEVTjic7mQ60sVKA/O3yvu8oC/YemQjP65I5uBKtucCrs
mf0=
=nmtm
-----END PGP SIGNATURE-----

--------------ZYPV5Rpr7tmwucJHKQKfdph6--
