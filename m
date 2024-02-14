Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D4DD855763
	for <lists+dri-devel@lfdr.de>; Thu, 15 Feb 2024 00:40:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7759010E0F8;
	Wed, 14 Feb 2024 23:40:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="iY7FansC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B8A510E0BE;
 Wed, 14 Feb 2024 22:44:36 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id
 d9443c01a7336-1db51e55023so1684675ad.1; 
 Wed, 14 Feb 2024 14:44:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707950676; x=1708555476; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1Q32EcKm3pV9/AlSqY88nS2YERlyFmdngDupmoiYCfo=;
 b=iY7FansCkhJaeF2VTadUyLySXGY892aisUHVFqkKT02SRRaHVcRTFjcWMlP+kaz34I
 5437fTMKHWJZ7/aIomW4N1y6HF/PfiHWSSlaX/JufcB7kRoovyFIBl0/ssMrGg6t1YQ6
 z8+HzNh89c2cYdRB3fdrU3FOerW/2ZQnmK1WP/Y66Rmns/8JlMWQ3pUdlHumx0WZpOgx
 lINrwomH+OUXCL9PDxmdy3If0Kk9JbgmehxPICrtdxVizeAHArr2s1bf6a5yc/ggPUpJ
 4tl1gpyLZ+spWDJl6P7G39nQqDN7PLyUAKjaluES+psNik1W3/1RI9HvjNDQdHA7wKj3
 qWmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707950676; x=1708555476;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1Q32EcKm3pV9/AlSqY88nS2YERlyFmdngDupmoiYCfo=;
 b=ILP0FGEA+mNLH2noiw1cuvaEn8Y28+NnR3zoBpvuB54dzB+LCrz673KI4U1xxSuzkI
 EmvmiDq2Y962U/QePvu8Lq/yT5cerqR5mLCbRUc/NhxEOT0kLzFlBphkdV25qIM4wc0+
 VOIpp5F7ugUKYdWHKzRRpmSzgi9HVql1qAvWqJjSNmG0dH/Z9uBHK6kC/oA7nuVtCyyx
 d+mqhCzg/zaiExXxhHjJtAG5cceQEVFS4Jsjnr3NAXe1dEXSVJADdNhs5tqeFsooHm9q
 ofUw0PWmExAy/jGNrl/4DOQKcv7slybrWmYvWA9+1xKExYN1nUc+dgJcXPSBO5T+/kKp
 q8ng==
X-Forwarded-Encrypted: i=1;
 AJvYcCVX5gl+uSlbvzrDG3J0gexhDjEtSbM0KnClXjFX/eU7DLg4QboKYhu4KataTRruX2rtyyUCBM/CKAE48bQs+6RfXc9EsF5RGKfXXYPEZzy60jS5U95FN/AtnrWYvvWWhlt+IAQ3TC5zTYBBc4v06Q==
X-Gm-Message-State: AOJu0YwoWxftRlIFxyYsj2mRPAc016PZLqwUoLFKMHx51YT+kOlHEfoy
 2bMe3ivMu9IbFpP0Ur47WpFflQk0ly9XD5G94zHg/LUmzQgFDNT8
X-Google-Smtp-Source: AGHT+IHX/AZTQHn3VRljeL94FwXsSMh/EfCYDQxyCWv141kPepDWnnkagR3seI7W41G954kTN1/abQ==
X-Received: by 2002:a17:902:c412:b0:1d9:626b:ae3d with SMTP id
 k18-20020a170902c41200b001d9626bae3dmr41433plk.18.1707950675981; 
 Wed, 14 Feb 2024 14:44:35 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXRmt9yLgvMeq4xtnSMnIy2JJ7h9kavIK4gEuKjFfIPxhXWyGp6Pibi5TulanyJZd2AHGwtRiXQbeszU5EBVu/NeerGI5gMTj4AMiS8ZStAjEvD0rHzUwV+9UUPswhxBAnPch9Iob1wSbKI1pMCOOaHNLJnSqCc0SbM5W8AAtQPuNTe/YgTLhGQadVpqokCqHBP593jR6qZf079+xKHa2Qm9ULRVp7DqSTzeRh0ZdnOckDBBIVj8xeuGDNcJfAXun1xPMuBkJPvJngCj+Nyo2Y/p/KghNiGKu/YGn/60xVf+ugBiIn2cxvMeMWmqt5G0fkBhM1u95DIxA1wYKxbT6wFsrPSKVqnshbB
Received: from localhost.localdomain ([179.225.251.251])
 by smtp.gmail.com with ESMTPSA id
 jv12-20020a170903058c00b001d6f29c12f7sm1077950plb.135.2024.02.14.14.44.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Feb 2024 14:44:35 -0800 (PST)
From: Marcelo Mendes Spessoto Junior <marcelomspessoto@gmail.com>
To: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch
Cc: Marcelo Mendes Spessoto Junior <marcelomspessoto@gmail.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH 1/3] drm/amd/display: clean codestyle errors 
Date: Wed, 14 Feb 2024 19:42:15 -0300
Message-Id: <20240214224217.15514-2-marcelomspessoto@gmail.com>
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

Use flexible array members in dmub/inc/dmub_cmd.h

Signed-off-by: Marcelo Mendes Spessoto Junior <marcelomspessoto@gmail.com>
---
 drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h b/drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h
index a529e369b..d748bedda 100644
--- a/drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h
+++ b/drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h
@@ -1588,7 +1588,7 @@ struct dmub_rb_cmd_idle_opt_dcn_restore {
  */
 struct dmub_dcn_notify_idle_cntl_data {
 	uint8_t driver_idle;
-	uint8_t pad[1];
+	uint8_t pad[];
 };
 
 /**
@@ -2421,7 +2421,7 @@ struct dmub_cmd_psr_copy_settings_data {
 	/**
 	 * @ rate_control_caps : Indicate FreeSync PSR Sink Capabilities
 	 */
-	uint8_t rate_control_caps ;
+	uint8_t rate_control_caps;
 	/*
 	 * Force PSRSU always doing full frame update
 	 */
@@ -3921,7 +3921,7 @@ struct dmub_cmd_abm_pause_data {
 	/**
 	 * Explicit padding to 4 byte boundary.
 	 */
-	uint8_t pad[1];
+	uint8_t pad[];
 };
 
 /**
-- 
2.39.2

