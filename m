Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E99872F45CB
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jan 2021 09:08:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70B066E07F;
	Wed, 13 Jan 2021 08:08:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDA0189FF9
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 08:08:20 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id c5so1067030wrp.6
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 00:08:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=r8/kdy25+oZx/uNDbhJDkZDT1TyOhQzo6tdoqzLeeYY=;
 b=Ix8nCYPNU/XT2iKvtKsMgQ6u2nvUKoXhtnv93uPzBrkS2d2uGV9+bwSpITZtp9gTQs
 0eqF5B+SFLW4DK9OrR2pzTeYuDKm+kIBaAYJpZjEJ4Y60fTOnEA/W7vsFFF3JmS9GRXz
 A9o9oFjFuWv/yFFb0kdM7jhQQi9YR4MaeugPWUKowTlo0ntyIEa8DV4a1wcRqNptjmHz
 5e2If+kl8VfjN/gxc9yfWSeHE1qug+jcQpHuWcM8USdkbvsDlYIeCK3bKtJgW5/FhYeJ
 HSLlIG1NpoNr7yhYIIrqePDccEjCRRt6lWY86cwGYSf8HUsXUIUxfNsun6Wxtf2b9ShN
 4iHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=r8/kdy25+oZx/uNDbhJDkZDT1TyOhQzo6tdoqzLeeYY=;
 b=PTZPxC/MFNpezIF60h4G9cUE0cj0xX3ySO3InXZNi097p0wXM3+KTIhKno2IjVZaw0
 RWoIsuBv52qTg9OzX9AwSD0vDBNjPN/+Gom7xNbcaZ0KKdi7tYptu6VSXvsdCz5UMFCh
 2JhSfB6UpmpnxRQ5ypbKj6L8BixxpqxN6xf1eRp3Iytt7cptnAWozFANSDHvljqK8OO2
 9wa0ymbAaK37irtHS4Spwjyxzm6piOrqY9PFKmiYDaI4ZMMaill7mTOzHFxkCc3EgKdZ
 HcCwmsL37M7WzxilsFPfxgR2nx9n0ugvGV+08Mr8Z0nk6uC2ykpsGGLn2hVil364JPOu
 41rQ==
X-Gm-Message-State: AOAM531tQrPv9Jdr20OlDfPIw/COrBDVjpGpvwsMDy1m3HoL+MM4tApf
 7wrWT9ggvNfotLzInlgle1j/A092D8bRdRsD
X-Google-Smtp-Source: ABdhPJyLPmAhEV8RkLWymbYSLvsMBDf3ChVGj/PjJVirElcB8p0dwnq88kAr/EkDEIB0wS4OYtyzDg==
X-Received: by 2002:a5d:4905:: with SMTP id x5mr1178774wrq.75.1610525299664;
 Wed, 13 Jan 2021 00:08:19 -0800 (PST)
Received: from dell.default ([91.110.221.229])
 by smtp.gmail.com with ESMTPSA id r20sm1642486wmh.15.2021.01.13.00.08.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jan 2021 00:08:18 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 19/30] drm/amd/display/dc/core/dc_link_dp: Mark
 'result_write_min_hblank' as __maybe_unused
Date: Wed, 13 Jan 2021 08:07:41 +0000
Message-Id: <20210113080752.1003793-20-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210113080752.1003793-1-lee.jones@linaro.org>
References: <20210113080752.1003793-1-lee.jones@linaro.org>
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
Cc: Leo Li <sunpeng.li@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SXQgbG9va3MgbGlrZSBpdCBjb3VsZCBiZSB1c2VkIGluc2lkZSB0aGUgRENfVFJBQ0VfTEVWRUxf
TUVTU0FHRSgpIG1hY3JvLgoKRml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdh
cm5pbmcocyk6CgogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9kYy9jb3Jl
L2RjX2xpbmtfZHAuYzogSW4gZnVuY3Rpb24g4oCYZHBjZF9zZXRfc291cmNlX3NwZWNpZmljX2Rh
dGHigJk6CiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9kaXNwbGF5L2RjL2NvcmUvZGNf
bGlua19kcC5jOjQ0MDM6MTg6IHdhcm5pbmc6IHZhcmlhYmxlIOKAmHJlc3VsdF93cml0ZV9taW5f
aGJsYW5r4oCZIHNldCBidXQgbm90IHVzZWQgWy1XdW51c2VkLWJ1dC1zZXQtdmFyaWFibGVdCgpD
YzogSGFycnkgV2VudGxhbmQgPGhhcnJ5LndlbnRsYW5kQGFtZC5jb20+CkNjOiBMZW8gTGkgPHN1
bnBlbmcubGlAYW1kLmNvbT4KQ2M6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1k
LmNvbT4KQ2M6ICJDaHJpc3RpYW4gS8O2bmlnIiA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgpD
YzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgpDYzogRGFuaWVsIFZldHRlciA8ZGFu
aWVsQGZmd2xsLmNoPgpDYzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKQ2M6IGRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKU2lnbmVkLW9mZi1ieTogTGVlIEpvbmVzIDxsZWUu
am9uZXNAbGluYXJvLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29y
ZS9kY19saW5rX2RwLmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEg
ZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMv
Y29yZS9kY19saW5rX2RwLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9k
Y19saW5rX2RwLmMKaW5kZXggM2MzM2I4ZmUyMThlNS4uYjllNWUwZWVlM2QyNCAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGNfbGlua19kcC5jCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjX2xpbmtfZHAuYwpAQCAtNDQw
MCw3ICs0NDAwLDcgQEAgdm9pZCBkcF9zZXRfZmVjX2VuYWJsZShzdHJ1Y3QgZGNfbGluayAqbGlu
aywgYm9vbCBlbmFibGUpCiB2b2lkIGRwY2Rfc2V0X3NvdXJjZV9zcGVjaWZpY19kYXRhKHN0cnVj
dCBkY19saW5rICpsaW5rKQogewogCWlmICghbGluay0+ZGMtPnZlbmRvcl9zaWduYXR1cmUuaXNf
dmFsaWQpIHsKLQkJZW51bSBkY19zdGF0dXMgcmVzdWx0X3dyaXRlX21pbl9oYmxhbmsgPSBEQ19O
T1RfU1VQUE9SVEVEOworCQllbnVtIGRjX3N0YXR1cyBfX21heWJlX3VudXNlZCByZXN1bHRfd3Jp
dGVfbWluX2hibGFuayA9IERDX05PVF9TVVBQT1JURUQ7CiAJCXN0cnVjdCBkcGNkX2FtZF9zaWdu
YXR1cmUgYW1kX3NpZ25hdHVyZTsKIAkJYW1kX3NpZ25hdHVyZS5BTURfSUVFRV9UeFNpZ25hdHVy
ZV9ieXRlMSA9IDB4MDsKIAkJYW1kX3NpZ25hdHVyZS5BTURfSUVFRV9UeFNpZ25hdHVyZV9ieXRl
MiA9IDB4MDsKLS0gCjIuMjUuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVsCg==
