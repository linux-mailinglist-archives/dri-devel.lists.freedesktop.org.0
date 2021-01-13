Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C9F1B2F4D8D
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jan 2021 15:50:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FD956EA53;
	Wed, 13 Jan 2021 14:50:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26C366EA58
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 14:50:27 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id i9so2418162wrc.4
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 06:50:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xVuJfuGZFscYbOy1MUiffPVpTle7WgNo/eVkJwf7WNU=;
 b=q+MZOwcKb62nI3dDtefjHxCD1svvGR60Jf4GADTHbVCFSZk5ahffVs42713RFmCF3M
 hhNPD9AVosxvdPh3Z8yE2EAX9AIqiNvXNvlrh/+KWS1FF0B5BjXeeykrTfib5131sKFj
 mn2tgU4dkCSlErK842cyu7HwusDnIaakfzs1I7cSnM4yplICdcp2mBAJcvH34TWQSDE0
 Dng1yBz0vV3j29G56BqJw78ZGoOyPY6hhoK+WPjPT+6lUPxLOPjPUWuXCAoeTfdRwhJo
 a9h437HEm5yNmdhcoLqG033+xaunKcJYY/dyF8W3QR8fqLXStt350nJ0m0HkPZgnnZIh
 3SRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xVuJfuGZFscYbOy1MUiffPVpTle7WgNo/eVkJwf7WNU=;
 b=tnnxANOUwjZxjy3B3kKKlI466zb5bvwItjp7OcuCMNhM1OPhCFTjeC15+DKZV1rlDm
 0DhMBoX6EToaGkCtC8RHNq5PiZnnLmqfWgzNnwmX6UHNe+euNjus8eouitHQ6izpyXng
 uTLaHdBiLHtaPqFeMVJj6Oz4GlcN4AVugzOmN0uZrMENrF/yc4izfkcx8vgypzS4OFqg
 ZupKBnGAC64so1yfDcL4RpC/oxDoOYPyrQqTTp5+OsfjnqH/kp0B69ilwHo2uf9ws5h0
 Y/bpjM7O5VpeJR5T7J6+GHKsuVjeDhlNOL2A9t8G6kJPWloOXZu4z0ws0gsGaPRUeNU0
 7m+Q==
X-Gm-Message-State: AOAM531bUsVELt4YQMfhoGPtRJ6yC3U7SYJKfGY4U5VUWzK0jKfFIiS7
 /U579Y9U/yAULZC6l/rFhfIUwg==
X-Google-Smtp-Source: ABdhPJwVCTsByjCEjav6tW14+5dv7xLsxBc5Eorij361Ct+VXeRJyY7s7OCdf+rGi3SgUVSd2g+Hog==
X-Received: by 2002:a5d:4d50:: with SMTP id a16mr2925284wru.43.1610549425879; 
 Wed, 13 Jan 2021 06:50:25 -0800 (PST)
Received: from dell.default ([91.110.221.229])
 by smtp.gmail.com with ESMTPSA id t188sm3273433wmf.9.2021.01.13.06.50.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jan 2021 06:50:24 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 08/31] video: fbdev: sis: sis_main: Remove unused variable
 'reg'
Date: Wed, 13 Jan 2021 14:49:46 +0000
Message-Id: <20210113145009.1272040-9-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210113145009.1272040-1-lee.jones@linaro.org>
References: <20210113145009.1272040-1-lee.jones@linaro.org>
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
Cc: Gerd Knorr <kraxel@goldbach.in-berlin.de>, linux-fbdev@vger.kernel.org,
 Thomas Winischhofer <thomas@winischhofer.net>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy92aWRlby9mYmRldi9zaXMvc2lzX21haW4uYzogSW4gZnVuY3Rpb24g4oCYc2lzZmJfcG9zdF94
