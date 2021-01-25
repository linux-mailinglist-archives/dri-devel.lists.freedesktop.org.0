Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3262A302575
	for <lists+dri-devel@lfdr.de>; Mon, 25 Jan 2021 14:25:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87CAA89C29;
	Mon, 25 Jan 2021 13:25:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8985789C29
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jan 2021 13:25:19 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id d22so15327982edy.1
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jan 2021 05:25:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=TPllcLdHc9R0gFH2IaodwuaP8IM62xNxne+xCUr/PQ8=;
 b=pEUm6ZseAjKKSz4do768n4xAq5IBSzXEEnABXdVzuHIexZpLt/klI8Uw2uSAJdYbtU
 pDQ4tZMkVb8aG6iW+9XQ4bmVVGVCKAFol7Y1/2ASGuLSdH+fMmBRlvoKHojGh2mAglaP
 JNiko6O0oRm1+308rSZY4XsExBZkf1b35IDqBG2F4sgxfOJ8FR167cBDywi5t1kjn323
 vtB70dPRLfIoSgcoY5P4bbSOIUXay/U569fPM7hFv8G8oTqCsQu9MgKYrMlzP2u4mS0u
 OwnP6JCy/dO5vAnjvCBrRYiwgqiCDI4vfiMO26eIYUnse9CDAWkvK4vL2soluQYgc/di
 elMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TPllcLdHc9R0gFH2IaodwuaP8IM62xNxne+xCUr/PQ8=;
 b=O1qZNkDRy5v7izvIMaoPO7Iope5oYy6P4PIHb7qaLrqUHxjwq/UsTJeshLJ+Tu5uf8
 k96jnw+GAFq5FjLBZb7gLE9cTJ3khEYop8BXQufd/2VkKI8Ff6FgC6vNE3RhDydEKqw4
 gFp6ayBzqYG1M+U1ecXNXp8gcD+SNGFlx50CAOB7ci4c7++xmO2g0qZEvC1Crm8IsWm/
 qOLfX+14gLzSJCzSX24abVppNe5VrCxg6LJGB6wc/zkJxwWg46SstFpcYv1U0bMBZNuu
 CZ7Wm3gJy29P5kzwBNKzD1VMe7sHi+SDXIDP8j+wE+r01QP1ySD2JS7cJI74vRY8UYG1
 usDg==
X-Gm-Message-State: AOAM532+67Drc5fh+uN8AiUAaGavFxVZQtGeVN6jPusHbCicMvZGiVuK
 qTw7MkZ1Bc3M2aS8cpeFW8zxO1fUSn4=
X-Google-Smtp-Source: ABdhPJz2fnhclBYPtY/BxWaSQWEZ3awlWZU/f9T0ioW+yb3wRxH/JD5CgboBNSgs0Ffae82C7C+64w==
X-Received: by 2002:a50:fc97:: with SMTP id f23mr445214edq.307.1611581118182; 
 Mon, 25 Jan 2021 05:25:18 -0800 (PST)
Received: from abel.fritz.box ([2a02:908:1252:fb60:4de7:5eb0:ebd7:49ad])
 by smtp.gmail.com with ESMTPSA id j23sm8381181ejs.112.2021.01.25.05.25.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jan 2021 05:25:17 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel@ffwll.ch,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 3/3] drm/ttm: drop sysfs directory
