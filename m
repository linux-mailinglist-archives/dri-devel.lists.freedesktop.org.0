Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84CC97B4147
	for <lists+dri-devel@lfdr.de>; Sat, 30 Sep 2023 16:55:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EEC910E170;
	Sat, 30 Sep 2023 14:55:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0DEA10E453;
 Fri, 29 Sep 2023 10:02:17 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-1c60f1a2652so3603145ad.0; 
 Fri, 29 Sep 2023 03:02:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695981737; x=1696586537; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=B/dcw9ZT8JKLzzG4Y/QBvOkYw2j2/eNx49mOmDCD4Ko=;
 b=Ywp5mUG1sR0ztP11YXhhkx0zqwNaqFviFeuhtpsUxiSwtnDl4EUDPV94flBr1gpHtg
 JK0YeKaPHEjuRwDLV+Anj2OwUKvs0AGxmmOY5UfaQiYZ9GaGjI7YvQ190ywOWKziOj4K
 FfYS/mNndGzcxBuImkDRE8y3YsJPAHKnn6WGMDiPYtsnVb7FGlaUvRC7of8wNxkpn8ux
 Ie0u6gB0LG+sin+uwbipIGx3w0OKpPUha10nOHz2JCf2S5ykW96OsLB6oFmoLkWLUR0V
 dC5KEhCVAuuwN60ts01JSzftZ8H1qgMUF8px0V5HbivnAc7wJ4j/LN3/mMGPbGeUu1zY
 yOQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695981737; x=1696586537;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=B/dcw9ZT8JKLzzG4Y/QBvOkYw2j2/eNx49mOmDCD4Ko=;
 b=IyuwkKDB8bifbGXXBONZHxfFx6IDxNEEzcEXCD7N0aK2VLnJCu5oMUkRC0uuNIDKa/
 hT/jk5haiPyFocTUdreLIBl0H1UKXEv1M07WB8rRJZwkF1v5bEuvqDebBj+utT9FAC3X
 ZaqguD+Ktf5wcAU7a+s+CzGRCSPqc+gD8Dt37DkxtbhelO58prt5LED+WcwOeTitfNmk
 mAbajewI/I6iWFownY41jMMEnJutxjdq6CUrJtsoPvsxDHOSzaS4RXLdwFK2fB/PIY3y
 X0sYOtDlzz3UFDw+aHlcEZvs3D38SJ2jUvqhDcnDA/a6ab7UkLn25KwT1AJBrpWpj4zw
 BmLg==
X-Gm-Message-State: AOJu0YxMCtU0V4APxeD/YFAJchJbBBrYQh1op3mGfkGFz41xjhVfBFP2
 FRrjzeB8iGpzyHTZ5cBaNt0=
X-Google-Smtp-Source: AGHT+IEsTj/2jI4gPTpIYC3RVNZHeJphdPDRhTWYlAF7sWlUBOha1hqRYO47qSnv51rGQwoJgcV50A==
X-Received: by 2002:a17:902:e545:b0:1c5:cf7c:4d50 with SMTP id
 n5-20020a170902e54500b001c5cf7c4d50mr5459105plf.18.1695981737162; 
 Fri, 29 Sep 2023 03:02:17 -0700 (PDT)
Received: from sagar-virtual-machine.localdomain ([103.69.217.155])
 by smtp.gmail.com with ESMTPSA id
 s18-20020a17090330d200b001c6052152fdsm11991603plc.50.2023.09.29.03.02.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Sep 2023 03:02:16 -0700 (PDT)
From: Sagar Vashnav <sagarvashnav72427@gmail.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Sagar Vashnav <sagarvashnav72427@gmail.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] add kernel docs for dc_dmub_caps
Date: Fri, 29 Sep 2023 06:00:51 -0400
Message-Id: <20230929100055.17563-1-sagarvashnav72427@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <215ed02d-1dab-480f-84fb-a828b294f716@infradead.org>
References: <215ed02d-1dab-480f-84fb-a828b294f716@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Sat, 30 Sep 2023 14:55:24 +0000
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

Add kernel documentation for the dc_dmub_caps structure.

Signed-off-by: Sagar Vashnav <sagarvashnav72427@gmail.com>
---
 drivers/gpu/drm/amd/display/dc/dc.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/dc/dc.h b/drivers/gpu/drm/amd/display/dc/dc.h
index 8125839..14b4c50 100644
--- a/drivers/gpu/drm/amd/display/dc/dc.h
+++ b/drivers/gpu/drm/amd/display/dc/dc.h
@@ -208,6 +208,16 @@ struct dc_color_caps {
 	struct mpc_color_caps mpc;
 };
 
+/**
+ * struct dc_dmub_caps - DMUB (Display Microcontroller Unit) capabilities
+ * @psr: support for PSR (Power Saving State Residency)
+ * @mclk_sw: support for MCLK_SW (Memory Clock Switch)
+ * @subvp_psr: support for SUBVP PSR (Sub-Viewport Power Saving State Residency)
+ * @gecc_enable: GECC (Global Error Correcting Code) enablement.
+ *
+ * This structure describes the capabilities of the Display Microcontroller Unit (DMUB).
+ * It specifies whether certain features like PSR and MCLK_SW are supported.
+ */
 struct dc_dmub_caps {
 	bool psr;
 	bool mclk_sw;
-- 
2.34.1

