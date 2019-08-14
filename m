Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 39A238D1CD
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2019 13:11:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7573789BFD;
	Wed, 14 Aug 2019 11:11:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kmu-office.ch (mail.kmu-office.ch [IPv6:2a02:418:6a02::a2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E45E489BFD
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2019 11:11:04 +0000 (UTC)
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
 by mail.kmu-office.ch (Postfix) with ESMTPSA id 1699A5C004F;
 Wed, 14 Aug 2019 13:11:03 +0200 (CEST)
MIME-Version: 1.0
Date: Wed, 14 Aug 2019 13:11:03 +0200
From: Stefan Agner <stefan@agner.ch>
To: Robert Chiras <robert.chiras@nxp.com>
Subject: Re: [PATCH v2 04/15] drm/mxsfb: Reset vital register for a proper
 initialization
In-Reply-To: <1565779731-1300-5-git-send-email-robert.chiras@nxp.com>
References: <1565779731-1300-1-git-send-email-robert.chiras@nxp.com>
 <1565779731-1300-5-git-send-email-robert.chiras@nxp.com>
Message-ID: <18d5f58deba8044042ab7b8d98a72803@agner.ch>
X-Sender: stefan@agner.ch
User-Agent: Roundcube Webmail/1.3.9
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=agner.ch; s=dkim; t=1565781063;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zRklUTy3QCcdz7Bkr887Hhr50N5yYNjIq/X9BNXHI9o=;
 b=P48GOUeG3b8/JKFr/iPezJAYy2vRasI5H5FGuhSf1Oui9OSQ/TWqInDlUfipc71nMFzgnl
 5m2e6dcEsauQ+7NOZeOttr/XFpegaCauBfYtDSRcS3DKzfw8af/4baNMFgxeofHYoO7szY
 V8/kx1wss45GV6kJJB3mvMPXx9YbSdA=
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

T24gMjAxOS0wOC0xNCAxMjo0OCwgUm9iZXJ0IENoaXJhcyB3cm90ZToKPiBTb21lIG9mIHRoZSBy
ZWdpdGVycyBuZWVkLCBsaWtlIExDRENfQ1RSTCBhbmQgQ1RSTDJfT1VUU1RBTkRJTkdfUkVRUwoK
VHlwbyBpbiByZWdpc3RlcnMsIGFuZCB0aGVyZSBpcyBhIG5lZWQgdG8gbWFueS4KCj4gbmVlZHMg
dG8gYmUgcHJvcGVybHkgY2xlYXJlZCBhbmQgaW5pdGlhbGl6ZWQgZm9yIGEgYmV0dGVyIHN0YXJ0
IGFuZCBzdG9wCj4gcm91dGluZS4KCgoKPiAKPiBTaWduZWQtb2ZmLWJ5OiBSb2JlcnQgQ2hpcmFz
IDxyb2JlcnQuY2hpcmFzQG54cC5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9teHNmYi9t
eHNmYl9jcnRjLmMgfCAxMiArKysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDEyIGluc2Vy
dGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL214c2ZiL214c2ZiX2Ny
dGMuYwo+IGIvZHJpdmVycy9ncHUvZHJtL214c2ZiL214c2ZiX2NydGMuYwo+IGluZGV4IGI2OWFj
ZTguLjVlNDRmNTcgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL214c2ZiL214c2ZiX2Ny
dGMuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9teHNmYi9teHNmYl9jcnRjLmMKPiBAQCAtMTI3
LDYgKzEyNywxMCBAQCBzdGF0aWMgdm9pZCBteHNmYl9lbmFibGVfY29udHJvbGxlcihzdHJ1Y3QK
PiBteHNmYl9kcm1fcHJpdmF0ZSAqbXhzZmIpCj4gIAkJY2xrX3ByZXBhcmVfZW5hYmxlKG14c2Zi
LT5jbGtfZGlzcF9heGkpOwo+ICAJY2xrX3ByZXBhcmVfZW5hYmxlKG14c2ZiLT5jbGspOwo+ICAK
PiArCWlmIChteHNmYi0+ZGV2ZGF0YS0+aXB2ZXJzaW9uID49IDQpCj4gKwkJd3JpdGVsKENUUkwy
X09VVFNUQU5ESU5HX1JFUVMoUkVRXzE2KSwKPiArCQkgICAgICAgbXhzZmItPmJhc2UgKyBMQ0RD
X1Y0X0NUUkwyICsgUkVHX1NFVCk7Cj4gKwo+ICAJLyogSWYgaXQgd2FzIGRpc2FibGVkLCByZS1l
bmFibGUgdGhlIG1vZGUgYWdhaW4gKi8KPiAgCXdyaXRlbChDVFJMX0RPVENMS19NT0RFLCBteHNm
Yi0+YmFzZSArIExDRENfQ1RSTCArIFJFR19TRVQpOwo+ICAKPiBAQCAtMTM2LDEyICsxNDAsMTkg
QEAgc3RhdGljIHZvaWQgbXhzZmJfZW5hYmxlX2NvbnRyb2xsZXIoc3RydWN0Cj4gbXhzZmJfZHJt
X3ByaXZhdGUgKm14c2ZiKQo+ICAJd3JpdGVsKHJlZywgbXhzZmItPmJhc2UgKyBMQ0RDX1ZEQ1RS
TDQpOwo+ICAKPiAgCXdyaXRlbChDVFJMX1JVTiwgbXhzZmItPmJhc2UgKyBMQ0RDX0NUUkwgKyBS
RUdfU0VUKTsKPiArCXdyaXRlbChDVFJMMV9SRUNPVkVSWV9PTl9VTkRFUkZMT1csIG14c2ZiLT5i
YXNlICsgTENEQ19DVFJMMSArIFJFR19TRVQpOwoKVGhpcyBzZWVtcyBub3QgdG8gYmUgYWNjb3Vu
dGVkIGZvciBpbiB0aGUgY29tbWl0IG1lc3NhZ2UuIENhbiB5b3UgZG8KdGhpcyBpbiBhIHNlcGFy
YXRlIGNvbW1pdD8KCkFsc28gSSBzdWdnZXN0IHRvIGludHJvZHVjZSBDVFJMMV9SRUNPVkVSWV9P
Tl9VTkRFUkZMT1cgaW4gdGhhdCBzYW1lCmNvbW1pdC4KCi0tClN0ZWZhbgoKPiAgfQo+ICAKPiAg
c3RhdGljIHZvaWQgbXhzZmJfZGlzYWJsZV9jb250cm9sbGVyKHN0cnVjdCBteHNmYl9kcm1fcHJp
dmF0ZSAqbXhzZmIpCj4gIHsKPiAgCXUzMiByZWc7Cj4gIAo+ICsJaWYgKG14c2ZiLT5kZXZkYXRh
LT5pcHZlcnNpb24gPj0gNCkKPiArCQl3cml0ZWwoQ1RSTDJfT1VUU1RBTkRJTkdfUkVRUygweDcp
LAo+ICsJCSAgICAgICBteHNmYi0+YmFzZSArIExDRENfVjRfQ1RSTDIgKyBSRUdfQ0xSKTsKPiAr
Cj4gKwl3cml0ZWwoQ1RSTF9SVU4sIG14c2ZiLT5iYXNlICsgTENEQ19DVFJMICsgUkVHX0NMUik7
Cj4gKwo+ICAJLyoKPiAgCSAqIEV2ZW4gaWYgd2UgZGlzYWJsZSB0aGUgY29udHJvbGxlciBoZXJl
LCBpdCB3aWxsIHN0aWxsIGNvbnRpbnVlCj4gIAkgKiB1bnRpbCBpdHMgRklGT3MgYXJlIHJ1bm5p
bmcgb3V0IG9mIGRhdGEKPiBAQCAtMjk1LDYgKzMwNiw3IEBAIHZvaWQgbXhzZmJfY3J0Y19lbmFi
bGUoc3RydWN0IG14c2ZiX2RybV9wcml2YXRlICpteHNmYikKPiAgCWRtYV9hZGRyX3QgcGFkZHI7
Cj4gIAo+ICAJbXhzZmJfZW5hYmxlX2F4aV9jbGsobXhzZmIpOwo+ICsJd3JpdGVsKDAsIG14c2Zi
LT5iYXNlICsgTENEQ19DVFJMKTsKPiAgCW14c2ZiX2NydGNfbW9kZV9zZXRfbm9mYihteHNmYik7
Cj4gIAo+ICAJLyogV3JpdGUgY3VyX2J1ZiBhcyB3ZWxsIHRvIGF2b2lkIGFuIGluaXRpYWwgY29y
cnVwdCBmcmFtZSAqLwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
