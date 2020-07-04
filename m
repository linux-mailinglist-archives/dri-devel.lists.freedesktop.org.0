Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10BC0215309
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jul 2020 09:19:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C63C6E290;
	Mon,  6 Jul 2020 07:19:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D4166E3F7
 for <dri-devel@lists.freedesktop.org>; Sat,  4 Jul 2020 10:25:51 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id f2so7342943wrp.7
 for <dri-devel@lists.freedesktop.org>; Sat, 04 Jul 2020 03:25:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZTAD94SYmvrJ+EFhISqWY8vBWQR9v8s+XBZIL9+A5es=;
 b=Yi3Q7AumboBSbsek8DjWtlQ9c10SbTrXYjcMr+rBaAc4VHSqVM6IpfGf8cdW0VtY6W
 HD3FhPLO4DAnUDp+vpl1IiNzGQncT8eF2MvWK7LOcfqGQpQ6Lbi5946UXk8j2fadav0f
 RYw1OVPiiI8ipVovArVWNu5/Vqe6mVcYZ+oaZdTsFMJhhQBa78PbriKiG1TN4ZfyIGR+
 RvISp9wqEPCLfOhV78e1wh/CZdlseUZnUwC0Mq24QTscVxu9LlrgUeduTFA8BgWUFZKD
 v6S9s6lGfmAU/5tMhnnAp9spVJLmQa9oNO/Vr3BYQQ0ctTpr8Uj8D2rbrAp7gTt3AvhD
 2+Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZTAD94SYmvrJ+EFhISqWY8vBWQR9v8s+XBZIL9+A5es=;
 b=Tpfrlnsm97UepTCMgTW5iD+mTUggPBeFNpHuBY5XPKW8Qeoj75hvTvPybON6EF2ipJ
 d/DAWFXB1D4uyb3S012ha1uPrBq2aQOZwyECTXeD9++fSRNo3r27p56T91xN/LH7zZqv
 ul/5v1XJODS6OoerhCV1YQCPMyTqI5PSwcmC/SBJjmSL8+5saixOnBiijIHUvrPozKr4
 XL2D39pgCYDInj40EPcckDgTg/i5yeF2xL2O8VUxISxMCAINRzFTjCmzklJ+w6DytpsW
 cMNX+c2itSMdPuUrKJ6xTH4nlk4W2qEh+MxDGE6bJ3CXXHjZkRMOkbDc9dylg+42DGfS
 6Ihg==
X-Gm-Message-State: AOAM530f38dJyixCWbn9gCsYlnvgIq4ZtgA2nCAGWubdrNV4zEIIqNBi
 M4/f25EnC0tfEEoCYeH5c1A=
X-Google-Smtp-Source: ABdhPJykyG4asxyffWyKxljFdyjAyR9I1fXuAeS8wS1A/odEXdj7M78gsOEIXxbIcjmyVb3VUgKwUg==
X-Received: by 2002:a5d:69cf:: with SMTP id s15mr29403010wrw.10.1593858349937; 
 Sat, 04 Jul 2020 03:25:49 -0700 (PDT)
Received: from clement-Latitude-7490.numericable.fr
 (213-245-241-245.rev.numericable.fr. [213.245.241.245])
 by smtp.gmail.com with ESMTPSA id g14sm16421428wrm.93.2020.07.04.03.25.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jul 2020 03:25:49 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Rob Herring <robh@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH v2 07/14] drm/panfrost: rename error labels in device_init
