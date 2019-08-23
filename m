Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 37C9A9A8F7
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2019 09:35:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54A0B6EBDB;
	Fri, 23 Aug 2019 07:35:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 071D16EBD8
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2019 07:35:08 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id l14so7937776ljj.9
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2019 00:35:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uviA742n/WPhqJ2p0ywgQN7PPZdj9n55wlPOzt1ahOA=;
 b=O0i6qgizpN49HMw441IqXG/g6ZMy+ojBcWc/PW1CTxdmsECxYeC8u7w2VazUNv48kl
 5nir4Bqa0RvfoO4mt9I0PAQH9JgpZh8p3kiASKIT5D1ZMEHmjdtCqYlp6NlSXAd57SVt
 UDn13VWpFdjI+XgKoSLOpKY082XEvvLO4CED0+Y81qZAvuypOgLPa2YDzXsJzbK3lHGP
 o6TKxmNG4iMBtKlN7YjiMWYxK/9ZqCyvX0eN7XZjpS4cQfcOI1rGkNdFfOoSl6hiJ23D
 bCsSdpZsjEnDxlb6bgpmwkR8PZoBTDnuYTajOG9IebjrGzaLltrxqL8ywJVgkVZaJg69
 yxLQ==
X-Gm-Message-State: APjAAAXMEsJ6X4dABM3pk9dYp4MGoWxrTMrK6vwM5JPM2XmjcJ05WcJh
 qHbn3OSklXobPwza7x1aG5M6GQ==
X-Google-Smtp-Source: APXvYqzB/63/X4i6oDk8h67bDnxCyqyaudqGHwVSFHmXzxq7F/U465KbaeCyGoSfIkUdG0xDiSlAww==
X-Received: by 2002:a2e:9252:: with SMTP id v18mr1988085ljg.93.1566545705417; 
 Fri, 23 Aug 2019 00:35:05 -0700 (PDT)
Received: from genomnajs.ideon.se ([85.235.10.227])
 by smtp.gmail.com with ESMTPSA id n7sm483780ljh.2.2019.08.23.00.35.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Aug 2019 00:35:04 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: [PATCH 6/6 v2] drm/msm/hdmi: Do not initialize HPD line value
