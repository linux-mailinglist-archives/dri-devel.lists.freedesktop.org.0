Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5A237C6783
	for <lists+dri-devel@lfdr.de>; Thu, 12 Oct 2023 10:21:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66E3810E135;
	Thu, 12 Oct 2023 08:21:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BFE010E135
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Oct 2023 08:21:47 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D75D41F74C;
 Thu, 12 Oct 2023 08:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1697098905; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=6QG6vUO62cCHAC1CY8l61gBKDOUTQreMpeDW9p3VTSY=;
 b=DKt/n3l2uVL8PcfUSzgqdn9GjpIjV1EXCpqWyQJESKpnExu30vxpyglsq+dcfdkRvoCdqY
 rvd8o2QjycNfERX/W7c3z5b9JiKMvuSaddrQbHD1o6F7QWuw8tRqqN7bax5mtkNzG4yyYY
 X86Amrqpj2rpbnXEpIXF8QLqQbkrkas=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1697098905;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=6QG6vUO62cCHAC1CY8l61gBKDOUTQreMpeDW9p3VTSY=;
 b=iTJi+B7zjztsq5whnKNO0AZqokpNqHsYmOKz7d7tPUjP3FJnd5Hz4Pp3bNunD7PLIehIyW
 fVt14oT3gXW/HBAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A4302139F9;
 Thu, 12 Oct 2023 08:21:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id HGASJ5msJ2X3SAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 12 Oct 2023 08:21:45 +0000
Message-ID: <a61e0eed-0608-42f6-9833-9543ebd3c8ca@suse.de>
Date: Thu, 12 Oct 2023 10:21:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] drm/ssd130x: Add a per controller family functions
 table
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org
References: <20231012065822.1007930-1-javierm@redhat.com>
 <20231012065822.1007930-3-javierm@redhat.com>
 <e6593ea5-daa1-466a-9d42-0c1872f41a13@suse.de>
 <87a5so46as.fsf@minerva.mail-host-address-is-not-set>
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
In-Reply-To: <87a5so46as.fsf@minerva.mail-host-address-is-not-set>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------XAexfIgXwuVO3dJ4F0s1dBcl"
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
Cc: dri-devel@lists.freedesktop.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 Peter Robinson <pbrobinson@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Conor Dooley <conor@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------XAexfIgXwuVO3dJ4F0s1dBcl
Content-Type: multipart/mixed; boundary="------------CYeJHR1TXU2C4klVqFPPM23m";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org
Cc: Peter Robinson <pbrobinson@gmail.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard
 <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 Conor Dooley <conor@kernel.org>
Message-ID: <a61e0eed-0608-42f6-9833-9543ebd3c8ca@suse.de>
Subject: Re: [PATCH v2 2/6] drm/ssd130x: Add a per controller family functions
 table
References: <20231012065822.1007930-1-javierm@redhat.com>
 <20231012065822.1007930-3-javierm@redhat.com>
 <e6593ea5-daa1-466a-9d42-0c1872f41a13@suse.de>
 <87a5so46as.fsf@minerva.mail-host-address-is-not-set>
In-Reply-To: <87a5so46as.fsf@minerva.mail-host-address-is-not-set>

