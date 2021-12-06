Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E0944693D7
	for <lists+dri-devel@lfdr.de>; Mon,  6 Dec 2021 11:28:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E60A7B0D5;
	Mon,  6 Dec 2021 10:21:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10F366FF23
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Dec 2021 08:37:55 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A480B1FD2F;
 Mon,  6 Dec 2021 08:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1638779871; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=972ohPie0Z0KqBX9H7clElE9YIL3jOwiptpokykEtBE=;
 b=iMGX8K+uEF/YgwCbln3FzoDL9aNMgoT535ctYWyUDaUkcCFrDNPjJzRyK2b6TeMX4OKgzd
 sGjn7wU3GhK1y04eot6jyUf+paG9cjw6poE5awQG3Es9nl7Qudz1nRD0Lji9AEN47SqdY9
 Xrfgt7VJENpF4BkP0xjk3W1EoLjqmyU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1638779871;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=972ohPie0Z0KqBX9H7clElE9YIL3jOwiptpokykEtBE=;
 b=BflOTt4X1dIBvTgcAU+Sddycj98FbUpybrauX8Mh/D7iewoYOYaDt9pxyFUOtzSZmeq9H+
 Ho9YwqfDvdDM9+AA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6DDAE1330B;
 Mon,  6 Dec 2021 08:37:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id +E/AGd/LrWF2EgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 06 Dec 2021 08:37:51 +0000
Message-ID: <845d7175-8c35-9061-3751-6292a9336c8f@suse.de>
Date: Mon, 6 Dec 2021 09:37:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH 2/2] drm: aspeed: select CONFIG_DRM_GEM_CMA_HELPER
Content-Language: en-US
To: Arnd Bergmann <arnd@kernel.org>, Joel Stanley <joel@jms.id.au>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
References: <20211204174637.1160725-1-arnd@kernel.org>
 <20211204174637.1160725-2-arnd@kernel.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20211204174637.1160725-2-arnd@kernel.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------8R89IqoHERVJMb3PbTk8pCki"
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
Cc: Arnd Bergmann <arnd@arndb.de>, linux-aspeed@lists.ozlabs.org,
 Andrew Jeffery <andrew@aj.id.au>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------8R89IqoHERVJMb3PbTk8pCki
Content-Type: multipart/mixed; boundary="------------0xhI9fQKvQOX086OhseY7365";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Arnd Bergmann <arnd@kernel.org>, Joel Stanley <joel@jms.id.au>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Cc: Arnd Bergmann <arnd@arndb.de>, Andrew Jeffery <andrew@aj.id.au>,
 linux-aspeed@lists.ozlabs.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Message-ID: <845d7175-8c35-9061-3751-6292a9336c8f@suse.de>
Subject: Re: [PATCH 2/2] drm: aspeed: select CONFIG_DRM_GEM_CMA_HELPER
References: <20211204174637.1160725-1-arnd@kernel.org>
 <20211204174637.1160725-2-arnd@kernel.org>
In-Reply-To: <20211204174637.1160725-2-arnd@kernel.org>

