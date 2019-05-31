Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DFD4315C0
	for <lists+dri-devel@lfdr.de>; Fri, 31 May 2019 21:58:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6374C898F5;
	Fri, 31 May 2019 19:58:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from onstation.org (onstation.org [52.200.56.107])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 888AB892D4;
 Fri, 31 May 2019 09:46:33 +0000 (UTC)
Received: from localhost.localdomain (c-98-239-145-235.hsd1.wv.comcast.net
 [98.239.145.235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: masneyb)
 by onstation.org (Postfix) with ESMTPSA id 96F1E45087;
 Fri, 31 May 2019 09:46:32 +0000 (UTC)
From: Brian Masney <masneyb@onstation.org>
To: robdclark@gmail.com, sean@poorly.run, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 airlied@linux.ie, daniel@ffwll.ch, linux-kernel@vger.kernel.org,
 linus.walleij@linaro.org, jonathan@marek.ca, robh@kernel.org,
 jeffrey.l.hugo@gmail.com
Subject: [PATCH v3 6/6] ARM: dts: qcom: msm8974-hammerhead: add support for
 display
Date: Fri, 31 May 2019 05:46:19 -0400
Message-Id: <20190531094619.31704-7-masneyb@onstation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190531094619.31704-1-masneyb@onstation.org>
References: <20190531094619.31704-1-masneyb@onstation.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 31 May 2019 19:58:01 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=onstation.org; s=default; t=1559295992;
 bh=P7el3Xz8wlBT8PxKKUD6xEjlNmXFaxsNrW/042rvrXc=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=JKVOa9SAa7kA2Lli3+GkWmtyF8MNZPxXaea7LmxpPJnge8YifcrGodkFsm8APowey
 Gf7GreekdN/kCh7UNbAXSlfs0p6N7JyTLs1oif1tKegAr9Pe6YhkQK1Nb+gXSyWLqZ
 B/wxNfa1E+rVqfIeHzxq7wcMu7mq2yC05inAeVIA=
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
IDUgKGhhbW1lcmhlYWQpCnBob25lLiBUaGlzIGlzIGJhc2VkIG9uIHdvcmsgZnJvbSBKb25hdGhh
biBNYXJlay4KClNpZ25lZC1vZmYtYnk6IEJyaWFuIE1hc25leSA8bWFzbmV5YkBvbnN0YXRpb24u
b3JnPgotLS0KIC4uLi9xY29tLW1zbTg5NzQtbGdlLW5leHVzNS1oYW1tZXJoZWFkLmR0cyAgICB8
IDU4ICsrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA1OCBpbnNlcnRpb25zKCsp
CgpkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vYm9vdC9kdHMvcWNvbS1tc204OTc0LWxnZS1uZXh1czUt
aGFtbWVyaGVhZC5kdHMgYi9hcmNoL2FybS9ib290L2R0cy9xY29tLW1zbTg5NzQtbGdlLW5leHVz
NS1oYW1tZXJoZWFkLmR0cwppbmRleCA1MTg4OWQ2NmI1NWEuLjQ3NzZmMDFmNDkyYyAxMDA2NDQK
LS0tIGEvYXJjaC9hcm0vYm9vdC9kdHMvcWNvbS1tc204OTc0LWxnZS1uZXh1czUtaGFtbWVyaGVh
ZC5kdHMKKysrIGIvYXJjaC9hcm0vYm9vdC9kdHMvcWNvbS1tc204OTc0LWxnZS1uZXh1czUtaGFt
bWVyaGVhZC5kdHMKQEAgLTMzMiw2ICszMzIsMTYgQEAKIAkJCQlmdW5jdGlvbiA9ICJncGlvIjsK
IAkJCX07CiAJCX07CisKKwkJcGFuZWxfcGluOiBwYW5lbCB7CisJCQl0ZSB7CisJCQkJcGlucyA9
ICJncGlvMTIiOworCQkJCWZ1bmN0aW9uID0gIm1kcF92c3luYyI7CisKKwkJCQlkcml2ZS1zdHJl
bmd0aCA9IDwyPjsKKwkJCQliaWFzLWRpc2FibGU7CisJCQl9OworCQl9OwogCX07CiAKIAl2aWJy
YXRvckBmZDhjMzQ1MCB7CkBAIC01MzEsNiArNTQxLDU0IEBACiAJCQl9OwogCQl9OwogCX07CisK
KwltZHNzQGZkOTAwMDAwIHsKKwkJc3RhdHVzID0gIm9rIjsKKworCQltZHBAZmQ5MDAwMDAgewor
CQkJc3RhdHVzID0gIm9rIjsKKwkJfTsKKworCQlkc2lAZmQ5MjI4MDAgeworCQkJc3RhdHVzID0g
Im9rIjsKKworCQkJdmRkYS1zdXBwbHkgPSA8JnBtODk0MV9sMj47CisJCQl2ZGQtc3VwcGx5ID0g
PCZwbTg5NDFfbHZzMz47CisJCQl2ZGRpby1zdXBwbHkgPSA8JnBtODk0MV9sMTI+OworCisJCQkj
YWRkcmVzcy1jZWxscyA9IDwxPjsKKwkJCSNzaXplLWNlbGxzID0gPDA+OworCisJCQlwb3J0cyB7
CisJCQkJcG9ydEAxIHsKKwkJCQkJZW5kcG9pbnQgeworCQkJCQkJcmVtb3RlLWVuZHBvaW50ID0g
PCZwYW5lbF9pbj47CisJCQkJCQlkYXRhLWxhbmVzID0gPDAgMSAyIDM+OworCQkJCQl9OworCQkJ
CX07CisJCQl9OworCisJCQlwYW5lbDogcGFuZWxAMCB7CisJCQkJcmVnID0gPDA+OworCQkJCWNv
bXBhdGlibGUgPSAibGcsYWN4NDY3YWttLTciOworCisJCQkJcGluY3RybC1uYW1lcyA9ICJkZWZh
dWx0IjsKKwkJCQlwaW5jdHJsLTAgPSA8JnBhbmVsX3Bpbj47CisKKwkJCQlwb3J0IHsKKwkJCQkJ
cGFuZWxfaW46IGVuZHBvaW50IHsKKwkJCQkJCXJlbW90ZS1lbmRwb2ludCA9IDwmZHNpMF9vdXQ+
OworCQkJCQl9OworCQkJCX07CisJCQl9OworCQl9OworCisJCWRzaS1waHlAZmQ5MjJhMDAgewor
CQkJc3RhdHVzID0gIm9rIjsKKworCQkJdmRkaW8tc3VwcGx5ID0gPCZwbTg5NDFfbDEyPjsKKwkJ
fTsKKwl9OwogfTsKIAogJnNwbWlfYnVzIHsKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
