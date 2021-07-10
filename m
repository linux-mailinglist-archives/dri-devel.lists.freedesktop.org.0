Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A30B3C36E7
	for <lists+dri-devel@lfdr.de>; Sat, 10 Jul 2021 23:26:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34B056EB61;
	Sat, 10 Jul 2021 21:26:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [IPv6:2607:f8b0:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 485DF6EB60
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Jul 2021 21:26:37 +0000 (UTC)
Received: by mail-oi1-x233.google.com with SMTP id q16so3540292oiw.6
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Jul 2021 14:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Gannu8WJb6nC/UgaL+0EdhA+dFthcJHL1PrBS/XOjBk=;
 b=of6gxxPw85DyP5oXbx+ONiPHfFHKliT0Z2IkKz8q4UDPmsd4kkRD/LwIgUv+2BX2oF
 XTBGqd+oxsTL4NCbyPjw9YJSfQBXK5xP7aLEEwuf0JhmkB4rOA0LFe2mAYJUBi4YzOij
 RpWRCYIK5GVP99poR/oKczJn5ejd2u0ZMp/pWWfWgswoz/QE+vgru2ZzeZ8HZQQguCL1
 6TzqMy+lhi0QEYq/YzjOqVSqh6MDVK1HrFaI3Ll/4pDawIoYGFzjiW2fyAkzDCs8S97B
 O6CQP2yr3qAwMyl3dwRtKTii3vq0iTXFuzRtjvvtEhnswMizdrlrdn4M10l0LTa8tDBu
 mdkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Gannu8WJb6nC/UgaL+0EdhA+dFthcJHL1PrBS/XOjBk=;
 b=qzvSvE+slKac8v04qxQR/+WijEBBNk4N7axUdqlxx+lbOvDhoGe0/BJIDcXL4xikW/
 XtXq9KykMQB3fW3mCQwQHSWSTJ216uhfeT3NKGCLU4nrgLmzLytqayUH3Vcrry2+B4EV
 clU+PFFbF6F62CrPl4ZVJ0duH8h5lmEpIAMcBYOz98ZIk77bW5AOZ0/8+Txc3npO10+O
 OBjGoZ3GCiD5Ne/xig4yVltSvbaHIk7iWZJALk7MCCWIMXOzOjBxbK7OL46EWp4aNJpS
 Z45GlkZmgRsCePfpfpkw08dYRf4nhEtvLCy8YkM33a4tt0MGcOwyGVLJd5lbO5ce/Kie
 7Tow==
X-Gm-Message-State: AOAM533/UEHcrJ9J70AnBFl1ZnF1rlodl+acXjnGiOvJ14sYCwLiOlOr
 iV7+iTqS5S5NZNBFnrmvs6XUOA==
X-Google-Smtp-Source: ABdhPJwlIgIbjDIiPmyJbw1cfD3lTc/+yJd7q2JR9N6RVoW3g9Cd11yG2zMpsRHbpSZIiWOHdg/eyQ==
X-Received: by 2002:aca:6142:: with SMTP id v63mr4610723oib.56.1625952396501; 
 Sat, 10 Jul 2021 14:26:36 -0700 (PDT)
Received: from omlet.lan ([68.203.99.148])
 by smtp.gmail.com with ESMTPSA id u18sm972797ooq.36.2021.07.10.14.26.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Jul 2021 14:26:36 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 0/2] drm/i915: Better document VM and engine set APIs
Date: Sat, 10 Jul 2021 16:24:45 -0500
Message-Id: <20210710212447.785288-1-jason@jlekstrand.net>
X-Mailer: git-send-email 2.31.1
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Jason Ekstrand <jason@jlekstrand.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As per Daniel's request, this better documents the VM and engine set APIs
including some discussion of the deprecation plan.

Test-with: 20210710211923.784638-1-jason@jlekstrand.net
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>

Jason Ekstrand (2):
  drm/i915: Don't allow setting I915_CONTEXT_PARAM_VM twice
  drm/i915/uapi: Add docs about immutability of engine sets and VMs

 drivers/gpu/drm/i915/gem/i915_gem_context.c | 12 +++----
 include/uapi/drm/i915_drm.h                 | 39 +++++++++++++++------
 2 files changed, 33 insertions(+), 18 deletions(-)

-- 
2.31.1

