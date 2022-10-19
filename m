Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1C60604BBD
	for <lists+dri-devel@lfdr.de>; Wed, 19 Oct 2022 17:38:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D276510F285;
	Wed, 19 Oct 2022 15:38:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94B7410F285
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Oct 2022 15:38:22 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 1BA8321EC9;
 Wed, 19 Oct 2022 15:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1666193901; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1sZE6elF11b3mBJKMPJl9HkFWe+zG5cRjM7uQDx/kjA=;
 b=Qq1xM/7y0D+HpaJTI5756ArF8OZQhrK/sqczI0fjY5x2apXLvSfT5JEiddRcDIqdTFRhjk
 BdEu0cjwYpa5OGDAdq8DnYfTVDOFZank8x24ZXM5PlNmyB2w0TiKmuRJxPs4H1meohvbSt
 8Dgr3J+Wk6xGL8BnqvS1G+pcJrqdcKA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1666193901;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1sZE6elF11b3mBJKMPJl9HkFWe+zG5cRjM7uQDx/kjA=;
 b=JNbkwflzcY7/PI/SiElffN0pwS6lREHinq3slCDnNh3zdyTyiH3PFVENCKFHjTf+PocwzR
 kJotUYD3NuJtcFAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DFCB313345;
 Wed, 19 Oct 2022 15:38:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id jKtFNewZUGMUVQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 19 Oct 2022 15:38:20 +0000
Message-ID: <9565c0fe-edc6-a157-5423-2007fbb69e49@suse.de>
Date: Wed, 19 Oct 2022 17:38:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH] drm/connector: Set DDC pointer in drmm_connector_init
Content-Language: en-US
To: Maxime Ripard <maxime@cerno.tech>, Daniel Vetter
 <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
References: <20221019143442.1798964-1-maxime@cerno.tech>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20221019143442.1798964-1-maxime@cerno.tech>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Pvds8NF4pca7Pn0zkK5m24bw"
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------Pvds8NF4pca7Pn0zkK5m24bw
Content-Type: multipart/mixed; boundary="------------Ot4cvxIU5SkRTy09iVgz0xEM";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Maxime Ripard <maxime@cerno.tech>, Daniel Vetter
 <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org
Message-ID: <9565c0fe-edc6-a157-5423-2007fbb69e49@suse.de>
Subject: Re: [PATCH] drm/connector: Set DDC pointer in drmm_connector_init
References: <20221019143442.1798964-1-maxime@cerno.tech>
In-Reply-To: <20221019143442.1798964-1-maxime@cerno.tech>

