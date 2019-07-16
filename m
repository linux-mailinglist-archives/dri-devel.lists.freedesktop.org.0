Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 95E746B730
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jul 2019 09:08:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5C006E263;
	Wed, 17 Jul 2019 07:08:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6D4D6E0F4
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2019 09:55:05 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id 19so8860311pfa.4
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2019 02:55:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QxH+UbD9tCF0KwHpPpNeLuejcWOqKPoBzOiXe/lF/gk=;
 b=BF/jVWlVgBtIAm9Z+MtJRFnUX8nDQYgYZX78Vdki0OJynnpd+0DmvFQU64TD63sR1T
 732CP+13PCxgZCEbG+YTv0be5CRg23gGmDT78lpHK5aiAhVCPL36VsNOvwbld4BGpMOx
 uzSCYq1ADS0KMOKhYtRKJU750ytQHv1hQGNIPAHRAixTJiDiCVX4M1KilL7dNt9QhGh2
 kKpPwIl/KHhaFaycEzIq6xjhNC6LgV39T20SvlEG6CN7eBpDeH3hgjrDwlDk47cvEIJC
 7HXAPpehqgFAoeEzRJ85O2K7iKPCS6pgp3ng8VfAFjLpWwskskDD/zoz+SNl1rtsS26S
 OD3w==
X-Gm-Message-State: APjAAAWosqsvIG7ZfbRPqWNjF15hAdYDj2IhRDij+L7H2PhAAPYuAONV
 zUf9oB7pqTW1yzFuxQFhscC6qA==
X-Google-Smtp-Source: APXvYqxVvOwNilTqDTpbthb8pN3i7U94PEikdceh26u14QE+VwDQo/NV8TzLClLcmOdL0R6dY7c2PA==
X-Received: by 2002:a63:ad07:: with SMTP id g7mr30139354pgf.405.1563270905182; 
 Tue, 16 Jul 2019 02:55:05 -0700 (PDT)
