Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF4D62B4DA2
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 18:41:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B26889FCE;
	Mon, 16 Nov 2020 17:41:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5B936E04A
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 17:41:21 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id d12so19618779wrr.13
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 09:41:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qEyPNgqrCvgW7yAtw6B6vQyE222bBpFcTf7vHkr21Ko=;
 b=o1UX4zCdDDDNMV0OKn61RJZh5y0bXjwuSLSb/l0adES4M9qoqn7sv1BgCviUEyBC9c
 YkW31BulSSuyM5+eWBzeavPqQ3NlTBNZubQzQ8wtBRC/GUKmFYk3lzpk/YE3zsJ/6WBl
 OpKn4Wy9zyDhuplwApEWD5Sa6zKv+AxMW88gW874lf++usj3pJ6pcP4EB7aKSnEKcHnY
 kCasy1dCT1JGnPTFofUgrWLFptS2mPNQSJqgRojLSiEN6sitXESVrhduYN1uH3wka2Bv
 yg8/3HsJ4Ku+jxbJGWlvJEDL04L/+8P+k/Us8Su3EihI97fe/pyVcTBp5V8a0wj1wcDA
 CTmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qEyPNgqrCvgW7yAtw6B6vQyE222bBpFcTf7vHkr21Ko=;
 b=MelZ8tTqlufnCyI0mvEJL9jYNx244dpM9QQtf8V39MLXxAd1wi5TWjz8B7HyqqQc5f
 3SzT06Xtul5Ud6Vfk1uP280XfVRfv/Job0M7NS9QKbfyM9KBr5lAM0KhoGwVDvnY6oBo
 BvrWprugtd3kE9g9SH4/rqOdNYQxlJwxbZUp0lruKBoka1//7zyFL5rlWhJBkW8MXWIw
 XulT9H3++GMZVaGRfTCxARQvmkt5rCavwiw8GC9WocW91103K6AZV1k2RbvK2QA4eF9M
 y/MvfpPf8N1uxQu8LmwurWVKHLV25BqQOfIQVHbO47IJ22pf0jUcHGhCy0g+mPqADIHf
 Ygvg==
X-Gm-Message-State: AOAM532EqctdK9+5ZbHWspS1JF+qWeSmZZ8/+MXSGSIlPvtxV2nlNx7d
 dku0MBxIpA5EnDvOkTV8+aIK3Q==
X-Google-Smtp-Source: ABdhPJzRRRIcqjO4tgQf4glCQA5hVitq6bSC5qSo/xDr9yKWinhRugh4nu2qRSQ/wCZZC7eA8JUXXA==
X-Received: by 2002:adf:fd0d:: with SMTP id e13mr19708579wrr.85.1605548480370; 
 Mon, 16 Nov 2020 09:41:20 -0800 (PST)
Received: from dell.default ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id n10sm24667224wrx.9.2020.11.16.09.41.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 09:41:19 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 01/42] drm/amd/amdgpu/atombios_encoders: Remove set but unused
 variable 'backlight_level'
Date: Mon, 16 Nov 2020 17:40:31 +0000
Message-Id: <20201116174112.1833368-2-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201116174112.1833368-1-lee.jones@linaro.org>
References: <20201116174112.1833368-1-lee.jones@linaro.org>
MIME-Version: 1.0
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Luben Tuikov <luben.tuikov@amd.com>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWxzbyByZW1vdmluZyB0aGUgY2FsbCB0byBhbWRncHVfYXRvbWJpb3NfZW5jb2Rlcl9nZXRfYmFj
a2xpZ2h0X2xldmVsX2Zyb21fcmVnKCkKc2luY2UsIGFjY29yZGluZyB0byBBbGV4IERldWNoZXIs
ICJXZSBjYWxsIGl0IGFnYWluIGJlbG93IGluZGlyZWN0bHkiLgoKRml4ZXMgdGhlIGZvbGxvd2lu
ZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYXRvbWJpb3NfZW5jb2RlcnMuYzogSW4gZnVuY3Rpb24g4oCYYW1kZ3B1X2F0b21iaW9zX2Vu
Y29kZXJfaW5pdF9iYWNrbGlnaHTigJk6CiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hdG9t
Ymlvc19lbmNvZGVycy5jOjE3NDo1OiB3YXJuaW5nOiB2YXJpYWJsZSDigJhiYWNrbGlnaHRfbGV2
ZWzigJkgc2V0IGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQtYnV0LXNldC12YXJpYWJsZV0KCkNjOiBB
bGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+CkNjOiAiQ2hyaXN0aWFuIEvD
tm5pZyIgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KQ2M6IERhdmlkIEFpcmxpZSA8YWlybGll
ZEBsaW51eC5pZT4KQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KQ2M6IEx1YmVu
IFR1aWtvdiA8bHViZW4udHVpa292QGFtZC5jb20+CkNjOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpTaWduZWQtb2ZmLWJ5
OiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2F0b21iaW9zX2VuY29kZXJzLmMgfCAzIC0tLQogMSBmaWxlIGNoYW5nZWQsIDMg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYXRv
bWJpb3NfZW5jb2RlcnMuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2F0b21iaW9zX2Vu
Y29kZXJzLmMKaW5kZXggZmE4MTdlYmZmOTgwNC4uNjEzNGVkOTY0MDI3OSAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYXRvbWJpb3NfZW5jb2RlcnMuYworKysgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hdG9tYmlvc19lbmNvZGVycy5jCkBAIC0xNzEsNyArMTcx
LDYgQEAgdm9pZCBhbWRncHVfYXRvbWJpb3NfZW5jb2Rlcl9pbml0X2JhY2tsaWdodChzdHJ1Y3Qg
YW1kZ3B1X2VuY29kZXIgKmFtZGdwdV9lbmNvZGUKIAlzdHJ1Y3QgYmFja2xpZ2h0X3Byb3BlcnRp
ZXMgcHJvcHM7CiAJc3RydWN0IGFtZGdwdV9iYWNrbGlnaHRfcHJpdmRhdGEgKnBkYXRhOwogCXN0
cnVjdCBhbWRncHVfZW5jb2Rlcl9hdG9tX2RpZyAqZGlnOwotCXU4IGJhY2tsaWdodF9sZXZlbDsK
IAljaGFyIGJsX25hbWVbMTZdOwogCiAJLyogTWFjIGxhcHRvcHMgd2l0aCBtdWx0aXBsZSBHUFVz
IHVzZSB0aGUgZ211eCBkcml2ZXIgZm9yIGJhY2tsaWdodApAQCAtMjA3LDggKzIwNiw2IEBAIHZv
aWQgYW1kZ3B1X2F0b21iaW9zX2VuY29kZXJfaW5pdF9iYWNrbGlnaHQoc3RydWN0IGFtZGdwdV9l
bmNvZGVyICphbWRncHVfZW5jb2RlCiAKIAlwZGF0YS0+ZW5jb2RlciA9IGFtZGdwdV9lbmNvZGVy
OwogCi0JYmFja2xpZ2h0X2xldmVsID0gYW1kZ3B1X2F0b21iaW9zX2VuY29kZXJfZ2V0X2JhY2ts
aWdodF9sZXZlbF9mcm9tX3JlZyhhZGV2KTsKLQogCWRpZyA9IGFtZGdwdV9lbmNvZGVyLT5lbmNf
cHJpdjsKIAlkaWctPmJsX2RldiA9IGJkOwogCi0tIAoyLjI1LjEKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
