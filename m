Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD68621B0AA
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jul 2020 09:53:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E0576EB8B;
	Fri, 10 Jul 2020 07:53:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C347C6EA77
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jul 2020 14:03:43 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id z2so2517822wrp.2
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Jul 2020 07:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XV7x1Z5zj5Wjg3tK4n9i9paBzVB6Q8ndZsAB3QS+Wh0=;
 b=mLDmywv4Oyl2j8kyqhXiSFxSLl7dO8X7KPFt0TbHLtP1ytCVznMnWvtOeGZIR7L+zR
 dfwYDG8Mu8a0wSLIvXqov/CJ2EP+wNQZQiBeuM/z2BtdzBZOMDUb6hBLJENFWPjUN2GX
 473RKK8BMpuQQJFVYWuPWIlube2JOBKsWOUUNERU5pbipiYMvChMD0UBBXvwlkwoCMwx
 DA3i2d6imdqMm/SrOPB3LDr02ElCh2s3gPwb/f1hd8DSKy7Xrnb0vXCBEwI5iawBJ0D+
 H7c/RkG76Uaak00eC1cC5+yvlcS9wpI9N/wzordOFkOLbpuu/wmfK0M0kUi/sTVdvdjX
 04pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XV7x1Z5zj5Wjg3tK4n9i9paBzVB6Q8ndZsAB3QS+Wh0=;
 b=eI8aN+UKRDSJEzX+ahC5bSNguv4UKLi/mrYmLMgLILoA35Hx4HwcEjukTFTpQX5PBO
 qZ96tCBKC1V7WOy9911NntZZ4MzqCXiqIxxK0G2+g5MhtcbT91r6NMR5bqZ9eVezo+YP
 EdPq6si4DID0waHtH3EOXRy5B0We/FhUgg26+QIW7q0XgOWKdOyzCbMD8Iz4cEG5+Q+z
 kwny7Edh/f9LtiCGiakgU/bNJfex5vlfQd671H+Rx+0Brzt765no4TnJAbzEENYKq9n1
 Wrv4wj3twhvkw9N50pGFS7vD7ZQ904Snn/4Lpw613oBBXe6GtFCrHTIRwKYCBXDCYq1e
 qiqA==
X-Gm-Message-State: AOAM530rIVle6pMPhj8OaNhpsQy7Snr2Z3xBOfl6liB+h854zVJyej01
 YdqCCwesNBef65B+m1A3HTQ=
X-Google-Smtp-Source: ABdhPJwXj+/UHrYQECUcRL7M8ks0AHImGxyCFdxtiqE3Z46FlmksIb9RhYX2U7P1Wi4nWCRJsLa0xQ==
X-Received: by 2002:adf:91e1:: with SMTP id 88mr56447637wri.89.1594303422255; 
 Thu, 09 Jul 2020 07:03:42 -0700 (PDT)
Received: from clement-Latitude-7490.numericable.fr
 (213-245-241-245.rev.numericable.fr. [213.245.241.245])
 by smtp.gmail.com with ESMTPSA id s8sm5545256wru.38.2020.07.09.07.03.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jul 2020 07:03:41 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Rob Herring <robh@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH v3 13/14] [DO NOT MERGE] arm64: dts: allwinner: h6: Add GPU
 OPP table
