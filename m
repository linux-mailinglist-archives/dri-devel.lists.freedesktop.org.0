Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EF41D5AEE3
	for <lists+dri-devel@lfdr.de>; Sun, 30 Jun 2019 08:19:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E31E46E9CF;
	Sun, 30 Jun 2019 06:19:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 610AD6E9CA
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Jun 2019 06:19:49 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id a9so6600586lff.7
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Jun 2019 23:19:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=c5kYPS1Lgwfwe5AFGPJ+n7NynNNAVr2egCVyEzpnAag=;
 b=tQOwX+fB5V0nJnlkSO6mvbPYbwZ41Kh5r6W9cwHTtzr8dVNqy/iq8ajJkSmCHWjb7X
 8yrpa/EgmjucVUpPBHukZqyvJDvAymHPWZMrXkvVlLPrqR2WZPnsL8fwg7t5RRt0gDCt
 bgJsUhC3PMaycRxNURj2SeE9Z+Ok7YZCeK11lgZA5QGjnmiUyJkYZyGJBmxuPuZLYLwL
 tAbZ940b6JqwQYbUFy+g3rDWu1IvCd+M9v9yHXyNkOjDgXvmyFtVTNniJVW+y3FevcDO
 X+KA9EdrSzEn/r0n8/eGYOjxGeRdUJ1EYH+Ccdza9+pIZie+4adS5rTgH9ChXVyuQx20
 Ki6g==
X-Gm-Message-State: APjAAAVqn6Ua+Sw21GYbkjolsrljUDlSxMqSoz4sQMacIcRbTC9MpMN8
 hXHus2cJA/vAvEy26smVNf+s9SuGd1q0vw==
X-Google-Smtp-Source: APXvYqytNxadIxurs3tT7G5NrF7WXcZmyxtvf4UVL31JHMEqyK8HCyQPkojF5NBDryIT9V3G2dMZPQ==
X-Received: by 2002:a19:c14f:: with SMTP id r76mr9220559lff.70.1561875586343; 
 Sat, 29 Jun 2019 23:19:46 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 o74sm1794024lff.46.2019.06.29.23.19.45
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sat, 29 Jun 2019 23:19:45 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v1 18/33] drm/selftests: drop use of drmP.h
Date: Sun, 30 Jun 2019 08:19:07 +0200
Message-Id: <20190630061922.7254-19-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190630061922.7254-1-sam@ravnborg.org>
References: <20190630061922.7254-1-sam@ravnborg.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=c5kYPS1Lgwfwe5AFGPJ+n7NynNNAVr2egCVyEzpnAag=;
 b=OCDswCndt5EYTSAlsyjZZHMpvuD38BTSEtVS9TJylgEOGXPNbmUlhLtNX4pByQs+IL
 XBQ8tDsjiLY+FSfatn6OOQIeCPFkh5FqtZbB77TqEqLttTkG3CmFAafXOSifiIaO/aKL
 0sCmpXLbyOQyMFG9K+Wag6hR4awISRicf3A7sbHB2UfTLjylSU7Eruuk34g5OGS+qcxY
 /DLW8xf/IYnGRZ1PUZ0BHn2HZEFmAkuxv7UeUy5nZkx6qUyTsEcd704fNlhC71unCiBy
 HdK5kLlLKDtFC8YwzyjCrCf5gbqnqNzASozkkDjtF9ND8F+xJJ5RLYwHrwmJXYEpvVX1
 aTaA==
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
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RHJvcCB0aGUgc2luZ2xlIHVzZXIgb2YgZHJtUC5oIC0gcmVwbGFjZSBpdCB3aXRoIHJlbGV2YW50
IGluY2x1ZGVzLgoKU2lnbmVkLW9mZi1ieTogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3Jn
PgpDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgpDYzogRGFuaWVsIFZldHRlciA8
ZGFuaWVsQGZmd2xsLmNoPgpDYzogQWxleGFuZHJ1LUNvc21pbiBHaGVvcmdoZSA8QWxleGFuZHJ1
LUNvc21pbi5HaGVvcmdoZUBhcm0uY29tPgpDYzogTWFhcnRlbiBMYW5raG9yc3QgPG1hYXJ0ZW4u
bGFua2hvcnN0QGxpbnV4LmludGVsLmNvbT4KQ2M6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3Jn
Lm9yZz4KLS0tClRoZSBsaXN0IG9mIGNjOiB3YXMgdG9vIGxhcmdlIHRvIGFkZCBhbGwgcmVjaXBp
ZW50cyB0byB0aGUgY292ZXIgbGV0dGVyLgpQbGVhc2UgZmluZCBjb3ZlciBsZXR0ZXIgaGVyZToK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvYXJjaGl2ZXMvZHJpLWRldmVsLzIwMTktSnVu
ZS90aHJlYWQuaHRtbApTZWFyY2ggZm9yICJkcm06IGRyb3AgdXNlIG9mIGRybXAuaCBpbiBkcm0t
bWlzYyIKCiAgICAgICAgU2FtCgogZHJpdmVycy9ncHUvZHJtL3NlbGZ0ZXN0cy90ZXN0LWRybV9m
cmFtZWJ1ZmZlci5jIHwgNyArKysrKystCiAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCsp
LCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3NlbGZ0ZXN0cy90
ZXN0LWRybV9mcmFtZWJ1ZmZlci5jIGIvZHJpdmVycy9ncHUvZHJtL3NlbGZ0ZXN0cy90ZXN0LWRy
bV9mcmFtZWJ1ZmZlci5jCmluZGV4IGEwNGQwMmRhY2NlMi4uNzRkNTU2MWE4NjJiIDEwMDY0NAot
LS0gYS9kcml2ZXJzL2dwdS9kcm0vc2VsZnRlc3RzL3Rlc3QtZHJtX2ZyYW1lYnVmZmVyLmMKKysr
IGIvZHJpdmVycy9ncHUvZHJtL3NlbGZ0ZXN0cy90ZXN0LWRybV9mcmFtZWJ1ZmZlci5jCkBAIC0z
LDcgKzMsMTIgQEAKICAqIFRlc3QgY2FzZXMgZm9yIHRoZSBkcm1fZnJhbWVidWZmZXIgZnVuY3Rp
b25zCiAgKi8KIAotI2luY2x1ZGUgPGRybS9kcm1QLmg+CisjaW5jbHVkZSA8bGludXgva2VybmVs
Lmg+CisKKyNpbmNsdWRlIDxkcm0vZHJtX2RldmljZS5oPgorI2luY2x1ZGUgPGRybS9kcm1fbW9k
ZS5oPgorI2luY2x1ZGUgPGRybS9kcm1fZm91cmNjLmg+CisKICNpbmNsdWRlICIuLi9kcm1fY3J0
Y19pbnRlcm5hbC5oIgogCiAjaW5jbHVkZSAidGVzdC1kcm1fbW9kZXNldF9jb21tb24uaCIKLS0g
CjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
