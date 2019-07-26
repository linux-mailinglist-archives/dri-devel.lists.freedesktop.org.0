Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD63078616
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jul 2019 09:17:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D5FB89C94;
	Mon, 29 Jul 2019 07:17:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23AF46ED24
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jul 2019 11:27:57 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id q26so36876818lfc.3
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jul 2019 04:27:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mhZxThgFyoxuQkXVr0Rs3Bv05HhD+nUqY4oSH8BKepE=;
 b=jAbfQ4BXad0q1yqYe55AlSLcu4RV8cXXcKf+j/yClSZI+8DMT3cMgdvObOop1EhqFm
 dZqHb9OywXGmNrWhT2+hHca1J2ESSf5YOOSKMHuU7V0sYWrMr0PXWR90+Qy3l4NT01br
 gfoWX1xOZ4Ahs8yJH/YYg+Jo5bWjZXqnb2rItGM0h6zCIP4Zhw12Zdgp62bcwjCoVy+I
 +HGozJeQcmx4WAn6Pc8B9kNmVWcJhqG1sLClLwd3cRsBFTXucSiPIZyI49+TOo8qHiTD
 Ek84AAPez+DSVL6ydQr/XmaTryZNSW+t3Laut58TwLIf9YrSmPtdEX35l9LKhbJCO91h
 aouw==
X-Gm-Message-State: APjAAAUBGMPVuYAK5B5nkgWJdida5Lj0hhBag52bmr1Vi+UUldZRUOJT
 PsSMNRSF+gJZx1P2AM6hUTF/tg==
X-Google-Smtp-Source: APXvYqyUL/trU35EgUR58ovhkkJ/F73GXNx/u2z2iCw1i1bxrDMO/Qc0sIF8m7Dt5hEE57P5lKxzGg==
X-Received: by 2002:a19:6557:: with SMTP id c23mr2265309lfj.12.1564140475478; 
 Fri, 26 Jul 2019 04:27:55 -0700 (PDT)
