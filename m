Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B3DC49C8D7
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jan 2022 12:41:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C371810E707;
	Wed, 26 Jan 2022 11:41:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABF0B10E8BF
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jan 2022 11:41:43 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 59D031F396;
 Wed, 26 Jan 2022 11:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1643197302; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EVy/lJnzFPtdhzlf+AMRGSrpqoRidNBqhqETWPdAk2k=;
 b=Jdt02zjRukxWFhN5TNlKIEIt7p7FSck1p9BRy9jqL0acAKxXpr7ZHEP2m24IjW7l72nsC4
 l92Kh21aX9erprxmAatIT+pM0rV9rmpdtseFWe923zpo9twD8SxoVV1Fg4EA2jiWIRxRlf
 GERioANfC6WJEAaESN8mPqi/VGpAnE4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1643197302;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EVy/lJnzFPtdhzlf+AMRGSrpqoRidNBqhqETWPdAk2k=;
 b=OtDB4TAryW6a0qql7Y9EXRxM7BGlGUrCTYXuaE1Tj/9zFmjSi+Mj1kdACXqy3CuCS6xudU
 OvIqnoG4pI8pQLBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0719413BA2;
 Wed, 26 Jan 2022 11:41:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 7/xnAHYz8WHyGQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 26 Jan 2022 11:41:42 +0000
Message-ID: <75a10e6f-ade7-01d9-9523-9a1936f8a2cc@suse.de>
Date: Wed, 26 Jan 2022 12:41:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v1 0/4] fbtft: Unorphan the driver for maintenance
Content-Language: en-US
To: Helge Deller <deller@gmx.de>, Andy Shevchenko <andy.shevchenko@gmail.com>
References: <20220125202118.63362-1-andriy.shevchenko@linux.intel.com>
 <991e988b-7225-881b-a59a-33c3eae044be@suse.de>
 <CAHp75Vc2cjHkJwNSiJ-HSWBG=DYy68uvD7QQzNdRp3mQxoY1nw@mail.gmail.com>
 <3877516e-3db3-f732-b44f-7fe12b175226@gmx.de>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <3877516e-3db3-f732-b44f-7fe12b175226@gmx.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------FMGu0nSHisxtDBmT5BSNd3eL"
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
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Phillip Potter <phil@philpotter.co.uk>, Carlis <zhangxuezhi1@yulong.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Lee Jones <lee.jones@linaro.org>, Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------FMGu0nSHisxtDBmT5BSNd3eL
Content-Type: multipart/mixed; boundary="------------SFdg6HIZAysgnDaOZyDvGKX2";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Helge Deller <deller@gmx.de>, Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Phillip Potter <phil@philpotter.co.uk>, Lee Jones <lee.jones@linaro.org>,
 Heiner Kallweit <hkallweit1@gmail.com>, Carlis <zhangxuezhi1@yulong.com>,
 linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Michael Hennerich <michael.hennerich@analog.com>,
 Andy Shevchenko <andy@kernel.org>
Message-ID: <75a10e6f-ade7-01d9-9523-9a1936f8a2cc@suse.de>
Subject: Re: [PATCH v1 0/4] fbtft: Unorphan the driver for maintenance
References: <20220125202118.63362-1-andriy.shevchenko@linux.intel.com>
 <991e988b-7225-881b-a59a-33c3eae044be@suse.de>
 <CAHp75Vc2cjHkJwNSiJ-HSWBG=DYy68uvD7QQzNdRp3mQxoY1nw@mail.gmail.com>
 <3877516e-3db3-f732-b44f-7fe12b175226@gmx.de>
In-Reply-To: <3877516e-3db3-f732-b44f-7fe12b175226@gmx.de>

