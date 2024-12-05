Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92D899E5A0E
	for <lists+dri-devel@lfdr.de>; Thu,  5 Dec 2024 16:45:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D20610EEC8;
	Thu,  5 Dec 2024 15:45:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fireburn-co-uk.20230601.gappssmtp.com header.i=@fireburn-co-uk.20230601.gappssmtp.com header.b="ra6Hs9Np";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B952710EEC8
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Dec 2024 15:45:01 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id
 d9443c01a7336-2155312884fso11470785ad.0
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Dec 2024 07:45:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fireburn-co-uk.20230601.gappssmtp.com; s=20230601; t=1733413501; x=1734018301;
 darn=lists.freedesktop.org; 
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Tm7n67OdPWgqcB+RhvsM/Qwmw0+R7RkP4H66sTPwK4w=;
 b=ra6Hs9NpTOT36PebaSHbmG3jeL6vfBb/qiDaqRxzgXwTC63P5imQZFcCuerP+IXZiY
 DScC4GJjPSYUfdCLAlYledqFooIVfj/WZ6kHSYlNuu2Wet69JrUdyC6H06Z7aIzff/U0
 +30LpWsuRgibhKSBfuBfw9+SD+WGBC9mHNHlAPlKZFux4fFoNFcxcN5zraCeEV3xWUeR
 If7oblSdsgvoj7ZVxsq2oG7hH7WZcVyzhptelPpPusSH3alFoPQs6WiC9R4sR8FVIf66
 SCH9G5+pKcCJB6lNfWZBFg+HS3+zCoa9dc6TaQxIpqYGyGDCjN4mtIPt0fyAqj44ZWlU
 C0+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733413501; x=1734018301;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Tm7n67OdPWgqcB+RhvsM/Qwmw0+R7RkP4H66sTPwK4w=;
 b=ID7fR2+j7IKeF1UHflwmUYMpCh8bM3hVDampa+nzoaYMNbxCQQV7NvR4WtX2ZsIISS
 2Vo13T3Jx6iMRl/b67J0qolKsexw/Fe8saj4bVApR0Xxv1L7q4SiNpeYL2o2ZloVfBaN
 HccrTOrpRaEkkvk0T4BF6rURlAeBq5vtj/xG8Jjb0FHvT+xfiUGuAreaOyIlaRRbDzsz
 FpDFj7FaEMW2mxhOCX33iIgjy+E0j3RZ9fFSwazZkqCs2Z9Af0OocrKvXBfcxvhrtKiM
 eNWNpwHkt+ll+bVRjjvJNgdaYFmGOufwRFOdBhiuy8rjU2hQe13DJncA14Ej8K3Y/+/B
 R3EA==
X-Gm-Message-State: AOJu0YwO49bWJNTiHG7WxP4BcVeIPwUR0uz0qXShs7DHrfesLYX8lBi6
 VGWK7WiT4YtlDbyrOQ2WhKC3Ecruquy/hmfyMvnvBTutQKVcqxdXI2JBfJ2uoj0AU2cttVWTa31
 XHxqB2GdbSNmBtKL8hH9+9VyARHLHFdwsmOoVCghPeZQ5PHY+Th2m
X-Gm-Gg: ASbGncvGeab6imiDWh+dAay4YO6Vo1EQxq0YE8sCc9zJ+XGokf5tKvtFu/wSY95nvPR
 EPq6cNwyElJFNqanDGWa2HlgK5nYHmWgU+jTNRb3LytHxbl2avj+nLLw+efN8IU4yyA==
X-Google-Smtp-Source: AGHT+IGNPr7hMpFkBKcRecR7CzmNEGWnu6OC6QcYmTT54OHUjJLwK4ZHcheVrzry9QDAoFz7XUZhqwDThYYwRCDqVlY=
X-Received: by 2002:a17:902:ce08:b0:212:e29:3b2f with SMTP id
 d9443c01a7336-215bd250316mr144470065ad.44.1733413500775; Thu, 05 Dec 2024
 07:45:00 -0800 (PST)
MIME-Version: 1.0
From: Mike Lothian <mike@fireburn.co.uk>
Date: Thu, 5 Dec 2024 15:44:50 +0000
Message-ID: <CAHbf0-E+Z2O7rW-x+-EKNQ-nLbf=_ohaNzXxE7WD2cj9kFJERQ@mail.gmail.com>
Subject: Re: [PATCH V7 03/10] accel/amdxdna: Support hardware mailbox
To: Maling list - DRI developers <dri-devel@lists.freedesktop.org>
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

Hi

I needed to add the following to get things compiling for me


diff --git a/drivers/accel/amdxdna/amdxdna_mailbox.c
b/drivers/accel/amdxdna/amdxdna_mailbox.c
index fe684f463b945..79b9801935e71 100644
--- a/drivers/accel/amdxdna/amdxdna_mailbox.c
+++ b/drivers/accel/amdxdna/amdxdna_mailbox.c
@@ -6,6 +6,7 @@
#include <drm/drm_device.h>
#include <drm/drm_managed.h>
#include <linux/bitfield.h>
+#include <linux/interrupt.h>
#include <linux/iopoll.h>

#define CREATE_TRACE_POINTS


I also had to rename the firmware in /lib/firmware/amdnpu/1502_00/
from npu.sbin.1.5.2.380 to npu.sbin

Cheers

Mike
