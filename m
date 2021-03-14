Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D0B1933A2AE
	for <lists+dri-devel@lfdr.de>; Sun, 14 Mar 2021 05:45:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECC7A6E14F;
	Sun, 14 Mar 2021 04:45:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com
 [IPv6:2607:f8b0:4864:20::82e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5EB96E14F;
 Sun, 14 Mar 2021 04:45:34 +0000 (UTC)
Received: by mail-qt1-x82e.google.com with SMTP id c6so6956459qtc.1;
 Sat, 13 Mar 2021 20:45:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Uoe5TNNaDysbUQasfNAqY0hOSuNv/3CSSDD6bzJQ5fI=;
 b=WRjAdYjdxjs92mVp66j7D7szHl3IbeBRjO+ofLvwzD64sD9QZXZeZ+pSXF8O3MRGbb
 OwveQBhhxwxPv0tAA2vKfzZ+NdQxwrGNwEay93SQFFjGfCfxgh0JMYoFNa4lEQDgAbn9
 pDAqLIHPk9lqkyjQzEHW5mnW8PsX/afur8eptyiKNLL4n48BQ5sgvaCBW84e4zbFUV8h
 nvRV89nzfsIihF9mw2cmPdegTAp4DGB9SRxrG6UNlL1bp9EDUqoVoCdA0TPLs5X5SGP2
 D6YPugWoiJZR0RbsuwQyTSaC3ydtk+eOFv7Jv8QB7vO7mzD4962JS8YuEsGuUNY2/Gzj
 2lCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Uoe5TNNaDysbUQasfNAqY0hOSuNv/3CSSDD6bzJQ5fI=;
 b=amCMj8cLnaKHxSCQBj2FArJtrEpUVZMhtHW9BK9yBDnC3UcoMW7JabqsEPBQkCIVCB
 rs2Uy6wE/ED7IR/QLK/DglkS0SFBRzdHpm17h2c70HaTgughsGiY0RTHCYP0+gdgaKmi
 em9Lr75aZHIkItvOJ68UthFcSsxdk2q79gXoIU3KaIP6P2dOwhTD0XbBp2WQ4CVA7CHe
 APUlKl0E6ukjU8qwotn+vBKgTfrd4zEZbbs3AP7L/rgAHdDb+GYVr6YZSRjDWB6VCcUH
 wT1d12IxDBcMLipw4h4mX4I//PSy0dpOM8F0JZ5E/VO1zfMHTbb3vy1Ac+/FoOS8AUYn
 tRjA==
X-Gm-Message-State: AOAM533d/EhkkCIF9hftKG3g5fKZ0Tx+aimEl2OUkLQljB0GX1gJdHk7
 UYcAAXWdkePREX3uFIjwZp0=
X-Google-Smtp-Source: ABdhPJy2CqupncRenrFBI7C8/dOxkolIyk5MmQG0y9rTuawAaMe1sJkMeoqec5OQ01ETtylsnBEshQ==
X-Received: by 2002:ac8:149a:: with SMTP id l26mr17763644qtj.210.1615697133669; 
 Sat, 13 Mar 2021 20:45:33 -0800 (PST)
Received: from localhost.localdomain ([37.19.198.30])
 by smtp.gmail.com with ESMTPSA id f27sm8005836qkh.118.2021.03.13.20.45.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Mar 2021 20:45:33 -0800 (PST)
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, airlied@linux.ie, daniel@ffwll.ch,
 chris@chris-wilson.co.uk, tvrtko.ursulin@intel.com,
 mika.kuoppala@linux.intel.com, maarten.lankhorst@linux.intel.com,
 unixbhaskar@gmail.com, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] gpu: drm: i915: gt: Rudimentary typo fix in the file
 intel_timeline.c
Date: Sun, 14 Mar 2021 10:13:03 +0530
Message-Id: <20210314044303.9220-1-unixbhaskar@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
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
Cc: rdunlap@infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


s/bariers/barriers/

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 drivers/gpu/drm/i915/gt/intel_timeline.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_timeline.c b/drivers/gpu/drm/i915/gt/intel_timeline.c
index 8015964043eb..2b921c1796dc 100644
--- a/drivers/gpu/drm/i915/gt/intel_timeline.c
+++ b/drivers/gpu/drm/i915/gt/intel_timeline.c
@@ -416,7 +416,7 @@ void intel_timeline_exit(struct intel_timeline *tl)
 	spin_unlock(&timelines->lock);

 	/*
-	 * Since this timeline is idle, all bariers upon which we were waiting
+	 * Since this timeline is idle, all barriers upon which we were waiting
 	 * must also be complete and so we can discard the last used barriers
 	 * without loss of information.
 	 */
--
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
