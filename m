Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E57526F167C
	for <lists+dri-devel@lfdr.de>; Fri, 28 Apr 2023 13:20:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5429E10ECE5;
	Fri, 28 Apr 2023 11:20:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3D8710ECE5
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Apr 2023 11:20:49 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 2ADE720063;
 Fri, 28 Apr 2023 11:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1682680848; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QrtKnpdRDgv74PsteMB1h862ewsUQ8sKRPoN4ICARQI=;
 b=d5cvE3uw8jvhrvK+4srmRrhf9ewj5UCue9Sr8y342sxz0PyhhSLBdzLoctq4uAMDgp3xKR
 rhPlkTrglVnlOP969u6BZIAbIHubaslJAec+okpEE0ugwjVgpzFbX10utFBHFQ68tjr6+R
 Z1Vmp5B0EcHyBVdsjrHIbq7+4TDNLg0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1682680848;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QrtKnpdRDgv74PsteMB1h862ewsUQ8sKRPoN4ICARQI=;
 b=NLQKfFZYbtnPNtbkZcXBVG97tcm2taj9Zm6mLrzA4TlKnaXU14gIR7UaDMVRQw+vIdkfwk
 6iKAlEAr8zcUG4Cg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E806A138FA;
 Fri, 28 Apr 2023 11:20:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id dZyxNw+sS2SHVQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 28 Apr 2023 11:20:47 +0000
Message-ID: <b7c09aa8-ce41-9c9a-062f-e652ea92f8a8@suse.de>
Date: Fri, 28 Apr 2023 13:20:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 5/6] fbdev: Move CFB read and write code into helper
 functions
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <20230425142846.730-1-tzimmermann@suse.de>
 <20230425142846.730-6-tzimmermann@suse.de>
 <CAMuHMdU-_w9yQHYhOCD3cz4CEY6ag-dTXjuHSLnzty0hAMBbXw@mail.gmail.com>
 <1d81e4cc-5079-12a7-4cf5-c31879396e56@suse.de>
 <CAMuHMdWDyabYxtRHtvuNZy8BjoukRdycAMK2jX+qmgc51HU5Xw@mail.gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <CAMuHMdWDyabYxtRHtvuNZy8BjoukRdycAMK2jX+qmgc51HU5Xw@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------PKunuI7hCDAL7YvCcakm6Fur"
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
Cc: linux-fbdev@vger.kernel.org, teddy.wang@siliconmotion.com, deller@gmx.de,
 javierm@redhat.com, dri-devel@lists.freedesktop.org,
 sudipm.mukherjee@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------PKunuI7hCDAL7YvCcakm6Fur
Content-Type: multipart/mixed; boundary="------------BD8I5i0oJElOlFpWEE3yMs2v";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch, javierm@redhat.com, deller@gmx.de,
 sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Message-ID: <b7c09aa8-ce41-9c9a-062f-e652ea92f8a8@suse.de>
Subject: Re: [PATCH 5/6] fbdev: Move CFB read and write code into helper
 functions
References: <20230425142846.730-1-tzimmermann@suse.de>
 <20230425142846.730-6-tzimmermann@suse.de>
 <CAMuHMdU-_w9yQHYhOCD3cz4CEY6ag-dTXjuHSLnzty0hAMBbXw@mail.gmail.com>
 <1d81e4cc-5079-12a7-4cf5-c31879396e56@suse.de>
 <CAMuHMdWDyabYxtRHtvuNZy8BjoukRdycAMK2jX+qmgc51HU5Xw@mail.gmail.com>
In-Reply-To: <CAMuHMdWDyabYxtRHtvuNZy8BjoukRdycAMK2jX+qmgc51HU5Xw@mail.gmail.com>

