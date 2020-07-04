Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EF20215302
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jul 2020 09:19:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B9C26E25A;
	Mon,  6 Jul 2020 07:19:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC8D889711
 for <dri-devel@lists.freedesktop.org>; Sat,  4 Jul 2020 10:25:44 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id a6so35320854wrm.4
 for <dri-devel@lists.freedesktop.org>; Sat, 04 Jul 2020 03:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3PPcg5UlBRq0w4LR6ro2v8Q7Hq7d6jVFUN9WJytznf0=;
 b=LLw6z/lPBPk9eRudhoD2GhCQN2yf6/vRH7B9bzbbvt2rZyBFg8i4afsacJl2VCxxyc
 MU0WnqLFBci4J72OOA4qlyc0wdPBMIWoIZ9ReADOe4aljTU0XwPrvP8EC8hqKHZCDzgU
 C2K/kDDkHUVzv91aW+wkI2ttYeiEox+KJyE1GtTxCjFXZI8K4FhT0hgP1X5aSi/YapAq
 2uwI6rtvxeqQT0mXOj0Nqc1+Igpxur2KwJVPbvxg1ATtPzz2yWaM1M9kTm+CoP9c9f6n
 m92vefWCiZ4APg7m/P4884EKsdpJoSfnZ5EAY9SQyjyovpc0FR3mol9XeEm2PfAhyxs/
 cbyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3PPcg5UlBRq0w4LR6ro2v8Q7Hq7d6jVFUN9WJytznf0=;
 b=FUMchqA2wSqC7ET3gCuI1F3cKbpZebZ6Gd/htgVj+3UD6CwqwwLhK7/uFyogaGSXcM
 MiL/XBDhkyfO+ZkEHbqtFrUw3Ntj5Ffketf+xXAUGfdfiAiWZAKBB4GsDjdml0QTPxGL
 pgv8DNe3gCkrvbWGeOYUd0rF1Bd6mHVJIHI0MUNHijLOn9nfuDc7HKox0/LmZPjX5RvC
 E4LGHCgQv1nDCnMmMMWstSK8Wmz9EdjhC4uKt3PCMAvGs2SiVi9sAasLxRh/hwkJHc8H
 pU85fpkjBbLI7kN7qBAZ/B3mokJeNmBen23mGdiriP2Q+Bx97tfBP5Rqlyy7chb2wvIy
 sUhQ==
X-Gm-Message-State: AOAM530Vl/lVb2d5BllxHioyvdf7uHTco5/oKawHQVmD1H9CBzYbCRwC
 88qG8UjsttVAsM1pltjPE3M=
X-Google-Smtp-Source: ABdhPJwgyjK4HfdOdlAHjlrwJp3kauA7Q5SEnSmInR4v0bMUWpQskG8gyIQp4x8u4GgxMvdShnulTQ==
X-Received: by 2002:a5d:4a45:: with SMTP id v5mr40632842wrs.228.1593858343437; 
 Sat, 04 Jul 2020 03:25:43 -0700 (PDT)
Received: from clement-Latitude-7490.numericable.fr
 (213-245-241-245.rev.numericable.fr. [213.245.241.245])
 by smtp.gmail.com with ESMTPSA id g14sm16421428wrm.93.2020.07.04.03.25.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jul 2020 03:25:42 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Rob Herring <robh@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH v2 01/14] drm/panfrost: avoid static declaration
Date: Sat,  4 Jul 2020 12:25:22 +0200
Message-Id: <20200704102535.189647-2-peron.clem@gmail.com>
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

