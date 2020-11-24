Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EFBA2C30E1
	for <lists+dri-devel@lfdr.de>; Tue, 24 Nov 2020 20:44:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE7E76E55E;
	Tue, 24 Nov 2020 19:44:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5853C6E544
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Nov 2020 19:44:20 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id m6so23530174wrg.7
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Nov 2020 11:44:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6BIBjiOdivrzYawdrQqwhLZi7LHNHFFVX0tDFPG1aP4=;
 b=S+ft6BuTv+JtOVsSGQS38Kw5N5F+7HgwyqOwHtI4YmLpPi8myfl9uf/3DTCLKlBmG8
 U/KUA9OBoVwRem49Ansk6PTyOuiFaTFxK5D05JMdRD7lLxS4N3xkpFovqXuy2TQqaVfs
 llG68eAtYZkhHtrj0DvGypS6D7uB0GwhKM0lfgXPgCLQye/PAwFaX277L5GeutR9iNmh
 3abHn1zZaQm+XcmKhu1ZDH9CVjBLpPUHmv40UTGu0vA3rVieMl0msCICGCSRSV8YmCU3
 Ejlgn+3iG7Xh/BB4gBDCEWBaPXBQe4QCQgSdD1+cWLIE9PhTH1syZe5cBsnSIciT4eb5
 rpyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6BIBjiOdivrzYawdrQqwhLZi7LHNHFFVX0tDFPG1aP4=;
 b=TJAECj0q9jviNyydN6TAmWGbrjSahD6g/iGJEePE8dV/sICWVemu39j705yE8FsLag
 bbleGrSVVogNA/G3GW2qEQS6LLdY8TuHPJPB8rxcT5LyO2Dhq52+TYXIztOYPw2BWIcp
 bJdacK278cpOkZC1Ul5/NjVxiE3kxp8jO4scVWgse6yilqd+cE6KTnF3+r6kF8PIFsXe
 vBcAXE7ZtNAXs7rTkikB8l55m+B170/OApE+ep4Cb6B+KUAJRbMZ+gQGlJjpRg7431jG
 6DyzpurJSQTG0CbYSemPIP4EB/EliC9NVNtdbWmo/uqVO0PDV0K+7WOxnpbGIXDB0ZSI
 DFkg==
X-Gm-Message-State: AOAM532+HJcyatmk3sP/Mb7QcW0lIyrDGHKlFjdgYuakWqeO1ZZO9iWm
 KSrGKH2fR9VVpiBgfgqPIDBl+g==
X-Google-Smtp-Source: ABdhPJxIYo1Qzypys+c2KpL3kCVX7Czyu1/i5hvXZTCGnC8/99RXCscGF1oBsQHzN7Tg9eA66na2nA==
X-Received: by 2002:adf:e5c4:: with SMTP id a4mr126337wrn.56.1606247059082;
 Tue, 24 Nov 2020 11:44:19 -0800 (PST)
Received: from dell.default ([91.110.221.235])
 by smtp.gmail.com with ESMTPSA id d134sm200511wmd.8.2020.11.24.11.44.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Nov 2020 11:44:18 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 16/40] drm/amd/amdgpu/gfx_v10_0: Remove a bunch of set but
 unused variables
Date: Tue, 24 Nov 2020 19:38:00 +0000
Message-Id: <20201124193824.1118741-17-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201124193824.1118741-1-lee.jones@linaro.org>
References: <20201124193824.1118741-1-lee.jones@linaro.org>
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
 amd-gfx@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3YxMF8wLmM6IEluIGZ1bmN0aW9uIOKAmGdmeF92MTBf
