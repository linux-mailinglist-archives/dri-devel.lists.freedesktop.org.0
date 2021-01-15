Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A47702F8387
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jan 2021 19:14:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 515016E4B6;
	Fri, 15 Jan 2021 18:14:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5D066E0CA
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 18:14:14 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id e15so1997425wme.0
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 10:14:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eQaT8O9XxcsJgVKni1h0yZPLQZvOBcm7ZwMWNBkJiNk=;
 b=qGaHgBNTx/fmF+7Ais7Ufdt9dmQbs5EWdBbcb57RTL+tsSdSG4dLYqS9cxfLbabOBM
 G7I9mfukkMai6ee/f1y806pY54Bn5Spyy/lJ+0gebGjME7nRSZhwig9Ab/PU/kMiYg76
 mzI5bP3uYAC1BJWW096JxqScQIA4ZkiEe9M5zfTyTJBhTf6QXjhDL+HacORBsYZv3rW3
 FeJ+dEqcpLZUwtxPPWorSiauOcrk5TU9ew+/7T0tr/u7+w/wvoZK5pd85sOSdZdHs3Sf
 1oorr/AZEqW+GB/mtVJMRy6oiv2AWntCCnTYB8gOg/kWttSVJvcSMHlBtdvydQBhyfR1
 eoYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eQaT8O9XxcsJgVKni1h0yZPLQZvOBcm7ZwMWNBkJiNk=;
 b=MqIGdKdvSfm0SiJw7VOEm+dIZXVmtlbSdyPDJOQFPlDytBU3o4WKb9/fubuKWsSpNm
 5TQJ2kVUGF+NUlzE/MSY+sjV9rgFiUWJ6q7PkKgPYc0FZlsTnuRJmh8E1Ot8MnYZZ1C+
 YgmBE3kPaEPeLOZ7FKKA4swhsq4oWQG+8cKagKTSAtKvE9rD5CvT140vAaKv1jndQChX
 cR2XhwOBqeHN4ES+G75PhFI/KE6aUBd0rOZIkAUfTleB2jkwvP/mJIA45lRRP0DUVWgM
 45Mefi+9kiFL/87Aj0uLhRO6WwWmlckEpjTVuHjM0XFUK63MZ3isbivRH2Ji4SKig7IE
 tJUQ==
X-Gm-Message-State: AOAM531HkvIOMM49cHHqagUs/mBA4NsudQjAUUezFnilPnZR+zE7SF71
 x1qIkbZ/kpLRwLG548nLHOomWw==
X-Google-Smtp-Source: ABdhPJxIi81NmcZ3eJUbgrKPBLwd7qw1Vv7O/IAtMiKJeBKW0LklxrjADuKqEt0hUyewqgWE0ZqQ8g==
X-Received: by 2002:a1c:cc14:: with SMTP id h20mr9966183wmb.180.1610734453384; 
 Fri, 15 Jan 2021 10:14:13 -0800 (PST)
Received: from dell.default ([91.110.221.158])
 by smtp.gmail.com with ESMTPSA id j2sm16123484wrh.78.2021.01.15.10.14.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 10:14:12 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 39/40] drm/vmwgfx/vmwgfx_cmdbuf_res: Remove unused variable
 'ret'
Date: Fri, 15 Jan 2021 18:13:12 +0000
Message-Id: <20210115181313.3431493-40-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210115181313.3431493-1-lee.jones@linaro.org>
References: <20210115181313.3431493-1-lee.jones@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, Roland Scheidegger <sroland@vmware.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 VMware Graphics <linux-graphics-maintainer@vmware.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfY21kYnVmX3Jlcy5jOiBJbiBmdW5jdGlvbiDigJh2bXdf
Y21kYnVmX3Jlc19yZXZlcnTigJk6CiBkcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9jbWRi
dWZfcmVzLmM6MTYyOjY6IHdhcm5pbmc6IHZhcmlhYmxlIOKAmHJldOKAmSBzZXQgYnV0IG5vdCB1
c2VkIFstV3VudXNlZC1idXQtc2V0LXZhcmlhYmxlXQoKQ2M6IFZNd2FyZSBHcmFwaGljcyA8bGlu
dXgtZ3JhcGhpY3MtbWFpbnRhaW5lckB2bXdhcmUuY29tPgpDYzogUm9sYW5kIFNjaGVpZGVnZ2Vy
IDxzcm9sYW5kQHZtd2FyZS5jb20+CkNjOiBaYWNrIFJ1c2luIDx6YWNrckB2bXdhcmUuY29tPgpD
YzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgpDYzogRGFuaWVsIFZldHRlciA8ZGFu
aWVsQGZmd2xsLmNoPgpDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpTaWduZWQt
b2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgotLS0KIGRyaXZlcnMvZ3B1
L2RybS92bXdnZngvdm13Z2Z4X2NtZGJ1Zl9yZXMuYyB8IDQgKy0tLQogMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS92bXdnZngvdm13Z2Z4X2NtZGJ1Zl9yZXMuYyBiL2RyaXZlcnMvZ3B1L2RybS92bXdnZngv
dm13Z2Z4X2NtZGJ1Zl9yZXMuYwppbmRleCA5MjUwOWZiZjJmZDFkLi5iMjYyZDYxZDgzOWQ1IDEw
MDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9jbWRidWZfcmVzLmMKKysr
IGIvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfY21kYnVmX3Jlcy5jCkBAIC0xNTksNyAr
MTU5LDYgQEAgdm9pZCB2bXdfY21kYnVmX3Jlc19jb21taXQoc3RydWN0IGxpc3RfaGVhZCAqbGlz
dCkKIHZvaWQgdm13X2NtZGJ1Zl9yZXNfcmV2ZXJ0KHN0cnVjdCBsaXN0X2hlYWQgKmxpc3QpCiB7
CiAJc3RydWN0IHZtd19jbWRidWZfcmVzICplbnRyeSwgKm5leHQ7Ci0JaW50IHJldDsKIAogCWxp
c3RfZm9yX2VhY2hfZW50cnlfc2FmZShlbnRyeSwgbmV4dCwgbGlzdCwgaGVhZCkgewogCQlzd2l0
Y2ggKGVudHJ5LT5zdGF0ZSkgewpAQCAtMTY3LDggKzE2Niw3IEBAIHZvaWQgdm13X2NtZGJ1Zl9y
ZXNfcmV2ZXJ0KHN0cnVjdCBsaXN0X2hlYWQgKmxpc3QpCiAJCQl2bXdfY21kYnVmX3Jlc19mcmVl
KGVudHJ5LT5tYW4sIGVudHJ5KTsKIAkJCWJyZWFrOwogCQljYXNlIFZNV19DTURCVUZfUkVTX0RF
TDoKLQkJCXJldCA9IGRybV9odF9pbnNlcnRfaXRlbSgmZW50cnktPm1hbi0+cmVzb3VyY2VzLAot
CQkJCQkJICZlbnRyeS0+aGFzaCk7CisJCQlkcm1faHRfaW5zZXJ0X2l0ZW0oJmVudHJ5LT5tYW4t
PnJlc291cmNlcywgJmVudHJ5LT5oYXNoKTsKIAkJCWxpc3RfZGVsKCZlbnRyeS0+aGVhZCk7CiAJ
CQlsaXN0X2FkZF90YWlsKCZlbnRyeS0+aGVhZCwgJmVudHJ5LT5tYW4tPmxpc3QpOwogCQkJZW50
cnktPnN0YXRlID0gVk1XX0NNREJVRl9SRVNfQ09NTUlUVEVEOwotLSAKMi4yNS4xCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
