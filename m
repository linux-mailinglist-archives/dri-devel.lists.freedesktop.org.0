Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BA876AB8FD
	for <lists+dri-devel@lfdr.de>; Mon,  6 Mar 2023 09:59:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA9EF10E1B1;
	Mon,  6 Mar 2023 08:59:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B118210E1B1
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Mar 2023 08:59:10 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 3A2B421DD8
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Mar 2023 08:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1678093149; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type;
 bh=dvx5smsJi+q+2Pd5aL2t2RToEkg0sz3ay4PRFE5WzdU=;
 b=EJCLCAv/H2abfalMoHAxWr+9yrpo3juKVVoyQTg5tAXPqc9mlNzufxdl+BUT9/1Ci3ukjz
 i9cmz2p4sKmeQuLnXaHv8RpxDRXaWFuIzQ5Eo1cE/t2rP/qIXCSBwGfd32cWN49TbowthA
 Jl/RnlLc2tpoO/o3LwiZaALbGHPpCyE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1678093149;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type;
 bh=dvx5smsJi+q+2Pd5aL2t2RToEkg0sz3ay4PRFE5WzdU=;
 b=sDCDaDxCDxPbtiRXJGT+lt4JYEyBWGOSZDlCRxRx9i/QXPqfDMwodN6coyQN8trjLhPnna
 7oy/kSIJlhuo+iAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2C54213513
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Mar 2023 08:59:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id gHPGCV2rBWSmUQAAMHmgww
 (envelope-from <tzimmermann@suse.de>)
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Mar 2023 08:59:09 +0000
Message-ID: <de9355ca-955d-c127-dee9-c99acdd2135e@suse.de>
Date: Mon, 6 Mar 2023 09:59:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Thomas Zimmermann <tzimmermann@suse.de>
Subject: PSA: drm-misc-next-fixes is closed
To: dri-devel <dri-devel@lists.freedesktop.org>
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------jUc4DWK9lsPsgDLrh0s0y8Iu"
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
--------------jUc4DWK9lsPsgDLrh0s0y8Iu
Content-Type: multipart/mixed; boundary="------------MyPMKrxpovwuKBrj5IKfUs5d";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: dri-devel <dri-devel@lists.freedesktop.org>
Message-ID: <de9355ca-955d-c127-dee9-c99acdd2135e@suse.de>
Subject: PSA: drm-misc-next-fixes is closed

--------------MyPMKrxpovwuKBrj5IKfUs5d
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGksDQoNCkknbSBqdXN0IGxldHRpbmcgeW91IGtub3cgdGhhdCBkcm0tbWlzYy1uZXh0LWZp
eGVzIGlzIGNsb3NlZCBhcyB2Ni4zLXJjMSANCmhhcyBiZWVuIHRhZ2dlZCBvbiBTdW5kYXku
IERSTSdzIGRybS1uZXh0IHRyZWUgd2lsbCBiZSBvcGVuIGZvciBmZWF0dXJlcyANCmFuZCBi
dWdmaXhlcyB1bnRpbCAtcmM2IGNvbWVzIG91dC4NCg0KVGhlIHRyYW5zaXRpb24gZnJvbS90
byBkcm0tbWlzYy1maXhlcy1uZXh0IHNvbWV0aW1lcyByZXN1bHRzIGluIHBhdGNoZXMgDQpn
ZXR0aW5nIGFwcGxpZWQgdG8gdGhlIHdyb25nIHRyZWUgYW5kL29yIGdldHRpbmcgc3R1Y2sg
Zm9yIGEgbG9uZyB0aW1lLiANClNvbWUgcnVsZXMgb2YgdGh1bWIgYXJlOg0KDQogICogaWYg
eW91ciBwYXRjaCBmaXhlcyBhIGJ1ZyBpbiB1cHN0cmVhbSwgcGxlYXNlIHB1dCBpdCBpbnRv
IA0KZHJtLW1pc2MtZml4ZXMsDQoNCiAgKiBhbnl0aGluZyBlbHNlIHNob3VsZCBnbyBpbnRv
IGRybS1taXNjLW5leHQuDQoNClRoZSBmbG93IGNoYXJ0IGlzIGF0IFsxXS4NCg0KQmVzdCBy
ZWdhcmRzDQpUaG9tYXMNCg0KWzFdIA0KaHR0cHM6Ly9kcm0ucGFnZXMuZnJlZWRlc2t0b3Au
b3JnL21haW50YWluZXItdG9vbHMvY29tbWl0dGVyLWRybS1taXNjLmh0bWwjd2hlcmUtZG8t
aS1hcHBseS1teS1wYXRjaA0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBE
cml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgN
Ck1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0KKEhSQiAzNjgwOSwg
QUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rldg0K

--------------MyPMKrxpovwuKBrj5IKfUs5d--

--------------jUc4DWK9lsPsgDLrh0s0y8Iu
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmQFq1wFAwAAAAAACgkQlh/E3EQov+Dh
hw//YbOPvYCGW26vQXMzRKyAfrvW8zRHERvvhieWcJlsQI+RDyymoetHLnWsnGwolRSM5SGE8stb
csRo7UGz+2iyUAsPRhsCWg8u4pRf8ABOSKlgnC8Pvu4ojlgNu8YZSbPoyHOSihrQ+o2USpRaXHSA
2DSY5+ArLHULgZ2yVzf6PciwDWGluLcp4mv03rVn92iL4NkqWivzNr5wJghTnLVnWQkZMMWQDzyh
PZ9c1Rka1jtyvqm75ki8JUhGsSuwoniHtlEnJ5ZTDYC4wraweHRJtf3qxRRj6sfDe0IaHitw+al6
pRnQJybnouBfxShrhS+KX7HZ5/q7+6o+YfEW/bzW/OfYLONoW9f/yNEJ5ZEAZhMKG3HemDXWYD7J
2W4MKRdZlBbaWxNce1eRaaWYj73fhZyd8C653vx3t66LePBiGAzwTrDyXw0s5X1mwyOazV0dk+X9
Oy6zRvS8Qigm2Mc1qPUuNSYqeISlSNaLojK6yUjDzNmhjN0VvguKb1/4WX+u6bCnazINZ2/Y6vde
ECaYMgEXT526Y0RNNLKueutqZDICn5LwbVDyEz4/5qGm9+C9i9lTRF6I1O3u4oWTdVV39uw1ELcH
1by/55esUqAOJ1+K5CsFL6q9C/5kE3Z1unz3ySPH6h0RlET9f95yXOCclCd0hhNgwLBggAK49RA2
epQ=
=R7ez
-----END PGP SIGNATURE-----

--------------jUc4DWK9lsPsgDLrh0s0y8Iu--
