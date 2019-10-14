Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 72D47D632F
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2019 14:59:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 444FF6E2B2;
	Mon, 14 Oct 2019 12:59:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kmu-office.ch (mail.kmu-office.ch [IPv6:2a02:418:6a02::a2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDA8C6E2B2
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2019 12:59:06 +0000 (UTC)
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
 by mail.kmu-office.ch (Postfix) with ESMTPSA id 5F42A5C0D8D;
 Mon, 14 Oct 2019 14:59:05 +0200 (CEST)
MIME-Version: 1.0
Date: Mon, 14 Oct 2019 14:59:05 +0200
From: Stefan Agner <stefan@agner.ch>
To: Robert Chiras <robert.chiras@nxp.com>
Subject: Re: [PATCH v4 04/14] drm/mxsfb: Reset vital registers for a proper
 initialization
In-Reply-To: <1567078215-31601-5-git-send-email-robert.chiras@nxp.com>
References: <1567078215-31601-1-git-send-email-robert.chiras@nxp.com>
 <1567078215-31601-5-git-send-email-robert.chiras@nxp.com>
Message-ID: <29759c86d92f5f59da16a2ae2438c649@agner.ch>
X-Sender: stefan@agner.ch
User-Agent: Roundcube Webmail/1.3.9
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=agner.ch; s=dkim; t=1571057945;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IrIk/+NuneeimSRaD+CUqurgwLLXMUHt9TmXZu2aqpA=;
 b=Xv4aMsJ9afzK00Ld1FLFhDFzXUNX9iYwatA5qEdjd+uXiJ+2IJv8fm/mhS/0MqSvOEZPpp
 CA8HQH5Ct1Gby0YK3hpwVfSxDkq7VbMJ609XS//x1ShVd4oDcy4EpZ1FceBBGhKlkP0uD3
 n28S1auNMXzYIssL/sGaCXW1ba7sxYA=
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
Cc: Marek Vasut <marex@denx.de>, Mark Rutland <mark.rutland@arm.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>,
 =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS0wOC0yOSAxMzozMCwgUm9iZXJ0IENoaXJhcyB3cm90ZToKPiBTb21lIG9mIHRoZSBy
ZWdpc3RlcnMsIGxpa2UgTENEQ19DVFJMLCBDVFJMMl9PVVRTVEFORElOR19SRVFTIGFuZAo+IENU
UkwxX1JFQ09WRVJZX09OX1VOREVSRkxPVyBuZWVkcyB0byBiZSBwcm9wZXJseSBjbGVhcmVkL2lu
aXRpYWxpemVkCj4gZm9yIGEgYmV0dGVyIHN0YXJ0IGFuZCBzdG9wIHJvdXRpbmUuCgoKVGhpcyBw
YXRjaCB1c2VzIENUUkwyX09VVFNUQU5ESU5HX1JFUVMgd2hpY2ggaXMgb25seSBpbnRyb2R1Y2Vk
IGluIHRoZQpuZXh0IHBhdGNoLiBUaGlzIGJyZWFrcyBiaXNlY3RhYmlsaXR5LgoKLS0KU3RlZmFu
Cgo+IAo+IFNpZ25lZC1vZmYtYnk6IFJvYmVydCBDaGlyYXMgPHJvYmVydC5jaGlyYXNAbnhwLmNv
bT4KPiBUZXN0ZWQtYnk6IEd1aWRvIEfDvG50aGVyIDxhZ3hAc2lneGNwdS5vcmc+Cj4gLS0tCj4g
IGRyaXZlcnMvZ3B1L2RybS9teHNmYi9teHNmYl9jcnRjLmMgfCAxMiArKysrKysrKysrKysKPiAg
MSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL214c2ZiL214c2ZiX2NydGMuYwo+IGIvZHJpdmVycy9ncHUvZHJtL214c2ZiL214
c2ZiX2NydGMuYwo+IGluZGV4IGI2OWFjZTguLjVlNDRmNTcgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL214c2ZiL214c2ZiX2NydGMuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9teHNm
Yi9teHNmYl9jcnRjLmMKPiBAQCAtMTI3LDYgKzEyNywxMCBAQCBzdGF0aWMgdm9pZCBteHNmYl9l
bmFibGVfY29udHJvbGxlcihzdHJ1Y3QKPiBteHNmYl9kcm1fcHJpdmF0ZSAqbXhzZmIpCj4gIAkJ
Y2xrX3ByZXBhcmVfZW5hYmxlKG14c2ZiLT5jbGtfZGlzcF9heGkpOwo+ICAJY2xrX3ByZXBhcmVf
ZW5hYmxlKG14c2ZiLT5jbGspOwo+ICAKPiArCWlmIChteHNmYi0+ZGV2ZGF0YS0+aXB2ZXJzaW9u
ID49IDQpCj4gKwkJd3JpdGVsKENUUkwyX09VVFNUQU5ESU5HX1JFUVMoUkVRXzE2KSwKPiArCQkg
ICAgICAgbXhzZmItPmJhc2UgKyBMQ0RDX1Y0X0NUUkwyICsgUkVHX1NFVCk7Cj4gKwo+ICAJLyog
SWYgaXQgd2FzIGRpc2FibGVkLCByZS1lbmFibGUgdGhlIG1vZGUgYWdhaW4gKi8KPiAgCXdyaXRl
bChDVFJMX0RPVENMS19NT0RFLCBteHNmYi0+YmFzZSArIExDRENfQ1RSTCArIFJFR19TRVQpOwo+
ICAKPiBAQCAtMTM2LDEyICsxNDAsMTkgQEAgc3RhdGljIHZvaWQgbXhzZmJfZW5hYmxlX2NvbnRy
b2xsZXIoc3RydWN0Cj4gbXhzZmJfZHJtX3ByaXZhdGUgKm14c2ZiKQo+ICAJd3JpdGVsKHJlZywg
bXhzZmItPmJhc2UgKyBMQ0RDX1ZEQ1RSTDQpOwo+ICAKPiAgCXdyaXRlbChDVFJMX1JVTiwgbXhz
ZmItPmJhc2UgKyBMQ0RDX0NUUkwgKyBSRUdfU0VUKTsKPiArCXdyaXRlbChDVFJMMV9SRUNPVkVS
WV9PTl9VTkRFUkZMT1csIG14c2ZiLT5iYXNlICsgTENEQ19DVFJMMSArIFJFR19TRVQpOwo+ICB9
Cj4gIAo+ICBzdGF0aWMgdm9pZCBteHNmYl9kaXNhYmxlX2NvbnRyb2xsZXIoc3RydWN0IG14c2Zi
X2RybV9wcml2YXRlICpteHNmYikKPiAgewo+ICAJdTMyIHJlZzsKPiAgCj4gKwlpZiAobXhzZmIt
PmRldmRhdGEtPmlwdmVyc2lvbiA+PSA0KQo+ICsJCXdyaXRlbChDVFJMMl9PVVRTVEFORElOR19S
RVFTKDB4NyksCj4gKwkJICAgICAgIG14c2ZiLT5iYXNlICsgTENEQ19WNF9DVFJMMiArIFJFR19D
TFIpOwo+ICsKPiArCXdyaXRlbChDVFJMX1JVTiwgbXhzZmItPmJhc2UgKyBMQ0RDX0NUUkwgKyBS
RUdfQ0xSKTsKPiArCj4gIAkvKgo+ICAJICogRXZlbiBpZiB3ZSBkaXNhYmxlIHRoZSBjb250cm9s
bGVyIGhlcmUsIGl0IHdpbGwgc3RpbGwgY29udGludWUKPiAgCSAqIHVudGlsIGl0cyBGSUZPcyBh
cmUgcnVubmluZyBvdXQgb2YgZGF0YQo+IEBAIC0yOTUsNiArMzA2LDcgQEAgdm9pZCBteHNmYl9j
cnRjX2VuYWJsZShzdHJ1Y3QgbXhzZmJfZHJtX3ByaXZhdGUgKm14c2ZiKQo+ICAJZG1hX2FkZHJf
dCBwYWRkcjsKPiAgCj4gIAlteHNmYl9lbmFibGVfYXhpX2NsayhteHNmYik7Cj4gKwl3cml0ZWwo
MCwgbXhzZmItPmJhc2UgKyBMQ0RDX0NUUkwpOwo+ICAJbXhzZmJfY3J0Y19tb2RlX3NldF9ub2Zi
KG14c2ZiKTsKPiAgCj4gIAkvKiBXcml0ZSBjdXJfYnVmIGFzIHdlbGwgdG8gYXZvaWQgYW4gaW5p
dGlhbCBjb3JydXB0IGZyYW1lICovCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