--------------CYeJHR1TXU2C4klVqFPPM23m
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgSmF2aWVyDQoNCkFtIDEyLjEwLjIzIHVtIDEwOjAyIHNjaHJpZWIgSmF2aWVyIE1hcnRp
bmV6IENhbmlsbGFzOg0KPiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5k
ZT4gd3JpdGVzOg0KPiANCj4gSGVsbG8gVGhvbWFzLA0KPiANCj4gVGhhbmtzIGEgbG90IGZv
ciB5b3VyIGZlZWRiYWNrLg0KPiANCj4+IEhpIEphdmllcg0KPj4NCj4+IEFtIDEyLjEwLjIz
IHVtIDA4OjU4IHNjaHJpZWIgSmF2aWVyIE1hcnRpbmV6IENhbmlsbGFzOg0KPj4gWy4uLl0N
Cj4+PiAgICANCj4+PiArc3RydWN0IHNzZDEzMHhfZnVuY3Mgew0KPj4+ICsJaW50ICgqaW5p
dCkoc3RydWN0IHNzZDEzMHhfZGV2aWNlICpzc2QxMzB4KTsNCj4+PiArCWludCAoKnNldF9i
dWZmZXJfc2l6ZXMpKHN0cnVjdCBzc2QxMzB4X2RldmljZSAqc3NkMTMweCk7DQo+Pj4gKwl2
b2lkICgqYWxpZ25fcmVjdCkoc3RydWN0IHNzZDEzMHhfZGV2aWNlICpzc2QxMzB4LCBzdHJ1
Y3QgZHJtX3JlY3QgKnJlY3QpOw0KPj4+ICsJaW50ICgqdXBkYXRlX3JlY3QpKHN0cnVjdCBz
c2QxMzB4X2RldmljZSAqc3NkMTMweCwgc3RydWN0IGRybV9yZWN0ICpyZWN0LA0KPj4+ICsJ
CQkgICB1OCAqYnVmLCB1OCAqZGF0YV9hcnJheSk7DQo+Pj4gKwl2b2lkICgqY2xlYXJfc2Ny
ZWVuKShzdHJ1Y3Qgc3NkMTMweF9kZXZpY2UgKnNzZDEzMHgsDQo+Pj4gKwkJCSAgICAgdTgg
KmRhdGFfYXJyYXkpOw0KPj4+ICsJdm9pZCAoKmZtdF9jb252ZXJ0KShzdHJ1Y3QgaW9zeXNf
bWFwICpkc3QsIGNvbnN0IHVuc2lnbmVkIGludCAqZHN0X3BpdGNoLA0KPj4+ICsJCQkgICAg
Y29uc3Qgc3RydWN0IGlvc3lzX21hcCAqc3JjLCBjb25zdCBzdHJ1Y3QgZHJtX2ZyYW1lYnVm
ZmVyICpmYiwNCj4+PiArCQkJICAgIGNvbnN0IHN0cnVjdCBkcm1fcmVjdCAqY2xpcCk7DQo+
Pj4gK307DQo+Pj4gKw0KPj4NCj4+IFlvdSBhcmUgcmVpbnZlbnRpbmcgRFJNJ3MgYXRvbWlj
IGhlbHBlcnMuIEkgc3Ryb25nbHkgYWR2aXNlZCBhZ2FpbnN0DQo+PiBkb2luZyB0aGF0LCBh
cyBpdCBvZnRlbiB0dXJucyBvdXQgYmFkLiBNYXliZSBzZWUgbXkgcmFudCBhdCBbMV0gd3J0
IHRvDQo+PiBhbm90aGVyIGRyaXZlci4NCj4+DQo+PiBJdCdzIG11Y2ggYmV0dGVyIHRvIGNy
ZWF0ZSBhIHNlcGFyYXRlIG1vZGUtc2V0dGluZyBwaXBlbGluZSBmb3IgdGhlDQo+PiBzc2Qx
MzJ4IHNlcmllcyBhbmQgc2hhcmUgdGhlIGNvbW1vbiBjb2RlIGFtb25nIHBpcGVsaW5lcy4g
WW91ciBkcml2ZXINCj4+IHdpbGwgaGF2ZSBhIGNsZWFuIGFuZCByZWFkYWJsZSBpbXBsZW1l
bnRhdGlvbiBmb3IgZWFjaCBzdXBwb3J0ZWQNCj4+IGNoaXBzZXQuIENvbXBhcmUgYW4gb2xk
IHZlcnNpb24gb2YgbWdhZzIwMCBbMl0gd2l0aCB0aGUgY3VycmVudCBkcml2ZXINCj4+IHRv
IHNlZSB0aGUgZGlmZmVyZW5jZS4NCj4+DQo+IA0KPiBJIHNlZSB3aGF0IHlvdSBtZWFuLiBU
aGUgcmVhc29uIHdoeSBJIGRpZG4ndCBnbyB0aGF0IHJvdXRlIHdhcyB0byBtaW5pbWl6ZQ0K
PiBjb2RlIGR1cGxpY2F0aW9uLCBidXQgeW91IGFyZSBjb3JyZWN0IHRoYXQgZWFjaCBsZXZl
bCBvZiBpbmRpcmVjdGlvbiBtYWtlcw0KPiB0aGUgZHJpdmVyIGhhcmRlciB0byByZWFkLCB0
byByZWFzb24gYWJvdXQgYW5kIGZyYWdpbGUgKG1vZGlmeWluZyBhIGNvbW1vbg0KPiBjYWxs
YmFjayBjb3VsZCBoYXZlIHVuZGVzaXJlZCBlZmZlY3RzIG9uIG90aGVyIGNoaXAgZmFtaWxp
ZXMgYXMgeW91IHNhaWQpLg0KPiANCj4gSSdsbCBnaXZlIGl0IGEgdHJ5IHRvIHdoYXQgeW91
IHByb3Bvc2UgaW4gdjMsIGhhdmUgc2VwYXJhdGUgbW9kZXNldHRpbmcNCj4gcGlwZWxpbmUg
Zm9yIFNTRDEzMHggYW5kIFNTRDEzMngsIGV2ZW4gaWYgdGhpcyBjb3VsZCBsZWFkIHRvIGEg
bGl0dGxlIG1vcmUNCj4gZHVwbGljYXRlZCBjb2RlLg0KDQpUaGFua3MgYSBsb3QuIEkga25v
dyB5b3Ugd2FudCB0byBtYWtlIGEgcmVmZXJlbmNlIGRyaXZlciBmb3Igb3RoZXJzIHRvIA0K
c3R1ZHkuIFNvIEkgdGhpbmsgYXQgbGVhc3QgdHJ5aW5nIHRoZSBtdWx0aS1waXBlbGluZSB3
YXkgaXMgd29ydGggaXQuDQoNCiBGcm9tIHRoZSBtZ2FnMjAwIGFuZCBhc3QgZHJpdmVycywg
SSBmb3VuZCB0aGF0IHRoZSByZWZhY3RvcmluZyBwYXRjaCANCnNldHMgY2FuIGJlIGxhcmdl
IHRvIHRoZSBwb2ludCB3aGVyZSBvbmUgd29uZGVycyB3aGV0aGVyIGl0J3MgYWN0dWFsbHkg
DQp3b3J0aCBpdC4gQnV0IHRoZSBlbmQgcmVzdWx0cyB0dXJuZWQgb3V0IG9rLiAoYXN0IHN0
aWxsIG5lZWRzIG1vcmUgd29yayANCnRob3VnaC4pDQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFz
DQoNCj4gDQo+PiBCZXN0IHJlZ2FyZHMNCj4+IFRob21hcw0KPj4NCj4gDQoNCi0tIA0KVGhv
bWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdh
cmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KRnJhbmtlbnN0cmFzc2UgMTQ2LCA5MDQ2MSBO
dWVybmJlcmcsIEdlcm1hbnkNCkdGOiBJdm8gVG90ZXYsIEFuZHJldyBNeWVycywgQW5kcmV3
IE1jRG9uYWxkLCBCb3VkaWVuIE1vZXJtYW4NCkhSQiAzNjgwOSAoQUcgTnVlcm5iZXJnKQ0K


