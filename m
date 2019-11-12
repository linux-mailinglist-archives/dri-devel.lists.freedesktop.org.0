Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B713F9CB2
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2019 22:59:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A92796EBFC;
	Tue, 12 Nov 2019 21:59:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 157DC6EBFC
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2019 21:59:28 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id p20so198903qtq.5
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2019 13:59:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=Mj7z1TQhNjBYbEX5L/fcIQ7eLPgC8FZ8yInKWJKTP3I=;
 b=D+h+eFKPwWDZ0ea0QfgCL1JLThXFiGbcbuFGIgnD7aTaeWl4gznCeQh4MBJ+fViKW5
 4L+U0JwZ5Y0ftXAO9jJi7L5ZdiIboBA9MmjdqGEahGaivweIwFid4lOtdM3lXgk0+8X9
 HSbyw1dkphYqK44iH21iBThgo8/gb807A+hTVOpaN+GmfPpc9dTm2GYqRDVXM+Pdq5gV
 vwhg0wcXZhkPejIk8ZP9FEUiSz+qkX+c2IAhFi0BKnHwPofRCD9ciW7BNvKCqwbkeZLi
 IfovhEOMfll7cu/MbXKFmCIGAXzmMWc+Bsgz2BZzOu9EiOawTb707WBrR9ZWGuoWK3Sy
 p0Pg==
X-Gm-Message-State: APjAAAWm41uiso+aTv8pLy9Pl08PeYFf2jdiJ3hCVM+vVcaO+SSaVdvk
 M31EUdUBEOQsctucZly5Mbg=
X-Google-Smtp-Source: APXvYqysXGs7zy1ZAEd0KgCkcwK02XLfKb18yLZ28AQfot5qJkEWu1KB5b4Wc3DHVc0flIDR5jg0NA==
X-Received: by 2002:ac8:1857:: with SMTP id n23mr33493467qtk.247.1573595967041; 
 Tue, 12 Nov 2019 13:59:27 -0800 (PST)
Received: from fabio-Latitude-E5450.am.freescale.net ([2804:14c:482:99::3])
 by smtp.gmail.com with ESMTPSA id h12sm9882343qkh.123.2019.11.12.13.59.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Nov 2019 13:59:26 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: robdclark@gmail.com
Subject: [PATCH RESEND] drm/msm/adreno: Do not print error on "qcom,
 gpu-pwrlevels" absence
Date: Tue, 12 Nov 2019 18:59:16 -0300
Message-Id: <20191112215916.29508-1-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=Mj7z1TQhNjBYbEX5L/fcIQ7eLPgC8FZ8yInKWJKTP3I=;
 b=FecSCgYScZQloBWULMjmJ45Nd5dpmd/9PStiystGql+JelkHE+vY+KftCtMfbZ76Dv
 0gKDvsGwTyKMqKiyi6PgoG75T4w9qQyxe4whwKq13I71plIzmNooQzuUur0+rA0WzX6V
 ZUjTSCT4lzpNL9wviCsclFYIe2RKgtejR9X73SzgaG+LWlWdf7RF9dccxjYZfGblPYwX
 9AyXBBdaS3WEWfu+l6kwi6ACTGDwZsQnx7woa0wShtjqC+w4t6V4lBA5gX57A1jiAg3j
 KPJoyGLXtyPlTWqYgU8QUb1zHeqkF3VR4NhNEVl4glj9ROw2+u+Lwm5P8Sd79T9rGAXB
 FHpA==
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
Cc: jonathan@marek.ca, jeffrey.l.hugo@gmail.com,
 dri-devel@lists.freedesktop.org, sean@poorly.run, cphealy@gmail.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Qm9vdGluZyB0aGUgYWRyZW5vIGRyaXZlciBvbiBhIGlteDUzIGJvYXJkIGxlYWRzIHRvIHRoZSBm
b2xsb3dpbmcKZXJyb3IgbWVzc2FnZToKCmFkcmVubyAzMDAwMDAwMC5ncHU6IFtkcm06YWRyZW5v
X2dwdV9pbml0XSAqRVJST1IqIENvdWxkIG5vdCBmaW5kIHRoZSBHUFUgcG93ZXJsZXZlbHMKCkFz
IHRoZSAicWNvbSxncHUtcHdybGV2ZWxzIiBwcm9wZXJ0eSBpcyBvcHRpb25hbCBhbmQgbmV2ZXIg
cHJlc2VudCBvbgppLk1YNSwgdHVybiB0aGUgbWVzc2FnZSBpbnRvIGRlYnVnIGxldmVsIGluc3Rl
YWQuCgpTaWduZWQtb2ZmLWJ5OiBGYWJpbyBFc3RldmFtIDxmZXN0ZXZhbUBnbWFpbC5jb20+ClJl
dmlld2VkLWJ5OiBKZWZmcmV5IEh1Z28gPGplZmZyZXkubC5odWdvQGdtYWlsLmNvbT4KUmV2aWV3
ZWQtYnk6IEpvcmRhbiBDcm91c2UgPGpjcm91c2VAY29kZWF1cm9yYS5vcmc+Ci0tLQogZHJpdmVy
cy9ncHUvZHJtL21zbS9hZHJlbm8vYWRyZW5vX2dwdS5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL21zbS9hZHJlbm8vYWRyZW5vX2dwdS5jIGIvZHJpdmVycy9ncHUvZHJtL21zbS9hZHJlbm8v
YWRyZW5vX2dwdS5jCmluZGV4IDA3ODNlNGI1NDg2YS4uNWQ3YmRiNGM4M2NjIDEwMDY0NAotLS0g
YS9kcml2ZXJzL2dwdS9kcm0vbXNtL2FkcmVuby9hZHJlbm9fZ3B1LmMKKysrIGIvZHJpdmVycy9n
cHUvZHJtL21zbS9hZHJlbm8vYWRyZW5vX2dwdS5jCkBAIC04MjYsNyArODI2LDcgQEAgc3RhdGlj
IGludCBhZHJlbm9fZ2V0X2xlZ2FjeV9wd3JsZXZlbHMoc3RydWN0IGRldmljZSAqZGV2KQogCiAJ
bm9kZSA9IG9mX2dldF9jb21wYXRpYmxlX2NoaWxkKGRldi0+b2Zfbm9kZSwgInFjb20sZ3B1LXB3
cmxldmVscyIpOwogCWlmICghbm9kZSkgewotCQlEUk1fREVWX0VSUk9SKGRldiwgIkNvdWxkIG5v
dCBmaW5kIHRoZSBHUFUgcG93ZXJsZXZlbHNcbiIpOworCQlEUk1fREVWX0RFQlVHKGRldiwgIkNv
dWxkIG5vdCBmaW5kIHRoZSBHUFUgcG93ZXJsZXZlbHNcbiIpOwogCQlyZXR1cm4gLUVOWElPOwog
CX0KIAotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
