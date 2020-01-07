Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 885B8133CC7
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2020 09:13:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93D2B6E193;
	Wed,  8 Jan 2020 08:12:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AECC36E14C
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jan 2020 23:06:49 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id z3so1435673wru.3
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Jan 2020 15:06:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=k53sXXKoetFWE8GEEtNytoJYTuHWX23InQV8Qtu4GW8=;
 b=dENCSx36Ej5yYSporQHM0EZQIerJ0te/h42mTZ93EZeOg3JsA0ESBCTSif6qckRHaK
 rxYMyDM0wGr41OJ2wQeUr7uJj/nCJ8ALhT6f97PH0oGrtASQk3eYzqvQOtRH3qQWWWwx
 Ho396dQoJvVeasv15P595WzKK8uGDMOS1Gb7xy1PCzg5rStuXm783K0aXg8PvyEsqwcc
 0Kv2PcFCaSI0VcA/G9ZJ0gRUOB1v2TJnFP2eDUKvRyDpbozAEjmrT1BmVFLBNrGXTkxO
 khCbSxJQEspIlT9GtOklM+pRR9sEXoxc6beW7uWvF23m/lxNCBKzBu4R931JQ2k4H5DN
 O2dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=k53sXXKoetFWE8GEEtNytoJYTuHWX23InQV8Qtu4GW8=;
 b=Un5WHOdfRFY08bNuKztdz4bMi1+bAhmHUaSWWaiBYb1tdyr3byyLH7BeRFh2U93FUO
 onUxTBFk439umykg2K8jO9JLxhuz7np2MCjLrvcL7vD3kUY/mJIetO3jBMdtyhgDNc+R
 CS5nQpW8dk3k4rXcTSzEY1LMswHLT1HNjeqQK1AuuofE3wyjYw+3PkFEjBf0rd4eNPeI
 5ZKcf+Ws4ngXHcEYdaV3sxiHEGVr8aJulL+aM5V0uMbTYrxus32omfrvCCPMOzY3km+B
 nPjZjLROo7brQakAoPvFxvJ2RoOQaC58RhWw3yEEwLqYRt+y37vHwTR1ANMX2epVhuoy
 DxYA==
X-Gm-Message-State: APjAAAVKrkO9RNeGFDJJNsImpwyq68+8LQuOfSxSJ1uTzGXuuHVb6GRT
 L7h3Lrtjr4AV4YjQQkUpfuCUsncE+xk=
X-Google-Smtp-Source: APXvYqyl3Me0mVoi+rzI0uDTtUjURQ5KbxgWv7vhF2OviRpzvAMJ9EZQEFf+m7UCcWGXNpC/5ZwHsw==
X-Received: by 2002:a5d:6a88:: with SMTP id s8mr1270198wru.173.1578438408111; 
 Tue, 07 Jan 2020 15:06:48 -0800 (PST)
Received: from localhost.localdomain
 (p200300F1373A1900428D5CFFFEB99DB8.dip0.t-ipconnect.de.
 [2003:f1:373a:1900:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id g21sm1335912wmh.17.2020.01.07.15.06.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jan 2020 15:06:47 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: dri-devel@lists.freedesktop.org, alyssa@rosenzweig.io,
 steven.price@arm.com, tomeu.vizoso@collabora.com, robh@kernel.org
Subject: [PATCH RFT v1 0/3] devfreq fixes for panfrost
Date: Wed,  8 Jan 2020 00:06:23 +0100
Message-Id: <20200107230626.885451-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 08 Jan 2020 08:12:31 +0000
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-rockchip@lists.infradead.org, linux-amlogic@lists.infradead.org,
 robin.murphy@arm.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

These are a bunch of devfreq fixes for panfrost that came up in a
discussion with Robin Murphy during the code-review of the lima
devfreq patches: [0]

I am only able to test patch #1 properly because the only boards with
panfrost GPU that I have are using an Amlogic SoC. We don't have
support for the OPP tables or dynamic clock changes there yet.
So patches #2 and #3 are compile-tested only.


[0] https://patchwork.freedesktop.org/patch/346898/

Martin Blumenstingl (3):
  drm/panfrost: enable devfreq based the "operating-points-v2" property
  drm/panfrost: call dev_pm_opp_of_remove_table() in all error-paths
  drm/panfrost: Use the mali-supply regulator for control again

 drivers/gpu/drm/panfrost/panfrost_devfreq.c | 33 ++++++++++++++++++---
 drivers/gpu/drm/panfrost/panfrost_device.h  |  1 +
 2 files changed, 30 insertions(+), 4 deletions(-)

-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
