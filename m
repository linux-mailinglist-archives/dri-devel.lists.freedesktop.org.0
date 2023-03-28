Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEF966CCCD8
	for <lists+dri-devel@lfdr.de>; Wed, 29 Mar 2023 00:10:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B9F410E9CF;
	Tue, 28 Mar 2023 22:10:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x29.google.com (mail-oa1-x29.google.com
 [IPv6:2001:4860:4864:20::29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED32E10E9CF
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Mar 2023 22:10:07 +0000 (UTC)
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-17683b570b8so14273749fac.13
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Mar 2023 15:10:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=usp.br; s=usp-google; t=1680041407;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BMy24C/CJcL1RyDSHpFHuRxO0kvwZUu109+roAxOPvo=;
 b=wxQsMiagHFYlELTncl0hVTUbjRXDTYyc0shHS8KtaDM9gucPXxqsiP5rlVSKWZ9NZn
 o30RV+ztg5Jgevmjti145HOT0cI+vZGnuvDK8RizrBkp0woDIK49oY87qFabeAMij/0R
 FUZWqbBzU6C33hlLHTRpYNJlxNuaSgKFgfcnvOlpBagpHaYpTa9cEGouuz8enCLlYGk6
 g+LkeoO6UocTqpTHJ/4YIm3WugYUN+BlZmDgnZT55SahWZ1xFO7+LUEmv79sjuQmKLdc
 QaVcILCHIwgUyjO+cfztirPbx3dgoJJ4kAwez0dm631znIcTeZ5sel8n0azV1RSFlkXO
 ltWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680041407;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BMy24C/CJcL1RyDSHpFHuRxO0kvwZUu109+roAxOPvo=;
 b=3atSEkyBpGY6x2dPufllFGg9JwRL5qhLZxgren1b/xjsetvyDLs7GI1l8Do5g29AyR
 EVEAfvkjxab09KBAdUH2fzgU01wfVjBFA9GkfzW2XjHffIQ976pYkTi9XxADEDKsKUUv
 cpKoLU3ME/3/oERt7+sjvowSKtTAxzbXPxEgaq3frOYuXSAQccvT0/exdAhyVo3vIB9k
 rYeTCAWB20AiiavcB43rpwlw3wSvfIvwhTQ4fKhzvzQXg59ZVcaY8YiWa5sqON+jod6L
 +/1Ox9fOyx1oLxXXC2+JXM9kR2hLsG3bcNCmhBEHR+x+X8ofl2E4/EiVaFFr+vgPMV5c
 p1VQ==
X-Gm-Message-State: AAQBX9fDNFoNQz4O786/KFAQPzBDVqjISi9tZqT1bvU/GqTBV//eDRAu
 zqXwFHZqiqgau8tyF/q7LbG5XQ==
X-Google-Smtp-Source: AKy350aJnaHV5C1f+VmPzg7uN9QmuXGUTkdN5gRu4FDHIoqC0Av0XrBR+egsb2rAmrDRVizrVOri0w==
X-Received: by 2002:a05:6870:2194:b0:17e:cb7:29c0 with SMTP id
 l20-20020a056870219400b0017e0cb729c0mr12101988oae.13.1680041407250; 
 Tue, 28 Mar 2023 15:10:07 -0700 (PDT)
Received: from ARCHaio.localdomain ([2804:1b3:a2c0:c911:919f:bd20:4f2a:8383])
 by smtp.gmail.com with ESMTPSA id
 ee39-20020a056870c82700b0017299192eb1sm5400446oab.25.2023.03.28.15.10.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Mar 2023 15:10:06 -0700 (PDT)
From: Caio Novais <caionovais@usp.br>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] drm/amd/display: Add previous prototype to
 'optc3_wait_drr_doublebuffer_pending_clear'
Date: Tue, 28 Mar 2023 19:09:47 -0300
Message-Id: <20230328220947.108188-3-caionovais@usp.br>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230328220947.108188-1-caionovais@usp.br>
References: <20230328220947.108188-1-caionovais@usp.br>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 Wesley Chalmers <Wesley.Chalmers@amd.com>, Gabe Teeger <gabe.teeger@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Qingqing Zhuo <qingqing.zhuo@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Roman Li <roman.li@amd.com>, Nicholas Kazlauskas <Nicholas.Kazlauskas@amd.com>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mairacanal@riseup.net>,
 Hamza Mahfooz <hamza.mahfooz@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, Deepak R Varma <drv@mailo.com>,
 "Lee, Alvin" <Alvin.Lee2@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Jun Lei <Jun.Lei@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Caio Novais <caionovais@usp.br>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Compiling AMD GPU drivers displays a warning:

drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_optc.c:294:6: warning: no previous prototype for ‘optc3_wait_drr_doublebuffer_pending_clear’ [-Wmissing-prototypes]

Get rid of it by adding a function prototype

'optc3_wait_drr_doublebuffer_pending_clear(struct timing_generator *optc)' on drivers/gpu/drm/amd/display/dc/dcn30/dcn30_optc.h

Signed-off-by: Caio Novais <caionovais@usp.br>
---
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_optc.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_optc.h b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_optc.h
index fb06dc9a4893..2e3ba6e2f336 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_optc.h
+++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_optc.h
@@ -331,6 +331,8 @@ void optc3_lock_doublebuffer_enable(struct timing_generator *optc);
 
 void optc3_lock_doublebuffer_disable(struct timing_generator *optc);
 
+void optc3_wait_drr_doublebuffer_pending_clear(struct timing_generator *optc);
+
 void optc3_set_drr_trigger_window(struct timing_generator *optc,
 		uint32_t window_start, uint32_t window_end);
 
-- 
2.40.0

