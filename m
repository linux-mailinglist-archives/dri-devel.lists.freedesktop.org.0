Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C42442B4DC7
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 18:42:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 669856EA0C;
	Mon, 16 Nov 2020 17:42:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 991896EA03
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 17:42:09 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id 19so58312wmf.1
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 09:42:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CdkaNwQj8NyYLTZAwxAzCnUjBubyLoQ1IDILNJ47mBc=;
 b=KYfB0p1J8ty+Ajm53YV2GUUYUG37fGMs+sTFghOyy81qeMcYCCBI0/1BHv2PUUIjDE
 YJYsC/JCj7JtTZj3LyeZyJ1ma6n7LJCEiHH/ECiJExw5fRbRQdumA6Nqr77uK6bjFOuI
 BdrOz9vOe7aKsV8/DI8+LaFvwRQe2SdAvBaMINlVnHFLwMn2zrcuItOO7epWpzEzcjjy
 LL8GNS3NJxYFhMeaQpdHZhvjk7TSm74KER7gMmo4vmP71LM3IdxdizLCIdPV2MH7hQ17
 JfRc3KXZvX7Yqz6mbHZE9RjWwh5uzsQrwJoHLX7oWExRQ5v6vbpRbZzjuFUDhyOTxtV2
 42Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CdkaNwQj8NyYLTZAwxAzCnUjBubyLoQ1IDILNJ47mBc=;
 b=BijZSMvPxntCmdJgRABAE7I7kpOj6sIQ2l9FIN0bZvbt97xUt448GbfnvO3iA2gbTz
 odX39OfinhswnHoypopnCt5GMl03PYKRCbejMoRjm2lPwjIIG9Q7x1c7Px7a4OaOX/T5
 fzKC0DwYSW5lU1S7ON9m+qseLMjwubEV/MDJTAc/bfdA2qN75/nwS8oVBTilAzr77+1n
 +qM+bcso3KE+gHLjS8vXbY6aZ2k2aXERUJnpM3LvTC/C+zrmiElD5ky24o8JA1x0TJ+x
 DOsPzJ0UO55s9Vv/wEHHLZ2Bw0iHm9EBNy7jHGd8DbtyYP+8IlxseJhzSh3t+9twnN9c
 FDbw==
X-Gm-Message-State: AOAM531lAKsJSIaKzfbm/iobPyYgO2/Y44ArlEMtzjvIEpNM834FEsHy
 qceT3/RbN9SnpRUv5JOfw3SS3A==
X-Google-Smtp-Source: ABdhPJy4j2soVkwNqRi5Mut8ukSXC78cgBDynmPGR3xvRkypNFcub1qJ/G6B6xgySH2RieWkvkMAcA==
X-Received: by 2002:a7b:c145:: with SMTP id z5mr17523wmi.164.1605548528328;
 Mon, 16 Nov 2020 09:42:08 -0800 (PST)
Received: from dell.default ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id n10sm24667224wrx.9.2020.11.16.09.42.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 09:42:07 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 34/42] drm/v3d/v3d_drv: Remove unused static variable
 'v3d_v3d_pm_ops'
Date: Mon, 16 Nov 2020 17:41:04 +0000
Message-Id: <20201116174112.1833368-35-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201116174112.1833368-1-lee.jones@linaro.org>
References: <20201116174112.1833368-1-lee.jones@linaro.org>
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
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL3YzZC92M2RfZHJ2LmM6NzM6MzI6IHdhcm5pbmc6IOKAmHYzZF92M2RfcG1fb3Bz
4oCZIGRlZmluZWQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC1jb25zdC12YXJpYWJsZT1dCgpDYzog
RXJpYyBBbmhvbHQgPGVyaWNAYW5ob2x0Lm5ldD4KQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBs
aW51eC5pZT4KQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KQ2M6IFBoaWxpcHAg
WmFiZWwgPHAuemFiZWxAcGVuZ3V0cm9uaXguZGU+CkNjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnClNpZ25lZC1vZmYtYnk6IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+
Ci0tLQogZHJpdmVycy9ncHUvZHJtL3YzZC92M2RfZHJ2LmMgfCAzNiAtLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDM2IGRlbGV0aW9ucygtKQoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS92M2QvdjNkX2Rydi5jIGIvZHJpdmVycy9ncHUvZHJt
L3YzZC92M2RfZHJ2LmMKaW5kZXggMmRhMGMxMTgwYmM2OS4uNDJkNDAxZmQyNDRlMyAxMDA2NDQK
LS0tIGEvZHJpdmVycy9ncHUvZHJtL3YzZC92M2RfZHJ2LmMKKysrIGIvZHJpdmVycy9ncHUvZHJt
L3YzZC92M2RfZHJ2LmMKQEAgLTM4LDQyICszOCw2IEBACiAjZGVmaW5lIERSSVZFUl9NSU5PUiAw
CiAjZGVmaW5lIERSSVZFUl9QQVRDSExFVkVMIDAKIAotI2lmZGVmIENPTkZJR19QTQotc3RhdGlj
IGludCB2M2RfcnVudGltZV9zdXNwZW5kKHN0cnVjdCBkZXZpY2UgKmRldikKLXsKLQlzdHJ1Y3Qg
ZHJtX2RldmljZSAqZHJtID0gZGV2X2dldF9kcnZkYXRhKGRldik7Ci0Jc3RydWN0IHYzZF9kZXYg
KnYzZCA9IHRvX3YzZF9kZXYoZHJtKTsKLQotCXYzZF9pcnFfZGlzYWJsZSh2M2QpOwotCi0JY2xr
X2Rpc2FibGVfdW5wcmVwYXJlKHYzZC0+Y2xrKTsKLQotCXJldHVybiAwOwotfQotCi1zdGF0aWMg
aW50IHYzZF9ydW50aW1lX3Jlc3VtZShzdHJ1Y3QgZGV2aWNlICpkZXYpCi17Ci0Jc3RydWN0IGRy
bV9kZXZpY2UgKmRybSA9IGRldl9nZXRfZHJ2ZGF0YShkZXYpOwotCXN0cnVjdCB2M2RfZGV2ICp2
M2QgPSB0b192M2RfZGV2KGRybSk7Ci0JaW50IHJldDsKLQotCXJldCA9IGNsa19wcmVwYXJlX2Vu
YWJsZSh2M2QtPmNsayk7Ci0JaWYgKHJldCAhPSAwKQotCQlyZXR1cm4gcmV0OwotCi0JLyogWFhY
OiBWUE0gYmFzZSAqLwotCi0JdjNkX21tdV9zZXRfcGFnZV90YWJsZSh2M2QpOwotCXYzZF9pcnFf
ZW5hYmxlKHYzZCk7Ci0KLQlyZXR1cm4gMDsKLX0KLSNlbmRpZgotCi1zdGF0aWMgY29uc3Qgc3Ry
dWN0IGRldl9wbV9vcHMgdjNkX3YzZF9wbV9vcHMgPSB7Ci0JU0VUX1JVTlRJTUVfUE1fT1BTKHYz
ZF9ydW50aW1lX3N1c3BlbmQsIHYzZF9ydW50aW1lX3Jlc3VtZSwgTlVMTCkKLX07Ci0KIHN0YXRp
YyBpbnQgdjNkX2dldF9wYXJhbV9pb2N0bChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCB2b2lkICpk
YXRhLAogCQkJICAgICAgIHN0cnVjdCBkcm1fZmlsZSAqZmlsZV9wcml2KQogewotLSAKMi4yNS4x
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
