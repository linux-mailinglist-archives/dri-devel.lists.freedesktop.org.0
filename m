Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 98DEE2B1C54
	for <lists+dri-devel@lfdr.de>; Fri, 13 Nov 2020 14:51:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACA516E575;
	Fri, 13 Nov 2020 13:50:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62E706E511
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Nov 2020 13:50:30 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id h62so8560508wme.3
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Nov 2020 05:50:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EDpB8DJIxR3jn2HzXeLA+icgO29vYDcRaE35hFlk2BE=;
 b=xIlC+2K+XYDZ+rTp6LZiqDhAqdaaUgTdllMZL9+PC1pySaKIQasGv8o2+CQoxTqZUD
 L3p3GctSvAXx3y7UDhb5DSEO/nCrfdaHblbvRwS0vCzopYHsXxwlI8SF5JbJL4DZvl/9
 Adp8oG85dctR8fZHkUZO4a+7hHGgzbpR4w37rQulCOId2h1mz/HnPszo7lEjBvdJWlCL
 PgxsXrc0c2N8v+s/bIbJshbi08znIF3utk+UtULiHcTVPRxGvfPNsbgSKZZoCfEZCHJh
 7XOh94nci93PGpDkOnb/zlG0NX8NxJ2zel0a50LZG+SDsMRbAgPHo8b+rTPla0PT5LpI
 tGcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EDpB8DJIxR3jn2HzXeLA+icgO29vYDcRaE35hFlk2BE=;
 b=sjSIpSrcP/SVuTlYqv3SCWXjIg5z1u6ynI9AfFHKmfFsKdwq3N7UeUC28euPsozgW/
 DlQfAiRqAvocC947yX67/pDen/IFB3ihrYZBcsyHgtRd2jD+hclVqtj6me8L0It5SeXh
 pAjJ/YHPKHNGYcUSokUMZGCYiYuDcvTG8Zkb3SnS6IpYavNk6Trg+uYaudn1pp22XuFs
 UiKJC+zf/EDBsdaJdZHrGFSnUGC5yEyjXXr4aCw0B+n5gHzOirLmirR5rS7tNw7wIh+R
 V67tg1qO8SMt0E15IDZxltXQORYz6cZvEv+qGF8Zi031OFiSfJKbXrxiV/8ukJlaypch
 MvHw==
X-Gm-Message-State: AOAM530c4rhf2n1qbVKzDBslGB5k8Jhr5CKSrq83EYj95khRg8siBFtQ
 UWo1AUA9d2r1M5nt83nBYzxElg==
X-Google-Smtp-Source: ABdhPJwTMip6HQ19kIHE7kmLBaCswrHOb/GOeK3FDkjZ48e7s3r62xGVb1Rj8aohA/SUgBUz56aIhw==
X-Received: by 2002:a1c:61d4:: with SMTP id v203mr2625667wmb.1.1605275429063; 
 Fri, 13 Nov 2020 05:50:29 -0800 (PST)
Received: from dell.default ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id t11sm4561614wrm.8.2020.11.13.05.50.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Nov 2020 05:50:28 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 38/40] drm/msm/disp/dpu1/dpu_core_perf: Remove set but unused
 variable 'dpu_cstate'
Date: Fri, 13 Nov 2020 13:49:36 +0000
Message-Id: <20201113134938.4004947-39-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201113134938.4004947-1-lee.jones@linaro.org>
References: <20201113134938.4004947-1-lee.jones@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Kalyan Thota <kalyan_t@codeaurora.org>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2NvcmVfcGVyZi5jOiBJbiBmdW5jdGlvbiDigJhf
ZHB1X2NvcmVfcGVyZl9jYWxjX2NydGPigJk6CiBkcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1
MS9kcHVfY29yZV9wZXJmLmM6MTEzOjI1OiB3YXJuaW5nOiB2YXJpYWJsZSDigJhkcHVfY3N0YXRl
4oCZIHNldCBidXQgbm90IHVzZWQgWy1XdW51c2VkLWJ1dC1zZXQtdmFyaWFibGVdCgpDYzogUm9i
IENsYXJrIDxyb2JkY2xhcmtAZ21haWwuY29tPgpDYzogU2VhbiBQYXVsIDxzZWFuQHBvb3JseS5y
dW4+CkNjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+CkNjOiBEYW5pZWwgVmV0dGVy
IDxkYW5pZWxAZmZ3bGwuY2g+CkNjOiBLYWx5YW4gVGhvdGEgPGthbHlhbl90QGNvZGVhdXJvcmEu
b3JnPgpDYzogbGludXgtYXJtLW1zbUB2Z2VyLmtlcm5lbC5vcmcKQ2M6IGRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKQ2M6IGZyZWVkcmVub0BsaXN0cy5mcmVlZGVza3RvcC5vcmcKU2ln
bmVkLW9mZi1ieTogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4KLS0tCiBkcml2ZXJz
L2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfY29yZV9wZXJmLmMgfCAzIC0tLQogMSBmaWxlIGNo
YW5nZWQsIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21zbS9k
aXNwL2RwdTEvZHB1X2NvcmVfcGVyZi5jIGIvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEv
ZHB1X2NvcmVfcGVyZi5jCmluZGV4IDM3YzgyNzA2ODFjMjMuLjM2OTI3ZmMwNGEzODggMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9jb3JlX3BlcmYuYworKysg
Yi9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfY29yZV9wZXJmLmMKQEAgLTExMCwx
NCArMTEwLDExIEBAIHN0YXRpYyB2b2lkIF9kcHVfY29yZV9wZXJmX2NhbGNfY3J0YyhzdHJ1Y3Qg
ZHB1X2ttcyAqa21zLAogCQlzdHJ1Y3QgZHJtX2NydGNfc3RhdGUgKnN0YXRlLAogCQlzdHJ1Y3Qg
ZHB1X2NvcmVfcGVyZl9wYXJhbXMgKnBlcmYpCiB7Ci0Jc3RydWN0IGRwdV9jcnRjX3N0YXRlICpk
cHVfY3N0YXRlOwotCiAJaWYgKCFrbXMgfHwgIWttcy0+Y2F0YWxvZyB8fCAhY3J0YyB8fCAhc3Rh
dGUgfHwgIXBlcmYpIHsKIAkJRFBVX0VSUk9SKCJpbnZhbGlkIHBhcmFtZXRlcnNcbiIpOwogCQly
ZXR1cm47CiAJfQogCi0JZHB1X2NzdGF0ZSA9IHRvX2RwdV9jcnRjX3N0YXRlKHN0YXRlKTsKIAlt
ZW1zZXQocGVyZiwgMCwgc2l6ZW9mKHN0cnVjdCBkcHVfY29yZV9wZXJmX3BhcmFtcykpOwogCiAJ
aWYgKGttcy0+cGVyZi5wZXJmX3R1bmUubW9kZSA9PSBEUFVfUEVSRl9NT0RFX01JTklNVU0pIHsK
LS0gCjIuMjUuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
Cg==
