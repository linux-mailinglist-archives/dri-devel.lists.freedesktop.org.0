Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FFA2F41C1
	for <lists+dri-devel@lfdr.de>; Fri,  8 Nov 2019 09:13:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B95976F866;
	Fri,  8 Nov 2019 08:12:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo6-p04-ob.smtp.rzone.de (mo6-p04-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5304::12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B81AF6F655
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Nov 2019 11:06:29 +0000 (UTC)
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o1OAA2UNf2M7PR5/L9P0"
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box by smtp.strato.de (RZmta 44.29.0 DYNA|AUTH)
 with ESMTPSA id L09db3vA7B6Cdgn
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with
 521 ECDH bits, eq. 15360 bits RSA))
 (Client did not present a certificate);
 Thu, 7 Nov 2019 12:06:12 +0100 (CET)
From: "H. Nikolaus Schaller" <hns@goldelico.com>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
 Tony Lindgren <tony@atomide.com>, Paul Cercueil <paul@crapouillou.net>,
 Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paulburton@kernel.org>,
 James Hogan <jhogan@kernel.org>
Subject: [PATCH v2 0/8] ARM/MIPS: DTS: add child nodes describing the PVRSGX
 present in some OMAP SoC and JZ4780
Date: Thu,  7 Nov 2019 12:06:03 +0100
Message-Id: <cover.1573124770.git.hns@goldelico.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 08 Nov 2019 08:12:31 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 t=1573124788; 
 s=strato-dkim-0002; d=goldelico.com;
 h=Message-Id:Date:Subject:Cc:To:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
 Subject:Sender;
 bh=XDDMV0r7God8oaw26RRX8bDOEGcPbFm9sSN1MRhg7fc=;
 b=YD88uENXJVq8ownT+EQhVj7WZ5KjRCEsxjHFufwTD/IIUtF5R1wQ2MfPmM7F0RVGt2
 dNTOrfBYwDh4nu081UhgwsX3YdHYclOoryhPWqnJj9L9Cuw9DaIuww5lFNXUu53zMTIm
 sRGL1ioGS9CaTFisjAfb99RicIxUsI5YfHniSzqthZzJGfXpICNPidmuhex7bHAHzdKV
 YXDtBk+uoN2R21bD00GmdVmI+9oF4EEabt2sh2wlQh2itxUjLi3sDIO+gA0hFCgEddjc
 nsxSe2DZQvnybOYUKUPBZdyBx/IrTqbw2Wp2DmhFSyomuaLMcDrkI/c031LjCMdA7j1m
 s4iA==
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
Cc: devicetree@vger.kernel.org, linux-omap@vger.kernel.org,
 "H. Nikolaus Schaller" <hns@goldelico.com>, openpvrsgx-devgroup@letux.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mips@vger.kernel.org, kernel@pyra-handheld.com,
 letux-kernel@openphoenux.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Q2hhbmdlczoKKiB0cmllZCBjb252ZXJ0IGJpbmRpbmdzIHRvIFlBTUwgZm9ybWF0IC0gc3VnZ2Vz
