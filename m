Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADB865224CC
	for <lists+dri-devel@lfdr.de>; Tue, 10 May 2022 21:30:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA3D310E510;
	Tue, 10 May 2022 19:30:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C3C310E536
 for <dri-devel@lists.freedesktop.org>; Tue, 10 May 2022 19:29:59 +0000 (UTC)
Received: by mail-pf1-x434.google.com with SMTP id p8so16535pfh.8
 for <dri-devel@lists.freedesktop.org>; Tue, 10 May 2022 12:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zvX7gsickFQTadjtrYNgvijsVxLzBuPY+lzXCPfdMic=;
 b=h5NRX/t/3JyPYbL9z5iKgKKIXs3pj78+XyWNFf5wd51084g3f1xCekZsqJPUukvcPc
 oTOncU/sklId/q9IiCLzrfxM6K470JJ0mlX8UZlM9cPUCyuTPMJns1/sD5imD8365vZ9
 WBlGpTxmL9mfRV4AAcEROMuBBaUCQSnBWsILc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zvX7gsickFQTadjtrYNgvijsVxLzBuPY+lzXCPfdMic=;
 b=WdcAKB69ZvkFqZJX/2vy0jhERmPf03rlQTIhMyuWpF7m/zA0uk4vIJc2ztkTrbx2qv
 WkcRTiLSXi+iI+aF8LnU5wbDcns7FDf/4Ge1A/Cj6yDNp8ltstVQ7FvdskDgcTFtzvW1
 LLYYn2Yi0b3pok4euAEEUekIfL/aIHawSeEVpZmHL3+H0XqDUD3fa+9tEJGQBDqIFX8L
 XC2L+yxMCXXaLF3allTJuYS9KyjxGm9vCDpPwa6oFypzQvQ1mD5Ps8h3A/qt5+2QVKaw
 ZS7uBNICgGoIy16YqotbBNwtZP/tIwNEjKLEJl3AFxZ80v33UC58EDKlbdc+V78z6jBX
 Uncw==
X-Gm-Message-State: AOAM532l9LxWRtJFWpOhYIbtwsN0q8lgtZN5qJxas2qutGwuCru+5B6v
 4CdUHzCcoPVxBAu6Zaa0fXwWkzlfQErk12teNVc=
X-Google-Smtp-Source: ABdhPJyahyDgFCU09TgF1fxSqRtJB1NMfsOwWIAdRG+4PWbHwz72o5ifalC4goK3AWXMjIro5XEw4Q==
X-Received: by 2002:a65:5c48:0:b0:382:2c7:28e9 with SMTP id
 v8-20020a655c48000000b0038202c728e9mr18452749pgr.472.1652210999063; 
 Tue, 10 May 2022 12:29:59 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:6f08:624c:c762:d238])
 by smtp.gmail.com with ESMTPSA id
 s43-20020a056a001c6b00b0050dc762819dsm10786989pfw.119.2022.05.10.12.29.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 May 2022 12:29:58 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 1/4] drm/dp: Export symbol / kerneldoc fixes for DP AUX bus
Date: Tue, 10 May 2022 12:29:41 -0700
Message-Id: <20220510122726.v3.1.Ia91f4849adfc5eb9da1eb37ba79aa65fb3c95a0f@changeid>
X-Mailer: git-send-email 2.36.0.550.gb090851708-goog
In-Reply-To: <20220510192944.2408515-1-dianders@chromium.org>
References: <20220510192944.2408515-1-dianders@chromium.org>
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
Cc: Douglas Anderson <dianders@chromium.org>,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 Philip Chen <philipchen@chromium.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Robert Foss <robert.foss@linaro.org>, Stephen Boyd <swboyd@chromium.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Javier Martinez Canillas <javierm@redhat.com>, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

While working on the DP AUX bus code I found a few small things that
should be fixed. Namely the non-devm version of
of_dp_aux_populate_ep_devices() was missing an export. There was also
an extra blank line in a kerneldoc and a kerneldoc that incorrectly
documented a return value. Fix these.

Fixes: aeb33699fc2c ("drm: Introduce the DP AUX bus")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
None of these seem critical, so my plan is to land this in
drm-misc-next and not drm-misc-fixes. This will avoid merge conflicts
with future patches.

Changes in v3:
- Patch ("drm/dp: Export symbol / kerneldoc fixes...") split for v3.

 drivers/gpu/drm/display/drm_dp_aux_bus.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_aux_bus.c b/drivers/gpu/drm/display/drm_dp_aux_bus.c
index dccf3e2ea323..552f949cff59 100644
--- a/drivers/gpu/drm/display/drm_dp_aux_bus.c
+++ b/drivers/gpu/drm/display/drm_dp_aux_bus.c
@@ -66,7 +66,6 @@ static int dp_aux_ep_probe(struct device *dev)
  * @dev: The device to remove.
  *
  * Calls through to the endpoint driver remove.
- *
  */
 static void dp_aux_ep_remove(struct device *dev)
 {
@@ -120,8 +119,6 @@ ATTRIBUTE_GROUPS(dp_aux_ep_dev);
 /**
  * dp_aux_ep_dev_release() - Free memory for the dp_aux_ep device
  * @dev: The device to free.
- *
- * Return: 0 if no error or negative error code.
  */
 static void dp_aux_ep_dev_release(struct device *dev)
 {
@@ -256,6 +253,7 @@ int of_dp_aux_populate_ep_devices(struct drm_dp_aux *aux)
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(of_dp_aux_populate_ep_devices);
 
 static void of_dp_aux_depopulate_ep_devices_void(void *data)
 {
-- 
2.36.0.550.gb090851708-goog