Received: from localhost (c-243c70d5.07-21-73746f28.bbcust.telenor.se.
 [213.112.60.36])
 by smtp.gmail.com with ESMTPSA id l22sm9911343ljc.4.2019.07.26.04.27.54
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 26 Jul 2019 04:27:54 -0700 (PDT)
From: Anders Roxell <anders.roxell@linaro.org>
To: robdclark@gmail.com, sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH 2/3] drm: msm: a5xx: Mark expected switch fall-through
Date: Fri, 26 Jul 2019 13:27:51 +0200
Message-Id: <20190726112751.19461-1-anders.roxell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 29 Jul 2019 07:16:44 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mhZxThgFyoxuQkXVr0Rs3Bv05HhD+nUqY4oSH8BKepE=;
 b=SjTC7eCVIgTYtXnx7wObMb0ka5YstKwcZt/k/di80kRHdujbyS/FGyHfIdL0+e5y5E
 lqNmDrIWjd3F9+9qNIu4+G/nKrBArgVH4eRkpSgNjIXUQQL7OqX6HUs2x1Ml+I+sZnno
 pX9ipCGgGEy+PzZxblaZr+5iGjAtNujUqzId+cjtqMooZh4FFYyb3Mqp8+wyp89GbEc8
 S/X/V6xNLx+1QVsSv3+xGI8bHqkzYa+wYLHyJNbhHBQ8AwbrpN4BRpYeHEoZPCiCftxX
 vPR8yGPV9CnGyRSDMW7ctHuhGVRHFFfSE8q8D8pC8txmN0jZ2KdSIq5gvMjpAZvoSEQE
 FuIA==
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
cm0vbXNtL2FkcmVuby9hNXh4X2dwdS5jOiBJbiBmdW5jdGlvbiDigJhhNXh4X3N1Ym1pdOKAmToK
Li4vZHJpdmVycy9ncHUvZHJtL21zbS9hZHJlbm8vYTV4eF9ncHUuYzoxNTA6Nzogd2FybmluZzog
dGhpcyBzdGF0ZW1lbnQgbWF5IGZhbGwKIHRocm91Z2ggWy1XaW1wbGljaXQtZmFsbHRocm91Z2g9
XQogICAgaWYgKHByaXYtPmxhc3RjdHggPT0gY3R4KQogICAgICAgXgouLi9kcml2ZXJzL2dwdS9k
cm0vbXNtL2FkcmVuby9hNXh4X2dwdS5jOjE1MjozOiBub3RlOiBoZXJlCiAgIGNhc2UgTVNNX1NV
Qk1JVF9DTURfQlVGOgogICBefn5+CgpSZXdvcmsgc28gdGhhdCB0aGUgY29tcGlsZXIgZG9lc24n
dCB3YXJuIGFib3V0IGZhbGwtdGhyb3VnaC4KCkZpeGVzOiBkOTM1MTJlZjBmMGUgKCJNYWtlZmls
ZTogR2xvYmFsbHkgZW5hYmxlIGZhbGwtdGhyb3VnaCB3YXJuaW5nIikKU2lnbmVkLW9mZi1ieTog
QW5kZXJzIFJveGVsbCA8YW5kZXJzLnJveGVsbEBsaW5hcm8ub3JnPgotLS0KIGRyaXZlcnMvZ3B1
L2RybS9tc20vYWRyZW5vL2E1eHhfZ3B1LmMgfCAyICsrCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNl
cnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21zbS9hZHJlbm8vYTV4eF9n
cHUuYyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vYWRyZW5vL2E1eHhfZ3B1LmMKaW5kZXggMTY3MWRi
NDdhYTU3Li43MTM5N2VkM2M5OWYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tc20vYWRy
ZW5vL2E1eHhfZ3B1LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL21zbS9hZHJlbm8vYTV4eF9ncHUu
YwpAQCAtNTksNiArNTksNyBAQCBzdGF0aWMgdm9pZCBhNXh4X3N1Ym1pdF9pbl9yYihzdHJ1Y3Qg
bXNtX2dwdSAqZ3B1LCBzdHJ1Y3QgbXNtX2dlbV9zdWJtaXQgKnN1Ym1pdAogCQljYXNlIE1TTV9T
VUJNSVRfQ01EX0NUWF9SRVNUT1JFX0JVRjoKIAkJCWlmIChwcml2LT5sYXN0Y3R4ID09IGN0eCkK
IAkJCQlicmVhazsKKwkJCS8qIEZhbGwgdGhyb3VnaCAqLwogCQljYXNlIE1TTV9TVUJNSVRfQ01E
X0JVRjoKIAkJCS8qIGNvcHkgY29tbWFuZHMgaW50byBSQjogKi8KIAkJCW9iaiA9IHN1Ym1pdC0+
Ym9zW3N1Ym1pdC0+Y21kW2ldLmlkeF0ub2JqOwpAQCAtMTQ5LDYgKzE1MCw3IEBAIHN0YXRpYyB2
b2lkIGE1eHhfc3VibWl0KHN0cnVjdCBtc21fZ3B1ICpncHUsIHN0cnVjdCBtc21fZ2VtX3N1Ym1p
dCAqc3VibWl0LAogCQljYXNlIE1TTV9TVUJNSVRfQ01EX0NUWF9SRVNUT1JFX0JVRjoKIAkJCWlm
IChwcml2LT5sYXN0Y3R4ID09IGN0eCkKIAkJCQlicmVhazsKKwkJCS8qIEZhbGwgdGhyb3VnaCAq
LwogCQljYXNlIE1TTV9TVUJNSVRfQ01EX0JVRjoKIAkJCU9VVF9QS1Q3KHJpbmcsIENQX0lORElS
RUNUX0JVRkZFUl9QRkUsIDMpOwogCQkJT1VUX1JJTkcocmluZywgbG93ZXJfMzJfYml0cyhzdWJt
aXQtPmNtZFtpXS5pb3ZhKSk7Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
