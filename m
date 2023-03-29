Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAFF86CF1B5
	for <lists+dri-devel@lfdr.de>; Wed, 29 Mar 2023 20:06:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BBB310E52C;
	Wed, 29 Mar 2023 18:06:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x31.google.com (mail-oa1-x31.google.com
 [IPv6:2001:4860:4864:20::31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32CAA10E52C
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Mar 2023 18:05:56 +0000 (UTC)
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-177ca271cb8so17100387fac.2
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Mar 2023 11:05:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=usp.br; s=usp-google; t=1680113156;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Dogo3BF2L9vBC4AT6xgMxoTJFXvXmfhOs0Wm2IXvUoA=;
 b=L0HwYwO3L/MNP7MmWs2RcJbpPDw4+LjAB6LZUkRjGQGTcOAeJV74uov52Ekfpp5dmx
 s9lGs7hbWkvuFTUwneVaHXamZVEnm4xDfnGAUPal58PW25X0ImisVK6cetvN9lnDxxpB
 S14152RBp3zDsK3rafFd6eeNnYPrDzXt3KSOf/f8/tH+QAuum8S3zUYAVtXz29+H3Ysr
 +JJmJ+SZm+bax72OFXXBsTF/JNpymn0AgJeQej1Hzg2/4mgEwTNsa5oo41F6HWUq2+Kg
 AkSmdqdvYDrjPRkHg8UO1RD3UssIXsf/yezuTeWy91kkBOGVueLttPUm9Jmt2+Nf3SDi
 QqWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680113156;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Dogo3BF2L9vBC4AT6xgMxoTJFXvXmfhOs0Wm2IXvUoA=;
 b=aXjlfy9E3ADyOuQZ59MDXpJ2/vNIuycjyX+M+NSEGBxqfVwXUZUkpJms2MaTQnbM5/
 2qsVVPEtuqZHPLwhMRdEWXCEbg43+1DvWPxHNZCPJVPS1wXT1bqzaDL+2LJnzmrS7oEm
 Ly6e1xZoXGHzLun12pktYk5Xu8pJpKel/4hfYbZ1lMHkoRseFneB/ugjtuDS2hovi9ub
 JSFT8cvYLm5d3gbiyWHwhPYCCql68cHwRDFKRJdLMrOAn1FUsw25jibRKXkO4FY0BPt7
 xBC0Upe2mt2Eo0AdoNxwLchQYusmTnajHrNiAFOC+tYRk+XOTYPxMVRDaIaYDltFB6oy
 syRQ==
X-Gm-Message-State: AAQBX9f4JH/3JwcX8N1rUyXUt/Zwfvj84R3oLf1MWz0IlXpxc+wO6sd7
 DCbQCmGhiK79hLNyMXbnpce/rQ==
X-Google-Smtp-Source: AKy350Y5nATzpWAejjs20Se142ta9u/ME/7RWzY7Q28O0MbOueyG/JtjDWUShvoc2IoJ5SkqvG6ZWg==
X-Received: by 2002:a05:6871:282:b0:177:a8a8:65c with SMTP id
 i2-20020a056871028200b00177a8a8065cmr13194714oae.4.1680113155874; 
 Wed, 29 Mar 2023 11:05:55 -0700 (PDT)
Received: from ARCHaio.localdomain ([2804:1b3:a2c0:c911:919f:bd20:4f2a:8383])
 by smtp.gmail.com with ESMTPSA id
 yo7-20020a05687c018700b001777244e3f9sm12098767oab.8.2023.03.29.11.05.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Mar 2023 11:05:55 -0700 (PDT)
From: Caio Novais <caionovais@usp.br>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] drm/amd/display: Mark function
 'optc3_wait_drr_doublebuffer_pending_clear' as static
Date: Wed, 29 Mar 2023 15:05:34 -0300
Message-Id: <20230329180534.99151-3-caionovais@usp.br>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230329180534.99151-1-caionovais@usp.br>
References: <20230329180534.99151-1-caionovais@usp.br>
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

Get rid of it by marking the function as static

Signed-off-by: Caio Novais <caionovais@usp.br>
---
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_optc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_optc.c b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_optc.c
index 08b92715e2e6..c95f000b63b2 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_optc.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_optc.c
@@ -291,7 +291,7 @@ static void optc3_set_timing_double_buffer(struct timing_generator *optc, bool e
 		   OTG_DRR_TIMING_DBUF_UPDATE_MODE, mode);
 }
 
-void optc3_wait_drr_doublebuffer_pending_clear(struct timing_generator *optc)
+static void optc3_wait_drr_doublebuffer_pending_clear(struct timing_generator *optc)
 {
 	struct optc *optc1 = DCN10TG_FROM_TG(optc);
 
-- 
2.40.0

