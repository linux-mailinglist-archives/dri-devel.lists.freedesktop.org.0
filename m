Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54D0C2B1C55
	for <lists+dri-devel@lfdr.de>; Fri, 13 Nov 2020 14:51:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15B446E588;
	Fri, 13 Nov 2020 13:50:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4E466E4EA
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Nov 2020 13:50:07 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id p8so10000735wrx.5
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Nov 2020 05:50:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6ly2vy0YXlYaSPJSVrw6dCp9MyYzaUlBE3q9eSYRtTE=;
 b=GQ2nGnd7ei9cM5vD1JEPCD7VBWcLAZDk9tid5K2m1xB+49husnSK/V/fuJKikI0pJ2
 jy1I+r7PYWoJlfHHSwpCmz3O8VIJer6bYuPQrIfusLAwvQd/dr+NFAd03BYUpLjj1HCn
 o/CNud2pA03ra46Eoojnh3roIyHaeUuTCXnuWocrauXB4AjYHI3mBdr2crnYp+ZIRoeW
 I991Y4euR9IKVcPE3mLFtSxlrrst7X5qViXjT0nOamfVU9oPzPNq3ISGr7T41vitiSGG
 VxopJOVPIXrdplhprsaLEkD1NXrt1bxBB9Ey97Amfw2JrdELeLoJcp5z3bu8vH6QF04l
 wQyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6ly2vy0YXlYaSPJSVrw6dCp9MyYzaUlBE3q9eSYRtTE=;
 b=NLWYs1gWaZ3g/wLP7N2GhiwfJEidW77ErZbeCCXv9xHJzqqa9rH7jalsI3v0oZefhP
 j8w/ElSKt8LDVFmwGVeUJiFSDaWHOpkaahLGD9d/NWlh2fSF/aXNOX6PeIsSi1OnkUHZ
 QSvPgFx00Xm1Evv16KJmp+h/HFxKLMt5hCQhKk4k0SKYb14CNvFkzfCDhCgo99mh6bYZ
 My0d41cAzXcrei1jQuqthtK4b2ki+/z6ijo28clhXXkCNYnoITh6TQLDPx/btjGvzeVO
 oMjFtdmjpVrrspCZlecnA9SwzgndLG60O8p4FZs67XmG9oUSQAr6ARSYgPaluB5cf05a
 BRSQ==
X-Gm-Message-State: AOAM5310XpdBaoYe8rud9PB8VjT4nvGr463Uj+NJzqSGqvBW/a2ZpHcA
 EKVci4imVDUOxQpsIECBDcLCaw==
X-Google-Smtp-Source: ABdhPJxkktgUMZ93Vt2pOU9eROULFhMoiiN6/Qcg7QUfTEQlsQNZFV9mcp77LfG1pzYLuY40XOCt/Q==
X-Received: by 2002:a5d:488f:: with SMTP id g15mr3566282wrq.151.1605275406578; 
 Fri, 13 Nov 2020 05:50:06 -0800 (PST)
Received: from dell.default ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id t11sm4561614wrm.8.2020.11.13.05.50.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Nov 2020 05:50:05 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 20/40] drm/pl111/pl111_debugfs: Make local function
 'pl111_debugfs_regs()' static
Date: Fri, 13 Nov 2020 13:49:18 +0000
Message-Id: <20201113134938.4004947-21-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201113134938.4004947-1-lee.jones@linaro.org>
References: <20201113134938.4004947-1-lee.jones@linaro.org>
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
