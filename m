Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14F85BF56CD
	for <lists+dri-devel@lfdr.de>; Tue, 21 Oct 2025 11:08:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48D9210E5A4;
	Tue, 21 Oct 2025 09:08:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Usso00H2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com
 [209.85.167.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F66F10E5A4
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 09:08:25 +0000 (UTC)
Received: by mail-oi1-f178.google.com with SMTP id
 5614622812f47-43f9cc65f66so3048558b6e.2
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 02:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761037704; x=1761642504; darn=lists.freedesktop.org;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5EzOkKten9esUjA4TwzhkY4Q7ALZJRBa1d79PTr3rJk=;
 b=Usso00H2SQPtcHd3x+hLs2qzewBRabpWc79a/acf8slQHdFWr2QV4nuR3uLhwLQRsd
 Tgms8RTy60N5Kp7r9Tlkfrdmc4pt/aourpzMyYxOySyTj6iOiwbQw4YEVulnl05j4wqm
 eiFvCXWTVjUhx6MCVSysC6WkYGNp3xkjv/cn6Qeu/uhJmPtR6fgDtUPp39NMPW7i3pDU
 7sLajKUtQSIcH2wLypNXe6VrIynTJfJ0lzdXihkrOi/Vgri6+Wg8DDK2L7s8CcFhWE2V
 5DvN2Mkr94JBrjYREbDS/6gtvGHWjqHekowJW3t9nXqalljRNAhr/F1WOWrCn75y4OI+
 Svpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761037704; x=1761642504;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5EzOkKten9esUjA4TwzhkY4Q7ALZJRBa1d79PTr3rJk=;
 b=E6fzXRsoqyBIrahVltCguOVOB7kvl9GIqKEloAHY3p2vZj4LmYiV9PgdwYhHNAbEiy
 XQ0fENzAUQ8MMEla4744N0w5m5UpVg2zQQ77J+2pYVvZGNCnkJ8fIl31SFvVp+GdUXkx
 o4zxtHqfttgsrV2grRwnmuz3DKkrgVGySHInfrdRDfht2fL/IDUDh67mjM/RUIhprh90
 4IkPCh/Hh0tbggVy52P57fPvvsgzmwnoLq2ohrVeAiirnFaw8+0/I4kWk7z6k8mssNgg
 PMLwHdT9ZuMe0WM4qDOSeGkinJIaqlJwbEssOtn+lX183vJfEGSGBLRva05B8qhrSMjE
 XlJQ==
X-Gm-Message-State: AOJu0YxZT61aFekec8HpKDJ6TfJYhGB9WcPvZUAhK4pyLnPBXJldfW6J
 jCvfQECFtK6MFKICa2tecN6UiN29aSNoybYmsmPpm//qE9aVIrcVKxR4RGTVP1CyJDaM9JGpe3a
 4K3GX8PW5Zj9ro3UxiXpS6XLmJqA2qJeJZbNEFNw=
X-Gm-Gg: ASbGncs82qbovgqcedKoUBKdcghmCf8LsHZkiDB6WW/zrNetuMpt0AvX5wPxfwzpxcV
 Od6msFrMsxA+vAq2SWIzY9DDSeqnNxszuqWzyYkZIJfj/JEa7Rs5Y7FbTd70zg/QORlgN2tiF/o
 4f8RxTFxEP1Zf+ttrja81vSpJ1nFVtWmSj9AegtZ4cXaVRx6Vs3Q6Q0gf6IG9JpC8mS5XvoYrcF
 yw8FoSRg4ly/5881ToUH6KzaBBTa2eGkxUn6uOkK4ocSUl44Hgofz5zVkA=
X-Google-Smtp-Source: AGHT+IGeBB9n43tPd2ZJOQzV4P/Y0OzoWvghuOgR7wghSvByV9tPphSH16HnkWY1aW0RvXLSI0NVTfDyezx9LZdgcQE=
X-Received: by 2002:a05:6808:50a3:b0:43d:2146:e537 with SMTP id
 5614622812f47-443a2ed3728mr6618073b6e.2.1761037704561; Tue, 21 Oct 2025
 02:08:24 -0700 (PDT)
MIME-Version: 1.0
References: <CAGkpkRWV2o93Ejrb0YjoPTxVy23U6pYcwGtLOf_y+jPrk4NCtw@mail.gmail.com>
In-Reply-To: <CAGkpkRWV2o93Ejrb0YjoPTxVy23U6pYcwGtLOf_y+jPrk4NCtw@mail.gmail.com>
From: John Smith <itistotalbotnet@gmail.com>
Date: Tue, 21 Oct 2025 11:08:13 +0200
X-Gm-Features: AS18NWACfaxUDD41tKiI2xhtNZTIcI28pArQH3s1hdSFZ0czAW3lm7OjvhYXFyw
Message-ID: <CAGkpkRWR5R+tGh9=9Hk=n5DXHjLuqkmEcPrVvwOvegxv5pbxGA@mail.gmail.com>
Subject: [PATCH v2 1/2] drm/amd/pm/powerplay/smumgr: Fix PCIeBootLinkLevel
 value on Fiji
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

Fixes: 18edef19ea44 ("drm/amd/powerplay: implement fw image related
smu interface for Fiji.")
Signed-off-by: John Smith <itistotalbotnet@gmail.com>
---
 drivers/gpu/drm/amd/pm/powerplay/smumgr/fiji_smumgr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/pm/powerplay/smumgr/fiji_smumgr.c
b/drivers/gpu/drm/amd/pm/powerplay/smumgr/fiji_smumgr.c
index d2dbd90bb427..0a876c840c79 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/smumgr/fiji_smumgr.c
+++ b/drivers/gpu/drm/amd/pm/powerplay/smumgr/fiji_smumgr.c
@@ -2024,7 +2024,7 @@ static int fiji_init_smc_table(struct pp_hwmgr *hwmgr)
  table->VoltageResponseTime = 0;
  table->PhaseResponseTime = 0;
  table->MemoryThermThrottleEnable = 1;
- table->PCIeBootLinkLevel = 0;      /* 0:Gen1 1:Gen2 2:Gen3*/
+ table->PCIeBootLinkLevel = (uint8_t) (data->dpm_table.pcie_speed_table.count);
  table->PCIeGenInterval = 1;
  table->VRConfig = 0;

-- 
2.51.1
