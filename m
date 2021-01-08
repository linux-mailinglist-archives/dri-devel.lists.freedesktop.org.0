Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D41382EF8AB
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jan 2021 21:15:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B4156E8D8;
	Fri,  8 Jan 2021 20:15:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3A8D6E8CE
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jan 2021 20:15:33 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id d13so10097302wrc.13
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Jan 2021 12:15:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3AW/x7qxQXiLCGUIcY4DJLhUKMXcrKT9KQcLhFyNk1w=;
 b=DtMvMixhiP2jW+geu9bD4kDHGmsl5fl9Ja2iKoo/LWSz7Wl951aSjbLSw7RaBTX442
 5F1atJsNaPHQOiYyQ5JoAbxAGynP+OLyjIBw/6HjYyZ18ZGwtucTOW04jU/NV80E5MZC
 +Md0dnOHAWBBWc8NefwjYCKd1nN5gcIgzNwFcAf0yKfQMO2DFkx0n7Lu2dVB+nkuyXMB
 1jK7/AZdcvFiBBMlUUAYoQyJ29i2/apa8PfE2CdkSUDxkV9hBzOzr+rCJ1TQbuasdFnf
 NDDwcxDGe/vPoVSHlox8EURoSw2ntqNRkPsfJVL8IGlGr9+QzLY4xZtjqiMm4bFAN+4m
 p+4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3AW/x7qxQXiLCGUIcY4DJLhUKMXcrKT9KQcLhFyNk1w=;
 b=VuuRGu8IPBZcMUfik9xdMfwSxDKaFGSpf65hZ6VY4Y4PvwVzMt7BYXbpSEI/p5BoZ2
 tEI6Ncj4UyevwVQ7iER4xj1gEFft2gGgnH/EUkYmQZ0pAZejpyXdAwb0IruphebAEPsO
 1TiFC0QyKR4I1WUhCQ7nOJqCbHR+FIbXtEdK2IvWJsiIbjmH7rdOxMaxFwCv0otPy0Kr
 G3//hC2+ZQuIXG7NnHfprXCev4xGG9E4RouGBxgsKC9l7d1jaB5bvu04EEikuSfrwPy+
 Bv8mGJNu0Vma91X9cZ4uMD9whoLIYvg9UGE+kwNQ/Hn1YfcHSBLn5Ag+gqAJMB9c+50Q
 ta7g==
X-Gm-Message-State: AOAM532PbAzuqoT6L8AnABAWip1vEnBYaZAuESnoo/eqWfgqLSPI2f7g
 0Mpy3UrvwBqv9b1PbQU3OYQ+wQ==
X-Google-Smtp-Source: ABdhPJxDPOEakgyITuUIEzaN+h3M2b6ZCVSP76EyI/xJynT2Ubn3eNhdgesxy9B34/UU7F3I43bFVg==
X-Received: by 2002:a5d:6106:: with SMTP id v6mr5129705wrt.173.1610136932414; 
 Fri, 08 Jan 2021 12:15:32 -0800 (PST)
Received: from dell.default ([91.110.221.229])
 by smtp.gmail.com with ESMTPSA id l8sm15598671wrb.73.2021.01.08.12.15.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jan 2021 12:15:31 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 19/40] drm/amd/display/dc/bios/command_table: Remove unused
 variable
Date: Fri,  8 Jan 2021 20:14:36 +0000
Message-Id: <20210108201457.3078600-20-lee.jones@linaro.org>
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
Cc: Leo Li <sunpeng.li@amd.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Qinglang Miao <miaoqinglang@huawei.com>,
 David Airlie <airlied@linux.ie>, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Tm9uZSBvZiB0aGUgc3Vycm91bmRpbmcgY29kZSB3YXMgcmVtb3ZlZCBqdXN0IGluIGNhc2UgZXZl
