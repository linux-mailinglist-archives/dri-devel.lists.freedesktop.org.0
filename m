Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 29D7E2C30E2
	for <lists+dri-devel@lfdr.de>; Tue, 24 Nov 2020 20:44:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 234116E560;
	Tue, 24 Nov 2020 19:44:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB6576E53C
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Nov 2020 19:44:18 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id z7so7731268wrn.3
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Nov 2020 11:44:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FuE5YjSJzJI/M1RwfuDXt/n7B1wD8+1e0nH8PA2AEy4=;
 b=Rx9agVcbDlYfV56teggpfSalWJve64s1Kw/hncpiAqgMm+aBS0xzV7FVdksDeDAxMS
 w4qNTgYOtKMbhHzSZf0GbZUvDGQvQDp7kD6qQ4rEemO/k6ZAeeqDYqcnwFXuBwf9PRr5
 cUIn/3NZs26RM98dauvvAMtXZUrwXq0gSo3HwoZgola+LlDzmPIMm7EiDgjUJnn+J27Z
 +GI/Dj19rZ2ok377NBLKf7l1ChRWRIXgaUF3pxHFnpYBAkqqgxxnjPXrwRvW5Nz8nQLN
 YB0Ulv7R5eN07q87F5Bq/AFjwOJGcspCsh6I8HM01549N+/oNeF4yHumttUL5Tzr2YqZ
 N7mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FuE5YjSJzJI/M1RwfuDXt/n7B1wD8+1e0nH8PA2AEy4=;
 b=dpJKcJowfaUqDwPy6CiH+i7EdfGUsnBEkqpSTVYuIgWh0BSotzQ2XS1y//htHmIOJ8
 UyG551t/juM37ocOGmGwkw0/XFRlxLaOmUpP7dRmpE2F6ZYNmy7mYBxhkroDl5Akf/ng
 TRT+Fkua/Q1Uw5g4lWf+JSOMaQHlWjOfFzHrcMk/J0DM5nyqMe1w/koTy5VO4CgQL7Rj
 sedSKkBOFlhjW1idPie3BWfsbHfloQCW8JNSvanRKhHWLVd5tREGkRxOVXBJTf8CCTiS
 8GhJ6w7r1GkqgTQwd1ghA01mI/OwYZxTrGbgCB9TYk83SE9j55QddT7VWUz7IotkdKR2
 P2/w==
X-Gm-Message-State: AOAM532xZx3SzjsgsUerzm69ioXbvb58RNaXNhBrr0HbGko+15eh9YHm
 eTwZM5r1PXX7+G7VnL206SB0kA==
X-Google-Smtp-Source: ABdhPJwDCyWQlpk/Iszt8GAowASRp1u6blUya1UNc8Kau6+NzQpXYMjrYXwTnerj7k4huU/Yw4IQUA==
X-Received: by 2002:adf:bd86:: with SMTP id l6mr65170wrh.205.1606247057491;
 Tue, 24 Nov 2020 11:44:17 -0800 (PST)
Received: from dell.default ([91.110.221.235])
 by smtp.gmail.com with ESMTPSA id d134sm200511wmd.8.2020.11.24.11.44.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Nov 2020 11:44:16 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 15/40] drm/amd/amdgpu/gfx_v8_0: Functions must follow directly
 after their headers
Date: Tue, 24 Nov 2020 19:37:59 +0000
Message-Id: <20201124193824.1118741-16-lee.jones@linaro.org>
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
cy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y4XzAuYzozNjk4OiB3YXJuaW5nOiBFeGNlc3MgZnVu
Y3Rpb24gcGFyYW1ldGVyICdhZGV2JyBkZXNjcmlwdGlvbiBpbiAnREVGQVVMVF9TSF9NRU1fQkFT
RVMnCgpDYzogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgpDYzogIkNo
cmlzdGlhbiBLw7ZuaWciIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+CkNjOiBEYXZpZCBBaXJs
aWUgPGFpcmxpZWRAbGludXguaWU+CkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+
CkNjOiBTdW1pdCBTZW13YWwgPHN1bWl0LnNlbXdhbEBsaW5hcm8ub3JnPgpDYzogYW1kLWdmeEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
Q2M6IGxpbnV4LW1lZGlhQHZnZXIua2VybmVsLm9yZwpDYzogbGluYXJvLW1tLXNpZ0BsaXN0cy5s
aW5hcm8ub3JnClNpZ25lZC1vZmYtYnk6IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+
Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y4XzAuYyB8IDIgKy0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92OF8wLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9nZnhfdjhfMC5jCmluZGV4IDVlNmQxNWY0NDU2MGEuLjlhOTA1NTMxZjgzNzcgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92OF8wLmMKKysrIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y4XzAuYwpAQCAtMzY4Nyw2ICszNjg3LDcgQEAg
c3RhdGljIHZvaWQgZ2Z4X3Y4XzBfc2V0dXBfcmIoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYp
CiAJbXV0ZXhfdW5sb2NrKCZhZGV2LT5ncmJtX2lkeF9tdXRleCk7CiB9CiAKKyNkZWZpbmUgREVG
QVVMVF9TSF9NRU1fQkFTRVMJKDB4NjAwMCkKIC8qKgogICogZ2Z4X3Y4XzBfaW5pdF9jb21wdXRl
X3ZtaWQgLSBnYXJ0IGVuYWJsZQogICoKQEAgLTM2OTUsNyArMzY5Niw2IEBAIHN0YXRpYyB2b2lk
IGdmeF92OF8wX3NldHVwX3JiKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQogICogSW5pdGlh
bGl6ZSBjb21wdXRlIHZtaWQgc2hfbWVtIHJlZ2lzdGVycwogICoKICAqLwotI2RlZmluZSBERUZB
VUxUX1NIX01FTV9CQVNFUwkoMHg2MDAwKQogc3RhdGljIHZvaWQgZ2Z4X3Y4XzBfaW5pdF9jb21w
dXRlX3ZtaWQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiB7CiAJaW50IGk7Ci0tIAoyLjI1
LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
