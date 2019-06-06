Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CDC83856F
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2019 09:45:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C477889B22;
	Fri,  7 Jun 2019 07:43:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 593B489718
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2019 09:47:28 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id y17so1085043lfe.0
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jun 2019 02:47:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7nW3mZt+9ZnxuAFL1+ZAaurMAqAqlQaogmKT12Q9bkc=;
 b=FWNAGPAC1p6hVE5Nt6/jeiD4tfagjoeE6Mx1zFoQIYjZ4fuR/EZyib+itH9JcZGL7S
 vFjME2bTBCTzp0Cgegb+Abj+Bo8O3NKoOmscEaqv9V1z8jmGwm0SF0Z/ThdaF4jWc0Ko
 as6qR9Y7lGAWniUozg5DCOu3PZ1k6P43zU/Om3a2G0cjfWSO2y6j0QxVcGtBOvOLrqLK
 XNHsxkCzHVS9vO9hhhD6+QQ/yauNTZmAbIU1rIpa5Mx/xe6diSmrUIRvDDr2qbw4JToe
 FhZltiQ9IkASchs8fkRHCQS1fOEKJZuXy+3Wn8AjvCAG91VdUJQ209qw4Y+NEVXtRD1p
 s/wA==
X-Gm-Message-State: APjAAAX9R2YMJE9bm4f1Cjt9q6+LemCzYiGDTNqk5lCBQH3KgknQj4kK
 t8r8shLQ4lIhHh22KKl2jbqBdg==
X-Google-Smtp-Source: APXvYqx/DDTeaN+7wcBnH7SJY8W7bd3Q5Vdb+xcU4CnRCqt72c8lJvk4A3phFKwb3KZM6axwL3tiRQ==
X-Received: by 2002:ac2:5938:: with SMTP id v24mr12708910lfi.161.1559814446768; 
 Thu, 06 Jun 2019 02:47:26 -0700 (PDT)
Received: from localhost (c-1c3670d5.07-21-73746f28.bbcust.telenor.se.
 [213.112.54.28])
 by smtp.gmail.com with ESMTPSA id k7sm250518ljc.92.2019.06.06.02.47.25
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 06 Jun 2019 02:47:25 -0700 (PDT)
From: Anders Roxell <anders.roxell@linaro.org>
To: mchehab@kernel.org,
	p.zabel@pengutronix.de
Subject: [PATCH 5/8] drivers: media: coda: fix warning same module names
Date: Thu,  6 Jun 2019 11:47:22 +0200
Message-Id: <20190606094722.23816-1-anders.roxell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 07 Jun 2019 07:43:40 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7nW3mZt+9ZnxuAFL1+ZAaurMAqAqlQaogmKT12Q9bkc=;
 b=CzwkPpSR7JxGv5fTN1QNy7x2oHDM4EE8O4QEeZBUh+hN0z2w54ETNmPLmP8r76XLto
 0t2kV0IsL0DtZ2SDzJ+pWYFnxocbxNTPMpf8NM/nEingkJX16quxgrdNYsaygv8MPFeP
 T6YjtAE91PsFnmwPSI61gDl+JP5ex5/7e2lk/zMJqwzzT+zn5JfQptytp+gdMp0WbXK2
 +Tb9akU37mhth+Ae11wWtu1UJB/ifvxQuDvtpN55ghdIfW1yoDCZimq1r3mopfO2mRuk
 GwgyTcqRHiAxJJdsqlYjM4kjEgnzoKo5ZFhnQqZ6s1WgSTyFViIFBRK7V3Lo4Vr9wIRD
 F/GQ==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: andrew@lunn.ch, linux-fbdev@vger.kernel.org, airlied@linux.ie,
 linux-kernel@vger.kernel.org, lee.jones@linaro.org, marex@denx.de,
 f.fainelli@gmail.com, Anders Roxell <anders.roxell@linaro.org>,
 vivien.didelot@gmail.com, linux-media@vger.kernel.org,
 b.zolnierkie@samsung.com, broonie@kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 lgirdwood@gmail.com, shawnguo@kernel.org, davem@davemloft.net,
 hkallweit1@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2hlbiBidWlsZGluZyB3aXRoIENPTkZJR19WSURFT19DT0RBIGFuZCBDT05GSUdfQ09EQV9GUyBl
bmFibGVkIGFzCmxvYWRhYmxlIG1vZHVsZXMsIHdlIHNlZSB0aGUgZm9sbG93aW5nIHdhcm5pbmc6
Cgp3YXJuaW5nOiBzYW1lIG1vZHVsZSBuYW1lcyBmb3VuZDoKICBmcy9jb2RhL2NvZGEua28KICBk
cml2ZXJzL21lZGlhL3BsYXRmb3JtL2NvZGEvY29kYS5rbwoKUmV3b3JrIHNvIG1lZGlhIGNvZGEg
bWF0Y2hlcyB0aGUgY29uZmlnIGZyYWdtZW50LiBMZWF2aW5nIENPREFfRlMgYXMgaXMKc2luY2Ug
dGhhdHMgYSB3ZWxsIGtub3duIG1vZHVsZS4KClNpZ25lZC1vZmYtYnk6IEFuZGVycyBSb3hlbGwg
PGFuZGVycy5yb3hlbGxAbGluYXJvLm9yZz4KLS0tCiBkcml2ZXJzL21lZGlhL3BsYXRmb3JtL2Nv
ZGEvTWFrZWZpbGUgfCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9jb2RhL01h
a2VmaWxlIGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9jb2RhL01ha2VmaWxlCmluZGV4IDU0ZTlh
NzNhOTJhYi4uNTg4ZTZiZjdjMTkwIDEwMDY0NAotLS0gYS9kcml2ZXJzL21lZGlhL3BsYXRmb3Jt
L2NvZGEvTWFrZWZpbGUKKysrIGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9jb2RhL01ha2VmaWxl
CkBAIC0xLDYgKzEsNiBAQAogIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5
CiAKLWNvZGEtb2JqcyA6PSBjb2RhLWNvbW1vbi5vIGNvZGEtYml0Lm8gY29kYS1nZGkubyBjb2Rh
LWgyNjQubyBjb2RhLW1wZWcyLm8gY29kYS1tcGVnNC5vIGNvZGEtanBlZy5vCit2aWRlby1jb2Rh
LW9ianMgOj0gY29kYS1jb21tb24ubyBjb2RhLWJpdC5vIGNvZGEtZ2RpLm8gY29kYS1oMjY0Lm8g
Y29kYS1tcGVnMi5vIGNvZGEtbXBlZzQubyBjb2RhLWpwZWcubwogCi1vYmotJChDT05GSUdfVklE
RU9fQ09EQSkgKz0gY29kYS5vCitvYmotJChDT05GSUdfVklERU9fQ09EQSkgKz0gdmlkZW8tY29k
YS5vCiBvYmotJChDT05GSUdfVklERU9fSU1YX1ZET0EpICs9IGlteC12ZG9hLm8KLS0gCjIuMjAu
MQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
