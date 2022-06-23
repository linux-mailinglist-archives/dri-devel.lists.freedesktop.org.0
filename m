Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B57D25574DC
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jun 2022 10:07:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02C0711A0E5;
	Thu, 23 Jun 2022 08:07:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A16611A0E3;
 Thu, 23 Jun 2022 08:07:11 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id BAEFE21C78;
 Thu, 23 Jun 2022 08:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1655971629; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KCBsYdYOHje91KLHafWJPqbinGkClfavlP+fBQY2REk=;
 b=jtQ17Zaw965I1bp8wlUpJLURtUgcwCKuWzyFxwecWhJvV3bfauOQ4VOM3yF9w7pQJexGCP
 FXw8V6+spumzwxvt8PpoWnhlhUVVSF4sC74D9ZX8UUuxQnmn1A6HpwihA0q+YC2im/Liqs
 Wat5J+dsZpQM99092ZjXdK5wdxnMfho=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1655971629;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KCBsYdYOHje91KLHafWJPqbinGkClfavlP+fBQY2REk=;
 b=QPJB+Fa24+J33ZciymEGu7yYwfF+J5RTj/RFOxRq5ZX/7pP1M4OksiWF3YBBbDLkojN9hU
 cFYWopPuVwpXn5Bw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 830DA133A6;
 Thu, 23 Jun 2022 08:07:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id BaAQHy0ftGL0eAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 23 Jun 2022 08:07:09 +0000
Message-ID: <a3bf32dc-bcae-496c-0c3a-5fe5c5c89c3f@suse.de>
Date: Thu, 23 Jun 2022 10:07:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PULL] drm-misc-next
Content-Language: en-US
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
References: <YrQeAAVvQ6jxu2dl@linux-uq9g>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <YrQeAAVvQ6jxu2dl@linux-uq9g>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------jdxH7jDC21oeF8nlo5PkAFFO"
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------jdxH7jDC21oeF8nlo5PkAFFO
Content-Type: multipart/mixed; boundary="------------0acfKxdF6CAGtAVWC0C1MFfw";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dim-tools@lists.freedesktop.org
Message-ID: <a3bf32dc-bcae-496c-0c3a-5fe5c5c89c3f@suse.de>
Subject: Re: [PULL] drm-misc-next
References: <YrQeAAVvQ6jxu2dl@linux-uq9g>
In-Reply-To: <YrQeAAVvQ6jxu2dl@linux-uq9g>

--------------0acfKxdF6CAGtAVWC0C1MFfw
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjMuMDYuMjIgdW0gMTA6MDIgc2NocmllYiBUaG9tYXMgWmltbWVybWFubjoN
Cj4gSGkgRGF2ZSBhbmQgRGFuaWVsLA0KPiANCj4gaGVyZSdzIHRoZSBkcm0tbWlzYy1uZXh0
IFBSIGZvciB0aGlzIHdlZWsuDQoNCkkgZm9yZ290IHRvIG1lbnRpb24gdGhhdCB3ZSBiYWNr
bWVyZ2VkIHY1LjE5LXJjMi4gVGhhdCdzIHdoeSB0aGUgbGlzdCBvZiANCmNoYW5nZWQgZmls
ZXMgaXMgc28gbG9uZy4NCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KPiANCg0KLS0gDQpU
aG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0
d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xy
bmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNm
w7xocmVyOiBJdm8gVG90ZXYNCg==

--------------0acfKxdF6CAGtAVWC0C1MFfw--

--------------jdxH7jDC21oeF8nlo5PkAFFO
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmK0HywFAwAAAAAACgkQlh/E3EQov+B8
lg//UBnyd81i/KxYdzGmCKWicezqr70RKVCAR8mXXec0z4OA0jne4C2w/wQ+grnh4tqO0bZVSsiE
SWz1PT+GPF2awnzOUNPvkg5VIkqqwiTYFmDwLcxrh2WH6sINiH4Wt4hCBK1bOrSBrIcvJ75uKwpT
m0X0pjKmtXLXTW5AXWtIvsF0mIm7ddrixuZZZkxcS1/b26PXHuKoY8qGuq4T8StMl+oIi/mg/9FZ
eku6v67KFCXbpccV6kfdHT+yJvnesL4r1qEMt3WRa6Jrkr/J0KnMylmysEGeZeAOVAJBfnsh62Lw
joDtQJmWkN3urEQM3cGjxNmZIoJ3DyVhVFyHbsoZR7Eh2Z8piCwbs/W56udk1ao/Dv+zTvq1ZM+l
P6zsJrVu9eCGFZp6YUOVmp8UsF22Ou7pb8yJ91ti1oKbN/p3jjYIvpH4vAr4f1D52wo4DGNVkD+P
zKJXb+3RK+2Llx/Mp+SJqAyCS56D1W1d+BCmJC13Mwr0fT3NUvlThLMuqCfXLOZhRaRMBgt8a+Ko
yjNNLY7PKsxWuZSUMv1Z+umdqj8NcFRdgWxCALrZ6gqSXoL38jDTyCUqS/n64Ae4qI7k+2kawv0Y
QAO2J9p98kivRcRJi9Wl83itWFIxCezIYHaplI3wCnUFzb4eFJFWwerqRtKK+ar2iN1J5A1eRjPu
5do=
=LAeD
-----END PGP SIGNATURE-----

--------------jdxH7jDC21oeF8nlo5PkAFFO--
