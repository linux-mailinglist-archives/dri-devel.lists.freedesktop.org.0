Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D363073039
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2019 15:50:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B67C589F9F;
	Wed, 24 Jul 2019 13:50:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C1986E4F5
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 13:50:09 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id i21so44604548ljj.3
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 06:50:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GxqeVRAu8+l8yYzPd+gthwrK7cvPO4f9RTksijZqcJM=;
 b=R25jLafYdnEHbjl+p/383zb9gRn5N5lnb702LnhuNz2HswXasCvARPkZKMGyW7eEJc
 Mc1epMavoJfCg0m74sYcX3cGzjwd3R5UIHW1M1KZuqqfJoZEDgskT/721Nh2L0LzqFAr
 JN662y6KNgxXMvfo64Qx9H/my720XWyB7+47n054pNo3StxFHXqfCzueBBCt+vTNObES
 tP6/bdqBH4XpjMSHpAvvO7XFzH3cZou9oQxgIMTWrWov20wNqsDQPVpGYrcGiKDtCvhe
 LIY9Bs7vgbvOVUUUOrvokOlDtLjGueG08AwNYeeULt2z5UYVXTwsCaDsB2Mn8r5xVsmd
 W2nw==
X-Gm-Message-State: APjAAAX/ByXQQXFBgg4zqUr1zsUGt/WWTkSpDD0iieNTyt4tlBIYNJMV
 5l/WNDjPaiQGJtUXgrCKNCALA/cP2+M=
X-Google-Smtp-Source: APXvYqxzSdpNJ5lm69QpIMQiYQwP+Ttd8WTQhr71TgFYZTiSnOeiyQuQys/rPXrnmuRfo4P1uwlcBQ==
X-Received: by 2002:a2e:9857:: with SMTP id e23mr42374872ljj.217.1563976207815; 
 Wed, 24 Jul 2019 06:50:07 -0700 (PDT)
Received: from genomnajs.ideon.se ([85.235.10.227])
 by smtp.gmail.com with ESMTPSA id v4sm8586483lji.103.2019.07.24.06.50.06
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 24 Jul 2019 06:50:06 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>
Subject: [PATCH 1/2] drm/pl111: Deprecate the pads from the DT binding
Date: Wed, 24 Jul 2019 15:49:58 +0200
Message-Id: <20190724134959.2365-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GxqeVRAu8+l8yYzPd+gthwrK7cvPO4f9RTksijZqcJM=;
 b=d1/AnXTfzDzVuH3U4c14o6CjsffFRHEIXFK61k8yjmHBtjYsRXCI8J21a3mMiuOZI4
 cqi9X+qktXY7k6uIkJWNTyUqlmX1j5ZE8he8iSQf00NnLzNPDU0YEupQRP3GzB5UH8Bc
 lRzT5SOlICV5aBQRhmR2ENhfOy5p31b14kq9Mi+uUQjM6t+9ODltdwGlXUa2gtRdc9Vs
 8MpubM4sI5gEz3UrdBNEE0K4ArMbranHmxtrcC9qf4fzsvdI8cNhTit/Plb7VmgS7uQg
 3URQ/Yd84UBvEDZhPbwywE7NiULvU6bqY+oLkzJMY4phkWqhRrdlhHBhcxMu9Sm+APVO
 r/rQ==
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
Cc: devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>,
 Liviu Dudau <Liviu.Dudau@arm.com>, Sam Ravnborg <sam@ravnborg.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIHBhZHMgd2VyZSBhbiBlYXJsaWVyIHdvcmthcm91bmQgZm9yIHRoZSBpbnRlcm5hbCBpbWFn
ZQpwaXBlbGluZSBpbiB0aGUgTGludXggZmJkZXYgc3Vic3lzdGVtLiBBcyB3ZSBtb3ZlIHRvIGdl
bmVyaWMKZGVmaW5pdGlvbiBvZiBkaXNwbGF5IHByb3BlcnRpZXMgYW5kIGRyaXZlcnMgdGhhdCBu
byBsb25nZXIKbmVlZCB0aGlzIHRvIHdvcmssIGRlcHJlY2F0ZSB0aGlzIHByb3BlcnR5LgoKQ2M6
IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KQ2M6IFBhd2VsIE1vbGwgPHBhd2VsLm1v
bGxAYXJtLmNvbT4KQ2M6IExpdml1IER1ZGF1IDxMaXZpdS5EdWRhdUBhcm0uY29tPgpDYzogZGV2
aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmcKU2lnbmVkLW9mZi1ieTogTGludXMgV2FsbGVpaiA8bGlu
dXMud2FsbGVpakBsaW5hcm8ub3JnPgotLS0KIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9kaXNwbGF5L2FybSxwbDExeC50eHQgfCA5ICsrKysrLS0tLQogMSBmaWxlIGNoYW5nZWQs
IDUgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9hcm0scGwxMXgudHh0IGIvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYXJtLHBsMTF4LnR4dAppbmRleCA1NzJm
YTI3NzNlYzQuLjNmOTc3ZTcyYTIwMCAxMDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYXJtLHBsMTF4LnR4dAorKysgYi9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9hcm0scGwxMXgudHh0CkBAIC0zOSw5ICszOSwxMSBA
QCBSZXF1aXJlZCBzdWItbm9kZXM6CiAKIC0gcG9ydDogZGVzY3JpYmVzIExDRCBwYW5lbCBzaWdu
YWxzLCBmb2xsb3dpbmcgdGhlIGNvbW1vbiBiaW5kaW5nCiAJZm9yIHZpZGVvIHRyYW5zbWl0dGVy
IGludGVyZmFjZXM7IHNlZQotCURvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRp
YS92aWRlby1pbnRlcmZhY2VzLnR4dDsKLQl3aGVuIGl0IGlzIGEgVEZUIHBhbmVsLCB0aGUgcG9y
dCdzIGVuZHBvaW50IG11c3QgZGVmaW5lIHRoZQotCWZvbGxvd2luZyBwcm9wZXJ0eToKKwlEb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVkaWEvdmlkZW8taW50ZXJmYWNlcy50eHQK
KworRGVwcmVjYXRlZCBwcm9wZXJ0aWVzOgorCVRoZSBwb3J0J3MgZW5kYnBvaW50IHN1Ym5vZGUg
aGFkIHRoaXMsIG5vdyBkZXByZWNhdGVkIHByb3BlcnR5CisJaW4gdGhlIHBhc3QuIERyaXZlcnMg
c2hvdWxkIGJlIGFibGUgdG8gc3Vydml2ZSB3aXRob3V0IGl0OgogCiAJLSBhcm0scGwxMXgsdGZ0
LXIwZzBiMC1wYWRzOiBhbiBhcnJheSBvZiB0aHJlZSAzMi1iaXQgdmFsdWVzLAogCQlkZWZpbmlu
ZyB0aGUgd2F5IENMRCBwYWRzIGFyZSB3aXJlZCB1cDsgZmlyc3QgdmFsdWUKQEAgLTgwLDcgKzgy
LDYgQEAgRXhhbXBsZToKIAkJcG9ydCB7CiAJCQljbGNkX3BhZHM6IGVuZHBvaW50IHsKIAkJCQly
ZW1vdGUtZW5kcG9pbnQgPSA8JmNsY2RfcGFuZWw+OwotCQkJCWFybSxwbDExeCx0ZnQtcjBnMGIw
LXBhZHMgPSA8MCA4IDE2PjsKIAkJCX07CiAJCX07CiAKLS0gCjIuMjEuMAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
