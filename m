Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1157C2C5625
	for <lists+dri-devel@lfdr.de>; Thu, 26 Nov 2020 14:43:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 813416E95A;
	Thu, 26 Nov 2020 13:43:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67AC36E976
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Nov 2020 13:43:25 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id 1so2457077wme.3
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Nov 2020 05:43:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zMzTR5vhzo4BdnrJCmrInB6ds6XJwPsog3Z9fF6R2ds=;
 b=YVnwZsrr7sG3BHYwtr4MQW0aFJrpyD1AMT0vIyWvKcE71Md7uD7/R1HGxpYrZ+mLGc
 LeFTtH/ouu+XRI7m5k3wKbRSAWdT5hheLq1/QuRnxmNDiTlgIFJrrhudBnl8EV/RLAMr
 wWnX0ysGFBkhWiW/dGtbfC21e0xIXHmByq6e5otpAD420wMf+55cFJRcDnp6qajBpAZ4
 n87ywLwxtWbV8AiwIdfNBlpxykEfpASJ5MNiA0hqqd4t602Rt0Xo//VKfwTDbymFhPd0
 1144Nr5rim3Iu8GIBe+FjKnKVgabvyK9pIRGoq0tYp4NYkA5aZApC60sSMGcrkzNUDuU
 TKoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zMzTR5vhzo4BdnrJCmrInB6ds6XJwPsog3Z9fF6R2ds=;
 b=TWEFFbtESZh2oivRni/OQgE3Lw+HVb3H2VG6ukiNiHfX5OSq8QgfNEwEVSn3MTCc4V
 +PU1WPwcMGvKumvqX82pnzFAVq9HO2eJPVh1fLPJpttbAV4O38KtlZa7GN5tgwvJiWL4
 jCtjfltnjT/VaSWhrV7ZMu/osEvIgbw3YRi9hcqlKDbXnFDlrvvjJtuujHO9Ty40+xeW
 yBieOxLD+55BxPshGJBdwFlIWGpzJQj5pxJ1U3cVN/rme/UselLBQMh/H/ucsGb4SoDt
 t8Efhl8f+/UiMSAuBo6gwfXKBqd00GfS1h+mb1YZ4jbUosqldnKJwZFX+EgCC+PncMZj
 Kx/g==
X-Gm-Message-State: AOAM532S+6tD8M3zsOgpzuW3Vhqjk0tRktb7JVvhhoLWE5K/iwaV1qH3
 lDIhOGduQEUBsg+A40tsodIW5g==
X-Google-Smtp-Source: ABdhPJyhtdnIH1ikDDVg8piHiBypOWo1mfmoQmPid3U6du/K6yVg2piBxR5ziT9lEe57b37KzCa5WQ==
X-Received: by 2002:a7b:c950:: with SMTP id i16mr3536392wml.136.1606398204018; 
 Thu, 26 Nov 2020 05:43:24 -0800 (PST)
Received: from dell.default ([91.110.221.235])
 by smtp.gmail.com with ESMTPSA id k205sm9275738wmk.4.2020.11.26.05.43.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Nov 2020 05:43:23 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 26/40] drm/amd/pm/powerplay/hwmgr/hwmgr: Move
 'vega12_hwmgr_init()'s prototype to shared header
Date: Thu, 26 Nov 2020 13:42:26 +0000
Message-Id: <20201126134240.3214176-27-lee.jones@linaro.org>
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
cy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vcG0vcG93ZXJwbGF5L2h3bWdyL3ZlZ2ExMl9od21nci5j
OjI4NjI6NTogd2FybmluZzogbm8gcHJldmlvdXMgcHJvdG90eXBlIGZvciDigJh2ZWdhMTJfaHdt
Z3JfaW5pdOKAmSBbLVdtaXNzaW5nLXByb3RvdHlwZXNdCiAyODYyIHwgaW50IHZlZ2ExMl9od21n
cl9pbml0KHN0cnVjdCBwcF9od21nciAqaHdtZ3IpCiB8IF5+fn5+fn5+fn5+fn5+fn5+CgpDYzog
RXZhbiBRdWFuIDxldmFuLnF1YW5AYW1kLmNvbT4KQ2M6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVy
LmRldWNoZXJAYW1kLmNvbT4KQ2M6ICJDaHJpc3RpYW4gS8O2bmlnIiA8Y2hyaXN0aWFuLmtvZW5p
Z0BhbWQuY29tPgpDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgpDYzogRGFuaWVs
IFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgpDYzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKU2lnbmVkLW9mZi1ieTogTGVl
IEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bt
L2luYy9od21nci5oICAgICAgICAgICAgIHwgMSArCiBkcml2ZXJzL2dwdS9kcm0vYW1kL3BtL3Bv
d2VycGxheS9od21nci9od21nci5jIHwgMSAtCiAyIGZpbGVzIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wbS9p
bmMvaHdtZ3IuaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG0vaW5jL2h3bWdyLmgKaW5kZXggMzkz
ZTRlNzZhODk2MS4uNDk5ZjI1MjBiMWFhMyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9wbS9pbmMvaHdtZ3IuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3BtL2luYy9od21nci5o
CkBAIC04MzAsNSArODMwLDYgQEAgaW50IGh3bWdyX2hhbmRsZV90YXNrKHN0cnVjdCBwcF9od21n
ciAqaHdtZ3IsCiAKIGludCBzbXU3X2luaXRfZnVuY3Rpb25fcG9pbnRlcnMoc3RydWN0IHBwX2h3
bWdyICpod21ncik7CiBpbnQgc211OF9pbml0X2Z1bmN0aW9uX3BvaW50ZXJzKHN0cnVjdCBwcF9o
d21nciAqaHdtZ3IpOworaW50IHZlZ2ExMl9od21ncl9pbml0KHN0cnVjdCBwcF9od21nciAqaHdt
Z3IpOwogCiAjZW5kaWYgLyogX0hXTUdSX0hfICovCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL3BtL3Bvd2VycGxheS9od21nci9od21nci5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9w
bS9wb3dlcnBsYXkvaHdtZ3IvaHdtZ3IuYwppbmRleCA3OTk5MDkxY2NhMTZlLi40OWY4YTMzMWVi
MDJlIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3BtL3Bvd2VycGxheS9od21nci9o
d21nci5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG0vcG93ZXJwbGF5L2h3bWdyL2h3bWdy
LmMKQEAgLTQ3LDcgKzQ3LDYgQEAgZXh0ZXJuIGNvbnN0IHN0cnVjdCBwcF9zbXVtZ3JfZnVuYyBz
bXUxMF9zbXVfZnVuY3M7CiBleHRlcm4gY29uc3Qgc3RydWN0IHBwX3NtdW1ncl9mdW5jIHZlZ2Ey
MF9zbXVfZnVuY3M7CiAKIGV4dGVybiBpbnQgdmVnYTEwX2h3bWdyX2luaXQoc3RydWN0IHBwX2h3
bWdyICpod21ncik7Ci1leHRlcm4gaW50IHZlZ2ExMl9od21ncl9pbml0KHN0cnVjdCBwcF9od21n
ciAqaHdtZ3IpOwogZXh0ZXJuIGludCB2ZWdhMjBfaHdtZ3JfaW5pdChzdHJ1Y3QgcHBfaHdtZ3Ig
Kmh3bWdyKTsKIGV4dGVybiBpbnQgc211MTBfaW5pdF9mdW5jdGlvbl9wb2ludGVycyhzdHJ1Y3Qg
cHBfaHdtZ3IgKmh3bWdyKTsKIAotLSAKMi4yNS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWwK
