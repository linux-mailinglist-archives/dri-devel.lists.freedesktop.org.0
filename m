Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AF6CC8DB2
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2019 18:07:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDE416E3F7;
	Wed,  2 Oct 2019 16:07:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48B4F6E3F7;
 Wed,  2 Oct 2019 16:07:06 +0000 (UTC)
Received: from localhost.localdomain (unknown [194.230.155.145])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B1851222BE;
 Wed,  2 Oct 2019 16:06:58 +0000 (UTC)
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sudeep Holla <sudeep.holla@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Ulf Hansson <ulf.hansson@linaro.org>, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, linux-media@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-amlogic@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, linux-usb@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH v2 3/3] ARM: dts: exynos: Rename power domain nodes to
 "power-domain" in Exynos4
Date: Wed,  2 Oct 2019 18:06:32 +0200
Message-Id: <20191002160632.11140-3-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191002160632.11140-1-krzk@kernel.org>
References: <20191002160632.11140-1-krzk@kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1570032426;
 bh=mQPcQHUPwO41tj6eZFL6xjysxPvRcXAHP637dM6rPBA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=xqXgGJ9vZy7bk8yuGyGyCZ7HwYOrs+sZX0ScjPpHW2skiKsRVVRbzRGyQcfqtu4D8
 sDlbVfZP8EPCOarDCvgd/OoIf7Cf8wm0Dk0jsfDjrCD4nx9pQtHbxNAKOrgy5zMzDi
 vbSyChOYqADcyyWF+Gryao3inEuvv8/IJSvZMhXw=
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
Cc: Krzysztof Kozlowski <krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIGRldmljZSBub2RlIG5hbWUgc2hvdWxkIHJlZmxlY3QgZ2VuZXJpYyBjbGFzcyBvZiBhIGRl
dmljZSBzbyByZW5hbWUKcG93ZXIgZG9tYWluIG5vZGVzIHRvICJwb3dlci1kb21haW4iLiAgTm8g
ZnVuY3Rpb25hbCBjaGFuZ2UuCgpTaWduZWQtb2ZmLWJ5OiBLcnp5c3p0b2YgS296bG93c2tpIDxr
cnprQGtlcm5lbC5vcmc+Ci0tLQogYXJjaC9hcm0vYm9vdC9kdHMvZXh5bm9zNC5kdHNpICAgIHwg
MTQgKysrKysrKy0tLS0tLS0KIGFyY2gvYXJtL2Jvb3QvZHRzL2V4eW5vczQyMTAuZHRzaSB8ICAy
ICstCiBhcmNoL2FybS9ib290L2R0cy9leHlub3M0NDEyLmR0c2kgfCAgMiArLQogMyBmaWxlcyBj
aGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDkgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJj
aC9hcm0vYm9vdC9kdHMvZXh5bm9zNC5kdHNpIGIvYXJjaC9hcm0vYm9vdC9kdHMvZXh5bm9zNC5k
dHNpCmluZGV4IDQzM2YxMDlkOTdjYS4uZDI3NzlhNzkwY2UzIDEwMDY0NAotLS0gYS9hcmNoL2Fy
bS9ib290L2R0cy9leHlub3M0LmR0c2kKKysrIGIvYXJjaC9hcm0vYm9vdC9kdHMvZXh5bm9zNC5k
dHNpCkBAIC0xMTEsMjggKzExMSwyOCBAQAogCQkJc3lzY29uID0gPCZwbXVfc3lzdGVtX2NvbnRy
b2xsZXI+OwogCQl9OwogCi0JCXBkX21mYzogbWZjLXBvd2VyLWRvbWFpbkAxMDAyM2M0MCB7CisJ
CXBkX21mYzogcG93ZXItZG9tYWluQDEwMDIzYzQwIHsKIAkJCWNvbXBhdGlibGUgPSAic2Ftc3Vu
ZyxleHlub3M0MjEwLXBkIjsKIAkJCXJlZyA9IDwweDEwMDIzQzQwIDB4MjA+OwogCQkJI3Bvd2Vy
LWRvbWFpbi1jZWxscyA9IDwwPjsKIAkJCWxhYmVsID0gIk1GQyI7CiAJCX07CiAKLQkJcGRfZzNk
OiBnM2QtcG93ZXItZG9tYWluQDEwMDIzYzYwIHsKKwkJcGRfZzNkOiBwb3dlci1kb21haW5AMTAw
MjNjNjAgewogCQkJY29tcGF0aWJsZSA9ICJzYW1zdW5nLGV4eW5vczQyMTAtcGQiOwogCQkJcmVn
ID0gPDB4MTAwMjNDNjAgMHgyMD47CiAJCQkjcG93ZXItZG9tYWluLWNlbGxzID0gPDA+OwogCQkJ
bGFiZWwgPSAiRzNEIjsKIAkJfTsKIAotCQlwZF9sY2QwOiBsY2QwLXBvd2VyLWRvbWFpbkAxMDAy
M2M4MCB7CisJCXBkX2xjZDA6IHBvd2VyLWRvbWFpbkAxMDAyM2M4MCB7CiAJCQljb21wYXRpYmxl
ID0gInNhbXN1bmcsZXh5bm9zNDIxMC1wZCI7CiAJCQlyZWcgPSA8MHgxMDAyM0M4MCAweDIwPjsK
IAkJCSNwb3dlci1kb21haW4tY2VsbHMgPSA8MD47CiAJCQlsYWJlbCA9ICJMQ0QwIjsKIAkJfTsK
IAotCQlwZF90djogdHYtcG93ZXItZG9tYWluQDEwMDIzYzIwIHsKKwkJcGRfdHY6IHBvd2VyLWRv
bWFpbkAxMDAyM2MyMCB7CiAJCQljb21wYXRpYmxlID0gInNhbXN1bmcsZXh5bm9zNDIxMC1wZCI7
CiAJCQlyZWcgPSA8MHgxMDAyM0MyMCAweDIwPjsKIAkJCSNwb3dlci1kb21haW4tY2VsbHMgPSA8
MD47CkBAIC0xNDAsMjEgKzE0MCwyMSBAQAogCQkJbGFiZWwgPSAiVFYiOwogCQl9OwogCi0JCXBk
X2NhbTogY2FtLXBvd2VyLWRvbWFpbkAxMDAyM2MwMCB7CisJCXBkX2NhbTogcG93ZXItZG9tYWlu
QDEwMDIzYzAwIHsKIAkJCWNvbXBhdGlibGUgPSAic2Ftc3VuZyxleHlub3M0MjEwLXBkIjsKIAkJ
CXJlZyA9IDwweDEwMDIzQzAwIDB4MjA+OwogCQkJI3Bvd2VyLWRvbWFpbi1jZWxscyA9IDwwPjsK
IAkJCWxhYmVsID0gIkNBTSI7CiAJCX07CiAKLQkJcGRfZ3BzOiBncHMtcG93ZXItZG9tYWluQDEw
MDIzY2UwIHsKKwkJcGRfZ3BzOiBwb3dlci1kb21haW5AMTAwMjNjZTAgewogCQkJY29tcGF0aWJs
ZSA9ICJzYW1zdW5nLGV4eW5vczQyMTAtcGQiOwogCQkJcmVnID0gPDB4MTAwMjNDRTAgMHgyMD47
CiAJCQkjcG93ZXItZG9tYWluLWNlbGxzID0gPDA+OwogCQkJbGFiZWwgPSAiR1BTIjsKIAkJfTsK
IAotCQlwZF9ncHNfYWxpdmU6IGdwcy1hbGl2ZS1wb3dlci1kb21haW5AMTAwMjNkMDAgeworCQlw
ZF9ncHNfYWxpdmU6IHBvd2VyLWRvbWFpbkAxMDAyM2QwMCB7CiAJCQljb21wYXRpYmxlID0gInNh
bXN1bmcsZXh5bm9zNDIxMC1wZCI7CiAJCQlyZWcgPSA8MHgxMDAyM0QwMCAweDIwPjsKIAkJCSNw
b3dlci1kb21haW4tY2VsbHMgPSA8MD47CmRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9l
eHlub3M0MjEwLmR0c2kgYi9hcmNoL2FybS9ib290L2R0cy9leHlub3M0MjEwLmR0c2kKaW5kZXgg
ZjIyMDcxNjIzOWRiLi5mZjlhM2ZiMjFhODUgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtL2Jvb3QvZHRz
L2V4eW5vczQyMTAuZHRzaQorKysgYi9hcmNoL2FybS9ib290L2R0cy9leHlub3M0MjEwLmR0c2kK
QEAgLTkwLDcgKzkwLDcgQEAKIAkJCX07CiAJCX07CiAKLQkJcGRfbGNkMTogbGNkMS1wb3dlci1k
b21haW5AMTAwMjNjYTAgeworCQlwZF9sY2QxOiBwb3dlci1kb21haW5AMTAwMjNjYTAgewogCQkJ
Y29tcGF0aWJsZSA9ICJzYW1zdW5nLGV4eW5vczQyMTAtcGQiOwogCQkJcmVnID0gPDB4MTAwMjND
QTAgMHgyMD47CiAJCQkjcG93ZXItZG9tYWluLWNlbGxzID0gPDA+OwpkaWZmIC0tZ2l0IGEvYXJj
aC9hcm0vYm9vdC9kdHMvZXh5bm9zNDQxMi5kdHNpIGIvYXJjaC9hcm0vYm9vdC9kdHMvZXh5bm9z
NDQxMi5kdHNpCmluZGV4IGQyMGRiMmRmZThlMi4uMWM0MGJkNTZjZTAwIDEwMDY0NAotLS0gYS9h
cmNoL2FybS9ib290L2R0cy9leHlub3M0NDEyLmR0c2kKKysrIGIvYXJjaC9hcm0vYm9vdC9kdHMv
ZXh5bm9zNDQxMi5kdHNpCkBAIC0yMDYsNyArMjA2LDcgQEAKIAkJCX07CiAJCX07CiAKLQkJcGRf
aXNwOiBpc3AtcG93ZXItZG9tYWluQDEwMDIzY2EwIHsKKwkJcGRfaXNwOiBwb3dlci1kb21haW5A
MTAwMjNjYTAgewogCQkJY29tcGF0aWJsZSA9ICJzYW1zdW5nLGV4eW5vczQyMTAtcGQiOwogCQkJ
cmVnID0gPDB4MTAwMjNDQTAgMHgyMD47CiAJCQkjcG93ZXItZG9tYWluLWNlbGxzID0gPDA+Owot
LSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
