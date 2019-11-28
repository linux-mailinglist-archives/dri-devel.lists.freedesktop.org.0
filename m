Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D15CB10CBD7
	for <lists+dri-devel@lfdr.de>; Thu, 28 Nov 2019 16:37:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4BF2899D4;
	Thu, 28 Nov 2019 15:37:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F421789A32
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Nov 2019 15:37:44 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id i12so31584619wrn.11
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Nov 2019 07:37:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1SdMph8FVvbQeSK/Cyne8SZbjvXawAhr1q5uC5aFnkU=;
 b=jB0F63mJgTRfoWgEccFsV2XmJ35NPW2lxK8i0eLQKTEh+TX9tEdvtbq883jH65Mpyn
 PlIKq4ZJg1dY26QReOMwrRtM1SnGY9mZAMlX9gDLkCwSqpEiVxg6JtEA53Adp82rCceE
 Y6wd4/CswnR0TLeaJKCLlKx3lD9jpnlSG4kGvBUlYhway9qjKpQReSDu4SIvVdVp9/jZ
 SUgzu4Gj3wxbkAbnGqOISd5jfs7/vf047uSkQm11ZHyUIbGPXp0AWYmZWjPkWEdegp9l
 J1gOamKy7s25QNltx/es6/ifOpM/ieaNjpjW640/bKm3GcxWB2lfKBYtupycr83M8dTE
 Xl6A==
X-Gm-Message-State: APjAAAVLnKnhJ2sKIZVYwmxE1aDWg3iaZes/scDPHUKDa543wQ2ni5NZ
 d9onO5IReaHhlUfUacklErF+KFMDTk0=
X-Google-Smtp-Source: APXvYqwBpUgV77jj7cTZMOg99X05q5TVJTLTT6smw7h/84zysD2GvlUi3ndErE/umY0Fysxu4xVilQ==
X-Received: by 2002:a5d:5224:: with SMTP id i4mr48793086wra.303.1574955463513; 
 Thu, 28 Nov 2019 07:37:43 -0800 (PST)
Received: from localhost (pD9E518ED.dip0.t-ipconnect.de. [217.229.24.237])
 by smtp.gmail.com with ESMTPSA id u22sm4670323wru.30.2019.11.28.07.37.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Nov 2019 07:37:42 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 0/9] drm/tegra: Miscellaneous fixes
Date: Thu, 28 Nov 2019 16:37:32 +0100
Message-Id: <20191128153741.2380419-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1SdMph8FVvbQeSK/Cyne8SZbjvXawAhr1q5uC5aFnkU=;
 b=lLcMSCfmsbUiEboWC1hF5Zbsyq0iB/mvezOUgSA1NvK8XDDnC4KTqbjXowBkxabYl0
 3UNksXsZOfwuRi1lR3amCD5EYqiZ/9Rd0XZTRHM3qDTyuiFDQ2zjNDgG2dmSIhikwuFb
 GdT3/tgbNcxvpFZPcKZKIzuXfQ2I4XtBFcbxfgPbLITWsxkcAG4okxZkIxPCG4GTFQgU
 8nVAqr+3GH6amhx1bP/f3ALtpHbvHNUYEVS9Kg60UvSxE6FGS9veO+r7+xyKSxNEHjaT
 Nw+YVHECkHRRyz0KjwrqO1pJ9kE7LPP4QsJjf8xriP2mytCWH4RtVLiS6KaFqNnWCDdM
 9y1Q==
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KCkhlcmUncyBhIHJhbmRv
bSBhc3NvcnRtZW50IG9mIGZpeGVzIGZvciBpc3N1ZXMgdGhhdCBJIHJhbiBpbnRvIGFzIEkndmUK
YmVlbiB0ZXN0aW5nIHN1c3BlbmQvcmVzdW1lIGFuZCBvdGhlciB0aGluZ3MgcmVjZW50bHkuCgpU
aGllcnJ5CgpUaGllcnJ5IFJlZGluZyAoOSk6CiAgZHJtL3RlZ3JhOiBodWI6IFJlbW92ZSBib2d1
cyBjb25uZWN0aW9uIG11dGV4IGNoZWNrCiAgZHJtL3RlZ3JhOiBnZW06IFByb3Blcmx5IHBpbiBp
bXBvcnRlZCBidWZmZXJzCiAgZHJtL3RlZ3JhOiBnZW06IFJlbW92ZSBwcmVtYXR1cmUgaW1wb3J0
IHJlc3RyaWN0aW9ucwogIGRybS90ZWdyYTogVXNlIHByb3BlciBJT1ZBIGFkZHJlc3MgZm9yIGN1
cnNvciBpbWFnZQogIGRybS90ZWdyYTogc29yOiBJbXBsZW1lbnQgc3lzdGVtIHN1c3BlbmQvcmVz
dW1lCiAgZHJtL3RlZ3JhOiB2aWM6IEV4cG9ydCBtb2R1bGUgZGV2aWNlIHRhYmxlCiAgZHJtL3Rl
Z3JhOiBTaWxlbmNlIGV4cGVjdGVkIGVycm9ycyBvbiBJT01NVSBhdHRhY2gKICBkcm0vdGVncmE6
IGRwYXV4OiBBZGQgbWlzc2luZyBydW50aW1lIFBNIHJlZmVyZW5jZXMKICBkcm0vdGVncmE6IHNv
cjogTWFrZSB0aGUgKzVWIEhETUkgc3VwcGx5IG9wdGlvbmFsCgogZHJpdmVycy9ncHUvZHJtL3Rl
Z3JhL2RjLmMgICAgfCAxOCArKysrKystLS0tLS0tCiBkcml2ZXJzL2dwdS9kcm0vdGVncmEvZHBh
dXguYyB8IDE2ICsrKysrKysrKy0tCiBkcml2ZXJzL2dwdS9kcm0vdGVncmEvZHJtLmMgICB8ICA0
ICstLQogZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2dlbS5jICAgfCA1MCArKysrKysrKysrKysrKysr
KysrKysrKysrKysrKystLS0tLQogZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2h1Yi5jICAgfCAgMyAt
LS0KIGRyaXZlcnMvZ3B1L2RybS90ZWdyYS9zb3IuYyAgIHwgMzggKysrKysrKysrKysrKysrKysr
KysrKy0tLS0KIGRyaXZlcnMvZ3B1L2RybS90ZWdyYS92aWMuYyAgIHwgIDcgKystLS0KIDcgZmls
ZXMgY2hhbmdlZCwgMTA0IGluc2VydGlvbnMoKyksIDMyIGRlbGV0aW9ucygtKQoKLS0gCjIuMjMu
MAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
