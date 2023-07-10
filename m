Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A0DE974D9BD
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jul 2023 17:22:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B9AF10E296;
	Mon, 10 Jul 2023 15:22:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8305C10E1C4;
 Mon, 10 Jul 2023 15:22:31 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 70CED2232F;
 Mon, 10 Jul 2023 15:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1689002549; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=f9YU6kgr3AZQPI61sCH8br42+ZI0/eMwmpIZNMLHoAU=;
 b=ezCgR6kKuGW9mblw/tGNpY2UO/8YJ9bKkXOg4xTKLNGdaFJgQseaLq2Vc6QmZWUJezl8LN
 M3rAgmeSHvU5hKJ3DAecHMtv2/yTk6g8P1nOPsAsCcyiM4pnjL4H6aCuQQd5Ygl/U6ybNX
 o2t3cvD7nJP0LgPIFmZhoFAxDq7q81Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1689002549;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=f9YU6kgr3AZQPI61sCH8br42+ZI0/eMwmpIZNMLHoAU=;
 b=wDueoqD1Mdn9akcq6CIKGnH4rgtpH0NVskooCq4SrpwD9YhD3cZsyz4LBZ8BDaaOYCbr83
 VtXhwhAmUptxwGBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 11E851361C;
 Mon, 10 Jul 2023 15:22:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id lz9gAzUirGTGXwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 10 Jul 2023 15:22:29 +0000
Message-ID: <733273ad-89e1-d952-37ee-bb75c3ab8188@suse.de>
Date: Mon, 10 Jul 2023 17:22:28 +0200
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
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <CANiq72=9PoV3FOcXx9FdiSLePKXDG4BSY_5-jddBkqDL=ua3FA@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------jUsPVU9eO41Mfau4JMej3ZiU"
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
--------------jUsPVU9eO41Mfau4JMej3ZiU
Content-Type: multipart/mixed; boundary="------------isGioYLGE6aLAoHpvCKZCjXA";
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
Message-ID: <733273ad-89e1-d952-37ee-bb75c3ab8188@suse.de>
Subject: Re: [PATCH 09/17] auxdisplay: Remove flag FBINFO_FLAG_DEFAULT from
 fbdev drivers
References: <20230710130113.14563-1-tzimmermann@suse.de>
 <20230710130113.14563-10-tzimmermann@suse.de>
 <CANiq72=9PoV3FOcXx9FdiSLePKXDG4BSY_5-jddBkqDL=ua3FA@mail.gmail.com>
In-Reply-To: <CANiq72=9PoV3FOcXx9FdiSLePKXDG4BSY_5-jddBkqDL=ua3FA@mail.gmail.com>

--------------isGioYLGE6aLAoHpvCKZCjXA
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTAuMDcuMjMgdW0gMTY6MjQgc2NocmllYiBNaWd1ZWwgT2plZGE6DQo+IE9u
IE1vbiwgSnVsIDEwLCAyMDIzIGF0IDM6MDHigK9QTSBUaG9tYXMgWmltbWVybWFubiA8dHpp
bW1lcm1hbm5Ac3VzZS5kZT4gd3JvdGU6DQo+Pg0KPj4gVGhlIGZsYWcgRkJJTkZPX0ZMQUdf
REVGQVVMVCBpcyAwIGFuZCBoYXMgbm8gZWZmZWN0LCBhcyBzdHJ1Y3QNCj4+IGZiaW5mby5m
bGFncyBoYXMgYmVlbiBhbGxvY2F0ZWQgdG8gemVybyBieSBmcmFtZWJ1ZmZlcl9hbGxvYygp
LiBTbyBkbw0KPj4gbm90IHNldCBpdC4NCj4gDQo+IGBmcmFtZWJ1ZmZlcl9hbGxvYygpYCBk
b2VzIGluZGVlZCB1c2UgYGt6YWxsb2MoKWAsIGJ1dCB0aGUgZG9jcyBkbyBub3QNCj4gbWVu
dGlvbiB0aGUgemVyb2luZy4gU2hvdWxkIHRoYXQgZ3VhcmFudGVlIGJlIGRvY3VtZW50ZWQ/
DQoNCkknbGwgYXBwZW5kIGEgcGF0Y2ggdG8gdGhlIHNlcmllcyB0aGF0IGRvY3VtZW50cyB0
aGlzLg0KDQo+IA0KPj4gRmxhZ3Mgc2hvdWxkIHNpZ25hbCBkaWZmZXJlbmNlcyBmcm9tIHRo
ZSBkZWZhdWx0IHZhbHVlcy4gQWZ0ZXIgY2xlYW5pbmcNCj4+IHVwIGFsbCBvY2N1cmVuY2Vz
IG9mIEZCSU5GT19GTEFHX0RFRkFVTFQsIHRoZSB0b2tlbiBjYW4gYmUgcmVtb3ZlZC4NCj4g
DQo+IG9jY3VyZW5jZXMgLT4gb2NjdXJyZW5jZXMNCj4gDQo+IGNhbiAtPiB3aWxsIG1heWJl
PyBTaW5jZSB0aGUgaW50ZW50aW9uIG9mIHRoZSBwYXRjaCBzZXJpZXMgaXMgdG8NCj4gcmVt
b3ZlIGl0ICh0aGVtKSBhbHRvZ2V0aGVyKS4NCg0KU3VyZS4NCg0KQmVzdCByZWdhcmRzDQpU
aG9tYXMNCg0KPiANCj4gVGhhbmtzIQ0KPiANCj4gQ2hlZXJzLA0KPiBNaWd1ZWwNCg0KLS0g
DQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBT
b2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpGcmFua2Vuc3RyYXNzZSAxNDYsIDkw
NDYxIE51ZXJuYmVyZywgR2VybWFueQ0KR0Y6IEl2byBUb3RldiwgQW5kcmV3IE15ZXJzLCBB
bmRyZXcgTWNEb25hbGQsIEJvdWRpZW4gTW9lcm1hbg0KSFJCIDM2ODA5IChBRyBOdWVybmJl
cmcpDQo=

--------------isGioYLGE6aLAoHpvCKZCjXA--

--------------jUsPVU9eO41Mfau4JMej3ZiU
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmSsIjQFAwAAAAAACgkQlh/E3EQov+D4
nQ/8D7mlMiLl4N+aerXFpIUKe6RRa+C9U1qxWDMdALRg57be/CZeoU44owAwYkvN4Jx4zPYal16M
UQZFheDfymtdS8RFepV3E+U2K3PcgOvNPK98EZOF3feIlw5q8CScIy/xjBSeGTSG8AupE117C+OF
MMI6G6GVt92ap4zsSx+i6gcgUB0BtdM+xfKqeHEfba+n76ZfKNAbTK4v8jPtc+0gAsBWsSJ5JiaC
/QIyWDHgQN2dxXFmRmU+gBJsa/IrONfkK3hCseKd8ap3O1BfA5+KT2Sk6mBj1nuF0gbQJPBh1tGs
7RJ4fGW45T2pNXrcmx7Y9no0iPUd21ogZKBd55zfO8pdIR0fLdVgY87oEABsadmVL6L4YAlH1hen
0sriL3WOxFXWqXmZtbehB9xDyetXAndystyRjnz+CGHCJnd5kplrJpVeGiNsBiBhbeftk5sOLvf4
U17WksvIF9WuBvvdf9pB5jK8EYNCoYTUdeME3uNfu2QqPwszn8/2GYP84Ywtn0woTPZFhnsMD1Ez
nN8DPXKR0BKIufo/1U7AgfdUb27t5dGrIcCtgRVar60tsrwmX79ajodm2//KOvEeRcS3WidRXF1v
KRC5d32icnvnTr6PC5jx1m/BsmPRdlPCEM2zqvJWi8URGSKFdS+rvoXLFfBXCw01YKUU4P6PI4ia
7Ks=
=lZHg
-----END PGP SIGNATURE-----

--------------jUsPVU9eO41Mfau4JMej3ZiU--
