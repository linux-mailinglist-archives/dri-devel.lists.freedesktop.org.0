Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF39F3FAFD3
	for <lists+dri-devel@lfdr.de>; Mon, 30 Aug 2021 04:39:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0D6F89D4B;
	Mon, 30 Aug 2021 02:38:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com
 [IPv6:2607:f8b0:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0276589D4B
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Aug 2021 02:38:56 +0000 (UTC)
Received: by mail-pg1-x529.google.com with SMTP id q68so12001668pga.9
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Aug 2021 19:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VqeRjMhmJZnvzq8NRFzwezD8T9i12vRMn3+M5Ojy160=;
 b=vBM2F2xHG2bkvPHfHeQLO6ooNyZfC1lnI89BEoY3Ui5mQZ3XPEUEfLiV27i1UNtZo0
 9kGc6ml/6sPGK3JqCKVJkJbXVMh3AxKDqZhQL6wCqVIxBBq8M5zP1gvE7HmrqmrODQt+
 ROcluGli4e3VaCMw0dVOvKfkBg1jxDcUV0Kj7ONzLdWeDVy47EvKYVPnk/SkLat7cMfY
 AExAdB7OTVDmxHc7pnaW8C6OBUttzBb0HakPIS4hb3/KpPVgWfG6a7UUfC7OX4AlWtPz
 0Kul9zhc/ctmMLzC0uzT21eYlN9y2IJlgJHv84DSvKve1uFX+UlpgHbyf1J2oxY83kE8
 O2sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VqeRjMhmJZnvzq8NRFzwezD8T9i12vRMn3+M5Ojy160=;
 b=GYQK2VO2u4O7QZjHTSSw59tiNDy2E5FjeXU8i0wzc+bR2J0FCh2N6XEE69a0M4865a
 xlwMy+BcS3F48hr9ScIDLQA03I5nM3Wzk3ivGhOuK6L+v7rgfVyAOxMKuEHQO01JWUUa
 n1XDvEXOGrj2hv14sCbTRhPRYBC7KvGLdWUd2lTprlGAG/El74PHtCwvPXoQuonxGTBH
 jOJicbBiH8CxFWDGw/1WgBx74Fx0aPC17t1wKTolwG/h764ZNayIxWJHGi9bTaCO73qW
 nvvoGBuRTdeti3ghFdcFOW4RjekTG1njTyv5nunUkZclytMhbBYOoIBEQ9sADlfKA3Ob
 ugHw==
X-Gm-Message-State: AOAM531QN9Xa/w4CKHVjeKwx0biRq11CrCbTffKBojFe64YaU4WpRgmP
 T+PV+iP2viMlPR/L7raIBEp7hQ==
X-Google-Smtp-Source: ABdhPJw2x1+qhg9TcS8T6ndTpvoYCeMp8Baca9OpE+M5FQGpHd2THM2a9EOnc6WdUnCwUBBsRN/fyg==
X-Received: by 2002:a62:f90d:0:b0:3e3:5739:d075 with SMTP id
 o13-20020a62f90d000000b003e35739d075mr21129479pfh.19.1630291136493; 
 Sun, 29 Aug 2021 19:38:56 -0700 (PDT)
Received: from yc.huaqin.com ([101.78.151.213])
 by smtp.gmail.com with ESMTPSA id g13sm906839pfi.176.2021.08.29.19.38.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Aug 2021 19:38:56 -0700 (PDT)
From: yangcong <yangcong5@huaqin.corp-partner.google.com>
To: thierry.reding@gmail.com, sam@ravnborg.org, airlied@linux.ie,
 daniel@ffwll.ch, dianders@google.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 yangcong <yangcong5@huaqin.corp-partner.google.com>
Subject: [v4 0/4] drm/panel: boe-tv101wum-nl6: Support enabling a 3.3V rail
Date: Mon, 30 Aug 2021 10:38:45 +0800
Message-Id: <20210830023849.258839-1-yangcong5@huaqin.corp-partner.google.com>
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

Compared to v3, remove the "//9A" and modify boe_panel_prepare timing in 
drm/panel: boe-tv101wum-nl6
 
-       _INIT_DCS_CMD(0x5A, 0xBA),      //9A
+       _INIT_DCS_CMD(0x5A, 0xBA),
...
...
...

-       usleep_range(10000, 15000);
+       usleep_range(10000, 11000);

Update commit message.

yangcong (4):
  drm/panel: boe-tv101wum-nl6: Support enabling a 3.3V rail
  dt-bindings: drm/panel: boe-tv101wum-nl6: Support enabling a 3.3V rail
  drm/panel: support for BOE and INX video mode panel
  dt-bindngs: display: panel: Add BOE and INX panel bindings

 .../display/panel/boe,tv101wum-nl6.yaml       |   7 +
 .../gpu/drm/panel/panel-boe-tv101wum-nl6.c    | 926 +++++++++++++++++-
 2 files changed, 930 insertions(+), 3 deletions(-)

-- 
2.25.1

