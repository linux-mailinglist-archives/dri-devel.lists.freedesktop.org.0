Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C60257CE7
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2019 09:12:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47B2D6E7F5;
	Thu, 27 Jun 2019 07:11:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74FD26E42D
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2019 13:32:23 +0000 (UTC)
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 1DB852009AC;
 Wed, 26 Jun 2019 15:32:22 +0200 (CEST)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com
 [134.27.226.22])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 1069F2009AB;
 Wed, 26 Jun 2019 15:32:22 +0200 (CEST)
Received: from fsr-ub1664-120.ea.freescale.net
 (fsr-ub1664-120.ea.freescale.net [10.171.82.81])
 by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 6078A205DB;
 Wed, 26 Jun 2019 15:32:21 +0200 (CEST)
From: Robert Chiras <robert.chiras@nxp.com>
To: Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Subject: [PATCH 00/10] Improvements and fixes for mxsfb DRM driver
Date: Wed, 26 Jun 2019 16:32:08 +0300
Message-Id: <1561555938-21595-1-git-send-email-robert.chiras@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Thu, 27 Jun 2019 07:11:26 +0000
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Robert Chiras <robert.chiras@nxp.com>, linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBwYXRjaC1zZXQgaW1wcm92ZXMgdGhlIHVzZSBvZiBlTENESUYgYmxvY2sgb24gaU1YIDgg
U29DcyAobGlrZSA4TVEsIDhNTQphbmQgOFFYUCkuIEZvbGxvd2luZywgYXJlIHRoZSBuZXcgZmVh
dHVyZXMgYWRkZWQgYW5kIGZpeGVzIGZyb20gdGhpcwpwYXRjaC1zZXQ6CgoxLiBBZGQgc3VwcG9y
dCBmb3IgZHJtX2JyaWRnZQpPbiA4TVEgYW5kIDhNTSwgdGhlIExDRElGIGJsb2NrIGlzIG5vdCBk
aXJlY3RseSBjb25uZWN0ZWQgdG8gYSBwYXJhbGxlbApkaXNwbGF5IGNvbm5lY3Rvciwgd2hlcmUg
YW4gTENEIHBhbmVsIGNhbiBiZSBhdHRhY2hlZCwgYnV0IGluc3RlYWQgaXQgaXMKY29ubmVjdGVk
IHRvIERTSSBjb250cm9sbGVyLiBTaW5jZSB0aGlzIERTSSBzdGFuZHMgYmV0d2VlbiB0aGUgZGlz
cGxheQpjb250cm9sbGVyIChlTENESUYpIGFuZCB0aGUgcGh5c2ljYWwgY29ubmVjdG9yLCB0aGUg
RFNJIGNhbiBiZSBpbXBsZW1lbnRlZAphcyBhIERSTSBicmlkZ2UuIFNvLCBpbiBvcmRlciB0byBi
ZSBhYmxlIHRvIGNvbm5lY3QgdGhlIG14c2ZiIGRyaXZlciB0bwp0aGUgRFNJIGRyaXZlciwgdGhl
IHN1cHBvcnQgZm9yIGEgZHJtX2JyaWRnZSB3YXMgbmVlZGVkIGluIG14c2ZiIERSTQpkcml2ZXIg
KHRoZSBhY3R1YWwgZHJpdmVyIGZvciB0aGUgZUxDRElGIGJsb2NrKS4KCjIuIEFkZCBzdXBwb3J0
IGZvciBhZGRpdGlvbmFsIHBpeGVsIGZvcm1hdHMKU29tZSBvZiB0aGUgcGl4ZWwgZm9ybWF0cyBu
ZWVkZWQgYnkgQW5kcm9pZCB3ZXJlIG5vdCBpbXBsZW1lbnRlZCBpbiB0aGlzCmRyaXZlciwgYnV0
IHRoZXkgd2VyZSBhY3R1YWxseSBzdXBwb3J0ZWQuIFNvLCBhZGQgc3VwcG9ydCBmb3IgdGhlbS4K
CjMuIEFkZCBzdXBwb3J0IGZvciBob3Jpem9udGFsIHN0cmlkZQpIYXZpbmcgc3VwcG9ydCBmb3Ig
aG9yaXpvbnRhbCBzdHJpZGUgYWxsb3dzIHRoZSB1c2Ugb2YgZUxDRElGIHdpdGggYSBHUFUKKGZv
ciBleGFtcGxlKSB0aGF0IGNhbiBvbmx5IG91dHB1dCByZXNvbHV0aW9uIHNpemVzIG11bHRpcGxl
IG9mIGEgcG93ZXIgb2YKOC4gRm9yIGV4YW1wbGUsIDEwODAgaXMgbm90IGEgcG93ZXIgb2YgMTYs
IHNvIGluIG9yZGVyIHRvIHN1cHBvcnQgMTkyMHgxMDgwCm91dHB1dCBmcm9tIEdQVXMgdGhhdCBj
YW4gcHJvZHVjZSBsaW5lYXIgYnVmZmVycyBvbmx5IGluIHNpemVzIG11bHRpcGxlIHRvIDE2LAp0
aGlzIGZlYXR1cmUgaXMgbmVlZGVkLgoKMy4gRmV3IG1pbm9yIGZlYXR1cmVzIGFuZCBidWctZml4
aW5nClRoZSBhZGRpdGlvbiBvZiBtYXgtcmVzIERUIHByb3BlcnR5IHdhcyBhY3R1YWxseSBuZWVk
ZWQgaW4gb3JkZXIgdG8gbGltaXQKdGhlIGJhbmR3aWR0aCB1c2FnZSBvZiB0aGUgZUxDRElGIGJs
b2NrLiBUaGlzIGlzIG5lZWQgb24gc3lzdGVtcyB3aGVyZQptdWx0aXBsZSBkaXNwbGF5IGNvbnRy
b2xsZXJzIGFyZSBwcmVzZW5kIGFuZCB0aGUgbWVtb3J5IGJhbmR3aWR0aCBpcyBub3QKZW5vdWdo
IHRvIGhhbmRsZSBhbGwgb2YgdGhlbSBhdCBtYXhpbXVtIGNhcGFjaXR5IChsaWtlIGl0IGlzIHRo
ZSBjYXNlIG9uCjhNUSwgd2hlcmUgdGhlcmUgYXJlIHR3byBkaXNwbGF5IGNvbnRyb2xsZXJzOiBE
Q1NTIGFuZCBlTENESUYpLgpUaGUgcmVzdCBvZiB0aGUgcGF0Y2hlcyBhcmUgYnVnLWZpeGVzLgoK
TWlyZWxhIFJhYnVsZWEgKDEpOgogIGRybS9teHNmYjogU2lnbmFsIG1vZGUgY2hhbmdlZCB3aGVu
IGJwcCBjaGFuZ2VkCgpSb2JlcnQgQ2hpcmFzICg5KToKICBkcm0vbXhzZmI6IFVwZGF0ZSBteHNm
YiB0byBzdXBwb3J0IGEgYnJpZGdlCiAgZHJtL214c2ZiOiBVcGRhdGUgbXhzZmIgd2l0aCBhZGRp
dGlvbmFsIHBpeGVsIGZvcm1hdHMKICBkcm0vbXhzZmI6IEZpeCB0aGUgdmJsYW5rIGV2ZW50cwog
IGR0LWJpbmRpbmdzOiBkaXNwbGF5OiBBZGQgbWF4LXJlcyBwcm9wZXJ0eSBmb3IgbXhzZmIKICBk
cm0vbXhzZmI6IEFkZCBtYXgtcmVzIHByb3BlcnR5IGZvciBNWFNGQgogIGRybS9teHNmYjogVXBk
YXRlIG14c2ZiIHRvIHN1cHBvcnQgTENEIHJlc2V0CiAgZHJtL214c2ZiOiBJbXByb3ZlIHRoZSBh
eGkgY2xvY2sgdXNhZ2UKICBkcm0vbXhzZmI6IENsZWFyIE9VVFNUQU5ESU5HX1JFUVMgYml0cwog
IGRybS9teHNmYjogQWRkIHN1cHBvcnQgZm9yIGhvcml6b250YWwgc3RyaWRlCgogLi4uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvZGlzcGxheS9teHNmYi50eHQgICAgICAgICAgfCAgIDYgKwogZHJpdmVy
cy9ncHUvZHJtL214c2ZiL214c2ZiX2NydGMuYyAgICAgICAgICAgICAgICAgfCAyOTAgKysrKysr
KysrKysrKysrKysrLS0tCiBkcml2ZXJzL2dwdS9kcm0vbXhzZmIvbXhzZmJfZHJ2LmMgICAgICAg
ICAgICAgICAgICB8IDE4OSArKysrKysrKysrKy0tLQogZHJpdmVycy9ncHUvZHJtL214c2ZiL214
c2ZiX2Rydi5oICAgICAgICAgICAgICAgICAgfCAgMTAgKy0KIGRyaXZlcnMvZ3B1L2RybS9teHNm
Yi9teHNmYl9vdXQuYyAgICAgICAgICAgICAgICAgIHwgIDI2ICstCiBkcml2ZXJzL2dwdS9kcm0v
bXhzZmIvbXhzZmJfcmVncy5oICAgICAgICAgICAgICAgICB8IDEyOCArKysrKystLS0KIDYgZmls
ZXMgY2hhbmdlZCwgNTMxIGluc2VydGlvbnMoKyksIDExOCBkZWxldGlvbnMoLSkKCi0tIAoyLjcu
NAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