--------------BD8I5i0oJElOlFpWEE3yMs2v
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjYuMDQuMjMgdW0gMTc6MjEgc2NocmllYiBHZWVydCBVeXR0ZXJob2V2ZW46
DQo+IEhpIFRob21hcywNCj4gDQo+IE9uIFdlZCwgQXByIDI2LCAyMDIzIGF0IDU6MDbigK9Q
TSBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4gd3JvdGU6DQo+PiBB
bSAyNi4wNC4yMyB1bSAxNzowMSBzY2hyaWViIEdlZXJ0IFV5dHRlcmhvZXZlbjoNCj4+PiBP
biBUdWUsIEFwciAyNSwgMjAyMyBhdCA0OjI44oCvUE0gVGhvbWFzIFppbW1lcm1hbm4gPHR6
aW1tZXJtYW5uQHN1c2UuZGU+IHdyb3RlOg0KPj4+PiBNb3ZlIHRoZSBleGlzdGluZyBDRkIg
cmVhZCBhbmQgd3JpdGUgY29kZSBmb3IgSS9PIG1lbW9yeSBpbnRvDQo+Pj4+IHRoZSBuZXcg
aGVscGVycyBmYl9jZmJfcmVhZCgpIGFuZCBmYl9jZmJfd3JpdGUoKS4gTWFrZSB0aGVtIHRo
ZQ0KPj4+PiBkZWZhdWx0IGZwX29wcy4gTm8gZnVuY3Rpb25hbCBjaGFuZ2VzLg0KPj4+Pg0K
Pj4+PiBTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3Vz
ZS5kZT4NCj4+Pj4gLS0tDQo+Pj4+ICAgIGRyaXZlcnMvdmlkZW8vZmJkZXYvY29yZS9NYWtl
ZmlsZSAgICAgIHwgICAyICstDQo+Pj4+ICAgIGRyaXZlcnMvdmlkZW8vZmJkZXYvY29yZS9m
Yl9jZmJfZm9wcy5jIHwgMTI2ICsrKysrKysrKysrKysrKysrKysrKysrKysNCj4+Pj4gICAg
ZHJpdmVycy92aWRlby9mYmRldi9jb3JlL2ZibWVtLmMgICAgICAgfCAxMTMgKy0tLS0tLS0t
LS0tLS0tLS0tLS0tLQ0KPj4+PiAgICBpbmNsdWRlL2xpbnV4L2ZiLmggICAgICAgICAgICAg
ICAgICAgICB8ICAxMCArKw0KPj4+PiAgICA0IGZpbGVzIGNoYW5nZWQsIDEzOSBpbnNlcnRp
b25zKCspLCAxMTIgZGVsZXRpb25zKC0pDQo+Pj4+ICAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBk
cml2ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUvZmJfY2ZiX2ZvcHMuYw0KPj4+DQo+Pj4gV2hpbGUg
dGhlIGdlbmVyYWwgaWRlYSBpcyBmaW5lLCBwbGVhc2UgZG8gbm90IGNhbGwgYW55IG9mIHRo
aXMgImNmYiIsDQo+Pj4gYXMgaXQgaXMgbm90IHJlbGF0ZWQgdG8gY2h1bmt5IGNvbG9yIGZy
YW1lIGJ1ZmZlciBmb3JtYXRzLg0KPj4+IEFsbCBvZiB0aGVzZSBvcGVyYXRlIG9uIHRoZSBy
YXcgZnJhbWUgYnVmZmVyIGNvbnRlbnRzLg0KPj4NCj4+IFNoYWxsIEkgY2FsbCBpdCBmYl9y
YXdfKCkgb3IgZmJfaW9fKCk/DQo+IA0KPiBHaXZlbiBmYl9tZW1jcHlfZnJvbWZiKCkgaXMg
bWFwcGVkIHRvIG1lbWNweV9mcm9taW8oKSBvbg0KPiBtb3N0IGFyY2hpdGVjdHVyZXMsIEkn
ZCBnbyBmb3IgZmJfaW9fKigpLg0KDQpPaywgbWFrZXMgc2Vuc2UuDQoNCj4gDQo+PiBDRkIg
aXMgdXNlZCBieSB0aGUgZHJhd2luZyBoZWxwZXJzLCB3aGljaCBhcmUgdXN1YWxseSB1c2Vk
IHRvZ2V0aGVyIHdpdGgNCj4+IHRoaXMgY29kZS4gSGVuY2UgdGhlIGN1cnJlbnQgbmFtaW5n
Lg0KPiANCj4gVGhhdCdzIGJlY2F1c2UgeW91ciBkcmF3aW5nIGhlbHBlcnMgb3BlcmF0ZSAo
b25seSkgb24gY2h1bmt5IGNvbG9yDQo+IGZyYW1lIGJ1ZmZlciBmb3JtYXRzIDstKQ0KDQpT
aG91bGQgd2UgcmVuYW1lIHRoZSBDRkIgZHJhd2luZyBmdW5jdGlvbnMgdG8gZmJfaW9fIHRo
ZW4/IEFGQUlDVCB0aGV5IA0KYXJlIHRoZSBzYW1lIGFsZ29yaXRobXMgYXMgaW4gdGhlIGZi
X3N5c18gZnVuY3Rpb25zOyBqdXN0IHdpdGggSS9PIG1lbW9yeS4NCg0KQmVzdCByZWdhcmRz
DQpUaG9tYXMNCg0KPiANCj4gR3J7b2V0amUsZWV0aW5nfXMsDQo+IA0KPiAgICAgICAgICAg
ICAgICAgICAgICAgICAgR2VlcnQNCj4gDQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdy
YXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1h
bnkgR21iSA0KRnJhbmtlbnN0cmFzc2UgMTQ2LCA5MDQ2MSBOdWVybmJlcmcsIEdlcm1hbnkN
CkdGOiBJdm8gVG90ZXYsIEFuZHJldyBNeWVycywgQW5kcmV3IE1jRG9uYWxkLCBCb3VkaWVu
IE1vZXJtYW4NCkhSQiAzNjgwOSAoQUcgTnVlcm5iZXJnKQ0K

