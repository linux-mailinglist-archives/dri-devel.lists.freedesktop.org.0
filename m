Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AC1F763B9D
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jul 2023 17:51:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15EA110E495;
	Wed, 26 Jul 2023 15:51:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DE6C10E495
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jul 2023 15:51:13 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C787221C8E;
 Wed, 26 Jul 2023 15:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1690386671; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SHQVEJVlSPdEromm44yo6jcfc6y9iLkPJ6YTpT2t67A=;
 b=Yc7CbC77ySVn/Tf9hw2DDZ7BM7JIhyKLg+FNywapBnmcwcxq6k5QSaPe17ZwlL8yB++6jJ
 ifrYcVGpIW0jdOaUZsz/Fp+DNVNhuV1CC9AbN46UPruMWksj6hMfDG6sOF1AHo9k4PPFjt
 U8921Y18e4dGzk+u459fUaGCihyUjyM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1690386671;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SHQVEJVlSPdEromm44yo6jcfc6y9iLkPJ6YTpT2t67A=;
 b=4XUyPrJxboWv9cNwnXaXRJ0k1qKdchItrwm88ysooawU4ElVsgD3FHHf/EOfuk8tsAkboT
 /LcxabxVs0bXU9Ag==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A0B39139BD;
 Wed, 26 Jul 2023 15:51:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id VwI+Ju9AwWSMNAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 26 Jul 2023 15:51:11 +0000
Message-ID: <49530f25-8b3b-7dd7-d634-3807bdaaf55b@suse.de>
Date: Wed, 26 Jul 2023 17:51:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] video: logo: LOGO should depend on FB_CORE i.s.o. FB
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>
References: <5ab3d1fe7b67ab10e4bc1bdbc0fa7731f7960965.1690300189.git.geert+renesas@glider.be>
 <87a5vkj7qe.fsf@minerva.mail-host-address-is-not-set>
 <CAMuHMdWBznkqYxCWD2uwGtWLqXnBqX1Ycg31fBDc4cq2u8DkNQ@mail.gmail.com>
 <877cqoj5q5.fsf@minerva.mail-host-address-is-not-set>
 <c10d925b-8d37-caa0-8f66-a0206f948c69@suse.de>
 <874jlrkbtf.fsf@minerva.mail-host-address-is-not-set>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <874jlrkbtf.fsf@minerva.mail-host-address-is-not-set>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------b6N4q4UfAAULYL4Feg2RyAgi"
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
Cc: dri-devel@lists.freedesktop.org, Helge Deller <deller@gmx.de>,
 linux-fbdev@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------b6N4q4UfAAULYL4Feg2RyAgi
Content-Type: multipart/mixed; boundary="------------8JWSIbowzSi0pRaFsTNj06BB";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Helge Deller <deller@gmx.de>, Arnd Bergmann <arnd@arndb.de>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Message-ID: <49530f25-8b3b-7dd7-d634-3807bdaaf55b@suse.de>
Subject: Re: [PATCH] video: logo: LOGO should depend on FB_CORE i.s.o. FB
References: <5ab3d1fe7b67ab10e4bc1bdbc0fa7731f7960965.1690300189.git.geert+renesas@glider.be>
 <87a5vkj7qe.fsf@minerva.mail-host-address-is-not-set>
 <CAMuHMdWBznkqYxCWD2uwGtWLqXnBqX1Ycg31fBDc4cq2u8DkNQ@mail.gmail.com>
 <877cqoj5q5.fsf@minerva.mail-host-address-is-not-set>
 <c10d925b-8d37-caa0-8f66-a0206f948c69@suse.de>
 <874jlrkbtf.fsf@minerva.mail-host-address-is-not-set>
In-Reply-To: <874jlrkbtf.fsf@minerva.mail-host-address-is-not-set>