Received: from localhost ([122.172.28.117])
 by smtp.gmail.com with ESMTPSA id r188sm33754776pfr.16.2019.07.16.02.55.04
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 16 Jul 2019 02:55:04 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Rafael Wysocki <rjw@rjwysocki.net>
Subject: [PATCH 03/10] video: pxafb: Remove cpufreq policy notifier
Date: Tue, 16 Jul 2019 15:24:47 +0530
Message-Id: <e69d47b1d497bdbd8c988754d98714e78ddc0a80.1563270828.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.21.0.rc0.269.g1a574e7a288b
In-Reply-To: <cover.1563270828.git.viresh.kumar@linaro.org>
References: <cover.1563270828.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 17 Jul 2019 07:08:01 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QxH+UbD9tCF0KwHpPpNeLuejcWOqKPoBzOiXe/lF/gk=;
 b=FbuySQDtO2afso3Zxf3ISnrj/v2hbYkqAmDXCqX8MPUrL4zaHSiS5SY9RiGeUl4DBd
 QYFEwKX1LxMARj+z317ztFPrv0F4GtsdtsOHbWT6MhcS3V4/9MxUrlc/V3gklYoUHOs0
 a0Spyg/DNkDb/ExzrNrp0C/TIFJvN5XdZaLcrQXHaPYP7DRkPij+Gm8j2iS8Iyt81NpU
 RYd8ZR0FhyMs9jTWMMD516MbMp+JLzFaFrHFq19l7iCxCkC2OJKVFaH838fVGVaiF5Eu
 OFM4DMWboMqSSpHzjsdkOte3wz2s1/FFebxDMVpx5oLeFUyRxm8T3ZLw1FKyPtdKY9IX
 KCQQ==
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
c3RlcmluZyB0aGUKbm90aWZpZXIuCgpSZW1vdmUgaXQuCgpTaWduZWQtb2ZmLWJ5OiBWaXJlc2gg
S3VtYXIgPHZpcmVzaC5rdW1hckBsaW5hcm8ub3JnPgotLS0KIGRyaXZlcnMvdmlkZW8vZmJkZXYv
cHhhZmIuYyB8IDIxIC0tLS0tLS0tLS0tLS0tLS0tLS0tLQogZHJpdmVycy92aWRlby9mYmRldi9w
eGFmYi5oIHwgIDEgLQogMiBmaWxlcyBjaGFuZ2VkLCAyMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L3B4YWZiLmMgYi9kcml2ZXJzL3ZpZGVvL2ZiZGV2L3B4
YWZiLmMKaW5kZXggNDI4MmNiMTE3YjkyLi5mNzBjOWY3OTYyMmUgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvdmlkZW8vZmJkZXYvcHhhZmIuYworKysgYi9kcml2ZXJzL3ZpZGVvL2ZiZGV2L3B4YWZiLmMK
QEAgLTE2NzgsMjQgKzE2NzgsNiBAQCBweGFmYl9mcmVxX3RyYW5zaXRpb24oc3RydWN0IG5vdGlm
aWVyX2Jsb2NrICpuYiwgdW5zaWduZWQgbG9uZyB2YWwsIHZvaWQgKmRhdGEpCiAJfQogCXJldHVy
biAwOwogfQotCi1zdGF0aWMgaW50Ci1weGFmYl9mcmVxX3BvbGljeShzdHJ1Y3Qgbm90aWZpZXJf
YmxvY2sgKm5iLCB1bnNpZ25lZCBsb25nIHZhbCwgdm9pZCAqZGF0YSkKLXsKLQlzdHJ1Y3QgcHhh
ZmJfaW5mbyAqZmJpID0gVE9fSU5GKG5iLCBmcmVxX3BvbGljeSk7Ci0Jc3RydWN0IGZiX3Zhcl9z
Y3JlZW5pbmZvICp2YXIgPSAmZmJpLT5mYi52YXI7Ci0Jc3RydWN0IGNwdWZyZXFfcG9saWN5ICpw
b2xpY3kgPSBkYXRhOwotCi0Jc3dpdGNoICh2YWwpIHsKLQljYXNlIENQVUZSRVFfQURKVVNUOgot
CQlwcl9kZWJ1ZygibWluIGRtYSBwZXJpb2Q6ICVkIHBzLCAiCi0JCQkibmV3IGNsb2NrICVkIGtI
elxuIiwgcHhhZmJfZGlzcGxheV9kbWFfcGVyaW9kKHZhciksCi0JCQlwb2xpY3ktPm1heCk7Ci0J
CS8qIFRPRE86IGZpbGwgaW4gbWluL21heCB2YWx1ZXMgKi8KLQkJYnJlYWs7Ci0JfQotCXJldHVy
biAwOwotfQogI2VuZGlmCiAKICNpZmRlZiBDT05GSUdfUE0KQEAgLTI0MDAsMTEgKzIzODIsOCBA
QCBzdGF0aWMgaW50IHB4YWZiX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKmRldikKIAog
I2lmZGVmIENPTkZJR19DUFVfRlJFUQogCWZiaS0+ZnJlcV90cmFuc2l0aW9uLm5vdGlmaWVyX2Nh
bGwgPSBweGFmYl9mcmVxX3RyYW5zaXRpb247Ci0JZmJpLT5mcmVxX3BvbGljeS5ub3RpZmllcl9j
YWxsID0gcHhhZmJfZnJlcV9wb2xpY3k7CiAJY3B1ZnJlcV9yZWdpc3Rlcl9ub3RpZmllcigmZmJp
LT5mcmVxX3RyYW5zaXRpb24sCiAJCQkJQ1BVRlJFUV9UUkFOU0lUSU9OX05PVElGSUVSKTsKLQlj
cHVmcmVxX3JlZ2lzdGVyX25vdGlmaWVyKCZmYmktPmZyZXFfcG9saWN5LAotCQkJCUNQVUZSRVFf
UE9MSUNZX05PVElGSUVSKTsKICNlbmRpZgogCiAJLyoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmlk
ZW8vZmJkZXYvcHhhZmIuaCBiL2RyaXZlcnMvdmlkZW8vZmJkZXYvcHhhZmIuaAppbmRleCBiNjQx
Mjg5YzhhOTkuLjg2YjFlOWFiMWEzOCAxMDA2NDQKLS0tIGEvZHJpdmVycy92aWRlby9mYmRldi9w
eGFmYi5oCisrKyBiL2RyaXZlcnMvdmlkZW8vZmJkZXYvcHhhZmIuaApAQCAtMTYyLDcgKzE2Miw2
IEBAIHN0cnVjdCBweGFmYl9pbmZvIHsKIAogI2lmZGVmIENPTkZJR19DUFVfRlJFUQogCXN0cnVj
dCBub3RpZmllcl9ibG9jawlmcmVxX3RyYW5zaXRpb247Ci0Jc3RydWN0IG5vdGlmaWVyX2Jsb2Nr
CWZyZXFfcG9saWN5OwogI2VuZGlmCiAKIAlzdHJ1Y3QgcmVndWxhdG9yICpsY2Rfc3VwcGx5Owot
LSAKMi4yMS4wLnJjMC4yNjkuZzFhNTc0ZTdhMjg4YgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
