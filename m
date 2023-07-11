Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E1BD74E6D8
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jul 2023 08:10:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D0A310E30B;
	Tue, 11 Jul 2023 06:10:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F229310E309;
 Tue, 11 Jul 2023 06:10:24 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 83ADB20460;
 Tue, 11 Jul 2023 06:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1689055823; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RPjQbYTcnEX8d+ZHiNY3AzdcrgT2R+6Yye/BQ7ZmfHQ=;
 b=QaV5A/trJhOG1b3SkzHoPmhXs2nCdEKiSDxQkMh3qjoCo2Gery2vzUWgCjhTX8tGZpSV4o
 3buhgz8HSc5jL7Y/Dyfv7DrXBc88ovFDOmIJNEB+7d/aL5Dt1S40QNPSr7SUb5EfkuxarM
 rt/OVs6MUA/UqZZ2nQqTz3We4wmzThI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1689055823;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RPjQbYTcnEX8d+ZHiNY3AzdcrgT2R+6Yye/BQ7ZmfHQ=;
 b=pB9jkHIl2OK0OVlASCubh5aumrPJvcXE3e1e+WKLLusz1zFPk3AV6Ht4mp6kr2xq2y5coL
 ZQgGE7GgK81Yc/Dg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 221F71391C;
 Tue, 11 Jul 2023 06:10:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id +lxaB0/yrGSeCAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 11 Jul 2023 06:10:23 +0000
Message-ID: <745347ca-a369-eb01-eac4-75c09cf9e67f@suse.de>
Date: Tue, 11 Jul 2023 08:10:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 09/17] auxdisplay: Remove flag FBINFO_FLAG_DEFAULT from
 fbdev drivers
Content-Language: en-US
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
References: <20230710130113.14563-1-tzimmermann@suse.de>
 <20230710130113.14563-10-tzimmermann@suse.de>
 <CANiq72=9PoV3FOcXx9FdiSLePKXDG4BSY_5-jddBkqDL=ua3FA@mail.gmail.com>
 <733273ad-89e1-d952-37ee-bb75c3ab8188@suse.de>
 <CANiq72kPh2KE=ADUxhPyyr7noWhC0fkzmDu8EBn_20focnZqtw@mail.gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <CANiq72kPh2KE=ADUxhPyyr7noWhC0fkzmDu8EBn_20focnZqtw@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------6Si403MGmxQSUjmayt9vH0Ol"
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
Cc: linux-fbdev@vger.kernel.org, kvm@vger.kernel.org,
 linux-hyperv@vger.kernel.org, linux-sh@vger.kernel.org,
 Robin van der Gracht <robin@protonic.nl>, deller@gmx.de,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, javierm@redhat.com,
 dri-devel@lists.freedesktop.org, linux-input@vger.kernel.org,
 Miguel Ojeda <ojeda@kernel.org>, linux-nvidia@lists.surfsouth.com,
 linux-omap@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-geode@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------6Si403MGmxQSUjmayt9vH0Ol
Content-Type: multipart/mixed; boundary="------------adUMzkBKIng1X9u516u02tq1";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: deller@gmx.de, javierm@redhat.com, linux-sh@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, linux-input@vger.kernel.org,
 linux-media@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-geode@lists.infradead.org, linux-nvidia@lists.surfsouth.com,
 linux-hyperv@vger.kernel.org, linux-omap@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org,
 Miguel Ojeda <ojeda@kernel.org>, Robin van der Gracht <robin@protonic.nl>
Message-ID: <745347ca-a369-eb01-eac4-75c09cf9e67f@suse.de>
Subject: Re: [PATCH 09/17] auxdisplay: Remove flag FBINFO_FLAG_DEFAULT from
 fbdev drivers
References: <20230710130113.14563-1-tzimmermann@suse.de>
 <20230710130113.14563-10-tzimmermann@suse.de>
 <CANiq72=9PoV3FOcXx9FdiSLePKXDG4BSY_5-jddBkqDL=ua3FA@mail.gmail.com>
 <733273ad-89e1-d952-37ee-bb75c3ab8188@suse.de>
 <CANiq72kPh2KE=ADUxhPyyr7noWhC0fkzmDu8EBn_20focnZqtw@mail.gmail.com>
In-Reply-To: <CANiq72kPh2KE=ADUxhPyyr7noWhC0fkzmDu8EBn_20focnZqtw@mail.gmail.com>

