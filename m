Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25CF92F83B9
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jan 2021 19:17:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6354B6E504;
	Fri, 15 Jan 2021 18:16:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A348A6E4EA
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 18:16:44 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id 190so8232582wmz.0
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 10:16:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=j+QQ91dB4nAV9iX95BjLXpaQb9N2TCvRIGQTNY+K7sU=;
 b=yL85iXlSpJyIEsW9uR5KjI1ME5UqZGtzQv4FY99XBi+FD088mPsLJUgEUFKevvrlE9
 ksl9DXvhysqqBdDc7ZadLjyb25WhWQ3i98QOp0XqAdIZxIWspprCXgzshIS98HW4wMGh
 I+dGjog07idrdB7GQ459SKQnXFCQ4I9gK+KFnSmHEK1XhiM5kcv9UoCyCxCQC61JS0ll
 ++XOFxnTRs1eBVYdPEs8eE+RG4iiu7oN+whS/TdHU+B6/+ipOqkC164lqBL+udM5S+Pe
 D+5z0HQ/r2jtn0PRy9nwsj2+X61EY1IqPKGMyzXLvzaeE1LhdUG1dXwChy5gE9CV1QlA
 lmVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=j+QQ91dB4nAV9iX95BjLXpaQb9N2TCvRIGQTNY+K7sU=;
 b=mqaCrIpqoR8pKbc0nPG3jGJbpTEXKbTvtewNe4AnL4nWWWKaDZXFj1hF1q/ercpEOb
 5W3s0Xb7pDBPajALQMsOg7C1QBXV+gBqQ9Yhv83yJ4tvJD/WGepv9VWcJgetWMybVbNT
 hVWw5sFv7GZUvAR28udDffm3dbxuetxNBfZLDl8+TJ/7ge6baPBd4vvq78eBxXGeqf0Q
 UBw50L/QB1iTxiOEDK21qtX1aWwb3Qz6dO6J2NpA6TCgjsywi5EGkfeqLOnOQq/5VZqG
 2rKGeomQdLsUZlsjtpTL+M52Y0pCm8GTy01h9b9644W/J/zSuzRS6URThrS9Wg5XNOhY
 vQ7Q==
X-Gm-Message-State: AOAM533AatNH4Guu43x7L1KQZk8suRMqLOQ+UnG73204syYog6F0hwN/
 TDGDkfpjC9tUPFMvO2wErMTd2A==
X-Google-Smtp-Source: ABdhPJwD+S7K+2xo6XGPzpZWOm/R/Wcr70/IAr4BByEl7I7vZ/Ps4PA7dJVttdYLp/fDi5wADTpg5g==
X-Received: by 2002:a1c:4b14:: with SMTP id y20mr2838766wma.6.1610734603340;
 Fri, 15 Jan 2021 10:16:43 -0800 (PST)
Received: from dell.default ([91.110.221.158])
 by smtp.gmail.com with ESMTPSA id b133sm14405979wme.33.2021.01.15.10.16.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 10:16:42 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 27/29] drm/nouveau/nouveau_bios: Remove unused variable 'pdev'
 from 'nouveau_bios_init()'
Date: Fri, 15 Jan 2021 18:15:59 +0000
Message-Id: <20210115181601.3432599-28-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210115181601.3432599-1-lee.jones@linaro.org>
References: <20210115181601.3432599-1-lee.jones@linaro.org>
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
cy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9iaW9zLmM6IEluIGZ1bmN0aW9uIOKAmG5vdXZlYXVf
Ymlvc19pbml04oCZOgogZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9iaW9zLmM6MjA4
NjoxODogd2FybmluZzogdmFyaWFibGUg4oCYcGRlduKAmSBzZXQgYnV0IG5vdCB1c2VkIFstV3Vu
dXNlZC1idXQtc2V0LXZhcmlhYmxlXQoKQ2M6IEJlbiBTa2VnZ3MgPGJza2VnZ3NAcmVkaGF0LmNv
bT4KQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KQ2M6IERhbmllbCBWZXR0ZXIg
PGRhbmllbEBmZndsbC5jaD4KQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKQ2M6
IG5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnClNpZ25lZC1vZmYtYnk6IExlZSBKb25lcyA8
bGVlLmpvbmVzQGxpbmFyby5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVh
dV9iaW9zLmMgfCAyIC0tCiAxIGZpbGUgY2hhbmdlZCwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2Jpb3MuYyBiL2RyaXZlcnMvZ3B1
L2RybS9ub3V2ZWF1L25vdXZlYXVfYmlvcy5jCmluZGV4IDdjYzY4M2I4ZGM3YTYuLmU4YzQ0NWVi
MTEwMDQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfYmlvcy5j
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfYmlvcy5jCkBAIC0yMDgzLDEz
ICsyMDgzLDExIEBAIG5vdXZlYXVfYmlvc19pbml0KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYpCiB7
CiAJc3RydWN0IG5vdXZlYXVfZHJtICpkcm0gPSBub3V2ZWF1X2RybShkZXYpOwogCXN0cnVjdCBu
dmJpb3MgKmJpb3MgPSAmZHJtLT52YmlvczsKLQlzdHJ1Y3QgcGNpX2RldiAqcGRldjsKIAlpbnQg
cmV0OwogCiAJLyogb25seSByZWxldmFudCBmb3IgUENJIGRldmljZXMgKi8KIAlpZiAoIWRldl9p
c19wY2koZGV2LT5kZXYpKQogCQlyZXR1cm4gMDsKLQlwZGV2ID0gdG9fcGNpX2RldihkZXYtPmRl
dik7CiAKIAlpZiAoIU5WSW5pdFZCSU9TKGRldikpCiAJCXJldHVybiAtRU5PREVWOwotLSAKMi4y
NS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
