Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69D0E514527
	for <lists+dri-devel@lfdr.de>; Fri, 29 Apr 2022 11:14:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7379510FB9B;
	Fri, 29 Apr 2022 09:14:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32E5A10FB9B
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Apr 2022 09:14:11 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D4B081F891;
 Fri, 29 Apr 2022 09:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1651223649; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+nyhT3dLkkFuRwQR16FxYEjv/si9LeGS52nxdq1BTSI=;
 b=De5hpi7h1Swr/YmFIUYHtH7KHtiwsBPvG4yMaNcc4ez54xqjBQ86oLjx9fKkJalMjjn6M0
 3hP7Dh6h/AaLpVQAmM37Xg9Xl5IbR55seLPaddUGgbTeyXKT/vOMA2jq7dZc/PCucPxhfE
 VV+64MeqN7P68jD3SNctdHt/rjHpN94=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1651223649;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+nyhT3dLkkFuRwQR16FxYEjv/si9LeGS52nxdq1BTSI=;
 b=7h00ud4S5BsLuRyeRdwlMfa/15AkmnLlC/ft7SgFEZaXNj5HN0Tw4mp3oTZCx8u6t73/eF
 k3GAsOATHG9ZkJDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AE40913446;
 Fri, 29 Apr 2022 09:14:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id OROKKWGsa2IDewAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 29 Apr 2022 09:14:09 +0000
Message-ID: <7ce2f8e1-9cf2-4d89-99c2-b4280e4758ba@suse.de>
Date: Fri, 29 Apr 2022 11:14:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [RFC PATCH v4 02/11] drm/fb-helper: Set FBINFO_MISC_FIRMWARE flag
 for DRIVER_FIRMWARE fb
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org
References: <20220429084253.1085911-1-javierm@redhat.com>
 <20220429084253.1085911-3-javierm@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220429084253.1085911-3-javierm@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------2UW6C8bX1bdqZGPtnDh7XxPw"
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------2UW6C8bX1bdqZGPtnDh7XxPw
Content-Type: multipart/mixed; boundary="------------PX7QTzUWG0KO3ZVC40N5d82M";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Message-ID: <7ce2f8e1-9cf2-4d89-99c2-b4280e4758ba@suse.de>
Subject: Re: [RFC PATCH v4 02/11] drm/fb-helper: Set FBINFO_MISC_FIRMWARE flag
 for DRIVER_FIRMWARE fb
References: <20220429084253.1085911-1-javierm@redhat.com>
 <20220429084253.1085911-3-javierm@redhat.com>
In-Reply-To: <20220429084253.1085911-3-javierm@redhat.com>

