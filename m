Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 622706B73A
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jul 2019 09:09:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C65C6E281;
	Wed, 17 Jul 2019 07:08:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F83D6E0EC
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2019 09:55:02 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id t132so9170980pgb.9
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2019 02:55:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wglnm+6yqzntyC9h13b4Wh3S/G9NJM2x5q1vPNkqSgU=;
 b=r1oA6BcFXiava50mtJeHis612xElIxtx5UO0zevUVEhqZOkJE0gUWr6Ma+i9rxUHU9
 ZuUiOARfvvj8hBT8AT7//e9zUADda3XIELcESiyLXxnb7g8OTNJPAsl++HpI/fharvpY
 d1BB5VFG/7yTYh0qomIC/YOm05EMO4Eoair1M91MepY+tAgTPau24jnmuyajx/HPJB7w
 lY0AqRTHcsixjBzuYTqcIh1Zwl+pdNml3pCZf4OZs0gLFAT6jhvhKz4EH5We/nhiLLvS
 klSOD0AMQjLu0OjlPuRZaiiuDe5X6XFJ9YJ9NH/zRvAw7HmSmY2J6XXwhEVQmXzlOSKg
 7zqQ==
X-Gm-Message-State: APjAAAU28Qh4r2rzz1cRXyao9jqhUycwavj2M+Z0mQr4lljnr9TgE0Re
 CaDE2QLOSCw+PbLyukd1VS2/M/rONWc=
X-Google-Smtp-Source: APXvYqwE4djRSjudt1aj7hnAPyyjlo+Rw7Ep4ui1p1jCkZWoK7MWPCNdhvgpR/DouQUGSOiXwWBkjg==
X-Received: by 2002:a17:90a:8c90:: with SMTP id
 b16mr34610804pjo.133.1563270901894; 
 Tue, 16 Jul 2019 02:55:01 -0700 (PDT)
Received: from localhost ([122.172.28.117])
 by smtp.gmail.com with ESMTPSA id o14sm42384517pfh.153.2019.07.16.02.55.00
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 16 Jul 2019 02:55:01 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Rafael Wysocki <rjw@rjwysocki.net>
Subject: [PATCH 02/10] video: sa1100fb: Remove cpufreq policy notifier
Date: Tue, 16 Jul 2019 15:24:46 +0530
Message-Id: <7163e57cfa1780d42732fa6b5ec424c24d1d4dc8.1563270828.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.21.0.rc0.269.g1a574e7a288b
In-Reply-To: <cover.1563270828.git.viresh.kumar@linaro.org>
References: <cover.1563270828.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 17 Jul 2019 07:08:01 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wglnm+6yqzntyC9h13b4Wh3S/G9NJM2x5q1vPNkqSgU=;
 b=Dnnh+kwHRtS9hSr7z8dtYzFB/z6nWaIrUpsWPzeEf7Pb6hhhWP8YrQn6phTamDKNCJ
 r5ZsKcNuHQ+Eu35xX8eqMfOOc2GB9DW4slEjuF3JodDKrfbAZJm9l1Ooet/IVl5P6S6U
 Sz0UkF/tUwYvWd5MgI9me+GK3bjcCp8fr/g4H4xmlOpIqjjnkxFBhnxIteeX/R5pvcTo
 fFbz3ZpTfK6TPS/8AIdScSwOH9C9MzZ0EwKDGaxCnoaw6xQARQ5I0erDT6lXSXHRppbI
 cXuEmVGUB4B7r+3GGUarHf2AwnUa4MWpRJhKm59XYpfXh8j4IV3qZ+BtA2LAN7z6OqmG
 mGzw==
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
Cc: linux-fbdev@vger.kernel.org, Vincent Guittot <vincent.guittot@linaro.org>,
 linux-pm@vger.kernel.org, Viresh Kumar <viresh.kumar@linaro.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIGNwdWZyZXEgcG9saWN5IG5vdGlmaWVyJ3MgQ1BVRlJFUV9BREpVU1Qgbm90aWZpY2F0aW9u
