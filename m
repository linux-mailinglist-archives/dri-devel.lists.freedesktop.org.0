Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73B03620B26
	for <lists+dri-devel@lfdr.de>; Tue,  8 Nov 2022 09:28:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B72EC10E365;
	Tue,  8 Nov 2022 08:28:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA28810E365
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Nov 2022 08:28:36 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id F051B1F88B;
 Tue,  8 Nov 2022 08:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1667896114; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=O7E77NXf7Njp1zqWdU6k301SGIi6TUkaQ9I7uUfLppY=;
 b=R+tV6EKJljgJ6VavdQTz6JR95lY3qCLR3w805A7vezjLx786SGSSDDtO+oI85SQysTYW1/
 n4J30/Kn7xvOQpTcPMkQHgCnFi/vgDuRDOaK7pp9l3iF4RL+k4vUGc5Cz9gPQXnwGO+haK
 S9kJEvBLgtmz1+7ngGLe7gfKEh/Z+IY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1667896114;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=O7E77NXf7Njp1zqWdU6k301SGIi6TUkaQ9I7uUfLppY=;
 b=kU2J9RD14mGNELZrOli9ml2ZFp61lQBr7Ip2JMlIfkBwAnvfiH955PvsLDzVD4Sy65xyum
 903V0N/5tEiqOCBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CBF57139F1;
 Tue,  8 Nov 2022 08:28:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id EuDKMDITamMNTAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 08 Nov 2022 08:28:34 +0000
Message-ID: <d4534f8e-d4b5-8484-dde5-34ce671972af@suse.de>
Date: Tue, 8 Nov 2022 09:28:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH] drm/gem-shmem: When drm_gem_object_init failed, should
 release object
Content-Language: en-US
To: ChunyouTang <tangchunyou@163.com>, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, daniel@ffwll.ch
References: <20221108020321.911-1-tangchunyou@163.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20221108020321.911-1-tangchunyou@163.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------8rriCnaf73bjYXvY3oTaAk4N"
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
--------------8rriCnaf73bjYXvY3oTaAk4N
Content-Type: multipart/mixed; boundary="------------fvEzhbnPPNNP4hxa6taH2Gtb";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: ChunyouTang <tangchunyou@163.com>, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org
Message-ID: <d4534f8e-d4b5-8484-dde5-34ce671972af@suse.de>
Subject: Re: [PATCH] drm/gem-shmem: When drm_gem_object_init failed, should
 release object
References: <20221108020321.911-1-tangchunyou@163.com>
In-Reply-To: <20221108020321.911-1-tangchunyou@163.com>

