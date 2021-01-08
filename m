Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F9572EF8B1
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jan 2021 21:15:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E26E6E8E5;
	Fri,  8 Jan 2021 20:15:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B8F66E8DB
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jan 2021 20:15:39 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id t16so10168842wra.3
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Jan 2021 12:15:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=J9hwKoCUKPkAVEJG7PdvhZlNWecZ9XZq8Q6EZdE3uyc=;
 b=hEJFVXCVtwgK4Ggr5Yq+CnblBWyx906VjOGVxfnc2I9GwMfjxBlYdIufR3N0PgPmBh
 XzeWu1y/95DEw+MOBpoPJmeUkjIhV59SsQ5YxzenvG+XvqtqIm9DYK5uwVwZrkNxwvaZ
 NKLeliZDCZwVeb+sL1YknAuu5Yl58Xur2WNTqAvK9qCl2Ah4T8B89/oNpVFMdiFAjujM
 4NYnKhCsW75iuMfCwW+XALsrF5a2GYVf8fileLh0IXeaofih5iiHhDxa4h9uis5rYEc1
 yloX+0Z9EgB6LqnVve8JF5u9cDXP/Ol28Ax5Xno8C5kNyHSO2N0AzqVZPpSBsMxQ7sGQ
 1YdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=J9hwKoCUKPkAVEJG7PdvhZlNWecZ9XZq8Q6EZdE3uyc=;
 b=spEle6EJlbzdDxfGdjqBh6ozArJCUBV2F4WMK4HNtRwXJIQyqoKo47+mRqeFcXEo0d
 txRrzKxiMdW+7zF36qdd6JmjzZYA7PHSa98dzJ7vOGWShUOahgioMZseKJzXXzvsEuhv
 nCni4dsmuuTJU1/WviVobQ7Pm9YLth3FwynC/MBUs6M9DmY5KHTgAwlS/GMQpeASqIyu
 dx+/pYGrBLwnxYAN7JcQIpqa7VQaGK28GomY5cRr8/wpxK/4n/wfi1PjkcZI2Fw8OQgm
 kV7eMBWTzUgW52333K8VhPNZ1/mUbDxmIh0QCFyFWNXkSQligx9GSmoP/VvPi2QiBPLF
 AzeQ==
X-Gm-Message-State: AOAM53039vvSBgdhcj1YPE19s6wvN5cjCMVLeIgJbl7Sgyqv00g4OVP2
 dDLtuEGqGoENf5cqOuGfZAqnXA==
X-Google-Smtp-Source: ABdhPJzWWkh1l8v/XVzgOhfkoK44n4cUyCHmhMl1lDPjo2mxR+9aIqk4vVLNoAYoABBXMiS+99NELA==
X-Received: by 2002:adf:dec7:: with SMTP id i7mr5279212wrn.373.1610136938211; 
 Fri, 08 Jan 2021 12:15:38 -0800 (PST)
Received: from dell.default ([91.110.221.229])
 by smtp.gmail.com with ESMTPSA id l8sm15598671wrb.73.2021.01.08.12.15.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jan 2021 12:15:37 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 23/40] drm/amd/display/dc/dce/dce_audio: Make function invoked
 by reference static
Date: Fri,  8 Jan 2021 20:14:40 +0000
Message-Id: <20210108201457.3078600-24-lee.jones@linaro.org>
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
Cc: Charlene Liu <Charlene.Liu@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Mauro Rossi <issor.oruam@gmail.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9kYy9kY2UvZGNlX2F1ZGlvLmM6ODcxOjY6
IHdhcm5pbmc6IG5vIHByZXZpb3VzIHByb3RvdHlwZSBmb3Ig4oCYZGNlNjBfYXVkX3dhbGxfZHRv
X3NldHVw4oCZIFstV21pc3NpbmctcHJvdG90eXBlc10KCkNjOiBIYXJyeSBXZW50bGFuZCA8aGFy
cnkud2VudGxhbmRAYW1kLmNvbT4KQ2M6IExlbyBMaSA8c3VucGVuZy5saUBhbWQuY29tPgpDYzog
QWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgpDYzogIkNocmlzdGlhbiBL
w7ZuaWciIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+CkNjOiBEYXZpZCBBaXJsaWUgPGFpcmxp
ZWRAbGludXguaWU+CkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+CkNjOiBNYXVy
byBSb3NzaSA8aXNzb3Iub3J1YW1AZ21haWwuY29tPgpDYzogQ2hhcmxlbmUgTGl1IDxDaGFybGVu
ZS5MaXVAYW1kLmNvbT4KQ2M6IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCkNjOiBkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnClNpZ25lZC1vZmYtYnk6IExlZSBKb25lcyA8bGVl
LmpvbmVzQGxpbmFyby5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Rj
ZS9kY2VfYXVkaW8uYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBk
ZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9k
Y2UvZGNlX2F1ZGlvLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlL2RjZV9h
dWRpby5jCmluZGV4IDJhMmEwZmRiOTI1MzkuLjc4NjZjZjJhNjY4ZmEgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2UvZGNlX2F1ZGlvLmMKKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjZS9kY2VfYXVkaW8uYwpAQCAtODY4LDcgKzg2OCw3
IEBAIHZvaWQgZGNlX2F1ZF93YWxsX2R0b19zZXR1cCgKIH0KIAogI2lmIGRlZmluZWQoQ09ORklH
X0RSTV9BTURfRENfU0kpCi12b2lkIGRjZTYwX2F1ZF93YWxsX2R0b19zZXR1cCgKK3N0YXRpYyB2
b2lkIGRjZTYwX2F1ZF93YWxsX2R0b19zZXR1cCgKIAlzdHJ1Y3QgYXVkaW8gKmF1ZGlvLAogCWVu
dW0gc2lnbmFsX3R5cGUgc2lnbmFsLAogCWNvbnN0IHN0cnVjdCBhdWRpb19jcnRjX2luZm8gKmNy
dGNfaW5mbywKLS0gCjIuMjUuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVsCg==
