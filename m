Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA957265D2
	for <lists+dri-devel@lfdr.de>; Wed, 22 May 2019 16:35:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1A5989AAE;
	Wed, 22 May 2019 14:35:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86907893ED
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2019 16:11:14 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id e15so19305938wrs.4
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2019 09:11:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uWjp5N7/2gycMhkjj4F7Je3PI1NUTqU00O1ySy3vSNY=;
 b=R89dd+v2ZTaqakVG9gd0seN/56m2Qh0s84Xo8FDgRTnNMm6nRT0QWzaEXTLicIoxjS
 58OJOXl28BPO4b3CtoHgQckSrMxChl2yaubzgbGFmw5w9u3Xnx8aNpq15SvNeeXQWXKX
 mC7EVadNvBgvbxi8Rmbkz3AaoTzUTZ2deUYU42wJTflW5wlYM/DQX7Iqtmbm9iZxW3iV
 XE4xHgFHxOfTzYILS0QklISv4osu7J1IBtYXBtHpKxvqtiZfnXytSzPE0uFaVrQn3f49
 D+NqB/2oAP973AFb+1IL4ukOssGzfiaqhZwKzIuq75xToTrJzkP8YDKtEO7GTeUBS5Xy
 m7ww==
X-Gm-Message-State: APjAAAWMHQ+IdhSv5Yxd3kpmE37lEvAZUJH48XqZ5DktfFW++wu91QZ5
 ylQXudcRjAUvbhT5c3jSPxw=
X-Google-Smtp-Source: APXvYqzyKZ0rTYgJlTdwuX2CPB9g3HFvHZgguGxqods3XjUbGjAvqDQc2M25Gwzjc4EFEDphnvB5Pw==
X-Received: by 2002:adf:dfd0:: with SMTP id q16mr18856873wrn.235.1558455073159; 
 Tue, 21 May 2019 09:11:13 -0700 (PDT)
Received: from localhost.localdomain (18.189-60-37.rdns.acropolistelecom.net.
 [37.60.189.18])
 by smtp.gmail.com with ESMTPSA id n63sm3891094wmn.38.2019.05.21.09.11.11
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 21 May 2019 09:11:12 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Will Deacon <will.deacon@arm.com>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Neil Armstrong <narmstrong@baylibre.com>,
 Steven Price <steven.price@arm.com>
Subject: [PATCH v6 4/6] dt-bindings: gpu: mali-midgard: Add H6 mali gpu
 compatible
Date: Tue, 21 May 2019 18:11:00 +0200
Message-Id: <20190521161102.29620-5-peron.clem@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190521161102.29620-1-peron.clem@gmail.com>
References: <20190521161102.29620-1-peron.clem@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 22 May 2019 14:35:24 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uWjp5N7/2gycMhkjj4F7Je3PI1NUTqU00O1ySy3vSNY=;
 b=mBYZazpRj6EVU7E58MdMi7y+AJ+HedRo3jJJlcg9GWps2CdOi9yPkeRg9EXQZMZ4w0
 lHyOVHvQG/bLCCwVRejE/7v04UpUP4UNkRSoaITOErYNy7bzb4VrnNwAyPY400UzjMIm
 izWERToMX4dzCYvZS7q6lhOmCb5swJ9Npb9pmBtTO4UqvMD73p7YaSOqPmcIuIIRS127
 HaB7/2461amKirTxJ9/9fSDjuy4xeFxCfkA/tMLFaytIcbIjoUhUlLL2E1booh329WNV
 yagjPAkc1KFlf0HzEennc6ozheuvQABWQgPSgZG/NsrQrg32jV46+A96j/6cedbM2qp4
 4SgA==
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
 dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBhZGQgdGhlIEg2IG1hbGkgY29tcGF0aWJsZSBpbiB0aGUgZHQtYmluZGluZ3MgdG8gbGF0
