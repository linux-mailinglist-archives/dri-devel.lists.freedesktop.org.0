Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DB353185ED
	for <lists+dri-devel@lfdr.de>; Thu,  9 May 2019 09:18:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEA5F89A4F;
	Thu,  9 May 2019 07:18:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from onstation.org (onstation.org [52.200.56.107])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3231C899E7;
 Thu,  9 May 2019 02:04:11 +0000 (UTC)
Received: from localhost.localdomain (c-98-239-145-235.hsd1.wv.comcast.net
 [98.239.145.235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: masneyb)
 by onstation.org (Postfix) with ESMTPSA id 46C8C45028;
 Thu,  9 May 2019 02:04:10 +0000 (UTC)
From: Brian Masney <masneyb@onstation.org>
To: robdclark@gmail.com, sean@poorly.run, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 airlied@linux.ie, daniel@ffwll.ch, linux-kernel@vger.kernel.org,
 linus.walleij@linaro.org, jonathan@marek.ca, robh@kernel.org
Subject: [PATCH v2 6/6] ARM: dts: qcom: msm8974-hammerhead: add support for
 display
Date: Wed,  8 May 2019 22:03:52 -0400
Message-Id: <20190509020352.14282-7-masneyb@onstation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190509020352.14282-1-masneyb@onstation.org>
References: <20190509020352.14282-1-masneyb@onstation.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 09 May 2019 07:18:00 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=onstation.org; s=default; t=1557367450;
 bh=DnxFIWJiYPCIrbZC4zjRUX6UwmBDJz7GNDcLVKhGXiw=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=o4/pNA7RYqiBopCPyk16RVI5wklD7tSHU+knACzth97s7Gc1sVFq4/Phm2DBEFwbW
 YzkzPOuWt9WUjVPjq9qkWqkKBtEqgYDYaf+FDmQpkwVlrPJQqSx9LmDMfRwvRrxFI+
 xmzg07Nl2conmT6Xx7lzU4mNg6qVRIAe1IQCZ+xQ=
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
ZXliQG9uc3RhdGlvbi5vcmc+ClJldmlld2VkLWJ5OiBMaW51cyBXYWxsZWlqIDxsaW51cy53YWxs
ZWlqQGxpbmFyby5vcmc+Ci0tLQpDaGFuZ2VzIHNpbmNlIHYxOgotIE5vbmUKCiAuLi4vcWNvbS1t
c204OTc0LWxnZS1uZXh1czUtaGFtbWVyaGVhZC5kdHMgICAgfCA0NSArKysrKysrKysrKysrKysr
KysrCiAxIGZpbGUgY2hhbmdlZCwgNDUgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2FyY2gv
YXJtL2Jvb3QvZHRzL3Fjb20tbXNtODk3NC1sZ2UtbmV4dXM1LWhhbW1lcmhlYWQuZHRzIGIvYXJj
aC9hcm0vYm9vdC9kdHMvcWNvbS1tc204OTc0LWxnZS1uZXh1czUtaGFtbWVyaGVhZC5kdHMKaW5k
ZXggYjdjZjRiMTAxOWU5Li43NDkyMjZlMThhYjUgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtL2Jvb3Qv
ZHRzL3Fjb20tbXNtODk3NC1sZ2UtbmV4dXM1LWhhbW1lcmhlYWQuZHRzCisrKyBiL2FyY2gvYXJt
L2Jvb3QvZHRzL3Fjb20tbXNtODk3NC1sZ2UtbmV4dXM1LWhhbW1lcmhlYWQuZHRzCkBAIC01MDAs
NiArNTAwLDUxIEBACiAJCQl9OwogCQl9OwogCX07CisKKwltZHNzQGZkOTAwMDAwIHsKKwkJc3Rh
dHVzID0gIm9rIjsKKworCQltZHBAZmQ5MDAwMDAgeworCQkJc3RhdHVzID0gIm9rIjsKKwkJfTsK
KworCQlkc2lAZmQ5MjI4MDAgeworCQkJc3RhdHVzID0gIm9rIjsKKworCQkJdmRkYS1zdXBwbHkg
PSA8JnBtODk0MV9sMj47CisJCQl2ZGQtc3VwcGx5ID0gPCZwbTg5NDFfbHZzMz47CisJCQl2ZGRp
by1zdXBwbHkgPSA8JnBtODk0MV9sMTI+OworCisJCQkjYWRkcmVzcy1jZWxscyA9IDwxPjsKKwkJ
CSNzaXplLWNlbGxzID0gPDA+OworCisJCQlwb3J0cyB7CisJCQkJcG9ydEAxIHsKKwkJCQkJZW5k
cG9pbnQgeworCQkJCQkJcmVtb3RlLWVuZHBvaW50ID0gPCZwYW5lbF9pbj47CisJCQkJCQlkYXRh
LWxhbmVzID0gPDAgMSAyIDM+OworCQkJCQl9OworCQkJCX07CisJCQl9OworCisJCQlwYW5lbDog
cGFuZWxAMCB7CisJCQkJcmVnID0gPDA+OworCQkJCWNvbXBhdGlibGUgPSAibGcsYWN4NDY3YWtt
LTciOworCisJCQkJcG9ydCB7CisJCQkJCXBhbmVsX2luOiBlbmRwb2ludCB7CisJCQkJCQlyZW1v
dGUtZW5kcG9pbnQgPSA8JmRzaTBfb3V0PjsKKwkJCQkJfTsKKwkJCQl9OworCQkJfTsKKwkJfTsK
KworCQlkc2ktcGh5QGZkOTIyYTAwIHsKKwkJCXN0YXR1cyA9ICJvayI7CisKKwkJCXZkZGlvLXN1
cHBseSA9IDwmcG04OTQxX2wxMj47CisJCX07CisJfTsKIH07CiAKICZzcG1pX2J1cyB7Ci0tIAoy
LjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
