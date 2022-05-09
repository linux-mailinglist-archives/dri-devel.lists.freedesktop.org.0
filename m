Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C35552048E
	for <lists+dri-devel@lfdr.de>; Mon,  9 May 2022 20:33:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5C6710EB4D;
	Mon,  9 May 2022 18:32:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9C2D10EB4D
 for <dri-devel@lists.freedesktop.org>; Mon,  9 May 2022 18:32:55 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 33FEF1F88C;
 Mon,  9 May 2022 18:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1652121174; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MYrIKKTG9Xm7nedYz4jEcMJmAizzDkvKZjQ/c2Q2F04=;
 b=zRIoqqjvF/XCVPPWRxLX++4m0mJW3otfqDdjwbqBY8y+3Yx0zmWTDYRbWAutuZpnVw6BzI
 C9bsX33m4gxfsBOo6fwl3qdFq3fp0aFapexeKqWpqAHafAFQBv8bNsFFLkLRMH2onxRscw
 NvGRyzZa14TWh/XCSZxJILzBJT0iGv4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1652121174;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MYrIKKTG9Xm7nedYz4jEcMJmAizzDkvKZjQ/c2Q2F04=;
 b=rewAWuiha5cuiT9imLTztZRdxujWpC7Rxyil6kssNLPjAfbeQgnnF5q2Q69nZUob3xH1Z+
 N/XhZj7sWKMKSfCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 06C6A13AA5;
 Mon,  9 May 2022 18:32:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id dN3EAFZeeWKPaAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 09 May 2022 18:32:54 +0000
Message-ID: <51254d3d-af8d-61b3-e8a2-8fd0e583e783@suse.de>
Date: Mon, 9 May 2022 20:32:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v3 1/4] fbdev: Prevent possible use-after-free in
 fb_release()
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, linux-kernel@vger.kernel.org
References: <20220505215947.364694-1-javierm@redhat.com>
 <20220505220413.365977-1-javierm@redhat.com>
 <753d0350-42dc-389b-b10b-4533ddcf32ac@intel.com>
 <1f788b8f-0bea-1818-349e-b1bc907bf251@redhat.com>
 <a339df59-9e00-c7cb-e33d-2ac626443639@intel.com>
 <3b7fe4fe-fdec-cef2-4e0e-309d9dc4a8af@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <3b7fe4fe-fdec-cef2-4e0e-309d9dc4a8af@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------6BCuQbmZJwIWsnYIUbFyB0B5"
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, linux-fbdev@vger.kernel.org,
 Helge Deller <deller@gmx.de>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------6BCuQbmZJwIWsnYIUbFyB0B5
Content-Type: multipart/mixed; boundary="------------8pTehAEcyWCBSsbBrQmlHNom";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, linux-kernel@vger.kernel.org
Cc: linux-fbdev@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Helge Deller <deller@gmx.de>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@intel.com>
Message-ID: <51254d3d-af8d-61b3-e8a2-8fd0e583e783@suse.de>
Subject: Re: [PATCH v3 1/4] fbdev: Prevent possible use-after-free in
 fb_release()
References: <20220505215947.364694-1-javierm@redhat.com>
 <20220505220413.365977-1-javierm@redhat.com>
 <753d0350-42dc-389b-b10b-4533ddcf32ac@intel.com>
 <1f788b8f-0bea-1818-349e-b1bc907bf251@redhat.com>
 <a339df59-9e00-c7cb-e33d-2ac626443639@intel.com>
 <3b7fe4fe-fdec-cef2-4e0e-309d9dc4a8af@redhat.com>
In-Reply-To: <3b7fe4fe-fdec-cef2-4e0e-309d9dc4a8af@redhat.com>

