Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A6BDF48A9CF
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jan 2022 09:48:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F129113BC9;
	Tue, 11 Jan 2022 08:48:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 110B4113BC1
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jan 2022 08:48:56 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 78EDE1F3B1;
 Tue, 11 Jan 2022 08:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1641890934; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ae85kK6BnZbxl/5Vwhrar2UY5uMB87Mm787pXnif4kA=;
 b=uwE9eMRgDuPc/FH54RATgipfWFIy0ewY0W720XRVE4ok+lcjYuxiLFPrd+3fxk15YvfID5
 j8GDKW804nCRt2n6HuQhGTI+Hq+/bs1FovsQgT7wqWaCtGHkfti+XIHU0yytElKbAcBr3G
 s+BnlAtMhO5Cgazfs7MZkuIuL31Ho8E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1641890934;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ae85kK6BnZbxl/5Vwhrar2UY5uMB87Mm787pXnif4kA=;
 b=AozBGFOcqeZ7Zg/qNfnpIUHOMzWRBfjzKikm01WJp7YNnRrmuQKupuKdc9Bwr7oN2JlpM/
 g8Q0oLmC+IXEXzAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 56A1213AC9;
 Tue, 11 Jan 2022 08:48:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 4XV/E3ZE3WF8IAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 11 Jan 2022 08:48:54 +0000
Message-ID: <3e38a73b-c34a-dcbf-27d8-125c1544813c@suse.de>
Date: Tue, 11 Jan 2022 09:48:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH] dma-buf-map: Fix dot vs comma in example
Content-Language: en-US
To: Lucas De Marchi <lucas.demarchi@intel.com>, dri-devel@lists.freedesktop.org
References: <20220111003305.1214667-1-lucas.demarchi@intel.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220111003305.1214667-1-lucas.demarchi@intel.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------1DtxnuDFso1uMlneghfyjdmR"
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
Cc: christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------1DtxnuDFso1uMlneghfyjdmR
Content-Type: multipart/mixed; boundary="------------RQA42xc1aYu4ZxgPSxcvBmcF";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 dri-devel@lists.freedesktop.org
Cc: sumit.semwal@linaro.org, christian.koenig@amd.com
Message-ID: <3e38a73b-c34a-dcbf-27d8-125c1544813c@suse.de>
Subject: Re: [PATCH] dma-buf-map: Fix dot vs comma in example
References: <20220111003305.1214667-1-lucas.demarchi@intel.com>
In-Reply-To: <20220111003305.1214667-1-lucas.demarchi@intel.com>

