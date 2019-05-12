Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C4021B0C1
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2019 09:05:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D43A0895E1;
	Mon, 13 May 2019 07:04:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7342B89A8B
 for <dri-devel@lists.freedesktop.org>; Sun, 12 May 2019 17:46:21 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id r7so12077371wrr.13
 for <dri-devel@lists.freedesktop.org>; Sun, 12 May 2019 10:46:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2FMzWU4kL/7cfSe9GLA2ni0LaXmAg+HUWUsDdn5ujQI=;
 b=hTwyW/MwWQ/iom/dStBfna2wCfnH0nh3L6T00CKGUiGwRbDrfTsv8USFlTybVzsyZg
 uj2GivUVko4xLDoPP46lwTpQcvObrea/5BizSsj4zRmjJwSiPixWSwGSQMh0/GwMqEZx
 jBgmutU8pUC/jx8SU9VAILYAStDkBM/QP6xuOYLgvLhhxJvqW9SeSaXk1T74oIw+Y50D
 m89xLf7Ric/E1tX0/EMlMrYwBzgNECfL8vZsKHBkGDgt8Onx6T8lMnX5rqTnw5Zisj25
 b9q5pBXuND06385FfgtmXLrJVmWf9kNf8otrg0jZS/yw4r0Xg0Jdj6KzYqW6POaheH5e
 taQg==
X-Gm-Message-State: APjAAAXmkzjiGDo2RYUDCfnos28OWp4tIH+fxcKHR0Nd1w3ZKedzu479
 RCAPkFarlNbAkg/aF0L9Jps=
X-Google-Smtp-Source: APXvYqxLR33kLqVeufhwDeW/jJLuiemVx7ENonuL8c+dIbenss+tXjrpQm8GTkH1++RQ9p3NpS/vuA==
X-Received: by 2002:a5d:54d2:: with SMTP id x18mr15171610wrv.186.1557683180041; 
 Sun, 12 May 2019 10:46:20 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:1f1:d0f0::4e2b:d7ca])
 by smtp.gmail.com with ESMTPSA id d14sm9090558wre.78.2019.05.12.10.46.19
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 12 May 2019 10:46:19 -0700 (PDT)
From: peron.clem@gmail.com
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH v4 4/8] arm64: dts: allwinner: Add ARM Mali GPU node for H6
Date: Sun, 12 May 2019 19:46:04 +0200
Message-Id: <20190512174608.10083-5-peron.clem@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190512174608.10083-1-peron.clem@gmail.com>
References: <20190512174608.10083-1-peron.clem@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 13 May 2019 07:04:34 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2FMzWU4kL/7cfSe9GLA2ni0LaXmAg+HUWUsDdn5ujQI=;
 b=dW7J2KNsq7L/8WnVMBpe0g5cOhxv/1O8zR/XignGtRI7/ohYqcUttaEzisem5rIzVq
 TDoYnZw1GK9I+fKuAgxihTbtmYLjQlh11kODNTfU4pACXLZub9JT0mdYTt4JTpTb9RVX
 UH2AyJNYmIU8DDsimdjmhtMhg3vixBvicryCW3Jp3t5o3bBkZ2X/2wEV4H2aQpuktaPu
 m5pnevbt48p9xjeXHyNzvmPCX8l523SUMjctrrbfCaMqkHV0MLMVghyBzCbk/c73W+e+
 csj1gcE+j7demTu+OwiEDASk6bQSZfun22Q/xh1xP3/5uAUzMeOP0U31jw6ypwlaHW9G
 aOjQ==
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-sunxi@googlegroups.com,
 =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogQ2zDqW1lbnQgUMOpcm9uIDxwZXJvbi5jbGVtQGdtYWlsLmNvbT4KCkFkZCB0aGUgbWFs
aSBncHUgbm9kZSB0byB0aGUgSDYgZGV2aWNlLXRyZWUuCgpTaWduZWQtb2ZmLWJ5OiBDbMOpbWVu
dCBQw6lyb24gPHBlcm9uLmNsZW1AZ21haWwuY29tPgotLS0KIGFyY2gvYXJtNjQvYm9vdC9kdHMv
YWxsd2lubmVyL3N1bjUwaS1oNi5kdHNpIHwgMTQgKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFu
Z2VkLCAxNCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9h
bGx3aW5uZXIvc3VuNTBpLWg2LmR0c2kgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2FsbHdpbm5lci9z
dW41MGktaDYuZHRzaQppbmRleCBlMGRjNGEwNWMxYmEuLjE5Njc1MzExMDQzNCAxMDA2NDQKLS0t
IGEvYXJjaC9hcm02NC9ib290L2R0cy9hbGx3aW5uZXIvc3VuNTBpLWg2LmR0c2kKKysrIGIvYXJj
aC9hcm02NC9ib290L2R0cy9hbGx3aW5uZXIvc3VuNTBpLWg2LmR0c2kKQEAgLTE1Nyw2ICsxNTcs
MjAgQEAKIAkJCWFsbHdpbm5lcixzcmFtID0gPCZ2ZV9zcmFtIDE+OwogCQl9OwogCisJCWdwdTog
Z3B1QDE4MDAwMDAgeworCQkJY29tcGF0aWJsZSA9ICJhbGx3aW5uZXIsc3VuNTBpLWg2LW1hbGki
LAorCQkJCSAgICAgImFybSxtYWxpLXQ3MjAiOworCQkJcmVnID0gPDB4MDE4MDAwMDAgMHg0MDAw
PjsKKwkJCWludGVycnVwdHMgPSA8R0lDX1NQSSA4NCBJUlFfVFlQRV9MRVZFTF9ISUdIPiwKKwkJ
CQkgICAgIDxHSUNfU1BJIDg1IElSUV9UWVBFX0xFVkVMX0hJR0g+LAorCQkJCSAgICAgPEdJQ19T
UEkgODMgSVJRX1RZUEVfTEVWRUxfSElHSD47CisJCQlpbnRlcnJ1cHQtbmFtZXMgPSAiam9iIiwg
Im1tdSIsICJncHUiOworCQkJY2xvY2tzID0gPCZjY3UgQ0xLX0dQVT4sIDwmY2N1IENMS19CVVNf
R1BVPjsKKwkJCWNsb2NrLW5hbWVzID0gImNvcmUiLCAiYnVzIjsKKwkJCXJlc2V0cyA9IDwmY2N1
IFJTVF9CVVNfR1BVPjsKKwkJCXN0YXR1cyA9ICJkaXNhYmxlZCI7CisJCX07CisKIAkJc3lzY29u
OiBzeXNjb25AMzAwMDAwMCB7CiAJCQljb21wYXRpYmxlID0gImFsbHdpbm5lcixzdW41MGktaDYt
c3lzdGVtLWNvbnRyb2wiLAogCQkJCSAgICAgImFsbHdpbm5lcixzdW41MGktYTY0LXN5c3RlbS1j
b250cm9sIjsKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
