Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8327455B8CF
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jun 2022 10:56:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED3A411A234;
	Mon, 27 Jun 2022 08:56:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A6AD11A22F;
 Mon, 27 Jun 2022 08:56:33 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 0596C1FAD0;
 Mon, 27 Jun 2022 08:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1656320192; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sNDGGJZYbSknX3zdPg+0NF59YkwA06a7lS+a32dT9m4=;
 b=mEArAMq28hc8sdZkXzGXohcABlOtjiGIW0At+3nSW0GR6a0CNMamQCVavi8JTusQNE2EWn
 xTSt8fhwhDVj3S4Wu0Pv9gPOMQFB42nyZoKbADgKR7grNgn4qYA2Ft2ZOV0q0uUtjCsUVu
 cPqqbO6ajrJNVemKn9//6kZZox1FwPc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1656320192;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sNDGGJZYbSknX3zdPg+0NF59YkwA06a7lS+a32dT9m4=;
 b=NTD+Gd1BoI7tHmsf2iPsHlBFLSyTs9dLsq2QODzuaDwdmqQJaqf2tYqGOZgVppA2bWiLEM
 dyhOYzR4zOSWTlAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CD0B513AB2;
 Mon, 27 Jun 2022 08:56:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id eRUjMb9wuWIXGwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 27 Jun 2022 08:56:31 +0000
Message-ID: <077b67c3-20f2-5137-2cad-7b3a832a4779@suse.de>
Date: Mon, 27 Jun 2022 10:56:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: Annoying AMDGPU boot-time warning due to simplefb / amdgpu
 resource clash
Content-Language: en-US
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Javier Martinez Canillas <javierm@redhat.com>, Zack Rusin
 <zackr@vmware.com>, Hans de Goede <hdegoede@redhat.com>
References: <CAHk-=wh42rU5mKU6=PCK5tdkYjh7r31dGNmYdHwqpFnRFvVudA@mail.gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <CAHk-=wh42rU5mKU6=PCK5tdkYjh7r31dGNmYdHwqpFnRFvVudA@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------dJfV7Gf58wwEOpXOJd40uubG"
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------dJfV7Gf58wwEOpXOJd40uubG
Content-Type: multipart/mixed; boundary="------------czKrnUe3Xo7Q0TkeH8mMCzxZ";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Javier Martinez Canillas <javierm@redhat.com>, Zack Rusin
 <zackr@vmware.com>, Hans de Goede <hdegoede@redhat.com>
Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Message-ID: <077b67c3-20f2-5137-2cad-7b3a832a4779@suse.de>
Subject: Re: Annoying AMDGPU boot-time warning due to simplefb / amdgpu
 resource clash
References: <CAHk-=wh42rU5mKU6=PCK5tdkYjh7r31dGNmYdHwqpFnRFvVudA@mail.gmail.com>
In-Reply-To: <CAHk-=wh42rU5mKU6=PCK5tdkYjh7r31dGNmYdHwqpFnRFvVudA@mail.gmail.com>

--------------czKrnUe3Xo7Q0TkeH8mMCzxZ
Content-Type: multipart/mixed; boundary="------------EMdexheBKJ03n2W7PpEmX3SP"

