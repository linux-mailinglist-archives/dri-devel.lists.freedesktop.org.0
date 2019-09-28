Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E19DC1932
	for <lists+dri-devel@lfdr.de>; Sun, 29 Sep 2019 21:47:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EB886E31E;
	Sun, 29 Sep 2019 19:47:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C2716E0DA;
 Sat, 28 Sep 2019 09:07:37 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id i30so4728152pgl.0;
 Sat, 28 Sep 2019 02:07:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=zxhtropV4cqrvR/Qtgxblo/g2bg2w3CWnLrP6tMU0YE=;
 b=qVf4u2NIt7w+fPSqepOl/R1lYfBwRTmGjHOf4NMghC+rDulWUHvaG25DGqRhAS37f8
 TEch6876V6IONLWjDGkpoyd/Aj9FhYQnF9uerCLNk6lMyNSIHuXNnK3VeiGkjTrZccGm
 yAMnxS7uch5CsMjBzFvZcYSHWIM13pL7zl3lGeMtcOYKwUmx2WdZBkXsl/7tu3kT0fwj
 qTUGWDZNFojL4nIr2fOkuNTnSfEeFc31WHYQAeSCsdOFg73e+8gJ1GokPls/BuVJPT1P
 gLRWwAq2szG7z2nUUwzH2Kun0aiswVrPKP1/CNoy7eo5pq1bxDkfDlyvmh9ji8+eBrPe
 SdOA==
X-Gm-Message-State: APjAAAW6jok99K5c1dv6yCcVrh+cnmXBFYWlnZmjfRTQTTAc/RR4NqPr
 eZ2HcyyIZSjWAYJdKKyUlUw=
X-Google-Smtp-Source: APXvYqyjleLFisxCMXhljNopWhR2oO09nKqDFY8LV9PXfX0/5r5ZKezYY4BO0wS/rIA/JIVeJlsQwQ==
X-Received: by 2002:a17:90a:c214:: with SMTP id e20mr35973pjt.81.1569661656811; 
 Sat, 28 Sep 2019 02:07:36 -0700 (PDT)
Received: from saurav ([219.91.254.49])
 by smtp.gmail.com with ESMTPSA id e1sm6808223pgd.21.2019.09.28.02.07.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Sep 2019 02:07:36 -0700 (PDT)
Date: Sat, 28 Sep 2019 14:37:29 +0530
From: Saurav Girepunje <saurav.girepunje@gmail.com>
To: alexander.deucher@amd.com;, christian.koenig@amd.com;,
 David1.Zhou@amd.com;, airlied@linux.ie;, daniel@ffwll.ch;,
 saurav.girepunje@gmail.com;, sam@ravnborg.org;,
 michel.daenzer@amd.com;, amd-gfx@lists.freedesktop.org;,
 dri-devel@lists.freedesktop.org;, linux-kernel@vger.kernel.org;,
 gregkh@linuxfoundation.org
Subject: [PATCH] gpu: drm: amd: amdgpu: Remove call to memset after
 dma_alloc_coherent
Message-ID: <20190928090725.GA11659@saurav>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Sun, 29 Sep 2019 19:47:08 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition
 :user-agent;
 bh=zxhtropV4cqrvR/Qtgxblo/g2bg2w3CWnLrP6tMU0YE=;
 b=Q5y3ZR2SmsfGoiS8Jk4boxoE/zixrTMo93JvHlqDFpZ0ruAkRoHSRHI4vRXwIqamlT
 jrnRfNn2W6uDw+5TOL4FWS652PCo4tt3lBwnDt0OUsaWgmDhCCwlt8NL151nDyuhmMg2
 ZbD5q0Hzz8MzT/HJ/GxbFAoMFK1Wfr/srgKWi0R90doD/TYaPEwLZhFDD2Y6svRenanW
 XwrgzEcJdZjLPNSHl7Vn4Yn1FfnWgHFejULVujf6SZtzQXtxZzqL+qJskym9XPvmXrM1
 Rlc3n37i2GOuG4gGyiRGTFgzmQCj21D2jYeaZx4Tua2Wsb6qOpOCpKKxJmQgJkiOn14K
 ZRIg==
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
Cc: saurav.girepunje@hotmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ZG1hX2FsbG9jX2NvaGVyZW50IGhhcyBhbHJlYWR5IHplcm9lZCB0aGUgbWVtb3J5LgpTbyBtZW1z
ZXQgaXMgbm90IG5lZWRlZC4KClNpZ25lZC1vZmYtYnk6IFNhdXJhdiBHaXJlcHVuamUgPHNhdXJh
di5naXJlcHVuamVAZ21haWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9paC5jIHwgMSAtCiAxIGZpbGUgY2hhbmdlZCwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9paC5jIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2loLmMKaW5kZXggNmQ4ZjA1NTExYWJhLi4xMTFhMzAxY2U4
NzggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9paC5jCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9paC5jCkBAIC02Niw3ICs2Niw2
IEBAIGludCBhbWRncHVfaWhfcmluZ19pbml0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LCBz
dHJ1Y3QgYW1kZ3B1X2loX3JpbmcgKmloLAogCQlpZiAoaWgtPnJpbmcgPT0gTlVMTCkKIAkJCXJl
dHVybiAtRU5PTUVNOwogCi0JCW1lbXNldCgodm9pZCAqKWloLT5yaW5nLCAwLCBpaC0+cmluZ19z
aXplICsgOCk7CiAJCWloLT5ncHVfYWRkciA9IGRtYV9hZGRyOwogCQlpaC0+d3B0cl9hZGRyID0g
ZG1hX2FkZHIgKyBpaC0+cmluZ19zaXplOwogCQlpaC0+d3B0cl9jcHUgPSAmaWgtPnJpbmdbaWgt
PnJpbmdfc2l6ZSAvIDRdOwotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
