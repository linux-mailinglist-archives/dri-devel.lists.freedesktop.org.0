Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E6EC56F18FA
	for <lists+dri-devel@lfdr.de>; Fri, 28 Apr 2023 15:11:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57C3B10E30B;
	Fri, 28 Apr 2023 13:11:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55E7A10E30B
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Apr 2023 13:11:00 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C2B4521F7C;
 Fri, 28 Apr 2023 13:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1682687458; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FRqrMM19p3HeUciJL3I7cDdZrio595+aLz1J7KWfSA0=;
 b=ZPs7qKes2T1eM8QLZc4CBCc9IEZJpUBytScxV/o9Bh+rEAs67iN0DU5yVo7hbKa9QTOv9C
 mK9UA2fpsV9/fE5LE9veGn7yCrV7IaFCxUpWwuy3SmkM3OCqiVq6NQUWULZn/USK1C9jXI
 FmG26ubpmb55xF+alDKjaZ+FFr28Xy0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1682687458;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FRqrMM19p3HeUciJL3I7cDdZrio595+aLz1J7KWfSA0=;
 b=i8YJ+nJI6i6artOXs3jnB9Wd77oBrGUmtkYzoZ/Bvc3CbhbnzduEnZIED+jMtqxj6ajFPE
 A0fsZO0Bs1ztTdDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4F99A138FA;
 Fri, 28 Apr 2023 13:10:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Lth9EeLFS2R/EwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 28 Apr 2023 13:10:58 +0000
Message-ID: <b9a67217-4665-0d31-378d-ade1d50fe5f1@suse.de>
Date: Fri, 28 Apr 2023 15:10:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 5/5] fbdev: Define framebuffer I/O from Linux' I/O
 functions
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Robin Murphy <robin.murphy@arm.com>
References: <20230428092711.406-1-tzimmermann@suse.de>
 <20230428092711.406-6-tzimmermann@suse.de>
 <430c73f0-45f4-f81e-6506-bc8cc955d936@arm.com>
 <CAMuHMdUGjtiAR37L4_e0_p8ee2=gxoUj7+e7rqMLTBK+vpV4yw@mail.gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <CAMuHMdUGjtiAR37L4_e0_p8ee2=gxoUj7+e7rqMLTBK+vpV4yw@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------DtzGj0U2BDprAWf4ov3bjWMb"
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
Cc: linux-arch@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org, arnd@arndb.de,
 deller@gmx.de, chenhuacai@kernel.org, javierm@redhat.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 James.Bottomley@hansenpartnership.com, linux-m68k@lists.linux-m68k.org,
 loongarch@lists.linux.dev, vgupta@kernel.org, sparclinux@vger.kernel.org,
 kernel@xen0n.name, linux-snps-arc@lists.infradead.org, sam@ravnborg.org,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------DtzGj0U2BDprAWf4ov3bjWMb
Content-Type: multipart/mixed; boundary="------------QqwzqE2k5QMQXDVM2QKm13co";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Robin Murphy <robin.murphy@arm.com>
Cc: linux-fbdev@vger.kernel.org, linux-ia64@vger.kernel.org,
 dri-devel@lists.freedesktop.org, James.Bottomley@hansenpartnership.com,
 sparclinux@vger.kernel.org, kernel@xen0n.name, sam@ravnborg.org,
 linux-arch@vger.kernel.org, deller@gmx.de, chenhuacai@kernel.org,
 javierm@redhat.com, vgupta@kernel.org, linux-snps-arc@lists.infradead.org,
 arnd@arndb.de, linux-m68k@lists.linux-m68k.org, loongarch@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-parisc@vger.kernel.org,
 linux-kernel@vger.kernel.org, davem@davemloft.net
Message-ID: <b9a67217-4665-0d31-378d-ade1d50fe5f1@suse.de>
Subject: Re: [PATCH v2 5/5] fbdev: Define framebuffer I/O from Linux' I/O
 functions
References: <20230428092711.406-1-tzimmermann@suse.de>
 <20230428092711.406-6-tzimmermann@suse.de>
 <430c73f0-45f4-f81e-6506-bc8cc955d936@arm.com>
 <CAMuHMdUGjtiAR37L4_e0_p8ee2=gxoUj7+e7rqMLTBK+vpV4yw@mail.gmail.com>
In-Reply-To: <CAMuHMdUGjtiAR37L4_e0_p8ee2=gxoUj7+e7rqMLTBK+vpV4yw@mail.gmail.com>

