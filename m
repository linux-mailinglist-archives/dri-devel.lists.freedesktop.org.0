Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0481A552F56
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jun 2022 12:02:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FA1A1129E1;
	Tue, 21 Jun 2022 10:02:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A3741129E1
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jun 2022 10:02:17 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 06D5521E86;
 Tue, 21 Jun 2022 10:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1655805736; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sgRdR+LJUBINnIjh6fDihXSa04mLB4E/ODfp6IXWam0=;
 b=uEu5XmuakP9bDXcrCcbs6s011cx+cN7J1WamgKwJ0sgwMFNSRA6NfFMuFfqqL4FCWSEuqi
 9Y6Mlj8P8gwqazlSALZnoruYBRAW2AyqeGKOk9HoXwEDjSp5Zlhv7+0D/3U56nmXrf/TtY
 oo+afa2gpzqs6RLif4Y8vQ9wOxsOKE8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1655805736;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sgRdR+LJUBINnIjh6fDihXSa04mLB4E/ODfp6IXWam0=;
 b=lIjVYP1qOvlou9tNgSfxjDKIz0jD1rD6mMZKC5VYH2lwH1d5wafRjDqVTErksAymzif5FY
 elDxGmeN5rysDTCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B80DA13638;
 Tue, 21 Jun 2022 10:02:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id WJ0CLCeXsWIcOwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 21 Jun 2022 10:02:15 +0000
Message-ID: <045f480b-9f47-6f10-9e5d-4436335b272e@suse.de>
Date: Tue, 21 Jun 2022 12:02:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v4 1/3] drm/rect: Add DRM_RECT_INIT() macro
Content-Language: en-US
To: David Gow <davidgow@google.com>, =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?=
 <jose.exposito89@gmail.com>
References: <20220620160640.3790-1-jose.exposito89@gmail.com>
 <20220620160640.3790-2-jose.exposito89@gmail.com>
 <CABVgOSmPfxdcxuU6xtuT2sN75ivs+Atgmt=2PNcdWqnMcrnbEQ@mail.gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <CABVgOSmPfxdcxuU6xtuT2sN75ivs+Atgmt=2PNcdWqnMcrnbEQ@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------WykebgcvF10Ma6kvJgv0yieD"
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
Cc: magalilemes00@gmail.com, David Airlie <airlied@linux.ie>,
 =?UTF-8?Q?Ma=c3=adra_Canal?= <maira.canal@usp.br>,
 Daniel Latypov <dlatypov@google.com>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Jani Nikula <jani.nikula@intel.com>, tales.aparecida@gmail.com,
 Isabella Basso <isabbasso@riseup.net>,
 KUnit Development <kunit-dev@googlegroups.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------WykebgcvF10Ma6kvJgv0yieD
Content-Type: multipart/mixed; boundary="------------mV5QSMDza2LYMWzA2yt0rZny";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: David Gow <davidgow@google.com>, =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?=
 <jose.exposito89@gmail.com>
Cc: dri-devel@lists.freedesktop.org, magalilemes00@gmail.com,
 David Airlie <airlied@linux.ie>, =?UTF-8?Q?Ma=c3=adra_Canal?=
 <maira.canal@usp.br>, Daniel Latypov <dlatypov@google.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Jani Nikula <jani.nikula@intel.com>, tales.aparecida@gmail.com,
 Isabella Basso <isabbasso@riseup.net>,
 KUnit Development <kunit-dev@googlegroups.com>
Message-ID: <045f480b-9f47-6f10-9e5d-4436335b272e@suse.de>
Subject: Re: [PATCH v4 1/3] drm/rect: Add DRM_RECT_INIT() macro
References: <20220620160640.3790-1-jose.exposito89@gmail.com>
 <20220620160640.3790-2-jose.exposito89@gmail.com>
 <CABVgOSmPfxdcxuU6xtuT2sN75ivs+Atgmt=2PNcdWqnMcrnbEQ@mail.gmail.com>
In-Reply-To: <CABVgOSmPfxdcxuU6xtuT2sN75ivs+Atgmt=2PNcdWqnMcrnbEQ@mail.gmail.com>

