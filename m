Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B144B21A4A
	for <lists+dri-devel@lfdr.de>; Fri, 17 May 2019 17:06:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F3C6898B7;
	Fri, 17 May 2019 15:06:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 741A9898B7
 for <dri-devel@lists.freedesktop.org>; Fri, 17 May 2019 15:06:04 +0000 (UTC)
X-Originating-IP: 90.88.22.185
Received: from localhost.localdomain
 (aaubervilliers-681-1-80-185.w90-88.abo.wanadoo.fr [90.88.22.185])
 (Authenticated sender: paul.kocialkowski@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 17FCF24000F;
 Fri, 17 May 2019 15:05:57 +0000 (UTC)
From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] backlight: gpio-backlight: Set power state instead of
 brightness at probe
Date: Fri, 17 May 2019 17:05:46 +0200
Message-Id: <20190517150546.4508-1-paul.kocialkowski@bootlin.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jingoo Han <jingoohan1@gmail.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gYSB0cml2aWFsIGdwaW8tYmFja2xpZ2h0IHNldHVwIHdpdGggYSBwYW5lbCB1c2luZyB0aGUg
YmFja2xpZ2h0IGJ1dApubyBib290IHNvZnR3YXJlIHRvIGVuYWJsZSBpdCBiZWZvcmVoYW5kLCB3
ZSBmYWxsIGluIGEgY2FzZSB3aGVyZSB0aGUKYmFja2xpZ2h0IGlzIGRpc2FibGVkIChub3QganVz
dCBibGFua2VkKSBhbmQgdGh1cyByZW1haW5zIGRpc2FibGVkIHdoZW4KdGhlIHBhbmVsIGdldHMg
ZW5hYmxlZC4KClNldHRpbmcgZ2JsLT5kZWZfdmFsdWUgdmlhIHRoZSBkZXZpY2UtdHJlZSBwcm9w
IGFsbG93cyBlbmFibGluZyB0aGUKYmFja2xpZ2h0IGluIHRoaXMgc2l0dWF0aW9uLCBidXQgaXQg
d2lsbCBiZSB1bmJsYW5rZWQgc3RyYWlnaHQgYXdheSwKaW4gY29tcGxpYW5jZSB3aXRoIHRoZSBi
aW5kaW5nLiBUaGlzIGRvZXMgbm90IHdvcmsgd2VsbCB3aGVuIHRoZXJlIHdhcyBubwpib290IHNv
ZnR3YXJlIHRvIGRpc3BsYXkgc29tZXRoaW5nIGJlZm9yZSwgc2luY2Ugd2UgcmVhbGx5IG5lZWQg
dG8gdW5ibGFuawpieSB0aGUgdGltZSB0aGUgcGFuZWwgaXMgZW5hYmxlZCwgbm90IGJlZm9yZS4K
ClJlc29sdmUgdGhlIHNpdHVhdGlvbiBieSBzZXR0aW5nIHRoZSBicmlnaHRuZXNzIHRvIDEgYXQg
cHJvYmUgYW5kCm1hbmFnaW5nIHRoZSBwb3dlciBzdGF0ZSBhY2NvcmRpbmdseSwgYSBiaXQgbGlr
ZSBpdCdzIGRvbmUgaW4KcHdtLWJhY2tsaWdodC4KCkZpeGVzOiA4Yjc3MGUzYzk4MjQgKCJiYWNr
bGlnaHQ6IEFkZCBHUElPLWJhc2VkIGJhY2tsaWdodCBkcml2ZXIiKQpTaWduZWQtb2ZmLWJ5OiBQ
YXVsIEtvY2lhbGtvd3NraSA8cGF1bC5rb2NpYWxrb3dza2lAYm9vdGxpbi5jb20+Ci0tLQogZHJp
dmVycy92aWRlby9iYWNrbGlnaHQvZ3Bpb19iYWNrbGlnaHQuYyB8IDE5ICsrKysrKysrKysrKysr
KysrKy0KIDEgZmlsZSBjaGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy92aWRlby9iYWNrbGlnaHQvZ3Bpb19iYWNrbGlnaHQuYyBiL2Ry
aXZlcnMvdmlkZW8vYmFja2xpZ2h0L2dwaW9fYmFja2xpZ2h0LmMKaW5kZXggZTQ3MGRhOTVkODA2
Li5jOWNiOTdmYTEzZDAgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L2dwaW9f
YmFja2xpZ2h0LmMKKysrIGIvZHJpdmVycy92aWRlby9iYWNrbGlnaHQvZ3Bpb19iYWNrbGlnaHQu
YwpAQCAtNTcsNiArNTcsMjEgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBiYWNrbGlnaHRfb3BzIGdw
aW9fYmFja2xpZ2h0X29wcyA9IHsKIAkuY2hlY2tfZmIJPSBncGlvX2JhY2tsaWdodF9jaGVja19m
YiwKIH07CiAKK3N0YXRpYyBpbnQgZ3Bpb19iYWNrbGlnaHRfaW5pdGlhbF9wb3dlcl9zdGF0ZShz
dHJ1Y3QgZ3Bpb19iYWNrbGlnaHQgKmdibCkKK3sKKwlzdHJ1Y3QgZGV2aWNlX25vZGUgKm5vZGUg
PSBnYmwtPmRldi0+b2Zfbm9kZTsKKworCS8qIElmIHdlIGFic29sdXRlbHkgd2FudCB0aGUgYmFj
a2xpZ2h0IGVuYWJsZWQgYXQgYm9vdC4gKi8KKwlpZiAoZ2JsLT5kZWZfdmFsdWUpCisJCXJldHVy
biBGQl9CTEFOS19VTkJMQU5LOworCisJLyogSWYgdGhlcmUncyBubyBwYW5lbCB0byB1bmJsYW5r
IHRoZSBiYWNrbGlnaHQgbGF0ZXIuICovCisJaWYgKCFub2RlIHx8ICFub2RlLT5waGFuZGxlKQor
CQlyZXR1cm4gRkJfQkxBTktfVU5CTEFOSzsKKworCXJldHVybiBGQl9CTEFOS19QT1dFUkRPV047
Cit9CisKIHN0YXRpYyBpbnQgZ3Bpb19iYWNrbGlnaHRfcHJvYmVfZHQoc3RydWN0IHBsYXRmb3Jt
X2RldmljZSAqcGRldiwKIAkJCQkgICBzdHJ1Y3QgZ3Bpb19iYWNrbGlnaHQgKmdibCkKIHsKQEAg
LTE0Miw3ICsxNTcsOSBAQCBzdGF0aWMgaW50IGdwaW9fYmFja2xpZ2h0X3Byb2JlKHN0cnVjdCBw
bGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJCXJldHVybiBQVFJfRVJSKGJsKTsKIAl9CiAKLQlibC0+
cHJvcHMuYnJpZ2h0bmVzcyA9IGdibC0+ZGVmX3ZhbHVlOworCWJsLT5wcm9wcy5icmlnaHRuZXNz
ID0gMTsKKwlibC0+cHJvcHMucG93ZXIgPSBncGlvX2JhY2tsaWdodF9pbml0aWFsX3Bvd2VyX3N0
YXRlKGdibCk7CisKIAliYWNrbGlnaHRfdXBkYXRlX3N0YXR1cyhibCk7CiAKIAlwbGF0Zm9ybV9z
ZXRfZHJ2ZGF0YShwZGV2LCBibCk7Ci0tIAoyLjIxLjAKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
