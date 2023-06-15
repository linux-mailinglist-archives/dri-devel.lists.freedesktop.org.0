Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6B2973127C
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jun 2023 10:42:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B986510E189;
	Thu, 15 Jun 2023 08:42:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22CC210E189
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jun 2023 08:42:32 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 98EDF223E4
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jun 2023 08:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1686818548; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type;
 bh=efHycJ/lD5LV2Ywylv717gl2FrqBAM8c5/H54Hwx6Tk=;
 b=IUVrVZ+sRZx5Mh5pQhQZhRv+T/jTcS6BxS6GvSevtJapu2vJ5V0dk7/4hAUoyKl1q12urT
 L0zvWTbiAlUV0/dekG6PwGYfHx5xZf1+wPvDs8IGOqkZtQl6qpq5kGYygXbQQD8zv876Ih
 4E0THxdJs365075MREeCB002ydstFuI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1686818548;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type;
 bh=efHycJ/lD5LV2Ywylv717gl2FrqBAM8c5/H54Hwx6Tk=;
 b=y0SL0t6+xczP0b1cKIdqfzRxD4XIY3zrBwL9p6JIBoyKlq2nJ515V7OHW7NeRvnSN7YxBd
 iUEebOBxxQWGdOBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8AF3213467
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jun 2023 08:42:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id oYz6IPTOimSpOQAAMHmgww
 (envelope-from <tzimmermann@suse.de>)
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jun 2023 08:42:28 +0000
Message-ID: <a56550ff-326c-00da-ac0b-29d2327fcf7b@suse.de>
Date: Thu, 15 Jun 2023 10:42:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
From: Thomas Zimmermann <tzimmermann@suse.de>
Subject: PSA: drm-misc-next-fixes is open
To: dri-devel <dri-devel@lists.freedesktop.org>
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------kMV0gMVrJm7gjMHB5gPbEwgl"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------kMV0gMVrJm7gjMHB5gPbEwgl
Content-Type: multipart/mixed; boundary="------------kQX5F4ULPNm7rMDqfgkf4THy";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: dri-devel <dri-devel@lists.freedesktop.org>
Message-ID: <a56550ff-326c-00da-ac0b-29d2327fcf7b@suse.de>
Subject: PSA: drm-misc-next-fixes is open

--------------kQX5F4ULPNm7rMDqfgkf4THy
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGksDQoNCi1yYzYgaGFzIGJlZW4gdGFnZ2VkIGZvciBhIGZldyBkYXlzLiBUaGlzIG1lYW5z
IHRoYXQgZHJtLW1pc2MtbmV4dC1maXhlcyANCmlzIG5vdyBvcGVuIGZvciBidWcgZml4ZXMs
IGFzIGRybS1uZXh0IGlzIGluIGZlYXR1cmUgZnJlZXplIHVudGlsIHRoZSANCm5leHQgLXJj
MSBjb21lcyBvdXQuDQoNClNvbWUgcnVsZXMgb2YgdGh1bWIgb24gd2hlcmUgdG8gbGFuZCB5
b3VyIHBhdGNoOg0KDQogICAgICogaWYgeW91ciBwYXRjaCBmaXhlcyBhIGJ1ZyBpbiB1cHN0
cmVhbSwgcGxlYXNlIHB1dCBpdCBpbnRvIA0KZHJtLW1pc2MtZml4ZXMsDQoNCiAgICAgKiBp
ZiB5b3VyIHBhdGNoIGZpeGVzIGEgYnVnIGluIGRybS1uZXh0LCBwbGVhc2UgcHV0IGl0IGlu
dG8gDQpkcm0tbWlzYy1uZXh0LWZpeGVzLA0KDQogICAgICogYW55dGhpbmcgZWxzZSwgZXNw
ZWNpYWxseSBuZXcgZmVhdHVyZXMsIHNob3VsZCBnbyBpbnRvIGRybS1taXNjLW5leHQuDQoN
ClRoZSBmbG93IGNoYXJ0IGlzIGF0IFsxXS4NCg0KVGhlIHRyYW5zaXRpb24gZnJvbS90byBk
cm0tbWlzYy1maXhlcy1uZXh0IHNvbWV0aW1lcyByZXN1bHRzIGluIHBhdGNoZXMgDQp0aGF0
IGFyZSBhcHBsaWVkIHRvIHRoZSB3cm9uZyB0cmVlIGFuZCBnZXQgc3R1Y2sgdGhlcmUgZm9y
IGEgbG9uZyB0aW1lLiANCklmIHlvdSBoYXZlIGZpeGVzIGluIGRybS1taXNjLW5leHQgdGhh
dCBtdXN0IGdvIGludG8gZHJtLW5leHQgc29vbiwgDQpwbGVhc2UgY2hlcnJ5LXBpY2sgdGhl
bSBpbnRvIGRybS1taXNjLW5leHQtZml4ZXMuIFdlIGhhdmUNCg0KICAgICBkaW0gY2hlcnJ5
LXBpY2sNCg0KdG8gaGVscCB5b3Ugd2l0aCB0aGF0Lg0KDQpCZXN0IHJlZ2FyZHMNClRob21h
cw0KDQpbMV0gDQpodHRwczovL2RybS5wYWdlcy5mcmVlZGVza3RvcC5vcmcvbWFpbnRhaW5l
ci10b29scy9jb21taXR0ZXItZHJtLW1pc2MuaHRtbCN3aGVyZS1kby1pLWFwcGx5LW15LXBh
dGNoDQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9w
ZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4g
NSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcp
DQpHZXNjaMOkZnRzZsO8aHJlcjogSXZvIFRvdGV2DQo=

--------------kQX5F4ULPNm7rMDqfgkf4THy--

--------------kMV0gMVrJm7gjMHB5gPbEwgl
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmSKzvMFAwAAAAAACgkQlh/E3EQov+Bg
9RAAuxs9dGXd698fskpQXwZav5nX6DUVOBkJbQx/WZSk9e+juG3KRllZOd0b/R0y9KXIaYYo5pks
4xSgCHPfyCAgOrWxZdeeftepgbWvwMTH5o4UtFb1YrLLkL93RE54EY9CeAHe07nLJ4XmUiiHvBlR
Y60HmMgUldZ8pip0KNg81M6jlbF8XHYBvzP99FTErjTGrEy1Hd069mZGFT/2ej2ZDnk0S+3Xod0p
28AYw2vh8PCQ7Eg9zALdovi73jwfO8nnST5y0kJIEhnsNlTXNwTksgw+oMU3WAqKTAThKSYDUgMo
HGtdMoC637aE9rJGozCmlVvvAQtvzT6phspIhD/nuEwA02bj/LMgpdj1nJwttfFvggk8Y2cpNgsG
7/Efn8qAuvlnkMcxXRKj1waFlChTb0gZ12tzRVIxSCRrO409f+8uNGeC29/YO0vIGnGynVDTvKQA
Qtkv0RHmYHT8vxbBle3F5IdiKhdI/DGFQRptBjU9mb91XWnRcW0V1x8p7XR95gL/Rca/hZihgUWp
9EXQnGMFxJpNfSmMwExPT6jOufXRO1xXXBbS8U1aGZsD1qWMb/sE8RIuK8SobDLeoYoDQoZjNXFV
PcT94MOZIy1V64ZZIgcE3zC4FFeUEOTaLE+10V72tHvCpcW6lbBa99WUDvmJe44gDDjnQp9nIxgX
pGo=
=voPC
-----END PGP SIGNATURE-----

--------------kMV0gMVrJm7gjMHB5gPbEwgl--