--------------8pTehAEcyWCBSsbBrQmlHNom
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDkuMDUuMjIgdW0gMTg6MzMgc2NocmllYiBKYXZpZXIgTWFydGluZXogQ2Fu
aWxsYXM6DQo+IE9uIDUvOS8yMiAxNzo1MSwgQW5kcnplaiBIYWpkYSB3cm90ZToNCj4gDQo+
IFtzbmlwXQ0KPiANCj4+Pj4+ICsNCj4+Pj4gUmVnYXJkaW5nIGRybToNCj4+Pj4gV2hhdCBh
Ym91dCBkcm1fZmJfaGVscGVyX2Zpbmk/IEl0IGNhbGxzIGFsc28gZnJhbWVidWZmZXJfcmVs
ZWFzZSBhbmQgaXMNCj4+Pj4gY2FsbGVkIG9mdGVuIGZyb20gX3JlbW92ZSBwYXRocyAoY2hl
Y2tlZCBpbnRlbC9yYWRlb24vbm91dmVhdSkuIEkgZ3Vlc3MNCj4+Pj4gaXQgc2hvdWxkIGJl
IGZpeGVkIGFzIHdlbGwuIERvIHlvdSBwbGFuIHRvIGZpeCBpdD8NCj4+Pj4NCj4+PiBJIHRo
aW5rIHlvdSBhcmUgY29ycmVjdC4gTWF5YmUgd2UgbmVlZCBzb21ldGhpbmcgbGlrZSB0aGUg
Zm9sbG93aW5nPw0KPj4+DQo+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1f
ZmJfaGVscGVyLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2ZiX2hlbHBlci5jDQo+Pj4gaW5k
ZXggZDI2NWE3MzMxM2M5Li5iMDk1OThmN2FmMjggMTAwNjQ0DQo+Pj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2RybV9mYl9oZWxwZXIuYw0KPj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9k
cm1fZmJfaGVscGVyLmMNCj4+PiBAQCAtNjMxLDcgKzYzMSw2IEBAIHZvaWQgZHJtX2ZiX2hl
bHBlcl9maW5pKHN0cnVjdCBkcm1fZmJfaGVscGVyICpmYl9oZWxwZXIpDQo+Pj4gICAgICAg
ICAgIGlmIChpbmZvKSB7DQo+Pj4gICAgICAgICAgICAgICAgICAgaWYgKGluZm8tPmNtYXAu
bGVuKQ0KPj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgZmJfZGVhbGxvY19jbWFwKCZp
bmZvLT5jbWFwKTsNCj4+PiAtICAgICAgICAgICAgICAgZnJhbWVidWZmZXJfcmVsZWFzZShp
bmZvKTsNCg0KQWZ0ZXIgcmV2aWV3aW5nIHRoYXQgY29kZSwgIGRybV9mYl9oZWxwZXJfZmlu
aSgpIGFwcGVhcnMgdG8gYmUgY2FsbGVkIA0KZnJvbSAuZmJfZGVzdHJveSAoc2VlIGRybV9m
YmRldl9yZWxlYXNlKS4gIFRoZSBjb2RlIGlzIGhhcmQgdG8gZm9sbG93IA0KdGhvdWdoLiAg
SWYgdGhlcmUgYW5vdGhlciB3YXkgb2YgcmVsZWFzaW5nIHRoZSBmcmFtZWJ1ZmZlciBoZXJl
Pw0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQo+Pg0KPj4gV2hhdCBhYm91dCBjbWFwPyBJ
IGFtIG5vdCBhbiBmYiBleHBlcnQsIGJ1dCBJTU8gY21hcCBjYW4gYmUgYWNjZXNzZWQNCj4+
IGZyb20gdXNlcnNwYWNlIGFzIHdlbGwuDQo+Pg0KPiANCj4gSSBhY3R1YWxseSB0aG91Z2h0
IGFib3V0IHRoZSBzYW1lIGJ1dCB0aGVuIHJlbWVtYmVyZWQgd2hhdCBEYW5pZWwgc2FpZCBp
biBbMF0NCj4gKEFGQUlVIGF0IGxlYXN0KSB0aGF0IHRoZXNlIHNob3VsZCBiZSBkb25lIGlu
IC5yZW1vdmUoKSBzbyB0aGUgY3VycmVudCBjb2RlDQo+IGxvb2tzIGxpa2UgbWF0Y2hlcyB0
aGF0IGFuZCBvbmx5IGZyYW1lYnVmZmVyX3JlbGVhc2UoKSBzaG91bGQgYmUgbW92ZWQuDQo+
IA0KPiBGb3IgdmVzYWZiIGEgcHJldmlvdXMgcGF0Y2ggcHJvcG9zZWQgdG8gYWxzbyBtb3Zl
IGEgcmVsZWFzZV9yZWdpb24oKSBjYWxsIHRvDQo+IC5mYl9kZXN0cm95KCkgYW5kIERhbmll
bCBhbHNvIHNhaWQgdGhhdCBpdCB3YXMgaWZmeSBhbmQgc2hvdWxkbid0IGJlIGRvbmUgWzFd
Lg0KPiANCj4gQnV0IEknbSBhbHNvIG5vdCBmYiBleHBlcnQgc28gaGFwcHkgdG8gbW92ZSBm
Yl9kZWFsbG9jX2NtYXAoKSBhcyB3ZWxsIGlmIHRoYXQNCj4gaXMgdGhlIGNvcnJlY3QgdGhp
bmcgdG8gZG8uDQo+IA0KPiBbMF06IGh0dHBzOi8vd3d3LnNwaW5pY3MubmV0L2xpc3RzL2Ry
aS1kZXZlbC9tc2czNDYyNTcuaHRtbA0KPiBbMV06IGh0dHBzOi8vd3d3LnNwaW5pY3MubmV0
L2xpc3RzL2RyaS1kZXZlbC9tc2czNDYyNjEuaHRtbA0KPiANCg0KLS0gDQpUaG9tYXMgWmlt
bWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1
dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdl
cm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBJ
dm8gVG90ZXYNCg==

