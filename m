Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DA8177CCFC
	for <lists+dri-devel@lfdr.de>; Tue, 15 Aug 2023 14:53:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E52B310E193;
	Tue, 15 Aug 2023 12:53:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F32510E193
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Aug 2023 12:53:30 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 915EF1F38D
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Aug 2023 12:53:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1692104008; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type;
 bh=G5zZ6oGXi0ltVkCGFNhF3HluFWYaipDn4IZWM1MPDfE=;
 b=qg40+Zqlnaj4UbzpMENELjD7eE/fB/gANXW7puAQZ5yRoxqoSSKKVVsiebVEpbwYzxwKOn
 wjKGX2RypnSg+nncJAuRWsHB5VqswMZ8GTTOjz8FeHDMA5UwJRDVXaTREbmDQ8xRS3pECi
 d/YsCJH6HpDaalb8YjbJWU8tZv3nSkA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1692104008;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type;
 bh=G5zZ6oGXi0ltVkCGFNhF3HluFWYaipDn4IZWM1MPDfE=;
 b=zLJoefm0YFlV9qc+5DzW9s1aDk2RN2lDUrsSZmdcuQPayX53/OTzVgLQawSs2RK0PM0iZV
 Jm55AgS2LHX/MFAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7A59913909
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Aug 2023 12:53:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 1QZsHEh122Q5JQAAMHmgww
 (envelope-from <tzimmermann@suse.de>)
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Aug 2023 12:53:28 +0000
Message-ID: <061c3183-76fa-d5ef-d6f6-807f31fa9bf3@suse.de>
Date: Tue, 15 Aug 2023 14:53:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
From: Thomas Zimmermann <tzimmermann@suse.de>
Subject: PSA: drm-misc-next-fixes is open
To: dri-devel <dri-devel@lists.freedesktop.org>
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------KA7JVrZELmCtrt0e706QUdgW"
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
--------------KA7JVrZELmCtrt0e706QUdgW
Content-Type: multipart/mixed; boundary="------------wwAVTMUvjRJh7baLSd0Ms04a";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: dri-devel <dri-devel@lists.freedesktop.org>
Message-ID: <061c3183-76fa-d5ef-d6f6-807f31fa9bf3@suse.de>
Subject: PSA: drm-misc-next-fixes is open

