Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 597CE2C562D
	for <lists+dri-devel@lfdr.de>; Thu, 26 Nov 2020 14:44:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EA076E996;
	Thu, 26 Nov 2020 13:43:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E19006E957
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Nov 2020 13:43:36 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id x22so2182204wmc.5
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Nov 2020 05:43:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BHyKENW6Yz4oTye/FJPzNNjmGfv58ayjrIYPkA+7OU0=;
 b=ueetS8dxpG4eO8faloDa33OmDRYWKDXfGJ/MOesO0sVWIxlbnNg1acnUmuk2/IwmSf
 ynWcfu3xKgFrRhph301W/t3OPcXaCv0WmUd0j5/ucJuRUAOZbxw9vKgw9JQWG+J73gYN
 dzlwXWkZpqM7LOU60AzvhK5fYOoKjn8aBJ0By8qseo1RiV+Pn+RcSG8nAHQBVYeJAlE0
 R6/K5j0Q03t+8e/0vdaMYHRUH2q4nfbUwpSJU9mS9SfRbIikwWIlUa3yc5tvBbjUPxqz
 V0323xh/2ZuoVA0U8/JRnXY/0a0M097+5zsUWW5yfK/gEEyacVeFwDldJ8Hay3MhqIUT
 ytSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BHyKENW6Yz4oTye/FJPzNNjmGfv58ayjrIYPkA+7OU0=;
 b=ZJyOIzjFB7R8kj54JTfQPnuO16MWTXKYkUR4zNvldihLnEK5L7U/UX3NGKMNxHmB7O
 bmhqbmSL9oPML5vAt6ID0WyMhCV+I6wPC/IHgAjR+2o5Kyv7jfukQlFWssADhkje2aCl
 /WomNIVBINF5Gw3Mhd+G9hUBTPWkwvVUO5+Hj5MI3ycVESQSedv1I2pBtbcwYF1Mxpe4
 qj8wnvc1iovIewqytfpMvBE1Y082tSOBLSa0RLeXK3168yI9YxNSAIEgfMfJGTmCZSpY
 SACMOS51gGZf70JG8TksuPrW0m6VAslooCVjzBH2AXr13MRLuMzmNnZX32w/rwUNFBOi
 QXjQ==
X-Gm-Message-State: AOAM532dBvml5F2MFEvSx9Q74tEy1SDM+2MRbeCknObrGeb8cEME4FiP
 ozr65KkDysF/rRofA8TAIC8DMA==
X-Google-Smtp-Source: ABdhPJyQXsU5/AEeoFFjY7XHZxkueaCPYvuChFDxVYSEAIRAWOqSivqDUyYaPfLnYEj+pww8vgdxcg==
X-Received: by 2002:a1c:4c02:: with SMTP id z2mr3499582wmf.139.1606398215596; 
 Thu, 26 Nov 2020 05:43:35 -0800 (PST)
Received: from dell.default ([91.110.221.235])
 by smtp.gmail.com with ESMTPSA id k205sm9275738wmk.4.2020.11.26.05.43.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Nov 2020 05:43:34 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 34/40] drm/amd/display/amdgpu_dm/amdgpu_dm_helpers: Use
 'gnu_printf' format notation
Date: Thu, 26 Nov 2020 13:42:34 +0000
Message-Id: <20201126134240.3214176-35-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201126134240.3214176-1-lee.jones@linaro.org>
References: <20201126134240.3214176-1-lee.jones@linaro.org>
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
cy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX2hlbHBl
cnMuYzogSW4gZnVuY3Rpb24g4oCYZG1fZHRuX2xvZ19hcHBlbmRfduKAmToKIGRyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1Ly4uL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9oZWxwZXJzLmM6
MzQ1OjI6IHdhcm5pbmc6IGZ1bmN0aW9uIOKAmGRtX2R0bl9sb2dfYXBwZW5kX3bigJkgbWlnaHQg
YmUgYSBjYW5kaWRhdGUgZm9yIOKAmGdudV9wcmludGbigJkgZm9ybWF0IGF0dHJpYnV0ZSBbLVdz
dWdnZXN0LWF0dHJpYnV0ZT1mb3JtYXRdCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9k
aXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1faGVscGVycy5jOjM3NTozOiB3YXJuaW5nOiBmdW5j
dGlvbiDigJhkbV9kdG5fbG9nX2FwcGVuZF924oCZIG1pZ2h0IGJlIGEgY2FuZGlkYXRlIGZvciDi
gJhnbnVfcHJpbnRm4oCZIGZvcm1hdCBhdHRyaWJ1dGUgWy1Xc3VnZ2VzdC1hdHRyaWJ1dGU9Zm9y
bWF0XQoKQ2M6IEhhcnJ5IFdlbnRsYW5kIDxoYXJyeS53ZW50bGFuZEBhbWQuY29tPgpDYzogTGVv
IExpIDxzdW5wZW5nLmxpQGFtZC5jb20+CkNjOiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVj
aGVyQGFtZC5jb20+CkNjOiAiQ2hyaXN0aWFuIEvDtm5pZyIgPGNocmlzdGlhbi5rb2VuaWdAYW1k
LmNvbT4KQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KQ2M6IERhbmllbCBWZXR0
ZXIgPGRhbmllbEBmZndsbC5jaD4KQ2M6IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCkNj
OiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnClNpZ25lZC1vZmYtYnk6IExlZSBKb25l
cyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5
L2FtZGdwdV9kbS9hbWRncHVfZG1faGVscGVycy5jIHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1k
Z3B1X2RtL2FtZGdwdV9kbV9oZWxwZXJzLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
YW1kZ3B1X2RtL2FtZGdwdV9kbV9oZWxwZXJzLmMKaW5kZXggYjdkN2VjM2JhMDBkNy4uMjRhODE2
NDJiYWEyNiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9k
bS9hbWRncHVfZG1faGVscGVycy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9h
bWRncHVfZG0vYW1kZ3B1X2RtX2hlbHBlcnMuYwpAQCAtMzE4LDYgKzMxOCw3IEBAIHZvaWQgZG1f
ZHRuX2xvZ19iZWdpbihzdHJ1Y3QgZGNfY29udGV4dCAqY3R4LAogCWRtX2R0bl9sb2dfYXBwZW5k
X3YoY3R4LCBsb2dfY3R4LCAiJXMiLCBtc2cpOwogfQogCitfX3ByaW50ZigzLCA0KQogdm9pZCBk
bV9kdG5fbG9nX2FwcGVuZF92KHN0cnVjdCBkY19jb250ZXh0ICpjdHgsCiAJc3RydWN0IGRjX2xv
Z19idWZmZXJfY3R4ICpsb2dfY3R4LAogCWNvbnN0IGNoYXIgKm1zZywgLi4uKQotLSAKMi4yNS4x
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
