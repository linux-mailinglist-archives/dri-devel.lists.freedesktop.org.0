Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E28D651A28E
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 16:49:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13F2C10F3D6;
	Wed,  4 May 2022 14:49:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55C4D10F3D6
 for <dri-devel@lists.freedesktop.org>; Wed,  4 May 2022 14:49:54 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A46F41F745;
 Wed,  4 May 2022 14:49:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1651675792; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=z7a1tUIqeQwhYVrRkWyPm+b7zgnGEqyjjbvzog71260=;
 b=B2Zw2g+w9XDRK6G7lxyfk7VvFnVb5A0kVZbGig8g7aedHQR9YwU7CJJrx7wWzjO9AiB1Bi
 twYb9up37BZf/7I1bz9OpSZ9NWMMbqCD7HQOyvkaG98l9jvIchKtwQOxqcYSK88O1gZlZc
 Sdgx6ISEP/WAFUiQDP6IBGaA1zbawZE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1651675792;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=z7a1tUIqeQwhYVrRkWyPm+b7zgnGEqyjjbvzog71260=;
 b=JfDFAxGNSDITB8tXcxJE223wy+ZesjAzz9qL0Pv/snTnxrRTpMD2dz0P+R1qjfUa4HW/Pq
 gdl2w1TXFwIFhnCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7893D131BD;
 Wed,  4 May 2022 14:49:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id oGNQHJCScmKIHwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 04 May 2022 14:49:52 +0000
Message-ID: <e1a4290e-32c9-f3c1-ce8d-7ff56e2063c4@suse.de>
Date: Wed, 4 May 2022 16:49:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH] drm/todo: Add entry for using kunit in the subsystem
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org
References: <20220504080212.713275-1-javierm@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220504080212.713275-1-javierm@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------S8kgMgY0OsMM915jm8s2l0gf"
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
Cc: David Airlie <airlied@linux.ie>, linux-doc@vger.kernel.org,
 Maxime Ripard <maxime@cerno.tech>, dri-devel@lists.freedesktop.org,
 Jonathan Corbet <corbet@lwn.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------S8kgMgY0OsMM915jm8s2l0gf
Content-Type: multipart/mixed; boundary="------------V00YHOmcYaEUm0RvKjWgIClX";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org
Cc: Jonathan Corbet <corbet@lwn.net>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 Maxime Ripard <maxime@cerno.tech>
Message-ID: <e1a4290e-32c9-f3c1-ce8d-7ff56e2063c4@suse.de>
Subject: Re: [PATCH] drm/todo: Add entry for using kunit in the subsystem
References: <20220504080212.713275-1-javierm@redhat.com>
In-Reply-To: <20220504080212.713275-1-javierm@redhat.com>

