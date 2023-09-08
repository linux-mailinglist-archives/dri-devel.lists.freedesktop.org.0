Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B8F1798857
	for <lists+dri-devel@lfdr.de>; Fri,  8 Sep 2023 16:13:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C9A210E8B9;
	Fri,  8 Sep 2023 14:13:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4905F10E8B9
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Sep 2023 14:13:43 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 94D0B1FEC5;
 Fri,  8 Sep 2023 14:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1694182421; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yt6FICjqd62pqytSprw0OKUNLEchIJi4j9tK9NUnUvA=;
 b=lm+vAfHQep1Q9hbbNnf8Nar4Y3ptMWyE2rwSDJtGhprsVMp5pMoUiohNH+B2InmDWw2AiB
 sJRbWgOuODM1YWdgKR1An1MPiNd1vwf3XOPdY4wpiyabLmlSfjmKbwT55wSuagbgtSqfXq
 r1IVIhQbVQymJ/lxn48D0U4aOYBO8HU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1694182421;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yt6FICjqd62pqytSprw0OKUNLEchIJi4j9tK9NUnUvA=;
 b=cwszpjPzklX4dJ8wS67A0dHVJuZLqwyaH0/Pg70i43SrFPgAPzNVBqqlb1hP2J/foRI0HO
 zCkmXaTL87uIzsCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 71D45132F2;
 Fri,  8 Sep 2023 14:13:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ruTjGhUs+2QlcQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 08 Sep 2023 14:13:41 +0000
Message-ID: <6d3ed2ac-c682-5574-bed3-2d36413fa71f@suse.de>
Date: Fri, 8 Sep 2023 16:13:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v3] drm/plane: Add documentation about software color
 conversion.
Content-Language: en-US
To: Jocelyn Falempe <jfalempe@redhat.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Maxime Ripard <mripard@kernel.org>
References: <20230825140434.182664-1-jfalempe@redhat.com>
 <3f1bd1ad-cd1f-515d-38bd-63e412dec286@suse.de>
 <5ltuqgsepffvp6rjvmskqtvzyyhvk6phmixm3crfteznyejn4t@mtycsppney5x>
 <b135fdd1-afd9-bb65-19d7-3125504afb05@suse.de>
 <87ledg3hib.fsf@minerva.mail-host-address-is-not-set>
 <b803e73e-211b-a6f2-7dc7-25e46e72483d@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <b803e73e-211b-a6f2-7dc7-25e46e72483d@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------NMoMSOa2yiReaN9cm7OiXCeA"
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
Cc: airlied@redhat.com, ppaalanen@gmail.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------NMoMSOa2yiReaN9cm7OiXCeA
Content-Type: multipart/mixed; boundary="------------fQnqsq1JGJOcOjVA7yg64djB";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Jocelyn Falempe <jfalempe@redhat.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Maxime Ripard <mripard@kernel.org>
Cc: dri-devel@lists.freedesktop.org, ppaalanen@gmail.com, airlied@redhat.com
Message-ID: <6d3ed2ac-c682-5574-bed3-2d36413fa71f@suse.de>
Subject: Re: [PATCH v3] drm/plane: Add documentation about software color
 conversion.
References: <20230825140434.182664-1-jfalempe@redhat.com>
 <3f1bd1ad-cd1f-515d-38bd-63e412dec286@suse.de>
 <5ltuqgsepffvp6rjvmskqtvzyyhvk6phmixm3crfteznyejn4t@mtycsppney5x>
 <b135fdd1-afd9-bb65-19d7-3125504afb05@suse.de>
 <87ledg3hib.fsf@minerva.mail-host-address-is-not-set>
 <b803e73e-211b-a6f2-7dc7-25e46e72483d@redhat.com>
In-Reply-To: <b803e73e-211b-a6f2-7dc7-25e46e72483d@redhat.com>

