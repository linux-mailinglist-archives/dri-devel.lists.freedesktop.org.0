Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3B78691BEB
	for <lists+dri-devel@lfdr.de>; Fri, 10 Feb 2023 10:51:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C93810ECB3;
	Fri, 10 Feb 2023 09:51:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F01D610ECB3;
 Fri, 10 Feb 2023 09:51:26 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 8D31938A2D;
 Fri, 10 Feb 2023 09:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1676022685; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MzClX1LqUgcIUn8rHHvOJCIZ0L0Wdur9DXXgkw7uUsA=;
 b=fL60jvAC1cVEv0bAhDGsGKRvAAynElizd7bc3K4TgScRqcMFZRacGDqiHNq8EE8RC878MO
 flehMyqjUK3TnF+8wBGZ0ivfQhytbLLRRUvWPqta9MwsnFMpz7ry4Uwb+jpWetNZMv6yv7
 iK43+8qWVmoAf95YLJXecIXDZR3tzWY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1676022685;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MzClX1LqUgcIUn8rHHvOJCIZ0L0Wdur9DXXgkw7uUsA=;
 b=ezSmVnYooKsxsvhowVGBBbz0WwF/yd9xryuUBGs6HxsiDDpPMruLZ6DyPf7csGM6IPuxY9
 402Lp3WJmPvZliCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 666EB13206;
 Fri, 10 Feb 2023 09:51:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id rbn3F50T5mNPNgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 10 Feb 2023 09:51:25 +0000
Message-ID: <65b46616-0835-58b3-401f-7b0951301d4d@suse.de>
Date: Fri, 10 Feb 2023 10:51:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: linux-next: duplicate patch in the drm-misc-fixes tree
To: David Airlie <airlied@redhat.com>, Stephen Rothwell <sfr@canb.auug.org.au>
References: <20230210104720.365557d8@canb.auug.org.au>
 <CAMwc25r3EQG7hHkC7SU9omHWFGqto7RuUY9uVNkC6vXUF_hVtg@mail.gmail.com>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <CAMwc25r3EQG7hHkC7SU9omHWFGqto7RuUY9uVNkC6vXUF_hVtg@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------d5vzyCREJoc30zDucs6ESHJI"
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------d5vzyCREJoc30zDucs6ESHJI
Content-Type: multipart/mixed; boundary="------------cfIYwXnpicWKSVmpMRYRGymz";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: David Airlie <airlied@redhat.com>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Message-ID: <65b46616-0835-58b3-401f-7b0951301d4d@suse.de>
Subject: Re: linux-next: duplicate patch in the drm-misc-fixes tree
References: <20230210104720.365557d8@canb.auug.org.au>
 <CAMwc25r3EQG7hHkC7SU9omHWFGqto7RuUY9uVNkC6vXUF_hVtg@mail.gmail.com>
In-Reply-To: <CAMwc25r3EQG7hHkC7SU9omHWFGqto7RuUY9uVNkC6vXUF_hVtg@mail.gmail.com>

