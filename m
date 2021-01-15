Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 484432F8362
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jan 2021 19:13:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F9606E45E;
	Fri, 15 Jan 2021 18:13:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2ABF6E457
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 18:13:26 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id 7so2965756wrz.0
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 10:13:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8fzZ9731GhrMXMJmVGpMkWndZV2lCJZqnwJ5TjxPTSs=;
 b=VLv18T//m35e1+2dIqkH1SvDm6ep+u85+YiYVoBayhkJq0Fo5kGhkzJednDi3CEhS7
 MQMCgq3ZXwij7qecAqGBES8zNlTtzDwbYxWmLwEVtInsV/7/5s8HK9SYgD0+YImGxUZa
 d4zqkA/OoYXoywIjLGYOiLiTdT/4vjUgOPBlhH+jOShM1ppshX1o44aHw0lgrwwS8R2b
 oSXF5ldU70vZ/ypBG955toEAbw+ie77kqQE90uSIs1cywTgldkiFsA8Isapd7EhNL2n7
 zsQg/SAPRlcjSRyJlBVIRYvUCkm3Cn0ipnW5cE3CWA0KLOnp18viSfxPwMGN1JZ3r3/O
 2M9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8fzZ9731GhrMXMJmVGpMkWndZV2lCJZqnwJ5TjxPTSs=;
 b=t/Uw5RImy8Mu39Q5UIQio3IyMWjrhOZU0CewoAyMOwSZSg4jGZ6gsodC0A5zz/EZLa
 oF59vH/FW8ArKQW8xoAckDgYEdMQteOoxx3A8SXPRQvGJTKJdjIK7ED45qBpvw4ygDS3
 BStQqZ3W9PXQPIh3GtWK2rK1Ye4N+jGMdmdooeUAPNfu3aEkdOevbmT47Ppb2DV2cfuM
 XIFZX9R3y6tqfh4A72KO+YMA85BVZGuNUSxRVX1/eyeJRQW3Ht6/bmTJU3y1GqOxHLL3
 0aQtieAvZY0e0/ciahYf3xdX4TZxlFydT0nGb+vkTdJ2tvCyhR9vl2jsoOiZK8eLl0JW
 9X+w==
X-Gm-Message-State: AOAM533vOEYuBDY/TFKxV5WJPYDIfDTo1c0Zhm7E45Ar3Sn4372OV5DH
 TBO0CGnYmd4lIqL6W+i5FPEM6A==
X-Google-Smtp-Source: ABdhPJznA2Wl1YFrtzDKMYW3dwJozKm8ADSN2o2+NRpfU8ADN4jG/jJu9XTqYIIxlotvF69iQ1C55Q==
X-Received: by 2002:adf:ab56:: with SMTP id r22mr14631360wrc.351.1610734405570; 
 Fri, 15 Jan 2021 10:13:25 -0800 (PST)
Received: from dell.default ([91.110.221.158])
 by smtp.gmail.com with ESMTPSA id j2sm16123484wrh.78.2021.01.15.10.13.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 10:13:24 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 07/40] drm/vmwgfx/vmwgfx_kms: Mark vmw_{cursor,
 primary}_plane_formats as __maybe_unused
