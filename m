Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62AA66ECE2E
	for <lists+dri-devel@lfdr.de>; Mon, 24 Apr 2023 15:30:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6599310E505;
	Mon, 24 Apr 2023 13:30:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE75610E500;
 Mon, 24 Apr 2023 13:30:02 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 66EAB1FD7D;
 Mon, 24 Apr 2023 13:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1682343000; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tLPbo/UZqeeiUO9KIxTgk4ZZt8WHIXufmzl7K93VOsU=;
 b=FXAYjaIE+ddK6693P2nO5MJMlmKsl6RFQyEWh6fs0X1nnQ0iUuiziFaq1/DFUNwDzPk4Cy
 IDRNVmsaSryTzpdOqJhUbsNmRMdLFaogTUovOLtXQf6hwmfqS4Au+tGiQa/ty85ORN5aBZ
 dI2wGCGSgJt4qeDybzAitw8EAgn6+rI=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E182413780;
 Mon, 24 Apr 2023 13:29:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id tyikNVeERmQ8HQAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 24 Apr 2023 13:29:59 +0000
Message-ID: <9b5c3df3-b795-782d-d01f-ab43868f3675@suse.com>
Date: Mon, 24 Apr 2023 15:29:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Content-Language: en-US
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>
References: <20230424123524.17008-1-janusz.krzysztofik@linux.intel.com>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [RFC PATCH] x86/mm: Fix PAT bit missing from page protection
 modify mask
In-Reply-To: <20230424123524.17008-1-janusz.krzysztofik@linux.intel.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------KgChvB1UOSFWzuvpekN3GQ8z"
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
Cc: Yu Zhao <yuzhao@google.com>, David Hildenbrand <david@redhat.com>,
 intel-gfx@lists.freedesktop.org, x86@kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------KgChvB1UOSFWzuvpekN3GQ8z
Content-Type: multipart/mixed; boundary="------------JIo6qJ5DPUNRum2MSGQXDkVy";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>
Cc: x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>, Yu Zhao <yuzhao@google.com>,
 linux-kernel@vger.kernel.org, Andi Shyti <andi.shyti@linux.intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Nirmoy Das <nirmoy.das@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Message-ID: <9b5c3df3-b795-782d-d01f-ab43868f3675@suse.com>
Subject: Re: [RFC PATCH] x86/mm: Fix PAT bit missing from page protection
 modify mask
References: <20230424123524.17008-1-janusz.krzysztofik@linux.intel.com>
In-Reply-To: <20230424123524.17008-1-janusz.krzysztofik@linux.intel.com>

--------------JIo6qJ5DPUNRum2MSGQXDkVy
Content-Type: multipart/mixed; boundary="------------nZGh77PNEWss04qVuuM8lUrp"

--------------nZGh77PNEWss04qVuuM8lUrp
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjQuMDQuMjMgMTQ6MzUsIEphbnVzeiBLcnp5c3p0b2ZpayB3cm90ZToNCj4gVmlzaWJs
ZSBnbGl0Y2hlcyBoYXZlIGJlZW4gb2JzZXJ2ZWQgd2hlbiBydW5uaW5nIGdyYXBoaWNzIGFw
cGxpY2F0aW9ucyBvbg0KPiBMaW51eCB1bmRlciBYZW4gaHlwZXJ2aXNvci4gIFRob3NlIG9i
c2VydmF0aW9ucyBoYXZlIGJlZW4gY29uZmlybWVkIHdpdGgNCj4gZmFpbHVyZXMgZnJvbSBr
bXNfcHdyaXRlX2NyYyBJbnRlbCBHUFUgdGVzdCB0aGF0IHZlcmlmaWVzIGRhdGEgY29oZXJl
bmN5DQo+IG9mIERSTSBmcmFtZSBidWZmZXIgb2JqZWN0cyB1c2luZyBoYXJkd2FyZSBDUkMg
Y2hlY2tzdW1zIGNhbGN1bGF0ZWQgYnkNCj4gZGlzcGxheSBjb250cm9sbGVycywgZXhwb3Nl
ZCB0byB1c2Vyc3BhY2UgdmlhIGRlYnVnZnMuICBBZmZlY3RlZA0KPiBwcm9jZXNzaW5nIHBh
dGhzIGhhdmUgdGhlbiBiZWVuIGlkZW50aWZpZWQgd2l0aCBuZXcgdGVzdCB2YXJpYW50cyB0
aGF0DQo+IG1tYXAgdGhlIG9iamVjdHMgdXNpbmcgZGlmZmVyZW50IG1ldGhvZHMgYW5kIGNh
Y2hpbmcgbW9kZXMuDQo+IA0KPiBXaGVuIHJ1bm5pbmcgYXMgYSBYZW4gUFYgZ3Vlc3QsIExp
bnV4IHVzZXMgWGVuIHByb3ZpZGVkIFBBVCBjb25maWd1cmF0aW9uDQo+IHdoaWNoIGlzIGRp
ZmZlcmVudCBmcm9tIGl0cyBuYXRpdmUgb25lLiAgSW4gcGFydGljdWxhciwgWGVuIHNwZWNp
ZmljIFBURQ0KPiBlbmNvZGluZyBvZiB3cml0ZS1jb21iaW5pbmcgY2FjaGluZywgbGlrZWx5
IHVzZWQgYnkgZ3JhcGhpY3MgYXBwbGljYXRpb25zLA0KPiBkaWZmZXJzIGZyb20gdGhlIExp
bnV4IGRlZmF1bHQgb25lIGZvdW5kIGFtb25nIHN0YXRpY2FsbHkgZGVmaW5lZCBtaW5pbWFs
DQo+IHNldCBvZiBzdXBwb3J0ZWQgbW9kZXMuICBTaW5jZSBYZW4gZGVmaW5lcyBQVEUgZW5j
b2Rpbmcgb2YgdGhlIFdDIG1vZGUgYXMNCj4gX1BBR0VfUEFULCBpdCBubyBsb25nZXIgYmVs
b25ncyB0byB0aGUgbWluaW1hbCBzZXQsIGRlcGVuZHMgb24gY29ycmVjdA0KPiBoYW5kbGlu
ZyBvZiBfUEFHRV9QQVQgYml0LCBhbmQgY2FuIGJlIG1pc21hdGNoZWQgd2l0aCB3cml0ZS1i
YWNrIGNhY2hpbmcuDQo+IA0KPiBXaGVuIGEgdXNlciBjYWxscyBtbWFwKCkgZm9yIGEgRFJN
IGJ1ZmZlciBvYmplY3QsIERSTSBkZXZpY2Ugc3BlY2lmaWMNCj4gLm1tYXAgZmlsZSBvcGVy
YXRpb24sIGNhbGxlZCBmcm9tIG1tYXBfcmVnaW9uKCksIHRha2VzIGNhcmUgb2Ygc2V0dGlu
ZyBQVEUNCj4gZW5jb2RpbmcgYml0cyBpbiBhIHZtX3BhZ2VfcHJvdCBmaWVsZCBvZiBhbiBh
c3NvY2lhdGVkIHZpcnR1YWwgbWVtb3J5IGFyZWENCj4gc3RydWN0dXJlLiAgVW5mb3J0dW5h
dGVseSwgX1BBR0VfUEFUIGJpdCBpcyBub3QgcHJlc2VydmVkIHdoZW4gdGhlIHZtYSdzDQo+
IC52bV9mbGFncyBhcmUgdGhlbiBhcHBsaWVkIHRvIC52bV9wYWdlX3Byb3QgdmlhIHZtX3Nl
dF9wYWdlX3Byb3QoKS4gIEJpdHMNCj4gdG8gYmUgcHJlc2VydmVkIGFyZSBkZXRlcm1pbmVk
IHdpdGggX1BBR0VfQ0hHX01BU0sgc3ltYm9sIHRoYXQgZG9lc24ndA0KPiBjb3ZlciBfUEFH
RV9QQVQuICBBcyBhIGNvbnNlcXVlbmNlLCBXQiBjYWNoaW5nIGlzIHJlcXVlc3RlZCBpbnN0
ZWFkIG9mIFdDDQo+IHdoZW4gcnVubmluZyB1bmRlciBYZW4gKGFsc28sIFdQIGlzIHNpbGVu
dGx5IGNoYW5nZWQgdG8gV1QsIGFuZCBVQw0KPiBkb3duZ3JhZGVkIHRvIFVDX01JTlVTKS4g
IFdoZW4gcnVubmluZyBvbiBiYXJlIG1ldGFsLCBXQyBpcyBub3QgYWZmZWN0ZWQsDQo+IGJ1
dCBXUCBhbmQgV1QgZXh0cmEgbW9kZXMgYXJlIHVuaW50ZW50aW9uYWxseSByZXBsYWNlZCB3
aXRoIFdDIGFuZCBVQywNCj4gcmVzcGVjdGl2ZWx5Lg0KPiANCj4gV1AgYW5kIFdUIG1vZGVz
LCBlbmNvZGVkIHdpdGggX1BBR0VfUEFUIGJpdCBzZXQsIHdlcmUgaW50cm9kdWNlZCBieSBj
b21taXQNCj4gMjgxZDQwNzhiZWMzICgieDg2OiBNYWtlIHBhZ2UgY2FjaGUgbW9kZSBhIHJl
YWwgdHlwZSIpLiAgQ2FyZSB3YXMgdGFrZW4NCj4gdG8gZXh0ZW5kIF9QQUdFX0NBQ0hFX01B
U0sgc3ltYm9sIHdpdGggdGhhdCBhZGRpdGlvbmFsIGJpdCwgYnV0IHRoYXQNCj4gc3ltYm9s
IGhhcyBuZXZlciBiZWVuIHVzZWQgZm9yIGlkZW50aWZpY2F0aW9uIG9mIGJpdHMgcHJlc2Vy
dmVkIHdoZW4NCj4gYXBwbHlpbmcgcGFnZSBwcm90ZWN0aW9uIGZsYWdzLiAgU3VwcG9ydCBm
b3IgYWxsIGNhY2hlIG1vZGVzIHVuZGVyIFhlbiwNCj4gaW5jbHVkaW5nIHRoZSBwcm9ibGVt
YXRpYyBXQyBtb2RlLCB3YXMgdGhlbiBpbnRyb2R1Y2VkIGJ5IGNvbW1pdA0KPiA0NzU5MWRm
NTA1MTIgKCJ4ZW46IFN1cHBvcnQgWGVuIHB2LWRvbWFpbnMgdXNpbmcgUEFUIikuDQo+IA0K
PiBFeHRlbmQgYml0bWFzayB1c2VkIGJ5IHBncHJvdF9tb2RpZnkoKSBmb3Igc2VsZWN0aW5n
IGJpdHMgdG8gYmUgcHJlc2VydmVkDQo+IHdpdGggX1BBR0VfUEFUIGJpdC4gIEhvd2V2ZXIs
IHNpbmNlIHRoYXQgYml0IGNhbiBiZSByZXVzZWQgYXMgX1BBR0VfUFNFLA0KPiBhbmQgdGhl
IF9QQUdFX0NIR19NQVNLIHN5bWJvbCwgcHJpbWFybHkgdXNlZCBieSBwdGVfbW9kaWZ5KCks
IGlzIGxpa2VseQ0KPiBpbnRlbnRpb25hbGx5IGRlZmluZWQgd2l0aCB0aGF0IGJpdCBub3Qg
c2V0LCBrZWVwIHRoYXQgc3ltYm9sIHVuY2hhbmdlZC4NCg0KSG1tLCBJIHdvbmRlciB3aGV0
aGVyIHB0ZV9ta2h1Z2UoKSBzaG91bGRuJ3QganVzdCBzZXQgX1BBR0VfUFNFLCBidXQgdXNl
DQpwZ3Byb3RfNGtfMl9sYXJnZSgpIGJlZm9yZSBkb2luZyBzby4NCg0KT1RPSCBhIHVzZSBj
YXNlIGxpa2UgaW4gcmVtb3ZlX21pZ3JhdGlvbl9wdGUoKSwgd2hlcmUgcHRlX21raHVnZSgp
IGlzDQpkaXJlY3RseSBmb2xsb3dlZCBieSBhIGNhbGwgb2YgYXJjaF9tYWtlX2h1Z2VfcHRl
KCksIHdoaWNoIGluIHR1cm4gaXMNCmNhbGxpbmcgcHRlX21raHVnZSgpIGFnYWluLCB3b3Vs
ZCBzZXQgX2Fsd2F5c18gdGhlIFBBVCBiaXQuDQoNCldoZW4gcnVubmluZyBhcyBhIFhlbiBQ
ViBndWVzdCB0aGlzIGRvZXNuJ3QgbWF0dGVyIGF0IGFsbCwgYXMgbGFyZ2Ugb3INCmh1Z2Ug
cGFnZXMgYXJlbid0IHN1cHBvcnRlZCB0aGVyZS4gU28gY2xlYXJseSBzb21ldGhpbmcgZm9y
IHRoZSBNTQ0KbWFpbnRhaW5lcnMuIDotKQ0KDQoNCkp1ZXJnZW4NCg0KUC5TLjogSmFudXN6
LCBuaWNlIGNhdGNoISBUaGUgUXViZXNPUyBmb2xrcyB3aG8gcmVwb3J0ZWQgdGhlIHByb2Js
ZW0NCiAgICAgICBvcmlnaW5hbGx5IHdpbGwgdGVzdCB5b3VyIHBhdGNoIHVuZGVyIFhlbiBz
b29uLg0K
--------------nZGh77PNEWss04qVuuM8lUrp
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------nZGh77PNEWss04qVuuM8lUrp--

--------------JIo6qJ5DPUNRum2MSGQXDkVy--

--------------KgChvB1UOSFWzuvpekN3GQ8z
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmRGhFcFAwAAAAAACgkQsN6d1ii/Ey/i
RQf/TRbhRJqx5FYf6UKJIfwG6Blsnm6rpsjHnf39a8CdQFtq+BCiarh223RPa1o+vgudpUXifDfs
r4lZskH1YjMGUgXUBuAHeOer3Yyza5SD+2/JH3QO4WyBEpRL6bBgrWlaCFe8JfOiu7YXK3xQsSxl
QSuruEzYvBbiE6PV7KPW987s4Ej4hi71yMKAm60APhrglk0chCZ8DK6v/PDvRXaikZfehNl5ozeN
+zxZKOqQGCf0w499k8UnuTnGiILm0/NBl+gM4A7z0/lOzAra2W4+TUd5eZ4/+8DlbeAP3X4fQAsR
B7PhJbxs6XiIM/qB6NAum41xAZ9sn4wefCjxNEh2+A==
=VfcL
-----END PGP SIGNATURE-----

--------------KgChvB1UOSFWzuvpekN3GQ8z--
