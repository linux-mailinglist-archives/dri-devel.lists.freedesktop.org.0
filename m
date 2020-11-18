Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA6682B76FE
	for <lists+dri-devel@lfdr.de>; Wed, 18 Nov 2020 08:36:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F11FD6E342;
	Wed, 18 Nov 2020 07:36:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36E2C6E342
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Nov 2020 07:36:44 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id 10so1988500wml.2
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Nov 2020 23:36:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6p3c80AHd5OPqbr92hOKO4H3Ee008JH54/v7uHsmK6g=;
 b=i9cpdRhavwovu0Y1oEF412c6SL+Z1eKBRDkez0U7YOOHn0NLpodm5LfUbF39HbIGBv
 aPzz5WuN3aEJXfpVuNTakYImJwhiWaswNv7pL1HAhH5wTRULcCWev9mbPCFnlnTgLdQp
 5PlrFLjdoHTkaRUaqgfqiVdWzaHx7FGliEDaI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6p3c80AHd5OPqbr92hOKO4H3Ee008JH54/v7uHsmK6g=;
 b=DYjM/6Dm6D1i8nixAGn6iWu1UEoqGvPScspDouB8Vv+DEVHdAb0CCgk3OsNKt/uj7D
 b1Sqa0+o/rbPg2yVCZwQ5gsazBquv9qLDU0p01nj8xN4HjzxW8xVHeEgVS5k77mgJmqP
 ZeNid/z2XGedBVkOe7Hc2ihb71FUaJX141VWaqqWdsDIhKgovJj6MOPlf6TGxurMIKip
 ApI6v1QCvpKQ/UMmVBC/OJKBrklNNihHesfXGPST1CFmA14mZlRENnSayAsWSqm/TmyV
 rxXj2XZJ39VB5bSzs+prxn2Io4vAa2vJ9qSzpv0U6VBLN+kGLjfnamgk00sWzlAt8fSI
 wqvw==
X-Gm-Message-State: AOAM5327jtUho/1kYeVWHfXuoXJzMECVr+0GoehjKQNzR1NPXLgVB6vh
 F9Saugb2RbGxRqCmMt6nJwlz+T4Mlc0UwQ==
X-Google-Smtp-Source: ABdhPJyhf2SMRlfX1qLqAVgQm/U/JnNL7flL/zyExDoEcmUGtcqFQWuHnDBYuyoEYLf84Cn1wxyviw==
X-Received: by 2002:a7b:cd11:: with SMTP id f17mr2953523wmj.127.1605685003437; 
 Tue, 17 Nov 2020 23:36:43 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id d63sm2242519wmd.12.2020.11.17.23.36.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Nov 2020 23:36:42 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/docs: Fix todo.rst
Date: Wed, 18 Nov 2020 08:36:37 +0100
Message-Id: <20201118073637.597206-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.29.2
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Stephen Rothwell <sfr@canb.auug.org.au>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I didnt' format the thing correctly :-(

Fixes: 39aead8373b3 ("fbcon: Disable accelerated scrolling")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
---
 Documentation/gpu/todo.rst | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
index 94fc76f0ecd4..009d8e6c7e3c 100644
--- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -297,9 +297,12 @@ Garbage collect fbdev scrolling acceleration
 
 Scroll acceleration is disabled in fbcon by hard-wiring p->scrollmode =
 SCROLL_REDRAW. There's a ton of code this will allow us to remove:
+
 - lots of code in fbcon.c
+
 - a bunch of the hooks in fbcon_ops, maybe the remaining hooks could be called
   directly instead of the function table (with a switch on p->rotate)
+
 - fb_copyarea is unused after this, and can be deleted from all drivers
 
 Note that not all acceleration code can be deleted, since clearing and cursor
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
