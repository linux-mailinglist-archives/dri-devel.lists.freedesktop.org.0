Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0367B7B4B10
	for <lists+dri-devel@lfdr.de>; Mon,  2 Oct 2023 06:42:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7754210E104;
	Mon,  2 Oct 2023 04:42:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3215010E104;
 Mon,  2 Oct 2023 04:42:15 +0000 (UTC)
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-1c60a514f3aso112452365ad.3; 
 Sun, 01 Oct 2023 21:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696221734; x=1696826534; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Apgh5I/AZlw1bZUGVlRw0FcB6BXkBGvFxHpXJVnA298=;
 b=JaY7FRnu1tAAJqingLClp0rFuNETDjLxx0ZoxZaEuI/vf5Ukn2YjW+bNLusxY/oQM7
 dSdTBJmHEt3irhggkoPsVnrcb6XyLYqwMc7ObWvn069OST4dF/nH0kvIzmYQ93iMl/PJ
 wfsf3IcjFAF7ibJIoB86IQZlvmheYyHMPTxWGJTX7B6Cae/FJxXqkyp0MrrOGiCXHu5t
 9Y2T1w2UopFXVnwVmJICwCB06J1+Xp2ec8ZuXxo+4DG6eErbaOJiHAYZqWd555Kdp+M+
 GvQtyXsleHn4/r2cCA/w2fRt3+pT3TxWKRIFfqXXmwHSZm+clj3/rBmPy36JsuGC1ro8
 +jHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696221734; x=1696826534;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Apgh5I/AZlw1bZUGVlRw0FcB6BXkBGvFxHpXJVnA298=;
 b=wRM7VyKok7qz9+ykTh53G3cRCyHf8XCqlkXPoDSuAVT7oNbMy3MS6NElx0ws+0+/IZ
 HGGBfT3z+MUu5FLVatsKyCSNIQNLmi0E4RGV+qu4rXjaJuKoOWM1B6BNe+NWfRC0ahiA
 v/SYQJgGb+CGfc0OHLOkESY6LgPtRNkrIgeBxYj9v8eIhzYMiMoy5HS2gRUf3kMxyoKT
 4XSemfK3wpLHt4YGuP7mDQd7gntGfz2AZULhA3qSwZH8itduIHogvn7KUQ5ItULFCjCF
 MKdCaOqrfiuOkOeJI81r9zyrX3kXZeJba842lnZtn/LLXEebmRE0omU69v3GydQ7uvdr
 kfKA==
X-Gm-Message-State: AOJu0Yxfz3UtOOqXDQhPkBAVImzhf6HGvRHyba7S/q4mDE5Y/uAkrJwP
 jHrLRsgaFZYXBBkjd4E5SEg=
X-Google-Smtp-Source: AGHT+IFFfibQl2jUVEX5S5XbCIBmeSoheGM2nkffMvC6cL/VFt9IIncdmDz+joXJ2xn+KBlnCBFneQ==
X-Received: by 2002:a17:903:428b:b0:1b8:2c6f:3248 with SMTP id
 ju11-20020a170903428b00b001b82c6f3248mr10461230plb.39.1696221734619; 
 Sun, 01 Oct 2023 21:42:14 -0700 (PDT)
Received: from sagar-virtual-machine.localdomain ([103.157.161.86])
 by smtp.gmail.com with ESMTPSA id
 jj7-20020a170903048700b001c73701bd17sm7397429plb.4.2023.10.01.21.42.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Oct 2023 21:42:14 -0700 (PDT)
From: Sagar Vashnav <sagarvashnav72427@gmail.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Sagar Vashnav <sagarvashnav72427@gmail.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/amd/display: add kernel docs for dc_dmub_caps
Date: Mon,  2 Oct 2023 00:41:19 -0400
Message-Id: <20231002044126.70197-1-sagarvashnav72427@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <9270c1f3-c8f3-4b3c-91ec-ed17d97ecafd@infradead.org>
References: <9270c1f3-c8f3-4b3c-91ec-ed17d97ecafd@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
index 81258392d..14b4c503d 100644
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

