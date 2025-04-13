Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C1BFA872D7
	for <lists+dri-devel@lfdr.de>; Sun, 13 Apr 2025 19:11:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7277910E289;
	Sun, 13 Apr 2025 17:11:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=treblig.org header.i=@treblig.org header.b="gXQb7WEx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACE5210E261;
 Sun, 13 Apr 2025 17:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
 ; s=bytemarkmx;
 h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
 :Subject; bh=zuyyklr2NSR5SZnTYhW13D4u+H13Qg7A3uaAtI3DJS8=; b=gXQb7WExS0sZ2bjQ
 Tqch/B6Ur8i7yedpK714X8cDhVuGKbeEySlmK4VMq8L9r/SlTGFsRiGBZJYe1t4lceS6ZpSB+VGBo
 ronFZzxmrHTPUtivRylrlPxjKTtGwT48FK6wpX2Ld+sImOIJwaxu+D56rX4FGwOyuUKnVEdo06eE1
 XKP0x5CiZgNPiKzFmo7fpMboyK8hBZdkzQTzCasdtAGRTIMQg8mZWeodwfu0p7S+RTo4NWXD0E71U
 n2Fd/yX83DJrmarZ4jr/aq1dQVUeu4s+yNPRpfnz5pLG2ZRsHqg2104d56et4qhA8INz/baUVUggp
 fpj89oTb0JfBnA+3IA==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
 by mx.treblig.org with esmtp (Exim 4.96)
 (envelope-from <linux@treblig.org>) id 1u40rD-00B22s-1j;
 Sun, 13 Apr 2025 17:10:59 +0000
From: linux@treblig.org
To: kraxel@redhat.com,
	airlied@redhat.com
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, virtualization@lists.linux.dev,
 spice-devel@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, "Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH 0/2] drm: qxl: Deadcoding
Date: Sun, 13 Apr 2025 18:10:56 +0100
Message-ID: <20250413171058.271234-1-linux@treblig.org>
X-Mailer: git-send-email 2.49.0
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

From: "Dr. David Alan Gilbert" <linux@treblig.org>

Hi,
  A couple of small deadcodings for qxl.  The first
just cleans up a couple of trivial unusued wrappers.
The second cleans out some debugfs code that's been unused
for a few years.

Dave
Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>


Dr. David Alan Gilbert (2):
  drm: qxl: Remove dead qxl_io_flush_* functions
  drm: qxl: Remove unused debugfs code

 drivers/gpu/drm/qxl/qxl_cmd.c     | 10 ----------
 drivers/gpu/drm/qxl/qxl_debugfs.c | 29 -----------------------------
 drivers/gpu/drm/qxl/qxl_drv.h     | 12 ------------
 3 files changed, 51 deletions(-)

-- 
2.49.0