--------------PX7QTzUWG0KO3ZVC40N5d82M
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjkuMDQuMjIgdW0gMTA6NDIgc2NocmllYiBKYXZpZXIgTWFydGluZXogQ2Fu
aWxsYXM6DQo+IFRoZSBEUklWRVJfRklSTVdBUkUgZmxhZyBkZW5vdGVzIHRoYXQgYSBEUk0g
ZHJpdmVyIHVzZXMgYSBmcmFtZWJ1ZmZlcg0KPiB0aGF0IHdhcyBpbml0aWFsaXplZCBhbmQg
cHJvdmlkZWQgYnkgdGhlIHN5c3RlbSBmaXJtd2FyZSBmb3Igc2Nhbm91dC4NCj4gDQo+IElu
ZGljYXRlIHRvIHRoZSBmYmRldiBzdWJzeXN0ZW0gdGhhdCB0aGUgcmVnaXN0ZXJlZCBmcmFt
ZWJ1ZmZlciBpcyBhDQo+IEZCSU5GT19NSVNDX0ZJUk1XQVJFLCBzbyB0aGF0IGl0IGNhbiBo
YW5kbGUgYWNjb3JkaW5nbHkuIEZvciBleGFtcGxlLA0KPiB3b2xkIGhvdC11bnBsdWcgdGhl
IGFzc29jaWF0ZWQgZGV2aWNlIGlmIGFza2VkIHRvIHJlbW92ZSBjb25mbGljdGluZw0KPiBm
cmFtZWJ1ZmZlcnMuDQo+IA0KPiBTdWdnZXN0ZWQtYnk6IFRob21hcyBaaW1tZXJtYW5uIDx0
emltbWVybWFubkBzdXNlLmRlPg0KPiBTaWduZWQtb2ZmLWJ5OiBKYXZpZXIgTWFydGluZXog
Q2FuaWxsYXMgPGphdmllcm1AcmVkaGF0LmNvbT4NCj4gLS0tDQo+IA0KPiAobm8gY2hhbmdl
cyBzaW5jZSB2MSkNCj4gDQo+ICAgZHJpdmVycy9ncHUvZHJtL2RybV9mYl9oZWxwZXIuYyB8
IDQgKysrKw0KPiAgIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykNCj4gDQo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2ZiX2hlbHBlci5jIGIvZHJpdmVycy9n
cHUvZHJtL2RybV9mYl9oZWxwZXIuYw0KPiBpbmRleCBkMjY1YTczMzEzYzkuLjc2ZGQxMTg4
ODYyMSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9mYl9oZWxwZXIuYw0K
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2ZiX2hlbHBlci5jDQo+IEBAIC0xODkxLDYg
KzE4OTEsMTAgQEAgX19kcm1fZmJfaGVscGVyX2luaXRpYWxfY29uZmlnX2FuZF91bmxvY2so
c3RydWN0IGRybV9mYl9oZWxwZXIgKmZiX2hlbHBlciwNCj4gICAJCS8qIGRvbid0IGxlYWsg
YW55IHBoeXNpY2FsIGFkZHJlc3NlcyB0byB1c2Vyc3BhY2UgKi8NCj4gICAJCWluZm8tPmZs
YWdzIHw9IEZCSU5GT19ISURFX1NNRU1fU1RBUlQ7DQo+ICAgDQo+ICsJLyogSW5kaWNhdGUg
dGhhdCB0aGUgZnJhbWVidWZmZXIgaXMgcHJvdmlkZWQgYnkgdGhlIGZpcm13YXJlICovDQo+
ICsJaWYgKGRybV9jb3JlX2NoZWNrX2ZlYXR1cmUoZGV2LCBEUklWRVJfRklSTVdBUkUpKQ0K
PiArCQlpbmZvLT5mbGFncyB8PSBGQklORk9fTUlTQ19GSVJNV0FSRTsNCj4gKw0KDQpQYXRj
aGVzIDEgdG8gMyBzaG91bGQgYmUgc3F1YXNoZWQgaW50byBvbmUgYmVmb3JlIGxhbmRpbmcu
DQoNCldlIGNhbiBkbyB0aGlzIHdpdGggRFJJVkVSX0ZJUk1XQVJFLiBBbHRlcm5hdGl2ZWx5
LCBJJ2Qgc3VnZ2VzdCB0byB3ZSANCmNvdWxkIGFsc28gdXNlZCB0aGUgZXhpc3RpbmcgZmlu
YWwgcGFyYW1ldGVyIG9mIA0KZHJtX2ZiZGV2X2dlbmVyaWNfc2V0dXAoKSB0byBwYXNzIGEg
ZmxhZyB0aGF0IGRlc2lnbmF0ZXMgYSBmaXJtd2FyZSBkZXZpY2UuDQoNCj4gICAJLyogTmVl
ZCB0byBkcm9wIGxvY2tzIHRvIGF2b2lkIHJlY3Vyc2l2ZSBkZWFkbG9jayBpbg0KPiAgIAkg
KiByZWdpc3Rlcl9mcmFtZWJ1ZmZlci4gVGhpcyBpcyBvayBiZWNhdXNlIHRoZSBvbmx5IHRo
aW5nIGxlZnQgdG8gZG8gaXMNCj4gICAJICogcmVnaXN0ZXIgdGhlIGZiZGV2IGVtdWxhdGlv
biBpbnN0YW5jZSBpbiBrZXJuZWxfZmJfaGVscGVyX2xpc3QuICovDQoNCi0tIA0KVGhvbWFz
IFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUg
U29sdXRpb25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJn
LCBHZXJtYW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8aHJl
cjogSXZvIFRvdGV2DQo=

--------------PX7QTzUWG0KO3ZVC40N5d82M--

--------------2UW6C8bX1bdqZGPtnDh7XxPw
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmJrrGEFAwAAAAAACgkQlh/E3EQov+Cm
fw/8C0nMZQ9hpHezcO3YkbQjSVDI3XKUx2DpqpADdq2uo8I1KJ6UcIUaJVL7TrW3xKFGFqVGUuoF
T2Pd8LFt85572TI9FGKSLlzEDhcVMVV2uc3RNo3l+xEh/22DMh9hqtD4KUWS1e2vnIWevoeV5C9o
yA2CowzWl7tVaUTgSGGSVTdW+qaSrwJ1Z4zATYjm8lJVBtAHM3htgufP3Nx7f9FHuH0WC8b1vkVn
XgwytNq3VE+4TvngnmEohkSRvlvH3bJThlksAIETemUXalJRuzQ97gpe6cH5thqMwEjxiKtQ71QY
8ApO1MrVS6GgVyULlZlgZQpMMeRc3T6oDfW8nj1fX5U6wTI74/rDCboMtbxC/FDQa6hCU6lHhdWS
skmU38bDXLMX3ANkgqFFdumaNe9JKujdaJ3RPH0DXJ9e0Ll4BVpUoOLCEsRzBrh8tCM2xTjupZJM
pPoPeVYlh/NaoHZScvATWCAJaSMd807E/qBDBXSvZjxaHVV7C/1xr4/v+NYkRG62Uri4YHz5hTLH
GyhO8vYyU+TjnzDgZ++PP5lAXpFk5sDJ7kqNv8jIY0ESp0zRrNCzTMK8oQy1SNIOt66Pd9i8XeNL
IR8mp4vUiu0M3qs8K3KCF7jhbTOL/1Q9XmFhYB1AzkAKsg9oIavbpuKxbK+R0SDZhco7lSQYSIvt
yEc=
=rVnu
-----END PGP SIGNATURE-----

--------------2UW6C8bX1bdqZGPtnDh7XxPw--
