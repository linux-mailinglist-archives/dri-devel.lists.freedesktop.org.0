Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 282702EF89E
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jan 2021 21:15:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68B3A6E8C3;
	Fri,  8 Jan 2021 20:15:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D66986E8CF
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jan 2021 20:15:13 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id n16so7358010wmc.0
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Jan 2021 12:15:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Q1ACHhoDM3J5dELVH57xIAQUcf34vzdyN5ALWF0ycEQ=;
 b=RobXHiCalmxUMxBiwWjqlom0EWAsiBTcsj1Ei8+x90LUZCySBXgpU8xTX9j2i46Rr3
 KSEcIB2YfsMjrstXrKYwkRG9S1If6LX4l2XOFGd7hNeAZrjH6sXILEd0IAS6XiFAQOgP
 oPfRfGEI174ndsVXFXEAz/OemllVs6/5jWzo3rBlLT0dR2vnoBtSk5InuOzokUvtH8RJ
 MbVPJkJv5LWD4s19zLMoylEtumeVPqUuJaIuxcUHvNwlTm6fgh+SlhRWIRYdDDGerMJF
 vmL8H/PY2X2kTd3fyJBMupz9k0C8eoN5qBx+vAeLkglLl/mqFwST4u7pA+1GkBiup3HT
 zhMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Q1ACHhoDM3J5dELVH57xIAQUcf34vzdyN5ALWF0ycEQ=;
 b=FvcRNxmsAm8yA+Ty8REEC6O/h8c4jVLJwDw7SjvBAhbYm6oXZ0L7xj+yeMa2nClOua
 s/xGIFL8P3mmW/6QcdVtK3Oq8wnWQ71x0cWpB2RcN6iInZiHDIpb3cHqZJQGW6Q/QiLH
 ByN6gK2wjtH+4626cE4WkLkr5K0L9PjhoJjEczCT2ZhUcrSx0TlZKHd/+bULTHUtyO3S
 kXcDg5i86bnLPJINksE8qhM1LrevBfBBTaAarOhS3zoV7wUhCIa+EL3zbUcH55Iq7wtP
 Asolivscg/1nMXREkfO8SeRQhPgYkV9Ps3m6HQQsMfcXCOKU7jewhA4KE3y/xzDg73KI
 MrqA==
X-Gm-Message-State: AOAM530DZ11XQDB7C4xoaulKONd3Ex9l+EVsL0MyErHkUisJbEF/cRpE
 sGyMsGc6zj8s9gn2AOIdCHhvag==
X-Google-Smtp-Source: ABdhPJwIiHZnNFkLdYTqXNaGhsCT91nMtjQP7O3ZYXC9abXxyA0R72iKa5HOrjtFAsz6QNJH+FjOTA==
X-Received: by 2002:a1c:f604:: with SMTP id w4mr4578911wmc.39.1610136912570;
 Fri, 08 Jan 2021 12:15:12 -0800 (PST)
Received: from dell.default ([91.110.221.229])
 by smtp.gmail.com with ESMTPSA id l8sm15598671wrb.73.2021.01.08.12.15.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jan 2021 12:15:11 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 06/40] drm/amd/pm/powerplay/hwmgr/process_pptables_v1_0:
 Provide description of 'call_back_func'
Date: Fri,  8 Jan 2021 20:14:23 +0000
Message-Id: <20210108201457.3078600-7-lee.jones@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vcG0vcG93ZXJwbGF5L2h3bWdyL3Byb2Nlc3NfcHB0YWJs
ZXNfdjFfMC5jOjEzNzE6IHdhcm5pbmc6IEZ1bmN0aW9uIHBhcmFtZXRlciBvciBtZW1iZXIgJ2Nh
bGxfYmFja19mdW5jJyBub3QgZGVzY3JpYmVkIGluICdnZXRfcG93ZXJwbGF5X3RhYmxlX2VudHJ5
X3YxXzAnCgpDYzogRXZhbiBRdWFuIDxldmFuLnF1YW5AYW1kLmNvbT4KQ2M6IEFsZXggRGV1Y2hl
ciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KQ2M6ICJDaHJpc3RpYW4gS8O2bmlnIiA8Y2hy
aXN0aWFuLmtvZW5pZ0BhbWQuY29tPgpDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4Lmll
PgpDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgpDYzogYW1kLWdmeEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKU2lnbmVk
LW9mZi1ieTogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4KLS0tCiBkcml2ZXJzL2dw
dS9kcm0vYW1kL3BtL3Bvd2VycGxheS9od21nci9wcm9jZXNzX3BwdGFibGVzX3YxXzAuYyB8IDEg
KwogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9wbS9wb3dlcnBsYXkvaHdtZ3IvcHJvY2Vzc19wcHRhYmxlc192MV8wLmMgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL3BtL3Bvd2VycGxheS9od21nci9wcm9jZXNzX3BwdGFibGVzX3Yx
XzAuYwppbmRleCA3NDFlMDNhZDUzMTFmLi5mMmE1NWMxNDEzZjU5IDEwMDY0NAotLS0gYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL3BtL3Bvd2VycGxheS9od21nci9wcm9jZXNzX3BwdGFibGVzX3YxXzAu
YworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3BtL3Bvd2VycGxheS9od21nci9wcm9jZXNzX3Bw
dGFibGVzX3YxXzAuYwpAQCAtMTM2Miw2ICsxMzYyLDcgQEAgc3RhdGljIGludCBwcHRfZ2V0X3Zj
ZV9zdGF0ZV90YWJsZV9lbnRyeV92MV8wKHN0cnVjdCBwcF9od21nciAqaHdtZ3IsIHVpbnQzMl90
IGkKICAqIEBod21ncjogUG9pbnRlciB0byB0aGUgaGFyZHdhcmUgbWFuYWdlci4KICAqIEBlbnRy
eV9pbmRleDogVGhlIGluZGV4IG9mIHRoZSBlbnRyeSB0byBiZSBleHRyYWN0ZWQgZnJvbSB0aGUg
dGFibGUuCiAgKiBAcG93ZXJfc3RhdGU6IFRoZSBhZGRyZXNzIG9mIHRoZSBQb3dlclN0YXRlIGlu
c3RhbmNlIGJlaW5nIGNyZWF0ZWQuCisgKiBAY2FsbF9iYWNrX2Z1bmM6IFRoZSBmdW5jdGlvbiB0
byBjYWxsIGludG8gdG8gZmlsbCBwb3dlciBzdGF0ZQogICogUmV0dXJuOiAtMSBpZiB0aGUgZW50
cnkgY2Fubm90IGJlIHJldHJpZXZlZC4KICAqLwogaW50IGdldF9wb3dlcnBsYXlfdGFibGVfZW50
cnlfdjFfMChzdHJ1Y3QgcHBfaHdtZ3IgKmh3bWdyLAotLSAKMi4yNS4xCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
