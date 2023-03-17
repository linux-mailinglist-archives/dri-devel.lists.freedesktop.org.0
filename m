Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2657C6BE919
	for <lists+dri-devel@lfdr.de>; Fri, 17 Mar 2023 13:20:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C137B10EF08;
	Fri, 17 Mar 2023 12:20:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E880C10EF08
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Mar 2023 12:19:57 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 859D81FDDC;
 Fri, 17 Mar 2023 12:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1679055596; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BuSBs3gPHVTaDmJ2rWEMOL/i3ojqrfKp9TbhV6f6QAU=;
 b=mW6h3kCZ3AvU9oEdhd+u3WbaYO5EfLtuiaxljb4WNdTs+JMnst4sW2orrllCyzNzHXHJLT
 tOcyioQJUip/hqdDZvosFdIwQ4siEQUY985PeFMIdOb7hvGIPElFozZm3c96KbWwca7xzP
 oA4U+vy5MbPS7h7bZmuKmku7WOxfyMU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1679055596;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BuSBs3gPHVTaDmJ2rWEMOL/i3ojqrfKp9TbhV6f6QAU=;
 b=YOshFIiGdhW6ZZbGi7weGJl+L8QNddjyz/iBHr1PFqYqzStD1P4PgRY4mEcwM1OWa2s0kg
 3W6Q7FC8TlwszzDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 47B7D1346F;
 Fri, 17 Mar 2023 12:19:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id guKHEOxaFGRDMAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 17 Mar 2023 12:19:56 +0000
Message-ID: <7401066b-7b89-bd3b-7270-cf3343bce064@suse.de>
Date: Fri, 17 Mar 2023 13:19:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 1/6] drm/fbdev-generic: Always use shadow buffering
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>, daniel@ffwll.ch,
 airlied@gmail.com, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 zackr@vmware.com, kraxel@redhat.com, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org,
 linux-graphics-maintainer@vmware.com
References: <20230315161442.27318-1-tzimmermann@suse.de>
 <20230315161442.27318-2-tzimmermann@suse.de>
 <871qlnr45f.fsf@minerva.mail-host-address-is-not-set>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <871qlnr45f.fsf@minerva.mail-host-address-is-not-set>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------a6YmRFCA37vztynCNMf5BeEh"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------a6YmRFCA37vztynCNMf5BeEh
Content-Type: multipart/mixed; boundary="------------2WUnXZSftKm87RHXHyZDIHLg";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>, daniel@ffwll.ch,
 airlied@gmail.com, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 zackr@vmware.com, kraxel@redhat.com, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org,
 linux-graphics-maintainer@vmware.com
Message-ID: <7401066b-7b89-bd3b-7270-cf3343bce064@suse.de>
Subject: Re: [PATCH 1/6] drm/fbdev-generic: Always use shadow buffering
References: <20230315161442.27318-1-tzimmermann@suse.de>
 <20230315161442.27318-2-tzimmermann@suse.de>
 <871qlnr45f.fsf@minerva.mail-host-address-is-not-set>
In-Reply-To: <871qlnr45f.fsf@minerva.mail-host-address-is-not-set>

