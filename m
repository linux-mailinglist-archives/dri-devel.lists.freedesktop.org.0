Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 091BA101ADD
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2019 09:04:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DD936EBCA;
	Tue, 19 Nov 2019 08:04:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71FFB6E822
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 20:05:36 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id r14so8264414lff.3
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 12:05:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=micXsJQgXBCNNJcKoZJTQ5HIZ0M5FUK3UrWoG3KSyWo=;
 b=XmFn/L3HReMKFL8VaubsqRkeuSaWGZ/WK83JYmk/yDzJ0+NZsOU6ZiGhe8kkIj7QPs
 QNJPmBfhRymbIDa+Ti/swFae8bdLyCrnBY/WiFTdnEBeP36k9yNagALiJLd5TmwznJbB
 zSAiGrrhN2F2Fq4IiFEOuSKGpx3Va3dL+B9KZ09SJpfs5ir2tad0qSGFXytuKmfhuB4r
 nB7y8yK4EsQmObkp775OQz41fCKgFwOgtsNTSZwiohB2oDd1OawXz2BjeqkSDCKlZMmK
 QWmQxAKSFRag7Ydylcg2rXTxmm7W6Appilwv6rIjcaZQ2nI9PO/XalcN5yAj6XFEVWgI
 wREg==
X-Gm-Message-State: APjAAAXM6da/4Etb1iSGy+Er+FIbAmRTYg+unHt4R8HYweigSoA2Qs74
 6duiROjBSTK1PRnCj2abZ/M=
X-Google-Smtp-Source: APXvYqwTb+6t99vmQH3iQttgGiopbKJ92e1WabIoG/JiwFJ61DaC2tawmiw81YDXtJmNSG9zjh6Nnw==
X-Received: by 2002:a05:6512:4db:: with SMTP id w27mr895831lfq.4.1574107534975; 
 Mon, 18 Nov 2019 12:05:34 -0800 (PST)
Received: from localhost.localdomain (79-139-233-37.dynamic.spd-mgts.ru.
 [79.139.233.37])
 by smtp.gmail.com with ESMTPSA id j23sm9166942lji.41.2019.11.18.12.05.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Nov 2019 12:05:34 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v1 05/29] dt-bindings: memory: tegra124: mc: Document new
 interconnect property
Date: Mon, 18 Nov 2019 23:02:23 +0300
Message-Id: <20191118200247.3567-6-digetx@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191118200247.3567-1-digetx@gmail.com>
References: <20191118200247.3567-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 19 Nov 2019 08:04:07 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=micXsJQgXBCNNJcKoZJTQ5HIZ0M5FUK3UrWoG3KSyWo=;
 b=rrVfi5v2JRE5SJXHPGiSfi6I6jin/l9B/rf4X0kWlViljiZGz+LWP/0ECjy2YGt2Ly
 H/qRg2521GJkwgtpvApOD5aA7+DBwPWsifAzGVha+jXC143rC5gQLR6jUJ54cWKsePel
 uv1TjMi/1ZiuGlvwBXSwxK89SV9WxRJoC2qLxlJpL1hpk3wd9mEQKoWOUsxGpeTF8y9p
 9bSc8VsKBip5qLTPIkaLaW/w7hnUZEXyxCP+yfEc9oFSgqF1y8cbOxJENorysq10GLcz
 ck9Y8swJz86xZjgEW5OGTmiSuS4KYRXAYxWg5bcRHsIojz5ciUvmrY1ZlkrrAMMWG+Rz
 Yu0Q==
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

TWVtb3J5IGNvbnRyb2xsZXIgaXMgaW50ZXJjb25uZWN0ZWQgd2l0aCBtZW1vcnkgY2xpZW50cyBh
bmQgd2l0aCB0aGUKZXh0ZXJuYWwgbWVtb3J5IGNvbnRyb2xsZXIuIERvY3VtZW50IG5ldyBpbnRl
cmNvbm5lY3QgcHJvcGVydHkgd2hpY2gKZGVzaWduYXRlcyBtZW1vcnkgY29udHJvbGxlciBhcyBp
bnRlcmNvbm5lY3QgcHJvdmlkZXIuCgpTaWduZWQtb2ZmLWJ5OiBEbWl0cnkgT3NpcGVua28gPGRp
Z2V0eEBnbWFpbC5jb20+Ci0tLQogLi4uL2JpbmRpbmdzL21lbW9yeS1jb250cm9sbGVycy9udmlk
aWEsdGVncmExMjQtbWMueWFtbCAgICAgIHwgNSArKysrKwogMSBmaWxlIGNoYW5nZWQsIDUgaW5z
ZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9tZW1vcnktY29udHJvbGxlcnMvbnZpZGlhLHRlZ3JhMTI0LW1jLnlhbWwgYi9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVtb3J5LWNvbnRyb2xsZXJzL252aWRpYSx0ZWdyYTEy
NC1tYy55YW1sCmluZGV4IDMwZDlmYjE5M2Q3Zi4uYjNhYTNlNmI3MDA2IDEwMDY0NAotLS0gYS9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVtb3J5LWNvbnRyb2xsZXJzL252aWRp
YSx0ZWdyYTEyNC1tYy55YW1sCisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9tZW1vcnktY29udHJvbGxlcnMvbnZpZGlhLHRlZ3JhMTI0LW1jLnlhbWwKQEAgLTQwLDYgKzQw
LDkgQEAgcHJvcGVydGllczoKICAgIiNpb21tdS1jZWxscyI6CiAgICAgY29uc3Q6IDEKIAorICAi
I2ludGVyY29ubmVjdC1jZWxscyI6CisgICAgY29uc3Q6IDEKKwogcGF0dGVyblByb3BlcnRpZXM6
CiAgICJeZW1jLXRpbWluZ3MtWzAtOV0rJCI6CiAgICAgdHlwZTogb2JqZWN0CkBAIC0xMDQsNiAr
MTA3LDcgQEAgcmVxdWlyZWQ6CiAgIC0gY2xvY2stbmFtZXMKICAgLSAiI3Jlc2V0LWNlbGxzIgog
ICAtICIjaW9tbXUtY2VsbHMiCisgIC0gIiNpbnRlcmNvbm5lY3QtY2VsbHMiCiAKIGFkZGl0aW9u
YWxQcm9wZXJ0aWVzOiBmYWxzZQogCkBAIC0xMTksNiArMTIzLDcgQEAgZXhhbXBsZXM6CiAKICAg
ICAgICAgI2lvbW11LWNlbGxzID0gPDE+OwogICAgICAgICAjcmVzZXQtY2VsbHMgPSA8MT47Cisg
ICAgICAgICNpbnRlcmNvbm5lY3QtY2VsbHMgPSA8MT47CiAKICAgICAgICAgZW1jLXRpbWluZ3Mt
MyB7CiAgICAgICAgICAgICBudmlkaWEscmFtLWNvZGUgPSA8Mz47Ci0tIAoyLjIzLjAKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
