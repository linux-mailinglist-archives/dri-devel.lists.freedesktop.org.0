Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F14522AB2D5
	for <lists+dri-devel@lfdr.de>; Mon,  9 Nov 2020 09:53:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C5BF896E9;
	Mon,  9 Nov 2020 08:52:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mslow2.mail.gandi.net (mslow2.mail.gandi.net [217.70.178.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35DBB8951B
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Nov 2020 08:32:25 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (unknown [217.70.183.195])
 by mslow2.mail.gandi.net (Postfix) with ESMTP id BE1573A6BBE
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Nov 2020 08:29:33 +0000 (UTC)
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 3DCAD6000C;
 Mon,  9 Nov 2020 08:28:57 +0000 (UTC)
Date: Mon, 9 Nov 2020 09:28:55 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v2 00/23] Rid W=1 warnings in MTD
Message-ID: <20201109092855.495174dc@xps13>
In-Reply-To: <20201106213655.1838861-1-lee.jones@linaro.org>
References: <20201106213655.1838861-1-lee.jones@linaro.org>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 09 Nov 2020 08:52:30 +0000
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
Cc: Boris BREZILLON <b.brezillon.dev@gmail.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Sergey Lapin <slapin@ossfans.org>,
 dri-devel@lists.freedesktop.org, linux-mtd@lists.infradead.org,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Choudary Kalluri <punnaia@xilinx.com>, Robert Jarzmik <robert.jarzmik@free.fr>,
 Paul Mackerras <paulus@samba.org>, Dan Brown <dan_brown@ieee.org>,
 linux-samsung-soc@vger.kernel.org, Adrian Hunter <ext-adrian.hunter@nokia.com>,
 Kamal Dasu <kdasu.kdev@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Thomas Gleixner <gleixner@linutronix.de>, Chen-Yu Tsai <wens@csie.org>,
 Kukjin Kim <kgene@kernel.org>, bcm-kernel-feedback-list@broadcom.com,
 linux-media@vger.kernel.org, Tudor Ambarus <tudor.ambarus@microchip.com>,
 linaro-mm-sig@lists.linaro.org, Dmitriy B <rzk333@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Jochen =?UTF-8?B?U2Now6R1Ymxl?= <psionic@psionic.de>,
 Naga Sureshkumar Relli <nagasure@xilinx.com>,
 Yoshio Furuyama <ytc-mb-yfuruyama7@kioxia.com>,
 Nicolas Pitre <nico@fluxnic.net>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Ben Dooks <ben@simtec.co.uk>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, Qiang Yu <yuq825@gmail.com>,
 Richard Weinberger <richard@nod.at>, Jian Zhang <jzhang@ti.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTGVlLAoKTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4gd3JvdGUgb24gRnJpLCAg
NiBOb3YgMjAyMCAyMTozNjozMgorMDAwMDoKCj4gVGhpcyBzZXQgaXMgcGFydCBvZiBhIGxhcmdl
ciBlZmZvcnQgYXR0ZW1wdGluZyB0byBjbGVhbi11cCBXPTEKPiBrZXJuZWwgYnVpbGRzLCB3aGlj
aCBhcmUgY3VycmVudGx5IG92ZXJ3aGVsbWluZ2x5IHJpZGRsZWQgd2l0aAo+IG5pZ2dseSBsaXR0
bGUgd2FybmluZ3MuCj4gCj4gdjEgPT4gdjI6Cj4gICAtIEFkZGVkIHRhZ3MKPiAgIC0gU2F0aXNm
aWVkIE1pcXVlbCdzIHJldmlldyBjb21tZW50cwo+IAoKWW91IHByb2JhYmx5IG1pc3NlZCBteSBy
ZXF1ZXN0IHRvIHVwZGF0ZSB0aGUgdGl0bGVzLiBUaGF0J3Mgd2h5IEkKd2FudGVkIHRoZSBlbnRp
cmUgc2VyaWVzIHRvIGJlIHJlc2VudC4gQW55d2F5LCBhcyBJIGZvcmdvdCBhIGZldywKcGxlYXNl
IGZpbmQgYmVsb3cgdGhlIHByZWZpeGVzIHRoYXQgc2hvdWxkIGJlIHVzZWQ6Cgo+IExlZSBKb25l
cyAoMjMpOgo+ICAgbXRkOiBtdGRwYXJ0OiBGaXggbWlzZG9jdW1lbnRlZCBmdW5jdGlvbiBwYXJh
bWV0ZXIgJ210ZCcKPiAgIG10ZDogZGV2aWNlczogcGhyYW06IEZpbGUgaGVhZGVycyBhcmUgbm90
IGdvb2QgY2FuZGlkYXRlcyBmb3IKPiAgICAga2VybmVsLWRvYwo+ICAgbXRkOiBuYW5kOiBvbmVu
YW5kOiBvbmVuYW5kX2Jhc2U6IEZpeCBleHBlY3RlZCBrZXJuZWwtZG9jIGZvcm1hdHRpbmcKCm10
ZDogb25lbmFuZDogRml4Li4uCgo+ICAgbXRkOiBkZXZpY2VzOiBkb2NnMzogRml4IGtlcm5lbC1k
b2MgJ2JhZCBsaW5lJyBhbmQgJ2V4Y2Vzc2l2ZSBkb2MnCj4gICAgIGlzc3Vlcwo+ICAgbXRkOiBt
dGRjb3JlOiBGaXggbWlzc3BlbGxlZCBmdW5jdGlvbiBwYXJhbWV0ZXIgJ3NlY3Rpb24nCgptdGQ6
IEZpeC4uLgoKPiAgIG10ZDogbmFuZDogb25lbmFuZDogb25lbmFuZF9iYnQ6IEZpeCBleHBlY3Rl
ZCBrZXJuZWwtZG9jIGZvcm1hdHRpbmcKCm10ZDogb25lbmFuZDogRml4Li4uCgo+ICAgbXRkOiBz
cGktbm9yOiBjb250cm9sbGVyczogaGlzaS1zZmM6IERlbW90ZSBub24tY29uZm9ybWFudCBrZXJu
ZWwtZG9jCgptdGQ6IHNwaS1ub3I6IGhpc2ktc2ZjOiBEZW1vdGUuLi4KCj4gICBtdGQ6IHViaTog
YnVpbGQ6IERvY3VtZW50ICd1YmlfbnVtJyBpbiBzdHJ1Y3QgbXRkX2Rldl9wYXJhbQo+ICAgbXRk
OiBuYW5kOiBzcGk6IHRvc2hpYmE6IERlbW90ZSBub24tY29uZm9ybWFudCBrZXJuZWwtZG9jIGhl
YWRlcgoKbXRkOiBzcGluYW5kOiB0b3NoaWJhOiBEZW1vdGUuLi4KCj4gICBtdGQ6IHViaToga2Fw
aTogQ29ycmVjdCBkb2N1bWVudGF0aW9uIGZvciAndWJpX2xlYl9yZWFkX3NnJ3MgJ3NnbCcKPiAg
ICAgcGFyYW1ldGVyCj4gICBtdGQ6IHViaTogZWJhOiBGaXggYSBjb3VwbGUgb2YgbWlzZG9jdW1l
bnRhdGlvbiBpc3N1ZXMKPiAgIG10ZDogdWJpOiB3bDogRml4IGEgY291cGxlIG9mIGtlcm5lbC1k
b2MgaXNzdWVzCj4gICBtdGQ6IG5hbmQ6IHJhdzogYnJjbW5hbmQ6IGJyY21uYW5kOiBEZW1vdGUg
bm9uLWNvbmZvcm1hbnQga2VybmVsLWRvYwo+ICAgICBoZWFkZXJzCgptdGQ6IHJhd25hbmQ6IGJy
Y21uYW5kOiBEZW1vdGUuLi4KCj4gICBtdGQ6IHViaTogZ2x1ZWJpOiBGaXggbWlzbmFtZWQgZnVu
Y3Rpb24gcGFyYW1ldGVyIGRvY3VtZW50YXRpb24KPiAgIG10ZDogbmFuZDogcmF3OiBkaXNrb25j
aGlwOiBNYXJraW5nIHVudXNlZCB2YXJpYWJsZXMgYXMKPiAgICAgX19hbHdheXNfdW51c2VkCgpt
dGQ6IHJhd25hbmQ6IGRpc2tvbmNoaXA6IE1hcmtpbmcuLi4KCj4gICBtdGQ6IG5hbmQ6IHJhdzog
Y2FmZV9uYW5kOiBSZW1vdmUgc3VwZXJmbHVvdXMgcGFyYW0gZG9jIGFuZCBhZGQKPiAgICAgYW5v
dGhlcgoKbXRkOiByYXduYW5kOiBjYWZlOiBSZW1vdmUKCj4gICBtdGQ6IG5hbmQ6IHJhdzogczNj
MjQxMDogQWRkIGRvY3VtZW50YXRpb24gZm9yIDIgbWlzc2luZyBzdHJ1Y3QKPiAgICAgbWVtYmVy
cwoKbXRkOiByYXduYW5kOiBzM2MyNDEwOiBBZGQuLi4KCj4gICBtdGQ6IG5hbmQ6IHJhdzogb21h
cF9lbG06IEZpbmlzaCBoYWxmIHBvcHVsYXRlZCBmdW5jdGlvbiBoZWFkZXIsCj4gICAgIGRlbW90
ZSBlbXB0eSBvbmVzCgptdGQ6IHJhd25hbmQ6IG9tYXBfZWxtOiBGaW5pc2gKCj4gICBtdGQ6IG5h
bmQ6IHJhdzogb21hcDI6IEZpeCBhIGJ1bmNoIG9mIGtlcm5lbC1kb2MgbWlzZGVtZWFub3VycwoK
bXRkOnIgcmF3bmFuZDogb21hcDI6IEZpeAoKPiAgIG10ZDogbmFuZDogcmF3OiBzdW54aV9uYW5k
OiBEb2N1bWVudCAnc3VueGlfbmZjJ3MgJ2NhcHMnIG1lbWJlcgoKbXRkOiByYXduYW5kOiBzdW54
aTogRG9jdW1lbnQKCj4gICBtdGQ6IG5hbmQ6IHJhdzogYXJhc2FuLW5hbmQtY29udHJvbGxlcjog
RG9jdW1lbnQgJ2FuZmNfb3AncyAnYnVmJwo+ICAgICBtZW1iZXIKCm10ZDogcmF3bmFuZDogYXJh
c2FuOiBEb2N1bWVudAoKPiAgIG10ZDogbmFuZDogb25lbmFuZDogb25lbmFuZF9iYXNlOiBGaXgg
c29tZSBrZXJuZWwtZG9jIG1pc2RlbWVhbm91cnMKCm10ZDogb25lbmFuZDogRml4Cgo+ICAgbXRk
OiBkZXZpY2VzOiBwb3dlcm52X2ZsYXNoOiBBZGQgZnVuY3Rpb24gbmFtZXMgdG8gaGVhZGVycyBh
bmQgZml4Cj4gICAgICdkZXYnCgpPdGhlcndpc2UgdGhlIGNvbnRlbnQgb2YgdGhlIHNlcmllcyBs
b29rcyBnb29kIHRvIG1lLgoKVGhhbmtzLApNaXF1w6hsCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
