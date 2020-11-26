Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C1BDA2C5633
	for <lists+dri-devel@lfdr.de>; Thu, 26 Nov 2020 14:44:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 249526E958;
	Thu, 26 Nov 2020 13:43:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5780B6E960
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Nov 2020 13:43:43 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id x22so2182492wmc.5
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Nov 2020 05:43:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zLqbaHF4oQ5Kpx8U3OblV0PJbsOkOQQuGTnjvNzXmds=;
 b=zEVwjuFPYeI2CWymPGhLbmOeKMvU5W3/wdholUcUe5f/F7/8WIFuy6M4mCe2yTvJnf
 pBRES8hLWfSY4jRjS/Md271YTIjdVoLHGh+8kdCF9wNzy3YXwC+HOAfM3nibIIdNfowt
 i1TVSkH6uoteGEpwYjcBNUzX+ypeYJFKJsoLmaHNK9p5XgVq9YNMUv/1sxtKLLNokI4N
 WT4nfVAmbqBpmgp5DoptVNYdwvr3XqjgwDXKR8Vr0Y7zTdZBDzO8E4eL9iCyIsXjkQ/+
 AacXFu31oboKBxp6l7xi9WFI+noLXhM6aoe0OJrYzxVqCbccmnQ28laoCs8P71Ehozuk
 xvcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zLqbaHF4oQ5Kpx8U3OblV0PJbsOkOQQuGTnjvNzXmds=;
 b=bvgMJAGz/HBi5yvMRyxd/3PXLhLacehmdAQYDiuN2IiEO7r+cmaREUeF1wrR/Sjfjr
 9yNOGNX6EwHoHOZXFOCj0o366RZRfSCPO1trHcz82DtTap8XYvtSQuceIMLFUKxYMGhL
 G6Gc1SQEkJgciDj76V+xlC4HMlB5JTpjBTuqrWQc6MQYTT7mm3dqyw+kPcu/CKY8cP7W
 9FvMM5bwI1ObD83mC5o8M0sYbplHhYfeN7NLNDr9usPhWwIQn2c25eaL1WWyvu4NWWvA
 l13YCpP5quiAQEjMhrB3nDO7D9wIA6a4vT/g1IDPm9qdGA/KqavEO1YoNM6byUxGABAQ
 1ynw==
X-Gm-Message-State: AOAM5326F1A6HfLg4JnAnbQc9RtrbbroDuBsktL4tMHqIj364Mb1PM3n
 M1QqiIcRukmlu6GYL7nAPfawUg==
X-Google-Smtp-Source: ABdhPJxmBjpBm7+d3exEEq0cH0WG4UWwwz1Febmm2eAsCGEAZgFo/aK9XZK0D10TkghDYILLIkq8XA==
X-Received: by 2002:a1c:808d:: with SMTP id b135mr3423753wmd.45.1606398221973; 
 Thu, 26 Nov 2020 05:43:41 -0800 (PST)
Received: from dell.default ([91.110.221.235])
 by smtp.gmail.com with ESMTPSA id k205sm9275738wmk.4.2020.11.26.05.43.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Nov 2020 05:43:41 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 39/40] drm/amd/display/dc/basics/fixpt31_32: Remove unused
 variable 'dc_fixpt_pi'
Date: Thu, 26 Nov 2020 13:42:39 +0000
Message-Id: <20201126134240.3214176-40-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201126134240.3214176-1-lee.jones@linaro.org>
References: <20201126134240.3214176-1-lee.jones@linaro.org>
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
Cc: Leo Li <sunpeng.li@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9kYy9iYXNpY3MvZml4cHQzMV8zMi5jOjI5
OjMyOiB3YXJuaW5nOiDigJhkY19maXhwdF9waeKAmSBkZWZpbmVkIGJ1dCBub3QgdXNlZCBbLVd1
bnVzZWQtY29uc3QtdmFyaWFibGU9XQoKQ2M6IEhhcnJ5IFdlbnRsYW5kIDxoYXJyeS53ZW50bGFu
ZEBhbWQuY29tPgpDYzogTGVvIExpIDxzdW5wZW5nLmxpQGFtZC5jb20+CkNjOiBBbGV4IERldWNo
ZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+CkNjOiAiQ2hyaXN0aWFuIEvDtm5pZyIgPGNo
cmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5p
ZT4KQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KQ2M6IExlZSBKb25lcyA8bGVl
LmpvbmVzQGxpbmFyby5vcmc+CkNjOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpDYzog
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpTaWduZWQtb2ZmLWJ5OiBMZWUgSm9uZXMg
PGxlZS5qb25lc0BsaW5hcm8ub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9k
Yy9iYXNpY3MvZml4cHQzMV8zMi5jIHwgMSAtCiAxIGZpbGUgY2hhbmdlZCwgMSBkZWxldGlvbigt
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9iYXNpY3MvZml4
cHQzMV8zMi5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Jhc2ljcy9maXhwdDMx
XzMyLmMKaW5kZXggNTlmMzc1NjM3MDRhZC4uMTcyNmJkZjg5YmFlOCAxMDA2NDQKLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Jhc2ljcy9maXhwdDMxXzMyLmMKKysrIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Jhc2ljcy9maXhwdDMxXzMyLmMKQEAgLTI2LDcg
KzI2LDYgQEAKICNpbmNsdWRlICJkbV9zZXJ2aWNlcy5oIgogI2luY2x1ZGUgImluY2x1ZGUvZml4
ZWQzMV8zMi5oIgogCi1zdGF0aWMgY29uc3Qgc3RydWN0IGZpeGVkMzFfMzIgZGNfZml4cHRfcGkg
PSB7IDEzNDkzMDM3NzA1TEwgfTsKIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZml4ZWQzMV8zMiBkY19m
aXhwdF90d29fcGkgPSB7IDI2OTg2MDc1NDA5TEwgfTsKIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZml4
ZWQzMV8zMiBkY19maXhwdF9sbjIgPSB7IDI5NzcwNDQ0NzFMTCB9Owogc3RhdGljIGNvbnN0IHN0
cnVjdCBmaXhlZDMxXzMyIGRjX2ZpeHB0X2xuMl9kaXZfMiA9IHsgMTQ4ODUyMjIzNkxMIH07Ci0t
IAoyLjI1LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
