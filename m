Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 602AC4557D8
	for <lists+dri-devel@lfdr.de>; Thu, 18 Nov 2021 10:16:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E471E6EC6B;
	Thu, 18 Nov 2021 09:16:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AF316EC6A
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Nov 2021 09:16:45 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B31A521763;
 Thu, 18 Nov 2021 09:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1637227003; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4cfV5gGURsYuopKLmf+YMAkxyYCXAsOmfx2QvvnOtSI=;
 b=JXSzP5s0X7c37vN4kPfAcJ/6Jegsc+QZdHxdi3Hc0Vdjncq2RDwndQsgMsgE1QVJxIX7Ri
 7LsuxMLPaNKXZ+kkiBWgYroqy1Ld/rcLS2giDSrpKlh6IbvazCYCZkjJRWqOcR1ELGbElM
 VUmeO8etThvzGQydoAmX/NAWKJgl3e8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1637227003;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4cfV5gGURsYuopKLmf+YMAkxyYCXAsOmfx2QvvnOtSI=;
 b=ch3fwCfhOdTGVl100WU+E5thzkntJjmfOWKpzeKHbDMMfGyivkgHNvFyEGCNWsXCStQBEf
 Jf/oWPSURRBlkXCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7D88113CD1;
 Thu, 18 Nov 2021 09:16:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id cEaeHfsZlmGkawAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 18 Nov 2021 09:16:43 +0000
Message-ID: <43dee171-548e-a6ec-3c12-eac985f22c5a@suse.de>
Date: Thu, 18 Nov 2021 10:16:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 3/3] drm/simpledrm: Enable XRGB2101010 format
Content-Language: en-US
To: Hector Martin <marcan@marcan.st>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20211117145829.204360-1-marcan@marcan.st>
 <20211117145829.204360-4-marcan@marcan.st>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20211117145829.204360-4-marcan@marcan.st>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------QPs2kW0HJJwo1Q6mIGvdH4Wa"
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
Cc: Alyssa Rosenzweig <alyssa@rosenzweig.io>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------QPs2kW0HJJwo1Q6mIGvdH4Wa
Content-Type: multipart/mixed; boundary="------------YbLQpefrcAZSfvjGlf57xpXJ";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Hector Martin <marcan@marcan.st>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Alyssa Rosenzweig
 <alyssa@rosenzweig.io>, linux-kernel@vger.kernel.org
Message-ID: <43dee171-548e-a6ec-3c12-eac985f22c5a@suse.de>
Subject: Re: [PATCH 3/3] drm/simpledrm: Enable XRGB2101010 format
References: <20211117145829.204360-1-marcan@marcan.st>
 <20211117145829.204360-4-marcan@marcan.st>
In-Reply-To: <20211117145829.204360-4-marcan@marcan.st>

--------------YbLQpefrcAZSfvjGlf57xpXJ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTcuMTEuMjEgdW0gMTU6NTggc2NocmllYiBIZWN0b3IgTWFydGluOg0KPiBU
aGlzIGlzIHRoZSBmb3JtYXQgdXNlZCBieSB0aGUgYm9vdGxvYWRlciBmcmFtZWJ1ZmZlciBv
biBBcHBsZSBBUk02NA0KPiBwbGF0Zm9ybXMsIGFuZCBpcyBhbHJlYWR5IHN1cHBvcnRlZCBi
eSBzaW1wbGVmYi4gVGhpcyBhdm9pZHMgcmVncmVzc2luZw0KPiBvbiB0aGVzZSBwbGF0Zm9y
bXMgd2hlbiBzaW1wbGVkcm0gaXMgZW5hYmxlZCBhbmQgcmVwbGFjZXMgc2ltcGxlZmIuDQo+
IA0KPiBTaWduZWQtb2ZmLWJ5OiBIZWN0b3IgTWFydGluIDxtYXJjYW5AbWFyY2FuLnN0Pg0K
DQpSZXZpZXdlZC1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+
DQoNCj4gLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL3Rpbnkvc2ltcGxlZHJtLmMgfCAyICst
DQo+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+
IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3Rpbnkvc2ltcGxlZHJtLmMgYi9k
cml2ZXJzL2dwdS9kcm0vdGlueS9zaW1wbGVkcm0uYw0KPiBpbmRleCAyYzg0ZjJlYTFmYTIu
LmI0YjY5ZjNhN2U3OSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3Rpbnkvc2lt
cGxlZHJtLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3Rpbnkvc2ltcGxlZHJtLmMNCj4g
QEAgLTU3MSw3ICs1NzEsNyBAQCBzdGF0aWMgY29uc3QgdWludDMyX3Qgc2ltcGxlZHJtX2Rl
ZmF1bHRfZm9ybWF0c1tdID0gew0KPiAgIAkvL0RSTV9GT1JNQVRfWFJHQjE1NTUsDQo+ICAg
CS8vRFJNX0ZPUk1BVF9BUkdCMTU1NSwNCj4gICAJRFJNX0ZPUk1BVF9SR0I4ODgsDQo+IC0J
Ly9EUk1fRk9STUFUX1hSR0IyMTAxMDEwLA0KPiArCURSTV9GT1JNQVRfWFJHQjIxMDEwMTAs
DQo+ICAgCS8vRFJNX0ZPUk1BVF9BUkdCMjEwMTAxMCwNCj4gICB9Ow0KPiAgIA0KPiANCg0K
LS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VT
RSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQw
OSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2No
w6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCg==

--------------YbLQpefrcAZSfvjGlf57xpXJ--

--------------QPs2kW0HJJwo1Q6mIGvdH4Wa
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmGWGfoFAwAAAAAACgkQlh/E3EQov+D5
Cw/9E8g0HnUfhlntJbhPgRFbCXBlcmb4ZsEUGAmMGGsTnA5dC5Fb9iJHnGQkCaQE+3gh9WIJPvws
eETtfV1TwlNo393LfCZajKU6yYPt8V5gqycxhY4n1lryuS+PCDvrJONtp5a0W4ZJ1vzlp+k3Udfr
exEA3MnUL+kB1yKOyovw5LBvPglSGSjMw1sV5LFV3VCZRc3SsxggXAKJw+JQ9pbL7brqS3UwE8lY
mFAnNgfxlV6DbTj71tY7lwcVFOfw0OVGaH2poOj9T8m2+cRXyv41inQHTFGenTOSaxkkL2+8Hl3L
4srdA38QMuUDzNolQ4JpP6fuJjgfmjkRn/lORZtGPlIzF7f/FFPCMa9kgPXCYy9xOOSymqhD8cpI
EyH0mez+Yi48RcfkmSChqVkLrbqwUtqC2N9WJzdBgkjRPSMmEnuwcQ+mNBMrMOjARDRzPjr2o0AY
ajFpP8Bm6ftyNyM8EuhltrcEQR02cIaUK9178d1N7ZvgICQkaG53gpKII9AWA6uc6q1406V2p+aw
ZBVCN9phU/LXOgGLXKtCK8io3ZYQ9F0PzQzl2bzzXvjbPpw8af7U+B8chNbcsPJ5E2pmPteZ0d8o
njCSSRX31T4n82/Q92ezU2wUq8NN1OQ365fDroFsOwSoK55M0zEBASVtLf5f2Nnx05jVmiQulitC
Txc=
=JfMy
-----END PGP SIGNATURE-----

--------------QPs2kW0HJJwo1Q6mIGvdH4Wa--
