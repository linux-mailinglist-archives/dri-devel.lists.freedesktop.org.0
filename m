Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBD9B74ABF1
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jul 2023 09:30:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DD4E10E51C;
	Fri,  7 Jul 2023 07:30:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E68410E51C
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jul 2023 07:30:21 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 68354227C7;
 Fri,  7 Jul 2023 07:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1688715019; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ByHHPOiJRVWCuDfas0lui+nzcwg9ECMd9Ys6oqQhhI8=;
 b=scPZcV2qbLmeDPxJFf0UXqT8pQreOI6tYCZI1JhZEFxV8a1vGjT/NM5bs5Ao9HEqSeqrjR
 HtsZNB2bE/lrPfex/xEkY0EmaqrCnqNLyak5I7heMkP/ibmh7bT6ROusMV1cTXhZYBH8MB
 k6PGtfnQ/+4iuKUyXKCxg52icL2gTWs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1688715019;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ByHHPOiJRVWCuDfas0lui+nzcwg9ECMd9Ys6oqQhhI8=;
 b=Hpvi0cEylupnv3l9Afn43HkiTzKS3jJ7mr+T+YddI1gfHkopDrmY2s9cZ+C54JX31k2VC/
 Cs+ZVESLoIL8AWCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 43E16139E0;
 Fri,  7 Jul 2023 07:30:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 3NeHDwu/p2SSHgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 07 Jul 2023 07:30:19 +0000
Message-ID: <81c57344-289d-fe41-8518-503249ea8d64@suse.de>
Date: Fri, 7 Jul 2023 09:30:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] drm/ast: Fix default resolution when no monitor is
 connected on DP
To: Jocelyn Falempe <jfalempe@redhat.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, airlied@redhat.com,
 kuohsiang_chou@aspeedtech.com, jammy_huang@aspeedtech.com
References: <20230623094639.434293-1-jfalempe@redhat.com>
 <878rbv20dp.fsf@intel.com> <13e35996-914d-37a6-1697-ac0c3c75cad1@redhat.com>
 <ed075f2f-861d-74d1-efc0-5baa2cd601fd@redhat.com>
 <43d12606-9c81-99f8-f13c-14338fcd7a28@suse.de>
 <f4b4ab09-5f03-af3c-0e7f-44a248678be8@redhat.com>
 <23d80964-d2d0-b688-e3cd-bf25a8135e5e@redhat.com>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <23d80964-d2d0-b688-e3cd-bf25a8135e5e@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------EGbbEYzx92aE3Ka11NwUocDr"
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
--------------EGbbEYzx92aE3Ka11NwUocDr
Content-Type: multipart/mixed; boundary="------------YtKl6kLsvwgrpHI0CgqzMEus";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Jocelyn Falempe <jfalempe@redhat.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, airlied@redhat.com,
 kuohsiang_chou@aspeedtech.com, jammy_huang@aspeedtech.com
Cc: dri-devel@lists.freedesktop.org
Message-ID: <81c57344-289d-fe41-8518-503249ea8d64@suse.de>
Subject: Re: [PATCH] drm/ast: Fix default resolution when no monitor is
 connected on DP
References: <20230623094639.434293-1-jfalempe@redhat.com>
 <878rbv20dp.fsf@intel.com> <13e35996-914d-37a6-1697-ac0c3c75cad1@redhat.com>
 <ed075f2f-861d-74d1-efc0-5baa2cd601fd@redhat.com>
 <43d12606-9c81-99f8-f13c-14338fcd7a28@suse.de>
 <f4b4ab09-5f03-af3c-0e7f-44a248678be8@redhat.com>
 <23d80964-d2d0-b688-e3cd-bf25a8135e5e@redhat.com>
In-Reply-To: <23d80964-d2d0-b688-e3cd-bf25a8135e5e@redhat.com>

