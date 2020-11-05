Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66FE12A8176
	for <lists+dri-devel@lfdr.de>; Thu,  5 Nov 2020 15:52:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C03C6ED9D;
	Thu,  5 Nov 2020 14:52:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26C0C6ED94
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Nov 2020 14:52:27 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id d142so1867761wmd.4
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Nov 2020 06:52:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CpDMS+RHHV1rRQnMHYAjcZzCg3wY/F0STHOFtNum/rU=;
 b=QpushnzWopYXqm5YWwBvN6+FQaZHUZjNp1tHAUM5Ag2u5db4kXa+UJ3Z4yl/TOmdD1
 7T39shHAWcJiQRYKkCkciEbSRLy+kOmviXG4DtQVSWEgKSXKv6NFk9JKADhbaGGEZJAA
 gOR7hTYFkaC0n1XYj/O1NWU4cb3MOSx4JPotMGNGBBBgUy9K2NK2k9ZFVySebV+iywE1
 ekymQgI26V3+xOhGpSd0IXPly/an+QOpGzOAbVFqI8PeMMkoBWPrSIQ4gtFJRQR3c7NR
 DL62I58XDWWnnY0xsrxuDBjVmUGHkMYUoJYEyhvi3yBjSU1fQmaNCGo139n4SjKDzreO
 iqyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CpDMS+RHHV1rRQnMHYAjcZzCg3wY/F0STHOFtNum/rU=;
 b=dHvcm0iuGBGUEWrA1zmVlXQfJoM9PVoZdewbijQCmet3i2qGmR8q2NRF5w/uAa1Jdz
 ny0jy1mfgMvcDlJoj1i5o3eSswgO36FtnewszAvEaDITBpujRCxtmDnwQQxY6eUTzBpb
 UdMqNMarGlF8QOBitryydicn7J8gCo77qr6BjQm5Vg/NVsc6wCDV+dRynLcyoLmKgqo/
 QYRL/Db+Re6OdJTcZeAabykn3Pz6Sgop/yKuaBRtrZJsCjqMolaTKWWdNv0WPMDzXgId
 ZzKtBu12cjlm10gP+Hi+pB7zZXNllNsV0rhecRN97sRRJzBGfojAkvi5LQDFP1KdDk9X
 NyGg==
X-Gm-Message-State: AOAM5318wpfzTe8Y50eCwYPonbttSjuwfpqyj4WtJgsMQsFGXKbj60BJ
 N1t+FKFEaKDr06yoyGw3oiiUHQ==
X-Google-Smtp-Source: ABdhPJyvqYkwE2uGejo6SM8lDSIcZCLWdzpd2TkAJxJyZGijBu5DUEM0XrGnnJJ+a8vBsZQGeJGfjw==
X-Received: by 2002:a05:600c:22d3:: with SMTP id
 19mr3311106wmg.161.1604587945893; 
 Thu, 05 Nov 2020 06:52:25 -0800 (PST)
Received: from dell.default ([91.110.221.242])
 by smtp.gmail.com with ESMTPSA id f5sm2631243wmh.16.2020.11.05.06.52.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2020 06:52:25 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 09/19] gpu: drm: selftests: test-drm_framebuffer: Remove set
 but unused variable 'fb'
Date: Thu,  5 Nov 2020 14:45:07 +0000
Message-Id: <20201105144517.1826692-10-lee.jones@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL3NlbGZ0ZXN0cy90ZXN0LWRybV9mcmFtZWJ1ZmZlci5jOiBJbiBmdW5jdGlvbiDi
gJhleGVjdXRlX2RybV9tb2RlX2ZiX2NtZDLigJk6CiBkcml2ZXJzL2dwdS9kcm0vc2VsZnRlc3Rz
L3Rlc3QtZHJtX2ZyYW1lYnVmZmVyLmM6MzMzOjI2OiB3YXJuaW5nOiB2YXJpYWJsZSDigJhmYuKA
mSBzZXQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC1idXQtc2V0LXZhcmlhYmxlXQoKQ2M6IERhdmlk
IEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZnds
bC5jaD4KQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKU2lnbmVkLW9mZi1ieTog
TGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vc2Vs
ZnRlc3RzL3Rlc3QtZHJtX2ZyYW1lYnVmZmVyLmMgfCAzICstLQogMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9zZWxmdGVzdHMvdGVzdC1kcm1fZnJhbWVidWZmZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS9zZWxm
dGVzdHMvdGVzdC1kcm1fZnJhbWVidWZmZXIuYwppbmRleCAyZDI5ZWE2ZjkyZTJhLi43ODlmMjI3
NzNkYmM5IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vc2VsZnRlc3RzL3Rlc3QtZHJtX2Zy
YW1lYnVmZmVyLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3NlbGZ0ZXN0cy90ZXN0LWRybV9mcmFt
ZWJ1ZmZlci5jCkBAIC0zMzAsMTAgKzMzMCw5IEBAIHN0YXRpYyBzdHJ1Y3QgZHJtX2RldmljZSBt
b2NrX2RybV9kZXZpY2UgPSB7CiBzdGF0aWMgaW50IGV4ZWN1dGVfZHJtX21vZGVfZmJfY21kMihz
dHJ1Y3QgZHJtX21vZGVfZmJfY21kMiAqcikKIHsKIAlpbnQgYnVmZmVyX2NyZWF0ZWQgPSAwOwot
CXN0cnVjdCBkcm1fZnJhbWVidWZmZXIgKmZiOwogCiAJbW9ja19kcm1fZGV2aWNlLmRldl9wcml2
YXRlID0gJmJ1ZmZlcl9jcmVhdGVkOwotCWZiID0gZHJtX2ludGVybmFsX2ZyYW1lYnVmZmVyX2Ny
ZWF0ZSgmbW9ja19kcm1fZGV2aWNlLCByLCBOVUxMKTsKKwlkcm1faW50ZXJuYWxfZnJhbWVidWZm
ZXJfY3JlYXRlKCZtb2NrX2RybV9kZXZpY2UsIHIsIE5VTEwpOwogCXJldHVybiBidWZmZXJfY3Jl
YXRlZDsKIH0KIAotLSAKMi4yNS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWwK
