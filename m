Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C13432B81A
	for <lists+dri-devel@lfdr.de>; Wed,  3 Mar 2021 14:43:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEEEF6E8D8;
	Wed,  3 Mar 2021 13:43:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9E306E8F0
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Mar 2021 13:43:34 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id u125so6378508wmg.4
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Mar 2021 05:43:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZlgsgeTsQs4mZ0QqFliW9MCgKZA8P4oKnuooJz0fj/s=;
 b=gVaHkDSRZ4XCGVHSPIw1rAYthoVgCtFdJwAry/SmYPLZyI0PyvecSEKZI/EXW4DvSV
 Bpqd9vwVd/8ZCypvVCmxBpYRy57M4/FRgGKDqYIq0nFYClOoTrnQyJ7ln/Q0lLfhi52t
 HJOLWHJFbgS7wZfDLdRrcP0fCEy+Ve3sqsGrlB4WrSqCuqfDM/tPNCgGnyEGnPCDCY3x
 26PaTDSTZzi+HCKHiHpvMLoshvx2IMO5xc3fAyRXCSpdqidzTstYHM2n8/XnXM+vLmYe
 4f+bhSH7K0S7757hRV6lRhNX0psijhfk3dfwCgxMunapIqceXx8QTX1q8jsGn3kYAkmf
 QNbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZlgsgeTsQs4mZ0QqFliW9MCgKZA8P4oKnuooJz0fj/s=;
 b=J1rflDgriqq8cw2wa6puQkFmS+fJ2OptXx6DJhcUtri+B40a9bg2a4QJLL6BJATpr2
 6651HZIRoFYYk1yxGZHx4zfqV/XxvuMeYh9lvzi6APdOjRkbPFYrEht/vStBKUuE8UwW
 sqy53+I9sC4rScdzzT2WuVDtPmCXJAtrbZMf84dg00c+57vcG05Egkb+pb5SEwLS9uNe
 53t6x7/YDruGEtqsvRV0f+wAVDQQ/Z22ZZh10XZFnEjEbNWdp7G5W4t8r5mTpX/n1CY9
 nz7BPiOPKBqJWFsNomiUzufjpVJh+s4LlrdrLxBDk2Jw9WBTLqHRrKf/TkpwXO/Fv5NG
 9cEw==
X-Gm-Message-State: AOAM53286zOBi5nnuch23VxsRyC8v5YRyJn03LWzMdqsPX3nbH5bOZn6
 39SlLBSu9hH3YOG76df9uqf2zA==
X-Google-Smtp-Source: ABdhPJx1BDI6vEwnLcvnd7UPVLQAAB3KdHvL5nicosU+YdtoR/ucUeX/XECUmu2FYY23px+LdytjDQ==
X-Received: by 2002:a1c:6543:: with SMTP id z64mr9300311wmb.50.1614779013487; 
 Wed, 03 Mar 2021 05:43:33 -0800 (PST)
Received: from dell.default ([91.110.221.155])
 by smtp.gmail.com with ESMTPSA id w18sm6109524wrr.7.2021.03.03.05.43.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 05:43:33 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 04/53] drm/amd/display/dc/bios/command_table: Remove unused
 variable
Date: Wed,  3 Mar 2021 13:42:30 +0000
Message-Id: <20210303134319.3160762-5-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210303134319.3160762-1-lee.jones@linaro.org>
References: <20210303134319.3160762-1-lee.jones@linaro.org>
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
eS9kYy9iaW9zL2NvbW1hbmRfdGFibGUuYwppbmRleCBhZmMxMGI5NTRmZmE3Li45ZDNiYzNhMDcz
ODIxIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvYmlvcy9jb21t
YW5kX3RhYmxlLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Jpb3MvY29t
bWFuZF90YWJsZS5jCkBAIC0xNTE3LDIwICsxNTE3LDE0IEBAIHN0YXRpYyBlbnVtIGJwX3Jlc3Vs
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
Mi4yNy4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
