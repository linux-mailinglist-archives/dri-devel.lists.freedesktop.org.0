Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B595921E8DE
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jul 2020 09:03:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A037A6E8EA;
	Tue, 14 Jul 2020 07:02:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 594836EBC9
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jul 2020 09:54:22 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id z15so5284333wrl.8
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jul 2020 02:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xXA70POHCV2GWsHX4CvRyqRrbTFQBlpDYTBkU8Vpd/0=;
 b=dJnJPqdZjOa/bpCkQx4pDHa7OyMgG38PvRdxaKjwpbA1DGpoKxrwXgAjwYoRqid1yP
 03QmhQQu6TJVUj1mjhjyc7b4dBIANAt2Vt7si9SXIg+2JyNgaysXPcKt7DSucR5iX4PN
 6nxEQLafz2nkkDgJGEd3cP6q7TAfzmpf0GV+wtbk8UuRrTKHzg4NJtoZiz8R/eRFiKTQ
 yn7vwVsQaQ7+7CQeyPk/nlqHJLSxDas7WFVvZoao2ayTL3C7huFnzBmc49yXSCugyMBF
 r9LE3JNRR3z6RkZW4hKxzSG6eodFXDbiQv59/z+Yd/WX4sXz8NA3bhE4BaEVsBLz7nOh
 JUfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xXA70POHCV2GWsHX4CvRyqRrbTFQBlpDYTBkU8Vpd/0=;
 b=KGRKQknlpOtXlkWqAjDplANWxMV3wa7Sl1esmcfg6tpF93yvWM1XhGzEtw+4BjWI/e
 V0MRvTMbv8wdUggkRq8EyvCX0nb3xBWc9VvoCpLfL3idNVL/Gzvm0J2AVO9RGvhvBygL
 rb7tYHyM0lHhS040LUYb2GlIKJNTIgTegoS0+nzat2XcGJWiWOKeusCu/Wi0YTmTTUeY
 oapLDwsbXfOcEFfiksqx2DxQ2y9UzmP6EdSToE2A9MhyOnAbLBKqHGjQPFWuq4+uOCAK
 DXLlDh74iMBfN4bjGucNkRv+UCiABocpIqSUh28mAmIPElx3MP87eunZnwTpT+lZBMW2
 sj7A==
X-Gm-Message-State: AOAM530zLoSIJGMQxsHC3AfMgHaBikGES8rVkC+tgSxFgLR9IVkRoXA2
 OR1rlDvItyj9OUUBbl7YqKs=
X-Google-Smtp-Source: ABdhPJyxMtH1m8JCcPY59Kapmk4/ptiy3b6zjq6ct3rJ+VI1rdg7CGIPVONJ6HVDnNbOYJSFMUKB5w==
X-Received: by 2002:adf:f34f:: with SMTP id e15mr68195427wrp.415.1594374860909; 
 Fri, 10 Jul 2020 02:54:20 -0700 (PDT)
Received: from clement-Latitude-7490.numericable.fr
 (213-245-241-245.rev.numericable.fr. [213.245.241.245])
 by smtp.gmail.com with ESMTPSA id u23sm10176092wru.94.2020.07.10.02.54.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2020 02:54:20 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Rob Herring <robh@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH v5 07/14] drm/panfrost: rename error labels in device_init
Date: Fri, 10 Jul 2020 11:54:02 +0200
Message-Id: <20200710095409.407087-8-peron.clem@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200710095409.407087-1-peron.clem@gmail.com>
References: <20200710095409.407087-1-peron.clem@gmail.com>
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
