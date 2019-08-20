Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 909BB969DD
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2019 22:00:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B87816E45F;
	Tue, 20 Aug 2019 20:00:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com
 [209.85.167.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 951F06E45F
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2019 20:00:01 +0000 (UTC)
Received: by mail-oi1-f179.google.com with SMTP id n1so2695415oic.3
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2019 13:00:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZDc44D7UBCU6lZkBAhG6OsPyET2iKNUIgty+ONWJ5wc=;
 b=Pwsz+ffUANy3V9IV4ufv43d51BLWccRDXzVjo84msKvTiQzPyfh8ly6pM2Hl/QjYDF
 XuojDanLxfuBlaOkRlsGm2gS5TikNU0NxBxasHbSNF5XdRI6nWyvKfpdNeG4HA5jf1cF
 Jjnqppi/uQvAig36bdfBjUUhkFrPEEa8dOHWqJ33z7ffIgmw3BbQJyiUameGPzFowqK0
 b32fUuFNf5IGLaRqjnWzfO8gNERq3qSaNWch4s/y6wlqh6TsIFp4iCNdU+BrHfbK/PM3
 g6w5tVrrBaT8xY9l1IleAfs6Sgdqmi5mzfPdVK1OGU9U0cdLJOYGWogmGhU2WWVtMJTt
 ORDg==
X-Gm-Message-State: APjAAAUXZv5YrxzAWChwll8IGdehJKoYLUVrz3+MBPPqvz/mVGQ352in
 bzmVgbRb0UnrHjc1RL8TAlEW6Vc=
X-Google-Smtp-Source: APXvYqy7ABj6PAM1ans8JlyuFy8KcvBasov7Q2HA1O8HNtR+sbTOpMGz0GyFMVhMTYjrsA0J2eSweQ==
X-Received: by 2002:aca:540b:: with SMTP id i11mr1232727oib.50.1566331200453; 
 Tue, 20 Aug 2019 13:00:00 -0700 (PDT)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.googlemail.com with ESMTPSA id e22sm5082159oii.7.2019.08.20.12.59.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Aug 2019 12:59:59 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 0/3] dt-bindings: Convert Arm Mali GPUs to DT schema
Date: Tue, 20 Aug 2019 14:59:56 -0500
Message-Id: <20190820195959.6126-1-robh@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
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
Cc: linux-kernel@vger.kernel.org,
 Maxime Ripard <maxime.ripard@free-electrons.com>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBzZXJpZXMgY29udmVydHMgdGhlIHZhcmlvdXMgQXJtIE1hbGkgR1BVIGJpbmRpbmdzIHRv
IHVzZSB0aGUgRFQKc2NoZW1hIGZvcm1hdC4KClRoZSBNaWRnYXJkIGFuZCBCaWZyb3N0IGJpbmRp
bmdzIGdlbmVyYXRlIHdhcm5pbmdzIG9uICdpbnRlcnJ1cHQtbmFtZXMnCmJlY2F1c2UgdGhlcmUn
cyBhbGwgZGlmZmVyZW50IG9yZGVyaW5nLiBUaGUgVXRnYXJkIGJpbmRpbmcgZ2VuZXJhdGVzIAp3
YXJuaW5ncyBvbiBSb2NrY2hpcCBwbGF0Zm9ybXMgYmVjYXVzZSAnY2xvY2stbmFtZXMnIG9yZGVy
IGlzIHJldmVyc2VkLgoKUm9iCgpSb2IgSGVycmluZyAoMyk6CiAgZHQtYmluZGluZ3M6IENvbnZl
cnQgQXJtIE1hbGkgTWlkZ2FyZCBHUFUgdG8gRFQgc2NoZW1hCiAgZHQtYmluZGluZ3M6IENvbnZl
cnQgQXJtIE1hbGkgQmlmcm9zdCBHUFUgdG8gRFQgc2NoZW1hCiAgZHQtYmluZGluZ3M6IENvbnZl
cnQgQXJtIE1hbGkgVXRnYXJkIEdQVSB0byBEVCBzY2hlbWEKCiAuLi4vYmluZGluZ3MvZ3B1L2Fy
bSxtYWxpLWJpZnJvc3QudHh0ICAgICAgICAgfCAgOTIgLS0tLS0tLS0tLQogLi4uL2JpbmRpbmdz
L2dwdS9hcm0sbWFsaS1iaWZyb3N0LnlhbWwgICAgICAgIHwgMTE1ICsrKysrKysrKysrKwogLi4u
L2JpbmRpbmdzL2dwdS9hcm0sbWFsaS1taWRnYXJkLnR4dCAgICAgICAgIHwgMTE5IC0tLS0tLS0t
LS0tLS0KIC4uLi9iaW5kaW5ncy9ncHUvYXJtLG1hbGktbWlkZ2FyZC55YW1sICAgICAgICB8IDE2
NSArKysrKysrKysrKysrKysrKwogLi4uL2JpbmRpbmdzL2dwdS9hcm0sbWFsaS11dGdhcmQudHh0
ICAgICAgICAgIHwgMTI5IC0tLS0tLS0tLS0tLS0tCiAuLi4vYmluZGluZ3MvZ3B1L2FybSxtYWxp
LXV0Z2FyZC55YW1sICAgICAgICAgfCAxNjYgKysrKysrKysrKysrKysrKysrCiA2IGZpbGVzIGNo
YW5nZWQsIDQ0NiBpbnNlcnRpb25zKCspLCAzNDAgZGVsZXRpb25zKC0pCiBkZWxldGUgbW9kZSAx
MDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2dwdS9hcm0sbWFsaS1iaWZy
b3N0LnR4dAogY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9ncHUvYXJtLG1hbGktYmlmcm9zdC55YW1sCiBkZWxldGUgbW9kZSAxMDA2NDQgRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2dwdS9hcm0sbWFsaS1taWRnYXJkLnR4dAogY3Jl
YXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9ncHUvYXJt
LG1hbGktbWlkZ2FyZC55YW1sCiBkZWxldGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL2dwdS9hcm0sbWFsaS11dGdhcmQudHh0CiBjcmVhdGUgbW9kZSAxMDA2
NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2dwdS9hcm0sbWFsaS11dGdhcmQu
eWFtbAoKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
