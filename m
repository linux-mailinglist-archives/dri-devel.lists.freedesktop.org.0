Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8404B577B75
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jul 2022 08:40:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6185AA9D44;
	Mon, 18 Jul 2022 06:39:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92992A9CE8;
 Mon, 18 Jul 2022 06:38:48 +0000 (UTC)
Received: by mail-io1-xd33.google.com with SMTP id y2so8523927ior.12;
 Sun, 17 Jul 2022 23:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2hIofP2/7RnzwmpB4+2uKZhOwCVDBUsWlubLiM5FRUQ=;
 b=BptF5SO8TMeLvQP9nIR9RVXdw4qv8na8Vw7ejbab15/7BwGx+J5DC24eMPbyXxj2tC
 rt4S+7JIQ/Yx1hHaNFzjARNzG6SwS4RWQTor4tsNS+NZ7iPPc62YEtenlLY5spAthuqE
 r6rK753qyWwNSP+lOhTaU5JPLCztfI6n51t+fEtcDO/EwwJEthun8k9aLfjifuoXbzsz
 11dd9GGtZZsrtKU+GwTsNn82LcTf9+cRxL/4Cx1k3zZLz+a3o5iDenlc9/i8v/zZmFI1
 x16WAAhhIO79sB2tZh6/f2RCiSgiWLrRyGRMCpjfVwB6h8SQBX3FdUHgv9uE1KsbphjV
 gejA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2hIofP2/7RnzwmpB4+2uKZhOwCVDBUsWlubLiM5FRUQ=;
 b=Ptm0ax0JuRu/5XV5PVQBUYmpjXeUlvlGkX/f0+2eFqJjwt3m/cVRtiUxWCoxCsgshg
 LVNv7bdROVwmcbc1h+ietqpgtC4GTuGPkep1n79HXufee/ARoGxIFjVdvhaBUiyA42NX
 St26+psxny5JTegsuOUs4fD3lVswoKbDoRlUUR345TtJR7eMcqnpHbW/XpcfMqxbVD6H
 izfP916IdzK7dKzN3aZamtlkmyTbu2uy8mtEjnzTgYS6uidgrQ78rCQjssAnAjRCvxv5
 lfQXrta8dm1CfvDCd2GAzUArjtUcTFpMAwBfRIA8NmRAU2dOWa3H1ncuR3S0s4eqZ+5c
 ckQw==
X-Gm-Message-State: AJIora8SjaX+ZBke8n6MXzZAy/4N2asL7vbAtS2NYzRtlkLSY9jcIwMq
 Q6axfAiy0dHatQfN5wSi86CJztQtfCY=
X-Google-Smtp-Source: AGRyM1uOGHqHtEyIbe2ocfQMqbQb/S+AT6j18yc09C7xpuA8r22WTJcVIZMtR4hYU8rRvg724c3Ogw==
X-Received: by 2002:a05:6638:3801:b0:341:68f6:932 with SMTP id
 i1-20020a056638380100b0034168f60932mr2386338jav.71.1658126328294; 
 Sun, 17 Jul 2022 23:38:48 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 o12-20020a92a80c000000b002dcd35bb030sm2342604ilh.74.2022.07.17.23.38.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Jul 2022 23:38:47 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com
Subject: [PATCH v3 24/39] drm-print: include dyndbg header indirectly
Date: Mon, 18 Jul 2022 00:36:09 -0600
Message-Id: <20220718063641.9179-26-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220718063641.9179-1-jim.cromie@gmail.com>
References: <20220718063641.9179-1-jim.cromie@gmail.com>
MIME-Version: 1.0
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
Cc: nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

lkp robot told me:

  >> drivers/gpu/drm/drm_ioc32.c:989:2:
  error: call to undeclared function '_dynamic_func_call_cls';
  ISO C99 and later do not support implicit function declarations
  [-Wimplicit-function-declaration]

           DRM_DEBUG("comm=\"%s\", pid=%d, dev=0x%lx, auth=%d, %s\n",

Since that macro is defined in drm_print.h, include <dynamic_debug.h>
there too, so that any uses have the definitions of all the macros in
the callchain.

This is done as a separate patch mostly to see how lkp sorts it;
I'll probably squash it with HEAD~1

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/drm/drm_print.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
index 2d2cef76b5c1..f8bb3e7158c6 100644
--- a/include/drm/drm_print.h
+++ b/include/drm/drm_print.h
@@ -31,6 +31,7 @@
 #include <linux/seq_file.h>
 #include <linux/device.h>
 #include <linux/debugfs.h>
+#include <linux/dynamic_debug.h>
 
 #include <drm/drm.h>
 
-- 
2.36.1

