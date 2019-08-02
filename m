Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2A9D80176
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2019 21:57:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECD366E84A;
	Fri,  2 Aug 2019 19:57:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
 [209.85.166.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0EF26E84A
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Aug 2019 19:57:29 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id e20so21757262iob.9
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Aug 2019 12:57:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AbgpOv1H26hrrq1E2mzo367fgYSd74YhpP7P/VGkIjY=;
 b=YC5YsJucFNaDDgB/DhcsIDbP2dUrGTfJdFPdAxB+4EBx0Ve0XZuLOZCyWH/FUjfe98
 EZvGb13/gBe6N/1h65KQHb5u8JJEPSWRX9nG5NqBQPetPKlvbcEAwDipGW90qUTGxNCv
 gbuW+yj0RJs7NKnNn8AgAGytz/Ok7y092yHYB0ZHHaEaJtqaXIp/DufmzdkBsWB2NGwJ
 GEldHC5o7peJVLXjhHNgZScz6wra2E1dK6eWtXlGZY5ZvkG+bK8og+XTno9XTTwkpjBN
 bJ+SGcwp9vydL0PyfkJa+7OpexSPNYwy6gcwPKlK6C8kp6IQFlFEzXd8Vk/YWN1iZDBR
 DklA==
X-Gm-Message-State: APjAAAXB1KkQxkGRZYvzzXJvHqn9q6ZMVZPpwbu6oj0darOG26JwJ3Tr
 yxMCC+J2euOMhx4QR1D6XD6iApA=
X-Google-Smtp-Source: APXvYqx2tynrZjIWtOmV2HW/m6UMqC+a0HN8d4Zz1IKqS1cD8/hQrAf2A5tRddbPTAOmAMZMsB8Alg==
X-Received: by 2002:a02:c65a:: with SMTP id k26mr6367856jan.18.1564775848815; 
 Fri, 02 Aug 2019 12:57:28 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.254])
 by smtp.googlemail.com with ESMTPSA id p25sm61908176iol.48.2019.08.02.12.57.28
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 02 Aug 2019 12:57:28 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/panfrost: Remove completed features still in TODO
Date: Fri,  2 Aug 2019 13:57:27 -0600
Message-Id: <20190802195727.1963-1-robh@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
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
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlcmUncyBhIGZldyBmZWF0dXJlcyB0aGUgZHJpdmVyIHN1cHBvcnRzIHdoaWNoIHdlIGZvcmdv
dCB0byByZW1vdmUsIHNvCnJlbW92ZSB0aGVtIG5vdy4KCkNjOiBUb21ldSBWaXpvc28gPHRvbWV1
LnZpem9zb0Bjb2xsYWJvcmEuY29tPgpDYzogQm9yaXMgQnJlemlsbG9uIDxib3Jpcy5icmV6aWxs
b25AY29sbGFib3JhLmNvbT4KU2lnbmVkLW9mZi1ieTogUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVs
Lm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvVE9ETyB8IDkgLS0tLS0tLS0tCiAx
IGZpbGUgY2hhbmdlZCwgOSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vcGFuZnJvc3QvVE9ETyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9UT0RPCmluZGV4IGMy
ZTQ0YWRkMzdkOC4uMmFjOTcyYTM0NjljIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vcGFu
ZnJvc3QvVE9ETworKysgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvVE9ETwpAQCAtMSwxNSAr
MSw5IEBACi0tIFRoZXJtYWwgc3VwcG9ydC4KLQogLSBCaWZyb3N0IHN1cHBvcnQ6CiAgIC0gRFQg
YmluZGluZ3MgKE5laWwsIFdJUCkKICAgLSBNTVUgcGFnZSB0YWJsZSBmb3JtYXQgYW5kIGFkZHJl
c3Mgc3BhY2Ugc2V0dXAKICAgLSBCaWZyb3N0IHNwZWNpZmljIGZlYXR1cmUgYW5kIGlzc3VlIGhh
bmRsaW5nCiAgIC0gQ29oZXJlbnQgRE1BIHN1cHBvcnQKIAotLSBTdXBwb3J0IGZvciAyTUIgcGFn
ZXMuIFRoZSBpby1wZ3RhYmxlIGNvZGUgYWxyZWFkeSBzdXBwb3J0cyB0aGlzLiBGaW5pc2hpbmcK
LSAgc3VwcG9ydCBpbnZvbHZlcyBlaXRoZXIgY29weWluZyBvciBhZGFwdGluZyB0aGUgaW9tbXUg
QVBJIHRvIGhhbmRsZSBwYXNzaW5nCi0gIGFsaWduZWQgYWRkcmVzc2VzIGFuZCBzaXplcyB0byB0
aGUgaW8tcGd0YWJsZSBjb2RlLgotCiAtIFBlciBGRCBhZGRyZXNzIHNwYWNlIHN1cHBvcnQuIFRo
ZSBoL3cgc3VwcG9ydHMgbXVsdGlwbGUgYWRkcmVzc2VzIHNwYWNlcy4KICAgVGhlIGhhcmQgcGFy
dCBpcyBoYW5kbGluZyB3aGVuIG1vcmUgYWRkcmVzcyBzcGFjZXMgYXJlIG5lZWRlZCB0aGFuIHdo
YXQKICAgdGhlIGgvdyBwcm92aWRlcy4KQEAgLTIyLDYgKzE2LDMgQEAKIAogLSBDb21wdXRlIGpv
YiBzdXBwb3J0LiBTbyBjYWxsZWQgJ2NvbXB1dGUgb25seScgam9icyBuZWVkIHRvIGJlIHBsdW1i
ZWQgdXAgdG8KICAgdXNlcnNwYWNlLgotCi0tIFBlcmZvcm1hbmNlIGNvdW50ZXIgc3VwcG9ydC4g
KEJvcmlzKQotCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
