Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3827D4E132
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2019 09:23:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09FED6E84A;
	Fri, 21 Jun 2019 07:23:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DD336E57A
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2019 13:30:34 +0000 (UTC)
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id D317820077D;
 Thu, 20 Jun 2019 15:30:32 +0200 (CEST)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com
 [134.27.226.22])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id C6092200791;
 Thu, 20 Jun 2019 15:30:32 +0200 (CEST)
Received: from fsr-ub1664-120.ea.freescale.net
 (fsr-ub1664-120.ea.freescale.net [10.171.82.81])
 by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 4EE7620629;
 Thu, 20 Jun 2019 15:30:32 +0200 (CEST)
From: Robert Chiras <robert.chiras@nxp.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH v3 0/2] Add DSI panel driver for Raydium RM67191
Date: Thu, 20 Jun 2019 16:30:26 +0300
Message-Id: <1561037428-13855-1-git-send-email-robert.chiras@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Fri, 21 Jun 2019 07:22:42 +0000
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
Cc: Robert Chiras <robert.chiras@nxp.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-imx@nxp.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBwYXRjaC1zZXQgY29udGFpbnMgdGhlIERSTSBwYW5lbCBkcml2ZXIgYW5kIGR0LWJpbmRp
bmdzIGRvY3VtZW50YXRpb24KZm9yIHRoZSBEU0kgZHJpdmVuIHBhbmVsOiBSYXlkaXVtIFJNNjcx
OTEuCgp2MzoKLSBBZGRlZCBteXNlbGYgdG8gTUFJTlRBSU5FUlMgZm9yIHRoaXMgZHJpdmVyIChz
YW0pCi0gUmVtb3ZlZCBkaXNwbGF5LXRpbWluZ3MgcHJvcGVydHkgKGZhYmlvKQotIEZpeGVkIGR0
IGRlc2NyaXB0aW9uIChzYW0pCi0gUmUtYXJyYW5nZWQgY2FsbHMgaW5zaWRlIGdldF9tb2RlcyBm
dW5jdGlvbiAoc2FtKQotIENoYW5nZWQgaWZkZWZzIHdpdGggX21heWJlX3VudXNlZCBmb3Igc3Vz
cGVuZC9yZXN1bWUgZnVuY3Rpb25zIChzYW0pCi0gQ29sbGVjdGVkIFJldmlld2VkLWJ5IGZyb20g
U2FtCgp2MjoKLSBGaXhlZCAncmVzZXQtZ3BpbycgdG8gJ3Jlc2V0LWdwaW9zJyBwcm9wZXJ0eSBu
YW1pbmcgKGZhYmlvKQotIENoYW5nZWQgdGhlIHN0YXRlIG9mIHRoZSByZXNldCBncGlvIHRvIGFj
dGl2ZSBsb3cgYW5kIGZpeGVkIGhvdyBpdCBpcwogIGhhbmRsZWQgaW4gZHJpdmVyIChmYWJpbykK
LSBGaXhlZCBjb3B5cmlnaHQgc3RhdGVtZW50IChkYW5pZWwpCi0gUmVvcmRlcmVkIGluY2x1ZGVz
IChzYW0pCi0gQWRkZWQgZGVmaW5lcyBmb3IgcGFuZWwgc3BlY2lmaWMgY29sb3IgZm9ybWF0cyAo
ZmFiaW8pCi0gUmVtb3ZlZCB1bm5lY2Vzc2FyeSB0ZXN0cyBpbiBlbmFibGUgYW5kIHVucHJlcGFy
ZSAoc2FtKQotIFJlbW92ZWQgdGhlIHVubmVjZXNzYXJ5IGJhY2tsaWdodCB3cml0ZSBpbiBlbmFi
bGUgKHNhbSkKClJvYmVydCBDaGlyYXMgKDIpOgogIGR0LWJpbmRpbmdzOiBkaXNwbGF5OiBwYW5l
bDogQWRkIHN1cHBvcnQgZm9yIFJheWRpdW0gUk02NzE5MSBwYW5lbAogIGRybS9wYW5lbDogQWRk
IHN1cHBvcnQgZm9yIFJheWRpdW0gUk02NzE5MSBwYW5lbCBkcml2ZXIKCiAuLi4vYmluZGluZ3Mv
ZGlzcGxheS9wYW5lbC9yYXlkaXVtLHJtNjcxOTEudHh0ICAgICB8ICAzOSArKwogTUFJTlRBSU5F
UlMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDYgKwogZHJpdmVy
cy9ncHUvZHJtL3BhbmVsL0tjb25maWcgICAgICAgICAgICAgICAgICAgICAgfCAgIDkgKwogZHJp
dmVycy9ncHUvZHJtL3BhbmVsL01ha2VmaWxlICAgICAgICAgICAgICAgICAgICAgfCAgIDEgKwog
ZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXJheWRpdW0tcm02NzE5MS5jICAgICAgfCA2OTAg
KysrKysrKysrKysrKysrKysrKysrCiA1IGZpbGVzIGNoYW5nZWQsIDc0NSBpbnNlcnRpb25zKCsp
CiBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rp
c3BsYXkvcGFuZWwvcmF5ZGl1bSxybTY3MTkxLnR4dAogY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZl
cnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1yYXlkaXVtLXJtNjcxOTEuYwoKLS0gCjIuNy40CgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
