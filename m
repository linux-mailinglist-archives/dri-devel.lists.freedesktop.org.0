Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7925E2A9F76
	for <lists+dri-devel@lfdr.de>; Fri,  6 Nov 2020 22:50:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB82F6EB36;
	Fri,  6 Nov 2020 21:50:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A234B6EB36
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Nov 2020 21:50:18 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id p1so2767500wrf.12
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Nov 2020 13:50:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1BAWNAgt/8o6t/4tV7E6hU4K4LH6BnOtAjU2sn0ZUiI=;
 b=TxSb65pMrJbCHOjX25f6OYd4V3p7wJVF4lcHGevOnmecoTAVwndthxXLhT3rNte7gY
 AxAnOEXF595IqOTv2Y5tl+q50a13jAGJ59jbWY73piaE9WrgUamD9uoaZbFhY8wJMRg2
 D1CJcaJ5NE9ZQKz0Q8+Es7snc67U/gUqzxXuX4Y6nXFEwrGx3ic3MXsvei2itMhLMVB8
 JVNmWtaKLiz5e3hAyW4MwkdidZUdfHiWY/HKn2rt37hARCWQPKS0ohh8s4047lOVBBrX
 S6un+r7uNWVJchl8piFvJz5DGC95hpA+4lq85jUn/8NZ4cRfK/K7b85Y78SdYlNn0Z4b
 M/ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1BAWNAgt/8o6t/4tV7E6hU4K4LH6BnOtAjU2sn0ZUiI=;
 b=menpoAu6wPpec6C3RNe/9EKCCwsBxTtyqtmi5u5buwIIQm10vZIDSF/q7UfG4R2YYm
 2J3gwdjik1NJcWS8u+TTBxYq7J7vt+4FmyRD5/2pubK6vuJIEnUCipzOeZ/Yvp/srL2Z
 tCMFgCcgPiym/pwh80V85nRhgpAf0/FpxiY672HXiB6MvH5mUb9XyFwa8OO+6n9jMR+k
 joiluqVYNfvMm+N2oZ3w0qP3RfLjiq6JjO76gHEe/9mU4eg3k2m54a4zHQwBQB7t7P4Y
 gsZEm8ZWanwF6Nk4wMHeRti1IJ+JR14xkknKCxZa/onq6tDWq7HrgR364uiiR8GolAMe
 cnJw==
X-Gm-Message-State: AOAM531rnQ3WKUlfQvYjUUPSA5a3eEH/c00Z7UCfS/WZVzEPPWxpbd84
 kzBHK1N443jHQS3fR+mhHpG6eQ==
X-Google-Smtp-Source: ABdhPJy3ISjKEsh/TLodAV9GaCzMV/+XKqTLBvTA/E2UlVG6XDxzt/sZfJ35v8GxQBN0sREoRPqZHA==
X-Received: by 2002:adf:f2c7:: with SMTP id d7mr1084417wrp.142.1604699417367; 
 Fri, 06 Nov 2020 13:50:17 -0800 (PST)
Received: from dell.default ([91.110.221.236])
 by smtp.gmail.com with ESMTPSA id t199sm3981084wmt.46.2020.11.06.13.50.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2020 13:50:16 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 19/19] drm/v3d/v3d_drv: Remove unused static variable
 'v3d_v3d_pm_ops'
Date: Fri,  6 Nov 2020 21:49:49 +0000
Message-Id: <20201106214949.2042120-20-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201106214949.2042120-1-lee.jones@linaro.org>
References: <20201106214949.2042120-1-lee.jones@linaro.org>
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
L3YzZC92M2RfZHJ2LmMKaW5kZXggOWY3YzI2MTkzODMxMi4uYTViZjA5NDU4NDUxYyAxMDA2NDQK
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
