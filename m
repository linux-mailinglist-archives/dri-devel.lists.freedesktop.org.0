Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A047749C912
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jan 2022 12:51:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1451110E8CF;
	Wed, 26 Jan 2022 11:51:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCB8E10E844
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jan 2022 11:51:19 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 52EA91F397;
 Wed, 26 Jan 2022 11:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1643197878; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WN9Ip30kqBy/bRxKBj0xyrG8FuTGNu7NnI2/hJlTwnY=;
 b=EfyPi7E9kJqmrz2D9rNvEMRSyaNqTyXDtGF1W0Att0Z7nhlO53nGs/bzkYS5Nc10x1KC1/
 h8sBSz4aBayW5MxKA26Trcy8Mz3AsGUHqDUUg2TNro/5NQlxxl9jt7g28GgdkyOPaWZ+MO
 AJF3zPEOVzhkAqf9caQ1Y8ltba3C814=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1643197878;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WN9Ip30kqBy/bRxKBj0xyrG8FuTGNu7NnI2/hJlTwnY=;
 b=Q8sIf3Am0KlC+t8XLq/8cEGxXJe+6ynUqoRPLDKTKm6eiCa2x5iK/zGlSOR6hKNc2TRhgj
 vnAOZgtLGyWzCIAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E9BC513BA2;
 Wed, 26 Jan 2022 11:51:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id jI8UOLU18WGPHwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 26 Jan 2022 11:51:17 +0000
Message-ID: <fa673f9c-2654-755e-450d-d29b95c1ce9d@suse.de>
Date: Wed, 26 Jan 2022 12:51:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v1 0/4] fbtft: Unorphan the driver for maintenance
Content-Language: en-US
To: Helge Deller <deller@gmx.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>
References: <20220125202118.63362-1-andriy.shevchenko@linux.intel.com>
 <991e988b-7225-881b-a59a-33c3eae044be@suse.de>
 <CAHp75Vc2cjHkJwNSiJ-HSWBG=DYy68uvD7QQzNdRp3mQxoY1nw@mail.gmail.com>
 <3877516e-3db3-f732-b44f-7fe12b175226@gmx.de>
 <b13c0634-e766-74db-ab1f-672f5d0c04d6@redhat.com>
 <6f508ff0-1807-7665-6c93-7f3eea4a1bdd@gmx.de>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <6f508ff0-1807-7665-6c93-7f3eea4a1bdd@gmx.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------JnRflBn1QA502eLVkMeWa1Ta"
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
--------------JnRflBn1QA502eLVkMeWa1Ta
Content-Type: multipart/mixed; boundary="------------c3aHYJxo0ZbpFtAhYu9krT2V";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Helge Deller <deller@gmx.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Andy Shevchenko <andy@kernel.org>, linux-fbdev@vger.kernel.org,
 Michael Hennerich <michael.hennerich@analog.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Phillip Potter <phil@philpotter.co.uk>,
 Carlis <zhangxuezhi1@yulong.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Lee Jones <lee.jones@linaro.org>, Heiner Kallweit <hkallweit1@gmail.com>
Message-ID: <fa673f9c-2654-755e-450d-d29b95c1ce9d@suse.de>
Subject: Re: [PATCH v1 0/4] fbtft: Unorphan the driver for maintenance
References: <20220125202118.63362-1-andriy.shevchenko@linux.intel.com>
 <991e988b-7225-881b-a59a-33c3eae044be@suse.de>
 <CAHp75Vc2cjHkJwNSiJ-HSWBG=DYy68uvD7QQzNdRp3mQxoY1nw@mail.gmail.com>
 <3877516e-3db3-f732-b44f-7fe12b175226@gmx.de>
 <b13c0634-e766-74db-ab1f-672f5d0c04d6@redhat.com>
 <6f508ff0-1807-7665-6c93-7f3eea4a1bdd@gmx.de>
In-Reply-To: <6f508ff0-1807-7665-6c93-7f3eea4a1bdd@gmx.de>

