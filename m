Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47DC72F1EE5
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jan 2021 20:20:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDCB28975F;
	Mon, 11 Jan 2021 19:20:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05B0489E7C
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jan 2021 19:19:58 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id y23so302475wmi.1
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jan 2021 11:19:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TNrmFPwKfzO7gGVeJXgh6mlXY4soyZtk9MOKSdUAh0g=;
 b=A7rFEb0NpwwXT9gbSmNZG+K3fWQndZl2/WjJJtCYNRFqJ1Tv5oiN45STNYGV0hRA9g
 sOTSZOBjf5f0sFct4xkHdaJqBcb+L5ebEfU9S3X2cSADcM9dOx+q0ykLSzrDKZJz6PB3
 SXGFuaem8J5K8503YbkueSDTTd7ph6N07iJLZ4gvVUgqM3OPAb3n6xEu9KWELO9NeGdU
 H4QHzJeYh4w1cOJa3XG2ETOO4PD12f+zG0x101YqSHrpfBShxMwd93DVVB9jJIpACTVg
 MbZkNftYMcluX3P0MjIZoy6pKS9txIjbirf01A+kMk9jEVGao6Jp60mnhvm7S8BXPJWh
 GYJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TNrmFPwKfzO7gGVeJXgh6mlXY4soyZtk9MOKSdUAh0g=;
 b=dL5iMouLt7UeZA1J9eB4Fh6Pl0T6jN+9UR8Zvv+YefdfNT/rDj5lkoBkuzlPVeSqFk
 l30n+w5nseATM+CmrrI7r55Bm7S4lxpsUbcSkwh5j1L8JVgqWazBEJEpJ0h7pEuP63rf
 vDiPpmyg3O1fnCusxORqkbVrBqfu7NrX+4fM10rRvkHSdf7wfh86ao9PQFB16MB/kL0p
 Jg2hmi1JBsTYpGbXvW2GcW6nUB1uXWwhIHmPfvezOVWfaisp+dvtp0Ey7E/YIujeT6I8
 NZeZf5N/YEg90WguVrlCxSkAgwwvj9a0jhSBSTY+WaYQGfIMI5GXm82mZO4Pj3XvWGCX
 U4mw==
X-Gm-Message-State: AOAM531+HDxm6+qrH+ZUSVYlwPlU3DzpSklrHAYxiA24sYIldJ0haPz9
 MfC/kvl9Yd9v158eN/sbInezfA==
X-Google-Smtp-Source: ABdhPJwRmVyOvGf3salMx7JCs/5UCKN5ZGZgaFgk22fzZglVbO7FJ8zMwOMQg13lKdj2nH4jX4wJvA==
X-Received: by 2002:a1c:6205:: with SMTP id w5mr306872wmb.26.1610392796639;
 Mon, 11 Jan 2021 11:19:56 -0800 (PST)
Received: from dell.default ([91.110.221.229])
 by smtp.gmail.com with ESMTPSA id n3sm778090wrw.61.2021.01.11.11.19.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 11:19:55 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 20/40] drm/amd/display/dc/dce110/dce110_timing_generator:
 Remove unused variable 'value_crtc_vtotal'
Date: Mon, 11 Jan 2021 19:19:06 +0000
Message-Id: <20210111191926.3688443-21-lee.jones@linaro.org>
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
Cc: Leo Li <sunpeng.li@amd.com>, Anthony Koo <Anthony.Koo@amd.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, Tony Cheng <Tony.Cheng@amd.com>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9kYy9kY2UxMTAvZGNlMTEwX3RpbWluZ19n
ZW5lcmF0b3IuYzogSW4gZnVuY3Rpb24g4oCYZGNlMTEwX3RpbWluZ19nZW5lcmF0b3JfdGVhcl9k
b3duX2dsb2JhbF9zd2FwX2xvY2vigJk6CiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9k
aXNwbGF5L2RjL2RjZTExMC9kY2UxMTBfdGltaW5nX2dlbmVyYXRvci5jOjEzNTQ6MTI6IHdhcm5p
bmc6IHZhcmlhYmxlIOKAmHZhbHVlX2NydGNfdnRvdGFs4oCZIHNldCBidXQgbm90IHVzZWQgWy1X
dW51c2VkLWJ1dC1zZXQtdmFyaWFibGVdCgpDYzogSGFycnkgV2VudGxhbmQgPGhhcnJ5LndlbnRs
YW5kQGFtZC5jb20+CkNjOiBMZW8gTGkgPHN1bnBlbmcubGlAYW1kLmNvbT4KQ2M6IEFsZXggRGV1
Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KQ2M6ICJDaHJpc3RpYW4gS8O2bmlnIiA8
Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgpDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4
LmllPgpDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgpDYzogQXJpYyBDeXIgPEFy
aWMuQ3lyQGFtZC5jb20+CkNjOiBBbnRob255IEtvbyA8QW50aG9ueS5Lb29AYW1kLmNvbT4KQ2M6
IFRvbnkgQ2hlbmcgPFRvbnkuQ2hlbmdAYW1kLmNvbT4KQ2M6IGFtZC1nZnhAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCkNjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnClNpZ25lZC1vZmYt
Ynk6IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+Ci0tLQogLi4uL2dwdS9kcm0vYW1k
L2Rpc3BsYXkvZGMvZGNlMTEwL2RjZTExMF90aW1pbmdfZ2VuZXJhdG9yLmMgIHwgNSArLS0tLQog
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2UxMTAvZGNlMTEwX3RpbWluZ19n
ZW5lcmF0b3IuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2UxMTAvZGNlMTEw
X3RpbWluZ19nZW5lcmF0b3IuYwppbmRleCAxZWE3ZGI4ZWViOTg4Li45YTZjNDExYmI3ZmU2IDEw
MDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlMTEwL2RjZTExMF90
aW1pbmdfZ2VuZXJhdG9yLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Rj
ZTExMC9kY2UxMTBfdGltaW5nX2dlbmVyYXRvci5jCkBAIC0xMzUxLDEwICsxMzUxLDcgQEAgdm9p
ZCBkY2UxMTBfdGltaW5nX2dlbmVyYXRvcl90ZWFyX2Rvd25fZ2xvYmFsX3N3YXBfbG9jaygKIAog
CS8qIFJlc3RvcmUgRENQX0dTTF9QVVJQT1NFX1NVUkZBQ0VfRkxJUCAqLwogCXsKLQkJdWludDMy
X3QgdmFsdWVfY3J0Y192dG90YWw7Ci0KLQkJdmFsdWVfY3J0Y192dG90YWwgPSBkbV9yZWFkX3Jl
Zyh0Zy0+Y3R4LAotCQkJCUNSVENfUkVHKG1tQ1JUQ19WX1RPVEFMKSk7CisJCWRtX3JlYWRfcmVn
KHRnLT5jdHgsIENSVENfUkVHKG1tQ1JUQ19WX1RPVEFMKSk7CiAKIAkJc2V0X3JlZ19maWVsZF92
YWx1ZSh2YWx1ZSwKIAkJCQkwLAotLSAKMi4yNS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWwK
