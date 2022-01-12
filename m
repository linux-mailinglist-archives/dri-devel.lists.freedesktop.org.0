Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B571F48C0FA
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jan 2022 10:27:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52778113479;
	Wed, 12 Jan 2022 09:27:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D68FC113479
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jan 2022 09:27:44 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 5BAA11F3BB;
 Wed, 12 Jan 2022 09:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1641979663; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZrLvZK9ZXeADyaYLMJ4o5Gdu1Benitk72NhFCo2ypUg=;
 b=Xd/zV8Lj31oQTzkSkqrz21gInDXh4fBYoeP/X+emdWUo5axLGm02qnI7IYWKQlBtyetjIY
 X2xda8FtUrXLmYPQm98uCO/kwxeekyJEjSdbG8IDi9CwvakJ2Oac2eBzjAoCNOaEJ54ROl
 fgiqvy9vNUqDysTytVX3bV2qYRaayjI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1641979663;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZrLvZK9ZXeADyaYLMJ4o5Gdu1Benitk72NhFCo2ypUg=;
 b=jwGM9GJGngbY+bBDGT5XP+2mxndOcI70RnL7foixo0nNY+WOB2cwPMWRvOjt75G2VwMtEZ
 i5Hh+rLGlgrhWCAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 362AA13B3D;
 Wed, 12 Jan 2022 09:27:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id qHZRDA+f3mFMSgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 12 Jan 2022 09:27:43 +0000
Message-ID: <c60c33b0-6e2e-e2a2-842d-1c5882393387@suse.de>
Date: Wed, 12 Jan 2022 10:27:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH] drm/mipi-dbi: Fix source-buffer address in
 mipi_dbi_buf_copy
Content-Language: en-US
To: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie,
 daniel@ffwll.ch
References: <20220111132634.18302-1-tzimmermann@suse.de>
 <ce029d3b-6f68-b08b-9866-1ef4284a29ac@tronnes.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <ce029d3b-6f68-b08b-9866-1ef4284a29ac@tronnes.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------JZhQdvmFbY0Dhjj5s0SOiX44"
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------JZhQdvmFbY0Dhjj5s0SOiX44
Content-Type: multipart/mixed; boundary="------------rAm0na8HJg9YpgkEwigsfNi5";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie,
 daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>
Message-ID: <c60c33b0-6e2e-e2a2-842d-1c5882393387@suse.de>
Subject: Re: [PATCH] drm/mipi-dbi: Fix source-buffer address in
 mipi_dbi_buf_copy
References: <20220111132634.18302-1-tzimmermann@suse.de>
 <ce029d3b-6f68-b08b-9866-1ef4284a29ac@tronnes.org>
In-Reply-To: <ce029d3b-6f68-b08b-9866-1ef4284a29ac@tronnes.org>

--------------rAm0na8HJg9YpgkEwigsfNi5
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTEuMDEuMjIgdW0gMTQ6MzIgc2NocmllYiBOb3JhbGYgVHLDuG5uZXM6DQo+
IA0KPiANCj4gRGVuIDExLjAxLjIwMjIgMTQuMjYsIHNrcmV2IFRob21hcyBaaW1tZXJtYW5u
Og0KPj4gU2V0IHRoZSBzb3VyY2UtYnVmZmVyIGFkZHJlc3MgYWZ0ZXIgbWFwcGluZyB0aGUg
YnVmZmVyIGludG8gdGhlDQo+PiBrZXJuZWwncyBhZGRyZXNzIHNwYWNlLiBNYWtlcyBNSVBJ
IERCSSBoZWxwZXJzIHdvcmsgYWdhaW4uDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogVGhvbWFz
IFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+DQo+PiBGaXhlczogYzQ3MTYwZDhl
ZGNkICgiZHJtL21pcGktZGJpOiBSZW1vdmUgZGVwZW5kZW5jeSBvbiBHRU0gQ01BIGhlbHBl
ciBsaWJyYXJ5IikNCj4+IFJlcG9ydGVkLWJ5OiBOb3JhbGYgVHLDuG5uZXMgPG5vcmFsZkB0
cm9ubmVzLm9yZz4NCj4+IENjOiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3Vz
ZS5kZT4NCj4+IENjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPg0K
Pj4gQ2M6IE1hYXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRl
bC5jb20+DQo+PiBDYzogTWF4aW1lIFJpcGFyZCA8bXJpcGFyZEBrZXJuZWwub3JnPg0KPj4g
LS0tDQo+IA0KPiBSZXZpZXdlZC1ieTogTm9yYWxmIFRyw7hubmVzIDxub3JhbGZAdHJvbm5l
cy5vcmc+DQoNCk1lcmdlZCBpbnRvIGRybS1taXNjLW5leHQuDQoNCkJlc3QgcmVnYXJkcw0K
VGhvbWFzDQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZl
bG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0
ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJl
cmcpDQpHZXNjaMOkZnRzZsO8aHJlcjogSXZvIFRvdGV2DQo=

--------------rAm0na8HJg9YpgkEwigsfNi5--

--------------JZhQdvmFbY0Dhjj5s0SOiX44
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmHenw4FAwAAAAAACgkQlh/E3EQov+Ds
hQ//foAWSvNX/wL2dI9XiMrksB8g2ExoEYuGgnv53F2Ol30cpS65R4f2lEuJdT93VZBod3OqF5A9
bFUwkCmEKL2OYjoB/vb2gLRLrb/w082rQ/OThUlqVQA0YS8+JNA1cNKqNCThUNDJgZz6FDPlLBO/
pwbjrCx8ClzFNmjEgtnlH06ienFB6ZHAjC2R53DQxa5obqaQLMdLdBUO0t2CeEHJPbICjXdp5+90
15WTlJH+d77JBB0+1gvGptn2BHTzV1XMKZzbsFCRh24t+6tsVw7pX9AoosMRNDTFkFm9OvYSOCrN
aWls5RN55PurzkJk21iXZhdTbQ41MAj3p7adh2WPJEZkOcWnK0OiTtPVRKVjuxbT0yTS50olgETH
O3lWlDdd9+RTZxIMHl3yLkpCuM1cP9laPWsn420TX2bv0HmPKTtXcotwHQkIDok6avcT3e3OvH/K
+ATQTnpKjr/P0cHSGhunegoO7NOf4k2R2SguFN61J5A2Tni64m9aL6h19JGQ3ack7I/5m30rpwYE
KiKwa1OKdXxpXrkcs5o33uYUAIsVNtW/Q1pXKi43lOMRx3sNJvLeO+hlHtYkbYV8lTCuT1JoLBX6
E3gRJSK+4mN2f0pLTRhnvWMGSQ+YOTCv2f26B8utUt69PS5Qj/sV8Go0hYp1jv/eJF4YbAatQ0iq
Pg0=
=096v
-----END PGP SIGNATURE-----

--------------JZhQdvmFbY0Dhjj5s0SOiX44--
