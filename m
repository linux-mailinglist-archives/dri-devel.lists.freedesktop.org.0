Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B3252F83A4
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jan 2021 19:16:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71CF16E4CD;
	Fri, 15 Jan 2021 18:16:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5A296E4C9
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 18:16:17 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id r4so8378790wmh.5
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 10:16:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PL3TvnHahiyQuBH3untCsJLaGNo3fbz0WaK+zME/+EY=;
 b=DIyCrhYGYpbXTN/gNG8S4708V0wlTtUJC0rGazGsRTPd8I7Lur/eKogJ36AAd6DXEU
 ewwzCVyEE21qQSsWcf5plqzyE+RsxPNRu/lRYI5mjSCBiukzvIaqxkLovyoMg6KuJHUC
 33oMhCOJJHO6rQCRUTYYA09SwaqrlQt3JDS8zJUgJPnAdDylZQiumxdVQ1wcJbY+ndTU
 eo4zJ0KYDXlQx8LqvG2k1FURlLljqinFUK8lxoxFB9Nbmc1ltw1FbDjfkcoa9uBOLPMg
 qR1EAoERH0wS8BTz96BZVS+1uUmDxe79lN58F9Etiu7y5cEg9Nwvf2EXXQLLT2YMVq2p
 2aZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PL3TvnHahiyQuBH3untCsJLaGNo3fbz0WaK+zME/+EY=;
 b=kOeFp5XspCezIZBzqlx93jXlVWyQpGmMJnzNQJa7EJSImrmOGY8p1fVPGYJboRtrZF
 PEoLOYUG7YRTA/yl/Q/kuMBYgleqxVoXFBECN5JJIPu9mXw5wJWkIEPwtm94oomrh9Rk
 zZ+LBkcHNfwvoXC+M0U0MP8O3JwhCM+jF+jSf3EtrOD5DtjKNOynWmkMrX73+DSsuveZ
 VOuhLyBOO+1i3QUM0j1DtVOYajmg/hziYyvdKvem9X1ERcNp9KWM2YdsFIH8HmasGTH7
 9+4y9tD48CnkAah7wzUSYvY/Ysx9dUyikbg37Abyglv1a1NlRaD6qzPNateBVbRoU7Yy
 wCQg==
X-Gm-Message-State: AOAM5325BhlLWbtt3kgFCSuuh8xGYXQWiu4XLOaXQdDmKsNuBoTUAG+X
 t1yT19NOQKWmZOodYHzkau+L9A==
X-Google-Smtp-Source: ABdhPJxGZsrxVnwaIHrrLxYumnCMb0fqwZs+ZBfd4wceHVmtJ3dsHgOV2CMExFctwoFBRy0gTF+Mfw==
X-Received: by 2002:a1c:a145:: with SMTP id k66mr9751532wme.11.1610734576376; 
 Fri, 15 Jan 2021 10:16:16 -0800 (PST)
Received: from dell.default ([91.110.221.158])
 by smtp.gmail.com with ESMTPSA id b133sm14405979wme.33.2021.01.15.10.16.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 10:16:15 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 07/29] drm/vmwgfx/vmwgfx_blit: Add description for
 'vmw_bo_cpu_blit's 'diff' param
Date: Fri, 15 Jan 2021 18:15:39 +0000
Message-Id: <20210115181601.3432599-8-lee.jones@linaro.org>
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

 drivers/gpu/drm/vmwgfx/vmwgfx_blit.c:452: warning: Function parameter or member 'diff' not described in 'vmw_bo_cpu_blit'

Cc: VMware Graphics <linux-graphics-maintainer@vmware.com>
Cc: Roland Scheidegger <sroland@vmware.com>
Cc: Zack Rusin <zackr@vmware.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_blit.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_blit.c b/drivers/gpu/drm/vmwgfx/vmwgfx_blit.c
index 9f2779ddcf083..118db24eb756c 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_blit.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_blit.c
@@ -431,6 +431,7 @@ static int vmw_bo_cpu_blit_line(struct vmw_bo_blit_line_data *d,
  * @src_stride: Source stride in bytes.
  * @w: Width of blit.
  * @h: Height of blit.
+ * @diff: The struct vmw_diff_cpy used to track the modified bounding box.
  * return: Zero on success. Negative error value on failure. Will print out
  * kernel warnings on caller bugs.
  *
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
