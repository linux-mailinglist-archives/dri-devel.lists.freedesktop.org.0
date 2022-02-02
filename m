Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F40834A6D93
	for <lists+dri-devel@lfdr.de>; Wed,  2 Feb 2022 10:14:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB75C10E726;
	Wed,  2 Feb 2022 09:14:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CACF610E726
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Feb 2022 09:14:08 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 5F5F31F383;
 Wed,  2 Feb 2022 09:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1643793247; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VGaEopolAvl1vay+2D2pXDxvd4KCA4P6ayFyqkb1R0I=;
 b=CO4VaGHa+kSZrOZqdEskiYP36IG5XmodUKi2GeCohPY0uM789V2DgfZhC9XAemSW8oJu2u
 RRdOpVTvNR+KPyqzTGA4yB+k3XSp+2kd/+AIKH+BZv8mgZ5QnMlCMTLnPPigwNTBbcDYc6
 ZHUdBmO58pd6mMVM2YWj+Lzcywb3zgY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1643793247;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VGaEopolAvl1vay+2D2pXDxvd4KCA4P6ayFyqkb1R0I=;
 b=SoY7nsu6xVyAmtRg9p7bYmpLCMMa3/Yee7IHY2JVOpbX6U7VKcA86x43qB/MozPeoUhl92
 2RvM/eOioY4JErBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1A32013DF0;
 Wed,  2 Feb 2022 09:14:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ehdCBV9L+mFkPQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 02 Feb 2022 09:14:07 +0000
Message-ID: <4966d03e-ee0c-5130-3819-05a90a8f6d06@suse.de>
Date: Wed, 2 Feb 2022 10:14:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/4] drm: Add I2C connector type
Content-Language: en-US
To: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Sam Ravnborg <sam@ravnborg.org>,
 Javier Martinez Canillas <javierm@redhat.com>
References: <20220131201225.2324984-1-javierm@redhat.com>
 <20220131201225.2324984-2-javierm@redhat.com> <YfhMESTylI1NTKDg@ravnborg.org>
 <4d9a56a7-da25-b411-61cc-372c6fa9011d@tronnes.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <4d9a56a7-da25-b411-61cc-372c6fa9011d@tronnes.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------FndkqVO09pyI4e7xoz9safGT"
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
Cc: linux-fbdev@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Emil Velikov <emil.l.velikov@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 Maxime Ripard <maxime@cerno.tech>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------FndkqVO09pyI4e7xoz9safGT
Content-Type: multipart/mixed; boundary="------------wnU0sWHf0kqwXpNJOmXZj0A8";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Sam Ravnborg <sam@ravnborg.org>,
 Javier Martinez Canillas <javierm@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 Maxime Ripard <maxime@cerno.tech>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Emil Velikov <emil.l.velikov@gmail.com>
Message-ID: <4966d03e-ee0c-5130-3819-05a90a8f6d06@suse.de>
Subject: Re: [PATCH 1/4] drm: Add I2C connector type
References: <20220131201225.2324984-1-javierm@redhat.com>
 <20220131201225.2324984-2-javierm@redhat.com> <YfhMESTylI1NTKDg@ravnborg.org>
 <4d9a56a7-da25-b411-61cc-372c6fa9011d@tronnes.org>
In-Reply-To: <4d9a56a7-da25-b411-61cc-372c6fa9011d@tronnes.org>

--------------wnU0sWHf0kqwXpNJOmXZj0A8
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgTm9yYWxmLA0KDQpzaW5jZSB5b3UncmUgaGVyZSwgSSdsbCBqdXN0IGhpamFjayB0aGUg
ZGlzY3Vzc2lvbiB0byBhc2sgc29tZXRoaW5nIG9ubHkgDQpzZW1pLXJlbGF0ZWQuDQoNCklJ
UkMgdGhlIGd1ZCBkcml2ZXIgZG9lc24ndCB1cGRhdGUgdGhlIGRpc3BsYXkgaW1tZWRpYXRl
bHkgZHVyaW5nIGF0b21pYyANCmNvbW1pdHMuIEluc3RlYWQsIGl0IGluc3RydWN0cyBhIGhl
bHBlciB0aHJlYWQgdG8gZG8gdGhlIHVwZGF0ZS4gV2hhdCdzIA0KdGhlIHJhdGlvbmFsIGJl
aGluZCB0aGlzIGRlc2lnbj8gSXMgdGhhdCBzb21ldGhpbmcgd2Ugc2hvdWxkIGFkb3B0IGZv
ciANCm90aGVyIGRyaXZlcnMgdGhhdCBvcGVyYXRlIG92ZXIgc2xvdyBidXNlcyAoVVNCLCBJ
MkMsIGV0Yyk/IFdvdWxkIHRoaXMgDQpiZSByZWxldmFudCBmb3IgdGhlIHNzZDEzMDcgZHJp
dmVyPw0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQotLSANClRob21hcyBaaW1tZXJtYW5u
DQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBH
ZXJtYW55IEdtYkgNCk1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0K
KEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rl
dg0K

--------------wnU0sWHf0kqwXpNJOmXZj0A8--

--------------FndkqVO09pyI4e7xoz9safGT
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmH6S14FAwAAAAAACgkQlh/E3EQov+B2
dhAAmUk7hZVbh7kpyuDZLO5lLjg3IGDxYwEDbQBD96KxgxbrM2yYyx4mSysTqgUYek775ZfvdMbV
aFoQMt8142Fxvva+jXPER6kZN7IPSUTc6ViH1pocYPK/kkqRjG27+fIXmr0gjVb492CBJ0CrVpGo
vxIyhpv9yPnctVYMuyPE65S5WZmAew+4r17iaOVs2wPzxB5Vshgjhzv0F1qh+0UERqvVKVXriOaf
aExR57kR0t+tHBWOHsC9WtWa2xaFSWREqhZVoyxVB7K3ZjVceIlbAalqmF+i/zHQ2Slp1gqnpMTz
BuqKlgxOzgCTlWrA7cWd479lu65+kcwoaVqRufvPde8ANKSr9veDyHFgqWKlOEYwZFUdn+zsNyON
R7OSfUmiZwZZpjLl3xNd7fnlNv3dy9K/7Pqdmnd4IZ4BRIsW+TzPuetdkC8J+KAI/kGfrGSLdtHQ
fhpQZa+xH8rOcAzPOvvGL6gYXvinSucKdWHRmNKv89R6C77QuCRPLDJdSeOylgJQHU9gCxtwJOu/
xrCV2CUcussh2SmhM9HszrRe5VkB4vAaVZCHHROXAFypKSoqRV26RwXM8TxfTgYwSsu4WsPzYzv+
glzuSIa7mzinC2LwPgmsKMOno2lQjzRhj3C5bkgGelwTMVkJbIY3dWw+5rBuByzGhqORN7maHvHP
8gQ=
=g4mF
-----END PGP SIGNATURE-----

--------------FndkqVO09pyI4e7xoz9safGT--
