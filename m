Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 91CCD7A92C0
	for <lists+dri-devel@lfdr.de>; Thu, 21 Sep 2023 10:44:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4B6A10E587;
	Thu, 21 Sep 2023 08:44:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D40810E587
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Sep 2023 08:44:07 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 038061FF4A;
 Thu, 21 Sep 2023 08:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1695285846; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=q9zIgA9s/phS/Nqu/3pDBFlZT3PSAPCasnzdZQ61fI4=;
 b=Gp+/LVCjMkul1O75it9Z8S3cIolHoh7n2UD14BVd1R6+0ziAUyxhrcUDSiEUKcBBlAdc7T
 ruUrVUu20YiTiZuJ2TYlefEQHGPG8MCn9lbbpj0yZg5SqofHnH+gnkGEL4FzHDKNdW3uox
 IjA+sntFGeIWoH3OVaPnK8Ec1ePbC+Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1695285846;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=q9zIgA9s/phS/Nqu/3pDBFlZT3PSAPCasnzdZQ61fI4=;
 b=jzQ8YKu6/kc0bEz+3W+lHDRSWqPbLWXooNWf2qtTt9PgqP4VKd8bXPRF0G/1QSu9zerzlM
 goklmO8O6GFtvPDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D8A41134B0;
 Thu, 21 Sep 2023 08:44:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id xAzeM1UCDGVmIAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 21 Sep 2023 08:44:05 +0000
Message-ID: <ab551ded-f8f2-4a75-8b51-a8a0fb9e3349@suse.de>
Date: Thu, 21 Sep 2023 10:44:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/ssd130x: Drop _helper prefix from struct
 drm_*_helper_funcs callbacks
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard <mripard@kernel.org>
References: <20230914195138.1518065-1-javierm@redhat.com>
 <f5620d32-2705-498b-a65c-7dc663340a6d@suse.de>
 <87wmwo3q50.fsf@minerva.mail-host-address-is-not-set>
 <552hpgr7qzbjxuyei3n5m7rsn7ekwbdgzv25oe5vy6qb35gf23@q4etussk5jwl>
 <CAMuHMdUGVgj6V+N865QZaAusqD7O2f1askE544Z4MF0h4zBERg@mail.gmail.com>
 <878r90kk8h.fsf@minerva.mail-host-address-is-not-set>
From: Thomas Zimmermann <tzimmermann@suse.de>
Autocrypt: addr=tzimmermann@suse.de; keydata=
 xsBNBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAHNJ1Rob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPsLAjgQTAQgAOAIb
 AwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftODH
 AAoJEGgNwR1TC3ojx1wH/0hKGWugiqDgLNXLRD/4TfHBEKmxIrmfu9Z5t7vwUKfwhFL6hqvo
 lXPJJKQpQ2z8+X2vZm/slsLn7J1yjrOsoJhKABDi+3QWWSGkaGwRJAdPVVyJMfJRNNNIKwVb
 U6B1BkX2XDKDGffF4TxlOpSQzdtNI/9gleOoUA8+jy8knnDYzjBNOZqLG2FuTdicBXblz0Mf
 vg41gd9kCwYXDnD91rJU8tzylXv03E75NCaTxTM+FBXPmsAVYQ4GYhhgFt8S2UWMoaaABLDe
 7l5FdnLdDEcbmd8uLU2CaG4W2cLrUaI4jz2XbkcPQkqTQ3EB67hYkjiEE6Zy3ggOitiQGcqp
 j//OwE0EWznS4AEIAMYmP4M/V+T5RY5at/g7rUdNsLhWv1APYrh9RQefODYHrNRHUE9eosYb
 T6XMryR9hT8XlGOYRwKWwiQBoWSDiTMo/Xi29jUnn4BXfI2px2DTXwc22LKtLAgTRjP+qbU6
 3Y0xnQN29UGDbYgyyK51DW3H0If2a3JNsheAAK+Xc9baj0LGIc8T9uiEWHBnCH+RdhgATnWW
 GKdDegUR5BkDfDg5O/FISymJBHx2Dyoklv5g4BzkgqTqwmaYzsl8UxZKvbaxq0zbehDda8lv
 hFXodNFMAgTLJlLuDYOGLK2AwbrS3Sp0AEbkpdJBb44qVlGm5bApZouHeJ/+n+7r12+lqdsA
 EQEAAcLAdgQYAQgAIAIbDBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftOH6AAoJEGgNwR1T
 C3ojVSkIALpAPkIJPQoURPb1VWjh34l0HlglmYHvZszJWTXYwavHR8+k6Baa6H7ufXNQtThR
 yIxJrQLW6rV5lm7TjhffEhxVCn37+cg0zZ3j7zIsSS0rx/aMwi6VhFJA5hfn3T0TtrijKP4A
 SAQO9xD1Zk9/61JWk8OysuIh7MXkl0fxbRKWE93XeQBhIJHQfnc+YBLprdnxR446Sh8Wn/2D
 Ya8cavuWf2zrB6cZurs048xe0UbSW5AOSo4V9M0jzYI4nZqTmPxYyXbm30Kvmz0rYVRaitYJ
 4kyYYMhuULvrJDMjZRvaNe52tkKAvMevcGdt38H4KSVXAylqyQOW5zvPc4/sq9c=
