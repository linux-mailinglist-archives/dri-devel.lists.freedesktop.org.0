Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1357D751CE3
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 11:12:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63BAD10E656;
	Thu, 13 Jul 2023 09:12:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4171410E656
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 09:12:03 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 8CB9222197;
 Thu, 13 Jul 2023 09:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1689239521; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5SK1tU3mCtUYl10PBvtjxuUsf1N7qJiCckUu9OZ5iiQ=;
 b=BegtPhRulh5dJ/VKWmAc0B6jgmfjetyN3GhSEMqDbl3s3vjvusLEb+N0rgN2SOGS3aH9Of
 6K6ydey8Xks80hCOcVU2jdgbTHg9k/7vvJFL/tOZ3Rd/tBNcqX7THgxjeVBnQoDJdGkxLw
 uNzzmsR5Dkx3A0IDOoxHHfTcVx6WxAU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1689239521;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5SK1tU3mCtUYl10PBvtjxuUsf1N7qJiCckUu9OZ5iiQ=;
 b=mLmGCTOALY3PNfR9s+BRn7sUK1okv1bHu+hAfP49qOrBpJ3/nU/uILLZvLaOHOkO2za4Pt
 pPp62IQvdavixcBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6082E13489;
 Thu, 13 Jul 2023 09:12:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 4JK0FuG/r2TCRAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 13 Jul 2023 09:12:01 +0000
Message-ID: <7f1ccdf6-dadf-c25f-a972-f3c8add488f9@suse.de>
Date: Thu, 13 Jul 2023 11:12:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v5 2/2] drm/ast: report connection status on Display Port.
Content-Language: en-US
To: Jammy Huang <jammy_huang@aspeedtech.com>,
 Jocelyn Falempe <jfalempe@redhat.com>, airlied@redhat.com,
 kuohsiang_chou@aspeedtech.com, jani.nikula@linux.intel.com,
 dianders@chromium.org
References: <20230713064037.315387-1-jfalempe@redhat.com>
 <20230713064037.315387-2-jfalempe@redhat.com>
 <f61ea042-a14c-9c8f-710d-0ba0820686fe@aspeedtech.com>
 <a6eb098a-8ac6-7240-dddc-ba645a1931fc@redhat.com>
 <2b1c2a6c-c912-d24f-b622-7a3f1cec89aa@aspeedtech.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <2b1c2a6c-c912-d24f-b622-7a3f1cec89aa@aspeedtech.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------pi2T8ZYQnS4BAUswZ3DwkzYn"
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
--------------pi2T8ZYQnS4BAUswZ3DwkzYn
Content-Type: multipart/mixed; boundary="------------0w9N6jEmDYFGbQT3G3y2zNG4";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Jammy Huang <jammy_huang@aspeedtech.com>,
 Jocelyn Falempe <jfalempe@redhat.com>, airlied@redhat.com,
 kuohsiang_chou@aspeedtech.com, jani.nikula@linux.intel.com,
 dianders@chromium.org
Cc: dri-devel@lists.freedesktop.org
Message-ID: <7f1ccdf6-dadf-c25f-a972-f3c8add488f9@suse.de>
Subject: Re: [PATCH v5 2/2] drm/ast: report connection status on Display Port.
References: <20230713064037.315387-1-jfalempe@redhat.com>
 <20230713064037.315387-2-jfalempe@redhat.com>
 <f61ea042-a14c-9c8f-710d-0ba0820686fe@aspeedtech.com>
 <a6eb098a-8ac6-7240-dddc-ba645a1931fc@redhat.com>
 <2b1c2a6c-c912-d24f-b622-7a3f1cec89aa@aspeedtech.com>
In-Reply-To: <2b1c2a6c-c912-d24f-b622-7a3f1cec89aa@aspeedtech.com>

