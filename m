Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 067776955E
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jul 2019 16:58:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7CB1899E7;
	Mon, 15 Jul 2019 14:58:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A46B7899E7
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2019 14:58:10 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 90B8A22270;
 Mon, 15 Jul 2019 10:58:09 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Mon, 15 Jul 2019 10:58:09 -0400
X-ME-Sender: <xms:f5QsXf956g-XA0MKS23TtjBSxU-qd3wUFit5hQLjvGzZOA5plxW3aw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrheekgdejkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefufhfvjgfhkffffgggtgfgsehtjeertddtfeehnecuhfhrohhmpeflrghnpgfu
 vggsrghsthhirghnpgfinphtthgvuceolhhinhhugiesjhgrshgvghdrnhgvtheqnecukf
 hppeeitddrjedurdeifedrjeehnecurfgrrhgrmhepmhgrihhlfhhrohhmpehlihhnuhig
 sehjrghsvghgrdhnvghtnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:f5QsXTkWMCQu1V_1zvquLfv-vuCTfznbD3DuuB57y675WAPGtqX9dA>
 <xmx:f5QsXcYLsDpjOneWh_PaE882bsGDwbvlX4LQJILicfBcJ6ienmw7zA>
 <xmx:f5QsXTNvYsr8pIJR1DVBRzQhMtF2QygyiCQ8m3nNd4S3IJDqQJAnNw>
 <xmx:gZQsXaEgxMZbffTWgFyXU-TDSZanNnaX5QQJ4bn9rel8ukUP1vzXcw>
Received: from [10.137.0.16] (softbank060071063075.bbtec.net [60.71.63.75])
 by mail.messagingengine.com (Postfix) with ESMTPA id 98CF080059;
 Mon, 15 Jul 2019 10:58:04 -0400 (EDT)
Subject: Re: [PATCH] Staging: fbtft: Fix wrong check
 in,fbtft_write_wmem16_bus8()
References: <20190715143003.12819-1-nsaenzjulienne@suse.de>
 <7b8242ab-cc0c-d90b-60af-ff1c53789e44@opensynergy.com>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
In-Reply-To: <7b8242ab-cc0c-d90b-60af-ff1c53789e44@opensynergy.com>
From: =?UTF-8?Q?Jan_Sebastian_G=c3=b6tte?= <linux@jaseg.net>
Message-ID: <5a77c18f-7338-888f-2379-12171b6a545e@jaseg.net>
Date: Mon, 15 Jul 2019 23:58:01 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jaseg.net; h=
 subject:references:to:cc:in-reply-to:from:message-id:date
 :mime-version:content-type:content-transfer-encoding; s=fm3; bh=
 ymTeSHX0Vj7NaZZc1W0N02Ut30dn0Qy41Obnj4AdJ8Q=; b=DfwBYCBR/FsV4J8q
 am62UWkN7x01LRDw08wkhThheuXtDu/Sawto7jvkPsr2LtcQ3OchaeGLuXzPYyOs
 suDikehFCID+GH26xKxx7zB8UAS0UKwUNVVLHNQS5PR1Sh9OOXxN2i6HplUBECpP
 DvJ4F9gZ4nrmQWvLSBHb0vsdmZ5RFKkX5eNtm9krhQ3WO8kLis2l4HHbzt1+khdy
 zKIeVzaD2VfNadl4pQZyjQWxC0lE+lZKvqDk7sKvSF0uwQOzgBfc2HWbjCaIkqc/
 8GtLVsmDMDoA6F4UH/stoGrb2PBiBd4XCUb6ZuUm/b5EIGyzw5YvRrrs3GTzylLZ
 UVqevg==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=ymTeSHX0Vj7NaZZc1W0N02Ut30dn0Qy41Obnj4AdJ
 8Q=; b=RwTBx2lkQBL/l68qnSVOISfctCGVXkatI1Ly3FSiObdVVpc1fpsy+7Szm
 m2Ai6rFzW26ehr7Gb8LSXpes0EnO+w0ctgNAgdxYq4s6FHJbbhGzhVgFGR2Ya/A7
 AQOLo2bBqhDRAVpoffHZP0ADp3Fg4UCU14O0w3WeU7UcjGOz4AUPIL/ZSV6jf8x4
 yN7m+9cfrIXlhHHBbMWfEvDSHYSZKdeU/DEDM20jte9UAivYI19b/oe5ehPPHpby
 D+Mud0elDGLbJ7TOE42In69RAl7CePSdjv/MSwgZMzPH7kdw+Gja9rRQ44vDvtaP
 QhrGW1u82YVLx7XCa1Klt4HD2THVw==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: =?UTF-8?Q?Jan_Sebastian_G=c3=b6tte?= <linux@jaseg.net>, leobras.c@gmail.com,
 linux-fbdev@vger.kernel.org, devel@driverdev.osuosl.org,
 nishadkamdar@gmail.com, gregkh@linuxfoundation.org,
 dri-devel@lists.freedesktop.org, bhanusreemahesh@gmail.com,
 Phil Reid <preid@electromag.com.au>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Q29pbmNpZGVudGlhbGx5LCBJJ3ZlIHdvcmtlZCBvbiB0aGUgZXhhY3Qgc2FtZSBpc3N1ZSB0aGlz
