Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A01AB74D85D
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jul 2023 16:04:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF8B110E15E;
	Mon, 10 Jul 2023 14:04:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 549D110E15E;
 Mon, 10 Jul 2023 14:04:33 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 0331121AD8;
 Mon, 10 Jul 2023 14:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1688997872; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rCRhRdz1OKadoLJmuRpjoCU+SwWjeky46OuFPyjsAQ8=;
 b=cI9OrvsJbNNUHZvZkuBSwFD95cfqXmP8rcw0+3DIpwueDSAeQzssdcQ/03nqjS3le8UtGr
 TcdfqT20EHL4OoilPgbbIypyleAH0fmwyBuLm0kolAzI7QSakwwlFpbNxM4W/xWYN0Qrxh
 yYr08vDKuq3Lcl2/8L/ZvSr+dx+Ng7c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1688997872;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rCRhRdz1OKadoLJmuRpjoCU+SwWjeky46OuFPyjsAQ8=;
 b=RuFoYeRFKdHe9gxGVmK2QSWo1Sy+jpdRcaMyATH6l2r6bWHCjiZTkLfJgP8MAoXdRhRmVJ
 ISo/rshgpvXe6kCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 97F441361C;
 Mon, 10 Jul 2023 14:04:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id G/cGJO8PrGSfNgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 10 Jul 2023 14:04:31 +0000
Message-ID: <b9fe2f32-f4f6-6158-267a-da83b731b794@suse.de>
Date: Mon, 10 Jul 2023 16:04:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 08/17] arch/sh: Do not assign FBINFO_FLAG_DEFAULT to
 fb_videomode.flag
Content-Language: en-US
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, deller@gmx.de,
 javierm@redhat.com
References: <20230710130113.14563-1-tzimmermann@suse.de>
 <20230710130113.14563-9-tzimmermann@suse.de>
 <0a47ed93fe90a77180533f8c2e42e402827e8f1c.camel@physik.fu-berlin.de>
 <54e3e070-52fb-9ccb-bc47-0f41690f6bfa@suse.de>
 <536cc8c679cc68829c8662176ff02a9052249a46.camel@physik.fu-berlin.de>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <536cc8c679cc68829c8662176ff02a9052249a46.camel@physik.fu-berlin.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------epOL8s1E6o0xrA2G07LHRbou"
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
Cc: linux-fbdev@vger.kernel.org, Rich Felker <dalias@libc.org>,
 kvm@vger.kernel.org, linux-hyperv@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, linux-geode@lists.infradead.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>, dri-devel@lists.freedesktop.org,
 linux-input@vger.kernel.org, linux-nvidia@lists.surfsouth.com,
 linux-omap@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------epOL8s1E6o0xrA2G07LHRbou
Content-Type: multipart/mixed; boundary="------------91MPYwppuLkxX3KKLGwaMqgW";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, deller@gmx.de,
 javierm@redhat.com
Cc: linux-sh@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 linux-input@vger.kernel.org, linux-media@vger.kernel.org,
 linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-geode@lists.infradead.org,
 linux-nvidia@lists.surfsouth.com, linux-hyperv@vger.kernel.org,
 linux-omap@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 kvm@vger.kernel.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Rich Felker <dalias@libc.org>
Message-ID: <b9fe2f32-f4f6-6158-267a-da83b731b794@suse.de>
Subject: Re: [PATCH 08/17] arch/sh: Do not assign FBINFO_FLAG_DEFAULT to
 fb_videomode.flag
References: <20230710130113.14563-1-tzimmermann@suse.de>
 <20230710130113.14563-9-tzimmermann@suse.de>
 <0a47ed93fe90a77180533f8c2e42e402827e8f1c.camel@physik.fu-berlin.de>
 <54e3e070-52fb-9ccb-bc47-0f41690f6bfa@suse.de>
 <536cc8c679cc68829c8662176ff02a9052249a46.camel@physik.fu-berlin.de>
In-Reply-To: <536cc8c679cc68829c8662176ff02a9052249a46.camel@physik.fu-berlin.de>

