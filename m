Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC41657C0D3
	for <lists+dri-devel@lfdr.de>; Thu, 21 Jul 2022 01:23:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 260D618B1FD;
	Wed, 20 Jul 2022 23:23:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A013818B43F
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Jul 2022 23:23:46 +0000 (UTC)
Received: by mail-pf1-x435.google.com with SMTP id c139so166037pfc.2
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Jul 2022 16:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qfR3nLVFTpPA1Jo8g/Je7VqV/ARVjZfsoCJM7fq7n1Q=;
 b=fk92LRXo71Y0CPzDYBJaWRSrrPIdnW2K0E7OcNS0kun4eWarkJNZenVXQg6rq1fHNo
 rXGY5vBM5HgEQnOnqGH+H/PisEoSVo1xQetvC8EgO+Ks2tsk1EmNGROqQqXzmCu1CoeA
 HbIHShxSzNA4Mdgl4hihAREh+wfQ2RyBs94JY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qfR3nLVFTpPA1Jo8g/Je7VqV/ARVjZfsoCJM7fq7n1Q=;
 b=mvSc2VHE6ZQ7NWwuGvXv5qapXrFS8YljWhJrfMMi0ayOhVjr4tVneBbnkuw+md7JgT
 o9L+2dkg28MtYZMTHWltgoKLvfo+FY2Y5uQhxPi2A50CUOCYzMHhqpoxmEqdAIkmCn7k
 cPz3oB2amSs7lgPT3WZRuUwskMSRRu5niBX5U61fgoJVSon3BgqZWWueKA1XBjLMOCz1
 Bsumtd8MSJR+YZjApT/P5vURWGKIVfk03phN/NTDZI0J9eEa8GHBvXSvIxujXSZK+z4y
 qwl/JvjP6DZoS+T2XbxL/vO4+yjGRYLb4m3hGoSphM5+7N7B9FcvC0tDI+Hy3VG4gauL
 fM7Q==
X-Gm-Message-State: AJIora8oxe1JAuSHk7fmfbt0oYvby0QY0hlVA6RdnP3cUBZITw2Xht6k
 ZBm2AaSC/VSJ95kauLcHrUDCOllOwOmbTNnl
X-Google-Smtp-Source: AGRyM1v2SZ2co4GgiSaGYwPciyT9GbzocP88EbzijPvszQAqdL25QsyvCrJhVJCFgHLbj0XBJQM2kg==
X-Received: by 2002:a63:2a95:0:b0:41a:27e5:1996 with SMTP id
 q143-20020a632a95000000b0041a27e51996mr15706166pgq.447.1658359425843; 
 Wed, 20 Jul 2022 16:23:45 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:fdb4:f565:8767:5019])
 by smtp.gmail.com with ESMTPSA id
 z3-20020a623303000000b0052895642037sm175853pfz.139.2022.07.20.16.23.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jul 2022 16:23:45 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/panel-edp: Fix typo in kerneldoc comment (appers=>appears)
Date: Wed, 20 Jul 2022 16:23:21 -0700
Message-Id: <20220720162314.1.Ieef5bc3848df40b71605b70bb571d6429e8978de@changeid>
X-Mailer: git-send-email 2.37.0.170.g444d1eabd0-goog
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
Cc: David Airlie <airlied@linux.ie>, Douglas Anderson <dianders@chromium.org>,
 linux-kernel@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ever since I got the spell-check working in my editor this one has
been bugging me. Fix it.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/gpu/drm/panel/panel-edp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index e6645d6e9b59..07a383dff548 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -53,7 +53,7 @@ struct panel_delay {
 	 * before the HPD signal is reliable. Ideally this is 0 but some panels,
 	 * board designs, or bad pulldown configs can cause a glitch here.
 	 *
-	 * NOTE: on some old panel data this number appers to be much too big.
+	 * NOTE: on some old panel data this number appears to be much too big.
 	 * Presumably some old panels simply didn't have HPD hooked up and put
 	 * the hpd_absent here because this field predates the
 	 * hpd_absent. While that works, it's non-ideal.
-- 
2.37.0.170.g444d1eabd0-goog

