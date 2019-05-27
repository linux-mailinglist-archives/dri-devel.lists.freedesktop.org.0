Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDCCD2AFF7
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2019 10:19:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6189389958;
	Mon, 27 May 2019 08:19:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8DCC89948;
 Mon, 27 May 2019 08:19:20 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id u78so2331505wmu.5;
 Mon, 27 May 2019 01:19:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7/ikaNXVp9+PnAgzUDoGM6SIYABdB5AKJ9WaI3xbsPs=;
 b=OMThtahmznxUdhVk+WfjINKhEo6oZdbYj/CyN5AA1nY8D+I5Y/UhK/D3CFLkT2dv8b
 3dT3ch4/8aRApFUeEiQfM5YdWG3T5ApPEIrQVW3su8P8RsKEMHBAtKHCXrVi0BuUlCJl
 FKeS92Q2cT+LXkXttJ+NU5K+R9/H5hHKdItLZXg+kFA9F+LJJSqdcBvZ7X48DQmEwJFH
 vIYoKjg4JVF0kkCEJ2bTiQHRZeJPdfyq4lk5gNjWJGJ9xmPIrBgMczKAm7VYaq6C/uAu
 3aboK69uFmEZu1xXdPkuY3s3FqbhAkP6MRfTdlvNNKSDMEIvjjeAAbDv2m22cvI6k8wE
 yJPA==
X-Gm-Message-State: APjAAAXm+Yyix3Y54QwAOkn9Osh9ZZqM0n4jZ8glOTd42tjy4aeXhi7p
 JruPCZ/pXTXyzhgRUe01TNIjNKmh
X-Google-Smtp-Source: APXvYqxxyufUr+1P1rzDjlqqBfe0aHFQnFeAScxLcRVmKXa1ob7YcZ+JyMWG9/yb7YasxbvKFqUQ3A==
X-Received: by 2002:a1c:c5cf:: with SMTP id v198mr9030487wmf.84.1558945158972; 
 Mon, 27 May 2019 01:19:18 -0700 (PDT)
Received: from localhost.localdomain
 (cpc91192-cmbg18-2-0-cust374.5-4.cable.virginm.net. [80.6.113.119])
 by smtp.gmail.com with ESMTPSA id a124sm7511876wmh.3.2019.05.27.01.19.17
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 27 May 2019 01:19:18 -0700 (PDT)
From: Emil Velikov <emil.l.velikov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 06/13] drm/lima: drop DRM_AUTH usage from the driver
Date: Mon, 27 May 2019 09:17:34 +0100
Message-Id: <20190527081741.14235-6-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190527081741.14235-1-emil.l.velikov@gmail.com>
References: <20190527081741.14235-1-emil.l.velikov@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7/ikaNXVp9+PnAgzUDoGM6SIYABdB5AKJ9WaI3xbsPs=;
 b=bh/V93i84OIw+2V7Fi881TJbgdGVrsAvj+y3rpLV9EhmlQE85gVYeOvGH0DtHb/SPH
 jzRbGWQI7iu39VAwJEfFIq/1GpjFjPPDC3G41rF94h/2BTFB2BAzH+s7Nq2WmMHUPH4h
 nca5JJ0MTNKSemqeU10G1N/tbQMpTv14qkLRs+mPBjpin5FsURpRp2vJrVXuq7zH22Dz
 eYqki4AvHHAlcMgMky0d4onHp1qClWjkdKZVvMyaGprFqxfUcspNYy34vi63Am6thRtH
 aMCajH2S26/mY63ViIbmZNuqxfzcjsM0ZOCc5ZLvLiP0NhtL/jFeEXjBb8JwteoSI1ho
 DzGQ==
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
Cc: David Airlie <airlied@linux.ie>, emil.l.velikov@gmail.com,
 Qiang Yu <yuq825@gmail.com>, lima@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogRW1pbCBWZWxpa292IDxlbWlsLnZlbGlrb3ZAY29sbGFib3JhLmNvbT4KClRoZSBhdXRo
ZW50aWNhdGlvbiBjYW4gYmUgY2lyY3VtdmVudGVkLCBieSBkZXNpZ24sIGJ5IHVzaW5nIHRoZSBy
ZW5kZXIKbm9kZS4KCkZyb20gdGhlIGRyaXZlciBQT1YgdGhlcmUgaXMgbm8gZGlzdGluY3Rpb24g
YmV0d2VlbiBwcmltYXJ5IGFuZCByZW5kZXIKbm9kZXMsIHRodXMgd2UgY2FuIGRyb3AgdGhlIHRv
a2VuLgoKQ2M6IFFpYW5nIFl1IDx5dXE4MjVAZ21haWwuY29tPgpDYzogbGltYUBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KQ2M6IERhbmll
bCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KU2lnbmVkLW9mZi1ieTogRW1pbCBWZWxpa292IDxl
bWlsLnZlbGlrb3ZAY29sbGFib3JhLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vbGltYS9saW1h
X2Rydi5jIHwgMTQgKysrKysrKy0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMo
KyksIDcgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2xpbWEvbGlt
YV9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9saW1hL2xpbWFfZHJ2LmMKaW5kZXggYjI5YzI2Y2Qx
M2IyLi5hZTg5OTM4YzYzYjEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9saW1hL2xpbWFf
ZHJ2LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2xpbWEvbGltYV9kcnYuYwpAQCAtMjMxLDEzICsy
MzEsMTMgQEAgc3RhdGljIHZvaWQgbGltYV9kcm1fZHJpdmVyX3Bvc3RjbG9zZShzdHJ1Y3QgZHJt
X2RldmljZSAqZGV2LCBzdHJ1Y3QgZHJtX2ZpbGUgKmYKIH0KIAogc3RhdGljIGNvbnN0IHN0cnVj
dCBkcm1faW9jdGxfZGVzYyBsaW1hX2RybV9kcml2ZXJfaW9jdGxzW10gPSB7Ci0JRFJNX0lPQ1RM
X0RFRl9EUlYoTElNQV9HRVRfUEFSQU0sIGxpbWFfaW9jdGxfZ2V0X3BhcmFtLCBEUk1fQVVUSHxE
Uk1fUkVOREVSX0FMTE9XKSwKLQlEUk1fSU9DVExfREVGX0RSVihMSU1BX0dFTV9DUkVBVEUsIGxp
bWFfaW9jdGxfZ2VtX2NyZWF0ZSwgRFJNX0FVVEh8RFJNX1JFTkRFUl9BTExPVyksCi0JRFJNX0lP
Q1RMX0RFRl9EUlYoTElNQV9HRU1fSU5GTywgbGltYV9pb2N0bF9nZW1faW5mbywgRFJNX0FVVEh8
RFJNX1JFTkRFUl9BTExPVyksCi0JRFJNX0lPQ1RMX0RFRl9EUlYoTElNQV9HRU1fU1VCTUlULCBs
aW1hX2lvY3RsX2dlbV9zdWJtaXQsIERSTV9BVVRIfERSTV9SRU5ERVJfQUxMT1cpLAotCURSTV9J
T0NUTF9ERUZfRFJWKExJTUFfR0VNX1dBSVQsIGxpbWFfaW9jdGxfZ2VtX3dhaXQsIERSTV9BVVRI
fERSTV9SRU5ERVJfQUxMT1cpLAotCURSTV9JT0NUTF9ERUZfRFJWKExJTUFfQ1RYX0NSRUFURSwg
bGltYV9pb2N0bF9jdHhfY3JlYXRlLCBEUk1fQVVUSHxEUk1fUkVOREVSX0FMTE9XKSwKLQlEUk1f
SU9DVExfREVGX0RSVihMSU1BX0NUWF9GUkVFLCBsaW1hX2lvY3RsX2N0eF9mcmVlLCBEUk1fQVVU
SHxEUk1fUkVOREVSX0FMTE9XKSwKKwlEUk1fSU9DVExfREVGX0RSVihMSU1BX0dFVF9QQVJBTSwg
bGltYV9pb2N0bF9nZXRfcGFyYW0sIERSTV9SRU5ERVJfQUxMT1cpLAorCURSTV9JT0NUTF9ERUZf
RFJWKExJTUFfR0VNX0NSRUFURSwgbGltYV9pb2N0bF9nZW1fY3JlYXRlLCBEUk1fUkVOREVSX0FM
TE9XKSwKKwlEUk1fSU9DVExfREVGX0RSVihMSU1BX0dFTV9JTkZPLCBsaW1hX2lvY3RsX2dlbV9p
bmZvLCBEUk1fUkVOREVSX0FMTE9XKSwKKwlEUk1fSU9DVExfREVGX0RSVihMSU1BX0dFTV9TVUJN
SVQsIGxpbWFfaW9jdGxfZ2VtX3N1Ym1pdCwgRFJNX1JFTkRFUl9BTExPVyksCisJRFJNX0lPQ1RM
X0RFRl9EUlYoTElNQV9HRU1fV0FJVCwgbGltYV9pb2N0bF9nZW1fd2FpdCwgRFJNX1JFTkRFUl9B
TExPVyksCisJRFJNX0lPQ1RMX0RFRl9EUlYoTElNQV9DVFhfQ1JFQVRFLCBsaW1hX2lvY3RsX2N0
eF9jcmVhdGUsIERSTV9SRU5ERVJfQUxMT1cpLAorCURSTV9JT0NUTF9ERUZfRFJWKExJTUFfQ1RY
X0ZSRUUsIGxpbWFfaW9jdGxfY3R4X2ZyZWUsIERSTV9SRU5ERVJfQUxMT1cpLAogfTsKIAogc3Rh
dGljIGNvbnN0IHN0cnVjdCBmaWxlX29wZXJhdGlvbnMgbGltYV9kcm1fZHJpdmVyX2ZvcHMgPSB7
Ci0tIAoyLjIxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
