Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 88E482B1C3E
	for <lists+dri-devel@lfdr.de>; Fri, 13 Nov 2020 14:50:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8DB26E524;
	Fri, 13 Nov 2020 13:50:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5819D6E4DD
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Nov 2020 13:50:05 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id 33so9981092wrl.7
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Nov 2020 05:50:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NO2flJnZQ5gKgn/ih0D6aTqpwf9ViRniG5BiRkSE7jU=;
 b=oU+bZDcIA8AQ53jLjMhsbcTjoc0o9aqwixUMDFaPxx4SjacHt/w7oe9W1HMKSdIsn9
 6MbabSjAFbSm0k1Wtzvrq0NdT42aTWaBzzmUWCU8zrAC1ar1JcV5agJQhKKqmsvQRDx8
 DugB2mjm1THeElsZsw+uY85zNMeJ8YXM1g5rjMPx7fYOia71z/cOlFmrj0P/AASK1cLd
 a19gm/PUefiBML3NgcSMj3reICam5oEhlLKz5NZeKUjHwCdh3UqBZfXHS+7mwb1CQBMp
 083hgZs8utmuWHk8W0+RbnRiirUW1LsWFcExyMHgs8HKN+uangYIThSsaPlgGG/FncvU
 Wb1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NO2flJnZQ5gKgn/ih0D6aTqpwf9ViRniG5BiRkSE7jU=;
 b=QUIMW9VxubnE3QMuRRWY2TylT5B3aqJKRZO1u1Mz6qKwWoiSCbjjxWvFC0kHG9jH/k
 gO/yp+C1D4ySazlWQdA+INKM2RydLcwMIpAKKPhQh4jVMXXnySIS76WnlQzsjwUtgk5h
 FNc7HasP7OUf5+jbsAwyJUPDOxXiRfigYxVvYym4kaa00Qi+X2J2O6EO0hRdCK4dx8+w
 NspAksNR6tydquvoQdGQDUtXJHrNK30g7Kh+mq+BKyDQRmS39cCOxbTvE02eUj2z8o8c
 NR2J5ql4lqTxevIM2IRbBrr1t5IPyqQgd8rMRWvBWByPNE/RtymISp5+fovyA7RIdMiv
 /yMQ==
X-Gm-Message-State: AOAM532HuVZl0+IjLGhYaT5Hy90zbvduMw+MSyzYPAgAs2p8qjVtMUPu
 IEwHvUgRvdla572qq6mXo8DusQ==
X-Google-Smtp-Source: ABdhPJzKJjo+4i22doEfV7yx3IYktJ3jj4EOHDvZEs21nHetaud1mfeiFp8gdC0lK6WMgPjwB27Hhg==
X-Received: by 2002:a5d:4e46:: with SMTP id r6mr3589306wrt.218.1605275403918; 
 Fri, 13 Nov 2020 05:50:03 -0800 (PST)
Received: from dell.default ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id t11sm4561614wrm.8.2020.11.13.05.50.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Nov 2020 05:50:03 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 18/40] drm/mediatek/mtk_dpi: Remove unused struct definition
 'mtk_dpi_encoder_funcs'
Date: Fri, 13 Nov 2020 13:49:16 +0000
Message-Id: <20201113134938.4004947-19-lee.jones@linaro.org>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Jie Qiu <jie.qiu@mediatek.com>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL21lZGlhdGVrL210a19kcGkuYzo1MzA6Mzk6IHdhcm5pbmc6IOKAmG10a19kcGlf
ZW5jb2Rlcl9mdW5jc+KAmSBkZWZpbmVkIGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQtY29uc3QtdmFy
aWFibGU9XQoKQ2M6IENodW4tS3VhbmcgSHUgPGNodW5rdWFuZy5odUBrZXJuZWwub3JnPgpDYzog
UGhpbGlwcCBaYWJlbCA8cC56YWJlbEBwZW5ndXRyb25peC5kZT4KQ2M6IERhdmlkIEFpcmxpZSA8
YWlybGllZEBsaW51eC5pZT4KQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KQ2M6
IE1hdHRoaWFzIEJydWdnZXIgPG1hdHRoaWFzLmJnZ0BnbWFpbC5jb20+CkNjOiBKaWUgUWl1IDxq
aWUucWl1QG1lZGlhdGVrLmNvbT4KQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
Q2M6IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwpDYzogbGludXgtbWVkaWF0
ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpTaWduZWQtb2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25l
c0BsaW5hcm8ub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHBpLmMgfCA5
IC0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDkgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcGkuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRp
YXRlay9tdGtfZHBpLmMKaW5kZXggY2YxMWM0ODUwYjQwNS4uNTJmMTFhNjNhMzMwNCAxMDA2NDQK
LS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcGkuYworKysgYi9kcml2ZXJzL2dw
dS9kcm0vbWVkaWF0ZWsvbXRrX2RwaS5jCkBAIC01MjIsMTUgKzUyMiw2IEBAIHN0YXRpYyBpbnQg
bXRrX2RwaV9zZXRfZGlzcGxheV9tb2RlKHN0cnVjdCBtdGtfZHBpICpkcGksCiAJcmV0dXJuIDA7
CiB9CiAKLXN0YXRpYyB2b2lkIG10a19kcGlfZW5jb2Rlcl9kZXN0cm95KHN0cnVjdCBkcm1fZW5j
b2RlciAqZW5jb2RlcikKLXsKLQlkcm1fZW5jb2Rlcl9jbGVhbnVwKGVuY29kZXIpOwotfQotCi1z
dGF0aWMgY29uc3Qgc3RydWN0IGRybV9lbmNvZGVyX2Z1bmNzIG10a19kcGlfZW5jb2Rlcl9mdW5j
cyA9IHsKLQkuZGVzdHJveSA9IG10a19kcGlfZW5jb2Rlcl9kZXN0cm95LAotfTsKLQogc3RhdGlj
IGludCBtdGtfZHBpX2JyaWRnZV9hdHRhY2goc3RydWN0IGRybV9icmlkZ2UgKmJyaWRnZSwKIAkJ
CQkgZW51bSBkcm1fYnJpZGdlX2F0dGFjaF9mbGFncyBmbGFncykKIHsKLS0gCjIuMjUuMQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
