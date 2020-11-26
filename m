Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A057F2C560F
	for <lists+dri-devel@lfdr.de>; Thu, 26 Nov 2020 14:43:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1E986E95B;
	Thu, 26 Nov 2020 13:42:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4A4C6E954
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Nov 2020 13:42:56 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id g14so2160897wrm.13
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Nov 2020 05:42:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OVaLmyvacPrY1rDoSMt/9G1ek5c/J/kPXEt2r1H/RjI=;
 b=F2cBuUeywubkOSdIZeQQGSOkWu7bs2lvYsnoh/sMGgtoODB+x3nOzrprIw4bW+NOhC
 1HArIKXo5vW+OQ827Tml7/kmK9Q5iXrEOhIU1LTaiwJJgCo2D2VV6u/5cI3BzmzPKo8L
 dxzGm1Z5ZWfFHWMwWyIZauQV1ZDzwm6vHRVMkrXmPtyCxcsTwuBj0cUsbf9iUNkTvcbE
 xTMgeqcxaGa3H4pLwbHbD4QvzZnNl4LhAj/2rOFjLjhmxKaRTZQnBKPd7uMFlzbHuoHi
 Q2lzTkJiYhrcjM9WpL6pUdQAEwXmYDU90a5gi9HzoDIZ34X3+FTwbxugBc9iTWbywbPj
 d37g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OVaLmyvacPrY1rDoSMt/9G1ek5c/J/kPXEt2r1H/RjI=;
 b=iLU1zYVW2atubBp5uEIbjEbbv0FOJiPvZW+b31VArCZY758gBVshr2DzIWWhs2KyQO
 762av7SxrolFZycQhBfUHLhCmaDzPgBV63fxxfWgvVnEEik/ox8h+fcyoOT+Dk8a4lWT
 7eZszQMcBDyKEg2AQEn5IQI6/YX/WumxmeHq8uguKx4vGglk4ljpHVM8h29SvWhn+EOe
 wqtV0rruRdqfIHehsoOZNKxWwnNTO/WabfOZPndBuGMQZiFdADCYAMGw1JP242MRhURS
 G2VuA+UW23dsi/qye+8H1e2JjKAjhOzAPeQepA7YVRgddtihcSYIim6PmaN1Z/ZfQiNF
 xw8Q==
X-Gm-Message-State: AOAM5309x5jMOLctiOtd0Il2O3azBxzKrfZtb2fDInTBMcQkM7xPXwQh
 pMbpkpfpr27wGiALfzjN7S3UhA==
X-Google-Smtp-Source: ABdhPJxfI0LU2ckWg4e0UGMMQXSTJKeWbI4Br1gKXvc+4RK9MNkeL8wdqdRuMbFSyo6qKpVFgmsJsQ==
X-Received: by 2002:adf:dd04:: with SMTP id a4mr3979594wrm.77.1606398175472;
 Thu, 26 Nov 2020 05:42:55 -0800 (PST)
Received: from dell.default ([91.110.221.235])
 by smtp.gmail.com with ESMTPSA id k205sm9275738wmk.4.2020.11.26.05.42.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Nov 2020 05:42:54 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 07/40] drm/amd/pm/powerplay/smumgr/fiji_smumgr: Demote
 kernel-doc format abuse
Date: Thu, 26 Nov 2020 13:42:07 +0000
Message-Id: <20201126134240.3214176-8-lee.jones@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vcG0vcG93ZXJwbGF5L3NtdW1nci9maWppX3NtdW1nci5j
OjExMDc6IHdhcm5pbmc6IEZ1bmN0aW9uIHBhcmFtZXRlciBvciBtZW1iZXIgJ21lbV9jbG9jaycg
bm90IGRlc2NyaWJlZCBpbiAnZmlqaV9nZXRfbWNsa19mcmVxdWVuY3lfcmF0aW8nCgpDYzogRXZh
biBRdWFuIDxldmFuLnF1YW5AYW1kLmNvbT4KQ2M6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRl
dWNoZXJAYW1kLmNvbT4KQ2M6ICJDaHJpc3RpYW4gS8O2bmlnIiA8Y2hyaXN0aWFuLmtvZW5pZ0Bh
bWQuY29tPgpDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgpDYzogRGFuaWVsIFZl
dHRlciA8ZGFuaWVsQGZmd2xsLmNoPgpDYzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
Q2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKU2lnbmVkLW9mZi1ieTogTGVlIEpv
bmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL3BtL3Bv
d2VycGxheS9zbXVtZ3IvZmlqaV9zbXVtZ3IuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvcG0vcG93ZXJwbGF5L3NtdW1nci9maWppX3NtdW1nci5jIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9wbS9wb3dlcnBsYXkvc211bWdyL2Zpamlfc211bWdyLmMKaW5kZXggZmVhMDA4Y2MxZjI1NC4u
MDJjMDk0YTA2NjA1ZCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wbS9wb3dlcnBs
YXkvc211bWdyL2Zpamlfc211bWdyLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wbS9wb3dl
cnBsYXkvc211bWdyL2Zpamlfc211bWdyLmMKQEAgLTEwOTAsNyArMTA5MCw3IEBAIHN0YXRpYyBp
bnQgZmlqaV9wb3B1bGF0ZV9hbGxfZ3JhcGhpY19sZXZlbHMoc3RydWN0IHBwX2h3bWdyICpod21n
cikKIH0KIAogCi0vKioKKy8qCiAgKiBNQ0xLIEZyZXF1ZW5jeSBSYXRpbwogICogU0VRX0NHX1JF
U1AgIEJpdFszMToyNF0gLSAweDAKICAqIEJpdFsyNzoyNF0gXDk2IEREUjMgRnJlcXVlbmN5IHJh
dGlvCi0tIAoyLjI1LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbAo=