--------------2WUnXZSftKm87RHXHyZDIHLg
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgSmF2aWVyDQoNCkFtIDE3LjAzLjIzIHVtIDEyOjQ3IHNjaHJpZWIgSmF2aWVyIE1hcnRp
bmV6IENhbmlsbGFzOg0KPiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5k
ZT4gd3JpdGVzOg0KPiANCj4gSGVsbG8gVGhvbWFzLA0KPiANCj4+IFJlbW92ZSBhbGwgY29k
ZXBhdGhzIHRoYXQgaW1wbGVtZW50IGZiZGV2IG91dHB1dCBkaXJlY3RseSBvbiBHRU0NCj4+
IGJ1ZmZlcnMuIEFsd2F5cyBhbGxvY2F0ZSBhIHNoYWRvdyBidWZmZXIgaW4gc3lzdGVtIG1l
bW9yeSBhbmQgc2V0DQo+PiB1cCBkZWZlcnJlZCBJL08gZm9yIG1tYXAuDQo+Pg0KPj4gVGhl
IGZiZGV2IGNvZGUgdGhhdCBvcGVyYXRlZCBkaXJlY3RseSBvbiBHRU0gYnVmZmVycyB3YXMg
dXNlZCBieQ0KPj4gZHJpdmVycyBiYXNlZCBvbiBHRU0gRE1BIGhlbHBlcnMuIFRob3NlIGRy
aXZlcnMgaGF2ZSBiZWVuIG1pZ3JhdGVkDQo+PiB0byB1c2UgZmJkZXYtZG1hLCBhIGRlZGlj
YXRlZCBmYmRldiBlbXVsYXRpb24gZm9yIERNQSBtZW1vcnkuIEFsbA0KPj4gcmVtYWluaW5n
IHVzZXJzIG9mIGZiZGV2LWdlbmVyaWMgcmVxdWlyZSBzaGFkb3cgYnVmZmVyaW5nLg0KPj4N
Cj4+IE1lbW9yeSBtYW5hZ2VtZW50IG9mIHRoZSByZW1haW5pbmcgY2FsbGVycyB1c2VzIFRU
TSwgR0VNIFNITUVNDQo+PiBoZWxwZXJzIG9yIGEgdmFyaWFudCBvZiBHRU0gRE1BIGhlbHBl
cnMgdGhhdCBpcyBpbmNvbXBhdGlibGUgd2l0aA0KPj4gZmJkZXYtZG1hLiBUaGVyZWZvcmUg
cmVtb3ZlIHRoZSB1bnVzZWQgY29kZXBhdGhzIGZyb20gZmJkZXYtZ2VuZXJpYw0KPj4gYW5k
IHNpbXBsaWZ5IHRoZSBjb2RlLg0KPj4NCj4+IFVzaW5nIGEgc2hhZG93IGJ1ZmZlciB3aXRo
IGRlZmVycmVkIEkvTyBpcyBwcm9iYWJseSB0aGUgYmVzdCBjYXNlDQo+PiBmb3IgbW9zdCBy
ZW1haW5pbmcgY2FsbGVycy4gU29tZSBvZiB0aGUgVFRNLWJhc2VkIGRyaXZlcnMgbWlnaHQN
Cj4+IGJlbmVmaXQgZnJvbSBhIGRlZGljYXRlZCBmYmRldiBlbXVsYXRpb24gdGhhdCBvcGVy
YXRlcyBkaXJlY3RseSBvbg0KPj4gdGhlIGRyaXZlcidzIHZpZGVvIG1lbW9yeS4NCj4+DQo+
IA0KPiBCdXQgaXQncyBxdWVzdGlvbmFibGUgaWYgdGhhdCB3b3VsZCBiZSB1c2VmdWwgZHVl
IHRoZSBsaW1pdGVkIGFtbW91bnQgb2YNCj4gdmlkZW8gbWVtb3J5IHRoYXQgbW9zdCBvZiB0
aGUgZGV2aWNlcyB1c2luZyBUVE0tYmFzZWQgZHJpdmVycyBoYXZlLCByaWdodD8NCg0KUmln
aHQuIFRoZSBtYWluIHJlYXNvbiBmb3IgdXNpbmcgVlJBTSBkaXJlY3RseSBpcyBwZXJmb3Jt
YW5jZS4gSSd2ZSBzZWVuIA0KY29tcGxhaW5zIGFib3V0IHRoZSBjb25zb2xlIHBlcmZvcm1h
bmNlIHdpdGggbm91dmVhdSBhZnRlciB0aGV5IHN3aXRjaGVkIA0KdG8gZmJkZXYtZ2VuZXJp
Yy4gU29tZSBkcml2ZXJzIGFuZC9vciBoYXJkd2FyZSBoYWQgYWNjZWxlcmF0aW9uIGZvciB0
aGUgDQpjb25zb2xlIHRoYXQgY291bGQgYWxzbyBiZSB1dGlsaXplZC4gT2YgY291cnNlLCB0
aGlzIHJlcXVpcmVzIGEgY2VydGFpbiANCmFtb3VudCBvZiB2aWRlbyByYW0gZGVkaWNhdGVk
IHRvIHRoZSBmYmRldiBsYXllci4NCg0KVGhlIG90aGVyIHJlYXNvbiBpcyB0aGUgVkdBIHN3
aWNoZXJvbywgd2hpY2ggaXMgY3VycmVudGx5IGhhY2tlZCBpbnRvIA0KdGhlIGZiZGV2IGhl
bHBlcnMuIE9ubHkgYSBmZXcgZHJpdmVycyBuZWVkIGl0LCBzbyBoYXZpbmcgaXQgaW4gc2Vw
YXJhdGUgDQpmYmJldiBlbXVsYXRpb24gZm9yIGVhY2ggZHJpdmVyIHdvdWxkIGJlIG5pY2Uu
DQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCj4gDQo+PiBTaWduZWQtb2ZmLWJ5OiBUaG9t
YXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4NCj4+IC0tLQ0KPiANCj4gSXQn
cyBtdWNoIGNsZWFuZXIgaW5kZWVkIHRvIGhhdmUgZmJkZXYtZG1hIHNlcGFyYXRlZCBmcm9t
IGZiZGV2LWdlbmVyaWMuDQo+IA0KPiBSZXZpZXdlZC1ieTogSmF2aWVyIE1hcnRpbmV6IENh
bmlsbGFzIDxqYXZpZXJtQHJlZGhhdC5jb20+DQo+IA0KDQotLSANClRob21hcyBaaW1tZXJt
YW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9u
cyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFu
eQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBU
b3Rldg0K

