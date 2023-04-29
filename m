Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 504296F24B4
	for <lists+dri-devel@lfdr.de>; Sat, 29 Apr 2023 14:28:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D38DB10E13B;
	Sat, 29 Apr 2023 12:28:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47B7110E13B
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Apr 2023 12:28:11 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 1E36621C53;
 Sat, 29 Apr 2023 12:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1682771289; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Jz05S69H9J9ourS0/6LxFgFtl5G/bfGtL/yFxW/ifNQ=;
 b=HFVj6w9ZVfPD0ZoN23VEmZO35Tc/zrvyhcXfnt4s5PYSz0fGAMVj/b2GeGWIp2rfxtOeYE
 GoEJHDzwE28be/ZvE4/IidWd/qp9F6ZDW9Hzq6H3190nFtEeOxA3/U97YoT+OPC2IfB8yD
 Bnic4lLUU5bnm3F8WFxwTV4IiZEkC0A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1682771289;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Jz05S69H9J9ourS0/6LxFgFtl5G/bfGtL/yFxW/ifNQ=;
 b=gnxZghzBvwVLvXFJQMV9YFllE8N0XxoLXi2cXLqpyiDJBhwS686ImMoN1akl6J7zJ3dwzg
 R653vtwEpOcCczDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B3459138E0;
 Sat, 29 Apr 2023 12:28:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id vPNnKlgNTWT4SAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Sat, 29 Apr 2023 12:28:08 +0000
Message-ID: <b70d5ddb-24ad-e1f5-8ef9-a486879d0c9e@suse.de>
Date: Sat, 29 Apr 2023 14:28:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 5/5] fbdev: Define framebuffer I/O from Linux' I/O
 functions
Content-Language: en-US
To: Sam Ravnborg <sam@ravnborg.org>
References: <20230428092711.406-1-tzimmermann@suse.de>
 <20230428092711.406-6-tzimmermann@suse.de>
 <20230428131221.GE3995435@ravnborg.org>
 <900eaf1c-4d29-2c26-c220-6b4e089d9b94@suse.de>
 <20230428165412.GA4010212@ravnborg.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230428165412.GA4010212@ravnborg.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------5mlU0na0AfM0B8j2RhZVJs01"
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
Cc: linux-arch@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org, arnd@arndb.de,
 deller@gmx.de, chenhuacai@kernel.org, javierm@redhat.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 James.Bottomley@hansenpartnership.com, linux-m68k@lists.linux-m68k.org,
 geert@linux-m68k.org, loongarch@lists.linux.dev, vgupta@kernel.org,
 sparclinux@vger.kernel.org, kernel@xen0n.name,
 linux-snps-arc@lists.infradead.org, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------5mlU0na0AfM0B8j2RhZVJs01
Content-Type: multipart/mixed; boundary="------------f6pmt5OEu3br0LQbMXJxQH0V";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: linux-arch@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linux-ia64@vger.kernel.org, loongarch@lists.linux.dev, arnd@arndb.de,
 deller@gmx.de, chenhuacai@kernel.org, javierm@redhat.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 James.Bottomley@hansenpartnership.com, linux-m68k@lists.linux-m68k.org,
 geert@linux-m68k.org, linux-parisc@vger.kernel.org, vgupta@kernel.org,
 sparclinux@vger.kernel.org, kernel@xen0n.name,
 linux-snps-arc@lists.infradead.org, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Message-ID: <b70d5ddb-24ad-e1f5-8ef9-a486879d0c9e@suse.de>
Subject: Re: [PATCH v2 5/5] fbdev: Define framebuffer I/O from Linux' I/O
 functions
References: <20230428092711.406-1-tzimmermann@suse.de>
 <20230428092711.406-6-tzimmermann@suse.de>
 <20230428131221.GE3995435@ravnborg.org>
 <900eaf1c-4d29-2c26-c220-6b4e089d9b94@suse.de>
 <20230428165412.GA4010212@ravnborg.org>
In-Reply-To: <20230428165412.GA4010212@ravnborg.org>