--------------QqwzqE2k5QMQXDVM2QKm13co
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjguMDQuMjMgdW0gMTQ6Mjcgc2NocmllYiBHZWVydCBVeXR0ZXJob2V2ZW46
DQpbLi4uXQ0KPiANCj4gSW4gYWRkaXRpb24sIHRoZSBub24tcmF3IHZhcmlhbnRzIG1heSBk
byBzb21lIGV4dHJhcyB0byBndWFyYW50ZWUNCj4gb3JkZXJpbmcsIHdoaWNoIHlvdSBkbyBu
b3QgbmVlZCBvbiBhIGZyYW1lIGJ1ZmZlci4NCg0KR2l2ZW4gdGhpcyBjb21tZW50LCBzaG91
bGQgd2UgZGVjbGFyZSB0aGUgZmJfKCkgaGVscGVycyBpbiANCjxhc20tZ2VuZXJpYy9pby5o
PiBvciA8bGludXgvaW8uaD4/DQoNCkkgc3RpbGwgZG9uJ3QgbGlrZSB0aGUgaWRlYSBvZiBo
YXZpbmcgdGhlIGZ1bmN0aW9ucyBpbiA8bGludXgvZmIuaD4uIFdlIA0KaGF2ZSBjb2RlIGlu
IERSTSB0aGF0IGFsc28gYWNjZXNzZXMgZnJhbWVidWZmZXIgbWVtb3J5ICh2aWEgDQptZW1j
cHlfdG9pbygpKS4gSXQgd291bGQgbWFrZSBzZW5zZSB0byB1c2UgdGhlIGZiXygpIGhlbHBl
cnMsIGlmIHRoZXkgDQphcmUgdGFpbG9yZWQgdG93YXJkcyB0aGlzIHVzZWNhc2UuDQoNCkJl
c3QgcmVnYXJkcw0KVGhvbWFzDQoNCj4gDQo+IFNvIEknZCBnbyBmb3IgdGhlIF9fcmF3Xyoo
KSB2YXJpYW50cyBldmVyeXdoZXJlLg0KPiANCj4gR3J7b2V0amUsZWV0aW5nfXMsDQo+IA0K
PiAgICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQNCj4gDQoNCi0tIA0KVGhvbWFzIFpp
bW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29s
dXRpb25zIEdlcm1hbnkgR21iSA0KRnJhbmtlbnN0cmFzc2UgMTQ2LCA5MDQ2MSBOdWVybmJl
cmcsIEdlcm1hbnkNCkdGOiBJdm8gVG90ZXYsIEFuZHJldyBNeWVycywgQW5kcmV3IE1jRG9u
YWxkLCBCb3VkaWVuIE1vZXJtYW4NCkhSQiAzNjgwOSAoQUcgTnVlcm5iZXJnKQ0K

--------------QqwzqE2k5QMQXDVM2QKm13co--

--------------DtzGj0U2BDprAWf4ov3bjWMb
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmRLxeEFAwAAAAAACgkQlh/E3EQov+BG
IxAArW6Y0YDQCNr1aySTx/07IbAHS0y+vhIgCiTpfq5oowyVudzNjdBxnedCiRjYWsZfBCjMsdfr
SxG+xgQzdSfWxn5NIwDqE0oEckroWqzuCJYMPzjc8Y1+bJnGiNzVRI12YWtNY0GpaCjcKmUE75ex
6c6loZmjjSiohO5mMQbUKZ2H9VchlqkPVkvuCZb5CdwzMgrMkfcfq9almxX7WdOigfXMpbg2Fk7p
WudCvuFuCIVRRrLIsCowogRjWVN0SL7GwJUN/rHec1FCkBipWrUazGk7oTPG1AXrpOXBSSj6mRCn
H2jj7DsWTgPHaHBBLJelQDwgN3qjA94odDVKgKWGQoncs0+x5pEhkhn1HsOdBNPq6/KpozQPMoGz
QmooLt+AuV98nZyhlHWOxudGcY7/M1ERukgQLYzRVlHeaeQaQb+wbCBkV7Tm8ih99q64LpVwaSS/
Nfv/k/Zfq4yu4mQv24CdUqjlH1aA/XGzlmXlAgEiPpAfAUHgHy3Yoo+tZDtA837yssImYcvhwr2y
0cz3duc61je5Odls9Q9CS1szkJkhFpy9ctg0FrXQbv0IivBLnoxJiK7iES2y0NhXxUK/L9o+L/zc
FEc2JYYMJyNIGFM5dtmBMo6kmUoE5FbGeuwX6Ao4p2q/IoYK7MQ29bcKMRx28VoSCpPON+jpQ95S
M4s=
=GGjv
-----END PGP SIGNATURE-----

--------------DtzGj0U2BDprAWf4ov3bjWMb--
