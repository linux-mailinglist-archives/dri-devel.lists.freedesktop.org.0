Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA6612A8171
	for <lists+dri-devel@lfdr.de>; Thu,  5 Nov 2020 15:52:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F52A6ED92;
	Thu,  5 Nov 2020 14:52:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A134D6ED92
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Nov 2020 14:52:23 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id b8so2103716wrn.0
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Nov 2020 06:52:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=B68ULhNIafZ1wW7c1l8pnyj5WZlq4OYRmPHr+DhWUhE=;
 b=y5NLIQDVRqbJUttUWB4r8/ibcZ5Qata4Q2mrbDJBmadOo2DotGPs54R38SqQQOJtK0
 APDTcNF2QLkfRliuF57BWAQCdehDYlb8lsZFwORe8I/gL2fKDdjWxTNYlEnicdU+Tepk
 5OAcbqoeisbVAWkR8/09ao1c1KKTBgYRHdOoAZ2QAAqvarPS1tsfilMWK2a+AlJNuzz0
 +kUncIw/eC9DDBQ60wMblUKDiSVe6X7R5lWE83cQIIuQuIZRnQdyUh3vH+ugoQ+RH7Yn
 MLAgK7S/UR++VibC4t2AYpomfaTwMl4ffyF3maXz3zJHEmlNVS5ukN+72YKOTLdKnzri
 Do6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=B68ULhNIafZ1wW7c1l8pnyj5WZlq4OYRmPHr+DhWUhE=;
 b=QtYc5E7iRSOuJ61kcvRMNbp3M1o6AaLs/XpBvPGJ+js51u/PBrHUAjetC0hf+/nz6y
 KwndxoaFPNEH5ahyybIaREGtDVbZ4nUQpk8uEv1u6lCKeLhrZFVGUF1MRO1DHqGE1ztZ
 yLvkbDjrs5SEVb1u+mVLGjN9cBJ0TPxs8fUgihZ5Ng36ma15yzw+bIZV0TZE5sqe8o9N
 7s4jKdXvrqgGZ0BmqNFbAGsvWHlGUEqF27aeTNEEKF/3e8xJUNxEQnfIo6IYo5E3Dfa8
 bqKLoubh/HL5qEZhBUkJ8SeK2hDXG6bB5t8hGvSiWTZNuAe9v+ta2CLrbpZNm1TIkJoC
 DxOg==
X-Gm-Message-State: AOAM531USMyB/CADuhh4np7D1c9HMXymBnDdnxDSl4rv1IqIVG5O91+G
 yOQlJxKsl+jojpta6W35kF349w==
X-Google-Smtp-Source: ABdhPJygN4kha10hMe+UVXlVwhFEkYq3Wn91ptnkwyJh9gk4hgBLYUpGHf+fN868Iaa7qiNaQGBSZQ==
X-Received: by 2002:a5d:43c6:: with SMTP id v6mr3435853wrr.20.1604587942346;
 Thu, 05 Nov 2020 06:52:22 -0800 (PST)
Received: from dell.default ([91.110.221.242])
 by smtp.gmail.com with ESMTPSA id f5sm2631243wmh.16.2020.11.05.06.52.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2020 06:52:21 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 06/19] gpu: drm: scheduler: sched_main: Provide missing
 description for 'sched' paramter
Date: Thu,  5 Nov 2020 14:45:04 +0000
Message-Id: <20201105144517.1826692-7-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201105144517.1826692-1-lee.jones@linaro.org>
References: <20201105144517.1826692-1-lee.jones@linaro.org>
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
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9tYWluLmM6NzQ6IHdhcm5pbmc6IEZ1bmN0aW9uIHBh
cmFtZXRlciBvciBtZW1iZXIgJ3NjaGVkJyBub3QgZGVzY3JpYmVkIGluICdkcm1fc2NoZWRfcnFf
aW5pdCcKCkNjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+CkNjOiBEYW5pZWwgVmV0
dGVyIDxkYW5pZWxAZmZ3bGwuY2g+CkNjOiBTdW1pdCBTZW13YWwgPHN1bWl0LnNlbXdhbEBsaW5h
cm8ub3JnPgpDYzogIkNocmlzdGlhbiBLw7ZuaWciIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+
CkNjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCkNjOiBsaW51eC1tZWRpYUB2Z2Vy
Lmtlcm5lbC5vcmcKQ2M6IGxpbmFyby1tbS1zaWdAbGlzdHMubGluYXJvLm9yZwpTaWduZWQtb2Zm
LWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2Ry
bS9zY2hlZHVsZXIvc2NoZWRfbWFpbi5jIHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX21haW4u
YyBiL2RyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvc2NoZWRfbWFpbi5jCmluZGV4IDlhMGQ3N2E2
ODAxODAuLmRhMjRjNGU4YjlmYjMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9zY2hlZHVs
ZXIvc2NoZWRfbWFpbi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvc2NoZWRfbWFp
bi5jCkBAIC02NSw2ICs2NSw3IEBAIHN0YXRpYyB2b2lkIGRybV9zY2hlZF9wcm9jZXNzX2pvYihz
dHJ1Y3QgZG1hX2ZlbmNlICpmLCBzdHJ1Y3QgZG1hX2ZlbmNlX2NiICpjYik7CiAvKioKICAqIGRy
bV9zY2hlZF9ycV9pbml0IC0gaW5pdGlhbGl6ZSBhIGdpdmVuIHJ1biBxdWV1ZSBzdHJ1Y3QKICAq
CisgKiBAc2NoZWQ6IHNjaGVkdWxlciBpbnN0YW5jZSB0byBhc3NvY2lhdGUgd2l0aCB0aGlzIHJ1
biBxdWV1ZQogICogQHJxOiBzY2hlZHVsZXIgcnVuIHF1ZXVlCiAgKgogICogSW5pdGlhbGl6ZXMg
YSBzY2hlZHVsZXIgcnVucXVldWUuCi0tIAoyLjI1LjEKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