--------------EMdexheBKJ03n2W7PpEmX3SP
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjYuMDYuMjIgdW0gMjA6NTQgc2NocmllYiBMaW51cyBUb3J2YWxkczoNCj4g
U28gdGhpcyBoYXMgYmVlbiBnb2luZyBvbiBmb3IgYSB3aGlsZSwgYW5kIGl0J3MgcXVpdGUg
YW5ub3lpbmcuDQo+IA0KPiBBdCBib290dXAsIG15IG1haW4gZGVza3RvcCAoVGhyZWFkcmlw
cGVyIDM5NzBYIHdpdGggcmFkZW9uIGdyYXBoaWNzKQ0KPiBub3cgY29tcGxhaW5zIGFib3V0
DQo+IA0KPiAgICByZXNvdXJjZSBzYW5pdHkgY2hlY2s6IHJlcXVlc3RpbmcgW21lbSAweGQw
MDAwMDAwLTB4ZGZmZmZmZmZdLCB3aGljaA0KPiBzcGFucyBtb3JlIHRoYW4gQk9PVEZCIFtt
ZW0gMHhkMDAwMDAwMC0weGQwMmZmZmZmXQ0KPiANCj4gYW5kIHRoZW4gZ2l2ZXMgbWUgYSBu
YXN0eSBjYWxsY2hhaW4gdGhhdCBpcyBiYXNpY2FsbHkgdGhlIGFtZGdwdSBwcm9iZQ0KPiBz
ZXF1ZW5jZSBlbmRpbmcgaW4gYW1kZ3B1X2JvX2luaXQoKSBkb2luZyB0aGUNCj4gYXJjaF9p
b19yZXNlcnZlX21lbXR5cGVfd2MoKSB3aGljaCBpcyB0aGVuIHdoYXQgY29tcGxhaW5zLg0K
PiANCj4gVGhhdCAiQk9PVEZCIiByZXNvdXJjZSBpcyBmcm9tIHN5c2ZiX3NpbXBsZWZiLmMs
IGFuZCBJIHRoaW5rIHdoYXQNCj4gc3RhcnRlZCB0cmlnZ2VyaW5nIHRoaXMgaXMgY29tbWl0
IGM5Njg5ODM0MmMzOCAoImRyaXZlcnMvZmlybXdhcmU6DQo+IERvbid0IG1hcmsgYXMgYnVz
eSB0aGUgc2ltcGxlLWZyYW1lYnVmZmVyIElPIHJlc291cmNlIikuDQo+IA0KPiBCZWNhdXNl
IGl0IHR1cm5zIG91dCB0aGF0IHRoYXQgcmVtb3ZlZCB0aGUgSU9SRVNPVVJDRV9CVVNZLCB3
aGljaCBpbg0KPiB0dXJuIGlzIHdoYXQgbWFrZXMgdGhlIHJlc291cmNlIGNvbmZsaWN0IGNv
ZGUgY29tcGxhaW4gYWJvdXQgaXQgbm93LA0KPiBiZWNhdXNlDQo+IA0KPiAgICAgICAgICAg
ICAgICAgIC8qDQo+ICAgICAgICAgICAgICAgICAgICogaWYgYSByZXNvdXJjZSBpcyAiQlVT
WSIsIGl0J3Mgbm90IGEgaGFyZHdhcmUgcmVzb3VyY2UNCj4gICAgICAgICAgICAgICAgICAg
KiBidXQgYSBkcml2ZXIgbWFwcGluZyBvZiBzdWNoIGEgcmVzb3VyY2U7IHdlIGRvbid0IHdh
bnQNCj4gICAgICAgICAgICAgICAgICAgKiB0byB3YXJuIGZvciB0aG9zZTsgc29tZSBkcml2
ZXJzIGxlZ2l0aW1hdGVseSBtYXAgb25seQ0KPiAgICAgICAgICAgICAgICAgICAqIHBhcnRp
YWwgaGFyZHdhcmUgcmVzb3VyY2VzLiAoZXhhbXBsZTogdmVzYWZiKQ0KPiAgICAgICAgICAg
ICAgICAgICAqLw0KPiANCj4gc28gdGhlIGlzc3VlIGlzIHRoYXQgbm93IHRoZSByZXNvdXJj
ZSBjb2RlIC0gY29ycmVjdGx5IC0gc2F5cyAiaGV5LA0KPiB5b3UgaGF2ZSAqdHdvKiBjb25m
bGljdGluZyBkcml2ZXIgbWFwcGluZ3MiLg0KPiANCj4gQW5kIHRoYXQgY29tbWl0IGNsYWlt
cyBpdCBkaWQgaXQgYmVjYXVzZSAid2hpY2ggY2FuIGxlYWQgdG8gZHJpdmVycw0KPiByZXF1
ZXN0aW5nIHRoZSBzYW1lIG1lbW9yeSByZXNvdXJjZSB0byBmYWlsIiwgYnV0IC0gb25jZSBh
Z2FpbiAtIHRoZQ0KPiBsaW5rIGluIHRoZSBjb21taXQgdGhhdCBtaWdodCBhY3R1YWxseSB0
ZWxsIG1vcmUgaXMganVzdCBvbmUgb2YgdGhvc2UNCj4gdXNlbGVzcyBwYXRjaCBzdWJtaXNz
aW9uIGxpbmtzIGFnYWluLg0KPiANCj4gU28gd2hvIGtub3dzIHdoeSB0aGF0IGNvbW1pdCB3
YXMgYWN0dWFsbHkgZG9uZSwgYnV0IGl0J3MgY2F1c2luZyBhbm5veWFuY2UuDQo+IA0KPiBJ
ZiBzaW1wbGVmYiBpcyBhY3R1YWxseSBzdGlsbCB1c2luZyB0aGF0IGZyYW1lIGJ1ZmZlciwg
aXQncyBhIHByb2JsZW0uDQo+IElmIGl0IGlzbid0LCB0aGVuIG1heWJlIHRoYXQgcmVzb3Vy
Y2Ugc2hvdWxkIGhhdmUgYmVlbiByZWxlYXNlZD8NCg0KQXMgSmF2aWVyIHNhaWQsIHRoYXQg
cmVzb3VyY2UgaXMgdGhlIGZyYW1lYnVmZmVyIHRoYXQncyBzZXQgdXAgYnkgdGhlIA0KZmly
bXdhcmUuIEl0IHNob3VsZCBiZSBnb25lIGFmdGVyIHRoZSBjYWxsIHRvIA0KZHJtX2FwZXJ0
dXJlX3JlbW92ZV9jb25mbGljdGluZ19wY2lfZnJhbWVidWZmZXJzKCkuIFsxXSBUaGUgY2Fs
bCB0byANCmFtZGdwdV9ib19pbml0KCkgcnVucyBhZnRlcndhcmRzLCBzbyB0aGF0IHJlbW92
YWwgYXBwYXJlbnRseSBmYWlsZWQuDQoNCklzIHRoZSBCT09URkIgZW50cnkgc3RpbGwgbGlz
dGVkIGluIC9wcm9jL2lvbWVtIGFmdGVyIHRoZSBzeXN0ZW0gDQpmaW5pc2hlZCBib290aW5n
Pw0KDQpBdHRhY2hlZCBpcyBhICh0b3RhbGx5IHVudGVzdGVkKSBwYXRjaCB0byBtYW51YWxs
eSBwb2ludCBhbWRncHUgdG8gdGhlIA0KcmlnaHQgbG9jYXRpb24uIERvZXMgaXQgZml4IHRo
ZSBwcm9ibGVtPw0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQpbMV0gDQpodHRwczovL2Vs
aXhpci5ib290bGluLmNvbS9saW51eC92NS4xOC43L3NvdXJjZS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMjTDIwNzcNCg0KPiANCj4gSSByZWFsbHkgdGhpbmsg
dGhhdCBjb21taXQgYzk2ODk4MzQyYzM4IGlzIGJ1Z2d5LiBJdCB0YWxrcyBhYm91dCAibGV0
DQo+IGRyaXZlcnMgdG8gcmVxdWVzdCBpdCBhcyBidXN5IGluc3RlYWQiLCBidXQgdGhlbiBp
dCByZWdpc3RlcnMgYQ0KPiByZXNvdXJjZSB0aGF0IGlzbid0IGFjdHVhbGx5IGEgcHJvcGVy
IHJlYWwgcmVzb3VyY2UuIEl0J3MganVzdCBhDQo+IHJhbmRvbSBpbmNvbXBsZXRlIGNodW5r
IG9mIHRoZSBhY3R1YWwgcmVhbCB0aGluZywgc28gaXQgd2lsbCBzdGlsbA0KPiBpbnRlcmZl
cmUgd2l0aCByZXNvdXJjZSBhbGxvY2F0aW9uLCBhbmQgaW4gZmFjdCBub3cgaW50ZXJmZXJl
cyBldmVuDQo+IHdpdGggdGhhdCAic2V0IG1lbXR5cGUiIGJlY2F1c2Ugb2YgdGhpcyB2YWxp
ZCB3YXJuaW5nLg0KPiANCj4gICAgICAgICAgICAgICBMaW51cw0KDQotLSANClRob21hcyBa
aW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNv
bHV0aW9ucyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywg
R2VybWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bDvGhyZXI6
IEl2byBUb3Rldg0K
--------------EMdexheBKJ03n2W7PpEmX3SP
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-drm-amdgpu-Remove-firmware-framebuffer-without-PCI-h.patch"
Content-Disposition: attachment;
 filename*0="0001-drm-amdgpu-Remove-firmware-framebuffer-without-PCI-h.pa";
 filename*1="tch"
