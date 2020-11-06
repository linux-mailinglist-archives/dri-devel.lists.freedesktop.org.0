Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 406FB2A9F67
	for <lists+dri-devel@lfdr.de>; Fri,  6 Nov 2020 22:50:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E1F06EB25;
	Fri,  6 Nov 2020 21:50:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AEA16EB25
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Nov 2020 21:50:08 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id a65so2658242wme.1
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Nov 2020 13:50:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Egmlgv9H3fW37Nl0/DO7Y7+0OQCWufEB+r7yIAqkua0=;
 b=eYaXK275kZ6tl5bZ2mLwFa4Hvd2EKmC0/VME8B9G/DISC2ffhyEptBOVG0KMjuNOLC
 XsEsCBmAoM7RHtAu3Qlc9CDxH+LWQ1uBALNxpw6HcSXEq0Pwu0m95yHxCdsAjrL12ceV
 KKvpLWrKJWTh5XU+PgrRW9YhQWWPAJMptrUEfAahqFedytbPfoYgCfYmvN5loU/6Lx/p
 jUyrunnT1AJH5g9RK08Qcpg1guaWrUBsccPIJSv44/qAOHunj6+eiN42lzj/+reg9vaX
 FXAGldEVoHjpHPVRlk78/1fsZaFkU/N2gn3wWzFRiBhdyL1xxlo9jkwAjDu4MIG2RFV2
 2N0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Egmlgv9H3fW37Nl0/DO7Y7+0OQCWufEB+r7yIAqkua0=;
 b=TG8ybVLg1ep+7lqrZWVh6ysLzb8XjI7K/VqjfWQsm40PO0zdq82ofAt0nZyWZag8go
 HLrNh8v4c1C5MTAc9BA52DlK4q4XA69n9dq7H33gMtdPZIrhnlA7X8TB3YMXtmRTrnx3
 mnuHVfqeDxgt3fQVQnjWbdOWvwWOS0uWzN03gmGRtB4zOL8raLCTvKdwr0mIoStFnkWk
 kJiSAiU3X/PJPB3pgP7mOugeN5Ws11VNU7OnsNr6Jjncu3hlUaKzR+qdeUGh1wFMoRcy
 ZnUcT3x43xZlqkq/INxp01f51drycgGI0ib2BZQH9DfUTP2K5QHJ7zUFTvWvl7lU3B2Y
 9UHQ==
X-Gm-Message-State: AOAM532VHbLvd2tb0N7PhrQ5gcn21sdnriL5FZKPmAya5aBNKHS/kFBg
 aOR94oSWmZRvGCxkKLD5CdAMWw==
X-Google-Smtp-Source: ABdhPJy2bIjiZLuZODIqlT1CvO+CLjkrEG+vzynMbmZJqKxhgkUCFDhXVQmJzX4wCSLbFC2K6m9Glg==
X-Received: by 2002:a1c:6484:: with SMTP id y126mr1515842wmb.141.1604699407208; 
 Fri, 06 Nov 2020 13:50:07 -0800 (PST)
Received: from dell.default ([91.110.221.236])
 by smtp.gmail.com with ESMTPSA id t199sm3981084wmt.46.2020.11.06.13.50.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2020 13:50:06 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 11/19] drm/radeon/radeon_drv: Source file headers are not good
 candidates for kernel-doc
Date: Fri,  6 Nov 2020 21:49:41 +0000
Message-Id: <20201106214949.2042120-12-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201106214949.2042120-1-lee.jones@linaro.org>
References: <20201106214949.2042120-1-lee.jones@linaro.org>
MIME-Version: 1.0
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, Gareth Hughes <gareth@valinux.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fZHJ2LmM6Mjogd2FybmluZzogQ2Fubm90IHVuZGVyc3Rh
bmQgICogZmlsZSByYWRlb25fZHJ2LmMKCkNjOiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVj
aGVyQGFtZC5jb20+CkNjOiAiQ2hyaXN0aWFuIEvDtm5pZyIgPGNocmlzdGlhbi5rb2VuaWdAYW1k
LmNvbT4KQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KQ2M6IERhbmllbCBWZXR0
ZXIgPGRhbmllbEBmZndsbC5jaD4KQ2M6IEdhcmV0aCBIdWdoZXMgPGdhcmV0aEB2YWxpbnV4LmNv
bT4KQ2M6IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCkNjOiBkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnClNpZ25lZC1vZmYtYnk6IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFy
by5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fZHJ2LmMgfCAyICstCiAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9y
YWRlb24vcmFkZW9uX2Rydi5jCmluZGV4IDU2MDI2N2NjMjU4OTIuLmJiN2IzM2U1MzVmODEgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2Rydi5jCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2Rydi5jCkBAIC0xLDQgKzEsNCBAQAotLyoqCisvKgog
ICogXGZpbGUgcmFkZW9uX2Rydi5jCiAgKiBBVEkgUmFkZW9uIGRyaXZlcgogICoKLS0gCjIuMjUu
MQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
