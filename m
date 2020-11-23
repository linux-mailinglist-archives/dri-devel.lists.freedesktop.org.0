Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEBD42C0427
	for <lists+dri-devel@lfdr.de>; Mon, 23 Nov 2020 12:20:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41BD06E030;
	Mon, 23 Nov 2020 11:20:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F071489DC1
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Nov 2020 11:19:57 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id s13so16853821wmh.4
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Nov 2020 03:19:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+BSX8iGmFlpNBkCwyYHsXehrutNO54wnnUYTt1a8UO4=;
 b=kq+yTUs0Z36Ahw7u+PzIXO7sgObe2HM66BxwQRS4z8siLlP0bqTJ1E4ekPh8ZzB2xV
 KrPXoI5LzXiWCUU6gv/h+Ac5AkvBrXCtGIdXzqiD3E6fzjlaykwmpnp0ncc9mpMPXwpF
 7ZO7x5sszZgxTW0UZBhGM+nZPJNMfDadL033J9dDknwd0n71CmxAJxEfiOSfp9ZWRYzT
 VjWz7KhkCFs8qGvbkbLv6YhVXaOHIHxX+gga4D1/GLSvPxglfwfHNhszl9lcqHMNlukf
 3bU5zyK0fgnAlzHDZ9nRCXu6URdAznRm6+l/O3LsPeBn+y817mC4us+NHZemgltRJsTy
 MAFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+BSX8iGmFlpNBkCwyYHsXehrutNO54wnnUYTt1a8UO4=;
 b=o3y3PYS2Fw1MRtWZibexf9AtfMqPsYxBLo3XtmH1aa5GLb7rxDhX7Gd+HR8DW1TSa6
 LIzNjnW66lYkWtQvXCF1M2+3BWAhaaUex+0tITBWjke8mIiHr6iHhOebA41Tg7jHrB2b
 dGjmhHarxKd9bKsOBRfkbIbkE2cYcK99DeSwhJ74x6Jxv99fT45/cfn1/xh3Nw8m0aG/
 1L/7Va1aqIQpUB/6nn1X1C7fjgzJr3dwLGX2bW2FkE2eIYXDR5cehgHdlkOFq7FlO7qI
 wZKs/OgityWj8tv0RX0jBHsBiZ5+aGEn6mCsye/uYRiy+Z/CuhelHIWsuCbMvIHKjpD6
 uzFQ==
X-Gm-Message-State: AOAM530JTJeBXMoRWsrw/Rdc5rl5Acpfyvu5KzzSJoAgWy7u1AUN0Y5y
 00QKKWK2gmKMBgft1i7hZUoNzA==
X-Google-Smtp-Source: ABdhPJyN4OEr/YOxNYffIUn5qCnDBtG2DeSQZgaAWBIDjmJjXk/O+zQ0IJfMgrsLJnio9vIdj85SYw==
X-Received: by 2002:a1c:a185:: with SMTP id k127mr22882338wme.23.1606130396662; 
 Mon, 23 Nov 2020 03:19:56 -0800 (PST)
Received: from dell.default ([91.110.221.218])
 by smtp.gmail.com with ESMTPSA id n9sm16317290wmd.4.2020.11.23.03.19.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Nov 2020 03:19:56 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 27/40] drm/amd/include/navi12_ip_offset: Mark top-level
 IP_BASE as __maybe_unused
