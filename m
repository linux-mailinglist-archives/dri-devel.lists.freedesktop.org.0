Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3491120FB54
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jun 2020 20:06:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD8596E042;
	Tue, 30 Jun 2020 18:05:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A6906E042
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jun 2020 18:05:55 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id d17so8976338ljl.3
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jun 2020 11:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=U2bbkxC68K+88g5ZEI43Firus6nceXlozViekaXyVCY=;
 b=pLiHPAQnrRx6MtpLZlXLB9vTCeDh02hVh6CU5UoFvLNq19DpefPnB3smSNu4VjoE1Z
 XgN8t65gmlwNn4EbQ6dIAnL9AR9jDPA7Yc5KxHRFO/bCjymTODmKR+2UOYHS8OCz+gKa
 /L+zyfalnrK8Hr/hsNf0D+TF8LTAG97tCqAUmBBciqMQbFHjsrY9YVgTzRI04TQYIuj5
 vsjILp2Qt5q9felYaMJ+h4G/OpJ4UhQwpig0zoQRCg7AVX6j/Kz60e9Jem1F4CElnt9L
 UxyQtjeBry04r82nIeS6OkMHF15lq/ItZHqUyy6yZTUE5Ir9wD1K3LidaXBr3zEzBuTq
 NXXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=U2bbkxC68K+88g5ZEI43Firus6nceXlozViekaXyVCY=;
 b=cyA8n4xx21NLfumDiUZkYlRVTAm9jskUbzSj6vxerbu5wfa7TT3eOGm4HL6CjQvSxf
 2Zql3oB3k0xW1o1R8BGRb2WQ2HMXzDKeRwr1z+Nm9E93U01/M9Z1oo6E3Am7ByrrwOFd
 nGfAai3pZBgYUR7PffbC8PhhfIpoA7IikFOrOKmW+rxTJSgev1n4iT6SQa3GajqCeSQA
 QjmgBPTseuJLtUH7+nKnAyLBkpW7mMzIpY2ES32Id9JWkh/Pol0CRMKdfTV0KEF6b8Od
 0i/KSpz72l9vF9pa3lbs+iy2VH2I6tesFQnHyE/riAVxVNUdrupKCCZ0hWQSWmiqbcKt
 YCNQ==
X-Gm-Message-State: AOAM533mvutVNDxKF1r0+jzMuYCOmyNHq8GvvKeS2654tA0Z6Deyr0ks
 KhjYFywuJeMnQHxz2Cz27CVsxrUl4I4=
X-Google-Smtp-Source: ABdhPJzw3XpbG/NysLO0dmuMgHTgj6D+j49wDJj0nvVhqpg/YGFM7OL2EHiqKq6NHcnKlMe5WoHYag==
X-Received: by 2002:a2e:b1d2:: with SMTP id e18mr6391881lja.313.1593540353657; 
 Tue, 30 Jun 2020 11:05:53 -0700 (PDT)
Received: from saturn.lan ([2a00:fd00:805f:db00:ddb6:1d37:ac40:1f27])
 by smtp.gmail.com with ESMTPSA id c14sm948208ljj.112.2020.06.30.11.05.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jun 2020 11:05:52 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v1 0/7] drm_connector: drop legacy drm_bus_flags
Date: Tue, 30 Jun 2020 20:05:38 +0200
Message-Id: <20200630180545.1132217-1-sam@ravnborg.org>
X-Mailer: git-send-email 2.25.1
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Jyri Sarha <jsarha@ti.com>,
 Paul Cercueil <paul@crapouillou.net>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Robert Chiras <robert.chiras@nxp.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Drop all uses of legacy drm_bus_flags, and then drop the flags.
Follow-up with a patch to inline the documentation of the flags.

The conversion was triggered by Laurent's clean-up of
the bus_flags use in panel-simple.
https://lore.kernel.org/dri-devel/20200630135802.GA581802@ravnborg.org/T/#t

Build tested only.
Patches on top of latest drm-misc-next.

	Sam

(Procrastination, was supposed to review patches, not producing them).

Sam Ravnborg (7):
      drm/tidss: drop use of legacy drm_bus_flags
      drm/ingenic-drm: drop use of legacy drm_bus_flags
      drm/panel: raydium-rm67191: drop use of legacy drm_bus_flags
      drm/panel: novatek-nt39016: drop use of legacy drm_bus_flags
      drm/panel: panel-simple: drop use of legacy drm_bus_flags
      drm/drm_connector: drop legacy drm_bus_flags values
      drm/drm_connector: use inline comments for drm_bus_flags

 drivers/gpu/drm/ingenic/ingenic-drm.c         |   2 +-
 drivers/gpu/drm/panel/panel-novatek-nt39016.c |   2 +-
 drivers/gpu/drm/panel/panel-raydium-rm67191.c |   2 +-
 drivers/gpu/drm/panel/panel-simple.c          |  28 +++---
 drivers/gpu/drm/tidss/tidss_dispc.c           |   4 +-
 include/drm/drm_connector.h                   | 124 ++++++++++++++++++--------
 6 files changed, 104 insertions(+), 58 deletions(-)


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
