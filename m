Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 719552B1C37
	for <lists+dri-devel@lfdr.de>; Fri, 13 Nov 2020 14:50:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3A2B6E4EA;
	Fri, 13 Nov 2020 13:50:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1B2A6E4EC
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Nov 2020 13:50:02 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id 33so9980938wrl.7
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Nov 2020 05:50:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=z4Rt5MfpdBDV0pCvJqA/7OOspni5CCJQuMFleU8qAsI=;
 b=N+zM6zcZSVFZCdJrsj9mEKmy9LZp5xIJvVdJJOafLItXmWclcO1seEQot59X2vEN+w
 bSSFvnDESI+BXkh18u4frFboxNp/Zsh+WDRUEnVccULFIUmPkdRnIqGkBl8cWCRs7FZ0
 NIZoh5uDPA5xR8R0TpAZDiJeGdaHeoOs6ny1ukNzxgV8YtJL7uaG0VJWfzf56e6qYWUc
 xuPAfqt3r5t9ltpEXF8RfhRyDn65i/O6VCpZmvQSiCxiLVanxYpfxCk7th1SV9qhR1mA
 5vwX900qX5B5BGhC1qN/gvuOyJQnV/JkcIHm97z97SOCx/wejQBjzrUiLbQ93PyAjUIb
 WtSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=z4Rt5MfpdBDV0pCvJqA/7OOspni5CCJQuMFleU8qAsI=;
 b=N60/7lhCKicV6K/sLocnqP6aFg2zvqkzdkpyeHvx3wkr7cBTNv+aHrucOIUQ0f7QVC
 eM3lD//XBIu/uIxNAjb295d45HMWew8rK+0Ty/iqpGZydZfUOeNYgrQhLRG8GMCmpz/0
 Ie416mqM/qe1CDK18M2DyDZQstqBMuB3k6PoSW/Uoj0hHDI2XZz5W5o7Ei040xNcdl/s
 d+9IDW+eZ1B7GowqTVaKZ15JKuWE3TxYmH6KtSHdRwsDcCpuNo3vXWYuXW0y1aF+CrKt
 EVwNMM7P1ilB20k3oyN9btNFUKpIRQPtX7cyMPsjHvO2uP1IvuanwMZm748VlIr0k5XV
 DJ5A==
X-Gm-Message-State: AOAM530JEjZYvGy5JPZgQWEfcsDmS6tMt3wFdqVFGHZgkLHQW0hZMCQS
 lQHKTxkvlTX+hnDYjrOYJTz0JA==
X-Google-Smtp-Source: ABdhPJx0smt20aVTrHVG68Hi6o1SogLHhzsaE/8xGQk5oruEnBKEdMWr2G0xpdZpuag2G6RsfPRBoA==
X-Received: by 2002:adf:ce87:: with SMTP id r7mr3568696wrn.212.1605275401516; 
 Fri, 13 Nov 2020 05:50:01 -0800 (PST)
Received: from dell.default ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id t11sm4561614wrm.8.2020.11.13.05.50.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Nov 2020 05:50:00 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 16/40] drm/amd/amdgpu/amdgpu_sync: Fix misnamed,
 missing and extra param descriptions
