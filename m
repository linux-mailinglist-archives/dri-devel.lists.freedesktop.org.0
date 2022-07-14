Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FEB2574741
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jul 2022 10:38:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45F5512B456;
	Thu, 14 Jul 2022 08:38:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7500C12B406
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jul 2022 08:38:08 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 071F53439E
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jul 2022 08:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1657787886; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type;
 bh=tyGy2WLgCrHflzjnfgNrlc9MV6G/Z8xkoZ3L6dv6+Y8=;
 b=Akh98HmClP523c+pqFTHjNekwhqdrT1LYEVY9wib71c7SjWsVzedUWnjdm0AEWwID/A32A
 khV8g+wEZDiBe5PEOwXal9h9WfVO5GngtFMm4PIfyJM9ADUyS97MLbJ7eGkfAc1k5659P5
 p7h592jIEwzV0qnmlZDZKBnIYdrEVGA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1657787886;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type;
 bh=tyGy2WLgCrHflzjnfgNrlc9MV6G/Z8xkoZ3L6dv6+Y8=;
 b=II/o/DFJiRZKZZHRYSx/fw+5VntpV2d9FO9EoCDtG4GV7rmCjbr5mFeqkNHJATdBzSh/9g
 pgOSoO6cT0iafZBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id EDFF413A61
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jul 2022 08:38:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id wPA+Oe3Vz2LtEwAAMHmgww
 (envelope-from <tzimmermann@suse.de>)
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jul 2022 08:38:05 +0000
Message-ID: <53acad40-6bf2-33de-3a28-bf5021eef726@suse.de>
Date: Thu, 14 Jul 2022 10:38:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
From: Thomas Zimmermann <tzimmermann@suse.de>
Subject: PSA: drm-misc-next-fixes is open
To: dri-devel <dri-devel@lists.freedesktop.org>
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------J6M5yxBGjqPYYxkUQcR2dN9W"
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
--------------J6M5yxBGjqPYYxkUQcR2dN9W
Content-Type: multipart/mixed; boundary="------------cnfRCXUJ4roxDy3PYgAM6HyM";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: dri-devel <dri-devel@lists.freedesktop.org>
Message-ID: <53acad40-6bf2-33de-3a28-bf5021eef726@suse.de>
Subject: PSA: drm-misc-next-fixes is open

--------------cnfRCXUJ4roxDy3PYgAM6HyM
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGksDQoNCnRoZSBlbWFpbCBnb2VzIG91dCBhIGJpdCBsYXRlLCBhcyAtcmM2IGhhcyBhbHJl
YWR5IGJlZW4gdGFnZ2VkIGZvciBhIGZldyANCmRheXMuIFRoaXMgbWVhbnMgdGhhdCBkcm0t
bWlzYy1uZXh0LWZpeGVzIGlzIG5vdyBvcGVuIGZvciBidWcgZml4ZXMsIGFzIA0KZHJtLW5l
eHQgaXMgaW4gZmVhdHVyZSBmcmVlemUgdW50aWwgdGhlIG5leHQgLXJjMSBjb21lcyBvdXQu
DQoNClNvbWUgcnVsZXMgb2YgdGh1bWI6DQoNCiAgICogaWYgeW91ciBwYXRjaCBmaXhlcyBh
IGJ1ZyBpbiB1cHN0cmVhbSwgcGxlYXNlIHB1dCBpdCBpbnRvIA0KZHJtLW1pc2MtZml4ZXMs
DQoNCiAgICogaWYgeW91ciBwYXRjaCBmaXhlcyBhIGJ1ZyBpbiBkcm0tbmV4dCwgcGxlYXNl
IHB1dCBpdCBpbnRvIA0KZHJtLW1pc2MtbmV4dC1maXhlcywNCg0KICAgKiBhbnl0aGluZyBl
bHNlIHNob3VsZCBnbyBpbnRvIGRybS1taXNjLW5leHQuDQoNClRoZSBmbG93IGNoYXJ0IGlz
IGF0IFsxXS4NCg0KVGhlIHRyYW5zaXRpb24gZnJvbS90byBkcm0tbWlzYy1maXhlcy1uZXh0
IHNvbWV0aW1lcyByZXN1bHRzIGluIHBhdGNoZXMgDQp0aGF0IGFyZSBhcHBsaWVkIHRvIHRo
ZSB3cm9uZyB0cmVlIGFuZCBnZXQgc3R1Y2sgdGhlcmUgZm9yIGEgbG9uZyB0aW1lLiANCklm
IHlvdSBoYXZlIGZpeGVzIGluIGRybS1taXNjLW5leHQgdGhhdCBtdXN0IGdvIGludG8gZHJt
LW5leHQgc29vbiwgDQpwbGVhc2UgY2hlcnJ5LXBpY2sgdGhlbSBpbnRvIGRybS1taXNjLW5l
eHQtZml4ZXMuIFdlIGhhdmUNCg0KICAgZGltIGNoZXJyeS1waWNrDQoNCnRvIGhlbHAgeW91
IHdpdGggdGhhdC4NCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KWzFdIA0KaHR0cHM6Ly9k
cm0ucGFnZXMuZnJlZWRlc2t0b3Aub3JnL21haW50YWluZXItdG9vbHMvY29tbWl0dGVyLWRy
bS1taXNjLmh0bWwjd2hlcmUtZG8taS1hcHBseS1teS1wYXRjaA0KDQotLSANClRob21hcyBa
aW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNv
bHV0aW9ucyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywg
R2VybWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bDvGhyZXI6
IEl2byBUb3Rldg0K

--------------cnfRCXUJ4roxDy3PYgAM6HyM--

--------------J6M5yxBGjqPYYxkUQcR2dN9W
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmLP1e0FAwAAAAAACgkQlh/E3EQov+A8
ZBAAnRhQKxRYYkuLjgIpSGCvgu4wBLSzo95DD0El3pxdYK9UBudlxqdVgQgk+WPHCycldKSRE23Y
USTRbweZI7JeZ0t5lEnvmJibI2xFQo1Fp0DsUIdNIb6cMmNlZ5nCtm9B9Mit7Xytju0SQXoQSgHk
CRgnAPtCkbK6vYaD7r5EO6XB62cIy63cJQ8NycmcU0Y6NT0kinKxuDwA41fAwG+POV7lzUJRvKaQ
W5wazfyaFPE5jqus5IpbsVUUuuBEjA+ZarYvyvuhWd2rGDPKgNg0EUI5OGYCCyTjYsQYqGoAe81F
1GtT3wpwBi/xqKCLP++RTWNddzBb2V4xZ7vL3KtaJNI2VjzGNcalvfV4BRLMBqmrwROG+MsxqhXy
ht4MCpqopEnwMJfbnMcVjJo//5Fjpm80Bg66Rqr0jrU2PeraCTDRvvhebnKxRCiruU6AGabGUEiu
DpIBYL+hx2Jg0xKL0iCXpU2EovoeSZU87iDMwxFqvSgwgJxEfCtdubd+5lFP9dNPvpX/iUsoxI18
MprKmBACE+XGUQvhu3lVWJ+IqDSjYu24aOLmYK5sziZBvHgq0cr5irSLh02UwM698j8/GUvbVRqF
isgclW6VFiuUC/tvnPBIgbbchT1DzCkF166X7zvqetRwE1VhntK574VGDl9s8E0QWzJwAsVZeRZM
CpU=
=Rkto
-----END PGP SIGNATURE-----

--------------J6M5yxBGjqPYYxkUQcR2dN9W--
