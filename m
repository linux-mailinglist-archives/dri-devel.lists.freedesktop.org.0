Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D6464EEE9
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2019 20:49:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2F1688D3D;
	Fri, 21 Jun 2019 18:49:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9FF088D3D
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2019 18:49:51 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id k18so6826617ljc.11
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2019 11:49:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=CsAX22pDPO5K3pDUHWDy8QrCA7bxFLaEeYPpIJ9J29s=;
 b=MJlx8ccewmC82gW8Jb993AnSeBu8mGiPjhR20FzjFCbBNSBes1x3xdug8Nfq+HOKNx
 9LP/GTPfjsr3QcLQrrr0hgCQHsf3OxMsqLcH5nOKAX1RvHGVSM22PeRdtAHY7rI2eOKC
 B50CJCKcPQg1X5Wxtx4R7NTjnQuvL52X1klfI2dAH3JlvKKMbbCV2jekHcp/ZZwqug/q
 cNzKUCfkwTXtBRmEagByddjJPIT4+oFi0DWwr37B+6718t22yjB1HDEs9ltpUpjAz721
 YSRqKMCIYRIJPYs4BW4phjG4Ww+keq/K6VMiaaxr61F1yt+kR6qJ5Y6JiJSbDj2lIfRP
 OX2A==
X-Gm-Message-State: APjAAAUBtGQnmQUsvzvwL1AykvOSc2Q2mY7KZzCftppIQkkb7oibzCe3
 B6vmu16nCvsLSH+WF2QE7X4X/LeIMDk=
X-Google-Smtp-Source: APXvYqwPTBmioExepbRSoYq2OjYNLXvvCpmhBMm8O/LqzWmQv5I9gAHDycnveR8jmfOvbyYJvANkEQ==
X-Received: by 2002:a2e:2c04:: with SMTP id s4mr49103875ljs.61.1561142990052; 
 Fri, 21 Jun 2019 11:49:50 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 q22sm507947lje.75.2019.06.21.11.49.48
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 21 Jun 2019 11:49:49 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org,
	Inki Dae <inki.dae@samsung.com>
