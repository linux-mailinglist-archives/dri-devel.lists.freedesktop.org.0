Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C5D7146B689
	for <lists+dri-devel@lfdr.de>; Tue,  7 Dec 2021 10:02:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3D90AB9D0;
	Tue,  7 Dec 2021 09:02:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D41DAB9D0
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Dec 2021 09:02:43 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 361591FD2F;
 Tue,  7 Dec 2021 09:02:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1638867762; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ShmJ81dXUTEKr2HU5HKD5HOF9rm7VFvmZwbi1wxB4yk=;
 b=1emgFIIOLCnhU4VgSAsOICDN4y27QpU4vGWrpkzM7THotU/e4RvXWZVe7XUXCxSPDh6JbZ
 t8THflQtXRjMIr4JXueZIIPXa/Wcn4ZNBL1AOLRzkzosPvPlywjZXmeLiqqQAaOnjgQhJW
 KA1NNySDYx+KTH9uUTr6cop6SnWkF0I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1638867762;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ShmJ81dXUTEKr2HU5HKD5HOF9rm7VFvmZwbi1wxB4yk=;
 b=Ofijg8Yid7k3gfgyDc/dtigbRm831VrboeoLvqyqr3ayuteqItsYJq04a35c+0pLaNgo9D
 ao0aQSVLIYhYjjBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3810313513;
 Tue,  7 Dec 2021 09:02:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 9/DWCTEjr2ESRgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 07 Dec 2021 09:02:41 +0000
Message-ID: <353db677-0060-f673-28ef-72401dd5b84b@suse.de>
Date: Tue, 7 Dec 2021 10:02:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH v2 1/3] of: Move simple-framebuffer device handling from
 simplefb to of
Content-Language: en-US
To: Hector Martin <marcan@marcan.st>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>
References: <20211207072943.121961-1-marcan@marcan.st>
 <20211207072943.121961-2-marcan@marcan.st>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20211207072943.121961-2-marcan@marcan.st>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------O3vwcP36Pqs9LacqxReePlAm"
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
Cc: dri-devel@lists.freedesktop.org,
 Javier Martinez Canillas <javier@dowhile0.org>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------O3vwcP36Pqs9LacqxReePlAm
Content-Type: multipart/mixed; boundary="------------xUoc8AiyS5inbFdzoNanszRM";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Hector Martin <marcan@marcan.st>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>
Cc: Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Javier Martinez Canillas <javier@dowhile0.org>,
 Pekka Paalanen <ppaalanen@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Message-ID: <353db677-0060-f673-28ef-72401dd5b84b@suse.de>
Subject: Re: [PATCH v2 1/3] of: Move simple-framebuffer device handling from
 simplefb to of
References: <20211207072943.121961-1-marcan@marcan.st>
 <20211207072943.121961-2-marcan@marcan.st>
In-Reply-To: <20211207072943.121961-2-marcan@marcan.st>

