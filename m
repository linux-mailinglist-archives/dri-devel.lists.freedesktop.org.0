Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 230632DB9C
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2019 13:20:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE2FB6E2D8;
	Wed, 29 May 2019 11:20:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABEC66E0F0
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2019 10:26:51 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id c6so1331806pfa.10
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2019 03:26:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YcCSMOQNkzGaXhDk0okGAy0XqAbQi4G2u6aLWlPaPBw=;
 b=OFqVDgsFJeQWznGywuNQLzFKsNpKVSm4zz7WMkMEIH/31jCyexKIJU7GfbZUfkOFzf
 76HGBW0WLFGrcLRBj0x+68+wI3lNy5o/h4buRfjHeuYoEGkBAGzpFQAf+iVQGGTh0EqY
 rBm3+I+Nxy8LezW8c7QqAMNPv6aUS4Y83cG4H7e9KignyvLdUs96rQAp+F7cBFC1aqhn
 gey7p9HV/RW0PlutdAIhI5m/GWoQZK7f1OCwQ4SWh69V4crFa6yj5aEBxO2e2zBfNP6V
 122l/1/wj/Dqq6oz5xMpsbS93U+U8DFB+veCFRooOX73CJPjTPFyYM1vhx+7RPxamzlX
 uMuw==
X-Gm-Message-State: APjAAAWkdI/7+RLevDm6bxEfamTysDLv7BCQ7gZy3v6iXoH1ayMKHH7a
 pu7DPzrTwKwGCgMOYUZiPqyw2Q==
X-Google-Smtp-Source: APXvYqyyaROmC37HXAcccgz51No+HwGj0nRGT99eAspxv1IL1mnTD2gRQ1iaLO7Rvi00xcw+ddOyEQ==
X-Received: by 2002:a17:90a:ac0d:: with SMTP id
 o13mr11037075pjq.139.1559125611164; 
 Wed, 29 May 2019 03:26:51 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:b852:bd51:9305:4261])
 by smtp.gmail.com with ESMTPSA id e12sm18992183pfl.122.2019.05.29.03.26.49
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 29 May 2019 03:26:50 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 4/4] drm: mediatek: clear num_pipes when unbind driver
Date: Wed, 29 May 2019 18:25:55 +0800
Message-Id: <20190529102555.251579-5-hsinyi@chromium.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190529102555.251579-1-hsinyi@chromium.org>
References: <20190529102555.251579-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 29 May 2019 11:20:23 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YcCSMOQNkzGaXhDk0okGAy0XqAbQi4G2u6aLWlPaPBw=;
 b=Cuhppf15fgs+ro5fQzou91thI1XLxU4KioJr8st6A+3rShMcYV8fSqZOp424wsNyS7
 Yjt8ZDWKI8t5jY8/w/olvN9NejpmeXI58p0vNnxcpidO9I9OYs9PLq5hcAy2JUfwloW/
 0z63BUjUnVKb52ngcrkoQKYOWPV2zpLSKFZpM=
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

bnVtX3BpcGVzIGlzIHVzZWQgZm9yIG11dGV4IGNyZWF0ZWQgaW4gbXRrX2RybV9jcnRjX2NyZWF0
ZSgpLiBJZiB3ZQpkb24ndCBjbGVhciBudW1fcGlwZXMgY291bnQsIHdoZW4gcmViaW5kaW5nIGRy
aXZlciwgdGhlIGNvdW50IHdpbGwKYmUgYWNjdW11bGF0ZWQuIEZyb20gbXRrX2Rpc3BfbXV0ZXhf
Z2V0KCksIHRoZXJlIGNhbiBvbmx5IGJlIGF0IG1vc3QKMTAgbXV0ZXggaWQuIENsZWFyIHRoaXMg
bnVtYmVyIHNvIGl0IHN0YXJ0cyBmcm9tIDAgaW4gZXZlcnkgcmViaW5kLgoKRml4ZXM6IDExOWY1
MTczNjI4YSAoImRybS9tZWRpYXRlazogQWRkIERSTSBEcml2ZXIgZm9yIE1lZGlhdGVrIFNvQyBN
VDgxNzMuIikKU2lnbmVkLW9mZi1ieTogSHNpbi1ZaSBXYW5nIDxoc2lueWlAY2hyb21pdW0ub3Jn
PgotLS0KIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rydi5jIHwgMSArCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
bWVkaWF0ZWsvbXRrX2RybV9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJt
X2Rydi5jCmluZGV4IDg3MThkMTIzY2NhYS4uYmJmZTNhNDY0YWVhIDEwMDY0NAotLS0gYS9kcml2
ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kcnYuYworKysgYi9kcml2ZXJzL2dwdS9kcm0v
bWVkaWF0ZWsvbXRrX2RybV9kcnYuYwpAQCAtNDAwLDYgKzQwMCw3IEBAIHN0YXRpYyB2b2lkIG10
a19kcm1fdW5iaW5kKHN0cnVjdCBkZXZpY2UgKmRldikKIAlkcm1fZGV2X3VucmVnaXN0ZXIocHJp
dmF0ZS0+ZHJtKTsKIAltdGtfZHJtX2ttc19kZWluaXQocHJpdmF0ZS0+ZHJtKTsKIAlkcm1fZGV2
X3B1dChwcml2YXRlLT5kcm0pOworCXByaXZhdGUtPm51bV9waXBlcyA9IDA7CiAJcHJpdmF0ZS0+
ZHJtID0gTlVMTDsKIH0KIAotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
