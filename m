Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53A39E2B13
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2019 09:27:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 665E26E105;
	Thu, 24 Oct 2019 07:27:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A963E6E09E
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2019 04:35:21 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id u23so2753634pgo.0
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2019 21:35:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=CzCw3IYqeYSXpGArtHPpGd9GmjU7vUzYamH5j0DtGSA=;
 b=O+NNpfN9JR619JeodCrmO/u+gnbgvhLbRsNiUvkToq5FpCYeQ1TDcbwNglL0yW3kpK
 cRgbDB/63EsSLCbSCE+EuLBU+2hOwLTLMNZDpnN0MSFZkXjr3nK+u0YWxR8RJePf8l7/
 vVgI4Y04GyZv2qoDV8OESvADGgoT1MeGBf9b6TFdwN2oemY1Mbdb0pGnAxvAQpf1b+VC
 lN+SJiPmm2zYZji5MyOuF8ApJqTRjZsqDCR0Ng/liQABBOZtUDpVB+tFg3ey67Cej2xb
 Cygg0CpTXaXQBoHH/ouM8DbyNa5zV6cFW6SNUH+hkh/WAYCGlMeM6ZFKcd5O86mEv4do
 U68Q==
X-Gm-Message-State: APjAAAVfpyMCa0L3JQc0pnQjye1aam42xQ9Hewzq/hP2CQRNZ9Hge06Q
 5cNxxhmcgYDMhbDNH6eK1xGZ0xxm
X-Google-Smtp-Source: APXvYqyHZ4muQM2ZmLdy2/Un3yNRaDV3CoQ34+bsEY5/CIJQf0L3VKbl6ac1cjXtIh7d71QR+GS1kA==
X-Received: by 2002:aa7:8dd9:: with SMTP id j25mr14817551pfr.94.1571891720847; 
 Wed, 23 Oct 2019 21:35:20 -0700 (PDT)
Received: from bhanu-VirtualBox.danlawtech.com ([183.82.102.247])
 by smtp.gmail.com with ESMTPSA id q33sm23553605pgm.50.2019.10.23.21.35.18
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 23 Oct 2019 21:35:20 -0700 (PDT)
From: Bhanusree <bhanusreemahesh@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2] drm/gpu: Add comment for memory barrier
Date: Thu, 24 Oct 2019 09:58:33 +0530
Message-Id: <1571891313-14341-1-git-send-email-bhanusreemahesh@gmail.com>
X-Mailer: git-send-email 2.7.4
X-Mailman-Approved-At: Thu, 24 Oct 2019 07:27:37 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=CzCw3IYqeYSXpGArtHPpGd9GmjU7vUzYamH5j0DtGSA=;
 b=NnOdq+8P7mM7NllNfAhwbDY2cGk9Yb6JO7JTkDZT/OBzyCvl1GyKZQjY/3UDev2EOA
 aOTqbtkTMMrlwcQSc3keD8O8Jj//G2GAmZ7l/OGyox+BVAFOmE3BWdJyoQEgI6fP/1xr
 g4YRqtYBdPb5Zx3HZyCJVO7nBMyW6ozDoH+tBOngg2iIpAr7emDmZNGLROfW3iK72+ss
 kHHfb2qKcazSF4NGAkXOM8+sWrxsIVLBsoDEduskQh2H/CFa8lenuYnw3Is2WoPEJ9Jn
 l8RUIqDu5m7kL66nRlm629TKOLyaZ+xFOuFUoSEiSPbmuNSpSCGIJ4ICaPIl9/wO/cKY
 UQRg==
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
Cc: airlied@linux.ie, Bhanusree <bhanusreemahesh@gmail.com>, sean@poorly.run
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

LUFkZCBjb21tZW50IGZvciBtZW1vcnkgYmFycmllcgotSXNzdWUgZm91bmQgdXNpbmcgY2hlY2tw
YXRjaC5wbAoKU2lnbmVkLW9mZi1ieTogQmhhbnVzcmVlIDxiaGFudXNyZWVtYWhlc2hAZ21haWwu
Y29tPgotLS0KCnYyOm1vZGlmaWVkIG1lbW9yeSBiYXJyaWVyIGNvbW1lbnRzIGFwcHJvcHJpYXRl
bHkKCiBkcml2ZXJzL2dwdS9kcm0vZHJtX2NhY2hlLmMgfCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2Vk
LCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2RybV9jYWNoZS5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9jYWNoZS5jCmluZGV4IDNi
ZDc2ZTkuLmU1NzQyNjEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fY2FjaGUuYwor
KysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2NhY2hlLmMKQEAgLTYyLDEwICs2MiwxMCBAQCBzdGF0
aWMgdm9pZCBkcm1fY2FjaGVfZmx1c2hfY2xmbHVzaChzdHJ1Y3QgcGFnZSAqcGFnZXNbXSwKIHsK
IAl1bnNpZ25lZCBsb25nIGk7CiAKLQltYigpOworCW1iKCk7IC8qRnVsbCBtZW1vcnkgYmFycmll
ciB1c2VkIGJlZm9yZSBzbyB0aGF0IENMRkxVU0ggaXMgb3JkZXJlZCovCiAJZm9yIChpID0gMDsg
aSA8IG51bV9wYWdlczsgaSsrKQogCQlkcm1fY2xmbHVzaF9wYWdlKCpwYWdlcysrKTsKLQltYigp
OworCW1iKCk7IC8qQWxzbyB1c2VkIGFmdGVyIENMRkxVU0ggc28gdGhhdCBhbGwgY2FjaGUgaXMg
Zmx1c2hlZCovCiB9CiAjZW5kaWYKIAotLSAKMi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