IHdlZWtlbmQuIEkgY2FuIGNvbmZpcm0gdGhpcyBjaGFuZ2UgaXMgbmVjZXNzYXJ5LCBhbmQgd2l0
aCB0aGlzIGFuZCB0aGUgb3RoZXIgdHdvIHBhdGNoZXMgZnJvbSBQaGlsIFJlaWQgdGhlIGRyaXZl
ciB3b3JrcyBhZ2Fpbi4gVGhlIHNhbWUgbWlzdGFrZSBvY2N1cnJlZCBpbiBzZXZlcmFsIG90aGVy
IGxvY2F0aW9ucywgdGhvdWdoLiBJJ2xsIHNlbmQgYSBwYXRjaCBmaXhpbmcgYWxsIG9mIHRoZW0u
CgpJJ3ZlIHRlc3RlZCB0aGlzIG9uIGEgaWxpOTQ4Ni1iYXNlZCBkaXNwbGF5IGNvbm5lY3RlZCB0
byBhIHJhc3BiZXJyeSBwaSAzYisuCgpSZWdhcmRzLCBKYW4KCk9uIE1vbiwgMTUgSnVsIDIwMTkg
Tmljb2xhcyBTYWVueiBKdWxpZW5uZSB3cm90ZToKPiBXZSBhY3R1YWxseSB3YW50IHRvIHNldCB0
aGUgZ3BpbyBwaW4gaWYgaXQncyBhdmlsYWJsZSwgbm90IHRoZSBvdGhlciB3YXkKPiBhcm91bmQu
Cj4gCj4gRml4ZXM6IGM0NDBlZWUxYTdhMSAoIlN0YWdpbmc6IGZidGZ0OiBTd2l0Y2ggdG8gdGhl
IGdwaW8gZGVzY3JpcHRvcgo+IGludGVyZmFjZSIpCj4gU2lnbmVkLW9mZi1ieTogTmljb2xhcyBT
YWVueiBKdWxpZW5uZSA8bnNhZW56anVsaWVubmVAc3VzZS5kZT4KPiAtLS0KPiAgZHJpdmVycy9z
dGFnaW5nL2ZidGZ0L2ZidGZ0LWJ1cy5jIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9zdGFnaW5n
L2ZidGZ0L2ZidGZ0LWJ1cy5jCj4gYi9kcml2ZXJzL3N0YWdpbmcvZmJ0ZnQvZmJ0ZnQtYnVzLmMK
PiBpbmRleCAyZWE4MTRkMGRjYTUuLjYzYzY1ZGQ2N2IxNyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJz
L3N0YWdpbmcvZmJ0ZnQvZmJ0ZnQtYnVzLmMKPiArKysgYi9kcml2ZXJzL3N0YWdpbmcvZmJ0ZnQv
ZmJ0ZnQtYnVzLmMKPiBAQCAtMTM1LDcgKzEzNSw3IEBAIGludCBmYnRmdF93cml0ZV92bWVtMTZf
YnVzOChzdHJ1Y3QgZmJ0ZnRfcGFyICpwYXIsCj4gc2l6ZV90IG9mZnNldCwgc2l6ZV90IGxlbikK
PiAgICAgICAgIHJlbWFpbiA9IGxlbiAvIDI7Cj4gICAgICAgICB2bWVtMTYgPSAodTE2ICopKHBh
ci0+aW5mby0+c2NyZWVuX2J1ZmZlciArIG9mZnNldCk7Cj4gIC0gICAgICBpZiAoIXBhci0+Z3Bp
by5kYykKPiArICAgICAgIGlmIChwYXItPmdwaW8uZGMpCj4gICAgICAgICAgICAgICAgIGdwaW9k
X3NldF92YWx1ZShwYXItPmdwaW8uZGMsIDEpOwo+ICAgICAgICAgLyogbm9uIGJ1ZmZlcmVkIHdy
aXRlICovCj4gLS0KPiAyLjIyLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
