Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DB0A723AEE
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jun 2023 10:05:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64E8410E2DA;
	Tue,  6 Jun 2023 08:05:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A25E210E2D8
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jun 2023 08:05:31 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 2A6AF1FD63;
 Tue,  6 Jun 2023 08:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1686038730; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XndozJCgoZNXI3aAYUD133YM+XIBF5aNLUt6SIsorvY=;
 b=QVKNx4V6ee3EJzbcqWn5MCRpWpFNmUpKkIRvdfq2Ov7CdaMShfwOLe6RH/IGh3Advikykk
 13++0bSs/UuPnDl27jQ0H/Niu0FI/69HIQ9v9j9GK6eH3U3nXWm7eVOFGYRSJDY78X4VlQ
 HmDe1nW27S4DsdycXlVwBxmEJ2Hbm6Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1686038730;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XndozJCgoZNXI3aAYUD133YM+XIBF5aNLUt6SIsorvY=;
 b=1FCBJ8lyuOx0Tc1/0eX+hg63jCXor0WJUBn9NE7s5AjFvuPnYUM07axxo7GwXLpv9iO/iS
 cjsuop8KteAu3zAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C9DEF13519;
 Tue,  6 Jun 2023 08:05:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id RNM3MMnofmSTIwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 06 Jun 2023 08:05:29 +0000
Message-ID: <37860c28-8b9b-448f-98d3-80ad427d1315@suse.de>
Date: Tue, 6 Jun 2023 10:05:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH 02/30] backlight/gpio_backlight: Compare against struct
 fb_info.device
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@linaro.org>
References: <20230605144812.15241-1-tzimmermann@suse.de>
 <20230605144812.15241-3-tzimmermann@suse.de>
 <IA1PR11MB641847841A33FE16F9B96BA7C14DA@IA1PR11MB6418.namprd11.prod.outlook.com>
 <7d4e340c-e20a-5824-4d59-b93bc1ba4153@suse.de>
 <9ed217b1-3a05-4daf-9e6f-52453a8b5f3e@kadam.mountain>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <9ed217b1-3a05-4daf-9e6f-52453a8b5f3e@kadam.mountain>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------FT645muoP4UYsk8x6zGzU9g1"
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
Cc: "daniel.thompson@linaro.org" <daniel.thompson@linaro.org>,
 Rich Felker <dalias@libc.org>,
 "geert+renesas@glider.be" <geert+renesas@glider.be>,
 "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>,
 "jingoohan1@gmail.com" <jingoohan1@gmail.com>, "deller@gmx.de" <deller@gmx.de>,
 "lee@kernel.org" <lee@kernel.org>,
 "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
 "javierm@redhat.com" <javierm@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>, "Ruhl,
 Michael J" <michael.j.ruhl@intel.com>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 "sam@ravnborg.org" <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------FT645muoP4UYsk8x6zGzU9g1
Content-Type: multipart/mixed; boundary="------------eqU8fPQ0Xbx8jOyzxNNlYeqm";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: "Ruhl, Michael J" <michael.j.ruhl@intel.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "javierm@redhat.com"
 <javierm@redhat.com>, "sam@ravnborg.org" <sam@ravnborg.org>,
 "deller@gmx.de" <deller@gmx.de>,
 "geert+renesas@glider.be" <geert+renesas@glider.be>,
 "lee@kernel.org" <lee@kernel.org>,
 "daniel.thompson@linaro.org" <daniel.thompson@linaro.org>,
 "jingoohan1@gmail.com" <jingoohan1@gmail.com>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 Rich Felker <dalias@libc.org>,
 "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>,
 "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>
Message-ID: <37860c28-8b9b-448f-98d3-80ad427d1315@suse.de>
Subject: Re: [PATCH 02/30] backlight/gpio_backlight: Compare against struct
 fb_info.device
References: <20230605144812.15241-1-tzimmermann@suse.de>
 <20230605144812.15241-3-tzimmermann@suse.de>
 <IA1PR11MB641847841A33FE16F9B96BA7C14DA@IA1PR11MB6418.namprd11.prod.outlook.com>
 <7d4e340c-e20a-5824-4d59-b93bc1ba4153@suse.de>
 <9ed217b1-3a05-4daf-9e6f-52453a8b5f3e@kadam.mountain>
In-Reply-To: <9ed217b1-3a05-4daf-9e6f-52453a8b5f3e@kadam.mountain>

