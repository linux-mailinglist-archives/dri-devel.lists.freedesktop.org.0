Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2B42101AE7
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2019 09:05:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06FBD6EBC0;
	Tue, 19 Nov 2019 08:04:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10F456E827
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 20:06:00 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id k15so20442857lja.3
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 12:05:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=b+FC1Ebz4V/tdD/aZtuLhFg4JYDJSNGd7mh8RgwKtsY=;
 b=UgwzvVz6I3HaukfopqWVFYPuQvvUDODWdO06OcYwe6Nq2ADSLPvsI6qBjTDREvsCVi
 /ECCEXtVc4PIb2ctXceL8r/82Y7mN5h0L9uxE541mHVmDuQMoefzwzdJg5+piXCcIVOV
 WHIPPIylqNF19CNAotNt1xzFZ1SPeX2e+4zN9HMJCfGCTdIIAvviS1bP5+j2MWCrEeOR
 4V8z6k3n16oLTRawhwjtcb9ofUltrdzIt9HWnioUSZLTLZIXanUDom9e5QvVjJZIn23g
 pv0ot/EfQr9m0owXaPTTlntTHpaevPz6VvNZIRCbe+8V4EMArzViXkUztH/oZFj9Eett
 yb+Q==
X-Gm-Message-State: APjAAAVJp6Kv+L7Eij/MllXwR/404cA97Lvm62gZYrHVvqBDwLQMO4Qv
 e8vKq4G+7Uk7KG5hZWNgUSU=
X-Google-Smtp-Source: APXvYqxUTBrjlS5fpAxANC6wrqNZBFzKWst5uBs3YxOhqljqy1cqcRm52+irbhLhBkB22FMaIFMs2w==
X-Received: by 2002:a05:651c:20f:: with SMTP id
 y15mr890330ljn.31.1574107558631; 
 Mon, 18 Nov 2019 12:05:58 -0800 (PST)
Received: from localhost.localdomain (79-139-233-37.dynamic.spd-mgts.ru.
 [79.139.233.37])
 by smtp.gmail.com with ESMTPSA id j23sm9166942lji.41.2019.11.18.12.05.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Nov 2019 12:05:58 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v1 28/29] ARM: multi_v7_defconfig: Enable NVIDIA Tegra
 interconnect providers
Date: Mon, 18 Nov 2019 23:02:46 +0300
Message-Id: <20191118200247.3567-29-digetx@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191118200247.3567-1-digetx@gmail.com>
References: <20191118200247.3567-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 19 Nov 2019 08:04:07 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=b+FC1Ebz4V/tdD/aZtuLhFg4JYDJSNGd7mh8RgwKtsY=;
 b=H8d5vixAZh3pIcUcjoKGYvCRv2xI8bcCjulrLFsiJ3Wnxxj3JVyE2TbRbpPt/X0fLf
 Gw2IRXMWWl5aYik28WIzedXrgIqCkfE+8/DOUXrp3RBO2bTvguPPX4iR/fgY+12bsk+d
 QCpu4/m6YyjR5NA/cQ87YB4L9Yabr23tItQ9tL4pe7VFD9jGp8+DRxfMgXQDJCfoZPjO
 TJiOsZZPxdbBT1dXFyMoS7zd1hWzY2lcQHDEj6xjK8nl0x2HnxFiGU3GgfToVo3bZ1+R
 EcAIbIC2bOQB005pnu7W8gtDxRa+btulmpGLbEdXSLPMJ0rwwYatXZ2nlS5ww5Wlhud2
 MUvQ==
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

VGVncmEgbm93IGhhcyBpbnRlcmNvbm5lY3QgcHJvdmlkZXJzIHRoYXQgYXJlIHVzZWQgZm9yIG1l
bW9yeSBiYW5kd2lkdGgKYWxsb2NhdGlvbiBieSBkaXNwbGF5IGRyaXZlci4KClNpZ25lZC1vZmYt
Ynk6IERtaXRyeSBPc2lwZW5rbyA8ZGlnZXR4QGdtYWlsLmNvbT4KLS0tCiBhcmNoL2FybS9jb25m
aWdzL211bHRpX3Y3X2RlZmNvbmZpZyB8IDIgKysKIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlv
bnMoKykKCmRpZmYgLS1naXQgYS9hcmNoL2FybS9jb25maWdzL211bHRpX3Y3X2RlZmNvbmZpZyBi
L2FyY2gvYXJtL2NvbmZpZ3MvbXVsdGlfdjdfZGVmY29uZmlnCmluZGV4IDI5M2YwY2VhMDc2Yy4u
YzEzMWQ3OTY5YWEzIDEwMDY0NAotLS0gYS9hcmNoL2FybS9jb25maWdzL211bHRpX3Y3X2RlZmNv
bmZpZworKysgYi9hcmNoL2FybS9jb25maWdzL211bHRpX3Y3X2RlZmNvbmZpZwpAQCAtMTA4NSw2
ICsxMDg1LDggQEAgQ09ORklHX0ZTSV9NQVNURVJfQVNQRUVEPW0KIENPTkZJR19GU0lfU0NPTT1t
CiBDT05GSUdfRlNJX1NCRUZJRk89bQogQ09ORklHX0ZTSV9PQ0M9bQorQ09ORklHX0lOVEVSQ09O
TkVDVD15CitDT05GSUdfSU5URVJDT05ORUNUX1RFR1JBPXkKIENPTkZJR19FWFQ0X0ZTPXkKIENP
TkZJR19BVVRPRlM0X0ZTPXkKIENPTkZJR19NU0RPU19GUz15Ci0tIAoyLjIzLjAKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
