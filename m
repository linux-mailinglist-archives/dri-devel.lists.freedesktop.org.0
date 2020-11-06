Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 357D22A9F63
	for <lists+dri-devel@lfdr.de>; Fri,  6 Nov 2020 22:50:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 269A26EB24;
	Fri,  6 Nov 2020 21:50:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E1816EB23
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Nov 2020 21:50:01 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id v5so2842489wmh.1
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Nov 2020 13:50:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/yTQMc6a66cwUFoQYWGGyiO2EU4ADWxZkG+2OvZt+WM=;
 b=uu5CGwOhSh+kpjSSd4FX+GvasU7eWip8CDp0IRaYQIF5N1TIYgU5kTexPHmzjkcK5D
 rTMLSCA6JSbeVTgKQKc0amCA0raDfgjYOkfCwhHq6PPFHEqV2O2FThee1nR93MVA41DF
 vznj0gRfU91Nt7HHqrhb1lHlpEqH573c8ytllAEtmVkmRqGXc7tF+34xrKGJQ+2DtLBi
 q4Qgut7OuPIbGSw2oNfsoZxevt2fuKfP00Wn4+I3MglnWzYYBwbbhQxF2x/EzvEfJ29K
 m1x3flrkiiysoh9NkBkFMCBloyKb7FbsxskEnnXG//znSHi7DxDSXACWic4J5SZHaJrg
 kTxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/yTQMc6a66cwUFoQYWGGyiO2EU4ADWxZkG+2OvZt+WM=;
 b=J3Jf1ZnzH9J98E49ZjydeY3LQ+iVN0MCCma2n+gbuFV8cFEN5d4utIG02cSR4ld7T3
 hXDMIbhHo1L/ZExxStBIjoxB8+VDempYUSHeFJbe0C8B17Y2GolWskRvqNioDw7DOKRv
 pizUdA/AGLQFUDeA6KIvLLljZ3TLNsX6C/jIOpCowL1hCRxevQlNn4+M6uHyQw18RWKd
 8eZREjQ3vi6HS3H773C5KdFGszFUZr1u6aez5fv9B7eSiCKTVUcmfM/MR/iA0+b4Q6yW
 YNwhpYsNajjEDnn2/Yu5O/c/Qm7GfQeCKt1+p8hvIQKJhtJr903meECUa52xlxQWoTxx
 V3ew==
X-Gm-Message-State: AOAM531QfTHOUBVvqBotSh/KYjqRPNfrWlYwGWf6wKXGLmoqPU7VBK9E
 n+GjaM1OdWpPAar/EdgGhC0fXg==
X-Google-Smtp-Source: ABdhPJy5LKzmQoSeaJUeYWgN9CpdYgSjweaktI1+rR7Bn53iyx1LEhARhzIXTJr0ekOvGwY9RdRdFg==
X-Received: by 2002:a1c:8087:: with SMTP id b129mr1656632wmd.10.1604699399772; 
 Fri, 06 Nov 2020 13:49:59 -0800 (PST)
Received: from dell.default ([91.110.221.236])
 by smtp.gmail.com with ESMTPSA id t199sm3981084wmt.46.2020.11.06.13.49.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2020 13:49:59 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 05/19] drm/mga/mga_state: Remove unused variable 'buf_priv'
Date: Fri,  6 Nov 2020 21:49:35 +0000
Message-Id: <20201106214949.2042120-6-lee.jones@linaro.org>
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
 by <jhartmann@precisioninsight.com>, dri-devel@lists.freedesktop.org,
 Keith Whitwell <keith@tungstengraphics.com>,
 Jeff Hartmann <jhartmann@valinux.com>, Gareth Hughes <gareth@valinux.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL21nYS9tZ2Ffc3RhdGUuYzogSW4gZnVuY3Rpb24g4oCYbWdhX2RtYV9pbG9hZOKA
mToKIGRyaXZlcnMvZ3B1L2RybS9tZ2EvbWdhX3N0YXRlLmM6OTQ1OjIyOiB3YXJuaW5nOiB2YXJp
YWJsZSDigJhidWZfcHJpduKAmSBzZXQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC1idXQtc2V0LXZh
cmlhYmxlXQoKQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KQ2M6IERhbmllbCBW
ZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KQ2M6IGJ5IDxqaGFydG1hbm5AcHJlY2lzaW9uaW5zaWdo
dC5jb20+CkNjOiBKZWZmIEhhcnRtYW5uIDxqaGFydG1hbm5AdmFsaW51eC5jb20+CkNjOiBLZWl0
aCBXaGl0d2VsbCA8a2VpdGhAdHVuZ3N0ZW5ncmFwaGljcy5jb20+CkNjOiBHYXJldGggSHVnaGVz
IDxnYXJldGhAdmFsaW51eC5jb20+CkNjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
ClNpZ25lZC1vZmYtYnk6IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+Ci0tLQogZHJp
dmVycy9ncHUvZHJtL21nYS9tZ2Ffc3RhdGUuYyB8IDIgLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZ2EvbWdhX3N0YXRlLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vbWdhL21nYV9zdGF0ZS5jCmluZGV4IDc3YTBiMDA2ZjA2NjkuLjBk
ZWM0MDYyZTVhMmYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZ2EvbWdhX3N0YXRlLmMK
KysrIGIvZHJpdmVycy9ncHUvZHJtL21nYS9tZ2Ffc3RhdGUuYwpAQCAtOTQyLDcgKzk0Miw2IEBA
IHN0YXRpYyBpbnQgbWdhX2RtYV9pbG9hZChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCB2b2lkICpk
YXRhLCBzdHJ1Y3QgZHJtX2ZpbGUgKmZpCiAJc3RydWN0IGRybV9kZXZpY2VfZG1hICpkbWEgPSBk
ZXYtPmRtYTsKIAlkcm1fbWdhX3ByaXZhdGVfdCAqZGV2X3ByaXYgPSBkZXYtPmRldl9wcml2YXRl
OwogCXN0cnVjdCBkcm1fYnVmICpidWY7Ci0JZHJtX21nYV9idWZfcHJpdl90ICpidWZfcHJpdjsK
IAlkcm1fbWdhX2lsb2FkX3QgKmlsb2FkID0gZGF0YTsKIAlEUk1fREVCVUcoIlxuIik7CiAKQEAg
LTk1OSw3ICs5NTgsNiBAQCBzdGF0aWMgaW50IG1nYV9kbWFfaWxvYWQoc3RydWN0IGRybV9kZXZp
Y2UgKmRldiwgdm9pZCAqZGF0YSwgc3RydWN0IGRybV9maWxlICpmaQogCQlyZXR1cm4gLUVJTlZB
TDsKIAogCWJ1ZiA9IGRtYS0+YnVmbGlzdFtpbG9hZC0+aWR4XTsKLQlidWZfcHJpdiA9IGJ1Zi0+
ZGV2X3ByaXZhdGU7CiAKIAlpZiAobWdhX3ZlcmlmeV9pbG9hZChkZXZfcHJpdiwgaWxvYWQtPmRz
dG9yZywgaWxvYWQtPmxlbmd0aCkpIHsKIAkJbWdhX2ZyZWVsaXN0X3B1dChkZXYsIGJ1Zik7Ci0t
IAoyLjI1LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
