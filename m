Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C1232462E8F
	for <lists+dri-devel@lfdr.de>; Tue, 30 Nov 2021 09:31:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6A306E486;
	Tue, 30 Nov 2021 08:31:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AFF46E486
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 08:31:43 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 7106B21763;
 Tue, 30 Nov 2021 08:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1638261101; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HVh/XuOleLbNSL1OBcamrsGmZpYGUTHL+VT/XNi/jd0=;
 b=hFJk+NoISirKhIO0NYHWRKhQbCzDqjTlmGbdWJnnqEwGsXFT/sCwuYl9WzeHgmQCcSKin7
 3MhrNI7SPBBOPROLPHGKHrxiNrHgGEuwO0dTKkGQpPFeHj9rvZ6IEz0tVW30e1xXlAITD0
 cvBM/BCcXxki+e8M4CWbvOXAyWnPVrU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1638261101;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HVh/XuOleLbNSL1OBcamrsGmZpYGUTHL+VT/XNi/jd0=;
 b=QpFq+RWSwwQMTwXUIenkIGLgnAuFmVG1J/BjTvsqe2v79HDxzpqg7TLz8gXyl/ilpIP8HQ
 UC4AK8b4eeql2MDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 466D913C6E;
 Tue, 30 Nov 2021 08:31:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id +vktEG3hpWFlegAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 30 Nov 2021 08:31:41 +0000
Message-ID: <9315c6f5-48f6-4f29-1e31-87ab5ed771b5@suse.de>
Date: Tue, 30 Nov 2021 09:31:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH 1/3] drm/simpledrm: Bind to OF framebuffers in /chosen
Content-Language: en-US
To: Javier Martinez Canillas <javier@dowhile0.org>,
 Rob Herring <robh+dt@kernel.org>
References: <20211117145829.204360-1-marcan@marcan.st>
 <20211117145829.204360-2-marcan@marcan.st>
 <f3582c00-925d-91ec-c829-0aaa8f0157c0@suse.de>
 <36f3cf18-6654-e1bf-1fa6-a5797751ee86@marcan.st>
 <CAL_JsqLd=NrZgkTw+N2+Ka4zqRVpZMRNSisUDV9MhBQA-0TZQg@mail.gmail.com>
 <CABxcv=mkuJLrXr_nbELg39qJvUvV2y69FAisFKURR9bqa3FzKg@mail.gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <CABxcv=mkuJLrXr_nbELg39qJvUvV2y69FAisFKURR9bqa3FzKg@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------KbLmPxxfGOWwTMxFKEV0Vlcc"
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
Cc: David Airlie <airlied@linux.ie>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Hector Martin <marcan@marcan.st>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------KbLmPxxfGOWwTMxFKEV0Vlcc
Content-Type: multipart/mixed; boundary="------------6adlezqjbPb4jwaHRY9VY0zr";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javier@dowhile0.org>,
 Rob Herring <robh+dt@kernel.org>
Cc: Hector Martin <marcan@marcan.st>, David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>
Message-ID: <9315c6f5-48f6-4f29-1e31-87ab5ed771b5@suse.de>
Subject: Re: [PATCH 1/3] drm/simpledrm: Bind to OF framebuffers in /chosen
References: <20211117145829.204360-1-marcan@marcan.st>
 <20211117145829.204360-2-marcan@marcan.st>
 <f3582c00-925d-91ec-c829-0aaa8f0157c0@suse.de>
 <36f3cf18-6654-e1bf-1fa6-a5797751ee86@marcan.st>
 <CAL_JsqLd=NrZgkTw+N2+Ka4zqRVpZMRNSisUDV9MhBQA-0TZQg@mail.gmail.com>
 <CABxcv=mkuJLrXr_nbELg39qJvUvV2y69FAisFKURR9bqa3FzKg@mail.gmail.com>
In-Reply-To: <CABxcv=mkuJLrXr_nbELg39qJvUvV2y69FAisFKURR9bqa3FzKg@mail.gmail.com>