Date: Fri, 23 Aug 2019 09:34:48 +0200
Message-Id: <20190823073448.8385-6-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190823073448.8385-1-linus.walleij@linaro.org>
References: <20190823073448.8385-1-linus.walleij@linaro.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uviA742n/WPhqJ2p0ywgQN7PPZdj9n55wlPOzt1ahOA=;
 b=vGNGwRJ14+9wFedjL20SfmCe4wJvbQoWtTcO0L60xQzXzjgz6N/j8BHqmm7yFoiQbA
 h7Hk6VMXUYx+uzZzlu2ZJcg/0GLqKJ2V/hX9O5aazLv4Z6GJjhnBWTXscRFAnQwYmWfH
 DWQ0+vRsCvg9h+5GZ/a7tHNR4k/U1cRuG9aAGSHcsqdVD6T2o5JGrkQKgMLPT+Va8bl2
 /qEXDHuFBYDNizFUWJBo1tYImdjPurPttnpbGJGgSXUWMROn/mfZmYXhxRYE2Q2jg0rA
 OO1dsFj8upDGOig99MjUcfwhYvKn4DM26rRHM1tI7M5ZFUMaDNJb3bF3retesGRRtZGN
 fqsQ==
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
Cc: dri-devel@lists.freedesktop.org, Brian Masney <masneyb@onstation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWZ0ZXIgdW50YW5nbGluZyB0aGUgTVNNIEhETUkgR1BJTyBjb2RlIHdlIHNlZSB0aGF0IHRoZSBj
b2RlCmlzIGRlbGliZXJhdGVseSBzZXR0aW5nIHRoZSBvdXRwdXQgdmFsdWUgb2YgdGhlIEhQRCAo
aG90IHBsdWcKZGV0ZWN0KSBsaW5lIHRvIGhpZ2gsIGV2ZW4gdGhvdWdoIGl0IGlzIGJlaW5nIHVz
ZWQgYXMgaW5wdXQKd2hpY2ggaXMgb2YgY291cnNlIHRoZSBvbmx5IHZpYWJsZSB1c2Ugb2YgYSBI
UEQgcGluLgoKVGhpcyBzZWVtcyBkdWJpb3VzOiBHUElPIGxpbmVzIHNldCB1cCBhcyBpbnB1dCB3
aWxsIGhhdmUgaGlnaAppbXBlZGFuY2UgKHRyaXN0YXRlKSBhbmQgdGhlIHR5cGljYWwgZWxlY3Ry
b25pYyBjb25zdHJ1Y3Rpb24KaW52b2x2ZXMgdGhpcyBsaW5lIGJlaW5nIHVzZWQgd2l0aCBhIHB1
bGwtZG93biByZXNpc3RvciBhcm91bmQKMTBLT2htIHRvIGtlZXAgaXQgbG93ICh0aGlzIGlzIHNv
bWV0aW1lcyBwYXJ0IG9mIGEgbGV2ZWxzaGlmdGVyCmNvbXBvbmVudCkgYW5kIHRoZW4gYW4gaW5z
ZXJ0ZWQgY29ubmVjdG9yIHdpbGwgcHVsbCBpdCB1cCB0bwpWREQgYW5kIHRoaXMgYXNzZXJ0cyB0
aGUgSFBEIHNpZ25hbCwgYXMgY2FuIGJlIHNlZW4gZnJvbSB0aGUKY29kZSByZWFkaW5nIHRoZSBI
UEQgR1BJTy4KClN0b3AgdHJ5IGRyaXZpbmcgYSB2YWx1ZSB0byB0aGUgSFBEIGlucHV0IEdQSU8u
CgpDYzogUm9iIENsYXJrIDxyb2JkY2xhcmtAZ21haWwuY29tPgpDYzogU2VhbiBQYXVsIDxzZWFu
QHBvb3JseS5ydW4+CkNjOiBsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZwpDYzogZnJlZWRy
ZW5vQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpSZXZpZXdlZC1ieTogQnJpYW4gTWFzbmV5IDxtYXNu
ZXliQG9uc3RhdGlvbi5vcmc+ClNpZ25lZC1vZmYtYnk6IExpbnVzIFdhbGxlaWogPGxpbnVzLndh
bGxlaWpAbGluYXJvLm9yZz4KLS0tCkNoYW5nZUxvZyB2MS0+djI6Ci0gUmViYXNlZCBvbiB2NS4z
LXJjMQotIENvbGxlY3RlZCByZXZpZXcgdGFnCi0tLQogZHJpdmVycy9ncHUvZHJtL21zbS9oZG1p
L2hkbWlfY29ubmVjdG9yLmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyks
IDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2hkbWkvaGRt
aV9jb25uZWN0b3IuYyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vaGRtaS9oZG1pX2Nvbm5lY3Rvci5j
CmluZGV4IGYwMDY2ODI5MzVlOS4uYmIxYzQ5ZTNjOWRkIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vbXNtL2hkbWkvaGRtaV9jb25uZWN0b3IuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vbXNt
L2hkbWkvaGRtaV9jb25uZWN0b3IuYwpAQCAtNzYsNyArNzYsNyBAQCBzdGF0aWMgaW50IGdwaW9f
Y29uZmlnKHN0cnVjdCBoZG1pICpoZG1pLCBib29sIG9uKQogCQkJc3RydWN0IGhkbWlfZ3Bpb19k
YXRhIGdwaW8gPSBjb25maWctPmdwaW9zW2ldOwogCiAJCQkvKiBUaGUgdmFsdWUgaW5kaWNhdGVz
IHRoZSB2YWx1ZSBmb3IgdHVybmluZyB0aGluZ3Mgb24gKi8KLQkJCWlmIChncGlvLmdwaW9kKQor
CQkJaWYgKGdwaW8uZ3Bpb2QgJiYgZ3Bpby5vdXRwdXQpCiAJCQkJZ3Bpb2Rfc2V0X3ZhbHVlX2Nh
bnNsZWVwKGdwaW8uZ3Bpb2QsIGdwaW8udmFsdWUpOwogCQl9CiAKLS0gCjIuMjEuMAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
