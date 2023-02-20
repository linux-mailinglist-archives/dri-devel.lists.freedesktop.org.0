Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C12A569CF1C
	for <lists+dri-devel@lfdr.de>; Mon, 20 Feb 2023 15:13:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D835610E116;
	Mon, 20 Feb 2023 14:12:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2266F10E116
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Feb 2023 14:12:57 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C2BC0225E7;
 Mon, 20 Feb 2023 14:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1676902375; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mRRQZSyBmk5h9dE05s0+8YiBarVCIjPWeoFnSktFJpw=;
 b=OiZMDlABMCGFcFNbUD15xUjCa+szAW7hOhh/ljfvZurfKvvA/gjrQ2zZwmh6HNh1TQ/uMw
 5jj4zOxZhs9alow1lG+6yNFKIJMyGdrNG+aYUJXkiH0ZNiEp78X4CSe83rs/EceKj3O0D8
 yzIYHpqn63+7m16wP2iXbq25WFLujJA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1676902375;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mRRQZSyBmk5h9dE05s0+8YiBarVCIjPWeoFnSktFJpw=;
 b=W9drX6r8Up++DpIUIfdv1XujY2W419KSKGo1PH6gby5TkVj6ATUL4sykxMe804nDFSVU1T
 Cj/Oy6Zq8jLw8BDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AF481139DB;
 Mon, 20 Feb 2023 14:12:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id QFy9Ked/82O7KgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 20 Feb 2023 14:12:55 +0000
Message-ID: <4c8f2bc5-df12-4baa-4b22-5d0275a7cac4@suse.de>
Date: Mon, 20 Feb 2023 15:12:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH 3/6] drm/mgag200: Remove disable handling from
 atomic_update
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>
References: <20230209154107.30680-1-tzimmermann@suse.de>
 <20230209154107.30680-4-tzimmermann@suse.de>
 <87lekwifta.fsf@minerva.mail-host-address-is-not-set>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <87lekwifta.fsf@minerva.mail-host-address-is-not-set>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------a9O7ue2Ex9dVE3JBK23yGtKQ"
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------a9O7ue2Ex9dVE3JBK23yGtKQ
Content-Type: multipart/mixed; boundary="------------suiRewOSQRqWvxc6aQMrNkls";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Message-ID: <4c8f2bc5-df12-4baa-4b22-5d0275a7cac4@suse.de>
Subject: Re: [PATCH 3/6] drm/mgag200: Remove disable handling from
 atomic_update
References: <20230209154107.30680-1-tzimmermann@suse.de>
 <20230209154107.30680-4-tzimmermann@suse.de>
 <87lekwifta.fsf@minerva.mail-host-address-is-not-set>
In-Reply-To: <87lekwifta.fsf@minerva.mail-host-address-is-not-set>

--------------suiRewOSQRqWvxc6aQMrNkls
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

VGhpcyBtYWlsIG5ldmVyIG1hZGUgaXQgdG8gZHJpLWRldmVsLg0KDQpBbSAxNy4wMi4yMyB1
bSAxNDoyNiBzY2hyaWViIEphdmllciBNYXJ0aW5leiBDYW5pbGxhczoNCj4gVGhvbWFzIFpp
bW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+IHdyaXRlczoNCj4gDQo+PiBUaGUgcHJp
bWFyeSBwbGFuZSBoYXMgdGhlIGF0b21pY19kaXNhYmxlIGhlbHBlciBzZXQsIHNvIGF0b21p
Y191cGRhdGUNCj4+IHdvbid0IGJlIGNhbGxlZCBpZiB0aGUgcGxhbmUgZ2V0cyBkaXNhYmxl
ZC4gUmVtb3ZlIHRoZSByZXNwZWN0aXZlIGJyYW5jaA0KPj4gZnJvbSB0aGUgaGVscGVyLg0K
Pj4NCj4+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBz
dXNlLmRlPg0KPj4gLS0tDQo+IA0KPiBSZXZpZXdlZC1ieTogSmF2aWVyIE1hcnRpbmV6IENh
bmlsbGFzIDxqYXZpZXJtQHJlZGhhdC5jb20+DQo+IA0KPiBCZXN0IHJlZ2FyZHMsDQo+IEph
dmllcg0KPiANCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERl
dmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxk
c3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJu
YmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCg==

--------------suiRewOSQRqWvxc6aQMrNkls--

--------------a9O7ue2Ex9dVE3JBK23yGtKQ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmPzf+cFAwAAAAAACgkQlh/E3EQov+CT
ww/+N8w8FwQGAIpJoStcelg7AqeC75UJz/232r9OiLjqAslXeR0p/0kC/kPcMO92qOTTSKQ1TL3L
7vBHznLjjXSrbTolfpGzFlN9gT6lY/Ls/o1ZOP8AElPOYjcfGEPDRBt6KSirIA9rbEuLAeOmkdzc
9uk0d917saFqcllSVwuex+2Fiw/85MJXNNaa0sdElV5futTHgifHJohyarm967ebZmI8EiPOiK9p
MdBO74dgl9DDlNZPSiBKOwJ1TuUFJUikxa8NkKJ56+Il+S4gILP6m4iOH+58aIn1Y6nXQwvnZ7/2
OazoWZ0VpLJmokl4HnI98x64Sx1uBkjTyJl4rnVWeSNwEdpa0SIFQEvkMt9ag9CGZbg86tYnlGxH
82FdWKWW9+LrIffvnECLkULv4h8b3eFXXSUQIrJkVbRsg1X5TT+/3mGp4UojHbKdRdt22XvMCk/M
BxcZS3cPg/nSqjiFS/sabDqiz8g6dpb86cqa6VD4+Oa4Il2sSk4LUffkbWY+Jsl9LtdqD7mBBjd1
KwHMD5f9pg1NIIzNAIwPiFstuGOahbMlAO/ZmG823i7AqsRFJGHS782D41kOcarJbX9bMhvEuT5z
NDEnE3m7Li80o290pc7may+4Kza2Tma+lwkt9hTga4pcMupLptFcQ91cLlWt4wd3+Pj5IJPnUlN6
NPI=
=BCkl
-----END PGP SIGNATURE-----

--------------a9O7ue2Ex9dVE3JBK23yGtKQ--
