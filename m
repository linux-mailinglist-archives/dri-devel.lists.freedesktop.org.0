Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 20D1249C8AE
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jan 2022 12:31:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0982510E3E9;
	Wed, 26 Jan 2022 11:31:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46FE510E3E9
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jan 2022 11:31:43 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id DB3B81F397;
 Wed, 26 Jan 2022 11:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1643196701; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8ZQ1UFjCevFb0oD3n1b1lyFJPNiNbvmW/0bM6sT4KUg=;
 b=IB+3QwaiisJzQfr1Ppsx4IcB6rIKr1GMzBNIWOcLvkIQ+Xreay4wmiFnBCK5uz1guANDw9
 J32q2xvJPNz8RkrMIYOc3ED2iXQ0T+7hlUXNb3q68liVRoh3fW8bWpkUgcvL+p4aFsuNDl
 43XQVgso/ca1l3M50+tEQ5tMHCPSOqo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1643196701;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8ZQ1UFjCevFb0oD3n1b1lyFJPNiNbvmW/0bM6sT4KUg=;
 b=eMcBQHxH451xz2rg/zhHS7uJNbPuap1OKe8L9wOKS1vLcuRg2VNWHSzesymEJlmsaisvb5
 K5Ft+gGGoMWSJYAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8E3E213BA2;
 Wed, 26 Jan 2022 11:31:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id GRCiIR0x8WHsEwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 26 Jan 2022 11:31:41 +0000
Message-ID: <ebb9b4f4-32cd-c8a4-ed2d-e94b4759a984@suse.de>
Date: Wed, 26 Jan 2022 12:31:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v1 1/4] fbtft: Unorphan the driver
Content-Language: en-US
To: Helge Deller <deller@gmx.de>, Daniel Vetter <daniel@ffwll.ch>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20220125202118.63362-1-andriy.shevchenko@linux.intel.com>
 <20220125202118.63362-2-andriy.shevchenko@linux.intel.com>
 <YfEG2qVO9K9G+g1d@kroah.com>
 <CAKMK7uGoRC9a4cMCADTipV67oivfWvTw=6RYm2kOthB_bhWnXQ@mail.gmail.com>
 <f671a112-880d-1526-a395-360947b40c5a@gmx.de>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <f671a112-880d-1526-a395-360947b40c5a@gmx.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------UpuzuH0MqO0ygaSx5SNNSl9y"
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
Cc: Andy Shevchenko <andy@kernel.org>, linux-fbdev@vger.kernel.org,
 Michael Hennerich <michael.hennerich@analog.com>,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Phillip Potter <phil@philpotter.co.uk>,
 Carlis <zhangxuezhi1@yulong.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Lee Jones <lee.jones@linaro.org>, Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------UpuzuH0MqO0ygaSx5SNNSl9y
Content-Type: multipart/mixed; boundary="------------dlfExxp6uaAJi3utM946Zklv";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Helge Deller <deller@gmx.de>, Daniel Vetter <daniel@ffwll.ch>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Andy Shevchenko <andy@kernel.org>, linux-fbdev@vger.kernel.org,
 Michael Hennerich <michael.hennerich@analog.com>,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Phillip Potter <phil@philpotter.co.uk>,
 Carlis <zhangxuezhi1@yulong.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Lee Jones <lee.jones@linaro.org>, Heiner Kallweit <hkallweit1@gmail.com>
Message-ID: <ebb9b4f4-32cd-c8a4-ed2d-e94b4759a984@suse.de>
Subject: Re: [PATCH v1 1/4] fbtft: Unorphan the driver
References: <20220125202118.63362-1-andriy.shevchenko@linux.intel.com>
 <20220125202118.63362-2-andriy.shevchenko@linux.intel.com>
 <YfEG2qVO9K9G+g1d@kroah.com>
 <CAKMK7uGoRC9a4cMCADTipV67oivfWvTw=6RYm2kOthB_bhWnXQ@mail.gmail.com>
 <f671a112-880d-1526-a395-360947b40c5a@gmx.de>
In-Reply-To: <f671a112-880d-1526-a395-360947b40c5a@gmx.de>

