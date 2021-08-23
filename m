Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C81A23F47CC
	for <lists+dri-devel@lfdr.de>; Mon, 23 Aug 2021 11:41:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73AAF89BB0;
	Mon, 23 Aug 2021 09:41:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41BFD89BB0
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Aug 2021 09:41:09 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id
 j4-20020a17090a734400b0018f6dd1ec97so934854pjs.3
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Aug 2021 02:41:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=t8fVVskRMUhZBLLXNsTNJMFPY/9N8+jsrpYM+Bj152I=;
 b=Yamp3JjiDMsrBiCcbd5uH78fnp6QJHpzL5r1YvzpVkp1U5+z9MY//NjvwcuZzosktT
 JzcqYmKkkdDqDkZCrRnL3/UenDW/QBpo1m4Pm0DC5NLfbTv43DZbWmTKJA9wKixqCaH4
 mnLu5lynTXlkIz0eIBy5p6o8movMll4F7havg028GKA5Kx9v3XKTvofidV3TG/+0WVu6
 +FzwYTWaFgOhdMGajwdCqHRy9YM6H76AW8DY9JaNBUzVF3Gsy7z2Caz5lY1gUbqe4UfX
 NQB/IdktE+BCVoZsFsmSmbdcC3RKD3TR4iTLfhuPL0TTVIjAY/76vM7243mcXtJjMnwQ
 4fkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=t8fVVskRMUhZBLLXNsTNJMFPY/9N8+jsrpYM+Bj152I=;
 b=qMZt2U9iGzASWSLnGgH+yLIkbukjml2G2AjpCTM560WrarQ20lsOTBl33sJYdbsL9i
 YR6KyzZyi4RysYKUJboJqVjHvbjpglmlfTtzzLep27YPuITqIVi5hKLXWcS9uP8e9CjW
 j7p69R+GJm3Lt+Q2PEvoH8tQyBraVwp3fKLIchtmOCgTCXt0Xg4sHgzttWNno3y/sZmX
 MHbo5tmdsQ0yhPytDp1VX9U5IfA6EIFdmvhMbjOc4FTlINeUbJUxSRjG/Q57FLUra7yA
 7oOz0cL/YL2k7As366tH00e2OMz7pe7DSWubc5GTiIpROlXR1VKjZ2vKDjWxpr2XSW2a
 j1NA==
X-Gm-Message-State: AOAM531oGbbjjhf0QTrOiT2LW6AikZIK5lMaKJAMubXZuPeOsHZVw6TN
 iWTlumPyuR0CGQpuLEXchQiFjQ==
X-Google-Smtp-Source: ABdhPJz5BeZvHsIft7mQyjRWW23AxE9aMSf7VF/1zB/zBjm6pSu1V6ki6w1l3SueCXj/dXyZbG/BaQ==
X-Received: by 2002:a17:903:41c3:b0:132:2a3f:5897 with SMTP id
 u3-20020a17090341c300b001322a3f5897mr10180186ple.19.1629711668847; 
 Mon, 23 Aug 2021 02:41:08 -0700 (PDT)
Received: from yc.huaqin.com ([101.78.151.213])
 by smtp.gmail.com with ESMTPSA id p10sm14453192pjv.39.2021.08.23.02.41.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Aug 2021 02:41:08 -0700 (PDT)
From: yangcong <yangcong5@huaqin.corp-partner.google.com>
To: thierry.reding@gmail.com, sam@ravnborg.org, airlied@linux.ie,
 daniel@ffwll.ch, dianders@google.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 yangcong <yangcong5@huaqin.corp-partner.google.com>
Subject: [v1 0/2] Add driver for BOE tv110c9m-ll3 panel
Date: Mon, 23 Aug 2021 17:41:00 +0800
Message-Id: <20210823094102.1064716-1-yangcong5@huaqin.corp-partner.google.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add driver for BOE tv110c9m-ll3 panel is a 10.95" 1200x2000 panel.

yangcong (2):
  drm/panel: support for BOE tv1110c9m-ll3 wuxga dsi video mode panel
  dt-bindngs: display: panel: Add BOE tv110c9m-ll3 panel bindings

 .../display/panel/boe,tv110c9m-ll3.yaml       |   83 ++
 drivers/gpu/drm/panel/Kconfig                 |   10 +
 drivers/gpu/drm/panel/Makefile                |    1 +
 drivers/gpu/drm/panel/panel-boe-tv110c9m.c    | 1303 +++++++++++++++++
 4 files changed, 1397 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/boe,tv110c9m-ll3.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-boe-tv110c9m.c

-- 
2.25.1

