Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B8E9207685
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jun 2020 17:04:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 974B26E161;
	Wed, 24 Jun 2020 15:04:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B41A36E14C
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jun 2020 15:04:43 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id o2so2855461wmh.2
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jun 2020 08:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2m2sUpZpH0jbtcmYyVNBHchLvKZgU+7xWa4xsqTn03E=;
 b=PruqKI5rmzrEACi4Yw4FtuSd9KORHRlamVPBe3qqmkvNpFexwSdnG4SfgHltKStskh
 mva5w7RUtjo3uJjAaI+cNW5KHVSgyGm6ZovablsXX1U9W9K4v+NyOkE72Byf+dTKKkgE
 KOiaRHTpCyuRsf5J4jAvNqqmU5btGJgwguhNQ1BnWbgdjRr0p5D4jtr91lroWU6vR32F
 GCrDJDEiF8/7dfj64lTWImISFa4Np+pVFYTSpf4pdqvc65aSjeHo5ob/hmAWaljIMH3r
 IggB0GwSnJRl6TjfzWrKX7nxh1UouC0/BKxUinGbWcmXeU2MgDrLsAVtrnjkOC5zhHKr
 ZfEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2m2sUpZpH0jbtcmYyVNBHchLvKZgU+7xWa4xsqTn03E=;
 b=BGO5TE87UB2Cbh+BoOkNDWuaso9hocQhci1QmXhiKPzZ3y0F1fZFuI2zhTmaKnCQ/F
 mowom3TihpmX8eWsgBIE/zy7r/TxF4gXtU4AhKRfrqO/ymHf1RDHrV35Mr4Q1yleoMWO
 GDjA4/cXuoRaE3IOia/SywwgnCg8mwAErcNGZHm9Z83Vfc+gtASUXBHKpItYnA57LB3U
 uk5/iOgQGu1dajMbuA831w/sXXPitLV5JnAnKDVNleEn76lHflvl+Pr0SXmeTgndIfhi
 qKRuBzi8xN/4z1whezlN6aLgReWJAS6r+dCDCO+kxhm1JclMu7D9kojpGjAypIU/W/xm
 mwcw==
X-Gm-Message-State: AOAM532eBo5PVysWI9xStvPAw1BOcGHwOnTSUNesejmlR79PHred9Lcf
 QINjcPMXFmCLrBy1lZ7E1r1TJQ==
X-Google-Smtp-Source: ABdhPJxniWUuhOK6ni3DT7xPMV5Jy7/0VJHnvI3QDRXhrWY/QDvZQXT5F80At1ygpltfaC/n543E1A==
X-Received: by 2002:a1c:c90a:: with SMTP id f10mr17453319wmb.121.1593011081473; 
 Wed, 24 Jun 2020 08:04:41 -0700 (PDT)
Received: from localhost.localdomain ([2.27.35.144])
 by smtp.gmail.com with ESMTPSA id f186sm8200319wmf.29.2020.06.24.08.04.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jun 2020 08:04:40 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: daniel.thompson@linaro.org, jingoohan1@gmail.com,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Subject: [PATCH 1/8] backlight: lms501kf03: Remove unused const variables
Date: Wed, 24 Jun 2020 15:57:14 +0100
Message-Id: <20200624145721.2590327-2-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200624145721.2590327-1-lee.jones@linaro.org>
References: <20200624145721.2590327-1-lee.jones@linaro.org>
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
Cc: stable@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Vz0xIGtlcm5lbCBidWlsZCByZXBvcnRzOgoKIGRyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L2xtczUw
MWtmMDMuYzo5NjoyODogd2FybmluZzog4oCYc2VxX3NsZWVwX2lu4oCZIGRlZmluZWQgYnV0IG5v
dCB1c2VkIFstV3VudXNlZC1jb25zdC12YXJpYWJsZT1dCiA5NiB8IHN0YXRpYyBjb25zdCB1bnNp
Z25lZCBjaGFyIHNlcV9zbGVlcF9pbltdID0gewogfCBefn5+fn5+fn5+fn4KIGRyaXZlcnMvdmlk
ZW8vYmFja2xpZ2h0L2xtczUwMWtmMDMuYzo5MjoyODogd2FybmluZzog4oCYc2VxX3VwX2Ru4oCZ
IGRlZmluZWQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC1jb25zdC12YXJpYWJsZT1dCiA5MiB8IHN0
YXRpYyBjb25zdCB1bnNpZ25lZCBjaGFyIHNlcV91cF9kbltdID0gewogfCBefn5+fn5+fn4KCkVp
dGhlciAnc2VxX3NsZWVwX2luJyBub3IgJ3NlcV91cF9kbicgaGF2ZSBiZWVuIHVzZWQgc2luY2Ug
dGhlCmRyaXZlciBmaXJzdCBsYW5kZWQgaW4gMjAxMy4KCkNjOiA8c3RhYmxlQHZnZXIua2VybmVs
Lm9yZz4KQ2M6IEJhcnRsb21pZWogWm9sbmllcmtpZXdpY3ogPGIuem9sbmllcmtpZUBzYW1zdW5n
LmNvbT4KU2lnbmVkLW9mZi1ieTogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4KLS0t
CiBkcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9sbXM1MDFrZjAzLmMgfCA4IC0tLS0tLS0tCiAxIGZp
bGUgY2hhbmdlZCwgOCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpZGVvL2Jh
Y2tsaWdodC9sbXM1MDFrZjAzLmMgYi9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9sbXM1MDFrZjAz
LmMKaW5kZXggOGFlMzJlMzU3M2MxYS4uYzFiZDAyYmI4YjJlZSAxMDA2NDQKLS0tIGEvZHJpdmVy
cy92aWRlby9iYWNrbGlnaHQvbG1zNTAxa2YwMy5jCisrKyBiL2RyaXZlcnMvdmlkZW8vYmFja2xp
Z2h0L2xtczUwMWtmMDMuYwpAQCAtODksMTQgKzg5LDYgQEAgc3RhdGljIGNvbnN0IHVuc2lnbmVk
IGNoYXIgc2VxX3JnYl9nYW1tYVtdID0gewogCTB4MDAsIDB4MDAsIDB4MDAsIDB4MDAsIDB4MDAs
IDB4MDAsIDB4MDAsIDB4MDAsCiB9OwogCi1zdGF0aWMgY29uc3QgdW5zaWduZWQgY2hhciBzZXFf
dXBfZG5bXSA9IHsKLQkweDM2LCAweDEwLAotfTsKLQotc3RhdGljIGNvbnN0IHVuc2lnbmVkIGNo
YXIgc2VxX3NsZWVwX2luW10gPSB7Ci0JMHgxMCwKLX07Ci0KIHN0YXRpYyBjb25zdCB1bnNpZ25l
ZCBjaGFyIHNlcV9zbGVlcF9vdXRbXSA9IHsKIAkweDExLAogfTsKLS0gCjIuMjUuMQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
