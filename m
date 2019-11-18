Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A306101B00
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2019 09:06:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E66F36EBF9;
	Tue, 19 Nov 2019 08:04:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 188216E822
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 20:05:59 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id k15so20442793lja.3
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 12:05:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HgBM+uLJzoi65GUvGQFaYj+Mc0O6qp6cGsFHcfSLMpM=;
 b=FrQ82dPq446On0PbfFE8qsstij0ioPA/MGlWfpk5j30w0uXM5UybOzWd5H8ZxFBq7Z
 aRoH/CxihD9TW7QMLULKJ8d7L6+jpGgvoyWSkIiW/tFANqTHlR4tF4Vm9//xCB8oHeD9
 9o/JxMaksNK59v8NXGb1SzCyrwz5g20U3ekEZZ4FQW96QaJT9JaVYXKOb5GdMGWBIMr4
 6CRgD8Q8t1fCBUrXsoLsL4zwA5BjlSOW4bT09+p9MQHaPBbYgDxCdW5m+HgapF7OEOoX
 PDF+4ZXRGJT8JwsHo1t+XFX0/ExjY8iuWtISeGG46X+xFT4X9BN88F/a7/wefDyfE3T4
 a3lg==
X-Gm-Message-State: APjAAAVJjRNqDkM5yJ1XJN8NDAaihZCV7+25XU0nohNtYo0f0c+7rwSf
 CDwBOJ6P+uoZT74y7raiI8xmRcUb
X-Google-Smtp-Source: APXvYqyfW0WKhD1uVA2rVUoy/KYxAGfvlAfMguWfPRJtCNfwA2lZLJ/fI3hIYDfY/IysuOAaUSc38g==
X-Received: by 2002:a2e:3313:: with SMTP id d19mr931296ljc.240.1574107557638; 
 Mon, 18 Nov 2019 12:05:57 -0800 (PST)
Received: from localhost.localdomain (79-139-233-37.dynamic.spd-mgts.ru.
 [79.139.233.37])
 by smtp.gmail.com with ESMTPSA id j23sm9166942lji.41.2019.11.18.12.05.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Nov 2019 12:05:57 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v1 27/29] ARM: tegra: Enable interconnect API in
 tegra_defconfig
Date: Mon, 18 Nov 2019 23:02:45 +0300
Message-Id: <20191118200247.3567-28-digetx@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191118200247.3567-1-digetx@gmail.com>
References: <20191118200247.3567-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 19 Nov 2019 08:04:07 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HgBM+uLJzoi65GUvGQFaYj+Mc0O6qp6cGsFHcfSLMpM=;
 b=BJ4fv0AwnApXCJ/jzU5KhwRXyOGjsTvs6Mjqo8PeutmkRPOV9rVFv8VtjRT1Ktniec
 Dt7kfpJNBeslPkg98uTYJA9Sw3O43bAD6SbTKcztfhjKY+F2/gko1DR3Ln2KCmQK911q
 WEKQlxYeeW1b+ZbBTGakvw5mOC4zr9RIAIJDhVFasyx/YTsmqSg4WO/Be2z9vOmEKZK6
 Vj0LAPaIYyqehAMAPob+y6AMWPUZTLd6xE80C0rixvgo8Ameqz+NIU5Te3r1x8vF49A8
 C5D7VRT6rUMiFuqceETgcghI2iejY4HASEus2rOUoe6anWfQkEWU2egEy5Eg7oiy6fAE
 CVqA==
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
aWdzL3RlZ3JhX2RlZmNvbmZpZyB8IDIgKysKIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMo
KykKCmRpZmYgLS1naXQgYS9hcmNoL2FybS9jb25maWdzL3RlZ3JhX2RlZmNvbmZpZyBiL2FyY2gv
YXJtL2NvbmZpZ3MvdGVncmFfZGVmY29uZmlnCmluZGV4IGFhOTQzNjliZGQwZi4uMDJlM2E5ODdm
NjlmIDEwMDY0NAotLS0gYS9hcmNoL2FybS9jb25maWdzL3RlZ3JhX2RlZmNvbmZpZworKysgYi9h
cmNoL2FybS9jb25maWdzL3RlZ3JhX2RlZmNvbmZpZwpAQCAtMjY4LDYgKzI2OCw4IEBAIENPTkZJ
R19BSzg5NzU9eQogQ09ORklHX1BXTT15CiBDT05GSUdfUFdNX1RFR1JBPXkKIENPTkZJR19QSFlf
VEVHUkFfWFVTQj15CitDT05GSUdfSU5URVJDT05ORUNUPXkKK0NPTkZJR19JTlRFUkNPTk5FQ1Rf
VEVHUkE9eQogQ09ORklHX0VYVDJfRlM9eQogQ09ORklHX0VYVDJfRlNfWEFUVFI9eQogQ09ORklH
X0VYVDJfRlNfUE9TSVhfQUNMPXkKLS0gCjIuMjMuMAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
