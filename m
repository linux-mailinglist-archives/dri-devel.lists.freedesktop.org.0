Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D2F529863
	for <lists+dri-devel@lfdr.de>; Fri, 24 May 2019 14:58:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BE7E6E109;
	Fri, 24 May 2019 12:58:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AB5A6E10A
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2019 12:58:15 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 1667A308792E;
 Fri, 24 May 2019 12:58:10 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-112-47.ams2.redhat.com
 [10.36.112.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 89EAA691B1;
 Fri, 24 May 2019 12:58:05 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v2 2/2] drm: panel-orientation-quirks: Add quirk for GPD
 MicroPC
Date: Fri, 24 May 2019 14:57:59 +0200
Message-Id: <20190524125759.14131-2-hdegoede@redhat.com>
In-Reply-To: <20190524125759.14131-1-hdegoede@redhat.com>
References: <20190524125759.14131-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.45]); Fri, 24 May 2019 12:58:15 +0000 (UTC)
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

R1BEIGhhcyBkb25lIGl0IGFnYWluLCBtYWtlIGEgbmljZSBkZXZpY2UgKGdvb2QpLCB1c2Ugd2F5
IHRvbyBnZW5lcmljCkRNSSBzdHJpbmdzIChiYWQpIGFuZCB1c2UgYSBwb3J0cmFpdCBzY3JlZW4g
cm90YXRlZCA5MCBkZWdyZWVzICh1Z2x5KS4KCkJlY2F1c2Ugb2YgdGhlIHRvbyBnZW5lcmljIERN
SSBzdHJpbmdzIHRoaXMgZW50cnkgaXMgYWxzbyBkb2luZyBiaW9zLWRhdGUKbWF0Y2hpbmcsIHNv
IHRoZSBncGRfbWljcm9wYyBkYXRhIHN0cnVjdCBtYXkgdmVyeSB3ZWxsIG5lZWQgdG8gYmUgdXBk
YXRlZAp3aXRoIHNvbWUgZXh0cmEgYmlvcy1kYXRlcyBpbiB0aGUgZnV0dXJlLgoKU2lnbmVkLW9m
Zi1ieTogSGFucyBkZSBHb2VkZSA8aGRlZ29lZGVAcmVkaGF0LmNvbT4KLS0tCiBkcml2ZXJzL2dw
dS9kcm0vZHJtX3BhbmVsX29yaWVudGF0aW9uX3F1aXJrcy5jIHwgMTYgKysrKysrKysrKysrKysr
KwogMSBmaWxlIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vZHJtX3BhbmVsX29yaWVudGF0aW9uX3F1aXJrcy5jIGIvZHJpdmVycy9ncHUvZHJt
L2RybV9wYW5lbF9vcmllbnRhdGlvbl9xdWlya3MuYwppbmRleCA5ODY3OWM4MzFmNjYuLmQ4YTBi
Y2QwMmYzNCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9wYW5lbF9vcmllbnRhdGlv
bl9xdWlya3MuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX3BhbmVsX29yaWVudGF0aW9uX3F1
aXJrcy5jCkBAIC00Miw2ICs0MiwxNCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9kbWlfcGFu
ZWxfb3JpZW50YXRpb25fZGF0YSBhc3VzX3QxMDBoYSA9IHsKIAkub3JpZW50YXRpb24gPSBEUk1f
TU9ERV9QQU5FTF9PUklFTlRBVElPTl9MRUZUX1VQLAogfTsKIAorc3RhdGljIGNvbnN0IHN0cnVj
dCBkcm1fZG1pX3BhbmVsX29yaWVudGF0aW9uX2RhdGEgZ3BkX21pY3JvcGMgPSB7CisJLndpZHRo
ID0gNzIwLAorCS5oZWlnaHQgPSAxMjgwLAorCS5iaW9zX2RhdGVzID0gKGNvbnN0IGNoYXIgKiBj
b25zdCBbXSl7ICIwNC8yNi8yMDE5IiwKKwkJTlVMTCB9LAorCS5vcmllbnRhdGlvbiA9IERSTV9N
T0RFX1BBTkVMX09SSUVOVEFUSU9OX1JJR0hUX1VQLAorfTsKKwogc3RhdGljIGNvbnN0IHN0cnVj
dCBkcm1fZG1pX3BhbmVsX29yaWVudGF0aW9uX2RhdGEgZ3BkX3BvY2tldCA9IHsKIAkud2lkdGgg
PSAxMjAwLAogCS5oZWlnaHQgPSAxOTIwLApAQCAtMTA3LDYgKzExNSwxNCBAQCBzdGF0aWMgY29u
c3Qgc3RydWN0IGRtaV9zeXN0ZW1faWQgb3JpZW50YXRpb25fZGF0YVtdID0gewogCQkgIERNSV9F
WEFDVF9NQVRDSChETUlfUFJPRFVDVF9OQU1FLCAiVDEwMEhBTiIpLAogCQl9LAogCQkuZHJpdmVy
X2RhdGEgPSAodm9pZCAqKSZhc3VzX3QxMDBoYSwKKwl9LCB7CS8qIEdQRCBNaWNyb1BDIChnZW5l
cmljIHN0cmluZ3MsIGFsc28gbWF0Y2ggb24gYmlvcyBkYXRlKSAqLworCQkubWF0Y2hlcyA9IHsK
KwkJICBETUlfRVhBQ1RfTUFUQ0goRE1JX1NZU19WRU5ET1IsICJEZWZhdWx0IHN0cmluZyIpLAor
CQkgIERNSV9FWEFDVF9NQVRDSChETUlfUFJPRFVDVF9OQU1FLCAiRGVmYXVsdCBzdHJpbmciKSwK
KwkJICBETUlfRVhBQ1RfTUFUQ0goRE1JX0JPQVJEX1ZFTkRPUiwgIkRlZmF1bHQgc3RyaW5nIiks
CisJCSAgRE1JX0VYQUNUX01BVENIKERNSV9CT0FSRF9OQU1FLCAiRGVmYXVsdCBzdHJpbmciKSwK
KwkJfSwKKwkJLmRyaXZlcl9kYXRhID0gKHZvaWQgKikmZ3BkX21pY3JvcGMsCiAJfSwgewkvKgog
CQkgKiBHUEQgUG9ja2V0LCBub3RlIHRoYXQgdGhlIHRoZSBETUkgZGF0YSBpcyBsZXNzIGdlbmVy
aWMgdGhlbgogCQkgKiBpdCBzZWVtcywgZGV2aWNlcyB3aXRoIGEgYm9hcmQtdmVuZG9yIG9mICJB
TUkgQ29ycG9yYXRpb24iCi0tIAoyLjIxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
