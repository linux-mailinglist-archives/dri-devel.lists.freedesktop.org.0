Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82D8B61DC7
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2019 13:28:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6928689B83;
	Mon,  8 Jul 2019 11:28:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FDBA89B83
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jul 2019 11:28:08 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id p17so15551838ljg.1
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Jul 2019 04:28:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=C3eU6/QOo2RBrGgE4ia/x9v3UnNvCfi4Y+vpPdAqa9s=;
 b=eOYo8s5Gj4RYwpHv/ljeQRAhxXsv1wRAJ4lMuFGu0Cp3uLJS/on8f4roBMbPm1TzxX
 pxcYBBT8XfueCCUUz28OhD1luF5hsgbYlnfFbw2H3xBseY669hF52aG2OPWuVzKA6l1i
 /j5fubD/T3xjXfVqWQkpi/GCSRdL8i6Yks2+b/7o+aLO6qEuvieWCTyLWNuyZOnpouwt
 OSwersXBzAtp9meDohJSKOB9ImYgyoaevbiein7feyNAHj7yvXt5qfQIL/We4vR7voFa
 nrgLq1tnHj2pJbwD91BF8WDEO+RJuz0juAZljCmxJ8ULwTqLIog3kOvdFJ/5zgtDTBqT
 NavQ==
X-Gm-Message-State: APjAAAV8zMflRAC/DCIr+1MTLyZ+39fZCoCq3B8fkbuylsnwoS0vhYco
 4XkGCB/VKrDoOgXSQN9bNQkBMQ==
X-Google-Smtp-Source: APXvYqzv4a10P7c7EQ3ktuF+b9/DEaCDK9CWvWxhWQ0FZIPZPNTJNpeTT3wyoEC/buWGDy7NpN0PAA==
X-Received: by 2002:a2e:980a:: with SMTP id a10mr7295869ljj.40.1562585287011; 
 Mon, 08 Jul 2019 04:28:07 -0700 (PDT)
Received: from genomnajs.ideon.se ([85.235.10.227])
 by smtp.gmail.com with ESMTPSA id e12sm2696315lfb.66.2019.07.08.04.28.05
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 08 Jul 2019 04:28:06 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Subject: [PATCH] drm/bridge/megachips: Drop GPIO header
Date: Mon,  8 Jul 2019 13:28:03 +0200
Message-Id: <20190708112803.12432-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=C3eU6/QOo2RBrGgE4ia/x9v3UnNvCfi4Y+vpPdAqa9s=;
 b=n3nriMslqMYbtqr3ww7gx+it+JxXIhuRrpHTbFAE0t3SiixYq00G/UCKvGXWRtjInL
 nFii5sTz3IkG9OkwEvmR/7sEjhiNbyEedernWUIc0gxRM5XKbwK9efcUNae9w0w8fV50
 L2CusS68dbIqNnZa/TGT8/18/9tGNnXc0iXDbCF/rBRWUh8KEAfXZ/2hLKU1iP45rYMB
 ZtYEOaN/YE5a0lVu/o91rOeufIg2GZuRGrpxWBtnFogadniAF+YVLPCH6tFbhOfHKnpb
 vYqDk3MF3foAOZIpOLhF0GU/+XD3wLuJoyJ0ONZHKe4z3uNwuEfGnAXnk4EeIvc72XMu
 o/5g==
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBmaWxlIGlzbid0IHVzaW5nIGFueSBpbnRlcmZhY2VzIGZyb20gPGxpbnV4L2dwaW8uaD4g
c28KanVzdCBkcm9wIHRoZSBpbmNsdWRlLgoKU2lnbmVkLW9mZi1ieTogTGludXMgV2FsbGVpaiA8
bGludXMud2FsbGVpakBsaW5hcm8ub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvbWVn
YWNoaXBzLXN0ZHB4eHh4LWdlLWI4NTB2My1mdy5jIHwgMSAtCiAxIGZpbGUgY2hhbmdlZCwgMSBk
ZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvbWVnYWNoaXBz
LXN0ZHB4eHh4LWdlLWI4NTB2My1mdy5jIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9tZWdhY2hp
cHMtc3RkcHh4eHgtZ2UtYjg1MHYzLWZ3LmMKaW5kZXggODIzZGI4MGNiZDE5Li5iNDBjZTQ4NDI0
NGEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvbWVnYWNoaXBzLXN0ZHB4eHh4
LWdlLWI4NTB2My1mdy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvbWVnYWNoaXBzLXN0
ZHB4eHh4LWdlLWI4NTB2My1mdy5jCkBAIC0xOSw3ICsxOSw2IEBACiAgKiAgIEhvc3QgLT4gTFZE
U3wtLShTVERQNDAyOCktLXxEUCAtPiBEUHwtLShTVERQMjY5MCktLXxEUCsrIC0+IFZpZGVvIG91
dHB1dAogICovCiAKLSNpbmNsdWRlIDxsaW51eC9ncGlvLmg+CiAjaW5jbHVkZSA8bGludXgvaTJj
Lmg+CiAjaW5jbHVkZSA8bGludXgvbW9kdWxlLmg+CiAjaW5jbHVkZSA8bGludXgvb2YuaD4KLS0g
CjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
