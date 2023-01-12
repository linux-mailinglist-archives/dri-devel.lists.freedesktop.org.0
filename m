Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13F6B666E78
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jan 2023 10:41:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D75010E8BD;
	Thu, 12 Jan 2023 09:41:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86DB110E8B9;
 Thu, 12 Jan 2023 09:41:43 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A3EED3EEB2;
 Thu, 12 Jan 2023 09:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1673516500; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6co9Mq3/4tg5vYTRc6Bu/MTG1Uz5/2WeUp1oM2NDVSk=;
 b=ITIvBazLa38FQyvum4fNY1LLPIwITQg+Pt7TJx7dmrZEA5KNI6MVYLSjql2VT8A8bDA8Yu
 lS9imnVpGBjB7vUMZpbZ+B1c5n7r32uPdT5NsDBUX+TLqBnWkh91tEl/3cjtARcDJAj7Nn
 HgAPcu2APnkOU6DUQHhBa9Ypn1Rtyeg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1673516500;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6co9Mq3/4tg5vYTRc6Bu/MTG1Uz5/2WeUp1oM2NDVSk=;
 b=BbLpIv7SfvHsogcpc9GutuDkESQagaL+63zBqAW507r6G/hjf6bYu/N2QILEM2Tyck7LBd
 Uu5iOxKvaBNHj4DA==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 728E0136AE;
 Thu, 12 Jan 2023 09:41:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id 3y32GtTVv2MqIwAAGKfGzw
 (envelope-from <tzimmermann@suse.de>); Thu, 12 Jan 2023 09:41:40 +0000
Message-ID: <59149393-73cf-83a3-5ea5-ff6f47fe2c31@suse.de>
Date: Thu, 12 Jan 2023 10:41:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 01/11] drm/ast: Use
 drm_aperture_remove_conflicting_pci_framebuffers
Content-Language: en-US
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20230111154112.90575-1-daniel.vetter@ffwll.ch>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230111154112.90575-1-daniel.vetter@ffwll.ch>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------vOwfUhSOD3p0obgeA20yv5UJ"
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
Cc: linux-fbdev@vger.kernel.org,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Dave Airlie <airlied@redhat.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Helge Deller <deller@gmx.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------vOwfUhSOD3p0obgeA20yv5UJ
Content-Type: multipart/mixed; boundary="------------IR20Ox5nOYlN0pQH131diBcQ";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, Daniel Vetter
 <daniel.vetter@intel.com>, Dave Airlie <airlied@redhat.com>,
 Javier Martinez Canillas <javierm@redhat.com>, Helge Deller <deller@gmx.de>,
 linux-fbdev@vger.kernel.org
Message-ID: <59149393-73cf-83a3-5ea5-ff6f47fe2c31@suse.de>
Subject: Re: [PATCH 01/11] drm/ast: Use
 drm_aperture_remove_conflicting_pci_framebuffers
References: <20230111154112.90575-1-daniel.vetter@ffwll.ch>
In-Reply-To: <20230111154112.90575-1-daniel.vetter@ffwll.ch>

