Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6412C783D1D
	for <lists+dri-devel@lfdr.de>; Tue, 22 Aug 2023 11:41:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8369F10E2E4;
	Tue, 22 Aug 2023 09:41:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3ABD210E175;
 Mon, 21 Aug 2023 19:27:31 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-991c786369cso494615366b.1; 
 Mon, 21 Aug 2023 12:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692646049; x=1693250849;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3Y3MozoZGtBbDDuuXCdo2NbhyEnfa2l4nz+CxEl5tKU=;
 b=LiU0lF4mhSeShjnAD+Fe+tJIr+fJCaOBkT1pkyCyKvaa1CR5whsESZgTheC87/kX1y
 y/tfEtnh02qZCslfGD+1bi2Kgb1nm3xxBhmJo1RN3Pf04sD7IgQ06ukLUATFEZm2UFtf
 3d1wuzW6A1Nn9lhSDHxa8W6Vge21/hq2Yug6kbbt55eTcma6CD1yRuInCEpPTthZo69m
 lRntszLDecYDBUWpfscoeDMrbie1fhZD0NEKpCY4R2xhzR1EkB6PLpb62o+X75xI76RT
 J7Zui6ItOmd2SQHYJ/5uaAf0HDHs56xnpRdChGkcAM/weIIADeZKOS+illhrerZ0SU/2
 Ytrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692646049; x=1693250849;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3Y3MozoZGtBbDDuuXCdo2NbhyEnfa2l4nz+CxEl5tKU=;
 b=NPoULUZIOCOuxvj9bz9XI2VdNscqvDZEx8OhZYf4AtKq97Xtl335fXFG5JXP6gN13l
 1d49boj+/+JBZdxs9BYMAaudFWBuvB1HHkHWPzWMn1gmhBHfl/ZupSNstoPkPNpPYF2N
 lkbmwKnr++uIeaV4hKM0NzHoGP8wf/Lfxv/3pbhClNNSDXmRy9BZyAaaoeICrx37g6Oi
 /8I1shW2/jHm3eTGO2ZK6X22DQj4lyIflKup0O1+mqwsB2yzU51OYtGYYUfuWlfpYXL8
 2qo6SqCenXwqoqA2AmwpG+LDD4qbxelhA00olyfqNG31Rf1pm0EY65Ywv2Vj5ZOvi+a+
 CQJA==
X-Gm-Message-State: AOJu0YyWlK+UWsyPt9p+B+t9WIR4ODpohWjgMqadsZyEQnnoEVC/KfLQ
 LJZySU1ahL/p22yGPPOZhKk=
X-Google-Smtp-Source: AGHT+IHE2rVNNbzoz4XXpvUQ0H4g3J7n/mk+iOWWcRGkUeoprZP7ne5rfjceTvp4nKIkM75OozQLhg==
X-Received: by 2002:a17:907:7818:b0:9a1:6d6d:f259 with SMTP id
 la24-20020a170907781800b009a16d6df259mr5527742ejc.53.1692646049307; 
 Mon, 21 Aug 2023 12:27:29 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:8109:8c00:3664:d1d3:c208:e70b:4429])
 by smtp.gmail.com with ESMTPSA id
 d8-20020a1709067f0800b00992c92af6easm6930814ejr.161.2023.08.21.12.27.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Aug 2023 12:27:28 -0700 (PDT)
From: Nikita B <n2h9z4@gmail.com>
To: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, tvrtko.ursulin@linux.intel.com, airlied@gmail.com,
 daniel@ffwll.ch, daniele.ceraolospurio@intel.com,
 John.C.Harrison@Intel.com, alan.previn.teres.alexis@intel.com,
 gregkh@linuxfoundation.org, harshit.m.mogalapalli@oracle.com,
 michal.wajdeczko@intel.com, skhan@linuxfoundation.org
Subject: [PATCH v1] drivers: gpu: drm: i915: intel_huc: fix formatting warnings
Date: Mon, 21 Aug 2023 21:27:18 +0200
Message-Id: <20230821192718.504357-1-n2h9z4@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 22 Aug 2023 09:41:06 +0000
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
Cc: Nikita B <n2h9z4@gmail.com>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix formatting warnings when run "make htmldocs":
./drivers/gpu/drm/i915/gt/uc/intel_huc.c:29: WARNING: Unexpected indentation.
./drivers/gpu/drm/i915/gt/uc/intel_huc.c:30: WARNING: Block quote ends without a blank line; unexpected unindent.
./drivers/gpu/drm/i915/gt/uc/intel_huc.c:35: WARNING: Bullet list ends without a blank line; unexpected unindent.

Signed-off-by: Nikita B <n2h9z4@gmail.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_huc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc.c b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
index ddd146265beb..fa70defcb5b2 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_huc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
@@ -26,6 +26,7 @@
  * The kernel driver is only responsible for loading the HuC firmware and
  * triggering its security authentication. This is done differently depending
  * on the platform:
+ *
  * - older platforms (from Gen9 to most Gen12s): the load is performed via DMA
  *   and the authentication via GuC
  * - DG2: load and authentication are both performed via GSC.
@@ -33,6 +34,7 @@
  *   not-DG2 older platforms), while the authentication is done in 2-steps,
  *   a first auth for clear-media workloads via GuC and a second one for all
  *   workloads via GSC.
+ *
  * On platforms where the GuC does the authentication, to correctly do so the
  * HuC binary must be loaded before the GuC one.
  * Loading the HuC is optional; however, not using the HuC might negatively
-- 
2.34.1

