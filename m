Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 529412B4DBA
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 18:42:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 733726EA04;
	Mon, 16 Nov 2020 17:42:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE9826EA08
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 17:41:54 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id k2so19703868wrx.2
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 09:41:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6ly2vy0YXlYaSPJSVrw6dCp9MyYzaUlBE3q9eSYRtTE=;
 b=pPumeK8MjgTP68BQSG7hK5qh97k6m6M3fw6z+lcvLPzvg8BTWkTZHzzkXpU7QxOXHo
 BNjpaSAzOgDBRdrPBcrtCR8DySCYkQDX4/MZVG76DaCUlEmmI49870pkv1EZV4xCG+RW
 xUkjKMIcPpgrpkYhscE9yITsWMpQmuW/CKacZfUBLt/FmxAD6478E6Bi15qz8SGIpYuX
 /HCT/SjC04O9zWBTy/dqDc5YderwRLjQdaOVsRKO4MH6wC7olydW+2wepE2s4TjzZQU4
 2tSuihOsK2IWwV376TXT9CQEMTFzOTWhYx5vOCjVCZcjRFvbRIzFn8H2bFZdysPo46RF
 prWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6ly2vy0YXlYaSPJSVrw6dCp9MyYzaUlBE3q9eSYRtTE=;
 b=Fboej9Dxl9Zonmd3BqXB4KvTYdu9JrutIyBhzwZXGxs0lOQmlcQj09hd0uxRtL6LtL
 VDFd66MU3J6vHIOKxqhDyTMujTpTupfmma/oPVmFTzhMGAxJ+ReUNFKgopmriow2sgpM
 yYHk+pV3/H3k5F/tU18g5WAJUzhHOI+imId6fTPXrtTrI4PJq7UT6re6QbqOK5kPmeC7
 yGkYtTNBOfM834854Eltp78VOPfXAz+gVkZ8IKv7fOTIgsJ7Yj3QBS7mQTApogx465Jm
 tP5yJRLnx3lDsCZqlJK2Byy/ZGHPOAcySXQH2H6/Fb1uYFtJFk3DHrs9nwwlXbxvabkk
 Pesw==
X-Gm-Message-State: AOAM530JMLTVaN+SpDfOdkENXnkPhZ05p36hznm+zZsOGw7KiJseVUHy
 mjRDsUv6AvhKUhLb/9tllnns3w==
X-Google-Smtp-Source: ABdhPJxfPlHBGHo5OFZg60I7eHKyQ/Wgn1YzLYFclvP3QpESJC/x7/DqF1YwB7WHfVgKpSGF4/ZOmg==
X-Received: by 2002:a5d:410c:: with SMTP id l12mr20517364wrp.173.1605548513635; 
 Mon, 16 Nov 2020 09:41:53 -0800 (PST)
Received: from dell.default ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id n10sm24667224wrx.9.2020.11.16.09.41.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 09:41:52 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 23/42] drm/pl111/pl111_debugfs: Make local function
 'pl111_debugfs_regs()' static
Date: Mon, 16 Nov 2020 17:40:53 +0000
Message-Id: <20201116174112.1833368-24-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201116174112.1833368-1-lee.jones@linaro.org>
References: <20201116174112.1833368-1-lee.jones@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL3BsMTExL3BsMTExX2RlYnVnZnMuYzozMzo1OiB3YXJuaW5nOiBubyBwcmV2aW91
cyBwcm90b3R5cGUgZm9yIOKAmHBsMTExX2RlYnVnZnNfcmVnc+KAmSBbLVdtaXNzaW5nLXByb3Rv
dHlwZXNdCgpDYzogRXJpYyBBbmhvbHQgPGVyaWNAYW5ob2x0Lm5ldD4KQ2M6IERhdmlkIEFpcmxp
ZSA8YWlybGllZEBsaW51eC5pZT4KQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4K
Q2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKU2lnbmVkLW9mZi1ieTogTGVlIEpv
bmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vcGwxMTEvcGwx
MTFfZGVidWdmcy5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRl
bGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3BsMTExL3BsMTExX2RlYnVn
ZnMuYyBiL2RyaXZlcnMvZ3B1L2RybS9wbDExMS9wbDExMV9kZWJ1Z2ZzLmMKaW5kZXggMzE3ZjY4
YWJmMThiMC4uNjc0NGZhMTZmNDY0NCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3BsMTEx
L3BsMTExX2RlYnVnZnMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vcGwxMTEvcGwxMTFfZGVidWdm
cy5jCkBAIC0zMCw3ICszMCw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgewogCVJFR0RFRihDTENE
X1BMMTExX0xDVVIpLAogfTsKIAotaW50IHBsMTExX2RlYnVnZnNfcmVncyhzdHJ1Y3Qgc2VxX2Zp
bGUgKm0sIHZvaWQgKnVudXNlZCkKK3N0YXRpYyBpbnQgcGwxMTFfZGVidWdmc19yZWdzKHN0cnVj
dCBzZXFfZmlsZSAqbSwgdm9pZCAqdW51c2VkKQogewogCXN0cnVjdCBkcm1faW5mb19ub2RlICpu
b2RlID0gKHN0cnVjdCBkcm1faW5mb19ub2RlICopbS0+cHJpdmF0ZTsKIAlzdHJ1Y3QgZHJtX2Rl
dmljZSAqZGV2ID0gbm9kZS0+bWlub3ItPmRldjsKLS0gCjIuMjUuMQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
