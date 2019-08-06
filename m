Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 458DD845B4
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2019 09:26:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 523B96E632;
	Wed,  7 Aug 2019 07:26:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28A2588EEB
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Aug 2019 18:04:37 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id m30so41933783pff.8
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Aug 2019 11:04:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=0sEXZ1dMAlmGbbU8M9+e6+pMeR/YjA8tbgOYXYL4lFY=;
 b=fy7ZEOWcVdrtQCSmB+DFkvwOEH8GOzDRY04oNq/DwRzmUfYUQQYiE2NhcnCvfWa6L1
 NWO5paR8JSjnSXTe2hbrmyMnlxNrPDn3Fgbva6o6ytEkvQ8aAH9+Yjw+rjW6hwThDw6C
 ZRm8mMDWUZGUel0UjV+6xxnsmDpJEYd4q3oe0LNfzhhe5kSg7A0irHOqsaky6BZtBM2C
 YNcRRcN7FclMbmqSs0vekxnNRgpeDcujdbkPAlY8ROiUxOzL9A9J7NrNzDXftD+oVMqE
 4yn6igMK+H52QzHxqHz3zN/i38haau3LycrNPzc+qqP2lFM7XH4Q9ngP4Ur/updzWou7
 Z8Og==
X-Gm-Message-State: APjAAAWnaQEbUY/YRvcc4ULm3Bv3TnK20hMWJ4HSKYJ2exO7nW8vrkIC
 YY9rn17QCXfhUsKBZn+Tnhc=
X-Google-Smtp-Source: APXvYqzB7Shv+p5WaACzxxViLf9tzWnCIYSvG9H25sFhcQqPWQqufwddPxjzWnw9CQM6c4zSPVleJw==
X-Received: by 2002:a62:d0:: with SMTP id 199mr4763174pfa.253.1565114676527;
 Tue, 06 Aug 2019 11:04:36 -0700 (PDT)
Received: from localhost.localdomain.localdomain ([218.189.25.30])
 by smtp.gmail.com with ESMTPSA id r27sm102611532pgn.25.2019.08.06.11.04.33
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 06 Aug 2019 11:04:35 -0700 (PDT)
From: Xinpeng Liu <danielliu861@gmail.com>
To: sumit.semwal@linaro.org,
	gustavo@padovan.org
Subject: [PATCH] fence: checking for NULL pointer after dereferencing it.
Date: Wed,  7 Aug 2019 02:04:24 +0800
Message-Id: <1565114664-10785-1-git-send-email-danielliu861@gmail.com>
X-Mailer: git-send-email 1.8.3.1
X-Mailman-Approved-At: Wed, 07 Aug 2019 07:26:18 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=0sEXZ1dMAlmGbbU8M9+e6+pMeR/YjA8tbgOYXYL4lFY=;
 b=ZdctHFTh+NO1eMxwRtcXMkHZYb8PlxhD82kI0ZatBueh9oqehXDd2rGPR0cwVBg/B+
 F6wfNWTpRo2pZsK1+9t0FyH3HEcmR+83ue3VgCLY9qxIPlkKkFM9b0Yl7RPTyziPFd7m
 2HRFfKjSetYKbRSGzeQ+I00XgHJBuo+HAQYUmSB3zrB0y6rrW/XCJaWEvk99YrCR3ZjX
 Vmrj5ihRM/kO0UrkjCsvgF/a48u9lxPMVYSV4QlXRBbI70yvrAMc9j8ql4iAolHK3TDd
 O1hD6TwCdv8i2D4cxSfzyYkfpyhWrmYsShqKbDPjFFMT7qrovPjEGvpmHRbophr4FLg4
 senQ==
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
Cc: linaro-mm-sig@lists.linaro.org, Xinpeng Liu <danielliu861@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ZHJpdmVycy9kbWEtYnVmL2RtYS1mZW5jZS5jOjEzMSBpbiBmdW5jdGlvbiBkbWFfZmVuY2Vfc2ln
bmFsX2xvY2tlZCwKaWYgKFdBUk5fT04oIWZlbmNlKSkgc2hvdWxkIGJlIGJlZm9yZSBsb2NrZGVw
X2Fzc2VydF9oZWxkKGZlbmNlLT5sb2NrKTsKb3RoZXJ3aXNlIHRoZXJlIGlzIG5vdCBhbnkgbWVh
bmluZy4KClNpZ25lZC1vZmYtYnk6IFhpbnBlbmcgTGl1IDxkYW5pZWxsaXU4NjFAZ21haWwuY29t
PgotLS0KIGRyaXZlcnMvZG1hLWJ1Zi9kbWEtZmVuY2UuYyB8IDMgKy0tCiAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9k
bWEtYnVmL2RtYS1mZW5jZS5jIGIvZHJpdmVycy9kbWEtYnVmL2RtYS1mZW5jZS5jCmluZGV4IDU5
YWM5NmUuLjBiMTEwNjMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZG1hLWJ1Zi9kbWEtZmVuY2UuYwor
KysgYi9kcml2ZXJzL2RtYS1idWYvZG1hLWZlbmNlLmMKQEAgLTEzMSwxMCArMTMxLDkgQEAgaW50
IGRtYV9mZW5jZV9zaWduYWxfbG9ja2VkKHN0cnVjdCBkbWFfZmVuY2UgKmZlbmNlKQogCXN0cnVj
dCBkbWFfZmVuY2VfY2IgKmN1ciwgKnRtcDsKIAlpbnQgcmV0ID0gMDsKIAotCWxvY2tkZXBfYXNz
ZXJ0X2hlbGQoZmVuY2UtPmxvY2spOwotCiAJaWYgKFdBUk5fT04oIWZlbmNlKSkKIAkJcmV0dXJu
IC1FSU5WQUw7CisJbG9ja2RlcF9hc3NlcnRfaGVsZChmZW5jZS0+bG9jayk7CiAKIAlpZiAodGVz
dF9hbmRfc2V0X2JpdChETUFfRkVOQ0VfRkxBR19TSUdOQUxFRF9CSVQsICZmZW5jZS0+ZmxhZ3Mp
KSB7CiAJCXJldCA9IC1FSU5WQUw7Ci0tIAoxLjguMy4xCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
