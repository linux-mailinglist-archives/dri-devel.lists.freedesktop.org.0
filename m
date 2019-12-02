Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3803610E92F
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2019 11:51:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32A6F89258;
	Mon,  2 Dec 2019 10:51:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75A0D6E17E
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Dec 2019 10:51:03 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-229-CDvL9ayyPPiwg9S8cV5msQ-1; Mon, 02 Dec 2019 05:51:00 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 564AD10054E3;
 Mon,  2 Dec 2019 10:50:58 +0000 (UTC)
Received: from shalem.localdomain.com (unknown [10.36.118.2])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 63ADE5D6A0;
 Mon,  2 Dec 2019 10:50:56 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Sean Paul <seanpaul@chromium.org>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH] drm: panel-orientation-quirks: Add quirk for Teclast X89
 tablet
Date: Mon,  2 Dec 2019 11:50:55 +0100
Message-Id: <20191202105055.13201-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: CDvL9ayyPPiwg9S8cV5msQ-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1575283862;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=GRV/6CH0yr4pHy2L6QttDEc4Y5EqiaqVLv5QhMgqSag=;
 b=AEAUeBn3FFWBCtb1h0ZnCcAqrfR59YQ0t/d8ltiQv/oGDb2mviPKFNUUZWu50lKB4t7xXh
 VCB6zP3Wgli6P0sxki1E53WbOUsSvK48d0rwCHEaDzG8zqifFUSlZbjm9dURwywmWScGpr
 oHmJWsqeEn9j6V8Z5/44MYhacSvFw3I=
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

VGhlIFRlY2xhc3QgWDg5IHVzZXMgYW4gdXBzaWRlLWRvd24gbW91bnRlZCBlRFAgcGFuZWwsIGFk
ZCBhCnBhbmVsLW9yaWVudGF0aW9uIHF1aXJrIGZvciB0aGlzLgoKU2lnbmVkLW9mZi1ieTogSGFu
cyBkZSBHb2VkZSA8aGRlZ29lZGVAcmVkaGF0LmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vZHJt
X3BhbmVsX29yaWVudGF0aW9uX3F1aXJrcy5jIHwgMTMgKysrKysrKysrKysrKwogMSBmaWxlIGNo
YW5nZWQsIDEzIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJt
X3BhbmVsX29yaWVudGF0aW9uX3F1aXJrcy5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9wYW5lbF9v
cmllbnRhdGlvbl9xdWlya3MuYwppbmRleCBmZmQ5NWJmZWFhOTQuLjlmMmQxMmYyOGE3MyAxMDA2
NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9wYW5lbF9vcmllbnRhdGlvbl9xdWlya3MuYwor
KysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX3BhbmVsX29yaWVudGF0aW9uX3F1aXJrcy5jCkBAIC0x
MDgsNiArMTA4LDEzIEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2RtaV9wYW5lbF9vcmllbnRh
dGlvbl9kYXRhIGxjZDEyMDB4MTkyMF9yaWdodHNpZGVfdXAgPSB7CiAJLm9yaWVudGF0aW9uID0g
RFJNX01PREVfUEFORUxfT1JJRU5UQVRJT05fUklHSFRfVVAsCiB9OwogCitzdGF0aWMgY29uc3Qg
c3RydWN0IGRybV9kbWlfcGFuZWxfb3JpZW50YXRpb25fZGF0YSB0ZWNsYXN0X3g4OSA9IHsKKwku
d2lkdGggPSAxNTM2LAorCS5oZWlnaHQgPSAyMDQ4LAorCS5iaW9zX2RhdGVzID0gKGNvbnN0IGNo
YXIgKiBjb25zdCBbXSl7ICIxMi8xOS8yMDE0IiwgTlVMTCB9LAorCS5vcmllbnRhdGlvbiA9IERS
TV9NT0RFX1BBTkVMX09SSUVOVEFUSU9OX0JPVFRPTV9VUCwKK307CisKIHN0YXRpYyBjb25zdCBz
dHJ1Y3QgZG1pX3N5c3RlbV9pZCBvcmllbnRhdGlvbl9kYXRhW10gPSB7CiAJewkvKiBBY2VyIE9u
ZSAxMCAoUzEwMDMpICovCiAJCS5tYXRjaGVzID0gewpAQCAtMjA1LDYgKzIxMiwxMiBAQCBzdGF0
aWMgY29uc3Qgc3RydWN0IGRtaV9zeXN0ZW1faWQgb3JpZW50YXRpb25fZGF0YVtdID0gewogCQkg
IERNSV9FWEFDVF9NQVRDSChETUlfUFJPRFVDVF9WRVJTSU9OLCAiTGVub3ZvIGlkZWFwYWQgRDMz
MC0xMElHTSIpLAogCQl9LAogCQkuZHJpdmVyX2RhdGEgPSAodm9pZCAqKSZsY2QxMjAweDE5MjBf
cmlnaHRzaWRlX3VwLAorCX0sIHsJLyogVGVjbGFzdCBYODkgKHRQQUQgaXMgdG9vIGdlbmVyaWMs
IGFsc28gbWF0Y2ggb24gYmlvcyBkYXRlKSAqLworCQkubWF0Y2hlcyA9IHsKKwkJICBETUlfRVhB
Q1RfTUFUQ0goRE1JX0JPQVJEX1ZFTkRPUiwgIlRFQ0xBU1QiKSwKKwkJICBETUlfRVhBQ1RfTUFU
Q0goRE1JX0JPQVJEX05BTUUsICJ0UEFEIiksCisJCX0sCisJCS5kcml2ZXJfZGF0YSA9ICh2b2lk
ICopJnRlY2xhc3RfeDg5LAogCX0sIHsJLyogVklPUyBMVEgxNyAqLwogCQkubWF0Y2hlcyA9IHsK
IAkJICBETUlfRVhBQ1RfTUFUQ0goRE1JX1NZU19WRU5ET1IsICJWSU9TIiksCi0tIAoyLjIzLjAK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