--------------V00YHOmcYaEUm0RvKjWgIClX
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDQuMDUuMjIgdW0gMTA6MDIgc2NocmllYiBKYXZpZXIgTWFydGluZXogQ2Fu
aWxsYXM6DQo+IFRoZSBLZXJuZWwgVW5pdCBUZXN0aW5nIChLVW5pdCkgZnJhbWV3b3JrIHBy
b3ZpZGVzIGEgY29tbW9uIGZyYW1ld29yayBmb3INCj4gdW5pdCB0ZXN0cyB3aXRoaW4gdGhl
IExpbnV4IGtlcm5lbC4gSGF2aW5nIGEgdGVzdCBzdWl0ZSB3b3VsZCBhbGxvdyB0bw0KPiBp
ZGVudGlmeSByZWdyZXNzaW9ucyBlYXJsaWVyLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogSmF2
aWVyIE1hcnRpbmV6IENhbmlsbGFzIDxqYXZpZXJtQHJlZGhhdC5jb20+DQo+IC0tLQ0KPiAN
Cj4gICBEb2N1bWVudGF0aW9uL2dwdS90b2RvLnJzdCB8IDE0ICsrKysrKysrKysrKysrDQo+
ICAgMSBmaWxlIGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQg
YS9Eb2N1bWVudGF0aW9uL2dwdS90b2RvLnJzdCBiL0RvY3VtZW50YXRpb24vZ3B1L3RvZG8u
cnN0DQo+IGluZGV4IDEyN2U3NmVlMGIyZC4uMTBiZmI1MDkwOGQxIDEwMDY0NA0KPiAtLS0g
YS9Eb2N1bWVudGF0aW9uL2dwdS90b2RvLnJzdA0KPiArKysgYi9Eb2N1bWVudGF0aW9uL2dw
dS90b2RvLnJzdA0KPiBAQCAtNjAzLDYgKzYwMywyMCBAQCBMZXZlbDogQWR2YW5jZWQNCj4g
ICBCZXR0ZXIgVGVzdGluZw0KPiAgID09PT09PT09PT09PT09DQo+ICAgDQo+ICtBZGQgdW5p
dCB0ZXN0cyB1c2luZyB0aGUgS2VybmVsIFVuaXQgVGVzdGluZyAoS1VuaXQpIGZyYW1ld29y
aw0KPiArLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0NCj4gKw0KPiArVGhlIGBLVW5pdCA8aHR0cHM6Ly93d3cua2VybmVs
Lm9yZy9kb2MvaHRtbC9sYXRlc3QvZGV2LXRvb2xzL2t1bml0L2luZGV4Lmh0bWw+YF8NCj4g
K3Byb3ZpZGVzIGEgY29tbW9uIGZyYW1ld29yayBmb3IgdW5pdCB0ZXN0cyB3aXRoaW4gdGhl
IExpbnV4IGtlcm5lbC4gSGF2aW5nIGENCj4gK3Rlc3Qgc3VpdGUgd291bGQgYWxsb3cgdG8g
aWRlbnRpZnkgcmVncmVzc2lvbnMgZWFybGllci4NCj4gKw0KPiArQSBnb29kIGNhbmRpZGF0
ZSBmb3IgdGhlIGZpcnN0IHVuaXQgdGVzdHMgYXJlIHRoZSBmb3JtYXQtY29udmVyc2lvbiBo
ZWxwZXJzIGluDQo+ICtgYGRybV9mb3JtYXRfaGVscGVyLmNgYC4NCj4gKw0KPiArQ29udGFj
dDogSmF2aWVyIE1hcnRpbmV6IENhbmlsbGFzIDxqYXZpZXJtQHJlZGhhdC5jb20+DQoNCkFj
a2VkLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4NCg0KPiAr
DQo+ICtMZXZlbDogSW50ZXJtZWRpYXRlDQo+ICsNCj4gICBFbmFibGUgdHJpbml0eSBmb3Ig
RFJNDQo+ICAgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiAgIA0KDQotLSANClRob21hcyBa
aW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNv
bHV0aW9ucyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywg
R2VybWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bDvGhyZXI6
IEl2byBUb3Rldg0K

--------------V00YHOmcYaEUm0RvKjWgIClX--

--------------S8kgMgY0OsMM915jm8s2l0gf
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmJykpAFAwAAAAAACgkQlh/E3EQov+D6
mxAAq7XObyRynI00OE4am3y87JyfCqsp42IrnRyBfArkaH2UnQsc5N5OMV+c8HrcDY2/77kZ3Oba
mBqrVPl6xa80bynqXdHL8onCcOLrSesWWXgw5UjUK1m1MkxwRetWL3GGCbDt+LDG4UXlhiboVgaf
FOz8ndPgo0aGUdXF6v1W2HCeWuhI0Lg5ftC73ndVgh95iKPvq62o8UUuaXZhLx2lpz+NO08bq5tg
xWkBnCwD/pmou1akE9sc1kkgDvUckILyvirXiuVE6G5ukWq9wR31L/E4r0y7r1/VTa6xKiCtq+EC
y8r4DdjncnGSmWT42atdsl8V/n2TYakh6gOBtioemXpdZNODkLSkoxliI0zPnwifwubHaM23VaXs
J/V37JXIJDThz66YTMYBjE/+dP54iYLLbJlvNOrMWeqT0WjhHSJ4sK639uEUSgiS+S/yiYdqoIig
aok0ceAqL3LkLrGD/HAe4I2LXob5/WsIr4KAS9oMTEDATxeKr4/NxPJ4F8sGqrraqyTSWj8RBQXT
Q3NuTi3zJ0rI1gSiKmt2e4RymHbij8bWWby//uRUEPO34CONJa8lhCpz/Du7k1+zxlytBPo8nfvG
IjsEPIiuP7bqVnewHFa3lBifIIimJVfpR+Xa9Ss6eHOfHNM329p5gbcjuheM7AmcJcDRI9p7k6Cb
kf4=
=2abr
-----END PGP SIGNATURE-----

--------------S8kgMgY0OsMM915jm8s2l0gf--
