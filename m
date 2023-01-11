Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3163665FEF
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jan 2023 17:03:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B860D10E775;
	Wed, 11 Jan 2023 16:03:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8635510E775;
 Wed, 11 Jan 2023 16:03:04 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id CF38F4D78;
 Wed, 11 Jan 2023 16:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1673452982; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=M1HohU17itsW32jZyOwsp/5R3a8Pr/D0flNnrsIRegQ=;
 b=FCoU8GtxOLPRPWk2IhiiP6oGusUvJgeulyjyspLZw4oB4cko+n+yA9l8cMfF9pUpWVCVb6
 gc0UzWRwdwAyIileBKaAGzVU2aOrIH5tW8QjrYM91ai4KmSBAKH7BQjM74oOlIP1HmbKkU
 ZZPgwk5DaLEqM9jVOLi5ISdPeXFNT10=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1673452982;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=M1HohU17itsW32jZyOwsp/5R3a8Pr/D0flNnrsIRegQ=;
 b=Ge5ZNYH0cwVmxI7HKg6Fy0K5VNFoKgJnvWA0ZWI34oUWHx920gibELZXBYNJWxox8T7udQ
 CmJKeFUSB4UfjFCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9FE521358A;
 Wed, 11 Jan 2023 16:03:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id J/sIJrbdvmOVRgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 11 Jan 2023 16:03:02 +0000
Message-ID: <87119376-2813-f155-a2e1-006ffa382f12@suse.de>
Date: Wed, 11 Jan 2023 17:03:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 05/11] video/aperture: Only kick vgacon when the pdev is
 decoding vga
Content-Language: en-US
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20230111154112.90575-1-daniel.vetter@ffwll.ch>
 <20230111154112.90575-5-daniel.vetter@ffwll.ch>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230111154112.90575-5-daniel.vetter@ffwll.ch>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------kRdkj4H0mvYrpls000WLvN9H"
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
 Daniel Vetter <daniel.vetter@intel.com>, Helge Deller <deller@gmx.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------kRdkj4H0mvYrpls000WLvN9H
Content-Type: multipart/mixed; boundary="------------65y0U4fNolxGQqzVTBVgvase";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
Cc: linux-fbdev@vger.kernel.org,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 LKML <linux-kernel@vger.kernel.org>, Daniel Vetter
 <daniel.vetter@intel.com>, Helge Deller <deller@gmx.de>
Message-ID: <87119376-2813-f155-a2e1-006ffa382f12@suse.de>
Subject: Re: [PATCH 05/11] video/aperture: Only kick vgacon when the pdev is
 decoding vga
References: <20230111154112.90575-1-daniel.vetter@ffwll.ch>
 <20230111154112.90575-5-daniel.vetter@ffwll.ch>
In-Reply-To: <20230111154112.90575-5-daniel.vetter@ffwll.ch>

--------------65y0U4fNolxGQqzVTBVgvase
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTEuMDEuMjMgdW0gMTY6NDEgc2NocmllYiBEYW5pZWwgVmV0dGVyOg0KPiBP
dGhlcndpc2UgaXQncyBiaXQgc2lsbHksIGFuZCB3ZSBtaWdodCB0aHJvdyBvdXQgdGhlIGRy
aXZlciBmb3IgdGhlDQo+IHNjcmVlbiB0aGUgdXNlciBpcyBhY3R1YWxseSBsb29raW5nIGF0
LiBJIGhhdmVuJ3QgZm91bmQgYSBidWcgcmVwb3J0DQo+IGZvciB0aGlzIGNhc2UgeWV0LCBi
dXQgd2UgZGlkIGdldCBidWcgcmVwb3J0cyBmb3IgdGhlIGFuYWxvZyBjYXNlDQo+IHdoZXJl
IHdlJ3JlIHRocm93aW5nIG91dCB0aGUgZWZpZmIgZHJpdmVyLg0KPiANCj4gUmVmZXJlbmNl
czogaHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMTYzMDMN
Cj4gU2lnbmVkLW9mZi1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBpbnRlbC5j
b20+DQo+IENjOiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4NCj4g
Q2M6IEphdmllciBNYXJ0aW5leiBDYW5pbGxhcyA8amF2aWVybUByZWRoYXQuY29tPg0KPiBD
YzogSGVsZ2UgRGVsbGVyIDxkZWxsZXJAZ214LmRlPg0KPiBDYzogbGludXgtZmJkZXZAdmdl
ci5rZXJuZWwub3JnDQo+IC0tLQ0KPiAgIGRyaXZlcnMvdmlkZW8vYXBlcnR1cmUuYyB8IDMg
KysrDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvdmlkZW8vYXBlcnR1cmUuYyBiL2RyaXZlcnMvdmlkZW8vYXBlcnR1
cmUuYw0KPiBpbmRleCAzZDhjOTI1YzczNjUuLjZmMzUxYTU4ZjZjNiAxMDA2NDQNCj4gLS0t
IGEvZHJpdmVycy92aWRlby9hcGVydHVyZS5jDQo+ICsrKyBiL2RyaXZlcnMvdmlkZW8vYXBl
cnR1cmUuYw0KPiBAQCAtMzQxLDYgKzM0MSw5IEBAIGludCBhcGVydHVyZV9yZW1vdmVfY29u
ZmxpY3RpbmdfcGNpX2RldmljZXMoc3RydWN0IHBjaV9kZXYgKnBkZXYsIGNvbnN0IGNoYXIg
Km5hDQo+ICAgCQkJcmV0dXJuIHJldDsNCj4gICAJfQ0KPiAgIA0KPiArCWlmICghcHJpbWFy
eSkNCj4gKwkJcmV0dXJuIDA7DQo+ICsNCg0KVGhlIG9yaWdpbmFsIGNvZGUgZnJvbSBmYmRl
diBkaWRuJ3QgZG8gdGhpcywgc28gdGhpcyBjb2RlIGRpZG4ndCBlaXRoZXIuDQoNCkl0IGFw
cGVhcnMgbW9yZSB0byBiZSBhIHNwZWNpYWwgY2FzZSB0aGFuIGFuIGVhcmx5LW91dCBicmFu
Y2guIFNvIGNhbiB3ZSANCndyaXRlIGl0IGFzDQoNCmlmIChwcmltYXJ5KSB7DQogICAvLyBr
aWNrX3ZnYWNvbg0KfQ0KDQo/DQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCj4gICAJLyoN
Cj4gICAJICogV0FSTklORzogQXBwYXJlbnRseSB3ZSBtdXN0IGtpY2sgZmJkZXYgZHJpdmVy
cyBiZWZvcmUgdmdhY29uLA0KPiAgIAkgKiBvdGhlcndpc2UgdGhlIHZnYSBmYmRldiBkcml2
ZXIgZmFsbHMgb3Zlci4NCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJp
dmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpN
YXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDksIEFH
IE7DvHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCg==

--------------65y0U4fNolxGQqzVTBVgvase--

--------------kRdkj4H0mvYrpls000WLvN9H
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmO+3bYFAwAAAAAACgkQlh/E3EQov+Cm
Zw//aDbdDgRpQSC/QB7YLm2jfX4bE/DllWGrwGYzmamtFAX8g3PVnLLza0cTM/fob1/oVHk8TyIK
JCoMnmysaSK0OmnbqZrlYldoh/EA3Sh4WnHnneCKXr43axvmNGT6S4YfIMKc88k3X/kpJxioKAw7
m+XiJC9lwLX/y0LiLwQBz0bd4sG6gkHJMOulqAg7KIKNGedoH23HJd+rd1p62smGqkLIAFGocE2d
sEET7QF9eBvlNeGfjrqTLVP1o7CTlRwW6K7StD/IfLt35TV4VuW9TlW3t0Zg6kk03EWDs0INGUXW
mVz186PYSDkI7SuvmwVYum+nsoeSvZGbC7or3JPPGBT+/DIAwY2nWeoEoYvV1BVolJrpwbnIan9A
A2LwzS35N2KRZLsO2xw1yswO0t0KDumy7eeeW0XAYXn7llqwK/gCL0k9CWOwYMvuwXRUkrXJrL5W
8q9f4oM/QNRoF0Viw6R/uMx/+IoYF1qFFVaprl5dAVHvty4HLGilE8cP4yP4cdVgblPHN1nIrfAc
3Df5LecYTk9+OruotQ79LbwSu0pVVGR+Yv38C/AXfGTmRueFAjhx3fpW2KvuSMDdUfmiLC9hIOP8
FqLC/jgaZ/pIl0o0n9fhnuyvOh03po0b1wbKEU//m19VUwKzCPatsY92MdTGhmtdpAVdZ2QEq+vo
DE4=
=Z0tU
-----END PGP SIGNATURE-----

--------------kRdkj4H0mvYrpls000WLvN9H--
