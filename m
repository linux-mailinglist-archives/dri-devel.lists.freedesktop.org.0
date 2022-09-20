Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EE7785BE083
	for <lists+dri-devel@lfdr.de>; Tue, 20 Sep 2022 10:43:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB9F910E2FA;
	Tue, 20 Sep 2022 08:43:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A910810E2FA
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Sep 2022 08:43:08 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 66BB721BCA;
 Tue, 20 Sep 2022 08:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1663663387; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0YjGsleVGZN/M2sOAYpMPJQYOMrfWHd7Nuf2sYEE3fQ=;
 b=R89+HXTI6cvQMEKLGHf/CWEF4L3z2w1XcQcIIf+VJAB2ezUvGm00eTxK5Z4T1q6auWBfFc
 WfTcg7AXz26yaE+/XL/fFuXxYuECXhjQA9KXmq/k4L/v+RX+gVQ68MPIyTEM5+q8IIylUw
 YbQzQxgtspKuv9WQfqJuUpmG9oHAKwA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1663663387;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0YjGsleVGZN/M2sOAYpMPJQYOMrfWHd7Nuf2sYEE3fQ=;
 b=veUS2juzd6YCIp0musJ6Ihvv4rnsz3CRksAcW6ovgs5YZRAX/2vbkn+UfQJs3i+DCO5jMF
 f7N6h8o9X8RXzkCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 41EB013ABB;
 Tue, 20 Sep 2022 08:43:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id epkiDxt9KWPTcAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 20 Sep 2022 08:43:07 +0000
Message-ID: <2d62d61d-b000-9918-2cd4-b7fb3d1196d2@suse.de>
Date: Tue, 20 Sep 2022 10:43:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH] drm/ast: Fix video broken in some resolutions on ast2600
Content-Language: en-US
To: Jammy Huang <jammy_huang@aspeedtech.com>, airlied@redhat.com,
 airlied@linux.ie, daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20220916091706.4559-1-jammy_huang@aspeedtech.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220916091706.4559-1-jammy_huang@aspeedtech.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------0ojqfMpKkQwU40CQnMtYx3JM"
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
--------------0ojqfMpKkQwU40CQnMtYx3JM
Content-Type: multipart/mixed; boundary="------------09010sIdbzw5MQE4K04JNJ76";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Jammy Huang <jammy_huang@aspeedtech.com>, airlied@redhat.com,
 airlied@linux.ie, daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Message-ID: <2d62d61d-b000-9918-2cd4-b7fb3d1196d2@suse.de>
Subject: Re: [PATCH] drm/ast: Fix video broken in some resolutions on ast2600
References: <20220916091706.4559-1-jammy_huang@aspeedtech.com>
In-Reply-To: <20220916091706.4559-1-jammy_huang@aspeedtech.com>