In-Reply-To: <878r90kk8h.fsf@minerva.mail-host-address-is-not-set>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------gnaJEnC7xR3fHLvNbEiwFQU3"
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------gnaJEnC7xR3fHLvNbEiwFQU3
Content-Type: multipart/mixed; boundary="------------fJeVOobFUNnvhtAK0N0SFJnS";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard <mripard@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Message-ID: <ab551ded-f8f2-4a75-8b51-a8a0fb9e3349@suse.de>
Subject: Re: [PATCH] drm/ssd130x: Drop _helper prefix from struct
 drm_*_helper_funcs callbacks
References: <20230914195138.1518065-1-javierm@redhat.com>
 <f5620d32-2705-498b-a65c-7dc663340a6d@suse.de>
 <87wmwo3q50.fsf@minerva.mail-host-address-is-not-set>
 <552hpgr7qzbjxuyei3n5m7rsn7ekwbdgzv25oe5vy6qb35gf23@q4etussk5jwl>
 <CAMuHMdUGVgj6V+N865QZaAusqD7O2f1askE544Z4MF0h4zBERg@mail.gmail.com>
 <878r90kk8h.fsf@minerva.mail-host-address-is-not-set>
In-Reply-To: <878r90kk8h.fsf@minerva.mail-host-address-is-not-set>

--------------fJeVOobFUNnvhtAK0N0SFJnS
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjEuMDkuMjMgdW0gMTA6MjMgc2NocmllYiBKYXZpZXIgTWFydGluZXogQ2Fu
aWxsYXM6DQpbLi4uXQ0KPiANCj4gQm90aCBvcHRpb25zIGhhdmUgY29ucyBhbmQgcHJvcyAo
ZS5nOiBxdWlja2x5IGZpZ3VyaW5nIG91dCB0byB3aGF0IHN0cnVjdA0KPiBjYWxsYmFjayBp
cyBhc3NvY2lhdGVkIGFzIHlvdSBzYWlkKSwgYnV0IHRoZSByZWFzb24gSSBwb3N0ZWQgdGhp
cyBwYXRjaCBpcw0KPiB0byBhdHRlbXB0IG1ha2luZyB0aGUgZHJpdmVyIG1vcmUgY29uc2lz
dGVudCB3aXRoIHRoZSByZXN0IG9mIHRoZSBkcml2ZXJzLg0KPiANCj4+IFBlcmhhcHMgdGhl
IHJlYWwgcXVlc3Rpb24gaXMgd2hldGhlciB0aGUgc3RydWN0dXJlcyBzaG91bGQgaGF2ZSAi
aGVscGVyIg0KPj4gaW4gdGhlaXIgbmFtZSBpbiB0aGUgZmlyc3QgcGxhY2U/DQo+Pg0KPiAN
Cj4gSW5kZWVkLiBJIG5ldmVyIGZ1bGx5IHVuZGVyc3Rvb2Qgd2h5IHRoZSBEUk0vS01TIG9i
amVjdHMgY2FsbGJhY2tzIGFyZQ0KPiBzcGxpdCBpbiBkcm1fJG9iamVjdF9mdW5jcyBhbmQg
ZHJtXyRvYmplY3RfaGVscGVyX2Z1bmNzIHN0cnVjdHMuIEFGQUlVDQo+IGlzIGJlY2F1c2Ug
dGhlIGZvcm1lciBpcyB0aGUgbWluaW11bSByZXF1aXJlZCBhbmQgdGhlIGxhdHRlciBpcyB0
byBhZGQNCj4gYWRkaXRpb25hbCBjdXN0b20gYmVoYXZpb3IgPw0KDQpUaGUgZHJtXzxvYmpl
Y3Q+X2Z1bmNzIGlzIGFuIGludGVyZmFjZSB0aGF0IGlzIGJlaW5nIGNhbGxlZCBmcm9tIERS
TSANCnVzZXJzcGFjZS9jbGllbnRzL2lvY3Rscy4gSXQncyB0aGUgaW50ZXJmYWNlIHRoYXQg
d2UgcHJlc2VudCB0byB0aGUgDQpvdXRzaWRlIHdvcmxkLiBJbXBsZW1lbnQgdGhlbSBpbiBl
YWNoIGhhcmR3YXJlJ3MgZHJpdmVyLg0KDQpCdXQgbW9zdCBncmFwaGljcyBoYXJkd2FyZSBp
cyBzaW1pbGFyIHRvIGVhY2ggb3RoZXIuIFRoZSBkaWZmZXJlbmNlcyBhcmUgDQppbiB0aGUg
d2F5IGhvdyB0aGluZ3MgYXJlIGRvbmUsIGJ1dCBub3Qgc28gbXVjaCB3aGF0IGlzIGJlaW5n
IGRvbmUuIA0KSGVuY2UsIGEgZ29vZCBudW1iZXIgb2YgZHJtXyRvYmplY3RfZnVuY3MgY2Fu
IGJlIHByb3ZpZGVkIGluIA0KaGFyZHdhcmUtaW5kZXBlbmRlbnQgaGVscGVycy4gZHJtX29i
amVjdF9oZWxwZXJfZnVuY3MgYXJlIGNhbGxiYWNrIGZvciANCnRoZXNlIGhlbHBlcnMuIElu
IHRoZSBwbGFjZXMgd2hlcmUgdGhlIGhlbHBlcnMgbmVlZCB0aGUgZHJpdmVyIHRvIGRvIA0K
c29tZXRoaW5nIHdpdGggdGhlIGhhcmR3YXJlLCB0aGV5IHJlZmVyIHRvIF9oZWxwZXJfZnVu
Y3MuDQoNCklJUkMsIHRoZXJlIGFyZSBhIGZldyBvdXRsaWVycywgYnV0IHRoYXQncyB0aGUg
b3ZlcmFsbCBpZGVhLg0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQo+IA0KPiBJIHJlYWQg
dGhpcyBzZWN0aW9uIG9mIHRoZSBkb2N1bWVudGF0aW9uIGJ1dCBzdGlsbCBpc24ndCBjbGVh
ciB0byBtZToNCj4gDQo+IGh0dHBzOi8vZHJpLmZyZWVkZXNrdG9wLm9yZy9kb2NzL2RybS9n
cHUvZHJtLWttcy1oZWxwZXJzLmh0bWwNCj4gDQo+PiBKdXN0IG15IDLigqxjIGFzIGEgRFJN
IG5vdmljZS4uLg0KPj4NCj4gDQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNz
IERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21i
SA0KRnJhbmtlbnN0cmFzc2UgMTQ2LCA5MDQ2MSBOdWVybmJlcmcsIEdlcm1hbnkNCkdGOiBJ
dm8gVG90ZXYsIEFuZHJldyBNeWVycywgQW5kcmV3IE1jRG9uYWxkLCBCb3VkaWVuIE1vZXJt
YW4NCkhSQiAzNjgwOSAoQUcgTnVlcm5iZXJnKQ0K

