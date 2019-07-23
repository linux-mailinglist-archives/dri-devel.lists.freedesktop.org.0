Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 554CA71283
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2019 09:15:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 280C58933E;
	Tue, 23 Jul 2019 07:14:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4AC588FF4
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2019 06:14:46 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id r7so18580232pfl.3
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 23:14:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rUdeKFVKj/j46aY/YcoOji4W0Ij6fg/KFJvYkeK7wzw=;
 b=uQZZIW/O4nQfulJkAvjqNB7hFfsEgQlJ1KzhZl3Obz0/BZFX4it8+mPt8NpQnLSXz+
 wL1miSgO8jEK9KbspOLY44Zs/0OPuoypWlqLL6Ioz2U1Aa3Cp/B6PfuZ6vU4VzfwlqT3
 JlPQZsdfijhrN/NB+JREQ8SIJT0Ro54zyuNaFLgJe+GQQQUdvZgfBWuKUGzTFvjD89ux
 iM5XMUP9X/HqzITDnyVtSA8lO/pmILbw3NBvr3eWBo5U/wOXLDwD8okxew5I7rB+kR1z
 NPr6xgw+2HgU2OHJcR3o8bO+YmMRSPtcCBpImKZ8vEdbopbQ6Va7sUfhuKEP3DWmxT/q
 wyrw==
X-Gm-Message-State: APjAAAVjIs42KIRwoIA1sddoR1VXa0wZJW94Oar9QvH1gtnO84/RegL2
 YmdFP0zJyUlF1JllZCp9qQvs4w==
X-Google-Smtp-Source: APXvYqzYmC0czirjB9JZaCwmGJpEhIA8u9rhpfNc/1Lkv6/WiUNTY1TurBq8xS5qTAzrc9zunXfj2g==
X-Received: by 2002:a63:2148:: with SMTP id s8mr73371962pgm.336.1563862486415; 
 Mon, 22 Jul 2019 23:14:46 -0700 (PDT)
