Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54D0495154
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2019 01:04:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07AF36E48B;
	Mon, 19 Aug 2019 23:04:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 204A26E489
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2019 23:03:57 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id w2so2084543pfi.3
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2019 16:03:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=5xXqlqGWu5A581PxcE1TU9HQN3Deqwd26JfZ6CBJo3I=;
 b=KwF9p8NaUV4KUlRU0PgbLyrPhpkoby+r6J+1juV7Ml3C2OTfqINbM7egNiBz/RO9dJ
 0Ef8P8hV7qHzYmSPnHxAAjsbGijaNtBuC6UDPYH9A80fomQFYYTbkClvtbea3T1E8oHO
 OU+/ghkVPgLG+a0dwTgYZZIQmVo826fmavRNyOlnDycm+VsEcGsAweFUeRL4s9FcoWoL
 odMjXlV1Pr4CRjjafFx94PNgTEdrQiU7oEh97G0BegDHMCKFeYhOIWqLtH6sLtq6oZ2b
 bB7v2AhhP9p4ZfFyFmpu/O+RQjz9AsPumB3Gj71CMBZrsuj0R2foT3kFmhJOctSJeGPs
 BMmQ==
X-Gm-Message-State: APjAAAVVpKiEHzzG8IwpaZJIESNLReslrrs3FaIZMwIjUuHPKmQrmJN0
 gkK8izjH+jmx/m8B1MlBvLNc2A==
X-Google-Smtp-Source: APXvYqwfhm7llbkVctWlSDwtfdAvwLhY+YVSQI6Ko11Wl1U5THXL/MpzMgH47+N+G/aXeDPuN1xZxQ==
X-Received: by 2002:a17:90a:9f46:: with SMTP id
 q6mr22468018pjv.110.1566255836335; 
 Mon, 19 Aug 2019 16:03:56 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
 by smtp.gmail.com with ESMTPSA id
 j15sm17256509pfr.146.2019.08.19.16.03.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Aug 2019 16:03:55 -0700 (PDT)
From: John Stultz <john.stultz@linaro.org>
To: lkml <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 20/25] drm: kirin: Rename plane_init and crtc_init
Date: Mon, 19 Aug 2019 23:03:16 +0000
Message-Id: <20190819230321.56480-21-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190819230321.56480-1-john.stultz@linaro.org>
References: <20190819230321.56480-1-john.stultz@linaro.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=5xXqlqGWu5A581PxcE1TU9HQN3Deqwd26JfZ6CBJo3I=;
 b=i+7JlJtdwvhF0sU+zkXbFNUp/U9CGl0fhE6aCXvRQ6LAEgcqtBgbtAwFQz/f4UShbr
 o1CilFSSiyAlklLCS4XbjMea207NHBunBUsC+CyfYie1eHyQ1s++OXJaLWv6KBpF0RtQ
 8MV7AeU1PYnGdfYWDPHg3znzttuK89H8oFUoaN7yfFQoPktS+rX9t4yajotfrLNMrBZ+
 fC6f1ALQ1sfh81EerbqgsD/GIvBQV5XpD2yaFU6CBT0OeBvhgWlcAGfVc5tf5DEDBvWW
 J1ttv4bZm9XEjn8k5xoz/VUbWv2c1udxvDVfb4s7xSgW8Wc9dRQyAX85EJzy165ScrLr
 Dg7w==
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
Cc: Xu YiPing <xuyiping@hisilicon.com>, David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Xinliang Liu <z.liuxinliang@hisilicon.com>,
 Rongrong Zou <zourongrong@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogWHUgWWlQaW5nIDx4dXlpcGluZ0BoaXNpbGljb24uY29tPgoKQXMgcGFydCBvZiByZWZh