IGlzIGdvaW5nIHRvCmdldCByZW1vdmVkIHNvb24uCgpUaGUgbm90aWZpZXIgY2FsbGJhY2sgc2Ex
MTAwZmJfZnJlcV9wb2xpY3koKSBpc24ndCBkb2luZyBhbnl0aGluZyBhcGFydApmcm9tIHByaW50
aW5nIGEgZGVidWcgbWVzc2FnZSBvbiBDUFVGUkVRX0FESlVTVCBub3RpZmljYXRpb24uIFRoZXJl
IGlzCm5vIHBvaW50IGluIGtlZXBpbmcgYW4gb3RoZXJ3aXNlIGVtcHR5IGNhbGxiYWNrIGFuZCBy
ZWdpc3RlcmluZyB0aGUKbm90aWZpZXIuCgpSZW1vdmUgaXQuCgpTaWduZWQtb2ZmLWJ5OiBWaXJl
c2ggS3VtYXIgPHZpcmVzaC5rdW1hckBsaW5hcm8ub3JnPgotLS0KIGRyaXZlcnMvdmlkZW8vZmJk
ZXYvc2ExMTAwZmIuYyB8IDI3IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQogZHJpdmVycy92
aWRlby9mYmRldi9zYTExMDBmYi5oIHwgIDEgLQogMiBmaWxlcyBjaGFuZ2VkLCAyOCBkZWxldGlv
bnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L3NhMTEwMGZiLmMgYi9kcml2
ZXJzL3ZpZGVvL2ZiZGV2L3NhMTEwMGZiLmMKaW5kZXggZjdmOGRlZTA0NGIxLi5hZTJiY2ZlZTMz
OGEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvdmlkZW8vZmJkZXYvc2ExMTAwZmIuYworKysgYi9kcml2
ZXJzL3ZpZGVvL2ZiZGV2L3NhMTEwMGZiLmMKQEAgLTEwMDUsMzEgKzEwMDUsNiBAQCBzYTExMDBm
Yl9mcmVxX3RyYW5zaXRpb24oc3RydWN0IG5vdGlmaWVyX2Jsb2NrICpuYiwgdW5zaWduZWQgbG9u
ZyB2YWwsCiAJfQogCXJldHVybiAwOwogfQotCi1zdGF0aWMgaW50Ci1zYTExMDBmYl9mcmVxX3Bv
bGljeShzdHJ1Y3Qgbm90aWZpZXJfYmxvY2sgKm5iLCB1bnNpZ25lZCBsb25nIHZhbCwKLQkJICAg
ICB2b2lkICpkYXRhKQotewotCXN0cnVjdCBzYTExMDBmYl9pbmZvICpmYmkgPSBUT19JTkYobmIs
IGZyZXFfcG9saWN5KTsKLQlzdHJ1Y3QgY3B1ZnJlcV9wb2xpY3kgKnBvbGljeSA9IGRhdGE7Ci0K
LQlzd2l0Y2ggKHZhbCkgewotCWNhc2UgQ1BVRlJFUV9BREpVU1Q6Ci0JCWRldl9kYmcoZmJpLT5k
ZXYsICJtaW4gZG1hIHBlcmlvZDogJWQgcHMsICIKLQkJCSJuZXcgY2xvY2sgJWQga0h6XG4iLCBz
YTExMDBmYl9taW5fZG1hX3BlcmlvZChmYmkpLAotCQkJcG9saWN5LT5tYXgpOwotCQkvKiB0b2Rv
OiBmaWxsIGluIG1pbi9tYXggdmFsdWVzICovCi0JCWJyZWFrOwotCWNhc2UgQ1BVRlJFUV9OT1RJ
Rlk6Ci0JCWRvIHt9IHdoaWxlKDApOwotCQkvKiB0b2RvOiBwYW5pYyBpZiBtaW4vbWF4IHZhbHVl
cyBhcmVuJ3QgZnVsZmlsbGVkIAotCQkgKiBbY2FuJ3QgcmVhbGx5IGhhcHBlbiB1bmxlc3MgdGhl
cmUncyBhIGJ1ZyBpbiB0aGUKLQkJICogQ1BVIHBvbGljeSB2ZXJpZmlmY2F0aW9uIHByb2Nlc3Mg
KgotCQkgKi8KLQkJYnJlYWs7Ci0JfQotCXJldHVybiAwOwotfQogI2VuZGlmCiAKICNpZmRlZiBD
T05GSUdfUE0KQEAgLTEyNDIsOSArMTIxNyw3IEBAIHN0YXRpYyBpbnQgc2ExMTAwZmJfcHJvYmUo
c3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAogI2lmZGVmIENPTkZJR19DUFVfRlJFUQog
CWZiaS0+ZnJlcV90cmFuc2l0aW9uLm5vdGlmaWVyX2NhbGwgPSBzYTExMDBmYl9mcmVxX3RyYW5z
aXRpb247Ci0JZmJpLT5mcmVxX3BvbGljeS5ub3RpZmllcl9jYWxsID0gc2ExMTAwZmJfZnJlcV9w
b2xpY3k7CiAJY3B1ZnJlcV9yZWdpc3Rlcl9ub3RpZmllcigmZmJpLT5mcmVxX3RyYW5zaXRpb24s
IENQVUZSRVFfVFJBTlNJVElPTl9OT1RJRklFUik7Ci0JY3B1ZnJlcV9yZWdpc3Rlcl9ub3RpZmll
cigmZmJpLT5mcmVxX3BvbGljeSwgQ1BVRlJFUV9QT0xJQ1lfTk9USUZJRVIpOwogI2VuZGlmCiAK
IAkvKiBUaGlzIGRyaXZlciBjYW5ub3QgYmUgdW5sb2FkZWQgYXQgdGhlIG1vbWVudCAqLwpkaWZm
IC0tZ2l0IGEvZHJpdmVycy92aWRlby9mYmRldi9zYTExMDBmYi5oIGIvZHJpdmVycy92aWRlby9m
YmRldi9zYTExMDBmYi5oCmluZGV4IDdhMWE5Y2EzM2NlYy4uZDBhYTMzYjBiODhhIDEwMDY0NAot
LS0gYS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L3NhMTEwMGZiLmgKKysrIGIvZHJpdmVycy92aWRlby9m
YmRldi9zYTExMDBmYi5oCkBAIC02NCw3ICs2NCw2IEBAIHN0cnVjdCBzYTExMDBmYl9pbmZvIHsK
IAogI2lmZGVmIENPTkZJR19DUFVfRlJFUQogCXN0cnVjdCBub3RpZmllcl9ibG9jawlmcmVxX3Ry
YW5zaXRpb247Ci0Jc3RydWN0IG5vdGlmaWVyX2Jsb2NrCWZyZXFfcG9saWN5OwogI2VuZGlmCiAK
IAljb25zdCBzdHJ1Y3Qgc2ExMTAwZmJfbWFjaF9pbmZvICppbmY7Ci0tIAoyLjIxLjAucmMwLjI2
OS5nMWE1NzRlN2EyODhiCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
