Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 352F6745673
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jul 2023 09:53:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3416410E151;
	Mon,  3 Jul 2023 07:53:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87EF710E151
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jul 2023 07:52:59 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A88851F8AC;
 Mon,  3 Jul 2023 07:52:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1688370777; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tjcTbVMiizpIZqZCmtNiu9ZgGpYWuGwMKK6QoxAyIHI=;
 b=Rb6SDZNjtzfNnEwmU+phWSNKsCG5UJ1NpH+iv3U320xZ83f4wLg1IxyRlyv2PUIEFuYwEu
 +CXyomUTPHWf7HtTsN0+tOVpfQiX1pBsGF0Nps3rn/VNp6cmmB8QH+Se8Pl9utKw/ru+Ql
 tCzXcgyogVCDFSs7RPz2lZndFinkJGA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1688370777;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tjcTbVMiizpIZqZCmtNiu9ZgGpYWuGwMKK6QoxAyIHI=;
 b=feRAQGHaFNLITnlZ4yYTz/w1bzqwQEhInSKWyfUZL9n0OZVn0ODC0KGsFI9NmLsEF0wAKL
 H/VA5pWibPyliGDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 52EF5138FC;
 Mon,  3 Jul 2023 07:52:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id jJxXE1l+omRiYAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 03 Jul 2023 07:52:57 +0000
Message-ID: <04fa72f3-d6ca-bd68-7ed9-57151c1877df@suse.de>
Date: Mon, 3 Jul 2023 09:52:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 1/2] fbdev: Split frame buffer support in FB and
 FB_CORE symbols
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org
References: <20230701214503.550549-1-javierm@redhat.com>
 <20230701214503.550549-2-javierm@redhat.com>
 <e83eab26-a8fe-b151-6bd4-7a7db6ceee1f@suse.de>
 <873525e8tb.fsf@minerva.mail-host-address-is-not-set>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <873525e8tb.fsf@minerva.mail-host-address-is-not-set>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------oXvTJlmCdi1BeUtnw2N9740V"
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
Cc: linux-fbdev@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>,
 Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Helge Deller <deller@gmx.de>, x86@kernel.org, dri-devel@lists.freedesktop.org,
 Dave Hansen <dave.hansen@linux.intel.com>, Ingo Molnar <mingo@redhat.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, "H. Peter Anvin" <hpa@zytor.com>,
 Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------oXvTJlmCdi1BeUtnw2N9740V
Content-Type: multipart/mixed; boundary="------------yEVrolPn78GGGYeuop5R7PJg";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org
Cc: linux-fbdev@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>,
 Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller
 <deller@gmx.de>, x86@kernel.org, dri-devel@lists.freedesktop.org,
 Geert Uytterhoeven <geert@linux-m68k.org>, Ingo Molnar <mingo@redhat.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Sam Ravnborg <sam@ravnborg.org>
Message-ID: <04fa72f3-d6ca-bd68-7ed9-57151c1877df@suse.de>
Subject: Re: [PATCH v2 1/2] fbdev: Split frame buffer support in FB and
 FB_CORE symbols
References: <20230701214503.550549-1-javierm@redhat.com>
 <20230701214503.550549-2-javierm@redhat.com>
 <e83eab26-a8fe-b151-6bd4-7a7db6ceee1f@suse.de>
 <873525e8tb.fsf@minerva.mail-host-address-is-not-set>
In-Reply-To: <873525e8tb.fsf@minerva.mail-host-address-is-not-set>