--------------f6pmt5OEu3br0LQbMXJxQH0V
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgU2FtDQoNCkFtIDI4LjA0LjIzIHVtIDE4OjU0IHNjaHJpZWIgU2FtIFJhdm5ib3JnOg0K
PiBIaSBUaG9tYXMsDQo+IA0KPiBPbiBGcmksIEFwciAyOCwgMjAyMyBhdCAwNDoxODozOFBN
ICswMjAwLCBUaG9tYXMgWmltbWVybWFubiB3cm90ZToNCj4+IEknZCBiZSBoYXBweSB0byBo
YXZlIGZiXygpIHdyYXBwZXJzIHRoYXQgYXJlIEkvTyBoZWxwZXJzIHdpdGhvdXQNCj4+IG9y
ZGVyaW5nIGd1YXJhbnRlZXMuIEknZCBqdXN0IHdvdWxkbid0IHdhbnQgdGhlbSBpbiA8bGlu
dXgvZmIuaD4NCj4gDQo+IEhvdyBhYm91dCB0aHJvd2luZyB0aGVtIGludG8gYSBuZXcgZHJt
X2ZiLmggaGVhZGVyIGZpbGUuDQo+IFRoaXMgaGVhZGVyIGZpbGUgY291bGQgYmUgdGhlIGhv
bWUgZm9yIGFsbCB0aGUgZmIgc3R1ZmYgdGhhdCBpcw0KPiBzaGFyZWQgYmV0d2VlbiBkcm0g
YW5kIHRoZSBsZWdhY3kgZmJkZXYuDQo+IA0KPiBUaGVuIHdlIG1heSBzbG93bHkgbWlncmF0
ZSBtb3JlIGZiZGV2IHN0dWZmIHRvIGRybSBhbmQgbGV0IHRoZSBsZWdhY3kNCj4gZmJkZXYg
c3R1ZmYgdXNlIHRoZSBtYWludGFpbmVkIGRybSBzdHVmZi4NCj4gRHVubm8sIHRoZSBwYWlu
IG1heSBub3QgYmUgd29ydGggaXQuDQoNCkRSTSBtaWdodCBub3QgYmUgcmVsZXZhbnQgaWYg
d2UgY2FuIHJlbW92ZSBmYl9tZW0qKCkuIFNvIEknZCBsaWtlIHRvIGdvIA0KYmFjayB0byBz
b21ldGhpbmcgY2xvc2VyIHRvIHYxIG9mIHRoZXNlIHBhdGNoZXMuIFNlZSBteSByZXBseSB0
byBBcm5kLg0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQo+IA0KPiAJU2FtDQoNCi0tIA0K
VGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29m
dHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KRnJhbmtlbnN0cmFzc2UgMTQ2LCA5MDQ2
MSBOdWVybmJlcmcsIEdlcm1hbnkNCkdGOiBJdm8gVG90ZXYsIEFuZHJldyBNeWVycywgQW5k
cmV3IE1jRG9uYWxkLCBCb3VkaWVuIE1vZXJtYW4NCkhSQiAzNjgwOSAoQUcgTnVlcm5iZXJn
KQ0K

--------------f6pmt5OEu3br0LQbMXJxQH0V--

--------------5mlU0na0AfM0B8j2RhZVJs01
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmRNDVgFAwAAAAAACgkQlh/E3EQov+Dk
Wg/+JIgc3ljeeweOA51k6nZjVXnA2xoQpHoWXzqgr3zowrr9FFfDh/9evQUoes96v/FyzZlL0CTI
hVueOEwwPmFKXfs1eJ6DBiHNKEwba/mPQXSqkT92eDXl08cADWxMBd9J1rphskh12gJeBQU6U3Qi
5s9GFT3OJJetJ5tLYbqgdkGJntcEFhCOjR2LsoaMIYat474U32GiigcolBwu8aYHhNBij3p2U+LV
JP3bGV9SpX9v2hb6O2daOH4rHdjj+gHXv5+YuoZ9Dqc6XYomdXenX+bgnINpyrcdA0fSFPWRwSJL
yncb89L4GbTNEoiZR9bGBcvTYCj1hIQLASniZvwzHD69fC6i4X1a0Eojn+2WDtWGlSeWplr5Ngn9
r5LAkpkOOvlOMsqV4YJNd8g+QiLDdU4B78fR0CbP6NLjIuuRU83GHKITOwU0GuJBLxu2HKriAmJf
rFPpqks0ZTf8kIqqnLIHiABnGsP+cuYx9gS9l+7T2Lf6vkwPCRtiHaxvBnPuAKSMRvFHulOx+peh
bmKJPoTTkZr1veIxj0ocBwDrOAKbi+ZxE6wKVGTr3GJzr/Y/J40GEy0oUPYTh1csbybKwFdRbDhY
p7IKPw44wVIC0VkGeOU4QBPe8u1Owe8suS15FVeV0h11p9B8Kz6sXcgJr3pGsAl621EIUQF0FKaZ
5Tk=
=1OL4
-----END PGP SIGNATURE-----

--------------5mlU0na0AfM0B8j2RhZVJs01--
