Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE5498B76F2
	for <lists+dri-devel@lfdr.de>; Tue, 30 Apr 2024 15:24:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8844710E4D9;
	Tue, 30 Apr 2024 13:24:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="azQe1gde";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D47010E4D9;
 Tue, 30 Apr 2024 13:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714483482; x=1746019482;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=11X3wEMQbR/b7C50eaFbyjqplYHvHzwuI/0HIjyuc9Y=;
 b=azQe1gdeysjLqkqxZkYon/spLqcUGuP+MxawkNezUvJG+J6mXieGuhUl
 eWYlRlr8r44WlSjrsGru8loONZlm6UAhJrg2MDV29ZNXvJP39mltFY95k
 55YtqD4QssnZ3onZK/M06spLrU8qvXLkCxnmKsTVOKt2CAUIqDtrydbtI
 eF6rJGZrqeKM4DXAv+zHXi2MlLkWoIjZdXyRxgix7sXbriKuJIoZ/JjyF
 HeqDidJhnZGD6Tm0dKZ3m9Y2SqrpMrY4tVuYqRdpeEQplr4T3H8CiiDEk
 JDLlIE7aVEAvkGNhUJ+Z2sYybxlo8Y9gme+ELuQzSyy7D/NDPkwoaA3mU Q==;
X-CSE-ConnectionGUID: 8wd136OXSWi0g0QXmYWXhg==
X-CSE-MsgGUID: DwsbaLsQREu+2hxrPNwoqA==
X-IronPort-AV: E=McAfee;i="6600,9927,11060"; a="27638678"
X-IronPort-AV: E=Sophos;i="6.07,242,1708416000"; d="scan'208";a="27638678"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2024 06:24:38 -0700
X-CSE-ConnectionGUID: YX4Wz8PzSy2+Y0ETSgzmJQ==
X-CSE-MsgGUID: 9WnaRiHxRVW2zfs+VqbDFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,242,1708416000"; d="scan'208";a="26328991"
Received: from dut-2a59.iind.intel.com ([10.190.239.113])
 by orviesa010.jf.intel.com with ESMTP; 30 Apr 2024 06:24:35 -0700
From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
To: nouveau@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: ttabi@nvidia.com, lucas.demarchi@intel.com, dakr@redhat.com,
 airlied@redhat.com, lyude@redhat.com, bskeggs@nvidia.com
Subject: [PATCH] nouveau: Add missing break statement
Date: Tue, 30 Apr 2024 18:48:40 +0530
Message-Id: <20240430131840.742924-1-chaitanya.kumar.borah@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add the missing break statement that causes the following build error

	  CC [M]  drivers/gpu/drm/i915/display/intel_display_device.o
	../drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c: In function ‘build_registry’:
	../drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:1266:3: error: label at end of compound statement
	1266 |   default:
	      |   ^~~~~~~
	  CC [M]  drivers/gpu/drm/amd/amdgpu/gfx_v10_0.o
	  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/i915_reg.h
	  CC [M]  drivers/gpu/drm/amd/amdgpu/imu_v11_0.o
	make[7]: *** [../scripts/Makefile.build:244: drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.o] Error 1
	make[7]: *** Waiting for unfinished jobs....

Fixes: b58a0bc904ff ("nouveau: add command-line GSP-RM registry support")
Closes: https://lore.kernel.org/all/913052ca6c0988db1bab293cfae38529251b4594.camel@nvidia.com/T/#m3c9acebac754f2e74a85b76c858c093bb1aacaf0
Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
index 0b46db5c77b8..63619512e7f6 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
@@ -1264,6 +1264,7 @@ static void build_registry(struct nvkm_gsp *gsp, PACKED_REGISTRY_TABLE *registry
 			str_offset += reg->vlen;
 			break;
 		default:
+			break;
 		}
 
 		i++;
-- 
2.25.1