--------------eqU8fPQ0Xbx8jOyzxNNlYeqm
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDYuMDYuMjMgdW0gMDk6NDkgc2NocmllYiBEYW4gQ2FycGVudGVyOg0KPiBP
biBUdWUsIEp1biAwNiwgMjAyMyBhdCAwOToyNDo0OEFNICswMjAwLCBUaG9tYXMgWmltbWVy
bWFubiB3cm90ZToNCj4+IEhpDQo+Pg0KPj4gQW0gMDUuMDYuMjMgdW0gMjI6MTkgc2Nocmll
YiBSdWhsLCBNaWNoYWVsIEo6DQo+Pj4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+
Pj4+IEZyb206IGRyaS1kZXZlbCA8ZHJpLWRldmVsLWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnPiBPbiBCZWhhbGYgT2YNCj4+Pj4gVGhvbWFzIFppbW1lcm1hbm4NCj4+Pj4gU2Vu
dDogTW9uZGF5LCBKdW5lIDUsIDIwMjMgMTA6NDggQU0NCj4+Pj4gVG86IGRhbmllbEBmZnds
bC5jaDsgamF2aWVybUByZWRoYXQuY29tOyBzYW1AcmF2bmJvcmcub3JnOw0KPj4+PiBkZWxs
ZXJAZ214LmRlOyBnZWVydCtyZW5lc2FzQGdsaWRlci5iZTsgbGVlQGtlcm5lbC5vcmc7DQo+
Pj4+IGRhbmllbC50aG9tcHNvbkBsaW5hcm8ub3JnOyBqaW5nb29oYW4xQGdtYWlsLmNvbQ0K
Pj4+PiBDYzogbGludXgtZmJkZXZAdmdlci5rZXJuZWwub3JnOyBSaWNoIEZlbGtlciA8ZGFs
aWFzQGxpYmMub3JnPjsgbGludXgtDQo+Pj4+IHNoQHZnZXIua2VybmVsLm9yZzsgbGludXgt
c3RhZ2luZ0BsaXN0cy5saW51eC5kZXY7IGRyaS0NCj4+Pj4gZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnOyBUaG9tYXMgWmltbWVybWFubg0KPj4+PiA8dHppbW1lcm1hbm5Ac3VzZS5k
ZT47IEpvaG4gUGF1bCBBZHJpYW4gR2xhdWJpdHogPGdsYXViaXR6QHBoeXNpay5mdS0NCj4+
Pj4gYmVybGluLmRlPjsgbGludXgtb21hcEB2Z2VyLmtlcm5lbC5vcmcNCj4+Pj4gU3ViamVj
dDogW1BBVENIIDAyLzMwXSBiYWNrbGlnaHQvZ3Bpb19iYWNrbGlnaHQ6IENvbXBhcmUgYWdh
aW5zdCBzdHJ1Y3QNCj4+Pj4gZmJfaW5mby5kZXZpY2UNCj4+Pj4NCj4+Pj4gU3RydWN0IGdw
aW9fYmFja2xpZ2h0X3BsYXRmb3JtX2RhdGEgcmVmZXJzIHRvIGEgcGxhdGZvcm0gZGV2aWNl
IHdpdGhpbg0KPj4+PiB0aGUgTGludXggZGV2aWNlIGhpZXJhcmNoeS4gVGhlIHRlc3QgaW4g
Z3Bpb19iYWNrbGlnaHRfY2hlY2tfZmIoKQ0KPj4+PiBjb21wYXJlcyBpdCBhZ2FpbnN0IHRo
ZSBmYmRldiBkZXZpY2UgaW4gc3RydWN0IGZiX2luZm8uZGV2LCB3aGljaA0KPj4+PiBpcyBk
aWZmZXJlbnQuIEZpeCB0aGUgdGVzdCBieSBjb21wYXJpbmcgdG8gc3RydWN0IGZiX2luZm8u
ZGV2aWNlLg0KPj4+Pg0KPj4+PiBGaXhlcyBhIGJ1ZyBpbiB0aGUgYmFja2xpZ2h0IGRyaXZl
ciBhbmQgcHJlcGFyZXMgZmJkZXYgZm9yIG1ha2luZw0KPj4+PiBzdHJ1Y3QgZmJfaW5mby5k
ZXYgb3B0aW9uYWwuDQo+Pj4NCj4+PiBJIG9ubHkgc2VlIGEgcmVuYW1lIGZyb20gZmJkZXYg
IHRvIGRldi4uLg0KPj4+DQo+Pj4gSXMgdGhlcmUgbWlzc2luZyBjb2RlPw0KPj4NCj4+IEFz
IFNhbSBzYWlkLCB0aGUgY29tcGFyZSBvcGVyYXRpb24gdXNlZCB0aGUgd3JvbmcgZGV2aWNl
IGZyb20gZmJfaW5mby4NCj4+DQo+PiBJIGFsc28gY2hhbmdlZCB0aGUgbmFtaW5nIG9mIGEg
ZmV3IGZpZWxkcyBpbiB0aGVzZSBiYWNrbGlnaHQgZHJpdmVycy4gSQ0KPj4gY291bGQgbW92
ZSB0aGVzZSByZW5hbWVzIGludG8gYSBzZXBhcmF0ZSBwYXRjaCBpZiB0aGF0IG1ha2VzIHRo
aW5ncyBlYXNpZXINCj4+IGZvciByZXZpZXdlcnMuDQo+Pg0KPj4+DQo+Pj4gV291bGQgIGEg
Zml4ZXM6IGJlIHVzZWZ1bD8NCj4+DQo+PiBUaGF0IHdvdWxkIGJlIGNvbW1pdCA4Yjc3MGUz
Yzk4MjQgKCJiYWNrbGlnaHQ6IEFkZCBHUElPLWJhc2VkIGJhY2tsaWdodA0KPj4gZHJpdmVy
IikgZnJvbSAyMDEzLiBNYXliZSBhIGJpdCBvbGQgYWxyZWFkeSwgYnV0IEkgY2FuIHN1cmVs
eSBhZGQgaXQuDQo+IA0KPiBEb24ndCBhZGQgdGhlIEZpeGVzIHRhZyB0byB0aGlzIG9uZSBi
ZWNhdXNlIGl0IGRvZXNuJ3QgZml4IGFueXRoaW5nLCBpdA0KPiBqdXN0IHJlbmFtZXMgc3R1
ZmYuICBUaGUgcmVhbCBmaXggaXMgbGF0ZXI/ICBUbyBiZSBob25lc3QsIGl0IHdhcyBraW5k
DQo+IG9mIGRpZmZpY3VsdCB0byBzZWUgd2hlcmUgdGhlIGFjdHVhbCBmaXggd2FzLg0KPiAN
Cj4gRml4ZXMgdGFncyBmb3Igb2xkIGNvZGUgaXMgZmluZS4uLiAgSSBsaWtlIHRvIGtub3cg
d2h5IGJ1Z3MgYXJlDQo+IGludHJvZHVjZWQuICBXYXMgaXQgYWRkaW5nIGEgZmVhdHVyZSBv
ciBwYXJ0IG9mIGZpeCBmb3Igc29tZXRoaW5nIGVsc2UNCj4gb3IgYSBjbGVhbnVwPw0KDQpZ
b3UncmUgbm90IHRoZSBmaXJzdCB0byBjb21wbGFpbiBhYm91dCB0aGUgcmVuYW1pbmcuIEkn
bGwgc3BsaXQgZWFjaCANCmJhY2tsaWdodCBwYXRjaCBpbnRvIGEgYnVnLWZpeCBhbmQgYSBy
ZW5hbWUgcGF0Y2ggdGhlbi4gVGhlIGJ1Z2ZpeCB3aWxsIA0KZ2V0IHRoZSBGaXhlcyB0YWcu
DQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCj4gDQo+IHJlZ2FyZHMsDQo+IGRhbiBjYXJw
ZW50ZXINCj4gDQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBE
ZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KRnJhbmtl
bnN0cmFzc2UgMTQ2LCA5MDQ2MSBOdWVybmJlcmcsIEdlcm1hbnkNCkdGOiBJdm8gVG90ZXYs
IEFuZHJldyBNeWVycywgQW5kcmV3IE1jRG9uYWxkLCBCb3VkaWVuIE1vZXJtYW4NCkhSQiAz
NjgwOSAoQUcgTnVlcm5iZXJnKQ0K

