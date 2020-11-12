Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E2AC2B0D2E
	for <lists+dri-devel@lfdr.de>; Thu, 12 Nov 2020 20:01:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BAC76E3AE;
	Thu, 12 Nov 2020 19:01:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CEC96E3AE
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Nov 2020 19:01:22 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id o15so7155903wru.6
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Nov 2020 11:01:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QNH9kt00Ytktj23I8cCOxWaGTDw/PvYngQ1rA6iE+q8=;
 b=ftVe61vl1qHazPhsUFSHiMVrrXrdpSLAdqtZdV0KiAUu+I4967UqclrYIfnxHdS7BZ
 2M4+lPokvvsQdoh076IAg87Fh4Au+4HCycCxdH5pGzeluuftd3dUU1nlPgDwd6LMyKYL
 xe7jQ7PoAxwZC9EhN07fdr3LK5zOfKcrwtm9Uy7F38YFFGOh6l9+VjlF/Kpf+UPDKjXC
 vicRjcjjFMRlKxs8elyYuEe6n/jfOjhShF758j3BDkXeK7KHR7cEfufg0/OFJMISlzkX
 25dpMFYDpFFpS5MSug+pRZu4qsFPPkhrDjN91h9/CvCk7X1O75dOXDvK4boMGEJFXW9Q
 KskA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QNH9kt00Ytktj23I8cCOxWaGTDw/PvYngQ1rA6iE+q8=;
 b=EEGjOzmP+Q/3Vtvd70ojaiyBfwbLdVxUm8IPWA7mYiXg+NvNKDWsxQb4pS8zL6XZ+U
 QOI6gF7nLxu0pjkJe6GEMZAI3IvjnzObVz0wGWh0Enbb307nhLFZ/G3p0ueK1Ihq2QEl
 sFNSZpdqY++0t5mtcgSuECJdZ8CkohiIDuQ2xTqIDXB5djDPmjUt8DGqH1ns0fO3XyQG
 btoCc2OVa6k2UUbrl9f68qy7dWsGPelfAiZGciACDlxBmtnKkkBI86GG2p7R4+g5XhJD
 +OWMOpNHUauAWLnB07pLn9D9kHa8MYWmu08bI9sccC6NDG2cSnlBeGaGCp0OpVbbj8zi
 rbvw==
X-Gm-Message-State: AOAM532PDH92dcN5EfF6W9lqh39YL5Y3VScNqwvdPp7vWgxtSlzGsNTJ
 WM0ujNN3u74806kN885hxq7cMw==
X-Google-Smtp-Source: ABdhPJxqE+Vnjbqg3AQ2n83jBzCYDEN+itVbbaY8NSM3c51Pltt0EeCp3GT9E4rYzQ7RuFtH8dmpbQ==
X-Received: by 2002:a5d:5643:: with SMTP id j3mr1076296wrw.43.1605207680754;
 Thu, 12 Nov 2020 11:01:20 -0800 (PST)
Received: from dell.default ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id p4sm8105214wrm.51.2020.11.12.11.01.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Nov 2020 11:01:20 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 17/30] drm/atmel-hlcdc/atmel_hlcdc_plane: Fix documentation
 formatting and add missing description
