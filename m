Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 726F2910A6A
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2024 17:47:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A30A310EA9A;
	Thu, 20 Jun 2024 15:47:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="nzgnZLy6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f100.google.com (mail-ej1-f100.google.com
 [209.85.218.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA31B10EA9A
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 15:46:53 +0000 (UTC)
Received: by mail-ej1-f100.google.com with SMTP id
 a640c23a62f3a-a62ef52e837so120214366b.3
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 08:46:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1718898412; x=1719503212;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Gwapdvh87Btx1SZd/273ig86nobBawrVbIRKVxcUOmM=;
 b=nzgnZLy6sT3DLgFf7HWyNvPXNynXhsCZnMxy8pcCCQY3FrcKbARRxxaeZn2olCT6WT
 +ZOYrx0fmdT3ZfY/LZ5RbaJ7q7ka03U3HILvhyHYBzw4J1smdU/up4cGdp8nU6Ea0TWo
 iErzH84TupYY3zEtyzGapLj0fqOSqT+gcNBaQ31oZgBdyn5FQ1ky98gE/NNu608z7vuw
 vHF+/KlVg2OQ19wRKqTW/Z6oAR9wMuy6lVwmQ4vu/1eD81QB3jP1p3ImxUeyrk6qYDoz
 700j8TbknV8ubJfoNq46DraQPL0JxW9/xeSZYh2T8yR5SEziSrz/xzOVgek/u9S2sfW8
 m2GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718898412; x=1719503212;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Gwapdvh87Btx1SZd/273ig86nobBawrVbIRKVxcUOmM=;
 b=nkZ6WoehsuCnycBMPB7d0t8MX5f86rVabcjan1jc0kMTziFzeLOTtrBTmXF3cvDwdi
 f0HtG5Pvlukcc9uo4LghyUP1JuLPwNggzhtyf9I5Nww0PP62wURLPvrfP80tr3uM/2PK
 MuftwQJlBzAbOjLmEcTZe3RjQxQHektVEncyLtJ6C6mkxGfbb8IHQ6iV5d/wgCkeSsi+
 +ReCxnzuQ2UyFer4EBIYRaj8mmhh1V/Jbg2G2enr+JsU8RiyhuH6L9AXlgP2wv5s5rnT
 zeJGc+PgjNh7YOlMN1sGwEQpaNa7IwNJ1cratloah9wRDwEdonY0TIQ68CPcztYSNKtP
 8TTA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUYZhzv5xfDOv7UISnTtoHYuF75siheiX0VI43SfnfkOvv8IQKiwtKQjy7SiI1saseZtxauv6cmrce4LxViCMX676lvFzRTQ08RZ19Dm1KQ
X-Gm-Message-State: AOJu0YxIJwrC7G1PTNpjVV2C2lktj8hhN/bvgmmSpSkQ7L/rPslD6OIj
 bcMbsLZk+3RDiuVD8Uhc3mbT9Pz1G0ibblcNpXMTbUuW5g1ukbktzzpoYBI+/UEkfdq61orsW9G
 AgByXbQEiV4JkDqSxj5mPtf5x6sA1funb
X-Google-Smtp-Source: AGHT+IHF7f3UDww/vJOK97chpezWfPgC3wvKekJs+OVzcWsiLrkCJNVE2nKVJkWB87rmaOQrm8lJp2u7bENo
X-Received: by 2002:a17:906:1646:b0:a6f:5150:b805 with SMTP id
 a640c23a62f3a-a6fab64517fmr346335166b.33.1718898412076; 
 Thu, 20 Jun 2024 08:46:52 -0700 (PDT)
Received: from raspberrypi.com ([188.39.149.98])
 by smtp-relay.gmail.com with ESMTPS id
 a640c23a62f3a-a6f56d8c604sm28242366b.80.2024.06.20.08.46.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jun 2024 08:46:52 -0700 (PDT)
X-Relaying-Domain: raspberrypi.com
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
To: Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH 18/31] drm/vc4: Fix dlist debug not resetting the next entry
 pointer
Date: Thu, 20 Jun 2024 16:46:19 +0100
Message-Id: <20240620154632.4125308-19-dave.stevenson@raspberrypi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240620154632.4125308-1-dave.stevenson@raspberrypi.com>
References: <20240620154632.4125308-1-dave.stevenson@raspberrypi.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The debug function to display the dlists didn't reset next_entry_start
when starting each display, so resulting in not stopping the
list at the correct place.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/gpu/drm/vc4/vc4_hvs.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hvs.c b/drivers/gpu/drm/vc4/vc4_hvs.c
index 5d4a76215a2e..5dbc48d690e8 100644
--- a/drivers/gpu/drm/vc4/vc4_hvs.c
+++ b/drivers/gpu/drm/vc4/vc4_hvs.c
@@ -110,7 +110,7 @@ static int vc4_hvs_debugfs_dlist(struct seq_file *m, void *data)
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
 	struct vc4_hvs *hvs = vc4->hvs;
 	struct drm_printer p = drm_seq_file_printer(m);
-	unsigned int next_entry_start = 0;
+	unsigned int next_entry_start;
 	unsigned int i, j;
 	u32 dlist_word, dispstat;
 
@@ -124,6 +124,7 @@ static int vc4_hvs_debugfs_dlist(struct seq_file *m, void *data)
 		}
 
 		drm_printf(&p, "HVS chan %u:\n", i);
+		next_entry_start = 0;
 
 		for (j = HVS_READ(SCALER_DISPLISTX(i)); j < 256; j++) {
 			dlist_word = readl((u32 __iomem *)vc4->hvs->dlist + j);
-- 
2.34.1