--------------YtKl6kLsvwgrpHI0CgqzMEus
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDYuMDcuMjMgdW0gMTg6Mzcgc2NocmllYiBKb2NlbHluIEZhbGVtcGU6DQpb
Li4uXQ0KPj4+DQo+Pj4gWW91IGNvdWxkIG91dC1jb21tZW50IHRoZSBWR0EgY29kZSBpbiB0
aGUgYXN0IGRyaXZlciBmb3IgdGVzdGluZy4NCj4+DQo+PiBPaCwgVGhhbmtzIGZvciB0aGUg
aWRlYSwgSSB3aWxsIHRyeSB0aGF0Lg0KPj4NCj4gDQo+IFRoZSByZXN1bHQgaXMgdGhhdCBJ
IGdldCBhIGJsYWNrIHNjcmVlbiBvbiB0aGUgcmVtb3RlIEJNQy4gU28gbWF5YmUgDQo+IGFk
ZGluZyBhIHJlbW90ZS9ibWMgY29ubmVjdG9yIHdpbGwgc29sdmUgdGhhdC4NCg0KQ291bGQg
d29yay4gVGhhdCB3b3VsZCBiZSBhIGNvbm5lY3RvciBhbmQgZW5jb2RlciBvZiB0eXBlICd2
aXJ0dWFsJz8NCg0KTm90IGFsbCBhc3QgZGV2aWNlcyBoYXZlIGEgQk1DLiBEbyB5b3Uga25v
dyBob3cgdG8gZGV0ZWN0IGl0cyBwcmVzZW5jZT8NCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMN
Cg0KPiANCj4gDQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBE
ZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KRnJhbmtl
bnN0cmFzc2UgMTQ2LCA5MDQ2MSBOdWVybmJlcmcsIEdlcm1hbnkNCkdGOiBJdm8gVG90ZXYs
IEFuZHJldyBNeWVycywgQW5kcmV3IE1jRG9uYWxkLCBCb3VkaWVuIE1vZXJtYW4NCkhSQiAz
NjgwOSAoQUcgTnVlcm5iZXJnKQ0K

--------------YtKl6kLsvwgrpHI0CgqzMEus--

--------------EGbbEYzx92aE3Ka11NwUocDr
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmSnvwoFAwAAAAAACgkQlh/E3EQov+Dh
9RAAyZjnpr7aFM58lweWbQxXCOxtbA6p5ow7LBPva8bkwDW5KgL/0zXvSxaEIXkPY7BWm8fMRI2L
VfCRtlIY0R3ChOuWhZj9t+/PzPQsg8VvVJCLpqHY8Ow/2Pd0w4fIyGuHnXoAd/JkrmETXOdFRZZD
T736joHx1NigpA1sMeN4GOAuPlpvelJuh9uhnnOQ3ZNShPxCdSJEdg+wMbud12Dms68Ox+kMwOaY
J9lQJvOe2r7PhT3It+yXDNmvK8agvk/7yr7dU5yS6wX9oqPeuYZLGcDk1maPo6L5QcQxC1qt8pUh
6t85N9zaRo5n9MWKWz0DyiTrJG2OClTidrIXByzJSVO9gZjyDM13xyZ2FoZu53m4Uaf1uxt3OxAA
vqv5ElFKNIWbMQ47Fl2wSVjaZWs8/gJYRXH0ziNKUboQ2tYJk6wWt3lEXVzYlI/VOVonPT3vtnBs
Ndd0kV4kvapoP5WF6ZDzvKxeEYf/yd7EjKt04F45kw5+X/amuqBygIIpGlODamxGE6104j08ZzST
ZbyF/zwwn0IQ+/GmQmhYcnKTjE7vgQH3wpZs25FsimDTLY6QyjGFprTz+3O0v10r1cDBnIOz+e2n
LZKWoQYid8oZynNgqJoPw05LEmOW92l720B2EI8k5iUGD964bfBBBn7wa/ApSW72Lh6QVWyht+5y
BJA=
=EAA1
-----END PGP SIGNATURE-----

--------------EGbbEYzx92aE3Ka11NwUocDr--