Date: Fri, 15 Jan 2021 18:12:40 +0000
Message-Id: <20210115181313.3431493-8-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210115181313.3431493-1-lee.jones@linaro.org>
References: <20210115181313.3431493-1-lee.jones@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, Roland Scheidegger <sroland@vmware.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 VMware Graphics <linux-graphics-maintainer@vmware.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfa21zLmg6MjU2OjIzOiB3YXJuaW5nOiDigJh2bXdfY3Vy
c29yX3BsYW5lX2Zvcm1hdHPigJkgZGVmaW5lZCBidXQgbm90IHVzZWQgWy1XdW51c2VkLWNvbnN0
LXZhcmlhYmxlPV0KIGRyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X2ttcy5oOjI0ODoyMzog
d2FybmluZzog4oCYdm13X3ByaW1hcnlfcGxhbmVfZm9ybWF0c+KAmSBkZWZpbmVkIGJ1dCBub3Qg
dXNlZCBbLVd1bnVzZWQtY29uc3QtdmFyaWFibGU9XQogZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92
bXdnZnhfa21zLmg6MjU2OjIzOiB3YXJuaW5nOiDigJh2bXdfY3Vyc29yX3BsYW5lX2Zvcm1hdHPi
gJkgZGVmaW5lZCBidXQgbm90IHVzZWQgWy1XdW51c2VkLWNvbnN0LXZhcmlhYmxlPV0KIGRyaXZl
cnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X2ttcy5oOjI0ODoyMzogd2FybmluZzog4oCYdm13X3By
aW1hcnlfcGxhbmVfZm9ybWF0c+KAmSBkZWZpbmVkIGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQtY29u
c3QtdmFyaWFibGU9XQogZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfa21zLmg6MjU2OjIz
OiB3YXJuaW5nOiDigJh2bXdfY3Vyc29yX3BsYW5lX2Zvcm1hdHPigJkgZGVmaW5lZCBidXQgbm90
IHVzZWQgWy1XdW51c2VkLWNvbnN0LXZhcmlhYmxlPV0KIGRyaXZlcnMvZ3B1L2RybS92bXdnZngv
dm13Z2Z4X2ttcy5oOjI0ODoyMzogd2FybmluZzog4oCYdm13X3ByaW1hcnlfcGxhbmVfZm9ybWF0
c+KAmSBkZWZpbmVkIGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQtY29uc3QtdmFyaWFibGU9XQoKQ2M6
IFZNd2FyZSBHcmFwaGljcyA8bGludXgtZ3JhcGhpY3MtbWFpbnRhaW5lckB2bXdhcmUuY29tPgpD
YzogUm9sYW5kIFNjaGVpZGVnZ2VyIDxzcm9sYW5kQHZtd2FyZS5jb20+CkNjOiBEYXZpZCBBaXJs
aWUgPGFpcmxpZWRAbGludXguaWU+CkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+
CkNjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnClNpZ25lZC1vZmYtYnk6IExlZSBK
b25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92
bXdnZnhfa21zLmggfCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhf
a21zLmggYi9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9rbXMuaAppbmRleCAwM2YzNjk0
MDE1Y2VjLi42MjY3Y2NmNTQ5NDRlIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4
L3Ztd2dmeF9rbXMuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9rbXMuaApA
QCAtMjQ1LDcgKzI0NSw3IEBAIHN0cnVjdCB2bXdfZnJhbWVidWZmZXJfYm8gewogfTsKIAogCi1z
dGF0aWMgY29uc3QgdWludDMyX3Qgdm13X3ByaW1hcnlfcGxhbmVfZm9ybWF0c1tdID0geworc3Rh
dGljIGNvbnN0IHVpbnQzMl90IF9fbWF5YmVfdW51c2VkIHZtd19wcmltYXJ5X3BsYW5lX2Zvcm1h
dHNbXSA9IHsKIAlEUk1fRk9STUFUX1hSR0IxNTU1LAogCURSTV9GT1JNQVRfUkdCNTY1LAogCURS
TV9GT1JNQVRfUkdCODg4LApAQCAtMjUzLDcgKzI1Myw3IEBAIHN0YXRpYyBjb25zdCB1aW50MzJf
dCB2bXdfcHJpbWFyeV9wbGFuZV9mb3JtYXRzW10gPSB7CiAJRFJNX0ZPUk1BVF9BUkdCODg4OCwK
IH07CiAKLXN0YXRpYyBjb25zdCB1aW50MzJfdCB2bXdfY3Vyc29yX3BsYW5lX2Zvcm1hdHNbXSA9
IHsKK3N0YXRpYyBjb25zdCB1aW50MzJfdCBfX21heWJlX3VudXNlZCB2bXdfY3Vyc29yX3BsYW5l
X2Zvcm1hdHNbXSA9IHsKIAlEUk1fRk9STUFUX0FSR0I4ODg4LAogfTsKIAotLSAKMi4yNS4xCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