Z2lfZGRyMuKAmToKIGRyaXZlcnMvdmlkZW8vZmJkZXYvc2lzL3Npc19tYWluLmM6NTAzMjo1OiB3
YXJuaW5nOiB2YXJpYWJsZSDigJhyZWfigJkgc2V0IGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQtYnV0
LXNldC12YXJpYWJsZV0KCkNjOiBUaG9tYXMgV2luaXNjaGhvZmVyIDx0aG9tYXNAd2luaXNjaGhv
ZmVyLm5ldD4KQ2M6IEdlcmQgS25vcnIgPGtyYXhlbEBnb2xkYmFjaC5pbi1iZXJsaW4uZGU+CkNj
OiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCkNjOiBsaW51eC1mYmRldkB2Z2VyLmtl
cm5lbC5vcmcKU2lnbmVkLW9mZi1ieTogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4K
LS0tCiBkcml2ZXJzL3ZpZGVvL2ZiZGV2L3Npcy9zaXNfbWFpbi5jIHwgOSArKysrLS0tLS0KIDEg
ZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0
IGEvZHJpdmVycy92aWRlby9mYmRldi9zaXMvc2lzX21haW4uYyBiL2RyaXZlcnMvdmlkZW8vZmJk
ZXYvc2lzL3Npc19tYWluLmMKaW5kZXggMDNjNzM2ZjZmM2QwOC4uMjY2YTU1ODJmOTRkMyAxMDA2
NDQKLS0tIGEvZHJpdmVycy92aWRlby9mYmRldi9zaXMvc2lzX21haW4uYworKysgYi9kcml2ZXJz
L3ZpZGVvL2ZiZGV2L3Npcy9zaXNfbWFpbi5jCkBAIC01MDI5LDcgKzUwMjksNiBAQCBzdGF0aWMg
dm9pZCBzaXNmYl9wb3N0X3hnaV9kZHIyKHN0cnVjdCBzaXNfdmlkZW9faW5mbyAqaXZpZGVvLCB1
OCByZWdiKQogCXN0YXRpYyBjb25zdCB1OCBjczE2OFs4XSA9IHsKIAkJMHg0OCwgMHg3OCwgMHg4
OCwgMHgwMCwgMHgwMCwgMHgwMCwgMHgwMCwgMHgwMAogCX07Ci0JdTggcmVnOwogCXU4IHYxOwog
CXU4IHYyOwogCXU4IHYzOwpAQCAtNTAzNyw5ICs1MDM2LDkgQEAgc3RhdGljIHZvaWQgc2lzZmJf
cG9zdF94Z2lfZGRyMihzdHJ1Y3Qgc2lzX3ZpZGVvX2luZm8gKml2aWRlbywgdTggcmVnYikKIAlT
aVNfU2V0UmVnKFNJU0NSLCAweGIwLCAweDgwKTsgLyogRERSMiBkdWFsIGZyZXF1ZW5jeSBtb2Rl
ICovCiAJU2lTX1NldFJlZyhTSVNDUiwgMHg4MiwgMHg3Nyk7CiAJU2lTX1NldFJlZyhTSVNDUiwg
MHg4NiwgMHgwMCk7Ci0JcmVnID0gU2lTX0dldFJlZyhTSVNDUiwgMHg4Nik7CisJU2lTX0dldFJl
ZyhTSVNDUiwgMHg4Nik7CiAJU2lTX1NldFJlZyhTSVNDUiwgMHg4NiwgMHg4OCk7Ci0JcmVnID0g
U2lTX0dldFJlZyhTSVNDUiwgMHg4Nik7CisJU2lTX0dldFJlZyhTSVNDUiwgMHg4Nik7CiAJdjEg
PSBjczE2OFtyZWdiXTsgdjIgPSBjczE2MFtyZWdiXTsgdjMgPSBjczE1OFtyZWdiXTsKIAlpZiAo
aXZpZGVvLT5oYXZlWEdJUk9NKSB7CiAJCXYxID0gYmlvc1tyZWdiICsgMHgxNjhdOwpAQCAtNTA0
OSw5ICs1MDQ4LDkgQEAgc3RhdGljIHZvaWQgc2lzZmJfcG9zdF94Z2lfZGRyMihzdHJ1Y3Qgc2lz
X3ZpZGVvX2luZm8gKml2aWRlbywgdTggcmVnYikKIAlTaVNfU2V0UmVnKFNJU0NSLCAweDg2LCB2
MSk7CiAJU2lTX1NldFJlZyhTSVNDUiwgMHg4MiwgMHg3Nyk7CiAJU2lTX1NldFJlZyhTSVNDUiwg
MHg4NSwgMHgwMCk7Ci0JcmVnID0gU2lTX0dldFJlZyhTSVNDUiwgMHg4NSk7CisJU2lTX0dldFJl
ZyhTSVNDUiwgMHg4NSk7CiAJU2lTX1NldFJlZyhTSVNDUiwgMHg4NSwgMHg4OCk7Ci0JcmVnID0g
U2lTX0dldFJlZyhTSVNDUiwgMHg4NSk7CisJU2lTX0dldFJlZyhTSVNDUiwgMHg4NSk7CiAJU2lT
X1NldFJlZyhTSVNDUiwgMHg4NSwgdjIpOwogCVNpU19TZXRSZWcoU0lTQ1IsIDB4ODIsIHYzKTsK
IAlTaVNfU2V0UmVnKFNJU0NSLCAweDk4LCAweDAxKTsKLS0gCjIuMjUuMQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
