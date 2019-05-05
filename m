Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 518E61453C
	for <lists+dri-devel@lfdr.de>; Mon,  6 May 2019 09:28:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE3988941E;
	Mon,  6 May 2019 07:28:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from onstation.org (onstation.org [52.200.56.107])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA0F089150
 for <dri-devel@lists.freedesktop.org>; Sun,  5 May 2019 13:04:29 +0000 (UTC)
Received: from localhost.localdomain (c-98-239-145-235.hsd1.wv.comcast.net
 [98.239.145.235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: masneyb)
 by onstation.org (Postfix) with ESMTPSA id E664445025;
 Sun,  5 May 2019 13:04:28 +0000 (UTC)
From: Brian Masney <masneyb@onstation.org>
To: robdclark@gmail.com, sean@poorly.run, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 airlied@linux.ie, daniel@ffwll.ch, linux-kernel@vger.kernel.org,
 linus.walleij@linaro.org
Subject: [PATCH RFC 6/6] ARM: dts: qcom: msm8974-hammerhead: add support for
 display
Date: Sun,  5 May 2019 09:04:13 -0400
Message-Id: <20190505130413.32253-7-masneyb@onstation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190505130413.32253-1-masneyb@onstation.org>
References: <20190505130413.32253-1-masneyb@onstation.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 06 May 2019 07:27:59 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=onstation.org; s=default; t=1557061469;
 bh=VobKfXF3wCh1U9MUc0on+2Lzz9kJHqbfrswL48/mVfU=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=SlGCuapUmo0Uruqd3/6TH/mk/NE/d1k767QquWY2HjwUKZuTJ1O7QX9tinWIjpndd
 SrkmFX96GK89YEYpqXHDsfkCzCG0a4qqghWCQs5kbYL33JQp5tJmrqk5e7xvi9ncYq
 RvoAk5nfeHa8bFOYl0V0MrWn7Omjnkw5CZZtHT48=
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIGluaXRpYWwgc3VwcG9ydCBmb3IgdGhlIGRpc3BsYXkgZm91bmQgb24gdGhlIExHIE5leHVz
IDUgKGhhbW1lcmhlYWQpCnBob25lLgoKU2lnbmVkLW9mZi1ieTogQnJpYW4gTWFzbmV5IDxtYXNu
ZXliQG9uc3RhdGlvbi5vcmc+Ci0tLQpTZWUgdGhlIGNvdmVyIGxldHRlciBvbiB0aGlzIHBhdGNo
IHNlcmllcyBmb3IgZGV0YWlscyBhYm91dCB0aGUgaXNzdWUKdGhhdCBJJ20gcnVubmluZyBpbnRv
IHdpdGggdGhpcyBib2FyZC4KCiAuLi4vcWNvbS1tc204OTc0LWxnZS1uZXh1czUtaGFtbWVyaGVh
ZC5kdHMgICAgfCA0NSArKysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgNDUgaW5z
ZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jvb3QvZHRzL3Fjb20tbXNtODk3NC1s
Z2UtbmV4dXM1LWhhbW1lcmhlYWQuZHRzIGIvYXJjaC9hcm0vYm9vdC9kdHMvcWNvbS1tc204OTc0
LWxnZS1uZXh1czUtaGFtbWVyaGVhZC5kdHMKaW5kZXggYjdjZjRiMTAxOWU5Li43NDkyMjZlMThh
YjUgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtL2Jvb3QvZHRzL3Fjb20tbXNtODk3NC1sZ2UtbmV4dXM1
LWhhbW1lcmhlYWQuZHRzCisrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL3Fjb20tbXNtODk3NC1sZ2Ut
bmV4dXM1LWhhbW1lcmhlYWQuZHRzCkBAIC01MDAsNiArNTAwLDUxIEBACiAJCQl9OwogCQl9Owog
CX07CisKKwltZHNzQGZkOTAwMDAwIHsKKwkJc3RhdHVzID0gIm9rIjsKKworCQltZHBAZmQ5MDAw
MDAgeworCQkJc3RhdHVzID0gIm9rIjsKKwkJfTsKKworCQlkc2lAZmQ5MjI4MDAgeworCQkJc3Rh
dHVzID0gIm9rIjsKKworCQkJdmRkYS1zdXBwbHkgPSA8JnBtODk0MV9sMj47CisJCQl2ZGQtc3Vw
cGx5ID0gPCZwbTg5NDFfbHZzMz47CisJCQl2ZGRpby1zdXBwbHkgPSA8JnBtODk0MV9sMTI+Owor
CisJCQkjYWRkcmVzcy1jZWxscyA9IDwxPjsKKwkJCSNzaXplLWNlbGxzID0gPDA+OworCisJCQlw
b3J0cyB7CisJCQkJcG9ydEAxIHsKKwkJCQkJZW5kcG9pbnQgeworCQkJCQkJcmVtb3RlLWVuZHBv
aW50ID0gPCZwYW5lbF9pbj47CisJCQkJCQlkYXRhLWxhbmVzID0gPDAgMSAyIDM+OworCQkJCQl9
OworCQkJCX07CisJCQl9OworCisJCQlwYW5lbDogcGFuZWxAMCB7CisJCQkJcmVnID0gPDA+Owor
CQkJCWNvbXBhdGlibGUgPSAibGcsYWN4NDY3YWttLTciOworCisJCQkJcG9ydCB7CisJCQkJCXBh
bmVsX2luOiBlbmRwb2ludCB7CisJCQkJCQlyZW1vdGUtZW5kcG9pbnQgPSA8JmRzaTBfb3V0PjsK
KwkJCQkJfTsKKwkJCQl9OworCQkJfTsKKwkJfTsKKworCQlkc2ktcGh5QGZkOTIyYTAwIHsKKwkJ
CXN0YXR1cyA9ICJvayI7CisKKwkJCXZkZGlvLXN1cHBseSA9IDwmcG04OTQxX2wxMj47CisJCX07
CisJfTsKIH07CiAKICZzcG1pX2J1cyB7Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
