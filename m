Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CA6366AD95F
	for <lists+dri-devel@lfdr.de>; Tue,  7 Mar 2023 09:40:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEE3E89C2C;
	Tue,  7 Mar 2023 08:40:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9457110E0F6
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Mar 2023 08:40:50 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 3282421A3E;
 Tue,  7 Mar 2023 08:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1678178449; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rFbQNxGy0QynHBtPxQ552xe+WpYhwsKONED8QLWv8Eg=;
 b=YgC8uAnStcWomNwrcjq9QnZdVM3q9b4Eu48IPQ80jAZKS98tO8DNnYOykoEuSWZHLJDSP+
 uZKl+LekR3z0+DhPT2tfZdboXqJ5wqGpASE6pOkwmrMpNi74NndD+rdpQv41VY0PJkP+JS
 mWcSJ/euslmmNmX4CYkRlQ6eedl2XIg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1678178449;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rFbQNxGy0QynHBtPxQ552xe+WpYhwsKONED8QLWv8Eg=;
 b=9qWkUyG0eTGXm35BG2eV5a9KsfqWL639kbsgJ9XjwF+LpqiolfH7t+FzzWDCmLbrVHtaoS
 mvCu+tD4VFuo44DA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CB17113440;
 Tue,  7 Mar 2023 08:40:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id POqHMJD4BmTiHwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 07 Mar 2023 08:40:48 +0000
Message-ID: <9784a0fd-4c9b-1c69-998d-8f8372f8acce@suse.de>
Date: Tue, 7 Mar 2023 09:40:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 01/99] lib: Add option iterator
Content-Language: en-US
To: Randy Dunlap <rdunlap@infradead.org>, deller@gmx.de, paulus@samba.org,
 benh@kernel.crashing.org, linux@armlinux.org.uk, pjones@redhat.com,
 timur@kernel.org, adaplas@gmail.com, s.hauer@pengutronix.de,
 shawnguo@kernel.org, mbroemme@libmpq.org, thomas@winischhofer.net,
 James.Bottomley@HansenPartnership.com, spock@gentoo.org,
 sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
 geert+renesas@glider.be, corbet@lwn.net
References: <20230306160016.4459-1-tzimmermann@suse.de>
 <20230306160016.4459-2-tzimmermann@suse.de>
 <570edde0-cfea-f560-fe83-6077f4f221e5@infradead.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <570edde0-cfea-f560-fe83-6077f4f221e5@infradead.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------pY5Sewy2Z94lIbK6is7THWpx"
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
Cc: linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------pY5Sewy2Z94lIbK6is7THWpx
Content-Type: multipart/mixed; boundary="------------omnXe7ozu3W7c3QT2E3mLhqD";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Randy Dunlap <rdunlap@infradead.org>, deller@gmx.de, paulus@samba.org,
 benh@kernel.crashing.org, linux@armlinux.org.uk, pjones@redhat.com,
 timur@kernel.org, adaplas@gmail.com, s.hauer@pengutronix.de,
 shawnguo@kernel.org, mbroemme@libmpq.org, thomas@winischhofer.net,
 James.Bottomley@HansenPartnership.com, spock@gentoo.org,
 sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
 geert+renesas@glider.be, corbet@lwn.net
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Message-ID: <9784a0fd-4c9b-1c69-998d-8f8372f8acce@suse.de>
Subject: Re: [PATCH 01/99] lib: Add option iterator
References: <20230306160016.4459-1-tzimmermann@suse.de>
 <20230306160016.4459-2-tzimmermann@suse.de>
 <570edde0-cfea-f560-fe83-6077f4f221e5@infradead.org>
In-Reply-To: <570edde0-cfea-f560-fe83-6077f4f221e5@infradead.org>