--------------xUoc8AiyS5inbFdzoNanszRM
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDcuMTIuMjEgdW0gMDg6Mjkgc2NocmllYiBIZWN0b3IgTWFydGluOg0KPiBU
aGlzIGNvZGUgaXMgcmVxdWlyZWQgZm9yIGJvdGggc2ltcGxlZmIgYW5kIHNpbXBsZWRybSwg
c28gbGV0J3MgbW92ZSBpdA0KPiBpbnRvIHRoZSBPRiBjb3JlIGluc3RlYWQgb2YgaGF2aW5n
IGl0IGFzIGFuIGFkLWhvYyBpbml0Y2FsbCBpbiB0aGUNCj4gZHJpdmVycy4NCj4gDQo+IFNp
Z25lZC1vZmYtYnk6IEhlY3RvciBNYXJ0aW4gPG1hcmNhbkBtYXJjYW4uc3Q+DQoNCkFja2Vk
LWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4NCg0KVGhpcyBs
b29rcyBtdWNoIGJldHRlciB0aGFuIGJlZm9yZS4gVGhhbmsgeW91Lg0KDQo+IC0tLQ0KPiAg
IGRyaXZlcnMvb2YvcGxhdGZvcm0uYyAgICAgICAgICB8ICA1ICsrKysrDQo+ICAgZHJpdmVy
cy92aWRlby9mYmRldi9zaW1wbGVmYi5jIHwgMjEgKy0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+
ICAgMiBmaWxlcyBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDIwIGRlbGV0aW9ucygtKQ0K
PiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvb2YvcGxhdGZvcm0uYyBiL2RyaXZlcnMvb2Yv
cGxhdGZvcm0uYw0KPiBpbmRleCBiM2ZhZjg5NzQ0YWEuLmUwOTdmNDBiMDNjMCAxMDA2NDQN
Cj4gLS0tIGEvZHJpdmVycy9vZi9wbGF0Zm9ybS5jDQo+ICsrKyBiL2RyaXZlcnMvb2YvcGxh
dGZvcm0uYw0KPiBAQCAtNTQwLDYgKzU0MCwxMSBAQCBzdGF0aWMgaW50IF9faW5pdCBvZl9w
bGF0Zm9ybV9kZWZhdWx0X3BvcHVsYXRlX2luaXQodm9pZCkNCj4gICAJCW9mX25vZGVfcHV0
KG5vZGUpOw0KPiAgIAl9DQo+ICAgDQo+ICsJZm9yX2VhY2hfY2hpbGRfb2Zfbm9kZShvZl9j
aG9zZW4sIG5vZGUpIHsNCj4gKwkJaWYgKG9mX2RldmljZV9pc19jb21wYXRpYmxlKG5vZGUs
ICJzaW1wbGUtZnJhbWVidWZmZXIiKSkNCj4gKwkJCW9mX3BsYXRmb3JtX2RldmljZV9jcmVh
dGUobm9kZSwgTlVMTCwgTlVMTCk7DQo+ICsJfQ0KPiArDQo+ICAgCS8qIFBvcHVsYXRlIGV2
ZXJ5dGhpbmcgZWxzZS4gKi8NCj4gICAJb2ZfcGxhdGZvcm1fZGVmYXVsdF9wb3B1bGF0ZShO
VUxMLCBOVUxMLCBOVUxMKTsNCj4gICANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmlkZW8v
ZmJkZXYvc2ltcGxlZmIuYyBiL2RyaXZlcnMvdmlkZW8vZmJkZXYvc2ltcGxlZmIuYw0KPiBp
bmRleCBiNjMwNzRmZDg5MmUuLjU3NTQxODg3MTg4YiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVy
cy92aWRlby9mYmRldi9zaW1wbGVmYi5jDQo+ICsrKyBiL2RyaXZlcnMvdmlkZW8vZmJkZXYv
c2ltcGxlZmIuYw0KPiBAQCAtNTQxLDI2ICs1NDEsNyBAQCBzdGF0aWMgc3RydWN0IHBsYXRm
b3JtX2RyaXZlciBzaW1wbGVmYl9kcml2ZXIgPSB7DQo+ICAgCS5yZW1vdmUgPSBzaW1wbGVm
Yl9yZW1vdmUsDQo+ICAgfTsNCj4gICANCj4gLXN0YXRpYyBpbnQgX19pbml0IHNpbXBsZWZi
X2luaXQodm9pZCkNCj4gLXsNCj4gLQlpbnQgcmV0Ow0KPiAtCXN0cnVjdCBkZXZpY2Vfbm9k
ZSAqbnA7DQo+IC0NCj4gLQlyZXQgPSBwbGF0Zm9ybV9kcml2ZXJfcmVnaXN0ZXIoJnNpbXBs
ZWZiX2RyaXZlcik7DQo+IC0JaWYgKHJldCkNCj4gLQkJcmV0dXJuIHJldDsNCj4gLQ0KPiAt
CWlmIChJU19FTkFCTEVEKENPTkZJR19PRl9BRERSRVNTKSAmJiBvZl9jaG9zZW4pIHsNCj4g
LQkJZm9yX2VhY2hfY2hpbGRfb2Zfbm9kZShvZl9jaG9zZW4sIG5wKSB7DQo+IC0JCQlpZiAo
b2ZfZGV2aWNlX2lzX2NvbXBhdGlibGUobnAsICJzaW1wbGUtZnJhbWVidWZmZXIiKSkNCj4g
LQkJCQlvZl9wbGF0Zm9ybV9kZXZpY2VfY3JlYXRlKG5wLCBOVUxMLCBOVUxMKTsNCj4gLQkJ
fQ0KPiAtCX0NCj4gLQ0KPiAtCXJldHVybiAwOw0KPiAtfQ0KPiAtDQo+IC1mc19pbml0Y2Fs
bChzaW1wbGVmYl9pbml0KTsNCj4gK21vZHVsZV9wbGF0Zm9ybV9kcml2ZXIoc2ltcGxlZmJf
ZHJpdmVyKTsNCj4gICANCj4gICBNT0RVTEVfQVVUSE9SKCJTdGVwaGVuIFdhcnJlbiA8c3dh
cnJlbkB3d3dkb3Rvcmcub3JnPiIpOw0KPiAgIE1PRFVMRV9ERVNDUklQVElPTigiU2ltcGxl
IGZyYW1lYnVmZmVyIGRyaXZlciIpOw0KPiANCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0K
R3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2Vy
bWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihI
UkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYN
Cg==

--------------xUoc8AiyS5inbFdzoNanszRM--

--------------O3vwcP36Pqs9LacqxReePlAm
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmGvIzAFAwAAAAAACgkQlh/E3EQov+Dl
fw//UTEwcU6GCohXfdYRQak1m2CwfMIQ+FmpWTz3CbEYyMYxxLKfKEBvd1YKEsZkeKRp3DWEAQig
j1rjgMDepEuv865lMwrR7UuYuvaqQRjOGoQDiSW4A9mwWEr2soId9ahvQ9TvoWhzSzrpUlVnTm5/
lYrSEi3HWBfUaPFRIu0wyVzALzU+hNKA0jn6hUneZMJMqUSx82djZVSRx+UKqjhUictkpH96gDyC
8wjd12CqXTPKxfbD4gh9cuQiYYtvwpAF5Uy98BTSy/+4Ma+QxHdNBBSSo5Z1lnwOgwqMm4zwoiCb
IGmOLSyHMsjbLopCYU4u6a3l9V2uqWcx6jynO4VBB5kce3U5zo1GP34bEllFwWS5pX0nmVhvh7Ze
VQvWBcwtGPSpeQlC/xGorta2mrU94g6xBvnTpKXEARBeDvgco8ecdVIDwLwZwudQiDC8m8vsD/JI
7kehwDmwTNjUqLrAFUnOSrO1FEvhdjfAZzzaIEGBIjFcCg6TZ7TngonO+3NhqTp7IT0IKnm8bKUC
ycuLo7B2K1Gg0TXKo62kYXpKPQwIDiweIJMjOaOkSuvP6IH52LWHxNeEP5mMzcqcUxG7rYPoWaRH
klnR2D8Scxc9WOqmd75JbPEiXF49yvuXTYhbxumPAk5N+EziIkPuTnkhlKRZR2P/29GicOFjwtal
BBs=
=bgnp
-----END PGP SIGNATURE-----

--------------O3vwcP36Pqs9LacqxReePlAm--