--------------0w9N6jEmDYFGbQT3G3y2zNG4
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTMuMDcuMjMgdW0gMTE6MDUgc2NocmllYiBKYW1teSBIdWFuZzoNClsuLi5d
DQo+Pg0KPj4NCj4+IEZvciB0aGUgQk1DIGNvbm5lY3RvciBwYXRjaCwgeW91IGtub3cgaWYg
dGhlcmUgaXMgYSByZWdpc3RlciBzZXR0aW5nIEkgDQo+PiBjYW4gY2hlY2sgdG8gc2VlIGlm
IGEgQk1DIGlzIHByZXNlbnQgb3Igbm90ID8NCj4gDQo+IEkgdGhpbmsgeW91IGNhbiB1c2Ug
VkdBIENSRDBbN10gd2hvc2UgZGVmaW5pdGlvbiBpcyBhcyBiZWxvdzoNCj4gDQo+IERSQU0g
SW5pdGlhbCBTZWxlY3Rpb24gKHNlZSBub3RlIDEpDQo+IDA6IFZCSU9TIEluaXRpYWwgdGhl
IERSQU0NCj4gMTogU09DIEZpcm13YXJlIEluaXRpYWwgdGhlIERSQU0NCj4gDQo+IElmIENS
RDBbN10gaXMgMSwgdGhlcmUgaXMgQk1DLg0KDQpUaGFuayB5b3UuIFRoYXQgc2VlbXMgdmVy
eSBoZWxwZnVsLg0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQo+IA0KPj4NCj4+IEJlc3Qg
cmVnYXJkcywNCj4+DQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZl
ciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KRnJh
bmtlbnN0cmFzc2UgMTQ2LCA5MDQ2MSBOdWVybmJlcmcsIEdlcm1hbnkNCkdGOiBJdm8gVG90
ZXYsIEFuZHJldyBNeWVycywgQW5kcmV3IE1jRG9uYWxkLCBCb3VkaWVuIE1vZXJtYW4NCkhS
QiAzNjgwOSAoQUcgTnVlcm5iZXJnKQ0K

--------------0w9N6jEmDYFGbQT3G3y2zNG4--

--------------pi2T8ZYQnS4BAUswZ3DwkzYn
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmSvv+AFAwAAAAAACgkQlh/E3EQov+BE
lg//WRI8Hf2tqjYe0aCviFGODuPq1zG718tyTESOyh7VNYFYRDTtC0FJ8UiadO9EY1bX4VlwwO6q
LPH3QL//De4a1wK9BhF8VBlnn83P1OZkSZ/qRVdv8tSxy0P2YRCB9p5hd775cE3R+6wX4jXr1eWA
D4fDchGLAiT66YqLFQn9LUvuFBie+UEIKKfjwUfckVhpfQZwIgsw9p45zZsnNZgSmaiiH+5OYukZ
Rto+mm+g+6qDlS/gX3kReOf+SSekV0UaxG7Pmr0kFDiEhRL7xypqMQtpeNfeBKWauHCfacZiaeOa
FmgGHuJZNVe2PaIfZorCdIXh/EayH0h9G7dxI1IGT+gFt88YO+UOdSlcTZ9tu7bjY6XMZboX59AN
zIl4Y65r6mlm7SMWORGtoocQRCiTuoNsRLHK8XO0SuuFsPHr2c4GVNKsmiyOmm2OJ4e88BoIiOYF
5WESDZStEKjcN+MzFMvqGPkqWXu8EPQ0eyrClOCBriDAziTZvjXZdxr3C+gfq3GOcFWVBFr/dFtU
o3+j/LEQcW5jYhpMfyou54LJRF3an/+DySNPxs/3U7Qi1Hn7zJGV2IfZpXXX2VEr4GD7RNdED5k1
KfSWbAmfQ2etWs5OxKzshh2yG9M2GjixQaKFnPW9VoT9RSG8DgoO7PKnPu5RVbfe+9WiJZeX95Al
kZE=
=D8w1
-----END PGP SIGNATURE-----

--------------pi2T8ZYQnS4BAUswZ3DwkzYn--