--------------omnXe7ozu3W7c3QT2E3mLhqD
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDYuMDMuMjMgdW0gMjM6Mzcgc2NocmllYiBSYW5keSBEdW5sYXA6DQpbLi4u
XQ0KPj4gKyAqDQo+PiArICogVGhlIGNhbGwgdG8gb3B0aW9uX2l0ZXJfaW5pdCgpIGluaXRp
YWxpemVzIHRoZSBpdGVyYXRvciBpbnN0YW5jZQ0KPj4gKyAqIGZyb20gdGhlIG9wdGlvbiBz
dHJpbmcuIFRoZSB3aGlsZSBsb29wIHdhbGtzIG92ZXIgdGhlIGluZGl2aWR1YWwNCj4+ICsg
KiBvcHRpb25zIGluIHRoZSBzdGluZyBhbmQgcmV0dXJucyBlYWNoIGluIHRoZSBzZWNvbmQg
YXJndW1lbnQuIFRoZQ0KPj4gKyAqIHJldHVybmVkIG1lbW9yeSBpcyBvd25lZCBieSB0aGUg
aXRlcmF0b3IgaW5zdGFuY2UgYW5kIGNhbGxlcnMgbWF5DQo+PiArICogbm90IG1vZGlmeSBv
ciBmcmVlIGl0LiBUaGUgY2FsbCB0byBvcHRpb25faXRlcl9yZWxlYXNlKCkgZnJlZXMgYWxs
DQo+PiArICogcmVzb3VyY2VzIG9mIHRoZSBpdGVyYXRvci4gVGhpcyBwcm9jZXNzIGRvZXMg
bm90IG1vZGlmeSB0aGUgb3JpZ2luYWwNCj4+ICsgKiBvcHRpb24gc3RyaW5nLiBJZiB0aGUg
b3B0aW9uIHN0cmluZyBjb250YWlucyBhbiBlbXB0eSBvcHRpb24gKGkuZS4sDQo+PiArICog
dHdvIGNvbW1hcyBuZXh0IHRvIGVhY2ggb3RoZXIpLCBvcHRpb25faXRlcl9uZXh0KCkgc2tp
cHMgdGhlIGVtcHR5DQo+PiArICogb3B0aW9uIGF1dG9tYXRpY2FsbHkuDQo+IA0KPiBJcyB0
aGF0IGxhdHRlciBza2lwcGluZyBvdmVyIGEgIiwsIiBhdXRvbWF0aWNhbGx5IHNvbWV0aGlu
ZyB0aGF0IHlvdSBoYXZlDQo+IG9ic2VydmVkIGFzIG5lZWRlZD8NCg0KSXQncyBub3Qgc3Ry
aWN0bHkgbmVlZGVkIGZvciBjb3JyZWN0bmVzcywgYnV0IG1hbnkgb2YgdGhvc2UgZmJkZXYg
DQpkcml2ZXJzIGNvbnRhaW4gY29kZSB0byBkbyB0aGF0LiBMaWtlIHRoaXMgb25lOg0KDQog
DQpodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC92Ni4yL3NvdXJjZS9kcml2ZXJz
L3ZpZGVvL2ZiZGV2L3Zlc2FmYi5jI0wyMTcNCg0KU28gZG9pbmcgaXQgaW4gdGhlIF9pbmNy
KCkgaGVscGVyIHNlZW1zIHVzZWZ1bA0KDQo+IEkgY2FuIGltYWdpbmUgYSBkcml2ZXIgb3Ig
bW9kdWxlIHdhbnRpbmcgdG8ga25vdyB0aGF0IGFuIGVtcHR5IHN0cmluZw0KPiB3YXMgZW50
ZXJlZCAoaS5lLiwgIiwsIikuDQoNCkkgb25seSBsb29rZWQgYXQgZmJkZXYgZHJpdmVycywg
YnV0IG5vbmUgb2YgdGhlbSBjYXJlZCBhYm91dCBlbXB0eSANCnN0cmluZ3MuIFRoZXkgYWxs
IGhhdmUgbmFtZWQgb3B0aW9ucyBhbmQvb3Iga2V5LXZhbHVlIHBhaXJzLg0KDQo+IA0KPj4g
KyAqLw0KPj4gKw0KPj4gKy8qKg0KPj4gKyAqIG9wdGlvbl9pdGVyX2luaXQgLSBJbml0aWFs
aXplcyBhbiBvcHRpb24gaXRlcmF0b3INCj4+ICsgKiBAaXRlcjoJdGhlIGl0ZXJhdG9yIHRv
IGluaXRpYWxpemUNCj4+ICsgKiBAb3B0aW9uczoJdGhlIG9wdGlvbnMgc3RyaW5nDQo+PiAr
ICovDQo+PiArdm9pZCBvcHRpb25faXRlcl9pbml0KHN0cnVjdCBvcHRpb25faXRlciAqaXRl
ciwgY29uc3QgY2hhciAqb3B0aW9ucykNCj4+ICt7DQo+PiArCWlmIChvcHRpb25zICYmICpv
cHRpb25zKQ0KPj4gKwkJaXRlci0+b3B0YnVmID0ga3N0cmR1cChvcHRpb25zLCBHRlBfS0VS
TkVMKTsgLy8gY2FuIGJlIE5VTEwNCj4+ICsJZWxzZQ0KPj4gKwkJaXRlci0+b3B0YnVmID0g
TlVMTDsNCj4+ICsJaXRlci0+bmV4dF9vcHQgPSBpdGVyLT5vcHRidWY7DQo+PiArfQ0KPj4g
K0VYUE9SVF9TWU1CT0wob3B0aW9uX2l0ZXJfaW5pdCk7DQo+PiArDQo+PiArLyoqDQo+PiAr
ICogb3B0aW9uX2l0ZXJfcmVsZWFzZSAtIFJlbGVhc2VzIGFuIG9wdGlvbiBpdGVyYXRvcidz
IHJlc291cmNlcw0KPj4gKyAqIEBpdGVyOgl0aGUgaXRlcmF0b3INCj4+ICsgKi8NCj4+ICt2
b2lkIG9wdGlvbl9pdGVyX3JlbGVhc2Uoc3RydWN0IG9wdGlvbl9pdGVyICppdGVyKQ0KPj4g
K3sNCj4+ICsJa2ZyZWUoaXRlci0+b3B0YnVmKTsNCj4+ICsJaXRlci0+bmV4dF9vcHQgPSBO
VUxMOw0KPj4gK30NCj4+ICtFWFBPUlRfU1lNQk9MKG9wdGlvbl9pdGVyX3JlbGVhc2UpOw0K
Pj4gKw0KPj4gKy8qKg0KPj4gKyAqIG9wdGlvbl9pdGVyX2luY3IgLSBSZXR1cm4gY3VycmVu
dCBvcHRpb24gYW5kIGFkdmFuY2UgdG8gdGhlIG5leHQNCj4+ICsgKiBAaXRlcjoJdGhlIGl0
ZXJhdG9yDQo+PiArICoNCj4+ICsgKiBSZXR1cm5zOg0KPiANCj4gICAqIFJldHVybjoNCj4g
bWF0Y2hlcyBrZXJuZWwtZG9jIG5vdGF0aW9uIGRvY3VtZW50YXRpb24uDQo+IA0KPj4gKyAq
IFRoZSBjdXJyZW50IG9wdGlvbiBzdHJpbmcsIG9yIE5VTEwgaWYgdGhlcmUgYXJlIG5vIG1v
cmUgb3B0aW9ucy4NCj4+ICsgKi8NCj4+ICtjb25zdCBjaGFyICpvcHRpb25faXRlcl9pbmNy
KHN0cnVjdCBvcHRpb25faXRlciAqaXRlcikNCj4+ICt7DQo+PiArCWNoYXIgKm9wdDsNCj4+
ICsNCj4+ICsJaWYgKCFpdGVyLT5uZXh0X29wdCkgeyAvLyBjYW4gYmUgT0sgaWYga3N0cmR1
cCBmYWlsZWQNCj4+ICsJCWlmIChpdGVyLT5vcHRidWYpIC8vIGl0ZXIgaGFzIGFscmVhZHkg
YmVlbiByZWxlYXNlZDsgbG9naWMgZXJyb3INCj4+ICsJCQlwcl9lcnIoIkluY3JlbWVudGlu
ZyBvcHRpb24gaXRlcmF0b3Igd2l0aG91dCBzdHJpbmdcbiIpOw0KPj4gKwkJcmV0dXJuIE5V
TEw7DQo+PiArCX0NCj4+ICsNCj4+ICsJZG8gew0KPj4gKwkJb3B0ID0gc3Ryc2VwKCZpdGVy
LT5uZXh0X29wdCwgIiwiKTsNCj4+ICsJCWlmICghb3B0KQ0KPj4gKwkJCXJldHVybiBOVUxM
Ow0KPj4gKwl9IHdoaWxlICghKm9wdCk7IC8vIGZvdW5kIGVtcHR5IG9wdGlvbiBzdHJpbmcs
IHRyeSBuZXh0DQo+PiArDQo+PiArCXJldHVybiBvcHQ7DQo+PiArfQ0KPj4gK0VYUE9SVF9T
WU1CT0wob3B0aW9uX2l0ZXJfaW5jcik7DQo+IA0KPiBMb29rcyB1c2VmdWwuIFRoYW5rcy4N
Cg0KVGhhbmtzLg0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQo+IA0KDQotLSANClRob21h
cyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJl
IFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVy
ZywgR2VybWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bDvGhy
ZXI6IEl2byBUb3Rldg0K