biBhIHNtYWxsCmZyYWN0aW9uIG9mIGl0IHdhcyBmdW5jdGlvbmFsLgoKRml4ZXMgdGhlIGZvbGxv
d2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvLi4vZGlzcGxheS9kYy9iaW9zL2NvbW1hbmRfdGFibGUuYzogSW4gZnVuY3Rpb24g4oCY
YWRqdXN0X2Rpc3BsYXlfcGxsX3Yy4oCZOgogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4v
ZGlzcGxheS9kYy9iaW9zL2NvbW1hbmRfdGFibGUuYzoxNDU5OjM1OiB3YXJuaW5nOiB2YXJpYWJs
ZSDigJhwYXJhbXPigJkgc2V0IGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQtYnV0LXNldC12YXJpYWJs
ZV0KCkNjOiBIYXJyeSBXZW50bGFuZCA8aGFycnkud2VudGxhbmRAYW1kLmNvbT4KQ2M6IExlbyBM
aSA8c3VucGVuZy5saUBhbWQuY29tPgpDYzogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hl
ckBhbWQuY29tPgpDYzogIkNocmlzdGlhbiBLw7ZuaWciIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5j
b20+CkNjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+CkNjOiBEYW5pZWwgVmV0dGVy
IDxkYW5pZWxAZmZ3bGwuY2g+CkNjOiBRaW5nbGFuZyBNaWFvIDxtaWFvcWluZ2xhbmdAaHVhd2Vp
LmNvbT4KQ2M6IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCkNjOiBkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnClNpZ25lZC1vZmYtYnk6IExlZSBKb25lcyA8bGVlLmpvbmVzQGxp
bmFyby5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Jpb3MvY29tbWFu
ZF90YWJsZS5jIHwgMTIgKysrLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25z
KCspLCA5IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlz
cGxheS9kYy9iaW9zL2NvbW1hbmRfdGFibGUuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxh
eS9kYy9iaW9zL2NvbW1hbmRfdGFibGUuYwppbmRleCAwNzA0NTllM2U0MDcwLi5kZDg5M2ExMTc2
OTc5IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvYmlvcy9jb21t
YW5kX3RhYmxlLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Jpb3MvY29t
bWFuZF90YWJsZS5jCkBAIC0xNDU2LDIwICsxNDU2LDE0IEBAIHN0YXRpYyBlbnVtIGJwX3Jlc3Vs
dCBhZGp1c3RfZGlzcGxheV9wbGxfdjIoCiAJc3RydWN0IGJwX2FkanVzdF9waXhlbF9jbG9ja19w
YXJhbWV0ZXJzICpicF9wYXJhbXMpCiB7CiAJZW51bSBicF9yZXN1bHQgcmVzdWx0ID0gQlBfUkVT
VUxUX0ZBSUxVUkU7Ci0JQURKVVNUX0RJU1BMQVlfUExMX1BTX0FMTE9DQVRJT04gcGFyYW1zID0g
eyAwIH07CiAKIAkvKiBXZSBuZWVkIHRvIGNvbnZlcnQgZnJvbSBLSHogdW5pdHMgaW50byAxMEtI
eiB1bml0cyBhbmQgdGhlbiBjb252ZXJ0CiAJICogb3V0cHV0IHBpeGVsIGNsb2NrIGJhY2sgMTBL
SHotLT5LSHogKi8KIAl1aW50MzJfdCBwaXhlbF9jbG9ja18xMEtIel9pbiA9IGJwX3BhcmFtcy0+
cGl4ZWxfY2xvY2sgLyAxMDsKIAotCXBhcmFtcy51c1BpeGVsQ2xvY2sgPSBjcHVfdG9fbGUxNigo
dWludDE2X3QpKHBpeGVsX2Nsb2NrXzEwS0h6X2luKSk7Ci0JcGFyYW1zLnVjVHJhbnNtaXR0ZXJJ
RCA9Ci0JCQlicC0+Y21kX2hlbHBlci0+ZW5jb2Rlcl9pZF90b19hdG9tKAotCQkJCQlkYWxfZ3Jh
cGhpY3Nfb2JqZWN0X2lkX2dldF9lbmNvZGVyX2lkKAotCQkJCQkJCWJwX3BhcmFtcy0+ZW5jb2Rl
cl9vYmplY3RfaWQpKTsKLQlwYXJhbXMudWNFbmNvZGVNb2RlID0KLQkJCSh1aW50OF90KWJwLT5j
bWRfaGVscGVyLT5lbmNvZGVyX21vZGVfYnBfdG9fYXRvbSgKLQkJCQkJYnBfcGFyYW1zLT5zaWdu
YWxfdHlwZSwgZmFsc2UpOworCWJwLT5jbWRfaGVscGVyLT5lbmNvZGVyX2lkX3RvX2F0b20oCisJ
CWRhbF9ncmFwaGljc19vYmplY3RfaWRfZ2V0X2VuY29kZXJfaWQoYnBfcGFyYW1zLT5lbmNvZGVy
X29iamVjdF9pZCkpOworCWJwLT5jbWRfaGVscGVyLT5lbmNvZGVyX21vZGVfYnBfdG9fYXRvbShi
cF9wYXJhbXMtPnNpZ25hbF90eXBlLCBmYWxzZSk7CiAJcmV0dXJuIHJlc3VsdDsKIH0KIAotLSAK
Mi4yNS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
