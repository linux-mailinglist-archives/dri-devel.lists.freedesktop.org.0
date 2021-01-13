Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AA352F45D2
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jan 2021 09:08:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 963F06E09F;
	Wed, 13 Jan 2021 08:08:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 148136E072
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 08:08:28 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id h17so507561wmq.1
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 00:08:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ePSRgs/Oht29QZLcRjU0xPTTc8gUIb5jIpmVTTqKzN0=;
 b=tgoX12VNW482sdZIyhl4ORWffsWRGDAF8WKOquXRllWLqJQJ78J3p7CT3/31OGzuoE
 LoI2e+hpCagmbWE7g9VZMY5FqXOO68yRFfHKZapDdAVFihCP92NcdYdcmXg8mnx7fzFP
 ArXKyu3k0AqXcnnif2fMoO+PBfwaWpllqLkI//UH1JpLZwzAtYmLYTOw+gfDcLaaGcBS
 fCRbKczPAoKW3pT+QpCDo3depBAbo6gTUMW07IbdTpiamAxRYaPZ31vaIOTZC8v4Alcb
 jM86MNad9CjDADKOq6ByP6Bbo8HioNGIbOn4ErP6CYSdC2bD9M+t9qlkOdo2XYMLU9IV
 OS/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ePSRgs/Oht29QZLcRjU0xPTTc8gUIb5jIpmVTTqKzN0=;
 b=Dl20pueNRBHEA0tkr0sT0P44Mu9txWEdT34VmrqxcExfnJSaoCNDmq1h0+Zi3C2HXG
 uQaibpgrQm8NZuurOJu36n+G0Rthi7hwmxT07KQPenaZkdfFSiEuLuouJ5nwmVbRcuKp
 1HDNZQAxw3DPMzq6/q/ovHZuIjD7ifYAzHWNobeaYjgX7O9Nt++t2Qt4FuGqgDYshOJg
 +6oItrJ0rF7lAjKN1T9/f9p6GZ6/m2rN83SEQabymoNJt8LXQS2UclQ0RMFJv5htCDmj
 KZa0NgXrQ0b/1VcKxgw1sjjW5Yu6nsPN5+PiFdOocesUrsdWruU7J2jec+zXFLRm8beK
 XlWA==
X-Gm-Message-State: AOAM530jh0SZUJKC7QRn9xfbrVJVuPMVaKoeNYy5Yw9TWK8gfIzjrHd8
 cdyo68y2PWIPsb6YLenKoD0cQQ==
X-Google-Smtp-Source: ABdhPJyGrLDO2UBG/M9dHT/9jSVj5NOQokJsf/gYMTBymO5DcW7KnV5p+/waaOPM2apiLlu6Eeyq4w==
X-Received: by 2002:a05:600c:230a:: with SMTP id
 10mr929325wmo.172.1610525306810; 
 Wed, 13 Jan 2021 00:08:26 -0800 (PST)
Received: from dell.default ([91.110.221.229])
 by smtp.gmail.com with ESMTPSA id r20sm1642486wmh.15.2021.01.13.00.08.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jan 2021 00:08:26 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 25/30] drm/nouveau/nouveau_display: Remove set but unused
 variable 'width'
Date: Wed, 13 Jan 2021 08:07:47 +0000
Message-Id: <20210113080752.1003793-26-lee.jones@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9kaXNwbGF5LmM6IEluIGZ1bmN0aW9uIOKAmG5vdXZl
YXVfZnJhbWVidWZmZXJfbmV34oCZOgogZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9k
aXNwbGF5LmM6MzA5OjE1OiB3YXJuaW5nOiB2YXJpYWJsZSDigJh3aWR0aOKAmSBzZXQgYnV0IG5v
dCB1c2VkIFstV3VudXNlZC1idXQtc2V0LXZhcmlhYmxlXQoKQ2M6IEJlbiBTa2VnZ3MgPGJza2Vn
Z3NAcmVkaGF0LmNvbT4KQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KQ2M6IERh
bmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKQ2M6IG5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnClNpZ25lZC1vZmYtYnk6
IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL25v
dXZlYXUvbm91dmVhdV9kaXNwbGF5LmMgfCA4ICsrKystLS0tCiAxIGZpbGUgY2hhbmdlZCwgNCBp
bnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9ub3V2ZWF1L25vdXZlYXVfZGlzcGxheS5jIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91
dmVhdV9kaXNwbGF5LmMKaW5kZXggYmNlYjQ4YTJkZmNhNi4uYjc2YmJhNGNhMDg1NiAxMDA2NDQK
LS0tIGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9kaXNwbGF5LmMKKysrIGIvZHJp
dmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9kaXNwbGF5LmMKQEAgLTMwNiw3ICszMDYsNyBA
QCBub3V2ZWF1X2ZyYW1lYnVmZmVyX25ldyhzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LAogCXN0cnVj
dCBub3V2ZWF1X2JvICpudmJvID0gbm91dmVhdV9nZW1fb2JqZWN0KGdlbSk7CiAJc3RydWN0IGRy
bV9mcmFtZWJ1ZmZlciAqZmI7CiAJY29uc3Qgc3RydWN0IGRybV9mb3JtYXRfaW5mbyAqaW5mbzsK
LQl1bnNpZ25lZCBpbnQgd2lkdGgsIGhlaWdodCwgaTsKKwl1bnNpZ25lZCBpbnQgaGVpZ2h0LCBp
OwogCXVpbnQzMl90IHRpbGVfbW9kZTsKIAl1aW50OF90IGtpbmQ7CiAJaW50IHJldDsKQEAgLTM0
Niw5ICszNDYsOSBAQCBub3V2ZWF1X2ZyYW1lYnVmZmVyX25ldyhzdHJ1Y3QgZHJtX2RldmljZSAq
ZGV2LAogCWluZm8gPSBkcm1fZ2V0X2Zvcm1hdF9pbmZvKGRldiwgbW9kZV9jbWQpOwogCiAJZm9y
IChpID0gMDsgaSA8IGluZm8tPm51bV9wbGFuZXM7IGkrKykgewotCQl3aWR0aCA9IGRybV9mb3Jt
YXRfaW5mb19wbGFuZV93aWR0aChpbmZvLAotCQkJCQkJICAgIG1vZGVfY21kLT53aWR0aCwKLQkJ
CQkJCSAgICBpKTsKKwkJZHJtX2Zvcm1hdF9pbmZvX3BsYW5lX3dpZHRoKGluZm8sCisJCQkJCSAg
ICBtb2RlX2NtZC0+d2lkdGgsCisJCQkJCSAgICBpKTsKIAkJaGVpZ2h0ID0gZHJtX2Zvcm1hdF9p
bmZvX3BsYW5lX2hlaWdodChpbmZvLAogCQkJCQkJICAgICAgbW9kZV9jbWQtPmhlaWdodCwKIAkJ
CQkJCSAgICAgIGkpOwotLSAKMi4yNS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWwK
