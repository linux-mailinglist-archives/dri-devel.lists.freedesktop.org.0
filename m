Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B3BF23912BD
	for <lists+dri-devel@lfdr.de>; Wed, 26 May 2021 10:47:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5CE86EC37;
	Wed, 26 May 2021 08:47:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25EC86EC2F
 for <dri-devel@lists.freedesktop.org>; Wed, 26 May 2021 08:47:42 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id p7so179209wru.10
 for <dri-devel@lists.freedesktop.org>; Wed, 26 May 2021 01:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=S7Vhy55irc0KIRnoY1AtIhd7OdR89vjnmNeVszJAECQ=;
 b=eOgEFPmvC30HjVNA4Cq3235ugvwODQjfTMEVmYHNrTdvhnuoAsJejtxVRd3f8oj5Wi
 oRQQEFGbC4NXCz0QMPmwIR9qxYU8DlpvdkfUMHtBfcdLhB4yMFUMnzwNIY9CtmqCJTHl
 O+HbpzWWWcraBqJj1gRG9fQMp6wrPlO13d0Bi4B96ycuqw9dL+o0N7dsrc6tiDzncxrL
 HsIEr8NJ/tttK8hTKWsYTDcPjNF/E2lrmYRacRhA6AgqtomdIxPuOSSeTso+7plsZXSX
 OwoSpcUV7EtXkzV5ljXXYXBGzsjWUHAErFwWrwqJ44PkNDBRO9w9EIZjfw5teG+aul48
 hnlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=S7Vhy55irc0KIRnoY1AtIhd7OdR89vjnmNeVszJAECQ=;
 b=YopYmBtbyS32ai/42/ksatZEPxzUqw37Wrj6vfCPOgWikXfu7Ti1+zqdCH3Ui6+VCv
 QfA6GNtVj4SAkmmsZlNLjwT4Vqk6cKquDWbP1EFz8hXZuTGuPd+IajUeC7XyOz56jTf1
 QOhjkS13psUt+jxIeYOb/kcD0fRKTcS+CGtF83oY3zvZTIwmEeMOZe6wcgCOd4qPzX7b
 khQEH4pQT4q/Y4S4bTqu/l1tLW2EMHLTBsQyMXt+LhZRAQRxRNeukMOpHWuWzdMBo0hU
 BEoHJsFwajtHG/WAXVHZa9WJWzQDq7IMIm+aQFAgMUxTLZvHmdp0bOn2g+lCB/PZSGqG
 Jupg==
X-Gm-Message-State: AOAM531xN6cOM/FTk2jRjGwrucHNl99jYAnhWtuHONYumb8TrMtpBt7Q
 Rf0QQqO0NRFMR4srlUOfMy4gpA==
X-Google-Smtp-Source: ABdhPJxE0BtwOIYQjuYn6Y7+Q6ACbzICk5aAr0XXdSoA3yVkfOmmF2TnwfLbYcp+4PimxnS4+0XwlA==
X-Received: by 2002:adf:a2de:: with SMTP id t30mr16243809wra.104.1622018860628; 
 Wed, 26 May 2021 01:47:40 -0700 (PDT)
Received: from dell.default ([91.110.221.223])
 by smtp.gmail.com with ESMTPSA id l18sm18911918wrt.97.2021.05.26.01.47.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 May 2021 01:47:40 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 10/34] drm/amd/display/dc/bios/bios_parser: Fix formatting and
 misnaming issues
Date: Wed, 26 May 2021 09:47:02 +0100
Message-Id: <20210526084726.552052-11-lee.jones@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210526084726.552052-1-lee.jones@linaro.org>
References: <20210526084726.552052-1-lee.jones@linaro.org>
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
Cc: Leo Li <sunpeng.li@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/amd/amdgpu/../display/dc/bios/bios_parser.c:997: warning: expecting prototype for get_ss_info_from_table(). Prototype was for get_ss_info_from_tbl() instead
 drivers/gpu/drm/amd/amdgpu/../display/dc/bios/bios_parser.c:1562: warning: expecting prototype for BiosParserObject(). Prototype was for bios_parser_get_ss_entry_number() instead
 drivers/gpu/drm/amd/amdgpu/../display/dc/bios/bios_parser.c:1739: warning: expecting prototype for get_ss_entry_number_from_internal_ss_info_table_V3_1(). Prototype was for get_ss_entry_number_from_internal_ss_info_tbl_V3_1() instead

Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Leo Li <sunpeng.li@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Lee Jones <lee.jones@linaro.org>
Cc: amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/amd/display/dc/bios/bios_parser.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/bios/bios_parser.c b/drivers/gpu/drm/amd/display/dc/bios/bios_parser.c
index c67d21a5ee52f..9b8ea6e9a2b96 100644
--- a/drivers/gpu/drm/amd/display/dc/bios/bios_parser.c
+++ b/drivers/gpu/drm/amd/display/dc/bios/bios_parser.c
@@ -979,7 +979,7 @@ static enum bp_result get_ss_info_from_internal_ss_info_tbl_V2_1(
 	struct spread_spectrum_info *info);
 
 /**
- * get_ss_info_from_table
+ * get_ss_info_from_tbl
  * Get spread sprectrum information from the ASIC_InternalSS_Info Ver 2.1 or
  * SS_Info table from the VBIOS
  * There can not be more than 1 entry for  ASIC_InternalSS_Info Ver 2.1 or
@@ -1548,7 +1548,7 @@ static uint32_t get_ss_entry_number_from_ss_info_tbl(
 	uint32_t id);
 
 /**
- * BiosParserObject::GetNumberofSpreadSpectrumEntry
+ * bios_parser_get_ss_entry_number
  * Get Number of SpreadSpectrum Entry from the ASIC_InternalSS_Info table from
  * the VBIOS that match the SSid (to be converted from signal)
  *
@@ -1725,7 +1725,7 @@ static uint32_t get_ss_entry_number_from_internal_ss_info_tbl_v2_1(
 	return 0;
 }
 /**
- * get_ss_entry_number_from_internal_ss_info_table_V3_1
+ * get_ss_entry_number_from_internal_ss_info_tbl_V3_1
  * Get Number of SpreadSpectrum Entry from the ASIC_InternalSS_Info table of
  * the VBIOS that matches id
  *
-- 
2.31.1

