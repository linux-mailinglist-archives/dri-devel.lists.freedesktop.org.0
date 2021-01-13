Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1077F2F4D90
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jan 2021 15:50:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09A9C6EA5A;
	Wed, 13 Jan 2021 14:50:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BF2A6EA5A
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 14:50:36 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id c124so1837356wma.5
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 06:50:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hcCYDUMcS26jDuM5+gRx+fiSHXa/31pKXfkIX189fZc=;
 b=WKJOrwZ97W06sGNe/8643fsBAhUrIy3pw+p8/Z4nnVsXP2eywnUTF/fuu6aqQ7IqnV
 6bqyAhBD4abY+s60Rl5IZigMaAmPXz8Uw2c1DpBJK4PQxmaJxmh9tA+R2LxW1BhiiZTk
 yiuf3i9VtB5gHvfNiYKnHs1w8ffM0OURr8SS6DOOcwdI/uLEYMkd3eiV0TcMkLorYNz2
 63JkGhf4cM01/SzrmAxd+HQf+HPnQA/eQoOZlRp6Lb9kAQGSlV4OiRy91CNfm/Ap5ieG
 bufuyVkbrh7vj7Mtxphu1YXK2MYICuU0icBn09Vb30KwCkk8oOWznjZavOmb2Rr1w40u
 CRDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hcCYDUMcS26jDuM5+gRx+fiSHXa/31pKXfkIX189fZc=;
 b=kzWIEhcvNznKrlmxVhVHqvkJp3bRAC9/F5K6S9zcuUTN/E0TsD9qrSemOSX0axFLjh
 eeckPHDsU5TQrOFD1G29W8qs7o1lxoEOtD+Ki+zcnPr/GpVjZAqdd686RNa/3L1Lk9WV
 8At89pno3GffwXyVbXRlpgxz/zZRXPG2esF/a1SXIlRlnvuUhEa0KvfmJfTqmaM47b+9
 OvRoV7ZhZ5KrkR2ZGgAYMbe8zoz/7znnrrIjai2/r8gQ00i0RGFF+haeuh7/9SsKEgQs
 ohRr1vNi8TZOPKQWm2wnBb5xSlxMpDpgVOdQI8iaIlFvDBeKeUZ9DVNzO417xd4s6G8n
 3SLw==
X-Gm-Message-State: AOAM530lxeIxn0kYJvSYgxQi13IUZsIbVK2AOSQOKzaNWNCy+e7jOEgD
 XVCKMttUJKSQl08A9HTCSwy8/Q==
X-Google-Smtp-Source: ABdhPJxI/06Eq2Rl5+qCibE+uAUvKG7ngE/AQ/AKyFAKVjTjbxsN6HN/O2nM7Z2/XWrJTZE0EwxiWQ==
X-Received: by 2002:a1c:2d92:: with SMTP id t140mr2585614wmt.114.1610549434915; 
 Wed, 13 Jan 2021 06:50:34 -0800 (PST)
Received: from dell.default ([91.110.221.229])
 by smtp.gmail.com with ESMTPSA id t188sm3273433wmf.9.2021.01.13.06.50.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jan 2021 06:50:34 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 13/31] video: fbdev: nvidia: nv_setup: Remove a couple of
 unused 'tmp' variables
Date: Wed, 13 Jan 2021 14:49:51 +0000
Message-Id: <20210113145009.1272040-14-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210113145009.1272040-1-lee.jones@linaro.org>
References: <20210113145009.1272040-1-lee.jones@linaro.org>
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
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy92aWRlby9mYmRldi9udmlkaWEvbnZfc2V0dXAuYzogSW4gZnVuY3Rpb24g4oCYTlZXcml0ZUF0
dHLigJk6CiBkcml2ZXJzL3ZpZGVvL2ZiZGV2L252aWRpYS9udl9zZXR1cC5jOjkyOjE0OiB3YXJu
aW5nOiB2YXJpYWJsZSDigJh0bXDigJkgc2V0IGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQtYnV0LXNl
dC12YXJpYWJsZV0KIGRyaXZlcnMvdmlkZW8vZmJkZXYvbnZpZGlhL252X3NldHVwLmM6IEluIGZ1
bmN0aW9uIOKAmE5WUmVhZEF0dHLigJk6CiBkcml2ZXJzL3ZpZGVvL2ZiZGV2L252aWRpYS9udl9z
ZXR1cC5jOjEwNDoxNDogd2FybmluZzogdmFyaWFibGUg4oCYdG1w4oCZIHNldCBidXQgbm90IHVz
ZWQgWy1XdW51c2VkLWJ1dC1zZXQtdmFyaWFibGVdCgpDYzogQW50b25pbm8gRGFwbGFzIDxhZGFw
bGFzQGdtYWlsLmNvbT4KQ2M6IGxpbnV4LWZiZGV2QHZnZXIua2VybmVsLm9yZwpDYzogZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpTaWduZWQtb2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZS5q
b25lc0BsaW5hcm8ub3JnPgotLS0KIGRyaXZlcnMvdmlkZW8vZmJkZXYvbnZpZGlhL252X3NldHVw
LmMgfCA4ICsrLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA2IGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmlkZW8vZmJkZXYvbnZpZGlhL252X3NldHVw
LmMgYi9kcml2ZXJzL3ZpZGVvL2ZiZGV2L252aWRpYS9udl9zZXR1cC5jCmluZGV4IDJmYTY4NjY5
NjEzYWYuLjQ3YTk2YTA2NmY5OTggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvdmlkZW8vZmJkZXYvbnZp
ZGlhL252X3NldHVwLmMKKysrIGIvZHJpdmVycy92aWRlby9mYmRldi9udmlkaWEvbnZfc2V0dXAu
YwpAQCAtODksOSArODksNyBAQCB1OCBOVlJlYWRTZXEoc3RydWN0IG52aWRpYV9wYXIgKnBhciwg
dTggaW5kZXgpCiB9CiB2b2lkIE5WV3JpdGVBdHRyKHN0cnVjdCBudmlkaWFfcGFyICpwYXIsIHU4
IGluZGV4LCB1OCB2YWx1ZSkKIHsKLQl2b2xhdGlsZSB1OCB0bXA7Ci0KLQl0bXAgPSBWR0FfUkQw
OChwYXItPlBDSU8sIHBhci0+SU9CYXNlICsgMHgwYSk7CisJVkdBX1JEMDgocGFyLT5QQ0lPLCBw
YXItPklPQmFzZSArIDB4MGEpOwogCWlmIChwYXItPnBhbGV0dGVFbmFibGVkKQogCQlpbmRleCAm
PSB+MHgyMDsKIAllbHNlCkBAIC0xMDEsOSArOTksNyBAQCB2b2lkIE5WV3JpdGVBdHRyKHN0cnVj
dCBudmlkaWFfcGFyICpwYXIsIHU4IGluZGV4LCB1OCB2YWx1ZSkKIH0KIHU4IE5WUmVhZEF0dHIo
c3RydWN0IG52aWRpYV9wYXIgKnBhciwgdTggaW5kZXgpCiB7Ci0Jdm9sYXRpbGUgdTggdG1wOwot
Ci0JdG1wID0gVkdBX1JEMDgocGFyLT5QQ0lPLCBwYXItPklPQmFzZSArIDB4MGEpOworCVZHQV9S
RDA4KHBhci0+UENJTywgcGFyLT5JT0Jhc2UgKyAweDBhKTsKIAlpZiAocGFyLT5wYWxldHRlRW5h
YmxlZCkKIAkJaW5kZXggJj0gfjB4MjA7CiAJZWxzZQotLSAKMi4yNS4xCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
