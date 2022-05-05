Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C4A2B51B91C
	for <lists+dri-devel@lfdr.de>; Thu,  5 May 2022 09:31:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B048410E466;
	Thu,  5 May 2022 07:31:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06C8F10E466
 for <dri-devel@lists.freedesktop.org>; Thu,  5 May 2022 07:31:21 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 794951F45B;
 Thu,  5 May 2022 07:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1651735879; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6jJUVSWEcAHn4h4WxX/y0FXvOs9oH3c8L78FJ4AX5R4=;
 b=bMmhkndPmLBEUBU4jphvxPj/mOfHan/b5hO33KVT3FGnjYLncebvuefOrXBf7ysiIi5uPj
 uYh9GgwcBYnThaZp4ykkkhMNcnF2Lzd3ViAQ6tyDEf836uNez/BLexDc5eLt0W0xDa/rXr
 FZ+FzCQHBMlBp1zibKBFtrMp7BHdsWA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1651735879;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6jJUVSWEcAHn4h4WxX/y0FXvOs9oH3c8L78FJ4AX5R4=;
 b=sNUwtEI3InnUZhY5U0O3A8GylV4lth/8A24k1HEbKYTo4NwyPo+3NQBhEcjFsHQNgHCPoj
 dz4YbxfXZIkJi9Ag==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5048B13A65;
 Thu,  5 May 2022 07:31:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id TjTFEkd9c2LdcQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 05 May 2022 07:31:19 +0000
Message-ID: <39017ccf-969b-d010-5e62-de74605eac84@suse.de>
Date: Thu, 5 May 2022 09:31:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 1/3] fbdev: Prevent possible use-after-free in fb_release()
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org
References: <20220504215151.55082-1-javierm@redhat.com>
 <20220504215631.56756-1-javierm@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220504215631.56756-1-javierm@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------m9jlwfCNRnsWJzgSPUoc0Gro"
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, linux-fbdev@vger.kernel.org,
 Helge Deller <deller@gmx.de>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------m9jlwfCNRnsWJzgSPUoc0Gro
Content-Type: multipart/mixed; boundary="------------dYCAb0oVJCI8hmk1sjhXkz28";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org
Cc: linux-fbdev@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Helge Deller <deller@gmx.de>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@intel.com>
Message-ID: <39017ccf-969b-d010-5e62-de74605eac84@suse.de>
Subject: Re: [PATCH 1/3] fbdev: Prevent possible use-after-free in
 fb_release()
References: <20220504215151.55082-1-javierm@redhat.com>
 <20220504215631.56756-1-javierm@redhat.com>
In-Reply-To: <20220504215631.56756-1-javierm@redhat.com>