Content-Transfer-Encoding: base64

RnJvbSBjMzdmMGZhOGU3NjNjNDcxZGRhY2NjMDhkYTllYzliYjFhNzE1NDUxIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5A
c3VzZS5kZT4KRGF0ZTogTW9uLCAyNyBKdW4gMjAyMiAxMDo1MTo0NCArMDIwMApTdWJqZWN0
OiBbUEFUQ0hdIGRybS9hbWRncHU6IFJlbW92ZSBmaXJtd2FyZSBmcmFtZWJ1ZmZlciB3aXRo
b3V0IFBDSSBoZWxwZXIKClRoZSBEUk0gYXBlcnR1cmUgaGVscGVyIGZvciBQQ0kgZGV2aWNl
cyBmYWlscyB0byByZW1vdmUgdGhlIGZpcm13YXJlCmZyYW1lYnVmZmVyJ3MgZGV2aWNlLiBN
YW51YWxseSB0ZWxsIGl0IHdoZXJlIHRvIGxvb2suCgpSZXBvcnRlZC1ieTogTGludXMgVG9y
dmFsZHMgPHRvcnZhbGRzQGxpbnV4LWZvdW5kYXRpb24ub3JnPgpTaWduZWQtb2ZmLWJ5OiBU
aG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4KLS0tCiBkcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMgfCAzICsrLQogMSBmaWxlIGNoYW5nZWQs
IDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV9kcnYuYwppbmRleCA0NmVmNTdiMDdjMTUuLmUwMDMxOGZmNjZmZiAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kcnYuYwpAQCAtMjA3Myw3
ICsyMDczLDggQEAgc3RhdGljIGludCBhbWRncHVfcGNpX3Byb2JlKHN0cnVjdCBwY2lfZGV2
ICpwZGV2LAogCWlzX2Z3X2ZiID0gYW1kZ3B1X2lzX2Z3X2ZyYW1lYnVmZmVyKGJhc2UsIHNp
emUpOwogCiAJLyogR2V0IHJpZCBvZiB0aGluZ3MgbGlrZSBvZmZiICovCi0JcmV0ID0gZHJt
X2FwZXJ0dXJlX3JlbW92ZV9jb25mbGljdGluZ19wY2lfZnJhbWVidWZmZXJzKHBkZXYsICZh
bWRncHVfa21zX2RyaXZlcik7CisJcmV0ID0gZHJtX2FwZXJ0dXJlX3JlbW92ZV9jb25mbGlj
dGluZ19mcmFtZWJ1ZmZlcnMoYmFzZSwgc2l6ZSwgaXNfZndfZmIsCisJCQkJCQkJICAgJmFt
ZGdwdV9rbXNfZHJpdmVyKTsKIAlpZiAocmV0KQogCQlyZXR1cm4gcmV0OwogCi0tIAoyLjM2
LjEKCg==