--------------yEVrolPn78GGGYeuop5R7PJg
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDMuMDcuMjMgdW0gMDk6NDYgc2NocmllYiBKYXZpZXIgTWFydGluZXogQ2Fu
aWxsYXM6DQo+IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPiB3cml0
ZXM6DQo+IA0KPiBIZWxsbyBUaG9tYXMsDQo+IA0KPiBUaGFua3MgZm9yIHlvdXIgcmV2aWV3
Lg0KPiANCj4+IEhpDQo+Pg0KPj4gQW0gMDEuMDcuMjMgdW0gMjM6NDQgc2NocmllYiBKYXZp
ZXIgTWFydGluZXogQ2FuaWxsYXM6DQo+IA0KPiBbLi4uXQ0KPiANCj4+PiAgICANCj4+PiAr
bWVudWNvbmZpZyBGQl9DT1JFDQo+Pj4gKwl0cmlzdGF0ZSAiQ29yZSBzdXBwb3J0IGZvciBm
cmFtZSBidWZmZXIgZGV2aWNlcyINCj4+DQo+PiBXaXRoIHRoZSB0ZXh0LCB0aGlzIGlzIHZp
c2libGU7IGFzIG90aGVycyBub3RlZC4NCj4+DQo+IA0KPiBZZXMsIEkgbWlzcmVtZW1iZXJl
ZCB3aGF0IG1hZGUgYSBLY29uZmlnIHN5bWJvbCBub24tdmlzaWJsZSwgYW5kIHRob3VnaHQN
Cj4gdGhhdCB3YXMganVzdCB0aGUgbGFjayBvZiBhIGhlbHAgc2VjdGlvbiBidXQgZm9yZ290
IHRvIHJlbW92ZSB0aGUgcHJvbXB0Lg0KPiANCj4gVGhpcyBpcyBhbHJlYWR5IGZpeGVkIGlu
IHYzLg0KPiANCj4+PiArDQo+Pj4gICAgbWVudWNvbmZpZyBGQg0KPj4+IC0JdHJpc3RhdGUg
IlN1cHBvcnQgZm9yIGZyYW1lIGJ1ZmZlciBkZXZpY2VzIg0KPj4+ICsJdHJpc3RhdGUgIlN1
cHBvcnQgZm9yIGZyYW1lIGJ1ZmZlciBkZXZpY2UgZHJpdmVycyINCj4+DQo+PiBKdXN0IGtl
ZXAgdGhlIHRleHQgYXMtaXMuDQo+Pg0KPiANCj4gSSBkaXNhZ3JlZS4gQmVjYXVzZSB3ZSBh
cmUgc2xpZ2h0bHkgY2hhbmdpbmcgdGhlIEtjb25maWcgc3ltYm9sIHNlbWFudGljcw0KPiBo
ZXJlLCBmb3IgaW5zdGFuY2UgQ09ORklHX0ZCX0NPUkUgKyBDT05GSUdfRFJNX0ZCREVWX0VN
VUxBVElPTiB3aWxsIGFsc28NCj4gcHJvdmlkZSBhIGZyYW1lIGJ1ZmZlciBkZXZpY2UgKGFu
ZCB3aXRoIENPTkZJR19GQl9ERVZJQ0UsIHdpbGwgYmUgZXhwb3NlZA0KPiB0byB1c2VyLXNw
YWNlIGFzIGEgL2Rldi9mYj8gZGV2aWNlKS4NCj4gDQo+IFNvIG5vdyBDT05GSUdfRkIgaXMg
cmVhbGx5IGFib3V0IGFsbG93aW5nIHRoZSBuYXRpdmUgZmJkZXYgZHJpdmVycyB0byBiZQ0K
PiBlbmFibGVkLiBUaGF0J3Mgd2h5IEknbSBjaGFuZ2luZyB0aGUgcHJvbXB0IHRleHQgdG8g
bWFrZSB0aGF0IG1vcmUgY2xlYXIuDQo+IA0KPiBbLi4uXQ0KPiANCj4+PiAgICBjb25maWcg
RkJfREVWSUNFDQo+Pj4gICAgCWJvb2wgIlByb3ZpZGUgbGVnYWN5IC9kZXYvZmIqIGRldmlj
ZSINCj4+PiAtCWRlcGVuZHMgb24gRkINCj4+PiArCXNlbGVjdCBGQl9DT1JFDQo+Pg0KPj4g
VGhpcyBzaG91bGQgZGVwZW5kIG9uIEZCX0NPUkUuDQo+Pg0KPiANCj4gWWVzLCBhbHJlYWR5
IGZpeGVkIGluIHYzIHRvby4gSSBkaWQgYSBzZWxlY3QgdG8gcHJldmVudCBzeW1ib2wgY2ly
Y3VsYXINCj4gZGVwZW5kZW5jaWVzIGJ1dCBkb2luZyB0aGF0IGxlYWQgdG8gQ09ORklHX0ZC
X0NPUkU9eSBldmVuIGlmIENPTkZJR19EUk0NCj4gd2FzIHNldCBhcyBhIG1vZHVsZS4NCj4g
DQo+IEJ1dCB3aXRoIHRoZSAic2VsZWN0IEZCX0NPUkUgaWYgRFJNX0ZCREVWX0VNVUxBVElP
TiIgaW4gdGhlIERSTSBzeW1ib2wgYXMNCj4gQXJuZCBzdWdnZXN0ZWQsIEkgd2FzIGFibGUg
dG8gaGF2ZSBGQl9ERVZJQ0UgdG8gZGVwZW5kIG9uIEZCX0NPUkUgYWdhaW4uDQoNCkJUVywg
d2hlcmUgZG9lcyB0aGlzIGl0ZW0gbm93IHNob3cgdXAgaW4gdGhlIG1lbnU/IEl0IHVzZWQg
dG8gYmUgaW4gdGhlIA0KZnJhbWVidWZmZXIgbWVudS4gSXQncyBub3cgaW4gdGhlIGdyYXBo
aWNzLWRyaXZlcnMgbWVudT8NCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KPiANCj4+IEJl
c3QgcmVnYXJkcw0KPj4gVGhvbWFzDQo+Pg0KPiANCg0KLS0gDQpUaG9tYXMgWmltbWVybWFu
bg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMg
R2VybWFueSBHbWJIDQpGcmFua2Vuc3RyYXNzZSAxNDYsIDkwNDYxIE51ZXJuYmVyZywgR2Vy
bWFueQ0KR0Y6IEl2byBUb3RldiwgQW5kcmV3IE15ZXJzLCBBbmRyZXcgTWNEb25hbGQsIEJv
dWRpZW4gTW9lcm1hbg0KSFJCIDM2ODA5IChBRyBOdWVybmJlcmcpDQo=

