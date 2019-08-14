Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 415CC8E6DF
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2019 10:37:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D78F6E935;
	Thu, 15 Aug 2019 08:35:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DF316E5D8
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2019 10:57:03 +0000 (UTC)
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 189B01A0384;
 Wed, 14 Aug 2019 12:48:56 +0200 (CEST)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com
 [134.27.226.22])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 0BE661A037B;
 Wed, 14 Aug 2019 12:48:56 +0200 (CEST)
Received: from fsr-ub1664-120.ea.freescale.net
 (fsr-ub1664-120.ea.freescale.net [10.171.82.81])
 by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 0FDB02060E;
 Wed, 14 Aug 2019 12:48:55 +0200 (CEST)
From: Robert Chiras <robert.chiras@nxp.com>
To: =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>,
 Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2 00/15] Improvements and fixes for mxsfb DRM driver
Date: Wed, 14 Aug 2019 13:48:36 +0300
Message-Id: <1565779731-1300-1-git-send-email-robert.chiras@nxp.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Thu, 15 Aug 2019 08:34:55 +0000
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
 linux-arm-kernel@lists.infradead.org
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
djI6Ci0gQ29sbGVjdGVkIFRlc3RlZC1ieSBmcm9tIEd1aWRvCi0gU3BsaXQgdGhlIGZpcnN0IHBh
dGNoLCB3aGljaCBhZGRlZCBtb3JlIHRoYW4gb25lIGZlYXR1cmUgaW50byByZWxldmFudAogIHBh
dGNoZXMsIGV4cGxhaW5pbmcgZWFjaCBmZWF0dXJlIGFkZGVkCi0gQWxzbyBzcGxpdCB0aGUgc2Vj
b25kIHBhdGNoIGludG8gbW9yZSBwYXRjaGVzLCB0byBkaWZmZXJlbnRpYXRlIGJldHdlZW4KICB0
aGUgZmVhdHVyZSBpdHNlbGYgKGFkZGl0aW9uYWwgcGl4ZWwgZm9ybWF0cyBzdXBwb3J0KSBhbmQg
dGhlIGNsZWFudXAKICBvZiB0aGUgcmVnaXN0ZXIgZGVmaW5pdGlvbnMgZm9yIGEgYmV0dGVyIHJl
cHJlc2VudGF0aW9uIChndWlkbykKLSBJbmNsdWRlZCBhIHBhdGNoIHN1Ym1pdHRlZCBieSBHdWlk
bywgd2hpbGUgaGUgd2FzIHRlc3RpbmcgbXkgcGF0Y2gtc2V0CgpHdWlkbyBHw7xudGhlciAoMSk6
CiAgZHJtL214c2ZiOiBSZWFkIGJ1cyBmbGFncyBmcm9tIGJyaWRnZSBpZiBwcmVzZW50CgpNaXJl
bGEgUmFidWxlYSAoMSk6CiAgZHJtL214c2ZiOiBTaWduYWwgbW9kZSBjaGFuZ2VkIHdoZW4gYnBw
IGNoYW5nZWQKClJvYmVydCBDaGlyYXMgKDEzKToKICBkcm0vbXhzZmI6IFVwZGF0ZSBteHNmYiB0
byBzdXBwb3J0IGEgYnJpZGdlCiAgZHJtL214c2ZiOiBBZGQgZGVmaW5lcyBmb3IgdGhlIHJlc3Qg
b2YgcmVnaXN0ZXJzCiAgZHJtL214c2ZiOiBSZXNldCB2aXRhbCByZWdpc3RlciBmb3IgYSBwcm9w
ZXIgaW5pdGlhbGl6YXRpb24KICBkcm0vbXhzZmI6IFVwZGF0ZSByZWdpc3RlciBkZWZpbml0aW9u
cyB1c2luZyBiaXQgbWFuaXB1bGF0aW9uIGRlZmluZXMKICBkcm0vbXhzZmI6IFVwZGF0ZSBteHNm
YiB3aXRoIGFkZGl0aW9uYWwgcGl4ZWwgZm9ybWF0cwogIGRybS9teHNmYjogRml4IHRoZSB2Ymxh
bmsgZXZlbnRzCiAgZHQtYmluZGluZ3M6IGRpc3BsYXk6IEFkZCBtYXgtcmVzIHByb3BlcnR5IGZv
ciBteHNmYgogIGRybS9teHNmYjogQWRkIG1heC1yZXMgcHJvcGVydHkgZm9yIE1YU0ZCCiAgZHJt
L214c2ZiOiBVcGRhdGUgbXhzZmIgdG8gc3VwcG9ydCBMQ0QgcmVzZXQKICBkcm0vbXhzZmI6IElt
cHJvdmUgdGhlIGF4aSBjbG9jayB1c2FnZQogIGRybS9teHNmYjogQ2xlYXIgT1VUU1RBTkRJTkdf
UkVRUyBiaXRzCiAgZHJtL214c2ZiOiBBZGQgc3VwcG9ydCBmb3IgaG9yaXpvbnRhbCBzdHJpZGUK
ICBkcm0vbXhzZmI6IEFkZCBzdXBwb3J0IGZvciBsaXZlIHBpeGVsIGZvcm1hdCBjaGFuZ2UKCiAu
Li4vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L214c2ZiLnR4dCAgICAgICAgICB8ICAgNiAr
CiBkcml2ZXJzL2dwdS9kcm0vbXhzZmIvbXhzZmJfY3J0Yy5jICAgICAgICAgICAgICAgICB8IDI4
NyArKysrKysrKysrKysrKysrKystLS0KIGRyaXZlcnMvZ3B1L2RybS9teHNmYi9teHNmYl9kcnYu
YyAgICAgICAgICAgICAgICAgIHwgMTkwICsrKysrKysrKysrLS0tCiBkcml2ZXJzL2dwdS9kcm0v
bXhzZmIvbXhzZmJfZHJ2LmggICAgICAgICAgICAgICAgICB8ICAxMCArLQogZHJpdmVycy9ncHUv
ZHJtL214c2ZiL214c2ZiX291dC5jICAgICAgICAgICAgICAgICAgfCAgMjYgKy0KIGRyaXZlcnMv
Z3B1L2RybS9teHNmYi9teHNmYl9yZWdzLmggICAgICAgICAgICAgICAgIHwgMTkzICsrKysrKysr
Ky0tLS0tCiA2IGZpbGVzIGNoYW5nZWQsIDU3MyBpbnNlcnRpb25zKCspLCAxMzkgZGVsZXRpb25z
KC0pCgotLSAKMi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
