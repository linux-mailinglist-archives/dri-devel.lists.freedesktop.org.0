Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A135B46EE7D
	for <lists+dri-devel@lfdr.de>; Thu,  9 Dec 2021 17:57:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4F3F10E347;
	Thu,  9 Dec 2021 16:53:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBD9110E117
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Dec 2021 08:11:00 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 3DC661FD2A;
 Thu,  9 Dec 2021 08:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1639037458; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hhA80F4SBwYxc5rPeZmiTk9517hUMWB4FuXx1eDegWw=;
 b=p+unAu5+76b+IbLDtBDNTBIsnywdGOK6cktRZx6BCqcFKgTng+9j8n2uX0WmdxBM8IBFZa
 MQTW1uaR748NVhSV2kT6DaN14NmVegJU67V0tpq8DjMzML1uXf0D+F7oka/RNeVCkgqyLY
 YAuk7XI4v/IRJdmBKqBeo+FZiruecmg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1639037458;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hhA80F4SBwYxc5rPeZmiTk9517hUMWB4FuXx1eDegWw=;
 b=8bA96r0YWBgWINzKgIHhGxoefwd1cydpIN28k6l6KjGIFENlAaC3nCUS9cdakBxIkY2cnc
 eICrpIp2rVp/ZSDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0818713CA9;
 Thu,  9 Dec 2021 08:10:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id T7TgABK6sWF5QgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 09 Dec 2021 08:10:58 +0000
Message-ID: <339e74fb-0270-20f4-37af-31c25c03586d@suse.de>
Date: Thu, 9 Dec 2021 09:10:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH] drm/ingenic: fix error code in
 ingenic_drm_gem_create_object()
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@oracle.com>,
 Paul Cercueil <paul@crapouillou.net>
References: <20211118111522.GD1147@kili>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20211118111522.GD1147@kili>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------GWt8OvBYWoCzUnv8z5rePWn9"
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 kernel-janitors@vger.kernel.org, linux-mips@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------GWt8OvBYWoCzUnv8z5rePWn9
Content-Type: multipart/mixed; boundary="------------1ZdJCGDDgzX2xxi5I0Ot5pSb";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dan Carpenter <dan.carpenter@oracle.com>,
 Paul Cercueil <paul@crapouillou.net>
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 linux-mips@vger.kernel.org, dri-devel@lists.freedesktop.org,
 kernel-janitors@vger.kernel.org
Message-ID: <339e74fb-0270-20f4-37af-31c25c03586d@suse.de>
Subject: Re: [PATCH] drm/ingenic: fix error code in
 ingenic_drm_gem_create_object()
References: <20211118111522.GD1147@kili>
In-Reply-To: <20211118111522.GD1147@kili>

--------------1ZdJCGDDgzX2xxi5I0Ot5pSb
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

