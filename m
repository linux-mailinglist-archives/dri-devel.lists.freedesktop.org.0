Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 842B17BCD1C
	for <lists+dri-devel@lfdr.de>; Sun,  8 Oct 2023 09:58:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C54A510E094;
	Sun,  8 Oct 2023 07:57:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCCA310E076
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Oct 2023 22:22:50 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-533c5d10dc7so5785393a12.3
 for <dri-devel@lists.freedesktop.org>; Sat, 07 Oct 2023 15:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696717369; x=1697322169; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IdB/BGfiU50tq91OXEW4jEb/ithHfUpM77EyD2syuso=;
 b=QvG/84eF+YfCm7OKIH8V/Ehfgwqk5cZPVoSy0XNuscm8kwPKQ356AuLsH1V27j/ySU
 d2FbQjl9S0qn8lqlbNC+0oi67E9/0le41LNx2QaVFbta5hp2O/XXpygmOgH+cofb1Cs0
 cRmm3VObQLxl5D+Y1e3DjV0/6TCWEaMqjxcCADpELdNA/VjIglSH1UzkygPV/Qt/cgPO
 OGOYpsaWKutzCrnIJK9d2tU2UpJYyL5XBofBUHnrh4gIQGgIEXY2ESQPoNwyCWvpfxHh
 ut5/yYWnV0NZ5XLdYJA8PH2uboELQM6QNfoFfl/VUojp7eeoVKd9yuRN+KBsxbh8DZ5D
 lhCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696717369; x=1697322169;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IdB/BGfiU50tq91OXEW4jEb/ithHfUpM77EyD2syuso=;
 b=S/olHS3FUfC4u3mTvlTc4XnErIepkAx57TUA3IPPkGS5LOksNG2mas8GB1vbLEKiz5
 4mrsrE0JBHVq2e8Z9iU/vD2sWDoPiw8y7zMloO9iqiYOhidnxQU/P5E+WVnmiayS2+4W
 ULpjRUcVlogtU06EM/BiDp9U/xrh0jyVYIYx6Tt9JXGN6x+0+4hIj3VsqlMe6urYqaH3
 WqYNfsS7xGME2NW8rJq1BPd0mUZbPrdpEvCuqX3ODI4/eCZ3KXdIHrm5EBp/oscY29EY
 WsoD1VTjAvHGoKB1YAVCDHilz+Cv8rWEzXlBKW/r/C+iBxCNIDajCb52cw0SfbY4XANj
 wrBw==
X-Gm-Message-State: AOJu0YzHU5ZrBdYQLtZL2tMyMH0IhFLG2jWJWVRphFaEVEtycTcEPOS1
 ECkNwuA31bMZ8iCUG0hbHak=
X-Google-Smtp-Source: AGHT+IE5XwNPgW5i1gff9lZx5O8y0seN1+Vsx5TQstnKeLrpfJPXQk623LewLQsVUSD2NoeKkMi3gw==
X-Received: by 2002:aa7:c154:0:b0:522:b112:6254 with SMTP id
 r20-20020aa7c154000000b00522b1126254mr10627245edp.4.1696717369194; 
 Sat, 07 Oct 2023 15:22:49 -0700 (PDT)
Received: from Slimbook.. (181-251-201-31.ftth.glasoperator.nl.
 [31.201.251.181]) by smtp.gmail.com with ESMTPSA id
 p7-20020a056402074700b0052f3471ccf6sm4315631edy.6.2023.10.07.15.22.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Oct 2023 15:22:48 -0700 (PDT)
From: Bouke Sybren Haarsma <boukehaarsma23@gmail.com>
To: maarten.lankhorst@linux.intel.com
Subject: [PATCH 2/2] drm: panel-orientation-quirks: Add quirk for Ayn Loki Max
Date: Sun,  8 Oct 2023 00:22:06 +0200
Message-ID: <20231007222205.316032-4-boukehaarsma23@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231007222205.316032-2-boukehaarsma23@gmail.com>
References: <20231007222205.316032-2-boukehaarsma23@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 08 Oct 2023 07:57:55 +0000
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
Cc: tzimmermann@suse.de, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, mripard@kernel.org, boukehaarsma23@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add quirk orientation for Ayn Loki Max model.

This has been tested by JELOS team that uses their
own patched kernel for a while now and confirmed by
users in the ChimeraOS discord servers.

Signed-off-by: Bouke Sybren Haarsma <boukehaarsma23@gmail.com>
---
 drivers/gpu/drm/drm_panel_orientation_quirks.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/gpu/drm/drm_panel_orientation_quirks.c
index 7466354c7e5b..5adf9ff07c3e 100644
--- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
+++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
@@ -196,6 +196,12 @@ static const struct dmi_system_id orientation_data[] = {
 		  DMI_MATCH(DMI_BOARD_NAME, "NEXT"),
 		},
 		.driver_data = (void *)&lcd800x1280_rightside_up,
+	}, {    /* AYN Loki Max */
+		.matches = {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ayn"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Loki Max"),
+		},
+		.driver_data = (void *)&lcd1080x1920_leftside_up,
 	}, {	/* AYN Loki Zero */
 		.matches = {
 			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ayn"),
-- 
2.41.0

