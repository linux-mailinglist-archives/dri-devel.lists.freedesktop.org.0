Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73507510D5
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2019 17:40:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BA3F89C93;
	Mon, 24 Jun 2019 15:40:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74E2C89C93
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 15:40:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 1752A89C38;
 Mon, 24 Jun 2019 15:40:18 +0000 (UTC)
Received: from shalem.localdomain.com (ovpn-116-153.ams2.redhat.com
 [10.36.116.153])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 00C1619723;
 Mon, 24 Jun 2019 15:40:16 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Sean Paul <seanpaul@chromium.org>
Subject: [PATCH] drm: panel-orientation-quirks: Add extra quirk table entry
 for GPD MicroPC
Date: Mon, 24 Jun 2019 17:40:14 +0200
Message-Id: <20190624154014.8557-2-hdegoede@redhat.com>
In-Reply-To: <20190624154014.8557-1-hdegoede@redhat.com>
References: <20190624154014.8557-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.27]); Mon, 24 Jun 2019 15:40:18 +0000 (UTC)
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
Cc: Hans de Goede <hdegoede@redhat.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TmV3ZXIgR1BEIE1pY3JvUEMgQklPUyB2ZXJzaW9ucyBoYXZlIHByb3BlciBETUkgc3RyaW5ncywg
YWRkIGFuIGV4dHJhIHF1aXJrCnRhYmxlIGVudHJ5IGZvciB0aGVzZSBuZXcgc3RyaW5ncy4gVGhp
cyBpcyBnb29kIG5ld3MsIGFzIHRoaXMgbWVhbnMgdGhhdCB3ZQpubyBsb25nZXIgaGF2ZSB0byB1
cGRhdGUgdGhlIEJJT1MgZGF0ZXMgbGlzdCB3aXRoIGV2ZXJ5IEJJT1MgdXBkYXRlLgoKRml4ZXM6
IDY1MmI4YjA4NjUzOCgiZHJtOiBwYW5lbC1vcmllbnRhdGlvbi1xdWlya3M6IEFkZCBxdWlyayBm
b3IgR1BEIE1pY3JvUEMiKQpTaWduZWQtb2ZmLWJ5OiBIYW5zIGRlIEdvZWRlIDxoZGVnb2VkZUBy
ZWRoYXQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fcGFuZWxfb3JpZW50YXRpb25fcXVp
cmtzLmMgfCAxMiArKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCsp
CgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9wYW5lbF9vcmllbnRhdGlvbl9xdWly
a3MuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fcGFuZWxfb3JpZW50YXRpb25fcXVpcmtzLmMKaW5k
ZXggZDhhMGJjZDAyZjM0Li5mZmQ5NWJmZWFhOTQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9kcm1fcGFuZWxfb3JpZW50YXRpb25fcXVpcmtzLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2Ry
bV9wYW5lbF9vcmllbnRhdGlvbl9xdWlya3MuYwpAQCAtOTAsNiArOTAsMTIgQEAgc3RhdGljIGNv
bnN0IHN0cnVjdCBkcm1fZG1pX3BhbmVsX29yaWVudGF0aW9uX2RhdGEgaXR3b3Jrc190dzg5MSA9
IHsKIAkub3JpZW50YXRpb24gPSBEUk1fTU9ERV9QQU5FTF9PUklFTlRBVElPTl9SSUdIVF9VUCwK
IH07CiAKK3N0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2RtaV9wYW5lbF9vcmllbnRhdGlvbl9kYXRh
IGxjZDcyMHgxMjgwX3JpZ2h0c2lkZV91cCA9IHsKKwkud2lkdGggPSA3MjAsCisJLmhlaWdodCA9
IDEyODAsCisJLm9yaWVudGF0aW9uID0gRFJNX01PREVfUEFORUxfT1JJRU5UQVRJT05fUklHSFRf
VVAsCit9OworCiBzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9kbWlfcGFuZWxfb3JpZW50YXRpb25f
ZGF0YSBsY2Q4MDB4MTI4MF9yaWdodHNpZGVfdXAgPSB7CiAJLndpZHRoID0gODAwLAogCS5oZWln
aHQgPSAxMjgwLApAQCAtMTIzLDYgKzEyOSwxMiBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGRtaV9z
eXN0ZW1faWQgb3JpZW50YXRpb25fZGF0YVtdID0gewogCQkgIERNSV9FWEFDVF9NQVRDSChETUlf
Qk9BUkRfTkFNRSwgIkRlZmF1bHQgc3RyaW5nIiksCiAJCX0sCiAJCS5kcml2ZXJfZGF0YSA9ICh2
b2lkICopJmdwZF9taWNyb3BjLAorCX0sIHsJLyogR1BEIE1pY3JvUEMgKGxhdGVyIEJJT1MgdmVy
c2lvbnMgd2l0aCBwcm9wZXIgRE1JIHN0cmluZ3MpICovCisJCS5tYXRjaGVzID0geworCQkgIERN
SV9FWEFDVF9NQVRDSChETUlfU1lTX1ZFTkRPUiwgIkdQRCIpLAorCQkgIERNSV9FWEFDVF9NQVRD
SChETUlfUFJPRFVDVF9OQU1FLCAiTWljcm9QQyIpLAorCQl9LAorCQkuZHJpdmVyX2RhdGEgPSAo
dm9pZCAqKSZsY2Q3MjB4MTI4MF9yaWdodHNpZGVfdXAsCiAJfSwgewkvKgogCQkgKiBHUEQgUG9j
a2V0LCBub3RlIHRoYXQgdGhlIHRoZSBETUkgZGF0YSBpcyBsZXNzIGdlbmVyaWMgdGhlbgogCQkg
KiBpdCBzZWVtcywgZGV2aWNlcyB3aXRoIGEgYm9hcmQtdmVuZG9yIG9mICJBTUkgQ29ycG9yYXRp
b24iCi0tIAoyLjIxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
