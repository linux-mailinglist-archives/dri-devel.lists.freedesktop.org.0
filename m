Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A09231452E
	for <lists+dri-devel@lfdr.de>; Mon,  6 May 2019 09:28:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66265892D6;
	Mon,  6 May 2019 07:28:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from onstation.org (onstation.org [52.200.56.107])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D9C489150
 for <dri-devel@lists.freedesktop.org>; Sun,  5 May 2019 13:04:29 +0000 (UTC)
Received: from localhost.localdomain (c-98-239-145-235.hsd1.wv.comcast.net
 [98.239.145.235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: masneyb)
 by onstation.org (Postfix) with ESMTPSA id 8934845024;
 Sun,  5 May 2019 13:04:28 +0000 (UTC)
From: Brian Masney <masneyb@onstation.org>
To: robdclark@gmail.com, sean@poorly.run, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 airlied@linux.ie, daniel@ffwll.ch, linux-kernel@vger.kernel.org,
 linus.walleij@linaro.org
Subject: [PATCH RFC 5/6] ARM: dts: qcom: msm8974-hammerhead: add support for
 backlight
Date: Sun,  5 May 2019 09:04:12 -0400
Message-Id: <20190505130413.32253-6-masneyb@onstation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190505130413.32253-1-masneyb@onstation.org>
References: <20190505130413.32253-1-masneyb@onstation.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 06 May 2019 07:27:59 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=onstation.org; s=default; t=1557061468;
 bh=nYW8yG0aVWdWMAc2ItybuQwpTJk6byq+6MIvbwCCb2I=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=T0nM1MFlR6V7e6fqNwvr92rnw8oTqALQqoebXCwaGBSuFMaIFNM0XmY8QBrQoh6PJ
 jiYOxw3COCdMciC4HeyOnORdaA1qPYw1XoKZ5xYu1SqRkN28Kcq3eUMANUQaxqtuhR
 uJJSgJ+F7lGssm6clGq6dw89hMc38GI6cHqXR4i0=
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

QWRkIG5lY2Vzc2FyeSBkZXZpY2UgdHJlZSBub2RlcyBmb3IgdGhlIG1haW4gTENEIGJhY2tsaWdo
dC4KClNpZ25lZC1vZmYtYnk6IEJyaWFuIE1hc25leSA8bWFzbmV5YkBvbnN0YXRpb24ub3JnPgot
LS0KVGhpcyByZXF1aXJlcyB0aGlzIHNlcmllcyB0aGF0IEkgc3VibWl0dGVkIHRvIHRoZSBMRUQg
LyBiYWNrbGlnaHQKc3Vic3lzdGVtOgpodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sLzIwMTkw
NDI0MDkyNTA1LjY1NzgtMS1tYXNuZXliQG9uc3RhdGlvbi5vcmcvCkl0J3MgcmVjZWl2ZWQgMyB7
UmV2aWV3ZWQsQWNrZWR9LUJ5cywgYW5kIGhhcyBubyBvdXRzdGFuZGluZyBjaGFuZ2UKcmVxdWVz
dHMsIHNvIEkgZXhwZWN0IGl0J2xsIGJlIG1lcmdlZCBzb29uLgoKIC4uLi9xY29tLW1zbTg5NzQt
bGdlLW5leHVzNS1oYW1tZXJoZWFkLmR0cyAgICB8IDM0ICsrKysrKysrKysrKysrKysrKysKIDEg
ZmlsZSBjaGFuZ2VkLCAzNCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vYm9v
dC9kdHMvcWNvbS1tc204OTc0LWxnZS1uZXh1czUtaGFtbWVyaGVhZC5kdHMgYi9hcmNoL2FybS9i
b290L2R0cy9xY29tLW1zbTg5NzQtbGdlLW5leHVzNS1oYW1tZXJoZWFkLmR0cwppbmRleCBiM2Iw
NDczNmExNTkuLmI3Y2Y0YjEwMTllOSAxMDA2NDQKLS0tIGEvYXJjaC9hcm0vYm9vdC9kdHMvcWNv
bS1tc204OTc0LWxnZS1uZXh1czUtaGFtbWVyaGVhZC5kdHMKKysrIGIvYXJjaC9hcm0vYm9vdC9k
dHMvcWNvbS1tc204OTc0LWxnZS1uZXh1czUtaGFtbWVyaGVhZC5kdHMKQEAgLTI4OSw2ICsyODks
MTYgQEAKIAkJCX07CiAJCX07CiAKKwkJaTJjMTFfcGluczogaTJjMTEgeworCQkJbXV4IHsKKwkJ
CQlwaW5zID0gImdwaW84MyIsICJncGlvODQiOworCQkJCWZ1bmN0aW9uID0gImJsc3BfaTJjMTEi
OworCisJCQkJZHJpdmUtc3RyZW5ndGggPSA8Mj47CisJCQkJYmlhcy1kaXNhYmxlOworCQkJfTsK
KwkJfTsKKwogCQlpMmMxMl9waW5zOiBpMmMxMiB7CiAJCQltdXggewogCQkJCXBpbnMgPSAiZ3Bp
bzg3IiwgImdwaW84OCI7CkBAIC0zNjksNiArMzc5LDMwIEBACiAJCX07CiAJfTsKIAorCWkyY0Bm
OTk2NzAwMCB7CisJCXN0YXR1cyA9ICJvayI7CisJCXBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7
CisJCXBpbmN0cmwtMCA9IDwmaTJjMTFfcGlucz47CisJCWNsb2NrLWZyZXF1ZW5jeSA9IDwzNTUw
MDA+OworCQlxY29tLHNyYy1mcmVxID0gPDUwMDAwMDAwPjsKKworCQlsZWQtY29udHJvbGxlckAz
OCB7CisJCQljb21wYXRpYmxlID0gInRpLGxtMzYzMGEiOworCQkJc3RhdHVzID0gIm9rIjsKKwkJ
CXJlZyA9IDwweDM4PjsKKworCQkJI2FkZHJlc3MtY2VsbHMgPSA8MT47CisJCQkjc2l6ZS1jZWxs
cyA9IDwwPjsKKworCQkJbGVkQDAgeworCQkJCXJlZyA9IDwwPjsKKwkJCQlsZWQtc291cmNlcyA9
IDwwIDE+OworCQkJCWxhYmVsID0gImxjZC1iYWNrbGlnaHQiOworCQkJCWRlZmF1bHQtYnJpZ2h0
bmVzcyA9IDwyMDA+OworCQkJfTsKKwkJfTsKKwl9OworCiAJaTJjQGY5OTY4MDAwIHsKIAkJc3Rh
dHVzID0gIm9rIjsKIAkJcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IjsKLS0gCjIuMjAuMQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