--------------0xhI9fQKvQOX086OhseY7365
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgQXJuZA0KDQpBbSAwNC4xMi4yMSB1bSAxODo0NiBzY2hyaWViIEFybmQgQmVyZ21hbm46
DQo+IEZyb206IEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+DQo+IA0KPiBUaGUgYXNw
ZWVkIGRyaXZlciB1c2VzIHRoZSBnZW1fY21hX2hlbHBlciBjb2RlLCBidXQgZG9lcw0KPiBu
b3RvIGVuZm9yY2UgZW5hYmxpbmcgdGhpcyB0aHJvdWdoIEtjb25maWc6DQo+IA0KPiB4ODZf
NjQtbGludXgtbGQ6IGRyaXZlcnMvZ3B1L2RybS9hc3BlZWQvYXNwZWVkX2dmeF9kcnYubzoo
LnJvZGF0YSsweDJjOCk6IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8gYGRybV9nZW1fY21hX3By
aW1lX2ltcG9ydF9zZ190YWJsZScNCj4geDg2XzY0LWxpbnV4LWxkOiBkcml2ZXJzL2dwdS9k
cm0vYXNwZWVkL2FzcGVlZF9nZnhfZHJ2Lm86KC5yb2RhdGErMHgyZDgpOiB1bmRlZmluZWQg
cmVmZXJlbmNlIHRvIGBkcm1fZ2VtX2NtYV9kdW1iX2NyZWF0ZScNCj4geDg2XzY0LWxpbnV4
LWxkOiBkcml2ZXJzL2dwdS9kcm0vYXNwZWVkL2FzcGVlZF9nZnhfY3J0Yy5vOiBpbiBmdW5j
dGlvbiBgYXNwZWVkX2dmeF9waXBlX3VwZGF0ZSc6DQo+IGFzcGVlZF9nZnhfY3J0Yy5jOigu
dGV4dCsweGU1KTogdW5kZWZpbmVkIHJlZmVyZW5jZSB0byBgZHJtX2ZiX2NtYV9nZXRfZ2Vt
X29iaicNCj4gDQo+IEFkZCB0aGUgc2FtZSAnc2VsZWN0JyB0aGF0IGlzIHVzZWQgaW4gb3Ro
ZXIgc3VjaCBkcml2ZXJzLg0KPiANCj4gRml4ZXM6IDA5NzE3YWY3ZDEzZCAoImRybTogUmVt
b3ZlIENPTkZJR19EUk1fS01TX0NNQV9IRUxQRVIgb3B0aW9uIikNCj4gU2lnbmVkLW9mZi1i
eTogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4NCg0KVGhhbmtzISBJJ3ZlIGFkZGVk
IGJvdGggcGF0Y2hlcyB0byBkcm0tbWlzYy1uZXh0Lg0KDQpCZXN0IHJlZ2FyZHMNClRob21h
cw0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVy
DQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIuIDUs
IDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0K
R2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rldg0K

--------------0xhI9fQKvQOX086OhseY7365--

--------------8R89IqoHERVJMb3PbTk8pCki
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmGty94FAwAAAAAACgkQlh/E3EQov+A6
2Q//fWsXVQMvMxgfdhp3XDAoLjbs2RECtKZEOpmfynytSmJdQ/58PchUo1sizAVOrz5vm78W5DT2
3COftJa9PTHEbjHT99lzjXMXrMf8x2GR6wiUpP3q6LRLiycxO92ElLC/JPttb4FChd5fZF876POK
sBRyPvnHAstfOC2yBoKLYI9QVk8dj0NRsWz3kKAE5gY5x6wJ6kamIvh3Vx4D+udWfivIUtozOsx1
ap9L0C7ybnmFeKqOhPHLl+KXPKl8Hm0Dt6LDLs7K9bXRRTh8awYu0LijjF0GfY/iC+k7IYDbHD1z
dnZcI4BdfQO4ce4usvso3hKx95N7Amf3yr2fEmwwIivC9v7g2qZRek4fpHuCkwXUjell/yuHo08i
li3RVP3E+0i2rQ1a7+1xmDToXvImkPfFZfYwlm0TjrmxNKx+1V/37C45o9D0WuwTlB+OdCVQD7pZ
jjUNId7X9s9C1P54p/J7mAcp4Eb/gx5sS8+N28soLRyB+uEmtP1VlQC/ySSRpezABbrbF9eO4ple
NF4mnMsWc/jk4UqAR7qBFzG8Mh1zLddjBJAVel8CUkizZwYJtx1H6+61TMjTnizrx0+GJeg1RgpE
+oFyiaY+T9qJ49mBGnceffJ+Za9VMe/GlhaDcW6RIBsGEo4LRMTJftVn67g7LWvLyI6FTQqt1GhO
a94=
=VCLf
-----END PGP SIGNATURE-----

--------------8R89IqoHERVJMb3PbTk8pCki--
