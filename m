Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 299D649CD39
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jan 2022 16:02:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E9AB10E617;
	Wed, 26 Jan 2022 15:02:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E51D10E617
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jan 2022 15:02:27 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 82AE7218E9;
 Wed, 26 Jan 2022 15:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1643209344; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+ywInxyOJy4rz3LH14it69JB4bBo+dtZ6Lmpqfgo0DE=;
 b=gOXER/1epdmtD5AO9wXgMGZUupvfT1zX5RutgVnrF1i5g2Q+tTcncMmZVNBz/oC9zsXPPW
 mjkwJ5ondIesWMCCdxyyZgX3LtD7wL70+3uHhEvCRTR9p2Reb8l2s8TdUMJKLpSdnph4zn
 cy9gHa++wO8maPrUJhemeL6aQq0DkjI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1643209344;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+ywInxyOJy4rz3LH14it69JB4bBo+dtZ6Lmpqfgo0DE=;
 b=GDP0FeKTCWdBFIW9rOydJ6PR1ncGcl7Ml0dBivgRjOOcQnredC46xWELXsV95GbuoA/hlG
 YgAHQ+S6l3Ai2oAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 333D413A67;
 Wed, 26 Jan 2022 15:02:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id dCwGC4Bi8WEJEgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 26 Jan 2022 15:02:24 +0000
Message-ID: <df377b35-8913-a8c6-760b-073f462780cc@suse.de>
Date: Wed, 26 Jan 2022 16:02:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v1 0/4] fbtft: Unorphan the driver for maintenance
Content-Language: en-US
To: Andy Shevchenko <andy.shevchenko@gmail.com>
References: <20220125202118.63362-1-andriy.shevchenko@linux.intel.com>
 <991e988b-7225-881b-a59a-33c3eae044be@suse.de>
 <CAHp75Vc2cjHkJwNSiJ-HSWBG=DYy68uvD7QQzNdRp3mQxoY1nw@mail.gmail.com>
 <3877516e-3db3-f732-b44f-7fe12b175226@gmx.de>
 <75a10e6f-ade7-01d9-9523-9a1936f8a2cc@suse.de>
 <YfFNhsPr4kS2/LXa@smile.fi.intel.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <YfFNhsPr4kS2/LXa@smile.fi.intel.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------mkAP40MHAxNYXACQ9Me0DfSY"
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
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Phillip Potter <phil@philpotter.co.uk>,
 Carlis <zhangxuezhi1@yulong.com>, Lee Jones <lee.jones@linaro.org>,
 Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------mkAP40MHAxNYXACQ9Me0DfSY
Content-Type: multipart/mixed; boundary="------------GcAdGPDtoHEUJRGvbwW80LY7";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Andy Shevchenko <andy@kernel.org>, linux-fbdev@vger.kernel.org,
 Michael Hennerich <michael.hennerich@analog.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller
 <deller@gmx.de>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Phillip Potter <phil@philpotter.co.uk>, Carlis <zhangxuezhi1@yulong.com>,
 Lee Jones <lee.jones@linaro.org>, Heiner Kallweit <hkallweit1@gmail.com>
Message-ID: <df377b35-8913-a8c6-760b-073f462780cc@suse.de>
Subject: Re: [PATCH v1 0/4] fbtft: Unorphan the driver for maintenance
References: <20220125202118.63362-1-andriy.shevchenko@linux.intel.com>
 <991e988b-7225-881b-a59a-33c3eae044be@suse.de>
 <CAHp75Vc2cjHkJwNSiJ-HSWBG=DYy68uvD7QQzNdRp3mQxoY1nw@mail.gmail.com>
 <3877516e-3db3-f732-b44f-7fe12b175226@gmx.de>
 <75a10e6f-ade7-01d9-9523-9a1936f8a2cc@suse.de>
 <YfFNhsPr4kS2/LXa@smile.fi.intel.com>
In-Reply-To: <YfFNhsPr4kS2/LXa@smile.fi.intel.com>