--------------SFdg6HIZAysgnDaOZyDvGKX2
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjYuMDEuMjIgdW0gMTE6NTkgc2NocmllYiBIZWxnZSBEZWxsZXI6DQo+IE9u
IDEvMjYvMjIgMTE6MDIsIEFuZHkgU2hldmNoZW5rbyB3cm90ZToNCj4+IE9uIFdlZCwgSmFu
IDI2LCAyMDIyIGF0IDEwOjUyIEFNIFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBz
dXNlLmRlPiB3cm90ZToNCj4+PiBBbSAyNS4wMS4yMiB1bSAyMToyMSBzY2hyaWViIEFuZHkg
U2hldmNoZW5rbzoNCj4+Pj4gU2luY2Ugd2UgZ290IGEgbWFpbnRhaW5lciBmb3IgZmJkZXYs
IEkgd291bGQgbGlrZSB0bw0KPj4+PiB1bm9ycGhhbiBmYnRmdCAod2l0aCB0aGUgaWRlYSBv
ZiBzZW5kaW5nIFBScyB0byBIZWxnZSkNCj4+Pj4gYW5kIG1vdmUgaXQgb3V0IG9mIHN0YWdp
bmcgc2luY2UgdGhlcmUgaXMgbm8gbW9yZSBjbGVhbg0KPj4+PiB1cCB3b3JrIGV4cGVjdGVk
IGFuZCBubyBtb3JlIGRyaXZlcnMgZWl0aGVyLg0KPj4+Pg0KPj4+PiBUaG91Z2h0cz8NCj4g
DQo+IFBlcnNvbmFsbHkgSSdtIGluIGZhdm91ciBvZiB0aGlzIHByb3Bvc2FsIGFuZCB3b3Vs
ZCBiZSBoYXBweQ0KPiB0byB0YWtlIHBhdGNoZXMgZm9yIGl0IHRocm91Z2ggdGhlIGZiZGV2
IGdpdCB0cmVlLg0KPiBSZWFzb25pbmcgYmVsb3cuLi4NCj4gDQo+Pj4gQnV0IHdoeT8gV2Ug
YWxyZWFkeSBoYXZlIERSTSBkcml2ZXJzIGZvciBzb21lIG9mIHRoZXNlIGRldmljZXMuDQo+
Pg0KPj4gTm8sIHdlIGRvIG5vdCAob25seSBhIGZldyBhcmUgYXZhaWxhYmxlKS4NCj4gDQo+
IHNlZW1zIHRvIGJlIDIgb3V0IG9mIDEwIChhY2NvcmRpbmcgdG8gdGhlIG90aGVyIG1haWxz
KQ0KDQpGWUkgaXQncyBpbGk5MTYzIGFuZCBoeDgzNTdkLiBCb3RoIG9mIHRob3NlIGFyZSBv
ZiB0aGUgc2FtZSBzaXplICgnd2MgDQotbCcpIG9uIERSTSBhbmQgZmJkZXY6IDIwMCB0byAz
MDAgbG9jLg0KDQo+Pj4gUG9ydGluZyB0aGUgb3RoZXJzIHRvIERSTSBpcyBzdWNoIGEgYmV0
dGVyIGxvbmctdGVybSBwbGFuLiAgT1RPSCwNCj4+PiBhcyBubyBvbmUgaGFzIHNob3duIHVw
IGFuZCBjb252ZXJ0ZWQgdGhlbSwgbWF5YmUgdGhleSBzaG91bGQgYmUNCj4+PiBsZWZ0IGRl
YWQgb3IgcmVtb3ZlZCBlbnRpcmVseS4NCj4+DQo+PiBBcyBJIG1lbnRpb25lZCBhYm92ZSB0
aGVyZSBhcmUgZGV2aWNlcyB0aGF0IG5vYm9keSB3aWxsIHRha2UgdGltZSB0bw0KPj4gcG9y
dCB0byBhIHdheSB0b28gY29tcGxleCBEUk0gc3Vic3lzdGVtLiBCdXQgdGhlIGRldmljZXMg
YXJlIGNoZWFwIGFuZA0KPj4gcXVpdGUgd2lkZXNwcmVhZCBpbiB0aGUgZW1iZWRkZWQgd29y
bGQuIEknbSBpbiBwb3NzZXNzaW9uIG9mIDMgb3IgNA0KPj4gZGlmZmVyZW50IG1vZGVscyBh
bmQgb25seSAxIGlzIHN1cHBvcnRlZCBieSB0aW55IERSTS4NCj4+DQo+PiBPbiB0b3Agb2Yg
dGhhdCB0aGUgc3VidGxlIGZhY3QgcGVvcGxlIGZvcmdvdCBhYm91dCBGQlRGVCBpcyB0aGF0
IGl0DQo+PiBkb2VzIHN1cHBvcnQgcGFyYWxsZWwgaW50ZXJmYWNlICh5ZXMsIEkga25vdyB0
aGF0IGl0J3Mgbm90IHBlcmZvcm1hbnQsDQo+PiBidXQgb25lIG9mIHRoZSBkaXNwbGF5cyBJ
IGhhdmUgaXMgd2l0aCB0aGF0IHR5cGUgb2YgaW50ZXJmYWNlKS4NCj4gDQo+IEkgZG9uJ3Qg
a25vdyB0aG9zZSBkZXZpY2VzLCBidXQgaXQgc2VlbXMgdGhleSBhcmUgc3RpbGwgYmVpbmcg
dXNlZC4NCj4gDQo+IEFuZCB0aGUgcmVhc29ucyB3aHkgdGhleSBoYXZlIG5vdCBiZWVuIHBv
cnRlZCB0byBEUk0geWV0IGlzDQo+IGxpa2VseSBiZWNhdXNlIGVpdGhlciBsYWNrIG9mIG1h
bi1wb3dlciwgYSBzbG93LWRvd24gd2l0aCBEUk0gKGR1ZSB0bw0KPiBzbG93IGJ1cyBjb25u
ZWN0aW9ucyBvciBpbmNyZWFzZWQgbWVtb3J5IHVzYWdlIHdpdGggRFJNKSwgb3INCj4gc2lt
cGx5IHRoYXQgaXQncyB1c2VkIGluIGVtYmVkZGVkLWxpa2Ugc2NlbmFyaW9zIHdpdGggYSBs
aW1pdGVkDQo+IHNldCBvZiB1c2Vyc3BhY2UgYXBwbGljYXRpb25zIGZvciB3aGljaCBleGlz
dGluZyBmYmRldiBhY2Nlc3MgaXMgc3VmZmljaWVudC4NCj4gDQo+IEFnYWluLCBJIGRvbid0
IGtub3cgdGhlIHJlYXNvbiBmb3IgdGhpcyBzcGVjaWZpYyBkZXZpY2VzLCBidXQgSSBrbm93
DQo+IG9mIG90aGVyIGRldmljZXMgZm9yIHdoaWNoIHRob3NlIHJlYXNvbnMgYWJvdmUgYXJl
IHZhbGlkLg0KPiBKdXN0IHRoZSBleGFtcGxlIEkgcG9zdGVkIHllc3RlcmRheSB3aGVyZSBh
IHNpbXBsZSAidGltZSBkbWVzZyIgbmVlZGVkDQo+IHVuYWNjZWxlcmF0ZWQgMTkgc2Vjb25k
cyBjb21wYXJlZCB0byAyIHNlY29uZHMgd2l0aCBhY2NlbGVyYXRpb24uDQo+IFNvLCBhcyBs
b25nIGFzIGFjY2VsZXJhdGlvbiBpc24ndCBwb3NzaWJsZSB3aXRoIHRoYXQgZHJpdmVyIGlu
DQo+IERSTSwgRFJNIGlzbid0IGEgcHJlZmVycmVkIHRhcmdldCB3aGVyZSB0aGUgZHJpdmVy
IHNob3VsZCBiZSBwb3J0ZWQuDQo+IA0KPiBTbywgSSdkIGJlIGZpbmUgdG8gdGFrZSBpdCBp
bnRvIGZiZGV2IHRyZWUuDQo+IA0KPiBJbnRlcmVzdGluZ2x5IHRoZXJlIGlzIGFub3RoZXIg
ZmJkZXYgZHJpdmVyIGluIHN0YWdpbmcgKHNtNzUwZmIpIHdpdGgNCj4gc2ltaWxpYXIgaXNz
dWVzLiBUaGUgVE9ETyBtZW50aW9ucyBhIHBvcnRpbmcgdG8gRFJNIHdoaWNoIGhhcHBlbnMg
YXQNCj4gaHR0cHM6Ly9naXRsYWIuY29tL3N1ZGlwbS9zbTc1MC90cmVlL3NtNzUwDQo+IGJ1
dCB0aGUgbGFzdCBjb21taXQgdGhlcmUgaXMgMyB5ZWFycyBhZ28uIEkgZG9uJ3Qga25vdyB3
aHkgaXQgd2Fzbid0DQo+IGNvbnRpbnVlZCB5ZXQuDQoNCkl0J3MgYWx3YXlzIGZvciB0aGUg
c2FtZSByZWFzb246IHRoZSBodyBpcyBvbGQgYW5kIGRldnMgaGF2ZSBtb3ZlZCBvbi4NCg0K
QmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhp
Y3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBH
bWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4
MDksIEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCg==

