Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEDBB7625A
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jul 2019 11:49:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F1D16ECCF;
	Fri, 26 Jul 2019 09:41:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from crapouillou.net (outils.crapouillou.net [89.234.176.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 042266E7D6
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2019 22:02:33 +0000 (UTC)
From: Paul Cercueil <paul@crapouillou.net>
To: Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>,
 James Hogan <jhogan@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Vinod Koul <vkoul@kernel.org>,
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 Lee Jones <lee.jones@linaro.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Sebastian Reichel <sre@kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Subject: [PATCH 00/11] JZ4740 SoC cleanup
Date: Thu, 25 Jul 2019 18:02:04 -0400
Message-Id: <20190725220215.460-1-paul@crapouillou.net>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 26 Jul 2019 09:41:09 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=crapouillou.net; 
 s=mail; t=1564092151; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-transfer-encoding:content-transfer-encoding:
 in-reply-to:references; bh=heKcREY22PalpQ/9p8Cd9d1zdSepPrb23urjeSbGB5s=;
 b=mFrG2QDIrMMa1N2Z2OVlTuF1yYZ3LchMkFWqDfMspQ9nIQIHt+4ryyS8D1eO043/xYvhbR
 N2FT54nOWkY/RPgX2yiBHDmmzZM/1mmRTn9qpQrY04TflmjGu4/L1JyZ5aAqdEOpvFe+8V
 Dwl76dgF+6zF8aB9BWW/YLBVr0ngLbU=
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
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 linux-fbdev@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-pm@vger.kernel.org, linux-mips@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, od@zcrc.me,
 linux-mtd@lists.infradead.org, dmaengine@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpUaGlzIHBhdGNoc2V0IGNvbnZlcnRzIHRoZSBRaSBMQjYwIE1JUFMgYm9hcmQgdG8gZGV2
aWNldHJlZSBhbmQgbWFrZXMgaXQKdXNlIGFsbCB0aGUgc2hpbnkgbmV3IGRyaXZlcnMgdGhhdCBo
YXZlIGJlZW4gZGV2ZWxvcGVkIG9yIHVwZGF0ZWQKcmVjZW50bHkuCgpBbGwgdGhlIGNyYXBweSBv
bGQgZHJpdmVycyBhbmQgY3VzdG9tIGNvZGUgY2FuIGJlIGRyb3BwZWQgc2luY2UgdGhleQpoYXZl
IGJlZW4gcmVwbGFjZWQgYnkgYmV0dGVyIGFsdGVybmF0aXZlcy4KClNvbWUgb2YgdGhlc2UgYWx0
ZXJuYXRpdmVzIGFyZSBub3QgeWV0IGluIDUuMy1yYzEgYnV0IGhhdmUgYWxyZWFkeSBiZWVuCmFj
Y2VwdGVkIGJ5IHRoZWlyIHJlc3BlY3RpdmUgbWFpbnRhaW5lciBmb3IgaW5jbHVzaW9uIGluIDUu
NC1yYzEuCgpUbyB1cHN0cmVhbSB0aGlzIHBhdGNoc2V0LCBJIHRoaW5rIHRoYXQgYXMgc29vbiBh
cyBNSVBTIG1haW50YWluZXJzCmFncmVlIHRvIHRha2UgcGF0Y2hlcyAwMS0wMy8xMSBhbmQgMTEv
MTEsIHRoZSBvdGhlciBwYXRjaGVzIGNhbiBnbwp0aHJvdWdoIHRoZWlyIHJlc3BlY3RpdmUgbWFp
bnRhaW5lcidzIHRyZWUuCgpOb3RlIGZvciBNSVBTIG1haW50YWluZXJzOgpQYXRjaCAxMS8xMSBt
YXkgY29uZmxpY3Qgd2l0aCB0aGUgVENVIHBhdGNoc2V0IHYxNSwgc2hvdWxkIHRoaXMgb25lIGJl
CmFjY2VwdGVkIHVwc3RyZWFtLCBidXQgdGhlIGNvbmZsaWN0IGlzIHRpbnkgYW5kIGVhc3kgdG8g
Zml4LiBTaG91bGQgdGhpcwpjYXNlIGFwcGVhciwgZG9uJ3QgaGVzaXRhdGUgdG8gYm90aGVyIG1l
IGFib3V0IGl0LgoKVGhhbmtzLAotUGF1bAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