--------------wwAVTMUvjRJh7baLSd0Ms04a
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGksDQoNCi1yYzYgaGFzIGJlZW4gdGFnZ2VkIGZvciBhIGZldyBkYXlzLiBUaGlzIG1lYW5z
IHRoYXQgZHJtLW1pc2MtbmV4dC1maXhlcyANCmlzIG5vdyBvcGVuIGZvciBidWcgZml4ZXMs
IGFzIGRybS1uZXh0IGlzIGluIGZlYXR1cmUgZnJlZXplIHVudGlsIHRoZSANCm5leHQgLXJj
MSBjb21lcyBvdXQuDQoNClNvbWUgcnVsZXMgb2YgdGh1bWIgb24gd2hlcmUgdG8gbGFuZCB5
b3VyIHBhdGNoOg0KDQogICAgICAqIGlmIHlvdXIgcGF0Y2ggZml4ZXMgYSBidWcgaW4gdXBz
dHJlYW0sIHBsZWFzZSBwdXQgaXQgaW50byANCmRybS1taXNjLWZpeGVzLA0KDQogICAgICAq
IGlmIHlvdXIgcGF0Y2ggZml4ZXMgYSBidWcgaW4gZHJtLW5leHQsIHBsZWFzZSBwdXQgaXQg
aW50byANCmRybS1taXNjLW5leHQtZml4ZXMsDQoNCiAgICAgICogYW55dGhpbmcgZWxzZSwg
ZXNwZWNpYWxseSBuZXcgZmVhdHVyZXMsIHNob3VsZCBnbyBpbnRvIA0KZHJtLW1pc2MtbmV4
dC4NCg0KVGhlIGZsb3cgY2hhcnQgaXMgYXQgWzFdLg0KDQpUaGUgdHJhbnNpdGlvbiBmcm9t
L3RvIGRybS1taXNjLWZpeGVzLW5leHQgc29tZXRpbWVzIHJlc3VsdHMgaW4gcGF0Y2hlcyAN
CnRoYXQgYXJlIGFwcGxpZWQgdG8gdGhlIHdyb25nIHRyZWUgYW5kIGdldCBzdHVjayB0aGVy
ZSBmb3IgYSBsb25nIHRpbWUuIA0KSWYgeW91IGhhdmUgZml4ZXMgaW4gZHJtLW1pc2MtbmV4
dCB0aGF0IG11c3QgZ28gaW50byBkcm0tbmV4dCBzb29uLCANCnBsZWFzZSBjaGVycnktcGlj
ayB0aGVtIGludG8gZHJtLW1pc2MtbmV4dC1maXhlcy4gV2UgaGF2ZQ0KDQogICAgICBkaW0g
Y2hlcnJ5LXBpY2sNCg0KdG8gaGVscCB5b3Ugd2l0aCB0aGF0Lg0KDQpCZXN0IHJlZ2FyZHMN
ClRob21hcw0KDQpbMV0gDQpodHRwczovL2RybS5wYWdlcy5mcmVlZGVza3RvcC5vcmcvbWFp
bnRhaW5lci10b29scy9jb21taXR0ZXItZHJtLW1pc2MuaHRtbCN3aGVyZS1kby1pLWFwcGx5
LW15LXBhdGNoDQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBE
ZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KRnJhbmtl
bnN0cmFzc2UgMTQ2LCA5MDQ2MSBOdWVybmJlcmcsIEdlcm1hbnkNCkdGOiBJdm8gVG90ZXYs
IEFuZHJldyBNeWVycywgQW5kcmV3IE1jRG9uYWxkLCBCb3VkaWVuIE1vZXJtYW4NCkhSQiAz
NjgwOSAoQUcgTnVlcm5iZXJnKQ0K

--------------wwAVTMUvjRJh7baLSd0Ms04a--

--------------KA7JVrZELmCtrt0e706QUdgW
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmTbdUcFAwAAAAAACgkQlh/E3EQov+DL
2BAAkAGyZq5TN0nE194T11j8RxKmwGZNZld4ZJ7Pojoni3y5HZl+1LzMegyuxNgnpnw53f+fb7GI
8e5XM3m5n+hs9gaP/TagBC2EWjlbY9mDq9Hp+K5keisaLH1w1Xrw7BM281aPvtgJaSoLrzhSOZ4C
CYE3uo3mlWdTPF8PnG248IBGUVvHST/mLQ8xbuMeWgWq1pZhRA33z1/rPw5Ej46lwPMzwdE4oOiq
pBfiCG/a3MWCykafq0NAt1miZ21SpcZSJjFt4kult0AF+m5NRwvuj+ojL2zDdU8lJWNKMLIyYSgV
iIlv0hnWpp3mQ6vH72ZvaR4oswgUNv5eyz3XadjBmKtVX6QL0VpJTQKR4xfnvMcASkG7ZP92+mGs
AGKOZcvQFs/6zDGgYXcSj8YbbHhaxuv8qB3CUGzYXLUz671LDjW0F0aaMmVC2nnhpSWeaDZeYX2/
A4ld8ma4H88ckYpqAKLXlhxV46s+D2wyfIDnT06pMs1z83oOUBC0I49uYMpIYPQuG+g02IGytpxk
poYHerFF/hlJF45jWYwqJJAjiAa0CMCgz6I9ogHJB9MnQinLH+MmkNFAvMBgCUXuITGExkEWXglG
rne0mK9jIIEpt0nlai8DGaPFJnFwb/MRRX49D1n56eQVtcDPR6lgLEmIrrDLoDKkQleK3pJZRBgD
4Bo=
=B1B0
-----END PGP SIGNATURE-----

--------------KA7JVrZELmCtrt0e706QUdgW--
