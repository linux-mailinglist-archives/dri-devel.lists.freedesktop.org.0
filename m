Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 977AC2F1EDA
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jan 2021 20:19:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9B6989E06;
	Mon, 11 Jan 2021 19:19:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56A1489E0C
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jan 2021 19:19:43 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id r7so934644wrc.5
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jan 2021 11:19:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UcsXd93K7BxPfLMZix7N1m2GKT2azGUOXW7pu1fAJ6Q=;
 b=ZgN070xj9zEPxR6Eju8xm/BGEJNz26qAu8AK4hz5kXNIOjqsQxjUOJqZ4iQ7ohXe6P
 bmOVqJpchg0VBixwo6iK1krjte9+L1Afe75VVKj8jbMEDib/VMRKbvNvdmJxJkH2g8/6
 iwod8WTWIKRUyQbScNhoFkgfi7OPMNWCymJ+arxVjLaP8grMv96/ZLuyiflsT+b20Q30
 NTKQsNA0WpV1M6zAsBxspLjTpqdatanlXZJYFC2nQWTNPOjPHBf6+Fm9NCw8cIocOCHe
 kJBjojkgFDNH2+DGSSjAgMTKyWIborbM1NB5Srr8x6osaizYXvHLlU7A1ucFe1eiWRWb
 ykJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UcsXd93K7BxPfLMZix7N1m2GKT2azGUOXW7pu1fAJ6Q=;
 b=sltpffXYlujg8IdB5LQmm5ySJXx6QKzFXNDSEjO5rDHZrk5Vbtbk66/8oF/SKkPMtp
 jUdMrf1PV5asCym+B1mmmnbJ1ZwXgVtq5bKi1D0ZsRc0SWqntPP0F61IgtGjY0W08sLU
 VNAgEa5btVpvnc1t9mM0ecFkEwXKf31NGOSqy+5Raw1A4z/+eDBZzt1hOreSVXdzGTZg
 Axnxb90wxWXmF3qaGgaHPZlIuB7MTylo+BZcjf4GfuNem2TbI2Nnpx3XblwgY2qf6Mc4
 qwsubSYHF5L/ViX1DViHSjFIYGF+AUnInUAHzsVktXUcMfJIF762sYQ474YTnqijG/kQ
 x2kw==
X-Gm-Message-State: AOAM530PmMbZu79NYGywBnvBWhQTrgVLqP5j460a7d7ZhrkjYrBOFvIU
 HLVxleNgTydkZjWxlexzMqbwHg==
X-Google-Smtp-Source: ABdhPJy5wbRWhf0qduM/ZnCT/0hOR9xgNX/ehbryzeIZj8Uyts1DMTt3SiRFvp6CxAUQd1iERwcZYQ==
X-Received: by 2002:adf:f344:: with SMTP id e4mr593240wrp.25.1610392782031;
 Mon, 11 Jan 2021 11:19:42 -0800 (PST)
Received: from dell.default ([91.110.221.229])
 by smtp.gmail.com with ESMTPSA id n3sm778090wrw.61.2021.01.11.11.19.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 11:19:41 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 09/40] drm/amd/display/dc/gpio/diagnostics/hw_factory_diag:
 Include our own header containing prototypes
Date: Mon, 11 Jan 2021 19:18:55 +0000
Message-Id: <20210111191926.3688443-10-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210111191926.3688443-1-lee.jones@linaro.org>
References: <20210111191926.3688443-1-lee.jones@linaro.org>
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
cy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9kYy9ncGlvL2RpYWdub3N0aWNzL2h3X2Zh
Y3RvcnlfZGlhZy5jOjUwOjY6IHdhcm5pbmc6IG5vIHByZXZpb3VzIHByb3RvdHlwZSBmb3Ig4oCY
ZGFsX2h3X2ZhY3RvcnlfZGlhZ19mcGdhX2luaXTigJkgWy1XbWlzc2luZy1wcm90b3R5cGVzXQoK
Q2M6IEhhcnJ5IFdlbnRsYW5kIDxoYXJyeS53ZW50bGFuZEBhbWQuY29tPgpDYzogTGVvIExpIDxz
dW5wZW5nLmxpQGFtZC5jb20+CkNjOiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFt
ZC5jb20+CkNjOiAiQ2hyaXN0aWFuIEvDtm5pZyIgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4K
Q2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KQ2M6IERhbmllbCBWZXR0ZXIgPGRh
bmllbEBmZndsbC5jaD4KQ2M6IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCkNjOiBkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnClNpZ25lZC1vZmYtYnk6IExlZSBKb25lcyA8bGVl
LmpvbmVzQGxpbmFyby5vcmc+Ci0tLQogLi4uL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZ3Bpby9k
aWFnbm9zdGljcy9od19mYWN0b3J5X2RpYWcuYyAgICB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2Rj
L2dwaW8vZGlhZ25vc3RpY3MvaHdfZmFjdG9yeV9kaWFnLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2Rpc3BsYXkvZGMvZ3Bpby9kaWFnbm9zdGljcy9od19mYWN0b3J5X2RpYWcuYwppbmRleCBkZjY4
NDMwYWViMGMyLi5jNmUyOGY2YmYxYTI3IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2Rpc3BsYXkvZGMvZ3Bpby9kaWFnbm9zdGljcy9od19mYWN0b3J5X2RpYWcuYworKysgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZ3Bpby9kaWFnbm9zdGljcy9od19mYWN0b3J5X2Rp
YWcuYwpAQCAtMjgsNiArMjgsNyBAQAogICovCiAKICNpbmNsdWRlICJkbV9zZXJ2aWNlcy5oIgor
I2luY2x1ZGUgImh3X2ZhY3RvcnlfZGlhZy5oIgogI2luY2x1ZGUgImluY2x1ZGUvZ3Bpb190eXBl
cy5oIgogI2luY2x1ZGUgIi4uL2h3X2ZhY3RvcnkuaCIKIAotLSAKMi4yNS4xCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