--------------c3aHYJxo0ZbpFtAhYu9krT2V
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjYuMDEuMjIgdW0gMTI6MzEgc2NocmllYiBIZWxnZSBEZWxsZXI6DQo+IE9u
IDEvMjYvMjIgMTI6MTgsIEphdmllciBNYXJ0aW5leiBDYW5pbGxhcyB3cm90ZToNCj4+IE9u
IDEvMjYvMjIgMTE6NTksIEhlbGdlIERlbGxlciB3cm90ZToNCj4+PiBPbiAxLzI2LzIyIDEx
OjAyLCBBbmR5IFNoZXZjaGVua28gd3JvdGU6DQo+Pg0KPj4gW3NuaXBdDQo+Pg0KPj4+PiBQ
LlMuIEZvciB0aGUgcmVjb3JkLCBJIHdpbGwgcGVyc29uYWxseSBOQUsgYW55IGF0dGVtcHRz
IHRvIHJlbW92ZSB0aGF0DQo+Pj4+IGRyaXZlciBmcm9tIHRoZSBrZXJuZWwuIEFuZCB0aGlz
IGlzIGFub3RoZXIgcG9pbnQgd2h5IGl0J3MgYmV0dGVyIG5vdA0KPj4+PiB0byBiZSB1bmRl
ciB0aGUgc3RhZ2luZy4NCj4+Pg0KPj4+IEkgYWdyZWUuIFNhbWUgYXMgZm9yIG1lIHRvIE5B
SyB0aGUgZGlzYWJsaW5nIG9mIGZiY29uJ3MgYWNjZWxlcmF0aW9uDQo+Pj4gZmVhdHVyZXMg
b3IgZXZlbiBhdHRlbXB0aW5nIHRvIHJlbW92ZSBmYmRldiBhbHRvZ2V0aGVyICh1bmxlc3Mg
YWxsDQo+Pj4gcmVsZXZhbnQgZHJpdmVycyBhcmUgcG9ydGVkIHRvIERSTSkuDQo+Pj4NCj4+
DQo+PiBCdXQgdGhhdCB3aWxsIG5ldmVyIGhhcHBlbiBpZiB3ZSBrZWVwIG1vdmluZyB0aGUg
Z29hbCBwb3N0Lg0KPj4NCj4+IEF0IHNvbWUgcG9pbnQgbmV3IGZiZGV2IGRyaXZlcnMgc2hv
dWxkIG5vdCBiZSBhZGRlZCBhbnltb3JlLCBvdGhlcndpc2UNCj4+IHRoZSBudW1iZXIgb2Yg
ZXhpc3RpbmcgZHJpdmVycyB0aGF0IG5lZWQgY29udmVyc2lvbiB3aWxsIGtlZXAgZ3Jvd2lu
Zy4NCj4gDQo+IEdvb2QgcG9pbnQsIGFuZCB5ZXMgeW91IGFyZSByaWdodCENCj4gDQo+IEkg
dGhpbmsgdGhlIHJ1bGUgc2hvdWxkIGJlIHNvbWV0aGluZyBsaWtlOg0KPiANCj4gTmV3IGdy
YXBoaWNzIGRldmljZXMgKGUuZy4gbWF4LiAzIHllYXJzIG9sZCBmcm9tIG5vdykgdXN1YWxs
eSBhcmUNCj4gY2FwYWJsZSB0byBiZSBwb3J0ZWQgdG8gRFJNLg0KPiBGb3IgdGhvc2UgZ3Jh
cGhpY3MgY2FyZHMgd2Ugc2hvdWxkIHB1dCBhIGhhcmQgc3RvcCBhbmQgbm90IGluY2x1ZGUg
dGhlbQ0KPiBhcyBuZXcgZHJpdmVyIGludG8gdGhlIGZiZGV2IGZyYW1ld29yay4gSW5jbHVz
aW9uIGZvciB0aG9zZSB3aWxsIG9ubHkNCj4gaGFwcGVuIGFzIERSTSBkcml2ZXIuDQo+IA0K
PiBJbiB0aGUgc2FtZSBtYW5uZXIgdGhlcmUgYXJlIG9sZCBncmFwaGljIGNhcmRzIG9yIHZl
cnkgc3BlY2lmaWMgZGV2aWNlcw0KPiAoZS5nLiBtb3JlIHRoYW4gMyB5ZWFycyBvbGQgb3Ig
b25seSB1c2VkIGluIG5pY2hlLXVzZSBjYXNlcykNCj4gd2hpY2ggaGF2ZSBsaW1pdGF0aW9u
cyBhbmQgdGh1cyBjYW4ndCBlYXNpbHkgYmUgcG9ydGVkIHRvIERSTS4NCj4gRm9yIHRob3Nl
IGl0J3Mgc3RpbGwgYWNjZXB0YWJsZSB0byBpbmNsdWRlIHRoZW0gYXMgbGVnYWN5IGZiZGV2
IGRyaXZlciwNCj4gYmVjYXVzZSB0aGUgd29yayBuZWVkZWQgaW4gRFJNIHRvIHN1cHBvcnQg
c3VjaCBjYXJkcyBvciB0byBiZSBhYmxlIHRoYXQNCj4gdGhleSBydW4gZmFzdCBlbm91Z2gg
d2l0aCBEUk0ganVzdCBkb2Vzbid0IHBheSBvZmYgdGhlIGVmZm9ydHMgd2hpY2ggYXJlDQo+
IG5lZWRlZCB0byBrZWVwIHRoZW0gYXMgRFJNIGRyaXZlci4NCj4gDQo+IFdvdWxkIHRoYXQg
YmUgYWNjZXB0YWJsZT8NCg0KTm8uIEFzIHdlJ3ZlIHNhaWQgc2V2ZXJhbCB0aW1lcywgdGhl
cmUncyBub3RoaW5nIHN0b3BwaW5nIGFueSBkZXZpY2UgDQpmcm9tIGJlaW5nIHN1cHBvcnRl
ZCBieSBEUk0uIElmIHNvbWV0aGluZydzIG1pc3Npbmcgb3Igc2xvdywgaXQncyANCmJlY2F1
c2Ugbm8gb25lIGhhcyBoYWQgdGhhdCBpc3N1ZSBzbyBmYXIuIFdlIHdlbGNvbWUgcGF0Y2hl
cyBwYXRjaGVzIHRvIA0KZml4IHN1Y2ggcHJvYmxlbXMuDQoNCkJlc3QgcmVnYXJkcw0KVGhv
bWFzDQoNCj4gDQo+IEhlbGdlDQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNz
IERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21i
SA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5
LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8aHJlcjogSXZvIFRvdGV2DQo=

