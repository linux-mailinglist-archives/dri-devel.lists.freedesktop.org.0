Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A72D5BEB9D
	for <lists+dri-devel@lfdr.de>; Tue, 20 Sep 2022 19:09:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D03110E1FE;
	Tue, 20 Sep 2022 17:09:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [IPv6:2607:f8b0:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 530FB10E1FE
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Sep 2022 17:09:45 +0000 (UTC)
Received: by mail-oi1-x232.google.com with SMTP id m130so4550343oif.6
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Sep 2022 10:09:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=zjoJ8ysH+GuiXx2n6iX4shC+hIhaPOOXW3sGP3dNGpc=;
 b=gl6DzUITZClvbZlvzWYFk5Ikk6FuzAbQ6rNhScMK3oph+T+iTxGGPjZYk9HGD0Uf+Z
 jAIw1rcIyp8TO478HlVYoEPoStuUhpBu+TS6K7mQuupK8+cRHwrwWcJFOMjdr23D/0jn
 9+Wj3v2QobiIDtpDrAhKa3Wjk4xm3uSKFolPl4C/fJBxuJLDQNiWB8EhkohVWTV3WMT0
 VsVmTrtvgMM+WMmUXBAPdNyGEaQff3d82Zkop1wae48+y64ks3uh0NcKHuBIQ23fMSI5
 +hsgGhFEUhoPD5JAS6LyVuEwRJd+jhw5NoJa5uQ7/xQ49QygsQ2OtPd4tytZtwyRvnWB
 /aFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=zjoJ8ysH+GuiXx2n6iX4shC+hIhaPOOXW3sGP3dNGpc=;
 b=p6ielc+4J3MBsBgR2xWPJoMGvJg9914zL/iss3ZvHecHGd1KipLDAUXmNWflx5LMhG
 LJVxbMLet7QGtFY7gzgm5MJQYsg588JC65U5PNKBoqngC46OEV7CD4fRzlO2NvudrQjR
 dfFjwtRQJgWxGXwxdO4mDYugg+FLZTy7SxMKhRk9DCc41HBSNaMnYGl+Uo84XBud+TcJ
 FchzFhox4VCfbUWpbcFaghHXgEIhT7Eno5XXcEnAZYhBpekptXXOXYbqSUQB6OdvdSWC
 iH6FKEeO8AQPZSJEKZFHSladrY0lvlojz10DJpb9rWG4vsbNoWsTwviRET3YjeFS6skw
 dQxQ==
X-Gm-Message-State: ACrzQf2AZJhsGZm5eZsmWhNHCtak2FTmQTkhpRANjNjHtE0j3Lmnl/9f
 p7QN/O5y23MCSQVe/wFAoSmuDRmBAg0=
X-Google-Smtp-Source: AMsMyM7Zz2NCKo7EeVps7YcpPTCeqAPDjnw9iwIeW0CdOsiTvw77J6QaI3KPBSzVG8OzbwTLiE9RaA==
X-Received: by 2002:a05:6808:1303:b0:350:cba9:197d with SMTP id
 y3-20020a056808130300b00350cba9197dmr2059706oiv.83.1663693784104; 
 Tue, 20 Sep 2022 10:09:44 -0700 (PDT)
Received: from wintermute.localdomain
 (76-244-6-13.lightspeed.rcsntx.sbcglobal.net. [76.244.6.13])
 by smtp.gmail.com with ESMTPSA id
 v13-20020a9d69cd000000b00636956b3080sm121468oto.43.2022.09.20.10.09.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Sep 2022 10:09:43 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH V2 0/2] drm/panel: Add Samsung AMS495QA01 Panel
Date: Tue, 20 Sep 2022 12:09:35 -0500
Message-Id: <20220920170937.14486-1-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.25.1
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
Cc: devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
 airlied@linux.ie, Chris Morgan <macromorgan@hotmail.com>, robh+dt@kernel.org,
 thierry.reding@gmail.com, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Morgan <macromorgan@hotmail.com>

Add the Samsung AMS495QA01 panel as found on the Anbernic RG503. This
panel uses DSI to receive video signals, but 3-wire SPI to receive
command signals.

Changes since V1:
 - Removed errant reference to backlight in documentation. This is an
   OLED panel.
 - Made elvss regulator optional. In my case its hard wired and not
   controllable.
 - Added "prepared" enum to track panel status to prevent unbalanced
   regulator enable/disable.

Chris Morgan (2):
  dt-bindings: display: panel: Add Samsung AMS495QA01 bindings
  drm/panel: Add Samsung AMS495QA01 MIPI-DSI LCD panel

 .../display/panel/samsung,ams495qa01.yaml     |  46 ++
 drivers/gpu/drm/panel/Kconfig                 |  10 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 .../gpu/drm/panel/panel-samsung-ams495qa01.c  | 505 ++++++++++++++++++
 4 files changed, 562 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/samsung,ams495qa01.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-samsung-ams495qa01.c

-- 
2.25.1

