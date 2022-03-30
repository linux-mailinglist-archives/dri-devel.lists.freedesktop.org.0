Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B1754EC938
	for <lists+dri-devel@lfdr.de>; Wed, 30 Mar 2022 18:04:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30CFF89FC0;
	Wed, 30 Mar 2022 16:04:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73C9310E570
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Mar 2022 16:04:51 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id c23so20854958plo.0
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Mar 2022 09:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4szRwWNDvZ7XOU+Kmwti8vyES5EGiVgA3+mW2sFThKE=;
 b=eLsot/bdo/qciErnhmm6+zfsN+rYVH36ltRx5tiW0+4htGYOYqrzreVAzgh0AWBGYQ
 IKGw1YxmkNOWs67XoLHeuAK/Sd4CtWKwgkUqFCP28l/OeoYZ2Cw58owdUH61o9P86FmB
 PruF+h7PwadsIiKJ1ro1vak+3ThGapcfw5xrk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4szRwWNDvZ7XOU+Kmwti8vyES5EGiVgA3+mW2sFThKE=;
 b=US2Bpkvj+Zw938HUURdZyG3FR1e8c9VY2mJbrLwD6pWMK78Sgok54CDe51zIV7gwTW
 nljXwPUisgvzx9KPDlNiDMmw8h8p0RpBW0J+q8223qn/EArjqfL21euXxCoE7ng7/ZUT
 i6TJFnEWf3ipRIWS7/5FZXHvJIt434BApYwEfGGLdt54N9qswSjPhv8vjxsb1GLrdy8T
 //HJYRPtzAVl5BXGfbJphJL8V17qKPQ2qUnuVHRJaPx5a0D7cJLb6dvGVoSISWyQKK/i
 Z6keYjsWR6K4pQKBy1Bl6ZgGMRhjgSsg8w1KCCFfAYY3umEwN4AwNhrBB6pgkFwmPIxo
 MJBA==
X-Gm-Message-State: AOAM532TLzrDgBhy+2gql5NhCQ6883mHz8F633eStPTjHlbIc2typqKc
 +J2OOaz36YrwFQo3NAD5QHxS3w==
X-Google-Smtp-Source: ABdhPJz4XIzGXVOi8Xi15BEXtGOe7kw6pLeyZ+J75o/J6LblAlRFeoE/gg5n6XnfmlWXYKi/vsKYkQ==
X-Received: by 2002:a17:903:41d0:b0:154:de5:a240 with SMTP id
 u16-20020a17090341d000b001540de5a240mr350568ple.32.1648656291021; 
 Wed, 30 Mar 2022 09:04:51 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:d50d:daac:acf3:cda6])
 by smtp.gmail.com with UTF8SMTPSA id
 f16-20020a056a00229000b004fabe756ba6sm26268854pfe.54.2022.03.30.09.04.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Mar 2022 09:04:50 -0700 (PDT)
From: Matthias Kaehlcke <mka@chromium.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/panel-edp: Fix AUO B133UAN01 panel id
Date: Wed, 30 Mar 2022 09:04:44 -0700
Message-Id: <20220330090435.1.Id1522250dd07a6b574c1cc7826023fc6acd141b4@changeid>
X-Mailer: git-send-email 2.35.1.1094.g7c7d902a7c-goog
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
Cc: Matthias Kaehlcke <mka@chromium.org>,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Two digits are swapped in the AUO B133UAN01 panel id (0x8495 instead
of 0x8594). This went initially unnoticed because the panel is still
detected, though it is set up with a conservative default timing. Fix
the digit swap.

Fixes: ec57376fba5a ("drm/panel-edp: Add AUO B133UAN01")
Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
---

 drivers/gpu/drm/panel/panel-edp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index db4eea1d7f67..1732b4f56e38 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -1847,7 +1847,7 @@ static const struct panel_delay delay_100_500_e200 = {
 static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x405c, &auo_b116xak01.delay, "B116XAK01"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x615c, &delay_200_500_e50, "B116XAN06.1"),
-	EDP_PANEL_ENTRY('A', 'U', 'O', 0x8495, &delay_200_500_e50, "B133UAN01.0"),
+	EDP_PANEL_ENTRY('A', 'U', 'O', 0x8594, &delay_200_500_e50, "B133UAN01.0"),
 
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0786, &delay_200_500_p2e80, "NV116WHM-T01"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x07d1, &boe_nv133fhm_n61.delay, "NV133FHM-N61"),
-- 
2.35.1.1094.g7c7d902a7c-goog