--------------eqU8fPQ0Xbx8jOyzxNNlYeqm--

--------------FT645muoP4UYsk8x6zGzU9g1
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmR+6MkFAwAAAAAACgkQlh/E3EQov+DU
4xAAkjuOkq4QAb/E99uDAHmtnDEX1Fcy31zIYeV3X7NMCN0d1FVH0F10L9/dlSiULgm0Lm70J/M1
jmTryNBB/aHBj14hQg1AlwxJb8UMtmOVp5/iInDRS1yxVatxYsrJTzkmzQKR3goBhFP7NlGctqwH
CRUlQkVCQQSL78hvwL1iv6D162QnXxCzJqMKLRIyHgPve610jIw/LGLhij5I4vr8r/ReQVcQ9Nt9
qyNPpqzN+aC4ZpOCQqIXAM5s8Yp27P/Gd283dQaDdrZPJPExsh6a+x4fTBzvizSHM4SWBeX/Eggq
0fVgzuSDTnu7IEGAXuXNIbP0TaUsQpgggDboirpLmsFV6IxLtIke2bG7ke884gPn4Dl6n7eG+vQF
JHVZli52cVY2WWu6QQpLLFO9JVxLLBZAJ7ZWQ+Z7jy2U+3D+JIpo1+wQBJ/cDAQSyj1/KjvxAwxp
SxkUhVOs+WAZW/Wk7ck+gtPB3EcWzfuozjZN58zR5DaKEF/0MVEuAMRSrpkCuhBtz4DKe0tXfGx0
iOwUp9dRfcZBr7F0xEUbxIgTI8J0V06APXdCcj9FMUs8S76pG25IT5z6s+7BxP75v2aUux5qC3Nx
rySglS/nku1sGOy5yHZpLt5LNSCbwhryhX90bpPA+EzSMiOPbtFZXWG8xBt68YcI9c8NuIlNjnHm
IRQ=
=2KVc
-----END PGP SIGNATURE-----

--------------FT645muoP4UYsk8x6zGzU9g1--
