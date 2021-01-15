Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 158C62F83A1
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jan 2021 19:16:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A0D36E4C7;
	Fri, 15 Jan 2021 18:16:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D88F96E4C1
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 18:16:14 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id c124so8210727wma.5
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 10:16:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ei80Fpi/NHdpNAUZshztT153p4/37OmShz52J4NwQ9Q=;
 b=ez6/pCbgjiKbH4YqZyRmCG45Xt9FGesqfWhDVvuPZ+dCPSnfDTjbRXy/tYcmnfSRdE
 c2xoWUyDioc5kwwAeyghLoAe5ZKaInjA+xlyjex+ynmNz6AZH1lOvHW0rEf3ZfB6KdV9
 rP7eH36pLUBUvSeUgtxjaCLvMILiD/ZffnIIwddomGp1Dcf/E3WE7byM9VcmEZiXwx87
 W6MO0F0mtbI6FS5xzmQzHc3xc3O2e5X2t7RUuiX0lbGWNqITuvup72EyyM6BnbPSeJgk
 dNAxIqCQgnxZqrW+27ceCASfZCWQZSAw1vfd5txLzmkP8wi5l5ANmuF/SQBAW0JHj2ej
 MkAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ei80Fpi/NHdpNAUZshztT153p4/37OmShz52J4NwQ9Q=;
 b=SbEP5rfGR+E9F4jccvuy4VaQK+mMel8P2J2hLOnNjMtjt4u1ITaU3AHVmWLDIEaKUz
 K46XRF8cOuLpRUl3LBeO79PKi0JRMqxExfWhUEacRQWkbOXuluwzPsedssshb88mTZdz
 XHdgAS1SxCwQARETWnVt08AnuQLcyAqvzGFb1CVUWKBoWhqyLok2eY0sCrRJGi8dc1Sb
 Edud9vm0bp1ucek9drAqziAJUyT475SnakqqunlRKbdtuxmaNFxf3/r9jgszL60bfvUL
 doZCJLh75aekDSLT+UJjGy8b1buisZ9q1Szuy1+OAS6CnHSBGYbF2Ac4R3LuixLTnmKu
 AY3A==
X-Gm-Message-State: AOAM533AgReiK1uEdlWhSyp3O+oA3l+/CSvaZtH9of3tXCwobNVnkLpV
 VR2VYJtL6M1n8TV1JBlIgDORaklUSAfdhsED
X-Google-Smtp-Source: ABdhPJwX4CxBwGr2oULRklZN0T24FZWYVkHWccYV92xPLHUZgBvZqYcBfBuuEtgEw1nWmEEcKHBktQ==
X-Received: by 2002:a7b:cc0f:: with SMTP id f15mr9903003wmh.29.1610734573560; 
 Fri, 15 Jan 2021 10:16:13 -0800 (PST)
Received: from dell.default ([91.110.221.158])
 by smtp.gmail.com with ESMTPSA id b133sm14405979wme.33.2021.01.15.10.16.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 10:16:12 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 05/29] drm/vmwgfx/vmwgfx_msg: Fix misspelling of 'msg'
Date: Fri, 15 Jan 2021 18:15:37 +0000
Message-Id: <20210115181601.3432599-6-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210115181601.3432599-1-lee.jones@linaro.org>
References: <20210115181601.3432599-1-lee.jones@linaro.org>
MIME-Version: 1.0
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
Cc: David Airlie <airlied@linux.ie>, Roland Scheidegger <sroland@vmware.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 VMware Graphics <linux-graphics-maintainer@vmware.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/vmwgfx/vmwgfx_msg.c:261: warning: Function parameter or member 'msg' not described in 'vmw_send_msg'
 drivers/gpu/drm/vmwgfx/vmwgfx_msg.c:261: warning: Excess function parameter 'logmsg' description in 'vmw_send_msg'

Cc: VMware Graphics <linux-graphics-maintainer@vmware.com>
Cc: Roland Scheidegger <sroland@vmware.com>
Cc: Zack Rusin <zackr@vmware.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_msg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_msg.c b/drivers/gpu/drm/vmwgfx/vmwgfx_msg.c
index 15b5bde693242..609269625468d 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_msg.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_msg.c
@@ -253,7 +253,7 @@ static unsigned long vmw_port_hb_in(struct rpc_channel *channel, char *reply,
  * vmw_send_msg: Sends a message to the host
  *
  * @channel: RPC channel
- * @logmsg: NULL terminated string
+ * @msg: NULL terminated string
  *
  * Returns: 0 on success
  */
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
