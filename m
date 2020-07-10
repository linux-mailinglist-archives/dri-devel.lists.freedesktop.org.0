Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE2F521E935
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jul 2020 09:05:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB51E6E916;
	Tue, 14 Jul 2020 07:02:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60EAA6EBBD
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jul 2020 09:26:02 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id j18so5374168wmi.3
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jul 2020 02:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xXA70POHCV2GWsHX4CvRyqRrbTFQBlpDYTBkU8Vpd/0=;
 b=S2ig4kvmDSJIPwYoXEgwMT8FZkjfG9AVU443JHmffIUG51/Is4LsPtP5tODmYYaEsc
 auB8gLKNNCaSSTKDeLuP9AHMK8ekbeF3eb2nz2ZLiKUxjW9avc5hIebi+FQ1LkyRpfE9
 1HnrWiQh0UzK+EyDN0LW8bI8ANdBw2aAafYBFf9oCnGTmQ1mIJj5tarTQBvjn6ECNjkL
 brj0s1P/EIxKJShtsZRjCpDx5bewqgdUs1SfYoESwuAkI6ipnjL9vYjLdmZVfzF03Jac
 kyL4fMD+LmzMTVWrea13dQl6Sf91dDhNWSyQcjcrCx90ZO7e9Nhm+6Fz9qJDVXXACAJn
 j8lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xXA70POHCV2GWsHX4CvRyqRrbTFQBlpDYTBkU8Vpd/0=;
 b=Tbp3goPuwEV6oRboZPy31nWrXcX941NSsVDzS+DGmX2em1CzY2S2CST1sBceLs8qx1
 82rQU5pRo2KNvltdmIcwNZ4WapyowgE1mokiT5tIDBL2Y7DuVA9wQN+fJC66JCKXq204
 YiUiIo7/V5/sw9Utewiw0DCpM1xeayTMhi6/482+7G5r1ozRRrxHh623FitQO9ZZdQM4
 lhUUmcx208UW0i3ow/k1Gk8rzU/+9GmBfMiR9C2xlenM0R+SfXO6VVYUdVJg2l9noVPn
 J72ynmIIeeYGZEppj3nqUxK8Od/cAzpcvttbEg/VFkG2jHKVlBpfgO5RhaLJCMfF/KwP
 4pIA==
X-Gm-Message-State: AOAM532OH/qHTPR1TFZvTm6pmpLFdh0M1bmkCq2BKj0UChKlMWMo9Rpl
 Hmzt20WTi+paSzRLsGw1xbo=
X-Google-Smtp-Source: ABdhPJwf0I1oRgP5F+GFt4RKjJo/KGgOpRV0lTTEpc+BKVvDFwJ4KfE3PAObQkkIVtQDkCgqg4qb5g==
X-Received: by 2002:a7b:c194:: with SMTP id y20mr4487588wmi.83.1594373160910; 
 Fri, 10 Jul 2020 02:26:00 -0700 (PDT)
Received: from clement-Latitude-7490.numericable.fr
 (213-245-241-245.rev.numericable.fr. [213.245.241.245])
 by smtp.gmail.com with ESMTPSA id h23sm8179559wmb.3.2020.07.10.02.25.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2020 02:26:00 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Rob Herring <robh@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH v4 07/14] drm/panfrost: rename error labels in device_init