--------------8pTehAEcyWCBSsbBrQmlHNom--

--------------6BCuQbmZJwIWsnYIUbFyB0B5
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmJ5XlUFAwAAAAAACgkQlh/E3EQov+CW
kQ/8Cy/hT9wtY77xvaRHj740ToRIgCOikHNcs6g+4+ygXsp2atLPGXHtUgkRJkVaA50iZJ6bI1mc
cABddSSdXn8z6QbsyIY8ViGEe2VHAtBA9ycCR+qlLhW+YE5WBTmT85/0NXF/fb0Ni0tx+a3LsSMv
sxCla0mRgXy/UHjYUbKjErnGYrptW+OZ0QLggiegke1WLCrD7nprcLJbl5/FDXsdUzHijCJ0dc9k
+T/PD9S1FNtUaDGDiQ+z6UcK2U9C5wNB2DyqPB8fn+3hcC/yzTpOkfeYSBeZN8iyCVL0BJN+Iysj
KBcJg9NqGR/49e5j01tZn5aYh31maberh0IF25UF4yFeYuz3sDH7aHKPRUnZ4tFpoqPwBuGWiMhH
8Iudypn6nif+Y6PAQ0BRcOxXNSZ0OaY/02ZxlIENkW0to7Fuf1GYZYLTkvIV1vY7lWyo7SxvJTWA
oF3EhF28ybCIkiBCOdOQ3wD9rt8aWNmvVb/GpcvjFcc+sj9vB5xmQwOhlcbfXRzuOZeB0xf+bS/n
h0tH6H033aSLwOC+OeYdKBdMMg4gfTsdQ/5RQoMscDEuSAZ+MTYVx2To68ZKDHkiWtMlctbEnZLx
DVyq+D92SHpqVGTwTYazyqmWM9Yx4A+lmWz4l5gsQMQmA9NcBtOEjmq+goZQvl1wXXPWZwEMZnsH
Z3M=
=h1Wi
-----END PGP SIGNATURE-----

--------------6BCuQbmZJwIWsnYIUbFyB0B5--
