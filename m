Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE1FB44C531
	for <lists+dri-devel@lfdr.de>; Wed, 10 Nov 2021 17:39:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AF576EBAC;
	Wed, 10 Nov 2021 16:39:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75CF46EBAC
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Nov 2021 16:39:35 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id F0ADF218B5;
 Wed, 10 Nov 2021 16:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1636562373; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AUg+M4CoLR4vtqm7IzlbWFj3L4sqM4gOnnuSeItB99I=;
 b=AxsVgLDw/3fmcokgvk849LXAT41fqKuw3KXLpBxpokBMUDRMY4Uh4NnkceKjGoY5yXuhE4
 Y/sDUf1GO1OcOuFUL/CJ9mCTUc5HbKCd/60FHNNMvXUdr+98dtAjuvMOYFuj990RDRz9uT
 W2KGhnMbEAaq1RA53kxp8F/oltjISIU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1636562373;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AUg+M4CoLR4vtqm7IzlbWFj3L4sqM4gOnnuSeItB99I=;
 b=Vg5hxQ60mFGAXIzuIWlcFV+MrxJPXC1skwds8PIK0L0FSQIT6XtSueKXUJBq69PAsMk+Hj
 He/mmqVdHnRassBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CEC3413CAF;
 Wed, 10 Nov 2021 16:39:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id EwRxMcX1i2HZCwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 10 Nov 2021 16:39:33 +0000
Message-ID: <d536e7d2-891e-e0a8-6abc-6694987a65f7@suse.de>
Date: Wed, 10 Nov 2021 17:39:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH v1 1/1] drm: Replace kernel.h with the necessary inclusions
Content-Language: en-US
To: Andy Shevchenko <andy.shevchenko@gmail.com>
References: <20211110102423.54282-1-andriy.shevchenko@linux.intel.com>
 <887a15cb-3a3b-4ba2-aa0f-a241e70a19fa@suse.de>
 <CAHp75VdY57xQBLN8vT3RdagQx=4kLx69qAyuzLwqTvNGC2xUbQ@mail.gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <CAHp75VdY57xQBLN8vT3RdagQx=4kLx69qAyuzLwqTvNGC2xUbQ@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------REgMkiT6cA1O34ZXa0ub6E3B"
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
Cc: David Airlie <airlied@linux.ie>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------REgMkiT6cA1O34ZXa0ub6E3B
Content-Type: multipart/mixed; boundary="------------00aJfJ8pyhBdlH0E73oZ2aol";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: David Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Message-ID: <d536e7d2-891e-e0a8-6abc-6694987a65f7@suse.de>
Subject: Re: [PATCH v1 1/1] drm: Replace kernel.h with the necessary
 inclusions
References: <20211110102423.54282-1-andriy.shevchenko@linux.intel.com>
 <887a15cb-3a3b-4ba2-aa0f-a241e70a19fa@suse.de>
 <CAHp75VdY57xQBLN8vT3RdagQx=4kLx69qAyuzLwqTvNGC2xUbQ@mail.gmail.com>
In-Reply-To: <CAHp75VdY57xQBLN8vT3RdagQx=4kLx69qAyuzLwqTvNGC2xUbQ@mail.gmail.com>