--------------mV5QSMDza2LYMWzA2yt0rZny
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjEuMDYuMjIgdW0gMTE6Mzggc2NocmllYiBEYXZpZCBHb3c6DQo+IE9uIFR1
ZSwgSnVuIDIxLCAyMDIyIGF0IDEyOjA2IEFNIEpvc8OpIEV4cMOzc2l0bw0KPiA8am9zZS5l
eHBvc2l0bzg5QGdtYWlsLmNvbT4gd3JvdGU6DQo+Pg0KPj4gQWRkIGEgaGVscGVyIG1hY3Jv
IHRvIGluaXRpYWxpemUgYSByZWN0YW5nbGUgZnJvbSB4LCB5LCB3aWR0aCBhbmQNCj4+IGhl
aWdodCBpbmZvcm1hdGlvbi4NCj4+DQo+PiBSZXZpZXdlZC1ieTogSmFuaSBOaWt1bGEgPGph
bmkubmlrdWxhQGludGVsLmNvbT4NCj4+IEFja2VkLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8
dHppbW1lcm1hbm5Ac3VzZS5kZT4NCj4+IFNpZ25lZC1vZmYtYnk6IEpvc8OpIEV4cMOzc2l0
byA8am9zZS5leHBvc2l0bzg5QGdtYWlsLmNvbT4NCj4+IC0tLQ0KPiANCj4gVGhpcyBsb29r
cyBnb29kIHRvIG1lLCB0aG91Z2ggSSBoYXZlIG9uZSBtaW5vciBjb25jZXJuIGFib3V0IHRo
ZSBtYWNybw0KPiBuYW1lLiAoQnV0IGlmIGl0J3Mgb2theSB3aXRoIHRoZSBEUk0gZm9sa3Ms
IHdoaWNoIGl0IHNlZW1zIHRvIGJlLCBJDQo+IHdvbid0IG9iamVjdC4pDQo+IA0KPiBFaXRo
ZXIgd2F5LA0KPiBSZXZpZXdlZC1ieTogRGF2aWQgR293IDxkYXZpZGdvd0Bnb29nbGUuY29t
Pg0KPiANCj4+ICAgaW5jbHVkZS9kcm0vZHJtX3JlY3QuaCB8IDE2ICsrKysrKysrKysrKysr
KysNCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKykNCj4+DQo+PiBkaWZm
IC0tZ2l0IGEvaW5jbHVkZS9kcm0vZHJtX3JlY3QuaCBiL2luY2x1ZGUvZHJtL2RybV9yZWN0
LmgNCj4+IGluZGV4IDZmNmUxOWJkNGRhYy4uZThkOTRmY2EyNzAzIDEwMDY0NA0KPj4gLS0t
IGEvaW5jbHVkZS9kcm0vZHJtX3JlY3QuaA0KPj4gKysrIGIvaW5jbHVkZS9kcm0vZHJtX3Jl
Y3QuaA0KPj4gQEAgLTQ3LDYgKzQ3LDIyIEBAIHN0cnVjdCBkcm1fcmVjdCB7DQo+PiAgICAg
ICAgICBpbnQgeDEsIHkxLCB4MiwgeTI7DQo+PiAgIH07DQo+Pg0KPj4gKy8qKg0KPj4gKyAq
IERSTV9SRUNUX0lOSVQgLSBpbml0aWFsaXplIGEgcmVjdGFuZ2xlIGZyb20geC95L3cvaA0K
Pj4gKyAqIEB4OiB4IGNvb3JkaW5hdGUNCj4+ICsgKiBAeTogeSBjb29yZGluYXRlDQo+PiAr
ICogQHc6IHdpZHRoDQo+PiArICogQGg6IGhlaWdodA0KPj4gKyAqDQo+PiArICogUkVUVVJO
UzoNCj4+ICsgKiBBIG5ldyByZWN0YW5nbGUgb2YgdGhlIHNwZWNpZmllZCBzaXplLg0KPj4g
KyAqLw0KPj4gKyNkZWZpbmUgRFJNX1JFQ1RfSU5JVCh4LCB5LCB3LCBoKSAoKHN0cnVjdCBk
cm1fcmVjdCl7IFwNCj4+ICsgICAgICAgICAgICAgICAueDEgPSAoeCksIFwNCj4+ICsgICAg
ICAgICAgICAgICAueTEgPSAoeSksIFwNCj4+ICsgICAgICAgICAgICAgICAueDIgPSAoeCkg
KyAodyksIFwNCj4+ICsgICAgICAgICAgICAgICAueTIgPSAoeSkgKyAoaCkgfSkNCj4+ICsN
Cj4gDQo+IE15IG9ubHkgc2xpZ2h0IGNvbmNlcm4gaGVyZSBpcyB0aGF0IGl0IG1pZ2h0IGJl
IGEgbGl0dGxlIGJpdCBjb25mdXNpbmcNCj4gdGhhdCBhIG1hY3JvIGNhbGxlZCBEUk1fUkVD
VF9JTklUKCkgYWNjZXB0cyB4L3kvdy9oLCB3aGVyZWFzIHRoZQ0KPiBhY3R1YWwgc3RydWN0
IGRybV9yZWN0IGlzIHgxL3kxL3gyL3kyLiBJZiB0aGUgbWFjcm8gd2VyZSBjYWxsZWQNCj4g
c29tZXRoaW5nIGxpa2UgRFJNX1JFQ1RfSU5JVF9GUk9NX1hZV0goKSBvciBzaW1pbGFyLg0K
DQpUaGUgZXhpc3RpbmcgZHJtX3JlY3RfaW5pdCgpIGZ1bmN0aW9uIHVzZXMgeHl3aCBhcmd1
bWVudHMuIFNvIHRoZSANCmN1cnJlbnQgbmFtZSBpcyBjb25zaXN0ZW50IHdpdGggZXhpc3Rp
bmcgcHJhY3RpY2UuIEkgZG9uJ3QgdGhpbmsgd2UgDQpyZWZlciB0byB4Mix5MiBtdWNoLCBp
ZiBldmVyLg0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQo+IA0KPiANCj4+ICAgLyoqDQo+
PiAgICAqIERSTV9SRUNUX0ZNVCAtIHByaW50ZiBzdHJpbmcgZm9yICZzdHJ1Y3QgZHJtX3Jl
Y3QNCj4+ICAgICovDQo+PiAtLQ0KPj4gMi4yNS4xDQo+Pg0KDQotLSANClRob21hcyBaaW1t
ZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0
aW9ucyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2Vy
bWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bDvGhyZXI6IEl2
byBUb3Rldg0K

