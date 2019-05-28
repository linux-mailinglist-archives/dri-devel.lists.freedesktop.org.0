Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6295A2C226
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2019 11:04:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E76DA89E4C;
	Tue, 28 May 2019 09:03:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 022AC89D7F
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2019 09:03:22 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id g57so15790688edc.12
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2019 02:03:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Wpi1xWPy33lj9mKcPzFNSCGKIPsIrM24U07obZg4Bbk=;
 b=rgUEEDXnlCeCM3lkbF+ABFFrkKB9GW72RPxSzKbI4o26gLIZZ97z5dUvz7X1zDk7Qs
 LG6zanIBy1RI5jbW7PkVS8DEQrooFzm5OWRtcqq/Tqsb7E6i3A7vNKHT/mmAMBsqiRnq
 eSJJzlAkJgV2gMSRsoRZ9U09V/DyDPFCic8oufxgGi5JaGN3N0zs2fm5g31r35WW72Vs
 k7NdFztWt/P6/5SgbDWASTfHdoKv+3EL4mC0GpxABTG6FgOp0+RIfeF0mXlsgMCegsTa
 +M1jas4+QXEZfVLdtPuQrGmDWmL7qq++47eAuHYzpNFEhhpqJk9JkVmBcqfCvupQn4rC
 9M3w==
X-Gm-Message-State: APjAAAWExGtprnVwzUY4cNZB64eoUb2SqbMB9GsYLyB0NsK1yEfXsb7i
 jYvg//6sWmVrwCIoMLsslXgCnQ==
X-Google-Smtp-Source: APXvYqyMZ+XP/DYBnT+b0/bEtV1bg4DZ2v7pGi2tkNPgOMj6ozhRdzLU/jwSi0kUA3Q+ESL/hNZuXg==
X-Received: by 2002:a50:ad98:: with SMTP id
 a24mr127149884edd.235.1559034200289; 
 Tue, 28 May 2019 02:03:20 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id x49sm4072656edm.25.2019.05.28.02.03.17
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 28 May 2019 02:03:17 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH 06/33] fbdev/cyber2000: Remove struct display
Date: Tue, 28 May 2019 11:02:37 +0200
Message-Id: <20190528090304.9388-7-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190528090304.9388-1-daniel.vetter@ffwll.ch>
References: <20190528090304.9388-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Wpi1xWPy33lj9mKcPzFNSCGKIPsIrM24U07obZg4Bbk=;
 b=HRwgYNCSeirp12RNt1fyc5OhQoszF2Uo7tDWacf52/s+HTFiZCUvyKuqcMcCFLqTo7
 osyTlqilBk3yRLl/Vm39fichaec5uHYWxg/SR+yE+xqDXUsKId+uFHmCikQYi4P9iErW
 GcKPar6d/CdwBiFSNkAYtg+09d1NA/M8qXEg4=
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 linux-fbdev@vger.kernel.org, DRI Development <dri-devel@lists.freedesktop.org>,
 Russell King <linux@armlinux.org.uk>, Daniel Vetter <daniel.vetter@intel.com>,
 Sam Ravnborg <sam@ravnborg.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RW50aXJlbHkgdW51c2VkLgoKU2lnbmVkLW9mZi1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZl
dHRlckBpbnRlbC5jb20+ClJldmlld2VkLWJ5OiBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5v
cmc+ClJldmlld2VkLWJ5OiBNYWFydGVuIExhbmtob3JzdCA8bWFhcnRlbi5sYW5raG9yc3RAbGlu
dXguaW50ZWwuY29tPgpDYzogUnVzc2VsbCBLaW5nIDxsaW51eEBhcm1saW51eC5vcmcudWs+CkNj
OiBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcKLS0tCiBkcml2ZXJzL3ZpZGVv
L2ZiZGV2L2N5YmVyMjAwMGZiLmMgfCAxIC0KIDEgZmlsZSBjaGFuZ2VkLCAxIGRlbGV0aW9uKC0p
CgpkaWZmIC0tZ2l0IGEvZHJpdmVycy92aWRlby9mYmRldi9jeWJlcjIwMDBmYi5jIGIvZHJpdmVy
cy92aWRlby9mYmRldi9jeWJlcjIwMDBmYi5jCmluZGV4IDlhNTc1MWNiNGUxNi4uNDUyZWYwN2Iz
YTA2IDEwMDY0NAotLS0gYS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2N5YmVyMjAwMGZiLmMKKysrIGIv
ZHJpdmVycy92aWRlby9mYmRldi9jeWJlcjIwMDBmYi5jCkBAIC02MSw3ICs2MSw2IEBACiBzdHJ1
Y3QgY2ZiX2luZm8gewogCXN0cnVjdCBmYl9pbmZvCQlmYjsKIAlzdHJ1Y3QgZGlzcGxheV9zd2l0
Y2gJKmRpc3BzdzsKLQlzdHJ1Y3QgZGlzcGxheQkJKmRpc3BsYXk7CiAJdW5zaWduZWQgY2hhcgkJ
X19pb21lbSAqcmVnaW9uOwogCXVuc2lnbmVkIGNoYXIJCV9faW9tZW0gKnJlZ3M7CiAJdV9pbnQJ
CQlpZDsKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
