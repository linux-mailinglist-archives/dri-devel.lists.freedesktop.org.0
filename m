Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89829BF56D9
	for <lists+dri-devel@lfdr.de>; Tue, 21 Oct 2025 11:09:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B76DC10E2E7;
	Tue, 21 Oct 2025 09:09:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DavFWytS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com
 [209.85.210.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0764510E2E7
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 09:09:21 +0000 (UTC)
Received: by mail-ot1-f48.google.com with SMTP id
 46e09a7af769-7827025e548so2171798a34.2
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 02:09:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761037760; x=1761642560; darn=lists.freedesktop.org;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gb+R4MJ7BfJdWLdaV2Ro6NxvKJI96WyMQ7kApAl8fnU=;
 b=DavFWytSmQ0YRr1yiq5GoiOO/Uw1HRYqdByC6uk2l/k6Zf0+d5+iS/KeLAJVkBqjvz
 pjajfAyt8xMO4N8fYzTiHSZQHFBq8OHiXSU5PCdl1t4ixSvT88HRqVFV/kwvFqc+Ra6x
 uq3useaXA2/anhvOUHeQzkkbJXDlTgcxhOKeEG8255LRWV5vw5vYZ9b2CuuJxjKUgpRC
 morHoCFmo1PpErlofx4S7ZqpDajPmv2E+O7Cm/PIcnrLXLazxpGNv7QB+lacyf1MFH/4
 D9iVZGTolDfRLdsEe3OMQf7SNwIAPazHgsadMrtAU4SN8HRoSoVWrTAQLSBpS+Ezqnyh
 sT6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761037760; x=1761642560;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gb+R4MJ7BfJdWLdaV2Ro6NxvKJI96WyMQ7kApAl8fnU=;
 b=kEGLLqgh2yagVE48BbkE0Mi8q/kjOsIeXJvZxisdrPeRhfyE6/c+QHdmHpwmqxW8Jh
 OxfN6vpvWZ2UugiLoRmvNc+nDVHTintLYk+tAYIxxalAZA5exLfO+aCITSIRRnwM2Nfm
 2hO10oVmVtv2xqX3O+fjef6aDRtsKGtTYmad2Jq9eHvFfwm8X1ZCGQtwmI2BTHz6Ebiv
 b5hhZB4wtY3A+4+lhA/pC+XjcJ1o8xMD+hpS+qv4jyI78Q2SX//DYeoXlJxRjR+uEJLd
 ICb3PZPAeKgNhcD+eMBt9YRGa1QbgFN928+x8u8GJElFhS2pXRf5Axb6GliTLITwrrdE
 DQlg==
X-Gm-Message-State: AOJu0YxJ4z3Joai3CFdt7LtYI0iMEzncaRbi6iKe0oZaFFan8rWlYA4W
 1qUHXEZTyUXdiAmUztmKRjboE2qMp8LvPnfDHg6MhL7t3/GoXnByxDx80S8DRkWqZz3U6Cs7vX+
 QlwJB6eQ8APMn89xQXiwYfcZ/Hwm2SIekuwCNo6U=
X-Gm-Gg: ASbGncuaQSzL1Z3d1lM0YEQRSeVzBRQqoIKOdtylxv2N9+GPPd/hznED8T9AkA5KemF
 uKNoQrqXCj+lfTYHVJJlD9iAzDlQABXAkBeqCTRM5DqSEWkQLrysp5oILWeG7ga5V1h7gPl27zw
 FY+Kk4hQTKQl8z/+OhwpoE79VvUfk/TywVJcAwyKkJ7tSV5VPJ8TDwCT5ME5jLgVonoMvW15dS4
 dUWZtWHERpp30J4/OGxAqXmLqQqgF81WP6NrD+I6YssXGINOgBd8yDkqt4=
X-Google-Smtp-Source: AGHT+IE+OvCXgBwLAxGFctsCqwqU2Ne/mka/XwAi0PiV0887xOb61Zhndv5zOFbTRkOo86QuEK1O1i6Naq2oNenf8Lg=
X-Received: by 2002:a05:6808:19a7:b0:43f:4f34:dd30 with SMTP id
 5614622812f47-443a2e72f95mr5842790b6e.3.1761037760203; Tue, 21 Oct 2025
 02:09:20 -0700 (PDT)
MIME-Version: 1.0
References: <CAGkpkRWV2o93Ejrb0YjoPTxVy23U6pYcwGtLOf_y+jPrk4NCtw@mail.gmail.com>
In-Reply-To: <CAGkpkRWV2o93Ejrb0YjoPTxVy23U6pYcwGtLOf_y+jPrk4NCtw@mail.gmail.com>
From: John Smith <itistotalbotnet@gmail.com>
Date: Tue, 21 Oct 2025 11:09:09 +0200
X-Gm-Features: AS18NWAkj1klO1CttWOCPyJLVDF50T0N9Qu-9E0-R_A1SNKqFn3yevtxyW0xuIQ
Message-ID: <CAGkpkRWj14EPZgjyuxZ7rEdZK=EsWcLL1XpdMq_yrdEYKrKJgw@mail.gmail.com>
Subject: [PATCH v2 2/2] drm/amd/pm/powerplay/smumgr: Fix PCIeBootLinkLevel
 value on Iceland
To: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
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

Previously this was initialized with zero which represented PCIe Gen
1.0 instead of using the
maximum value from the speed table which is the behaviour of all other
smumgr implementations.

Fixes: 18aafc59b106 ("drm/amd/powerplay: implement fw related smu
interface for iceland.")
Signed-off-by: John Smith <itistotalbotnet@gmail.com>
---
 drivers/gpu/drm/amd/pm/powerplay/smumgr/iceland_smumgr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/pm/powerplay/smumgr/iceland_smumgr.c
b/drivers/gpu/drm/amd/pm/powerplay/smumgr/iceland_smumgr.c
index 1f50f1e74c48..aa3ae9b115c4 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/smumgr/iceland_smumgr.c
+++ b/drivers/gpu/drm/amd/pm/powerplay/smumgr/iceland_smumgr.c
@@ -2028,7 +2028,7 @@ static int iceland_init_smc_table(struct pp_hwmgr *hwmgr)
  table->VoltageResponseTime  = 0;
  table->PhaseResponseTime  = 0;
  table->MemoryThermThrottleEnable  = 1;
- table->PCIeBootLinkLevel = 0;
+ table->PCIeBootLinkLevel = (uint8_t) (data->dpm_table.pcie_speed_table.count);
  table->PCIeGenInterval = 1;

  result = iceland_populate_smc_svi2_config(hwmgr, table);
-- 
2.51.1