--------------GcAdGPDtoHEUJRGvbwW80LY7
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjYuMDEuMjIgdW0gMTQ6MzIgc2NocmllYiBBbmR5IFNoZXZjaGVua286DQo+
IE9uIFdlZCwgSmFuIDI2LCAyMDIyIGF0IDEyOjQxOjQxUE0gKzAxMDAsIFRob21hcyBaaW1t
ZXJtYW5uIHdyb3RlOg0KPj4gQW0gMjYuMDEuMjIgdW0gMTE6NTkgc2NocmllYiBIZWxnZSBE
ZWxsZXI6DQo+IA0KPiAuLi4NCj4gDQo+IA0KPj4gSXQncyBhbHdheXMgZm9yIHRoZSBzYW1l
IHJlYXNvbjogdGhlIGh3IGlzIG9sZCBhbmQgZGV2cyBoYXZlIG1vdmVkIG9uLg0KPiANCj4g
SXQncyBwaXR5IHRvIGhhdmUgYSB3b3JraW5nIHN5c3RlbSB3aXRoIGFuIG9sZCBoYXJkd2Fy
ZSB0aGF0IG5vIG9uZSBpbg0KPiB0aGUga2VybmVsIGNvbW11bml0eSBnaXZlcyBhIHNoaXQg
YWJvdXQgYmVjYXVzZSBzaW1wbHkgdGhleSBhcmUgbm90IGluDQo+IHRoZSBzYW1lIGJvYXQu
IFRyeSB0byBiZSBvbiB0aGUgcGVvcGxlJ3MgcG9zaXRpb24uLi4NCg0KWWVzLCBJIGRvIGNh
cmUgYWJvdXQgb2xkIGhhcmR3YXJlLiBJIG1hZGUgaGVscGVycyBmb3IgY29udmVydGluZyBm
YmRldiANCmRyaXZlcnMgdG8gRFJNLiBJIGV2ZW4gbWFkZSB0aGUgaW5pdGlhbCBjb21taXRz
IGZvciB0aG9zZSBkcml2ZXJzIHdoZXJlIA0KSSBjb3VsZCBmaW5kIHRoZSBIVyBvbiBFYmF5
LiBbMV0gSSBtYWRlIHN1cmUgdGhhdCBldmVyeSBzaW5nbGUgb2YgdGhlbSANCmF0IGxlYXN0
IGdldHMgZmJjb24gb250byB0aGUgc2NyZWVuLiBTbyBpbnRlcmVzdGVkIGRldnMgY291bGQg
c3RhcnQgDQppbW1lZGlhdGVseS4gWWV0LCBubyBvbmUgZXZlciBzaG93ZWQgdXAgdG8gY29u
dmVydCBldmVuIGEgc2luZ2xlIGRyaXZlci4NCg0KQXMgaXQgc3RhbmRzLCA5MHMgUENJIGhh
cmR3YXJlIGlzIGN1cnJlbnRseSBzdXBwb3J0ZWQgYnkgRFJNJ3Mgc2ltcGxlZHJtIA0KYXMg
bG9uZyBhcyB0aGUgZGV2aWNlIGhhcyBWRVNBLiBUaGUgcGVyZm9ybWFuY2UgaXMgYXQgbGVh
c3QgdXNhYmxlIG9uIA0KQXRobG9uWFAtZXJhIGNvbXB1dGVycy4gTm93IHRoZSBvd25lcnMg
b2YgdGhlc2UgZGV2aWNlcyBhdCBsZWFzdCBoYXZlIGEgDQpjaGFuY2Ugb2YgdXNpbmcgbW9k
ZXJuIGdyYXBoaWNzIHVzZXJzcGFjZS4NCg0KVGhhdCB1c2Vyc3BhY2UgaXMgaW1wb3J0YW50
OiBncmFwaGljcyBkcml2ZXJzIGRvbid0IGxpdmUgaW4gYSB2YWN1dW0uIA0KVGhlcmUncyBu
byBwb2ludCBpbiBoYXZpbmcgb25lIGlmIGl0IHJlcXVpcmVzIGV4dHJhIHN1cHBvcnQgZnJv
bSBhbGwgDQpvdGhlciBjb21wb25lbnRzLiBBbmQgdGhlcmUncyBtb3JlOg0KDQogICogT2Nj
YXNpb25hbGx5LCBmYmRldiBnZXRzIGluIHRoZSB3YXkgb2YgRFJNLiBKdXN0IHRoaXMgd2Vl
aywgd2UgZml4ZWQgDQphIHJlbGF0ZWQgYnVnLiBbMl0NCg0KICAqIEZiZGV2J3MgbW1hcCBz
ZW1hbnRpY3MgaXMgdGhlIHJlYXNvbiB3aHkgaXQncyBoYXJkIHRvIGRvIGZhc3QgaW4gRFJN
Lg0KDQogICogTWFpbnRhaW5pbmcgYm90aCBzdGFja3MsIERSTSBhbmQgZmJkZXYsIGFkZHMg
d29yayB0byBrZXJuZWwsIA0KdXNlcnNwYWNlIGFuZCBkaXN0cm8gZGV2cy4NCg0KVGhlcmVm
b3JlLCBhbnl0aGluZyB3ZSBkbyB0aGF0IGtlZXBzIGZiZGV2IGFsaXZlIGlzIGEgc3RlcCBi
YWNrd2FyZHMgYW5kIA0KYSBidXJkZW4gb24gdGhlIG92ZXJhbGwgTGludXggZ3JhcGhpY3Mg
Y29tbXVuaXR5Lg0KDQpQbGVhc2UgZXhjdXNlIG15IHJhbnRpbmcsIGJ1dCBmYmRldiBwcm9w
b25lbnRzIHNlZW0gdG8gYmUgaWdub3JhbnQgdG8gDQphbGwgdGhlc2UgcG9pbnRzLiBJdCdz
IGFwcGFyZW50bHkgYWxsIGFib3V0ICdteSBjb25zb2xlIGlzIHNsb3cnLg0KDQpCZXN0IHJl
Z2FyZHMNClRob21hcw0KDQpbMV0gDQpodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcv
dHppbW1lcm1hbm4vbGludXgvLS90cmVlL2ZiY29udi1wbHVzLWRyaXZlcnMNClsyXSANCmh0
dHBzOi8vbG9yZS5rZXJuZWwub3JnL2RyaS1kZXZlbC8xNmY5ZTA2NC05OWNjLTQyMDUtZDAz
ZS1hZTQxZWQwMzQzMDlAcmVkaGF0LmNvbS9ULyN0DQoNCj4gDQoNCi0tIA0KVGhvbWFzIFpp
bW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29s
dXRpb25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBH
ZXJtYW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8aHJlcjog
SXZvIFRvdGV2DQo=