cmxjZ193cmVn4oCZOgogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3YxMF8wLmM6MTQx
NjoxODogd2FybmluZzogdmFyaWFibGUg4oCYZ3JibV9pZHjigJkgc2V0IGJ1dCBub3QgdXNlZCBb
LVd1bnVzZWQtYnV0LXNldC12YXJpYWJsZV0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dm
eF92MTBfMC5jOjE0MTU6MTg6IHdhcm5pbmc6IHZhcmlhYmxlIOKAmGdyYm1fY250bOKAmSBzZXQg
YnV0IG5vdCB1c2VkIFstV3VudXNlZC1idXQtc2V0LXZhcmlhYmxlXQogZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvZ2Z4X3YxMF8wLmM6MTQxMzoxNTogd2FybmluZzogdmFyaWFibGUg4oCYc2Ny
YXRjaF9yZWcz4oCZIHNldCBidXQgbm90IHVzZWQgWy1XdW51c2VkLWJ1dC1zZXQtdmFyaWFibGVd
CiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjEwXzAuYzoxNDEyOjE1OiB3YXJuaW5n
OiB2YXJpYWJsZSDigJhzY3JhdGNoX3JlZzLigJkgc2V0IGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQt
YnV0LXNldC12YXJpYWJsZV0KCkNjOiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFt
ZC5jb20+CkNjOiAiQ2hyaXN0aWFuIEvDtm5pZyIgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4K
Q2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KQ2M6IERhbmllbCBWZXR0ZXIgPGRh
bmllbEBmZndsbC5jaD4KQ2M6IFN1bWl0IFNlbXdhbCA8c3VtaXQuc2Vtd2FsQGxpbmFyby5vcmc+
CkNjOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpDYzogZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpDYzogbGludXgtbWVkaWFAdmdlci5rZXJuZWwub3JnCkNjOiBsaW5hcm8t
bW0tc2lnQGxpc3RzLmxpbmFyby5vcmcKU2lnbmVkLW9mZi1ieTogTGVlIEpvbmVzIDxsZWUuam9u
ZXNAbGluYXJvLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjEwXzAu
YyB8IDkgLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgOSBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjEwXzAuYyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2dmeF92MTBfMC5jCmluZGV4IGE2ZDAzOTMxZjdmYTQuLmQ0NzYwZjRl
MjY5YTEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92MTBfMC5j
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92MTBfMC5jCkBAIC0xNDA5LDIz
ICsxNDA5LDE0IEBAIHN0YXRpYyB2b2lkIGdmeF92MTBfcmxjZ193cmVnKHN0cnVjdCBhbWRncHVf
ZGV2aWNlICphZGV2LCB1MzIgb2Zmc2V0LCB1MzIgdikKIHsKIAlzdGF0aWMgdm9pZCAqc2NyYXRj
aF9yZWcwOwogCXN0YXRpYyB2b2lkICpzY3JhdGNoX3JlZzE7Ci0Jc3RhdGljIHZvaWQgKnNjcmF0
Y2hfcmVnMjsKLQlzdGF0aWMgdm9pZCAqc2NyYXRjaF9yZWczOwogCXN0YXRpYyB2b2lkICpzcGFy
ZV9pbnQ7Ci0Jc3RhdGljIHVpbnQzMl90IGdyYm1fY250bDsKLQlzdGF0aWMgdWludDMyX3QgZ3Ji
bV9pZHg7CiAJdWludDMyX3QgaSA9IDA7CiAJdWludDMyX3QgcmV0cmllcyA9IDUwMDAwOwogCiAJ
c2NyYXRjaF9yZWcwID0gYWRldi0+cm1taW8gKyAoYWRldi0+cmVnX29mZnNldFtHQ19IV0lQXVsw
XVttbVNDUkFUQ0hfUkVHMF9CQVNFX0lEWF0gKyBtbVNDUkFUQ0hfUkVHMCkqNDsKIAlzY3JhdGNo
X3JlZzEgPSBhZGV2LT5ybW1pbyArIChhZGV2LT5yZWdfb2Zmc2V0W0dDX0hXSVBdWzBdW21tU0NS
QVRDSF9SRUcxX0JBU0VfSURYXSArIG1tU0NSQVRDSF9SRUcxKSo0OwotCXNjcmF0Y2hfcmVnMiA9
IGFkZXYtPnJtbWlvICsgKGFkZXYtPnJlZ19vZmZzZXRbR0NfSFdJUF1bMF1bbW1TQ1JBVENIX1JF
RzFfQkFTRV9JRFhdICsgbW1TQ1JBVENIX1JFRzIpKjQ7Ci0Jc2NyYXRjaF9yZWczID0gYWRldi0+
cm1taW8gKyAoYWRldi0+cmVnX29mZnNldFtHQ19IV0lQXVswXVttbVNDUkFUQ0hfUkVHMV9CQVNF
X0lEWF0gKyBtbVNDUkFUQ0hfUkVHMykqNDsKIAlzcGFyZV9pbnQgPSBhZGV2LT5ybW1pbyArIChh
ZGV2LT5yZWdfb2Zmc2V0W0dDX0hXSVBdWzBdW21tUkxDX1NQQVJFX0lOVF9CQVNFX0lEWF0gKyBt
bVJMQ19TUEFSRV9JTlQpKjQ7CiAKLQlncmJtX2NudGwgPSBhZGV2LT5yZWdfb2Zmc2V0W0dDX0hX
SVBdWzBdW21tR1JCTV9HRlhfQ05UTF9CQVNFX0lEWF0gKyBtbUdSQk1fR0ZYX0NOVEw7Ci0JZ3Ji
bV9pZHggPSBhZGV2LT5yZWdfb2Zmc2V0W0dDX0hXSVBdWzBdW21tR1JCTV9HRlhfSU5ERVhfQkFT
RV9JRFhdICsgbW1HUkJNX0dGWF9JTkRFWDsKLQogCWlmIChhbWRncHVfc3Jpb3ZfcnVudGltZShh
ZGV2KSkgewogCQlwcl9lcnIoInNob3VsZG4ndCBjYWxsIHJsY2cgd3JpdGUgcmVnaXN0ZXIgZHVy
aW5nIHJ1bnRpbWVcbiIpOwogCQlyZXR1cm47Ci0tIAoyLjI1LjEKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