--------------fvEzhbnPPNNP4hxa6taH2Gtb
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDguMTEuMjIgdW0gMDM6MDMgc2NocmllYiBDaHVueW91VGFuZzoNCj4gd2hl
biBnb3RvIGVycl9mcmVlLCB0aGUgb2JqZWN0IGhhZCBpbml0LCBzbyBpdCBzaG91bGQgYmUg
cmVsZWFzZSB3aGVuIGZhaWwuDQoNCklmIHRoZSBjYWxsIHRvIGRybV9nZW1fb2JqZWN0X2lu
aXQoKSBmYWlscywgdGhlIG9iamVjdCBpcyBzdGlsbCANCnVuaW5pdGlhbGl6ZWQuIEFkbWl0
dGVkbHksIHRoZSBjYWxsIHRvIGdlbV9jcmVhdGVfb2JqZWN0IGNvdWxkIG5lZWQgDQphZGRp
dGlvbmFsIGNsZWFudXAsIGJ1dCBpdCBhcHBlYXJzIGFzIGlmIG5vIG9uZSBoYXMgaGFkIGEg
bmVlZCBmb3IgdGhpcyANCnNvIGZhci4NCg0KSXMgdGhlcmUgYW55dGhpbmcgdGhhdCBtaWdo
dCBsZWFrPw0KDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBDaHVueW91VGFuZyA8dGFuZ2NodW55
b3VAMTYzLmNvbT4NCj4gLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fc2htZW1f
aGVscGVyLmMgfCA0ICsrLS0NCj4gICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCsp
LCAyIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9k
cm1fZ2VtX3NobWVtX2hlbHBlci5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fc2htZW1f
aGVscGVyLmMNCj4gaW5kZXggMzUxMzhmOGEzNzVjLi4yZTVlMzIwNzM1NWYgMTAwNjQ0DQo+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtX3NobWVtX2hlbHBlci5jDQo+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtX3NobWVtX2hlbHBlci5jDQo+IEBAIC0xMDQsMTAg
KzEwNCwxMCBAQCBfX2RybV9nZW1fc2htZW1fY3JlYXRlKHN0cnVjdCBkcm1fZGV2aWNlICpk
ZXYsIHNpemVfdCBzaXplLCBib29sIHByaXZhdGUpDQo+ICAgDQo+ICAgCXJldHVybiBzaG1l
bTsNCj4gICANCj4gLWVycl9yZWxlYXNlOg0KPiAtCWRybV9nZW1fb2JqZWN0X3JlbGVhc2Uo
b2JqKTsNCj4gICBlcnJfZnJlZToNCj4gICAJa2ZyZWUob2JqKTsNCj4gK2Vycl9yZWxlYXNl
Og0KPiArCWRybV9nZW1fb2JqZWN0X3JlbGVhc2Uob2JqKTsNCg0KWW91IGhhdmUgbm93IGZy
ZWVkIHRoZSBvYmplY3QncyBtZW1vcnkgYmVmb3JlIHJlbGVhc2luZyBpdC4gTm90IGdvaW5n
IHRvIA0Kd29yay4NCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KPiAgIA0KPiAgIAlyZXR1
cm4gRVJSX1BUUihyZXQpOw0KPiAgIH0NCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3Jh
cGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFu
eSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIg
MzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCg==


--------------fvEzhbnPPNNP4hxa6taH2Gtb--

--------------8rriCnaf73bjYXvY3oTaAk4N
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmNqEzIFAwAAAAAACgkQlh/E3EQov+Ct
BBAAli6voVQ75PX8TLABNJDjoihk5HnWjXUK38BguNRMbd4/9qFP86fPXe1wEkuWzLA0bLTMH08i
F98Yj+Tk0go9ibd+beNOItVGkS4hrP819VNIyAlrGVfP3HEnJB8ENZ7aQVvWPjNZxwAOQTvTIBwa
aHn3EHspMS/GBhu/rukR+1lSOAA0Z+DeB++TAzxRm+M7ZJauDAX+wlpsjM5HO4FC5O1kxJEmnbLq
h9zzVuPxBPzqKuIpytsoIgWys1d2pgGlnXAg+j/YIJGXN038B5MsuWBzGEXSihHkn6tIMvDAnhCQ
VsXw5SaRDcBDITapjO3yh3k/KqcP9sw9aWH810QZIyDbEGA7o4N44jMxgyqu0h4Gd3tgsTM4elGs
AYxkho3NYzIgPCH5qzLtf/9LKF2F5pqrRiPCjrBPxMleOYjqVBgouay6Ixq2jypsnZsiGjb4dOV9
JZxacWp/ycF3RaSgtp9BIOHohFUp3gxV6pWA5E+lyzXqq0vy9DlNmQw2lUBjboQXtEgHCx7qXwsg
iknFM0xU+VWFRK+ckoQLQ/C6j8IwrsZV5AFB3Lo3o2cSfNrPm8TnMqgWniOxjAYJkpTQDz76wB8j
EEC180ZYg8Qo7TZiygeXL1JM68r6xiJ9FqPVUJvqh3oxGpuww8j1mHah8/k84goeBGMsuUJsKGZB
2HA=
=1+JV
-----END PGP SIGNATURE-----

--------------8rriCnaf73bjYXvY3oTaAk4N--
