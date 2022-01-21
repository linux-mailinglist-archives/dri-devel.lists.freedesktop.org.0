Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27466495BFC
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jan 2022 09:33:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FEA710E979;
	Fri, 21 Jan 2022 08:33:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C19F010E979
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jan 2022 08:33:50 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 74A1A1F39D
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jan 2022 08:33:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1642754029; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type;
 bh=U7pxpwMYoYDChEtmFfmPgCdHO3o33FCDg9URgABr5PY=;
 b=RXeXjIcJ5hXoMbJtVvSmc8DDGRt0clunewub+T9pBv/kKuKcJsMzSjc/q1Qxix2jrBChip
 88AABHJvmNJzCCs/hxM6Ba6X7lY3XfHj9V3M1EsKg5qjU2K4bvB9wpduk+nE3op8jmfs/V
 S1b+JJRlM9p11NCveXPf+QJXQMhb2Mg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1642754029;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type;
 bh=U7pxpwMYoYDChEtmFfmPgCdHO3o33FCDg9URgABr5PY=;
 b=3N4aDovTtQCU3TYIdy9Fu1vqQI3JBCCOBQUpdSBJWgpBgOVak5gQZB2ToR8BhpP4gr/V/g
 iJslYg74w1sTLFCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5F97A1348D
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jan 2022 08:33:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id azrHFe1v6mFnOQAAMHmgww
 (envelope-from <tzimmermann@suse.de>)
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jan 2022 08:33:49 +0000
Message-ID: <90072d82-d139-d268-cc34-40d14cde9cb6@suse.de>
Date: Fri, 21 Jan 2022 09:33:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: dri-devel <dri-devel@lists.freedesktop.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
Subject: PSA: drm-misc-next-fixes is closed
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------XA8fD0tBMkqIK80ONZcxVQEw"
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
--------------XA8fD0tBMkqIK80ONZcxVQEw
Content-Type: multipart/mixed; boundary="------------jZcgiASoeV6SpD3RQpXZZbgz";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: dri-devel <dri-devel@lists.freedesktop.org>
Message-ID: <90072d82-d139-d268-cc34-40d14cde9cb6@suse.de>
Subject: PSA: drm-misc-next-fixes is closed

--------------jZcgiASoeV6SpD3RQpXZZbgz
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGksDQoNCkknbSBqdXN0IGxldHRpbmcgeW91IGtub3cgdGhhdCBkcm0tbWlzYy1uZXh0LWZp
eGVzIGlzIGNsb3NlZC4gLXJjMSB3aWxsIA0KcHJlc3VtYWJseSBiZSB0YWdnZWQgdGhpcyB3
ZWVrZW5kIGFuZCBkcm0tbmV4dCB3aWxsIGJlIG9wZW4gZm9yIGZlYXR1cmVzIA0KYW5kIGJ1
Z2ZpeGVzIHVudGlsIC1yYzYgY29tZXMgb3V0Lg0KDQpUaGUgdHJhbnNpdGlvbiBmcm9tL3Rv
IGRybS1taXNjLWZpeGVzLW5leHQgb2Z0ZW4gcmVzdWx0cyBpbiBwYXRjaGVzIHRoYXQgDQph
cmUgYXBwbGllZCB0byB0aGUgd3JvbmcgdHJlZSBhbmQgZ2V0IHN0dWNrIHRoZXJlIGZvciBh
IGxvbmcgdGltZS4gU29tZSANCnJ1bGVzIG9mIHRodW1iIGZvciB0aGUgbmV4dCB3ZWVrczoN
Cg0KICAqIGlmIHlvdXIgcGF0Y2ggZml4ZXMgYSBidWcgaW4gdXBzdHJlYW0sIHBsZWFzZSBw
dXQgaXQgaW50byANCmRybS1taXNjLWZpeGVzLA0KDQogICogYW55dGhpbmcgZWxzZSBzaG91
bGQgZ28gaW50byBkcm0tbWlzYy1uZXh0Lg0KDQpUaGUgZmxvdyBjaGFydCBpcyBhdCBbMV0u
DQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNClsxXSANCmh0dHBzOi8vZHJtLnBhZ2VzLmZy
ZWVkZXNrdG9wLm9yZy9tYWludGFpbmVyLXRvb2xzL2NvbW1pdHRlci1kcm0tbWlzYy5odG1s
I3doZXJlLWRvLWktYXBwbHktbXktcGF0Y2gNCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0K
R3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2Vy
bWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihI
UkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYN
Cg==

--------------jZcgiASoeV6SpD3RQpXZZbgz--

--------------XA8fD0tBMkqIK80ONZcxVQEw
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmHqb+wFAwAAAAAACgkQlh/E3EQov+AV
+BAApqY1INF/acaLb4U+uzC24UAp4coFCzHr82bKadq6wwft7ZPWAPgALquUOmJmiHdIbc8mdHPh
qo5iaB98GAUZxrdORgqCjlUkNb7FG4vWXOzf7rXzRi17Y1b6VqvWuLRRZEc1IrcGYWk2lel9oMWo
1kU616by8Tln6UPnFj8bSpn7Czb/Ho3+mMPS9IzqxvMXDN3KRgbYQPN6KO9JPfa2untOd8u0tCDZ
exlGwW/gnnlsuFs8xqPokCKLsJk0mkb0O/orOOJbQ/kFoGUjpscTXxa1nYNgOmiK5VNZd0IU0ZCX
8WNOCBZ0u/HhU5CCbihmcZxHScFjGu553+IALaD3K9p8nmcETRn+ksHZXiLNGlcbvpyjw+Td7BvF
8bkswL75kdl/SoweUa5PIhgOVSkjCqMBtdRqvfc8Ag0zoK11NRwxpxppPRzPzn9QOGibJmLTno+k
ERlp+vIVqRqpqAYYcqcZcCqK/JFrjZImSWgzlQHs3EeGzLmMjW2/qtK4+p463ZcJ2RpiuKB4yXvZ
pZQvaLcnjRlqvumu9MwLNvq7I1xlrDA89b1EQbtrkDWqxgzWLEzuAsrFBBFpK4jpLdEnOKhclOr3
7QPFl2nFpvMmBxZMUtH8Zoax9ed+qt7S8OHvkXAnv6eO2M3AePEhc8rnl0/zkILGyZSWWMiue1Y4
Nkc=
=X2RE
-----END PGP SIGNATURE-----

--------------XA8fD0tBMkqIK80ONZcxVQEw--
