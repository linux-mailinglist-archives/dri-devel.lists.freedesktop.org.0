Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A2F7F46B6FD
	for <lists+dri-devel@lfdr.de>; Tue,  7 Dec 2021 10:24:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F41FAB9BE;
	Tue,  7 Dec 2021 09:24:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E7DCAB9BE;
 Tue,  7 Dec 2021 09:24:52 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id DB7741FD2F;
 Tue,  7 Dec 2021 09:24:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1638869090; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7szjFfUdZ96vMBn3OSGz3E++NKEzhFm7rcJcmXKWqfQ=;
 b=m1oEzp6Ip0Rj/m88RnWYQd4tDcJDMIGSJGz4hapzUnwk3EAcYH6va+lcqsGTDktPiqeeS2
 4bfngtbi25CYmJeBS7TGK671fGRme83dDGMFb0snAmv60EL8f+yPb3FbzsbhRHtjXMaG9k
 hLTZRQL75HI4jaPpPVHX7xLNuj/aMNY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1638869090;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7szjFfUdZ96vMBn3OSGz3E++NKEzhFm7rcJcmXKWqfQ=;
 b=pCk9KiJeaBV/O7BjvUQusnk4QemN1uXuPHWpxn8NVaOx006amoQ/VCLJhg5nnWXG+i/OJ7
 Ki9KRidP9co8o7Ag==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9BBD1139F0;
 Tue,  7 Dec 2021 09:24:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id r4oIJWIor2GNUQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 07 Dec 2021 09:24:50 +0000
Message-ID: <f9fb86e4-cda0-2381-6b62-b292eb1cec88@suse.de>
Date: Tue, 7 Dec 2021 10:24:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH] drm: Return error codes from struct
 drm_driver.gem_create_object
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@oracle.com>
References: <20211130095255.26710-1-tzimmermann@suse.de>
 <20211206104233.GD1978@kadam> <4fa29fcb-f936-b590-7691-90f0579a54ae@suse.de>
 <20211206144007.GE1978@kadam> <53405618-2e3d-c15b-d971-be2543c116f7@suse.de>
 <20211207085521.GF1978@kadam>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20211207085521.GF1978@kadam>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Fq2GBIe7AZeae8YXwtwl00mP"
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
Cc: emma@anholt.net, tomeu.vizoso@collabora.com, airlied@linux.ie,
 alyssa.rosenzweig@collabora.com, dri-devel@lists.freedesktop.org,
 steven.price@arm.com, gurchetansingh@chromium.org, kraxel@redhat.com,
 yuq825@gmail.com, virtualization@lists.linux-foundation.org,
 lima@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------Fq2GBIe7AZeae8YXwtwl00mP
Content-Type: multipart/mixed; boundary="------------mQcchMDWDEvZ0dqEBNqnm0JM";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: kraxel@redhat.com, emma@anholt.net, tomeu.vizoso@collabora.com,
 airlied@linux.ie, dri-devel@lists.freedesktop.org, steven.price@arm.com,
 lima@lists.freedesktop.org, yuq825@gmail.com, gurchetansingh@chromium.org,
 virtualization@lists.linux-foundation.org, alyssa.rosenzweig@collabora.com
Message-ID: <f9fb86e4-cda0-2381-6b62-b292eb1cec88@suse.de>
Subject: Re: [PATCH] drm: Return error codes from struct
 drm_driver.gem_create_object
References: <20211130095255.26710-1-tzimmermann@suse.de>
 <20211206104233.GD1978@kadam> <4fa29fcb-f936-b590-7691-90f0579a54ae@suse.de>
 <20211206144007.GE1978@kadam> <53405618-2e3d-c15b-d971-be2543c116f7@suse.de>
 <20211207085521.GF1978@kadam>
In-Reply-To: <20211207085521.GF1978@kadam>

