Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A1B37AE1E8
	for <lists+dri-devel@lfdr.de>; Tue, 26 Sep 2023 00:50:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6263310E082;
	Mon, 25 Sep 2023 22:50:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F0FF10E082
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Sep 2023 22:50:06 +0000 (UTC)
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-69101022969so6707691b3a.3
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Sep 2023 15:50:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1695682205; x=1696287005;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=N0dp/fAcpQgkENk/LOljqWA22kzkVBHyOPNf+RuAGkU=;
 b=LgLhOklK4pOL4QdNju7P+1sHoFh1+LSxl8v34M5g7QkjXyZpriy1sHTA+khMcfyBn6
 pxO2nTT1ZxRlrM1PiUxxidxcBYckFp/qONbp5sAex6e8hG3phFm6VDNOaiWc8muAFVoC
 t0mxYtmWteyG+ZIbXkRU3niuSKFDeGOhUlM3c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695682205; x=1696287005;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=N0dp/fAcpQgkENk/LOljqWA22kzkVBHyOPNf+RuAGkU=;
 b=IA3pEmTNx1oG6+1SyXHHGhyUa1XDuC/Le7bZ/u9FKUpJBic/oey2myLlhT4i9bpUaY
 1goIu3WNEQJSHbx25r2wx2eQWaZrHmZZSAugr8euHT2zqY8+fudo6xzunZXgTk1Z2rJV
 c1NrMx0Xjo1IzdiTKigXgsJ79qPkgnLb6r4rXeotVU3vGQwUz9KwAirHMCxPpZG2evix
 azTushaRnQ8zWr8aupP03bMbGDPB84H2TMzoCmaXpG3ChUXAstKEMy56wZVB3dYeo+Fg
 fEQ8db3I7KpIffIXKN4B2+sh3VJ9vlk2XGXI6HvhmyooqpMorChy8X8b4+WYzI/j0Wu1
 jXzg==
X-Gm-Message-State: AOJu0YxtOyrzdTwmu2HEfPFBC8rKuNx0gDGemhLeRDs2Eiwwqw+fmuYd
 qoXvxJpUeZY/MOs4yasg/HPV6Wv3DqNNfUe/AsNZ0SzI
X-Google-Smtp-Source: AGHT+IE3Wjy1ZvQQEM8BRe/2ob5pENenBNG23SL14nx/qyY7KKQYio2BlW/P6HNU8mgBXzMJuupb3Q==
X-Received: by 2002:a05:6a21:3d8a:b0:15d:e68d:a850 with SMTP id
 bj10-20020a056a213d8a00b0015de68da850mr8051890pzc.29.1695682204844; 
 Mon, 25 Sep 2023 15:50:04 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:9d:2:f75d:a4e1:226a:3071])
 by smtp.gmail.com with ESMTPSA id
 c7-20020aa78c07000000b006878cc942f1sm8533209pfd.54.2023.09.25.15.50.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Sep 2023 15:50:04 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] MAINTAINERS: Document that the NXP i.MX 8MQ DCSS driver goes
 thru drm-misc
Date: Mon, 25 Sep 2023 15:49:29 -0700
Message-ID: <20230925154929.1.I3287e895ce8e68d41b458494a49a1b5ec5c71013@changeid>
X-Mailer: git-send-email 2.42.0.515.g380fc7ccd1-goog
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
Cc: linux-kernel@vger.kernel.org, Douglas Anderson <dianders@chromium.org>,
 Maxime Ripard <mripard@kernel.org>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As per the discussion on the lists [1], changes to this driver
generally flow through drm-misc. Add a tag in MAINTAINERS to document
this

[1] https://lore.kernel.org/r/20230925054710.r3guqn5jzdl4giwd@fsr-ub1664-121.ea.freescale.net

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index d72d3af551fb..d20a375ecd7d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15225,6 +15225,7 @@ M:	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
 R:	Lucas Stach <l.stach@pengutronix.de>
 L:	dri-devel@lists.freedesktop.org
 S:	Maintained
+T:	git git://anongit.freedesktop.org/drm/drm-misc
 F:	Documentation/devicetree/bindings/display/imx/nxp,imx8mq-dcss.yaml
 F:	drivers/gpu/drm/imx/dcss/
 
-- 
2.42.0.515.g380fc7ccd1-goog