--------------omnXe7ozu3W7c3QT2E3mLhqD--

--------------pY5Sewy2Z94lIbK6is7THWpx
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmQG+JAFAwAAAAAACgkQlh/E3EQov+CS
cw//eS2VZQrnosSlaY42mWN41pyPfktluI0lehK+1Tmuxe/zUDOJjjiaSjiLhyuocu4t/NtqHptb
XZiKMzBTXC2in6h3INs3/s/OkVA41tKsgY6dLoZEglpIGArhnJcuuwOGAkKvEIbiIJBlIZeeElke
ikPBpKq6TLMkhOYHeD09EhwwJoLAH5rea62W9oSna4jWUBghOeC9hfiih3dQGBj9p0oYbzy5bEY7
7bZVhjHwUZbIA6SdcP4Ovc0XYSCY90hdw52DnQ/5staIfgQAMc+uX2H6H9fqT28zBGGMhyolMtg9
5TD2XGuPlu2LceYF5UWiJTvmfASCKFu6PGeqKW7n08duPf95nXYMop5QhCCk+fwOIQTsAFzyfjZI
a88xObsVoLRO4XlNBndVcbvN5VWtNYqLSIrGdpv3r0IhdO/GF5sEeOXOGKknzCqD6IKh9r/mDFnK
KU8wpmIPKEa2/dSdmUBHe4FehtIksB/Tc3dTDPpk6YxXXe2k0+MjsaAvCwmV1JptOM7gDFlecrGN
Rar1RxsBGVupkhyGBMTIXKQyVPTgUSPlyeHajEHyLz2gSFQH0HkvYq+ktO6hPf4N6GqzBfASSd5y
IPIHIxYBkBynPZNsXGdsFOXWSFuSmheYqE+gt7W1xvs6SF+EhzJTN3fDLtfIM/SQZuxOM8sC0kzS
nA0=
=CLWm
-----END PGP SIGNATURE-----

--------------pY5Sewy2Z94lIbK6is7THWpx--
