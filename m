Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 431758E04A
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2019 00:05:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47FE86E864;
	Wed, 14 Aug 2019 22:05:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F289B6E864
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2019 22:05:13 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id g2so200092pfq.0
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2019 15:05:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zGCahEylBwx9+hrUl6JBv64qJITZ7AIfmMEaH7B2Nfg=;
 b=JoUtw3RNt7bVNTBeE9wbMe6UpvZ/n/mqSfA5MkJno9SYypZbEgI9tn7WfWHZCAChjS
 OO1t8ptelKd6M1sLUWJsjescsMibBeHAUOQwgfc9uN9/kPdzxafSumVbCMmJa+17P3Cz
 8Q3wD409hXsljTckrcqmwfasvcwIZYvCyFtd2aauTxuPQMnIgQXhhI2Lv/IZq2OAWI1E
 bVKq1B1oicGqBIQ9vhqPAXKDSwS2o35pSZ0A72jaHZr/TUPwpnNRP89rbcmS9m0QHTBq
 9fPhp63Ca0vLlbJyZkwAGWXrPxjEn4krL+wwPUn5J1bZfmHylOzaTyQC5Jj16Af9J039
 bwZQ==
X-Gm-Message-State: APjAAAWJfHM0FWg3yxvniJvSnxem3+w+UX2RUjBAbdZam1eBxv3F/t+L
 aspDXG+bmK7dQH/XxQu/vRsSHsWRkpFQfA==
X-Google-Smtp-Source: APXvYqwdj2exVMetPPaW54oofiik0neX5PkaF4gcffTO1xCR5P3KzJE/Uy1GZgX/vn90YM4nR9bKlw==
X-Received: by 2002:a62:e901:: with SMTP id j1mr2192946pfh.189.1565820313296; 
 Wed, 14 Aug 2019 15:05:13 -0700 (PDT)
Received: from localhost ([100.118.89.196])
 by smtp.gmail.com with ESMTPSA id g19sm968879pfk.0.2019.08.14.15.05.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Aug 2019 15:05:12 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/6] arm64: export arch_sync_dma_for_*()
Date: Wed, 14 Aug 2019 14:59:56 -0700
Message-Id: <20190814220011.26934-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190814220011.26934-1-robdclark@gmail.com>
References: <20190814220011.26934-1-robdclark@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zGCahEylBwx9+hrUl6JBv64qJITZ7AIfmMEaH7B2Nfg=;
 b=KNxFr9QT2oHk0ee5GI2IjIkLTldwP57yZGwcnjUEsIx3OB6B0cmtOER71JKAynaxAl
 tI28WVuAQNFlKsPnyqKGlZnvq7stwRv5qOx8V+A8CfeEzpCSJrEDgGxpC76R/mjugfZV
 cfj3AMX5FF04HK8PouDp/LkA+AYBdKeqGW7mI9yywFHfFa+D9mW3dX3slJb9DT3Vb2nB
 z1VC/a8ZneW4oXJPYnEqJeDKPyPYqbkfh/2OJgcLihAGqC7Bk8dISekepsMevjddKfwG
 JwbAp2kne42JJ1D+FPohAKaeYVSHgGwpEG5iS4sn8vtrJGrv6DbWWHa+MfhexA3EwLHf
 RGjw==
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
Cc: Rob Clark <robdclark@chromium.org>,
 Masayoshi Mizuma <m.mizuma@jp.fujitsu.com>, Joerg Roedel <jroedel@suse.de>,
 Catalin Marinas <catalin.marinas@arm.com>, Robin Murphy <robin.murphy@arm.com>,
 linux-kernel@vger.kernel.org, Jesper Dangaard Brouer <brouer@redhat.com>,
 Will Deacon <will@kernel.org>, Christoph Hellwig <hch@lst.de>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogUm9iIENsYXJrIDxyb2JkY2xhcmtAY2hyb21pdW0ub3JnPgoKU2lnbmVkLW9mZi1ieTog
Um9iIENsYXJrIDxyb2JkY2xhcmtAY2hyb21pdW0ub3JnPgotLS0KIGFyY2gvYXJtNjQvbW0vZG1h
LW1hcHBpbmcuYyB8IDIgKysKIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKCmRpZmYg
LS1naXQgYS9hcmNoL2FybTY0L21tL2RtYS1tYXBwaW5nLmMgYi9hcmNoL2FybTY0L21tL2RtYS1t
YXBwaW5nLmMKaW5kZXggMWQzZjBiNWE5OTQwLi5lYTVhZTExZDA3ZjcgMTAwNjQ0Ci0tLSBhL2Fy
Y2gvYXJtNjQvbW0vZG1hLW1hcHBpbmcuYworKysgYi9hcmNoL2FybTY0L21tL2RtYS1tYXBwaW5n
LmMKQEAgLTI0LDEyICsyNCwxNCBAQCB2b2lkIGFyY2hfc3luY19kbWFfZm9yX2RldmljZShzdHJ1
Y3QgZGV2aWNlICpkZXYsIHBoeXNfYWRkcl90IHBhZGRyLAogewogCV9fZG1hX21hcF9hcmVhKHBo
eXNfdG9fdmlydChwYWRkciksIHNpemUsIGRpcik7CiB9CitFWFBPUlRfU1lNQk9MX0dQTChhcmNo
X3N5bmNfZG1hX2Zvcl9kZXZpY2UpOwogCiB2b2lkIGFyY2hfc3luY19kbWFfZm9yX2NwdShzdHJ1
Y3QgZGV2aWNlICpkZXYsIHBoeXNfYWRkcl90IHBhZGRyLAogCQlzaXplX3Qgc2l6ZSwgZW51bSBk
bWFfZGF0YV9kaXJlY3Rpb24gZGlyKQogewogCV9fZG1hX3VubWFwX2FyZWEocGh5c190b192aXJ0
KHBhZGRyKSwgc2l6ZSwgZGlyKTsKIH0KK0VYUE9SVF9TWU1CT0xfR1BMKGFyY2hfc3luY19kbWFf
Zm9yX2NwdSk7CiAKIHZvaWQgYXJjaF9kbWFfcHJlcF9jb2hlcmVudChzdHJ1Y3QgcGFnZSAqcGFn
ZSwgc2l6ZV90IHNpemUpCiB7Ci0tIAoyLjIxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
