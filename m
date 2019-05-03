Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B58C13130
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2019 17:32:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6093E6E7F5;
	Fri,  3 May 2019 15:32:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.101.70])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7972C6E7F5
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2019 15:31:59 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5AB2D80D;
 Fri,  3 May 2019 08:31:59 -0700 (PDT)
Received: from e110467-lin.cambridge.arm.com (e110467-lin.cambridge.arm.com
 [10.1.196.75])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 17E963F557;
 Fri,  3 May 2019 08:31:57 -0700 (PDT)
From: Robin Murphy <robin.murphy@arm.com>
To: robh@kernel.org,
	tomeu.vizoso@collabora.com
Subject: [PATCH 1/4] drm/panfrost: Set DMA masks earlier
Date: Fri,  3 May 2019 16:31:42 +0100
Message-Id: <64361b929a5c61d2ab9580262ecb3d369164cfcb.1556195258.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.21.0.dirty
In-Reply-To: <cover.1556195258.git.robin.murphy@arm.com>
References: <cover.1556195258.git.robin.murphy@arm.com>
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIERNQSBtYXNrcyBuZWVkIHRvIGJlIHNldCBjb3JyZWN0bHkgYmVmb3JlIGFueSBETUEgQVBJ
IGFjdGl2aXR5IGtpY2tzCm9mZiwgYW5kIHRoZSBjdXJyZW50IHBvaW50IGluIHBhbmZyb3N0X3By
b2JlKCkgaXMgd2F5IHRvbyBsYXRlIGluIHRoYXQKcmVnYXJkLiBzaW5jZSBwYW5mcm9zdF9tbXVf
aW5pdCgpIGhhcyBhbHJlYWR5IHNldCB1cCBhIGxpdmUgYWRkcmVzcwpzcGFjZSBhbmQgRE1BLW1h
cHBlZCBNTVUgcGFnZXRhYmxlcy4gV2UgY2FuJ3Qgc2V0IG1hc2tzIHVudGlsIHdlJ3ZlCnF1ZXJp
ZWQgdGhlIGFwcHJvcHJpYXRlIHZhbHVlIGZyb20gTU1VX0ZFQVRVUkVTLCBidXQgYXMgc29vbiBh
cwpyZWFzb25hYmx5IHBvc3NpYmxlIGFmdGVyIHRoYXQgc2hvdWxkIHN1ZmZpY2UuCgpTaWduZWQt
b2ZmLWJ5OiBSb2JpbiBNdXJwaHkgPHJvYmluLm11cnBoeUBhcm0uY29tPgotLS0KIGRyaXZlcnMv
Z3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kcnYuYyB8IDUgLS0tLS0KIGRyaXZlcnMvZ3B1L2Ry
bS9wYW5mcm9zdC9wYW5mcm9zdF9ncHUuYyB8IDUgKysrKysKIDIgZmlsZXMgY2hhbmdlZCwgNSBp
bnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9wYW5mcm9zdC9wYW5mcm9zdF9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5m
cm9zdF9kcnYuYwppbmRleCBjMDZhZjc4YWI4MzMuLmFmMDA1OGZmYzFlNCAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2Rydi5jCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kcnYuYwpAQCAtMyw4ICszLDYgQEAKIC8qIENvcHlyaWdo
dCAyMDE5IExpbmFybywgTHRkLiwgUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4gKi8KIC8q
IENvcHlyaWdodCAyMDE5IENvbGxhYm9yYSBsdGQuICovCiAKLSNpbmNsdWRlIDxsaW51eC9iaXRm
aWVsZC5oPgotI2luY2x1ZGUgPGxpbnV4L2RtYS1tYXBwaW5nLmg+CiAjaW5jbHVkZSA8bGludXgv
bW9kdWxlLmg+CiAjaW5jbHVkZSA8bGludXgvb2ZfcGxhdGZvcm0uaD4KICNpbmNsdWRlIDxsaW51
eC9wYWdlbWFwLmg+CkBAIC0zODgsOSArMzg2LDYgQEAgc3RhdGljIGludCBwYW5mcm9zdF9wcm9i
ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCQlnb3RvIGVycl9vdXQwOwogCX0KIAot
CWRtYV9zZXRfbWFza19hbmRfY29oZXJlbnQocGZkZXYtPmRldiwKLQkJRE1BX0JJVF9NQVNLKEZJ
RUxEX0dFVCgweGZmMDAsIHBmZGV2LT5mZWF0dXJlcy5tbXVfZmVhdHVyZXMpKSk7Ci0KIAllcnIg
PSBwYW5mcm9zdF9kZXZmcmVxX2luaXQocGZkZXYpOwogCWlmIChlcnIpIHsKIAkJZGV2X2Vycigm
cGRldi0+ZGV2LCAiRmF0YWwgZXJyb3IgZHVyaW5nIGRldmZyZXEgaW5pdFxuIik7CmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZ3B1LmMgYi9kcml2ZXJzL2dw
dS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZ3B1LmMKaW5kZXggYWNlYWY2ZTQ0YTA5Li40MjUxMWZj
MWZlYTAgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9ncHUu
YworKysgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZ3B1LmMKQEAgLTIsOCAr
MiwxMCBAQAogLyogQ29weXJpZ2h0IDIwMTggTWFydHkgRS4gUGx1bW1lciA8aGFuZXR6ZXJAc3Rh
cnRtYWlsLmNvbT4gKi8KIC8qIENvcHlyaWdodCAyMDE5IExpbmFybywgTHRkLiwgUm9iIEhlcnJp
bmcgPHJvYmhAa2VybmVsLm9yZz4gKi8KIC8qIENvcHlyaWdodCAyMDE5IENvbGxhYm9yYSBsdGQu
ICovCisjaW5jbHVkZSA8bGludXgvYml0ZmllbGQuaD4KICNpbmNsdWRlIDxsaW51eC9iaXRtYXAu
aD4KICNpbmNsdWRlIDxsaW51eC9kZWxheS5oPgorI2luY2x1ZGUgPGxpbnV4L2RtYS1tYXBwaW5n
Lmg+CiAjaW5jbHVkZSA8bGludXgvaW50ZXJydXB0Lmg+CiAjaW5jbHVkZSA8bGludXgvaW8uaD4K
ICNpbmNsdWRlIDxsaW51eC9pb3BvbGwuaD4KQEAgLTMzMiw2ICszMzQsOSBAQCBpbnQgcGFuZnJv
c3RfZ3B1X2luaXQoc3RydWN0IHBhbmZyb3N0X2RldmljZSAqcGZkZXYpCiAKIAlwYW5mcm9zdF9n
cHVfaW5pdF9mZWF0dXJlcyhwZmRldik7CiAKKwlkbWFfc2V0X21hc2tfYW5kX2NvaGVyZW50KHBm
ZGV2LT5kZXYsCisJCURNQV9CSVRfTUFTSyhGSUVMRF9HRVQoMHhmZjAwLCBwZmRldi0+ZmVhdHVy
ZXMubW11X2ZlYXR1cmVzKSkpOworCiAJaXJxID0gcGxhdGZvcm1fZ2V0X2lycV9ieW5hbWUodG9f
cGxhdGZvcm1fZGV2aWNlKHBmZGV2LT5kZXYpLCAiZ3B1Iik7CiAJaWYgKGlycSA8PSAwKQogCQly
ZXR1cm4gLUVOT0RFVjsKLS0gCjIuMjEuMC5kaXJ0eQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
