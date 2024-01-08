Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D70B9826A20
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jan 2024 10:06:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED12710E1C4;
	Mon,  8 Jan 2024 09:06:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9569010E1C6
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jan 2024 09:06:02 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-40d604b4b30so14018195e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Jan 2024 01:06:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704704761; x=1705309561; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=w2EyoLbnPqZmV+8zXuTXWwVH9AFKfyr2X73Q99Ksn7g=;
 b=UV5LqTbKAkaXwJikMZD+/NjF91M+GDEZUFSIrxC8+pjtVYUGucgADwdWtyCNGyJgMO
 sv2hECG7BdDDDwbmJkB1SY/mjDD6HDsoOvhtpxl+PB9TKgfn6xdldH54Nqt6kICO6lX/
 dNeWxXvcr2bQ/4s0QK1KQfRBqiatIPI3dxDCrqXdwWc6d5O6c0/YX259lcDGAeTRbS1r
 TaZ8RNUlMRNDqxyjjesqaBQDspFf4DC1o2RxPGQ+GBR27C6eYGdBlERo0nQAWBU9jn8k
 RG1ANQStK/CjlSt0FuBJy5uwlbDohGMGhU54PSjGWfQ4B6V8Ggf4+/bjHyihjRYVmMqg
 GJ6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704704761; x=1705309561;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=w2EyoLbnPqZmV+8zXuTXWwVH9AFKfyr2X73Q99Ksn7g=;
 b=JMjlmThNZL1c9GCdpTFx+uF+RsacNoavSypwGvHR/d/j5z/tuUDkSxAoek/y0G7PAP
 mLANwSCtfKgTMSbiScRGB7RgNZjBtnRURUz6BRXtBh9W8TaBdFvIuzjRgTgT1pFBwl2h
 7rM7jEhxpXHO2RhXjqU6jcjsEgsYiek1OrETxYZqMLFVc0WnlxwCNNq26LJgPCv6zUoM
 ZSioa6mhClWHedvwStlT3XRdkRvEWqLfSayeMyvaosgAToBQH/Rws68UrYQB+ooA/3oB
 hHqyajBU/SEBmpHimvN6Q+KV70/I7+4CcKdPxiEI8B4YKdS+vUXVIqIxjJJTTBtuhY/4
 QJZQ==
X-Gm-Message-State: AOJu0YzfZXI519eXUSCIckclV+c88cZoNo6ta/9C6whomYLdFEcLy1Z3
 hzgJehaQLD9ZOGEWuQhaTbs/aRBR2USprg==
X-Google-Smtp-Source: AGHT+IGCvzuvE9K9DjjuxaKem4GrCkze1n5YKKD7JDglZ2aL/3ZCSvPl+yXc9xU+sGZNscYNx6DS0w==
X-Received: by 2002:a1c:7204:0:b0:40e:4aae:7e62 with SMTP id
 n4-20020a1c7204000000b0040e4aae7e62mr12731wmc.58.1704704760955; 
 Mon, 08 Jan 2024 01:06:00 -0800 (PST)
Received: from localhost ([102.140.209.237]) by smtp.gmail.com with ESMTPSA id
 w5-20020a05600c474500b0040e34835a58sm10219495wmo.22.2024.01.08.01.06.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jan 2024 01:06:00 -0800 (PST)
Date: Mon, 8 Jan 2024 12:05:57 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH] drm/xe: clean up type of GUC_HXG_MSG_0_ORIGIN
Message-ID: <ec22d742-632b-426a-ac86-62641a38c907@moroto.mountain>
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
Cc: Matthew Brost <matthew.brost@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 kernel-janitors@vger.kernel.org, Oded Gabbay <ogabbay@kernel.org>,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-xe@lists.freedesktop.org,
 John Harrison <John.C.Harrison@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The GUC_HXG_MSG_0_ORIGIN definition should be unsigned.  Currently it is
defined as INT_MIN.  This doesn't cause a problem currently but it's
still worth cleaning up.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/xe/abi/guc_messages_abi.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/abi/guc_messages_abi.h b/drivers/gpu/drm/xe/abi/guc_messages_abi.h
index 3d199016cf88..c04606872e48 100644
--- a/drivers/gpu/drm/xe/abi/guc_messages_abi.h
+++ b/drivers/gpu/drm/xe/abi/guc_messages_abi.h
@@ -40,7 +40,7 @@
  */
 
 #define GUC_HXG_MSG_MIN_LEN			1u
-#define GUC_HXG_MSG_0_ORIGIN			(0x1 << 31)
+#define GUC_HXG_MSG_0_ORIGIN			(0x1U << 31)
 #define   GUC_HXG_ORIGIN_HOST			0u
 #define   GUC_HXG_ORIGIN_GUC			1u
 #define GUC_HXG_MSG_0_TYPE			(0x7 << 28)
-- 
2.42.0

