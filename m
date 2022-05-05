Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B15C51B9D2
	for <lists+dri-devel@lfdr.de>; Thu,  5 May 2022 10:16:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33CA310F8C1;
	Thu,  5 May 2022 08:16:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99B9210F8C1
 for <dri-devel@lists.freedesktop.org>; Thu,  5 May 2022 08:16:15 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 48490210DF;
 Thu,  5 May 2022 08:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1651738574; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ut8/qqTmUKlM0tOl3dafNDIaxDtu0vyvH3CopX/1BP4=;
 b=pWfo2m7ZPESUs+ntDLLrjP910xLBMRgubroL476yM/qWdjH9crbqerJUyP19BhBljXyNE1
 thJ5GNDTN6n0qZsTNjbjHLZxE5oHazDG3il1+VB8tIZFHVgYscZc6IdCimWb2wzi0BIG8a
 En3rdP/lb3/79boXndEoY927Z7nBAUQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1651738574;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ut8/qqTmUKlM0tOl3dafNDIaxDtu0vyvH3CopX/1BP4=;
 b=15JBMYyNGjvxW6Px3i9yZgs1OWE/I7UFkm7CkUegKkHLjJIUjQAxUQM2di/mAqA31rpkfs
 TCzXLzXatmjMAWDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0B0D013B11;
 Thu,  5 May 2022 08:16:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id TqH6AM6Hc2J4BwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 05 May 2022 08:16:14 +0000
Message-ID: <e0bc775a-f17a-adf1-9b2c-4be91468b7f8@suse.de>
Date: Thu, 5 May 2022 10:16:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 0/3] fbdev: Fix use-after-free caused by wrong fb_info
 cleanup in drivers
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org
References: <20220504215151.55082-1-javierm@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220504215151.55082-1-javierm@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------xFbIBL0fJcIQ9BMEk6s0gh0K"
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
Cc: Hans de Goede <hdegoede@redhat.com>, linux-fbdev@vger.kernel.org,
 Peter Jones <pjones@redhat.com>, Helge Deller <deller@gmx.de>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------xFbIBL0fJcIQ9BMEk6s0gh0K
Content-Type: multipart/mixed; boundary="------------DBYed24fSP6uciqwCRv25OkH";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org
Cc: linux-fbdev@vger.kernel.org, Helge Deller <deller@gmx.de>,
 dri-devel@lists.freedesktop.org, Hans de Goede <hdegoede@redhat.com>,
 Peter Jones <pjones@redhat.com>
Message-ID: <e0bc775a-f17a-adf1-9b2c-4be91468b7f8@suse.de>
Subject: Re: [PATCH 0/3] fbdev: Fix use-after-free caused by wrong fb_info
 cleanup in drivers
References: <20220504215151.55082-1-javierm@redhat.com>
In-Reply-To: <20220504215151.55082-1-javierm@redhat.com>

