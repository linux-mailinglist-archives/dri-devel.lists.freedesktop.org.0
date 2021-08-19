Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8D6C3F2772
	for <lists+dri-devel@lfdr.de>; Fri, 20 Aug 2021 09:17:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACCA16EA1E;
	Fri, 20 Aug 2021 07:17:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BFED6E946
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Aug 2021 08:41:20 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id c17so3524436plz.2
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Aug 2021 01:41:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mlxsOtjk3EQe8tY0Dl2bnQT6hDTIci57yhrirNK4WM4=;
 b=J7/7iAoHBDmJ+jijEgkPLQqL7yz1iWvqEwo78YK1BwX97MSrHakJ2RbUqycjfuvrK7
 54csJnm2oINVomeUcsMqP3fqP6WMcmypPhExBHa9Q922tMRhNm0K5f5lfmEx9UJQxm39
 WH4XVK+vxAfEskugvFuGWPEJok99CSod9fHWyYnA1Ie6yQAXqtcT2zq4woR2VGBJhKKe
 /EUiKeWCqu9o98hdnZgPUxLHjgIJtN8X73vGw0C+hnExrViimJU5+Twn337t1/EiyYo3
 nCRM0Oob47CtOX1nFN80IJFKw33J9i3xZAeJh2JM+Tz3IdBOVUtTXsoh9seX+YiwD2fD
 //pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mlxsOtjk3EQe8tY0Dl2bnQT6hDTIci57yhrirNK4WM4=;
 b=PZYImLy8LhoUiXTEndhjHioNhh910D1a2vH6I6MEUKFsXlNQ49cE6B3S1QkrqJMnei
 qVAIx+LWE7LA1DN9Q4h5mI62z1dWQcbCpdaZRYWo8EUOAdFy9ASL9ymmGrmJsvLAn4rg
 ofyU+QDYuSBoXRD04yhRZMwReZaTg8Uj8SIMy/CAqvyLnNpu2132yZHJzloVCXYltqDX
 XsavT4hXXVlx0x2QDMUm6Iqy7H6vdCaCzR2U/gxfQKCBnoSkRBP5mCpJX1JSJbG9BlGo
 MrQrectffBYtPCWgi4dbfx+6LoNgj4578Mq3kF//XFBoxLpNM2eAYX0EAUaynoHOm8Nw
 wJkA==
X-Gm-Message-State: AOAM533kWfui9+0oZEDu2ecS4Mc9jIKcZ70Ho9tJJxx4KZvPUluPEeVZ
 hOz/cPTO2DDhhU15+alLZUMO9Q==
X-Google-Smtp-Source: ABdhPJxj6IiPxCEeaWe8hcpu1lJ2CyEbpbuNaQ7LwH3BNdQJgcpu88ogcCz2DITWjeOrYMYdIbDcog==
X-Received: by 2002:a17:90a:bd18:: with SMTP id
 y24mr14096989pjr.83.1629362479708; 
 Thu, 19 Aug 2021 01:41:19 -0700 (PDT)
Received: from yc.huaqin.com ([101.78.151.214])
 by smtp.gmail.com with ESMTPSA id c26sm3027492pgl.10.2021.08.19.01.41.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Aug 2021 01:41:19 -0700 (PDT)
From: yangcong <yangcong5@huaqin.corp-partner.google.com>
To: thierry.reding@gmail.com, sam@ravnborg.org, airlied@linux.ie,
 daniel@ffwll.ch, robh+dt@kernel.org, dianders@google.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 yangcong <yangcong5@huaqin.corp-partner.google.com>
Subject: [v1 0/2] drm/panel: boe-tv101wum-nl6: Support enabling a 3.3V rail
Date: Thu, 19 Aug 2021 16:41:09 +0800
Message-Id: <20210819084111.717459-1-yangcong5@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 20 Aug 2021 07:16:30 +0000
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

The auo,b101uan08.3 panel (already supported by this driver) has
a 3.3V rail that needs to be turned on. For previous users of
this panel this voltage was directly output by pmic. On a new 
user (the not-yet-upstream sc7180-trogdor-mrbland board) we need
to turn the 3.3V rail on. Add support in the driver for this.

yangcong (2):
  drm/panel: boe-tv101wum-nl6: Support enabling a 3.3V rail
  dt-bindings: drm/panel: boe-tv101wum-nl6: Support enabling a 3.3V rail

 .../bindings/display/panel/boe,tv101wum-nl6.yaml      |  4 ++++
 drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c        | 11 +++++++++++
 2 files changed, 15 insertions(+)

-- 
2.25.1