Subject: [PATCH v3 0/1] drm/exynos: drop use of drmP.h
Date: Fri, 21 Jun 2019 20:49:03 +0200
Message-Id: <20190621184904.25975-1-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CsAX22pDPO5K3pDUHWDy8QrCA7bxFLaEeYPpIJ9J29s=;
 b=En1Z7swuWTDcK9KAIILMcLsSM3aliTcBEMpq3mnQdMI9q0d4dD0J7GtR3dxGs8zNN2
 eTdQWGZadM1ys0ukzYobn5bVLh5jVA6FKyAaOH77vadMV09+lHJawWyVpb2bzmEUx/m3
 sjr6WkA1Dxlu1ZQznwtQgDnfGtVr7Rn85wOcxTC4KZ9iXYfn6qerL2olaDfpb0R9BNqc
 uDujCbqJ6qtAurGewA78nnQzqHbSJfdDyp6PK+b566INe0xFqrdBhfWQMPMvz/wt5ON/
 1TVXnrhTJXkTROzq9R9i7gybvhO6wq2S+j+KsVh3u+QKh4YqEdVazqrVbpMGqJ4uUV6b
 N4cg==
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
Cc: David Airlie <airlied@linux.ie>, Jingoo Han <jingoohan1@gmail.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QnVpbGQgdGVzdGVkIHVzaW5nIGFsbHllc2NvbmZpZywgYWxsbW9kY29uZmlnIGZvciB2YXJpb3Vz
CmFyY2hpdGVjdHVyZXMuCgp2MjoKLSBhZGQgbWlzc2luZyBwZW9wbGUgdG8gcmVjaXBpZW50IGxp
c3Qgb2YgbWFpbAotIG5vIGNoYW5nZSBpbiBhY3R1YWwgcGF0Y2gKCnYzOgotIGZpeCBidWlsZCBi
cmVha2FnZSAoSW5raSBEYWUpCgpUaGUgdGVzdGluZyBJIGhhZCBkb25lIHdpdGggYWxseWVzY29u
ZmlnLCBhbGxtb2Rjb25maWcKZGlkIG5vdCB0cmlnZ2VyIGEgY29uZmlndXJhdGlvbiB3aGVyZSBl
eHlub3NfZHJtX2cyZC5jCndhcyBidWlsdC4gIFNvIGEgYnVpbGQgZXJyb3IgaGFkIHNsaXBwZWQg
dGhyb3VnaC4KClZlcmlmaWVkIHRoYXQgYWxsIDIzIC5jIGZpbGVzIGFyZSBidWlsdCBub3cuCgog
ICAgICAgIFNhbQoKClNhbSBSYXZuYm9yZyAoMSk6CiAgICAgIGRybS9leHlub3M6IGRyb3AgZHJt
UC5oIHVzYWdlCgogZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3M1NDMzX2RybV9kZWNvbi5j
IHwgIDcgKysrLS0KIGRyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zN19kcm1fZGVjb24uYyAg
ICB8ICA4ICsrKystLQogZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHAuYyAgICAgICAg
ICAgIHwgMTMgKysrKy0tLS0tCiBkcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fY3J0
Yy5jICAgICAgfCAgMiArLQogZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX2RtYS5j
ICAgICAgIHwgIDYgKystLQogZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX2RwaS5j
ICAgICAgIHwgIDggKysrLS0tCiBkcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fZHJ2
LmMgICAgICAgfCAxMiArKysrLS0tLQogZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJt
X2Rydi5oICAgICAgIHwgIDggKysrKystCiBkcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19k
cm1fZHNpLmMgICAgICAgfCAyMSArKysrKysrLS0tLS0tLQogZHJpdmVycy9ncHUvZHJtL2V4eW5v
cy9leHlub3NfZHJtX2ZiLmMgICAgICAgIHwgIDYgKystLQogZHJpdmVycy9ncHUvZHJtL2V4eW5v
cy9leHlub3NfZHJtX2ZiZGV2LmMgICAgIHwgIDcgKysrLS0KIGRyaXZlcnMvZ3B1L2RybS9leHlu
b3MvZXh5bm9zX2RybV9maW1jLmMgICAgICB8IDE1ICsrKysrLS0tLS0KIGRyaXZlcnMvZ3B1L2Ry
bS9leHlub3MvZXh5bm9zX2RybV9maW1kLmMgICAgICB8IDE0ICsrKysrLS0tLQogZHJpdmVycy9n
cHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX2cyZC5jICAgICAgIHwgMTEgKysrKy0tLQogZHJpdmVy
cy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX2dlbS5jICAgICAgIHwgIDcgKysrLS0KIGRyaXZl
cnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9nc2MuYyAgICAgICB8IDEzICsrKysrLS0tLQog
ZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX2lwcC5jICAgICAgIHwgIDMgKy0KIGRy
aXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9taWMuYyAgICAgICB8IDIyICsrKysrKyst
LS0tLS0tCiBkcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fcGxhbmUuYyAgICAgfCAg
NCArLS0KIGRyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9yb3RhdG9yLmMgICB8IDEw
ICsrKy0tLS0KIGRyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9zY2FsZXIuYyAgICB8
IDEyICsrKystLS0tCiBkcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fdmlkaS5jICAg
ICAgfCAgOSArKystLS0KIGRyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2hkbWkuYyAgICAg
ICAgICB8IDQxICsrKysrKysrKysrKystLS0tLS0tLS0tLS0tLQogZHJpdmVycy9ncHUvZHJtL2V4
eW5vcy9leHlub3NfbWl4ZXIuYyAgICAgICAgIHwgMzEgKysrKysrKysrKy0tLS0tLS0tLS0KIDI0
IGZpbGVzIGNoYW5nZWQsIDE1NCBpbnNlcnRpb25zKCspLCAxMzYgZGVsZXRpb25zKC0pCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
