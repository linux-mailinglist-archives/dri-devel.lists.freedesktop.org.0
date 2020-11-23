Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 97A5A2C042B
	for <lists+dri-devel@lfdr.de>; Mon, 23 Nov 2020 12:20:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6531389FF9;
	Mon, 23 Nov 2020 11:20:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56A3189D4F
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Nov 2020 11:19:55 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id 1so16863221wme.3
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Nov 2020 03:19:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Dt3qGeaR7mDkGDOtCiBYSSJ0FSX/4GBqlT4FsqhW3aU=;
 b=A7aG4NUk01QTYOgfaJYXiLRsQmxZSN2RZbte2BKCTWb7GV74h+fgN95VPh8F+EWuHa
 ZwehXJ9Gp9hSTDJO0D6lO5a1PodY3r/JCC30/5lOfGZBR47e6USHjp4tlQ5FPr3WXGeq
 JIyXY0TKeYAtUVV5rTxyT/XUhbnbWDN2sVGU9IZ36KXptQ75GggISLQEwO/Ai/GpDXlC
 8QwJICGLpEy/GYJomAU2bCtyEqLPVpIh+LAstN5RbeKJg4yXPLuC+gYD1EYhlkJbexPE
 Zg5/3luMgUlZMF0HEVjFxIa3rQvyNcIsXwEikhJINH3R+7McVWPCMDJ0FBI8h4gCcRin
 tocQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Dt3qGeaR7mDkGDOtCiBYSSJ0FSX/4GBqlT4FsqhW3aU=;
 b=W0PKuw+0UvhLVYBFZXEmmZA59Tlul0/UDshhf7ghJXb8yFgGYFYNkdE8krjlp/8hmV
 rwpad+/oziV4VseVXA60AZygy2qGTzdOd8bmcc59IAqCWjTQAT/htvff8+wA96+Frhv8
 lUJrdNyWenvQxoHd1yeh96qbTzW8qqnqQwuI7C1t4WjLzkMiRizfrdTqjMJ1+u+B87vg
 CkUTGwufCk1Nco2LVqllmZGye37uD+X1cWFSHnb6oPhBX/PkliwKbMfB7cR2/PznTLCR
 A4lsoXedZBKjHDIxaH4ScWZ9KzEuoemAFGIy3QJXMUaM5Hobew7DRCQRx1kvx8gnOcRH
 6n5A==
X-Gm-Message-State: AOAM530Zqt3y5YBZcSEnrVChXVsedkBILaaVixQu3FkeV+2j7GVtW4KU
 waZKS+ePZuHWoGXsuntXsdYYGg==
X-Google-Smtp-Source: ABdhPJx4JMSzWkbKceWi1SW5fvksRYsrwwvS0sk1EeQb+wukDZgTmz/qJ1SYCh17VozYRM5jUgtzIg==
X-Received: by 2002:a1c:2384:: with SMTP id
 j126mr23896282wmj.116.1606130394092; 
 Mon, 23 Nov 2020 03:19:54 -0800 (PST)
Received: from dell.default ([91.110.221.218])
 by smtp.gmail.com with ESMTPSA id n9sm16317290wmd.4.2020.11.23.03.19.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Nov 2020 03:19:53 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 25/40] drm/amd/include/arct_ip_offset: Mark top-level IP_BASE
 definition as __maybe_unused
