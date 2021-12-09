Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 028D846EF0F
	for <lists+dri-devel@lfdr.de>; Thu,  9 Dec 2021 17:59:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C234B10E195;
	Thu,  9 Dec 2021 16:54:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0243B8972B
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Dec 2021 12:53:44 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 9D91A210FF;
 Thu,  9 Dec 2021 12:53:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1639054422; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5vp7wzcFFJjjx5AjDuR1iEkEbCLhDRGFGjElrTWzlrY=;
 b=vjYRvrzATrl2PnEaQ6PoJZkTPiWqcsLyXM2P4CRJQb6tRUZK0nnmsjevr7wqRlr8YDiLsD
 tunfBMr/ql7yrC6164oiuqxsykYvqg9+iaDKaDBHY0XD9DFUJmO+TaavdKVYez7xSv/APe
 37cZhcTXvDmuBhgmN66wpIr0yBFf060=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1639054422;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5vp7wzcFFJjjx5AjDuR1iEkEbCLhDRGFGjElrTWzlrY=;
 b=/Y8QcAbmYiq4U/4Geula95/q+Xx0lw/AYF1NWUYbyvvQMC9qtoX2yLDVTf48+2/NBingfQ
 4FRkoxSG1mvZ/DCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 80FFF13B2D;
 Thu,  9 Dec 2021 12:53:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 529qHlb8sWHKcAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 09 Dec 2021 12:53:42 +0000
Message-ID: <194c4beb-7fb2-bdf8-f203-734e9934644a@suse.de>
Date: Thu, 9 Dec 2021 13:53:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH v1 1/1] drm: Replace kernel.h with the necessary inclusions
Content-Language: en-US
To: Andy Shevchenko <andy.shevchenko@gmail.com>
References: <20211110102423.54282-1-andriy.shevchenko@linux.intel.com>
 <887a15cb-3a3b-4ba2-aa0f-a241e70a19fa@suse.de>
 <CAHp75VdY57xQBLN8vT3RdagQx=4kLx69qAyuzLwqTvNGC2xUbQ@mail.gmail.com>
 <d536e7d2-891e-e0a8-6abc-6694987a65f7@suse.de>
 <YZJGEi6Qqh1aGCxa@smile.fi.intel.com> <YZ0Xrus5wZar3QN7@smile.fi.intel.com>
 <YbH1mBlbuysch15b@smile.fi.intel.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <YbH1mBlbuysch15b@smile.fi.intel.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------1cCqtZpfp2pa0kxRc4aadloP"
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
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------1cCqtZpfp2pa0kxRc4aadloP
Content-Type: multipart/mixed; boundary="------------rckR2QJs83MfqaQVpLbynvFR";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: David Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Message-ID: <194c4beb-7fb2-bdf8-f203-734e9934644a@suse.de>
Subject: Re: [PATCH v1 1/1] drm: Replace kernel.h with the necessary
 inclusions
References: <20211110102423.54282-1-andriy.shevchenko@linux.intel.com>
 <887a15cb-3a3b-4ba2-aa0f-a241e70a19fa@suse.de>
 <CAHp75VdY57xQBLN8vT3RdagQx=4kLx69qAyuzLwqTvNGC2xUbQ@mail.gmail.com>
 <d536e7d2-891e-e0a8-6abc-6694987a65f7@suse.de>
 <YZJGEi6Qqh1aGCxa@smile.fi.intel.com> <YZ0Xrus5wZar3QN7@smile.fi.intel.com>
 <YbH1mBlbuysch15b@smile.fi.intel.com>
In-Reply-To: <YbH1mBlbuysch15b@smile.fi.intel.com>

--------------rckR2QJs83MfqaQVpLbynvFR
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDkuMTIuMjEgdW0gMTM6MjQgc2NocmllYiBBbmR5IFNoZXZjaGVua286DQo+
IE9uIFR1ZSwgTm92IDIzLCAyMDIxIGF0IDA2OjMyOjQ2UE0gKzAyMDAsIEFuZHkgU2hldmNo
ZW5rbyB3cm90ZToNCj4+IE9uIE1vbiwgTm92IDE1LCAyMDIxIGF0IDAxOjM1OjQ3UE0gKzAy
MDAsIEFuZHkgU2hldmNoZW5rbyB3cm90ZToNCj4+PiBPbiBXZWQsIE5vdiAxMCwgMjAyMSBh
dCAwNTozOTozM1BNICswMTAwLCBUaG9tYXMgWmltbWVybWFubiB3cm90ZToNCj4+Pj4gQW0g
MTAuMTEuMjEgdW0gMTc6MzQgc2NocmllYiBBbmR5IFNoZXZjaGVua286DQo+Pj4+PiBPbiBX
ZWQsIE5vdiAxMCwgMjAyMSBhdCAzOjU1IFBNIFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVy
bWFubkBzdXNlLmRlPiB3cm90ZToNCj4+Pj4+PiBBbSAxMC4xMS4yMSB1bSAxMToyNCBzY2hy
aWViIEFuZHkgU2hldmNoZW5rbzoNCj4+Pg0KPj4+IC4uLg0KPj4+DQo+Pj4+Pj4+ICsjaW5j
bHVkZSA8bGludXgvY29udGFpbmVyX29mLmg+DQo+Pj4+Pj4NCj4+Pj4+PiBJIGJ1aWx0IHRo
aXMgcGF0Y2ggb24gYSByZWNlbnQgZHJtLW1pc2MtbmV4dCwgYnV0IHRoZXJlJ3Mgbm8NCj4+
Pj4+PiBsaW51eC9jb250YWluZXJfb2YuaA0KPj4+Pj4NCj4+Pj4+IFRoYW5rIHlvdSBmb3Ig
dHJ5aW5nLiBJdCdzIGluIHRoZSB1cHN0cmVhbSwgd2hlbmV2ZXIgZHJtLW1pc2MtbmV4dA0K
Pj4+Pj4gc3dpdGNoZXMgdG8gbmV3ZXIvbmV3ZXN0IHVwc3RyZWFtIGl0IHdpbGwgYmUgdGhl
cmUuIEkgYXNzdW1lIGl0IHdpbGwNCj4+Pj4+IGhhcHBlbiBhZnRlciB2NS4xNi1yYzE/DQo+
Pj4+DQo+Pj4+IFllcywgd2UnbGwgY2VydGFpbmx5IGJhY2ttZXJnZSBzb29uIGFmdGVyIHJj
MSBoYXMgYmVlbiByZWxlYXNlZC4gSWYgSSBmb3JnZXQNCj4+Pj4gdG8gYWRkIHRoZSBwYXRj
aCB0aGVuLCBwbGVhc2Ugc2VuZCBhIHJlbWluZGVyLg0KPj4+Pg0KPj4+PiBPbmNlIHRoZSBu
ZWNlc3NhcnkgaGVhZGVycyBhcmUgYXZhaWxhYmxlLA0KPj4+DQo+Pj4gJCBnaXQgbG9nIC0t
b25lbGluZSB2NS4xNi1yYzEgLS0gaW5jbHVkZS9saW51eC9jb250YWluZXJfb2YuaA0KPj4+
IGUxZWRjMjc3ZTZmNiBsaW51eC9jb250YWluZXJfb2YuaDogc3dpdGNoIHRvIHN0YXRpY19h
c3NlcnQNCj4+PiBkMmE4ZWJiZjgxOTIga2VybmVsLmg6IHNwbGl0IG91dCBjb250YWluZXJf
b2YoKSBhbmQgdHlwZW9mX21lbWJlcigpIG1hY3Jvcw0KPj4+DQo+Pj4+IHRoZSBwYXRjaCBp
cw0KPj4+PiBBY2tlZC1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2Uu
ZGU+DQo+Pj4NCj4+PiBUaGFua3MhDQo+Pg0KPj4gTWF5YmUgSSBtaXN1bmRlcnN0b29kIHNv
bWV0aGluZywgSSB0aG91Z2h0IHRoYXQgRFJNIHBlb3BsZSBtYXkgYXBwbHkgdGhpcywNCj4+
IGlzIGl0IGluY29ycmVjdCBhc3N1bXB0aW9uPw0KPiANCj4gSXQgc3RpbGwgZG9lcyBub3Qg
YXBwZWFyIGluIExpbnV4IE5leHQuLi4NCj4gV2hhdCBzaG91bGQgSSBkbyB0byBtb3ZlIHRo
aXMgZm9yd2FyZCwgcGxlYXNlPw0KPiANCg0KSXQncyBub3cgaW4gZHJtLW1pc2MtbmV4dC4g
U29ycnkgdGhhdCBpdCBmZWxsIHRocm91Z2ggdGhlIGNyYWNrcy4NCg0KQmVzdCByZWdhcmRz
DQpUaG9tYXMNCg0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIg
RGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCk1heGZl
bGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8
cm5iZXJnKQ0KR2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rldg0K

--------------rckR2QJs83MfqaQVpLbynvFR--

--------------1cCqtZpfp2pa0kxRc4aadloP
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmGx/FUFAwAAAAAACgkQlh/E3EQov+CI
zhAAghUaDo+OmrUxMrwMq18uh00F1tnKtzT3s2FNZn73GZy9ymcVrYsHDcG5LtQJME+1uAUpIMDr
5PQItFzaCYWgdwztw2KPSQgSzW3nXTUUilb2O+JKSPtMOjMZCNa9zaUx7X5Bk3tk6CgPz46/+Sm0
NhaHZhFnuoqd6MsM6Wp6DT/1jbnZBJbEdpS0QrHkO/RjAAaCfOujN0Sg7YvWtLzyvTRYyGZBjZtV
+A+Xd+aS9wibJqmXnD1bDXr4Uq/FGYs3282Mv+93sEN5CeHknNjLMeTahSxYi5fBO8bfGsOmHcey
hI3UqmGCwIwQBXY93bEsNeJglPEieBGx+uch/2p/DbnK9JaqRcrjNz/AP+5fXdJrY0t++NaNea2f
wUGMyO0sOQKScFGQETzEjfApcXBZlh0qDQ9UBUD0kqHbhKoSSWgZhl3uWod53aa6mZRP3pxHwOvO
lWq0nWcHY2q0ULmo0g53Yw5m0wk7jXJ6RWaaLqptVLN0hTF1/VvGLnINfJmfw1WPKEIDCHdweW0T
DTj9xzLNkg+z3M5WAZ9sqK7aeSyUieOkcjN9EdwPrz3dM/nN2pH86Qihl/A/GwYaxlqLRHqldOE1
DCv3WWUfSGfI3wZnOjPOkH8N0uwu4M584PjCm+jRzLDEheMIG+u6dirGkeHJE0p35niI/8RU33ha
xRM=
=U74e
-----END PGP SIGNATURE-----

--------------1cCqtZpfp2pa0kxRc4aadloP--
