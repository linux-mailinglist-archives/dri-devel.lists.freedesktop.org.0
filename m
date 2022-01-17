Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BF3F490BFD
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jan 2022 16:58:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3214D10E96A;
	Mon, 17 Jan 2022 15:58:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D3EF10E961
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jan 2022 15:58:38 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 196351F3B8;
 Mon, 17 Jan 2022 15:58:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1642435117; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=s7i6JnRec/qPSbejEKa8vCZtphgmyJdE4r+234KW65g=;
 b=QfRB+2j+8qhTy+b0XI76lp07VQurCz/rDFAjOKUDdhoIQsz9G69t6cbSIMSMb8P4X6sNCh
 hVrR12ygkHQMVmPuRQ51eA6yO6jOnRRJrLtfqs0Utwy1TEWENSwIQuPQi83XKAVa1vBxzH
 goPnMyqyvGTXNZ/dflpMT/Oiate5bYc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1642435117;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=s7i6JnRec/qPSbejEKa8vCZtphgmyJdE4r+234KW65g=;
 b=Y9/0W6vsrOYKqGRrXuqsHT0R59+f4QakY9nPmgV51O2zR/I+x/eBPYIcEfjTatD/cqkxME
 7vjRV0GpQXrVILDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DE59413CCF;
 Mon, 17 Jan 2022 15:58:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id APJXNSyS5WFmUAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 17 Jan 2022 15:58:36 +0000
Message-ID: <97d49bca-f5f7-dba4-b62d-b6fcdd4276ac@suse.de>
Date: Mon, 17 Jan 2022 16:58:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] MAINTAINERS: Add Helge as fbdev maintainer
Content-Language: en-US
To: Helge Deller <deller@gmx.de>, Daniel Vetter <daniel@ffwll.ch>
References: <YeG8ydoJNWWkGrTb@ls3530>
 <CAKMK7uGdJckdM+fg+576iJXsqzCOUg20etPBMwRLB9U7GcG01Q@mail.gmail.com>
 <c80ed72c-2eb4-16dd-a7ad-57e9dde59ba1@gmx.de>
 <CAKMK7uHVHn9apB6YYbLSwu+adEB2Fqp4FM0z582zf4F-v3_GnQ@mail.gmail.com>
 <cf21018b-f231-7538-169e-2ad450643cbf@gmx.de>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <cf21018b-f231-7538-169e-2ad450643cbf@gmx.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------BzT7mC0YBuKTDd1Yiq9Z9p76"
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
Cc: linux-fbdev@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Javier Martinez Canillas <javierm@redhat.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------BzT7mC0YBuKTDd1Yiq9Z9p76
Content-Type: multipart/mixed; boundary="------------A6CH4XiJT0nidYEpEMHS4Rvq";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Helge Deller <deller@gmx.de>, Daniel Vetter <daniel@ffwll.ch>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 "airlied@gmail.com" <airlied@gmail.com>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Javier Martinez Canillas <javierm@redhat.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Message-ID: <97d49bca-f5f7-dba4-b62d-b6fcdd4276ac@suse.de>
Subject: Re: [PATCH] MAINTAINERS: Add Helge as fbdev maintainer
References: <YeG8ydoJNWWkGrTb@ls3530>
 <CAKMK7uGdJckdM+fg+576iJXsqzCOUg20etPBMwRLB9U7GcG01Q@mail.gmail.com>
 <c80ed72c-2eb4-16dd-a7ad-57e9dde59ba1@gmx.de>
 <CAKMK7uHVHn9apB6YYbLSwu+adEB2Fqp4FM0z582zf4F-v3_GnQ@mail.gmail.com>
 <cf21018b-f231-7538-169e-2ad450643cbf@gmx.de>
In-Reply-To: <cf21018b-f231-7538-169e-2ad450643cbf@gmx.de>

