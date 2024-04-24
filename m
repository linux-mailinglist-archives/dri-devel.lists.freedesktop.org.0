Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84B9D8B0875
	for <lists+dri-devel@lfdr.de>; Wed, 24 Apr 2024 13:41:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA7FF113A89;
	Wed, 24 Apr 2024 11:41:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="c2Zzlnym";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21482113A8A
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Apr 2024 11:41:54 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-41af6701806so5930285e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Apr 2024 04:41:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713958912; x=1714563712; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ELudIBLkjdgxS0elp1PUtkat+hOoPGI1SePmaBawDG4=;
 b=c2Zzlnymiz7GhpXUoMvkq1sThO7kz/P/ch5dcMn4uV9nf5CNK8igLpbz8xVns+zhFr
 CfNBEEUITypPt2iycGcJMQGQTF9rV7Tpra8HZbYwrjiy9EpuTuWhJHe2ErO83vRbetrh
 ErKmxRsZhJauukcoThs3P3EZZ9c4pFXlbAgqsrWQrpyG8MzV2Eo94MOOcxW3JNWcxkC7
 6KEpIKkmHn1CtwuiCL4TqCvuB/UURJ2wYtFkTm99OclOwR47Lll58+NZ7HVFsq1QFIAI
 3W0Ir7prmVjh0u06dcpGQrLo0NrsdSlcZT1+qd8Qc4f7Rpus5k0ahY4VmsJDxZgaqCJL
 RrTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713958912; x=1714563712;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ELudIBLkjdgxS0elp1PUtkat+hOoPGI1SePmaBawDG4=;
 b=HSO3LUTovzVWf3YuW0qelKdW//C1xQa7OxzlMwslxcT0bMbQJwKGWE3JUlpRogh0cz
 MNrYESlACPimhb9KUejJ+fcBD3sENKvATQGTvp2zy8Cd1CrCV2C3EZ8X6I+paXihzCpn
 A2Jr1baqNtmg5UTpItsQFlNuoXYfCoDBIKVVyz1ioG3HB3oMReeiJCHmq/wRJ0NGBgVB
 0Q2svUjeNWh01Wif5gyZzWOg94BhX+5XSS6wCwyovdVJS5JrU/O5qMRtuzqdleCJvDEY
 kSF4loatqR1AF30eUD9Q0ZkEz/fx/rOGMJzG8uRD1oe/Mtro78O4+QzVKgsaPZC/z7jm
 r1Vw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWXpnETUkEDE+N8tdKjyTOcoaEu0irbqZUcTu43EqFcHWtJ5BtqX9Pnu4c6f7au+D5OH5CEnIr/fugIlURhExHRVaaz5UktUF7NI1Am6Uh7
X-Gm-Message-State: AOJu0Ywoyrv9mSwv6tWYtV1hrjfL3ZKCFuDUrb5bLf8ORxkDfDGckYxI
 5P8sk88BstQLphFq6Ftfmb8UVKqVBQRrNkJAVclTGAmRi9+br8wxhPE89gVTINc=
X-Google-Smtp-Source: AGHT+IFC3Xn9CFwEPi+nZrUxwB85rOXzdnYEMUpkC1nwbPG2hnf4U7btQl9yxJcgwUfAxP5VTsmFNw==
X-Received: by 2002:a05:600c:450a:b0:41a:e5f5:9a4a with SMTP id
 t10-20020a05600c450a00b0041ae5f59a4amr1690065wmo.9.1713958912043; 
 Wed, 24 Apr 2024 04:41:52 -0700 (PDT)
Received: from localhost ([102.222.70.76]) by smtp.gmail.com with ESMTPSA id
 h3-20020a05600c314300b0041abdaf8c6asm5404240wmo.13.2024.04.24.04.41.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Apr 2024 04:41:51 -0700 (PDT)
Date: Wed, 24 Apr 2024 14:41:48 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Harry Wentland <harry.wentland@amd.com>,
 Charlene Liu <charlene.liu@amd.com>
Cc: Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Alvin Lee <alvin.lee2@amd.com>, Wenjing Liu <wenjing.liu@amd.com>,
 Jun Lei <jun.lei@amd.com>, Tom Chung <chiahsuan.chung@amd.com>,
 Dillon Varone <dillon.varone@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/amd/display: re-indent dc_power_down_on_boot()
Message-ID: <e5f538ab-ebc8-400b-8104-4642b8089b4f@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
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

These lines are indented too far.  Clean the whitespace.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/amd/display/dc/core/dc.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc.c b/drivers/gpu/drm/amd/display/dc/core/dc.c
index 8eefba757da4..f64d7229eb6c 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc.c
@@ -5043,11 +5043,10 @@ void dc_interrupt_ack(struct dc *dc, enum dc_irq_source src)
 void dc_power_down_on_boot(struct dc *dc)
 {
 	if (dc->ctx->dce_environment != DCE_ENV_VIRTUAL_HW &&
-			dc->hwss.power_down_on_boot) {
-
-			if (dc->caps.ips_support)
-				dc_exit_ips_for_hw_access(dc);
+	    dc->hwss.power_down_on_boot) {
 
+		if (dc->caps.ips_support)
+			dc_exit_ips_for_hw_access(dc);
 		dc->hwss.power_down_on_boot(dc);
 	}
 }
-- 
2.43.0

