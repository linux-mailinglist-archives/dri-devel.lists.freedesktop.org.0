Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CF8B32B848
	for <lists+dri-devel@lfdr.de>; Wed,  3 Mar 2021 14:45:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 915166E981;
	Wed,  3 Mar 2021 13:44:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31A466E983
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Mar 2021 13:44:26 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id d11so23736239wrj.7
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Mar 2021 05:44:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=H3xPEHi6egTkwvWXcCWYIyS0K3zaWAAbSzwMQ/qKgYI=;
 b=JBhtQCRKcqLPe0dwAMaSPsbnFi0wbQuCUn4xQf9Xb3MLfWa9Gekp03nTcRSi+Ab/+4
 umFVmud0hLFrAqQlcj4BHxjvAb3WDfGHHr1ph2IViuFyrvlOe+0HHy5cZwlNjNsj2JWe
 CumSKeKBGrNyEpwGgKRtM7bifqHTKUspukU9gInkM1LspVA3xD+Lx2uGtaxgDfWc4vpP
 EkU9TQh2OqP0bvOkrAHO7jZhcjYEjJSyAGjKdhoX6ntx7DEdSqBMxl+/gBGPpXmJpyTD
 iXAR5/KdBwxlVrToW2OsLt2/arAH1yDev4SJGJd+7v0Zp8zIvVvzKlMpsKI0knh7wvK5
 ww1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=H3xPEHi6egTkwvWXcCWYIyS0K3zaWAAbSzwMQ/qKgYI=;
 b=Sg7OmM6iHd6prNS4PALXiqXGKFJT0H2uyTpcipivkHW8q/aoqY5yxHYdbNVOb1Nl7X
 Xz3deXRtkcDiKJEAUhyVc6Vezs3NWl/b8lPyJ9PbINl/DOSQQ+r3y4e5v8D5fRUf7wEk
 E6URZ/znrQ6+123G8SE0MRvhK7/O6sBXnOlQsfvwD41WcFVX8PoAljlwN5qe32zTCZtR
 +5c548c+TzG+dl+LVpWyHIs0WE2UcEEkrJugfKoBaXAGT7eO0I5hKEmw3+s2GTlhWmi/
 yYAai5+KhHiJGbwtRE14faAXZ9oqxsEnHs2Pu03CqpmVqefTxnwIjY0SxuO0eu6s4B8L
 2fhA==
X-Gm-Message-State: AOAM531a3Nvo8BpMLVmF1e8nCKg94AZhTYzecE5QWVFyj6UeeI+Q7Gy1
 WhhviUlGiZAjNdHCSNEZEpmqyQ==
X-Google-Smtp-Source: ABdhPJxDyaHvKTYB+FuVTEoLeXNmHOSn2maq6TRxgw6HeBYfJpgKfvcihdXAfSMYdVDQlfT/xV4TLA==
X-Received: by 2002:a5d:528f:: with SMTP id c15mr27394416wrv.142.1614779064899; 
 Wed, 03 Mar 2021 05:44:24 -0800 (PST)
Received: from dell.default ([91.110.221.155])
 by smtp.gmail.com with ESMTPSA id w18sm6109524wrr.7.2021.03.03.05.44.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 05:44:24 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 48/53] drm/vmwgfx/vmwgfx_msg: Fix misspelling of 'msg'
Date: Wed,  3 Mar 2021 13:43:14 +0000
Message-Id: <20210303134319.3160762-49-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210303134319.3160762-1-lee.jones@linaro.org>
References: <20210303134319.3160762-1-lee.jones@linaro.org>
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
Signed-off-by: Zack Rusin <zackr@vmware.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20210115181601.3432599-6-lee.jones@linaro.org
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
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
