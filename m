Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0163EAD3B8
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2019 09:23:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A3D989864;
	Mon,  9 Sep 2019 07:23:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EEC589B4D
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Sep 2019 04:36:36 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id h195so7084450pfe.5
 for <dri-devel@lists.freedesktop.org>; Sat, 07 Sep 2019 21:36:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RtKloxjFpA2t5GP1ywopBt0f8T0oeF2HbZwg4ACNdgA=;
 b=mfgnM6aMjAKrzwaBkpUsxHwd4gVfp4V4abCgbBnUn2UyjfcwsBiPV1FYEfI9SCZD73
 +y83pvl/u+2E+NdYwJielKN2vK6rG3Z9g2hNKrYrXRVZNtxZGKWj6+olAYvz9FxxO6Ch
 1w1lm36Y1thK8jCTKIXOs57fHXRi6by3vxH/06wqz574pkkEaZHX9eyLeXYOuoXYS8t1
 zeSSKbbzJcnMpqIZJRC8e16Ej2zpEBwE/04z6tSqwz7GGJPpVcSYZgr0bHvOBtj3X3ww
 a/g9+iGPALayGTXHhe9m9biob+rtQFQkRMpN3dDFpyDORc17O/Qj4UWu9C0OpUpqLrUL
 +Pfg==
X-Gm-Message-State: APjAAAXfFSUshUL2Z82llqsmqcaJAy77CUmTouuLScUYPxFXjXLmJ/6y
 7lnGXB4zDxKdhmnQ8/6RaDk=
X-Google-Smtp-Source: APXvYqyw3tU05UDMXdb6AFEITR7kgX4+Eq37oNhLv/4hoo+Qf91BgNisp1ZeprOqEnZ4Y7w2V8QLTQ==
X-Received: by 2002:a63:2349:: with SMTP id u9mr12722661pgm.214.1567917395763; 
 Sat, 07 Sep 2019 21:36:35 -0700 (PDT)
Received: from localhost.localdomain (ip-103-85-38-221.syd.xi.com.au.
 [103.85.38.221])
 by smtp.gmail.com with ESMTPSA id v184sm8435643pgd.34.2019.09.07.21.36.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Sep 2019 21:36:34 -0700 (PDT)
From: Adam Zerella <adam.zerella@gmail.com>
To: labbott@redhat.com,
	sumit.semwal@linaro.org
Subject: [PATCH] staging: android: ion: Replace strncpy() for stracpy()
Date: Sun,  8 Sep 2019 14:34:50 +1000
Message-Id: <20190908043450.1078-1-adam.zerella@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 09 Sep 2019 07:23:02 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RtKloxjFpA2t5GP1ywopBt0f8T0oeF2HbZwg4ACNdgA=;
 b=I3nPu8RMFPAOjfzb+RUf8Mi5gIkb+Cu56HHzE+93Xw25Xn1IgtLQblsyCgVYhfhfaf
 1wh7RGmFtbt1LbBcG3sqfpAPGJbV4nKGpXkvHL7W1Jbz2JCHvacL1js3Kny6IWT6lF4X
 NNzQTygYqAYbriWrmvEwl2KqraJ9weRhQPeFhi1fOX53BVG0lgCjV3NLg2kzug4TEQRc
 KPZkGTbYLEXreZrYkpPuPNKZ94ZYHNSnUPsDWfqqAnic7ePQAjjQKft1Yf1xiSyqMJQa
 AmkJJ52qBm1rLO3hF/659y3XDTahKd7azIvAmZcOR7EHtWc2vboqgjx9vq7FZRLZH5Md
 kV9Q==
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
Cc: devel@driverdev.osuosl.org, Adam Zerella <adam.zerella@gmail.com>,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VXNpbmcgc3RybmNweSgpIGRvZXMgbm90IGFsd2F5cyB0ZXJtaW5hdGUgdGhlIGRlc3RpbmF0aW9u
IHN0cmluZy4Kc3RyYWNweSgpIGlzIGEgYWx0ZXJuYXRpdmUgZnVuY3Rpb24gdGhhdCBkb2VzLCBi
eSB1c2luZyB0aGlzIG5ldwpmdW5jdGlvbiB3ZSB3aWxsIG5vIGxvbmdlciBuZWVkIHRvIGluc2Vy
dCBhIG51bGwgc2VwYXJhdG9yLgoKU2lnbmVkLW9mZi1ieTogQWRhbSBaZXJlbGxhIDxhZGFtLnpl
cmVsbGFAZ21haWwuY29tPgotLS0KIGRyaXZlcnMvc3RhZ2luZy9hbmRyb2lkL2lvbi9pb24uYyB8
IDMgKy0tCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDIgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9zdGFnaW5nL2FuZHJvaWQvaW9uL2lvbi5jIGIvZHJpdmVycy9z
dGFnaW5nL2FuZHJvaWQvaW9uL2lvbi5jCmluZGV4IGU2YjFjYTE0MWI5My4uMTc5MDFiZDYyNmJl
IDEwMDY0NAotLS0gYS9kcml2ZXJzL3N0YWdpbmcvYW5kcm9pZC9pb24vaW9uLmMKKysrIGIvZHJp
dmVycy9zdGFnaW5nL2FuZHJvaWQvaW9uL2lvbi5jCkBAIC00MzMsOCArNDMzLDcgQEAgc3RhdGlj
IGludCBpb25fcXVlcnlfaGVhcHMoc3RydWN0IGlvbl9oZWFwX3F1ZXJ5ICpxdWVyeSkKIAltYXhf
Y250ID0gcXVlcnktPmNudDsKIAogCXBsaXN0X2Zvcl9lYWNoX2VudHJ5KGhlYXAsICZkZXYtPmhl
YXBzLCBub2RlKSB7Ci0JCXN0cm5jcHkoaGRhdGEubmFtZSwgaGVhcC0+bmFtZSwgTUFYX0hFQVBf
TkFNRSk7Ci0JCWhkYXRhLm5hbWVbc2l6ZW9mKGhkYXRhLm5hbWUpIC0gMV0gPSAnXDAnOworCQlz
dHJhY3B5KGhkYXRhLm5hbWUsIGhlYXAtPm5hbWUsIE1BWF9IRUFQX05BTUUpOwogCQloZGF0YS50
eXBlID0gaGVhcC0+dHlwZTsKIAkJaGRhdGEuaGVhcF9pZCA9IGhlYXAtPmlkOwogCi0tIAoyLjIx
LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
