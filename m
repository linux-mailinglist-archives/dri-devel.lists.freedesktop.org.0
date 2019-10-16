Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 635CFD9104
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2019 14:34:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60CBB6E95C;
	Wed, 16 Oct 2019 12:34:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DAFF6E95C
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Oct 2019 12:34:09 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id a22so23845680ljd.0
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Oct 2019 05:34:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9EysGKwAMgXXygyzOXkQ7pShV2hQHXICJ75+QvsLTBY=;
 b=bLB3cdaAGqlbkem68UUJHtg752pkKrcI9qgbMD7mQx953TK37alKURFVXkvAgQ4UPv
 MOvcF/DaP3Y8M9ZRR2xAd36s6OE0H0DtEzgkOxkZGEcz/s1NPx/ofhJB4NSt0B5gaPvb
 swnfms2r89DNhTK+itNmNeUstAG/PWiZurvj5tl4IT4IBtg8KD3elVlz+FluO3PXyglC
 7gj/w3T7t6SJOh6odcMXrlDq2yUc1yfWdysOFOPzNTigb7B2JJIJgLJivr/nhSCZ5mH+
 WLaRir6/8io0wsW9tzwL1LAhYOx1gbTFVyqsd9p9DCaIaXKWCTnJnP8S5dwi2DLOXnan
 fmoA==
X-Gm-Message-State: APjAAAXPxe1a0tqUSLTHYLbMd2hW4Z8oPhiTbu0mNSkKj/grBoEd2BlB
 EY8D83JxoWhz0LPfOWdvUSTPpUh1
X-Google-Smtp-Source: APXvYqwHt7sCh5g0ZTnwvcbI6A3r0Iyc2Qv0wChRhGIC4CIAL/V7habUytiOLi16NvB9mQL5JEMXcg==
X-Received: by 2002:a2e:9a4c:: with SMTP id k12mr26347766ljj.213.1571229247533; 
 Wed, 16 Oct 2019 05:34:07 -0700 (PDT)
Received: from workstation.lan (81-229-85-231-no13.tbcn.telia.com.
 [81.229.85.231])
 by smtp.gmail.com with ESMTPSA id 207sm8605119lfn.0.2019.10.16.05.34.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Oct 2019 05:34:06 -0700 (PDT)
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/scdc: Fix typo in bit definition of SCDC_STATUS_FLAGS
Date: Wed, 16 Oct 2019 14:33:42 +0200
Message-Id: <20191016123342.19119-1-patrik.r.jakobsson@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9EysGKwAMgXXygyzOXkQ7pShV2hQHXICJ75+QvsLTBY=;
 b=HLlv0MeD2E9hs6is28aAs7TiTNwhmn/o8yknVMgs7CtznyDtUhmE4WqzWbmtdEhTEw
 S82uxowSCTfXLgrrpu3BKca7UbPBMptLGgKeISmGBpqeLrsHALwYdZ/mxwR4Q7m+lNe4
 fZyaGKze9yPewQcFzr4L4IFT/7E3DOlrlHFFmgYVHUVGiYJKsjaKZJMOCbqmmD+5nf3I
 Z8OfG77Ns56FlOdXRl4HNITcWI3ZVs2ME5Txl35hnP60CUmmkhXnzV3CwlGCocQBGQ2e
 hNsL5JYJJQGh10rCL3Rnc4KdZP4PRxUsQz/UDVi/Tjx/UtpAXBugovlc/WceAt14S0r3
 1v7g==
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
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4IHR5cG8gd2hlcmUgYml0cyBnb3QgY29tcGFyZWQgKHggPCB5KSBpbnN0ZWFkIG9mIHNoaWZ0
ZWQgKHggPDwgeSkuCgpTaWduZWQtb2ZmLWJ5OiBQYXRyaWsgSmFrb2Jzc29uIDxwYXRyaWsuci5q
YWtvYnNzb25AZ21haWwuY29tPgotLS0KIGluY2x1ZGUvZHJtL2RybV9zY2RjX2hlbHBlci5oIHwg
NiArKystLS0KIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vZHJtX3NjZGNfaGVscGVyLmggYi9pbmNsdWRlL2Ry
bS9kcm1fc2NkY19oZWxwZXIuaAppbmRleCBmOTJlYjIwOTRkNmIuLjZhNDgzNTMzYWFlNCAxMDA2
NDQKLS0tIGEvaW5jbHVkZS9kcm0vZHJtX3NjZGNfaGVscGVyLmgKKysrIGIvaW5jbHVkZS9kcm0v
ZHJtX3NjZGNfaGVscGVyLmgKQEAgLTUwLDkgKzUwLDkgQEAKICNkZWZpbmUgIFNDRENfUkVBRF9S
RVFVRVNUX0VOQUJMRSAoMSA8PCAwKQogCiAjZGVmaW5lIFNDRENfU1RBVFVTX0ZMQUdTXzAgMHg0
MAotI2RlZmluZSAgU0NEQ19DSDJfTE9DSyAoMSA8IDMpCi0jZGVmaW5lICBTQ0RDX0NIMV9MT0NL
ICgxIDwgMikKLSNkZWZpbmUgIFNDRENfQ0gwX0xPQ0sgKDEgPCAxKQorI2RlZmluZSAgU0NEQ19D
SDJfTE9DSyAoMSA8PCAzKQorI2RlZmluZSAgU0NEQ19DSDFfTE9DSyAoMSA8PCAyKQorI2RlZmlu
ZSAgU0NEQ19DSDBfTE9DSyAoMSA8PCAxKQogI2RlZmluZSAgU0NEQ19DSF9MT0NLX01BU0sgKFND
RENfQ0gyX0xPQ0sgfCBTQ0RDX0NIMV9MT0NLIHwgU0NEQ19DSDBfTE9DSykKICNkZWZpbmUgIFND
RENfQ0xPQ0tfREVURUNUICgxIDw8IDApCiAKLS0gCjIuMjMuMAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