--------------SFdg6HIZAysgnDaOZyDvGKX2--

--------------FMGu0nSHisxtDBmT5BSNd3eL
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmHxM3UFAwAAAAAACgkQlh/E3EQov+Dq
aA/+NqIYjpyQCBoaYlZ9v9rY1ftCAGoiEIHZDzNBLya11KHZmvBMrHbY8JBFZZEqLJnAfgJXzDqC
XgRL+OR1vE8jllNfFFF0pZvZyBFk+Ctunz/7xbN+Ti+a+x1bMG/BXBKbnpYrzfDolhTt78bQKbNO
ZIADh5ETWSa/ORD6J20KUui0rX6UiY8sJ2EKPLbp5RsWiY16Oac73uv+FoMEiXRbSsaq7YXsgg13
BLZj23pf+VwH7650UWjJUwpn119mxCOK2e8Cmn21XCX3MKB0n3FK1YB0mSe+rGLkzzX993+brnr1
E5WXRmUu7TRmecnWgCYT9GM7ph6oIvR325yjqteUCePxUZvpdJ1FYZ0SjdZpLfGSxj1OaK3CAL/W
TmFzMAdeyGAysCTTMC3En423mZVslmGuxybkR39T1rA6y4XTYWrFc6poNbJZ5adojh8CS6KjAQUS
z63/JMKfKUq3QZHMi4b7yc6BrzVgpuFpFOk2F9u7TPWsLChjB5exMNK30YXkSD1Mw/Lsbd7ElvKF
jA/s0h8rwqdi/92v1cEsKx8Y5ZJ9mNdX1A9a3AVZedvLXD3uDaby1C/nCJIfZzHvXMJhlUJzMwmq
wDaTAFlyRBLIHh1FwtlkRfNXanT/MzTL5+R1QoXXRoxMolWZzWlgiKcStEF+4td2aQI8LIwxkeWR
st4=
=UZeu
-----END PGP SIGNATURE-----

--------------FMGu0nSHisxtDBmT5BSNd3eL--