--------------c3aHYJxo0ZbpFtAhYu9krT2V--

--------------JnRflBn1QA502eLVkMeWa1Ta
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmHxNbUFAwAAAAAACgkQlh/E3EQov+Dp
VxAAuXLl/kj8IPfH8Z6ARB+5uZZHI85kwITqFyp7bRLN27fNx0Q9JRqmsrq6i1rlM1q7p25D644A
tZCEf6rCOZIFspPc0mVzTAHwSTBWYrZN67BONdq4yaotg4xbkVh2RBcC5D0ya0tsubdgnASJ4IQ7
xkJ+thq4rMlyjKfQ+XOEUIG37CkZeVXRUTRQHhX86V8Ww5FB1CEUyv7mSDn1r9GIOVCmom70jcPN
xZRqeCpa7p1iRhmRpktrWBMRul6FVwUbGqsSI7t4YYerfWG/+gugO8VLdX4+MTXTIPqrnx86ZcRc
rmpjKhYWA8OmOMVzPgiEt8apMK3K7HJLvjym1Dl3tcMI+pypz2U1WDdyDddNUyDs5Ns9eX4wk8t7
1xSf+Aniqe7dOUdHi47LwWtfOmJHykAUVkbithcFVUj3yR3d4bIeRHymKX1gob3q48oUuDK0KkmJ
in3RtxcnQmhFGXVE2jqz+7bkG77bsu2L592wi3wFzo2QrCarcCWwEvxoo67sH7q97N/5KD6gr8hw
jz9jiWrqTxSA3FJHGIqZY3yQKv85Ll/60rMd61Lbz60o0iqVy9pej34lkjSQzVNtLEp26uoodeLw
ZYqlCQAPQsPinV4W2BTvwpa+VadgBF+0UpfoilVDYIpuSvaAyXX+KihIzP5cvdM+y913cpNFQBgC
hw0=
=rbTd
-----END PGP SIGNATURE-----

--------------JnRflBn1QA502eLVkMeWa1Ta--