Date: Mon, 25 Jan 2021 14:25:14 +0100
Message-Id: <20210125132514.3819-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210125132514.3819-1-christian.koenig@amd.com>
References: <20210125132514.3819-1-christian.koenig@amd.com>
MIME-Version: 1.0
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Tm90IHVzZWQgYW55IG1vcmUuCgpTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJp
c3RpYW4ua29lbmlnQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fbW9kdWxl
LmMgfCA1MCAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQogZHJpdmVycy9ncHUvZHJt
L3R0bS90dG1fbW9kdWxlLmggfCAgMiAtLQogMiBmaWxlcyBjaGFuZ2VkLCA1MiBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9tb2R1bGUuYyBiL2RyaXZl
cnMvZ3B1L2RybS90dG0vdHRtX21vZHVsZS5jCmluZGV4IGY2NTY2NjAzYTYwZi4uNTZiMGVmZGJh
MWE5IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9tb2R1bGUuYworKysgYi9k
cml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9tb2R1bGUuYwpAQCAtMzcsNjYgKzM3LDE2IEBACiAKICNp
bmNsdWRlICJ0dG1fbW9kdWxlLmgiCiAKLXN0YXRpYyBERUNMQVJFX1dBSVRfUVVFVUVfSEVBRChl
eGl0X3EpOwotc3RhdGljIGF0b21pY190IGRldmljZV9yZWxlYXNlZDsKIHN0cnVjdCBkZW50cnkg
KnR0bV9kZWJ1Z2ZzX3Jvb3Q7CiAKLXN0YXRpYyBzdHJ1Y3QgZGV2aWNlX3R5cGUgdHRtX2RybV9j
bGFzc190eXBlID0gewotCS5uYW1lID0gInR0bSIsCi0JLyoqCi0JICogQWRkIHBtIG9wcyBoZXJl
LgotCSAqLwotfTsKLQotc3RhdGljIHZvaWQgdHRtX2RybV9jbGFzc19kZXZpY2VfcmVsZWFzZShz
dHJ1Y3QgZGV2aWNlICpkZXYpCi17Ci0JYXRvbWljX3NldCgmZGV2aWNlX3JlbGVhc2VkLCAxKTsK
LQl3YWtlX3VwX2FsbCgmZXhpdF9xKTsKLX0KLQotc3RhdGljIHN0cnVjdCBkZXZpY2UgdHRtX2Ry
bV9jbGFzc19kZXZpY2UgPSB7Ci0JLnR5cGUgPSAmdHRtX2RybV9jbGFzc190eXBlLAotCS5yZWxl
YXNlID0gJnR0bV9kcm1fY2xhc3NfZGV2aWNlX3JlbGVhc2UKLX07Ci0KLXN0cnVjdCBrb2JqZWN0
ICp0dG1fZ2V0X2tvYmoodm9pZCkKLXsKLQlzdHJ1Y3Qga29iamVjdCAqa29iaiA9ICZ0dG1fZHJt
X2NsYXNzX2RldmljZS5rb2JqOwotCUJVR19PTihrb2JqID09IE5VTEwpOwotCXJldHVybiBrb2Jq
OwotfQotCiBzdGF0aWMgaW50IF9faW5pdCB0dG1faW5pdCh2b2lkKQogewotCWludCByZXQ7Ci0K
LQlyZXQgPSBkZXZfc2V0X25hbWUoJnR0bV9kcm1fY2xhc3NfZGV2aWNlLCAidHRtIik7Ci0JaWYg
KHVubGlrZWx5KHJldCAhPSAwKSkKLQkJcmV0dXJuIHJldDsKLQotCWF0b21pY19zZXQoJmRldmlj
ZV9yZWxlYXNlZCwgMCk7Ci0JcmV0ID0gZHJtX2NsYXNzX2RldmljZV9yZWdpc3RlcigmdHRtX2Ry
bV9jbGFzc19kZXZpY2UpOwotCWlmICh1bmxpa2VseShyZXQgIT0gMCkpCi0JCWdvdG8gb3V0X25v
X2Rldl9yZWc7Ci0KIAl0dG1fZGVidWdmc19yb290ID0gZGVidWdmc19jcmVhdGVfZGlyKCJ0dG0i
LCBOVUxMKTsKIAlyZXR1cm4gMDsKLW91dF9ub19kZXZfcmVnOgotCWF0b21pY19zZXQoJmRldmlj
ZV9yZWxlYXNlZCwgMSk7Ci0Jd2FrZV91cF9hbGwoJmV4aXRfcSk7Ci0JcmV0dXJuIHJldDsKIH0K
IAogc3RhdGljIHZvaWQgX19leGl0IHR0bV9leGl0KHZvaWQpCiB7Ci0JZHJtX2NsYXNzX2Rldmlj
ZV91bnJlZ2lzdGVyKCZ0dG1fZHJtX2NsYXNzX2RldmljZSk7Ci0KLQkvKioKLQkgKiBSZWZ1c2Ug
dG8gdW5sb2FkIHVudGlsIHRoZSBUVE0gZGV2aWNlIGlzIHJlbGVhc2VkLgotCSAqIE5vdCBzdXJl
IHRoaXMgaXMgMTAwJSBuZWVkZWQuCi0JICovCi0KLQl3YWl0X2V2ZW50KGV4aXRfcSwgYXRvbWlj
X3JlYWQoJmRldmljZV9yZWxlYXNlZCkgPT0gMSk7CiAJZGVidWdmc19yZW1vdmUodHRtX2RlYnVn
ZnNfcm9vdCk7CiB9CiAKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX21vZHVs
ZS5oIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fbW9kdWxlLmgKaW5kZXggMmYwM2MyZmNmNTcw
Li5kN2NhYzVkNGI4MzUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX21vZHVs
ZS5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX21vZHVsZS5oCkBAIC0zMywxMCArMzMs
OCBAQAogCiAjZGVmaW5lIFRUTV9QRlggIltUVE1dICIKIAotc3RydWN0IGtvYmplY3Q7CiBzdHJ1
Y3QgZGVudHJ5OwogCi1leHRlcm4gc3RydWN0IGtvYmplY3QgKnR0bV9nZXRfa29iaih2b2lkKTsK
IGV4dGVybiBzdHJ1Y3QgZGVudHJ5ICp0dG1fZGVidWdmc19yb290OwogCiAjZW5kaWYgLyogX1RU
TV9NT0RVTEVfSF8gKi8KLS0gCjIuMjUuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVsCg==
