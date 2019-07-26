Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A88E78624
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jul 2019 09:18:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B1E489CD4;
	Mon, 29 Jul 2019 07:18:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 699AB6ED24
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jul 2019 11:28:03 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id v24so51242717ljg.13
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jul 2019 04:28:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=K7MgO7LDfJLI1re2AmLs6fSClTgO04pZ2Z1SN3XHnLo=;
 b=X0w8DoUQT5NI+HblSLvJOs+089TTtxOkBvIHVLEtFeuDQznvaZUh99YUaYL4A36mTk
 uQSURnuyzvMNizjwV/zZRsFeBLQGRJOdv0vArrwwkEEqEsayIKi79TvUGCAfZhFlTUsy
 XC0CXkfoBpagtMKLtZIxb8KNYbV9zyy3My0RYd5sQ/ddGpv5Kq5DYAmOQRegI2KSTGIA
 6tDtqMpWL98ArAkfqg4RCkQ2d8V1US7pDBaipJLA513D42ZZ97NXpuXUSCokkSGbbOEL
 +wgVwOlrZLqMLGBsoKnxwz+L7+0CT37ocQNjEsJN6YJqKOKe02N8XA0ZQH0yLUVJd8wX
 aCqw==
X-Gm-Message-State: APjAAAVgJTUG1qsz8kdakCQSFDEynTsI4vij+FU7xUDPjjL5MWmosg54
 Jw3CyQaFdIiwVGLiLjPRBP7MoA==
X-Google-Smtp-Source: APXvYqzqkMmWf5XFkm6UgpddOj6fH2dLFSQx8s4YZ6JigCKF75gjO4pcg4iUvXqN26+7VIGRBPcakA==
X-Received: by 2002:a2e:8e90:: with SMTP id z16mr1684039ljk.4.1564140481817;
 Fri, 26 Jul 2019 04:28:01 -0700 (PDT)
Received: from localhost (c-243c70d5.07-21-73746f28.bbcust.telenor.se.
 [213.112.60.36])
 by smtp.gmail.com with ESMTPSA id v86sm9926234lje.74.2019.07.26.04.28.00
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 26 Jul 2019 04:28:00 -0700 (PDT)
From: Anders Roxell <anders.roxell@linaro.org>
To: robdclark@gmail.com, sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH 3/3] drm: msm: a3xx: Mark expected switch fall-through
Date: Fri, 26 Jul 2019 13:27:55 +0200
Message-Id: <20190726112755.19511-1-anders.roxell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 29 Jul 2019 07:16:44 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=K7MgO7LDfJLI1re2AmLs6fSClTgO04pZ2Z1SN3XHnLo=;
 b=L/TZ3vb3T22EK1HJo+QpkSQL7fhtmr9agOpQ8pWUpl20813rj+CmWCzmfwqt2D54to
 DWNS4kJSBjnHDUgf+X9oCYLxE1orEFH+x89VNk7jykOjUABheMYPrvsCnQNaVFE8SZN3
 3mIK54oD4QUmhWcOZOTtN9UrJT1zKoZ9HGzKb0Yrxq1RtjXRr6tjOY9B7hljvZbC13OS
 reks/ePwtDW5kj50ROfXjekOPnxhGDdp1a0fTE9/FMdR/hVF2EFOeZtoVTaA71eVQ0k5
 mobVZ6zgAuegz3xyvBto6aiJKauJC+/adkzyU7FrLXgarhBd3YqqpBfJgEE4a8Ay7TK9
 1qTw==
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
Cc: linux-arm-msm@vger.kernel.org, Anders Roxell <anders.roxell@linaro.org>,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2hlbiBmYWxsLXRocm91Z2ggd2FybmluZ3Mgd2FzIGVuYWJsZWQgYnkgZGVmYXVsdCB0aGUgZm9s
bG93aW5nIHdhcm5pbmcKd2FzIHN0YXJ0aW5nIHRvIHNob3cgdXA6CgouLi9kcml2ZXJzL2dwdS9k
cm0vbXNtL2FkcmVuby9hZHJlbm9fZ3B1LmM6IEluIGZ1bmN0aW9uIOKAmGFkcmVub19zdWJtaXTi
gJk6Ci4uL2RyaXZlcnMvZ3B1L2RybS9tc20vYWRyZW5vL2FkcmVub19ncHUuYzo0Mjk6Nzogd2Fy
bmluZzogdGhpcyBzdGF0ZW1lbnQgbWF5IGZhbGwKIHRocm91Z2ggWy1XaW1wbGljaXQtZmFsbHRo
cm91Z2g9XQogICAgaWYgKHByaXYtPmxhc3RjdHggPT0gY3R4KQogICAgICAgXgouLi9kcml2ZXJz
L2dwdS9kcm0vbXNtL2FkcmVuby9hZHJlbm9fZ3B1LmM6NDMxOjM6IG5vdGU6IGhlcmUKICAgY2Fz
ZSBNU01fU1VCTUlUX0NNRF9CVUY6CiAgIF5+fn4KClJld29yayBzbyB0aGF0IHRoZSBjb21waWxl
ciBkb2Vzbid0IHdhcm4gYWJvdXQgZmFsbC10aHJvdWdoLgoKRml4ZXM6IGQ5MzUxMmVmMGYwZSAo
Ik1ha2VmaWxlOiBHbG9iYWxseSBlbmFibGUgZmFsbC10aHJvdWdoIHdhcm5pbmciKQpTaWduZWQt
b2ZmLWJ5OiBBbmRlcnMgUm94ZWxsIDxhbmRlcnMucm94ZWxsQGxpbmFyby5vcmc+Ci0tLQogZHJp
dmVycy9ncHUvZHJtL21zbS9hZHJlbm8vYWRyZW5vX2dwdS5jIHwgMSArCiAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2FkcmVu
by9hZHJlbm9fZ3B1LmMgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2FkcmVuby9hZHJlbm9fZ3B1LmMK
aW5kZXggOWFjYmJjMGYzMjMyLi44ZmVhMDE0ZjBkZWEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9tc20vYWRyZW5vL2FkcmVub19ncHUuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2Fk
cmVuby9hZHJlbm9fZ3B1LmMKQEAgLTQyOCw2ICs0MjgsNyBAQCB2b2lkIGFkcmVub19zdWJtaXQo
c3RydWN0IG1zbV9ncHUgKmdwdSwgc3RydWN0IG1zbV9nZW1fc3VibWl0ICpzdWJtaXQsCiAJCQkv
KiBpZ25vcmUgaWYgdGhlcmUgaGFzIG5vdCBiZWVuIGEgY3R4IHN3aXRjaDogKi8KIAkJCWlmIChw
cml2LT5sYXN0Y3R4ID09IGN0eCkKIAkJCQlicmVhazsKKwkJCS8qIEZhbGwgdGhyb3VnaCAqLwog
CQljYXNlIE1TTV9TVUJNSVRfQ01EX0JVRjoKIAkJCU9VVF9QS1QzKHJpbmcsIGFkcmVub19pc19h
NDMwKGFkcmVub19ncHUpID8KIAkJCQlDUF9JTkRJUkVDVF9CVUZGRVJfUEZFIDogQ1BfSU5ESVJF
Q1RfQlVGRkVSX1BGRCwgMik7Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
