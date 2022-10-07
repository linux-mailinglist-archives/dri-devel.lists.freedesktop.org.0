Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E4365F74FD
	for <lists+dri-devel@lfdr.de>; Fri,  7 Oct 2022 09:58:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15CEC10E930;
	Fri,  7 Oct 2022 07:58:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60E4F10E930
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Oct 2022 07:58:38 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 13AEC2188E;
 Fri,  7 Oct 2022 07:58:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1665129517; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bEOXxJsbMhyEZe05Ji75+VMf1dBO0/mULF4WV5Dq5ws=;
 b=CoGYgS7oC/a1+vS84jKaS9NzC4IXcx9gDUsgpUn6eN7hro8RNet4vtPUn8lHOOLST5/dma
 05UGx0FzNT3LWhQjAPm/HoplAA2Vc9gSA1aRMleNl8tbtByNK4dsxhqaTZrNbwzKuNeXpo
 lUY4eKUuVVJmJZvpiiBaeW9+i3MEx74=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1665129517;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bEOXxJsbMhyEZe05Ji75+VMf1dBO0/mULF4WV5Dq5ws=;
 b=SJJLSIOJXwuirquqmW74+J0sOew9pmS0KtdF8RqyAcBOje1FdrctiS7IO0ePKd5XTiOR9I
 c4i0Ga8L0ptCDUBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id EC64113A9A;
 Fri,  7 Oct 2022 07:58:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id mBumOCzcP2NTaQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 07 Oct 2022 07:58:36 +0000
Message-ID: <3e761cd0-7527-871e-5d53-1af223418fac@suse.de>
Date: Fri, 7 Oct 2022 09:58:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: drm fb helpers hotplug/resize
Content-Language: en-US
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <9884c2f0daeccbaeaa9995bd8bdb25b98838b980.camel@vmware.com>
 <8fc0e4de-2448-1d04-d1b0-16f87498fe98@suse.de>
 <a3f7176eb7ae321f939d906adb1873cef7fe01ce.camel@vmware.com>
 <156b7bad-810b-80ce-3f79-bca10641d1a1@suse.de> <Yz/SLn6jnUsTAw6y@intel.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <Yz/SLn6jnUsTAw6y@intel.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------7fVjPCrGaXF54xy5V0AwIcT4"
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------7fVjPCrGaXF54xy5V0AwIcT4
Content-Type: multipart/mixed; boundary="------------yPeftb6CMb8rjWto0hT3NYdA";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Message-ID: <3e761cd0-7527-871e-5d53-1af223418fac@suse.de>
Subject: Re: drm fb helpers hotplug/resize
References: <9884c2f0daeccbaeaa9995bd8bdb25b98838b980.camel@vmware.com>
 <8fc0e4de-2448-1d04-d1b0-16f87498fe98@suse.de>
 <a3f7176eb7ae321f939d906adb1873cef7fe01ce.camel@vmware.com>
 <156b7bad-810b-80ce-3f79-bca10641d1a1@suse.de> <Yz/SLn6jnUsTAw6y@intel.com>
In-Reply-To: <Yz/SLn6jnUsTAw6y@intel.com>