Date: Sat,  4 Jul 2020 12:25:28 +0200
Message-Id: <20200704102535.189647-8-peron.clem@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200704102535.189647-1-peron.clem@gmail.com>
References: <20200704102535.189647-1-peron.clem@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 06 Jul 2020 07:19:17 +0000
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UmVuYW1lIGdvdG8gbGFiZWxzIGluIGRldmljZV9pbml0IGl0IHdpbGwgYmUgZWFzaWVyIHRvIG1h
aW50YWluLgoKU2lnbmVkLW9mZi1ieTogQ2zDqW1lbnQgUMOpcm9uIDxwZXJvbi5jbGVtQGdtYWls
LmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZGV2aWNlLmMgfCAz
MCArKysrKysrKysrKy0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygr
KSwgMTUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0
L3BhbmZyb3N0X2RldmljZS5jIGIvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2Rl
dmljZS5jCmluZGV4IDgxMzZiYWJkM2JhOS4uY2MxNmQxMDJiMjc1IDEwMDY0NAotLS0gYS9kcml2
ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZGV2aWNlLmMKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2RldmljZS5jCkBAIC0yMTUsNTcgKzIxNSw1NyBAQCBpbnQg
cGFuZnJvc3RfZGV2aWNlX2luaXQoc3RydWN0IHBhbmZyb3N0X2RldmljZSAqcGZkZXYpCiAJZXJy
ID0gcGFuZnJvc3RfcmVndWxhdG9yX2luaXQocGZkZXYpOwogCWlmIChlcnIpIHsKIAkJZGV2X2Vy
cihwZmRldi0+ZGV2LCAicmVndWxhdG9yIGluaXQgZmFpbGVkICVkXG4iLCBlcnIpOwotCQlnb3Rv
IGVycl9vdXQwOworCQlnb3RvIG91dF9jbGs7CiAJfQogCiAJZXJyID0gcGFuZnJvc3RfcmVzZXRf
aW5pdChwZmRldik7CiAJaWYgKGVycikgewogCQlkZXZfZXJyKHBmZGV2LT5kZXYsICJyZXNldCBp
bml0IGZhaWxlZCAlZFxuIiwgZXJyKTsKLQkJZ290byBlcnJfb3V0MTsKKwkJZ290byBvdXRfcmVn
dWxhdG9yOwogCX0KIAogCWVyciA9IHBhbmZyb3N0X3BtX2RvbWFpbl9pbml0KHBmZGV2KTsKIAlp
ZiAoZXJyKQotCQlnb3RvIGVycl9vdXQyOworCQlnb3RvIG91dF9yZXNldDsKIAogCXJlcyA9IHBs
YXRmb3JtX2dldF9yZXNvdXJjZShwZmRldi0+cGRldiwgSU9SRVNPVVJDRV9NRU0sIDApOwogCXBm
ZGV2LT5pb21lbSA9IGRldm1faW9yZW1hcF9yZXNvdXJjZShwZmRldi0+ZGV2LCByZXMpOwogCWlm
IChJU19FUlIocGZkZXYtPmlvbWVtKSkgewogCQlkZXZfZXJyKHBmZGV2LT5kZXYsICJmYWlsZWQg
dG8gaW9yZW1hcCBpb21lbVxuIik7CiAJCWVyciA9IFBUUl9FUlIocGZkZXYtPmlvbWVtKTsKLQkJ
Z290byBlcnJfb3V0MzsKKwkJZ290byBvdXRfcG1fZG9tYWluOwogCX0KIAogCWVyciA9IHBhbmZy
b3N0X2dwdV9pbml0KHBmZGV2KTsKIAlpZiAoZXJyKQotCQlnb3RvIGVycl9vdXQzOworCQlnb3Rv
IG91dF9wbV9kb21haW47CiAKIAllcnIgPSBwYW5mcm9zdF9tbXVfaW5pdChwZmRldik7CiAJaWYg
KGVycikKLQkJZ290byBlcnJfb3V0NDsKKwkJZ290byBvdXRfZ3B1OwogCiAJZXJyID0gcGFuZnJv
c3Rfam9iX2luaXQocGZkZXYpOwogCWlmIChlcnIpCi0JCWdvdG8gZXJyX291dDU7CisJCWdvdG8g
b3V0X21tdTsKIAogCWVyciA9IHBhbmZyb3N0X3BlcmZjbnRfaW5pdChwZmRldik7CiAJaWYgKGVy
cikKLQkJZ290byBlcnJfb3V0NjsKKwkJZ290byBvdXRfam9iOwogCiAJcmV0dXJuIDA7Ci1lcnJf
b3V0NjoKK291dF9qb2I6CiAJcGFuZnJvc3Rfam9iX2ZpbmkocGZkZXYpOwotZXJyX291dDU6Citv
dXRfbW11OgogCXBhbmZyb3N0X21tdV9maW5pKHBmZGV2KTsKLWVycl9vdXQ0Ogorb3V0X2dwdToK
IAlwYW5mcm9zdF9ncHVfZmluaShwZmRldik7Ci1lcnJfb3V0MzoKK291dF9wbV9kb21haW46CiAJ
cGFuZnJvc3RfcG1fZG9tYWluX2ZpbmkocGZkZXYpOwotZXJyX291dDI6CitvdXRfcmVzZXQ6CiAJ
cGFuZnJvc3RfcmVzZXRfZmluaShwZmRldik7Ci1lcnJfb3V0MToKK291dF9yZWd1bGF0b3I6CiAJ
cGFuZnJvc3RfcmVndWxhdG9yX2ZpbmkocGZkZXYpOwotZXJyX291dDA6CitvdXRfY2xrOgogCXBh
bmZyb3N0X2Nsa19maW5pKHBmZGV2KTsKIAlyZXR1cm4gZXJyOwogfQotLSAKMi4yNS4xCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
