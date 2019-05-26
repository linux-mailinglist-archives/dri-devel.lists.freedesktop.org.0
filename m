Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54E3A2AB73
	for <lists+dri-devel@lfdr.de>; Sun, 26 May 2019 19:36:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D77D8982C;
	Sun, 26 May 2019 17:36:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEA9089708;
 Sun, 26 May 2019 17:35:51 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id m15so12667623ljg.13;
 Sun, 26 May 2019 10:35:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=quXBsXarHy8sh7eI4VnnOVkloyrYcJZ6jVyc4yKf6z0=;
 b=K6w9Kk5y+iyoDkM16u1VGIK87PRRFFdFf6YaKLv/LeTgKsQRmgYwzse2JaxQ+ciuzW
 r7eUiRkLWEXymJyn4xP+HWtcOXZ8RM/fHvazgbgOIi5BJl/ia94sxy2CDxDMGrk8d/wp
 nzYtoiydzZAJsYGzRpW5CSkGZIfU4IJJaikJp4fOMSivTGT2CtjCg3tBek4bncYeIEbV
 qvGTQrJxq2GgmO2KHut3BbLXz4UHywxlGk0xiV0RAgOh3LHhDG6N9lbUi0WZ8soJwHiQ
 /bW2l33nGLb7ZKwH5SSU/AMdyoF8Df6CfdFCmGieJZlOi+Y5WLw472s4uLn6egqu3Qwl
 NoiQ==
X-Gm-Message-State: APjAAAWBtkQ0k47hUZDi+J2w66NXtGN7qYF2NTguBthyK6kVHyHGlkZA
 AuIkGTEl9JiDEygb4FxNBFqozg71
X-Google-Smtp-Source: APXvYqwb4jejuA5EnOsMj/KAIYKHJqDiPWF5/nhwEWIsYOYT9HBVHYluWn8kMQMrCi6lhb5g74TSoQ==
X-Received: by 2002:a2e:5d9c:: with SMTP id v28mr15083401lje.32.1558892149702; 
 Sun, 26 May 2019 10:35:49 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 n9sm1774489ljj.10.2019.05.26.10.35.48
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 26 May 2019 10:35:49 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 6/7] drm: make drm_trace.h self-contained
Date: Sun, 26 May 2019 19:35:34 +0200
Message-Id: <20190526173535.32701-7-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190526173535.32701-1-sam@ravnborg.org>
References: <20190526173535.32701-1-sam@ravnborg.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=quXBsXarHy8sh7eI4VnnOVkloyrYcJZ6jVyc4yKf6z0=;
 b=EmfsGuEctQSTvWWZhvIanPUqt8kBFKZqV6aWHVdoJ25zxgLPGBu2YrZOmBUVdXFljC
 aFTcSslGKSwim/oSpThxzx3MWtUaZHTuQuATjk9l3F1AaX07LnltAexjD7NL0mrdDVa1
 NBbjHWQ73mB7wX3hPoR3489HmnnRK/4mlxuY1OHiQZHnpnSv5Aw9VNKWyyEaL8kdcTUS
 8pmSgqa5RlD/z3Mglxqr79cFRk5LD3EZw+XXs+6uo+UunluXhqJGiVD2wn593D0aXtM7
 W5VqLSLg3kRwN2lT/RDIUcy+X/9VQgJmDmR3w04q8YWQN9DiAE0zhpZVOmwE61YEmn+t
 YcGQ==
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, Sam Ravnborg <sam@ravnborg.org>,
 intel-gfx@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RG8gbm90IHJlcXVpcmUgdXNlcnMgb2YgZHJtX3RyYWNlLmggdG8gaW5jbHVkZSBvdGhlcgpmaWxl
cyBqdXN0IHRvIGxldCBpdCBidWlsZAoKU2lnbmVkLW9mZi1ieTogU2FtIFJhdm5ib3JnIDxzYW1A
cmF2bmJvcmcub3JnPgpDYzogTWFhcnRlbiBMYW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hvcnN0QGxp
bnV4LmludGVsLmNvbT4KQ2M6IE1heGltZSBSaXBhcmQgPG1heGltZS5yaXBhcmRAYm9vdGxpbi5j
b20+CkNjOiBTZWFuIFBhdWwgPHNlYW5AcG9vcmx5LnJ1bj4KQ2M6IERhdmlkIEFpcmxpZSA8YWly
bGllZEBsaW51eC5pZT4KQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KLS0tCiBk
cml2ZXJzL2dwdS9kcm0vZHJtX3RyYWNlLmggfCAyICsrCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNl
cnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV90cmFjZS5oIGIvZHJp
dmVycy9ncHUvZHJtL2RybV90cmFjZS5oCmluZGV4IGJhY2NjNjNkYjEwNi4uNDcxZWI5Mjc0NzRi
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX3RyYWNlLmgKKysrIGIvZHJpdmVycy9n
cHUvZHJtL2RybV90cmFjZS5oCkBAIC02LDYgKzYsOCBAQAogI2luY2x1ZGUgPGxpbnV4L3R5cGVz
Lmg+CiAjaW5jbHVkZSA8bGludXgvdHJhY2Vwb2ludC5oPgogCitzdHJ1Y3QgZHJtX2ZpbGU7CisK
ICN1bmRlZiBUUkFDRV9TWVNURU0KICNkZWZpbmUgVFJBQ0VfU1lTVEVNIGRybQogI2RlZmluZSBU
UkFDRV9JTkNMVURFX0ZJTEUgZHJtX3RyYWNlCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