--------------fQnqsq1JGJOcOjVA7yg64djB
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgSm9jZWx5bg0KDQpBbSAwOC4wOS4yMyB1bSAxNjowNiBzY2hyaWViIEpvY2VseW4gRmFs
ZW1wZToNClsuLi5dDQo+Pj4gQW5kIGtub3cgSSBmaW5kIHRoYXQgdGhpcyBwYXRjaCAoZXZl
biBpbiBpdHMgdjEpIGNvbnRhaW5zIGxhbmd1YWdlIHRoYXQNCj4+PiByZXRyb2FjdGl2ZWx5
IGxlZ2l0aW1pemVzIHRoZSBtZ2FnMjAwIHBhdGNoLiBJIHdyb3RlICdhcHBhcmVudGx5JyBJ
IG15DQo+Pj4gcmVwbHksIGFzIEkgYXNzdW1lIHRoYXQgdGhlcmUncyBtb3JlIHRvIGl0LCBi
dXQgaG93IGRvZXMgaXQgbm90IGxvb2sNCj4+PiBsaWtlIGFuIGF0dGVtcHQgdG8gc25lYWsg
aW4gc29tZXRoaW5nIHRoYXQgaXMga25vd24gdG8gYmUgY29udHJvdmVyc2lhbD8NCj4+Pg0K
PiANCj4gVGhhdCB3YXMgbm90IG15IGludGVudGlvbiwgYW5kIEkgYXBvbG9naXplIGlmIHlv
dSBmZWVsIGl0IHRoaXMgd2F5LiBNeSANCj4gZ29hbCB3YXMganVzdCB0byBjbGFyaWZ5IGlm
IHRoaXMgb3B0aW1pemF0aW9uIGlzIGFjY2VwdGFibGUgZm9yIG90aGVyIA0KDQpTb3JyeSBm
b3IgdGhyb3dpbmcgYWNjdXNhdGlvbnMgYXJvdW5kLiBZb3UgY2VydGFpbmx5IGFjdCBpbiBn
b29kIGZhaXRoLg0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQotLSANClRob21hcyBaaW1t
ZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0
aW9ucyBHZXJtYW55IEdtYkgNCkZyYW5rZW5zdHJhc3NlIDE0NiwgOTA0NjEgTnVlcm5iZXJn
LCBHZXJtYW55DQpHRjogSXZvIFRvdGV2LCBBbmRyZXcgTXllcnMsIEFuZHJldyBNY0RvbmFs
ZCwgQm91ZGllbiBNb2VybWFuDQpIUkIgMzY4MDkgKEFHIE51ZXJuYmVyZykNCg==

--------------fQnqsq1JGJOcOjVA7yg64djB--

--------------NMoMSOa2yiReaN9cm7OiXCeA
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF4BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmT7LBQFAwAAAAAACgkQlh/E3EQov+CC
hA/4jpcSYi4xPzdpbbRmJ2tDhIm1iMXlqaFKy/KXMNNw0tUV+uuSFogjEAf9TMGqjOwNm8gOAGOD
gPk9ZPzE4PxOxy6RjGeGg3WsxzzKyWlDe0brRBYam2Kni0qFO5AueZ3t0q97J16+hmBK59pTlcFW
bh86d+hh9jCNeblbRzhTKG+Qp/T/hjhQfINqEuRgzndAb8kL1iZ5P6qrHFsi3zPmOdH6YE/chbTD
iyVOrQnyYt5kyKcYmwq2uhmZxzRymqhXSVjDQOgqfFX9hpbOBbowteEj7i+ipUJtZiBLrJ9ZrIoK
INmFd0bqUHHF3C1lfvy0Sj8YntDkzXtziMpiNvrk002YGmF7XbZK6pv+El6UU2UHxCSepoHOtscE
s1luQ1hrpR/tgWNaitP7/WAbT77XnxDO/UjzgzDOqDtKhtA2iB9hr8JT5rxI1qcBoar2JLj5G3ku
sFXu7xAKQk66G7nfLr2yvF1Saf4ZjTLpeD7FGpyQtsyWWav3xE2hZrjKbLLOXMJWB836xVCdOkNH
hpOAKr4JIrgTUMaOfBPa268Gid/Ux1NHBydQIEreIw0bYbLDKMOB0sAsLLpugeSMVaGipHafw7zW
SkN1y5jqtWv2d4TByJ3YZfJuO8V66lT22Yz7TC1cYBC5Ti4CARLg9VtAYXMUsZuapQ31Dbk3EV+R
lA==
=kcxS
-----END PGP SIGNATURE-----

--------------NMoMSOa2yiReaN9cm7OiXCeA--