Date: Mon, 23 Nov 2020 11:19:04 +0000
Message-Id: <20201123111919.233376-26-lee.jones@linaro.org>
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

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogSW4gZmls
ZSBpbmNsdWRlZCBmcm9tIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FyY3RfcmVnX2luaXQu
YzoyNzoKIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL2luY2x1ZGUvYXJjdF9pcF9vZmZz
ZXQuaDoyMjc6Mjk6IHdhcm5pbmc6IOKAmERCR1VfSU9fQkFTReKAmSBkZWZpbmVkIGJ1dCBub3Qg
dXNlZCBbLVd1bnVzZWQtY29uc3QtdmFyaWFibGU9XQogMjI3IHwgc3RhdGljIGNvbnN0IHN0cnVj
dCBJUF9CQVNFIERCR1VfSU9fQkFTRSA9eyB7IHsgeyAweDAwMDAwMUUwLCAweDAwMDEyNUEwLCAw
eDAwNDBCNDAwLCAwLCAwLCAwIH0gfSwKIHwgXn5+fn5+fn5+fn5+CiBkcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS8uLi9pbmNsdWRlL2FyY3RfaXBfb2Zmc2V0Lmg6MTI3OjI5OiB3YXJuaW5nOiDi
gJhQQ0lFMF9CQVNF4oCZIGRlZmluZWQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC1jb25zdC12YXJp
YWJsZT1dCiAxMjcgfCBzdGF0aWMgY29uc3Qgc3RydWN0IElQX0JBU0UgUENJRTBfQkFTRSA9eyB7
IHsgeyAweDAwMDEyOEMwLCAweDAwNDExODAwLCAweDA0NDQwMDAwLCAwLCAwLCAwIH0gfSwKIHwg
Xn5+fn5+fn5+fgogSW4gZmlsZSBpbmNsdWRlZCBmcm9tIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FyY3RfcmVnX2luaXQuYzoyNzoKIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL2lu
Y2x1ZGUvYXJjdF9pcF9vZmZzZXQuaDo2MzoyOTogd2FybmluZzog4oCYRlVTRV9CQVNF4oCZIGRl
ZmluZWQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC1jb25zdC12YXJpYWJsZT1dCiA2MyB8IHN0YXRp
YyBjb25zdCBzdHJ1Y3QgSVBfQkFTRSBGVVNFX0JBU0UgPXsgeyB7IHsgMHgwMDAxMjBBMCwgMHgw
MDAxNzQwMCwgMHgwMDQwMTQwMCwgMCwgMCwgMCB9IH0sCiB8IF5+fn5+fn5+fgoKQ2M6IEFsZXgg
RGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KQ2M6ICJDaHJpc3RpYW4gS8O2bmln
IiA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgpDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxp
bnV4LmllPgpDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgpDYzogYW1kLWdmeEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
U2lnbmVkLW9mZi1ieTogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4KLS0tCiBkcml2
ZXJzL2dwdS9kcm0vYW1kL2luY2x1ZGUvYXJjdF9pcF9vZmZzZXQuaCB8IDQgKystLQogMSBmaWxl
IGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2luY2x1ZGUvYXJjdF9pcF9vZmZzZXQuaCBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvaW5jbHVkZS9hcmN0X2lwX29mZnNldC5oCmluZGV4IGE3NzkxYTllMWY5MDUuLmFm
MWM0Njk5MTQyOWIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvaW5jbHVkZS9hcmN0
X2lwX29mZnNldC5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvaW5jbHVkZS9hcmN0X2lwX29m
ZnNldC5oCkBAIC0yOCwxMiArMjgsMTIgQEAKIHN0cnVjdCBJUF9CQVNFX0lOU1RBTkNFCiB7CiAg
ICAgdW5zaWduZWQgaW50IHNlZ21lbnRbTUFYX1NFR01FTlRdOwotfTsKK30gX19tYXliZV91bnVz
ZWQ7CiAKIHN0cnVjdCBJUF9CQVNFCiB7CiAgICAgc3RydWN0IElQX0JBU0VfSU5TVEFOQ0UgaW5z
dGFuY2VbTUFYX0lOU1RBTkNFXTsKLX07Cit9IF9fbWF5YmVfdW51c2VkOwogCiAKIHN0YXRpYyBj
b25zdCBzdHJ1Y3QgSVBfQkFTRSBBVEhVQl9CQVNFICAgICAgICAgICAgPXsgeyB7IHsgMHgwMDAw
MEMyMCwgMHgwMDAxMjQ2MCwgMHgwMDQwOEMwMCwgMCwgMCwgMCB9IH0sCi0tIAoyLjI1LjEKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