Date: Thu,  9 Jul 2020 16:03:21 +0200
Message-Id: <20200709140322.131320-14-peron.clem@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200709140322.131320-1-peron.clem@gmail.com>
References: <20200709140322.131320-1-peron.clem@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 10 Jul 2020 07:52:58 +0000
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
Cc: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIGFuIE9wZXJhdGluZyBQZXJmb3JtYW5jZSBQb2ludHMgdGFibGUgZm9yIHRoZSBHUFUgdG8K
ZW5hYmxlIER5bmFtaWMgVm9sdGFnZSAmIEZyZXF1ZW5jeSBTY2FsaW5nIG9uIHRoZSBINi4KClRo
ZSB2b2x0YWdlIHJhbmdlIGlzIHNldCB3aXRoIG1pbml2YWwgdm9sdGFnZSBzZXQgdG8gdGhlIHRh
cmdldAphbmQgdGhlIG1heGltYWwgdm9sdGFnZSBzZXQgdG8gMS4yVi4gVGhpcyBhbGxvdyBEVkZT
IGZyYW1ld29yayB0bwp3b3JrIHByb3Blcmx5IG9uIGJvYXJkIHdpdGggZml4ZWQgcmVndWxhdG9y
LgoKU2lnbmVkLW9mZi1ieTogQ2zDqW1lbnQgUMOpcm9uIDxwZXJvbi5jbGVtQGdtYWlsLmNvbT4K
LS0tCiBhcmNoL2FybTY0L2Jvb3QvZHRzL2FsbHdpbm5lci9zdW41MGktaDYuZHRzaSB8IDgwICsr
KysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgODAgaW5zZXJ0aW9ucygrKQoKZGlm
ZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvYWxsd2lubmVyL3N1bjUwaS1oNi5kdHNpIGIv
YXJjaC9hcm02NC9ib290L2R0cy9hbGx3aW5uZXIvc3VuNTBpLWg2LmR0c2kKaW5kZXggOGY1MTRh
MjE2OWFhLi5hNjlmOWUwOWE4MjkgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvYWxs
d2lubmVyL3N1bjUwaS1oNi5kdHNpCisrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvYWxsd2lubmVy
L3N1bjUwaS1oNi5kdHNpCkBAIC0xNzQsNiArMTc0LDcgQEAgZ3B1OiBncHVAMTgwMDAwMCB7CiAJ
CQljbG9ja3MgPSA8JmNjdSBDTEtfR1BVPiwgPCZjY3UgQ0xLX0JVU19HUFU+OwogCQkJY2xvY2st
bmFtZXMgPSAiY29yZSIsICJidXMiOwogCQkJcmVzZXRzID0gPCZjY3UgUlNUX0JVU19HUFU+Owor
CQkJb3BlcmF0aW5nLXBvaW50cy12MiA9IDwmZ3B1X29wcF90YWJsZT47CiAJCQkjY29vbGluZy1j
ZWxscyA9IDwyPjsKIAkJCXN0YXR1cyA9ICJkaXNhYmxlZCI7CiAJCX07CkBAIC0xMDM2LDQgKzEw
MzcsODMgQEAgbWFwMCB7CiAJCQl9OwogCQl9OwogCX07CisKKwlncHVfb3BwX3RhYmxlOiBncHUt
b3BwLXRhYmxlIHsKKwkJY29tcGF0aWJsZSA9ICJvcGVyYXRpbmctcG9pbnRzLXYyIjsKKworCQlv
cHBAMjE2MDAwMDAwIHsKKwkJCW9wcC1oeiA9IC9iaXRzLyA2NCA8MjE2MDAwMDAwPjsKKwkJCW9w
cC1taWNyb3ZvbHQgPSA8ODEwMDAwIDgxMDAwMCAxMjAwMDAwPjsKKwkJfTsKKworCQlvcHBAMjY0
MDAwMDAwIHsKKwkJCW9wcC1oeiA9IC9iaXRzLyA2NCA8MjY0MDAwMDAwPjsKKwkJCW9wcC1taWNy
b3ZvbHQgPSA8ODEwMDAwIDgxMDAwMCAxMjAwMDAwPjsKKwkJfTsKKworCQlvcHBAMzEyMDAwMDAw
IHsKKwkJCW9wcC1oeiA9IC9iaXRzLyA2NCA8MzEyMDAwMDAwPjsKKwkJCW9wcC1taWNyb3ZvbHQg
PSA8ODEwMDAwIDgxMDAwMCAxMjAwMDAwPjsKKwkJfTsKKworCQlvcHBAMzM2MDAwMDAwIHsKKwkJ
CW9wcC1oeiA9IC9iaXRzLyA2NCA8MzM2MDAwMDAwPjsKKwkJCW9wcC1taWNyb3ZvbHQgPSA8ODEw
MDAwIDgxMDAwMCAxMjAwMDAwPjsKKwkJfTsKKworCQlvcHBAMzYwMDAwMDAwIHsKKwkJCW9wcC1o
eiA9IC9iaXRzLyA2NCA8MzYwMDAwMDAwPjsKKwkJCW9wcC1taWNyb3ZvbHQgPSA8ODIwMDAwIDgy
MDAwMCAxMjAwMDAwPjsKKwkJfTsKKworCQlvcHBAMzg0MDAwMDAwIHsKKwkJCW9wcC1oeiA9IC9i
aXRzLyA2NCA8Mzg0MDAwMDAwPjsKKwkJCW9wcC1taWNyb3ZvbHQgPSA8ODMwMDAwIDgzMDAwMCAx
MjAwMDAwPjsKKwkJfTsKKworCQlvcHBANDA4MDAwMDAwIHsKKwkJCW9wcC1oeiA9IC9iaXRzLyA2
NCA8NDA4MDAwMDAwPjsKKwkJCW9wcC1taWNyb3ZvbHQgPSA8ODQwMDAwIDg0MDAwMCAxMjAwMDAw
PjsKKwkJfTsKKworCQlvcHBANDIwMDAwMDAwIHsKKwkJCW9wcC1oeiA9IC9iaXRzLyA2NCA8NDIw
MDAwMDAwPjsKKwkJCW9wcC1taWNyb3ZvbHQgPSA8ODUwMDAwIDg1MDAwMCAxMjAwMDAwPjsKKwkJ
fTsKKworCQlvcHBANDMyMDAwMDAwIHsKKwkJCW9wcC1oeiA9IC9iaXRzLyA2NCA8NDMyMDAwMDAw
PjsKKwkJCW9wcC1taWNyb3ZvbHQgPSA8ODYwMDAwIDg2MDAwMCAxMjAwMDAwPjsKKwkJfTsKKwor
CQlvcHBANDU2MDAwMDAwIHsKKwkJCW9wcC1oeiA9IC9iaXRzLyA2NCA8NDU2MDAwMDAwPjsKKwkJ
CW9wcC1taWNyb3ZvbHQgPSA8ODcwMDAwIDg3MDAwMCAxMjAwMDAwPjsKKwkJfTsKKworCQlvcHBA
NTA0MDAwMDAwIHsKKwkJCW9wcC1oeiA9IC9iaXRzLyA2NCA8NTA0MDAwMDAwPjsKKwkJCW9wcC1t
aWNyb3ZvbHQgPSA8ODkwMDAwIDg5MDAwMCAxMjAwMDAwPjsKKwkJfTsKKworCQlvcHBANTQwMDAw
MDAwIHsKKwkJCW9wcC1oeiA9IC9iaXRzLyA2NCA8NTQwMDAwMDAwPjsKKwkJCW9wcC1taWNyb3Zv
bHQgPSA8OTEwMDAwIDkxMDAwMCAxMjAwMDAwPjsKKwkJfTsKKworCQlvcHBANTc2MDAwMDAwIHsK
KwkJCW9wcC1oeiA9IC9iaXRzLyA2NCA8NTc2MDAwMDAwPjsKKwkJCW9wcC1taWNyb3ZvbHQgPSA8
OTMwMDAwIDkzMDAwMCAxMjAwMDAwPjsKKwkJfTsKKworCQlvcHBANjI0MDAwMDAwIHsKKwkJCW9w
cC1oeiA9IC9iaXRzLyA2NCA8NjI0MDAwMDAwPjsKKwkJCW9wcC1taWNyb3ZvbHQgPSA8OTUwMDAw
IDk1MDAwMCAxMjAwMDAwPjsKKwkJfTsKKworCQlvcHBANzU2MDAwMDAwIHsKKwkJCW9wcC1oeiA9
IC9iaXRzLyA2NCA8NzU2MDAwMDAwPjsKKwkJCW9wcC1taWNyb3ZvbHQgPSA8MTA0MDAwMCAxMDQw
MDAwIDEyMDAwMDA+OworCQl9OworCX07CiB9OwotLSAKMi4yNS4xCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
