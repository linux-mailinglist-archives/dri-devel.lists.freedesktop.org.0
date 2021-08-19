Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CB983F276B
	for <lists+dri-devel@lfdr.de>; Fri, 20 Aug 2021 09:16:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26E8C6EA19;
	Fri, 20 Aug 2021 07:16:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3835C6E4AE
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Aug 2021 08:28:54 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id
 cp15-20020a17090afb8fb029017891959dcbso10814795pjb.2
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Aug 2021 01:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mlxsOtjk3EQe8tY0Dl2bnQT6hDTIci57yhrirNK4WM4=;
 b=DcTYaUhCIADfef5Gy3rock98MnXIqSctEqt74Z19ydTwBKKAObgfXU+VqkbJWSexUj
 UTyvK+IMz8cRzzM3uwazbz16bvKD7n32ApUrudfD1RSJgDl2D1mZqTXO3DkgrelKOQpi
 Q7p7fo0Gocr6RMjIRWBGHxH7n5X3GGD/oRgnQokQLV5vdeElSZOAXAwAejS+yZV1Wuu6
 jzuXl2nNACEW3vAvEv3zPucoMA7RbOAXm8H3Q6h6T/TZr7h19yaQYXiq2EdS3X2KbKDe
 T6OB6Aamb3+KKsCylj0MKNVNxv56AeVRr7bu0Gtm8ztGNmBdiX3lPUfzVZE0qSm2jDhK
 kd0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mlxsOtjk3EQe8tY0Dl2bnQT6hDTIci57yhrirNK4WM4=;
 b=J7/ehZUwlWGZtTBDHQiTI0uQStkh2RvgQ1LzYctZuIyiv8bBcttDIzdviQ/FZ79vW3
 GvtdETzqKIxe9GhZvxt1tY/BYQ2tee6Dg5/0ulY4h0GVajjmnvWPEe98i5/hSzh22FM4
 mfg5SZV/HxkjdKM6NkyVKo5R2/R6GH1L2KNIJ8NDZ5oyxtpuEyI1VsnWTuQ71u46Q7h5
 IBWwhh4BSkzkmn2lWeqMb1gEBjRDgLOdhwjFtxrmtydtqEhXxPpYdge3XYYNDcxth5gT
 xHzL7RvryrkMSKCFR0CiJlpdqKBaqTk3N9/zdWmAz8rFz+LrHu+c7mPbn7gzD3zl43ME
 2MFg==
X-Gm-Message-State: AOAM5314g9iv2XmA0xX5l5J/gY+G7rR/6Z8dUJrjxI6k0abIEdEmmOxU
 jtcp/mF/A5B+T8Z5dDdazfxlkg==
X-Google-Smtp-Source: ABdhPJywwufy1GedVPd73KbtcOOg8bcUAjKXTcyH+M8kmTO5+afM/R29vL3jzxw22vHrFl14nf8SLQ==
X-Received: by 2002:a17:902:9008:b0:12d:8258:e07c with SMTP id
 a8-20020a170902900800b0012d8258e07cmr11128687plp.42.1629361733810; 
 Thu, 19 Aug 2021 01:28:53 -0700 (PDT)
Received: from yc.huaqin.com ([101.78.151.214])
 by smtp.gmail.com with ESMTPSA id i11sm2347220pfo.29.2021.08.19.01.28.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Aug 2021 01:28:53 -0700 (PDT)
From: yangcong <yangcong5@huaqin.corp-partner.google.com>
To: thierry.reding@gmail.com, sam@ravnborg.org, airlied@linux.ie,
 daniel@ffwll.ch, robh+dt@kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dianders@google.com
Cc: yangcong <yangcong5@huaqin.corp-partner.google.com>
Subject: [v1 0/2] drm/panel: boe-tv101wum-nl6: Support enabling a 3.3V rail
Date: Thu, 19 Aug 2021 16:28:41 +0800
Message-Id: <20210819082843.716986-1-yangcong5@huaqin.corp-partner.google.com>
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

