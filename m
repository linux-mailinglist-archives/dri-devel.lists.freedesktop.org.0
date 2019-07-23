Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9F34712A2
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2019 09:16:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7B7C6E16D;
	Tue, 23 Jul 2019 07:16:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD0D088FF4
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2019 06:14:43 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id i2so20196758plt.1
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 23:14:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WSy97MHTyvjB+tNxNcL94WmxX39zNt2juy/xtyGFT8Y=;
 b=gQUdNcNDzYRrrcmHLXzMTR3Y+/6zazv2QeYShb5z3J1m7ELja56EC7P44Z+J7h4dri
 q4lIhe2bklYfXcAivdLaZu/QXZ/k8UJRzrbgX2A1QE17H/9t6rNlCbofaYvz5ohA3kZA
 7k6TSGeSAmMSkcTo/OqUXTmZRzay79yHyLX+Y+03J2lEqBfgECehM3Kj065XrJkdALhY
 hIbAVhxElaIdfa/retQ8tGZlLeUDorvMWANkNjCtni1D8UsLWZ0+/0MGGNOkfygSDV83
 FyqacA7pz24Ou65EBNjp9eqAXi8TcPM+Yozw5GR6S+2iHx/PjUCvNE7tp/Jk8HhWE8+e
 5X5A==
X-Gm-Message-State: APjAAAV9Ba+8hZyPYipb4W6u46uyz/2ISOU9f2R1w3XkZ6uWvuEuJx/3
 7I5Dl+YKPwJ9TdDXzEulr2bMWQ==
X-Google-Smtp-Source: APXvYqzUcFU3wsNIG8Q7OYgyK85j0SXIDJZX0XAXT4Zwbjja4zDuD7rUEYw8CerpGmcATZitxlwbIA==
X-Received: by 2002:a17:902:a504:: with SMTP id
 s4mr56706631plq.117.1563862483299; 
 Mon, 22 Jul 2019 23:14:43 -0700 (PDT)