--------------mQcchMDWDEvZ0dqEBNqnm0JM
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDcuMTIuMjEgdW0gMDk6NTUgc2NocmllYiBEYW4gQ2FycGVudGVyOg0KPiBJ
IGFwcG9sb2dpemUuICBUaGlzIHRocmVhZCBoYXMgYmVlbiByZWFsbHkgZnJ1c3RyYXRpbmcu
ICBJIGdvdCBtaXhlZCB1cA0KPiBiZWNhdXNlIEkgcmVjZW50bHkgc2VudCBwYXRjaGVzIGZv
ciBpbmdlbmljIGFuZCB2YzQuICBBbHNvIHdlIGFyZQ0KPiB3b3JraW5nIGFnYWluc3QgZGlm
ZmVyZW50IHRyZWVzIHNvIG1heWJlIHRoYXQgaXMgcGFydCBvZiB0aGUgcHJvYmxlbT8NCj4g
DQo+IEknbSBsb29raW5nIGF0IHRvZGF5J3MgbGludXgtbmV4dC4gIFlvdXIgcGF0Y2ggaGFz
IGJlZW4gYXBwbGllZC4NCj4gDQo+IFllcy4gIFlvdSB1cGRhdGVkIGFsbCB0aGUgZHJpdmVy
cy4gIEJ1dCBzb21laG93IHRoZSB2YzQgY2h1bmsgZnJvbSB5b3VyDQo+IHBhdGNoIHdhcyBk
cm9wcGVkLiAgSXQgd2FzICpOT1QqIGRyb3BwZWQgYnkgU3RlcGhlbiBSb3Rod2VsbC4gIEl0
IGdvdA0KPiBkcm9wcGVkIGVhcmxpZXIuICBJIGFtIGluY2x1ZGluZyB0aGUgYGdpdCBmb3Jt
YXQtcGF0Y2ggLTEgPGhhc2g+YCBvdXRwdXQNCj4gZnJvbSB0aGUgY29tbWl0Lg0KDQpNeSB2
YzQgY2hhbmdlIGlzIGluIGRybS1taXNjLW5leHQsIFsxXSBidXQgbm90IGluIGRybS10aXAu
IFsyXSBZb3VyIHZjNCANCnBhdGNoIHdlbnQgdGhyb3VnaCBkcm0tbWlzYy1maXhlcy4NCg0K
ZHJtLXRpcCBpcyBidWlsZCBhdXRvbWF0aWNhbGx5IGJ5IG91ciBEUk0gdG9vbHMgZnJvbSB0
aGUgdmFyaW91cyB0cmVlcy4gDQpUaGUgdG9vbHMgdG9vayBteSBwYXRjaCBmcm9tIGRybS1t
aXNjLW5leHQgYW5kIHlvdXIgcGF0Y2ggZnJvbSANCmRybS1taXNjLWZpeGVzIGFuZCB0aGUg
cmVzdWx0IHdhcyBicm9rZW4uDQoNClRoYW5rcyBmb3IgYnJpbmdpbmcgdGhpcyB1cC4gSSds
bCBzZWUgd2hhdCBJIGNhbiBkbyBhYm91dCBpdC4NCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMN
Cg0KWzFdIA0KaHR0cHM6Ly9jZ2l0LmZyZWVkZXNrdG9wLm9yZy9kcm0vZHJtLW1pc2MvdHJl
ZS9kcml2ZXJzL2dwdS9kcm0vdmM0L3ZjNF9iby5jI24zOTQNClsyXSANCmh0dHBzOi8vY2dp
dC5mcmVlZGVza3RvcC5vcmcvZHJtL2RybS10aXAvdHJlZS9kcml2ZXJzL2dwdS9kcm0vdmM0
L3ZjNF9iby5jDQoNCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVy
IERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhm
ZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7D
vHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCg==

--------------mQcchMDWDEvZ0dqEBNqnm0JM--

--------------Fq2GBIe7AZeae8YXwtwl00mP
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmGvKGIFAwAAAAAACgkQlh/E3EQov+Dd
yhAAlxsXXWah7ze/JQiGXzboK4RLcFMhaicLWpjuoeTWEGAV6YpsSSuY/XaiUUdRNU0O70LtES07
3NB/bunoQxO8Td/TcTJ3BnS+14/YOlktwcNAdhXe6bUNi0+NaJk167EZ7RyLbYPdQ4pk3czPUE6w
F2onLD3t0LmrMOOdnWK5T42BFy1jmeISb20Cl0jyF46D1w6uE7h9dvTjd6CSiQiulNgwPc9NRjjs
hXqzd6eJSJMdF2Woxfs4gL1G0AzYKLh/42gIyt751UUXpVkT94QheyVJIiwH/p4Pw5Rrr1poKpjw
eONHE7cHupFzJfIzZjxF0Pq6frxcP71KBkhnJITtgfZRntNkYZ+lfnd6FanThaPy9s+Og1s6l7Yi
PB28oikFHfW9WgVXLjv7OqFhSD+hI5fRRG0k1rMKHVHZXxhO6xPg12CmEekVyRzI+BQTKYppCKZe
ctn3uyuPvNzvJeyjwjYf8eT8s35aVbAKPkL8iOAX+tI1SPGre/3jmBoxVlXNZoM8CH7wqS7fqfiO
5RRe/rLZZ3xdIHjqSEQ0q2E8z/cXLdz+jhXaxUm/Yzu6vHdwlr/5uaglooPz0oLaRxuzu1QezJLq
RaFJlaeE6MvRBoOtkTtggpEHzh0JJIjlpxef7eF1oKBvDspD5G8h1eQj3pQ4jk51VSP/qb4otemT
ebQ=
=TkHW
-----END PGP SIGNATURE-----

--------------Fq2GBIe7AZeae8YXwtwl00mP--
