Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E63F38578
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2019 09:45:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07C0389B18;
	Fri,  7 Jun 2019 07:44:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6533889402
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2019 09:47:37 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id u10so297893lfm.12
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jun 2019 02:47:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tqLAHFWcFPPRWg/WUmIKVQXRfjbKzLHes3un8tM9Gvg=;
 b=KIkgpM3+g+TFx/b+YE4lhO0Lwqkv6N6ugl8GA2X+ro6I55x8XlbUaHxlpQ7jna9JqL
 bjQSH6i+h/8Cz6f1g5R5AmNRWru9M4fvoSImwPychzU50MQwJKNDim5rxBLvPtuEIRLM
 MA2tBb+r7upJ3YXxSY5UQTssbLxPeySjHc9XSk3XDvf3WI/Ilbn0mqPsIYvrdZt/Gii7
 NTZQARYv9bcIktQZ6n0+Xa1l0FxeTmpiIgB7oNgRvpew8p9DGJ+glL2dKUkmvGh1gWYB
 eArSPd6n50aAwimOx4ayUzzXFuzHypzmaGLB/XEtlmAB5apfv4pmaaSOf3v3JpYpIq+X
 sbWA==
X-Gm-Message-State: APjAAAW6NhvMTk5YHTa+F7QqTqgy8ixH4wTvZ8nbdQpUk7j0zXKbW4SR
 b7AJBWlLHD+3gjbTI6xKA8xvjw==
X-Google-Smtp-Source: APXvYqzwnsLpfjtk0CIHJjGAd3PHOuMbYbXAW2joQUfJaemcbv8dWKNOhuhIygzLFkH6KdzB5dTdug==
X-Received: by 2002:a19:e05c:: with SMTP id g28mr8736392lfj.167.1559814455812; 
 Thu, 06 Jun 2019 02:47:35 -0700 (PDT)
Received: from localhost (c-1c3670d5.07-21-73746f28.bbcust.telenor.se.
 [213.112.54.28])
 by smtp.gmail.com with ESMTPSA id u13sm220277lfl.61.2019.06.06.02.47.35
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 06 Jun 2019 02:47:35 -0700 (PDT)
From: Anders Roxell <anders.roxell@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 7/8] drivers: mfd: 88pm800: fix warning same module names
Date: Thu,  6 Jun 2019 11:47:31 +0200
Message-Id: <20190606094731.23918-1-anders.roxell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 07 Jun 2019 07:43:40 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tqLAHFWcFPPRWg/WUmIKVQXRfjbKzLHes3un8tM9Gvg=;
 b=vHUW3+ZZeGk/a3xl67ZoRzH2OeuOzTB13K64lPfM8o6ubuED7MfpLkMU42xD3KDTGG
 htbekOtb95OTRxYqsJ57kJ+7eBDSb9YsOUmpEOfAcgfbUH9drA+CYkDRQb87juXm2gDt
 PRFJrv4x5Ttdpe+wr/kbs1XGegjxwq3YM3U0+pItUlRiB/RsC1+ymGjhCv80Qtj5/TQ8
 AqvCFqeTSw5zMAvuBjLvyf9ZiJ4xirXkcbH6DZ2pUywixzEe4js0aoa9r9FrXYnmpn5M
 vZnPIw5AOdPXDPoJIijX0vfgQCekmdrDEIiznGfYyqbX9Z1nQdeDTa0Oszi4RPnzcCdd
 nFmw==
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
 linux-kernel@vger.kernel.org, marex@denx.de, f.fainelli@gmail.com,
 Anders Roxell <anders.roxell@linaro.org>, vivien.didelot@gmail.com,
 linux-media@vger.kernel.org, b.zolnierkie@samsung.com, broonie@kernel.org,
 dri-devel@lists.freedesktop.org, mchehab@kernel.org,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 lgirdwood@gmail.com, shawnguo@kernel.org, davem@davemloft.net,
 hkallweit1@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2hlbiBidWlsZGluZyB3aXRoIENPTkZJR19NRkRfODhQTTgwMCBhbmQgQ09ORklHX1JFR1VMQVRP
Ul84OFBNODAwCmVuYWJsZWQgYXMgbG9hZGFibGUgbW9kdWxlcywgd2Ugc2VlIHRoZSBmb2xsb3dp
bmcgd2FybmluZzoKCndhcm5pbmc6IHNhbWUgbW9kdWxlIG5hbWVzIGZvdW5kOgogIGRyaXZlcnMv
cmVndWxhdG9yLzg4cG04MDAua28KICBkcml2ZXJzL21mZC84OHBtODAwLmtvCgpSZXdvcmsgc28g
dGhlIG5hbWVzIG1hdGNoZXMgdGhlIGNvbmZpZyBmcmFnbWVudC4KClNpZ25lZC1vZmYtYnk6IEFu
ZGVycyBSb3hlbGwgPGFuZGVycy5yb3hlbGxAbGluYXJvLm9yZz4KLS0tCiBkcml2ZXJzL21mZC9N
YWtlZmlsZSB8IDcgKysrKystLQogMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMiBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL21mZC9NYWtlZmlsZSBiL2RyaXZlcnMv
bWZkL01ha2VmaWxlCmluZGV4IDUyYjFhOTBmZjUxNS4uNWU4NzBlZWY2YTIwIDEwMDY0NAotLS0g
YS9kcml2ZXJzL21mZC9NYWtlZmlsZQorKysgYi9kcml2ZXJzL21mZC9NYWtlZmlsZQpAQCAtNSw4
ICs1LDExIEBACiAKIDg4cG04NjB4LW9ianMJCQk6PSA4OHBtODYweC1jb3JlLm8gODhwbTg2MHgt
aTJjLm8KIG9iai0kKENPTkZJR19NRkRfODhQTTg2MFgpCSs9IDg4cG04NjB4Lm8KLW9iai0kKENP
TkZJR19NRkRfODhQTTgwMCkJKz0gODhwbTgwMC5vIDg4cG04MHgubwotb2JqLSQoQ09ORklHX01G
RF84OFBNODA1KQkrPSA4OHBtODA1Lm8gODhwbTgweC5vCitvYmotJChDT05GSUdfTUZEXzg4UE04
MDApCSs9IG1mZC04OHBtODAwLm8gbWZkLTg4cG04MHgubworbWZkLTg4cG04MDAtb2JqcwkJOj0g
ODhwbTgwMC5vCitvYmotJChDT05GSUdfTUZEXzg4UE04MDUpCSs9IG1mZC04OHBtODA1Lm8gbWZk
LTg4cG04MHgubworbWZkLTg4cG04MDUtb2JqcwkJOj0gODhwbTgwNS5vCittZmQtODhwbTgweC1v
YmpzCQk6PSA4OHBtODB4Lm8KIG9iai0kKENPTkZJR19NRkRfQUNUODk0NUEpCSs9IGFjdDg5NDVh
Lm8KIG9iai0kKENPTkZJR19NRkRfU001MDEpCQkrPSBzbTUwMS5vCiBvYmotJChDT05GSUdfTUZE
X0FTSUMzKQkJKz0gYXNpYzMubyB0bWlvX2NvcmUubwotLSAKMi4yMC4xCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
