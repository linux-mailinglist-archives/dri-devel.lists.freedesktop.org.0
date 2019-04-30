Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25DAFF324
	for <lists+dri-devel@lfdr.de>; Tue, 30 Apr 2019 11:37:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E86F788FA4;
	Tue, 30 Apr 2019 09:37:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12B1488FA4
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Apr 2019 09:37:53 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id k8so12114283lja.8
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Apr 2019 02:37:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ug09hZ4eYYnkShE0Xn5KTs+gkypuHyMBpZHpCmxzczc=;
 b=QDR+iDmIjmMlT551p233MX9+aovkUW1I4VhfLGRoZCOo+Zks7o7YyY6T8WTAvbBlZM
 TCSROY8jHSY7rEgqPYT7pbcQWZCdNtr287iKtRqo/dV/Q4t4J4QvJlz2FwA+ACwtlTWv
 iE2HzUfzWO84dEa9Ncf07NyNNUs7AD2NMbSm4vIctivX3XpCBln22E0WEzqbctfR/ZAu
 RDiNwZxgqxFXZe/X1QZDT7KTns+Tnxqj2lF3UtsxdFUMFv9IuZn+fDNcY0iBgTGD1hHl
 FKq03c4KYQiS99ystlcjOfd/nzuLdzPsL5o94akcZIA7Xaap79UU92RNlypylvs3P9AB
 pzHQ==
X-Gm-Message-State: APjAAAU+n3SKu8EAL0+m5l3fWyUnc7lfXV9oaadJoN+RtWtHiIha2TyO
 M0MyeuuGnUFit1VWhrTlchSuJ/RtIAk=
X-Google-Smtp-Source: APXvYqx7jqIeE5ASFCMSvu20xJCQn/59cK4BmlyEGTK2jomO2LkXrwTMl7CvRVqYoq83iUMRO6FJvA==
X-Received: by 2002:a2e:9c0a:: with SMTP id s10mr18458421lji.162.1556617071239; 
 Tue, 30 Apr 2019 02:37:51 -0700 (PDT)
Received: from genomnajs.ideon.se ([85.235.10.227])
 by smtp.gmail.com with ESMTPSA id y23sm7677210lfy.31.2019.04.30.02.37.49
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 30 Apr 2019 02:37:50 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH] drm/atomic-helper: Bump vblank timeout to 100 ms
Date: Tue, 30 Apr 2019 11:37:46 +0200
Message-Id: <20190430093746.26485-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ug09hZ4eYYnkShE0Xn5KTs+gkypuHyMBpZHpCmxzczc=;
 b=yvCyASVrVDX4wNmvcOAJniMdPJ1vM118ZLkqRahj7vNECWCt2q1aRNYxxF8pdBIIMI
 kEI9V5nPuTjHt+sRSzqAYNV2k390/ON8PSgkQZWDlvVbwT1Jv0R6zJ15Pdj2x3mmwB/0
 LBBaPfLuJ/PFNYa/JLaPR2+H3ml7HJfdw67nXXuXnDpAL6v9x4rhuPFMpLut+H2FsAMd
 OSagQT4ZpyG02Lk+x3m9xqIUl0lHXCLXy3K651sHfsbfPtLswUuRqaOQmPSXS22M8pH1
 3bPggsmMv0Ya0b/Kz114X1AR792OeqignQHcNwb5WXT25P0swE11fl2spDBYoVCK2J/J
 ZC/A==
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
Cc: Sean Paul <seanpaul@chromium.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIDUwIG1zIGRlZmF1bHQgdGltZW91dCB3YWl0aW5nIGZvciB2YmxhbmtzIGlzIHRvbyBzbWFs
bApmb3IgdGhlIGZpcnN0IHZibGFuayBmcm9tIHRoZSBTVC1Fcmljc3NvbiBNQ0RFIGRpc3BsYXkK
Y29udHJvbGxlciBvdmVyIERTSS4gUHJlc3VtYWJseSB0aGlzIGlzIGJlY2F1c2UgdGhlIERTSQpk
aXNwbGF5IGlzIGNvbW1hbmQtbW9kZSBvbmx5IGFuZCB0aGUgc3RhdGUgbWFjaGluZSB3aWxsCnRh
a2Ugc29tZSB0aW1lIHNldHRpbmcgdXAgaXRzIHN0YXRlIGZvciB0aGUgZmlyc3QgZGlzcGxheQp1
cGRhdGUsIGFuZCB3ZSBoaXQgYSB0aW1lb3V0LiAxMDAgbXMgbWFrZXMgaXQgcGFzcyB3aXRob3V0
CnByb2JsZW1zLgoKU2lnbmVkLW9mZi1ieTogTGludXMgV2FsbGVpaiA8bGludXMud2FsbGVpakBs
aW5hcm8ub3JnPgotLS0KQWZ0ZXIgYSBxdWl0ZSBwcm9sb25nZWQgaHVudGluZyBmb3IgdGhlIGNh
dXNlIG9mIG1pc3NlZAp2YmxhbmtzIGluIHRoZSBNQ0RFIGRyaXZlciBJIGZpbmFsbHkgcmVhbGl6
ZWQgaXQgdGltZWQKb3V0IGJlY2F1c2UgaXQgd2FzIHNpbXBseSB0YWtpbmcgc29tZSB0aW1lIG9u
IHRoZSBmaXJzdAp2YmxhbmsuIDUwIG1zIG1ha2VzIHNlbnNlIG9uIDYwSHogbW9uaXRvcnMgZm9y
IHN1cmUsCmJ1dCBhbiBlbWJlZGRlZCBEU0kgc3RhdGUgbWFjaGluZSBjYW4gYmUgc2xvdywgYXMg
aXQKdHVybnMgb3V0LgoKVGVsbCBtZSBpZiB0aGlzIHNob3VsZCBiZSBhIHBlci1kcml2ZXIgdmFy
aWFibGUgYW5kIEkKd2lsbCB0aGluayBvZiBzb21ldGhpbmcuCi0tLQogZHJpdmVycy9ncHUvZHJt
L2RybV9hdG9taWNfaGVscGVyLmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2F0b21p
Y19oZWxwZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fYXRvbWljX2hlbHBlci5jCmluZGV4IDQw
YWMxOTg0ODAzNC4uZjBhYTdiMTk1ZDc5IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJt
X2F0b21pY19oZWxwZXIuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2F0b21pY19oZWxwZXIu
YwpAQCAtMTQyNCw3ICsxNDI0LDcgQEAgZHJtX2F0b21pY19oZWxwZXJfd2FpdF9mb3JfdmJsYW5r
cyhzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LAogCQlyZXQgPSB3YWl0X2V2ZW50X3RpbWVvdXQoZGV2
LT52YmxhbmtbaV0ucXVldWUsCiAJCQkJb2xkX3N0YXRlLT5jcnRjc1tpXS5sYXN0X3ZibGFua19j
b3VudCAhPQogCQkJCQlkcm1fY3J0Y192YmxhbmtfY291bnQoY3J0YyksCi0JCQkJbXNlY3NfdG9f
amlmZmllcyg1MCkpOworCQkJCW1zZWNzX3RvX2ppZmZpZXMoMTAwKSk7CiAKIAkJV0FSTighcmV0
LCAiW0NSVEM6JWQ6JXNdIHZibGFuayB3YWl0IHRpbWVkIG91dFxuIiwKIAkJICAgICBjcnRjLT5i
YXNlLmlkLCBjcnRjLT5uYW1lKTsKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
