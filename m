Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D63D341758
	for <lists+dri-devel@lfdr.de>; Fri, 19 Mar 2021 09:25:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2152E6E9AC;
	Fri, 19 Mar 2021 08:24:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91E566E9A2
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Mar 2021 08:24:44 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id a7so8268265ejs.3
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Mar 2021 01:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MDb62l+8C+YekUvtP2oUdE/QSSZdTHGqGLcmgtoRZ6A=;
 b=fH44IuNWOT0gzD6ZDTpIA6Ik59/TezQetQjXfZCUitBkzSKS+ixlThvf4S2c4z24cR
 v9A2hvCloFo6enmQJULhrlvhLslpAa3OylYUAhVahQ0DFcq9p3SApUfigyhYrfPYbOrx
 5oHB+zplzVnHfUyn0TnAgQR2ekgdd7RiP0JcI2yo1lyFoyfqotZU/s2LrJfGx6xGGArD
 SZJe92Das2D14/RPj+IkMR57XFYlLxJtpRUzoL9Ns/q/ExyaowNLvTTl8LYKvqwvwf2F
 eY6l+uTTJSI0CA5NWvGVQmu7tiFOEDgKAR0vSc8twz3TBFsV2/1yNzjo09TQ9pVbQseb
 PURA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MDb62l+8C+YekUvtP2oUdE/QSSZdTHGqGLcmgtoRZ6A=;
 b=h1x1F2Lz856AxherR7Dm0ugMaeUu8StBZwVs1PUpH/PUKmntKqzUSw8QfzjNHPGM+I
 mTgeiTPSxwhaG39NrHyFVIxiOaGaE5K7cyaHIR7GUDrnleQ2hsPhXqeFgY3kiJMGNp3u
 0Sy82vmTtg+ecAJEXGF/uTFDdomijV7HFEYOpkMmujqHeBW9xXnlaMqEdTZk8YjK4puk
 muDlRHkxQ0F4C0HBbEzwBZ5T4kMYwEelowLVt6V2sCMkFvRa77mxm+Q2PNTrqVs60qG+
 i7jjtvSVpCvRaj5QAAQDsiBCQBplII6hD8NhBNnTIZ+cWpqcYmg49bEeBFuMzTSxgIBm
 Bxgw==
X-Gm-Message-State: AOAM530dA0Tg3DJc9tkld6WAALPRW5SHf9RLy0gNESfeTUpZWk5E6UA+
 33uIFnlAfZtlC3x/YzZ5v4HHIA==
X-Google-Smtp-Source: ABdhPJyNb/fOjzcFnA+jISAx3+fw5LpZGcDKcbMm/A9AcKdX1Vod6gM5IT6T6hUSVhBEzP8gkYxL9Q==
X-Received: by 2002:a17:906:340d:: with SMTP id
 c13mr3036223ejb.29.1616142283208; 
 Fri, 19 Mar 2021 01:24:43 -0700 (PDT)
Received: from dell.default ([91.110.221.194])
 by smtp.gmail.com with ESMTPSA id b18sm3273727ejb.77.2021.03.19.01.24.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Mar 2021 01:24:42 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 11/19] drm/nouveau/nouveau_display: Remove set but unused
 variable 'width'
Date: Fri, 19 Mar 2021 08:24:20 +0000
Message-Id: <20210319082428.3294591-12-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210319082428.3294591-1-lee.jones@linaro.org>
References: <20210319082428.3294591-1-lee.jones@linaro.org>
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
dmVhdV9kaXNwbGF5LmMKaW5kZXggZGFjMDJjN2JlNTRkYy4uYmUyMzI3Y2U3Mzk0YyAxMDA2NDQK
LS0tIGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9kaXNwbGF5LmMKKysrIGIvZHJp
dmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9kaXNwbGF5LmMKQEAgLTMwNiw3ICszMDYsNyBA
QCBub3V2ZWF1X2ZyYW1lYnVmZmVyX25ldyhzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LAogCXN0cnVj
dCBub3V2ZWF1X2JvICpudmJvID0gbm91dmVhdV9nZW1fb2JqZWN0KGdlbSk7CiAJc3RydWN0IGRy
bV9mcmFtZWJ1ZmZlciAqZmI7CiAJY29uc3Qgc3RydWN0IGRybV9mb3JtYXRfaW5mbyAqaW5mbzsK
LQl1bnNpZ25lZCBpbnQgd2lkdGgsIGhlaWdodCwgaTsKKwl1bnNpZ25lZCBpbnQgaGVpZ2h0LCBp
OwogCXVpbnQzMl90IHRpbGVfbW9kZTsKIAl1aW50OF90IGtpbmQ7CiAJaW50IHJldDsKQEAgLTM0
Myw5ICszNDMsOSBAQCBub3V2ZWF1X2ZyYW1lYnVmZmVyX25ldyhzdHJ1Y3QgZHJtX2RldmljZSAq
ZGV2LAogCWluZm8gPSBkcm1fZ2V0X2Zvcm1hdF9pbmZvKGRldiwgbW9kZV9jbWQpOwogCiAJZm9y
IChpID0gMDsgaSA8IGluZm8tPm51bV9wbGFuZXM7IGkrKykgewotCQl3aWR0aCA9IGRybV9mb3Jt
YXRfaW5mb19wbGFuZV93aWR0aChpbmZvLAotCQkJCQkJICAgIG1vZGVfY21kLT53aWR0aCwKLQkJ
CQkJCSAgICBpKTsKKwkJZHJtX2Zvcm1hdF9pbmZvX3BsYW5lX3dpZHRoKGluZm8sCisJCQkJCSAg
ICBtb2RlX2NtZC0+d2lkdGgsCisJCQkJCSAgICBpKTsKIAkJaGVpZ2h0ID0gZHJtX2Zvcm1hdF9p
bmZvX3BsYW5lX2hlaWdodChpbmZvLAogCQkJCQkJICAgICAgbW9kZV9jbWQtPmhlaWdodCwKIAkJ
CQkJCSAgICAgIGkpOwotLSAKMi4yNy4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWwK
