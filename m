Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64BC96746E3
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jan 2023 00:04:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40A8110E287;
	Thu, 19 Jan 2023 23:04:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB5EB10E286
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jan 2023 23:04:21 +0000 (UTC)
Received: by mail-ot1-x32b.google.com with SMTP id
 t7-20020a05683014c700b006864760b1caso2150154otq.0
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jan 2023 15:04:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=i3Jm3hFZNo5z8bfeqahjJFhHVybeUAHAxq92W8HlP58=;
 b=EaOJVS18vr+oAvWemNb4t06wHZNfuo+zezeukYrKLAjLlmNuNm/yCZpJ23iJzQT9tw
 HheGGlVNxT1quWtyiZtB3HlztcM2ktKR/rpLthGr7lV7PxajpY9spwqsbX5PFh8Qf/Rx
 gu++MgwNyNaB1MBr5Kcf/puCxr8bXJ3lbOYdyE9n1CQ+mr+uhafJWqXYEd9hOFnjUtRR
 Sou7oXaP/wKnFYRDI9+0krb46Ed+52S0a6VbiyHUmpFqVnQ1dpjPayBzPUl92LJBWDZC
 ihoE8Zj6w4GjGB3m7SEuinFMUkj96Y9tXlQOs6mMTkxnteEgIWGQE+DqeTsHujWxS4P1
 NE3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=i3Jm3hFZNo5z8bfeqahjJFhHVybeUAHAxq92W8HlP58=;
 b=lOh5prWPX8tW31cmJrl/AIFvhSn+1y+bxalqRKBUaFHOJt5iMtQ6jcss3sgBTVeBF3
 vUAhV/+lIpFIoa1VcKqqbCiqQ8gj31v4SVSKl8MqJNMzq33g1YTjxgxvd58xUonKWfRq
 lnaH2iInON8Wn4+0jVc3HrVlHZ29sRGpKoLHMEUrl4kNvvs8CQBmLnZcT4DLQuawwvnP
 0ReRvZYlMnoOwK69fi+UW4MrhiURQxfOM3gt2RpYAcPyFErumGKyUMCAVyK1tjRDcHZL
 JoG2COQ2SrkIjyiM8KMZNLoYAf58T6O1RD3HVJimD5rxb/nDAlfIu6WBUjKXGbYaAq0z
 7Acw==
X-Gm-Message-State: AFqh2kpJXI2tI5n7609eIuC3V3AkygaQ3mhPK0h8HhD6isUdwe/E303o
 xKcT0jAjWB7gmcfg7IfrlW3L8BP+Di0=
X-Google-Smtp-Source: AMrXdXtPbPBrwtQmEZRjUhoEB1ESAp6Nz1k12sB5atje47H0YyfvQ1Pt7GIagBYN3sSzxcRbm26g7A==
X-Received: by 2002:a9d:66c:0:b0:686:419c:cb10 with SMTP id
 99-20020a9d066c000000b00686419ccb10mr4149861otn.38.1674169460911; 
 Thu, 19 Jan 2023 15:04:20 -0800 (PST)
Received: from localhost.localdomain
 (76-244-6-13.lightspeed.rcsntx.sbcglobal.net. [76.244.6.13])
 by smtp.gmail.com with ESMTPSA id
 bv10-20020a0568300d8a00b00684e09b43bdsm9254034otb.13.2023.01.19.15.04.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Jan 2023 15:04:20 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/2] drm/panel: Add Anbernic RG353V-V2 Panel
Date: Thu, 19 Jan 2023 17:04:13 -0600
Message-Id: <20230119230415.1283379-1-macroalpha82@gmail.com>
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
Cc: megous@megous.com, devicetree@vger.kernel.org,
 krzysztof.kozlowski+dt@linaro.org, agx@sigxcpu.org,
 Chris Morgan <macromorgan@hotmail.com>, robh+dt@kernel.org,
 thierry.reding@gmail.com, sam@ravnborg.org, kernel@puri.sm
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Morgan <macromorgan@hotmail.com>

Add the NewVision NV3051D panel as found on the second revision of the
RG353V. The underlying LCD panel itself is unknown (ST7703 is the
controller IC).

Chris Morgan (2):
  dt-bindings: panel: Add compatible for Anbernic RG353V-V2 panel
  drm/panel: st7703: Add support for Anbernic RG353V-V2 panel

 .../display/panel/rocktech,jh057n00900.yaml   |   2 +
 drivers/gpu/drm/panel/panel-sitronix-st7703.c | 102 +++++++++++++++++-
 2 files changed, 101 insertions(+), 3 deletions(-)

-- 
2.34.1