Date: Fri, 13 Nov 2020 13:49:14 +0000
Message-Id: <20201113134938.4004947-17-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201113134938.4004947-1-lee.jones@linaro.org>
References: <20201113134938.4004947-1-lee.jones@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, Felix Kuehling <Felix.Kuehling@amd.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3N5bmMuYzo4Njogd2FybmluZzogRnVuY3Rpb24g
cGFyYW1ldGVyIG9yIG1lbWJlciAnZicgbm90IGRlc2NyaWJlZCBpbiAnYW1kZ3B1X3N5bmNfZ2V0
X293bmVyJwogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3N5bmMuYzo4Njogd2Fy
bmluZzogRXhjZXNzIGZ1bmN0aW9uIHBhcmFtZXRlciAnZmVuY2UnIGRlc2NyaXB0aW9uIGluICdh
bWRncHVfc3luY19nZXRfb3duZXInCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
c3luYy5jOjE4Mjogd2FybmluZzogRXhjZXNzIGZ1bmN0aW9uIHBhcmFtZXRlciAnYWRldicgZGVz
Y3JpcHRpb24gaW4gJ2FtZGdwdV9zeW5jX3ZtX2ZlbmNlJwogZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X3N5bmMuYzoyMDM6IHdhcm5pbmc6IEZ1bmN0aW9uIHBhcmFtZXRlciBvciBt
ZW1iZXIgJ2FkZXYnIG5vdCBkZXNjcmliZWQgaW4gJ2FtZGdwdV9zeW5jX3Jlc3YnCgpDYzogQWxl
eCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgpDYzogIkNocmlzdGlhbiBLw7Zu
aWciIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+CkNjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRA
bGludXguaWU+CkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+CkNjOiBTdW1pdCBT
ZW13YWwgPHN1bWl0LnNlbXdhbEBsaW5hcm8ub3JnPgpDYzogRmVsaXggS3VlaGxpbmcgPEZlbGl4
Lkt1ZWhsaW5nQGFtZC5jb20+CkNjOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpDYzog
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpDYzogbGludXgtbWVkaWFAdmdlci5rZXJu
ZWwub3JnCkNjOiBsaW5hcm8tbW0tc2lnQGxpc3RzLmxpbmFyby5vcmcKU2lnbmVkLW9mZi1ieTog
TGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfc3luYy5jIHwgNCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRp
b25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV9zeW5jLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
c3luYy5jCmluZGV4IDhlYTZjNDk1MjllN2QuLjRlNTU4NjMyYTVkMmIgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9zeW5jLmMKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3N5bmMuYwpAQCAtNzgsNyArNzgsNyBAQCBzdGF0aWMgYm9v
bCBhbWRncHVfc3luY19zYW1lX2RldihzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKIC8qKgog
ICogYW1kZ3B1X3N5bmNfZ2V0X293bmVyIC0gZXh0cmFjdCB0aGUgb3duZXIgb2YgYSBmZW5jZQog
ICoKLSAqIEBmZW5jZTogZmVuY2UgZ2V0IHRoZSBvd25lciBmcm9tCisgKiBAZjogZmVuY2UgZ2V0
IHRoZSBvd25lciBmcm9tCiAgKgogICogRXh0cmFjdCB3aG8gb3JpZ2luYWxseSBjcmVhdGVkIHRo
ZSBmZW5jZS4KICAqLwpAQCAtMTcyLDcgKzE3Miw2IEBAIGludCBhbWRncHVfc3luY19mZW5jZShz
dHJ1Y3QgYW1kZ3B1X3N5bmMgKnN5bmMsIHN0cnVjdCBkbWFfZmVuY2UgKmYpCiAvKioKICAqIGFt
ZGdwdV9zeW5jX3ZtX2ZlbmNlIC0gcmVtZW1iZXIgdG8gc3luYyB0byB0aGlzIFZNIGZlbmNlCiAg
KgotICogQGFkZXY6IGFtZGdwdSBkZXZpY2UKICAqIEBzeW5jOiBzeW5jIG9iamVjdCB0byBhZGQg
ZmVuY2UgdG8KICAqIEBmZW5jZTogdGhlIFZNIGZlbmNlIHRvIGFkZAogICoKQEAgLTE5MCw2ICsx
ODksNyBAQCBpbnQgYW1kZ3B1X3N5bmNfdm1fZmVuY2Uoc3RydWN0IGFtZGdwdV9zeW5jICpzeW5j
LCBzdHJ1Y3QgZG1hX2ZlbmNlICpmZW5jZSkKIC8qKgogICogYW1kZ3B1X3N5bmNfcmVzdiAtIHN5
bmMgdG8gYSByZXNlcnZhdGlvbiBvYmplY3QKICAqCisgKiBAYWRldjogYW1kZ3B1IGRldmljZQog
ICogQHN5bmM6IHN5bmMgb2JqZWN0IHRvIGFkZCBmZW5jZXMgZnJvbSByZXNlcnZhdGlvbiBvYmpl
Y3QgdG8KICAqIEByZXN2OiByZXNlcnZhdGlvbiBvYmplY3Qgd2l0aCBlbWJlZGRlZCBmZW5jZQog
ICogQG1vZGU6IGhvdyBvd25lciBhZmZlY3RzIHdoaWNoIGZlbmNlcyB3ZSBzeW5jIHRvCi0tIAoy
LjI1LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