--------------09010sIdbzw5MQE4K04JNJ76
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTYuMDkuMjIgdW0gMTE6MTcgc2NocmllYiBKYW1teSBIdWFuZzoNCj4gU29t
ZSBjYXNlcyBhcmUgbm90IGhhbmRsZWQgd2VsbCBmb3IgYXN0MjYwMC4NCj4gDQo+IFNpZ25l
ZC1vZmYtYnk6IEphbW15IEh1YW5nIDxqYW1teV9odWFuZ0Bhc3BlZWR0ZWNoLmNvbT4NCj4g
LS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL2FzdC9hc3RfbW9kZS5jIHwgMTAgKysrKysrKyst
LQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0p
DQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FzdC9hc3RfbW9kZS5jIGIv
ZHJpdmVycy9ncHUvZHJtL2FzdC9hc3RfbW9kZS5jDQo+IGluZGV4IGQzMjdkY2JhZjAzMi4u
YmU5YmJjODg4YWMzIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9t
b2RlLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FzdC9hc3RfbW9kZS5jDQo+IEBAIC0z
MTQsNyArMzE0LDcgQEAgc3RhdGljIHZvaWQgYXN0X3NldF9jcnRjX3JlZyhzdHJ1Y3QgYXN0
X3ByaXZhdGUgKmFzdCwNCj4gICAJdTgganJlZzA1ID0gMCwganJlZzA3ID0gMCwganJlZzA5
ID0gMCwganJlZ0FDID0gMCwganJlZ0FEID0gMCwganJlZ0FFID0gMDsNCj4gICAJdTE2IHRl
bXAsIHByZWNhY2hlID0gMDsNCj4gICANCj4gLQlpZiAoKGFzdC0+Y2hpcCA9PSBBU1QyNTAw
KSAmJg0KPiArCWlmICgoYXN0LT5jaGlwID09IEFTVDI1MDAgfHwgYXN0LT5jaGlwID09IEFT
VDI2MDApICYmDQo+ICAgCSAgICAodmJpb3NfbW9kZS0+ZW5oX3RhYmxlLT5mbGFncyAmIEFT
VDI1MDBQcmVDYXRjaENSVCkpDQo+ICAgCQlwcmVjYWNoZSA9IDQwOw0KPiAgIA0KPiBAQCAt
MzU1LDYgKzM1NSwxMiBAQCBzdGF0aWMgdm9pZCBhc3Rfc2V0X2NydGNfcmVnKHN0cnVjdCBh
c3RfcHJpdmF0ZSAqYXN0LA0KPiAgIAlhc3Rfc2V0X2luZGV4X3JlZ19tYXNrKGFzdCwgQVNU
X0lPX0NSVENfUE9SVCwgMHhBQywgMHgwMCwganJlZ0FDKTsNCj4gICAJYXN0X3NldF9pbmRl
eF9yZWdfbWFzayhhc3QsIEFTVF9JT19DUlRDX1BPUlQsIDB4QUQsIDB4MDAsIGpyZWdBRCk7
DQo+ICAgDQo+ICsJLy8gV29ya2Fyb3VuZCBmb3IgSFN5bmMgVGltZSBub24gb2N0YXZlIHBp
eGVscyAoMTkyMHgxMDgwQDYwSHogSFN5bmMgNDQgcGl4ZWxzKTsNCg0KQXBwbGllZCB0byBk
cm0tbWlzYy1uZXh0LCBidXQgd2hhdCBpcyBhbiAnb2N0YXZlIHBpeGVsJz8NCg0KQmVzdCBy
ZWdhcmRzDQpUaG9tYXMNCg0KPiArCWlmICgoYXN0LT5jaGlwID09IEFTVDI2MDApICYmICht
b2RlLT5jcnRjX3ZkaXNwbGF5ID09IDEwODApKQ0KPiArCQlhc3Rfc2V0X2luZGV4X3JlZ19t
YXNrKGFzdCwgQVNUX0lPX0NSVENfUE9SVCwgMHhGQywgMHhGRCwgMHgwMik7DQo+ICsJZWxz
ZQ0KPiArCQlhc3Rfc2V0X2luZGV4X3JlZ19tYXNrKGFzdCwgQVNUX0lPX0NSVENfUE9SVCwg
MHhGQywgMHhGRCwgMHgwMCk7DQo+ICsNCj4gICAJLyogdmVydCB0aW1pbmdzICovDQo+ICAg
CXRlbXAgPSAobW9kZS0+Y3J0Y192dG90YWwpIC0gMjsNCj4gICAJaWYgKHRlbXAgJiAweDEw
MCkNCj4gQEAgLTQzMiw3ICs0MzgsNyBAQCBzdGF0aWMgdm9pZCBhc3Rfc2V0X2RjbGtfcmVn
KHN0cnVjdCBhc3RfcHJpdmF0ZSAqYXN0LA0KPiAgIHsNCj4gICAJY29uc3Qgc3RydWN0IGFz
dF92Ymlvc19kY2xrX2luZm8gKmNsa19pbmZvOw0KPiAgIA0KPiAtCWlmIChhc3QtPmNoaXAg
PT0gQVNUMjUwMCkNCj4gKwlpZiAoKGFzdC0+Y2hpcCA9PSBBU1QyNTAwKSB8fCAoYXN0LT5j
aGlwID09IEFTVDI2MDApKQ0KPiAgIAkJY2xrX2luZm8gPSAmZGNsa190YWJsZV9hc3QyNTAw
W3ZiaW9zX21vZGUtPmVuaF90YWJsZS0+ZGNsa19pbmRleF07DQo+ICAgCWVsc2UNCj4gICAJ
CWNsa19pbmZvID0gJmRjbGtfdGFibGVbdmJpb3NfbW9kZS0+ZW5oX3RhYmxlLT5kY2xrX2lu
ZGV4XTsNCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVs
b3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxkc3Ry
LiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJuYmVy
ZykNCkdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCg==

--------------09010sIdbzw5MQE4K04JNJ76--

--------------0ojqfMpKkQwU40CQnMtYx3JM
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmMpfRoFAwAAAAAACgkQlh/E3EQov+B6
pg/+LKPVSYbLz924tOxbIl8aKBhISXQUXSxHnabZTUbkzdvvqcCJWYB11khMn6gxMbNPwkgOA5z9
582HOHjj+7m2jFIuYObMlD+2WBvInm4LaHHE+ZRyIY69D5GbVjBNmM3+JHkQEWSqz+o1ykHDXzJZ
Q8yE0dCw+ZT0LAFSVh1MgyHm9fzy91m+KkVkBd3uszTKIcsgaON2AbK7XXtt2LVw2uECCu9ZzWcz
CsKI/b9LuS4/6W2jML6FBrqktiycqqIY1qKt3eEzrpQWFk1PZpfISsBbIdLDUjJU2+loc1OT3a4i
xOqpNnSbNz2qWT/OyzQCdwwdcozcNrCLgoFusgWa1m9Tg1SVLJ7MjoX6hTTtINCgk0L0hfVJdI+r
0Q63keSwDFvInkrji6aey3cvK4bK/AYoU8L8fOfwFqFjqy8jZxHsvBEjrWzd3NJDKdnRR04Lnwq+
DyQpfgYSlnEzIz1hza6sQQwCDRjW98mlz6fSSfCDjqHg8Ugiq7KOXOPIBsrHHuzuRMEDRz12gsVY
sXEEASDU3k+CObym7e8VY+gWDw5+Qw6bwdc0uJX3LsQ9PBpShdwZdtcl6L7lK/bIfcNtHuguOJ7N
9Qv8EcdIuMtrsqsCHbMKKm5g8Nltd5gaUNvcxYoEgXQVCiZrKRSZbQZAMiKm979Bf5g6fC+YlJa5
QpE=
=+JDv
-----END PGP SIGNATURE-----

--------------0ojqfMpKkQwU40CQnMtYx3JM--
