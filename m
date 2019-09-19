Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E65A5B8BE3
	for <lists+dri-devel@lfdr.de>; Fri, 20 Sep 2019 09:52:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D361F6F57D;
	Fri, 20 Sep 2019 07:51:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B5B36F860
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Sep 2019 14:06:30 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id x80so2478461lff.3
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Sep 2019 07:06:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9jGZhci6ir2QQxaMaZ4RPKwsW6VmlML93zQ3UVVvLVc=;
 b=enR4uG1Zxs+cynCXgOuGKym1QTMk4AHlC31AZSgR+8CYmBmhdYjtca1wjvdpsyrhbK
 Drg4NXxWa2JuZyHcSt2w7t1s/kriI4MMNldvuCgLDj/f8qZL/I7Z0pZTZlRquHt+nM/y
 3l8wa+k7H4pIc5kWUZ5TXavi+HJ+QLd2eeoxdDvAiTyPcLMh8KPNIu0pB/YIwGDa/yut
 nXtIJd2J77XqxzqUHnrPDqdXTVgwRdxnqERINjvCIkVohdDKHliI8znk6wCqbUZIlDet
 tcJwaH+uMibzeKaD2X7zi+l7RZsp8g7sqpMN9rOvRRXBEuz36GThi4CC7QLI9Hphy+kq
 HbHg==
X-Gm-Message-State: APjAAAVKn7BNbNa7EkXrnxINd9kJxXOm1d3xH5AtkSi+F0ZsUqmfutWz
 SSeqzXwNSoOWkPDfPFJgvRw61A==
X-Google-Smtp-Source: APXvYqx94tejJIy0k7sD7BxbdRz2nLUSrH5aFo9cmoMdLo9lK0ILNVQtax9BnK0daUvVanbqCyRpiw==
X-Received: by 2002:ac2:51a7:: with SMTP id f7mr5064133lfk.119.1568901989001; 
 Thu, 19 Sep 2019 07:06:29 -0700 (PDT)
