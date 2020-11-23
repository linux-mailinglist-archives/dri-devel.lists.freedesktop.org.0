Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 835862C0437
	for <lists+dri-devel@lfdr.de>; Mon, 23 Nov 2020 12:21:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F4FD89EB7;
	Mon, 23 Nov 2020 11:21:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2468789FA9
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Nov 2020 11:20:19 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id x13so7471912wmj.1
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Nov 2020 03:20:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3XzaLPcLzyh2up8e5kwP+nCHZJEB2WNWkcaV5TphNj8=;
 b=fFIghWFECT8oOj8Gu6q8wWn9L5Fsp3uSgLhqf4xoYHzANzX9dnQy+cCA25K4kRYNg7
 FZ2lQihD8sQIOAZh9U99hIjJKi/4DqiRzkm+KMU2/FoHpzwC82+M8bNqfnVvEmKrm8t/
 lfxAuN4z4hfJNTekVocscG1M+td6PQFn1y8fWKMtOULHbg1wBKDyhAcnpBFudv5YTyzS
 qeG35MgmaOjGVq5q81vUOK9ppiAYrv9JfodWa7vBEJxkBEhINB+44gRA2QXEMyj81anE
 0rZFFj6ta/VsXd6K2OtmQI7hbWA8UBuHofWGPJEiVBedvS74vena5C/SamFn+8lWjn9s
 XvXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3XzaLPcLzyh2up8e5kwP+nCHZJEB2WNWkcaV5TphNj8=;
 b=U6lVTwdbky8W7rZ8gmOuc8pGzbArFWbK00uBlQSu6e8zHi+fgzw2a6n5WhlBqQwsrV
 Fg7M7UQf1Oo93A88YB4nQFvK4OP1CWQbrv6WzXZxFJzMcewpAeTIPNbGSTeJKSbBu7Ku
 w0Ppx18XbdAkOuYPGg2gMD7pANfEger1gj7x2J3d5mXNi9tnxsJJijY6lowpiC/0qyv/
 bM3DMdA0vDJCLohaI434JzFqlizesO1uV2tQNA+Rc0MiaexBdxgY5rm4xSkqVNhkL9yb
 XkGDOV43TEtWkkEU0/4zlBzlo1dyGE/cMz3JMWg5QEPJSGPXnX1Y2azvnyJ/aItlJDdX
 ot0Q==
X-Gm-Message-State: AOAM531nogsOiZjqLkRi5YJeb1j+g6xidfuDiT5ZTheGpEJoOp+YPKY9
 FyraiQUufy6HCF8poQrEeIDe5w==
X-Google-Smtp-Source: ABdhPJw4krFHGvCPonuYMQCc5j4oEqKwHKw6hTdw1CAKFuCsPJi/oWSZPQ18RWzyyhjvj3TopaDe2A==
X-Received: by 2002:a1c:a185:: with SMTP id k127mr22884154wme.23.1606130417818; 
 Mon, 23 Nov 2020 03:20:17 -0800 (PST)
Received: from dell.default ([91.110.221.218])
 by smtp.gmail.com with ESMTPSA id n9sm16317290wmd.4.2020.11.23.03.20.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Nov 2020 03:20:17 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 40/40] drm/amd/amdgpu/gmc_v9_0: Suppy some missing function
 doc descriptions
Date: Mon, 23 Nov 2020 11:19:19 +0000
Message-Id: <20201123111919.233376-41-lee.jones@linaro.org>
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

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y5XzAuYzozODI6MjM6IHdhcm5pbmc6IOKAmGVjY191
bWNfbWN1bWNfc3RhdHVzX2FkZHJz4oCZIGRlZmluZWQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC1j
b25zdC12YXJpYWJsZT1dCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlfMC5jOjcy
MDogd2FybmluZzogRnVuY3Rpb24gcGFyYW1ldGVyIG9yIG1lbWJlciAndm1odWInIG5vdCBkZXNj
cmliZWQgaW4gJ2dtY192OV8wX2ZsdXNoX2dwdV90bGInCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9nbWNfdjlfMC5jOjgzNjogd2FybmluZzogRnVuY3Rpb24gcGFyYW1ldGVyIG9yIG1lbWJl
ciAnZmx1c2hfdHlwZScgbm90IGRlc2NyaWJlZCBpbiAnZ21jX3Y5XzBfZmx1c2hfZ3B1X3RsYl9w
YXNpZCcKIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OV8wLmM6ODM2OiB3YXJuaW5n
OiBGdW5jdGlvbiBwYXJhbWV0ZXIgb3IgbWVtYmVyICdhbGxfaHViJyBub3QgZGVzY3JpYmVkIGlu
ICdnbWNfdjlfMF9mbHVzaF9ncHVfdGxiX3Bhc2lkJwoKQ2M6IEFsZXggRGV1Y2hlciA8YWxleGFu
ZGVyLmRldWNoZXJAYW1kLmNvbT4KQ2M6ICJDaHJpc3RpYW4gS8O2bmlnIiA8Y2hyaXN0aWFuLmtv
ZW5pZ0BhbWQuY29tPgpDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgpDYzogRGFu
aWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgpDYzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKU2lnbmVkLW9mZi1ieTog
TGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9nbWNfdjlfMC5jIHwgMyArKysKIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMo
KykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlfMC5jIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y5XzAuYwppbmRleCBmYmVlNDNiNGJhNjRk
Li5hODM3NDNhYjNlOGJiIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9n
bWNfdjlfMC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OV8wLmMKQEAg
LTY3NSw2ICs2NzUsNyBAQCBzdGF0aWMgYm9vbCBnbWNfdjlfMF9nZXRfYXRjX3ZtaWRfcGFzaWRf
bWFwcGluZ19pbmZvKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAogICoKICAqIEBhZGV2OiBh
bWRncHVfZGV2aWNlIHBvaW50ZXIKICAqIEB2bWlkOiB2bSBpbnN0YW5jZSB0byBmbHVzaAorICog
QHZtaHViOiB2bWh1YiB0eXBlCiAgKiBAZmx1c2hfdHlwZTogdGhlIGZsdXNoIHR5cGUKICAqCiAg
KiBGbHVzaCB0aGUgVExCIGZvciB0aGUgcmVxdWVzdGVkIHBhZ2UgdGFibGUgdXNpbmcgY2VydGFp
biB0eXBlLgpAQCAtNzkxLDYgKzc5Miw4IEBAIHN0YXRpYyB2b2lkIGdtY192OV8wX2ZsdXNoX2dw
dV90bGIoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsIHVpbnQzMl90IHZtaWQsCiAgKgogICog
QGFkZXY6IGFtZGdwdV9kZXZpY2UgcG9pbnRlcgogICogQHBhc2lkOiBwYXNpZCB0byBiZSBmbHVz
aAorICogQGZsdXNoX3R5cGU6IHRoZSBmbHVzaCB0eXBlCisgKiBAYWxsX2h1YjogVXNlZCB3aXRo
IFBBQ0tFVDNfSU5WQUxJREFURV9UTEJTX0FMTF9IVUIoKQogICoKICAqIEZsdXNoIHRoZSBUTEIg
Zm9yIHRoZSByZXF1ZXN0ZWQgcGFzaWQuCiAgKi8KLS0gCjIuMjUuMQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
