Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5515C80A7D4
	for <lists+dri-devel@lfdr.de>; Fri,  8 Dec 2023 16:49:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F32E10E29B;
	Fri,  8 Dec 2023 15:48:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc34.google.com (mail-oo1-xc34.google.com
 [IPv6:2607:f8b0:4864:20::c34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B860810E280
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Dec 2023 15:48:52 +0000 (UTC)
Received: by mail-oo1-xc34.google.com with SMTP id
 006d021491bc7-59052ab970eso883439eaf.1
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Dec 2023 07:48:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702050532; x=1702655332; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=VH9mWAmxSn+cPrMUEhx3/KgP93jhawX7PN/8XP2NR4I=;
 b=I70HmFMPfoKaTeHTxJZhMSTbfsW2bhhrTIPGoJJYVTw0i1qBmvu7zUf7BYTGmfc+wt
 GMBePPQrQL5kupBbQqbJDJ68YGfqVwqCI/0iGO1GUEDjGFaJy4RzisVuzLMUXtfo5fQo
 6wEmt/g2inOtR4dmCmNGFTRkVORw8/NxV554xGHFb6kQxmENaSqZkNm3Lm4ysxf3bs+J
 ZhMuVOkRDNXGAhi1u6uzlJcTwF+b2xr2Tbx6r/8BQWQ2nm9n8+o9Bm1b44S42Y++kzJk
 9La2NG3UhnVe8d8QQJHLxu3m7BGKCzey12wf5Tt3eNBfhxPzG7FEMeeKvkKjS8jTn5m/
 FL+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702050532; x=1702655332;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VH9mWAmxSn+cPrMUEhx3/KgP93jhawX7PN/8XP2NR4I=;
 b=MGmkCgFBYBWC5Ua4JLrlwFml/Dqa1M5aQdE6ysAHwOD5Hu8RsMKQEx+wqgCQbZSbwP
 SPlKtaXk3uOvCuW8ubp6NiEScs9wyv7sfbndZ/FKfhftaNGqGXpgZ83jA4ooic62JexK
 PBDHVUHtDMUCk9yMM/mkOGBtZ9cuhuwl5U8Z2aZB4OX0suFFr+B9sUEofLHqDcNeWMjQ
 aNX8Fppj2fa4lziTUvIfmeA/060A1kn5qdsagS5djCcojC5GhHMLcayJ1iySglOCKBgC
 NOxRsgBvA3+WSzU8Nanf6pnUtHmebrHwjyq5adbSpD5jpkdOX/t8/EvUGsuSVCJBcNA7
 uAfg==
X-Gm-Message-State: AOJu0YwztchYVZdAPsvNi8tdDecggcFONTVexQXBmtONd3sVSs62uSJV
 ngAMSzUNZlaa5vxwu1wUx/c=
X-Google-Smtp-Source: AGHT+IEzUfF4Wj7qnT7w6d8mdcbROihe8LKufcuC10M8YN+tbbg8oO/34Jti/g2sLcC8t3DOHSU1ww==
X-Received: by 2002:a05:6871:6a1:b0:1fa:f6ad:8580 with SMTP id
 l33-20020a05687106a100b001faf6ad8580mr515392oao.9.1702050531746; 
 Fri, 08 Dec 2023 07:48:51 -0800 (PST)
Received: from localhost.localdomain ([75.28.21.198])
 by smtp.gmail.com with ESMTPSA id
 os25-20020a0568707d1900b001fb28cd0e9asm444624oab.3.2023.12.08.07.48.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Dec 2023 07:48:51 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: devicetree@vger.kernel.org
Subject: [PATCH 0/3] Add Support for RG-ARC Panel
Date: Fri,  8 Dec 2023 09:48:44 -0600
Message-Id: <20231208154847.130615-1-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
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
Cc: marex@denx.de, neil.armstrong@linaro.org, conor+dt@kernel.org,
 sam@ravnborg.org, Chris Morgan <macromorgan@hotmail.com>,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org,
 jagan@amarulasolutions.com, krzysztof.kozlowski+dt@linaro.org,
 quic_jesszhan@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Morgan <macromorgan@hotmail.com>

Add support for the Anbernic RG-ARC display panel as used in the
RG-ARC S and RG-ARC D handheld gaming devices from Anbernic.

Chris Morgan (3):
  drm/panel: st7701: Fix AVCL calculation
  dt-bindings: display: st7701: Add Anbernic RG-ARC panel
  drm/panel: st7701: Add Anbernic RG-ARC Panel Support

 .../display/panel/sitronix,st7701.yaml        |   1 +
 drivers/gpu/drm/panel/panel-sitronix-st7701.c | 138 +++++++++++++++++-
 2 files changed, 138 insertions(+), 1 deletion(-)

-- 
2.34.1

