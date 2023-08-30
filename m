Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 55D9B78D37A
	for <lists+dri-devel@lfdr.de>; Wed, 30 Aug 2023 09:10:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 055F610E0B7;
	Wed, 30 Aug 2023 07:10:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 963E210E0B7
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Aug 2023 07:10:28 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 362711F45F;
 Wed, 30 Aug 2023 07:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1693379427; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WAyCzORlXQ671s55Fhl/O2JBvLDCXuVOy/Wf1tHQsfE=;
 b=bj0t0YuiCNdeH/onBb45AL1SjWhzlArMc9u5tBi0hv+981JDUS89mmXWsEkQOzSGtAsK0s
 Y9EGut/ZAxOgO4sY6NZbnA27CyeuxCD6fX2241t7v/VweDt2+E4Wh6X/CkhGb/jHQHMtzU
 RFaLDob1Hwnlf7/tyr4TwYhTSoKbII8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1693379427;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WAyCzORlXQ671s55Fhl/O2JBvLDCXuVOy/Wf1tHQsfE=;
 b=Z5XRvkUk+x8TdcIKoCpOnuWtcbm0FIZxflYhX2YeIdIofEgVpdfI5lqyiRmZ8rXIR9Yx5I
 QPYet/vWnLmmqnBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id F0DFB13441;
 Wed, 30 Aug 2023 07:10:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id LmmrOWLr7mQ+TwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 30 Aug 2023 07:10:26 +0000
Message-ID: <d9a02d20-8b59-cbdd-d054-eac14f9771d2@suse.de>
Date: Wed, 30 Aug 2023 09:10:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH] fbdev: Update fbdev source file paths
Content-Language: en-US
To: =?UTF-8?Q?Jonathan_Neusch=c3=a4fer?= <j.neuschaefer@gmx.net>,
 linux-fbdev@vger.kernel.org
References: <20230829200253.1473891-1-j.neuschaefer@gmx.net>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230829200253.1473891-1-j.neuschaefer@gmx.net>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------nvOeQaTfZToRoXKsKk00BdEQ"
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Helge Deller <deller@gmx.de>,
 Jingoo Han <jg1.han@samsung.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------nvOeQaTfZToRoXKsKk00BdEQ
Content-Type: multipart/mixed; boundary="------------yrpywtRINvbudJVtaOfp07qV";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?Q?Jonathan_Neusch=c3=a4fer?= <j.neuschaefer@gmx.net>,
 linux-fbdev@vger.kernel.org
Cc: Helge Deller <deller@gmx.de>, Rob Clark <robdclark@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Jingoo Han <jg1.han@samsung.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Message-ID: <d9a02d20-8b59-cbdd-d054-eac14f9771d2@suse.de>
Subject: Re: [PATCH] fbdev: Update fbdev source file paths
References: <20230829200253.1473891-1-j.neuschaefer@gmx.net>
In-Reply-To: <20230829200253.1473891-1-j.neuschaefer@gmx.net>

