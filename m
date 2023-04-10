Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 256EB6DD410
	for <lists+dri-devel@lfdr.de>; Tue, 11 Apr 2023 09:23:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89E8E10E223;
	Tue, 11 Apr 2023 07:23:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C693810E2B1
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Apr 2023 08:49:40 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id ga37so11283865ejc.0
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Apr 2023 01:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1681116579; x=1683708579;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=y5ePFxjbLBzvierh0vPmoX2AJ6odjU/okQNVSYo6+J0=;
 b=RCJpuhAmaiEhyX7miTtpDm2B6aHyY7G7AUvRlRukNsyjL70ZJsCQAtaj3OQvh5OYPV
 TFriUULQnUDlx2HjEsI/Kw2Ah9VIJ9ZIeDYYBye3hexNLts3plMTPCJjFWrxMbIu6Eag
 XjqvoXa1xSsAljafdAreM72uC7lUHl6yPkaAmYZuhufCOwNvWRRWHj1YBOsWfhdoFgnF
 kSBopPrfEZ28my/Fa41Qr6TJNH9JpbaOPigMEYVU/B8HSmVqjIqBmV8qS+8UuhdK0dRL
 nxO6iYDY4vXdt8A9z2+h74Uj92wooKBV/Qh70Eg4GbRrknLo9F3pWeHJHPTVX9UIkidz
 CSUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681116579; x=1683708579;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=y5ePFxjbLBzvierh0vPmoX2AJ6odjU/okQNVSYo6+J0=;
 b=Nyq9KK8XT7/64K1U94etHyfRhzVRKT42qlvxRMIiNlr1C24CU8b1DEHuTVdQ1dPL5V
 Nvie84DeCzbmaHHJvRzcrHmXq9aOk/YdwyY89tdN3UP94an85IKT5nDSt0MpY2yF5OEx
 8PacSwY928wTwdQB7zbVI5kJyWZ1bZxn25TJzrTaonu1OTkJkCBwvmv+9Q1o+oMNXtKo
 TXxc45WtM6iH3QP1gOn7u+g+K/nFk96VEFy8TWkW8btwTfsTFenQ5EcgIT8AWDv+KjNP
 P/8o3uq2hoMisg97nBHoBbibDAU828jAWPnb2WkV3jY+PoCT6gkVZCdABM2GQUhEHQ+O
 vFrQ==
X-Gm-Message-State: AAQBX9e5aKmdAy9CvG0zgncgedeHwRgQlse546ZSfzPdhhD3A3SpQxxz
 vilMkwQ8uZzET39LYW2JwDI=
X-Google-Smtp-Source: AKy350bKbp2C72vty5skdGElAcpoLwKvITKzpR2b0BLRFPeIA6nODgwcXIjQGRg4GNgULAPUQS2ugA==
X-Received: by 2002:a17:906:8585:b0:94a:7a2f:d6e8 with SMTP id
 v5-20020a170906858500b0094a7a2fd6e8mr2904492ejx.61.1681116578666; 
 Mon, 10 Apr 2023 01:49:38 -0700 (PDT)
Received: from localhost.localdomain ([154.72.161.184])
 by smtp.gmail.com with ESMTPSA id
 v13-20020a50954d000000b004fc649481basm4709962eda.58.2023.04.10.01.49.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Apr 2023 01:49:38 -0700 (PDT)
From: Brandon Cheo Fusi <fusibrandon13@gmail.com>
To: maxime@cerno.tech
Subject: [PATCH 0/2] drm: sun4i/dsi: allow modeset helpers to manage display
Date: Mon, 10 Apr 2023 09:47:48 +0100
Message-Id: <20230410084750.164016-1-fusibrandon13@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 11 Apr 2023 07:23:39 +0000
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
Cc: krzysztof.kozlowski+dt@linaro.org, dri-devel@lists.freedesktop.org,
 andrzej.hajda@intel.com, sam@ravnborg.org, marex@denx.de, rfoss@kernel.org,
 dave.stevenson@raspberrypi.com, jernej.skrabec@gmail.com, wens@csie.org,
 jagan@amarulasolutions.com, linux-sunxi@lists.linux.dev,
 devicetree@vger.kernel.org, tzimmermann@suse.de, robh+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, neil.armstrong@linaro.org,
 Brandon Cheo Fusi <fusibrandon13@gmail.com>, samuel@sholland.org,
 linux-amarula@amarulasolutions.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This change moves DSI PHY poweron/off from the encoder to the TCON. 

As a consequence enabling or disabling the DSI sink can be left to the modeset
helpers, and bridge support easily introduced without touching the 
drm_encoder.bridge_chain or converting the encoder to a drm_bridge.

Brandon Cheo Fusi (2):
  drm: sun4i/dsi: factor out DSI PHY poweron and poweroff
  drm: sun4i: tie DSI PHY Poweron/off to crtc enable/disable

 drivers/gpu/drm/sun4i/sun4i_tcon.c     | 10 +++-
 drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c | 64 ++++++++++++--------------
 drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h |  4 ++
 3 files changed, 43 insertions(+), 35 deletions(-)

-- 
2.30.2

