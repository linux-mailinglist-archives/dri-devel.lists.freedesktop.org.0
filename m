Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81DB72F4D91
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jan 2021 15:50:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B530E6EA5B;
	Wed, 13 Jan 2021 14:50:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFD9B6EA51
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 14:50:34 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id g10so1855229wmh.2
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 06:50:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=j7fOAdOMSh9+aZXnWVlTBiJqXaPtT0tmJFJgVlyDPug=;
 b=wkKY3gUVpw4qP/WuQzc8XjrzRncVeSuZ6NzeUbALePTgU3Yrbw7YLTdHcXZj56nxVU
 5Jh4wNloszsqH/vVqJxDDwBSRrJ2OCTzKTPcd5JzNVT5XIiv2M5crt5y5UskqbNAQTBB
 KvR9s7UwwCew+cXB1M/8JHMnIwXdbQxIScTfFklRChWJUy40Q3CuOodobSh9Um18qIvs
 FEHYZzDJPaKk06OPv4/h1Mi2+ufc5Xt/BqkVcO0w1K9kWocAZk5NMITW/2XtGYuEHFGY
 KaZnlzcDkLV1OrVCrmMpjQPrdUpM4TmeGqpdDN4K+fWyND84c6a9egSMvCEW1eojZ/Tv
 wkMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=j7fOAdOMSh9+aZXnWVlTBiJqXaPtT0tmJFJgVlyDPug=;
 b=Uvozc5ph6J3v8VkwZP5FC+ZRbpdY2cc/Xo+6R6gbbxk5JycLbMgdYj9w3dfX1hRROz
 9aBgCwRCz/jJwOO2jZj8rWqdOUdeq9xfl5g0m0gQHz/zSuVbjpe6aTbFhHBXcdHFKOWr
 ZfUdCQnV2NNsu23N00Qt8PwpXQwQVAGbJ/FZF8ecd88mRHJ8M8jQSuiKuLz5rOKnGPGB
 JsDy7f6aYusHHCkCBQNvfea1mKuLjtDJJaQxjkbSxyohKRV7Y38ZqeX4S/wpGDUEgmmh
 p1M2vFEPjbsU38GaXKiy8qibpFp65m74Y6fl1Woqm2nVhRW5FduBqWJdFOLsp+pMB12r
 vO7A==
X-Gm-Message-State: AOAM532xNHPJKcG68Gb6db1IXnvR9d06qdG2K3e4OIgqFjiBdWqijSCp
 48Daeq9hgE3ZIboM3pYGUWgdeA==
X-Google-Smtp-Source: ABdhPJwgWbKyROyg3P7kZzj3BsF17xohBzHH0P8bPH1Fo1biBkBRZcCRyPVkV1Whe5OHdIZxjMwpOQ==
X-Received: by 2002:a1c:cc14:: with SMTP id h20mr2564071wmb.180.1610549433405; 
 Wed, 13 Jan 2021 06:50:33 -0800 (PST)
Received: from dell.default ([91.110.221.229])
 by smtp.gmail.com with ESMTPSA id t188sm3273433wmf.9.2021.01.13.06.50.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jan 2021 06:50:32 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 12/31] video: fbdev: sis: oem310: Remove some unused static
 const tables
Date: Wed, 13 Jan 2021 14:49:50 +0000
Message-Id: <20210113145009.1272040-13-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210113145009.1272040-1-lee.jones@linaro.org>
References: <20210113145009.1272040-1-lee.jones@linaro.org>
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
Cc: linux-fbdev@vger.kernel.org, Thomas Winischhofer <thomas@winischhofer.net>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy92aWRlby9mYmRldi9zaXMvb2VtMzEwLmg6MjEzOjI4OiB3YXJuaW5nOiDigJhTaVNfVFZEZWxh
eTY2MV8zMDFC4oCZIGRlZmluZWQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC1jb25zdC12YXJpYWJs
ZT1dCiBkcml2ZXJzL3ZpZGVvL2ZiZGV2L3Npcy9vZW0zMTAuaDoyMDM6Mjg6IHdhcm5pbmc6IOKA
mFNpU19UVkRlbGF5NjYxXzMwMeKAmSBkZWZpbmVkIGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQtY29u
c3QtdmFyaWFibGU9XQoKQ2M6IFRob21hcyBXaW5pc2NoaG9mZXIgPHRob21hc0B3aW5pc2NoaG9m
ZXIubmV0PgpDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpDYzogbGludXgtZmJk
ZXZAdmdlci5rZXJuZWwub3JnClNpZ25lZC1vZmYtYnk6IExlZSBKb25lcyA8bGVlLmpvbmVzQGxp
bmFyby5vcmc+Ci0tLQogZHJpdmVycy92aWRlby9mYmRldi9zaXMvb2VtMzEwLmggfCAyMCAtLS0t
LS0tLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDIwIGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvdmlkZW8vZmJkZXYvc2lzL29lbTMxMC5oIGIvZHJpdmVycy92aWRlby9m
YmRldi9zaXMvb2VtMzEwLmgKaW5kZXggOGZjZTU2ZTQ0ODJjMC4uNWY3YjUwM2VkMmEwNiAxMDA2
NDQKLS0tIGEvZHJpdmVycy92aWRlby9mYmRldi9zaXMvb2VtMzEwLmgKKysrIGIvZHJpdmVycy92
aWRlby9mYmRldi9zaXMvb2VtMzEwLmgKQEAgLTIwMCwyNiArMjAwLDYgQEAgc3RhdGljIGNvbnN0
IHVuc2lnbmVkIGNoYXIgU2lTMzEwX1RWRGVsYXlDb21wZW5zYXRpb25fNjUxMzAyTFZbXSA9CS8q
IE02NTAsIDY1MSwKIAkweDMzLDB4MzMKIH07CiAKLXN0YXRpYyBjb25zdCB1bnNpZ25lZCBjaGFy
IFNpU19UVkRlbGF5NjYxXzMwMVtdID0JCQkvKiA2NjEsIDMwMSAqLwotewotCTB4NDQsMHg0NCwK
LQkweDQ0LDB4NDQsCi0JMHgwMCwweDAwLAotCTB4NDQsMHg0NCwKLQkweDQ0LDB4NDQsCi0JMHg0
NCwweDQ0Ci19OwotCi1zdGF0aWMgY29uc3QgdW5zaWduZWQgY2hhciBTaVNfVFZEZWxheTY2MV8z
MDFCW10gPQkJCS8qIDY2MSwgMzAxQiBldCBhbCAqLwotewotCTB4NDQsMHg0NCwKLQkweDQ0LDB4
NDQsCi0JMHgwMCwweDAwLAotCTB4NDQsMHg0NCwKLQkweDQ0LDB4NDQsCi0JMHg0NCwweDQ0Ci19
OwotCiBzdGF0aWMgY29uc3QgdW5zaWduZWQgY2hhciBTaVMzMTBfVFZEZWxheUNvbXBlbnNhdGlv
bl9MVkRTW10gPQkJLyogTFZEUyAqLwogewogCTB4MGEsMHgwYSwKLS0gCjIuMjUuMQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
