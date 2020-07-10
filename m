Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C73D821E8CD
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jul 2020 09:02:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D3E16E8DF;
	Tue, 14 Jul 2020 07:02:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 825AE6EBBA
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jul 2020 09:26:09 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id f18so5172509wml.3
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jul 2020 02:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gRxnrLEUrSrlK3zy1+2PoRYSjZZZ/aiOGCPYzvHmseE=;
 b=bSawlulEpd9Gvd+NXknKucPeR5epPWbrc8DgBm+CGFcpLMSZfETEbjd/QKCnqHOFto
 TCF7azngY7Kue6kkHfCNjQnihQgPSOUMOZrZA9/qLRvveZl2APcz6wY/pKuZDQU3d9HT
 v/oG/L4KTdExJ0uytXLDs3fxMv2gDEgoe5zYkPG7ibAHbG3txEl6f9askhqUG2Wf+RbB
 LTWT/SGqoJH9aRVL0/GBVRJzYjQOkVSARxe+xtw6yR7OiuOEMGjd9Xw4fM4SBp5nbheT
 FdbFnq66hrMZpT5+zwCHQEj7/zY0ozXOUkK/mAJL/lcwdx8cEZU0HYm50Bl5WrEDLhV6
 gnGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gRxnrLEUrSrlK3zy1+2PoRYSjZZZ/aiOGCPYzvHmseE=;
 b=JFO6oKAlCs1H9CEnqy6sOGtXj50b6dSxh8QOVEeSoD5UG+XR3XQ+vs8hAChRMdfNgl
 shgI4lWnIrAD4r9rJJ1bGMmfJQE1DiLyNHXxlnyCuJx6mu1bgPNIVdSTuYM41d1rSZJ+
 xVIn0AuXC9hw7VO6HePmVrLMFy8wplqf0rppC1WbI4JPezHLq7x6FcMQIqBO6s/JUIql
 lDkHxkY2hH9/jtvIXQ1DOZquiOxjr48nG9I3Hfp8EkHdtL6in05YJBFePdl/oIR4a9Fl
 jnEjnx0qfqvEcL88Hkuv9DJaWon2lDKJVMCxLIsOJoDIcWkni6tHoXN7gsfFn0UoIfAu
 nG/Q==
X-Gm-Message-State: AOAM533l0y0Tna2ePJlI/DGyrzMmjbq1Sv/EJaK//Lw0t471FNG+RJml
 JqoX3GSzBwe0d5ULrVBT/fs=
X-Google-Smtp-Source: ABdhPJzK2+qhw5quxWJfN44dQFlBu1dD9VH3B/Tx16GZDKFQPlmPAM1LR4v85GhCEQ96wokmZWS/oA==
X-Received: by 2002:a1c:2805:: with SMTP id o5mr4337815wmo.25.1594373168118;
 Fri, 10 Jul 2020 02:26:08 -0700 (PDT)
Received: from clement-Latitude-7490.numericable.fr
 (213-245-241-245.rev.numericable.fr. [213.245.241.245])
 by smtp.gmail.com with ESMTPSA id h23sm8179559wmb.3.2020.07.10.02.26.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2020 02:26:07 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Rob Herring <robh@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH v4 13/14] [DO NOT MERGE] arm64: dts: allwinner: h6: Add GPU
 OPP table
Date: Fri, 10 Jul 2020 11:25:47 +0200
Message-Id: <20200710092548.316054-14-peron.clem@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200710092548.316054-1-peron.clem@gmail.com>
References: <20200710092548.316054-1-peron.clem@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 14 Jul 2020 07:02:08 +0000
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
YXJjaC9hcm02NC9ib290L2R0cy9hbGx3aW5uZXIvc3VuNTBpLWg2LmR0c2kKaW5kZXggMWM5Mzlj
NTVhYWVhLi4xNmMzYWQ4YWJkOWQgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvYWxs
d2lubmVyL3N1bjUwaS1oNi5kdHNpCisrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvYWxsd2lubmVy
L3N1bjUwaS1oNi5kdHNpCkBAIC0xNzUsNiArMTc1LDcgQEAgZ3B1OiBncHVAMTgwMDAwMCB7CiAJ
CQljbG9ja3MgPSA8JmNjdSBDTEtfR1BVPiwgPCZjY3UgQ0xLX0JVU19HUFU+OwogCQkJY2xvY2st
bmFtZXMgPSAiY29yZSIsICJidXMiOwogCQkJcmVzZXRzID0gPCZjY3UgUlNUX0JVU19HUFU+Owor
CQkJb3BlcmF0aW5nLXBvaW50cy12MiA9IDwmZ3B1X29wcF90YWJsZT47CiAJCQkjY29vbGluZy1j
ZWxscyA9IDwyPjsKIAkJCXN0YXR1cyA9ICJkaXNhYmxlZCI7CiAJCX07CkBAIC0xMDM3LDQgKzEw
MzgsODMgQEAgbWFwMCB7CiAJCQl9OwogCQl9OwogCX07CisKKwlncHVfb3BwX3RhYmxlOiBncHUt
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
