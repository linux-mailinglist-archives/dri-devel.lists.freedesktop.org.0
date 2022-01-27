Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FF5F49E696
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jan 2022 16:47:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD1AD10E141;
	Thu, 27 Jan 2022 15:47:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39CC810E141;
 Thu, 27 Jan 2022 15:47:36 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D744A218E0;
 Thu, 27 Jan 2022 15:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1643298454; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+vP9uTIY82Dbgh4OnhK1t5VpViTbmtj8NcTwryOoqVI=;
 b=0tldqExYu5HRjn55YYsjoQTjKFe5w81lE5hkCRLwymPGhF+Eb3oCR+J8GYPQ2OoxmE82fj
 Ne9TwLoC4ELd1op/TY/BExlG8jSd/+ljdTb7UNlFi9n+UBfmt0Il88mC37yrkuRKeFxmCN
 T16Wr+vlpNUwfmi7Xqd9+QNNRcCCeV4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1643298454;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+vP9uTIY82Dbgh4OnhK1t5VpViTbmtj8NcTwryOoqVI=;
 b=tn/QnQwq8eUasdJrFNQDEjuFlp2bzjl7Uo4gngbtuvwnSBAhdzbJZJU0RegNwmmISsxoIx
 cbGTq2A3hauwyICA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id ACB7213BE5;
 Thu, 27 Jan 2022 15:47:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id bsBjKJa+8mHgawAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 27 Jan 2022 15:47:34 +0000
Message-ID: <a054b56c-b4d0-6834-f6e3-b840a36b989c@suse.de>
Date: Thu, 27 Jan 2022 16:47:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [Intel-gfx] [PATCH 09/19] dma-buf-map: Add wrapper over memset
Content-Language: en-US
To: Lucas De Marchi <lucas.demarchi@intel.com>
References: <20220126203702.1784589-1-lucas.demarchi@intel.com>
 <20220126203702.1784589-10-lucas.demarchi@intel.com>
 <7cb8a8a2-718d-6d5c-5de6-05bf990dd479@suse.de>
 <20220127153838.eefwiqkljdplyfd4@ldmartin-desk2>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220127153838.eefwiqkljdplyfd4@ldmartin-desk2>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------ZvhGQJQbnyq42uNGrtDzqZns"
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
Cc: intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------ZvhGQJQbnyq42uNGrtDzqZns
Content-Type: multipart/mixed; boundary="------------tDO7FIcbOp5V2EEKbWadvqLx";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Message-ID: <a054b56c-b4d0-6834-f6e3-b840a36b989c@suse.de>
Subject: Re: [Intel-gfx] [PATCH 09/19] dma-buf-map: Add wrapper over memset
References: <20220126203702.1784589-1-lucas.demarchi@intel.com>
 <20220126203702.1784589-10-lucas.demarchi@intel.com>
 <7cb8a8a2-718d-6d5c-5de6-05bf990dd479@suse.de>
 <20220127153838.eefwiqkljdplyfd4@ldmartin-desk2>
In-Reply-To: <20220127153838.eefwiqkljdplyfd4@ldmartin-desk2>