--------------yrpywtRINvbudJVtaOfp07qV
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjkuMDguMjMgdW0gMjI6MDIgc2NocmllYiBKb25hdGhhbiBOZXVzY2jDpGZl
cjoNCj4gVGhlIGZpbGVzIGZibWVtLmMsIGZiX2RlZmlvLmMsIGZic3lzZnMuYywgZmJtb24u
YywgbW9kZWRiLmMsIGFuZA0KPiBmYmNtYXAuYyB3ZXJlIG1vdmVkIHRvIGRyaXZlcnMvdmlk
ZW8vZmJkZXYsIGFuZCBzdWJzZXF1ZW50bHkgdG8NCj4gZHJpdmVycy92aWRlby9mYmRldi9j
b3JlLCBpbiB0aGUgY29tbWl0cyBsaXN0ZWQgYmVsb3cuDQo+IA0KPiBSZXBvcnRlZCBieSBr
YWxla2FsZSBpbiAja2VybmVsIChMaWJlcmEgSVJDKS4NCj4gDQo+IEZpeGVzOiBmNzAxOGMy
MTM1MDIgKCJ2aWRlbzogbW92ZSBmYmRldiB0byBkcml2ZXJzL3ZpZGVvL2ZiZGV2IikNCj4g
Rml4ZXM6IDE5NzU3ZmM4NDMyYSAoImZiZGV2OiBtb3ZlIGZiZGV2IGNvcmUgZmlsZXMgdG8g
c2VwYXJhdGUgZGlyZWN0b3J5IikNCj4gU2lnbmVkLW9mZi1ieTogSm9uYXRoYW4gTmV1c2No
w6RmZXIgPGoubmV1c2NoYWVmZXJAZ214Lm5ldD4NCg0KSU1ITyB0aGVzZSBjb21tZW50cyBt
aWdodCBqdXN0IGJlIHJlbW92ZWQuDQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCj4gLS0t
DQo+ICAgaW5jbHVkZS9saW51eC9mYi5oIHwgMTIgKysrKysrLS0tLS0tDQo+ICAgMSBmaWxl
IGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYg
LS1naXQgYS9pbmNsdWRlL2xpbnV4L2ZiLmggYi9pbmNsdWRlL2xpbnV4L2ZiLmgNCj4gaW5k
ZXggY2U3ZDU4OGVkYzNlNi4uM2NkYTViOWYyNDY5YiAxMDA2NDQNCj4gLS0tIGEvaW5jbHVk
ZS9saW51eC9mYi5oDQo+ICsrKyBiL2luY2x1ZGUvbGludXgvZmIuaA0KPiBAQCAtNTkyLDcg
KzU5Miw3IEBAIGV4dGVybiBzc2l6ZV90IGZiX3N5c193cml0ZShzdHJ1Y3QgZmJfaW5mbyAq
aW5mbywgY29uc3QgY2hhciBfX3VzZXIgKmJ1ZiwNCj4gICAJX19GQl9ERUZBVUxUX1NZU19P
UFNfRFJBVywgXA0KPiAgIAlfX0ZCX0RFRkFVTFRfU1lTX09QU19NTUFQDQo+IA0KPiAtLyog
ZHJpdmVycy92aWRlby9mYm1lbS5jICovDQo+ICsvKiBkcml2ZXJzL3ZpZGVvL2ZiZGV2L2Nv
cmUvZmJtZW0uYyAqLw0KPiAgIGV4dGVybiBpbnQgcmVnaXN0ZXJfZnJhbWVidWZmZXIoc3Ry
dWN0IGZiX2luZm8gKmZiX2luZm8pOw0KPiAgIGV4dGVybiB2b2lkIHVucmVnaXN0ZXJfZnJh
bWVidWZmZXIoc3RydWN0IGZiX2luZm8gKmZiX2luZm8pOw0KPiAgIGV4dGVybiBpbnQgZmJf
cHJlcGFyZV9sb2dvKHN0cnVjdCBmYl9pbmZvICpmYl9pbmZvLCBpbnQgcm90YXRlKTsNCj4g
QEAgLTYzNiw3ICs2MzYsNyBAQCBzdGF0aWMgaW5saW5lIHZvaWQgX19mYl9wYWRfYWxpZ25l
ZF9idWZmZXIodTggKmRzdCwgdTMyIGRfcGl0Y2gsDQo+ICAgCX0NCj4gICB9DQo+IA0KPiAt
LyogZHJpdmVycy92aWRlby9mYl9kZWZpby5jICovDQo+ICsvKiBkcml2ZXJzL3ZpZGVvL2Zi
ZGV2L2NvcmUvZmJfZGVmaW8uYyAqLw0KPiAgIGludCBmYl9kZWZlcnJlZF9pb19tbWFwKHN0
cnVjdCBmYl9pbmZvICppbmZvLCBzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSk7DQo+ICAg
ZXh0ZXJuIGludCAgZmJfZGVmZXJyZWRfaW9faW5pdChzdHJ1Y3QgZmJfaW5mbyAqaW5mbyk7
DQo+ICAgZXh0ZXJuIHZvaWQgZmJfZGVmZXJyZWRfaW9fb3BlbihzdHJ1Y3QgZmJfaW5mbyAq
aW5mbywNCj4gQEAgLTczNSwxNCArNzM1LDE0IEBAIHN0YXRpYyBpbmxpbmUgYm9vbCBmYl9i
ZV9tYXRoKHN0cnVjdCBmYl9pbmZvICppbmZvKQ0KPiAgICNlbmRpZiAvKiBDT05GSUdfRkJf
Rk9SRUlHTl9FTkRJQU4gKi8NCj4gICB9DQo+IA0KPiAtLyogZHJpdmVycy92aWRlby9mYnN5
c2ZzLmMgKi8NCj4gKy8qIGRyaXZlcnMvdmlkZW8vZmJkZXYvY29yZS9mYnN5c2ZzLmMgKi8N
Cj4gICBleHRlcm4gc3RydWN0IGZiX2luZm8gKmZyYW1lYnVmZmVyX2FsbG9jKHNpemVfdCBz
aXplLCBzdHJ1Y3QgZGV2aWNlICpkZXYpOw0KPiAgIGV4dGVybiB2b2lkIGZyYW1lYnVmZmVy
X3JlbGVhc2Uoc3RydWN0IGZiX2luZm8gKmluZm8pOw0KPiAgIGV4dGVybiBpbnQgZmJfaW5p
dF9kZXZpY2Uoc3RydWN0IGZiX2luZm8gKmZiX2luZm8pOw0KPiAgIGV4dGVybiB2b2lkIGZi
X2NsZWFudXBfZGV2aWNlKHN0cnVjdCBmYl9pbmZvICpoZWFkKTsNCj4gICBleHRlcm4gdm9p
ZCBmYl9ibF9kZWZhdWx0X2N1cnZlKHN0cnVjdCBmYl9pbmZvICpmYl9pbmZvLCB1OCBvZmYs
IHU4IG1pbiwgdTggbWF4KTsNCj4gDQo+IC0vKiBkcml2ZXJzL3ZpZGVvL2ZibW9uLmMgKi8N
Cj4gKy8qIGRyaXZlcnMvdmlkZW8vZmJkZXYvY29yZS9mYm1vbi5jICovDQo+ICAgI2RlZmlu
ZSBGQl9NQVhUSU1JTkdTCQkwDQo+ICAgI2RlZmluZSBGQl9WU1lOQ1RJTUlOR1MJCTENCj4g
ICAjZGVmaW5lIEZCX0hTWU5DVElNSU5HUwkJMg0KPiBAQCAtNzc2LDcgKzc3Niw3IEBAIGV4
dGVybiBpbnQgb2ZfZ2V0X2ZiX3ZpZGVvbW9kZShzdHJ1Y3QgZGV2aWNlX25vZGUgKm5wLA0K
PiAgIGV4dGVybiBpbnQgZmJfdmlkZW9tb2RlX2Zyb21fdmlkZW9tb2RlKGNvbnN0IHN0cnVj
dCB2aWRlb21vZGUgKnZtLA0KPiAgIAkJCQkgICAgICAgc3RydWN0IGZiX3ZpZGVvbW9kZSAq
ZmJtb2RlKTsNCj4gDQo+IC0vKiBkcml2ZXJzL3ZpZGVvL21vZGVkYi5jICovDQo+ICsvKiBk
cml2ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUvbW9kZWRiLmMgKi8NCj4gICAjZGVmaW5lIFZFU0Ff
TU9ERURCX1NJWkUgNDMNCj4gICAjZGVmaW5lIERNVF9TSVpFIDB4NTANCj4gDQo+IEBAIC04
MDIsNyArODAyLDcgQEAgZXh0ZXJuIHZvaWQgZmJfdmlkZW9tb2RlX3RvX21vZGVsaXN0KGNv
bnN0IHN0cnVjdCBmYl92aWRlb21vZGUgKm1vZGVkYiwgaW50IG51bSwNCj4gICBleHRlcm4g
Y29uc3Qgc3RydWN0IGZiX3ZpZGVvbW9kZSAqZmJfZmluZF9iZXN0X2Rpc3BsYXkoY29uc3Qg
c3RydWN0IGZiX21vbnNwZWNzICpzcGVjcywNCj4gICAJCQkJCQkgICAgICAgc3RydWN0IGxp
c3RfaGVhZCAqaGVhZCk7DQo+IA0KPiAtLyogZHJpdmVycy92aWRlby9mYmNtYXAuYyAqLw0K
PiArLyogZHJpdmVycy92aWRlby9mYmRldi9jb3JlL2ZiY21hcC5jICovDQo+ICAgZXh0ZXJu
IGludCBmYl9hbGxvY19jbWFwKHN0cnVjdCBmYl9jbWFwICpjbWFwLCBpbnQgbGVuLCBpbnQg
dHJhbnNwKTsNCj4gICBleHRlcm4gaW50IGZiX2FsbG9jX2NtYXBfZ2ZwKHN0cnVjdCBmYl9j
bWFwICpjbWFwLCBpbnQgbGVuLCBpbnQgdHJhbnNwLCBnZnBfdCBmbGFncyk7DQo+ICAgZXh0
ZXJuIHZvaWQgZmJfZGVhbGxvY19jbWFwKHN0cnVjdCBmYl9jbWFwICpjbWFwKTsNCj4gLS0N
Cj4gMi40MC4xDQo+IA0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2
ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCkZy
YW5rZW5zdHJhc3NlIDE0NiwgOTA0NjEgTnVlcm5iZXJnLCBHZXJtYW55DQpHRjogSXZvIFRv
dGV2LCBBbmRyZXcgTXllcnMsIEFuZHJldyBNY0RvbmFsZCwgQm91ZGllbiBNb2VybWFuDQpI
UkIgMzY4MDkgKEFHIE51ZXJuYmVyZykNCg==

