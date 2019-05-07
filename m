Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D04169F7
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2019 20:12:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73F176E81B;
	Tue,  7 May 2019 18:12:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E2BE6E81B
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2019 18:12:29 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 993CD803CC;
 Tue,  7 May 2019 20:12:25 +0200 (CEST)
Date: Tue, 7 May 2019 20:12:23 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
Subject: Re: [PATCH v10 2/2] phy: Add driver for mixel mipi dphy found on
 NXP's i.MX8 SoCs
Message-ID: <20190507181223.GC15122@ravnborg.org>
References: <cover.1557215047.git.agx@sigxcpu.org>
 <299e28042e0a24c0cde593873bdfb15e18187a92.1557215047.git.agx@sigxcpu.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <299e28042e0a24c0cde593873bdfb15e18187a92.1557215047.git.agx@sigxcpu.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=IkcTkHD0fZMA:10 a=7gkXJVJtAAAA:8
 a=LmRf8X1h8ZN8rbtOHcgA:9 a=QEXdDO2ut3YA:10 a=E9Po1WZjFZOl8hwRPBS3:22
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, dri-devel@lists.freedesktop.org,
 Abel Vesa <abel.vesa@nxp.com>, Kishon Vijay Abraham I <kishon@ti.com>,
 NXP Linux Team <linux-imx@nxp.com>, Robert Chiras <robert.chiras@nxp.com>,
 Thierry Reding <treding@nvidia.com>, devicetree@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Johan Hovold <johan@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>,
 Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>, Li Jun <jun.li@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgR3VpZG8uCgpMb29rcyBnb29kIG5vdywgc3R1bWJsZWQgdXBvbiBhIGZldyBkZXRhaWxzIEkg
bWlzc2VkIGluIGxhc3Qgcm91bmQuCldpdGggdGhlc2UgY29uc2lkZXJlZCAvIGZpeGVkIHlvdSBj
YW4gYWRkIG15ClJldmlld2VkLWJ5OiBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+CgoJ
U2FtCgo+ICsjZGVmaW5lIENNKHgpCSgJCQkJXAo+ICsJCSgoeCkgPAkzMik/MHhlMHwoKHgpLTE2
KSA6CVwKPiArCQkoKHgpIDwJNjQpPzB4YzB8KCh4KS0zMikgOglcCj4gKwkJKCh4KSA8IDEyOCk/
MHg4MHwoKHgpLTY0KSA6CVwKPiArCQkoKHgpIC0gMTI4KSkKPiArI2RlZmluZSBDTih4KQkoKCh4
KSA9PSAxKT8weDFmIDogKCgoQ05fQlVGKT4+KCh4KS0xKSkmMHgxZikpCj4gKyNkZWZpbmUgQ08o
eCkJKChDT19CVUYpPj4oOC0oeCkpJjB4MykKCkEgZmV3IHNwYWNlcyBhcm91bmQgdGhlIG9wZXJh
dG9ycyBtYXkgaGVscCByZWFkYWJpbGl0eSBhIGxpdHRsZS4KCj4gK3N0YXRpYyBpbnQgcGh5X3dy
aXRlKHN0cnVjdCBwaHkgKnBoeSwgdTMyIHZhbHVlLCB1bnNpZ25lZCBpbnQgcmVnKQo+ICt7Cj4g
KwlzdHJ1Y3QgbWl4ZWxfZHBoeV9wcml2ICpwcml2ID0gcGh5X2dldF9kcnZkYXRhKHBoeSk7Cj4g
KwlpbnQgcmV0Owo+ICsKPiArCXJldCA9IHJlZ21hcF93cml0ZShwcml2LT5yZWdtYXAsIHJlZywg
dmFsdWUpOwo+ICsJaWYgKHJldCA8IDApCj4gKwkJZGV2X2VycigmcGh5LT5kZXYsICJGYWlsZWQg
dG8gd3JpdGUgRFBIWSByZWcgJWQ6ICVkIiwgcmVnLCByZXQpOwoKSSBoYXZlIHJlY2VudGx5IGxl
YXJuZWQgdGhhdCBvbmUgaGFzIHRvIHJlbWVtYmVyIHRyYWlsaWduICJcbiItIHBsZWFzZQphZGQu
CkNoZWNrIGFsbCBvdGhlciBkZXZfeHh4IGFzIEkgbm90aWNlZCB0aGUgbmV3bGluZSBpcyBtaXNz
aW5nIGluIGEgZmV3Cm1vcmUgcGxhY2VzLgoKPiArCj4gKwlkZXZfZGJnKCZwaHktPmRldiwgImhz
X2Nsay9yZWZfY2xrPSVsZC8lbGQg4qmwICVkLyVkXG4iLAogICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBeCgpUaGVyZSB3YXMgYW5vdGhlciBvZiB0aGUg
c3ltYm9scyBteSB0ZXJtaW5hbCBjYW5ub3Qgc2hvdy4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
