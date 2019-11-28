Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3106A10CBE5
	for <lists+dri-devel@lfdr.de>; Thu, 28 Nov 2019 16:38:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0CD36E822;
	Thu, 28 Nov 2019 15:38:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6368689D67
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Nov 2019 15:38:00 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id z3so31635813wru.3
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Nov 2019 07:38:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0dzbVXJ7V8hcU1LtMIPexGVLsK0+2tdodZ/4GZpJrGQ=;
 b=UCvHa3QI+SSOV9zseWd3zN1CQOu33LthVBX8oLdEBlCBv8iA92gvJoCi0MCoiFvZAp
 eTwBCNsyf24xjjYXMW1ae33+zrSShNWegWKFLBXL3dPLwpJAny9DgN/xVjIRMw9mL7tv
 +iA5eTybStEACA90c6ctJJ4SAxl8vyiVQwuNuEvRiEiCv2r5T3p5toFxdoImgnaWfT7O
 kYvOhImJQnS4ty5g1tB+ttpC3+q2W8aB7TPxteq6tR6L9Vi8xFVEY1rIOSKC34M+mv1p
 KKVtsQBlRSt1xfLgE8UGcxEsv69u/Hkg29auqjr3rMO6ernThHUzse9iwfxHos3Wrswn
 4Okg==
X-Gm-Message-State: APjAAAV7qK8wtOVkzp+QnqpCyOVVmhMNCQ9d4C0jqf1zdb0hqSYJ55N6
 hsjCs2XCLmRnNtRwkOV+EQG1P+ZXbaA=
X-Google-Smtp-Source: APXvYqwN6jeHqpiergoAp6H44RRaiLz+Bep/6Nl1tHZ/cpDeXEHqkAVIY9PD5yeg/w5+Yv36571D4A==
X-Received: by 2002:adf:f802:: with SMTP id s2mr17381533wrp.201.1574955478979; 
 Thu, 28 Nov 2019 07:37:58 -0800 (PST)
Received: from localhost (pD9E518ED.dip0.t-ipconnect.de. [217.229.24.237])
 by smtp.gmail.com with ESMTPSA id q3sm1858695wrn.33.2019.11.28.07.37.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Nov 2019 07:37:58 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 8/9] drm/tegra: dpaux: Add missing runtime PM references
