Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 469E5493D56
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jan 2022 16:37:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 366A310E2E2;
	Wed, 19 Jan 2022 15:37:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74E9C10E2E2
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jan 2022 15:37:03 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 13986212C2;
 Wed, 19 Jan 2022 15:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1642606622; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Yy7uZ+QDDUdD3y4+31E5IV8g2YY1wZT39Hu1q90QqiQ=;
 b=ooI513y+dRQPUFXznGYC9LkauTvhYG8rZxwhA7bwef27uwMZta/98j+G5D081dhGSBOaIY
 D4U+iovUNK4e5xY/ZcGapIgq39Ppsxuon4dujIBK0xvI4xCfk6zH2nbe1s5mN8S1/S5UpZ
 pPbpaWmkoUfagRfbF4Ce68fcxfm8TCQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1642606622;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Yy7uZ+QDDUdD3y4+31E5IV8g2YY1wZT39Hu1q90QqiQ=;
 b=XxfXC8gOsY5+utbJpyv4l9EPUaobcr4jIMDKk/Y7QReTrHwiFoG/C7SZww42CJpB0joIMe
 myTi7KlgEHuCO/Bw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B899013E15;
 Wed, 19 Jan 2022 15:37:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id plT6Kx0w6GHVCgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 19 Jan 2022 15:37:01 +0000
Message-ID: <ccec8635-6ec6-89c3-6738-65bd07a48508@suse.de>
Date: Wed, 19 Jan 2022 16:37:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 2/2] Revert "fbcon: Disable accelerated scrolling"
Content-Language: en-US
To: Sven Schnelle <svens@stackframe.org>, Daniel Vetter <daniel@ffwll.ch>
References: <20220119110839.33187-1-deller@gmx.de>
 <20220119110839.33187-3-deller@gmx.de> <Yef0j8+DBbwC7Kjv@kroah.com>
 <Yef15k2GtC40aJEu@kroah.com>
 <CAMuHMdVWFJEDwjf-htZ_D1484efmuPnz_L-qhcTeUE-GVpvZXA@mail.gmail.com>
 <4d8950c7-5f51-ca2b-4c93-741c7805a214@gmx.de>
 <CAHk-=wikFKjwdUBWCLCu=iL3rFq4BDDF0aBGdXC6ay74yJb+5Q@mail.gmail.com>
 <CAKMK7uEb53iu_HxYSnFZ59j=vXQdMvTWT7xosEo85XkAwzDMnA@mail.gmail.com>
 <8735ljkboo.fsf@x1.stackframe.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <8735ljkboo.fsf@x1.stackframe.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------gWgXlBM6luHpgwUeody7d7Fc"
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Claudio Suarez <cssk@net-c.es>,
 Gerd Hoffmann <kraxel@redhat.com>, Pavel Machek <pavel@ucw.cz>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Linus Torvalds <torvalds@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------gWgXlBM6luHpgwUeody7d7Fc
Content-Type: multipart/mixed; boundary="------------1n0AowBnC0QreoQcDd1C604p";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sven Schnelle <svens@stackframe.org>, Daniel Vetter <daniel@ffwll.ch>
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Linus Torvalds <torvalds@linux-foundation.org>, Helge Deller
 <deller@gmx.de>, Javier Martinez Canillas <javierm@redhat.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Claudio Suarez <cssk@net-c.es>,
 Gerd Hoffmann <kraxel@redhat.com>, Pavel Machek <pavel@ucw.cz>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Sam Ravnborg <sam@ravnborg.org>
Message-ID: <ccec8635-6ec6-89c3-6738-65bd07a48508@suse.de>
Subject: Re: [PATCH 2/2] Revert "fbcon: Disable accelerated scrolling"
References: <20220119110839.33187-1-deller@gmx.de>
 <20220119110839.33187-3-deller@gmx.de> <Yef0j8+DBbwC7Kjv@kroah.com>
 <Yef15k2GtC40aJEu@kroah.com>
 <CAMuHMdVWFJEDwjf-htZ_D1484efmuPnz_L-qhcTeUE-GVpvZXA@mail.gmail.com>
 <4d8950c7-5f51-ca2b-4c93-741c7805a214@gmx.de>
 <CAHk-=wikFKjwdUBWCLCu=iL3rFq4BDDF0aBGdXC6ay74yJb+5Q@mail.gmail.com>
 <CAKMK7uEb53iu_HxYSnFZ59j=vXQdMvTWT7xosEo85XkAwzDMnA@mail.gmail.com>
 <8735ljkboo.fsf@x1.stackframe.org>
In-Reply-To: <8735ljkboo.fsf@x1.stackframe.org>

