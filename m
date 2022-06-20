Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E549C551D87
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jun 2022 16:19:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F11F310E7AD;
	Mon, 20 Jun 2022 14:19:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B3DC10E7AD
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jun 2022 14:19:45 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 465181F74D;
 Mon, 20 Jun 2022 14:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1655734784; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mpTzjF2ANuLDMPdQAaiy9Alq5/pV6ktaDFXq+DfoIpQ=;
 b=PBCD0EIiT9IAkvxOJ81wzm6iihhjTBV6oe8okIQCDKyQ9HAj/mEBieGaWgqBS5IDjEkw1Q
 UOyRe/21adaqP6E96p0LxWNXDpQRubCHRcFRqvTOaObnCupxudaRZfGfFjTIEe32p5gPbp
 J/W8P8g5Fql15SyWrkYtKNwqFGVIYj8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1655734784;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mpTzjF2ANuLDMPdQAaiy9Alq5/pV6ktaDFXq+DfoIpQ=;
 b=w3APO7k0+qFVfgKdf3Q3Znnch7H4HMURP6G20TytaEvznjrWQLjvMOc6kD+dPkpa6iiHs6
 Kj3l3iNk9Htpa/Aw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 23FE5134CA;
 Mon, 20 Jun 2022 14:19:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id GPQ8BwCCsGLqWwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 20 Jun 2022 14:19:44 +0000
Message-ID: <d03ad37d-d658-712e-d02e-82c5af3c2b1c@suse.de>
Date: Mon, 20 Jun 2022 16:19:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 05/64] drm/connector: Mention the cleanup after
 drm_connector_init
Content-Language: en-US
To: Maxime Ripard <maxime@cerno.tech>
References: <20220610092924.754942-1-maxime@cerno.tech>
 <20220610092924.754942-6-maxime@cerno.tech>
 <ede82148-dc9c-2944-ced3-9f7ce9c03e93@suse.de>
 <20220620121836.2bxmnyrfrfgvdyd2@houat>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220620121836.2bxmnyrfrfgvdyd2@houat>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------0WQpxmIxbmpkauafThthAxIh"
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------0WQpxmIxbmpkauafThthAxIh
Content-Type: multipart/mixed; boundary="------------BU8Rw0W0ARUyO8WaBZQUuz12";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Maxime Ripard <maxime@cerno.tech>
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@intel.com>,
 dri-devel@lists.freedesktop.org
Message-ID: <d03ad37d-d658-712e-d02e-82c5af3c2b1c@suse.de>
Subject: Re: [PATCH 05/64] drm/connector: Mention the cleanup after
 drm_connector_init
References: <20220610092924.754942-1-maxime@cerno.tech>
 <20220610092924.754942-6-maxime@cerno.tech>
 <ede82148-dc9c-2944-ced3-9f7ce9c03e93@suse.de>
 <20220620121836.2bxmnyrfrfgvdyd2@houat>
In-Reply-To: <20220620121836.2bxmnyrfrfgvdyd2@houat>

--------------BU8Rw0W0ARUyO8WaBZQUuz12
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjAuMDYuMjIgdW0gMTQ6MTggc2NocmllYiBNYXhpbWUgUmlwYXJkOg0KPiAr
ICogQXQgZHJpdmVyIHVubG9hZCB0aW1lIHRoZSBkcml2ZXIncyAmZHJtX2Nvbm5lY3Rvcl9m
dW5jcy5kZXN0cm95IGhvb2sNCj4gKyAqIHNob3VsZCBjYWxsIGRybV9jb25uZWN0b3JfdW5y
ZWdpc3RlcigpLCBkcm1fY29ubmVjdG9yX2NsZWFudXAoKSBhbmQNCj4gKyAqIGtmcmVlKCkg
dGhlIGNvbm5lY3RvciBzdHJ1Y3R1cmUuDQoNClRoaXMgc2VudGVuY2Ugc291bmRzIG9kZC4N
Cg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0K
U1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5
MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdl
c2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCg==

--------------BU8Rw0W0ARUyO8WaBZQUuz12--

--------------0WQpxmIxbmpkauafThthAxIh
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmKwgf8FAwAAAAAACgkQlh/E3EQov+De
BBAAxqbjZcpokDWstOMNptS6A8UG4CWZtPvkSJ8whJkuB6lE1FjCCZ81TumJEdjZkUaeLoSA2HQQ
xn57OvGkmI0SvdlIWoE9EM+EpgedVBfH0al3GGoxk5z7jEaQsy5I9jk/6G6h46ocW0ol9YYsEsXy
nm0X4IlmC0h4IudJdHMYzQ5paUawJVJFSCAabGSWYZcpres1fC5yLm19aLdaTGVCjsvB4OmOIBUP
4/hBYZbOA67zSVj9S/Xfzn4AEYPRONJooRip5Zhzcf0y4GDx4+R9dTdqUnyuZr7DbkGNXl8JgjCU
kclp/CNFR14uGGTExg5jlbaQeWCOCQxnOTR5XdUfBYCwyLiD8glCP2KIm1B+dgwyHSQ9Sglzu9eX
SMpRli7yxAmmngQFdV+506w6HGZluJckusHLp+SgVOk9RD0Qn5Ux2nGxq3gaQhq8gUaN7YxqMt6t
KaYjXWtPyqpT6JPq5PIOM7HQo4SGSaqwbQ8HGTLpf8d/QE2r2axouWplOa+nU0isAoNh/2PRjWMK
kwQY7WkV9tXd2Y6Ji9hE7Pe0OlrcwR7uVEJatjFG7j1kNHyzMD+9RLWb8IfWPK+WF1oBH2O3ODZi
CkwXo3WMCbwWLmeGmeQBn2h9lUNVP6JDlWXfGKUViugAZjP7Wo0zhSE7nPlCt+nKHx2XyzbF36I4
O/g=
=2E4t
-----END PGP SIGNATURE-----

--------------0WQpxmIxbmpkauafThthAxIh--
