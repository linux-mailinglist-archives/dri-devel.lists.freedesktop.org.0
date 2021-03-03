Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 64FF932B819
	for <lists+dri-devel@lfdr.de>; Wed,  3 Mar 2021 14:43:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAE226E8F4;
	Wed,  3 Mar 2021 13:43:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41E5989E69
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Mar 2021 13:43:32 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id e23so5213846wmh.3
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Mar 2021 05:43:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RtDwwCGh7BV2jdAMFgyU0jxW3SadS1NJKEYSwbpKHII=;
 b=sRgB8t25PZ10NkKal1+Peihtxu3GBrpIEwtbkDw27UzpVFQ3vx8N1Mf2WTQ7ghbjVQ
 Xl76lwrOvw1fNHzen5mLV36KjI+ddlwXHlxOFhD0iqCJg9U/mdhCaSpzgc5ppVg7T+kA
 tAcDT+por1yZTddeRmmq1oEn72Qig/It4dAOaIhLvuW4PJFhrOa8jzeYlneKPloH7vKQ
 8EMprRzfE6UxTKOqziJbd+JBDsTyYgkr0ZdR7nvsGLCtsQTIBRql7VF76lFxSiwe6A0y
 Gociy9qIFajV/I1guI1glaRMFdlcm1bOgG2ONLUZ9H8DB4KHNtljK5w8/L5xkCFNKA2U
 hChQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RtDwwCGh7BV2jdAMFgyU0jxW3SadS1NJKEYSwbpKHII=;
 b=KEySSUr7W0BR+REfo/NjpcdoBDmwqLXaVCXqjkGn/+XsM36T7TBnMAuz0jVv+0sa87
 ecsuzahT4kfJrNmRoiCuAczbkf5rtZMtrVa3AFjzEcjYapact8x/kBaP6MJHhJ7+1htM
 Maq0izSzsiAfJWVhDvUm2/+uxYfNmkQCqIFge8JO92j+7Py8bj8b6ObWWsTKZKfuvbMl
 AbRIzvlPH6dhXK3pB1StbRbsObVA+6/V9/ZFXTsdLIfljZRsXmJgIdN6G7pU9LlKKlKM
 24ljgpLcaWtAv1a1WA8/RkUqaJ0p4jfgkOoId1X7kKIVJaC0rf2HH4dPtb5zPBLP+1mk
 EnJQ==
X-Gm-Message-State: AOAM530dIjzewY3ZidFDms5f7GhDA3YktIRIulYwfUavriz0izDpNnZU
 VNb1efgwUpiD/5xOHwKqWSx/8w==
X-Google-Smtp-Source: ABdhPJzkSWfUf5AtDHRBf8M7UDr5+MfhzhlBIZuFec+xGndDdtkpKDFTGPC1IOEXNzz1Uowj2875Lg==
X-Received: by 2002:a1c:400b:: with SMTP id n11mr9078519wma.167.1614779011028; 
 Wed, 03 Mar 2021 05:43:31 -0800 (PST)
Received: from dell.default ([91.110.221.155])
 by smtp.gmail.com with ESMTPSA id w18sm6109524wrr.7.2021.03.03.05.43.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 05:43:30 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 02/53] drm/nouveau/dispnv50/disp: Remove unused variable 'ret'
Date: Wed,  3 Mar 2021 13:42:28 +0000
Message-Id: <20210303134319.3160762-3-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210303134319.3160762-1-lee.jones@linaro.org>
References: <20210303134319.3160762-1-lee.jones@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL25vdXZlYXUvZGlzcG52NTAvZGlzcC5jOjEzODE6Njogd2FybmluZzogdmFyaWFi
bGUg4oCYcmV04oCZIHNldCBidXQgbm90IHVzZWQgWy1XdW51c2VkLWJ1dC1zZXQtdmFyaWFibGVd
CgpDYzogQmVuIFNrZWdncyA8YnNrZWdnc0ByZWRoYXQuY29tPgpDYzogRGF2aWQgQWlybGllIDxh
aXJsaWVkQGxpbnV4LmllPgpDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgpDYzog
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpDYzogbm91dmVhdUBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKU2lnbmVkLW9mZi1ieTogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4K
LS0tCiBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9kaXNwbnY1MC9kaXNwLmMgfCAzICstLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3BudjUwL2Rpc3AuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9ub3V2ZWF1L2Rpc3BudjUwL2Rpc3AuYwppbmRleCAxOTY2MTJhZGRmZDYxLi5jNTFlZmNhODJh
Yzc4IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9kaXNwbnY1MC9kaXNwLmMK
KysrIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvZGlzcG52NTAvZGlzcC5jCkBAIC0xNDEwLDEw
ICsxNDEwLDkgQEAgbnY1MF9tc3RtX3ByZXBhcmUoc3RydWN0IG52NTBfbXN0bSAqbXN0bSkKIHsK
IAlzdHJ1Y3Qgbm91dmVhdV9kcm0gKmRybSA9IG5vdXZlYXVfZHJtKG1zdG0tPm91dHAtPmJhc2Uu
YmFzZS5kZXYpOwogCXN0cnVjdCBkcm1fZW5jb2RlciAqZW5jb2RlcjsKLQlpbnQgcmV0OwogCiAJ
TlZfQVRPTUlDKGRybSwgIiVzOiBtc3RtIHByZXBhcmVcbiIsIG1zdG0tPm91dHAtPmJhc2UuYmFz
ZS5uYW1lKTsKLQlyZXQgPSBkcm1fZHBfdXBkYXRlX3BheWxvYWRfcGFydDEoJm1zdG0tPm1ncik7
CisJZHJtX2RwX3VwZGF0ZV9wYXlsb2FkX3BhcnQxKCZtc3RtLT5tZ3IpOwogCiAJZHJtX2Zvcl9l
YWNoX2VuY29kZXIoZW5jb2RlciwgbXN0bS0+b3V0cC0+YmFzZS5iYXNlLmRldikgewogCQlpZiAo
ZW5jb2Rlci0+ZW5jb2Rlcl90eXBlID09IERSTV9NT0RFX0VOQ09ERVJfRFBNU1QpIHsKLS0gCjIu
MjcuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