--------------1n0AowBnC0QreoQcDd1C604p
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTkuMDEuMjIgdW0gMTY6MDUgc2NocmllYiBTdmVuIFNjaG5lbGxlOg0KPiBE
YW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+IHdyaXRlczoNCj4gDQo+PiBPbiBXZWQs
IEphbiAxOSwgMjAyMiBhdCAzOjAxIFBNIExpbnVzIFRvcnZhbGRzDQo+PiA8dG9ydmFsZHNA
bGludXgtZm91bmRhdGlvbi5vcmc+IHdyb3RlOg0KPj4gSXJyZXNwZWN0aXZlIG9mIHRoaXMg
Y29kZSBiZWluZyBidWdneSBvciBub3QgYnVnZ3kgSSB0aGluayB0aGUgYmlnZ2VyDQo+PiBw
aWN0dXJlcywgYW5kIHJlYWxseSB0aGUgcmVhc29uIEkgd2FudCB0byBzZWUgYXMgbXVjaCBj
b2RlIGRpdGNoZWQNCj4+IGZyb20gdGhlIGZiZGV2L2ZiY29uIHN0YWNrIGFzIHdlIHBvc3Np
YmxlIGNhbiwgYXJlIHZlcnkgY2xlYXI6DQo+Pg0KPj4gLSBpdCdzIGZ1bGwgb2YgYnVncw0K
Pj4gLSB0aGVyZSdzIG5vIHRlc3QgY292ZXJhZ2UvQ0kgdG8gc3BlYWsgb2YNCj4+IC0gaXQn
cyB2ZXJ5IGFyY2FuZSBjb2RlIHdoaWNoIGlzIGRhbW4gaGFyZCB0byB1bmRlcnN0YW5kIGFu
ZCBmaXggaXNzdWVzIHdpdGhpbg0KPj4gLSB0aGUgbG9ja2luZyBpcyBidXN0ZWQgKGxhcmdl
bHkgdGhhbmtzIHRvIGNvbnNvbGVfbG9jaywgYW5kIHRoZQ0KPj4gZWZmb3J0IHRvIG1ha2Ug
dGhhdCByZWFzb25hYmxlIGZyb20gLXJ0IGZvbGtzIGhhcyBiZWVuIHNsb3dseSBjcmVlcGlu
Zw0KPj4gZm9yd2FyZCBmb3IgeWVhcnMpLg0KPj4NCj4+IElvdyB0aGlzIHN1YnN5c3RlbSBp
cyBmaXJtbHkgc3R1Y2sgaW4gdGhlIDkwcywgYW5kIEkgdGhpbmsgaXQncyBiZXN0DQo+PiB0
byBqdXN0IGxlYXZlIGl0IHRoZXJlLiBUaGVyZSdzIGFsc28gbm90IGJlZW4gYW55b25lIGFj
dHVhbGx5IGNhcGFibGUNCj4+IGFuZCB3aWxsaW5nIHRvIHB1dCBpbiB0aGUgd29yayB0byBj
aGFuZ2UgdGhpcyAocHJldHR5IG11Y2ggYWxsIGFjdHVhbA0KPj4gY2hhbmdlcy9maXhlcyBo
YXZlIGJlZW4gZG9uZSBieSBkcm0gZm9sa3MgYW55d2F5LCBsaWtlIG1lIGhhdmluZyBhDQo+
PiBzbWFsbCBwZXQgcHJvamVjdCB0byBtYWtlIHRoZSBmYmRldiB2cyBmYmNvbiBsb2NraW5n
IHNsaWdodGx5IGxlc3MNCj4+IGJ1c3RlZCkuDQo+IA0KPiBTYXlpbmcgaXQncyBzdHVjayBp
biB0aGUgOTBpZXMsIGFuZCBhY3RpdmVseSB0cnlpbmcgdG8gcHJldmVudA0KPiBIZWxnZSBm
cm9tIHRha2luZyBvdmVyIG1haW50YWluZXJzaGlwIGF0IHRoZSBzYW1lIHRpbWUgbG9va3Mg
b2RkLg0KDQpUaGUgaXNzdWVzIGFyZSBpbiB0aGUgZGVzaWduIGl0c2VsZi4gSXQncyBpbXBv
c3NpYmxlIHRvIG1vZGVsIHRvZGF5J3MgDQpoYXJkd2FyZSBhbmQgY29uc3RyYWludHMgd2l0
aCBmYmRldi4gSXQncyBpbXBvc3NpYmxlIHRvIGNoYW5nZSANCmNvbmZpZ3VyYXRpb24gaW4g
YSByZWxpYWJsZSB3YXkgKGkuZS4sIHdoYXQgRFJNIGNhbGxzIGF0b21pYykuIEZiZGV2IA0K
bW1hcHMgcGxhaW4gdmlkZW8gcmFtIHRvIHVzZXJzcGFjZSwgd2hpY2ggaXMgb25lIG9mIHRo
ZSByZWFzb25zIHdoeSANCkRSTSdzIGZiZGV2IHN1cHBvcnQgaXMgaGFyZCB0byBpbXByb3Zl
Lg0KDQo+IEkgdGhpbmsgSGVsZ2Ugc2hvdWxkIGF0IGxlYXN0IGdldCBhIGNoYW5jZSB0byBm
aXggdGhlIGlzc3Vlcy4gSWYgdGhlDQo+IHN0YXRlIGlzIHN0aWxsIHRoZSBzYW1lIGluIGEg
eWVhciBvciBzbyBpdCBzaG91bGQgYmUgZGlzY3Vzc2VkIGFnYWluLg0KDQpZb3UgY2Fubm90
IGZpeCB0aGF0IGluIDEweXJzLg0KDQo+IA0KPj4gVGhlIG90aGVyIHNpZGUgaXMgdGhhdCBi
ZWluZyBhIG1haW50YWluZXIgaXMgYWJvdXQgY29sbGFib3JhdGlvbiwgYW5kDQo+PiB0aGlz
IGVudGlyZSBmYmRldiBtYWludGFpbmVyc2hpcCB0YWtlb3ZlciBoYXMgYmVlbiBhIGRlbW9u
c3RyYXRpb24gb2YNCj4+IGFueXRoaW5nIGJ1dCB0aGF0LiBNQUlOVEFJTkVSUyBlbnRyeSB3
YXMgYSBiaXQgY29uZnVzaW5nIHNpbmNlIGRlZmFjdG8NCj4+IGRybSBoYXMgYmVlbiBtYWlu
dGFpbmluZyBpdCBmb3IgeWVhcnMuDQo+IA0KPiBJdCB3YXMgbWFya2VkIGFzICdPcnBoYW5l
ZCcuIEFueW9uZSBpcyBmcmVlIHRvIHNlbmQgYSBQYXRjaC9QUiB0byB0YWtlDQo+IG92ZXIg
bWFpbnRhaW5lcnNoaXAuIElmIHlvdSBoYXZlIHN0cm9uZyBvcGluaW9ucyBhYm91dCB0aGF0
IGNvZGUgKEFuZCB5b3UNCj4gb2J2aW91c2x5IGhhdmUgcmVhZGluZyB5b3VyIG1haWwsIHNl
dCBpdCB0byAnbWFpbnRhaW5lZCcgYW5kIGNhcmUgYWJvdXQNCj4gaXQuIEV2ZXJ5dGhpbmcg
ZWxzZSBpcyBqdXN0IHdyb25nIGluIG15IG9waW5pb24uDQoNCk5vLCBpdCdzIG5vdCB3cm9u
Zy4gSGVsZ2UgdGFrZXMgZmJkZXYgb3ZlciB0aGUgd2Vla2VuZCwgd2l0aG91dCANCm5vdGV3
b3J0aHkgZXhwZXJpZW5jZSwgYW5kIGlnbm9yZXMgYWR2aWNlIGZyb20gdGhlIHBlb3BsZSB0
aGF0IGhhdmUga2VwdCANCml0IGFsaXZlIG92ZXIgdGhlIHBhc3QgeWVhcnMuIFRoaXMgaXNu
J3QgZ29pbmcgdG8gd29yayBpbiB0aGUgbG9uZyB0ZXJtLg0KDQpCZXN0IHJlZ2FyZHMNClRo
b21hcw0KDQo+IA0KPiAvU3Zlbg0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGlj
cyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdt
YkgNCk1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0KKEhSQiAzNjgw
OSwgQUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rldg0K

