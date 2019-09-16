Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D26BDB3CAB
	for <lists+dri-devel@lfdr.de>; Mon, 16 Sep 2019 16:36:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AEBB6E9A6;
	Mon, 16 Sep 2019 14:36:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80FEA6E9A6;
 Mon, 16 Sep 2019 14:36:14 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id v8so300264eds.2;
 Mon, 16 Sep 2019 07:36:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=X/XOpyZsqG/KWvoSisq6x7AhYat6zso8yO/F5thGj3A=;
 b=JunkIdTL0ntW+PvrpuhjSSirdF+t64rItH1TyGfEGw3asr63eW2r91Y9JIkRNE/S1w
 xlG+g7qxnmNVKldIRPJdjPvCX7puwBV2nq0uED2ZCpxEPW8bP4hBmtR2QMN2efaUUD5+
 q1fEP2MEdKlUow6vRG+5Yc7Uc4BRTZqZCiIxBW1rub0G45G0kB6MffwnDMpZq7XJqdEC
 RTmrLJ3NDhmZZEijXhQ28pnv1bLWdzrTKMqJHYSWgpSSPxQWPhWtB66LP1k0W7eTE6of
 9GMysTZW41VZWXdT+oki/HbfZaCo12175UjGQqin4yA3LG9WVYW4LoIQS2pyIRuNYquV
 KUNQ==
X-Gm-Message-State: APjAAAUr/5q72VkWhNKRqTqL0mdUzfM20nnZUGfYGSnTK9LxI+GY9Np2
 eL9B/M0jbgIlXPlC12xNmXU=
X-Google-Smtp-Source: APXvYqxUuo0DnT0WDNf/Y67WlQLYaDE7fGN/I7qg0UzjY6EURIgTiBIlvXaGeUsiTKmWGfphrjdZNg==
X-Received: by 2002:a50:a666:: with SMTP id d93mr17725991edc.217.1568644572638; 
 Mon, 16 Sep 2019 07:36:12 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
 by smtp.gmail.com with ESMTPSA id b36sm7182475edc.53.2019.09.16.07.36.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Sep 2019 07:36:11 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Ben Skeggs <bskeggs@redhat.com>
Subject: [PATCH 2/2] drm/nouveau: tegra: Do not try to disable PCI device
Date: Mon, 16 Sep 2019 16:36:06 +0200
Message-Id: <20190916143606.9272-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190916143606.9272-1-thierry.reding@gmail.com>
References: <20190916143606.9272-1-thierry.reding@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=X/XOpyZsqG/KWvoSisq6x7AhYat6zso8yO/F5thGj3A=;
 b=rbT2mCFK8EJwxs5pXNfY/33/H/qhb9lfiTy4Svxc2GvTs/TLhgo/E2lDAczMRun9Uy
 TdfXV7l4kuamUv8oKuvr80B0d+ulE28g8qIxMrMVPr81+u8COWKcT4f1BshJ21e7Lr3Z
 9tafmUSRSzEuN7NZlUVU4RD8vSjX77hdr8X5ORqtmq2iX6vpW7OTqRnPXW6U+QjtYSxP
 +5dy+hExOaF8NpKnbNg9wfXvac3/wMtusm1VHIocAgCBPEDeTIGEE8HglBS7tu9CkG+Y
 GDJq/CjmhLNiKxWrQmXqtdPijRBhp+/CzOYO18PYM2KVpY+/o3wqHPYNVcosCFosNWtv
 eF2g==
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
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Karol Herbst <kherbst@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KCldoZW4gTm91dmVhdSBp
cyBpbnN0YW50aWF0ZWQgb24gdG9wIG9mIGEgcGxhdGZvcm0gZGV2aWNlLCB0aGUgZGV2LT5wZGV2
CmZpZWxkIHdpbGwgYmUgTlVMTCBhbmQgY2FsbGluZyBwY2lfZGlzYWJsZV9kZXZpY2UoKSB3aWxs
IGNyYXNoLiBNb3ZlIHRoZQpQQ0kgZGlzYWJsaW5nIGNvZGUgdG8gdGhlIFBDSSBzcGVjaWZpYyBk
cml2ZXIgcmVtb3ZhbCBjb2RlLgoKU2lnbmVkLW9mZi1ieTogVGhpZXJyeSBSZWRpbmcgPHRyZWRp
bmdAbnZpZGlhLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2RybS5j
IHwgMyArLS0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMiBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2RybS5jIGIvZHJp
dmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9kcm0uYwppbmRleCAyY2Q4Mzg0OTYwMGYuLmI2
NWFlODE3ZWFiZiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9k
cm0uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2RybS5jCkBAIC03MTUs
NyArNzE1LDYgQEAgc3RhdGljIGludCBub3V2ZWF1X2RybV9wcm9iZShzdHJ1Y3QgcGNpX2RldiAq
cGRldiwKIHZvaWQKIG5vdXZlYXVfZHJtX2RldmljZV9yZW1vdmUoc3RydWN0IGRybV9kZXZpY2Ug
KmRldikKIHsKLQlzdHJ1Y3QgcGNpX2RldiAqcGRldiA9IGRldi0+cGRldjsKIAlzdHJ1Y3Qgbm91
dmVhdV9kcm0gKmRybSA9IG5vdXZlYXVfZHJtKGRldik7CiAJc3RydWN0IG52a21fY2xpZW50ICpj
bGllbnQ7CiAJc3RydWN0IG52a21fZGV2aWNlICpkZXZpY2U7CkBAIC03MjcsNyArNzI2LDYgQEAg
bm91dmVhdV9kcm1fZGV2aWNlX3JlbW92ZShzdHJ1Y3QgZHJtX2RldmljZSAqZGV2KQogCWRldmlj
ZSA9IG52a21fZGV2aWNlX2ZpbmQoY2xpZW50LT5kZXZpY2UpOwogCiAJbm91dmVhdV9kcm1fZGV2
aWNlX2ZpbmkoZGV2KTsKLQlwY2lfZGlzYWJsZV9kZXZpY2UocGRldik7CiAJZHJtX2Rldl9wdXQo
ZGV2KTsKIAludmttX2RldmljZV9kZWwoJmRldmljZSk7CiB9CkBAIC03MzgsNiArNzM2LDcgQEAg
bm91dmVhdV9kcm1fcmVtb3ZlKHN0cnVjdCBwY2lfZGV2ICpwZGV2KQogCXN0cnVjdCBkcm1fZGV2
aWNlICpkZXYgPSBwY2lfZ2V0X2RydmRhdGEocGRldik7CiAKIAlub3V2ZWF1X2RybV9kZXZpY2Vf
cmVtb3ZlKGRldik7CisJcGNpX2Rpc2FibGVfZGV2aWNlKHBkZXYpOwogfQogCiBzdGF0aWMgaW50
Ci0tIAoyLjIzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
