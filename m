Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C5E992C042E
	for <lists+dri-devel@lfdr.de>; Mon, 23 Nov 2020 12:20:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5AD66E02F;
	Mon, 23 Nov 2020 11:20:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7BEF89FC9
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Nov 2020 11:20:07 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id r17so18256659wrw.1
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Nov 2020 03:20:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=L1A6ShzSRHULt3G6Ke9LreeZL2K1GMKHsXViRU+yWaI=;
 b=XC1icHQxTB5jacAoVkI3gjV1OSiGC+//Jf3F6glek/2GBxRYgE2yNAyO4F44L015/I
 iQHkbcSVXSbFSfexxKIK3Uly4nKoNbPPjwtUhqkNP07ZCQxVKwNnbxla1nfhBKX00Yoe
 SGnzZi03THb4xnvkePPGXeZ08ztRIwO2g3wa2CeiG1TfwNkznCf1gvCslTWp5EsyzASG
 w7VDIMcwwG9kT8LIMDbEcJleoR3qSsEeJa8hDC1PddPNJ4BexzOdjGBTIb3dvJPu8mmD
 GOKmAX3AolXdraBrtUXBskn8KYdgdFLoXD+peVxJfwqHfTydMh8v4BvcoyAzKN1719lb
 TpmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=L1A6ShzSRHULt3G6Ke9LreeZL2K1GMKHsXViRU+yWaI=;
 b=XuUZRl8zyJWlAEA2nm//x9l/Unf9EGA/S4nCctqjvw386x+pCSdLvfcgN38qRrnvdc
 Fn/O/hvBwUtvYFR9WZAO2KjjSO3JPQgQ7AGB3Hpwim78SkbYwVMIgGdVx2xdw8JMe/GJ
 8HZTkeXUjvNVhQuO+coO2qYKSy5xlTY4QIsyNSP/LOv+dOvD1UB7ZMHQax5C3Yn7YJjZ
 BwbjKwWEyD7P910GfoOXHJ7xZSvoJjPNncdO7DV0M4KRg7du/Am//pbodIGABD2avb92
 XZ4diUVlmNNoHPeYAU9Qd1ymf3Awu8KqZ1Vsx205nbZNJkiBsMgLf8s/GJyAMWRkjXGr
 HTlw==
X-Gm-Message-State: AOAM532u6wbimi2mTVkGy1eStjRlG1vZKg7v8yxEnu4LnKCj7g3xrbOA
 9xqUFczpdlinumhCt12lpico3g==
X-Google-Smtp-Source: ABdhPJz0+ceQe/Y2+pvKBwkjE9xITEVzXG9ujBWW3we5tH8y1dyudIKejmJLw6kMKEizjicMAXgLUA==
X-Received: by 2002:a5d:6548:: with SMTP id z8mr11259177wrv.399.1606130406387; 
 Mon, 23 Nov 2020 03:20:06 -0800 (PST)
Received: from dell.default ([91.110.221.218])
 by smtp.gmail.com with ESMTPSA id n9sm16317290wmd.4.2020.11.23.03.20.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Nov 2020 03:20:05 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 31/40] drm/msm/disp/dpu1/dpu_rm: Fix formatting issues and
 supply 'global_state' description
Date: Mon, 23 Nov 2020 11:19:10 +0000
Message-Id: <20201123111919.233376-32-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201123111919.233376-1-lee.jones@linaro.org>
References: <20201123111919.233376-1-lee.jones@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Drew Davenport <ddavenport@chromium.org>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c:247: warning: Excess function parameter 'Return' description in '_dpu_rm_check_lm_peer'
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c:283: warning: Function parameter or member 'global_state' not described in '_dpu_rm_check_lm_and_get_connected_blks'
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c:283: warning: Excess function parameter 'Return' description in '_dpu_rm_check_lm_and_get_connected_blks'

Cc: Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <sean@poorly.run>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Drew Davenport <ddavenport@chromium.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index 0ae8a36ffcff3..fd2d104f0a91d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -239,7 +239,7 @@ static bool _dpu_rm_needs_split_display(const struct msm_display_topology *top)
  * @rm: dpu resource manager handle
  * @primary_idx: index of primary mixer in rm->mixer_blks[]
  * @peer_idx: index of other mixer in rm->mixer_blks[]
- * @Return: true if rm->mixer_blks[peer_idx] is a peer of
+ * Return: true if rm->mixer_blks[peer_idx] is a peer of
  *          rm->mixer_blks[primary_idx]
  */
 static bool _dpu_rm_check_lm_peer(struct dpu_rm *rm, int primary_idx,
@@ -264,6 +264,7 @@ static bool _dpu_rm_check_lm_peer(struct dpu_rm *rm, int primary_idx,
  *	proposed use case requirements, incl. hardwired dependent blocks like
  *	pingpong
  * @rm: dpu resource manager handle
+ * @global_state: resources shared across multiple kms objects
  * @enc_id: encoder id requesting for allocation
  * @lm_idx: index of proposed layer mixer in rm->mixer_blks[], function checks
  *      if lm, and all other hardwired blocks connected to the lm (pp) is
@@ -274,7 +275,7 @@ static bool _dpu_rm_check_lm_peer(struct dpu_rm *rm, int primary_idx,
  *      mixer in rm->dspp_blks[].
  * @reqs: input parameter, rm requirements for HW blocks needed in the
  *      datapath.
- * @Return: true if lm matches all requirements, false otherwise
+ * Return: true if lm matches all requirements, false otherwise
  */
 static bool _dpu_rm_check_lm_and_get_connected_blks(struct dpu_rm *rm,
 		struct dpu_global_state *global_state,
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
