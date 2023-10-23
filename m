Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62DED7D2D99
	for <lists+dri-devel@lfdr.de>; Mon, 23 Oct 2023 11:06:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82AAC10E19A;
	Mon, 23 Oct 2023 09:06:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C019710E19A
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Oct 2023 09:06:21 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-540105dea92so2331793a12.2
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Oct 2023 02:06:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1698051980; x=1698656780;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6PST0E4VALAaStd8rk46zMSQH1CNUm8AVihtY3+BphI=;
 b=OiEgsKKtbz8AbUFtlibKQ6re4bpS7W8j5JSmJsrNw0UIFu8iXPhTmdoSJ2kT7PsTWe
 Irl1eoujnnUr5C2qwoKCDUtgYRh231UTW21NsqV5lXTvE2BP49pDAJpKGe7495uh/Zxa
 CJ5TT3QfRTTrSCF3T2LLr1Dmem6vAB5uS/qvI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698051980; x=1698656780;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6PST0E4VALAaStd8rk46zMSQH1CNUm8AVihtY3+BphI=;
 b=mdOGGfWOWVEanv97Z5VwotkFKv3FzanEesOUZEjzLqug842A1z0tYkpkY+PIdqGOjw
 Z3msuj6nuRPv+TJF6LlcnIcIBhU02xwpkBo2t1ooLaeGq3SOjJWsB0rZucs8AeqY0fsk
 e4855YBVpnWy3bH2wYiml2iAUkAatQycHTcwXr0oViqzj0Fat97Gkf7jc58y1qECzN6a
 xLZqVSKGVa1fOzADXN3FzBy+nWgkKOGNIkivLf4qTbQpOtyoNcodsSiKyorZv18VJOev
 slZrCewoooKuFjD/uZrzYXsNy7BNcDNkdzNyPRliL2SwVL97YPa50973uACS3e3jVmHT
 VZUg==
X-Gm-Message-State: AOJu0YxVNb8+lZ4RQTJqgT3hJ1F+xOce1nEMA1Fs7f1/jsrS6jv2JX+M
 sDMk3ZcNMUb+7bCvOct3XW7/Pg==
X-Google-Smtp-Source: AGHT+IF809PwCXbbmMNGSyv5w64YO8aByKgFPLkm6Wc2EM2lbMg3NSWzG9UL+vkUDj4GrCOjwjOI2w==
X-Received: by 2002:a17:907:c21:b0:9bf:80f0:7813 with SMTP id
 ga33-20020a1709070c2100b009bf80f07813mr7090615ejc.16.1698051979955; 
 Mon, 23 Oct 2023 02:06:19 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com
 (host-79-45-223-184.retail.telecomitalia.it. [79.45.223.184])
 by smtp.gmail.com with ESMTPSA id
 n17-20020a170906089100b009c3f8f46c22sm6321868eje.77.2023.10.23.02.06.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Oct 2023 02:06:18 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] drm/panel: nt35510: fix typo
Date: Mon, 23 Oct 2023 11:05:56 +0200
Message-ID: <20231023090613.1694133-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.42.0
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, dri-devel@lists.freedesktop.org,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Replace 'HFP' with 'HBP'.

Fixes: 899f24ed8d3a ("drm/panel: Add driver for Novatek NT35510-based panels")
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 drivers/gpu/drm/panel/panel-novatek-nt35510.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-novatek-nt35510.c b/drivers/gpu/drm/panel/panel-novatek-nt35510.c
index d6dceb858008..83a9cf53d269 100644
--- a/drivers/gpu/drm/panel/panel-novatek-nt35510.c
+++ b/drivers/gpu/drm/panel/panel-novatek-nt35510.c
@@ -1023,7 +1023,7 @@ static const struct nt35510_config nt35510_hydis_hva40wv1 = {
 		.hdisplay = 480,
 		.hsync_start = 480 + 2, /* HFP = 2 */
 		.hsync_end = 480 + 2 + 0, /* HSync = 0 */
-		.htotal = 480 + 2 + 0 + 5, /* HFP = 5 */
+		.htotal = 480 + 2 + 0 + 5, /* HBP = 5 */
 		.vdisplay = 800,
 		.vsync_start = 800 + 2, /* VFP = 2 */
 		.vsync_end = 800 + 2 + 0, /* VSync = 0 */
-- 
2.42.0

