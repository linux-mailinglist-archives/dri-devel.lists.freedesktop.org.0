Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E9F44C3588
	for <lists+dri-devel@lfdr.de>; Thu, 24 Feb 2022 20:16:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FB7E10E877;
	Thu, 24 Feb 2022 19:16:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 301D910E877;
 Thu, 24 Feb 2022 19:16:25 +0000 (UTC)
Received: by mail-ot1-x334.google.com with SMTP id
 l25-20020a9d7a99000000b005af173a2875so2017429otn.2; 
 Thu, 24 Feb 2022 11:16:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TLiWpOnxapYAVvT4QJds8jwsCUqpq+N+eb8iJ1oxqPc=;
 b=FoSBsHzIox96KnpJAyliB1ZiuIjpzEzM4XYDkOlGoqloV5Eo7EZVSPu2ErTj4vLJMi
 upYaLfSb0X91GX+xn6TnAobrbP6ERdOB5KlZcpaoe7UbiAWgiKPgTlQEtKxHSzdLcHMS
 lOjpOydbBexU4vm5IkOYAkImwvyLuVtkbedyi2e7M1I2TfUrXXZR7/AB5zitxIeKy/IC
 x1F5Q91iYENsXt8Yd24tfJgrSbsl/BS2PPenavqRHuQd9YmcfFKmky7rirOq5DXnIC0b
 XSj6nBARIPzqtJUo0WYZfR72ddf+6yWvaL9fNzHTsevpQcAYyyylt8lzDJ2QWRku7DVr
 pJNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TLiWpOnxapYAVvT4QJds8jwsCUqpq+N+eb8iJ1oxqPc=;
 b=3ozsQJEb6Gdm8FPY6nTs086oiYpmK4mRCiaDcYHkwTEs6i3aj4773DanyMHVGuH/GX
 IK2HDgctwuhPexdK3H2jqqcMYeWqgMwNaUx03YdViVEKE6QDBa7e/CLz3nEYkEKmKRM7
 9FB43p0aQlB8z3gG20qucQ3sfll8lHWjvGyK1bgkfyIqs6Bikz47W57XSf7OCSNEdf09
 smji0Yz7mMXzRiZ3GLpI1SMc/mq5DnGsNvYB9BOccmku4aURJMm4ogqVCzSSPhSoiNBV
 mrfOv7/hQ+N7rX0TJr8X1abF8IbMKU2avOz90+7VX5NAyn4vspfohWag0hS6ODvpdVEN
 ulIA==
X-Gm-Message-State: AOAM5307rx7fX9HyPuCPg7NBaC2iFr4o84VRMb2ofS9xDCYU76jKMu94
 4y0fArGAH6pIsvnHx4VKdlY=
X-Google-Smtp-Source: ABdhPJzBXhUKmpv0W6RRc6cmrcAkgPuFrtLmZVXDFelgeLtmLNAIwubxdHBKS6Tl11+U/IW4kchtiQ==
X-Received: by 2002:a9d:6e09:0:b0:5ad:1fcd:bfd0 with SMTP id
 e9-20020a9d6e09000000b005ad1fcdbfd0mr1532004otr.312.1645730183457; 
 Thu, 24 Feb 2022 11:16:23 -0800 (PST)
Received: from localhost.localdomain (189-47-54-110.dsl.telesp.net.br.
 [189.47.54.110]) by smtp.gmail.com with ESMTPSA id
 w3-20020a056830110300b005af14392276sm79509otq.62.2022.02.24.11.16.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Feb 2022 11:16:23 -0800 (PST)
From: Magali Lemes <magalilemes00@gmail.com>
To: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH 1/4] drm/amd/display: Adjust functions documentation
Date: Thu, 24 Feb 2022 16:15:48 -0300
Message-Id: <20220224191551.69103-2-magalilemes00@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220224191551.69103-1-magalilemes00@gmail.com>
References: <20220224191551.69103-1-magalilemes00@gmail.com>
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
Cc: kernel test robot <lkp@intel.com>, siqueirajordao@riseup.net,
 Magali Lemes <magalilemes00@gmail.com>, maira.canal@usp.br,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, mwen@igalia.com,
 dri-devel@lists.freedesktop.org, isabbasso@riseup.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Part of the documentation of the 'dc_process_dmub_aux_transfer_async'
function was misplaced, being put together with the
‘dc_enable_dmub_notifications’ documentation. This caused the following
warning:

drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc.c:3757: warning:
expecting prototype for dc_process_dmub_aux_transfer_async(). Prototype
was for dc_enable_dmub_notifications() instead

This commit fixes the warning by placing the function documentations in
their right place.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Magali Lemes <magalilemes00@gmail.com>
---
 drivers/gpu/drm/amd/display/dc/core/dc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc.c b/drivers/gpu/drm/amd/display/dc/core/dc.c
index b1ce3c0cf477..61e3bb99375f 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc.c
@@ -3737,8 +3737,8 @@ bool dc_is_dmub_outbox_supported(struct dc *dc)
 	return dc->debug.enable_dmub_aux_for_legacy_ddc;
 }
 
-/**
- * dc_process_dmub_aux_transfer_async - Submits aux command to dmub via inbox message
+/*
+ *****************************************************************************
  *  Function: dc_enable_dmub_notifications
  *
  *  @brief
@@ -3780,7 +3780,7 @@ void dc_enable_dmub_outbox(struct dc *dc)
 }
 
 /**
- *****************************************************************************
+ * dc_process_dmub_aux_transfer_async - Submits aux command to dmub via inbox message
  *                                      Sets port index appropriately for legacy DDC
  * @dc: dc structure
  * @link_index: link index
-- 
2.25.1

