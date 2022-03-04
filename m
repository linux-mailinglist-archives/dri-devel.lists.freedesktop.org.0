Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 464A44CDDB1
	for <lists+dri-devel@lfdr.de>; Fri,  4 Mar 2022 21:00:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F0431134F1;
	Fri,  4 Mar 2022 20:00:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5495B1134F0
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Mar 2022 20:00:24 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 7CA1B21129;
 Fri,  4 Mar 2022 20:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1646424022; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2SG4NM4EVrSS3exMfsZrC7gWoyjIGrnlFGBQMDfIamY=;
 b=Jd9EyHzq5QAYWn3c4QnQ5glYw7TicrR1pYGl0FNMyYjwHRK61JGK96cZTE6sgEluHUOXp4
 v8CzYJk/YLqYFFEArxqT4MBAJKcj+N+Kmm2Pe/N9X9uXR7M5UOXGr5a+gMljQDXt+hq1go
 lmbk1zPBxMov5fgHjWhyq/cTxFCFSBo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1646424022;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2SG4NM4EVrSS3exMfsZrC7gWoyjIGrnlFGBQMDfIamY=;
 b=Ilf7bd059vX8aWwcu1Y0LM1FCnaQg35LPVANN5CcFkQNtEipjG35plXZ88U2a3DEHiJEYs
 Jh1WqziBgNXz8TCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1785C13B74;
 Fri,  4 Mar 2022 20:00:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id /zu3BNZvImJAIwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 04 Mar 2022 20:00:22 +0000
Message-ID: <81f87874-4aa8-265d-a0ed-c8a67708a92a@suse.de>
Date: Fri, 4 Mar 2022 21:00:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH] simpldrm: Enable boot time VESA graphic mode selection.
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>,
 =?UTF-8?Q?Michal_Such=c3=a1nek?= <msuchanek@suse.de>
References: <20220218093334.24830-1-msuchanek@suse.de>
 <354f3cfd-bfa0-3ebe-3d67-705423d9294e@suse.de>
 <20220302193846.GT3113@kunlun.suse.cz>
 <2ba8497f-ba6d-558b-d782-bb3ee67d23ec@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <2ba8497f-ba6d-558b-d782-bb3ee67d23ec@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------9YQkqF7dRSWVmMuP7AhZgAw4"
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
Cc: linux-fbdev@vger.kernel.org, Dave Hansen <dave.hansen@linux.intel.com>,
 Arnd Bergmann <arnd@arndb.de>, David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>,
 x86@kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-video@atrey.karlin.mff.cuni.cz, Borislav Petkov <bp@alien8.de>,
 Maxime Ripard <maxime@cerno.tech>, "H. Peter Anvin" <hpa@zytor.com>,
 Martin Mares <mj@ucw.cz>, Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Sam Ravnborg <sam@ravnborg.org>, Ingo Molnar <mingo@redhat.com>,
 Daniel Mack <daniel@zonque.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------9YQkqF7dRSWVmMuP7AhZgAw4
Content-Type: multipart/mixed; boundary="------------isOeU2gFLokjvcP9fJJxe08j";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>,
 =?UTF-8?Q?Michal_Such=c3=a1nek?= <msuchanek@suse.de>
Cc: linux-fbdev@vger.kernel.org, x86@kernel.org, Arnd Bergmann
 <arnd@arndb.de>, David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller
 <deller@gmx.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-video@atrey.karlin.mff.cuni.cz, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Maxime Ripard <maxime@cerno.tech>,
 "H. Peter Anvin" <hpa@zytor.com>, Martin Mares <mj@ucw.cz>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Sam Ravnborg <sam@ravnborg.org>, Daniel Mack <daniel@zonque.org>
Message-ID: <81f87874-4aa8-265d-a0ed-c8a67708a92a@suse.de>
Subject: Re: [PATCH] simpldrm: Enable boot time VESA graphic mode selection.
References: <20220218093334.24830-1-msuchanek@suse.de>
 <354f3cfd-bfa0-3ebe-3d67-705423d9294e@suse.de>
 <20220302193846.GT3113@kunlun.suse.cz>
 <2ba8497f-ba6d-558b-d782-bb3ee67d23ec@redhat.com>
In-Reply-To: <2ba8497f-ba6d-558b-d782-bb3ee67d23ec@redhat.com>