Date: Mon, 23 Nov 2020 11:19:06 +0000
Message-Id: <20201123111919.233376-28-lee.jones@linaro.org>
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
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogSW4gZmls
ZSBpbmNsdWRlZCBmcm9tIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L25hdmkxMl9yZWdfaW5p
dC5jOjI3OgogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vaW5jbHVkZS9uYXZpMTJfaXBf
b2Zmc2V0Lmg6MTc5OjI5OiB3YXJuaW5nOiDigJhVU0IwX0JBU0XigJkgZGVmaW5lZCBidXQgbm90
IHVzZWQgWy1XdW51c2VkLWNvbnN0LXZhcmlhYmxlPV0KIDE3OSB8IHN0YXRpYyBjb25zdCBzdHJ1
Y3QgSVBfQkFTRSBVU0IwX0JBU0UgPXsgeyB7IHsgMHgwMjQyQTgwMCwgMHgwNUIwMDAwMCwgMCwg
MCwgMCB9IH0sCiB8IF5+fn5+fn5+fgogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vaW5j
bHVkZS9uYXZpMTJfaXBfb2Zmc2V0Lmg6MTcyOjI5OiB3YXJuaW5nOiDigJhVTUNfQkFTReKAmSBk
ZWZpbmVkIGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQtY29uc3QtdmFyaWFibGU9XQogMTcyIHwgc3Rh
dGljIGNvbnN0IHN0cnVjdCBJUF9CQVNFIFVNQ19CQVNFID17IHsgeyB7IDB4MDAwMTQwMDAsIDB4
MDI0MjU4MDAsIDAsIDAsIDAgfSB9LAogfCBefn5+fn5+fgogZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvLi4vaW5jbHVkZS9uYXZpMTJfaXBfb2Zmc2V0Lmg6MTUxOjI5OiB3YXJuaW5nOiDigJhT
RE1BX0JBU0XigJkgZGVmaW5lZCBidXQgbm90IHVzZWQgWy1XdW51c2VkLWNvbnN0LXZhcmlhYmxl
PV0KIDE1MSB8IHN0YXRpYyBjb25zdCBzdHJ1Y3QgSVBfQkFTRSBTRE1BX0JBU0UgPXsgeyB7IHsg
MHgwMDAwMTI2MCwgMHgwMDAwQTAwMCwgMHgwMjQwMkMwMCwgMCwgMCB9IH0sCiB8IF5+fn5+fn5+
fgoKTkI6IFNuaXBwZWQgYSBmZXcgb2YgdGhlc2UKCkNjOiBBbGV4IERldWNoZXIgPGFsZXhhbmRl
ci5kZXVjaGVyQGFtZC5jb20+CkNjOiAiQ2hyaXN0aWFuIEvDtm5pZyIgPGNocmlzdGlhbi5rb2Vu
aWdAYW1kLmNvbT4KQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KQ2M6IERhbmll
bCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KQ2M6IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCkNjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnClNpZ25lZC1vZmYtYnk6IExl
ZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9p
bmNsdWRlL25hdmkxMl9pcF9vZmZzZXQuaCB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
aW5jbHVkZS9uYXZpMTJfaXBfb2Zmc2V0LmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2luY2x1ZGUv
bmF2aTEyX2lwX29mZnNldC5oCmluZGV4IDZjMmNjNjI5NmMwNjEuLmQ4ZmMwMDQ3OGI2YTAgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvaW5jbHVkZS9uYXZpMTJfaXBfb2Zmc2V0LmgK
KysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9pbmNsdWRlL25hdmkxMl9pcF9vZmZzZXQuaApAQCAt
MzMsNyArMzMsNyBAQCBzdHJ1Y3QgSVBfQkFTRV9JTlNUQU5DRQogc3RydWN0IElQX0JBU0UKIHsK
ICAgICBzdHJ1Y3QgSVBfQkFTRV9JTlNUQU5DRSBpbnN0YW5jZVtNQVhfSU5TVEFOQ0VdOwotfTsK
K30gX19tYXliZV91bnVzZWQ7CiAKIAogc3RhdGljIGNvbnN0IHN0cnVjdCBJUF9CQVNFIEFUSFVC
X0JBU0UgPXsgeyB7IHsgMHgwMDAwMEMwMCwgMHgwMjQwOEMwMCwgMCwgMCwgMCB9IH0sCi0tIAoy
LjI1LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
