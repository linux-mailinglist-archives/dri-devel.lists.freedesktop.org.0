Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DC72D6307
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2019 14:51:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A7566E2C7;
	Mon, 14 Oct 2019 12:51:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7BF96E2B2
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2019 12:51:05 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id o18so19546427wrv.13
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2019 05:51:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hANW8n51/2TerGmbLCgZv/CuSuRXQd643gepZFK9hnc=;
 b=RfJAhGIBb9zYZRc9pKD4+6tjJduH4ON/y4nBavFKmSzBuI/6fB8cO3FFFfYb9NlUCl
 ARNJGBMTzfpG1vUt11bdcCjDPSPd6s6UMmRPgbghlPDDU8DiTRuU8PtavgcTj+ILOkp0
 rZNKIIV/Myl94nY+7LGp/42TrKRIhfaIix1SmKFdCEMnZ/z9cNoKZpu8j1s3xK7kCgak
 QvJ3b/zqbxoT1wjOfrbTSFkofP9DqNmwzA21EdaO0hXG+4gbJ/ucQVTcxe0yeOkLGuDc
 fkB9GVUt2OS8dbpLnNRtZ3p5mJ/sTfmjRNXBuzthNPZnj9foJD/x8DemSzr5tmBvFswJ
 cv3A==
X-Gm-Message-State: APjAAAW1b6tfJaFLX6gxRouuHuOR2VjYGrF0JSszdnaKxi9xKYv3TYx2
 HRNkptKRdUmJQyJ3ynnN27GrVbYu
X-Google-Smtp-Source: APXvYqybmot/4ZJNgw6ylAiNa+i9nfpB1OEZUQ+aZJOVklE7DDa43GuKJsTwPpS6ZdV8c+Sq1irO7Q==
X-Received: by 2002:adf:e705:: with SMTP id c5mr24803233wrm.375.1571057464290; 
 Mon, 14 Oct 2019 05:51:04 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
 by smtp.gmail.com with ESMTPSA id n18sm15138096wmi.20.2019.10.14.05.51.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Oct 2019 05:51:03 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 06/14] drm/tegra: Use DRM_DEBUG_DRIVER for driver messages
Date: Mon, 14 Oct 2019 14:50:41 +0200
Message-Id: <20191014125049.425101-7-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191014125049.425101-1-thierry.reding@gmail.com>
References: <20191014125049.425101-1-thierry.reding@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hANW8n51/2TerGmbLCgZv/CuSuRXQd643gepZFK9hnc=;
 b=FH9GU5LIfYrvKMM0VQueVtxsk2INkBq+qpUi/rO8dShCffTYMsqbyIsBc0RZYEFlQa
 S2PL1z4hHISnNlRIeTHqfdHwzlR2DLrKWQ4CjBiqrSinZ+jHc0DTXjSjFKYQe2kYxA6b
 UAgfZHe6cKBwp3ZoketphiL8GAL6MrZgOWOPE+lrOa3gYgw1MSli3+czinyu9UE+tdiI
 Lm6xyR1KCsKAphTiq78PcI5DKXCdn7ImtaRiq5Na4yJOenpszLme6hcCq0ftlh4FdgWP
 gYNRHFn1ZwwcE6JtneCyAhE2YcSBqT9Yk5+yuywj5PYO8nsUBi2pU7ZKupMHBzxAwZjn
 ey4A==
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KClRoZSBkcml2ZXItc3Bl
Y2lmaWMgbWVzc2FnZXMgc2hvdWxkIHVzZSB0aGUgRFJNX1VUX0RSSVZFUiBjYXRlZ29yeSBzbwp0
aGF0IHRoZXkgY2FuIGJlIHByb3Blcmx5IGZpbHRlcmVkLgoKU2lnbmVkLW9mZi1ieTogVGhpZXJy
eSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vdGVncmEv
ZHJtLmMgfCA4ICsrKystLS0tCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS90ZWdyYS9kcm0uYyBiL2Ry
aXZlcnMvZ3B1L2RybS90ZWdyYS9kcm0uYwppbmRleCBiYzdjYzMyMTQwZjguLjQ5OGQyMmE2NTYx
NiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2RybS5jCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS90ZWdyYS9kcm0uYwpAQCAtMTYzLDEwICsxNjMsMTAgQEAgc3RhdGljIGludCB0ZWdy
YV9kcm1fbG9hZChzdHJ1Y3QgZHJtX2RldmljZSAqZHJtLCB1bnNpZ25lZCBsb25nIGZsYWdzKQog
CQlkcm1fbW1faW5pdCgmdGVncmEtPm1tLCBnZW1fc3RhcnQsIGdlbV9lbmQgLSBnZW1fc3RhcnQg
KyAxKTsKIAkJbXV0ZXhfaW5pdCgmdGVncmEtPm1tX2xvY2spOwogCi0JCURSTV9ERUJVRygiSU9N
TVUgYXBlcnR1cmVzOlxuIik7Ci0JCURSTV9ERUJVRygiICBHRU06ICUjbGx4LSUjbGx4XG4iLCBn
ZW1fc3RhcnQsIGdlbV9lbmQpOwotCQlEUk1fREVCVUcoIiAgQ2FydmVvdXQ6ICUjbGx4LSUjbGx4
XG4iLCBjYXJ2ZW91dF9zdGFydCwKLQkJCSAgY2FydmVvdXRfZW5kKTsKKwkJRFJNX0RFQlVHX0RS
SVZFUigiSU9NTVUgYXBlcnR1cmVzOlxuIik7CisJCURSTV9ERUJVR19EUklWRVIoIiAgR0VNOiAl
I2xseC0lI2xseFxuIiwgZ2VtX3N0YXJ0LCBnZW1fZW5kKTsKKwkJRFJNX0RFQlVHX0RSSVZFUigi
ICBDYXJ2ZW91dDogJSNsbHgtJSNsbHhcbiIsIGNhcnZlb3V0X3N0YXJ0LAorCQkJCSBjYXJ2ZW91
dF9lbmQpOwogCX0KIAogCWlmICh0ZWdyYS0+aHViKSB7Ci0tIAoyLjIzLjAKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