Y3RvcmluZyB0aGUga2lyaW4gZHJpdmVyIHRvIGJldHRlciBzdXBwb3J0CmRpZmZlcmVudCBoYXJk
d2FyZSByZXZpc2lvbnMsIHRoaXMgcGF0Y2ggcmVuYW1lcwphZGVfY3J0Yy9wbGFuZV9pbml0IGtp
cmluX3BsYW5lL2NydGNfaW5pdCwgYXMgdGhleSB3aWxsIGxhdGVyIGJlCm1vdmVkIHRvIGtpcmlu
IGRybSBkcnYgYW5kIHNoYXJlZCB3aXRoIHRoZSBraXJpbjk2MCBoYXJkd2FyZQpzdXBwb3J0LgoK
Q2M6IFJvbmdyb25nIFpvdSA8em91cm9uZ3JvbmdAZ21haWwuY29tPgpDYzogWGlubGlhbmcgTGl1
IDx6LmxpdXhpbmxpYW5nQGhpc2lsaWNvbi5jb20+CkNjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRA
bGludXguaWU+CkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+CkNjOiBkcmktZGV2
ZWwgPGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmc+CkNjOiBTYW0gUmF2bmJvcmcgPHNh
bUByYXZuYm9yZy5vcmc+CkFja2VkLWJ5OiBYaW5saWFuZyBMaXUgPHoubGl1eGlubGlhbmdAaGlz
aWxpY29uLmNvbT4KUmV2aWV3ZWQtYnk6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4K
U2lnbmVkLW9mZi1ieTogWHUgWWlQaW5nIDx4dXlpcGluZ0BoaXNpbGljb24uY29tPgpbanN0dWx0
ejogcmV3b3JkZWQgY29tbWl0IG1lc3NhZ2VdClNpZ25lZC1vZmYtYnk6IEpvaG4gU3R1bHR6IDxq
b2huLnN0dWx0ekBsaW5hcm8ub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9oaXNpbGljb24va2ly
aW4va2lyaW5fZHJtX2FkZS5jIHwgMTEgKysrKysrLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA2IGlu
c2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2hpc2lsaWNvbi9raXJpbi9raXJpbl9kcm1fYWRlLmMgYi9kcml2ZXJzL2dwdS9kcm0vaGlzaWxp
Y29uL2tpcmluL2tpcmluX2RybV9hZGUuYwppbmRleCA1ZjM5MjQ5ZmQ4M2UuLmEwY2MxMjg1NTEy
YiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2hpc2lsaWNvbi9raXJpbi9raXJpbl9kcm1f
YWRlLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2hpc2lsaWNvbi9raXJpbi9raXJpbl9kcm1fYWRl
LmMKQEAgLTU3MSw3ICs1NzEsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9jcnRjX2Z1bmNz
IGFkZV9jcnRjX2Z1bmNzID0gewogCS5kaXNhYmxlX3ZibGFuawk9IGFkZV9jcnRjX2Rpc2FibGVf
dmJsYW5rLAogfTsKIAotc3RhdGljIGludCBhZGVfY3J0Y19pbml0KHN0cnVjdCBkcm1fZGV2aWNl
ICpkZXYsIHN0cnVjdCBkcm1fY3J0YyAqY3J0YywKK3N0YXRpYyBpbnQga2lyaW5fZHJtX2NydGNf
aW5pdChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCBzdHJ1Y3QgZHJtX2NydGMgKmNydGMsCiAJCQkg
c3RydWN0IGRybV9wbGFuZSAqcGxhbmUpCiB7CiAJc3RydWN0IGRldmljZV9ub2RlICpwb3J0OwpA
QCAtODkyLDggKzg5Miw5IEBAIHN0YXRpYyBzdHJ1Y3QgZHJtX3BsYW5lX2Z1bmNzIGFkZV9wbGFu
ZV9mdW5jcyA9IHsKIAkuYXRvbWljX2Rlc3Ryb3lfc3RhdGUgPSBkcm1fYXRvbWljX2hlbHBlcl9w
bGFuZV9kZXN0cm95X3N0YXRlLAogfTsKIAotc3RhdGljIGludCBhZGVfcGxhbmVfaW5pdChzdHJ1
Y3QgZHJtX2RldmljZSAqZGV2LCBzdHJ1Y3Qga2lyaW5fcGxhbmUgKmtwbGFuZSwKLQkJCSAgZW51
bSBkcm1fcGxhbmVfdHlwZSB0eXBlKQorc3RhdGljIGludCBraXJpbl9kcm1fcGxhbmVfaW5pdChz
dHJ1Y3QgZHJtX2RldmljZSAqZGV2LAorCQkJCXN0cnVjdCBraXJpbl9wbGFuZSAqa3BsYW5lLAor
CQkJCWVudW0gZHJtX3BsYW5lX3R5cGUgdHlwZSkKIHsKIAlpbnQgcmV0ID0gMDsKIApAQCAtMTAy
NCwxMyArMTAyNSwxMyBAQCBzdGF0aWMgaW50IGFkZV9kcm1faW5pdChzdHJ1Y3QgcGxhdGZvcm1f
ZGV2aWNlICpwZGV2KQogCQllbHNlCiAJCQl0eXBlID0gRFJNX1BMQU5FX1RZUEVfT1ZFUkxBWTsK
IAotCQlyZXQgPSBhZGVfcGxhbmVfaW5pdChkZXYsIGtwbGFuZSwgdHlwZSk7CisJCXJldCA9IGtp
cmluX2RybV9wbGFuZV9pbml0KGRldiwga3BsYW5lLCB0eXBlKTsKIAkJaWYgKHJldCkKIAkJCXJl
dHVybiByZXQ7CiAJfQogCiAJLyogY3J0YyBpbml0ICovCi0JcmV0ID0gYWRlX2NydGNfaW5pdChk
ZXYsICZrY3J0Yy0+YmFzZSwKKwlyZXQgPSBraXJpbl9kcm1fY3J0Y19pbml0KGRldiwgJmtjcnRj
LT5iYXNlLAogCQkJCSZhZGUtPnBsYW5lc1thZGVfZHJpdmVyX2RhdGEucHJpbV9wbGFuZV0uYmFz
ZSk7CiAJaWYgKHJldCkKIAkJcmV0dXJuIHJldDsKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
