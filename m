Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E1E347D3D0
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2019 05:44:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 425406E33C;
	Thu,  1 Aug 2019 03:44:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3662E6E336
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Aug 2019 03:44:52 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id i2so31517617plt.1
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2019 20:44:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=yWATOQC7xCYUWMxHGpKVvr0YlzHaV7cfBrgB+3CpQl8=;
 b=IssLSJ8jcxqtd16d31jRq2WOKS64pg7df8xoS3EERMx2eQHRJ2ekJAzf3Y7Btih7HU
 W6CFhbvf3yvzomKy8Khv9iYi8A70YSUA4YA8S/OcJMBGsFRYdjUVA9k3EJyxlrUlOBfQ
 IytZGMXxK8Yyu4yJOYqgWUhRqkrt3W4EQo6rFHBCAYTpl/gLlYykiiUA4dN+pVbWqJ8f
 aPszVnWwOM6BvOZ4kRxdWXTpy400xUedPah4YGCdWuMRr6wsPslPla0nRVMOQiXVBmr1
 iTX4jbqXC1uXBQMhW2FZATNrtcGrpnFHZt2bJJ/p0HJnam+y1CwF8D6Nxruq3Rg2ozo2
 53vw==
X-Gm-Message-State: APjAAAXnLA5FY71CvJexMPUt4vRkTZQMQ8btcZ1LN/+Ru3qe+53BUB2w
 Mlbz/sO8nN6C2uBqW4vlkF3q5w==
X-Google-Smtp-Source: APXvYqwF2nMm4zaQPkYlX6Euo2pU4rs5CLSygCe26xqwgABVkyiJCsXcaYw81yolcPkgWCA1ofO1Ng==
X-Received: by 2002:a17:902:2ac7:: with SMTP id
 j65mr124662426plb.242.1564631091680; 
 Wed, 31 Jul 2019 20:44:51 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
 by smtp.gmail.com with ESMTPSA id
 h70sm64775674pgc.36.2019.07.31.20.44.50
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 31 Jul 2019 20:44:51 -0700 (PDT)
From: John Stultz <john.stultz@linaro.org>
To: lkml <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 04/26] drm: kirin: Remove unreachable return
Date: Thu,  1 Aug 2019 03:44:17 +0000
Message-Id: <20190801034439.98227-5-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190801034439.98227-1-john.stultz@linaro.org>
References: <20190801034439.98227-1-john.stultz@linaro.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=yWATOQC7xCYUWMxHGpKVvr0YlzHaV7cfBrgB+3CpQl8=;
 b=pNhWt5gGCL4xlPtKcrtkLPZHmIYd/CprHM6Yk/qDos1k88CtQzSJeE6n/r/ZlPqlwq
 GWc45JHjcBnFzAdJUBmKxpql1YLn+WFRWCNBljCzD8BvF16FxsNiaQ7SdR4/oxnfuCx3
 2Y410a5S1pJB2deLPi+kGejLgYki003f2LoFpm85daRtkxfo5JY4obS2Mu6Zex3TcOt/
 9PfWkoUg1NzPt7T4jcXj1fkKQnRJ3BogsyRFF0uBWfia4bIeOBoKSaDNAvqArXxujplQ
 reRNqKcQEVWGCNkK0FB2x1Nxx+QXk3QZRCI1GyhHqhqn4ZNaqswy3drHaHvxXfaJ8WKs
 CwmA==
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
 Rongrong Zou <zourongrong@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlICdyZXR1cm4gMCcgaW4ga2lyaW5fZHJtX3BsYXRmb3JtX3Byb2JlKCkgaXMgdW5yZWFjaGFi
bGUKY29kZSwgc28gcmVtb3ZlIGl0LgoKQ2M6IFJvbmdyb25nIFpvdSA8em91cm9uZ3JvbmdAZ21h
aWwuY29tPgpDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgpDYzogRGFuaWVsIFZl
dHRlciA8ZGFuaWVsQGZmd2xsLmNoPgpDYzogZHJpLWRldmVsIDxkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnPgpDYzogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPgpSZXZpZXdl
ZC1ieTogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPgpTdWdnZXN0ZWQgYnk6IFh1IFlp
UGluZyA8eHV5aXBpbmdAaGlzaWxpY29uLmNvbT4KU2lnbmVkLW9mZi1ieTogSm9obiBTdHVsdHog
PGpvaG4uc3R1bHR6QGxpbmFyby5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2hpc2lsaWNvbi9r
aXJpbi9raXJpbl9kcm1fZHJ2LmMgfCAyIC0tCiAxIGZpbGUgY2hhbmdlZCwgMiBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaGlzaWxpY29uL2tpcmluL2tpcmluX2Ry
bV9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9oaXNpbGljb24va2lyaW4va2lyaW5fZHJtX2Rydi5j
CmluZGV4IGZiYWI3M2M1ODUxZC4uYmZlMDUwNWFjNGEwIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vaGlzaWxpY29uL2tpcmluL2tpcmluX2RybV9kcnYuYworKysgYi9kcml2ZXJzL2dwdS9k
cm0vaGlzaWxpY29uL2tpcmluL2tpcmluX2RybV9kcnYuYwpAQCAtMjEwLDggKzIxMCw2IEBAIHN0
YXRpYyBpbnQga2lyaW5fZHJtX3BsYXRmb3JtX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2Ug
KnBkZXYpCiAJb2Zfbm9kZV9wdXQocmVtb3RlKTsKIAogCXJldHVybiBjb21wb25lbnRfbWFzdGVy
X2FkZF93aXRoX21hdGNoKGRldiwgJmtpcmluX2RybV9vcHMsIG1hdGNoKTsKLQotCXJldHVybiAw
OwogfQogCiBzdGF0aWMgaW50IGtpcmluX2RybV9wbGF0Zm9ybV9yZW1vdmUoc3RydWN0IHBsYXRm
b3JtX2RldmljZSAqcGRldikKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