--------------dlfExxp6uaAJi3utM946Zklv
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjYuMDEuMjIgdW0gMTI6MTcgc2NocmllYiBIZWxnZSBEZWxsZXI6DQo+IE9u
IDEvMjYvMjIgMTE6MzEsIERhbmllbCBWZXR0ZXIgd3JvdGU6DQo+PiBPbiBXZWQsIEphbiAy
NiwgMjAyMiBhdCA5OjMxIEFNIEdyZWcgS3JvYWgtSGFydG1hbg0KPj4gPGdyZWdraEBsaW51
eGZvdW5kYXRpb24ub3JnPiB3cm90ZToNCj4+Pg0KPj4+IE9uIFR1ZSwgSmFuIDI1LCAyMDIy
IGF0IDEwOjIxOjE0UE0gKzAyMDAsIEFuZHkgU2hldmNoZW5rbyB3cm90ZToNCj4+Pj4gTGV0
J3MgbWFpbnRhaW4gb2NjYXNpb25hbCBmaXhlcyB0byB0aGUgZmJ0ZnQgZHJpdmVyLg0KPj4+
Pg0KPj4+PiBTaWduZWQtb2ZmLWJ5OiBBbmR5IFNoZXZjaGVua28gPGFuZHJpeS5zaGV2Y2hl
bmtvQGxpbnV4LmludGVsLmNvbT4NCj4+Pj4gLS0tDQo+Pj4+ICAgTUFJTlRBSU5FUlMgfCA0
ICsrKy0NCj4+Pj4gICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0
aW9uKC0pDQo+Pj4+DQo+Pj4+IGRpZmYgLS1naXQgYS9NQUlOVEFJTkVSUyBiL01BSU5UQUlO
RVJTDQo+Pj4+IGluZGV4IGVhM2U2YzkxNDM4NC4uMTZlNjE0NjA2YWMxIDEwMDY0NA0KPj4+
PiAtLS0gYS9NQUlOVEFJTkVSUw0KPj4+PiArKysgYi9NQUlOVEFJTkVSUw0KPj4+PiBAQCAt
NzM3Miw5ICs3MzcyLDExIEBAIEY6ICAgICBEb2N1bWVudGF0aW9uL2ZhdWx0LWluamVjdGlv
bi8NCj4+Pj4gICBGOiAgIGxpYi9mYXVsdC1pbmplY3QuYw0KPj4+Pg0KPj4+PiAgIEZCVEZU
IEZyYW1lYnVmZmVyIGRyaXZlcnMNCj4+Pj4gK006ICAgQW5keSBTaGV2Y2hlbmtvIDxhbmR5
QGtlcm5lbC5vcmc+DQo+Pj4+ICAgTDogICBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnDQo+Pj4+ICAgTDogICBsaW51eC1mYmRldkB2Z2VyLmtlcm5lbC5vcmcNCj4+Pj4gLVM6
ICAgT3JwaGFuDQo+Pj4+ICtTOiAgIE1haW50YWluZWQNCj4+Pj4gK1Q6ICAgZ2l0IGdpdDov
L2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9hbmR5L2xpbnV4LWZi
dGZ0LmdpdA0KPj4+DQo+Pj4gSSdtIG9rIHdpdGggdGhlIGZpbGVzIG1vdmluZyBpZiB0aGUg
ZHJpIGRldmVsb3BlcnMgYWdyZWUgd2l0aCBpdC4gIEl0J3MNCj4+PiB1cCB0byB0aGVtLCBu
b3QgbWUuDQo+Pg0KPj4gT24gb25lIGhhbmQgSSdtIGhhcHB5IGFueXRpbWUgc29tZW9uZSB2
b2x1bnRlZXJzIHRvIGhlbHAgb3V0Lg0KPj4NCj4+IE9uIHRoZSBvdGhlciBoYW5kIC4uLiB3
aHkgZG9lcyBpdCBoYXZlIHRvIGJlIHJlc3VycmVjdGluZyBmYmRldj8NCj4+IFRoZXJlJ3Mg
YW4gZW50aXJlIGNvbW11bml0eSBvZiBwZW9wbGUgd2hvIHJlYWxseSBrbm93IGdyYXBoaWNz
IGFuZA0KPj4gZGlzcGxheSBhbmQgc3BlbnQgY29uc2lkZXJhYmxlIGFtb3VudCBvZiBlZmZv
cnQgb24gY3JlYXRpbmcgdXNlZnVsIGFuZA0KPj4gZG9jdW1lbnRlZCBoZWxwZXJzIGZvciBw
cmV0dHkgbXVjaCBhbnl0aGluZyB5b3UgbWlnaHQgZXZlciB3YW50IHRvIGRvLg0KPj4gQW5k
IHNvbWVob3cgd2UgaGF2ZSB0byBnbyBiYWNrIHRvIHR5cGluZyBvdXQgdGhpbmdzIHRoZSBo
YXJkIHdheSwgd2l0aA0KPj4gZnVsbCB2ZXJib3NpdHksIGZvciBhbiB1YXBpIHRoYXQgZGlz
dHJvcyBhcmUgYWJhbmRvbmluZyAoZS5nLiBldmVuIGZvcg0KPj4gc2RsIHRoZSBkaXJlY3Rp
b24gaXMgdG8gcnVuIGl0IG9uIHRvcCBvZiBkcm0gd2l0aCBhIGNvbXBhdCBsYXllciwNCj4+
IGFmYWl1aSBmZWRvcmEgaXMgY29tcGxldGVseSBkaXRjaGluZyBhbnkgdXNlcnNwYWNlIHRo
YXQgc3RpbGwgZXZlbg0KPj4gdXNlcyAvZGV2L2ZiLzApLiBBbmQgeWVzIEkga25vdyB0aGVy
ZSdzIHN0aWxsIHNvbWUgZ2FwcyBpbiBkcm0sDQo+PiBsYXJnZWx5IGZvciBkaXNwbGF5IGZl
YXR1cmVzIHdoaWNoIHdlcmUgcmVhbGx5IGVuIHZvZ3VlIGFib3V0IDIwIHllYXJzDQo+PiBh
Z28uIEFuZCB3ZSdyZSBoYXBweSB0byBhZGQgdGhhdCBzdXBwb3J0LCBpZiBzb21lb25lIHdo
byBzdGlsbCBoYXMNCj4+IHN1Y2ggaGFyZHdhcmUgY2FuIHB1dCBpbiB0aGUgbGl0dGxlIGJp
dCBvZiB3b3JrIG5lZWRlZCAuLi4NCj4+DQo+PiBJIGRvbid0IGdldCB0aGlzLg0KPiANCj4g
WW91IGFyZSBkZXNjcmliaW5nIGEgdHJhbnNpdGlvbmluZyBvdmVyIHRvIERSTSAtIHdoaWNo
IGlzIE9rLg0KPiBCdXQgb24gdGhhdCB3YXkgdGhlcmUgaXMgbm8gbmVlZCB0byBpZ25vcmUs
IGRlbnkgb3IgZXZlbiBraWxsIHVzYWdlIHNjZW5hcmlvcw0KPiB3aGljaCBhcmUgZGlmZmVy
ZW50IGNvbXBhcmVkIHRvIHlvdXIgdXNhZ2Ugc2NlbmFyaW9zIChlLmcuIGVtYmVkZGVkIGRl
dmljZXMsDQo+IG9sZCBwbGF0Zm9ybXMsIHNsb3cgZGV2aWNlcywgc2xvdyBidXNzZXMsIG5v
IDNEIGhhcmR3YXJlIGZlYXR1cmVzLA0KPiBsb3ctY29sb3IgZGV2aWNlcywgLi4uKS4NCg0K
QW5kIG5vbmUgb2YgdGhvc2UgZXhhbXBsZXMgaXMgb3V0LXJ1bGVkIGJ5IERSTS4gSW4gZmFj
dCB3ZSBkbyBzdXBwb3J0IA0KZGV2aWNlcyB0aGF0IGZhbGwgaW4gdGhvc2UgY2F0ZWdvcmll
cy4NCg0KVGhpcyBpcyBsYXN0IHdlZWsncyBkaXNjdXNzaW9uIGFsbCBvdmVyIGFnYWluLg0K
DQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQo+IA0KPiBIZWxnZQ0KDQotLSANClRob21hcyBa
aW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNv
bHV0aW9ucyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywg
R2VybWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bDvGhyZXI6
IEl2byBUb3Rldg0K