--------------2WUnXZSftKm87RHXHyZDIHLg--

--------------a6YmRFCA37vztynCNMf5BeEh
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmQUWusFAwAAAAAACgkQlh/E3EQov+Ad
vBAAqescOQuXDdMCxUbD5MPUUIGA9oXVh2PMMsY6ueD8h/7h7rLmAm/2y9vQT4hVAL1sszilWSwn
Db7znyHe61vRp28L9Alen+bOZTPzZ4BJcMajUKE7mQTh5xETNwvu2lDI5pcfCmUw8GbsUsZCe1p1
VB5/fwDxTggGRBTwBvKZTfP5LQPj7uNeVb07uKpngAa29LSl/pjSj5AU7tDocBg2TMJtlIP1T4SF
9GtHzBaBvIGdhqeY7whGgtdKMxqk+Wf5VzjwBZ7G547ezgwYMj5tCP4JxQKdhQ11RRdbvXSQxmqL
0PmGal17AANhWCvb+gr5ObuGv0MqS1yJpgmR0ccrRvi7wJSpe8S6dfQvQMiZzGO5BeGaW/OPAOku
7am66drltmFgnYE1FW54yyBJEaFsHqWSqbZNJJkPsO5DF4YAhynHAQYWwiosVsuKCiF5gLvkvCxV
DkkngaiiIL2JOc1v/DcNhplqb7JzD9sU2or/OTfVUImXPIrdwa6/6xwU638M6COhJkvNHfu69STF
KyEZpPvmOJi6OtaQi4TboYsOABY8YaWijj2H3iz2Qb7U4I3edbg5SY2qyX3REkOG4O9ERO+IwoG6
HIIdXt9xRxI9Z++w4VtQRdvHxJgyeO5o+n2JUH3P3L1wnBhLwnnGA6LLpCG7oOG6gPCmJMg+l7jN
VHU=
=+xRu
-----END PGP SIGNATURE-----

--------------a6YmRFCA37vztynCNMf5BeEh--