--------------DBYed24fSP6uciqwCRv25OkH
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDQuMDUuMjIgdW0gMjM6NTEgc2NocmllYiBKYXZpZXIgTWFydGluZXogQ2Fu
aWxsYXM6DQo+IEhlbGxvLA0KPiANCj4gVGhpcyBzZXJpZXMgY29udGFpbnMgcGF0Y2hlcyBz
dWdnZXN0ZWQgYnkgRGFuaWVsIFZldHRlciB0byBmaXggYSB1c2UtYWZ0ZXItZnJlZQ0KPiBl
cnJvciBpbiB0aGUgZmJfcmVsZWFzZSgpIGZ1bmN0aW9uLCBkdWUgYSBmYl9pbmZvIGFzc29j
aWF0ZWQgd2l0aCBhIGZiZGV2IGJlaW5nDQo+IGZyZWVkIHRvbyBlYXJseSB3aGlsZSBhIHVz
ZXItc3BhY2UgcHJvY2VzcyBzdGlsbCBoYXMgdGhlIGZiZGV2IGRldiBub2RlIG9wZW5lZC4N
Cj4gDQo+IFRoZSBpcyBjdXVzZWQgYnkgYSB3cm9uZyBtYW5hZ2VtZW50IG9mIHRoZSBzdHJ1
Y3QgZmJfaW5mbyBsaWZldGltZSBpbiBkcml2ZXJzLA0KPiBidXQgdGhlIGZiZGV2IGNvcmUg
Y2FuIGFsc28gYmUgbWFkZSBtb3JlIHJlc2lsaWVudCBhYm91dCBpdCBhbiBsZWFrDQo+IA0K
PiBUaGlzIGNhbiBlYXNpbHkgYmUgcmVwcm9kdWNlZCB3aXRoIHRoZSBzaW1wbGVmYiBkcml2
ZXIgZG9pbmcgdGhlIGZvbGxvd2luZzoNCj4gDQo+ICQgY2F0IDwgL2Rldi9mYjAgJg0KPiAk
IGVjaG8gc2ltcGxlLWZyYW1lYnVmZmVyLjAgPiAvc3lzL2J1cy9wbGF0Zm9ybS9kcml2ZXJz
L3NpbXBsZS1mcmFtZWJ1ZmZlci91bmJpbmQNCj4gJCBraWxsICUxDQo+IA0KPiBbICAyNTcu
NDkwNDcxXSAtLS0tLS0tLS0tLS1bIGN1dCBoZXJlIF0tLS0tLS0tLS0tLS0NCj4gLi4uDQo+
IFsgIDI1Ny40OTUxMjVdIHJlZmNvdW50X3Q6IHVuZGVyZmxvdzsgdXNlLWFmdGVyLWZyZWUu
DQo+IFsgIDI1Ny40OTUyMjJdIFdBUk5JTkc6IENQVTogMCBQSUQ6IDk3NSBhdCBsaWIvcmVm
Y291bnQuYzoyOCByZWZjb3VudF93YXJuX3NhdHVyYXRlKzB4ZjQvMHgxNDQNCj4gLi4uDQo+
IFsgIDI1Ny42Mzc0ODJdIHBzdGF0ZTogODA0MDAwMDUgKE56Y3YgZGFpZiArUEFOIC1VQU8g
LVRDTyAtRElUIC1TU0JTIEJUWVBFPS0tKQ0KPiBbICAyNTcuNjQ0NDQxXSBwYyA6IHJlZmNv
dW50X3dhcm5fc2F0dXJhdGUrMHhmNC8weDE0NA0KPiBbICAyNTcuNjQ5MjI2XSBsciA6IHJl
ZmNvdW50X3dhcm5fc2F0dXJhdGUrMHhmNC8weDE0NA0KPiBbICAyNTcuNjU0MDA5XSBzcCA6
IGZmZmY4MDAwMGEwNmJiZjANCj4gWyAgMjU3LjY1NzMxNV0geDI5OiBmZmZmODAwMDBhMDZi
YmYwIHgyODogMDAwMDAwMDAwMDAwMDAwYSB4Mjc6IDAwMDAwMDAwMDAwMDAwMGENCj4gWyAg
MjU3LjY2NDQ0OF0geDI2OiAwMDAwMDAwMDAwMDAwMDAwIHgyNTogZmZmZjQ3MGI4OGM2YTE4
MCB4MjQ6IDAwMDAwMDAwMDAwMDAwMGENCj4gWyAgMjU3LjY3MTU4MV0geDIzOiBmZmZmNDcw
YjgxNzA2NDgwIHgyMjogZmZmZjQ3MGI4MDhjMjE2MCB4MjE6IGZmZmY0NzBiODkyMmJhMjAN
Cj4gWyAgMjU3LjY3ODcxM10geDIwOiBmZmZmNDcwYjg5MWY1ODEwIHgxOTogZmZmZjQ3MGI4
OTFmNTgwMCB4MTg6IGZmZmZmZmZmZmZmZmZmZmYNCj4gWyAgMjU3LjY4NTg0Nl0geDE3OiAz
YTcyNWY3NDYzNjU2YTYyIHgxNjogZmZmZmJiMThjNjQ2NWZkNCB4MTU6IDA3MjAwNzIwMDcy
MDA3MjANCj4gWyAgMjU3LjY5Mjk3OF0geDE0OiAwNzIwMDcyZDA3MmQwNzJkIHgxMzogMGEy
ZTY1NjU3MjY2MmQ3MiB4MTI6IDY1NzQ2NjYxMmQ2NTczNzUNCj4gWyAgMjU3LjcwMDExMF0g
eDExOiAyMDNiNzc2ZjZjNjY3MjY1IHgxMDogNjQ2ZTc1MjAzYTc0NWY3NCB4OSA6IGZmZmZi
YjE4YzU4ZjZjOTANCj4gWyAgMjU3LjcwNzI0Ml0geDggOiA3NTIwM2I3NzZmNmM2NjcyIHg3
IDogNjU2NDZlNzUyMDNhNzQ1ZiB4NiA6IDAwMDAwMDAwMDAwMDAwMDENCj4gWyAgMjU3Ljcx
NDM3M10geDUgOiBmZmZmNDcwYmZmOGVjNDE4IHg0IDogMDAwMDAwMDAwMDAwMDAwMCB4MyA6
IDAwMDAwMDAwMDAwMDAwMjcNCj4gWyAgMjU3LjcyMTUwNl0geDIgOiAwMDAwMDAwMDAwMDAw
MDAwIHgxIDogMDAwMDAwMDAwMDAwMDAyNyB4MCA6IDAwMDAwMDAwMDAwMDAwMjYNCj4gWyAg
MjU3LjcyODYzOF0gQ2FsbCB0cmFjZToNCj4gWyAgMjU3LjczMTA3NV0gIHJlZmNvdW50X3dh
cm5fc2F0dXJhdGUrMHhmNC8weDE0NA0KPiBbICAyNTcuNzM1NTEzXSAgcHV0X2ZiX2luZm8r
MHg3MC8weDdjDQo+IFsgIDI1Ny43Mzg5MTZdICBmYl9yZWxlYXNlKzB4NjAvMHg3NA0KPiBb
ICAyNTcuNzQyMjI1XSAgX19mcHV0KzB4ODgvMHgyNDANCj4gWyAgMjU3Ljc0NTI3Nl0gIF9f
X19mcHV0KzB4MWMvMHgzMA0KPiBbICAyNTcuNzQ4NDEwXSAgdGFza193b3JrX3J1bisweGM0
LzB4MjFjDQo+IFsgIDI1Ny43NTIwNjZdICBkb19leGl0KzB4MTcwLzB4MzcwDQo+IFsgIDI1
Ny43NTUyODhdICBkb19ncm91cF9leGl0KzB4NDAvMHhiNA0KPiBbICAyNTcuNzU4ODU4XSAg
Z2V0X3NpZ25hbCsweDhlMC8weDkwYw0KPiBbICAyNTcuNzYyMzM5XSAgZG9fc2lnbmFsKzB4
MWEwLzB4MjgwDQo+IFsgIDI1Ny43NjU3MzNdICBkb19ub3RpZnlfcmVzdW1lKzB4YzgvMHgz
OTANCj4gWyAgMjU3Ljc2OTY1MF0gIGVsMF9kYSsweGU4LzB4ZjANCj4gWyAgMjU3Ljc3MjYx
M10gIGVsMHRfNjRfc3luY19oYW5kbGVyKzB4ZTgvMHgxMzANCj4gWyAgMjU3Ljc3Njg3N10g
IGVsMHRfNjRfc3luYysweDE5MC8weDE5NA0KPiBbICAyNTcuNzgwNTM0XSAtLS1bIGVuZCB0
cmFjZSAwMDAwMDAwMDAwMDAwMDAwIF0tLS0NCj4gDQo+IFBhdGNoICMxIGFkZHMgYSBXQVJO
X09OKCkgdG8gZnJhbWVidWZmZXJfcmVsZWFzZSgpIHRvIHByZXZlbnQgdGhlIHVzZS1hZnRl
ci1mcmVlDQo+IHRvIGhhcHBlbi4NCj4gDQo+IFBhdGNoICMyIGFuZCBwYXRjaCAjMyBmaXhl
cyB0aGUgc2ltcGxlZmIgYW5kIGVmaWZiIGRyaXZlcnMgcmVzcGVjdGl2ZWx5LCB0bw0KPiBm
cmVlIHRoZSByZXNvdXJjZXMgYXQgdGhlIGNvcnJlY3QgcGxhY2UuDQoNCiBGcm9tIGEgcXVp
Y2sgbG9vaywgdmVzYWZiIHNlZW1zIHRvIGJlIGFmZmVjdGVkIGFzIHdlbGwuDQoNCkJlc3Qg
cmVnYXJkcw0KVGhvbWFzDQoNCj4gDQo+IA0KPiBEYW5pZWwgVmV0dGVyICgxKToNCj4gICAg
ZmJkZXY6IFByZXZlbnQgcG9zc2libGUgdXNlLWFmdGVyLWZyZWUgaW4gZmJfcmVsZWFzZSgp
DQo+IA0KPiBKYXZpZXIgTWFydGluZXogQ2FuaWxsYXMgKDIpOg0KPiAgICBmYmRldi9zaW1w
bGVmYjogQ2xlYW51cCBmYl9pbmZvIGluIC5mYl9kZXN0cm95IHJhdGhlciB0aGFuIC5yZW1v
dmUNCj4gICAgZmJkZXYvZWZpZmI6IENsZWFudXAgZmJfaW5mbyBpbiAuZmJfZGVzdHJveSBy
YXRoZXIgdGhhbiAucmVtb3ZlDQo+IA0KPiAgIGRyaXZlcnMvdmlkZW8vZmJkZXYvY29yZS9m
YnN5c2ZzLmMgfCA0ICsrKysNCj4gICBkcml2ZXJzL3ZpZGVvL2ZiZGV2L2VmaWZiLmMgICAg
ICAgIHwgOSArKysrKysrKy0NCj4gICBkcml2ZXJzL3ZpZGVvL2ZiZGV2L3NpbXBsZWZiLmMg
ICAgIHwgOCArKysrKysrLQ0KPiAgIDMgZmlsZXMgY2hhbmdlZCwgMTkgaW5zZXJ0aW9ucygr
KSwgMiBkZWxldGlvbnMoLSkNCj4gDQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBo
aWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkg
R21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55DQooSFJCIDM2
ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8aHJlcjogSXZvIFRvdGV2DQo=

