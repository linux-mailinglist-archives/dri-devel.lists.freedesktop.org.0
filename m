Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFD924ABEC7
	for <lists+dri-devel@lfdr.de>; Mon,  7 Feb 2022 14:05:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97E7310E418;
	Mon,  7 Feb 2022 13:05:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1530310E418
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Feb 2022 13:05:01 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id AE85C210F8;
 Mon,  7 Feb 2022 13:04:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1644239099; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=snsPHaEp62/qcXkBjXMG0Vn6mRFzJuHmwkUadRGYGbs=;
 b=kpMGDyz7bLlvFo731pUFBj8C5CGwPdy86/SmgMXOJRdJaY8aPCNskLeJGZvLjdumDGgfVX
 jcdPDa439FgJEu01xzII4b5fGEAAVUnMuV1x+2oeGw7wSIZHSoFhInspcQThX0F/1aUi9C
 sfHFt+O3fvimLiKcw0x30Zk0Yv6TqyQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1644239099;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=snsPHaEp62/qcXkBjXMG0Vn6mRFzJuHmwkUadRGYGbs=;
 b=G40aIIDyKBkwY9pErJbURs3tB3B0SDJKG9DYrrHM9HU3fu8HX3Je43BB2wL/5uXfqFdiKQ
 5dvUZXU0iXVeVxAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7252413C00;
 Mon,  7 Feb 2022 13:04:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id heKRGvsYAWIpFgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 07 Feb 2022 13:04:59 +0000
Message-ID: <dbebd05d-771d-ffc3-cfba-007b258a245a@suse.de>
Date: Mon, 7 Feb 2022 14:04:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 6/8] drm/ast: Initialize encoder and connector for VGA in
 helper function
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>, airlied@redhat.com,
 airlied@linux.ie, daniel@ffwll.ch, sam@ravnborg.org,
 kuohsiang_chou@aspeedtech.com
References: <20220111120058.10510-1-tzimmermann@suse.de>
 <20220111120058.10510-7-tzimmermann@suse.de>
 <152111de-54d6-1574-ba7d-5f95fe9c97a6@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <152111de-54d6-1574-ba7d-5f95fe9c97a6@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------lSAMLfSZWZUyGR3rRmOmGxT3"
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
Cc: jenmin_yuan@aspeedtech.com, tommy_huang@aspeedtech.com,
 dri-devel@lists.freedesktop.org, arc_sung@aspeedtech.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------lSAMLfSZWZUyGR3rRmOmGxT3
Content-Type: multipart/mixed; boundary="------------0CeuNrMdkNGAMVc9DM09TBlU";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>, airlied@redhat.com,
 airlied@linux.ie, daniel@ffwll.ch, sam@ravnborg.org,
 kuohsiang_chou@aspeedtech.com
Cc: jenmin_yuan@aspeedtech.com, dri-devel@lists.freedesktop.org,
 tommy_huang@aspeedtech.com, arc_sung@aspeedtech.com
Message-ID: <dbebd05d-771d-ffc3-cfba-007b258a245a@suse.de>
Subject: Re: [PATCH 6/8] drm/ast: Initialize encoder and connector for VGA in
 helper function
References: <20220111120058.10510-1-tzimmermann@suse.de>
 <20220111120058.10510-7-tzimmermann@suse.de>
 <152111de-54d6-1574-ba7d-5f95fe9c97a6@redhat.com>
In-Reply-To: <152111de-54d6-1574-ba7d-5f95fe9c97a6@redhat.com>

