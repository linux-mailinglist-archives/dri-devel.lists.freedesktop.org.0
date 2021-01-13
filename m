Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AACE42F4DA8
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jan 2021 15:51:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A23A6EA71;
	Wed, 13 Jan 2021 14:51:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 118996EA65
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 14:50:57 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id w5so2387931wrm.11
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 06:50:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5kBvB4NkQBZ34V2o1ex42K5vSl0rdRhcvGCTff/v+VQ=;
 b=CX3P+S9L4wGYuGSks00quxfFpZEPOVPivW0r/M9EjGfhtOTkdgaF5aDbimCQt5ON7+
 ArYJ0aOzuZ3UQN/A8k7aMly33N16m2n25UqGKwjTU66wrXGcVp4c5o146iISuqMXolOE
 WHoahwD7dLOGZnK8I/aajIntcVornbKvK8GVcqxWXPCDEJzONy6QEKkTDIVeQ8br91/B
 RLFAOAbBTU2oZTL9ZOn/+bu+v4ss+ptf8QatATZZ/Qx5NWvYLhjlLcrxcQuf9r+tNcWM
 SmKKOt26cZHRlMc5SPNWHLCaCXTz35T5oJO8GK2T9EC+lLSv5P25KG/huKlSGIoTohQG
 tmUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5kBvB4NkQBZ34V2o1ex42K5vSl0rdRhcvGCTff/v+VQ=;
 b=pFb2S50gKvKElP5r+RLJnTDiCSyVXjX9OW/AXCcgrPSX2CjfdkdjQW6Mdchh3qpfzp
 y4e6GVDx4UngSMx2zrRvWIbTC/L2X8eufVpVfFgmMQH+NddOgFc6HvTSNotP+hCg7f1/
 l29aOdHE7oytwx3xMKFgyQXxVj3uQQXy2MwLn1tOLG2apc244jTBZfjlf/OMk8qMEgVI
 Ggbtg9TecFvfcNbLdzTcE0boolZ7GRW4LFsFVsznrH81UbYfikC6tyLjtk6XdI9zFO9b
 fMAwBbqlAn6ju7Yxx75QxUK4OJCLh+u0a5yvOP+TquQlvLAZRlTn3nIndmExt1F/gdi/
 RN/g==
X-Gm-Message-State: AOAM532lKKQ9FZssiFdM3dX/4lw+XswhRUopEnvLeE4SECYzhTDIoEZd
 XBQrIfqaKMkLeX3C1+xIbbYhqg==
X-Google-Smtp-Source: ABdhPJw1ufVOnrS2JPmqkNrZy8h6u74DEt1BTq/yWKFBkHEkejsbQDOSJfyqheFLrclUErFWt5afkg==
X-Received: by 2002:adf:f18a:: with SMTP id h10mr3189875wro.244.1610549455814; 
 Wed, 13 Jan 2021 06:50:55 -0800 (PST)
Received: from dell.default ([91.110.221.229])
 by smtp.gmail.com with ESMTPSA id t188sm3273433wmf.9.2021.01.13.06.50.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jan 2021 06:50:55 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 30/31] video: fbdev: s3c-fb: Remove unused variable 'var' from
 's3c_fb_probe_win()'
Date: Wed, 13 Jan 2021 14:50:08 +0000
Message-Id: <20210113145009.1272040-31-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210113145009.1272040-1-lee.jones@linaro.org>
References: <20210113145009.1272040-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: Ben Dooks <ben@simtec.co.uk>, Jingoo Han <jingoohan1@gmail.com>,
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy92aWRlby9mYmRldi9zM2MtZmIuYzogSW4gZnVuY3Rpb24g4oCYczNjX2ZiX3Byb2JlX3dpbuKA
mToKIGRyaXZlcnMvdmlkZW8vZmJkZXYvczNjLWZiLmM6MTE3NjoyODogd2FybmluZzogdmFyaWFi
bGUg4oCYdmFy4oCZIHNldCBidXQgbm90IHVzZWQgWy1XdW51c2VkLWJ1dC1zZXQtdmFyaWFibGVd
CgpDYzogSmluZ29vIEhhbiA8amluZ29vaGFuMUBnbWFpbC5jb20+CkNjOiBCZW4gRG9va3MgPGJl
bkBzaW10ZWMuY28udWs+CkNjOiBsaW51eC1mYmRldkB2Z2VyLmtlcm5lbC5vcmcKQ2M6IGRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKU2lnbmVkLW9mZi1ieTogTGVlIEpvbmVzIDxsZWUu
am9uZXNAbGluYXJvLm9yZz4KLS0tCiBkcml2ZXJzL3ZpZGVvL2ZiZGV2L3MzYy1mYi5jIHwgMiAt
LQogMSBmaWxlIGNoYW5nZWQsIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy92
aWRlby9mYmRldi9zM2MtZmIuYyBiL2RyaXZlcnMvdmlkZW8vZmJkZXYvczNjLWZiLmMKaW5kZXgg
ZDMzZDdkZjc3YTZhNS4uOTFkYWVjYTVjYTM5MiAxMDA2NDQKLS0tIGEvZHJpdmVycy92aWRlby9m
YmRldi9zM2MtZmIuYworKysgYi9kcml2ZXJzL3ZpZGVvL2ZiZGV2L3MzYy1mYi5jCkBAIC0xMTcz
LDcgKzExNzMsNiBAQCBzdGF0aWMgaW50IHMzY19mYl9wcm9iZV93aW4oc3RydWN0IHMzY19mYiAq
c2ZiLCB1bnNpZ25lZCBpbnQgd2luX25vLAogCQkJICAgIHN0cnVjdCBzM2NfZmJfd2luX3Zhcmlh
bnQgKnZhcmlhbnQsCiAJCQkgICAgc3RydWN0IHMzY19mYl93aW4gKipyZXMpCiB7Ci0Jc3RydWN0
IGZiX3Zhcl9zY3JlZW5pbmZvICp2YXI7CiAJc3RydWN0IGZiX3ZpZGVvbW9kZSBpbml0bW9kZTsK
IAlzdHJ1Y3QgczNjX2ZiX3BkX3dpbiAqd2luZGF0YTsKIAlzdHJ1Y3QgczNjX2ZiX3dpbiAqd2lu
OwpAQCAtMTIwMSw3ICsxMjAwLDYgQEAgc3RhdGljIGludCBzM2NfZmJfcHJvYmVfd2luKHN0cnVj
dCBzM2NfZmIgKnNmYiwgdW5zaWduZWQgaW50IHdpbl9ubywKIAogCXdpbiA9IGZiaW5mby0+cGFy
OwogCSpyZXMgPSB3aW47Ci0JdmFyID0gJmZiaW5mby0+dmFyOwogCXdpbi0+dmFyaWFudCA9ICp2
YXJpYW50OwogCXdpbi0+ZmJpbmZvID0gZmJpbmZvOwogCXdpbi0+cGFyZW50ID0gc2ZiOwotLSAK
Mi4yNS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
