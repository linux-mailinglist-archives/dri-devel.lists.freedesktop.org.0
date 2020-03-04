Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A93E17A0DF
	for <lists+dri-devel@lfdr.de>; Thu,  5 Mar 2020 09:14:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 842446EAEE;
	Thu,  5 Mar 2020 08:14:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id AE4E36E190
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Mar 2020 14:54:27 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4C8B431B;
 Wed,  4 Mar 2020 06:54:27 -0800 (PST)
Received: from e119884-lin.cambridge.arm.com (e119884-lin.cambridge.arm.com
 [10.1.196.72])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 16F413F6CF;
 Wed,  4 Mar 2020 06:54:25 -0800 (PST)
From: Vincenzo Frascino <vincenzo.frascino@arm.com>
To: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm: komeda: Make rt_pm_ops dependent on CONFIG_PM
Date: Wed,  4 Mar 2020 14:54:12 +0000
Message-Id: <20200304145412.33936-1-vincenzo.frascino@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 05 Mar 2020 08:14:30 +0000
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: Mihail Atanassov <mihail.atanassov@arm.com>,
 David Airlie <airlied@linux.ie>, Liviu Dudau <liviu.dudau@arm.com>,
 "James \(Qian\) Wang" <james.qian.wang@arm.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

a29tZWRhX3J0X3BtX3N1c3BlbmQoKSBhbmQga29tZWRhX3J0X3BtX3Jlc3VtZSgpIGFyZSBjb21w
aWxlZCBvbmx5IHdoZW4KQ09ORklHX1BNIGlzIGVuYWJsZWQuIEhhdmluZyBpdCBkaXNhYmxlZCB0
cmlnZ2VycyB0aGUgZm9sbG93aW5nIHdhcm5pbmcKYXQgY29tcGlsZSB0aW1lOgoKbGludXgvZHJp
dmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfZHJ2LmM6MTU2OjEyOgp3YXJu
aW5nOiDigJhrb21lZGFfcnRfcG1fcmVzdW1l4oCZIGRlZmluZWQgYnV0IG5vdCB1c2VkIFstV3Vu
dXNlZC1mdW5jdGlvbl0KIHN0YXRpYyBpbnQga29tZWRhX3J0X3BtX3Jlc3VtZShzdHJ1Y3QgZGV2
aWNlICpkZXYpCiAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+fn4KbGludXgvZHJpdmVycy9n
cHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfZHJ2LmM6MTQ5OjEyOgp3YXJuaW5nOiDi
gJhrb21lZGFfcnRfcG1fc3VzcGVuZOKAmSBkZWZpbmVkIGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQt
ZnVuY3Rpb25dCiBzdGF0aWMgaW50IGtvbWVkYV9ydF9wbV9zdXNwZW5kKHN0cnVjdCBkZXZpY2Ug
KmRldikKCk1ha2Uga29tZWRhX3J0X3BtX3N1c3BlbmQoKSBhbmQga29tZWRhX3J0X3BtX3Jlc3Vt
ZSgpIGRlcGVuZGVudCBvbgpDT05GSUdfUE0gdG8gYWRkcmVzcyB0aGUgaXNzdWUuCgpDYzogIkph
bWVzIChRaWFuKSBXYW5nIiA8amFtZXMucWlhbi53YW5nQGFybS5jb20+CkNjOiBMaXZpdSBEdWRh
dSA8bGl2aXUuZHVkYXVAYXJtLmNvbT4KQ2M6IE1paGFpbCBBdGFuYXNzb3YgPG1paGFpbC5hdGFu
YXNzb3ZAYXJtLmNvbT4KQ2M6IEJyaWFuIFN0YXJrZXkgPGJyaWFuLnN0YXJrZXlAYXJtLmNvbT4K
Q2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KQ2M6IERhbmllbCBWZXR0ZXIgPGRh
bmllbEBmZndsbC5jaD4KU2lnbmVkLW9mZi1ieTogVmluY2Vuem8gRnJhc2Npbm8gPHZpbmNlbnpv
LmZyYXNjaW5vQGFybS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVk
YS9rb21lZGFfZHJ2LmMgfCAyICsrCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfZHJ2
LmMgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9kcnYuYwppbmRl
eCBlYTVjZDFlMTczMDQuLmRkM2FlM2Q4ODY4NyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfZHJ2LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2Fy
bS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfZHJ2LmMKQEAgLTE0Niw2ICsxNDYsNyBAQCBzdGF0aWMg
Y29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBrb21lZGFfb2ZfbWF0Y2hbXSA9IHsKIAogTU9EVUxF
X0RFVklDRV9UQUJMRShvZiwga29tZWRhX29mX21hdGNoKTsKIAorI2lmZGVmIENPTkZJR19QTQog
c3RhdGljIGludCBrb21lZGFfcnRfcG1fc3VzcGVuZChzdHJ1Y3QgZGV2aWNlICpkZXYpCiB7CiAJ
c3RydWN0IGtvbWVkYV9kcnYgKm1kcnYgPSBkZXZfZ2V0X2RydmRhdGEoZGV2KTsKQEAgLTE1OSw2
ICsxNjAsNyBAQCBzdGF0aWMgaW50IGtvbWVkYV9ydF9wbV9yZXN1bWUoc3RydWN0IGRldmljZSAq
ZGV2KQogCiAJcmV0dXJuIGtvbWVkYV9kZXZfcmVzdW1lKG1kcnYtPm1kZXYpOwogfQorI2VuZGlm
IC8qIENPTkZJR19QTSAqLwogCiBzdGF0aWMgaW50IF9fbWF5YmVfdW51c2VkIGtvbWVkYV9wbV9z
dXNwZW5kKHN0cnVjdCBkZXZpY2UgKmRldikKIHsKLS0gCjIuMjUuMQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