--------------0CeuNrMdkNGAMVc9DM09TBlU
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDMuMDIuMjIgdW0gMTg6NDMgc2NocmllYiBKYXZpZXIgTWFydGluZXogQ2Fu
aWxsYXM6DQo+IE9uIDEvMTEvMjIgMTM6MDAsIFRob21hcyBaaW1tZXJtYW5uIHdyb3RlOg0K
Pj4gTW92ZSBlbmNvZGVyIGFuZCBjb25uZWN0b3IgaW5pdGlhbGl6YXRpb24gaW50byBhIHNp
bmdsZSBoZWxwZXIgYW5kDQo+PiBwdXQgYWxsIHJlbGF0ZWQgbW9kZS1zZXR0aW5nIHN0cnVj
dHVyZXMgaW50byBhIHNpbmdsZSBwbGFjZS4gRG9uZSBpbg0KPj4gcHJlcGFyYXRpb24gb2Yg
bW92aW5nIHRyYW5zbWl0dGVyIGNvZGUgaW50byBzZXBhcmF0ZSBoZWxwZXJzLiBObw0KPj4g
ZnVuY3Rpb25hbCBjaGFuZ2VzLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBaaW1t
ZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPg0KPiANCj4gUmV2aWV3ZWQtYnk6IEphdmll
ciBNYXJ0aW5leiBDYW5pbGxhcyA8amF2aWVybUByZWRoYXQuY29tPg0KPiANCj4gW3NuaXBd
DQo+IA0KPj4gLQllbmNvZGVyLT5wb3NzaWJsZV9jcnRjcyA9IDE7DQo+IA0KPiBbc25pcF0N
Cj4gDQo+PiArCWVuY29kZXItPnBvc3NpYmxlX2NydGNzID0gZHJtX2NydGNfbWFzayhjcnRj
KTsNCj4gDQo+IFRoaXMgaXMgYSBzb21ld2hhdCB1bnJlbGF0ZWQgY2hhbmdlLiBJdCdzIE9L
IGJlY2F1c2UgaXMgZmFpcmx5IHNpbXBsZQ0KPiBidXQgSSB3b3VsZCBwcm9iYWJseSBzdGls
bCBkbyB0aGUgY2xlYW51cHMgYXMgc2VwYXJhdGUgcGF0Y2hlcy4NCg0KSSdsbCBwdXQgdGhp
cyBjaGFuZ2UgaW50byBhIHNlcGFyYXRlIHBhdGNoLg0KDQpCZXN0IHJlZ2FyZHMNClRob21h
cw0KDQo+IA0KPiBCZXN0IHJlZ2FyZHMsDQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdy
YXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1h
bnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55DQooSFJC
IDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8aHJlcjogSXZvIFRvdGV2DQo=


--------------0CeuNrMdkNGAMVc9DM09TBlU--

--------------lSAMLfSZWZUyGR3rRmOmGxT3
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmIBGPoFAwAAAAAACgkQlh/E3EQov+BD
UBAAkPbFqi1i+/asnmvl93XVaHA94pF8LujvUe+9Pn1SPSK2UZHGmBSk+stCzZgfywcu/R1jdE8D
g5msDqDpenqFB1x0sm272Ml9nGzYvaULJFGJelBjYB5oCW/0o555CTd1652QMp79zbXLjPUr8Jir
fWlX8IW+9WWGCazr3e7BgBxqUscxJDgTEt4irNQHSbB9VNKfFs+Iqw2RvP0BveVozb6hbK8CwfGP
ET7oV1DEByTW4sw7lJ2eVCWY8xC2QG6L3XE2omjnHjA1DQzD6PwYFIwSCogz8xuKilsUkOUZD5Ir
FqCh6IJkwXdbWjcrNEule/cbCamGdVbpBId47i5hcXIxURs4D5l2IPfqd85lxkruNWyXYaCDaxzq
/g+1odNRyl2JADDXv1DBvGFP083UjOJcD/s9AAsOqu+F/+wbwg5uYiw234Zanox/waOTS7VRAvfl
lCgR2Zq0fdlXHSgkd3f38OwbIlfy2x7ENBsPYZCZIA8qLegVgjoB0lENV/X37H27XxtAwToRxc36
UJUBRyA08dLUdQnYNBnlBq+BUuTJhSbIkRlug3r4ZQ0EHFjw8/JXOCAETmzMDorlOnv0Ciggo1D9
sV4bbyzoZdQ1V77GUIPYaFFq9lGD97dET2kyzLKaT0UuvTYGVaHqZI6eAYz5gJUIzaRVoTLtANI0
H4w=
=r7mC
-----END PGP SIGNATURE-----

--------------lSAMLfSZWZUyGR3rRmOmGxT3--