--------------isOeU2gFLokjvcP9fJJxe08j
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGksDQoNCkkndmUgbWVyZ2VkIHRoZSBwYXRjaGVzIGludG8gZHJtLW1pc2MtZml4ZXMuIFRo
YW5rcyBhIGxvdCB0byBib3RoIG9mIHlvdS4NCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0K
QW0gMDIuMDMuMjIgdW0gMjA6NDcgc2NocmllYiBKYXZpZXIgTWFydGluZXogQ2FuaWxsYXM6
DQo+IEhlbGxvLA0KPiANCj4gT24gMy8yLzIyIDIwOjM4LCBNaWNoYWwgU3VjaMOhbmVrIHdy
b3RlOg0KPj4gSGVsbG8sDQo+Pg0KPj4gT24gV2VkLCBNYXIgMDIsIDIwMjIgYXQgMDg6MzE6
MjVQTSArMDEwMCwgVGhvbWFzIFppbW1lcm1hbm4gd3JvdGU6DQo+Pj4gSGksDQo+Pj4NCj4+
PiBpcyB0aGlzIHJlYWR5IHRvIGJlIG1lcmdlZD8NCj4+DQo+PiBUaGUgb2JqZWN0aW9ucyBy
YWlzZWQgc28gZmFyIGhhdmUgYmVlbiBhZGRyZXNzZWQgaW4gdjQuDQo+Pg0KPj4gSSB0aGlu
ayB0aGlzIGlzIGdvb2QgdG8gbWVyZ2UuDQo+Pg0KPiANCj4gVGhlIHY0IHBhdGNoZXMgbG9v
a3MgZ29vZCB0byBtZSBhbmQgaGF2ZSBwcm92aWRlZCBteSBSZXZpZXdlZC1ieSB0byBhbGwg
b2YgdGhlbS4NCj4gICANCj4+IFRoYW5rcw0KPj4NCj4+IE1pY2hhbA0KPj4NCj4+Pg0KDQot
LSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNF
IFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIuIDUsIDkwNDA5
IE7DvHJuYmVyZywgR2VybWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KR2VzY2jD
pGZ0c2bDvGhyZXI6IEl2byBUb3Rldg0K

--------------isOeU2gFLokjvcP9fJJxe08j--

--------------9YQkqF7dRSWVmMuP7AhZgAw4
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmIib9UFAwAAAAAACgkQlh/E3EQov+Bz
cxAAuToEBb/XS3yHnuR6bd6s5rHKDeUZujJnQKLo1eN+UuJoEgw9rvfVzEhDHyqUHw63wZx8jU71
754UtF5AXu5N71HoeJ9dqFV/hoM5F+g2KJyHhosT97+LhFTQaCauzouK0iGJFIric1/T0O9h1/MM
odHcor3nfcrf5fhNmqauqNNkpj9QEdj6IJ8B5Ki3Bc/LzipgoErN6MhDYQIiSGH8jTjmk3vW3b7J
ur1jTCOaVAMTMmuoPqsPwZMqKGwWKqW1aVb2Sr+w6ikUmsjEyTJw/wxX5M0tDJ2z/5h39cXQs7Pv
bs2do3S3mVIpt5vO+ZLso1l/Yo9NaJt8louon1uwC09I1Wm/cQdnuEyoICpaDiYMcvHtytkwtpbN
c64GcwNbbp1bK6+kmXMCeBiFYo+YtDaOE1XwgO+gc6v2t+p8WOQGt/gaUBNGwOOxy+hhVLhdf4FW
YQ67IQnerCUk/432vjiKwVPdrw9mgApeEK34HjHy2IWl1TKx+oigOvSIbLsBeXqMC65nDuqIrgse
gmZRKM/2L9joWrZu7bOD9omMTHGWdC5VATbQmqSTEHwSEeCYkFTznNrNubrh6gaWOmIRWaKng+2f
9W6TtfetZ2+Gw12/Prjp4PWoTyYK8Xt8VOrSnOVmv/Gc37YAIONDVIH3ESXV/ho0y84yyhjhw0Iw
nNw=
=qzB5
-----END PGP SIGNATURE-----

--------------9YQkqF7dRSWVmMuP7AhZgAw4--
