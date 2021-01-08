Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E73562EF8C7
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jan 2021 21:16:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 670466E8EA;
	Fri,  8 Jan 2021 20:16:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3D436E8EA
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jan 2021 20:16:03 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id g25so7364846wmh.1
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Jan 2021 12:16:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rP7mCQegZrZliKSNOE9HhwYeP/t/E6ng+qbUeSsHO9Y=;
 b=homuTJBMLHVxCdzu4xZUN8TgcpEBe07I94kMyeGYMSl7Qgq1qQUc6vh772KKH/7CE4
 jZX7owmzqV8sN9KKvFWA6BrOu0vo3LI9MCr8+l9YCM6aXjuZAs/zkym4Z1S77ihJxS84
 Ly21nzv+rhn4a5PZP837gJI+vKJCphVrU2OMYvLeNravR3zu74QNKK94KT4dLF+W/9dp
 +WBS/y3XlVzEsOYfoAWk69kPFPH+33qM/VxzJsen0OcLde4/9SYtQjKIrV+Ox+nUTgRG
 if8rEJarsSzEx3PAfevqPkBc+Cu5/tDIYkHh7o3JbqTg0vfC5Qqw7CvmQqG98S9qoPKU
 L50A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rP7mCQegZrZliKSNOE9HhwYeP/t/E6ng+qbUeSsHO9Y=;
 b=cEY8JhJKi8HeXfQEQp2ELnAAoNAW08BGPnqMU7f8tAEf6t06P+OQgTjkW6Zj2g2mWz
 brYjX0sfe0rA5X1ewF6ZWQ8KqLvbJrfJ9ZFv30kFx+QnioyMFFgJNxV5CPEh7lulsTiK
 SSOhbf+JKcvP5gnB/tDmaG4u095i/HlANUSyaYbmKziznmdthCFf4qhSAmQH3gLNwcaR
 pHx2ggvUYtZurfJ3Hwnp+GQquljfSYgPbIgK+PsDef4JLHsNrYYp+rx8UZDhta86tsq7
 3zqeQFs05WoII6+Pouh7vglB4rsR/Ac78NKLtgQ9ygZsymtsbQrn8yx8lCq9TFy3IYgY
 xwIg==
X-Gm-Message-State: AOAM533j06E69rSZDErNBEtDmj1vSrPxAJSfZ0gAApDvcdoupP0YndFg
 NVms3MwP4M1tgHO5YqDHx2DykA==
X-Google-Smtp-Source: ABdhPJzStlWtL4Clq/FRpULdR+OZSgHo1I1acWGIRRA/RpNAf6ipLFu7crmMKMXh2Ch4tl65qHs7ZA==
X-Received: by 2002:a1c:bc41:: with SMTP id m62mr4606670wmf.46.1610136962529; 
 Fri, 08 Jan 2021 12:16:02 -0800 (PST)
Received: from dell.default ([91.110.221.229])
 by smtp.gmail.com with ESMTPSA id l8sm15598671wrb.73.2021.01.08.12.16.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jan 2021 12:16:01 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 40/40] drm/amd/display/dc/gpio/hw_factory: Delete unused
 function 'dal_hw_factory_destroy'
Date: Fri,  8 Jan 2021 20:14:57 +0000
Message-Id: <20210108201457.3078600-41-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210108201457.3078600-1-lee.jones@linaro.org>
References: <20210108201457.3078600-1-lee.jones@linaro.org>
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
Cc: Leo Li <sunpeng.li@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9kYy9ncGlvL2h3X2ZhY3RvcnkuYzoxMjM6
Njogd2FybmluZzogbm8gcHJldmlvdXMgcHJvdG90eXBlIGZvciDigJhkYWxfaHdfZmFjdG9yeV9k
ZXN0cm954oCZIFstV21pc3NpbmctcHJvdG90eXBlc10KCkNjOiBIYXJyeSBXZW50bGFuZCA8aGFy
cnkud2VudGxhbmRAYW1kLmNvbT4KQ2M6IExlbyBMaSA8c3VucGVuZy5saUBhbWQuY29tPgpDYzog
QWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgpDYzogIkNocmlzdGlhbiBL
w7ZuaWciIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+CkNjOiBEYXZpZCBBaXJsaWUgPGFpcmxp
ZWRAbGludXguaWU+CkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+CkNjOiBhbWQt
Z2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpTaWduZWQtb2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgotLS0K
IGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9ncGlvL2h3X2ZhY3RvcnkuYyB8IDE0IC0t
LS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2dwaW8vaHdfZmFjdG9yeS5jIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2dwaW8vaHdfZmFjdG9yeS5jCmluZGV4IGRhNzNi
ZmIzY2FjZDAuLjkyYzY1ZDJmYTdkNzEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
ZGlzcGxheS9kYy9ncGlvL2h3X2ZhY3RvcnkuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rp
c3BsYXkvZGMvZ3Bpby9od19mYWN0b3J5LmMKQEAgLTExOSwxNyArMTE5LDMgQEAgYm9vbCBkYWxf
aHdfZmFjdG9yeV9pbml0KAogCQlyZXR1cm4gZmFsc2U7CiAJfQogfQotCi12b2lkIGRhbF9od19m
YWN0b3J5X2Rlc3Ryb3koCi0Jc3RydWN0IGRjX2NvbnRleHQgKmN0eCwKLQlzdHJ1Y3QgaHdfZmFj
dG9yeSAqKmZhY3RvcnkpCi17Ci0JaWYgKCFmYWN0b3J5IHx8ICEqZmFjdG9yeSkgewotCQlCUkVB
S19UT19ERUJVR0dFUigpOwotCQlyZXR1cm47Ci0JfQotCi0Ja2ZyZWUoKmZhY3RvcnkpOwotCi0J
KmZhY3RvcnkgPSBOVUxMOwotfQotLSAKMi4yNS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWwK
