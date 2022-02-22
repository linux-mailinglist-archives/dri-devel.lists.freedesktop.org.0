Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C5034BF8FE
	for <lists+dri-devel@lfdr.de>; Tue, 22 Feb 2022 14:18:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8F9A10E64F;
	Tue, 22 Feb 2022 13:18:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc30.google.com (mail-oo1-xc30.google.com
 [IPv6:2607:f8b0:4864:20::c30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2C7010E644
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Feb 2022 13:18:15 +0000 (UTC)
Received: by mail-oo1-xc30.google.com with SMTP id
 i10-20020a4aab0a000000b002fccf890d5fso17431810oon.5
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Feb 2022 05:18:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=usp.br; s=usp-google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BddlbliOr23dlDMdKBzq441XXaZGsl4trq5vl1IoJkg=;
 b=FUA2ctAo26U2VrMAKFt54E8PbaVy/9Q9zg1A3qXzzTgDZcTBWgReR8aOIbcyuhzsF5
 eZs6UwHAOqyX2RmmHXchNyyGwfu4QHZGvtnkj1pLEHgLmIqBkMhgf438CjVIgFFuq63w
 6LdcOTqLckFWTH8WJ7U5Tjr9h+muBirlacXpfy3sK/cBHVV9HOlUkfm9ri+eWH1MJ98I
 A6ZP8JyO+8MmfuedfI215qVFqwF1EX60l+jidbFr2G6Ie45RH+r86f5gArzwFc34SWsH
 vN67IJGYhoRz4fT7fTkk552gB+68Q2EyCqicVWLvrhtVtUSS3UP6FyGb7EoQRlFzMrO5
 N3Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BddlbliOr23dlDMdKBzq441XXaZGsl4trq5vl1IoJkg=;
 b=NuGfXUcuv4d45sXDFtemCB4KtezA2QiSoa/bc8wQpmyKkSrZxnqteoGXfKtg0GuZlO
 FWrmDKwBiXy5Dizvvv1OAV0HddJ0UeFbBgLUERgTyMXCHDUaa93C0DcZBQo5hOE4lU3Y
 qmdPPIYU35FwjyHU+y+CGnfTy0s+Elz5A/BQowELoiWsfCfwmKPKJA5vEnzZ/96hyDnP
 QC4DPNru/2gGHJY6yv+9ES+BkgRm2bX6Y3mehlGiiPUksT+HICChfn3OMAOXz7FyPgG7
 aoEFEPx7anB52+CDZFQuPqisTMY43iEfhBLS+0gvu1gsVcUhUUtVzGGOSM88gS2LItdM
 Nusg==
X-Gm-Message-State: AOAM532pmqCkoV1mrFELubCjJXQhL1ZO12ScobCt89bbz9zmKz/VzL4S
 UxEpEc1inchXDZa+AXbWWxv/zw==
X-Google-Smtp-Source: ABdhPJxEyM6aUtyhGo6ZTsWyPOth67Mi4P+5opQjl7KNJFm0YuxYey03Zaf5skFdls+byx/d7c4Vxg==
X-Received: by 2002:a05:6870:d59a:b0:c4:7dc0:d72a with SMTP id
 u26-20020a056870d59a00b000c47dc0d72amr1498997oao.253.1645535895164; 
 Tue, 22 Feb 2022 05:18:15 -0800 (PST)
Received: from fedora.. ([187.36.236.204])
 by smtp.gmail.com with ESMTPSA id c9sm6325050otd.26.2022.02.22.05.18.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 05:18:14 -0800 (PST)
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <maira.canal@usp.br>
To: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 Hawking.Zhang@amd.com, john.clements@amd.com, tao.zhou1@amd.com,
 YiPeng.Chai@amd.com, luben.tuikov@amd.com, Stanley.Yang@amd.com,
 Dennis.Li@amd.com, mukul.joshi@amd.com, harry.wentland@amd.com,
 sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com, Anthony.Koo@amd.com
Subject: [PATCH 06/10] drm/amd/display: Remove vupdate_int_entry definition
Date: Tue, 22 Feb 2022 10:16:57 -0300
Message-Id: <20220222131701.356117-7-maira.canal@usp.br>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220222131701.356117-1-maira.canal@usp.br>
References: <20220222131701.356117-1-maira.canal@usp.br>
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
Cc: magalilemes00@gmail.com,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <maira.canal@usp.br>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, mwen@igalia.com,
 amd-gfx@lists.freedesktop.org, isabbasso@riseup.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Remove the vupdate_int_entry definition and utilization to avoid the
following warning by Clang:

drivers/gpu/drm/amd/amdgpu/../display/dc/irq/dcn21/irq_service_dcn21.c:410:2:
warning: initializer overrides prior initialization of this subobject
[-Winitializer-overrides]
    vupdate_no_lock_int_entry(0),
    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/amd/amdgpu/../display/dc/irq/dcn21/irq_service_dcn21.c:280:39:
note: expanded from macro 'vupdate_no_lock_int_entry'
    [DC_IRQ_SOURCE_VUPDATE1 + reg_num] = {\
    ^~
drivers/gpu/drm/amd/amdgpu/../display/dc/irq/dcn21/irq_service_dcn21.c:404:2:
note: previous initialization is here
    vupdate_int_entry(0),
    ^~~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/amd/amdgpu/../display/dc/irq/dcn21/irq_service_dcn21.c:269:39:
note: expanded from macro 'vupdate_int_entry'
    [DC_IRQ_SOURCE_VUPDATE1 + reg_num] = {\
    ^~
drivers/gpu/drm/amd/amdgpu/../display/dc/irq/dcn21/irq_service_dcn21.c:411:2:
warning: initializer overrides prior initialization of this subobject
[-Winitializer-overrides]
    vupdate_no_lock_int_entry(1),
    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/amd/amdgpu/../display/dc/irq/dcn21/irq_service_dcn21.c:280:39:
note: expanded from macro 'vupdate_no_lock_int_entry'
    [DC_IRQ_SOURCE_VUPDATE1 + reg_num] = {\
    ^~
drivers/gpu/drm/amd/amdgpu/../display/dc/irq/dcn21/irq_service_dcn21.c:405:2:
note: previous initialization is here
    vupdate_int_entry(1),
    ^~~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/amd/amdgpu/../display/dc/irq/dcn21/irq_service_dcn21.c:269:39:
note: expanded from macro 'vupdate_int_entry'
    [DC_IRQ_SOURCE_VUPDATE1 + reg_num] = {\
    ^~
drivers/gpu/drm/amd/amdgpu/../display/dc/irq/dcn21/irq_service_dcn21.c:412:2:
warning: initializer overrides prior initialization of this subobject
[-Winitializer-overrides]
    vupdate_no_lock_int_entry(2),
    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/amd/amdgpu/../display/dc/irq/dcn21/irq_service_dcn21.c:280:39:
note: expanded from macro 'vupdate_no_lock_int_entry'
    [DC_IRQ_SOURCE_VUPDATE1 + reg_num] = {\
    ^~
drivers/gpu/drm/amd/amdgpu/../display/dc/irq/dcn21/irq_service_dcn21.c:406:2:
note: previous initialization is here
    vupdate_int_entry(2),
    ^~~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/amd/amdgpu/../display/dc/irq/dcn21/irq_service_dcn21.c:269:39:
note: expanded from macro 'vupdate_int_entry'
    [DC_IRQ_SOURCE_VUPDATE1 + reg_num] = {\
    ^~
drivers/gpu/drm/amd/amdgpu/../display/dc/irq/dcn21/irq_service_dcn21.c:413:2:
warning: initializer overrides prior initialization of this subobject
[-Winitializer-overrides]
    vupdate_no_lock_int_entry(3),
    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/amd/amdgpu/../display/dc/irq/dcn21/irq_service_dcn21.c:280:39:
note: expanded from macro 'vupdate_no_lock_int_entry'
    [DC_IRQ_SOURCE_VUPDATE1 + reg_num] = {\
    ^~
drivers/gpu/drm/amd/amdgpu/../display/dc/irq/dcn21/irq_service_dcn21.c:407:2:
note: previous initialization is here
    vupdate_int_entry(3),
    ^~~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/amd/amdgpu/../display/dc/irq/dcn21/irq_service_dcn21.c:269:39:
note: expanded from macro 'vupdate_int_entry'
    [DC_IRQ_SOURCE_VUPDATE1 + reg_num] = {\
    ^~
drivers/gpu/drm/amd/amdgpu/../display/dc/irq/dcn21/irq_service_dcn21.c:414:2:
warning: initializer overrides prior initialization of this subobject
[-Winitializer-overrides]
    vupdate_no_lock_int_entry(4),
    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/amd/amdgpu/../display/dc/irq/dcn21/irq_service_dcn21.c:280:39:
note: expanded from macro 'vupdate_no_lock_int_entry'
    [DC_IRQ_SOURCE_VUPDATE1 + reg_num] = {\
    ^~
drivers/gpu/drm/amd/amdgpu/../display/dc/irq/dcn21/irq_service_dcn21.c:408:2:
note: previous initialization is here
    vupdate_int_entry(4),
    ^~~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/amd/amdgpu/../display/dc/irq/dcn21/irq_service_dcn21.c:269:39:
note: expanded from macro 'vupdate_int_entry'
    [DC_IRQ_SOURCE_VUPDATE1 + reg_num] = {\
    ^~
drivers/gpu/drm/amd/amdgpu/../display/dc/irq/dcn21/irq_service_dcn21.c:415:2:
warning: initializer overrides prior initialization of this subobject
[-Winitializer-overrides]
    vupdate_no_lock_int_entry(5),
    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/amd/amdgpu/../display/dc/irq/dcn21/irq_service_dcn21.c:280:39:
note: expanded from macro 'vupdate_no_lock_int_entry'
    [DC_IRQ_SOURCE_VUPDATE1 + reg_num] = {\
    ^~
drivers/gpu/drm/amd/amdgpu/../display/dc/irq/dcn21/irq_service_dcn21.c:409:2:
note: previous initialization is here
    vupdate_int_entry(5),
    ^~~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/amd/amdgpu/../display/dc/irq/dcn21/irq_service_dcn21.c:269:39:
note: expanded from macro 'vupdate_int_entry'
        [DC_IRQ_SOURCE_VUPDATE1 + reg_num] = {\
        ^~
6 warnings generated.

fixes: 688f97ed ("drm/amd/display: Add vupdate_no_lock interrupts for
DCN2.1")

Signed-off-by: Maíra Canal <maira.canal@usp.br>
---
 .../amd/display/dc/irq/dcn21/irq_service_dcn21.c   | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/irq/dcn21/irq_service_dcn21.c b/drivers/gpu/drm/amd/display/dc/irq/dcn21/irq_service_dcn21.c
index 0f15bcada4e9..717977aec6d0 100644
--- a/drivers/gpu/drm/amd/display/dc/irq/dcn21/irq_service_dcn21.c
+++ b/drivers/gpu/drm/amd/display/dc/irq/dcn21/irq_service_dcn21.c
@@ -265,14 +265,6 @@ static const struct irq_source_info_funcs vline0_irq_info_funcs = {
 		.funcs = &pflip_irq_info_funcs\
 	}
 
-#define vupdate_int_entry(reg_num)\
-	[DC_IRQ_SOURCE_VUPDATE1 + reg_num] = {\
-		IRQ_REG_ENTRY(OTG, reg_num,\
-			OTG_GLOBAL_SYNC_STATUS, VUPDATE_INT_EN,\
-			OTG_GLOBAL_SYNC_STATUS, VUPDATE_EVENT_CLEAR),\
-		.funcs = &vblank_irq_info_funcs\
-	}
-
 /* vupdate_no_lock_int_entry maps to DC_IRQ_SOURCE_VUPDATEx, to match semantic
  * of DCE's DC_IRQ_SOURCE_VUPDATEx.
  */
@@ -401,12 +393,6 @@ irq_source_info_dcn21[DAL_IRQ_SOURCES_NUMBER] = {
 	dc_underflow_int_entry(6),
 	[DC_IRQ_SOURCE_DMCU_SCP] = dummy_irq_entry(),
 	[DC_IRQ_SOURCE_VBIOS_SW] = dummy_irq_entry(),
-	vupdate_int_entry(0),
-	vupdate_int_entry(1),
-	vupdate_int_entry(2),
-	vupdate_int_entry(3),
-	vupdate_int_entry(4),
-	vupdate_int_entry(5),
 	vupdate_no_lock_int_entry(0),
 	vupdate_no_lock_int_entry(1),
 	vupdate_no_lock_int_entry(2),
-- 
2.35.1

