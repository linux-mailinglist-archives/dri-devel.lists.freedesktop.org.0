Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C8870680799
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jan 2023 09:40:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 228F810E17D;
	Mon, 30 Jan 2023 08:40:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C6CB89C0A;
 Mon, 30 Jan 2023 08:40:09 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 1D4E721904;
 Mon, 30 Jan 2023 08:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1675068008; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2SVfhz4vtI64h5SERZ/9fRgC8aqv2ev6ARHJYCOeeH4=;
 b=G2mVqFvKEL/BlzFzerKAcMGLe5N4yjYl5NQQhVVFOPOvi8MDzhZ/HfgNTmcGw1vpcO3+V/
 qC2QH1B7wcDHgG+hGne07hmu22/jcjJ1CCma6zbPvY0lpxpR6UFScXgGG2P+7VuhSN5y91
 K5HvfO+CrgNfQvoR+K30ExwPDfcMQtA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1675068008;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2SVfhz4vtI64h5SERZ/9fRgC8aqv2ev6ARHJYCOeeH4=;
 b=2J6FYGxp4Pro5SY2sXN5uFjh9m5a2UI3v22+JjjdQpCOqwELpLu5MyUzkzpZ0cFkCqJCYs
 GRUiM7cHFllcEbBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D7E4D13A06;
 Mon, 30 Jan 2023 08:40:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id QqG+M2eC12PIUwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 30 Jan 2023 08:40:07 +0000
Message-ID: <23bcc048-5c74-5781-33a7-98d28fafbdf8@suse.de>
Date: Mon, 30 Jan 2023 09:40:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v3 01/10] drm/client: Test for connectors before sending
 hotplug event
Content-Language: en-US
To: Simon Ser <contact@emersion.fr>
References: <20230125200415.14123-1-tzimmermann@suse.de>
 <20230125200415.14123-2-tzimmermann@suse.de>
 <tc_igyYrgA_B5xJ15j6H2fQ00aA6vzd4nuQ8XusqeJqWWNZDJx8fFRgBAWoWOV8L5BEhjFDMYgANfdKXLqJZ0DMcsZfy8OUHDRatj36oOXo=@emersion.fr>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <tc_igyYrgA_B5xJ15j6H2fQ00aA6vzd4nuQ8XusqeJqWWNZDJx8fFRgBAWoWOV8L5BEhjFDMYgANfdKXLqJZ0DMcsZfy8OUHDRatj36oOXo=@emersion.fr>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------9hAz08szS0xR2UsvN0rZCqf5"
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
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, javierm@redhat.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------9hAz08szS0xR2UsvN0rZCqf5
Content-Type: multipart/mixed; boundary="------------WtGY1Ja0eVD12VghFsROTVfh";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Simon Ser <contact@emersion.fr>
Cc: freedreno@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, javierm@redhat.com,
 dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Message-ID: <23bcc048-5c74-5781-33a7-98d28fafbdf8@suse.de>
Subject: Re: [PATCH v3 01/10] drm/client: Test for connectors before sending
 hotplug event
References: <20230125200415.14123-1-tzimmermann@suse.de>
 <20230125200415.14123-2-tzimmermann@suse.de>
 <tc_igyYrgA_B5xJ15j6H2fQ00aA6vzd4nuQ8XusqeJqWWNZDJx8fFRgBAWoWOV8L5BEhjFDMYgANfdKXLqJZ0DMcsZfy8OUHDRatj36oOXo=@emersion.fr>
In-Reply-To: <tc_igyYrgA_B5xJ15j6H2fQ00aA6vzd4nuQ8XusqeJqWWNZDJx8fFRgBAWoWOV8L5BEhjFDMYgANfdKXLqJZ0DMcsZfy8OUHDRatj36oOXo=@emersion.fr>

--------------WtGY1Ja0eVD12VghFsROTVfh
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjcuMDEuMjMgdW0gMTk6MDIgc2NocmllYiBTaW1vbiBTZXI6DQo+IE9uIFdl
ZG5lc2RheSwgSmFudWFyeSAyNXRoLCAyMDIzIGF0IDIxOjA0LCBUaG9tYXMgWmltbWVybWFu
biA8dHppbW1lcm1hbm5Ac3VzZS5kZT4gd3JvdGU6DQo+IA0KPj4gTm90IGhhdmluZyBjb25u
ZWN0b3JzIGluZGljYXRlcyBhIGRyaXZlciBidWcuDQo+IA0KPiBJcyBpdD8gV2hhdCBpZiBh
bGwgY29ubmVjdG9ycyBhcmUgb2YgdGhlIERQLU1TVCB0eXBlLCBpZS4gdGhleSBhcmUNCj4g
Y3JlYXRlZCBvbi10aGUtZmx5Pw0KDQpNeSBjb21taXQgbWVzc2FnZSB3YXMgbm9uc2Vuc2Uu
IEkgZXZlbiB3cml0ZSB0aGlzIGhlcmUgdGhhdCBoYXZpbmcgbm8gDQpjb25uZWN0b3JzIGlz
IGxlZ2l0aW1hdGUuDQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCg0KLS0gDQpUaG9tYXMg
WmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBT
b2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcs
IEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVy
OiBJdm8gVG90ZXYNCg==

--------------WtGY1Ja0eVD12VghFsROTVfh--

--------------9hAz08szS0xR2UsvN0rZCqf5
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmPXgmcFAwAAAAAACgkQlh/E3EQov+AQ
Lw//aZ2S6JqzI3HN2smO8qU+8YYo347edHPSYqgFtXYNPh3cskycgaxH6JIls8ewpLF85X5KdCnL
XBt1OEkxB971xIY+IIKEpyYtSogk036qBJGGlGkhHDvPNKAjvOJqZaUjiRDPNd/pMIbQy9TUlqjo
QITr7Pz5mfdt5iW+OEOUYWPSIDMvYjxK9CHPPmsVsVNaIsl7cW9jyVCdbv4SYqqJTwCoHONNB2XW
vGu/wsa1c+Qtj2LRN6kx7WkEJmx9qwmgwuc5zJ7ucRRs5ODZ28FWfVxPTi7BY4yilClpvctXZLpw
EZvCnFgjb2TASEqS1dTes6yP50lvv1wXbwc+2ujM6gqIG1HqaxAEOBUcjdUOuhTBXf2890OWaAzM
wa/sMoxafn5lGDGT8vLnz/aUfqUIeY8xrDyb/HED/bryXsaepjUYxI8rUmXNiQsNIjG/ONle8LZd
mKWCreWhoowp/ezL1/Hgk8vE9rlazNvx17ydqIhLK3DwrbsiH3YwY2lfYahS3sIjcnjPeOdWNGgs
rbyNvA4m/h7VCdby8PTEthQxkkU5S5yXwJrd5Jk+d4Eewmqx0SWhr/zV9AIJ9eemNfq531zvX3Se
E7Fmz390mmQVdwr88P2wDs1Wp8h9s9oZ+tbgYjpsVRMgzO+dUM4fYRnWvXUq4EU+1dtQLoHc0s3v
J50=
=3ibD
-----END PGP SIGNATURE-----

--------------9hAz08szS0xR2UsvN0rZCqf5--
