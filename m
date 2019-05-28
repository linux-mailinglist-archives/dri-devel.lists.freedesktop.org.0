Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 604872C20D
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2019 11:03:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B55B489DC9;
	Tue, 28 May 2019 09:03:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A1A789D79
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2019 09:03:19 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id n17so30687149edb.0
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2019 02:03:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2XhY37QKiJG0yVeCBJVjNjQRjgX7g+zT5YuLsuJlT/0=;
 b=ksSW6JNDn++y2CdbnpXcZvJp97AakPLigH4y0zYJEcEBLRgvcwBBTVwVneiVYkkTKV
 N17QfcoT5YX8onhAtjKCDKDBEZ+kQ8J5+wLo7KpCA1vQXml0M+Yf6QQiNkyanp5fsUck
 q1DUiIRTR+4zVS24RjVdzg3GEzolv6SoNtAm7UY51T/dnY5+fRwk823yRyyezI++8Yht
 sdPC2WlxweNaNCUyjAogIFjI1RUWHo+Hw+ZL/ShKY7rNvKRIzLJZuBG0sIj4C4leikbz
 p6OTudnZK6EDVoe+4ehrNC9lJ+Ss0UZLkBLW9xpdyDaBsbPbDfBKeb1taUygnHyMj1IC
 B19g==
X-Gm-Message-State: APjAAAVzCf0rOUrcJT2rYU+OEYCCDfRWvwpDGWkdS5YFPVyrsbr7ujoL
 6HSy4/pRaw77u2gEvM6XOYCcKA==
X-Google-Smtp-Source: APXvYqysJqma/Cwd8MeT0Rq/SJ2o0DZ5nqO5ai6mqVm0Hq+p9CdMzlw4b+pi8PAdwAc8N8a+yr7I9w==
X-Received: by 2002:a50:991d:: with SMTP id k29mr126603128edb.29.1559034197127; 
 Tue, 28 May 2019 02:03:17 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id x49sm4072656edm.25.2019.05.28.02.03.15
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 28 May 2019 02:03:16 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH 05/33] fbdev/sa1100fb: Remove dead code
Date: Tue, 28 May 2019 11:02:36 +0200
Message-Id: <20190528090304.9388-6-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190528090304.9388-1-daniel.vetter@ffwll.ch>
References: <20190528090304.9388-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2XhY37QKiJG0yVeCBJVjNjQRjgX7g+zT5YuLsuJlT/0=;
 b=HUmM6fWW1Qkokcj/zd5Ot2If+OrST6LgqHbbva3UHFF9eJkoMa8t9wN30uRB3Hil7i
 Hc91q9/ULJ947zUpmJgPZwcZmOAeI2WYWWQPocRGWKVj2wKtRnHlrfxXz9WfvOVZabyR
 oBmw1pFE2OHFz+mZds0Vm6nwXAK2VxZ9stb/w=
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 linux-fbdev@vger.kernel.org, DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TW90aXZhdGVkIGJlY2F1c2UgaXQgY29udGFpbnMgYSBzdHJ1Y3QgZGlzcGxheSwgd2hpY2ggaXMg
YSBmYmNvbgppbnRlcm5hbCBkYXRhIHN0cnVjdHVyZSB0aGF0IEkgd2FudCB0byByZW5hbWUuIEl0
IHNlZW1zIHRvIGhhdmUgYmVlbgpmb3JtZXJseSB1c2VkIGluIGRyaXZlcnMsIGJ1dCB0aGF0J3Mg
dmVyeSBsb25nIHRpbWUgYWdvLgoKU2lnbmVkLW9mZi1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVs
LnZldHRlckBpbnRlbC5jb20+ClJldmlld2VkLWJ5OiBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9y
Zy5vcmc+ClJldmlld2VkLWJ5OiBNYWFydGVuIExhbmtob3JzdCA8bWFhcnRlbi5sYW5raG9yc3RA
bGludXguaW50ZWwuY29tPgpDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5j
aD4KLS0tCiBkcml2ZXJzL3ZpZGVvL2ZiZGV2L3NhMTEwMGZiLmMgfCAyNSAtLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMjUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0
IGEvZHJpdmVycy92aWRlby9mYmRldi9zYTExMDBmYi5jIGIvZHJpdmVycy92aWRlby9mYmRldi9z
YTExMDBmYi5jCmluZGV4IDE1YWU1MDA2MzI5Ni4uZjdmOGRlZTA0NGIxIDEwMDY0NAotLS0gYS9k
cml2ZXJzL3ZpZGVvL2ZiZGV2L3NhMTEwMGZiLmMKKysrIGIvZHJpdmVycy92aWRlby9mYmRldi9z
YTExMDBmYi5jCkBAIC05NzQsMzUgKzk3NCwxMCBAQCBzdGF0aWMgdm9pZCBzYTExMDBmYl90YXNr
KHN0cnVjdCB3b3JrX3N0cnVjdCAqdykKICAqLwogc3RhdGljIHVuc2lnbmVkIGludCBzYTExMDBm
Yl9taW5fZG1hX3BlcmlvZChzdHJ1Y3Qgc2ExMTAwZmJfaW5mbyAqZmJpKQogewotI2lmIDAKLQl1
bnNpZ25lZCBpbnQgbWluX3BlcmlvZCA9ICh1bnNpZ25lZCBpbnQpLTE7Ci0JaW50IGk7Ci0KLQlm
b3IgKGkgPSAwOyBpIDwgTUFYX05SX0NPTlNPTEVTOyBpKyspIHsKLQkJc3RydWN0IGRpc3BsYXkg
KmRpc3AgPSAmZmJfZGlzcGxheVtpXTsKLQkJdW5zaWduZWQgaW50IHBlcmlvZDsKLQotCQkvKgot
CQkgKiBEbyB3ZSBvd24gdGhpcyBkaXNwbGF5PwotCQkgKi8KLQkJaWYgKGRpc3AtPmZiX2luZm8g
IT0gJmZiaS0+ZmIpCi0JCQljb250aW51ZTsKLQotCQkvKgotCQkgKiBPaywgY2FsY3VsYXRlIGl0
cyBETUEgcGVyaW9kCi0JCSAqLwotCQlwZXJpb2QgPSBzYTExMDBmYl9kaXNwbGF5X2RtYV9wZXJp
b2QoJmRpc3AtPnZhcik7Ci0JCWlmIChwZXJpb2QgPCBtaW5fcGVyaW9kKQotCQkJbWluX3Blcmlv
ZCA9IHBlcmlvZDsKLQl9Ci0KLQlyZXR1cm4gbWluX3BlcmlvZDsKLSNlbHNlCiAJLyoKIAkgKiBG
SVhNRTogd2UgbmVlZCB0byB2ZXJpZnkgX2FsbF8gY29uc29sZXMuCiAJICovCiAJcmV0dXJuIHNh
MTEwMGZiX2Rpc3BsYXlfZG1hX3BlcmlvZCgmZmJpLT5mYi52YXIpOwotI2VuZGlmCiB9CiAKIC8q
Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