--------------00aJfJ8pyhBdlH0E73oZ2aol
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTAuMTEuMjEgdW0gMTc6MzQgc2NocmllYiBBbmR5IFNoZXZjaGVua286DQo+
IE9uIFdlZCwgTm92IDEwLCAyMDIxIGF0IDM6NTUgUE0gVGhvbWFzIFppbW1lcm1hbm4gPHR6
aW1tZXJtYW5uQHN1c2UuZGU+IHdyb3RlOg0KPj4gQW0gMTAuMTEuMjEgdW0gMTE6MjQgc2No
cmllYiBBbmR5IFNoZXZjaGVua286DQo+Pj4gV2hlbiBrZXJuZWwuaCBpcyB1c2VkIGluIHRo
ZSBoZWFkZXJzIGl0IGFkZHMgYSBsb3QgaW50byBkZXBlbmRlbmN5IGhlbGwsDQo+Pj4gZXNw
ZWNpYWxseSB3aGVuIHRoZXJlIGFyZSBjaXJjdWxhciBkZXBlbmRlbmNpZXMgYXJlIGludm9s
dmVkLg0KPj4+DQo+Pj4gUmVwbGFjZSBrZXJuZWwuaCBpbmNsdXNpb24gd2l0aCB0aGUgbGlz
dCBvZiB3aGF0IGlzIHJlYWxseSBiZWluZyB1c2VkLg0KPiANCj4gLi4uDQo+IA0KPj4+ICsj
aW5jbHVkZSA8bGludXgvY29udGFpbmVyX29mLmg+DQo+Pg0KPj4gSSBidWlsdCB0aGlzIHBh
dGNoIG9uIGEgcmVjZW50IGRybS1taXNjLW5leHQsIGJ1dCB0aGVyZSdzIG5vDQo+PiBsaW51
eC9jb250YWluZXJfb2YuaA0KPiANCj4gVGhhbmsgeW91IGZvciB0cnlpbmcuIEl0J3MgaW4g
dGhlIHVwc3RyZWFtLCB3aGVuZXZlciBkcm0tbWlzYy1uZXh0DQo+IHN3aXRjaGVzIHRvIG5l
d2VyL25ld2VzdCB1cHN0cmVhbSBpdCB3aWxsIGJlIHRoZXJlLiBJIGFzc3VtZSBpdCB3aWxs
DQo+IGhhcHBlbiBhZnRlciB2NS4xNi1yYzE/DQoNClllcywgd2UnbGwgY2VydGFpbmx5IGJh
Y2ttZXJnZSBzb29uIGFmdGVyIHJjMSBoYXMgYmVlbiByZWxlYXNlZC4gSWYgSSANCmZvcmdl
dCB0byBhZGQgdGhlIHBhdGNoIHRoZW4sIHBsZWFzZSBzZW5kIGEgcmVtaW5kZXIuDQoNCk9u
Y2UgdGhlIG5lY2Vzc2FyeSBoZWFkZXJzIGFyZSBhdmFpbGFibGUsIHRoZSBwYXRjaCBpcw0K
DQpBY2tlZC1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+DQoN
CkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCj4gDQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4N
CkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdl
cm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55DQoo
SFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8aHJlcjogSXZvIFRvdGV2
DQo=

--------------00aJfJ8pyhBdlH0E73oZ2aol--

--------------REgMkiT6cA1O34ZXa0ub6E3B
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmGL9cUFAwAAAAAACgkQlh/E3EQov+Cq
uxAAyc0PGpudbnl6ZhVU52ZufI2XH6HcN6qvx09htMWkUMbykmYmSfbUo7tbS96zfJhg/veTA4Vd
a/dcnUkCshWQb+i3dm8pOUKFQ+uMw5aT7DnAlg68l3w8UcLUsaMi/fw63CabkbyJ9c9ocFRVSqM9
zsD3qwEZQm2vvkQgJyxLKk57kmP5kf2CMRZU6K0hSsssVEb6t+Jrlpt9b7N6eMQkR6qBbWDYb604
AqMb4Cj6BGUyHN78hZeoL7pkPWa3s6gQw/+33xI9iW/kJVyXlX2oLJcoJ8sBmYEadQJgWs4AFYrD
T+s/mgNa8vy4x3ioqY/5Uogf9IBHxJyYH2a2QMiATVWCyvMVvhs4OxV9spJhZ/0hjI0E4N4ZS6jH
PC8BEWEfooLGkcdjT8pDII3pQ0Ttks2MSaXNLR8qGuWZENV710QPD6zwoZo/PyOmIHpS5Ugqi6ln
+i4zz5NuOsMmBqMXWYFssNAqZQm7lySG2fZsQBQw+v+XpRpigFnOXTJwLYjlbuu+cpLFYKrBQ8Ye
AO35fNW9ijru401SMo4SbXfGBJ44V3Zv4tR+hCGA5HFj/OD+KE7G8tVLHzy3VfpnF7JwMOQlsgns
mI0fLoVVqw1oamEoE+h1Hzu2tCuJBR+czsWIjPuxCUoKMqDPKCrYzPoFFdBRd2NWyI1q8fZbdjFi
um4=
=JgwS
-----END PGP SIGNATURE-----

--------------REgMkiT6cA1O34ZXa0ub6E3B--