--------------8JWSIbowzSi0pRaFsTNj06BB
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgSmF2aWVyDQoNCkFtIDI1LjA3LjIzIHVtIDIxOjUzIHNjaHJpZWIgSmF2aWVyIE1hcnRp
bmV6IENhbmlsbGFzOg0KPiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5k
ZT4gd3JpdGVzOg0KPiANCj4+IEhpDQo+Pg0KPiANCj4gWy4uLl0NCj4gDQo+Pj4NCj4+PiBZ
ZXMuIEkgbWVhbnQgdG8gbW92ZSBkcml2ZXJzL3ZpZGVvL2xvZ28vIHRvIGRyaXZlcnMvZmJk
ZXYvY29yZS9sb2dvIGFuZCB0bw0KPj4+IHNvdXJjZSBpdHMgS2NvbmZpZyBmcm9tIGRyaXZl
cnMvZmJkZXYvY29yZS9LY29uZmlnLCBzaW5jZSBpdCBub3cgZGVwZW5kcw0KPj4+IG9uIEZC
X0NPUkUuDQo+Pg0KPj4gTm8sIHBsZWFzZSByYXRoZXIgbGVhdmUgaXQgd2hlcmUgaXQgaXMu
IFRoZXJlJ3Mgbm8gY29kZSBkZXBlbmRlbmNpZXMgdG8NCj4+IHRoZSBmYmRldiBjb3JlOyBp
dCBtZXJlbHkgZGVwZW5kcyBvbiB0aGUgS2NvbmZpZyB0b2tlbi4NCj4+DQo+IA0KPiBTdXJl
LCBmaW5lIGJ5IG1lLiBCdXQgSSBkaXNhZ3JlZSB0aGF0IHRoZXJlJ3MgbWVyZWx5IGEgS2Nv
bmZpZyBkZXBlbmRlbmN5Lg0KPiBUaGUgaW5jbHVkZS9saW51eC9saW51eF9sb2dvLmggaGVh
ZGVyIGRlY2xhcmVzIGJvdGggZmJfZmluZF9sb2dvKCkgYW5kDQo+IGZiX2FwcGVuZF9leHRy
YV9sb2dvKCkuDQo+IA0KPiBUaGUgZmJfZmluZF9sb2dvKCkgZnVuY3Rpb24gaXMgZGVmaW5l
ZCBpbiBkcml2ZXJzL3ZpZGVvL2xvZ28uYyB3aGlsZSB0aGUNCj4gZmJfYXBwZW5kX2V4dHJh
X2xvZ28oKSBpcyBpbiBkcml2ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUvZmJtZW0uYywgZXZlbiB0
aG91Z2gNCj4gb25seSBhcmNoL3Bvd2VycGMvcGxhdGZvcm1zL2NlbGwvc3B1X2Jhc2UuYyB1
c2VzIGZiX2FwcGVuZF9leHRyYV9sb2dvKCkuDQo+IA0KPiBTbyB0aGVyZSdzIGEgcmVsYXRp
b25zaGlwIGFscmVhZHkgYmV0d2VlbiBsb2dvIGFuZCBmYmRldi9jb3JlLCB0aGF0J3Mgd2h5
DQo+IEkgd29uZGVyZWQgaWYgd291bGQgbWFrZSBzZW5zZSB0byBhbHNvIG1vdmUgZHJpdmVy
cy92aWRlby9sb2dvLmMgdG8gaGF2ZQ0KPiBib3RoIGZ1bmN0aW9ucyBpbiB0aGVyZS4NCg0K
RmFpciBlbm91Z2guIEkgd2FzIGxvb2tpbmcgZm9yIHJlZmVyZW5jZXMgdG8gc3RydWN0IGZi
X2luZm8gaW4gdGhlIGxvZ28gDQpjb2RlIGFuZCBmb3VuZCBub25lLiBTYW0ncyBzdWdnZXN0
aW9uIHRvIG1vdmUgdGhlIHJlbWFpbmluZyBjb2RlIGZyb20gDQpmYmRldiB0byBsb2dvLyBt
aWdodCBiZSB0aGUgd2F5IHRvIGdvLg0KDQpJZiB3ZSBldmVyIGdldCB0aGF0IERSTSBib290
LXVwIGNsaWVudCwgaXQgbWlnaHQgd2FudCB0byB1c2UgdGhlIGxvZ28gYXMgDQp3ZWxsLiBI
ZW5jZSwgaXQgbmVlZHMgdG8gYmUgdW5yZWxhdGVkIHRvIGZiZGV2Lg0KDQpCZXN0IHJlZ2Fy
ZHMNClRob21hcw0KDQo+IA0KPiBZZXMsIGFzIG5vdGVkIGRyaXZlcnMvdmlkZW8vY29uc29s
ZS9uZXdwb3J0X2Nvbi5jIGFsc28gdXNlcyBmYl9maW5kX2xvZ28oKQ0KPiBidXQgdGhlIG9u
bHkgb3RoZXIgdXNlciBvZiB0aGF0IGluIGRyaXZlcnMvdmlkZW8vZmJkZXYvY29yZS9mYm1l
bS5jLg0KPiANCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERl
dmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpGcmFua2Vu
c3RyYXNzZSAxNDYsIDkwNDYxIE51ZXJuYmVyZywgR2VybWFueQ0KR0Y6IEl2byBUb3Rldiwg
QW5kcmV3IE15ZXJzLCBBbmRyZXcgTWNEb25hbGQsIEJvdWRpZW4gTW9lcm1hbg0KSFJCIDM2
ODA5IChBRyBOdWVybmJlcmcpDQo=

--------------8JWSIbowzSi0pRaFsTNj06BB--

--------------b6N4q4UfAAULYL4Feg2RyAgi
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmTBQO4FAwAAAAAACgkQlh/E3EQov+CL
xBAAhnaFjrpyo8+dYfnsuE9Fg5/aLvG3K2ldL985zSu6P1K995RehnYQP6Cr5dtCkTQtihKZOfHQ
sX/RgRnHXX4E9MpXWxKFwFSZStvZ0LDmkge6I5i67WHTASEH/tg0GB5b6BrObd+5nP7lWDhkSYa0
Z1iTM6scMr5Qwb55Q89Jq0rOQpICqDwpMYM9vEcBwKKAdj7wS277DS562CW6jMhhcsaeoTfvTsuX
FDox/3Ztc4OpAWpc+S5uMpgNwDwaEG4Aq2iCfGrWJ9fcla/bvAxk6uBPboKxg28GPV8Wd8nDd8tq
gqmu6LMmyFPKVbu+QewOOXF4wp/dke9li6HyqK1QGwzZ3s2h1PGnklaIRDM1sm19R4cC4TXXMrFH
Z8X6TdO6Cx9h/e5pjXqttWm+Un/xSd49o2pdhTrR0IFg1LxwgyqOu9SXV+pfW1CrmLTFh3vhohqd
FqR1P3Qe7EnQtrrftB8S42/lbl7WrFG800lM8dVFDr8H+HxNX40wr30a0vwPafvXDMS6fBE91NYr
WRkkYarLY+/jyS0F+p74mePQjeTY7Lf7IxZ653O5MLtKjohpXhOWKDjITMFvwJBvLn9NwJrJaDuC
6N+upfzq1xPiS1qOXowICRdFc7vBoBCLRE0JaF91TBRr5K2wLprJDMJZB+ceM/d8nnrWZ0N9MGHl
r38=
=jSox
-----END PGP SIGNATURE-----

--------------b6N4q4UfAAULYL4Feg2RyAgi--
