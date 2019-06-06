Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D522938539
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2019 09:44:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F8DD89A1E;
	Fri,  7 Jun 2019 07:43:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5410F89690
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2019 09:47:42 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id l26so1046970lfh.13
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jun 2019 02:47:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NsVvPiBY4yVAfgVoOW5rwqcEUi8304y5zEW51I3/QB0=;
 b=uEl6M7SWOXzqvL9thntW66WKv9aFNis/G+Ntmb6mG9R7NK5/fWwswwsF8maW9A0TZp
 N5RHLTP+TV95NrG9/IKDS0CKG65YTOVWS+Vt8h5nuLLNcAXnQDT+wh7m5W6YrDHhTi+o
 bLaelbbC0ULlom2rBQLQ7cNuYA4Fg07DbWzp9K7Z59p54EjzXBc8W62xt55kvmpVL0pb
 UOgaRHByU9fcoQFjWe1ajeQxIKZtv+JzE4qw0bpan6U9CZlwOs7K4AJ1V/EWXPVk/xQp
 e2SFSVZx74TfSmhZv6TK1x6qc57LuKsX2JEia+rBxHTw3tC+S/zMoHGNlHDUdVD85U8X
 /msw==
X-Gm-Message-State: APjAAAUtHHEETmjANFbdKvq3CXlIfX7eXPsrwTaCOuo9Hx68OHgbFlY8
 ArwLhhN1uJESgLXXFMnlEG+3aQ==
X-Google-Smtp-Source: APXvYqwC1lw0i+elxeAauVlnzExuJPoAeIohV6gRyR/H/KWYyVWxRDSoL1E/QIVDRnsweZyms/BPzA==
X-Received: by 2002:ac2:4ac5:: with SMTP id m5mr22449224lfp.95.1559814460755; 
 Thu, 06 Jun 2019 02:47:40 -0700 (PDT)
Received: from localhost (c-1c3670d5.07-21-73746f28.bbcust.telenor.se.
 [213.112.54.28])
 by smtp.gmail.com with ESMTPSA id d23sm258143ljj.38.2019.06.06.02.47.40
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 06 Jun 2019 02:47:40 -0700 (PDT)
From: Anders Roxell <anders.roxell@linaro.org>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 8/8] drivers: regulator: 88pm800: fix warning same module names
Date: Thu,  6 Jun 2019 11:47:36 +0200
Message-Id: <20190606094736.23970-1-anders.roxell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 07 Jun 2019 07:43:40 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NsVvPiBY4yVAfgVoOW5rwqcEUi8304y5zEW51I3/QB0=;
 b=Wdoh2MpFPPwEGDiEjo9yNWPvFiF5rNlEHiZaJf0n9Vg6FS4VUU2cc68GaQl4o2gqwy
 4dbJ3g7WEmat/ufCpfazLVbgV6ySmza2gxaYFAenGQnggpEoKYT0NNP+fPKzDviOplly
 V4mMdAPS/XxX37EVSGdaX+UcmhdKT4IrRkVpNMAbgC2gt8VMNs9PsvD/GD6B5RuHKt5c
 t/UzHJLvzB8BJNgCgTBSJ9KsV9zFkV8hfU8Yx2nTgZ+yWZl6uY6MS8YPGXRBG1hDMj9x
 L4RXjgeGsIVpXYaTYCaIyZyu1UZI8FSwWNUppmzZdyqw0fFmoG4R/pcy23fAlNtrw2K/
 yzkw==
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
Cc: andrew@lunn.ch, linux-fbdev@vger.kernel.org, airlied@linux.ie,
 lee.jones@linaro.org, marex@denx.de, f.fainelli@gmail.com,
 Anders Roxell <anders.roxell@linaro.org>, vivien.didelot@gmail.com,
 linux-media@vger.kernel.org, b.zolnierkie@samsung.com,
 dri-devel@lists.freedesktop.org, mchehab@kernel.org,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, shawnguo@kernel.org, davem@davemloft.net,
 hkallweit1@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2hlbiBidWlsZGluZyB3aXRoIENPTkZJR19NRkRfODhQTTgwMCBhbmQgQ09ORklHX1JFR1VMQVRP
Ul84OFBNODAwCmVuYWJsZWQgYXMgbG9hZGFibGUgbW9kdWxlcywgd2Ugc2VlIHRoZSBmb2xsb3dp
bmcgd2FybmluZzoKCndhcm5pbmc6IHNhbWUgbW9kdWxlIG5hbWVzIGZvdW5kOgogIGRyaXZlcnMv
cmVndWxhdG9yLzg4cG04MDAua28KICBkcml2ZXJzL21mZC84OHBtODAwLmtvCgpSZXdvcmsgdG8g
cmVuYW1lIHRoZSBuYW1lLgoKU2lnbmVkLW9mZi1ieTogQW5kZXJzIFJveGVsbCA8YW5kZXJzLnJv
eGVsbEBsaW5hcm8ub3JnPgotLS0KIGRyaXZlcnMvcmVndWxhdG9yL01ha2VmaWxlIHwgMyArKy0K
IDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL3JlZ3VsYXRvci9NYWtlZmlsZSBiL2RyaXZlcnMvcmVndWxhdG9yL01ha2Vm
aWxlCmluZGV4IDc2ZTc4ZmE0NDlhMi4uNjkwNjkzODA3MWY1IDEwMDY0NAotLS0gYS9kcml2ZXJz
L3JlZ3VsYXRvci9NYWtlZmlsZQorKysgYi9kcml2ZXJzL3JlZ3VsYXRvci9NYWtlZmlsZQpAQCAt
MTEsNyArMTEsOCBAQCBvYmotJChDT05GSUdfUkVHVUxBVE9SX1ZJUlRVQUxfQ09OU1VNRVIpICs9
IHZpcnR1YWwubwogb2JqLSQoQ09ORklHX1JFR1VMQVRPUl9VU0VSU1BBQ0VfQ09OU1VNRVIpICs9
IHVzZXJzcGFjZS1jb25zdW1lci5vCiAKIG9iai0kKENPTkZJR19SRUdVTEFUT1JfODhQRzg2WCkg
Kz0gODhwZzg2eC5vCi1vYmotJChDT05GSUdfUkVHVUxBVE9SXzg4UE04MDApICs9IDg4cG04MDAu
bworb2JqLSQoQ09ORklHX1JFR1VMQVRPUl84OFBNODAwKSArPSA4OHBtODAwLXJlZ3VsYXRvci5v
Cis4OHBtODAwLXJlZ3VsYXRvci1vYmpzCQk6PSA4OHBtODAwLm8KIG9iai0kKENPTkZJR19SRUdV
TEFUT1JfODhQTTg2MDcpICs9IDg4cG04NjA3Lm8KIG9iai0kKENPTkZJR19SRUdVTEFUT1JfQ1BD
QVApICs9IGNwY2FwLXJlZ3VsYXRvci5vCiBvYmotJChDT05GSUdfUkVHVUxBVE9SX0FBVDI4NzAp
ICs9IGFhdDI4NzAtcmVndWxhdG9yLm8KLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