--------------6adlezqjbPb4jwaHRY9VY0zr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMzAuMTEuMjEgdW0gMDc6NDQgc2NocmllYiBKYXZpZXIgTWFydGluZXogQ2Fu
aWxsYXM6DQo+Pj4+DQo+Pj4+IFNpbXBsZWRybSBpcyBqdXN0IGEgZHJpdmVyLCBidXQgdGhp
cyBpcyBwbGF0Zm9ybSBzZXR1cCBjb2RlLiBXaHkgaXMgdGhpcw0KPj4+PiBjb2RlIGxvY2F0
ZWQgaGVyZSBhbmQgbm90IHVuZGVyIGFyY2gvIG9yIGRyaXZlcnMvZmlybXdhcmUvPw0KPj4+
Pg0KPiANCj4gQWdyZWVkLiBDcmVhdGluZyBwbGF0Zm9ybSBkZXZpY2VzIGlzIHNvbWV0aGlu
ZyBmb3IgcGxhdGZvcm0gY29kZSBhbmQNCj4gbm90IHJlYWxseSBhIERSTSBkcml2ZXIuDQo+
IA0KPj4+PiBJIGtub3cgdGhhdCBvdGhlciBkcml2ZXJzIGRvIHNpbWlsYXIgdGhpbmdzLCBp
dCBkb2Vzbid0IHNlZW0gdG8gYmVsb25nIGhlcmUuDQo+Pj4NCj4gDQo+IFllYWgsIHRoZSBz
aW1wbGVmYiBkcml2ZXIgZG9lcyB0aGlzIGJ1dCB0aGF0IHNlZW1zIGxpa2Ugc29tZXRoaW5n
IHRoYXQNCj4gc2hvdWxkIGJlIGNoYW5nZWQuDQo+IA0KPj4+IFRoaXMgZGVmaW5pdGVseSBk
b2Vzbid0IGJlbG9uZyBpbiBlaXRoZXIgb2YgdGhvc2UsIHNpbmNlIGl0IGlzIG5vdCBhcmNo
LQ0KPj4+IG9yIGZpcm13YXJlLXNwZWNpZmljLiBJdCBpcyBpbXBsZW1lbnRpbmcgc3VwcG9y
dCBmb3IgdGhlIHN0YW5kYXJkDQo+Pj4gc2ltcGxlLWZyYW1lYnVmZmVyIE9GIGJpbmRpbmcs
IHdoaWNoIHNwZWNpZmllcyB0aGF0IGl0IG11c3QgYmUgbG9jYXRlZA0KPj4+IHdpdGhpbiB0
aGUgL2Nob3NlbiBub2RlIChhbmQgdGh1cyB0aGUgZGVmYXVsdCBPRiBzZXR1cCBjb2RlIHdv
bid0IGRvIHRoZQ0KPj4+IG1hdGNoaW5nIGZvciB5b3UpOyB0aGlzIGFwcGxpZXMgdG8gYWxs
IE9GIHBsYXRmb3JtcyBbMV0NCj4+Pg0KPj4+IEFkZGluZyBSb2I7IGRvIHlvdSB0aGluayB0
aGlzIHNob3VsZCBtb3ZlIGZyb20gc2ltcGxlZmIvc2ltcGxlZHJtIHRvDQo+Pj4gY29tbW9u
IE9GIGNvZGU/ICh3aGVyZT8pDQo+Pg0KPj4gb2ZfcGxhdGZvcm1fZGVmYXVsdF9wb3B1bGF0
ZV9pbml0KCkgc2hvdWxkIHdvcmsuDQo+IA0KPiBUaGF0IHNob3VsZCB3b3JrIGJ1dCBJIHN0
aWxsIHdvbmRlciBpZiBpdCBpcyB0aGUgY29ycmVjdCBwbGFjZSB0byBhZGQNCj4gdGhpcyBs
b2dpYy4NCj4gDQo+IEkgdGhpbmsgdGhhdCBpbnN0ZWFkIGl0IGNvdWxkIGJlIGRvbmUgaW4g
dGhlIHN5c2ZiX2NyZWF0ZV9zaW1wbGVmYigpDQo+IGZ1bmN0aW9uIFswXSwgd2hpY2ggYWxy
ZWFkeSBjcmVhdGVzIHRoZSAic2ltcGxlLWZyYW1lYnVmZmVyIiBkZXZpY2UNCj4gZm9yIHg4
NiBsZWdhY3kgQklPUyBhbmQgeDg2L2FybTY0L3Jpc2N2IEVGSSBzbyBpdCBtYWtlcyBzZW5z
ZSB0byBkbw0KPiB0aGUgc2FtZSBmb3IgT0YuIFRoYXQgd2F5IHRoZSBzaW1wbGVmYiBwbGF0
Zm9ybSBkZXZpY2UgcmVnaXN0cmF0aW9uDQo+IGNvZGUgY291bGQgYWxzbyBiZSBkcm9wcGVk
IGZyb20gdGhlIGRyaXZlciBhbmQgdXNlcnMgd291bGQganVzdCBuZWVkDQo+IHRvIGVuYWJs
ZSBDT05GSUdfU1lTRkIgYW5kIENPTkZJR19TWVNGQl9TSU1QTEVGQiB0byBoYXZlIHRoZSBz
YW1lLg0KPiANCj4gSSBoYXZlIGEgY291cGxlIG9mIGJvYXJkcyB3aXRoIGEgYm9vdGxvYWRl
ciB0aGF0IHBvcHVsYXRlcyBhDQo+ICJzaW1wbGUtZnJhbWVidWZmZXIiIGluIHRoZSAvY2hv
c2VuIG5vZGUgc28gSSBjb3VsZCBhdHRlbXB0IHRvIHdyaXRlDQo+IHRoZSBwYXRjaGVzLiBC
dXQgcHJvYmFibHkgd29uJ3QgaGFwcGVuIHVudGlsIG5leHQgd2Vlay4NCg0KSU1ITyBpdCdz
IGJldHRlciB0byBrZWVwIHRoZSBPRi1yZWxhdGVkIHNldHVwIGluIHRoZSBPRiBjb2RlLiBU
aGUgc3lzZmIgDQpjb2RlIGlzIGZvciBzY3JlZW5faW5mby4gV2UgY2FuIHRyeSB0byBmaW5k
IGNvbW1vbiBjb2RlIGZvciBPRiBhbmQgc3lzZmIgDQp0aGF0IHRoZW4gbGl2ZXMgaW4gYSBz
aGFyZWQgbG9jYXRpb24uDQoNClVzaW5nIGEgc2luZ2xlIGdsb2JhbCBzY3JlZW5faW5mbyB2
YXJpYWJsZSBpcyBzb21ld2hhdCBhd2t3YXJkIHRoZXNlIA0KZGF5cy4gSW4gdGhlIGxvbmcg
dGVybSwgSSBjYW4gdGhpbmsgb2YgcHVzaGluZyBzeXNmYiBjb2RlIGludG8gDQphcmNoaXRl
Y3R1cmVzLiBFYWNoIGFyY2hpdGVjdHVyZSB3b3VsZCB0aGVuIHNldHVwIHRoZSBwbGF0Zm9y
bSBkZXZpY2VzIA0KdGhhdCBpdCBzdXBwb3J0cy4gQnV0IHRoYXQncyBub3QgcmVhbGx5IGlt
cG9ydGFudCByaWdodCBub3cuDQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCj4gDQo+IFsw
XTogaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvdjUuMTYtcmMzL3NvdXJjZS9k
cml2ZXJzL2Zpcm13YXJlL3N5c2ZiX3NpbXBsZWZiLmMjTDYwDQo+IA0KPiBCZXN0IHJlZ2Fy
ZHMsDQo+IEphdmllcg0KPiANCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3Mg
RHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJI
DQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDks
IEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCg==