Received: from localhost ([122.172.28.117])
 by smtp.gmail.com with ESMTPSA id o3sm76723419pje.1.2019.07.22.23.14.42
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 22 Jul 2019 23:14:42 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Rafael Wysocki <rjw@rjwysocki.net>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH V2 07/10] video: sa1100fb: Remove cpufreq policy notifier
Date: Tue, 23 Jul 2019 11:44:07 +0530
Message-Id: <b8ed154787c6930c9d098fe549fcfe52c82ad762.1563862014.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.21.0.rc0.269.g1a574e7a288b
In-Reply-To: <cover.1563862014.git.viresh.kumar@linaro.org>
References: <cover.1563862014.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 23 Jul 2019 07:14:10 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WSy97MHTyvjB+tNxNcL94WmxX39zNt2juy/xtyGFT8Y=;
 b=qtTFfvyZQ+n3BuQV5HhEc01LRgT8Q3RVePNpiuu1aFBWLZo5PygfiqyPF5qZVn9kMs
 Ap/gS6I2/VtC79MvUUIFxAKz6PdL+jGvXs+qAQdfW+vWgCs0L5x6oMb817ZLrMRe+HJQ
 WQpmjP9g8/XywOFL87iUm1K0rWmzH6s0K/FknZkn08PcKHDV9j9derGTZZzn51hs2CvT
 bcbSjLS3S1IYcrl3kb/7UKnHwtQZcYDaFH2WL5o7WNBYy0kLw3qMjxeMVKpIO/5avxle
 slCcswwRW/HdUXQIyAaM/e+zokBpHfS8HYwRX12Njthf0f1F944t4XBK4n+1xmq6SCdT
 dckw==
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
ZWdpc3RlcmluZyB0aGUKbm90aWZpZXIuCgpSZW1vdmUgaXQuCgpBY2tlZC1ieTogQmFydGxvbWll
aiBab2xuaWVya2lld2ljeiA8Yi56b2xuaWVya2llQHNhbXN1bmcuY29tPgpTaWduZWQtb2ZmLWJ5
OiBWaXJlc2ggS3VtYXIgPHZpcmVzaC5rdW1hckBsaW5hcm8ub3JnPgotLS0KIGRyaXZlcnMvdmlk
ZW8vZmJkZXYvc2ExMTAwZmIuYyB8IDI3IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQogZHJp
dmVycy92aWRlby9mYmRldi9zYTExMDBmYi5oIHwgIDEgLQogMiBmaWxlcyBjaGFuZ2VkLCAyOCBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L3NhMTEwMGZiLmMg
Yi9kcml2ZXJzL3ZpZGVvL2ZiZGV2L3NhMTEwMGZiLmMKaW5kZXggZjdmOGRlZTA0NGIxLi5hZTJi
Y2ZlZTMzOGEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvdmlkZW8vZmJkZXYvc2ExMTAwZmIuYworKysg
Yi9kcml2ZXJzL3ZpZGVvL2ZiZGV2L3NhMTEwMGZiLmMKQEAgLTEwMDUsMzEgKzEwMDUsNiBAQCBz
YTExMDBmYl9mcmVxX3RyYW5zaXRpb24oc3RydWN0IG5vdGlmaWVyX2Jsb2NrICpuYiwgdW5zaWdu
ZWQgbG9uZyB2YWwsCiAJfQogCXJldHVybiAwOwogfQotCi1zdGF0aWMgaW50Ci1zYTExMDBmYl9m
cmVxX3BvbGljeShzdHJ1Y3Qgbm90aWZpZXJfYmxvY2sgKm5iLCB1bnNpZ25lZCBsb25nIHZhbCwK
LQkJICAgICB2b2lkICpkYXRhKQotewotCXN0cnVjdCBzYTExMDBmYl9pbmZvICpmYmkgPSBUT19J
TkYobmIsIGZyZXFfcG9saWN5KTsKLQlzdHJ1Y3QgY3B1ZnJlcV9wb2xpY3kgKnBvbGljeSA9IGRh
dGE7Ci0KLQlzd2l0Y2ggKHZhbCkgewotCWNhc2UgQ1BVRlJFUV9BREpVU1Q6Ci0JCWRldl9kYmco
ZmJpLT5kZXYsICJtaW4gZG1hIHBlcmlvZDogJWQgcHMsICIKLQkJCSJuZXcgY2xvY2sgJWQga0h6
XG4iLCBzYTExMDBmYl9taW5fZG1hX3BlcmlvZChmYmkpLAotCQkJcG9saWN5LT5tYXgpOwotCQkv
KiB0b2RvOiBmaWxsIGluIG1pbi9tYXggdmFsdWVzICovCi0JCWJyZWFrOwotCWNhc2UgQ1BVRlJF
UV9OT1RJRlk6Ci0JCWRvIHt9IHdoaWxlKDApOwotCQkvKiB0b2RvOiBwYW5pYyBpZiBtaW4vbWF4
IHZhbHVlcyBhcmVuJ3QgZnVsZmlsbGVkIAotCQkgKiBbY2FuJ3QgcmVhbGx5IGhhcHBlbiB1bmxl
c3MgdGhlcmUncyBhIGJ1ZyBpbiB0aGUKLQkJICogQ1BVIHBvbGljeSB2ZXJpZmlmY2F0aW9uIHBy
b2Nlc3MgKgotCQkgKi8KLQkJYnJlYWs7Ci0JfQotCXJldHVybiAwOwotfQogI2VuZGlmCiAKICNp
ZmRlZiBDT05GSUdfUE0KQEAgLTEyNDIsOSArMTIxNyw3IEBAIHN0YXRpYyBpbnQgc2ExMTAwZmJf
cHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAogI2lmZGVmIENPTkZJR19DUFVf
RlJFUQogCWZiaS0+ZnJlcV90cmFuc2l0aW9uLm5vdGlmaWVyX2NhbGwgPSBzYTExMDBmYl9mcmVx
X3RyYW5zaXRpb247Ci0JZmJpLT5mcmVxX3BvbGljeS5ub3RpZmllcl9jYWxsID0gc2ExMTAwZmJf
ZnJlcV9wb2xpY3k7CiAJY3B1ZnJlcV9yZWdpc3Rlcl9ub3RpZmllcigmZmJpLT5mcmVxX3RyYW5z
aXRpb24sIENQVUZSRVFfVFJBTlNJVElPTl9OT1RJRklFUik7Ci0JY3B1ZnJlcV9yZWdpc3Rlcl9u
b3RpZmllcigmZmJpLT5mcmVxX3BvbGljeSwgQ1BVRlJFUV9QT0xJQ1lfTk9USUZJRVIpOwogI2Vu
ZGlmCiAKIAkvKiBUaGlzIGRyaXZlciBjYW5ub3QgYmUgdW5sb2FkZWQgYXQgdGhlIG1vbWVudCAq
LwpkaWZmIC0tZ2l0IGEvZHJpdmVycy92aWRlby9mYmRldi9zYTExMDBmYi5oIGIvZHJpdmVycy92
aWRlby9mYmRldi9zYTExMDBmYi5oCmluZGV4IDdhMWE5Y2EzM2NlYy4uZDBhYTMzYjBiODhhIDEw
MDY0NAotLS0gYS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L3NhMTEwMGZiLmgKKysrIGIvZHJpdmVycy92
aWRlby9mYmRldi9zYTExMDBmYi5oCkBAIC02NCw3ICs2NCw2IEBAIHN0cnVjdCBzYTExMDBmYl9p
bmZvIHsKIAogI2lmZGVmIENPTkZJR19DUFVfRlJFUQogCXN0cnVjdCBub3RpZmllcl9ibG9jawlm
cmVxX3RyYW5zaXRpb247Ci0Jc3RydWN0IG5vdGlmaWVyX2Jsb2NrCWZyZXFfcG9saWN5OwogI2Vu
ZGlmCiAKIAljb25zdCBzdHJ1Y3Qgc2ExMTAwZmJfbWFjaF9pbmZvICppbmY7Ci0tIAoyLjIxLjAu
cmMwLjI2OS5nMWE1NzRlN2EyODhiCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
