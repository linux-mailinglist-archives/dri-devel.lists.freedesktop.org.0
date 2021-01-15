Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 17DE42F889F
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jan 2021 23:44:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A0556E4AA;
	Fri, 15 Jan 2021 22:44:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51DE66E4AA
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 22:44:47 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id t6so5459416plq.1
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 14:44:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mTA49NGZFHIajQ9unaV1ybBctL6ERy3zYWaKCRHno4w=;
 b=ESFR8XE28uKU8I9Yi8nLrOKz7DRInG2Yb87P5sczoq2dC2AFbH0WFnaqVQfnKRPjeJ
 5LGPRmxjq24G5gw2ablyQXl1Bd9mZvyI2OpKe8SHBjqNYA8Lw6JOesczgCrQFuXm9jMD
 /HCfMbBCxNcBEqwpxPl7IwGTRN+K2TCuZHNfM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mTA49NGZFHIajQ9unaV1ybBctL6ERy3zYWaKCRHno4w=;
 b=ZW6hjJrKd0YdNgZ/+DaZk2unix8FI/AHe5sZ7vtej1w5KIQUya0J8mBVL+/I4q1OTY
 KcbmTD+z2nIs68Wgu4BXXXeXKF+BT/OBTYQQAZF8JfCXZWQYyB5dN0R5f3gQjqlYMtX7
 24lwEa00rZiykMqz7+cmmZDz5419UlgnM6p75UYxaVB0+zzhMHL5LKm5V+X71WWCZKR+
 yDIAtpmbRFZ6Jd69chvtXHTN0Z3Q4riLPmUbVX67ZqSj0wSix+OAw85zBEBSHeqXRcR2
 ML+n15CUf2cHqI4ZKRPRyPnrznTWrhhsvPJ0Eoj9daUTy9Jd3n6ejve4aXMAOsvKdiWF
 FUgg==
X-Gm-Message-State: AOAM533xCwhwZx2ku/Z0GDEdz//lhR+Bpt6x+O4XFQ+REJFsQq2B3cvR
 3czYTwMxhmqooV6ll2A3YgGhNQ==
X-Google-Smtp-Source: ABdhPJyoaYtRn2BrXjvFuddlTtkAwmEk+srgLAChXqS259ceINg3HgxgyQaHayHSXGJyGut0yKSKUQ==
X-Received: by 2002:a17:90b:490c:: with SMTP id
 kr12mr13051567pjb.227.1610750686904; 
 Fri, 15 Jan 2021 14:44:46 -0800 (PST)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:42b0:34ff:fe3d:58e6])
 by smtp.gmail.com with ESMTPSA id q16sm9131100pfg.139.2021.01.15.14.44.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 14:44:46 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v2 0/5] drm/panel-simple: Patches for N116BCA-EA1
Date: Fri, 15 Jan 2021 14:44:15 -0800
Message-Id: <20210115224420.1635017-1-dianders@chromium.org>
X-Mailer: git-send-email 2.30.0.284.gd98b1dd5eaa7-goog
MIME-Version: 1.0
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
Cc: Rob Clark <robdclark@chromium.org>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series is to get the N116BCA-EA1 panel working. Most of the
patches are simple, but on hardware I have in front of me the panel
sometimes doesn't come up. I'm still working with the hardware
manufacturer to get to the bottom of it, but I've got it working with
retries. Adding the retries doesn't seem like an insane thing to do
and makes some of the error handling more robust, so I've gone ahead
and included those patches here. Hopefully they look OK.

Changes in v2:
- Set the "unprepared_time" so if we retry we give the proper delay.
- ("drm/panel-simple: Don't wait longer for HPD...") new for v2.
- ("drm/panel-simple: Retry if we timeout waiting for HPD") new for v2.
- ("dt-bindings: dt-bindings: display: simple: Add N116BCA-EA1") new for v2.
- ("drm/panel-simple: Add N116BCA-EA1") new for v2.

Douglas Anderson (5):
  drm/panel-simple: Undo enable if HPD never asserts
  drm/panel-simple: Don't wait longer for HPD than hpd_absent_delay
  drm/panel-simple: Retry if we timeout waiting for HPD
  dt-bindings: dt-bindings: display: simple: Add N116BCA-EA1
  drm/panel-simple: Add N116BCA-EA1

 .../bindings/display/panel/panel-simple.yaml  |  2 +
 drivers/gpu/drm/panel/panel-simple.c          | 84 +++++++++++++++++--
 2 files changed, 80 insertions(+), 6 deletions(-)

-- 
2.30.0.284.gd98b1dd5eaa7-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
