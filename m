Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 115222B4DC4
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 18:42:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F7A66EA10;
	Mon, 16 Nov 2020 17:42:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 727B06EA08
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 17:42:01 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id j7so19658246wrp.3
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 09:42:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CpDMS+RHHV1rRQnMHYAjcZzCg3wY/F0STHOFtNum/rU=;
 b=QlKnEKn0xfMVNLUegEwHbQJPic1l06CYGWhnCfguIw3hOMik3KVBqH/YP2yC43asib
 f2UuSmKRJY3ecRRD++REiBaL5pWLlMxhw1cFZQCjed41kvQSU0SGSZtp9IwUC7oTxOY+
 IpjXbOfgYmytr6s4LWK+mUcADEQ3vuWFSK+Snb0r0qofwWKJlfopeqr6X/efE/o9nVwJ
 4SrgKh1saEWCXQLFmnbhf6Vie+X3ikuQBxtqtUHAqCklAxucNV3+wM8pAVjlhsr+aK/V
 ReN+ZybmaVikrjvBfRAKqXEBrF+Xi2uq1UDMrge12cB/vdXOFlCOoJIJ4k3963py/kLv
 o6RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CpDMS+RHHV1rRQnMHYAjcZzCg3wY/F0STHOFtNum/rU=;
 b=pik1M4DUbadFzDfkTk2Dqmz5CZKwOM4whbIoZHOBlcsJoE2oJitFcboCrDHShQ+jRG
 jf3dPcVXYVImgC3RKFZS2KfzarR0CzYp7TEJ1C7F3biXRSblY1zbq0/WWiHHmtDwSxeL
 w2vzs16uN+gnfEONnyMpEBG13Naf92zvzQn30hseZ5Qoldu2XwJgi/puUjIKX/DvbWsU
 TSMsgkibHuvnk97c4vXaqL49+1AKzHFZ8P1+BgW8SiF9b+mOVmM/ilB7cXvhMr+QXXla
 M7PWPGhbPQ+KOKzkVz4YHPElHgXDqXTnggd2zW/VDPsNeJWxoXPEMdoRgy2NsQ+3+seD
 QwNg==
X-Gm-Message-State: AOAM531recK9OKJginzwbNagmf51NdKFGzw2Y2rue27ESe53FxhKl34A
 baFbB3PC62Rq62MjW3VnF+FntgACHKzSRPGO
X-Google-Smtp-Source: ABdhPJyX0D9RJLsPH5aoo8t225qk75KVbJPi+9yZsHZ7TD39meFO6erQN2FqkzZVH2u+74DxgOk0TQ==
X-Received: by 2002:adf:c803:: with SMTP id d3mr20484445wrh.108.1605548520115; 
 Mon, 16 Nov 2020 09:42:00 -0800 (PST)
Received: from dell.default ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id n10sm24667224wrx.9.2020.11.16.09.41.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 09:41:59 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 28/42] drm/selftests/test-drm_framebuffer: Remove set but
 unused variable 'fb'
Date: Mon, 16 Nov 2020 17:40:58 +0000
Message-Id: <20201116174112.1833368-29-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201116174112.1833368-1-lee.jones@linaro.org>
References: <20201116174112.1833368-1-lee.jones@linaro.org>
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