--------------CYeJHR1TXU2C4klVqFPPM23m--

--------------XAexfIgXwuVO3dJ4F0s1dBcl
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmUnrJkFAwAAAAAACgkQlh/E3EQov+AJ
5RAAk1FDd4P63lAVF3kn6BXrTSEYrkCzkpnRPm9pm2IfAdMmNCASn0QAGerJLjUOt+QY7HUzM8Gh
USTTxmJb2wwX21nS4IzuzMtbGsYTpyqeLk3G0Zvbb5IZ/Qed5cYrw731+WU9T8jPhkWry/PW1qLO
Jl8FFK5C6WLcNHoNLgUt8GFPEfDqg4gYM3JR0Cb4TqiMOYk4WySEx0CyN7OWFi5La3t8OdZklCcH
HuH2YZcScE97xmKoNjFNZErCjOmSQe0mJBbPY6y5wiUOSORs+ViGve2vpOQlWa7CxDI94AhgpdEQ
bbwd682uSdwtwp8us+XjpuKJxFHGjm8fADmEMV9PNLuaVzj2mHSl0RywkjrV0hmFWUh+a+q9LuHK
eNupiHdwbS2nSM2ouWdZ+HyC8Gilw/kcxzPvNKBZAl5OQ6CM1nrELqqkSf5aUwlbVL8XJcQetlAC
16KEbgvKj7MkSzkme86bN3D4N5YQlyQ6UbKmEndjpEFlmQ5TUl8gufKD01BWLO9u7LBuZbV3P9q3
+ayttIrDyud9/DB7QvqwykuUsOm3I/2UlwuudZ+Qkas4ATeeRwHXXZ2LLr9Ofrc+VbZA2VoZHZ7o
JFhj5U4kMhgEVd6g9YBS51ykIkT+ZKlfbEEqSPdpYl8xGcMDajPlN4f3ikTsJoqEjbWAVB9/eTkb
pCQ=
=r8to
-----END PGP SIGNATURE-----

--------------XAexfIgXwuVO3dJ4F0s1dBcl--
