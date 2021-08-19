Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31C513F19B0
	for <lists+dri-devel@lfdr.de>; Thu, 19 Aug 2021 14:48:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68D5C6E834;
	Thu, 19 Aug 2021 12:48:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CC526E834
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Aug 2021 12:48:50 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id q2so3818646plr.11
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Aug 2021 05:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mlxsOtjk3EQe8tY0Dl2bnQT6hDTIci57yhrirNK4WM4=;
 b=C/c9qtXCbDh8ba0bEl5eqr8WQGeufHKR1Un4IT4bUXM4xXrkTxBFtgnckgQ50er66b
 zxfX7mk5ZydlgtFQBh38HgP8oX/3dCPjFGRZSCFW+dGtz2RwMSmV37BKshYrgoSN+exl
 3pwOIvrMoV4Sj+Zf5YoWB0mdSW+cYwMlMV0OlC5J8pMAOpT/xeGU3twXGkfj2y4CurHI
 t64yylZZpzsR55ysItGwCinJuxjqC4rCcqgN9uSnT6a/E/ptDRLFW0/IBxsr1i5MS+hz
 elGCD7jckU2m2z5L9n69lW2Rnhsfintij5PlkqN9+gweIhTkulOXORjEOJqUsqvW75BB
 t+Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mlxsOtjk3EQe8tY0Dl2bnQT6hDTIci57yhrirNK4WM4=;
 b=IuvqNJdKEESqMQZCVfpDOIRHamjsVgMAI/XBLqtVuswFnkPHuphBsW6zFA8ZnwCvil
 9+vmd4ohJjOv3vJTwzAfDjImW57PsEJd84tdHYW0yuVqEZNtL85yZVPUrNXcN2E50Cdr
 C45PbES/o4ZyqaMNmCxeRc7VGfNx1T0v19lBAc4191yR4aQOP1ODb6d3zbJ5M/MERQ/j
 EamrVpTZSu2LjL/GVcBgpv+53NcwuSOtDDl7GQL9CR2iVKNhK9sGIGWAACw2wMjCyW4Q
 GL/Q+soligyTXYgcs7xQ5ccgnDMGDKQTdPUfTFeW1ffuKb/UjkcMTHEX5FBgBTEoO50L
 6ZJQ==
X-Gm-Message-State: AOAM533DB6fLdLTFU0R3ciFQhKz6nxc24+UNyY5a4Up2LoiVDi4OL8Lh
 uw088mIaHmYxUhykd6BvR/aK7A==
X-Google-Smtp-Source: ABdhPJw7+fjyC0SC3MOzj/6NzYAJjwgk/Nve1tUgxX32A0IY6i5qv5858pWqGdvPzn4v0Wu1pYc+cw==
X-Received: by 2002:a17:90a:d595:: with SMTP id
 v21mr15360955pju.50.1629377329891; 
 Thu, 19 Aug 2021 05:48:49 -0700 (PDT)
Received: from yc.huaqin.com ([101.78.151.213])
 by smtp.gmail.com with ESMTPSA id c11sm3137210pji.24.2021.08.19.05.48.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Aug 2021 05:48:49 -0700 (PDT)
From: yangcong <yangcong5@huaqin.corp-partner.google.com>
To: thierry.reding@gmail.com, sam@ravnborg.org, airlied@linux.ie,
 daniel@ffwll.ch, dianders@google.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 yangcong <yangcong5@huaqin.corp-partner.google.com>
Subject: [v1 0/2] drm/panel: boe-tv101wum-nl6: Support enabling a 3.3V rail
Date: Thu, 19 Aug 2021 20:48:42 +0800
Message-Id: <20210819124844.12424-1-yangcong5@huaqin.corp-partner.google.com>
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

