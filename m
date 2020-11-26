Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F3372C5621
	for <lists+dri-devel@lfdr.de>; Thu, 26 Nov 2020 14:43:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72CDE6E965;
	Thu, 26 Nov 2020 13:43:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E9A96E987
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Nov 2020 13:43:20 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id e7so2196931wrv.6
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Nov 2020 05:43:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lyYzloTK2PfirZ1Vnz7WwlEZaviGAn+VoMQZs9r0bNo=;
 b=WIR3eyDWyT0TNYDqtte4PXcGFnQ/Bzb+Asak+yqUlKdmVUKM+P8LwCz+pF8EULE5+/
 fZinsvtDeDUkdROR8iwoQhYwsSpfiBSnsb53I/X1vvIN1Ovi2g+yPYoMopGnxjN9F/5W
 UPpITbQrGcPw7TF5WKmjqU7aWG2LUNkXqw+rOumjd+sUPX+oNN1dZqZDXypi2Vq2jrow
 RaZzKKxoYhCq/0w8IziaR/LEYYfT53WrwsrZPhrkhCz0TAwqYXXhH6zt6pnn1UWk8B8T
 BrAWROua9zKbFRYr3mYl4639FFMoyPQbjJhykn44Qtv5NyKrcezEoXpjDYlKciQTk8fh
 bFUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lyYzloTK2PfirZ1Vnz7WwlEZaviGAn+VoMQZs9r0bNo=;
 b=jyOv44vLkjMUItFnF9DeR37CHsMu/gj1HtWbSIQd/Ob0Bnjt3/sMROLLZuJHjZG7ZR
 KaFt3xszZC4rrGcRChoIMilI8h3ERRxti1+pM08er6XgQ4qlUhbsn7kbmCOJ+VL8D6kN
 dMBMRaTVD/CX1FxiUeyOJhv9OT6b5DvE0Ax/PH1eVm/GvpqnOvb+XV1GBH37Ex+IQMGb
 Ci8WoR50KcYTFo6IqAL3QE21T7IFcyxpUf3URhNX2Khmvgr8YHns8xIwh0MK8HfvZl7V
 8LnGUbpVVzhkP9erqoiP3U91jG9aT96fyrXrF6+fxpIdq5Lft0jzUiQdtTl+I2B9GcI7
 KrXw==
X-Gm-Message-State: AOAM532nDeoFElI7lpe9P77fDQzp6IxajO/Lnd3p4LMpVGfyUuSsxlQj
 kQLXH1tu69U9uRswmC9pI2Y5yQ==
X-Google-Smtp-Source: ABdhPJw80r7EtghtjN7YeairyQPRFFBj+KIT/no7NYCDyVPWnHmFtcPpdt08ETrsr3m/vYxhfQc+dA==
X-Received: by 2002:a5d:668d:: with SMTP id l13mr3839571wru.279.1606398198653; 
 Thu, 26 Nov 2020 05:43:18 -0800 (PST)
Received: from dell.default ([91.110.221.235])
 by smtp.gmail.com with ESMTPSA id k205sm9275738wmk.4.2020.11.26.05.43.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Nov 2020 05:43:17 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 22/40] drm/amd/pm/powerplay/hwmgr/vega10_hwmgr: Remove set but
 unused variable 'result'
Date: Thu, 26 Nov 2020 13:42:22 +0000
Message-Id: <20201126134240.3214176-23-lee.jones@linaro.org>
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
cy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vcG0vcG93ZXJwbGF5L2h3bWdyL3ZlZ2ExMF9od21nci5j
OiBJbiBmdW5jdGlvbiDigJh2ZWdhMTBfZ2V0X3BwX3RhYmxlX2VudHJ54oCZOgogZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvLi4vcG0vcG93ZXJwbGF5L2h3bWdyL3ZlZ2ExMF9od21nci5jOjMx
MzU6Njogd2FybmluZzogdmFyaWFibGUg4oCYcmVzdWx04oCZIHNldCBidXQgbm90IHVzZWQgWy1X
dW51c2VkLWJ1dC1zZXQtdmFyaWFibGVdCgpDYzogRXZhbiBRdWFuIDxldmFuLnF1YW5AYW1kLmNv
bT4KQ2M6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KQ2M6ICJDaHJp
c3RpYW4gS8O2bmlnIiA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgpDYzogRGF2aWQgQWlybGll
IDxhaXJsaWVkQGxpbnV4LmllPgpDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgpD
YzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKU2lnbmVkLW9mZi1ieTogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9y
Zz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL3BtL3Bvd2VycGxheS9od21nci92ZWdhMTBfaHdt
Z3IuYyB8IDMgKy0tCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDIgZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wbS9wb3dlcnBsYXkvaHdtZ3Iv
dmVnYTEwX2h3bWdyLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3BtL3Bvd2VycGxheS9od21nci92
ZWdhMTBfaHdtZ3IuYwppbmRleCA3ZWFkYTMwOThmZmNjLi5hYzg4ZjU0ODNlZjcwIDEwMDY0NAot
LS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3BtL3Bvd2VycGxheS9od21nci92ZWdhMTBfaHdtZ3Iu
YworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3BtL3Bvd2VycGxheS9od21nci92ZWdhMTBfaHdt
Z3IuYwpAQCAtMzEzMiwxNCArMzEzMiwxMyBAQCBzdGF0aWMgaW50IHZlZ2ExMF9nZXRfcHBfdGFi
bGVfZW50cnlfY2FsbGJhY2tfZnVuYyhzdHJ1Y3QgcHBfaHdtZ3IgKmh3bWdyLAogc3RhdGljIGlu
dCB2ZWdhMTBfZ2V0X3BwX3RhYmxlX2VudHJ5KHN0cnVjdCBwcF9od21nciAqaHdtZ3IsCiAJCXVu
c2lnbmVkIGxvbmcgZW50cnlfaW5kZXgsIHN0cnVjdCBwcF9wb3dlcl9zdGF0ZSAqc3RhdGUpCiB7
Ci0JaW50IHJlc3VsdDsKIAlzdHJ1Y3QgdmVnYTEwX3Bvd2VyX3N0YXRlICpwczsKIAogCXN0YXRl
LT5oYXJkd2FyZS5tYWdpYyA9IFBod1ZlZ2ExMF9NYWdpYzsKIAogCXBzID0gY2FzdF9waHdfdmVn
YTEwX3Bvd2VyX3N0YXRlKCZzdGF0ZS0+aGFyZHdhcmUpOwogCi0JcmVzdWx0ID0gdmVnYTEwX2dl
dF9wb3dlcnBsYXlfdGFibGVfZW50cnkoaHdtZ3IsIGVudHJ5X2luZGV4LCBzdGF0ZSwKKwl2ZWdh
MTBfZ2V0X3Bvd2VycGxheV90YWJsZV9lbnRyeShod21nciwgZW50cnlfaW5kZXgsIHN0YXRlLAog
CQkJdmVnYTEwX2dldF9wcF90YWJsZV9lbnRyeV9jYWxsYmFja19mdW5jKTsKIAogCS8qCi0tIAoy
LjI1LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
