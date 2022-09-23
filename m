Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 379765E753F
	for <lists+dri-devel@lfdr.de>; Fri, 23 Sep 2022 09:54:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCD0310E4B2;
	Fri, 23 Sep 2022 07:54:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE75910E4B2
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Sep 2022 07:54:13 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A96961F86C;
 Fri, 23 Sep 2022 07:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1663919652; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FDoesM46flEpwVvqoFJWMabU6B5gM/li9scRr793Z+4=;
 b=XbWXuSwDGr1Z9vHrOX5N2ky/rF3S0wKVR0fOXmcVi8cFTIkPT/udxOpXW6YZUVlN4WdnA4
 R91G9NdEODy9oeBQoq4HF8uz5wyWmG+H5zplfUv6xOlG9GQldVwEqO1VurRwkmzi+LSDgU
 RSkPomhzrnHP4kKGYeP9ruIt0eRB5jU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1663919652;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FDoesM46flEpwVvqoFJWMabU6B5gM/li9scRr793Z+4=;
 b=DzlxtfIt1eHjH0E1bnDlinsXalj7mNHMAoGAsa6m7ErYeshsdXuKywyfthQZaKTx5B0ufg
 P8BMLLYHnjezt3Ag==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8C51F13A00;
 Fri, 23 Sep 2022 07:54:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id yS4CISRmLWP9eQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 23 Sep 2022 07:54:12 +0000
Message-ID: <322f6f77-75f2-5a5c-92d5-18ba083a8530@suse.de>
Date: Fri, 23 Sep 2022 09:54:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 2/5] drm/simpledrm: Use drm_atomic_get_new_plane_state()
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>, airlied@linux.ie,
 daniel@ffwll.ch
References: <20220922130944.27138-1-tzimmermann@suse.de>
 <20220922130944.27138-3-tzimmermann@suse.de>
 <92327a77-f0a5-34fd-964c-89a3ce7701af@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <92327a77-f0a5-34fd-964c-89a3ce7701af@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------pw1596KNL0BDvbKxhugXmfWE"
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------pw1596KNL0BDvbKxhugXmfWE
Content-Type: multipart/mixed; boundary="------------yI5Bb1fv5ermIM2KY0V0xChC";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>, airlied@linux.ie,
 daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org
Message-ID: <322f6f77-75f2-5a5c-92d5-18ba083a8530@suse.de>
Subject: Re: [PATCH 2/5] drm/simpledrm: Use drm_atomic_get_new_plane_state()
References: <20220922130944.27138-1-tzimmermann@suse.de>
 <20220922130944.27138-3-tzimmermann@suse.de>
 <92327a77-f0a5-34fd-964c-89a3ce7701af@redhat.com>
In-Reply-To: <92327a77-f0a5-34fd-964c-89a3ce7701af@redhat.com>

--------------yI5Bb1fv5ermIM2KY0V0xChC
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjMuMDkuMjIgdW0gMDk6NDcgc2NocmllYiBKYXZpZXIgTWFydGluZXogQ2Fu
aWxsYXM6DQo+IE9uIDkvMjIvMjIgMTU6MDksIFRob21hcyBaaW1tZXJtYW5uIHdyb3RlOg0K
Pj4gTG9va3VwIHRoZSBwbGFuZSdzIHN0YXRlIGluIGF0b21pY191cGRhdGUgd2l0aCB0aGUg
aGVscGVyDQo+PiBkcm1fYXRvbWljX2dldF9uZXdfcGxhbmVfc3RhdGUoKS4gQWxzbyByZW5h
bWUgdGhlIGhlbHBlcnMnDQo+PiBzdGF0ZSBhcmd1bWVudHMuIE5vIGZ1bmN0aW9uYWwgY2hh
bmdlcy4NCj4+DQo+IA0KPiBJIHRoaW5rIHRoaXMgd2FzIFN1Z2dlc3RlZC1ieTogVmlsbGUg
U3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4gPw0KDQpOb3QgZGly
ZWN0bHksIGJ1dCBpdCBzZWVtcyBmYWlyIHRvIGdpdmUgaGltIGNyZWRpdC4NCg0KPiANCj4+
IFNpZ25lZC1vZmYtYnk6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRl
Pg0KPj4gLS0tDQo+IA0KPiBSZXZpZXdlZC1ieTogSmF2aWVyIE1hcnRpbmV6IENhbmlsbGFz
IDxqYXZpZXJtQHJlZGhhdC5jb20+DQo+IA0KDQpUaGFua3MgZm9yIHRoZSByLWJzLg0KDQpC
ZXN0IHJlZ2FyZHMNClRob21hcw0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGlj
cyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdt
YkgNCk1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0KKEhSQiAzNjgw
OSwgQUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rldg0K

--------------yI5Bb1fv5ermIM2KY0V0xChC--

--------------pw1596KNL0BDvbKxhugXmfWE
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmMtZiQFAwAAAAAACgkQlh/E3EQov+Bc
Vg//TyniUQSbLt1GCkt1PotoCSKufWiBDrZ6gYPU9XYwe8kQcaBSpU48eK9QXa++vtZwTGv8xfqa
0TjZwYBzB+0VqIZRBozMaGwr91T75/FXkKdKiie6UkQtlOWw2qZ/J6OpAvv3TxMeEJ3yBK88yRVP
w0Xbjq/SjXD1r4JmCKw2dMH1hODE/1n6/T97bCq4X8SPAKvwaWmC5WENN1Fi0uphoh60tgruSxJh
jrj5BXtPixPvAhSy5uykIl+tpihdj+P5Tjqb68dpH+3Jcxz5IpATLLahayj5c5vDZBNNNzsQj2+5
M4EMeSTCo0+eK8hRjz7qkC1o/11W+xMbGqmWxw+eaWF1KGTwLhZwZLip91QfTbeV+6kNKxNnZQfa
cFjQ9ZTseAs5RDOdVxnDRBxXmH/RWWTwnXN0ddD5kXtoGCW9b6Co/Sf6mmmOh6NbqAiB5eeCTfD4
yb1wDt/x0sm22RX5XB5i0DLEKqyqxohnpBDPX4iPIlVSH+FiGsalr6ocVZzMW5VAkVgn1T8PEC+T
c36Jw86osafXTlRSIpPxgUtyfqcqipop5oDJCcgbbr/VOFXRjIgNjT6ChTVObYONdIGlRS1/wT2m
nEylKS9LdbTCTQvargM5npRrefd5MXEZTc+4gjPNdd4OJvPP6y1ZMfd5FACnm5C1fElkpzjYqwMp
IJk=
=hc3t
-----END PGP SIGNATURE-----

--------------pw1596KNL0BDvbKxhugXmfWE--
