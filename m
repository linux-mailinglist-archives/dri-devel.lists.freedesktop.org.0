Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D5B389371F
	for <lists+dri-devel@lfdr.de>; Mon,  1 Apr 2024 04:43:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F116710EDE7;
	Mon,  1 Apr 2024 02:42:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="uFI/XTIJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75CEB10EDDD
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Apr 2024 02:42:51 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-513d717269fso4309516e87.0
 for <dri-devel@lists.freedesktop.org>; Sun, 31 Mar 2024 19:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711939369; x=1712544169; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=7rDSJ7AmNeLa9TRlNQ3TwOTepykvmV+/MVa8FZsXwpw=;
 b=uFI/XTIJnOraLaEmNJF2Jve4sKspPB9MBks7Dh48FUNNlbrYoWORjoAkLtF1uw1bla
 Rxi6h7zcBZJanHNNlPQ4/dm1AP9419rUzJ4/ntn0sDFPVswIjOWUWvBAWmzMUWIsBQJi
 4i7sIlo9pytgYPJVbra4Y7UAy5KAUEFtvkYQMBAwxyLu9SK9uvTBzKlEzM9xabEKTGyz
 Waw5FXPWlcR5PaSHXa0ZSyAD/YTZ6JDXr2JUw+F9+EqpRwno8tDfiZzTIA6jKs8YtbYn
 lNnNeJuYim7m21DTV/SERrzF+62WDkGSSJlnExe2YvYCDc2zql8bILVFQ5yuBcQjfQwD
 dVrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711939369; x=1712544169;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7rDSJ7AmNeLa9TRlNQ3TwOTepykvmV+/MVa8FZsXwpw=;
 b=nPBbZr3ZsMutLpme5TkQe12zjejKTVdNHpV9fjNj4Zmu6dU7ozLVETufZclazk3QNJ
 Zg6Mv9HZ+yj14x/mqsO/hPIYJExJBvAwjqMEp7gnJ1WvGoHi6JnJL3U7WR1cc5234V0M
 MhEMqhSQjUARe/sHFqvPgpgAfghIc5cNVQdE2Djk88Afaq3Ci9HVkrubvrbp7Czl5Xnz
 BXIxG9T4/udWFC/RY1FQfV96nSzNGi36yXieUDQUFkNa945R6yGAfqDpTC9/inZUppgs
 e4ji7/nPfk4BpLADEIDGc6WQZYhP6OkJboTw8GR93EsJSo7PGcaTd5cgAY6nt7urQh3N
 EJPg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVOG/ol8fL14s2uN1jXZwGFmDk3iLiGvw+MTI70CYJygo0UIvKIUUeiMNqUchsMTGgvt35ysDR8SMOpaN1wyyiiaxzRq7BVMoGXWbuKJIF3
X-Gm-Message-State: AOJu0Ywz7MXAUIsBzxkxt7q52n3JzKSSgu6qrlRYwYeoN1r5y35kAxcU
 cq5cIQpetv8jm9gSZgQA3e5MI88srZHcrGwqMc8cL7RY0LDL4d/7Urq1IjGTQQs=
X-Google-Smtp-Source: AGHT+IHSIDHPRdM5xZAaH3Io7sMMmdjJv4c2i8FE+Koto1FlctrjZgdMY7hLAVOqv0ATA8ZE7VAHzQ==
X-Received: by 2002:a05:6512:20a:b0:515:c43e:19c6 with SMTP id
 a10-20020a056512020a00b00515c43e19c6mr5023289lfo.23.1711939369518; 
 Sun, 31 Mar 2024 19:42:49 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 w28-20020ac254bc000000b0051593cfb556sm1310603lfk.239.2024.03.31.19.42.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Mar 2024 19:42:49 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 01 Apr 2024 05:42:31 +0300
Subject: [PATCH v5 01/18] drm/msm/mdp5: add writeback block bases
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240401-fd-xml-shipped-v5-1-4bdb277a85a1@linaro.org>
References: <20240401-fd-xml-shipped-v5-0-4bdb277a85a1@linaro.org>
In-Reply-To: <20240401-fd-xml-shipped-v5-0-4bdb277a85a1@linaro.org>
To: Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-kbuild@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1279;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=gQvNFYs+XySj42ee8HZa37cqRlMD12EMVNfdjmgcLAk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmCh8kad/EEq82XdpkE7It1OWLKMTzOoaDJB4Vx
 wHdIwLFPeGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZgofJAAKCRCLPIo+Aiko
 1QJoB/4lw7tABe2oXMBUbWaVTwdiGuyjcXtO2DBKvgfLzHDVK2KIp7tKRGRodYQo9pPhRWBW4pb
 NBXVffDrmZfR6R+e18AK8THWxmrP2+GfEYo3ozwbWGdiEvW52MJd3bTYIw/Pk8k25WlB58wZzOL
 FfgWM6A/8sleWqv37sIvBGRgityJwrxkDlktSJCfSl6x0U3MxXdWTj5z4je8nQpmzFc0AcFDIKQ
 YoQW4ckTlHI9GICW+AcpHa2ApE+hkbmiMgwGJClq0qlRPGLTC0muR0B2Uh52pWv2aelaAj9Wz7N
 bUnFGZedMPlWBFKAM1phN5l/lTWF+j/2Yj8Kxz80YfUWhWMW
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

In order to stop patching the mdp5 headers, import definitions for the
writeback blocks. This part is extracted from the old Rob's patch.

Co-developed-by: Rob Clark <robdclark@gmail.com>
Signed-off-by: Rob Clark <robdclark@gmail.com>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.h b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.h
index 26c5d8b4ab46..4b988e69fbfc 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.h
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.h
@@ -69,6 +69,16 @@ struct mdp5_mdp_block {
 	uint32_t caps;			/* MDP capabilities: MDP_CAP_xxx bits */
 };
 
+struct mdp5_wb_instance {
+	int id;
+	int lm;
+};
+
+struct mdp5_wb_block {
+	MDP5_SUB_BLOCK_DEFINITION;
+	struct mdp5_wb_instance instances[MAX_BASES];
+};
+
 #define MDP5_INTF_NUM_MAX	5
 
 struct mdp5_intf_block {
@@ -98,6 +108,7 @@ struct mdp5_cfg_hw {
 	struct mdp5_sub_block pp;
 	struct mdp5_sub_block dsc;
 	struct mdp5_sub_block cdm;
+	struct mdp5_wb_block wb;
 	struct mdp5_intf_block intf;
 	struct mdp5_perf_block perf;
 

-- 
2.39.2

