Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28E8D8DD51
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2019 20:47:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 354716E7D8;
	Wed, 14 Aug 2019 18:47:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCECC6E7D5
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2019 18:47:14 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id 196so6932693pfz.8
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2019 11:47:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=gZlqEMIie9JrTF+U3D4DkV2iblyXZl+ikNJHS29ktag=;
 b=bhaC+VwS6mgyZJe6lh3RtyKfwznTjSe/390YE3i1oxrtShoPcHITUr/NCLr2hu3atR
 WC3bMpIW6R7ha8MEphQl+kQmsRSw3LYsPbbp/bh/uR3SXp7xAmrndyhIEDUvYQRC/CE5
 IMQeZKcSLhP4+islyClkVnDdkM39dkOw1qBSQXgw3RTRGA5fQd/6O362FBXYr2AL3zVj
 pVi8R62hgGRRpqGfRyzxs1zqVuua269jVIm7drgO7laHF8FwlPjsTx4uzBPyUHVURSdh
 fjT0iftj799dBCP3dnm1Rvp9vB0gLx817rcVrL4FgOHNcbiyOhatli5MD1Rw8Q0DlBtV
 VGZg==
X-Gm-Message-State: APjAAAXRKjW9STP1QOyh/Uxn+gX3Uqep5vMhFN5LwFWkM28UPArCZs0O
 LuAMAqSdml8GRpQrKw8AmEy4iw==
X-Google-Smtp-Source: APXvYqx1pDSc+7gIkHH4h0G8/MwRFGnnNPGCkP3tXgf2O8GF8iR/6WPGPQnWYOIEl790rNNIoAnjfA==
X-Received: by 2002:aa7:96b3:: with SMTP id g19mr1385111pfk.26.1565808433394; 
 Wed, 14 Aug 2019 11:47:13 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
 by smtp.gmail.com with ESMTPSA id
 y16sm610855pfc.36.2019.08.14.11.47.12
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 14 Aug 2019 11:47:12 -0700 (PDT)
From: John Stultz <john.stultz@linaro.org>
To: lkml <linux-kernel@vger.kernel.org>
Subject: [RESEND][PATCH v3 04/26] drm: kirin: Remove unreachable return
Date: Wed, 14 Aug 2019 18:46:40 +0000
Message-Id: <20190814184702.54275-5-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190814184702.54275-1-john.stultz@linaro.org>
References: <20190814184702.54275-1-john.stultz@linaro.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=gZlqEMIie9JrTF+U3D4DkV2iblyXZl+ikNJHS29ktag=;
 b=XjbkzQzRC401HwYkgJTt5/alWGhUTRr63o71FoCDwgSKS/A9ToFGHy6O/sTVyshQBT
 XSD4Ca0pa9uCbyUka3KenXl3dh1eYFMQWyYVO5cA/ovDzDwVvf+MytD1iy11qXkqyxCX
 NaUKoffPiIbORR7QDPzRSpN9Xy2zHkCBkJp+i6VhBH6kNhFS5S08Qlz7Ox2koBMBbyNF
 4ymd2whYjQtP9nQQsQSNgifPOO7LbC/N5sVhYMaSju0XmZ2eQK8HGJXNFVLQKUF2jRZQ
 AilqvhFg60+Nhiq2bOXaeyNEHLXwChnrGXdzWurJ3tBtQfJMpRXJgX2HT7Ml2BlPrxpv
 D18g==
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
Cc: David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Xinliang Liu <z.liuxinliang@hisilicon.com>,
 Rongrong Zou <zourongrong@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlICdyZXR1cm4gMCcgaW4ga2lyaW5fZHJtX3BsYXRmb3JtX3Byb2JlKCkgaXMgdW5yZWFjaGFi
bGUKY29kZSwgc28gcmVtb3ZlIGl0LgoKQ2M6IFJvbmdyb25nIFpvdSA8em91cm9uZ3JvbmdAZ21h
aWwuY29tPgpDYzogWGlubGlhbmcgTGl1IDx6LmxpdXhpbmxpYW5nQGhpc2lsaWNvbi5jb20+CkNj
OiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+CkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5p
ZWxAZmZ3bGwuY2g+CkNjOiBkcmktZGV2ZWwgPGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmc+CkNjOiBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+ClJldmlld2VkLWJ5OiBTYW0g
UmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+ClN1Z2dlc3RlZCBieTogWHUgWWlQaW5nIDx4dXlp
cGluZ0BoaXNpbGljb24uY29tPgpTaWduZWQtb2ZmLWJ5OiBKb2huIFN0dWx0eiA8am9obi5zdHVs
dHpAbGluYXJvLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vaGlzaWxpY29uL2tpcmluL2tpcmlu
X2RybV9kcnYuYyB8IDIgLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9oaXNpbGljb24va2lyaW4va2lyaW5fZHJtX2Rydi5jIGIv
ZHJpdmVycy9ncHUvZHJtL2hpc2lsaWNvbi9raXJpbi9raXJpbl9kcm1fZHJ2LmMKaW5kZXggZmJh
YjczYzU4NTFkLi5iZmUwNTA1YWM0YTAgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9oaXNp
bGljb24va2lyaW4va2lyaW5fZHJtX2Rydi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9oaXNpbGlj
b24va2lyaW4va2lyaW5fZHJtX2Rydi5jCkBAIC0yMTAsOCArMjEwLDYgQEAgc3RhdGljIGludCBr
aXJpbl9kcm1fcGxhdGZvcm1fcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAlv
Zl9ub2RlX3B1dChyZW1vdGUpOwogCiAJcmV0dXJuIGNvbXBvbmVudF9tYXN0ZXJfYWRkX3dpdGhf
bWF0Y2goZGV2LCAma2lyaW5fZHJtX29wcywgbWF0Y2gpOwotCi0JcmV0dXJuIDA7CiB9CiAKIHN0
YXRpYyBpbnQga2lyaW5fZHJtX3BsYXRmb3JtX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNl
ICpwZGV2KQotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
