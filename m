Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AA4E87912D6
	for <lists+dri-devel@lfdr.de>; Mon,  4 Sep 2023 09:59:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 795C810E2DA;
	Mon,  4 Sep 2023 07:59:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30EC110E2DA
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Sep 2023 07:59:43 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D6A5F2187E;
 Mon,  4 Sep 2023 07:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1693814381; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=itOlEXOBgHzjM3fc6x/LffOVqiKxlejyOrTvybtH+ic=;
 b=lMNQ8qiaOytquZauVQ7nq270VexaGIpM98uiR071nkuOTgGcTFm3bSf3mC2SPR0I4GQFf5
 Kv31BC0UrIxhaJXgj/umYGMfr5cAXUeHGrmSXKqI7O/KBO1eLlmyT1byaQRYPFheMb8GGL
 IJBu9wwyAYLPQorLCvI2yzOeO0nH2KA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1693814381;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=itOlEXOBgHzjM3fc6x/LffOVqiKxlejyOrTvybtH+ic=;
 b=n3rS03cBP5iwUmhfgJKurD/5GO//TSI7wx9y/iG8lr38hm2lYY177Kpl+b0Be1FNjL3IBg
 i/lngbRPxJDBpIDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B391C13425;
 Mon,  4 Sep 2023 07:59:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id n7z7Km2O9WSUTAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 04 Sep 2023 07:59:41 +0000
Message-ID: <fec93bb1-9aae-6202-ddaf-520d55892a27@suse.de>
Date: Mon, 4 Sep 2023 09:59:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH] fbdev/g364fb: fix build failure with mips
Content-Language: en-US
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>, Helge Deller <deller@gmx.de>
References: <20230902095102.5908-1-sudip.mukherjee@codethink.co.uk>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230902095102.5908-1-sudip.mukherjee@codethink.co.uk>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------hg0No08ogNLkYqTCo0YGTIT8"
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
Cc: linux-fbdev@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------hg0No08ogNLkYqTCo0YGTIT8
Content-Type: multipart/mixed; boundary="------------hUYgt0w3QWpZfLDtaCwyTaaZ";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>, Helge Deller <deller@gmx.de>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <fec93bb1-9aae-6202-ddaf-520d55892a27@suse.de>
Subject: Re: [PATCH] fbdev/g364fb: fix build failure with mips
References: <20230902095102.5908-1-sudip.mukherjee@codethink.co.uk>
In-Reply-To: <20230902095102.5908-1-sudip.mukherjee@codethink.co.uk>