--------------adUMzkBKIng1X9u516u02tq1
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTAuMDcuMjMgdW0gMTg6MjUgc2NocmllYiBNaWd1ZWwgT2plZGE6DQo+IE9u
IE1vbiwgSnVsIDEwLCAyMDIzIGF0IDU6MjLigK9QTSBUaG9tYXMgWmltbWVybWFubiA8dHpp
bW1lcm1hbm5Ac3VzZS5kZT4gd3JvdGU6DQo+Pg0KPj4gSSdsbCBhcHBlbmQgYSBwYXRjaCB0
byB0aGUgc2VyaWVzIHRoYXQgZG9jdW1lbnRzIHRoaXMuDQo+Pg0KPj4gU3VyZS4NCj4gDQo+
IFRoYW5rcyENCj4gDQo+IElmIHlvdSBhcmUgcGxhbm5pbmcgdG8gdGFrZSBpdCBpbnRvIHNv
bWUgb3RoZXIgdHJlZToNCj4gDQo+IEFja2VkLWJ5OiBNaWd1ZWwgT2plZGEgPG9qZWRhQGtl
cm5lbC5vcmc+DQoNClRoYW5rcy4NCg0KPiANCj4gT3RoZXJ3aXNlLCBJIGNhbiB0YWtlIGl0
IGludG8gdGhlIGBhdXhkaXNwbGF5YCB0cmVlLg0KDQpJJ2QgbGlrZSB0byB0YWtlIHRoZSBw
YXRjaHNldCBpbnRvIGRybS1taXNjLiBJdCdzIHBhcnQgb2YgYSBsYXJnZXIgDQpjbGVhbnVw
IG9mIHRoZSBmYmRldiBtb2R1bGVzIGFuZCBpdHMgaW50ZXJmYWNlcy4NCg0KQmVzdCByZWdh
cmRzDQpUaG9tYXMNCg0KPiANCj4gQ2hlZXJzLA0KPiBNaWd1ZWwNCg0KLS0gDQpUaG9tYXMg
WmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBT
b2x1dGlvbnMgR2VybWFueSBHbWJIDQpGcmFua2Vuc3RyYXNzZSAxNDYsIDkwNDYxIE51ZXJu
YmVyZywgR2VybWFueQ0KR0Y6IEl2byBUb3RldiwgQW5kcmV3IE15ZXJzLCBBbmRyZXcgTWNE
b25hbGQsIEJvdWRpZW4gTW9lcm1hbg0KSFJCIDM2ODA5IChBRyBOdWVybmJlcmcpDQo=

--------------adUMzkBKIng1X9u516u02tq1--

--------------6Si403MGmxQSUjmayt9vH0Ol
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmSs8k4FAwAAAAAACgkQlh/E3EQov+By
TA/6AzapxPiVh3ARFt/YSfDAvOrmktHT6CTi6i1Ub5i2Ym4BJUrgy8S99ghuFzqA3RHfz8ZHMF7z
2+eTMi10OHXwHO+9dl+rKSeyQt36p7SkOf1fHmpn0EUBDVKIZnk8Et3duAwpo1ExPN/k0mMpug7q
6IBW94bw8Ldux7ilsOmjCrHbBPPXsb8xo8ZRKro/4yNBA8/EBaMPnFJqFp6Y0W6lLh3VObxqAuke
uUpZq7rwwvp5m3nrJRPQurEVYtSebmgZGWQur4kPIM2anuxpg9EFXoKW1mvdeNnnsTk91QvRDsDC
A6zEhta2QJig3ZywCeQ26vAzoz6ckE5QJ89B7vMh+qAPloCCTG6hl2BpsBXYDyo0PFfsqswtihcy
Q5Ghqsm2q6SO7oqAYzBFGj6rL0sXHiVKaQ4BSs0lu1U1bcNCDDSL5Ltyi7gHY1odER+B2POXmobz
KD7DjGAhMSyD+P1NzWqFlitpR/Y+UB0aCvmScSbT5Wc6crZ8eWwXz8FHgn9Ahvf4rd/qk+e62gPR
5we59IVjsvIvzb5N2Vd3I2dYrLMiqD7asdFHFkynejvj8lP6hFdmv0SuDqLq4xDOY9fifRhFlrX9
tFpJW8RcfD2UeAYOOylhpmWtPJmVBWmXl7OexfCba2EcK9BRwhwpy2Jb8hJRATHDEfAQwi3uHdwf
q5o=
=5lcC
-----END PGP SIGNATURE-----

--------------6Si403MGmxQSUjmayt9vH0Ol--