--------------dYCAb0oVJCI8hmk1sjhXkz28
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQoNCkFtIDA0LjA1LjIyIHVtIDIzOjU2IHNjaHJpZWIgSmF2aWVyIE1hcnRpbmV6IENhbmls
bGFzOg0KPiBGcm9tOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPg0K
PiANCj4gTW9zdCBmYmRldiBkcml2ZXJzIGhhdmUgaXNzdWVzIHdpdGggdGhlIGZiX2luZm8g
bGlmZXRpbWUsIGJlY2F1c2UgY2FsbCB0bw0KPiBmcmFtZWJ1ZmZlcl9yZWxlYXNlKCkgZnJv
bSB0aGVpciBkcml2ZXIncyAucmVtb3ZlIGNhbGxiYWNrLCByYXRoZXIgdGhhbg0KPiBkb2lu
ZyBmcm9tIGZib3BzLmZiX2Rlc3Ryb3kgY2FsbGJhY2suDQo+IA0KPiBEb2luZyB0aGF0IHdp
bGwgZGVzdHJveSB0aGUgZmJfaW5mbyB0b28gZWFybHksIHdoaWxlIHJlZmVyZW5jZXMgdG8g
aXQgbWF5DQo+IHN0aWxsIGV4aXN0LCBsZWFkaW5nIHRvIGEgdXNlLWFmdGVyLWZyZWUgZXJy
b3IuDQo+IA0KPiBUbyBwcmV2ZW50IHRoaXMsIGNoZWNrIHRoZSBmYl9pbmZvIHJlZmVyZW5j
ZSBjb3VudGVyIHdoZW4gYXR0ZW1wdGluZyB0bw0KPiBrZnJlZSB0aGUgZGF0YSBzdHJ1Y3R1
cmUgaW4gZnJhbWVidWZmZXJfcmVsZWFzZSgpLiBUaGF0IHdpbGwgbGVhayBpdCBidXQNCj4g
YXQgbGVhc3Qgd2lsbCBwcmV2ZW50IHRoZSBtZW50aW9uZWQgZXJyb3IuDQo+IA0KPiBTaWdu
ZWQtb2ZmLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGludGVsLmNvbT4NCj4g
U2lnbmVkLW9mZi1ieTogSmF2aWVyIE1hcnRpbmV6IENhbmlsbGFzIDxqYXZpZXJtQHJlZGhh
dC5jb20+DQoNClJldmlld2VkLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5A
c3VzZS5kZT4NCg0KPiAtLS0NCj4gDQo+ICAgZHJpdmVycy92aWRlby9mYmRldi9jb3JlL2Zi
c3lzZnMuYyB8IDQgKysrKw0KPiAgIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykN
Cj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUvZmJzeXNmcy5j
IGIvZHJpdmVycy92aWRlby9mYmRldi9jb3JlL2Zic3lzZnMuYw0KPiBpbmRleCAyNjg5Mjk0
MGMyMTMuLjgyZTMxYTJkODQ1ZSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy92aWRlby9mYmRl
di9jb3JlL2Zic3lzZnMuYw0KPiArKysgYi9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUvZmJz
eXNmcy5jDQo+IEBAIC04MCw2ICs4MCwxMCBAQCB2b2lkIGZyYW1lYnVmZmVyX3JlbGVhc2Uo
c3RydWN0IGZiX2luZm8gKmluZm8pDQo+ICAgew0KPiAgIAlpZiAoIWluZm8pDQo+ICAgCQly
ZXR1cm47DQo+ICsNCj4gKwlpZiAoV0FSTl9PTihyZWZjb3VudF9yZWFkKCZpbmZvLT5jb3Vu
dCkpKQ0KPiArCQlyZXR1cm47DQo+ICsNCj4gICAJa2ZyZWUoaW5mby0+YXBlcnR1cmVzKTsN
Cj4gICAJa2ZyZWUoaW5mbyk7DQo+ICAgfQ0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpH
cmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJt
YW55IEdtYkgNCk1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0KKEhS
QiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rldg0K


--------------dYCAb0oVJCI8hmk1sjhXkz28--

--------------m9jlwfCNRnsWJzgSPUoc0Gro
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmJzfUYFAwAAAAAACgkQlh/E3EQov+C0
jg/+OlTXlT+22OhaSOXgOLVxtLHi4Dbu2x2++k9NcgW+avrdhtiJij7Ii6EtW3xIKRRiq4i9//GR
dDovZxNIlHV/bSNODx6/UD/jiN4uUnpQm+OXTDbkpwn5HFPqUw6HdA3vyNeMcBDsKEBWBM/NBtqA
U9wUomva6oEp2sTz7fAP++8UySCmmplQzNDj4QnFZzbpcRdIYO5yljqmkuyFnr4mr0rRbgoTs/yr
dpLf/10/GRH0hAc/SIiJ5TGGkKvIspQDUI+ipMX2iTkua625oReR4jPK5swnowihqTINNrlvM0za
W/bbc2GfC0AnWbvRa4xigfzFLrvveNTgNegJfoL5jQHJfQap4bC/n+R6c4PxVZwqYAaiE80xCSQV
9jiWCjcsX5vmrsbJAJPyLXSJV1w6IuBFAG1Lt0gVWmyqD8Tch0Xv6RZRwtbBFFKLiKRLe9/iDWX5
+j9m/yZseCpBA10hSAqA1FaadxgQ5o/WDpN79qJ2thDlzuL6gGM0qVOGWL9b9bODcutl0quJWX8R
vjK7cmoXk/6ItlmYw9dXu06Mv+T58IOoutM2SzjZBVp9DYoE1sbTTGV0hY0szYElkAFwosfzqKBo
Yd9dOCAXxL+XnG3IqkNAMi67VmOQSa19ygpee+I33YBMYXmGOPoyIlZLJGvp12wGMofRKXXjvXod
N1c=
=32l8
-----END PGP SIGNATURE-----

--------------m9jlwfCNRnsWJzgSPUoc0Gro--