--------------yPeftb6CMb8rjWto0hT3NYdA
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDcuMTAuMjIgdW0gMDk6MTUgc2NocmllYiBWaWxsZSBTeXJqw6Rsw6Q6DQoN
Cj4+DQo+PiBGb3IgdGhlIGFic29sdXRlIHNpemUgb2YgZmJkZXYgbWVtb3J5LCBJIHRoaW5r
IHdlIHNob3VsZCBpbnRyb2R1Y2UgYQ0KPj4gbW9kdWxlIHBhcmFtZXRlciBpbiBkcm1fZmJf
aGVscGVyLCB3aGljaCBhbiBvcHRpb24gdG8gc2V0IGEgZGVmYXVsdA0KPj4gdmFsdWUgaW4g
dGhlIGtlcm5lbCBjb25maWcuIEl0IHdvdWxkIGJlbmVmaXQgYWxsIGRyaXZlcnMgdGhhdCB1
c2UgZmJkZXYNCj4+IGVtdWxhdGlvbiBhbmQgd29yayBob3cgb3ZlcmFsbG9jIHdvcmtzLg0K
Pj4NCj4+IElmIG5vIHNpemUgaXMgZ2l2ZW4sIHRoZSBjdXJyZW50IGFwcHJvYWNoIHdvdWxk
IGJlIHVzZWQuDQo+Pg0KPj4gSSBkb24ndCB0aGluayByZXNpemluZyB3b3VsZCB3b3JrIGlt
bWVkaWF0ZWx5LiBUaGVyZSBpc24ndCBhbnl0aGluZyBpbg0KPj4gdGhlIGNoZWNrX3ZhciBh
bmQgc2V0X3BhciBmdW5jdGlvbnMgdGhhdCBpbXBsZW1lbnRzIHRoZSBuZWNlc3NhcnkgYXRv
bWljDQo+PiBjaGVjayBhbmQgY29tbWl0Lg0KPiANCj4gc2V0X3BhcigpIGlzIHRoZSB0aGlu
ZyB0aHQgZG9lcyB0aGUgY29tbWl0Lg0KPiANCg0KSSBrbm93LiBUaGVyZSBhY3R1YWxseSBl
dmVuIGlzIGEgY29tbWl0IHN0YXRlbWVudCBpbiBzZXRfcGFyLCB3aGljaCBjYW4gDQpyZXN0
b3JlIHRoZSBpbml0aWFsIG1vZGUuIE15IHBvaW50IGlzIHRoYXQgaXQgaGFzIG5vIG1lYW5z
IG9mIGNoYW5naW5nIA0KdGhlIGRpc3BsYXkgbW9kZS4gQSBmdWxsIG1vZGVzZXQgd291bGQg
cmVxdWlyZSB1cyB0byBjb252ZXJ0IHRoZSBmYiANCnNjcmVlbmluZm8gaW50byBhbiBhdG9t
aWMgc3RhdGUgYW5kIGNvbW1pdCB0aGF0IGluc3RlYWQuIEZvciB0aGUgZmJjb252IA0KaGVs
cGVyLCBJIG9uY2UgbWFkZSBjb2RlIHRvIGNvbnZlcnQgYmV0d2VlbiB0aGUgdHdvLiBMZWF2
aW5nIHRoaXMgaGVyZSANCmZvciByZWZlcmVuY2UuIFsxXVsyXQ0KDQpTaW1pbGFybHksIGlu
IGNoZWNrX3ZhciB3ZSBzb3J0IG91dCBhbmQgcmVqZWN0IGFsbCBtb2RlIGNoYW5nZXMuIFdl
J2QgDQpoYXZlIHRvIGNoYW5nZSB0aGF0IGFzIHdlbGwuDQoNCkkgZ3Vlc3Mgd2UgY2FuIGNv
bnRpbnVlIHRvIGlnbm9yZSBub24tYXRvbWljIG1vZGVzZXR0aW5nLg0KDQpCZXN0IHJlZ2Fy
ZHMNClRob21hcw0KDQpbMV0gDQpodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvdHpp
bW1lcm1hbm4vbGludXgvLS9jb21taXQvMzg1MTYxY2QyZDA0OGI1Y2Y4MDU0NGJmZjhjZWQz
ZGE3YTgyZGZhOQ0KWzJdIA0KaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL3R6aW1t
ZXJtYW5uL2xpbnV4Ly0vY29tbWl0L2E1NDFjNDA1YTYzOGY0N2VlODAzODliMjIyZmJkZTZl
MzExZTgyMjANCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERl
dmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxk
c3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJu
YmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCg==

--------------yPeftb6CMb8rjWto0hT3NYdA--

--------------7fVjPCrGaXF54xy5V0AwIcT4
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmM/3CcFAwAAAAAACgkQlh/E3EQov+Cz
Gw//XLNw49aYatZD32yDtzvwwWc4L7boI/lfU6L/ekqXqW/P3Cy2w5xsQHGu5K8D3g3Pbp/TwiCg
NL5gvz1PGIicQ1RlA7NiHNCDipq17YUnodjzwbs6/91YZ0n37EfcR3I4Im1BVGzbEaEsqO+4OYd8
AjbmT9Q2UHXzKJlOseN1NiJiaDnLkqM58Xg8/+EE4+2RW11HuJFm68wGdpKLFhQEmD/jJEapHLUE
7dRUd1YICvIATj0UzuZVJkgOLVAgeF9GtWPmnp4gfJrRuSL3VGSPVRLF8ZONZhCzN3Uhf4Q5d72w
FGJRgeOZau5O6o4l9dbp13l3jiKt+AY8VgKtRrTziMNWAxnrrzH3WgtclAOcrsoM0LfpRolGNrz6
oNulxdnzGYLDwwJFkL29Oq004dYvwPq0yW4RX4Ie8nDpttzjtF35eP6gQSx4ybR1n7itSHhnvYaC
4scimow5jc+zbfmMh8A73cRI2wVZ8UB+AeqpZWbFp1w/YzG7kYb+G2mquj5ckcPYnLXUMEmqTqjJ
AJP4Lw5uW0QZF7Sm0rhtBBsMM09fOc7Si3VXt0LL4g1s3G2L1BCHXuPXUOaB1eL2kRQ9o/J6+RNg
RRh4Z/8c9m7vuf7qgKJaEnqbpH6EFh6D8NqnwmTg17paDp5e9Y0OnrD3zbKMCINAxllxOdKEGEHz
WYY=
=ip1K
-----END PGP SIGNATURE-----

--------------7fVjPCrGaXF54xy5V0AwIcT4--
