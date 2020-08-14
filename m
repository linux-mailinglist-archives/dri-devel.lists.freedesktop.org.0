Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB1E12446B4
	for <lists+dri-devel@lfdr.de>; Fri, 14 Aug 2020 11:05:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35CFA6E2DF;
	Fri, 14 Aug 2020 09:05:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 580FD6E2DF;
 Fri, 14 Aug 2020 09:05:20 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id a14so7695900wra.5;
 Fri, 14 Aug 2020 02:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iO7mw694Q/zibSe98wvgSj4vZ6umHd/bC+tFMWsB/Lk=;
 b=QIpSp0ZdPhCXFTpBbXE3c0uql6bwGWCp4VWj1PX6a6Jcw76pc+DGkH5co02Kj8WWbn
 h/wXjVHnmebPwcobENg+xj4vlFEJxu4HpvojoBNj4Ib2nWehIzKzSdarN2XxcAFE9I9k
 nRJwH9HEwbgUKi1Ek4JmIk3Nl7EMpvRzoaltRWuYdQmTesmiUqcZnn+W+99xh5rYEwl9
 weTT6Gj09mgQTc9ApG9RMWs/MkbxAvtq1JbKLGHkcN6nEpFJfsZLiBA4ESy/KdmJWB7X
 RnnzosPC67X5suag8e72XwwpKUuDuQan/DUtRIfPloqNmmlij8IKN1L0PS2t/xY52oH5
 IHzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iO7mw694Q/zibSe98wvgSj4vZ6umHd/bC+tFMWsB/Lk=;
 b=KuPRdqY27vyvF84Ra6+7M3ypla6X++sbHeM8mFzalLqnfZ/m4ddqFETAIDKvbRR14T
 Qd42Ygf5XVQv43wMZW2XktQZKJKXRykvWy/S4Z+4wkwHYKF0cwqKWfGNd75DZmBsNDAX
 0VWSG8e8cxwagR66p8b/Stv7GP7+Y+MIvb3yRJbU/B1j5f9SoZO6nAcXf0ya1p0KV4wP
 ZCl5Kv6VcMFUPuKmzRAwu/U0WdSfoSA/XGLOd0NVJh0UHqCBm7gyuWjzwLkTqUPf2ZSp
 bzlcu3jbiQFeN6eFclTIHAsdWk81g5Z3dPHhPq/3TQwa6RCdXjR2pPea9rhcfcrqQtE/
 6iRQ==
X-Gm-Message-State: AOAM530YgONAq9wuY8r7QKxtOrfOx97awCGmndkZMtVBsfeS7xw7AWlI
 mt2gHA23RHLu/SbpRuSIwXM=
X-Google-Smtp-Source: ABdhPJymLYH3K8QMt1MSVRkr+LgMJBwbmUJ/Pd0NyaLN5j3DPjxXJLZ9XYjVxTj8u+VpWCUmq5yr8Q==
X-Received: by 2002:adf:e712:: with SMTP id c18mr1907130wrm.92.1597395918946; 
 Fri, 14 Aug 2020 02:05:18 -0700 (PDT)
Received: from localhost.localdomain (62-178-82-229.cable.dynamic.surfer.at.
 [62.178.82.229])
 by smtp.gmail.com with ESMTPSA id m14sm14046745wrx.76.2020.08.14.02.05.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Aug 2020 02:05:16 -0700 (PDT)
From: Christian Gmeiner <christian.gmeiner@gmail.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] drm/etnaviv: add total hi bandwidth perf counters
Date: Fri, 14 Aug 2020 11:05:00 +0200
Message-Id: <20200814090512.151416-1-christian.gmeiner@gmail.com>
X-Mailer: git-send-email 2.26.2
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
Cc: David Airlie <airlied@linux.ie>, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Russell King <linux+etnaviv@armlinux.org.uk>,
 cphealy@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This little patch set adds support for the total bandwidth used by HI. The
basic hi bandwidth read-out is quite simple but I needed to add some little
clean-ups to make it nice looking.

Christian Gmeiner (4):
  drm/etnaviv: rename pipe_reg_read(..)
  drm/etnaviv: call perf_reg_read(..)
  drm/etnaviv: add total hi bandwidth perfcounter
  drm/etnaviv: add pipe_select(..) helper

 drivers/gpu/drm/etnaviv/etnaviv_perfmon.c | 78 ++++++++++++++++-------
 1 file changed, 55 insertions(+), 23 deletions(-)

-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
