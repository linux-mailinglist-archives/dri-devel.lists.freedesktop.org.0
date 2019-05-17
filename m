Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E600265ED
	for <lists+dri-devel@lfdr.de>; Wed, 22 May 2019 16:37:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8A2E89B01;
	Wed, 22 May 2019 14:35:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81FE689994
 for <dri-devel@lists.freedesktop.org>; Fri, 17 May 2019 18:47:13 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id 15so3615114wmg.5
 for <dri-devel@lists.freedesktop.org>; Fri, 17 May 2019 11:47:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Btaw5CgxhYac28zaC8EYgFvIIeyjC0ToJx7hPAKP9QY=;
 b=nfEZEdcmzn8EDvGJ2By0wVjLvdcsURmb2qjRoMVHXihvpKq3n9aQybznZXchi6IaMu
 pcn7MwUagwegiHFnQrBNNJvgAMUxdRtSlzKiGyzTXjIj2PWanyn43LhbgfoSOMHauL4I
 0nSVUgXdG0yuSWb2GRHXNObG1CGg44uiRTAUOJEs6jWeMvvVluZ8P6dox0jN5HSs1sci
 gWKAJ3rtemSW+3vJWxUiSmBHTtFKGlGFputt1Dixq3Je5O5eBtyeHEQheJr3TCeM4p5z
 zCCTD6EnEZCBjstNLXZ3l4ylf42uHu/CyI4hHs10qSfGPg67IYq2HhOjzEe1++GGcjok
 k1KQ==
X-Gm-Message-State: APjAAAV0VK/kacCcUQojF1vTPKZdLZUYny30ER13JXBlWMAoTV/W+WUt
 q+xTLDFhFm4T93SlVt1S7G8=
X-Google-Smtp-Source: APXvYqzArrwsBcPq+tVBrTz90U11Q0am6+wnQ5F3p77yNdgZ3iQekw5aa3vsszJncLjFku7dlsgqUQ==
X-Received: by 2002:a1c:9616:: with SMTP id y22mr3268422wmd.73.1558118832056; 
 Fri, 17 May 2019 11:47:12 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:1f1:d0f0::4e2b:d7ca])
 by smtp.gmail.com with ESMTPSA id v20sm5801112wmj.10.2019.05.17.11.47.11
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 17 May 2019 11:47:11 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Will Deacon <will.deacon@arm.com>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Neil Armstrong <narmstrong@baylibre.com>,
 Steven Price <steven.price@arm.com>
Subject: [PATCH v5 5/6] arm64: dts: allwinner: Add ARM Mali GPU node for H6
Date: Fri, 17 May 2019 20:46:58 +0200
Message-Id: <20190517184659.18828-6-peron.clem@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190517184659.18828-1-peron.clem@gmail.com>
References: <20190517184659.18828-1-peron.clem@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 22 May 2019 14:35:24 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Btaw5CgxhYac28zaC8EYgFvIIeyjC0ToJx7hPAKP9QY=;
 b=rvS8TdrrNuTuTAczO/sCk3JYQDiJx2zGD/6UYxqHovGm+wntVw99HRWQrWG6B6Ziup
 +eXBKtuGsJr+1pfo0wvcjK1XPoXYQOKCCDRzcSdX5Gf0G5QudaJLmAM75dro9XSfdJ9z
 UnFgsYIydmslSPMlnICV/EntlzRoteVF2Kb6B8hzHgbAI0HDkqV49pbgIrvE4Nj5R9xl
 ZKlpEyQF8ZMmSe/S6bFlC3qhXjP35nbVs8HjS0qO5AjAfWaUItFmW57IEcjJ3f1i9tio
 voD5XCP+9ELMbiBE9y+JLbCsYS1gHbGHQlmp7euB2Mp1d3Dal57AFoAqLOoXfHV3Myyh
 Ya5w==
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIHRoZSBtYWxpIGdwdSBub2RlIHRvIHRoZSBINiBkZXZpY2UtdHJlZS4KClNpZ25lZC1vZmYt
Ynk6IENsw6ltZW50IFDDqXJvbiA8cGVyb24uY2xlbUBnbWFpbC5jb20+Ci0tLQogYXJjaC9hcm02
NC9ib290L2R0cy9hbGx3aW5uZXIvc3VuNTBpLWg2LmR0c2kgfCAxNCArKysrKysrKysrKysrKwog
MSBmaWxlIGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9hcmNoL2FybTY0
L2Jvb3QvZHRzL2FsbHdpbm5lci9zdW41MGktaDYuZHRzaSBiL2FyY2gvYXJtNjQvYm9vdC9kdHMv
YWxsd2lubmVyL3N1bjUwaS1oNi5kdHNpCmluZGV4IDE2YzVjM2QwZmQ4MS4uNmFhZDA2MDk1YzQw
IDEwMDY0NAotLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2FsbHdpbm5lci9zdW41MGktaDYuZHRz
aQorKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2FsbHdpbm5lci9zdW41MGktaDYuZHRzaQpAQCAt
MTU3LDYgKzE1NywyMCBAQAogCQkJYWxsd2lubmVyLHNyYW0gPSA8JnZlX3NyYW0gMT47CiAJCX07
CiAKKwkJZ3B1OiBncHVAMTgwMDAwMCB7CisJCQljb21wYXRpYmxlID0gImFsbHdpbm5lcixzdW41
MGktaDYtbWFsaSIsCisJCQkJICAgICAiYXJtLG1hbGktdDcyMCI7CisJCQlyZWcgPSA8MHgwMTgw
MDAwMCAweDQwMDA+OworCQkJaW50ZXJydXB0cyA9IDxHSUNfU1BJIDg0IElSUV9UWVBFX0xFVkVM
X0hJR0g+LAorCQkJCSAgICAgPEdJQ19TUEkgODUgSVJRX1RZUEVfTEVWRUxfSElHSD4sCisJCQkJ
ICAgICA8R0lDX1NQSSA4MyBJUlFfVFlQRV9MRVZFTF9ISUdIPjsKKwkJCWludGVycnVwdC1uYW1l
cyA9ICJqb2IiLCAibW11IiwgImdwdSI7CisJCQljbG9ja3MgPSA8JmNjdSBDTEtfR1BVPiwgPCZj
Y3UgQ0xLX0JVU19HUFU+OworCQkJY2xvY2stbmFtZXMgPSAiY29yZSIsICJidXMiOworCQkJcmVz
ZXRzID0gPCZjY3UgUlNUX0JVU19HUFU+OworCQkJc3RhdHVzID0gImRpc2FibGVkIjsKKwkJfTsK
KwogCQlzeXNjb246IHN5c2NvbkAzMDAwMDAwIHsKIAkJCWNvbXBhdGlibGUgPSAiYWxsd2lubmVy
LHN1bjUwaS1oNi1zeXN0ZW0tY29udHJvbCIsCiAJCQkJICAgICAiYWxsd2lubmVyLHN1bjUwaS1h
NjQtc3lzdGVtLWNvbnRyb2wiOwotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