--------------DBYed24fSP6uciqwCRv25OkH--

--------------xFbIBL0fJcIQ9BMEk6s0gh0K
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmJzh80FAwAAAAAACgkQlh/E3EQov+AK
gxAArUCf0xgNSspTsqw4Af2JL0N+wSwhSVABZQ2PVSqidFbcozqyYKqyrMpWhrurMnZ5o3aj92rh
c83uVw0QfddCu7zyRQksaRlqUqL9P03adFOcZXRpgUKPDr+6jvbM2jxZ9s9ZWFYRxMsph0AXiTbR
VeXwb7c6TTb+h+3RIVS7lpraLh1HYyfyAL38DsHS/Y8tyXVqnkWzKbQ0oHeHOzCA+RZAUSvfa8SW
k6PGZMY91VVTQRD938T8O5cyYGNbQij5uw135EMbln7KzI7ISpW7aoteUxYdsd0X41P7CTIHYV6Z
C6MDuXVkCay8n23sXxWGsALT1U6E0aqVmoFYTuYyEGwbK+9VR9G1479TgInThE4WdjjRSyer9JIj
B91iPNFSQhfQipOTpNgq1ysspFJC9VIYSpofXt2vJJiQG3yS3UECKYp+UTonre7J+4OkZuLV+SZl
ckgZipwP/3uVfMrbsztIWN+p5T2DFdeRvGE1+OXIn+pQ7TvxBckjfbnaaEQBUKH+gkC2TX11nUsl
1GY2jQd1vZ0/L9MweEpsa6WxOdgyPkPklDqcMCNJcOoFP3zYPyjcNpbulYCACxy1o9jS5D5NcmgP
28O+fza0qpAQKmhLFpfGNfGZQuuWlslh4FHSpMmzdn6M+X/9qcDK6SsE/xDlPKlDw9HY6ZgK0A6G
U5w=
=pcMY
-----END PGP SIGNATURE-----

--------------xFbIBL0fJcIQ9BMEk6s0gh0K--