--------------fJeVOobFUNnvhtAK0N0SFJnS--

--------------gnaJEnC7xR3fHLvNbEiwFQU3
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmUMAlUFAwAAAAAACgkQlh/E3EQov+Be
7xAAqEc4f6bs8expymGc6gxio2SoBgMJngmjbRXxB3Avo/tIKa7TSa4hR1krtJA+Ym8ocUR1kvCy
Uhh2mPV3oyxwBHyolgN/c1jVguvYXrRf7w2iz/16B2IqKmJaJOy+PjJyU/5tDDt/VTt3IQyaUl+m
z+sD0vT3l4+PPRYXAC/OcmvGSxF4a3wvqCPFIQVY13N9ykluuHeHLU4/ulAwytPdnemTvewycq9b
62f5Y47BoxG6rFaOSYjsXsXk280c+6tsvHX2Tbsmh5jxko6CL7Rwt9tfthgBRHavLpA1tCoyrXY9
rvXKxXZjqGr/ZoUl2kXQ5jen0rhYSY99FCmyc8L5w6o0j0V/ZiqOxHOgqhJ4WOjcGNo57DYd4lMt
pk3LV9T6VQ2L1DJFWdNtDggtZOT/V1+VrObUEVlU6AsemWpkALx9GGf4bbWxki5ve1CRDpvmLJG+
+2SP66U1qXDvLbE4Pt+smjVOUr/pnwUIbivJb6LoXCxN6/Mrv/T/fDmvw2ptgv/GP4HUiFYUyYyU
PMqC7A6YLYLJSFhsD3S/5dmlWapKGYSNPgxuW4khAnjIB8Pc1To2ZOxzRKLT1E6YzyGLKItt3IUo
oeij4TUuZQ1R8lHzhA+2acfGOwSQI2ADBEIa93gwbNfcI7BcT5CwUJaqMa17j8EbqKyCeelkT07k
N70=
=qa3g
-----END PGP SIGNATURE-----

--------------gnaJEnC7xR3fHLvNbEiwFQU3--