--------------yEVrolPn78GGGYeuop5R7PJg--

--------------oXvTJlmCdi1BeUtnw2N9740V
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmSiflgFAwAAAAAACgkQlh/E3EQov+Cy
sA//blrF7Js6UhybXcDbcr02zUs8GiFhjqXj7fRsC2p2RT9vh1II2OnTe31NUZypvaQeCguFRHOD
D90MxIIi4w86JMqvJVuEr/PJT3TaMI03pFvY4FNj8/5Or/RPqoO18MLN4hA0jhcrM4/7Fw0VyxaK
CVgtukCYY8fcn0p/ih8dLQFOoqOCjneSDpUJllIxZuza1Gl0cLkR72Pb1w8VF3kh3s0H9CohHQFI
Hj0z4LWdETOolJbUkENAhrojOjMugn223SYBSMO6t3K97tM0Y7XWW2DaY1pYGmj5h0dH/NjsNCpp
0qNFiaWgidN83UN4jfmryNXl+pVEIh+1ND9dyjzujZv0d2N34TEccjuq2Lydd/njmloVRikdKtb5
nB3aT9i+TfQqbZ2+xnNvbrRjHIuMbOw2GPKUqh8HeCjuUb4e79fbiQTtuE3o1MCk6eio/1IOSe1g
LAKfDJWsi36J1wbejjTonNqoJZh1MIlnGrBJhlRvvxurtitjCub8HPAwTHI93a/zhqipz3JPfI87
eqdsJzidTfhloOFrbXq1S1Aj9iveQtmczuSdoxj+KrgLnSRKzVQ6E7a1fTUSdpFxAongaWGoJxXm
fZg4ceau2Pf2dImih2+PlaG+/TUu32QHp58iuzbaeJ1jUQJhy39ufY5ZNWGLRU05TJ29QLA3h4Qj
Wuw=
=t5iO
-----END PGP SIGNATURE-----

--------------oXvTJlmCdi1BeUtnw2N9740V--
