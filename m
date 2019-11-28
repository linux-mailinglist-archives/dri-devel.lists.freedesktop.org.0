Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C90E510CBE9
	for <lists+dri-devel@lfdr.de>; Thu, 28 Nov 2019 16:38:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61DB96E84A;
	Thu, 28 Nov 2019 15:38:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 508B96E822
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Nov 2019 15:38:02 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id z7so28212317wrl.13
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Nov 2019 07:38:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DZWNjGPJrA9TiLgOiM42Wa6pCMxexw+xtFbZOuu9Dj0=;
 b=P0RluODebqO0qRfqM1iy6XdAkSq++zXIpm77sivraQaOttmA+3Qir0GsFiXx7T5W6E
 VLrPj3T+u5dL78QXHTlkXr1nedQgsMcW/ieb/wTBoKr6DwHBEqSB/DUcYF+LPV1J9OML
 yGash2eaJQnPswNucAPthFq4Uzm51xkmMMV9WdViLVP4EfmShVhNj2HDODSPF7rnPnZp
 sTNxEOBrsYuW5fRtVTa2TqCjmb3dEQTXrFL4EFryizBB59SrnrB3CSQAyfmipRRTkoqi
 eg/81jw1mb0yp5aqjiOB+ZRmnSKWFxcHk1EJiVI+0DLPIgDyHxFDZZZQ5wJQGup/ZYPK
 kxUg==
X-Gm-Message-State: APjAAAUcsEsBPYzBV6qgRF5CTZHCNqNA/zTGaD2pjx8wdFX8avOBisLN
 4ox/F9pMhu0JsAtXt4BPILI=
X-Google-Smtp-Source: APXvYqxY00AlQiRyW3tG6/BnHI8I8iDyWl6zJrMYZ8i9WUIigDI2zW81I6BGYQR6FwxL4UuWXDfaJg==
X-Received: by 2002:a5d:46c7:: with SMTP id g7mr13891032wrs.11.1574955480883; 
 Thu, 28 Nov 2019 07:38:00 -0800 (PST)
Received: from localhost (pD9E518ED.dip0.t-ipconnect.de. [217.229.24.237])
 by smtp.gmail.com with ESMTPSA id 72sm24285631wrl.73.2019.11.28.07.37.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Nov 2019 07:38:00 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 9/9] drm/tegra: sor: Make the +5V HDMI supply optional
Date: Thu, 28 Nov 2019 16:37:41 +0100
Message-Id: <20191128153741.2380419-10-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191128153741.2380419-1-thierry.reding@gmail.com>
References: <20191128153741.2380419-1-thierry.reding@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DZWNjGPJrA9TiLgOiM42Wa6pCMxexw+xtFbZOuu9Dj0=;
 b=fBM1fnaSHGPaWj2oDBplza3m7QMiLpkQd4blnANTy09QOm9ZAmdZs+MxmnNEnUhauM
 Nrqgw71rQIAn9ttijEmzZoCTxxtAuxFfcDRthNbgBOOr71OkD6KrO+auVhP//1d4TAYS
 TCSvmrKJ8qQXRWv7U1XOEuEGjEaArFMentcrB2fpRZM1tANAmPDI8u64a+h8UsWnOSz3
 Xeg41ALMwyGoZcL743L9UOzL5F/WaOmV6+2MNY7oa8Nfxm/w4ctoyXrZSQTZ96icQQyB
 u+wq/C90LEzesgf6O5fZLysT6CmHNf9im0svPqvmJHVZDjyE+5JkV0At652rkmy06Mfr
 N0gA==
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

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KClRoZSBTT1Igc3VwcG9y
dHMgbXVsdGlwbGUgZGlzcGxheSBtb2RlcywgYnV0IG9ubHkgd2hlbiBkcml2aW5nIGFuIEhETUkK
bW9uaXRvciBkb2VzIGl0IG1ha2Ugc2Vuc2UgdG8gY29udHJvbCB0aGUgKzVWIHBvd2VyIHN1cHBs
eS4gZURQIGFuZCBEUApkb24ndCBuZWVkIHRoaXMsIHNvIG1ha2UgaXQgb3B0aW9uYWwuCgpUaGlz
IGZpeGVzIGEgY3Jhc2ggb2JzZXJ2ZWQgZHVyaW5nIHN5c3RlbSBzdXNwZW5kL3Jlc3VtZS4KClNp
Z25lZC1vZmYtYnk6IFRoaWVycnkgUmVkaW5nIDx0cmVkaW5nQG52aWRpYS5jb20+Ci0tLQogZHJp
dmVycy9ncHUvZHJtL3RlZ3JhL3Nvci5jIHwgMTggKysrKysrKysrKysrKysrKy0tCiAxIGZpbGUg
Y2hhbmdlZCwgMTYgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vdGVncmEvc29yLmMgYi9kcml2ZXJzL2dwdS9kcm0vdGVncmEvc29yLmMK
aW5kZXggMjIwMGY0Y2QzOTdhLi5hNjhkM2IzNmI5NzIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1
L2RybS90ZWdyYS9zb3IuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vdGVncmEvc29yLmMKQEAgLTM5
NzAsMTUgKzM5NzAsMjkgQEAgc3RhdGljIGludCB0ZWdyYV9zb3JfcnVudGltZV9yZXN1bWUoc3Ry
dWN0IGRldmljZSAqZGV2KQogc3RhdGljIGludCB0ZWdyYV9zb3Jfc3VzcGVuZChzdHJ1Y3QgZGV2
aWNlICpkZXYpCiB7CiAJc3RydWN0IHRlZ3JhX3NvciAqc29yID0gZGV2X2dldF9kcnZkYXRhKGRl
dik7CisJaW50IGVycjsKKworCWlmIChzb3ItPmhkbWlfc3VwcGx5KSB7CisJCWVyciA9IHJlZ3Vs
YXRvcl9kaXNhYmxlKHNvci0+aGRtaV9zdXBwbHkpOworCQlpZiAoZXJyIDwgMCkKKwkJCXJldHVy
biBlcnI7CisJfQogCi0JcmV0dXJuIHJlZ3VsYXRvcl9kaXNhYmxlKHNvci0+aGRtaV9zdXBwbHkp
OworCXJldHVybiAwOwogfQogCiBzdGF0aWMgaW50IHRlZ3JhX3Nvcl9yZXN1bWUoc3RydWN0IGRl
dmljZSAqZGV2KQogewogCXN0cnVjdCB0ZWdyYV9zb3IgKnNvciA9IGRldl9nZXRfZHJ2ZGF0YShk
ZXYpOworCWludCBlcnI7CisKKwlpZiAoc29yLT5oZG1pX3N1cHBseSkgeworCQllcnIgPSByZWd1
bGF0b3JfZW5hYmxlKHNvci0+aGRtaV9zdXBwbHkpOworCQlpZiAoZXJyIDwgMCkKKwkJCXJldHVy
biBlcnI7CisJfQogCi0JcmV0dXJuIHJlZ3VsYXRvcl9lbmFibGUoc29yLT5oZG1pX3N1cHBseSk7
CisJcmV0dXJuIDA7CiB9CiAKIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZGV2X3BtX29wcyB0ZWdyYV9z
b3JfcG1fb3BzID0gewotLSAKMi4yMy4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
