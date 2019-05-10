Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2397C1999B
	for <lists+dri-devel@lfdr.de>; Fri, 10 May 2019 10:24:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C154989A4F;
	Fri, 10 May 2019 08:23:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa49.google.com (mail-vk1-xa49.google.com
 [IPv6:2607:f8b0:4864:20::a49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C712898ED
 for <dri-devel@lists.freedesktop.org>; Fri, 10 May 2019 00:00:44 +0000 (UTC)
Received: by mail-vk1-xa49.google.com with SMTP id r14so1671747vkd.18
 for <dri-devel@lists.freedesktop.org>; Thu, 09 May 2019 17:00:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=qD8P7476YfiQtjv1E6lcuRrJ6WjHMdxq7Sq+F+HQQEQ=;
 b=PIET82QX70+wDfu2osQK/h7ED0F/qWF4JGqSVFeBXs+sWAwz3H1GvY91aJa/A5y96c
 l5rrT7JQc+n3s15tAnz6VKo4geRaousfs8cBRrCpLTMPL9Kw3T2cSAOpE9EFwc+lmaa8
 H2mSihlM7nQcnA8hPK1BkJsJNFeNn5V4FdwelCJiAJa81Y7yVv1Y1GOkXvZmqMIrr0TA
 8nwSPmRa0DJguRWrfx640JTBlfq/jWW9PYNJhUJuG9Wa15jkBbA4kZD0xc2sdDvex+bw
 oHmUoWH0waQCKZhXhkO8li7RBbvkMRtj1HN2XAy9Q9cAbiKVp4/BrT2cmRGaAGupI2hC
 Hglw==
X-Gm-Message-State: APjAAAWH4IAjfjs93HJYsXVuxTyE9/YmfzY7+xyK8gNowZsnZekAUq82
 a3eA4vF0mOu7k5sxtOW04TxTNLFtHQ==
X-Google-Smtp-Source: APXvYqyQxj4h5EKFqbJwstNLfU5pFLcxwQyE6tubj5ad3UX+SHoN3VqGEtU8yaujXV/3yBwO0e+/NOKcuw==
X-Received: by 2002:a67:79ca:: with SMTP id u193mr3938693vsc.20.1557446442991; 
 Thu, 09 May 2019 17:00:42 -0700 (PDT)
Date: Thu,  9 May 2019 17:00:32 -0700
In-Reply-To: <20190510000032.40749-1-fengc@google.com>
Message-Id: <20190510000032.40749-4-fengc@google.com>
Mime-Version: 1.0
References: <20190510000032.40749-1-fengc@google.com>
X-Mailer: git-send-email 2.21.0.1020.gf2820cf01a-goog
Subject: [dma-buf v3 3/3] dma-buf: add show_fdinfo handler
From: Chenbo Feng <fengc@google.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-media@vger.kernel.org
X-Mailman-Approved-At: Fri, 10 May 2019 08:23:54 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc;
 bh=qD8P7476YfiQtjv1E6lcuRrJ6WjHMdxq7Sq+F+HQQEQ=;
 b=IaPLSmzKORGLubRZrX1/p4t4QHdGUfNfnAEmoGdLAHRQoPsbSW6uDDBJOb9f3LXHek
 sk+DwsYhcfhq+7j7K45imBSSCNuSDwLYpIRvzQc8+Nu5EJrX/tI4imfG8SYqs9ghzmuM
 EWqHxg0TO7vL6iRBOVhbxCQr9Frq6HSfIio/r8BFcFG3YqICHmpbYug5nLJyKSSuIZnm
 4z9JtbJZ6F/gyewF5ZKdOLsVPObowxwUPTH8fP2+Jab1Q4XT5XJSoLn509G7HlSfKNux
 OQ1pHDC1iRC+lLM1SfCg3g+mij6MB0TAg6QuSwiXXC4ZX3CoHijLVAdRnvhmiGsvI+j4
 5Aow==
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
Cc: erickreyes@google.com, kernel-team@android.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogR3JlZyBIYWNrbWFubiA8Z2hhY2ttYW5uQGdvb2dsZS5jb20+CgpUaGUgc2hvd19mZGlu
Zm8gaGFuZGxlciBleHBvcnRzIHRoZSBzYW1lIGluZm9ybWF0aW9uIGF2YWlsYWJsZSB0aHJvdWdo
CmRlYnVnZnMgb24gYSBwZXItYnVmZmVyIGJhc2lzLgoKU2lnbmVkLW9mZi1ieTogR3JlZyBIYWNr
bWFubiA8Z2hhY2ttYW5uQGdvb2dsZS5jb20+ClNpZ25lZC1vZmYtYnk6IENoZW5ibyBGZW5nIDxm
ZW5nY0Bnb29nbGUuY29tPgotLS0KIGRyaXZlcnMvZG1hLWJ1Zi9kbWEtYnVmLmMgfCAxNSArKysr
KysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9kbWEtYnVmL2RtYS1idWYuYyBiL2RyaXZlcnMvZG1hLWJ1Zi9kbWEtYnVmLmMK
aW5kZXggYzFkYTVmOWNlNDRkLi5jNGVmYzI3MmZjMzQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZG1h
LWJ1Zi9kbWEtYnVmLmMKKysrIGIvZHJpdmVycy9kbWEtYnVmL2RtYS1idWYuYwpAQCAtMzgxLDYg
KzM4MSwyMCBAQCBzdGF0aWMgbG9uZyBkbWFfYnVmX2lvY3RsKHN0cnVjdCBmaWxlICpmaWxlLAog
CX0KIH0KIAorc3RhdGljIHZvaWQgZG1hX2J1Zl9zaG93X2ZkaW5mbyhzdHJ1Y3Qgc2VxX2ZpbGUg
Km0sIHN0cnVjdCBmaWxlICpmaWxlKQoreworCXN0cnVjdCBkbWFfYnVmICpkbWFidWYgPSBmaWxl
LT5wcml2YXRlX2RhdGE7CisKKwlzZXFfcHJpbnRmKG0sICJzaXplOlx0JXp1XG4iLCBkbWFidWYt
PnNpemUpOworCS8qIERvbid0IGNvdW50IHRoZSB0ZW1wb3JhcnkgcmVmZXJlbmNlIHRha2VuIGlu
c2lkZSBwcm9jZnMgc2VxX3Nob3cgKi8KKwlzZXFfcHJpbnRmKG0sICJjb3VudDpcdCVsZFxuIiwg
ZmlsZV9jb3VudChkbWFidWYtPmZpbGUpIC0gMSk7CisJc2VxX3ByaW50ZihtLCAiZXhwX25hbWU6
XHQlc1xuIiwgZG1hYnVmLT5leHBfbmFtZSk7CisJbXV0ZXhfbG9jaygmZG1hYnVmLT5sb2NrKTsK
KwlpZiAoZG1hYnVmLT5uYW1lKQorCQlzZXFfcHJpbnRmKG0sICJuYW1lOlx0JXNcbiIsIGRtYWJ1
Zi0+bmFtZSk7CisJbXV0ZXhfdW5sb2NrKCZkbWFidWYtPmxvY2spOworfQorCiBzdGF0aWMgY29u
c3Qgc3RydWN0IGZpbGVfb3BlcmF0aW9ucyBkbWFfYnVmX2ZvcHMgPSB7CiAJLnJlbGVhc2UJPSBk
bWFfYnVmX3JlbGVhc2UsCiAJLm1tYXAJCT0gZG1hX2J1Zl9tbWFwX2ludGVybmFsLApAQCAtMzkw
LDYgKzQwNCw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZmlsZV9vcGVyYXRpb25zIGRtYV9idWZf
Zm9wcyA9IHsKICNpZmRlZiBDT05GSUdfQ09NUEFUCiAJLmNvbXBhdF9pb2N0bAk9IGRtYV9idWZf
aW9jdGwsCiAjZW5kaWYKKwkuc2hvd19mZGluZm8JPSBkbWFfYnVmX3Nob3dfZmRpbmZvLAogfTsK
IAogLyoKLS0gCjIuMjEuMC4xMDIwLmdmMjgyMGNmMDFhLWdvb2cKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