--------------tDO7FIcbOp5V2EEKbWadvqLx
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQoNCkFtIDI3LjAxLjIyIHVtIDE2OjM4IHNjaHJpZWIgTHVjYXMgRGUgTWFyY2hpOg0KPiBP
biBUaHUsIEphbiAyNywgMjAyMiBhdCAwMzo1NDoyMVBNICswMTAwLCBUaG9tYXMgWmltbWVy
bWFubiB3cm90ZToNCj4+IEhpDQo+Pg0KPj4gQW0gMjYuMDEuMjIgdW0gMjE6MzYgc2Nocmll
YiBMdWNhcyBEZSBNYXJjaGk6DQo+Pj4gSnVzdCBsaWtlIG1lbWNweV90b2lvKCksIHRoZXJl
IGlzIGFsc28gbmVlZCB0byB3cml0ZSBhIGRpcmVjdCB2YWx1ZSB0byBhDQo+Pj4gbWVtb3J5
IGJsb2NrLiBBZGQgZG1hX2J1Zl9tYXBfbWVtc2V0KCkgdG8gYWJzdHJhY3QgbWVtc2V0KCkg
dnMgDQo+Pj4gbWVtc2V0X2lvKCkNCj4+Pg0KPj4+IENjOiBNYXR0IFJvcGVyIDxtYXR0aGV3
LmQucm9wZXJAaW50ZWwuY29tPg0KPj4+IENjOiBTdW1pdCBTZW13YWwgPHN1bWl0LnNlbXdh
bEBsaW5hcm8ub3JnPg0KPj4+IENjOiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29l
bmlnQGFtZC5jb20+DQo+Pj4gQ2M6IGxpbnV4LW1lZGlhQHZnZXIua2VybmVsLm9yZw0KPj4+
IENjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+Pj4gQ2M6IGxpbmFyby1t
bS1zaWdAbGlzdHMubGluYXJvLm9yZw0KPj4+IENjOiBsaW51eC1rZXJuZWxAdmdlci5rZXJu
ZWwub3JnDQo+Pj4gU2lnbmVkLW9mZi1ieTogTHVjYXMgRGUgTWFyY2hpIDxsdWNhcy5kZW1h
cmNoaUBpbnRlbC5jb20+DQo+Pj4gLS0tDQo+Pj4gwqBpbmNsdWRlL2xpbnV4L2RtYS1idWYt
bWFwLmggfCAxNyArKysrKysrKysrKysrKysrKw0KPj4+IMKgMSBmaWxlIGNoYW5nZWQsIDE3
IGluc2VydGlvbnMoKykNCj4+Pg0KPj4+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L2Rt
YS1idWYtbWFwLmggYi9pbmNsdWRlL2xpbnV4L2RtYS1idWYtbWFwLmgNCj4+PiBpbmRleCAz
NTE0YTg1OWY2MjguLmM5ZmIwNDI2NGNkMCAxMDA2NDQNCj4+PiAtLS0gYS9pbmNsdWRlL2xp
bnV4L2RtYS1idWYtbWFwLmgNCj4+PiArKysgYi9pbmNsdWRlL2xpbnV4L2RtYS1idWYtbWFw
LmgNCj4+PiBAQCAtMzE3LDYgKzMxNywyMyBAQCBzdGF0aWMgaW5saW5lIHZvaWQgZG1hX2J1
Zl9tYXBfbWVtY3B5X3RvKHN0cnVjdCANCj4+PiBkbWFfYnVmX21hcCAqZHN0LCBjb25zdCB2
b2lkICpzcg0KPj4+IMKgwqDCoMKgwqDCoMKgwqAgbWVtY3B5KGRzdC0+dmFkZHIsIHNyYywg
bGVuKTsNCj4+PiDCoH0NCj4+PiArLyoqDQo+Pj4gKyAqIGRtYV9idWZfbWFwX21lbXNldCAt
IE1lbXNldCBpbnRvIGRtYS1idWYgbWFwcGluZw0KPj4+ICsgKiBAZHN0OsKgwqDCoCBUaGUg
ZG1hLWJ1ZiBtYXBwaW5nIHN0cnVjdHVyZQ0KPj4+ICsgKiBAdmFsdWU6wqDCoMKgIFRoZSB2
YWx1ZSB0byBzZXQNCj4+PiArICogQGxlbjrCoMKgwqAgVGhlIG51bWJlciBvZiBieXRlcyB0
byBzZXQgaW4gZHN0DQo+Pj4gKyAqDQo+Pj4gKyAqIFNldCB2YWx1ZSBpbiBkbWEtYnVmIG1h
cHBpbmcuIERlcGVuZGluZyBvbiB0aGUgYnVmZmVyJ3MgbG9jYXRpb24sIA0KPj4+IHRoZSBo
ZWxwZXINCj4+PiArICogcGlja3MgdGhlIGNvcnJlY3QgbWV0aG9kIG9mIGFjY2Vzc2luZyB0
aGUgbWVtb3J5Lg0KPj4+ICsgKi8NCj4+PiArc3RhdGljIGlubGluZSB2b2lkIGRtYV9idWZf
bWFwX21lbXNldChzdHJ1Y3QgZG1hX2J1Zl9tYXAgKmRzdCwgaW50IA0KPj4+IHZhbHVlLCBz
aXplX3QgbGVuKQ0KPj4+ICt7DQo+Pj4gK8KgwqDCoCBpZiAoZHN0LT5pc19pb21lbSkNCj4+
PiArwqDCoMKgwqDCoMKgwqAgbWVtc2V0X2lvKGRzdC0+dmFkZHJfaW9tZW0sIHZhbHVlLCBs
ZW4pOw0KPj4+ICvCoMKgwqAgZWxzZQ0KPj4+ICvCoMKgwqDCoMKgwqDCoCBtZW1zZXQoZHN0
LT52YWRkciwgdmFsdWUsIGxlbik7DQo+Pj4gK30NCj4+DQo+PiBNYXliZSBhZGQgYW4gb2Zm
c2V0IHBhcmFtZXRlciBoZXJlLg0KPiANCj4geWVwLCBvbiB2MiBJIHdpbGwgaGF2ZSAyIEFQ
SXMsIG9uZSB3aXRoIGFuZCBvbmUgd2l0aG91dCBvZmZzZXQuDQoNClBsZWFzZSwgbm8uIEp1
c3QgYWRkIHRoZSBwYXJhbWV0ZXIgaGVyZSBhbmQgcGFzcyAwIGlmIHlvIGRvbid0IG5lZWQg
aXQuDQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCj4gDQo+IHRoYW5rcw0KPiBMdWNhcyBE
ZSBNYXJjaGkNCj4gDQo+Pg0KPj4gQmVzdCByZWdhcmRzDQo+PiBUaG9tYXMNCj4+DQo+Pj4g
Kw0KPj4+IMKgLyoqDQo+Pj4gwqAgKiBkbWFfYnVmX21hcF9pbmNyIC0gSW5jcmVtZW50cyB0
aGUgYWRkcmVzcyBzdG9yZWQgaW4gYSBkbWEtYnVmIA0KPj4+IG1hcHBpbmcNCj4+PiDCoCAq
IEBtYXA6wqDCoMKgIFRoZSBkbWEtYnVmIG1hcHBpbmcgc3RydWN0dXJlDQo+Pg0KPj4gLS0g
DQo+PiBUaG9tYXMgWmltbWVybWFubg0KPj4gR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0K
Pj4gU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQo+PiBNYXhmZWxkc3Ry
LiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCj4+IChIUkIgMzY4MDksIEFHIE7DvHJu
YmVyZykNCj4+IEdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCj4gDQo+IA0KPiANCg0K
LS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VT
RSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQw
OSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2No
w6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCg==