--------------BD8I5i0oJElOlFpWEE3yMs2v--

--------------PKunuI7hCDAL7YvCcakm6Fur
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmRLrA8FAwAAAAAACgkQlh/E3EQov+C9
gg/8DGXMz4p119UZcQ0ohO5aR8bvE039ZU1PhYCVUinCdR2N/cluyabB76RLMa3G6qcG4mS5MXmu
rjrpz9VMg/oBUtCZ4P6CzajIxQHifqavNwuWHdq4q7HOXB4yoqCy67rYYvhqC4Ah9gldTSPINtuC
iIkEGXxhryUoYGNC2/AKqlGOramLNSV8dzzPn7QaxcnYmYHYsFaTFTLC7MjKgY3NQ+Gch/zmU0F9
NubU3wF0pF3rzd82oBkTgNoD7kBzUmb1JOb3aAuccw82uEvxljX4ylyLgAG4Ob+fIaeAuezoazTj
BDRlo0ObvuO+ixri4jIJxV8x9fbZ5Z2JVB6ouYKcSykmMJ+wiAo3wrSUTLR5WVoyzidszbaPxqoa
cfszC9As/o6DS9ug7ACIuvlRsIirxAzXxY94C/7p4Ts5OIRv2yYkcJE0hOZWOEhUM4vk9Ky6Yx1G
qa8sl9Rlu+O+pGA61AobktAlTBLBC0KURTp6+eAadfojf0v2qAWrWrh4VwmhTLyi/Ox8Kz0ow3XM
Z/5cgd9EbzDrYDyfQKq0bq4nYxmDO/V2laaM7xAHACFcQlvCC3PSJF5lLhSYip2hj61Npp/hIxB1
bUjYoeMYgzfMqkv2CsFANulqJW0EXrI4uPqzuRoH2dDP7XxtKwIcWE/SOlQ5oQ3NMJvrV2ihyCmW
tNI=
=myGY
-----END PGP SIGNATURE-----

--------------PKunuI7hCDAL7YvCcakm6Fur--
