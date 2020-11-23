Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E3952C0407
	for <lists+dri-devel@lfdr.de>; Mon, 23 Nov 2020 12:19:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F35EC89175;
	Mon, 23 Nov 2020 11:19:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2956389155
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Nov 2020 11:19:27 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id a186so14724827wme.1
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Nov 2020 03:19:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NbI9YC4DXS8pP98pclydp8H5GArZ+B3FbUQc6S4IogU=;
 b=TgHaHacyuHyhuNT4t9k91sNsSIpxd1Xx/c4tP8EIQStq0UwNaFNTtzx1inmxtzd/z+
 hTIUk4QzPFZlQbN3JeRLYKzRVM5heFaIzctXY2wjwiJa75NUFDBbhz1kBpe+fkigDbqR
 +IYvmWC8XLoidiZJ9y0u7Id3jLiYI3c4OEm2Cp4JCnG46l7ptAU2mg4M2/q/bMY5Gweq
 N4vdC9Ke3ayBde0o6e+AOkdfsN28DA8WZnDsx+d5TpMNMR9uD8muxAiqbRl3vGK1KbMR
 dVqYtPckmZad/rzSqNT2T5r0Y7dp18r2rxnD6Lv+/8dR0Xg/iiHkNHoCoACfq47nfwwv
 giyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NbI9YC4DXS8pP98pclydp8H5GArZ+B3FbUQc6S4IogU=;
 b=QrfharvGo+XhTEB5DzweKaVMGcTH8YYO1MKBJtqsEP0tXUJWVQYi6oaDhYVWUjXYZu
 jQ9sXNEsCrLLGvSVlpiF/zU9arJOKTfYIQdtes5Quq3/xQ2UXKizA9PmNbxcvKaWQrdg
 QLsGC0dEq4LUFex+BqcJ8Q1e6R6InNnhdB7i0W8XPJemLqtlQCoGZI+7ExiHoTo3Nwqq
 /YEeyMbs/DAA+Vpp2DYri7IaRzTdoMzpMniso1S3bXvYRU6XKyKGc9Q48PMJA/AvHS/j
 sbubOYg+i4oOSHN0TJl8v9rJbe8lOg4khjD/ymKS1wDUqGzwqkPwkuZQv/Cv9OgRnKXg
 YYWg==
X-Gm-Message-State: AOAM530OgaA9p7UxOdilRWF28bZ3okoLgVvqN30EkFoaC6N7w+eqNRUP
 RmHpnEic6fIlO306LjQaoEYrcOV6H+VeLow+
X-Google-Smtp-Source: ABdhPJwFYFQRxnQCZl5YpA7vvWLd+lmrE+Wk8kqNjr4QREmxfXWSgfeTDKTAIzecu4Uym4yvH8R31Q==
X-Received: by 2002:a7b:c00b:: with SMTP id c11mr23291836wmb.175.1606130365809; 
 Mon, 23 Nov 2020 03:19:25 -0800 (PST)
Received: from dell.default ([91.110.221.218])
 by smtp.gmail.com with ESMTPSA id n9sm16317290wmd.4.2020.11.23.03.19.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Nov 2020 03:19:25 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 02/40] drm/amd/amdgpu/amdgpu_ttm: Add description for
 'page_flags'
Date: Mon, 23 Nov 2020 11:18:41 +0000
Message-Id: <20201123111919.233376-3-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201123111919.233376-1-lee.jones@linaro.org>
References: <20201123111919.233376-1-lee.jones@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, Jerome Glisse <glisse@freedesktop.org>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5jOjEyMTQ6IHdhcm5pbmc6IEZ1bmN0aW9u
IHBhcmFtZXRlciBvciBtZW1iZXIgJ3BhZ2VfZmxhZ3MnIG5vdCBkZXNjcmliZWQgaW4gJ2FtZGdw
dV90dG1fdHRfY3JlYXRlJwoKQ2M6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1k
LmNvbT4KQ2M6ICJDaHJpc3RpYW4gS8O2bmlnIiA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgpD
YzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgpDYzogRGFuaWVsIFZldHRlciA8ZGFu
aWVsQGZmd2xsLmNoPgpDYzogU3VtaXQgU2Vtd2FsIDxzdW1pdC5zZW13YWxAbGluYXJvLm9yZz4K
Q2M6IEplcm9tZSBHbGlzc2UgPGdsaXNzZUBmcmVlZGVza3RvcC5vcmc+CkNjOiBhbWQtZ2Z4QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpD
YzogbGludXgtbWVkaWFAdmdlci5rZXJuZWwub3JnCkNjOiBsaW5hcm8tbW0tc2lnQGxpc3RzLmxp
bmFyby5vcmcKU2lnbmVkLW9mZi1ieTogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4K
LS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdHRtLmMgfCAxICsKIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV90dG0uYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV90dG0uYwppbmRleCA1ZmNkZDY3ZTVhOTEzLi5kZWJiY2VmOTYxZGQ1IDEwMDY0NAotLS0gYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdHRtLmMKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5jCkBAIC0xMTk5LDYgKzExOTksNyBAQCBzdGF0aWMg
dm9pZCBhbWRncHVfdHRtX2JhY2tlbmRfZGVzdHJveShzdHJ1Y3QgdHRtX2JvX2RldmljZSAqYmRl
diwKICAqIGFtZGdwdV90dG1fdHRfY3JlYXRlIC0gQ3JlYXRlIGEgdHRtX3R0IG9iamVjdCBmb3Ig
YSBnaXZlbiBCTwogICoKICAqIEBibzogVGhlIGJ1ZmZlciBvYmplY3QgdG8gY3JlYXRlIGEgR1RU
IHR0bV90dCBvYmplY3QgYXJvdW5kCisgKiBAcGFnZV9mbGFnczogUGFnZSBmbGFncyB0byBiZSBh
ZGRlZCB0byB0aGUgdHRtX3R0IG9iamVjdAogICoKICAqIENhbGxlZCBieSB0dG1fdHRfY3JlYXRl
KCkuCiAgKi8KLS0gCjIuMjUuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVsCg==