--------------IR20Ox5nOYlN0pQH131diBcQ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQoNCkFtIDExLjAxLjIzIHVtIDE2OjQxIHNjaHJpZWIgRGFuaWVsIFZldHRlcjoNCj4gSXQn
cyBqdXN0IG9wZW4gY29kZWQgYW5kIG1hdGNoZXMuDQo+IA0KPiBOb3RlIHRoYXQgVGhvbWFz
IHNhaWQgdGhhdCBoaXMgdmVyc2lvbiBhcHBhcmVudGx5IGZhaWxlZCBmb3Igc29tZQ0KPiBy
ZWFzb24sIGJ1dCBoZXkgbWF5YmUgd2Ugc2hvdWxkIHRyeSBhZ2Fpbi4NCg0KSXQgYXBwYXJl
bnRseSB3b3JrZWQgdGhpcyB0aW1lLiBUZXN0ZWQgb24gYW4gQVNUMjEwMCBjaGlwLg0KDQo+
IA0KPiBTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGludGVs
LmNvbT4NCj4gQ2M6IERhdmUgQWlybGllIDxhaXJsaWVkQHJlZGhhdC5jb20+DQo+IENjOiBU
aG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4NCj4gQ2M6IEphdmllciBN
YXJ0aW5leiBDYW5pbGxhcyA8amF2aWVybUByZWRoYXQuY29tPg0KPiBDYzogSGVsZ2UgRGVs
bGVyIDxkZWxsZXJAZ214LmRlPg0KPiBDYzogbGludXgtZmJkZXZAdmdlci5rZXJuZWwub3Jn
DQoNClRlc3RlZC1ieTogVGhvbWFzIFppbW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRl
Pg0KUmV2aWV3ZWQtYnk6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRl
Pg0KDQo+IC0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9hc3QvYXN0X2Rydi5jIHwgMTYgKy0t
LS0tLS0tLS0tLS0tLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMTUg
ZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FzdC9h
c3RfZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9kcnYuYw0KPiBpbmRleCA0MjBm
Yzc1YzI0MGUuLjNhYzI0YTc4MGY1MCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2FzdC9hc3RfZHJ2LmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FzdC9hc3RfZHJ2LmMN
Cj4gQEAgLTkwLDI3ICs5MCwxMyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHBjaV9kZXZpY2Vf
aWQgYXN0X3BjaWlkbGlzdFtdID0gew0KPiAgIA0KPiAgIE1PRFVMRV9ERVZJQ0VfVEFCTEUo
cGNpLCBhc3RfcGNpaWRsaXN0KTsNCj4gICANCj4gLXN0YXRpYyBpbnQgYXN0X3JlbW92ZV9j
b25mbGljdGluZ19mcmFtZWJ1ZmZlcnMoc3RydWN0IHBjaV9kZXYgKnBkZXYpDQo+IC17DQo+
IC0JYm9vbCBwcmltYXJ5ID0gZmFsc2U7DQo+IC0JcmVzb3VyY2Vfc2l6ZV90IGJhc2UsIHNp
emU7DQo+IC0NCj4gLQliYXNlID0gcGNpX3Jlc291cmNlX3N0YXJ0KHBkZXYsIDApOw0KPiAt
CXNpemUgPSBwY2lfcmVzb3VyY2VfbGVuKHBkZXYsIDApOw0KPiAtI2lmZGVmIENPTkZJR19Y
ODYNCj4gLQlwcmltYXJ5ID0gcGRldi0+cmVzb3VyY2VbUENJX1JPTV9SRVNPVVJDRV0uZmxh
Z3MgJiBJT1JFU09VUkNFX1JPTV9TSEFET1c7DQo+IC0jZW5kaWYNCj4gLQ0KPiAtCXJldHVy
biBkcm1fYXBlcnR1cmVfcmVtb3ZlX2NvbmZsaWN0aW5nX2ZyYW1lYnVmZmVycyhiYXNlLCBz
aXplLCBwcmltYXJ5LCAmYXN0X2RyaXZlcik7DQo+IC19DQo+IC0NCj4gICBzdGF0aWMgaW50
IGFzdF9wY2lfcHJvYmUoc3RydWN0IHBjaV9kZXYgKnBkZXYsIGNvbnN0IHN0cnVjdCBwY2lf
ZGV2aWNlX2lkICplbnQpDQo+ICAgew0KPiAgIAlzdHJ1Y3QgYXN0X3ByaXZhdGUgKmFzdDsN
Cj4gICAJc3RydWN0IGRybV9kZXZpY2UgKmRldjsNCj4gICAJaW50IHJldDsNCj4gICANCj4g
LQlyZXQgPSBhc3RfcmVtb3ZlX2NvbmZsaWN0aW5nX2ZyYW1lYnVmZmVycyhwZGV2KTsNCj4g
KwlyZXQgPSBkcm1fYXBlcnR1cmVfcmVtb3ZlX2NvbmZsaWN0aW5nX3BjaV9mcmFtZWJ1ZmZl
cnMocGRldiwgJmFzdF9kcml2ZXIpOw0KPiAgIAlpZiAocmV0KQ0KPiAgIAkJcmV0dXJuIHJl
dDsNCj4gICANCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERl
dmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxk
c3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJu
YmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCg==

--------------IR20Ox5nOYlN0pQH131diBcQ--

--------------vOwfUhSOD3p0obgeA20yv5UJ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmO/1dQFAwAAAAAACgkQlh/E3EQov+Cc
5xAAk3FJIwGC3Ck8LsaxJld64fexaAC3Pw+8kJCHmcrHz5LNOzKA5DwAqRBv2WcftULO73E5VCVn
pgAGNw6D1N6h7D/L5+e+9GW8Qfm78QEHINYnCEcrfTTDPaK7On5fOMnDxCcgzH3Pmt9wIq8wnDfT
09CL3+v0tLjTX4hTyuyDd6RPcrj/4T5AHgz9gWfKy5571Dz02Fs/R29x1wfiAuUFmCO1F0bOlLJR
kpH+CTKihh18EMRWRVzKP5+7JtJc78omDsLqWaiDkfO2QNMC9XDRf0ZUk+nX7HNGgJRglIIJf36R
cVyuTtQDGxKhqOAjO8b78QyU1rqHTuO2FNwmKsQeCLCpahyHWpFu6bgA1+bsyN2OVborpibaMQNG
y/CAYox6FqsfEdIQ+Zk/KY1lb+QIOvpyBO9lFzzscr4TsFcFS0hIPQn/lavTu424KcH174upKie2
K7ac77a2REabSElUrXdapgD1gbPHr/Vbu2PTM1EmkldUBS6knkpntQ/8H8mIsyoRiK9EA3knS3q4
JiNxk8PWHTKFEP/RjzSjlqDyUKdKc0PgpzzHFv8h5TXyT0rDJP5GrpGDr7KkUuN1GrBsOu6wAqFc
vZYQHdjwqQy9IYkTa1esd7i1zfxXP50u2MrUsTCd/iviAyBgtwA2tIsiMIYt7WYKRuR51ycz8Bah
rEw=
=X8Ot
-----END PGP SIGNATURE-----

--------------vOwfUhSOD3p0obgeA20yv5UJ--
