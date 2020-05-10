Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 25C731CD266
	for <lists+dri-devel@lfdr.de>; Mon, 11 May 2020 09:18:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A1C96E266;
	Mon, 11 May 2020 07:18:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F7E389FDB
 for <dri-devel@lists.freedesktop.org>; Sun, 10 May 2020 16:55:57 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id x17so7960589wrt.5
 for <dri-devel@lists.freedesktop.org>; Sun, 10 May 2020 09:55:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=msywohSuGh6swONibcP6F+70WAKAL/uMsF9k7te5F+k=;
 b=hkGNQyc/x4KmNhR09Y2373rMJ+tldHIgVAtQ5VwfCBsP8haDn+N554iEOj/zvNyHXG
 2apeoK0tQG+mCZe97atPSgr5GjCqVes/Vgfs61/9MXW6B0/NaycoQm9quf+iHnLJpxfn
 EdOP0OBpcI+8rSXiKPOUWE1n30U81mOmraEgodeYJpyKJu38h+3/GKIkcd+Szc6UV9qd
 NQf0r9ZCLRFpAZHtAhEpxwT/l5YlSSP94UTc2Z/IWWgFz2c4CA1+Z3ZT+t/8dGPIe+ac
 33uMRKEFmjB204J9WZxdHkaJp9PZ0z38gHVu99IcR/xD1X804ASAGwRe1OlbaHnF1ljh
 H3QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=msywohSuGh6swONibcP6F+70WAKAL/uMsF9k7te5F+k=;
 b=hYZhE3BB2/Q6sP34qIyedoMSuYDyAsUv/NX3ynSfRDAJZtXgcC+/THPIe0g5rtO/r0
 Th0UUOdAUJSX5dvY8YgbHIhLrLHhmHAPRKQqTsZ3msP4r2BILMO8BEYgj2iK3ntw5Kpj
 Q84Aknmvr/IUGC8LOrKsJ0NjgYihDDOk5pE+fq6ly1SSv/5d7CqTF3oJkudma7/bHJOl
 R2+ixc0Xpja8yFByFHnWwBeEAIusK3E8M9/uysFdFgZ/LjpsER0LQGORJaJSE/ZugGbL
 03bX4Dpy3E+2MSGEyyczZbdGWTIzWFqVQ8mCVfGIVB6I61Dfb8NohKY2Ukdmln2RPHYW
 to2g==
X-Gm-Message-State: AGi0PublHjP50NDPMDWVtgoOCgaQjyxjneqzjhffqAPHILki/JjHR2Gy
 WwVBeEdM9qZeAzJvqwma+wo=
X-Google-Smtp-Source: APiQypJQLiGZ3inhyarOnjxz5H8I+2somPxs9/69ewsW1D9UgAjT/OiP3usqGH5auhmMYmhn3EFEJA==
X-Received: by 2002:a5d:69c3:: with SMTP id s3mr13817785wrw.305.1589129756050; 
 Sun, 10 May 2020 09:55:56 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:1f1:d0f0:1cc8:b1f1:a2b8:a1ee])
 by smtp.gmail.com with ESMTPSA id
 g15sm13637670wrp.96.2020.05.10.09.55.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 May 2020 09:55:55 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Rob Herring <robh@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH 13/15] arm64: dts: allwinner: h6: Add cooling map for GPU
Date: Sun, 10 May 2020 18:55:36 +0200
Message-Id: <20200510165538.19720-14-peron.clem@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200510165538.19720-1-peron.clem@gmail.com>
References: <20200510165538.19720-1-peron.clem@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 11 May 2020 07:17:27 +0000
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

QWRkIGEgc2ltcGxlIGNvb2xpbmcgbWFwIGZvciB0aGUgR1BVLgoKU2lnbmVkLW9mZi1ieTogQ2zD
qW1lbnQgUMOpcm9uIDxwZXJvbi5jbGVtQGdtYWlsLmNvbT4KLS0tCiBhcmNoL2FybTY0L2Jvb3Qv
ZHRzL2FsbHdpbm5lci9zdW41MGktaDYuZHRzaSB8IDIyICsrKysrKysrKysrKysrKysrKysrCiAx
IGZpbGUgY2hhbmdlZCwgMjIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQv
Ym9vdC9kdHMvYWxsd2lubmVyL3N1bjUwaS1oNi5kdHNpIGIvYXJjaC9hcm02NC9ib290L2R0cy9h
bGx3aW5uZXIvc3VuNTBpLWg2LmR0c2kKaW5kZXggMmUzMTYzMmM2Y2E4Li5iMjZmNzM1MjAxYzcg
MTAwNjQ0Ci0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvYWxsd2lubmVyL3N1bjUwaS1oNi5kdHNp
CisrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvYWxsd2lubmVyL3N1bjUwaS1oNi5kdHNpCkBAIC0x
NzMsNiArMTczLDcgQEAKIAkJCWNsb2NrcyA9IDwmY2N1IENMS19HUFU+LCA8JmNjdSBDTEtfQlVT
X0dQVT47CiAJCQljbG9jay1uYW1lcyA9ICJjb3JlIiwgImJ1cyI7CiAJCQlyZXNldHMgPSA8JmNj
dSBSU1RfQlVTX0dQVT47CisJCQkjY29vbGluZy1jZWxscyA9IDwyPjsKIAkJCXN0YXR1cyA9ICJk
aXNhYmxlZCI7CiAJCX07CiAKQEAgLTEwMDIsNiArMTAwMywyNyBAQAogCQkJcG9sbGluZy1kZWxh
eS1wYXNzaXZlID0gPDA+OwogCQkJcG9sbGluZy1kZWxheSA9IDwwPjsKIAkJCXRoZXJtYWwtc2Vu
c29ycyA9IDwmdGhzIDE+OworCisJCQl0cmlwcyB7CisJCQkJZ3B1X2FsZXJ0OiBncHUtYWxlcnQg
eworCQkJCQl0ZW1wZXJhdHVyZSA9IDw4NTAwMD47CisJCQkJCWh5c3RlcmVzaXMgPSA8MjAwMD47
CisJCQkJCXR5cGUgPSAicGFzc2l2ZSI7CisJCQkJfTsKKworCQkJCWdwdS1jcml0IHsKKwkJCQkJ
dGVtcGVyYXR1cmUgPSA8MTAwMDAwPjsKKwkJCQkJaHlzdGVyZXNpcyA9IDwwPjsKKwkJCQkJdHlw
ZSA9ICJjcml0aWNhbCI7CisJCQkJfTsKKwkJCX07CisKKwkJCWNvb2xpbmctbWFwcyB7CisJCQkJ
bWFwMCB7CisJCQkJCXRyaXAgPSA8JmdwdV9hbGVydD47CisJCQkJCWNvb2xpbmctZGV2aWNlID0g
PCZncHUgVEhFUk1BTF9OT19MSU1JVCBUSEVSTUFMX05PX0xJTUlUPjsKKwkJCQl9OworCQkJfTsK
IAkJfTsKIAl9OwogfTsKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVsCg==
