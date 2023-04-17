Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BAEB36E515E
	for <lists+dri-devel@lfdr.de>; Mon, 17 Apr 2023 22:07:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25FAA10E45B;
	Mon, 17 Apr 2023 20:07:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DFCA10E357
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Apr 2023 20:07:01 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-1a645fd0c6dso10467525ad.1
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Apr 2023 13:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681762020; x=1684354020;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+deRgXi/6Ad9g6ku11D8GgcUGW5WpzR4IIRqP5WMoRs=;
 b=JcGnCFJj/BBEdA0hbgG5EsNgb3iej6j4oPqs23GAUMRs4lmm9w4RDYVLZDPt0EJTt4
 wlqQ/e7oA+qo3v3dViaATjMd95+LJOHFx/tebhZB+Fg8U5cou6MG5+7rTkGe0Lz8bvyw
 2HvEWJuvnneTw2ZR0tXEtbPhfpknC/P5KXhspzRLswM1DU+2VYL83WoAncV2PFDEKj4U
 wTzbSV9CrAWbER4qg4Fd0hA83F89rHDGKMlWZkXezznlbH8UV53X55KA7ytCvKUZmXq7
 XEp+4LBUlivOCquwGpShgvBeLCbgUkwe4eZr/8dTnwg1lch+E+oJb46WFrDja53dtpsE
 Kywg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681762020; x=1684354020;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+deRgXi/6Ad9g6ku11D8GgcUGW5WpzR4IIRqP5WMoRs=;
 b=Q1OSCrNAS4Z/AChjY83VNDJHzJ7R9irzU3EVy9nD/mU3Zghj8xuJeKcqNgdGXO105U
 oh8y6rVyhs+YRjgxMcnAO3H3hOfyZIPblX/1KigWDLOQqqSmVSxpd2rWw6eFZSButzhQ
 AC+KObhXdYl3hVJ3uh9MrStrFkxzHE90Umj1TZerXp4FCA9t97Zw4HlPf5BPHSTgFCPH
 aFDXkL7IFaRYQIiCwirLqUTTjg+f25na3cQJcBcyf5uP+YURA0PYYLn0HNQKdL7Pmxju
 ycXCC/un8n+fE11Q5+jomgbq4Clau1Zwtnsk6zv/xQ6i5kkxLRUkThEMiQhlMs8iJ297
 9ftA==
X-Gm-Message-State: AAQBX9fY0kWtGqsgAhAYurtPvrkvZZlOih1ZjJu4NOwLSuEqSHKEn12v
 GpVofSVABsGwNd4TXNCt6ZSHUGXBzuM=
X-Google-Smtp-Source: AKy350Y7ODBS8FdmIbWFAn8sdaIVRvcEuA/AmjNn1Ewxalqs6GptNrO4Daqa5keisv4BFAbDxr0Dyg==
X-Received: by 2002:a05:6a00:1516:b0:63d:287f:fdf5 with SMTP id
 q22-20020a056a00151600b0063d287ffdf5mr4607205pfu.27.1681762020532; 
 Mon, 17 Apr 2023 13:07:00 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:61b:48ed:72ab:435b])
 by smtp.gmail.com with ESMTPSA id
 e16-20020a62ee10000000b0063b5776b073sm7338454pfi.117.2023.04.17.13.06.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Apr 2023 13:07:00 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/docs: Fix usage stats typos
Date: Mon, 17 Apr 2023 13:06:56 -0700
Message-Id: <20230417200657.447606-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.39.2
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
Cc: Rob Clark <robdclark@chromium.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonathan Corbet <corbet@lwn.net>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Fix a couple missing ':'s.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 Documentation/gpu/drm-usage-stats.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/gpu/drm-usage-stats.rst b/Documentation/gpu/drm-usage-stats.rst
index b46327356e80..72d069e5dacb 100644
--- a/Documentation/gpu/drm-usage-stats.rst
+++ b/Documentation/gpu/drm-usage-stats.rst
@@ -105,7 +105,7 @@ object belong to this client, in the respective memory region.
 Default unit shall be bytes with optional unit specifiers of 'KiB' or 'MiB'
 indicating kibi- or mebi-bytes.
 
-- drm-cycles-<str> <uint>
+- drm-cycles-<str>: <uint>
 
 Engine identifier string must be the same as the one specified in the
 drm-engine-<str> tag and shall contain the number of busy cycles for the given
@@ -117,7 +117,7 @@ larger value within a reasonable period. Upon observing a value lower than what
 was previously read, userspace is expected to stay with that larger previous
 value until a monotonic update is seen.
 
-- drm-maxfreq-<str> <uint> [Hz|MHz|KHz]
+- drm-maxfreq-<str>: <uint> [Hz|MHz|KHz]
 
 Engine identifier string must be the same as the one specified in the
 drm-engine-<str> tag and shall contain the maximum frequency for the given
-- 
2.39.2

