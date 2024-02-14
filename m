Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 801BA855765
	for <lists+dri-devel@lfdr.de>; Thu, 15 Feb 2024 00:40:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F37710E42F;
	Wed, 14 Feb 2024 23:40:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="nqKMcGMc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2A9C10E0BE;
 Wed, 14 Feb 2024 22:44:43 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id
 d9443c01a7336-1d7881b1843so2363225ad.3; 
 Wed, 14 Feb 2024 14:44:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707950683; x=1708555483; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=52CHDYauU/a10vE3y6h2ooh2dWhu6+6HHCSiTcqK4zg=;
 b=nqKMcGMcAFvM4LJw33Va3kQJ5JMSEubMoDbxb7QiF9vPRx3ItRO2E+taeznq8D1Wkc
 0//SOQsNg2JosHoTCOd+hYw7+/ktBec5r0WpKUwuRO4Reigbl6g9teosAe61OaAZzcl+
 08LlhOUeYsG2HoEONy6ni9lpT7ON260KLKbTkuMsCeQ5JJgUitrG2XwhgE2Qo1LHhAI3
 xdIWhp5XhRWSPpvFGo06U5Q3MieX2wdVb0+p0WQQuo4Y782imP/OI1C4p4IuhSPVgQGJ
 eOey+kopOIgECidJTpCJ3+huf2bDbiiJRXYmHgfQACYTmW9RXaAEhrkJja2eHQcBL/3S
 TYsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707950683; x=1708555483;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=52CHDYauU/a10vE3y6h2ooh2dWhu6+6HHCSiTcqK4zg=;
 b=B1zHFGiBi+/tn4pKf0nyI2TlyxuhnuskqRSPlYrCZFHLP4wOF0WMs8/QQLt7VwqAnI
 LUXZ3vE4ETQ2qdSwMjre4o0GWUFP8EyAb/rrv0Rha+XhlOMeg71Jg6kGDdlm6dQBGWb/
 Yyl4rtxGva89Ptj0ai3jR/WMFFCX51ZVP+sIfa8ykvUiVg+CS31kgmX7qsmuDqXhgvCG
 xjW3+Xc9mD4y1WHtecrHj/eacvBvdzVesoWssozn42eH0rebjT67UgsKFga9sUx17F9N
 SNWNTk9mOgS3U0U+emWUzAJeurrc1hxkl+3DCysWSJSTFUzTO1qDSj2u9nKHkugbTkwu
 sjFQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWPOeViZqnZhTsr2xmlA/yAz3qDFpGsGAuG3AutEkOe5hHq8Tie3BZO5hQ5CFeS4ko8tBr6IPdGufDcJ211AEO9xjl9I80yYw0rj8Ku8jvQr/OztI5y42GDadhdjKBfagYLv/upPbhNNIprkOBAFQ==
X-Gm-Message-State: AOJu0YxTpT2w641ZwKRIqg+9zHYjnPFkJwmC3d3jbDaYwmZyIiRWpNwW
 ofHaBx+ez12xmrr3YhHRmjN9edWg5cVxT4aFrm8KLbkgi7qy6nc1
X-Google-Smtp-Source: AGHT+IHThuCseJOtkAEkUVD/U78rJoGV3ZDVzYU76pLky/MI5VYa3CvRLgN29YUQdviclhelDO9eVA==
X-Received: by 2002:a17:903:58d:b0:1d9:4282:4be8 with SMTP id
 jv13-20020a170903058d00b001d942824be8mr25058plb.25.1707950683457; 
 Wed, 14 Feb 2024 14:44:43 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCW3PbDyOGQjfxDvf/hogoNHhkMRpwgJg30QjQjhwObnfu2nN2Mnu1YNT2BkC+rTrcjuEW+j8OJVdq+nnLbV/RvdrIO0eYsASwXu9TXo0wMi9nVW6Fdr5ARMdOdgr3IVM0I0bCMqQnvoxEqN9fv2FNrAq6BDrOQcVyodAFfErO3pmMm+50u5nDmu87O0IhcWZzfQydm+lCwidFsvknqG3BRatBsLqfeTNDPcUGr+H8VMmMzr52gbLqFvNmTHoa8uy5M/2XYrWw+6q3IlcSHh250Gzj0ZzzITTR5b3zZ/3jxPfExjE676xCPE5HSnkp05gk7x9BClAYXcrrg96WoGI9zE1BRiTdnv1f3b
Received: from localhost.localdomain ([179.225.251.251])
 by smtp.gmail.com with ESMTPSA id
 jv12-20020a170903058c00b001d6f29c12f7sm1077950plb.135.2024.02.14.14.44.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Feb 2024 14:44:42 -0800 (PST)
From: Marcelo Mendes Spessoto Junior <marcelomspessoto@gmail.com>
To: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch
Cc: Marcelo Mendes Spessoto Junior <marcelomspessoto@gmail.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH 3/3] drm/amd/display: clean codestyle errors
Date: Wed, 14 Feb 2024 19:42:17 -0300
Message-Id: <20240214224217.15514-4-marcelomspessoto@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240214224217.15514-1-marcelomspessoto@gmail.com>
References: <20240214224217.15514-1-marcelomspessoto@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 14 Feb 2024 23:40:07 +0000
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

Use () for macro and adjust initial brace for dmub/src/dmub_dcn35.c

Signed-off-by: Marcelo Mendes Spessoto Junior <marcelomspessoto@gmail.com>
---
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn35.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dmub/src/dmub_dcn35.c b/drivers/gpu/drm/amd/display/dmub/src/dmub_dcn35.c
index 60223efc6..fa38a5ae6 100644
--- a/drivers/gpu/drm/amd/display/dmub/src/dmub_dcn35.c
+++ b/drivers/gpu/drm/amd/display/dmub/src/dmub_dcn35.c
@@ -35,9 +35,10 @@
 #define BASE_INNER(seg) ctx->dcn_reg_offsets[seg]
 #define CTX dmub
 #define REGS dmub->regs_dcn35
-#define REG_OFFSET_EXP(reg_name) BASE(reg##reg_name##_BASE_IDX) + reg##reg_name
+#define REG_OFFSET_EXP(reg_name) (BASE(reg##reg_name##_BASE_IDX) + reg##reg_name)
 
-void dmub_srv_dcn35_regs_init(struct dmub_srv *dmub, struct dc_context *ctx) {
+void dmub_srv_dcn35_regs_init(struct dmub_srv *dmub, struct dc_context *ctx)
+{
 	struct dmub_srv_dcn35_regs *regs = dmub->regs_dcn35;
 #define REG_STRUCT regs
 
-- 
2.39.2