VGhpcyBkZWNsYXJhdGlvbiBjYW4gYmUgYXZvaWRlZCBzbyBjaGFuZ2UgaXQuCgpTaWduZWQtb2Zm
LWJ5OiBDbMOpbWVudCBQw6lyb24gPHBlcm9uLmNsZW1AZ21haWwuY29tPgpSZXZpZXdlZC1ieTog
U3RldmVuIFByaWNlIDxzdGV2ZW4ucHJpY2VAYXJtLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0v
cGFuZnJvc3QvcGFuZnJvc3RfZGV2ZnJlcS5jIHwgMzggKysrKysrKysrKy0tLS0tLS0tLS0tCiAx
IGZpbGUgY2hhbmdlZCwgMTggaW5zZXJ0aW9ucygrKSwgMjAgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2RldmZyZXEuYyBiL2RyaXZl
cnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kZXZmcmVxLmMKaW5kZXggNDEzOTg3MDM4ZmJm
Li4xYjU2MGI5MDNlYTYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5m
cm9zdF9kZXZmcmVxLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2Rl
dmZyZXEuYwpAQCAtMTQsNyArMTQsMjQgQEAKICNpbmNsdWRlICJwYW5mcm9zdF9ncHUuaCIKICNp
bmNsdWRlICJwYW5mcm9zdF9yZWdzLmgiCiAKLXN0YXRpYyB2b2lkIHBhbmZyb3N0X2RldmZyZXFf
dXBkYXRlX3V0aWxpemF0aW9uKHN0cnVjdCBwYW5mcm9zdF9kZXZpY2UgKnBmZGV2KTsKK3N0YXRp
YyB2b2lkIHBhbmZyb3N0X2RldmZyZXFfdXBkYXRlX3V0aWxpemF0aW9uKHN0cnVjdCBwYW5mcm9z
dF9kZXZpY2UgKnBmZGV2KQoreworCWt0aW1lX3Qgbm93OworCWt0aW1lX3QgbGFzdDsKKworCWlm
ICghcGZkZXYtPmRldmZyZXEuZGV2ZnJlcSkKKwkJcmV0dXJuOworCisJbm93ID0ga3RpbWVfZ2V0
KCk7CisJbGFzdCA9IHBmZGV2LT5kZXZmcmVxLnRpbWVfbGFzdF91cGRhdGU7CisKKwlpZiAoYXRv
bWljX3JlYWQoJnBmZGV2LT5kZXZmcmVxLmJ1c3lfY291bnQpID4gMCkKKwkJcGZkZXYtPmRldmZy
ZXEuYnVzeV90aW1lICs9IGt0aW1lX3N1Yihub3csIGxhc3QpOworCWVsc2UKKwkJcGZkZXYtPmRl
dmZyZXEuaWRsZV90aW1lICs9IGt0aW1lX3N1Yihub3csIGxhc3QpOworCisJcGZkZXYtPmRldmZy
ZXEudGltZV9sYXN0X3VwZGF0ZSA9IG5vdzsKK30KIAogc3RhdGljIGludCBwYW5mcm9zdF9kZXZm
cmVxX3RhcmdldChzdHJ1Y3QgZGV2aWNlICpkZXYsIHVuc2lnbmVkIGxvbmcgKmZyZXEsCiAJCQkJ
ICAgdTMyIGZsYWdzKQpAQCAtMTM5LDI1ICsxNTYsNiBAQCB2b2lkIHBhbmZyb3N0X2RldmZyZXFf
c3VzcGVuZChzdHJ1Y3QgcGFuZnJvc3RfZGV2aWNlICpwZmRldikKIAlkZXZmcmVxX3N1c3BlbmRf
ZGV2aWNlKHBmZGV2LT5kZXZmcmVxLmRldmZyZXEpOwogfQogCi1zdGF0aWMgdm9pZCBwYW5mcm9z
dF9kZXZmcmVxX3VwZGF0ZV91dGlsaXphdGlvbihzdHJ1Y3QgcGFuZnJvc3RfZGV2aWNlICpwZmRl
dikKLXsKLQlrdGltZV90IG5vdzsKLQlrdGltZV90IGxhc3Q7Ci0KLQlpZiAoIXBmZGV2LT5kZXZm
cmVxLmRldmZyZXEpCi0JCXJldHVybjsKLQotCW5vdyA9IGt0aW1lX2dldCgpOwotCWxhc3QgPSBw
ZmRldi0+ZGV2ZnJlcS50aW1lX2xhc3RfdXBkYXRlOwotCi0JaWYgKGF0b21pY19yZWFkKCZwZmRl
di0+ZGV2ZnJlcS5idXN5X2NvdW50KSA+IDApCi0JCXBmZGV2LT5kZXZmcmVxLmJ1c3lfdGltZSAr
PSBrdGltZV9zdWIobm93LCBsYXN0KTsKLQllbHNlCi0JCXBmZGV2LT5kZXZmcmVxLmlkbGVfdGlt
ZSArPSBrdGltZV9zdWIobm93LCBsYXN0KTsKLQotCXBmZGV2LT5kZXZmcmVxLnRpbWVfbGFzdF91
cGRhdGUgPSBub3c7Ci19Ci0KIHZvaWQgcGFuZnJvc3RfZGV2ZnJlcV9yZWNvcmRfYnVzeShzdHJ1
Y3QgcGFuZnJvc3RfZGV2aWNlICpwZmRldikKIHsKIAlwYW5mcm9zdF9kZXZmcmVxX3VwZGF0ZV91
dGlsaXphdGlvbihwZmRldik7Ci0tIAoyLjI1LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbAo=