--------------mV5QSMDza2LYMWzA2yt0rZny--

--------------WykebgcvF10Ma6kvJgv0yieD
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmKxlyYFAwAAAAAACgkQlh/E3EQov+BB
hA//Z2+5TeqbVms+t8s0pvSMgY+grT9f139Z0ZAZ3c4y9qpp4Czbh7P2PMABA+9TpjsV3zXWS2ni
FYpjAUJaVo7tKa+d8hwyhCN76Euh0eDQvFZKcUg+5JXEIoLfEoF57guONKZBOqhlJY9g+6ZjuVDw
7j7kScDewUzt7mwuT6kff8qag9kY9jYujElyO0ZN/qA+Av90+nD0hB48QORNOVd7IO5D1LrxcELv
Fjq3iHF85qSmJfQfFTLIizFgHdDGknk+ffESHZC4YbgKUjH5mqMLV3PmwZKOJx/FmopD79DmbblU
iXcfg0KJ3x7nCX4ytWhsN70WpX29H0kqOLLxGM4p6hvV61nfMAr0BgNxyfxw3eqI4Hht4iBV+Cv6
yy7OpqIoKjP4TAdNeEFBBOeN4rbeodVQpRCOGbAhyJIfUFCDxKtqb0JlyrDUGNBK4y1gxCwZKapr
VB5P2bQaVU9yOwfjExFOs4Jp9dAPZS2X0B3JLUyvPqrn0QU8JV7SLyKldJWu7Or/bXIiY/s1XE6r
mMnw06Jk4GHSzVZ32TKV5az2kmypoE0i1NJ50vJxPjhpGPBPAXMoJdJVSIS8SB3NjODajKk+T5KP
n9x4l0I7JtRSYuu6Y82J5MxSyO5B7Ihjy68jt8EhMIsyOTvK5oABsTNgdgfDXX63l4QG1YLN9Zcg
bEU=
=Rs2f
-----END PGP SIGNATURE-----

--------------WykebgcvF10Ma6kvJgv0yieD--