--------------GcAdGPDtoHEUJRGvbwW80LY7--

--------------mkAP40MHAxNYXACQ9Me0DfSY
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmHxYn8FAwAAAAAACgkQlh/E3EQov+AD
UBAAovu/Fu8JCln4An0Ubgvw3C7lAaZuVlWZx34PknO0gLZukkBJex0oiIBIuhKiC+O8UmuvkvcC
nRacG08NYPLvYIXn7A416PICsOLFbA8167ilOpVAigEXP9caMLwk3V8aJ3iICDoTy+p2QH8DT4ba
3LmAnEoSaD5923SnBre2HvE5KEVje00QYCYQrTKhtLQpq9Ih0QBI6eMWXX0eQr75ljmlz/KfkfEx
RK9juB0zjDY6fk0v1+xwydU7qYhoAnZHw+6HKRtp+1fFI7EDs6Az/jFuP0zIIYOFqmqtSjRBnanw
g9CA1uYFIFIV2zIPx4mq6kD/jzRpYc77A8ljQi5OSTzw0Yzxa1UJmB7zPYwLz3tLfYcFVbMSTWtC
ddBfDtiFlvrl0K723jQi60hW2w6r3vZR1TDplf+7PJjgd9+EpBysgL0uAIctCy6jv1L1toc5nwN8
0lycR0pN3XboYWMo39xikgy2HhQtLhqAX0/VG5uyYs0vLJDINBYgU7eVz9T7lG/ZzNi1CspZ8H3Y
Oj5M3IvBzmseo06XBWbZ3K0h2ake2EW8PzaN3LetIEwB/szl37kMbv7LEzu+myZnyPkzT9wjyJyk
lAO1ImUX3MW6OYK+Gp1m/nZx5x1+Q1Im7JEaYHRFKtzBBedD0/SDptuqCJ6TY0fwH/13Cvpgf9Te
Zy0=
=Mgbk
-----END PGP SIGNATURE-----

--------------mkAP40MHAxNYXACQ9Me0DfSY--
