Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD736323A7
	for <lists+dri-devel@lfdr.de>; Sun,  2 Jun 2019 17:01:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E79298970E;
	Sun,  2 Jun 2019 15:01:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mslow2.mail.gandi.net (mslow2.mail.gandi.net [217.70.178.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BE7E896E4
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Jun 2019 21:26:43 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (unknown [217.70.183.196])
 by mslow2.mail.gandi.net (Postfix) with ESMTP id A9D243A4C1F
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Jun 2019 21:07:18 +0000 (UTC)
X-Originating-IP: 82.246.155.60
Received: from localhost (hy283-1-82-246-155-60.fbx.proxad.net [82.246.155.60])
 (Authenticated sender: alexandre.belloni@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 0904CE0005;
 Sat,  1 Jun 2019 21:06:53 +0000 (UTC)
Date: Sat, 1 Jun 2019 23:06:51 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH v3] video: fbdev: atmel_lcdfb: add COMPILE_TEST support
Message-ID: <20190601210651.GB3558@piout.net>
References: <CGME20190530123016eucas1p2e18747b8ac1d156657232eab52876a61@eucas1p2.samsung.com>
 <69cd6b8b-1fd1-86fa-2070-99d0ce15a868@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <69cd6b8b-1fd1-86fa-2070-99d0ce15a868@samsung.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Mailman-Approved-At: Sun, 02 Jun 2019 15:00:55 +0000
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
Cc: linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMzAvMDUvMjAxOSAxNDozMDoxOSswMjAwLCBCYXJ0bG9taWVqIFpvbG5pZXJraWV3aWN6IHdy
b3RlOgo+IEFkZCBDT01QSUxFX1RFU1Qgc3VwcG9ydCB0byBhdG1lbF9sY2RmYiBkcml2ZXIgZm9y
IGJldHRlciBjb21waWxlCj4gdGVzdGluZyBjb3ZlcmFnZS4KPiAKPiBXaGlsZSBhdCBpdCBmaXgg
aW1wcm9wZXIgdXNlIG9mIFVMICh0byBzaWxlbmNlIGJ1aWxkIHdhcm5pbmdzIG9uCj4geDg2XzY0
KS4KPiAKPiBDYzogQWxleGFuZHJlIEJlbGxvbmkgPGFsZXhhbmRyZS5iZWxsb25pQGJvb3RsaW4u
Y29tPgpBY2tlZC1ieTogQWxleGFuZHJlIEJlbGxvbmkgPGFsZXhhbmRyZS5iZWxsb25pQGJvb3Rs
aW4uY29tPgoKPiBDYzogTHVkb3ZpYyBEZXNyb2NoZXMgPGx1ZG92aWMuZGVzcm9jaGVzQG1pY3Jv
Y2hpcC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogQmFydGxvbWllaiBab2xuaWVya2lld2ljeiA8Yi56
b2xuaWVya2llQHNhbXN1bmcuY29tPgo+IC0tLQo+IHYzOiBmaXggYnVpbGQgd2FybmluZ3Mgb24g
eDg2XzY0CgpIb3BlZnVsbHksIG5vIGJ1aWxkaW5nIGVycm9ycyBhbnltb3JlIDspCgo+IAo+IHYy
OiBhZGQgbWlzc2luZyBIQVZFX0NMSyAmJiBIQVMgSU9NRU0gZGVwZW5kZW5jaWVzCj4gCj4gIGRy
aXZlcnMvdmlkZW8vZmJkZXYvS2NvbmZpZyAgICAgICB8ICAgIDMgKystCj4gIGRyaXZlcnMvdmlk
ZW8vZmJkZXYvYXRtZWxfbGNkZmIuYyB8ICAgIDQgKystLQo+ICAyIGZpbGVzIGNoYW5nZWQsIDQg
aW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPiAKPiBJbmRleDogYi9kcml2ZXJzL3ZpZGVv
L2ZiZGV2L0tjb25maWcKPiA9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09Cj4gLS0tIGEvZHJpdmVycy92aWRlby9mYmRldi9L
Y29uZmlnCj4gKysrIGIvZHJpdmVycy92aWRlby9mYmRldi9LY29uZmlnCj4gQEAgLTg1NSw3ICs4
NTUsOCBAQCBjb25maWcgRkJfUzFEMTNYWFgKPiAgCj4gIGNvbmZpZyBGQl9BVE1FTAo+ICAJdHJp
c3RhdGUgIkFUOTEgTENEIENvbnRyb2xsZXIgc3VwcG9ydCIKPiAtCWRlcGVuZHMgb24gRkIgJiYg
T0YgJiYgSEFWRV9GQl9BVE1FTAo+ICsJZGVwZW5kcyBvbiBGQiAmJiBPRiAmJiBIQVZFX0NMSyAm
JiBIQVNfSU9NRU0KPiArCWRlcGVuZHMgb24gSEFWRV9GQl9BVE1FTCB8fCBDT01QSUxFX1RFU1QK
PiAgCXNlbGVjdCBGQl9CQUNLTElHSFQKPiAgCXNlbGVjdCBGQl9DRkJfRklMTFJFQ1QKPiAgCXNl
bGVjdCBGQl9DRkJfQ09QWUFSRUEKPiBJbmRleDogYi9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2F0bWVs
X2xjZGZiLmMKPiA9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09Cj4gLS0tIGEvZHJpdmVycy92aWRlby9mYmRldi9hdG1lbF9s
Y2RmYi5jCj4gKysrIGIvZHJpdmVycy92aWRlby9mYmRldi9hdG1lbF9sY2RmYi5jCj4gQEAgLTY3
Myw3ICs2NzMsNyBAQCBzdGF0aWMgaW50IGF0bWVsX2xjZGZiX3NldF9wYXIoc3RydWN0IGZiCj4g
IAlsY2RjX3dyaXRlbChzaW5mbywgQVRNRUxfTENEQ19NVkFMLCAwKTsKPiAgCj4gIAkvKiBEaXNh
YmxlIGFsbCBpbnRlcnJ1cHRzICovCj4gLQlsY2RjX3dyaXRlbChzaW5mbywgQVRNRUxfTENEQ19J
RFIsIH4wVUwpOwo+ICsJbGNkY193cml0ZWwoc2luZm8sIEFUTUVMX0xDRENfSURSLCB+MFUpOwo+
ICAJLyogRW5hYmxlIEZJRk8gJiBETUEgZXJyb3JzICovCj4gIAlsY2RjX3dyaXRlbChzaW5mbywg
QVRNRUxfTENEQ19JRVIsIEFUTUVMX0xDRENfVUZMV0kgfCBBVE1FTF9MQ0RDX09XUkkgfCBBVE1F
TF9MQ0RDX01FUkkpOwo+ICAKPiBAQCAtMTI5MSw3ICsxMjkxLDcgQEAgc3RhdGljIGludCBhdG1l
bF9sY2RmYl9zdXNwZW5kKHN0cnVjdCBwbAo+ICAJICogV2UgZG9uJ3Qgd2FudCB0byBoYW5kbGUg
aW50ZXJydXB0cyB3aGlsZSB0aGUgY2xvY2sgaXMKPiAgCSAqIHN0b3BwZWQuIEl0IG1heSB0YWtl
IGZvcmV2ZXIuCj4gIAkgKi8KPiAtCWxjZGNfd3JpdGVsKHNpbmZvLCBBVE1FTF9MQ0RDX0lEUiwg
fjBVTCk7Cj4gKwlsY2RjX3dyaXRlbChzaW5mbywgQVRNRUxfTENEQ19JRFIsIH4wVSk7Cj4gIAo+
ICAJc2luZm8tPnNhdmVkX2xjZGNvbiA9IGxjZGNfcmVhZGwoc2luZm8sIEFUTUVMX0xDRENfQ09O
VFJBU1RfQ1RSKTsKPiAgCWxjZGNfd3JpdGVsKHNpbmZvLCBBVE1FTF9MQ0RDX0NPTlRSQVNUX0NU
UiwgMCk7CgotLSAKQWxleGFuZHJlIEJlbGxvbmksIEJvb3RsaW4KRW1iZWRkZWQgTGludXggYW5k
IEtlcm5lbCBlbmdpbmVlcmluZwpodHRwczovL2Jvb3RsaW4uY29tCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
