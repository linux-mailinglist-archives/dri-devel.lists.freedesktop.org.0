Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25AB527D20E
	for <lists+dri-devel@lfdr.de>; Tue, 29 Sep 2020 17:03:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5293C6E1BD;
	Tue, 29 Sep 2020 15:03:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EDF36E1BD
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Sep 2020 15:03:41 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id l15so6831709wmh.1
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Sep 2020 08:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tWwPQzzJfUFJAupGgoHtftS0iMIBjBuL5cB+hojsBy0=;
 b=gTNoL7Qczy7dGGfkkrdLAaDRSQSMg+wlAh29mCzhclUpWFiUIVDCTGo/tGoEdZE8RG
 F4jr2Gjv5k8OiLUj/dZrXFMMtk8YlqDz99mdr6J5I+Z956nFt2HnfSNcFzyC5d4Vi8y5
 MGShHsECpzCOi2X2ePBHlZ0j891wJVBBZzYb8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tWwPQzzJfUFJAupGgoHtftS0iMIBjBuL5cB+hojsBy0=;
 b=Lk/onrhTaWaEYKwU42Z42oESfsbKPIDoLLz39IeEV62XcD7VelOm8Ls9TRLZfV6OAz
 d21FEEjeTAQCnKh3CwIDWDyDLmmvJSKbocrMf4cYgrwl2vu4O1ibdo3hpAbtJyKB63nN
 l3hKu1G3UdlLF1vH+IZz4nz5n5P4ujBo7vtO5OKE1r7lIB/jNY3c0VnEnEzpWnhWDs6Y
 mCEWznrhUZkJYPyHOI76P6wkCuVlDaSoU8OhmpmDMWVUP+Ay4EsrjUttrKrpccVLyiji
 jXlTlg32y2u4yQxVxX2DkxKv4X5EQl3hnv3U6ybaht7mQvQlutrbOBPqAs/NOJZqVue1
 2Yhg==
X-Gm-Message-State: AOAM532WyfPcDkL1FNDX7vVpzwe3V6liRHbu/CiW0Y5RK75jS4hm3VRN
 clRVSw3R+CqRtYgOpNw7RjnV7rU82JK3Hn6F
X-Google-Smtp-Source: ABdhPJz0jJ/ICKPWmN5ZOT+dCJFeTq0O8xBcQAvLh4TpQwUH4XhtpXxbgXuZ7gOmmtFSelbVNW7+xg==
X-Received: by 2002:a7b:c2a9:: with SMTP id c9mr5077455wmk.87.1601391819531;
 Tue, 29 Sep 2020 08:03:39 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id f12sm5664214wmf.26.2020.09.29.08.03.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Sep 2020 08:03:38 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm: update todo.rst
Date: Tue, 29 Sep 2020 17:03:33 +0200
Message-Id: <20200929150333.3441576-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.28.0
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
Cc: Melissa Wen <melissa.srw@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Wambui Karuga <wambui.karugax@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

- debugfs cleanup has moved forward thanks to the cleanup Wambui has
  done

Cc: Wambui Karuga <wambui.karugax@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Melissa Wen <melissa.srw@gmail.com>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
---
 Documentation/gpu/todo.rst | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
index 3751ac976c3e..700637e25ecd 100644
--- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -515,9 +515,6 @@ There's a bunch of issues with it:
   this (together with the drm_minor->drm_device move) would allow us to remove
   debugfs_init.
 
-- Drop the return code and error checking from all debugfs functions. Greg KH is
-  working on this already.
-
 Contact: Daniel Vetter
 
 Level: Intermediate
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
