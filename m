Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BED8196CC5
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2019 01:07:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA41B6E8CE;
	Tue, 20 Aug 2019 23:07:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 996616E8CA
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2019 23:07:03 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id d85so101000pfd.2
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2019 16:07:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=JH6TFWi2jRebxYBXOLzwh9NRdxn767CmjdWSOdZnLUU=;
 b=h84vlpFXfKm/m91yjUHsxkJu4tw1q/zDAxx652XTsDMhl079A2/U2sXvXTD4mQ96rE
 bg914r9Hh+5aH+vnXJFxGJBqcnriWyXi3eLywtdkWv1OXzZF8whotXj+FOh1tZYASCMU
 CEjR7Bqx4EvYJzt1bZyQrYoDjLtpl4ifXf0SypyipIdUOl4OUbki+T3pcze9RK0w9T2E
 /w/jImAQPKzB/Xi1mKuS3CtV7lyZqq2VzpmVI/4j8+vRi1iNSFnnvKGexBcDHodybKof
 74SIQrM+z7RCfL7zl6M41uTztV8q9//e7usGC/p/IjTzoPIkW6h78IZ3ycQ770CWydnG
 5qqw==
X-Gm-Message-State: APjAAAUtsH3+TRrZhEPV273Yks4TYS0Q4CFNoIKqmeX0SSUPF24KYg/I
 c1AVH+h2yWQLgUB5Ww7EoXtKyQ==
X-Google-Smtp-Source: APXvYqxcb1Obks0yFE+u7vU6fyhH13cugDVkKCNHFU9sRO/6BWUGpIIRt3iT73604AGLIwuXrrmSpw==
X-Received: by 2002:a62:ab0a:: with SMTP id p10mr32526186pff.144.1566342422333; 
 Tue, 20 Aug 2019 16:07:02 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
 by smtp.gmail.com with ESMTPSA id
 q4sm27564747pff.183.2019.08.20.16.06.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Aug 2019 16:06:59 -0700 (PDT)
From: John Stultz <john.stultz@linaro.org>
To: lkml <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 20/25] drm: kirin: Rename plane_init and crtc_init
Date: Tue, 20 Aug 2019 23:06:21 +0000
Message-Id: <20190820230626.23253-21-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190820230626.23253-1-john.stultz@linaro.org>
References: <20190820230626.23253-1-john.stultz@linaro.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=JH6TFWi2jRebxYBXOLzwh9NRdxn767CmjdWSOdZnLUU=;
 b=GC2fVtAj+YBtwyiQU4cD88uREHFeALuT3jPKkf8NTz0iGw8Wn45nLFCbMqPGUz+2dR
 0gYKQJqIdjnrUwKlDMh3JQNLyAQPfpQIJ0mbXhKdYCF34TcU4rL7NEwrJjlfkgvdxVeA
 JpzkBkNn2MGzGd6UFO9KJQ9vXawjOin0EzUFazRkDOP/RBzQrZx7ZVs9/WRzf/DlTV1M
 p+5dzeM3+dZMhN2NYANr/FFQrs2gEWumdlchLmteC2QYvcqcTG6CesD+zF+zSirYUhrK
 pMhrfC8OLgH1wTLcf3F6DdT9i27AVAOGptJ+gua88BWMmlylsC3d1ePlRZjH0F6viva5
 N6Sg==
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
Cc: Xu YiPing <xuyiping@hisilicon.com>, David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Xinliang Liu <z.liuxinliang@hisilicon.com>,
 Rongrong Zou <zourongrong@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogWHUgWWlQaW5nIDx4dXlpcGluZ0BoaXNpbGljb24uY29tPgoKQXMgcGFydCBvZiByZWZh