Received: from localhost ([122.172.28.117])
 by smtp.gmail.com with ESMTPSA id j10sm3176159pfn.188.2019.07.22.23.14.45
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 22 Jul 2019 23:14:45 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Rafael Wysocki <rjw@rjwysocki.net>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH V2 08/10] video: pxafb: Remove cpufreq policy notifier
Date: Tue, 23 Jul 2019 11:44:08 +0530
Message-Id: <56ea0fb68b99d343b093bc517024356a18f780e7.1563862014.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.21.0.rc0.269.g1a574e7a288b
In-Reply-To: <cover.1563862014.git.viresh.kumar@linaro.org>
References: <cover.1563862014.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 23 Jul 2019 07:14:10 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rUdeKFVKj/j46aY/YcoOji4W0Ij6fg/KFJvYkeK7wzw=;
 b=YdOCMHbEQbXw8KubWzfOBaz7EB1B9f22y/t/+FTFKWx6jaFEuKDB5E3Sdj+cgk/DqY
 C9cxtOOhSrNaS0qcgK+e3peT5VxHr1x8GRySc1B8JNaI4BFnBdNZKAcPcQwlFhAuZnHM
 fVZrfoQqSU7JY3To8jmisIml+v18EtMwAP2mG9m2TZV0803DLrB/agmYbIynLjJbpWGf
 CEx548oc6YgKawUdx4hUVc63pqEnTiPyaA84BAupYaEGnhrc2rFI0wqFtyI4YVcC2EqM
 TcblXyTlgI5zs0HecA/SZBqEEZyaW8DH0Iy3gUTOjqAgrxmynKEqKoeWUy9kWzXO4Cue
 ThYQ==
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
IGlzIGdvaW5nIHRvCmdldCByZW1vdmVkIHNvb24uCgpUaGUgbm90aWZpZXIgY2FsbGJhY2sgcHhh
ZmJfZnJlcV9wb2xpY3koKSBpc24ndCBkb2luZyBhbnl0aGluZyBhcGFydApmcm9tIHByaW50aW5n
IGEgZGVidWcgbWVzc2FnZSBvbiBDUFVGUkVRX0FESlVTVCBub3RpZmljYXRpb24uIFRoZXJlIGlz
Cm5vIHBvaW50IGluIGtlZXBpbmcgYW4gb3RoZXJ3aXNlIGVtcHR5IGNhbGxiYWNrIGFuZCByZWdp
c3RlcmluZyB0aGUKbm90aWZpZXIuCgpSZW1vdmUgaXQuCgpBY2tlZC1ieTogQmFydGxvbWllaiBa
b2xuaWVya2lld2ljeiA8Yi56b2xuaWVya2llQHNhbXN1bmcuY29tPgpTaWduZWQtb2ZmLWJ5OiBW
aXJlc2ggS3VtYXIgPHZpcmVzaC5rdW1hckBsaW5hcm8ub3JnPgotLS0KIGRyaXZlcnMvdmlkZW8v
ZmJkZXYvcHhhZmIuYyB8IDIxIC0tLS0tLS0tLS0tLS0tLS0tLS0tLQogZHJpdmVycy92aWRlby9m
YmRldi9weGFmYi5oIHwgIDEgLQogMiBmaWxlcyBjaGFuZ2VkLCAyMiBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L3B4YWZiLmMgYi9kcml2ZXJzL3ZpZGVvL2Zi
ZGV2L3B4YWZiLmMKaW5kZXggNDI4MmNiMTE3YjkyLi5mNzBjOWY3OTYyMmUgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvdmlkZW8vZmJkZXYvcHhhZmIuYworKysgYi9kcml2ZXJzL3ZpZGVvL2ZiZGV2L3B4
YWZiLmMKQEAgLTE2NzgsMjQgKzE2NzgsNiBAQCBweGFmYl9mcmVxX3RyYW5zaXRpb24oc3RydWN0
IG5vdGlmaWVyX2Jsb2NrICpuYiwgdW5zaWduZWQgbG9uZyB2YWwsIHZvaWQgKmRhdGEpCiAJfQog
CXJldHVybiAwOwogfQotCi1zdGF0aWMgaW50Ci1weGFmYl9mcmVxX3BvbGljeShzdHJ1Y3Qgbm90
aWZpZXJfYmxvY2sgKm5iLCB1bnNpZ25lZCBsb25nIHZhbCwgdm9pZCAqZGF0YSkKLXsKLQlzdHJ1
Y3QgcHhhZmJfaW5mbyAqZmJpID0gVE9fSU5GKG5iLCBmcmVxX3BvbGljeSk7Ci0Jc3RydWN0IGZi
X3Zhcl9zY3JlZW5pbmZvICp2YXIgPSAmZmJpLT5mYi52YXI7Ci0Jc3RydWN0IGNwdWZyZXFfcG9s
aWN5ICpwb2xpY3kgPSBkYXRhOwotCi0Jc3dpdGNoICh2YWwpIHsKLQljYXNlIENQVUZSRVFfQURK
VVNUOgotCQlwcl9kZWJ1ZygibWluIGRtYSBwZXJpb2Q6ICVkIHBzLCAiCi0JCQkibmV3IGNsb2Nr
ICVkIGtIelxuIiwgcHhhZmJfZGlzcGxheV9kbWFfcGVyaW9kKHZhciksCi0JCQlwb2xpY3ktPm1h
eCk7Ci0JCS8qIFRPRE86IGZpbGwgaW4gbWluL21heCB2YWx1ZXMgKi8KLQkJYnJlYWs7Ci0JfQot
CXJldHVybiAwOwotfQogI2VuZGlmCiAKICNpZmRlZiBDT05GSUdfUE0KQEAgLTI0MDAsMTEgKzIz
ODIsOCBAQCBzdGF0aWMgaW50IHB4YWZiX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKmRl
dikKIAogI2lmZGVmIENPTkZJR19DUFVfRlJFUQogCWZiaS0+ZnJlcV90cmFuc2l0aW9uLm5vdGlm
aWVyX2NhbGwgPSBweGFmYl9mcmVxX3RyYW5zaXRpb247Ci0JZmJpLT5mcmVxX3BvbGljeS5ub3Rp
Zmllcl9jYWxsID0gcHhhZmJfZnJlcV9wb2xpY3k7CiAJY3B1ZnJlcV9yZWdpc3Rlcl9ub3RpZmll
cigmZmJpLT5mcmVxX3RyYW5zaXRpb24sCiAJCQkJQ1BVRlJFUV9UUkFOU0lUSU9OX05PVElGSUVS
KTsKLQljcHVmcmVxX3JlZ2lzdGVyX25vdGlmaWVyKCZmYmktPmZyZXFfcG9saWN5LAotCQkJCUNQ
VUZSRVFfUE9MSUNZX05PVElGSUVSKTsKICNlbmRpZgogCiAJLyoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvdmlkZW8vZmJkZXYvcHhhZmIuaCBiL2RyaXZlcnMvdmlkZW8vZmJkZXYvcHhhZmIuaAppbmRl
eCBiNjQxMjg5YzhhOTkuLjg2YjFlOWFiMWEzOCAxMDA2NDQKLS0tIGEvZHJpdmVycy92aWRlby9m
YmRldi9weGFmYi5oCisrKyBiL2RyaXZlcnMvdmlkZW8vZmJkZXYvcHhhZmIuaApAQCAtMTYyLDcg
KzE2Miw2IEBAIHN0cnVjdCBweGFmYl9pbmZvIHsKIAogI2lmZGVmIENPTkZJR19DUFVfRlJFUQog
CXN0cnVjdCBub3RpZmllcl9ibG9jawlmcmVxX3RyYW5zaXRpb247Ci0Jc3RydWN0IG5vdGlmaWVy
X2Jsb2NrCWZyZXFfcG9saWN5OwogI2VuZGlmCiAKIAlzdHJ1Y3QgcmVndWxhdG9yICpsY2Rfc3Vw
cGx5OwotLSAKMi4yMS4wLnJjMC4yNjkuZzFhNTc0ZTdhMjg4YgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
