Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CFF7101ADA
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2019 09:04:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E51A16EBBB;
	Tue, 19 Nov 2019 08:04:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B86086E822
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 20:05:39 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id l28so5405524lfj.1
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 12:05:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5bfGeYRpAIb7Vt687NPjP6ZPCPNVBieu/nr7ieOj26E=;
 b=rMckrUAGyJxvXlBKLc7eSmtnN2SGLGlHyqHjbcWx7+nW6cHI1l+iMHUS5iW3eUOxOU
 oLv1/6c3pKFSvFegJiYYwX13fYQD/+Cl5anXIghqYlvQZrRnUDUD20edlqygZKLTaKJ0
 Pe2cTZW4CxvQqnQPY2BIGyIFvFvXCYJX8PZ4dLlgIguLAkcQlYOYYce/ZNZ3aR+XRz9S
 vr+BEHycdJWOQkN1A80QApVV01DNATYQVPAYsM3LlKH63eIuLPK0bIgEzorsLFMg3JI5
 0RR1QDHvgn6TPiOe4GlxtwmgwzehR6jLQYCapiWQZnMs+/TiiSBjddMKpYUqg1U3pHaq
 Bdwg==
X-Gm-Message-State: APjAAAXYO6Ovcm9RMO/LUHkaWh/zUfd+wxIUC1TY5M7P4qOv2G2KF2Lq
 94CbXyuKwBO7cAByVDHRVTA=
X-Google-Smtp-Source: APXvYqxjGaEE1J26V9CzM6qhm1dzop3yORXmRLeUpQt2ugEUp+YI3ahrkxWJNyTQEP+dhbY4FYaHzQ==
X-Received: by 2002:a19:c606:: with SMTP id w6mr829239lff.71.1574107538243;
 Mon, 18 Nov 2019 12:05:38 -0800 (PST)
Received: from localhost.localdomain (79-139-233-37.dynamic.spd-mgts.ru.
 [79.139.233.37])
 by smtp.gmail.com with ESMTPSA id j23sm9166942lji.41.2019.11.18.12.05.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Nov 2019 12:05:37 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v1 08/29] dt-bindings: interconnect: tegra: Add initial IDs
Date: Mon, 18 Nov 2019 23:02:26 +0300
Message-Id: <20191118200247.3567-9-digetx@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191118200247.3567-1-digetx@gmail.com>
References: <20191118200247.3567-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 19 Nov 2019 08:04:07 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5bfGeYRpAIb7Vt687NPjP6ZPCPNVBieu/nr7ieOj26E=;
 b=uen7qFUTySXP1efIkJ1D1dayy9+YWpPkb6RejWcxCsVjJwfODMnFF3axpHp9uot8qO
 kWX/wEinZELq8SCJcMTgCqMtRtXigRVG+J/cDynQ+ErfPgeU5fuuNYrHkHWEhbrX77WQ
 ZGzCZIsIMaacx4h9WciGXJeoPVUWsFIMy2IO4fdpvTwvoOadwyfC/SMxbf5J7aJxlMN5
 bi7RSFO3Uw+26DUb+3iP6JytiDkjquLOsssWxAFAh0ZafK1r/Ux/cxItKjTGFbZi+RI8
 h1KUrGBCsWCI1s3KhBCaINQaq7kWBRiBim5QTgiS5dopMYBLadoZPnXtfzx95ycYcfM9
 TEew==
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
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-pm@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RGVmaW5lIGludGVyY29ubmVjdCBJRHMgZm9yIG1lbW9yeSBjb250cm9sbGVyIChNQyksIGV4dGVy
bmFsIG1lbW9yeQpjb250cm9sbGVyIChFTUMpLCBleHRlcm5hbCBtZW1vcnkgKEVNRU0pIGFuZCBt
ZW1vcnkgY2xpZW50cyBvZiBkaXNwbGF5CmNvbnRyb2xsZXJzIChEQykuCgpTaWduZWQtb2ZmLWJ5
OiBEbWl0cnkgT3NpcGVua28gPGRpZ2V0eEBnbWFpbC5jb20+Ci0tLQogaW5jbHVkZS9kdC1iaW5k
aW5ncy9pbnRlcmNvbm5lY3QvdGVncmEtaWNjLmggfCAxMSArKysrKysrKysrKwogMSBmaWxlIGNo
YW5nZWQsIDExIGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBpbmNsdWRlL2R0LWJp
bmRpbmdzL2ludGVyY29ubmVjdC90ZWdyYS1pY2MuaAoKZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHQt
YmluZGluZ3MvaW50ZXJjb25uZWN0L3RlZ3JhLWljYy5oIGIvaW5jbHVkZS9kdC1iaW5kaW5ncy9p
bnRlcmNvbm5lY3QvdGVncmEtaWNjLmgKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAw
MDAwMDAwLi5lNmI2YTgxOTQzNGEKLS0tIC9kZXYvbnVsbAorKysgYi9pbmNsdWRlL2R0LWJpbmRp
bmdzL2ludGVyY29ubmVjdC90ZWdyYS1pY2MuaApAQCAtMCwwICsxLDExIEBACisvKiBTUERYLUxp
Y2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMCAqLworI2lmbmRlZiBEVF9CSU5ESU5HU19JQ0NfVEVH
UkFfSAorI2RlZmluZSBEVF9CSU5ESU5HU19JQ0NfVEVHUkFfSAorCisjZGVmaW5lIFRFR1JBX0lD
Q19FTUMJCQkwCisjZGVmaW5lIFRFR1JBX0lDQ19FTUVNCQkJMQorI2RlZmluZSBURUdSQV9JQ0Nf
TUMJCQkyCisjZGVmaW5lIFRFR1JBX0lDQ19NQ19EQwkJCTMKKyNkZWZpbmUgVEVHUkFfSUNDX01D
X0RDQgkJNAorCisjZW5kaWYKLS0gCjIuMjMuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