Y3RvcmluZyB0aGUga2lyaW4gZHJpdmVyIHRvIGJldHRlciBzdXBwb3J0CmRpZmZlcmVudCBoYXJk
d2FyZSByZXZpc2lvbnMsIHRoaXMgcGF0Y2ggcmVuYW1lcwphZGVfY3J0Yy9wbGFuZV9pbml0IGtp
cmluX3BsYW5lL2NydGNfaW5pdCwgYXMgdGhleSB3aWxsIGxhdGVyIGJlCm1vdmVkIHRvIGtpcmlu
IGRybSBkcnYgYW5kIHNoYXJlZCB3aXRoIHRoZSBraXJpbjk2MCBoYXJkd2FyZQpzdXBwb3J0LgoK
Q2M6IFJvbmdyb25nIFpvdSA8em91cm9uZ3JvbmdAZ21haWwuY29tPgpDYzogWGlubGlhbmcgTGl1
IDx6LmxpdXhpbmxpYW5nQGhpc2lsaWNvbi5jb20+CkNjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRA
bGludXguaWU+CkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+CkNjOiBkcmktZGV2
ZWwgPGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmc+CkNjOiBTYW0gUmF2bmJvcmcgPHNh
bUByYXZuYm9yZy5vcmc+CkFja2VkLWJ5OiBYaW5saWFuZyBMaXUgPHoubGl1eGlubGlhbmdAaGlz
aWxpY29uLmNvbT4KUmV2aWV3ZWQtYnk6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4K
U2lnbmVkLW9mZi1ieTogWHUgWWlQaW5nIDx4dXlpcGluZ0BoaXNpbGljb24uY29tPgpbanN0dWx0
ejogcmV3b3JkZWQgY29tbWl0IG1lc3NhZ2VdClNpZ25lZC1vZmYtYnk6IEpvaG4gU3R1bHR6IDxq
b2huLnN0dWx0ekBsaW5hcm8ub3JnPgotLS0KdjU6IGNoZWNrcGF0Y2ggLS1zdHJpY3Qgd2hpdGVz
cGFjZSBmaXh1cHMgbm90aWNlZCBieSBTYW0KLS0tCiBkcml2ZXJzL2dwdS9kcm0vaGlzaWxpY29u
L2tpcmluL2tpcmluX2RybV9hZGUuYyB8IDE3ICsrKysrKysrKystLS0tLS0tCiAxIGZpbGUgY2hh
bmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vaGlzaWxpY29uL2tpcmluL2tpcmluX2RybV9hZGUuYyBiL2RyaXZlcnMvZ3B1
L2RybS9oaXNpbGljb24va2lyaW4va2lyaW5fZHJtX2FkZS5jCmluZGV4IDg5YmRjMDM4ODEzOC4u
ZTM5MGIxYjY1N2I4IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vaGlzaWxpY29uL2tpcmlu
L2tpcmluX2RybV9hZGUuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vaGlzaWxpY29uL2tpcmluL2tp
cmluX2RybV9hZGUuYwpAQCAtNTcxLDggKzU3MSw4IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJt
X2NydGNfZnVuY3MgYWRlX2NydGNfZnVuY3MgPSB7CiAJLmRpc2FibGVfdmJsYW5rCT0gYWRlX2Ny
dGNfZGlzYWJsZV92YmxhbmssCiB9OwogCi1zdGF0aWMgaW50IGFkZV9jcnRjX2luaXQoc3RydWN0
IGRybV9kZXZpY2UgKmRldiwgc3RydWN0IGRybV9jcnRjICpjcnRjLAotCQkJIHN0cnVjdCBkcm1f
cGxhbmUgKnBsYW5lKQorc3RhdGljIGludCBraXJpbl9kcm1fY3J0Y19pbml0KHN0cnVjdCBkcm1f
ZGV2aWNlICpkZXYsIHN0cnVjdCBkcm1fY3J0YyAqY3J0YywKKwkJCSAgICAgICBzdHJ1Y3QgZHJt
X3BsYW5lICpwbGFuZSkKIHsKIAlzdHJ1Y3QgZGV2aWNlX25vZGUgKnBvcnQ7CiAJaW50IHJldDsK
QEAgLTg5Miw4ICs4OTIsOSBAQCBzdGF0aWMgc3RydWN0IGRybV9wbGFuZV9mdW5jcyBhZGVfcGxh
bmVfZnVuY3MgPSB7CiAJLmF0b21pY19kZXN0cm95X3N0YXRlID0gZHJtX2F0b21pY19oZWxwZXJf
cGxhbmVfZGVzdHJveV9zdGF0ZSwKIH07CiAKLXN0YXRpYyBpbnQgYWRlX3BsYW5lX2luaXQoc3Ry
dWN0IGRybV9kZXZpY2UgKmRldiwgc3RydWN0IGtpcmluX3BsYW5lICprcGxhbmUsCi0JCQkgIGVu
dW0gZHJtX3BsYW5lX3R5cGUgdHlwZSkKK3N0YXRpYyBpbnQga2lyaW5fZHJtX3BsYW5lX2luaXQo
c3RydWN0IGRybV9kZXZpY2UgKmRldiwKKwkJCQlzdHJ1Y3Qga2lyaW5fcGxhbmUgKmtwbGFuZSwK
KwkJCQllbnVtIGRybV9wbGFuZV90eXBlIHR5cGUpCiB7CiAJaW50IHJldCA9IDA7CiAKQEAgLTk4
OSw2ICs5OTAsNyBAQCBzdGF0aWMgaW50IGFkZV9kcm1faW5pdChzdHJ1Y3QgcGxhdGZvcm1fZGV2
aWNlICpwZGV2KQogCXN0cnVjdCBraXJpbl9jcnRjICprY3J0YzsKIAlzdHJ1Y3Qga2lyaW5fcGxh
bmUgKmtwbGFuZTsKIAllbnVtIGRybV9wbGFuZV90eXBlIHR5cGU7CisJaW50IHByaW1fcGxhbmU7
CiAJaW50IHJldDsKIAl1MzIgY2g7CiAKQEAgLTEwMjQsMTQgKzEwMjYsMTUgQEAgc3RhdGljIGlu
dCBhZGVfZHJtX2luaXQoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAkJZWxzZQogCQkJ
dHlwZSA9IERSTV9QTEFORV9UWVBFX09WRVJMQVk7CiAKLQkJcmV0ID0gYWRlX3BsYW5lX2luaXQo
ZGV2LCBrcGxhbmUsIHR5cGUpOworCQlyZXQgPSBraXJpbl9kcm1fcGxhbmVfaW5pdChkZXYsIGtw
bGFuZSwgdHlwZSk7CiAJCWlmIChyZXQpCiAJCQlyZXR1cm4gcmV0OwogCX0KIAogCS8qIGNydGMg
aW5pdCAqLwotCXJldCA9IGFkZV9jcnRjX2luaXQoZGV2LCAma2NydGMtPmJhc2UsCi0JCQkgICAg
JmFkZS0+cGxhbmVzW2FkZV9kcml2ZXJfZGF0YS5wcmltX3BsYW5lXS5iYXNlKTsKKwlwcmltX3Bs
YW5lID0gYWRlX2RyaXZlcl9kYXRhLnByaW1fcGxhbmU7CisJcmV0ID0ga2lyaW5fZHJtX2NydGNf
aW5pdChkZXYsICZrY3J0Yy0+YmFzZSwKKwkJCQkgICZhZGUtPnBsYW5lc1twcmltX3BsYW5lXS5i
YXNlKTsKIAlpZiAocmV0KQogCQlyZXR1cm4gcmV0OwogCi0tIAoyLjE3LjEKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
