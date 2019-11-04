Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF4AFEE415
	for <lists+dri-devel@lfdr.de>; Mon,  4 Nov 2019 16:43:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14B4E6E5C3;
	Mon,  4 Nov 2019 15:43:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D5086E5C3
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Nov 2019 15:42:58 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id v8so2499939ljh.5
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Nov 2019 07:42:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hu32T7qcZ0u0JC7oNX5YgTqXI2FkV77lexVaCcOwQZ0=;
 b=VDnsEWX7g1ENUEWDlyDdTAPLt1kO1yROOAzngDjDWPS56eUBl2usKAzJ+VE8OEV/I7
 OvSWVRP9Woen4IU9azOmYcUvIKzaZTcq/Ph3uKqTEJSN4UuZqwU19GTfCxOjk1HHwJOv
 TDi/TITzattab5X7z+aqraQmmJro/z3QHuqhREVzHpa90AVt2pewizUtTQoDFxbFs3kF
 PqAfeDfa2dYXqJ/cCaRyRfZOJCCofz3kFyafHMvLxUlZ8ifKNimeU8/sz65hwyB6wM8z
 YwewFZC6733Po3R6mOHrqU2HaDQtyErE+vkMW/j+MYxKPa9OhxbTpwxcpJn/EMBy7jo4
 vILw==
X-Gm-Message-State: APjAAAVHphvcVycM2Zl/FVtEszhRmeL77KCzJ5jfhEqwmaE4NjwxXVX6
 d7817DZJUHPxwtZfY2Srx017RTh/W9c=
X-Google-Smtp-Source: APXvYqwsbpuHtI/gw3gDdXmDBKT87aWRa+/HI/n2yXyYOC0LkWfSJe77cPX7Gqvw2UOon6R2TKBQWA==
X-Received: by 2002:a2e:87cf:: with SMTP id v15mr198347ljj.79.1572882176481;
 Mon, 04 Nov 2019 07:42:56 -0800 (PST)
Received: from genomnajs.ideon.se ([85.235.10.227])
 by smtp.gmail.com with ESMTPSA id u7sm6059850lfb.80.2019.11.04.07.42.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Nov 2019 07:42:55 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
To: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>
Subject: [PATCH] drm/mcde: Drop double-assignment of mcde
Date: Mon,  4 Nov 2019 16:42:49 +0100
Message-Id: <20191104154249.16887-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hu32T7qcZ0u0JC7oNX5YgTqXI2FkV77lexVaCcOwQZ0=;
 b=BIHcCh6qtVlZ/Ni/TrMcHbpHgUKC/FnYPmq28SSQBmw/3MO/kvzzWfTlyZdjAP3qCw
 B+mo7y+nY6e0KUOogJSm3Epd6mFFfcGUcgdJWGIxYMrrvjFVoj+hazSF37dSMHdjUW84
 KW30pdQLQaqiBFRO/y8NVq7CksblSuC2EScKgPHxTxWdx9HPqp82L5KLuBf5q0C3S+qY
 R/MYyA9u8+aF+6Fs7RiR2Kq2S/glLpfcyzUmEZhblIiDPk4v/7uA0ZiyLuBElt+NqpIv
 oriFqfuXhZI0g05tkVTWLjZDUCvfpxL9cpN/rXXr4VdVa2Iw1hMeSl7y5XbhFCMCTFHt
 z86A==
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
Cc: Markus Elfring <Markus.Elfring@web.de>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SXQncyBlbm91Z2ggdG8gYXNzaWduIHRoZSBtZW1iZXIgb25jZS4KCkNjOiBNYXJrdXMgRWxmcmlu
ZyA8TWFya3VzLkVsZnJpbmdAd2ViLmRlPgpSZXBvcnRlZC1ieTogTWFya3VzIEVsZnJpbmcgPE1h
cmt1cy5FbGZyaW5nQHdlYi5kZT4KU2lnbmVkLW9mZi1ieTogTGludXMgV2FsbGVpaiA8bGludXMu
d2FsbGVpakBsaW5hcm8ub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9tY2RlL21jZGVfZHJ2LmMg
fCAxIC0KIDEgZmlsZSBjaGFuZ2VkLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL21jZGUvbWNkZV9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9tY2RlL21jZGVfZHJ2
LmMKaW5kZXggOWEwOWViYTUzMTgyLi4zMWFiM2MxMzZlMmQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9tY2RlL21jZGVfZHJ2LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL21jZGUvbWNkZV9k
cnYuYwpAQCAtMzQzLDcgKzM0Myw2IEBAIHN0YXRpYyBpbnQgbWNkZV9wcm9iZShzdHJ1Y3QgcGxh
dGZvcm1fZGV2aWNlICpwZGV2KQogCW1jZGUtPnRlX3N5bmMgPSB0cnVlOwogCS8qIEVuYWJsZSBj
b250aW51b3VzIHVwZGF0ZXM6IHRoaXMgaXMgd2hhdCBMaW51eCcgZnJhbWVidWZmZXIgZXhwZWN0
cyAqLwogCW1jZGUtPm9uZXNob3RfbW9kZSA9IGZhbHNlOwotCWRybS0+ZGV2X3ByaXZhdGUgPSBt
Y2RlOwogCiAJLyogRmlyc3Qgb2J0YWluIGFuZCB0dXJuIG9uIHRoZSBtYWluIHBvd2VyICovCiAJ
bWNkZS0+ZXBvZCA9IGRldm1fcmVndWxhdG9yX2dldChkZXYsICJlcG9kIik7Ci0tIAoyLjIxLjAK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
