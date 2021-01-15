Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BAF12F8372
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jan 2021 19:14:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BAAD6E487;
	Fri, 15 Jan 2021 18:13:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E00D76E487
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 18:13:45 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id h17so8029052wmq.1
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 10:13:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1yMxGlPEfyzvXa2UJQqEx7ekNRCoKDflK8zni2fkeUs=;
 b=Si13WZnjdkXdJogyfDIMI1YTp5PsWFLMpQMp5+G1UHdeypDKUAtv7h1aQEV+fImecK
 ivSNlCJIoBYyFxMYvF1bmuFw1vIxMuj4SR40JJeDLZlAs6g64j6LnFt4NvHwvcgEXMOW
 ENqxiXMpECNBXjjUQGYMobSUGV+OaIWcCeoOlBdlJpAxvfKp84rV1MLqS6vr6wlsWtm7
 PejC1um/TxCI8YN3jCuYMgatzgnru0/ZU+o1W4uLWLXLXZKw/076lH/ZMRK7Kw4kbqY8
 Afdk/FKH7TM76838J/DvbxysuQMyJrWeU70SfyL19qyQhEy0/8EKcpxgfbdtvNqDOrL9
 F5bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1yMxGlPEfyzvXa2UJQqEx7ekNRCoKDflK8zni2fkeUs=;
 b=U6SEQBrv+vXe9NdmxZK90OwywdjefdD1WFNsejJ4jMiiu0OCIHdLW1SzfApwvsIf6u
 OoKkmUD78//+bpg0JaKke3q6hTyOBxlS3hNHBnJJgYfjaGdoEDIQZ0WGqPGlGcUCdEHQ
 fDLI+PbExe6vnOhiZw6IhFlupBsISvKVhZdr+85YHn9KG7udY04Ckk5wsOQJLspcyAQa
 ZsHIKzjZIY40P+8jz0YqyXy+Oj7CdVkrO6y5hzOJTm2PFAO10GZEaHtgPR4lQMkW0yoC
 tbe4gKNTmsmizdgcZo85AnKdI8M21Vk9vj3DpFbrJy3ulr9zX9kjHqErkk7jaQAmjgwo
 xpDg==
X-Gm-Message-State: AOAM532gF1t2lOKLvvjyJI8BWuvTuljs03LZ2SQXCsGjvAReDss+yUQV
 lH9XkhsmnNDJWPIm6pDFkEzoaA==
X-Google-Smtp-Source: ABdhPJwvrXbHb+AjgLmUtqHU2FArfA74YAGB6r+5CFCOegLEs12lu6XvOUjwl+crbP8tjV88Jwb4gg==
X-Received: by 2002:a1c:68d5:: with SMTP id d204mr9861675wmc.178.1610734424527; 
 Fri, 15 Jan 2021 10:13:44 -0800 (PST)
Received: from dell.default ([91.110.221.158])
 by smtp.gmail.com with ESMTPSA id j2sm16123484wrh.78.2021.01.15.10.13.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 10:13:43 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 18/40] drm/gma500/mmu: Make local function
 'psb_mmu_pt_alloc_map_lock()' static
Date: Fri, 15 Jan 2021 18:12:51 +0000
Message-Id: <20210115181313.3431493-19-lee.jones@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL2dtYTUwMC9tbXUuYzozMTY6MjA6IHdhcm5pbmc6IG5vIHByZXZpb3VzIHByb3Rv
dHlwZSBmb3Ig4oCYcHNiX21tdV9wdF9hbGxvY19tYXBfbG9ja+KAmSBbLVdtaXNzaW5nLXByb3Rv
dHlwZXNdCgpDYzogUGF0cmlrIEpha29ic3NvbiA8cGF0cmlrLnIuamFrb2Jzc29uQGdtYWlsLmNv
bT4KQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KQ2M6IERhbmllbCBWZXR0ZXIg
PGRhbmllbEBmZndsbC5jaD4KQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKU2ln
bmVkLW9mZi1ieTogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4KLS0tCiBkcml2ZXJz
L2dwdS9kcm0vZ21hNTAwL21tdS5jIHwgNCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRp
b25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9nbWE1
MDAvbW11LmMgYi9kcml2ZXJzL2dwdS9kcm0vZ21hNTAwL21tdS5jCmluZGV4IDUwNTA0NGM5YTY3
MzIuLjQyYjUzYzAxYjc5ZjQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9nbWE1MDAvbW11
LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2dtYTUwMC9tbXUuYwpAQCAtMzEzLDggKzMxMyw4IEBA
IHN0YXRpYyBzdHJ1Y3QgcHNiX21tdV9wdCAqcHNiX21tdV9hbGxvY19wdChzdHJ1Y3QgcHNiX21t
dV9wZCAqcGQpCiAJcmV0dXJuIHB0OwogfQogCi1zdHJ1Y3QgcHNiX21tdV9wdCAqcHNiX21tdV9w
dF9hbGxvY19tYXBfbG9jayhzdHJ1Y3QgcHNiX21tdV9wZCAqcGQsCi0JCQkJCSAgICAgdW5zaWdu
ZWQgbG9uZyBhZGRyKQorc3RhdGljIHN0cnVjdCBwc2JfbW11X3B0ICpwc2JfbW11X3B0X2FsbG9j
X21hcF9sb2NrKHN0cnVjdCBwc2JfbW11X3BkICpwZCwKKwkJCQkJCSAgICB1bnNpZ25lZCBsb25n
IGFkZHIpCiB7CiAJdWludDMyX3QgaW5kZXggPSBwc2JfbW11X3BkX2luZGV4KGFkZHIpOwogCXN0
cnVjdCBwc2JfbW11X3B0ICpwdDsKLS0gCjIuMjUuMQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVsCg==