--------------6adlezqjbPb4jwaHRY9VY0zr--

--------------KbLmPxxfGOWwTMxFKEV0Vlcc
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmGl4WwFAwAAAAAACgkQlh/E3EQov+C1
2xAAi/x+Sa890DYEMNr0oe+sDQMPAFO/ZiPisZIoMsvi6kYtwcjA6yX/9z6hVnWRZg9ggh30R6s2
xcGIdnhXAgyon7gWPuXOyz4eKO1MLzJ+a70OFkxpg+e3CXMh5s+P70JjsxBb31LL7NQtygReZ/b2
I98KITzgLS+0WKffjzzsLDfCfBgmb0pqwaWeT0BAmL06Kq8JJKcacqREDUqmAKrqQIlfFU2NL9/L
n4awSkmo69SyErdmpo8jQcPQQti/bd5SabYHsryU+nhDNhobXCTxO0e8GZOQEQRe5tbKILkZom4c
UCnKBeYDXY4454lcS7vbgKTLPHo+tqyQDxL8TtAjCkT0Vf773P0XfENzUza3v5aPfAX6DQv1TAAz
ksgb1QyAEIe6xuzvMSVJ113R53Z5KRUiHF2Vg0FqsZS+DZkbNssQ36bR1sob9XPAM6nB+B2EikYP
0929ZTwIJCZndq6/rJT1R07c0lPu5cw90rP6Lcl4dbVQ3E5z1I9tc7tlodQridX2c6jyNioG27oL
tiYof5vwMNcnUemJFBrgEkyT5VRFBFdVyjO2FH7DV0hgHgwXhDrApu5cZ7s+5x/AbRkR1eBMDK8p
bCM+I/3CieHjm3Kp24GM+f9gJydzlCsvVQnmDRzJca/nrXIlaEZFpgMKsaCgHgyaN2YiBxm/yTPE
JoA=
=0WdY
-----END PGP SIGNATURE-----

--------------KbLmPxxfGOWwTMxFKEV0Vlcc--