--------------tDO7FIcbOp5V2EEKbWadvqLx--

--------------ZvhGQJQbnyq42uNGrtDzqZns
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmHyvpYFAwAAAAAACgkQlh/E3EQov+C0
Sg//XhXcCFEn7XFyDrnPyrgg7n16fb+F5S/TBqw3jbCoGyV058TF739al387Ck+RMuYjSEOLz8uR
9vzeW70jSNmGDKEeX+WIaPofI6i1OlOCmy3dqhdw1YvzOrfbC3QElAkU/f/dKIFSDFgbyfRvzHIJ
evjeHIQEiTD/+9xCMZNOrp7xXRgnpvdnTARRKAGP8ovo0v2y5USUCDQaSE8dPBksqGd8Uejw07Kt
LqluYXmL8FVK7cynl1lUzt6VqJOz94Ok3+9oIC3nN1DOqz6ziAh1/ahNRVQNhnEueIRx3FgMxq+L
14f4OBtePw+oUBq/K41uOyLZBMYK466JmH/u2sTL87P/F/gMHMV3auN8KUJWGqfFYqLmUCbOQNR1
D9d75oF+7lgbDf04xmK4VpViGzmJ6e1yosRORJkNGyHagJaPI0b7WuMdgbXC8zBnr4/IYsl/+iZy
tAimAaCJk9iA7+5l5ugjdAIvge5o1Lx+VFLZ8IeqgjfL1LaOT0rn9XtOLBw/nGOi01rxvs2LSqB1
qK4vyvhAvlfu+8xZMgt0rgT8kQRCqC2fiSExeb6zW2wgX2IwVM4fQ3P+H6+2uz4BLf2a/ATbkfLB
KRnMgNIgocxzhG1Z2PCphbu2qp46EQBZEVcWTIaOuiHO4rpTalG+cmad2Set2YgtcDa/YXci1dJa
jL4=
=YOOJ
-----END PGP SIGNATURE-----

--------------ZvhGQJQbnyq42uNGrtDzqZns--
