Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A806C2B1C35
	for <lists+dri-devel@lfdr.de>; Fri, 13 Nov 2020 14:50:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B57406E50E;
	Fri, 13 Nov 2020 13:49:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 022646E4EC
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Nov 2020 13:49:58 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id c17so9946750wrc.11
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Nov 2020 05:49:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+170YZVUptUVP8b8DCIuLCBL2J9gnyH4hHHhpysSOuQ=;
 b=EQpRZyqJUsVS4E/rFG6b8qdqj3RFz0tJHBcF1joK7ObcVM37yHd54OpRfevso3poBE
 M5OLhmyu7OkAIv70yzV+TJDxDkNXhyMs1fRWneF6elDNWjnWFwBRutoWPDfzP4+tY65O
 WWovQI0//2V8n9+aZMQtFE0vB7R5yzfroi/LJrQkbDRBnFsghAyXlFhrCdxPlz356hrR
 H03q3WVIa+V3oIvCzXAzTSRqtg+E0xP5+tnLloYx4W0w++YwwuUvPr4Nv1qmm0xfb7uq
 dQKrZB3olz26+UKqQXCgWyvbmODltp1tYhJLRMzwEdW731pX63JSgPKBUEXD33pKvqhV
 I3Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+170YZVUptUVP8b8DCIuLCBL2J9gnyH4hHHhpysSOuQ=;
 b=lTKi7RTGYGfKeEvwhFRYqv+IgDYP12xoPBlQJFBwB4zu+7i5bQarWa+NSlQOA/t9tY
 1r27c4zL2KQA4WMRD5kJCoWB6oJ/f2vix0uORifB2DlZ68DeJNKiGhVumYfWJaCov2Kz
 tDNpZT1dIF7baFwezJ6AOWVYddOLwZ5uEUgoZZJYFRzjCy6mm2k8/qqhIIPpoepJm7Fh
 w/w+Sw0i05de094LUCL8wPRYLMeYFyUseYrxbLDwIMtLSRRIrP2JP9PHtBt9GPq7dOrg
 +uuOoQIdaVp4YvXlPIClHaL6x4uXk+91dZV4kbeE0tRQGTlek+Loxr/5ZAWeO/X8yTAY
 wcFw==
X-Gm-Message-State: AOAM5313gbLuTUDkbIc8cu/jOgFSJZkC8zAeap8kJia1MI4aO5WuyWPg
 SUbtz9DfSDrHuNMWs4JvlDNP7w==
X-Google-Smtp-Source: ABdhPJz2mDCjShB59VT0qzKRspALhSVwp6JJFpyxkcVROfD061boAy4T4UGLpdh8lzEfDUo50TLgOg==
X-Received: by 2002:a5d:4612:: with SMTP id t18mr3537576wrq.401.1605275396744; 
 Fri, 13 Nov 2020 05:49:56 -0800 (PST)
Received: from dell.default ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id t11sm4561614wrm.8.2020.11.13.05.49.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Nov 2020 05:49:56 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 12/40] drm/pl111/pl111_display: Make local function static
Date: Fri, 13 Nov 2020 13:49:10 +0000
Message-Id: <20201113134938.4004947-13-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201113134938.4004947-1-lee.jones@linaro.org>
References: <20201113134938.4004947-1-lee.jones@linaro.org>
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
cy9ncHUvZHJtL3BsMTExL3BsMTExX2Rpc3BsYXkuYzozNTY6Njogd2FybmluZzogbm8gcHJldmlv
dXMgcHJvdG90eXBlIGZvciDigJhwbDExMV9kaXNwbGF5X2Rpc2FibGXigJkgWy1XbWlzc2luZy1w
cm90b3R5cGVzXQoKQ2M6IEVyaWMgQW5ob2x0IDxlcmljQGFuaG9sdC5uZXQ+CkNjOiBEYXZpZCBB
aXJsaWUgPGFpcmxpZWRAbGludXguaWU+CkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwu
Y2g+CkNjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnClNpZ25lZC1vZmYtYnk6IExl
ZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3BsMTEx
L3BsMTExX2Rpc3BsYXkuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwg
MSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9wbDExMS9wbDExMV9k
aXNwbGF5LmMgYi9kcml2ZXJzL2dwdS9kcm0vcGwxMTEvcGwxMTFfZGlzcGxheS5jCmluZGV4IGIz
ZTg2OTdjYWZjZjEuLjY5YzAyZTdjODJiN2UgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9w
bDExMS9wbDExMV9kaXNwbGF5LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3BsMTExL3BsMTExX2Rp
c3BsYXkuYwpAQCAtMzUzLDcgKzM1Myw3IEBAIHN0YXRpYyB2b2lkIHBsMTExX2Rpc3BsYXlfZW5h
YmxlKHN0cnVjdCBkcm1fc2ltcGxlX2Rpc3BsYXlfcGlwZSAqcGlwZSwKIAkJZHJtX2NydGNfdmJs
YW5rX29uKGNydGMpOwogfQogCi12b2lkIHBsMTExX2Rpc3BsYXlfZGlzYWJsZShzdHJ1Y3QgZHJt
X3NpbXBsZV9kaXNwbGF5X3BpcGUgKnBpcGUpCitzdGF0aWMgdm9pZCBwbDExMV9kaXNwbGF5X2Rp
c2FibGUoc3RydWN0IGRybV9zaW1wbGVfZGlzcGxheV9waXBlICpwaXBlKQogewogCXN0cnVjdCBk
cm1fY3J0YyAqY3J0YyA9ICZwaXBlLT5jcnRjOwogCXN0cnVjdCBkcm1fZGV2aWNlICpkcm0gPSBj
cnRjLT5kZXY7Ci0tIAoyLjI1LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbAo=
