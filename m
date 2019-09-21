Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF7DBAE1C
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2019 08:56:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98B6B6E115;
	Mon, 23 Sep 2019 06:55:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE3C46E06D;
 Sat, 21 Sep 2019 10:04:45 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id r5so9073961wrm.12;
 Sat, 21 Sep 2019 03:04:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TU10K6Skk15L/pvzqM4I92P+pNTDJ30jUP1jPCOCqPY=;
 b=sZVLdEgB7WUKDYV0rsD/F2iaUDcrwWdTsQKcuxm3Qb0Z366z/dJLtC8z+HXtyMXdII
 yHEM1Kkblge8Ft7rK2e0D5B+dyVU19TL4DeXEtxw3WG86LIK9xKxq8MXWH/79bGQsd+o
 4MtpH8SqcpRJ75Nsb1WLAsDAhSf4Yzddg1n/K+UmP1GTUfPdU2RRuAKaCjC31XLNn3L4
 Wahp7hAKigwyYRXBRX/FSnnDZOeQWAtm8Y6JTWRVsOyS7vv+whYpZQz0hjvUYT7ejicZ
 2aFNwMbtQsSaJHRyl42NeLXczE2NKUGKj+PcSb3JnHaPVfBIm2HmAMzYcOAb0ubTubrA
 F8HQ==
X-Gm-Message-State: APjAAAXoI4v1Hlab4PpS4FG10qaq5eCcYmj4jfRDeFdzbfbhSOY2uLqg
 ONDt2U2N8QpCtNI+I9O8ac8=
X-Google-Smtp-Source: APXvYqzNjrxbkngU7LFFU+dHNZwp1gDMTaPtjHFrjch0u5EbG+NCe6vOQXL5XIfiCN9G6kZiVS2bew==
X-Received: by 2002:a5d:61c4:: with SMTP id q4mr14466640wrv.327.1569060284345; 
 Sat, 21 Sep 2019 03:04:44 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([93.51.16.173])
 by smtp.gmail.com with ESMTPSA id g1sm3963575wrv.68.2019.09.21.03.04.43
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 21 Sep 2019 03:04:43 -0700 (PDT)
From: kholk11@gmail.com
To: linux-arm-msm@vger.kernel.org
Subject: [PATCH 1/5] drm/msm/mdp5: Add optional TBU and TBU_RT clocks
Date: Sat, 21 Sep 2019 12:04:35 +0200
Message-Id: <20190921100439.64402-2-kholk11@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190921100439.64402-1-kholk11@gmail.com>
References: <20190921100439.64402-1-kholk11@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 23 Sep 2019 06:55:22 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TU10K6Skk15L/pvzqM4I92P+pNTDJ30jUP1jPCOCqPY=;
 b=XY0Cy9iBpFXG+7DlS/LSIOMpO+wtX7mf5/MYkaQM9RCICkrmtNVS1BwPbXjSz9yiGb
 PwN5Cg/toj1zWu4s0xw21sYWWxx4rqklv0Wt7hIy/RIYEcu/WS8sdZIm8cAlj7pYXhCP
 2zS5Vj7aCJDl9XHmXpRClUT/lysiDhC3P9g7ZISsoq4kZgEYme/i5N0YNJcM93Y5KnyV
 Chy3sOdfQEuw6hQ+hRJ6kAcEW+5IK3XizXkQ8QFecTEBh0FKFR49vmzrFQcx8EtWGDto
 U5C0yaSlP9FyGywimXCpsqwejPxddp8emVjiY2gTdBXLRC0u9pKAqkOpOhrvjB400f3h
 nErQ==
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
Cc: mark.rutland@arm.com, freedreno@lists.freedesktop.org, marijns95@gmail.com,
 jonathan@marek.ca, airlied@linux.ie, gregkh@linuxfoundation.org,
 dri-devel@lists.freedesktop.org, bjorn.andersson@linaro.org,
 robh+dt@kernel.org, tglx@linutronix.de, kholk11@gmail.com, sean@poorly.run,
 georgi.djakov@linaro.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogIkFuZ2VsbyBHLiBEZWwgUmVnbm8iIDxraG9sazExQGdtYWlsLmNvbT4KClNvbWUgU29D