dGVkIGJ5IFJvYiBIZXJyaW5nCiogYWRkZWQgSlo0NzgwIERUUyBub2RlIChwcm92ZW4gdG8gbG9h
ZCB0aGUgZHJpdmVyKQoqIHJlbW92ZWQgdGltZXIgYW5kIGltZyxjb3JlcyBwcm9wZXJ0aWVzIHVu
dGlsIHdlIGtub3cgd2UgcmVhbGx5IG5lZWQgdGhlbSAtIHN1Z2dlc3RlZCBieSBSb2IgSGVycmlu
ZwoKUEFUQ0ggVjEgMjAxOS0xMC0xOCAyMDo0NjozNToKClRoaXMgcGF0Y2ggc2V0IGRlZmluZXMg
Y2hpbGQgbm9kZXMgZm9yIHRoZSBTR1g1eHggaW50ZXJmYWNlIGluc2lkZQp0aGUgT01BUCBTb0Mg
c28gdGhhdCBhIGRyaXZlciBjYW4gYmUgZm91bmQgYW5kIHByb2JlZCBieSB0aGUKY29tcGF0aWJs
ZSBzdHJpbmdzIGFuZCBjYW4gcmV0cmlldmUgaW5mb3JtYXRpb24gYWJvdXQgdGhlIFNHWCByZXZp
c2lvbgp0aGF0IGlzIGluY2x1ZGVkIGluIGEgc3BlY2lmaWMgU29DLiBJdCBhbHNvIGRlZmluZXMg
dGhlIGludGVycnVwdCBudW1iZXIKdG8gYmUgdXNlZCBieSB0aGUgU0dYIGRyaXZlci4KClRoZXJl
IGlzIGN1cnJlbnRseSBubyBtYWlubGluZSBkcml2ZXIgZm9yIHRoZXNlIEdQVXMsIGJ1dCBhIHBy
b2plY3QgWzFdCmlzIG9uZ29pbmcgd2l0aCB0aGUgZ29hbCB0byBnZXQgdGhlIG9wZW4tc291cmNl
IHBhcnQgYXMgcHJvdmlkZWQgYnkgVEkvSU1HCmludG8gZHJpdmVycy9zdGFnaW5nL3B2ci4KClRo
ZSBrZXJuZWwgbW9kdWxlcyBidWlsdCBmcm9tIHRoaXMgcHJvamVjdCBoYXZlIHN1Y2Nlc3NmdWxs
eSBkZW1vbnN0cmF0ZWQKdG8gd29yayB3aXRoIHRoZSBEVFMgZGVmaW5pdGlvbnMgZnJvbSB0aGlz
IHBhdGNoIHNldCBvbiBBTTMzNXggQmVhZ2xlQm9uZQpCbGFjayBhbmQgT01BUDUgUHlyYS4gVGhl
eSBwYXJ0aWFsbHkgd29ya3Mgb24gRE0zNzMwIGFuZCBQYW5kYUJvYXJkIEVTIGJ1dAp0aGF0IGlz
IGxpa2VseSBhIHByb2JsZW0gaW4gdGhlIGtlcm5lbCBkcml2ZXIgb3IgdGhlIChub24tZnJlZSkg
dXNlci1zcGFjZQpibG9icy4KClRoZXJlIGlzIHBvdGVudGlhbCB0byBleHRlbmQgdGhpcyB3b3Jr
IHRvIEpaNDc4MCAoQ0kyMCBib2FyZCkgYW5kCkJhbmFuYVBpLU0zIChBODMpIGFuZCBldmVuIHNv
bWUgSW50ZWwgUG91bHNibyBhbmQgQ2VkYXJWaWV3IGRldmljZXMuCgpbMV06IGh0dHBzOi8vZ2l0
aHViLmNvbS9vcGVucHZyc2d4LWRldmdyb3VwCgpILiBOaWtvbGF1cyBTY2hhbGxlciAoOCk6CiAg
UkZDOiBkdC1iaW5kaW5nczogYWRkIGltZyxwdnJzZ3gueWFtbCBmb3IgSW1hZ2luYXRpb24gR1BV
cwogIEFSTTogRFRTOiBhbTMzeHg6IGFkZCBzZ3ggZ3B1IGNoaWxkIG5vZGUKICBBUk06IERUUzog
YW0zNTE3OiBhZGQgc2d4IGdwdSBjaGlsZCBub2RlCiAgQVJNOiBEVFM6IG9tYXAzOiBhZGQgc2d4
IGdwdSBjaGlsZCBub2RlCiAgQVJNOiBEVFM6IG9tYXAzNnh4OiBhZGQgc2d4IGdwdSBjaGlsZCBu
b2RlCiAgQVJNOiBEVFM6IG9tYXA0OiBhZGQgc2d4IGdwdSBjaGlsZCBub2RlCiAgQVJNOiBEVFM6
IG9tYXA1OiBhZGQgc2d4IGdwdSBjaGlsZCBub2RlCiAgTUlQUzogRFRTOiBqejQ3ODA6IGFkZCBz
Z3ggZ3B1IG5vZGUKCiAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9ncHUvaW1nLHB2cnNneC55YW1s
ICAgfCAxMjggKysrKysrKysrKysrKysrKysrCiBhcmNoL2FybS9ib290L2R0cy9hbTMzeHguZHRz
aSAgICAgICAgICAgICAgICAgfCAgIDkgKy0KIGFyY2gvYXJtL2Jvb3QvZHRzL2FtMzUxNy5kdHNp
ICAgICAgICAgICAgICAgICB8ICAxMSArLQogYXJjaC9hcm0vYm9vdC9kdHMvb21hcDM0eHguZHRz
aSAgICAgICAgICAgICAgIHwgIDExICstCiBhcmNoL2FybS9ib290L2R0cy9vbWFwMzZ4eC5kdHNp
ICAgICAgICAgICAgICAgfCAgMTEgKy0KIGFyY2gvYXJtL2Jvb3QvZHRzL29tYXA0LmR0c2kgICAg
ICAgICAgICAgICAgICB8ICAgOSArLQogYXJjaC9hcm0vYm9vdC9kdHMvb21hcDQ0NzAuZHRzICAg
ICAgICAgICAgICAgIHwgIDE1ICsrCiBhcmNoL2FybS9ib290L2R0cy9vbWFwNS5kdHNpICAgICAg
ICAgICAgICAgICAgfCAgIDkgKy0KIGFyY2gvbWlwcy9ib290L2R0cy9pbmdlbmljL2p6NDc4MC5k
dHNpICAgICAgICB8ICAxMSArKwogOSBmaWxlcyBjaGFuZ2VkLCAxODcgaW5zZXJ0aW9ucygrKSwg
MjcgZGVsZXRpb25zKC0pCiBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL2dwdS9pbWcscHZyc2d4LnlhbWwKIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNo
L2FybS9ib290L2R0cy9vbWFwNDQ3MC5kdHMKCi0tIAoyLjIzLjAKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
