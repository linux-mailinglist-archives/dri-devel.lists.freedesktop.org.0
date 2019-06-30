Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 838B25B183
	for <lists+dri-devel@lfdr.de>; Sun, 30 Jun 2019 22:36:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EE9189DD3;
	Sun, 30 Jun 2019 20:36:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CACDF89DBC;
 Sun, 30 Jun 2019 20:36:40 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id s15so12474817qtk.9;
 Sun, 30 Jun 2019 13:36:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nR/YCvWjef2okuUJBoulBLc7CJvLwyzicV4xinW8aAU=;
 b=dngwz3I1OLDuC/fngoLvFSE8WKG6E4CSkd/chF5QOE52EsW8EO7w98nXJUvZIXN8CN
 H1Yk8CUbc+AYmi2Iwf4m69X3yQaBBn1+St2f8YlWlCgMCITEFk+gQJi+Qhg5Loh6vAo4
 Dd4/jg14+ZcjU82Q5ZJPaOyJMxoRzJcEY5gRagKteUawl4z5DMj81ww7DYkyeo8Dyarv
 ROelgKxiUNk5+cYCsO9e2LRYhrBCKpGPKiV7L1uaTHfFB916sxw7m+FxJvSBE3hnpmaT
 Rd6ECmTbu4V5if2sIF8loFCLV5j6vhg5oSICjdd+OTi8zymI3mhI8mNW+eVTF3Ar70xm
 b6Sw==
X-Gm-Message-State: APjAAAWm5T0WYAY9H3oUji159o2RXn08R45BMLuJtP6wrYQjOdSWRCz4
 Y1uEBIG+scleS/kTLBaoSGRCmVqZQnZ0dA==
X-Google-Smtp-Source: APXvYqwJWB4WKYHWiOhXkTyDDWP8+VjolCHUld/jlsHEBPSEA7SLRDj+rfthVKZlVShn0LY+FxfB8A==
X-Received: by 2002:ac8:2439:: with SMTP id c54mr17304252qtc.160.1561926999718; 
 Sun, 30 Jun 2019 13:36:39 -0700 (PDT)
Received: from localhost ([2601:184:4780:7861:5010:5849:d76d:b714])
 by smtp.gmail.com with ESMTPSA id k40sm4616907qta.50.2019.06.30.13.36.39
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 30 Jun 2019 13:36:39 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH 1/4] dt-bindings: chosen: document panel-id binding
Date: Sun, 30 Jun 2019 13:36:05 -0700
Message-Id: <20190630203614.5290-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190630203614.5290-1-robdclark@gmail.com>
References: <20190630203614.5290-1-robdclark@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nR/YCvWjef2okuUJBoulBLc7CJvLwyzicV4xinW8aAU=;
 b=o3VkptGTVq61lvXebAtF1Vs8W4dTkHIWwPtXHRYASTjCMmewaFs9plkDD2/J4+6eUT
 99w13xOT8AtKeZWBDcDHNrY2Cnlsc7Bi2NyImXZzEz8YAW4abxef7RuwUstD898tYxjB
 2oLC2WfceHZM0cQeMRf3eZfuWS6/TJWXh2hmN0qzhZTWNUd7T0kNUlv0rTZkACVZx7KM
 OMiSRI3Y/YF3biXYIvlyIBZ7dL5eZzxqt+04Kz4fT6y0n1vByrwjsAw7vIXqkXH+xEe+
 rJebE03H9+t5CleK1iADDMFw3OzfpUWS9V9DoONGAm/m32TRWJiK75aKmM243ptyoBHH
 sg1w==
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
Cc: Rob Clark <robdclark@chromium.org>, aarch64-laptops@lists.linaro.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogUm9iIENsYXJrIDxyb2JkY2xhcmtAY2hyb21pdW0ub3JnPgoKVGhlIHBhbmVsLWlkIHBy
b3BlcnR5IGluIGNob3NlbiBjYW4gYmUgdXNlZCB0byBjb21tdW5pY2F0ZSB3aGljaCBwYW5lbCwK
b2YgbXVsdGlwbGUgcG9zc2liaWxpdGllcywgaXMgaW5zdGFsbGVkLgoKU2lnbmVkLW9mZi1ieTog
Um9iIENsYXJrIDxyb2JkY2xhcmtAY2hyb21pdW0ub3JnPgotLS0KIERvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9jaG9zZW4udHh0IHwgNjkgKysrKysrKysrKysrKysrKysrKysKIDEg
ZmlsZSBjaGFuZ2VkLCA2OSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Nob3Nlbi50eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvY2hvc2VuLnR4dAppbmRleCA0NWU3OTE3MmE2NDYuLmQ1MDJlNjQ4OWI4YiAx
MDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Nob3Nlbi50eHQK
KysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Nob3Nlbi50eHQKQEAgLTY4
LDYgKzY4LDc1IEBAIG9uIFBvd2VyUEMgInN0ZG91dCIgaWYgInN0ZG91dC1wYXRoIiBpcyBub3Qg
Zm91bmQuICBIb3dldmVyLCB0aGUKICJsaW51eCxzdGRvdXQtcGF0aCIgYW5kICJzdGRvdXQiIHBy
b3BlcnRpZXMgYXJlIGRlcHJlY2F0ZWQuIE5ldyBwbGF0Zm9ybXMKIHNob3VsZCBvbmx5IHVzZSB0
aGUgInN0ZG91dC1wYXRoIiBwcm9wZXJ0eS4KIAorcGFuZWwtaWQKKy0tLS0tLS0tCisKK0ZvciBk
ZXZpY2VzIHRoYXQgaGF2ZSBtdWx0aXBsZSBwb3NzaWJsZSBkaXNwbGF5IHBhbmVscyAobXVsdGkt
c291cmNpbmcgdGhlCitkaXNwbGF5IHBhbmVscyBpcyBjb21tb24gb24gbGFwdG9wcywgcGhvbmVz
LCB0YWJsZXRzKSwgdGhpcyBhbGxvd3MgdGhlCitib290bG9hZGVyIHRvIGNvbW11bmljYXRlIHdo
aWNoIHBhbmVsIGlzIGluc3RhbGxlZCwgZS5nLgorCisvIHsKKwljaG9zZW4geworCQlwYW5lbC1p
ZCA9IDwweGM0PjsKKwl9OworCisJaXZvX3BhbmVsIHsKKwkJY29tcGF0aWJsZSA9ICJpdm8sbTEz
M253ZjQtcjAiOworCQlwb3dlci1zdXBwbHkgPSA8JnZsY21fM3YzPjsKKwkJbm8taHBkOworCisJ
CXBvcnRzIHsKKwkJCXBvcnQgeworCQkJCWl2b19wYW5lbF9pbl9lZHA6IGVuZHBvaW50IHsKKwkJ
CQkJcmVtb3RlLWVuZHBvaW50ID0gPCZzbjY1ZHNpODZfb3V0X2l2bz47CisJCQkJfTsKKwkJCX07
CisJCX07CisJfTsKKworCWJvZV9wYW5lbCB7CisJCWNvbXBhdGlibGUgPSAiYm9lLG52MTMzZmht
LW42MSI7CisJCXBvd2VyLXN1cHBseSA9IDwmdmxjbV8zdjM+OworCQluby1ocGQ7CisKKwkJcG9y
dHMgeworCQkJcG9ydCB7CisJCQkJYm9lX3BhbmVsX2luX2VkcDogZW5kcG9pbnQgeworCQkJCQly
ZW1vdGUtZW5kcG9pbnQgPSA8JnNuNjVkc2k4Nl9vdXRfYm9lPjsKKwkJCQl9OworCQkJfTsKKwkJ
fTsKKwl9OworCisJZGlzcGxheV9vcl9icmlkZ2VfZGV2aWNlIHsKKworCQlwb3J0cyB7CisJCQkj
YWRkcmVzcy1jZWxscyA9IDwxPjsKKwkJCSNzaXplLWNlbGxzID0gPDA+OworCisJCQkuLi4KKwor
CQkJcG9ydEAwIHsKKwkJCQkjYWRkcmVzcy1jZWxscyA9IDwxPjsKKwkJCQkjc2l6ZS1jZWxscyA9
IDwwPjsKKwkJCQlyZWcgPSA8MD47CisKKwkJCQllbmRwb2ludEBjNCB7CisJCQkJCXJlZyA9IDww
eGM0PjsKKwkJCQkJcmVtb3RlLWVuZHBvaW50ID0gPCZib2VfcGFuZWxfaW5fZWRwPjsKKwkJCQl9
OworCisJCQkJZW5kcG9pbnRAYzUgeworCQkJCQlyZWcgPSA8MHhjNT47CisJCQkJCXJlbW90ZS1l
bmRwb2ludCA9IDwmaXZvX3BhbmVsX2luX2VkcD47CisJCQkJfTsKKwkJCX07CisJCX07CisJfQor
fTsKKworTm90ZSB0aGF0IHBhbmVsLWlkIHZhbHVlcyBjYW4gYmUgc3BhcnNlIChpZS4gbm90IGp1
c3QgaW50ZWdlcnMgMC4ubikuCisKIGxpbnV4LGJvb3RlZC1mcm9tLWtleGVjCiAtLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLQogCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