--------------hUYgt0w3QWpZfLDtaCwyTaaZ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDIuMDkuMjMgdW0gMTE6NTEgc2NocmllYiBTdWRpcCBNdWtoZXJqZWU6DQo+
IEZyb206IFN1ZGlwIE11a2hlcmplZSA8c3VkaXBtLm11a2hlcmplZUBnbWFpbC5jb20+DQo+
IA0KPiBGaXggdGhlIHR5cG8gd2hpY2ggcmVzdWx0ZWQgaW4gdGhlIGRyaXZlciB1c2luZyBG
Ql9ERUZBVUxUX0lPTUVNX0hFTFBFUlMNCj4gaW5zdGVhZCBvZiBGQl9ERUZBVUxUX0lPTUVN
X09QUyBhcyB0aGUgZmJkZXYgSS9PIGhlbHBlcnMuDQo+IA0KPiBGaXhlczogNTAxMTI2MDgz
ODU1ICgiZmJkZXYvZzM2NGZiOiBVc2UgZmJkZXYgSS9PIGhlbHBlcnMiKQ0KPiBTdWdnZXN0
ZWQtYnk6IExpbnVzIFRvcnZhbGRzIDx0b3J2YWxkc0BsaW51eC1mb3VuZGF0aW9uLm9yZz4N
Cj4gU2lnbmVkLW9mZi1ieTogU3VkaXAgTXVraGVyamVlIDxzdWRpcG0ubXVraGVyamVlQGdt
YWlsLmNvbT4NCg0KTWVyZ2VkIGludG8gZHJtLW1pc2MtbmV4dC1maXhlcy4gVGhhbmtzIGZv
ciB0aGUgcGF0Y2guDQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCj4gLS0tDQo+ICAgZHJp
dmVycy92aWRlby9mYmRldi9nMzY0ZmIuYyB8IDIgKy0NCj4gICAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL3ZpZGVvL2ZiZGV2L2czNjRmYi5jIGIvZHJpdmVycy92aWRlby9mYmRldi9nMzY0ZmIu
Yw0KPiBpbmRleCA3YTEwMTNiMjJmYTcuLmVlNmZlNTFlMGE2YiAxMDA2NDQNCj4gLS0tIGEv
ZHJpdmVycy92aWRlby9mYmRldi9nMzY0ZmIuYw0KPiArKysgYi9kcml2ZXJzL3ZpZGVvL2Zi
ZGV2L2czNjRmYi5jDQo+IEBAIC0xMTIsNyArMTEyLDcgQEAgc3RhdGljIGludCBnMzY0ZmJf
YmxhbmsoaW50IGJsYW5rLCBzdHJ1Y3QgZmJfaW5mbyAqaW5mbyk7DQo+ICAgDQo+ICAgc3Rh
dGljIGNvbnN0IHN0cnVjdCBmYl9vcHMgZzM2NGZiX29wcyA9IHsNCj4gICAJLm93bmVyCQk9
IFRISVNfTU9EVUxFLA0KPiAtCUZCX0RFRkFVTFRfSU9NRU1fSEVMUEVSUywNCj4gKwlGQl9E
RUZBVUxUX0lPTUVNX09QUywNCj4gICAJLmZiX3NldGNvbHJlZwk9IGczNjRmYl9zZXRjb2xy
ZWcsDQo+ICAgCS5mYl9wYW5fZGlzcGxheQk9IGczNjRmYl9wYW5fZGlzcGxheSwNCj4gICAJ
LmZiX2JsYW5rCT0gZzM2NGZiX2JsYW5rLA0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpH
cmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJt
YW55IEdtYkgNCkZyYW5rZW5zdHJhc3NlIDE0NiwgOTA0NjEgTnVlcm5iZXJnLCBHZXJtYW55
DQpHRjogSXZvIFRvdGV2LCBBbmRyZXcgTXllcnMsIEFuZHJldyBNY0RvbmFsZCwgQm91ZGll
biBNb2VybWFuDQpIUkIgMzY4MDkgKEFHIE51ZXJuYmVyZykNCg==

--------------hUYgt0w3QWpZfLDtaCwyTaaZ--

--------------hg0No08ogNLkYqTCo0YGTIT8
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmT1jmwFAwAAAAAACgkQlh/E3EQov+Ag
9RAAp1IqnqvhGXEkDqLFVAloXH1SHYI+sXiMaJh89QkTvycg2tizUe0qxAxl5bzemCiWriVnc1cA
8TWDKks2J8Iq0Xdpv4LT8wXOUijN4+tno8E0ADM66MPx02sZHMKfzIu2nDDLZ4axBFfX0xHtXhLE
q2pX99QdylkxILrd9mu41bjQ4mDfjCkctWFPZukGQ+pkzKb6qCc8sqLL8Tbr92V3Vcu9Dbqt0vcx
cV9pf/Z1xFdIi1yIu65cwlFH9U56xmgNvD0E9ZvOgKDN0H7HwvUyc1Ze5aXoY8xNwFto7SNso2vI
oGpUYXt+4AdAM83u6ZxjNjPQ3AKSHXQ9GQq2gaEVHwLP7dIc7I/THoBz/fS+xd6QsmNdND4nLgC5
jeJZT22nEB+5IHxw6NdLge4uBZ2k765frSScybTaG000b9/nGbf+25k2xbh2UTUOdtGeadxhe+hY
+og41RRWCCc/CXSvInmwb5rcAdL+FkvYC/6y0PBjjh4/n2l6v3GnPuCxGeOEfGcJspMmUIcFIDJo
D6UABPke056ejIyT0MkQa1Jjc6XSClXulvQcMYEUbyrZmwJ/bUQB9wBIAP58F/OCUiGPa9XlTso4
6DW9hewSyrKdQrA7L5vIjk57u9QDZ4JSPHaurgLNs7x7g9V1TIRNSuqBgKxHNjYVYLKGeBMMbI/R
3Ds=
=c8cp
-----END PGP SIGNATURE-----

--------------hg0No08ogNLkYqTCo0YGTIT8--