RllJIHRoaXMgaXNzdWUgd2FzIGZpeGVkIGJ5IFsxXS4gUGxlYXNlIGRvbid0IG1lcmdlLg0K
DQpbMV0gDQpodHRwczovL2xvcmUua2VybmVsLm9yZy9kcmktZGV2ZWwvMjAyMTExMzAwOTUy
NTUuMjY3MTAtMS10emltbWVybWFubkBzdXNlLmRlLw0KDQpBbSAxOC4xMS4yMSB1bSAxMjox
NSBzY2hyaWViIERhbiBDYXJwZW50ZXI6DQo+IFRoZSAtPmdlbV9jcmVhdGVfb2JqZWN0KCkg
ZnVuY3Rpb24gcG9pbnRlcnMgYXJlIHN1cHBvc2VkIHRvIHJldHVybiBOVUxMDQo+IG9uIGVy
cm9yLiAgVGhpcyBmdW5jdGlvbiByZXR1cm5zIGFuIGVycm9yIHBvaW50ZXIgYnV0IG5vbmUg
b2YgdGhlDQo+IGNhbGxlcnMgZXhwZWN0IHRoYXQgc28gaXQgd2lsbCBsZWFkIHRvIGFuIE9v
cHMuICBTZWUgZHJtX2dlbV92cmFtX2NyZWF0ZSgpDQo+IGZvciBleGFtcGxlIG9mIGl0IGNo
ZWNrcyBmb3IgTlVMTCBidXQgYW4gZXJyb3IgcG9pbnRlciB3b3VsZCBsZWFkIHRvIGENCj4g
Y3Jhc2guDQo+IA0KPiBGaXhlczogNGE3OTFjYjZkMzRmICgiZHJtL2luZ2VuaWM6IEFkZCBv
cHRpb24gdG8gYWxsb2MgY2FjaGVkIEdFTSBidWZmZXJzIikNCj4gU2lnbmVkLW9mZi1ieTog
RGFuIENhcnBlbnRlciA8ZGFuLmNhcnBlbnRlckBvcmFjbGUuY29tPg0KPiAtLS0NCj4gICBk
cml2ZXJzL2dwdS9kcm0vaW5nZW5pYy9pbmdlbmljLWRybS1kcnYuYyB8IDIgKy0NCj4gICAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCj4gDQo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaW5nZW5pYy9pbmdlbmljLWRybS1kcnYuYyBi
L2RyaXZlcnMvZ3B1L2RybS9pbmdlbmljL2luZ2VuaWMtZHJtLWRydi5jDQo+IGluZGV4IGE1
ZGYxYzhkMzRjZC4uZWI3MjY2YTBiMDM3IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vaW5nZW5pYy9pbmdlbmljLWRybS1kcnYuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
aW5nZW5pYy9pbmdlbmljLWRybS1kcnYuYw0KPiBAQCAtNzU3LDcgKzc1Nyw3IEBAIGluZ2Vu
aWNfZHJtX2dlbV9jcmVhdGVfb2JqZWN0KHN0cnVjdCBkcm1fZGV2aWNlICpkcm0sIHNpemVf
dCBzaXplKQ0KPiAgIA0KPiAgIAlvYmogPSBremFsbG9jKHNpemVvZigqb2JqKSwgR0ZQX0tF
Uk5FTCk7DQo+ICAgCWlmICghb2JqKQ0KPiAtCQlyZXR1cm4gRVJSX1BUUigtRU5PTUVNKTsN
Cj4gKwkJcmV0dXJuIE5VTEw7DQo+ICAgDQo+ICAgCW9iai0+bWFwX25vbmNvaGVyZW50ID0g
cHJpdi0+c29jX2luZm8tPm1hcF9ub25jb2hlcmVudDsNCj4gICANCj4gDQoNCi0tIA0KVGhv
bWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdh
cmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5i
ZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8
aHJlcjogSXZvIFRvdGV2DQo=

--------------1ZdJCGDDgzX2xxi5I0Ot5pSb--

--------------GWt8OvBYWoCzUnv8z5rePWn9
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmGxuhEFAwAAAAAACgkQlh/E3EQov+DF
XA/9GjPqYNaLL9g9pcvU1z9VfPodGlzbYHaZ6T9GTjO9ELA9XfXKomblRUqxjvm6LU6J1cgDb0tC
ZrPooUCsqIywLgKpKyXkNa/PqnDppENUbTXo6+KSmCzNJ0c5cc5ymz0zueof0vA6yTTngqqz4jGp
esfIXn1vgG+s/3ylKqH45sSxTQr2+sn59SFq+xnQH70T3IUTVc2zDYll4uvNWTF0HETwewEUSueS
Q46yXMTJ6diAb3gBi2rWivWEApopFlmqglx+6wGeiQaccchuSkX6fLDh+hOBlZ0rVRp2PABT9bK0
ofT0BTmCCUSS/frJGXdsDPdbP0yP0Ji3sGa+ATsgnTXvcTyvdqgp7wOF/h/JoFnTNJfKWY+/ajqh
YiIBoUAasCE7P9nlX4oqARmEZa1JkIZu6c8anSMCe5R6N2K7oYxfjpLpN9SExTXVAxIs3Jlfswvm
lQrFeYm29IhYdFkouUyDPaNgEPs8sTT8DmYJhpseTjTUg+O6dQowrKrzEEIZtds3UaBkTxsc6H1H
1Ske4jsHqg80Q1Gk2nDGMJbExmOKs77MZ5u/R1FabXyh5CcLUXh/90hsotUIb6pJQ8goLecCXJRc
/2VkzhJ7Kil/o4RMCdW8+eb9oCLCRE7Nh0tL0xeX9+nIcDYlRQ0ItSj7359wWQVq45PnhDkW+ONf
skM=
=vNOz
-----END PGP SIGNATURE-----

--------------GWt8OvBYWoCzUnv8z5rePWn9--
