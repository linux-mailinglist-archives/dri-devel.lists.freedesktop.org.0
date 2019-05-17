Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B2C265FD
	for <lists+dri-devel@lfdr.de>; Wed, 22 May 2019 16:38:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BB6789B68;
	Wed, 22 May 2019 14:36:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0904F8997A
 for <dri-devel@lists.freedesktop.org>; Fri, 17 May 2019 18:47:11 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id c5so8124018wrs.11
 for <dri-devel@lists.freedesktop.org>; Fri, 17 May 2019 11:47:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2w/o0YvWj4GW2dKc8xosf8L/TwKxnX3w/M6Sh7NSyHk=;
 b=LxMLifvC4l9MIEO7nhL+SkuSWJz8Fw1tD9avT1ysr30jNx/sF1pe0cp5zKvozHuAB3
 yyaKmr89Ov6AJ96pxfCgNvdMAq8YNOPqZVKwlEnATlPV9qS/u16stWZHcsY0zBUa1kLJ
 5cjWTs2vmDARwY6cgX+n8ChJeGnPNMmMPi848ctj+TIyx2xW2ggwtQtao/WVpaK8Ovkn
 uqAbqpH/us5Jrck04iVKsTK7Dc5y6krrKTrjDO3vn4kgRqG2S8yS/Z89ZO2VKjaCjpoa
 Xrxg3AFXHHEU+w6p0i2Lw/wq9pQwqVATWxCusrVcKwYG2scyxOam4PmyZKzpcLyx26dB
 or8Q==
X-Gm-Message-State: APjAAAWqiojRxNpfZqa5dBVKzCXg0x3yAknMbXqcDEVdjOq8S1fg6h82
 36g3PIwjUQkdru0b3omEZWk=
X-Google-Smtp-Source: APXvYqwJzLvCjxFr10WwtK8XqGQ5+MmNhKYR5eWWQw+nzXOrlwwqnjpWoqW7Z7qd4a37Tuhgl5Jysw==
X-Received: by 2002:adf:eb03:: with SMTP id s3mr29605848wrn.170.1558118829632; 
 Fri, 17 May 2019 11:47:09 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:1f1:d0f0::4e2b:d7ca])
 by smtp.gmail.com with ESMTPSA id v20sm5801112wmj.10.2019.05.17.11.47.08
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 17 May 2019 11:47:08 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Will Deacon <will.deacon@arm.com>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Neil Armstrong <narmstrong@baylibre.com>,
 Steven Price <steven.price@arm.com>
Subject: [PATCH v5 3/6] dt-bindings: gpu: add bus clock for Mali Midgard GPUs
Date: Fri, 17 May 2019 20:46:56 +0200
Message-Id: <20190517184659.18828-4-peron.clem@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190517184659.18828-1-peron.clem@gmail.com>
References: <20190517184659.18828-1-peron.clem@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 22 May 2019 14:35:24 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2w/o0YvWj4GW2dKc8xosf8L/TwKxnX3w/M6Sh7NSyHk=;
 b=mMauM/oRgsPGZUvkUT/+QSTeGRj6V4+Bsa6SDx89DACsieftOUcfnpP0PEa41Y7jjx
 vXR0gKI35+II1451PFUMT8qwllnoMQCNopXWWgkKjmFkg97k9NkB0qyU/ITdLnqaNvhm
 7824EGQbsW7XUYg+EzvF7fldSBjWgoGIYtjpilZkMG0t9WLhzSrvsol8kDo+K3T3NCbz
 PtKzNCbAtvYzjHxH1L/LnQ5cuh6R/Ykju94XenD6GIqKrMqbcTl7PRp9x84vws0jG24X
 O0reJu7XDq7JltXMnRyde6v/Fyx4Zr/oaaCH3CSZNg0MmhVKzYSpSwrgTvKQLNFPdlfF
 wbeg==
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
 linux-arm-kernel@lists.infradead.org, Icenowy Zheng <icenowy@aosc.io>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogSWNlbm93eSBaaGVuZyA8aWNlbm93eUBhb3NjLmlvPgoKU29tZSBTb0NzIGFkZHMgYSBi
dXMgY2xvY2sgZ2F0ZSB0byB0aGUgTWFsaSBNaWRnYXJkIEdQVS4KCkFkZCB0aGUgYmluZGluZyBm
b3IgdGhlIGJ1cyBjbG9jay4KClNpZ25lZC1vZmYtYnk6IEljZW5vd3kgWmhlbmcgPGljZW5vd3lA
YW9zYy5pbz4KU2lnbmVkLW9mZi1ieTogQ2zDqW1lbnQgUMOpcm9uIDxwZXJvbi5jbGVtQGdtYWls
LmNvbT4KUmV2aWV3ZWQtYnk6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+Ci0tLQogRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2dwdS9hcm0sbWFsaS1taWRnYXJkLnR4dCB8
IDYgKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2dwdS9hcm0sbWFsaS1taWRnYXJkLnR4
dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9ncHUvYXJtLG1hbGktbWlkZ2Fy
ZC50eHQKaW5kZXggMWIxYTc0MTI5MTQxLi4yZThiYmNlMzU2OTUgMTAwNjQ0Ci0tLSBhL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9ncHUvYXJtLG1hbGktbWlkZ2FyZC50eHQKKysr
IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2dwdS9hcm0sbWFsaS1taWRnYXJk
LnR4dApAQCAtMzEsNiArMzEsMTIgQEAgT3B0aW9uYWwgcHJvcGVydGllczoKIAogLSBjbG9ja3Mg
OiBQaGFuZGxlIHRvIGNsb2NrIGZvciB0aGUgTWFsaSBNaWRnYXJkIGRldmljZS4KIAorLSBjbG9j
ay1uYW1lcyA6IFNwZWNpZnkgdGhlIG5hbWVzIG9mIHRoZSBjbG9ja3Mgc3BlY2lmaWVkIGluIGNs
b2NrcworICB3aGVuIG11bHRpcGxlIGNsb2NrcyBhcmUgcHJlc2VudC4KKyAgICAqIGNvcmU6IGNs
b2NrIGRyaXZpbmcgdGhlIEdQVSBpdHNlbGYgKFdoZW4gb25seSBvbmUgY2xvY2sgaXMgcHJlc2Vu
dCwKKyAgICAgIGFzc3VtZSBpdCdzIHRoaXMgY2xvY2suKQorICAgICogYnVzOiBidXMgY2xvY2sg
Zm9yIHRoZSBHUFUKKwogLSBtYWxpLXN1cHBseSA6IFBoYW5kbGUgdG8gcmVndWxhdG9yIGZvciB0
aGUgTWFsaSBkZXZpY2UuIFJlZmVyIHRvCiAgIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9yZWd1bGF0b3IvcmVndWxhdG9yLnR4dCBmb3IgZGV0YWlscy4KIAotLSAKMi4xNy4xCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
