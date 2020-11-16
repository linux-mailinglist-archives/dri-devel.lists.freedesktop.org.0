Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 86D1B2B4DBE
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 18:42:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED9BA6EA05;
	Mon, 16 Nov 2020 17:42:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E45B6EA00
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 17:41:53 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id c9so35275wml.5
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 09:41:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+170YZVUptUVP8b8DCIuLCBL2J9gnyH4hHHhpysSOuQ=;
 b=rJZgv0r3y1uaooYzLQ77T067OtNBcziJ1kMk4hccmXIIg+vWYcZOw6hRxBvEbvrc0e
 54BY9C/GyH3afuOmhUyh6oT2QBbXnogaeE9MwZ8W5t2+aGcJ3fqzTwm9tMeqqBDsagX9
 9IkPccddWCzGVUmqxsrk1Dhwh1XIH8iyVoIKyOqo0YydsxRfN8zwh930DQ8CFItkCyld
 8XlOZ70+ZtnSKmSDmqzspsXieifAqjySJVAavAWNnzUcekoawVH3eL0zRZC+k2YBSfqQ
 gUpEssUZXiRRFwtseSyNvOhXWtr/4Qbonpf5kRYeA35GUHQD3fpKSDAovTkR3QY/Vhag
 HIFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+170YZVUptUVP8b8DCIuLCBL2J9gnyH4hHHhpysSOuQ=;
 b=kQg1lbn8NduDq6italiPMv9FG0lE91VKECw2st3Jd8IrHxF+sp7NSA31FIJnBjQjhe
 6pxnONiBOk34kr6K4cjzAewVGWAa7e+nDZtyU/dJAhVJuqqwZkUsoHD6gDWQ3Z2Y1A4W
 VdPooeqKygoEuP8yIBNCfqZQt1FsxXSaQtvf8/PA92qrYxGw5NCezmfmaDxyNttC1j6G
 /LqF1tby6kVTOBkiUBCkeZ0dedGUnBFWrsAyt5SFt76jggdLNIGTI+La3bn8bXWg2ZG3
 1zdTkWlPxpn17WhUFv95g3Qu3i9aRpTEiurYbVJ7TKcoUzbnFyrukr478M9FrHtxfsfo
 hLLw==
X-Gm-Message-State: AOAM530ZHl+lm414X9hwLuYouhunmjT41nsZojLZLCSamqXbXrLasicl
 /rbfG8txwlDIuPf8KXiNmexoN7qky1Vt+FWV
X-Google-Smtp-Source: ABdhPJzrdNHfcckGPvTVYiKyOTyfZ8lac3YqV+u13joqzDyl9nbQ+6pDIovDVylNGHeenJsooQOrxA==
X-Received: by 2002:a1c:6704:: with SMTP id b4mr28166wmc.96.1605548512097;
 Mon, 16 Nov 2020 09:41:52 -0800 (PST)
Received: from dell.default ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id n10sm24667224wrx.9.2020.11.16.09.41.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 09:41:51 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 22/42] drm/pl111/pl111_display: Make local function static
Date: Mon, 16 Nov 2020 17:40:52 +0000
Message-Id: <20201116174112.1833368-23-lee.jones@linaro.org>
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