--------------1n0AowBnC0QreoQcDd1C604p--

--------------gWgXlBM6luHpgwUeody7d7Fc
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmHoMB0FAwAAAAAACgkQlh/E3EQov+DD
ABAAl6tvXvOROEJYeyhcthr4oAyhsP9RZGai62SVbs5YFEnjrBHJsOg822HsJLwQM78sUpi04tMl
HNlGKteJxBL9I7ytTXo7sS5RFaNaC2DmugssxDX/kOe2kyBjBomLXsxYVf6s/uBFl1FMKYwAreS+
xeUJAizResiT8i5kapbCVdUEc2siM0KlKOHgHdQC24G94KnV67JRJkewZhlJF4WyewtBQGeYKnPx
Z00eP3z1i2h24wEq7aaDPRocViFksDosfvXl3i/ssrkQ4JLz22OFgW9S1uJjh0hHTlwdqInnTH8W
PGuXVWC5L9/rFRCekpAOBCjr5DRzotXcD5r0XPqIlEnxHl82H67yQmEPvpC11JNjwOroTYcJ14Ai
ohq0AvEaK0kNMNW19FCSnLwYXHCWiqzLfAo1oGst7TahwNgt0IP1JpyluTfSUAcmmRhZEI+RBDgb
Sn7KP5V5dVzdOykuM322V3e6ZXukhzxJT+5AvC73Ir37V/ag2RWEy04QvYt2EUOwbsizI4F2bNah
zDgEND9y1CE9YnEUiBHaL92IeLps4S7JK6tyVGfj/QaodrynBB09XL7TOzewF1zedMqwPxAAIK8s
vmptZ03Q3/aMq1tYPMUx2slwYYB3KdiJxqRmuHYwdP6qnKbfh/kpUQzy2kzIT1IRVc3XAxJq+NP+
bF0=
=TGDD
-----END PGP SIGNATURE-----

--------------gWgXlBM6luHpgwUeody7d7Fc--