cywgbGlrZSBNU004OTU2Lzg5NzYgKGFuZCBBUFEgdmFyaWFudHMpLCBkbyBmZWF0dXJlIHRoZXNl
CmNsb2NrcyBhbmQgd2UgbmVlZCB0byBlbmFibGUgdGhlbSBpbiBvcmRlciB0byBnZXQgdGhlIGhh
cmR3YXJlIHRvCnByb3Blcmx5IHdvcmsuCgpTaWduZWQtb2ZmLWJ5OiBBbmdlbG8gRy4gRGVsIFJl
Z25vIDxraG9sazExQGdtYWlsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvbWRw
NS9tZHA1X2ttcy5jIHwgMTAgKysrKysrKysrKwogZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL21k
cDUvbWRwNV9rbXMuaCB8ICAyICsrCiAyIGZpbGVzIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKykK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvbWRwNS9tZHA1X2ttcy5jIGIv
ZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL21kcDUvbWRwNV9rbXMuYwppbmRleCBmZWM2ZWYxYWUz
YjkuLjIzYmU5Yjk1ZGQ3ZSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL21k
cDUvbWRwNV9rbXMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvbWRwNS9tZHA1X2tt
cy5jCkBAIC0yOTMsNiArMjkzLDEwIEBAIGludCBtZHA1X2Rpc2FibGUoc3RydWN0IG1kcDVfa21z
ICptZHA1X2ttcykKIAltZHA1X2ttcy0+ZW5hYmxlX2NvdW50LS07CiAJV0FSTl9PTihtZHA1X2tt
cy0+ZW5hYmxlX2NvdW50IDwgMCk7CiAKKwlpZiAobWRwNV9rbXMtPnRidV9ydF9jbGspCisJCWNs
a19kaXNhYmxlX3VucHJlcGFyZShtZHA1X2ttcy0+dGJ1X3J0X2Nsayk7CisJaWYgKG1kcDVfa21z
LT50YnVfY2xrKQorCQljbGtfZGlzYWJsZV91bnByZXBhcmUobWRwNV9rbXMtPnRidV9jbGspOwog
CWNsa19kaXNhYmxlX3VucHJlcGFyZShtZHA1X2ttcy0+YWhiX2Nsayk7CiAJY2xrX2Rpc2FibGVf
dW5wcmVwYXJlKG1kcDVfa21zLT5heGlfY2xrKTsKIAljbGtfZGlzYWJsZV91bnByZXBhcmUobWRw
NV9rbXMtPmNvcmVfY2xrKTsKQEAgLTMxMyw2ICszMTcsMTAgQEAgaW50IG1kcDVfZW5hYmxlKHN0
cnVjdCBtZHA1X2ttcyAqbWRwNV9rbXMpCiAJY2xrX3ByZXBhcmVfZW5hYmxlKG1kcDVfa21zLT5j
b3JlX2Nsayk7CiAJaWYgKG1kcDVfa21zLT5sdXRfY2xrKQogCQljbGtfcHJlcGFyZV9lbmFibGUo
bWRwNV9rbXMtPmx1dF9jbGspOworCWlmIChtZHA1X2ttcy0+dGJ1X2NsaykKKwkJY2xrX3ByZXBh
cmVfZW5hYmxlKG1kcDVfa21zLT50YnVfY2xrKTsKKwlpZiAobWRwNV9rbXMtPnRidV9ydF9jbGsp
CisJCWNsa19wcmVwYXJlX2VuYWJsZShtZHA1X2ttcy0+dGJ1X3J0X2Nsayk7CiAKIAlyZXR1cm4g
MDsKIH0KQEAgLTk0OCw2ICs5NTYsOCBAQCBzdGF0aWMgaW50IG1kcDVfaW5pdChzdHJ1Y3QgcGxh
dGZvcm1fZGV2aWNlICpwZGV2LCBzdHJ1Y3QgZHJtX2RldmljZSAqZGV2KQogCiAJLyogb3B0aW9u
YWwgY2xvY2tzOiAqLwogCWdldF9jbGsocGRldiwgJm1kcDVfa21zLT5sdXRfY2xrLCAibHV0Iiwg
ZmFsc2UpOworCWdldF9jbGsocGRldiwgJm1kcDVfa21zLT50YnVfY2xrLCAidGJ1IiwgZmFsc2Up
OworCWdldF9jbGsocGRldiwgJm1kcDVfa21zLT50YnVfcnRfY2xrLCAidGJ1X3J0IiwgZmFsc2Up
OwogCiAJLyogd2UgbmVlZCB0byBzZXQgYSBkZWZhdWx0IHJhdGUgYmVmb3JlIGVuYWJsaW5nLiAg
U2V0IGEgc2FmZQogCSAqIHJhdGUgZmlyc3QsIHRoZW4gZmlndXJlIG91dCBodyByZXZpc2lvbiwg
YW5kIHRoZW4gc2V0IGEKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9tZHA1
L21kcDVfa21zLmggYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvbWRwNS9tZHA1X2ttcy5oCmlu
ZGV4IGQxYmY0ZmRmYzgxNS4uMTI4ODY2NzQyNTkzIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vbXNtL2Rpc3AvbWRwNS9tZHA1X2ttcy5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlz
cC9tZHA1L21kcDVfa21zLmgKQEAgLTUzLDYgKzUzLDggQEAgc3RydWN0IG1kcDVfa21zIHsKIAlz
dHJ1Y3QgY2xrICphaGJfY2xrOwogCXN0cnVjdCBjbGsgKmNvcmVfY2xrOwogCXN0cnVjdCBjbGsg
Kmx1dF9jbGs7CisJc3RydWN0IGNsayAqdGJ1X2NsazsKKwlzdHJ1Y3QgY2xrICp0YnVfcnRfY2xr
OwogCXN0cnVjdCBjbGsgKnZzeW5jX2NsazsKIAogCS8qCi0tIAoyLjIxLjAKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