--------------Ot4cvxIU5SkRTy09iVgz0xEM
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQoNCkFtIDE5LjEwLjIyIHVtIDE2OjM0IHNjaHJpZWIgTWF4aW1lIFJpcGFyZDoNCj4gQ29t
bWl0IDM1YTNiODJmMWJkZCAoImRybS9jb25uZWN0b3I6IEludHJvZHVjZSBkcm1tX2Nvbm5l
Y3Rvcl9pbml0IikNCj4gaW50cm9kdWNlZCB0aGUgZnVuY3Rpb24gZHJtbV9jb25uZWN0b3Jf
aW5pdCgpIHdpdGggYSBwYXJhbWV0ZXIgZm9yIGFuDQo+IG9wdGlvbmFsIGRkYyBwb2ludGVy
IHRvIHRoZSBpMmMgY29udHJvbGxlciB1c2VkIHRvIGFjY2VzcyB0aGUgRERDIGJ1cy4NCj4g
DQo+IEhvd2V2ZXIsIHRoZSB1bmRlcmx5aW5nIGNhbGwgdG8gX19kcm1fY29ubmVjdG9yX2lu
aXQoKSB3YXMgYWx3YXlzDQo+IHNldHRpbmcgaXQgdG8gTlVMTCBpbnN0ZWFkIG9mIHBhc3Np
bmcgdGhlIGRkYyBhcmd1bWVudCBhcm91bmQuDQo+IA0KPiBUaGlzIHJlc3VsdGVkIGluIHVu
ZXhwZWN0ZWQgbnVsbCBwb2ludGVyIGRlcmVmZXJlbmNlIG9uIHBsYXRmb3Jtcw0KPiBleHBl
Y3RpbmcgdG8gZ2V0IGEgRERDIGNvbnRyb2xsZXIuDQo+IA0KPiBGaXhlczogMzVhM2I4MmYx
YmRkICgiZHJtL2Nvbm5lY3RvcjogSW50cm9kdWNlIGRybW1fY29ubmVjdG9yX2luaXQiKQ0K
PiBTaWduZWQtb2ZmLWJ5OiBNYXhpbWUgUmlwYXJkIDxtYXhpbWVAY2Vybm8udGVjaD4NCg0K
UmV2aWV3ZWQtYnk6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPg0K
DQo+IC0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9kcm1fY29ubmVjdG9yLmMgfCAyICstDQo+
ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0K
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9jb25uZWN0b3IuYyBiL2RyaXZl
cnMvZ3B1L2RybS9kcm1fY29ubmVjdG9yLmMNCj4gaW5kZXggZTMxNDJjODE0MmIzLi42MWMy
OWNlNzRiMDMgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fY29ubmVjdG9y
LmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9jb25uZWN0b3IuYw0KPiBAQCAtNDM1
LDcgKzQzNSw3IEBAIGludCBkcm1tX2Nvbm5lY3Rvcl9pbml0KHN0cnVjdCBkcm1fZGV2aWNl
ICpkZXYsDQo+ICAgCWlmIChkcm1fV0FSTl9PTihkZXYsIGZ1bmNzICYmIGZ1bmNzLT5kZXN0
cm95KSkNCj4gICAJCXJldHVybiAtRUlOVkFMOw0KPiAgIA0KPiAtCXJldCA9IF9fZHJtX2Nv
bm5lY3Rvcl9pbml0KGRldiwgY29ubmVjdG9yLCBmdW5jcywgY29ubmVjdG9yX3R5cGUsIE5V
TEwpOw0KPiArCXJldCA9IF9fZHJtX2Nvbm5lY3Rvcl9pbml0KGRldiwgY29ubmVjdG9yLCBm
dW5jcywgY29ubmVjdG9yX3R5cGUsIGRkYyk7DQo+ICAgCWlmIChyZXQpDQo+ICAgCQlyZXR1
cm4gcmV0Ow0KPiAgIA0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2
ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCk1h
eGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0KKEhSQiAzNjgwOSwgQUcg
TsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rldg0K

--------------Ot4cvxIU5SkRTy09iVgz0xEM--

--------------Pvds8NF4pca7Pn0zkK5m24bw
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmNQGewFAwAAAAAACgkQlh/E3EQov+BD
dQ/9FvZxBo6mLgVtTQKxlUi/LxF6+Oacgus5/C1ozGv+q5yCPDVFT4mUCNvM2m5TLBerhP6y/LEc
0UtIUsLN4fK/xgtRV6yEp3uFeDI0ANDe3vBI+LCxmFSc5pwTXc4399bjwEymZTk0bFfIub9E3rmp
jtu62qFyM/ZFpnLFZdM5EQd7Nto/kaWJbWI5tC8sqcZ4UaBiVvvfwU37/gYoMI9k3erE+vvQ5BYW
8kxKwc6I8PtH8nKmmjaG4D6wplbuHnqxjCH+accKN3zs8ao7l9VNCXjR7xzWOkuiQDUD3I1AFxB+
F5GE7NxP1ONlzdb4ezhpbjfBKvMLo4CbfI5Kgap+fTFYDa+AxvmX9ET2CqUvgbEBGZdB8xMHYoAN
McLcIyzFoHJYkAhtXP9wsK3JCpfmAZJnE9tOAxcsM1D5QC/y/Uv8QWo7HD+ERjsBLYE8Meoktr5y
RL8axgpwxkObNf8hLWQEG1dVufKC9bmTV9BrO4EbR1Sa7iTDDdXkl0pMffUJgSQ+f1GlHS/rVGKO
qHL/uOsc5wQzu5nbt9tuVibA2/HQq3xbjgGU9ZQhd5F5nQcZln2DHlqCrZYXAmUO4QCtaPy5l/nG
V7Hb4+sAJe54Yq4xyO4QIO/hXcpFLAiTJ+6tDuDIsOORoadP2mUTO84Ky9m+Wib8TqVCoL5qv3zi
4ek=
=pyf6
-----END PGP SIGNATURE-----

--------------Pvds8NF4pca7Pn0zkK5m24bw--