--------------yrpywtRINvbudJVtaOfp07qV--

--------------nvOeQaTfZToRoXKsKk00BdEQ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmTu62IFAwAAAAAACgkQlh/E3EQov+Cm
uBAAq/JU7AkZhy9rNPZ7IbaLWKc3uyP4xQkoximJBypQZMnlCDePcRFzPlz7q0rAVcbgnbNZJvrD
ohLUNfSedWgsB/I0oE3Ngqy5UwJ0gaLk9R0WGNR5agBzAkkALmLAediOw5jD16zSxKRk3hqO5Dku
6IP6dFxSzBIEcoaaNUm1hZaotEbq1pjfotOcAITDgyl3or63gkjzOGm+Dri2JGfz2mZQJt3IuNQY
L8gQgTUUFDTXh2MuVb7pzqcXDl4LqwHTL21JaX0z7pE1yly1o9frcnyRgmmrVXTkLLZEXRWfGMGZ
Ty7QOCLUrD64FYtxFzdD+nenDcRC2RzYEw4xXeogQqHLdhpoqEbUC3MSZe8y8HGiPrgol35gCme1
4/GGsMKOUvf2qtzPq3SycR5+EX9L/xZJaS2kW/SgR7ux1sQ7Hk13yoe6lXcXcmXcuaZyIbs/Cl+o
2JdXdHNMBqRv5NDAxxVH1eeEUqZQvWh8I66nQo767+s1iDbXfmdBnPxju/BHLRgqC9pI4rZ10kR2
jE1Qdtam7WuTKUQCI75G3bo/peVLt4z6yW3Zk9OKi174BvDjsIbqstc10psyQ6EciLwENDiRR2mQ
ywjvSudAofqttmFaUBY6J9XUeQT9VMxKJC6y8bFkJP2OdkRsMzun4o9ZHgxKNGSAqTYn32g7S3O6
sSY=
=EeEj
-----END PGP SIGNATURE-----

--------------nvOeQaTfZToRoXKsKk00BdEQ--
