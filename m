Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C32F8373229
	for <lists+dri-devel@lfdr.de>; Wed,  5 May 2021 00:02:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15CB689915;
	Tue,  4 May 2021 22:02:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C040689915
 for <dri-devel@lists.freedesktop.org>; Tue,  4 May 2021 22:02:15 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id z6so10966892wrm.4
 for <dri-devel@lists.freedesktop.org>; Tue, 04 May 2021 15:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8TWgllBMIdI7K4QAKzryp2LC84PsKaAiDjf7lNkKXZQ=;
 b=ZlH+mWWf+79byPCgtelVSm2YH75Hbp6iRcUouYzUWT0WzQkwEHvbtl4o6UrTnRTD7o
 yXGPJCa0BHXKoSRfASMrX/wQYOXiZCU3kMuN4/w1Md5mOQBiGuCKl/E6iUfD9qC2I5vL
 dVohu1OqKGVq1pvHu9mCe2UGEYzFrkIPONlxQk7EMd0E80xjpLQO1bBoPZ2+qvy3E57Q
 fpv4J7R5NDlrKt4f5fhQtCIRK804iwyn28TkLEOp+W6+CNPdRXbuJyFCaXXN/c6HetUD
 TfPkQd6QCXdDaderJUs/EbGMWWRSGQspKM4gRjr1K5WIhL3z22z8qoauycf99WpBIaxT
 YEAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8TWgllBMIdI7K4QAKzryp2LC84PsKaAiDjf7lNkKXZQ=;
 b=nEuA7kV8Wrl1vCBmvE0wlOBkFPrFTuE46KeBm45KN5fy8SiDkTDhal6CqfEO//d5ZY
 CHWmdO+0xLqiU//k9hROi5YQtRlw8OXocNFzpxdGtHN1re2Ulv1upHPROJ8foeJUwAO+
 IIFz+2UUR3WenstiPqJCYB9E5FJBPuWxB/TeZRwEYTEQPwuP4s4kb/ck6HeSEhS7GVcp
 x0VG2tYaZqhhQbIBXZlOH4QDKNHXDfE/N1v4UeoBgl4LrkCkkv0gWQEYYToxQ8mcAo6X
 F/mIbW+XU48WbW03dtl4EduQBowyh9OfrX62lyhCdAA1gZ3SzZbtiABAys+MRyK3TwA6
 vabA==
X-Gm-Message-State: AOAM530YnjeEpuvoloHNXb55zfMdwNXL4mF00irfuOYMhO53vj/+x8o/
 d56+yZjYNgJAs9UYuP9fvHc=
X-Google-Smtp-Source: ABdhPJz/wkBdr8RQPL2dVJpDaDVtoFKM+eDH55ieQV5sZo21j0ivdtRXGcfmaOqmtPj66IadTM/rDg==
X-Received: by 2002:a5d:6248:: with SMTP id m8mr1256641wrv.42.1620165734418;
 Tue, 04 May 2021 15:02:14 -0700 (PDT)
Received: from localhost.localdomain
 (2a01cb001102af00348f8588f3a794a5.ipv6.abo.wanadoo.fr.
 [2a01:cb00:1102:af00:348f:8588:f3a7:94a5])
 by smtp.gmail.com with ESMTPSA id z8sm16845834wrw.74.2021.05.04.15.02.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 May 2021 15:02:13 -0700 (PDT)
From: Adrien Grassein <adrien.grassein@gmail.com>
To: 
Subject: [PATCH] drm/bridge: fix LONTIUM_LT8912B dependencies
Date: Wed,  5 May 2021 00:02:07 +0200
Message-Id: <20210504220207.4004511-1-adrien.grassein@gmail.com>
X-Mailer: git-send-email 2.25.1
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
Cc: jernej.skrabec@siol.net, jonas@kwiboo.se, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, narmstrong@baylibre.com,
 linux-kernel@vger.kernel.org, robert.foss@linaro.org, a.hajda@samsung.com,
 Laurent.pinchart@ideasonboard.com, msuchanek@suse.de,
 adrien.grassein@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TE9OVElVTV9MVDg5MTJCIHVzZXMgImRybV9kaXNwbGF5X21vZGVfdG9fdmlkZW9tb2RlIiBmcm9t
CkRSTSBmcmFtZXdvcmsgdGhhdCBuZWVkcyBWSURFT01PREVfSEVMUEVSUyB0byBiZSBlbmFibGVk
LgoKRml4ZXM6IDMwZTJhZTk0M2MyNiAoImRybS9icmlkZ2U6IEludHJvZHVjZSBMVDg5MTJCIERT
SSB0byBIRE1JIGJyaWRnZSIpClJlcG9ydGVkLWJ5OiBNaWNoYWwgU3VjaMOhbmVrIDxtc3VjaGFu
ZWtAc3VzZS5kZT4KU2lnbmVkLW9mZi1ieTogQWRyaWVuIEdyYXNzZWluIDxhZHJpZW4uZ3Jhc3Nl
aW5AZ21haWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvS2NvbmZpZyB8IDEgKwog
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2JyaWRnZS9LY29uZmlnIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9LY29uZmlnCmluZGV4
IDQwMDE5M2UzOGQyOS4uNzBiY2NlYWFlOWJmIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
YnJpZGdlL0tjb25maWcKKysrIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9LY29uZmlnCkBAIC02
OCw2ICs2OCw3IEBAIGNvbmZpZyBEUk1fTE9OVElVTV9MVDg5MTJCCiAJc2VsZWN0IERSTV9LTVNf
SEVMUEVSCiAJc2VsZWN0IERSTV9NSVBJX0RTSQogCXNlbGVjdCBSRUdNQVBfSTJDCisJc2VsZWN0
IFZJREVPTU9ERV9IRUxQRVJTCiAJaGVscAogCSAgRHJpdmVyIGZvciBMb250aXVtIExUODkxMkIg
RFNJIHRvIEhETUkgYnJpZGdlCiAJICBjaGlwIGRyaXZlci4KLS0gCjIuMjUuMQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
