Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22B4732B830
	for <lists+dri-devel@lfdr.de>; Wed,  3 Mar 2021 14:44:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B18DD6E8F9;
	Wed,  3 Mar 2021 13:44:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4CBF6E406
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Mar 2021 13:43:59 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id o2so5882905wme.5
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Mar 2021 05:43:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=87fsu4OIs39RkiShLHPl5EVCCmtcdhx0DNDxe5fguYo=;
 b=yCtW0Uu0wfAY7fOoVNPYGtXF8o5hem7JHg0aQPaKs1sqYNr2HI1Kz92nBLlu9Sgyzp
 gWRNdVmIkZmVmLYE87d51DQTZHDHFkInhe/0uWOYHxNS8ylaiX2lc4+/1L2qlCYAJU83
 2I6YOzEaC4vuqy2Anc91mviMDAV3TFqX9FlV9TOgUfzYTAm6uXMDo6ZSFTxzgFmT4o2e
 EL6Xwwx7p4d4NvcyXm1e2ZuX2otL/va7ZXsp+vQRLQdgNJUZ10wrAs0RU+n+aM+s0KtK
 9eEzRhiUuu1U2KC5dk77+h1PMAqrexS05ly8M7vuiqWh+vjHhwDdW8L5JTU/IqEifW2c
 kaqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=87fsu4OIs39RkiShLHPl5EVCCmtcdhx0DNDxe5fguYo=;
 b=m61uh9stRkjkr8GmXhjncLnYcH5Je8tMKrxrypgyS0L96lBVNm+kgNtRWiWyylret1
 w0jHOhvZJzRd9c7qjve6EjJackbSiVqE1sbhrr9tSy1T3JOFfzyrG6c7boM3/95Ce8lW
 t2CzlFq8CCDHTaLf0KDrIWn9IQ1kwiiFce2zdFRjYqg8TBCI0RchV1bp09HPHU24CTM2
 t6Jry+IphYgyYs0DhljBT7+uCYOXzxd0PyAOaqReB9tksSi5dX1p8yyLXXZf79cwpik2
 TZhw/iRa0Idb81ZyPvyyld0pLxLJPc9FZhvfzySF7jVe5SeMeXO6Px1p+piK/FUNptO6
 fByg==
X-Gm-Message-State: AOAM531N2o8eQtETaj5dKrExNjDYSn4G8GlRWRdUti/NoQUKkfz5sHJF
 RfyPF0cL1usBDlj77osqLqiYY/O3YffYyg==
X-Google-Smtp-Source: ABdhPJwSSP5ajXSVF3sb05fD5DeVWuPDpNytZZZIY8O8dSnjhFg+WNyoynnV8pKhuEapCttCgPGPBg==
X-Received: by 2002:a05:600c:d1:: with SMTP id
 u17mr9479504wmm.64.1614779038337; 
 Wed, 03 Mar 2021 05:43:58 -0800 (PST)
Received: from dell.default ([91.110.221.155])
 by smtp.gmail.com with ESMTPSA id w18sm6109524wrr.7.2021.03.03.05.43.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 05:43:57 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 25/53] drm/vmwgfx/vmwgfx_kms: Mark vmw_{cursor,
 primary}_plane_formats as __maybe_unused
Date: Wed,  3 Mar 2021 13:42:51 +0000
Message-Id: <20210303134319.3160762-26-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210303134319.3160762-1-lee.jones@linaro.org>
References: <20210303134319.3160762-1-lee.jones@linaro.org>
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
b25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+ClNpZ25lZC1vZmYtYnk6IFphY2sgUnVzaW4gPHph
Y2tyQHZtd2FyZS5jb20+Ckxpbms6IGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9w
YXRjaC9tc2dpZC8yMDIxMDExNTE4MTMxMy4zNDMxNDkzLTgtbGVlLmpvbmVzQGxpbmFyby5vcmcK
LS0tCiBkcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9rbXMuaCB8IDQgKystLQogMSBmaWxl
IGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9rbXMuaCBiL2RyaXZlcnMvZ3B1L2RybS92bXdn
Zngvdm13Z2Z4X2ttcy5oCmluZGV4IDAzZjM2OTQwMTVjZWMuLjYyNjdjY2Y1NDk0NGUgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X2ttcy5oCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS92bXdnZngvdm13Z2Z4X2ttcy5oCkBAIC0yNDUsNyArMjQ1LDcgQEAgc3RydWN0IHZt
d19mcmFtZWJ1ZmZlcl9ibyB7CiB9OwogCiAKLXN0YXRpYyBjb25zdCB1aW50MzJfdCB2bXdfcHJp
bWFyeV9wbGFuZV9mb3JtYXRzW10gPSB7CitzdGF0aWMgY29uc3QgdWludDMyX3QgX19tYXliZV91
bnVzZWQgdm13X3ByaW1hcnlfcGxhbmVfZm9ybWF0c1tdID0gewogCURSTV9GT1JNQVRfWFJHQjE1
NTUsCiAJRFJNX0ZPUk1BVF9SR0I1NjUsCiAJRFJNX0ZPUk1BVF9SR0I4ODgsCkBAIC0yNTMsNyAr
MjUzLDcgQEAgc3RhdGljIGNvbnN0IHVpbnQzMl90IHZtd19wcmltYXJ5X3BsYW5lX2Zvcm1hdHNb
XSA9IHsKIAlEUk1fRk9STUFUX0FSR0I4ODg4LAogfTsKIAotc3RhdGljIGNvbnN0IHVpbnQzMl90
IHZtd19jdXJzb3JfcGxhbmVfZm9ybWF0c1tdID0geworc3RhdGljIGNvbnN0IHVpbnQzMl90IF9f
bWF5YmVfdW51c2VkIHZtd19jdXJzb3JfcGxhbmVfZm9ybWF0c1tdID0gewogCURSTV9GT1JNQVRf
QVJHQjg4ODgsCiB9OwogCi0tIAoyLjI3LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbAo=