--------------A6CH4XiJT0nidYEpEMHS4Rvq
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTcuMDEuMjIgdW0gMTY6NDIgc2NocmllYiBIZWxnZSBEZWxsZXI6DQogPiBb
Li4uXQ0KPj4+IGMpIHJlaW50cm9kdWNlIHRoZSBzdGF0ZSB3aGVyZSBmYmNvbiBpcyBmYXN0
IG9uIGZiZGV2LiBUaGlzIGlzIGltcG9ydGFudCBmb3Igbm9uLURSTSBtYWNoaW5lcywNCj4+
PiAgICAgZWl0aGVyIHdoZW4gcnVuIG9uIG5hdGl2ZSBoYXJkd2FyZSBvciBpbiBhbiBlbXVs
YXRvci4NCj4+PiBkKSBub3QgYnJlYWsgRFJNIGRldmVsb3BtZW50DQo+Pj4NCj4+PiBFc3Bl
Y2lhbGx5IHJlZ2FyZGluZyBjKSBJIGNvbXBsYWluZWQgaW4gWzFdIGFuZCBnb3Qgbm8gZmVl
ZGJhY2suIEkgcmVhbGx5IHdvdWxkIGxpa2UgdG8NCj4+PiB1bmRlcnN0YW5kIHdoZXJlIHRo
ZSBhY3R1YWwgcHJvYmxlbXMgd2VyZSBhbmQgd2hhdCdzIG5lY2Vzc2FyeSB0byBmaXggdGhl
bS4NCj4+Pg0KPj4+IEhlbGdlDQo+Pj4NCj4+PiBbMV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvci9mZWVhODMwMy0yYjgzLWZjMzYtOTcyYy00ZmM4YWQ3MjNiZGVAZ214LmRlDQoNClNl
ZW1zIGxpa2UgZmV3IHBlb3BsZSByZWFkIGxpbnV4LWZiZGV2IHRoZXNlIGRheXMuIEkgc3Vn
Z2VzdCB0byBwYXJ0bHkgDQpyZXZlcnQgdGhlIHBhdGNoIHRvIHRoZSBwb2ludCB3ZXJlIHBl
cmZvcm1hbmNlIGdldHMgYmV0dGVyIGFnYWluLg0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0K
DQoNCj4+DQo+Pg0KPj4NCj4gDQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNz
IERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21i
SA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5
LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8aHJlcjogSXZvIFRvdGV2DQo=

--------------A6CH4XiJT0nidYEpEMHS4Rvq--

--------------BzT7mC0YBuKTDd1Yiq9Z9p76
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmHlkiwFAwAAAAAACgkQlh/E3EQov+AD
nA//b2kV0Ya8NmHBHB1VGQ5vwMxFzEA1lLfB7/LdaDgAHUzLBIVghPg4HTdPM9zhBQylXEFjPviz
Hds/JrQdKfvDmIiWR7jeZZhvWmyJnRyzsi7Shcer/3Rxnv9yEmjuOENGLF7yhXOcAFb0ixshvyEK
KIV26gDJms+4CqcuB3Ht2OnAvAsvccyYZWHjGinbNoK+X+NoG7cWDyum2Aw+xvo6lxxG1re6E1vA
mKOQ6Q7A7mcKU6ECNVJWCZNKpW3Pa6/ilDhHBrKCh6Pesbzpiajo0k+r7XcdfjiYefqKz0OTkqMG
XnjpXkMpvyUJ1loHVZ5JpmNsDFT9Ao1TbdqFAtgW4umuVvgXWcJJc97v57FqXJwmwJXZZc8nTZWv
P9LieEcZWeDd9YYpN2A7EyhIuCA7NQ2BGGnP0qSPWEvxHe9nRAZI42KVg8bOa6vF4MegsemCTQSb
kvKrDaTtIXVJjj79jv5WsAdq4KwfICNKEyslVuQKPjBYzZKj7rSxEopny2mfLToqJtzdY6CxgVkU
cDVKAUgfd72iYOKHq/LupVv4BsJZNNDLOy/dVfuC7JXWtxU0NODhIE4guUSe7JEZbT+LiAvwyY8s
p3FuJHBSK8VP1WNh3sftBsK+uGFKzz/XZVz63Sh5o6Tdlxcu/p1IvvyO86daVlNw1mbz3m5blvHj
79I=
=4cT/
-----END PGP SIGNATURE-----

--------------BzT7mC0YBuKTDd1Yiq9Z9p76--