ZXIgc3VwcG9ydApzcGVjaWZpYyBpbXBsZW1lbnRhdGlvbi4KClNpZ25lZC1vZmYtYnk6IENsw6lt
ZW50IFDDqXJvbiA8cGVyb24uY2xlbUBnbWFpbC5jb20+ClJldmlld2VkLWJ5OiBSb2IgSGVycmlu
ZyA8cm9iaEBrZXJuZWwub3JnPgotLS0KIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL2dwdS9hcm0s
bWFsaS1taWRnYXJkLnR4dCAgICAgICAgIHwgOSArKysrKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCA4
IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvZ3B1L2FybSxtYWxpLW1pZGdhcmQudHh0IGIvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2dwdS9hcm0sbWFsaS1taWRnYXJkLnR4dAppbmRleCAy
ZThiYmNlMzU2OTUuLjRiZjE3ZTFjZjU1NSAxMDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL2dwdS9hcm0sbWFsaS1taWRnYXJkLnR4dAorKysgYi9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZ3B1L2FybSxtYWxpLW1pZGdhcmQudHh0CkBAIC0xNSw2
ICsxNSw3IEBAIFJlcXVpcmVkIHByb3BlcnRpZXM6CiAgICAgKyAiYXJtLG1hbGktdDg2MCIKICAg
ICArICJhcm0sbWFsaS10ODgwIgogICAqIHdoaWNoIG11c3QgYmUgcHJlY2VkZWQgYnkgb25lIG9m
IHRoZSBmb2xsb3dpbmcgdmVuZG9yIHNwZWNpZmljczoKKyAgICArICJhbGx3aW5uZXIsc3VuNTBp
LWg2LW1hbGkiCiAgICAgKyAiYW1sb2dpYyxtZXNvbi1neG0tbWFsaSIKICAgICArICJyb2NrY2hp
cCxyazMyODgtbWFsaSIKICAgICArICJyb2NrY2hpcCxyazMzOTktbWFsaSIKQEAgLTQ5LDkgKzUw
LDE1IEBAIFZlbmRvci1zcGVjaWZpYyBiaW5kaW5ncwogLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
CiAKIFRoZSBNYWxpIEdQVSBpcyBpbnRlZ3JhdGVkIHZlcnkgZGlmZmVyZW50bHkgZnJvbSBvbmUg
U29DIHRvCi1hbm90aGVyLiBJbiBvcmRlciB0byBhY2NvbW9kYXRlIHRob3NlIGRpZmZlcmVuY2Vz
LCB5b3UgaGF2ZSB0aGUgb3B0aW9uCithbm90aGVyLiBJbiBvcmRlciB0byBhY2NvbW1vZGF0ZSB0
aG9zZSBkaWZmZXJlbmNlcywgeW91IGhhdmUgdGhlIG9wdGlvbgogdG8gc3BlY2lmeSBvbmUgbW9y
ZSB2ZW5kb3Itc3BlY2lmaWMgY29tcGF0aWJsZSwgYW1vbmc6CiAKKy0gImFsbHdpbm5lcixzdW41
MGktaDYtbWFsaSIKKyAgUmVxdWlyZWQgcHJvcGVydGllczoKKyAgLSBjbG9ja3MgOiBwaGFuZGxl
cyB0byBjb3JlIGFuZCBidXMgY2xvY2tzCisgIC0gY2xvY2stbmFtZXMgOiBtdXN0IGNvbnRhaW4g
ImNvcmUiIGFuZCAiYnVzIgorICAtIHJlc2V0czogcGhhbmRsZSB0byBHUFUgcmVzZXQgbGluZQor
CiAtICJhbWxvZ2ljLG1lc29uLWd4bS1tYWxpIgogICBSZXF1aXJlZCBwcm9wZXJ0aWVzOgogICAt
IHJlc2V0cyA6IFNob3VsZCBjb250YWluIHBoYW5kbGVzIG9mIDoKLS0gCjIuMTcuMQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