Date: Thu, 12 Nov 2020 19:00:26 +0000
Message-Id: <20201112190039.2785914-18-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201112190039.2785914-1-lee.jones@linaro.org>
References: <20201112190039.2785914-1-lee.jones@linaro.org>
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Boris Brezillon <bbrezillon@kernel.org>, David Airlie <airlied@linux.ie>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Sam Ravnborg <sam@ravnborg.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL2F0bWVsLWhsY2RjL2F0bWVsX2hsY2RjX3BsYW5lLmM6MjgzOjY6IHdhcm5pbmc6
IG5vIHByZXZpb3VzIHByb3RvdHlwZSBmb3Ig4oCYYXRtZWxfaGxjZGNfcGxhbmVfc2V0dXBfc2Nh
bGVy4oCZIFstV21pc3NpbmctcHJvdG90eXBlc10KIGRyaXZlcnMvZ3B1L2RybS9hdG1lbC1obGNk
Yy9hdG1lbF9obGNkY19wbGFuZS5jOjQ0OiB3YXJuaW5nOiBjYW5ub3QgdW5kZXJzdGFuZCBmdW5j
dGlvbiBwcm90b3R5cGU6ICdzdHJ1Y3QgYXRtZWxfaGxjZGNfcGxhbmVfc3RhdGUgJwoKQ2M6IFNh
bSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KQ2M6IEJvcmlzIEJyZXppbGxvbiA8YmJyZXpp
bGxvbkBrZXJuZWwub3JnPgpDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgpDYzog
RGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgpDYzogTmljb2xhcyBGZXJyZSA8bmljb2xh
cy5mZXJyZUBtaWNyb2NoaXAuY29tPgpDYzogQWxleGFuZHJlIEJlbGxvbmkgPGFsZXhhbmRyZS5i
ZWxsb25pQGJvb3RsaW4uY29tPgpDYzogTHVkb3ZpYyBEZXNyb2NoZXMgPGx1ZG92aWMuZGVzcm9j
aGVzQG1pY3JvY2hpcC5jb20+CkNjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCkNj
OiBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcKU2lnbmVkLW9mZi1ieTogTGVl
IEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYXRtZWwt
aGxjZGMvYXRtZWxfaGxjZGNfcGxhbmUuYyB8IDMgKystCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNl
cnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2F0
bWVsLWhsY2RjL2F0bWVsX2hsY2RjX3BsYW5lLmMgYi9kcml2ZXJzL2dwdS9kcm0vYXRtZWwtaGxj
ZGMvYXRtZWxfaGxjZGNfcGxhbmUuYwppbmRleCAyZDUwMmQyM2FiMTJkLi4xNWJjOTMxNjM4MzNi
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXRtZWwtaGxjZGMvYXRtZWxfaGxjZGNfcGxh
bmUuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYXRtZWwtaGxjZGMvYXRtZWxfaGxjZGNfcGxhbmUu
YwpAQCAtMTksNyArMTksNyBAQAogI2luY2x1ZGUgImF0bWVsX2hsY2RjX2RjLmgiCiAKIC8qKgot
ICogQXRtZWwgSExDREMgUGxhbmUgc3RhdGUgc3RydWN0dXJlLgorICogc3RydWN0IGF0bWVsX2hs
Y2RjX3BsYW5lX3N0YXRlIC0gQXRtZWwgSExDREMgUGxhbmUgc3RhdGUgc3RydWN0dXJlLgogICoK
ICAqIEBiYXNlOiBEUk0gcGxhbmUgc3RhdGUKICAqIEBjcnRjX3g6IHggcG9zaXRpb24gb2YgdGhl
IHBsYW5lIHJlbGF0aXZlIHRvIHRoZSBDUlRDCkBAIC0zNCw2ICszNCw3IEBACiAgKiBAZGlzY195
OiB5IGRpc2NhcmQgcG9zaXRpb24KICAqIEBkaXNjX3c6IGRpc2NhcmQgd2lkdGgKICAqIEBkaXNj
X2g6IGRpc2NhcmQgaGVpZ2h0CisgKiBAYWhiX2lkOiBBSEIgaWRlbnRpZmljYXRpb24gbnVtYmVy
CiAgKiBAYnBwOiBieXRlcyBwZXIgcGl4ZWwgZGVkdWNlZCBmcm9tIHBpeGVsX2Zvcm1hdAogICog
QG9mZnNldHM6IG9mZnNldHMgdG8gYXBwbHkgdG8gdGhlIEdFTSBidWZmZXJzCiAgKiBAeHN0cmlk
ZTogdmFsdWUgdG8gYWRkIHRvIHRoZSBwaXhlbCBwb2ludGVyIGJldHdlZW4gZWFjaCBsaW5lCi0t
IAoyLjI1LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
