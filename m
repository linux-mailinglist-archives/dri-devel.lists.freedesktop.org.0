Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CAD23F2778
	for <lists+dri-devel@lfdr.de>; Fri, 20 Aug 2021 09:17:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 519196EA27;
	Fri, 20 Aug 2021 07:17:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F8CE6E85E
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Aug 2021 09:30:32 +0000 (UTC)
Received: by mail-pg1-x534.google.com with SMTP id o2so5335734pgr.9
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Aug 2021 02:30:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mlxsOtjk3EQe8tY0Dl2bnQT6hDTIci57yhrirNK4WM4=;
 b=QA9i8ROIYsA+zU2UaEHUmLlB078lcj9BDoGzFBe62urhEJAkBKMHIsgkyuWt3EjbSA
 18fydOVz/bSrSOW5eNg7eCYof53xhRp1dDbtd1q+1HVnSnMN/2G4HmIyROq5VUwHhoR7
 GFUoD64A4bRte4u7zimuz6u77yho2bxkaTSSgSGpklBV1EiVGcuWWAzIKbVDHZVsjwVP
 e2fv8GLwmpibjVz3yyc/SloVvvxnOfRWi6TOlIWZG3QcYPHS9+/U67HAZswWRJLY6+0x
 ud91n9fJ7CpdYR025yqJ8j3K3oOmWtCQLTeDL52UKjIeCTQCsS+VL7JI9UPgV44GZgad
 GALg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mlxsOtjk3EQe8tY0Dl2bnQT6hDTIci57yhrirNK4WM4=;
 b=iiH0KIQhhR9hWFtCc+PuutS47I+S/aLeqN1x+3slEwR+uAS3rj73kkRWCwCLyxIHQo
 J1IkVNdb+R/hVwzi2SwchUheERNB2ClOgaUl6rT90uN3eyUsCZDh3KL43UPj9fAFsfaS
 A8yqi/rJczzPeiXfIfaAVhKr+flquJaU1x6t3Rs8FGVwnfZyv1OBczAU4okkG6REAMQA
 M6DGOdsT9+wkGwLX2MOFtbFgb11ewBsxi0FtCaobN87EdvAeRKN8yubGzAGWQmzZWyF0
 9fUfZanxI23glC7xJxxOj3AfvaZTtOVZYpOFJg9PzuTR1Bm3DOfDIhvTbC2VVWQzZECf
 7BFQ==
X-Gm-Message-State: AOAM531VIQQlgKOPU5AEm5MsUJIdyUYD+qzK0G/Mxsrfs0cry+a0+NSm
 CH+L0FSzcHvcaAmytLLfyHACTg==
X-Google-Smtp-Source: ABdhPJyeugUXXFlUORsDl924iC5IC5L8o7JXyzE+GdxjfiwTaktTT09hgqxXFgSOPSEzNYFMdhEnrw==
X-Received: by 2002:a05:6a00:791:b0:3e1:3316:2e8 with SMTP id
 g17-20020a056a00079100b003e1331602e8mr13888896pfu.10.1629365431721; 
 Thu, 19 Aug 2021 02:30:31 -0700 (PDT)
Received: from yc.huaqin.com ([101.78.151.213])
 by smtp.gmail.com with ESMTPSA id 11sm2601031pfl.41.2021.08.19.02.30.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Aug 2021 02:30:31 -0700 (PDT)
From: yangcong <yangcong5@huaqin.corp-partner.google.com>
To: thierry.reding@gmail.com, sam@ravnborg.org, airlied@linux.ie,
 daniel@ffwll.ch, dianders@google.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 yangcong <yangcong5@huaqin.corp-partner.google.com>
Subject: [v1 0/2] drm/panel: boe-tv101wum-nl6: Support enabling a 3.3V rail
Date: Thu, 19 Aug 2021 17:29:41 +0800
Message-Id: <20210819092943.719433-1-yangcong5@huaqin.corp-partner.google.com>
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

