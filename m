Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69F096A258
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2019 08:45:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E83A96E0AD;
	Tue, 16 Jul 2019 06:44:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3302B6E0A5
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2019 06:44:57 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id 16so18739135ljv.10
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2019 23:44:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=NrV7HGxY9KRATBAMxv4B9zZxm0JF07LlPZdAWtRO8tc=;
 b=AjCIZdEzFqrG83n8J32ITxdLr1ho9AhKvsnWKl7imXigcMsWqeLFXMKwf08a7U+Xel
 Sg52A0sEnpzebiOyw/8y9y9kCCabaEo5AoABfuNqdN37sA7hLk+qbytcmOkSWo249Wpn
 2RJaqLSN64cEUlt2SkLeqJ5CdmpFp+G+3gn5VXh9YQYXGxtA174AEEVabpO53n2kFndC
 o18vMd7gp9xLzYqWTHzHnepSspOFURlOSe6rx5H7D/ruO+3LK3JQPpsO4BVhRYFCidH8
 Q3NIuz1UwHFeOmZThC/Un0jOTlMnL5X7GN5F0ScmKZWSslzddbavHQpSTWEMtEJ9TSz1
 n1NQ==
X-Gm-Message-State: APjAAAVf+oMrasWTC5i5aA9/JTin3cf0zri4EbcJdfS6V1SU9DrPyNDN
 qPhPphOSMi9eeGBtICUvddDIU5GTDACGtg==
X-Google-Smtp-Source: APXvYqwBO0UimD0s2/yG5ywMeQw6S13Qe29XPJiX897ZJwc9RSDT7yvvo3AXR3ERDmfRhj+gXGDbow==
X-Received: by 2002:a2e:80d6:: with SMTP id r22mr16567750ljg.83.1563259495218; 
 Mon, 15 Jul 2019 23:44:55 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 27sm3529993ljw.97.2019.07.15.23.44.54
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 15 Jul 2019 23:44:54 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 10/19] drm/selftests: drop use of drmP.h
Date: Tue, 16 Jul 2019 08:42:11 +0200
Message-Id: <20190716064220.18157-11-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190716064220.18157-1-sam@ravnborg.org>
References: <20190716064220.18157-1-sam@ravnborg.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NrV7HGxY9KRATBAMxv4B9zZxm0JF07LlPZdAWtRO8tc=;
 b=shv7z5+vXICAcOOUWVHwD2UYW6fnxRjgwsHdfhO6cgVyx3nHw/szf+o2KH5fTeE67L
 gjlRWvyXygV0TRi1Hh7T4bSi/eBClAVET+vON45lLabYjF+xbF8Ub2xuDsQEesJdmN34
 8HMPmAXK6s1zCkrRy7uBYrsEH0hWf4djpBkdPTYMQKtzooDD34aUI0EirXwEkh6BFnJg
 Zj8FiVjF9LlVx1vSl42FFRjLte8ekiKohlmocUVrUSIQyglCW6NnJy49FcG/SWfSuNpQ
 bnmNjkd375ByUOByCseGokwXZDxdlJGI0Fzi/CmXmMTQhQvpaybt3FvkgOTQS0avFcHR
 CaoQ==
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
Cc: David Airlie <airlied@linux.ie>,
 Alexandru-Cosmin Gheorghe <Alexandru-Cosmin.Gheorghe@arm.com>,
 Sam Ravnborg <sam@ravnborg.org>, Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RHJvcCB0aGUgc2luZ2xlIHVzZXIgb2YgZHJtUC5oIC0gcmVwbGFjZSBpdCB3aXRoIHJlbGV2YW50
IGluY2x1ZGVzLgoKU2lnbmVkLW9mZi1ieTogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3Jn
PgpBY2tlZC1ieTogRW1pbCBWZWxpa292IDxlbWlsLnZlbGlrb3ZAY29sbGFib3JhLmNvbT4KQ2M6
IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmll
bEBmZndsbC5jaD4KQ2M6IEFsZXhhbmRydS1Db3NtaW4gR2hlb3JnaGUgPEFsZXhhbmRydS1Db3Nt
aW4uR2hlb3JnaGVAYXJtLmNvbT4KQ2M6IE1hYXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxhbmto
b3JzdEBsaW51eC5pbnRlbC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3NlbGZ0ZXN0cy90ZXN0
LWRybV9mcmFtZWJ1ZmZlci5jIHwgNyArKysrKystCiAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRp
b25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3NlbGZ0
ZXN0cy90ZXN0LWRybV9mcmFtZWJ1ZmZlci5jIGIvZHJpdmVycy9ncHUvZHJtL3NlbGZ0ZXN0cy90
ZXN0LWRybV9mcmFtZWJ1ZmZlci5jCmluZGV4IGEwNGQwMmRhY2NlMi4uNzRkNTU2MWE4NjJiIDEw
MDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vc2VsZnRlc3RzL3Rlc3QtZHJtX2ZyYW1lYnVmZmVy
LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3NlbGZ0ZXN0cy90ZXN0LWRybV9mcmFtZWJ1ZmZlci5j
CkBAIC0zLDcgKzMsMTIgQEAKICAqIFRlc3QgY2FzZXMgZm9yIHRoZSBkcm1fZnJhbWVidWZmZXIg
ZnVuY3Rpb25zCiAgKi8KIAotI2luY2x1ZGUgPGRybS9kcm1QLmg+CisjaW5jbHVkZSA8bGludXgv
a2VybmVsLmg+CisKKyNpbmNsdWRlIDxkcm0vZHJtX2RldmljZS5oPgorI2luY2x1ZGUgPGRybS9k
cm1fbW9kZS5oPgorI2luY2x1ZGUgPGRybS9kcm1fZm91cmNjLmg+CisKICNpbmNsdWRlICIuLi9k
cm1fY3J0Y19pbnRlcm5hbC5oIgogCiAjaW5jbHVkZSAidGVzdC1kcm1fbW9kZXNldF9jb21tb24u
aCIKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