--------------dlfExxp6uaAJi3utM946Zklv--

--------------UpuzuH0MqO0ygaSx5SNNSl9y
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmHxMR0FAwAAAAAACgkQlh/E3EQov+BR
Pg/9Grj31Vj0bM7meomljxyTuAaZNv7NpFGQQ8XOTHfQpefillv50tcyCVAqIInA+xqkT+QBr81C
9PY73vxL/JXfZqTbFNVjD7Ty3TijNorYHfSF7DnZwLI5KYga9uKddZo7D/OnIfz3XA7fZYRKk3Pb
U0goa7mXHXwaPjvRVTq8/b9Ox/ZxQ2O3cdO/bLjb4rgkqiN5ovbBP2whD4v8AjUaeaJdXaZVoK4y
3AvV0pScfuNHRp2vfa2WDxnLoHz6JzrQr9MHYJaPE7LLPpcvZcVxorBlDjYQw8j4Oc4rL1Bpdel1
kW5+wTHcgaEZVbMLjL+OvwYLxYRVcCZLPjuUtV54bCNvPPyayQJW0oe/lESQzr+Ex8esLPbRMtZr
ASNR4geyOfqDuLgAZJXv676jdlpzrI8RS+JOzOwfXcMKcawaQtNq1CaGSH/uSmRWEgHtsIDNrpJ9
9abMMxdOua5G+dXrm4bPgWze40x8GS3WcP8/uv15IPRcZL7GVM4YKNkqJb1kD6sFnvP1VMNAHpHM
N53TWw2J55d86QABEqxngqVhhk1nJeuFX3oirFyMjcPEksAOrv6FrmBJ5xwXM2A/wvRqmHViNOs/
hiFiNSrV9KFRheKJlZS6NFHycYVXpr5JtDb80G/pBM44S7F3u/gy7froyINhMsGSeea7x7EQ82s4
fRc=
=myeE
-----END PGP SIGNATURE-----

--------------UpuzuH0MqO0ygaSx5SNNSl9y--