--------------RQA42xc1aYu4ZxgPSxcvBmcF
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTEuMDEuMjIgdW0gMDE6MzMgc2NocmllYiBMdWNhcyBEZSBNYXJjaGk6DQo+
IEZpeCB0eXBvOiBzZXBhcmF0ZSBhcmd1bWVudHMgd2l0aCBjb21tYSByYXRoZXIgdGhhbiBk
b3QuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBMdWNhcyBEZSBNYXJjaGkgPGx1Y2FzLmRlbWFy
Y2hpQGludGVsLmNvbT4NCg0KVGhhbmsgeW91LiBJdCdzIGluIGRybS1taXNjLW5leHQuDQoN
CkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCj4gLS0tDQo+ICAgaW5jbHVkZS9saW51eC9kbWEt
YnVmLW1hcC5oIHwgNCArKy0tDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygr
KSwgMiBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L2Rt
YS1idWYtbWFwLmggYi9pbmNsdWRlL2xpbnV4L2RtYS1idWYtbWFwLmgNCj4gaW5kZXggMjc4
ZDQ4OWU0YmRkLi4xOWZhMGI1YWU1ZWMgMTAwNjQ0DQo+IC0tLSBhL2luY2x1ZGUvbGludXgv
ZG1hLWJ1Zi1tYXAuaA0KPiArKysgYi9pbmNsdWRlL2xpbnV4L2RtYS1idWYtbWFwLmgNCj4g
QEAgLTUyLDEzICs1MiwxMyBAQA0KPiAgICAqDQo+ICAgICoJc3RydWN0IGRtYV9idWZfbWFw
IG1hcCA9IERNQV9CVUZfTUFQX0lOSVRfVkFERFIoMHhkZWFkYmVhZik7DQo+ICAgICoNCj4g
LSAqCWRtYV9idWZfbWFwX3NldF92YWRkcigmbWFwLiAweGRlYWRiZWFmKTsNCj4gKyAqCWRt
YV9idWZfbWFwX3NldF92YWRkcigmbWFwLCAweGRlYWRiZWFmKTsNCj4gICAgKg0KPiAgICAq
IFRvIHNldCBhbiBhZGRyZXNzIGluIEkvTyBtZW1vcnksIHVzZSBkbWFfYnVmX21hcF9zZXRf
dmFkZHJfaW9tZW0oKS4NCj4gICAgKg0KPiAgICAqIC4uIGNvZGUtYmxvY2s6OiBjDQo+ICAg
ICoNCj4gLSAqCWRtYV9idWZfbWFwX3NldF92YWRkcl9pb21lbSgmbWFwLiAweGRlYWRiZWFm
KTsNCj4gKyAqCWRtYV9idWZfbWFwX3NldF92YWRkcl9pb21lbSgmbWFwLCAweGRlYWRiZWFm
KTsNCj4gICAgKg0KPiAgICAqIEluc3RhbmNlcyBvZiBzdHJ1Y3QgZG1hX2J1Zl9tYXAgZG8g
bm90IGhhdmUgdG8gYmUgY2xlYW5lZCB1cCwgYnV0DQo+ICAgICogY2FuIGJlIGNsZWFyZWQg
dG8gTlVMTCB3aXRoIGRtYV9idWZfbWFwX2NsZWFyKCkuIENsZWFyZWQgbWFwcGluZ3MNCg0K
LS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VT
RSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQw
OSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2No
w6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCg==

--------------RQA42xc1aYu4ZxgPSxcvBmcF--

--------------1DtxnuDFso1uMlneghfyjdmR
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmHdRHUFAwAAAAAACgkQlh/E3EQov+Dy
KhAAiYLiT8D4kiQgwlvhK5mGzPdck/xtuzCFw3DxlB5TNbXsmn7iK3D3GMtmpBZ+y4DnoPvzOXhl
rSJx6kAoScw3TCyTJI9d2aDg83ixlmcWtGTwzgh2zK6V8kD1S1h2WcBHOnszF7RJKIYLEibNNZnQ
73dOriK4/GQiCSwu5xecKUmHB5WdKWk7ejF/ClgeROB1GQfCvZGk0IVFAq2vMNW0tmKm8krAey1o
P6z2itZUKQpJPec6DJM7OxQk5Gn/r5Levvjccxj3WE+PknTm2IZJqWwNNmV/fWcdjspHNE+ElhtS
Rt56srgQ7QZ/AIH+ea10OoWm0rspqqzEQ5wFuqSM2BvX4F64hIA1uMAesYZFbQG+QVTWDh8zK8n3
rSR4b8rT62Ua7kOIwTk9QNGs5/sTbeT19Jsd2wN6uC22NlfFUfRVv0aiARRasXuTzQckF31elSEa
phAnnLGbWHrk7VCAtcMCcnR0aEHGvO/fUu7w1MhoghbCTp1DgKnLGi9fuIdtY9e81Fen94ej6xFi
Ll7Cu09I+G07kqcXRgn+Zvq3EbLB7gu1v62N35nvvwPAo4Uga5P2kJCRn8yMGJuKWMlPLlMfxTzU
c+mDiHolsdAdVUfqFseHaCQRwp1l0XyyVONv41OX1jOcSWOG17vwI9v4PazUYdVaKmitWCNGL29k
bWw=
=mpfM
-----END PGP SIGNATURE-----

--------------1DtxnuDFso1uMlneghfyjdmR--