--------------EMdexheBKJ03n2W7PpEmX3SP--

--------------czKrnUe3Xo7Q0TkeH8mMCzxZ--

--------------dJfV7Gf58wwEOpXOJd40uubG
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmK5cL8FAwAAAAAACgkQlh/E3EQov+BI
+A//QwcGBIY/TvAivjrnSDNd/9ltQqJ5CA/d5FWZcmB+qcTULWph+u2Cbg3Y84NDzVNCbNOPM73M
yAVJur5rtRVw9Ou8vgaBJD45hOZYBpBQX5X/Yu1d8u+UEDUOMW+F1LYvK2692A/ZN2yS3n8Hz7UL
ca1J/F+DGaEhbOK0pyQom6l2MfZhStgCP1GsYJWc29IOrqSoW+E4Ddxc69oOJ2fi/BnKIJHUt6bf
hbwStFJ7zNtBllfpAvZ5ZEKFa1m2tpBCZs25httWEq4lBPGzUGvXnspfIuWotlBcoxGpriKViXmc
ub7cDwIyt/xb+YTb5IikrH5fbXzakyzuRnl99KhOI1cPlCRAINPrKhFyjipqcT30lOhqGPL05wdj
w4a18FzaAZDXwPFxeMAAWqEwDmx4qCWVRFsa/tz/sZixLDEtkirDHAieSvlBZyBbo6jD/Hi1//nd
kSRyy6fQCGIFoA6ng8zragMp4E/vIfriBX50/zpCER9dgXodpelso3E1kN3v84RC4g2gmyg3YXO5
XYlAL7S7NY1xjYD8/zAIIGn2peVOM7yQwcaz7Vl4e9qJ9LaF0TIyHNvFNqIJ/aAooLjCQ5tlnStM
80LIxva/AV/LUQLzaE1pZu8RM8kTLWVII7hBskguWtFYXGvxad1nvtmPqWGdt5mMgWuQJuZi4nCR
LYo=
=awxI
-----END PGP SIGNATURE-----

--------------dJfV7Gf58wwEOpXOJd40uubG--