Date: Fri, 10 Jul 2020 11:25:41 +0200
Message-Id: <20200710092548.316054-8-peron.clem@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200710092548.316054-1-peron.clem@gmail.com>
References: <20200710092548.316054-1-peron.clem@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 14 Jul 2020 07:02:08 +0000
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
aW50YWluLgoKUmV2aWV3ZWQtYnk6IEFseXNzYSBSb3Nlbnp3ZWlnIDxhbHlzc2Eucm9zZW56d2Vp
Z0Bjb2xsYWJvcmEuY29tPgpSZXZpZXdlZC1ieTogU3RldmVuIFByaWNlIDxzdGV2ZW4ucHJpY2VA
YXJtLmNvbT4KU2lnbmVkLW9mZi1ieTogQ2zDqW1lbnQgUMOpcm9uIDxwZXJvbi5jbGVtQGdtYWls
LmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZGV2aWNlLmMgfCAz
MCArKysrKysrKysrKy0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygr
KSwgMTUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0
L3BhbmZyb3N0X2RldmljZS5jIGIvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2Rl
dmljZS5jCmluZGV4IGIxNzIwODdlZWU2YS4uOWY4OTk4NGY2NTJhIDEwMDY0NAotLS0gYS9kcml2
ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZGV2aWNlLmMKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2RldmljZS5jCkBAIC0yMTYsNTYgKzIxNiw1NiBAQCBpbnQg
cGFuZnJvc3RfZGV2aWNlX2luaXQoc3RydWN0IHBhbmZyb3N0X2RldmljZSAqcGZkZXYpCiAKIAll
cnIgPSBwYW5mcm9zdF9yZWd1bGF0b3JfaW5pdChwZmRldik7CiAJaWYgKGVycikKLQkJZ290byBl
cnJfb3V0MDsKKwkJZ290byBvdXRfY2xrOwogCiAJZXJyID0gcGFuZnJvc3RfcmVzZXRfaW5pdChw
ZmRldik7CiAJaWYgKGVycikgewogCQlkZXZfZXJyKHBmZGV2LT5kZXYsICJyZXNldCBpbml0IGZh
aWxlZCAlZFxuIiwgZXJyKTsKLQkJZ290byBlcnJfb3V0MTsKKwkJZ290byBvdXRfcmVndWxhdG9y
OwogCX0KIAogCWVyciA9IHBhbmZyb3N0X3BtX2RvbWFpbl9pbml0KHBmZGV2KTsKIAlpZiAoZXJy
KQotCQlnb3RvIGVycl9vdXQyOworCQlnb3RvIG91dF9yZXNldDsKIAogCXJlcyA9IHBsYXRmb3Jt
X2dldF9yZXNvdXJjZShwZmRldi0+cGRldiwgSU9SRVNPVVJDRV9NRU0sIDApOwogCXBmZGV2LT5p
b21lbSA9IGRldm1faW9yZW1hcF9yZXNvdXJjZShwZmRldi0+ZGV2LCByZXMpOwogCWlmIChJU19F
UlIocGZkZXYtPmlvbWVtKSkgewogCQlkZXZfZXJyKHBmZGV2LT5kZXYsICJmYWlsZWQgdG8gaW9y
ZW1hcCBpb21lbVxuIik7CiAJCWVyciA9IFBUUl9FUlIocGZkZXYtPmlvbWVtKTsKLQkJZ290byBl
cnJfb3V0MzsKKwkJZ290byBvdXRfcG1fZG9tYWluOwogCX0KIAogCWVyciA9IHBhbmZyb3N0X2dw
dV9pbml0KHBmZGV2KTsKIAlpZiAoZXJyKQotCQlnb3RvIGVycl9vdXQzOworCQlnb3RvIG91dF9w
bV9kb21haW47CiAKIAllcnIgPSBwYW5mcm9zdF9tbXVfaW5pdChwZmRldik7CiAJaWYgKGVycikK
LQkJZ290byBlcnJfb3V0NDsKKwkJZ290byBvdXRfZ3B1OwogCiAJZXJyID0gcGFuZnJvc3Rfam9i
X2luaXQocGZkZXYpOwogCWlmIChlcnIpCi0JCWdvdG8gZXJyX291dDU7CisJCWdvdG8gb3V0X21t
dTsKIAogCWVyciA9IHBhbmZyb3N0X3BlcmZjbnRfaW5pdChwZmRldik7CiAJaWYgKGVycikKLQkJ
Z290byBlcnJfb3V0NjsKKwkJZ290byBvdXRfam9iOwogCiAJcmV0dXJuIDA7Ci1lcnJfb3V0NjoK
K291dF9qb2I6CiAJcGFuZnJvc3Rfam9iX2ZpbmkocGZkZXYpOwotZXJyX291dDU6CitvdXRfbW11
OgogCXBhbmZyb3N0X21tdV9maW5pKHBmZGV2KTsKLWVycl9vdXQ0Ogorb3V0X2dwdToKIAlwYW5m
cm9zdF9ncHVfZmluaShwZmRldik7Ci1lcnJfb3V0MzoKK291dF9wbV9kb21haW46CiAJcGFuZnJv
c3RfcG1fZG9tYWluX2ZpbmkocGZkZXYpOwotZXJyX291dDI6CitvdXRfcmVzZXQ6CiAJcGFuZnJv
c3RfcmVzZXRfZmluaShwZmRldik7Ci1lcnJfb3V0MToKK291dF9yZWd1bGF0b3I6CiAJcGFuZnJv
c3RfcmVndWxhdG9yX2ZpbmkocGZkZXYpOwotZXJyX291dDA6CitvdXRfY2xrOgogCXBhbmZyb3N0
X2Nsa19maW5pKHBmZGV2KTsKIAlyZXR1cm4gZXJyOwogfQotLSAKMi4yNS4xCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
