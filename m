Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C59086D5FB9
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 13:58:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CE8210E133;
	Tue,  4 Apr 2023 11:58:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CE2D10E133
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Apr 2023 11:58:20 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id eg48so129416678edb.13
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Apr 2023 04:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680609499;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6qUaOa2uX1gKDWpiZadVZORgyny6GtQJAOnTp2fBPDE=;
 b=clVFHpwrwDMHPqPS9Wddw/GxlJyM4PUazm0Fmj/TVQVELl/cUjgKgg8ZGdwwDpIsYz
 tZbPk9VTciPOsM3jsEUdCxhbN233xzE8vxov6EBAwRKM0ZCKHQWB1+ylP2Hehu/upFlh
 VMn2jfZM75Fgi3p1Ss9vq3zPZu6jZuNlKl9HoD1sClJkc6Y+CE+Jm/D4bkOIDo64/b1K
 r7ryHbwU8EIZIAm5KInudcClM3JM2xjDqu+5IERx5JMUQ/+K5K6cuTgAI9BbPtyOJTtp
 aNS0wkqsAZ0xXeHXXnKcmAT5drAksNYwoPKIT6e+XaCidMmxoUDTlnGiH3yXG8vUBpEG
 hxpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680609499;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6qUaOa2uX1gKDWpiZadVZORgyny6GtQJAOnTp2fBPDE=;
 b=M+ihn+ON8EQuQm4IdAJX0SZMFX9Bp7eSUmxb4TO+bIsrYAHwUESj3VQQsqB7kUP530
 uVTODdMSUUUwOu1kIk5nGNEmjOJGlKht9wLs68wBxUR55EVQaIR/vsHNXcV6nbqfqvbE
 rR0hxC5cuCCf9LvNg9KP0l/QZuH8VLUVewqDBMbgOif7OkTx2pEtjY6YQURZOpa9gIYd
 9OPENet4LqafGyrSexeV4rpCATbFqAqNpCCCj95o55a0EJw0ExVoRiVLNA/SRb32zvpf
 PES5/Mbg+ijrohWBcLZH55CFbQ27nf90qxj1ViNung6c3nKsVwFRApkpWJ0+ws+pwpGs
 1HVA==
X-Gm-Message-State: AAQBX9dg2ECoc8R2vmM114G7ua5HygebM3ij0LwVLDT+CtkunBsKiQIV
 GKqTHUuE7SoW8C43ab2c1aM=
X-Google-Smtp-Source: AKy350Y9toub7VBZMdCkxwbC6TjPoCY4ZkUxKfXrPohSqWAz06kxohADFXZsOAqT5dahuy8ImUP7wQ==
X-Received: by 2002:aa7:c259:0:b0:501:d43e:d1e5 with SMTP id
 y25-20020aa7c259000000b00501d43ed1e5mr2353060edo.2.1680609498594; 
 Tue, 04 Apr 2023 04:58:18 -0700 (PDT)
Received: from localhost
 (p200300e41f1c0800f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f1c:800:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 s17-20020a50ab11000000b004af7191fe35sm5818223edc.22.2023.04.04.04.58.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Apr 2023 04:58:18 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH] MAINTAINERS: Add Mikko as backup maintainer for Tegra DRM
Date: Tue,  4 Apr 2023 13:58:15 +0200
Message-Id: <20230404115815.2052620-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Mikko Perttunen <mperttunen@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Thierry Reding <treding@nvidia.com>

Mikko has been involved as the primary author of the host1x driver and
has volunteered to help out with maintenance.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 7bfa5228d1ea..0a517baef16e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7047,6 +7047,7 @@ F:	drivers/phy/mediatek/phy-mtk-mipi*
 
 DRM DRIVERS FOR NVIDIA TEGRA
 M:	Thierry Reding <thierry.reding@gmail.com>
+M:	Mikko Perttunen <mperttunen@nvidia.com>
 L:	dri-devel@lists.freedesktop.org
 L:	linux-tegra@vger.kernel.org
 S:	Supported
-- 
2.40.0