--------------91MPYwppuLkxX3KKLGwaMqgW
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTAuMDcuMjMgdW0gMTU6NTkgc2NocmllYiBKb2huIFBhdWwgQWRyaWFuIEds
YXViaXR6Og0KPiBIaSBUaG9tYXMhDQo+IA0KPiBPbiBNb24sIDIwMjMtMDctMTAgYXQgMTU6
NTIgKzAyMDAsIFRob21hcyBaaW1tZXJtYW5uIHdyb3RlOg0KPj4+IEkgd291bGQgYXJndWUg
dGhhdCB0aGUgY3VycmVudCBjb2RlIGlzIG1vcmUgcmVhZGFibGUgdGhhdCB5b3VyIHByb3Bv
c2VkIGNoYW5nZS4NCj4+Pg0KPj4+IEkgYWdyZWUgdGhhdCBpdCdzIGEgbm8tb3AsIGJ1dCBj
b2RlIGlzIG5vdCBqdXN0IGFib3V0IGZ1bmN0aW9uYWxpdHkgYnV0IGFsc28NCj4+PiByZWFk
YWJpbGl0eSwgaXNuJ3QgaXQ/DQo+Pg0KPj4gSSB3b24ndCBhcmd1ZSB3aXRoIHRoYXQsIGJ1
dCB0aGUgZmxhZyBpdHNlbGYgaXMgd3JvbmcuDQo+PiBGQklORk9fRkxBR19ERUZBVUxUIGlz
L3dhcyBmb3Igc3RydWN0IGZiX2luZm8uZmxhZ3MuIFlvdSBoYXZlIHN0cnVjdA0KPj4gZmJf
dmlkZW9tb2RlLmZsYWcuIFRoZSB2YWxpZCBmbGFncyBmb3IgdGhpcyBmaWVsZCBhcmUgYXQg
WzFdLiBJZg0KPj4gYW55dGhpbmcsIHRoZSBmaWVsZCBjb3VsZCBiZSBpbml0aWFsaXplZCB0
byBGQl9NT0RFX0lTX1VOS05PV04sIHdoaWNoDQo+PiBoYXMgdGhlIHNhbWUgdmFsdWUuDQo+
Pg0KPj4gWzFdIGh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L2xhdGVzdC9zb3Vy
Y2UvaW5jbHVkZS9saW51eC9mYi5oI0w2ODENCj4gDQo+IEZCX01PREVfSVNfVU5LTk9XTiBz
b3VuZHMgdmVyeSByZWFzb25hYmxlIHRvIG1lLiBXb3VsZCB5b3UgYWdyZWUgdXNpbmcgdGhh
dCBpbnN0ZWFkPw0KDQpTdXJlLCBJJ2xsIHVwZGF0ZSB0aGUgcGF0Y2ggYWNjb3JkaW5nbHku
DQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCj4gDQo+Pj4NCj4+PiBBbHNvLCBJIHByZWZl
ciAic2g6IiBhcyB0aGUgYXJjaGl0ZWN0dXJlIHByZWZpeCwgbm90ICJhcmNoL3NoOiIuDQo+
Pg0KPj4gT2suDQo+IA0KPiBUaGFua3MuDQo+IA0KPiBBZHJpYW4NCj4gDQoNCi0tIA0KVGhv
bWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdh
cmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KRnJhbmtlbnN0cmFzc2UgMTQ2LCA5MDQ2MSBO
dWVybmJlcmcsIEdlcm1hbnkNCkdGOiBJdm8gVG90ZXYsIEFuZHJldyBNeWVycywgQW5kcmV3
IE1jRG9uYWxkLCBCb3VkaWVuIE1vZXJtYW4NCkhSQiAzNjgwOSAoQUcgTnVlcm5iZXJnKQ0K


--------------91MPYwppuLkxX3KKLGwaMqgW--

--------------epOL8s1E6o0xrA2G07LHRbou
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmSsD+4FAwAAAAAACgkQlh/E3EQov+Cc
0w//dauT1E8O7E2vRRXc/N5wSZAZ8YaOPezTAxZZ5jMc3fSfHufrNa90plvbnpqkcOHOBRXketvh
0tLWHB8jLOWILDzr6zLuq/GJhaftDQaKGKURm8cE2k6HqV8TTRTpRWADwCaSUYeI/W924iIAzkz+
hMahvURW2SgQNNYossoxPr5nTY0kl4WF1ZnQXt5YGSoJndq25sFduRsx+1i4Sj9g8lI5VdaHxTWw
Rs3dhKf8MUlz2C6MujcN61tpLNKSAtVDXcrZoM/O7C3kDFQVhYSO60aPj1ehzTtlxuvLpR0tq7AN
Djy7A+Zlb9lhjBKycr+LEjadTSlpjhfLvi6eB+pUxc/bfAvbh6XHK/c88S52katpBdqKIUxEIX46
s45RfCujA8YB0ZLIA4BSLaJBmcBBRKgFIw/YPBdKGoAfrjx6j18MP3fTkOxWu23jp477RimmW5Ji
pZ4upNR3AyUO+fL8UtHaRzPmitdhh/Vtx6s786Phoe2hNTBpNR4Hoat9N29IVLd6HiIGdO05cdE9
sMKZD5mc93ob9YEJlOPZ5enxcRVzhEyeuhUi/OoHpsihLSSzeBRDLaUF3b40zFpIRqvJzhuKRZWk
oNNUPkGj4HJg0W9933wRBtfUPyUl9vQoP/GH5Qj+bxvOeQbFrE/qqzgNHY9FRdJXORS9evqxElg6
MTk=
=IOo8
-----END PGP SIGNATURE-----

--------------epOL8s1E6o0xrA2G07LHRbou--