Received: from prevas-ravi.prevas.se ([81.216.59.226])
 by smtp.gmail.com with ESMTPSA id h3sm1687886ljf.12.2019.09.19.07.06.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Sep 2019 07:06:28 -0700 (PDT)
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
To: Thierry Reding <thierry.reding@gmail.com>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH 1/5] backlight: pwm_bl: fix cie1913 comments and constant
Date: Thu, 19 Sep 2019 16:06:16 +0200
Message-Id: <20190919140620.32407-1-linux@rasmusvillemoes.dk>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 20 Sep 2019 07:51:40 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rasmusvillemoes.dk; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9jGZhci6ir2QQxaMaZ4RPKwsW6VmlML93zQ3UVVvLVc=;
 b=OCn3gIYj+wUYxAtXas8eOyf4fSEWhP2JZywuNcvWhoXd2re/NpOYXHVgx+ktYyP5cV
 f+T9+6Yleq+jPzmdljsDSTYYkv0hRJ4OXI6VngwNHBQhZ+MPKG8XvWun3Tnm4NO4agx6
 jyhuQWbNOO26WlFgyizU4iA2+osQUAPnhKYiE=
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
Cc: linux-pwm@vger.kernel.org, linux-fbdev@vger.kernel.org,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlICJicmVhay1ldmVuIiBwb2ludCBmb3IgdGhlIHR3byBmb3JtdWxhcyBpcyBMPT04LCB3aGlj
aCBpcyBhbHNvCndoYXQgdGhlIGNvZGUgYWN0dWFsbHkgaW1wbGVtZW50cy4gW0luY2lkZW50YWxs
eSwgYXQgdGhhdCBwb2ludCBvbmUKaGFzIFk9MC4wMDg4NTYsIG5vdCAwLjA4ODU2XS4KCk1vcmVv
dmVyLCBhbGwgdGhlIHNvdXJjZXMgSSBjYW4gZmluZCBzYXkgdGhlIGxpbmVhciBmYWN0b3IgaXMg
OTAzLjMKcmF0aGVyIHRoYW4gOTAyLjMsIHdoaWNoIG1ha2VzIHNlbnNlIHNpbmNlIHRoZW4gdGhl
IGZvcm11bGFzIGFncmVlIGF0Ckw9PTgsIGJvdGggeWllbGRpbmcgdGhlIDAuMDA4ODU2IGZpZ3Vy
ZSB0byBmb3VyIHNpZ25pZmljYW50IGRpZ2l0cy4KClNpZ25lZC1vZmYtYnk6IFJhc211cyBWaWxs
ZW1vZXMgPGxpbnV4QHJhc211c3ZpbGxlbW9lcy5kaz4KLS0tCiBkcml2ZXJzL3ZpZGVvL2JhY2ts
aWdodC9wd21fYmwuYyB8IDEyICsrKysrKysrKy0tLQogMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0
aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpZGVvL2JhY2ts
aWdodC9wd21fYmwuYyBiL2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L3B3bV9ibC5jCmluZGV4IDIy
MDFiOGM3ODY0MS4uYmUzNmJlMWNhY2I3IDEwMDY0NAotLS0gYS9kcml2ZXJzL3ZpZGVvL2JhY2ts
aWdodC9wd21fYmwuYworKysgYi9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9wd21fYmwuYwpAQCAt
MTU1LDggKzE1NSw4IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgYmFja2xpZ2h0X29wcyBwd21fYmFj
a2xpZ2h0X29wcyA9IHsKICAqCiAgKiBUaGUgQ0lFIDE5MzEgbGlnaHRuZXNzIGZvcm11bGEgaXMg
d2hhdCBhY3R1YWxseSBkZXNjcmliZXMgaG93IHdlIHBlcmNlaXZlCiAgKiBsaWdodDoKLSAqICAg
ICAgICAgIFkgPSAoTCogLyA5MDIuMykgICAgICAgICAgIGlmIEwqIOKJpCAwLjA4ODU2Ci0gKiAg
ICAgICAgICBZID0gKChMKiArIDE2KSAvIDExNileMyAgICBpZiBMKiA+IDAuMDg4NTYKKyAqICAg
ICAgICAgIFkgPSAoTCogLyA5MDMuMykgICAgICAgICAgIGlmIEwqIOKJpCA4CisgKiAgICAgICAg
ICBZID0gKChMKiArIDE2KSAvIDExNileMyAgICBpZiBMKiA+IDgKICAqCiAgKiBXaGVyZSBZIGlz
IHRoZSBsdW1pbmFuY2UsIHRoZSBhbW91bnQgb2YgbGlnaHQgY29taW5nIG91dCBvZiB0aGUgc2Ny
ZWVuLCBhbmQKICAqIGlzIGEgbnVtYmVyIGJldHdlZW4gMC4wIGFuZCAxLjA7IGFuZCBMKiBpcyB0
aGUgbGlnaHRuZXNzLCBob3cgYnJpZ2h0IGEgaHVtYW4KQEAgLTE2OSw5ICsxNjksMTUgQEAgc3Rh
dGljIHU2NCBjaWUxOTMxKHVuc2lnbmVkIGludCBsaWdodG5lc3MsIHVuc2lnbmVkIGludCBzY2Fs
ZSkKIHsKIAl1NjQgcmV0dmFsOwogCisJLyoKKwkgKiBAbGlnaHRuZXNzIGlzIGdpdmVuIGFzIGEg
bnVtYmVyIGJldHdlZW4gMCBhbmQgMSwgZXhwcmVzc2VkCisJICogYXMgYSBmaXhlZC1wb2ludCBu
dW1iZXIgaW4gc2NhbGUgQHNjYWxlLiBDb252ZXJ0IHRvIGEKKwkgKiBwZXJjZW50YWdlLCBzdGls
bCBleHByZXNzZWQgYXMgYSBmaXhlZC1wb2ludCBudW1iZXIsIHNvIHRoZQorCSAqIGFib3ZlIGZv
cm11bGFzIGNhbiBiZSBhcHBsaWVkLgorCSAqLwogCWxpZ2h0bmVzcyAqPSAxMDA7CiAJaWYgKGxp
Z2h0bmVzcyA8PSAoOCAqIHNjYWxlKSkgewotCQlyZXR2YWwgPSBESVZfUk9VTkRfQ0xPU0VTVF9V
TEwobGlnaHRuZXNzICogMTAsIDkwMjMpOworCQlyZXR2YWwgPSBESVZfUk9VTkRfQ0xPU0VTVF9V
TEwobGlnaHRuZXNzICogMTAsIDkwMzMpOwogCX0gZWxzZSB7CiAJCXJldHZhbCA9IGludF9wb3co
KGxpZ2h0bmVzcyArICgxNiAqIHNjYWxlKSkgLyAxMTYsIDMpOwogCQlyZXR2YWwgPSBESVZfUk9V
TkRfQ0xPU0VTVF9VTEwocmV0dmFsLCAoc2NhbGUgKiBzY2FsZSkpOwotLSAKMi4yMC4xCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