Date: Thu, 28 Nov 2019 16:37:40 +0100
Message-Id: <20191128153741.2380419-9-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191128153741.2380419-1-thierry.reding@gmail.com>
References: <20191128153741.2380419-1-thierry.reding@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0dzbVXJ7V8hcU1LtMIPexGVLsK0+2tdodZ/4GZpJrGQ=;
 b=WqZ/47EKwwoGBWxgT/2GeoCq0+nbfB28gH8NAOmaWg8LYI9qJGORY/MDy1ojv8+P38
 AvNWstImqj2TYDREPetx+/GdEXvi+K81npK6H7j3fMrhLsQxuFQnQ2HW2y7DQ/h5cYQ+
 MPJHNqxmCWDQVav3wIPaYhGVn5VJqEFUQ+snIlTO+A84tSHnbGpRSf4nYXQlUNgJf6Cg
 eYc3l7NeJSfXrBQDC5dwmFawt/Prsuxu/42NCoOVgTqvrzWs9vayr1VzFoXY/1VUKeRU
 rLjD6DeIr3/G+R7rHqo0ezvBQfUH850fgrY0kcPYjlx7JkVm/+YuAad3CoGDKOzhenkC
 bsiQ==
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KCkVuc3VyZSB0aGF0IGEg
cnVudGltZSBQTSByZWZlcmVuY2UgaXMgYWNxdWlyZWQgZWFjaCB0aW1lIHRoZSBEUEFVWApyZWdp
c3RlcnMgYXJlIGFjY2Vzc2VkLiBPdGhlcndpc2UgdGhlIGNvZGUgbWF5IGVuZCB1cCBydW5uaW5n
IHdpdGhvdXQKdGhlIGNvbnRyb2xsZXIgYmVpbmcgcG93ZXJlZCwgb3V0LW9mLXJlc2V0IG9yIGNs
b2NrZWQgaW4gc29tZSBjb3JuZXIKY2FzZXMsIHJlc3VsdGluZyBpbiBhIGNyYXNoLgoKU2lnbmVk
LW9mZi1ieTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KLS0tCiBkcml2ZXJz
L2dwdS9kcm0vdGVncmEvZHBhdXguYyB8IDE2ICsrKysrKysrKysrKysrLS0KIDEgZmlsZSBjaGFu
Z2VkLCAxNCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS90ZWdyYS9kcGF1eC5jIGIvZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2RwYXV4LmMK
aW5kZXggNjIyY2RmMWFkMjQ2Li40YjJiODZhZWQxYTUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1
L2RybS90ZWdyYS9kcGF1eC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS90ZWdyYS9kcGF1eC5jCkBA
IC00MzQsOCArNDM0LDEzIEBAIHN0YXRpYyBpbnQgdGVncmFfZHBhdXhfc2V0X211eChzdHJ1Y3Qg
cGluY3RybF9kZXYgKnBpbmN0cmwsCiAJCQkgICAgICAgdW5zaWduZWQgaW50IGZ1bmN0aW9uLCB1
bnNpZ25lZCBpbnQgZ3JvdXApCiB7CiAJc3RydWN0IHRlZ3JhX2RwYXV4ICpkcGF1eCA9IHBpbmN0
cmxfZGV2X2dldF9kcnZkYXRhKHBpbmN0cmwpOworCWludCBlcnI7CisKKwlwbV9ydW50aW1lX2dl
dF9zeW5jKGRwYXV4LT5kZXYpOworCWVyciA9IHRlZ3JhX2RwYXV4X3BhZF9jb25maWcoZHBhdXgs
IGZ1bmN0aW9uKTsKKwlwbV9ydW50aW1lX3B1dChkcGF1eC0+ZGV2KTsKIAotCXJldHVybiB0ZWdy
YV9kcGF1eF9wYWRfY29uZmlnKGRwYXV4LCBmdW5jdGlvbik7CisJcmV0dXJuIGVycjsKIH0KIAog
c3RhdGljIGNvbnN0IHN0cnVjdCBwaW5tdXhfb3BzIHRlZ3JhX2RwYXV4X3Bpbm11eF9vcHMgPSB7
CkBAIC04MDksMTUgKzgxNCwyMiBAQCBlbnVtIGRybV9jb25uZWN0b3Jfc3RhdHVzIGRybV9kcF9h
dXhfZGV0ZWN0KHN0cnVjdCBkcm1fZHBfYXV4ICphdXgpCiBpbnQgZHJtX2RwX2F1eF9lbmFibGUo
c3RydWN0IGRybV9kcF9hdXggKmF1eCkKIHsKIAlzdHJ1Y3QgdGVncmFfZHBhdXggKmRwYXV4ID0g
dG9fZHBhdXgoYXV4KTsKKwlpbnQgZXJyOworCisJcG1fcnVudGltZV9nZXRfc3luYyhkcGF1eC0+
ZGV2KTsKKwllcnIgPSB0ZWdyYV9kcGF1eF9wYWRfY29uZmlnKGRwYXV4LCBEUEFVWF9QQURDVExf
RlVOQ19BVVgpOworCXBtX3J1bnRpbWVfcHV0KGRwYXV4LT5kZXYpOwogCi0JcmV0dXJuIHRlZ3Jh
X2RwYXV4X3BhZF9jb25maWcoZHBhdXgsIERQQVVYX1BBRENUTF9GVU5DX0FVWCk7CisJcmV0dXJu
IGVycjsKIH0KIAogaW50IGRybV9kcF9hdXhfZGlzYWJsZShzdHJ1Y3QgZHJtX2RwX2F1eCAqYXV4
KQogewogCXN0cnVjdCB0ZWdyYV9kcGF1eCAqZHBhdXggPSB0b19kcGF1eChhdXgpOwogCisJcG1f
cnVudGltZV9nZXRfc3luYyhkcGF1eC0+ZGV2KTsKIAl0ZWdyYV9kcGF1eF9wYWRfcG93ZXJfZG93
bihkcGF1eCk7CisJcG1fcnVudGltZV9wdXQoZHBhdXgtPmRldik7CiAKIAlyZXR1cm4gMDsKIH0K
LS0gCjIuMjMuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
