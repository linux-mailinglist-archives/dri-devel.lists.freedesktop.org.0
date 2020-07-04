Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A6C47215308
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jul 2020 09:19:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C71C06E265;
	Mon,  6 Jul 2020 07:19:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5B8F6E418
 for <dri-devel@lists.freedesktop.org>; Sat,  4 Jul 2020 10:25:56 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id z15so24036551wrl.8
 for <dri-devel@lists.freedesktop.org>; Sat, 04 Jul 2020 03:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ljYbPfikKidTyz4vCaRd3InFHHUQa8/wBp/13AuL7tw=;
 b=OtcohPOvXt2wkLQ8Gr+W1KKjsQooO/5qB9Qw8JWG4RNqLiqDxo/9dseNe3YnuskVz1
 s7+RSXF88YSx0S6+WZ8nxtvazmNCAcDUDipl+5YPKdkS0Sj+UxAu+3DwQ69w7IWJNq/e
 OEn29d41euiV7DUJLQ+IsPKmiIoZaugWLz0hax5yM9jQ2D5MD9QIbuyu6fhXI3OLFifN
 A3oxh7V5aXwUq4ERKGIgHYaqepYNQSO+ryAMrM3CqymMBsQVRYGPBQ6PElR5bge+l0c9
 +IDp464kLvagcPqwbTfP8MgY1W0ukcv19uHRk6Ya1lgRMXDV2XEaIfsvW39GtXFdUhOY
 021A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ljYbPfikKidTyz4vCaRd3InFHHUQa8/wBp/13AuL7tw=;
 b=K50OIxu5xkujjMxNQV06oQfyTRsk9STcYvPhL/6dAtm76uzQiI0IGbxphpQ9SQGoFy
 We0aDT0Vb+HXf0hf4ca/gOlU3ij3z3hILFSXgGlkyroyE/47Ni1dA+U1cWU/5k1qpYKu
 6h7N485Jw/T6VzzEHVu8uUQfua8PVofC4m3QwfCCa2SjpTRzP0j29KFiRFlipYr6e+Nr
 WVYbapTjntNucvbOwSVKeFgaFg45ZD1h8CnY+CAsE4dL/RrP4J1MqnAfOn8Rlvu1YeFC
 CjBl5Zp1QwYmxAUxYuLcASb3Gkl5dHaCrhEjfG9AXTO60T51AsFj/xIxTaxuwHoedcLn
 2ptA==
X-Gm-Message-State: AOAM533tSFI0BKQInVsHWgEme+fRcGdtv23y5ExotqPxro7eE+Vgtpc4
 JSBzoakuZ/nZMKLjQPL7ZkE=
X-Google-Smtp-Source: ABdhPJyzbanNd720c5+6eFrmSAieB5pdrwV6bL2dAq30zpazgrsKSLmIJk9Tt8TYJ1H6eSrfY76sgw==
X-Received: by 2002:adf:f34e:: with SMTP id e14mr40085606wrp.299.1593858355499; 
 Sat, 04 Jul 2020 03:25:55 -0700 (PDT)
Received: from clement-Latitude-7490.numericable.fr
 (213-245-241-245.rev.numericable.fr. [213.245.241.245])
 by smtp.gmail.com with ESMTPSA id g14sm16421428wrm.93.2020.07.04.03.25.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jul 2020 03:25:54 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Rob Herring <robh@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH v2 12/14] arm64: dts: allwinner: h6: Add cooling map for GPU
Date: Sat,  4 Jul 2020 12:25:33 +0200
Message-Id: <20200704102535.189647-13-peron.clem@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200704102535.189647-1-peron.clem@gmail.com>
References: <20200704102535.189647-1-peron.clem@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 06 Jul 2020 07:19:18 +0000
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
bGx3aW5uZXIvc3VuNTBpLWg2LmR0c2kKaW5kZXggNzhiMTM2MWRmYmI5Li44ZjUxNGEyMTY5YWEg
MTAwNjQ0Ci0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvYWxsd2lubmVyL3N1bjUwaS1oNi5kdHNp
CisrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvYWxsd2lubmVyL3N1bjUwaS1oNi5kdHNpCkBAIC0x
NzQsNiArMTc0LDcgQEAgZ3B1OiBncHVAMTgwMDAwMCB7CiAJCQljbG9ja3MgPSA8JmNjdSBDTEtf
R1BVPiwgPCZjY3UgQ0xLX0JVU19HUFU+OwogCQkJY2xvY2stbmFtZXMgPSAiY29yZSIsICJidXMi
OwogCQkJcmVzZXRzID0gPCZjY3UgUlNUX0JVU19HUFU+OworCQkJI2Nvb2xpbmctY2VsbHMgPSA8
Mj47CiAJCQlzdGF0dXMgPSAiZGlzYWJsZWQiOwogCQl9OwogCkBAIC0xMDEyLDYgKzEwMTMsMjcg
QEAgZ3B1LXRoZXJtYWwgewogCQkJcG9sbGluZy1kZWxheS1wYXNzaXZlID0gPDA+OwogCQkJcG9s
bGluZy1kZWxheSA9IDwwPjsKIAkJCXRoZXJtYWwtc2Vuc29ycyA9IDwmdGhzIDE+OworCisJCQl0
cmlwcyB7CisJCQkJZ3B1X2FsZXJ0OiBncHUtYWxlcnQgeworCQkJCQl0ZW1wZXJhdHVyZSA9IDw4
NTAwMD47CisJCQkJCWh5c3RlcmVzaXMgPSA8MjAwMD47CisJCQkJCXR5cGUgPSAicGFzc2l2ZSI7
CisJCQkJfTsKKworCQkJCWdwdS1jcml0IHsKKwkJCQkJdGVtcGVyYXR1cmUgPSA8MTAwMDAwPjsK
KwkJCQkJaHlzdGVyZXNpcyA9IDwwPjsKKwkJCQkJdHlwZSA9ICJjcml0aWNhbCI7CisJCQkJfTsK
KwkJCX07CisKKwkJCWNvb2xpbmctbWFwcyB7CisJCQkJbWFwMCB7CisJCQkJCXRyaXAgPSA8Jmdw
dV9hbGVydD47CisJCQkJCWNvb2xpbmctZGV2aWNlID0gPCZncHUgVEhFUk1BTF9OT19MSU1JVCBU
SEVSTUFMX05PX0xJTUlUPjsKKwkJCQl9OworCQkJfTsKIAkJfTsKIAl9OwogfTsKLS0gCjIuMjUu
MQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