--------------cfIYwXnpicWKSVmpMRYRGymz
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTAuMDIuMjMgdW0gMDE6MDggc2NocmllYiBEYXZpZCBBaXJsaWU6DQo+IE9u
IEZyaSwgRmViIDEwLCAyMDIzIGF0IDk6NDcgQU0gU3RlcGhlbiBSb3Rod2VsbCA8c2ZyQGNh
bmIuYXV1Zy5vcmcuYXU+IHdyb3RlOg0KPj4NCj4+IEhpIGFsbCwNCj4+DQo+PiBUaGUgZm9s
bG93aW5nIGNvbW1pdCBpcyBhbHNvIGluIHRoZSBkcm0tZml4ZXMgdHJlZSBhcyBhIGRpZmZl
cmVudCBjb21taXQNCj4+IChidXQgdGhlIHNhbWUgcGF0Y2gpOg0KPj4NCj4+ICAgIDk0ZDhi
NjU3MmExZiAoIm52aWRpYWZiOiBkZXRlY3QgdGhlIGhhcmR3YXJlIHN1cHBvcnQgYmVmb3Jl
IHJlbW92aW5nIGNvbnNvbGUuIikNCj4+DQo+PiBUaGlzIGlzIGNvbW1pdA0KPj4NCj4+ICAg
IDA0MTE5YWIxYTQ5ZiAoIm52aWRpYWZiOiBkZXRlY3QgdGhlIGhhcmR3YXJlIHN1cHBvcnQg
YmVmb3JlIHJlbW92aW5nIGNvbnNvbGUuIikNCj4+DQo+PiBpbiB0aGUgZHJtLWZpeGVzIHRy
ZWUuDQo+IA0KPiBKdXN0IEZZSSBtaXNjIHRlYW0sIEkndmUgZm9yY2UgcHVzaGVkIGRybS1t
aXNjLWZpeGVzIHRvIGRyb3AgdGhpcw0KPiBwYXRjaCwgcGxlYXNlIG1ha2Ugc3VyZSBhbnkg
bG9jYWwgbWlzYyBmaXhlcyBkb24ndCBicmluZyBpdCBiYWNrIGluIGlmDQo+IHdlIGNhbiBh
dm9pZCBpdC4NCg0KU29ycnkgYWJvdXQgdGhhdC4gSSBkaWRuJ3QgcmVhbGl6ZSB0aGF0IHlv
dSBhbHJlYWR5IGFkZGVkIHRoZSBmaXggDQpkaXJlY3RseSB0byBkcm0tZml4ZXMuDQoNCkJl
c3QgcmVnYXJkcw0KVGhvbWFzDQoNCj4gDQo+IERhdmUuDQo+IA0KDQotLSANClRob21hcyBa
aW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNv
bHV0aW9ucyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywg
R2VybWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bDvGhyZXI6
IEl2byBUb3Rldg0K

--------------cfIYwXnpicWKSVmpMRYRGymz--

--------------d5vzyCREJoc30zDucs6ESHJI
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmPmE5wFAwAAAAAACgkQlh/E3EQov+B+
2hAAuznu9wHfzf0Eed0nuuEnqbBbJsyen3WYa8VEUGbVluNKMU04BOJJbkIQMjaWQM+UsmVKbRKP
gIz3TJgYOdjTJ7luuXHCVhVo1y+xJY/QL3SFJjBYYNvs8oCEweQJlIS1hzQQ5NaqP02cYGRG++4M
iY5/NiqQWiimQM6kC4QIN1fQkxKOyN433Bq3hYOsB8r+rPHMAkTJo8W0ZTolNkAzak8LanGYjW5Y
NVjBjilpcTYP/47IQCA75GTGJQV/2TKQDaYBSvJvFv+GolMpqhuhZmcSFJrC9WQIH1cxr3CLlx+3
mQyXmjf10Z9gBkTZPHIsoDSxcwW8bg/yEG/V6dtKnF1x44Qt9u/QwFE99E0jsUWpaUQgVesHvoGX
Dq0WFgcnbbYSpM4CTAenWHHsbbu2vz3+AUusGxeVs1CP4tZYQymUpZPnhd/EAiXV/PeU73IP//dv
WYUkyPV1qM0hBCW0uVNttRVcGgBP42WviGS8779MveK9sj5y3ENksPXGfO8uTmiWb2A8cgOkJjoX
TClITIFblDNMmT5H8YRxxDk9F/mgW8hag9gTGPusaW6tnbJ+T0pabTacFctWXN/D9pD8iMqlrB1A
JZrCte1M7BmHv4GxYfE6CqqY9gRqYvapP1/nER/3kR5sAGzDBPb63XZUm0+fzwRixWb9SmOkbDub
etk=
=lkcR
-----END PGP SIGNATURE-----

--------------d5vzyCREJoc30zDucs6ESHJI--
