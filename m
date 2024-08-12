Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C0B594E791
	for <lists+dri-devel@lfdr.de>; Mon, 12 Aug 2024 09:15:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9E5710E104;
	Mon, 12 Aug 2024 07:15:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.b="DlpRpY+k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1119 seconds by postgrey-1.36 at gabe;
 Mon, 12 Aug 2024 07:15:37 UTC
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [62.89.141.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C622410E104;
 Mon, 12 Aug 2024 07:15:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=linux.org.uk; s=zeniv-20220401; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=P53OWdVPNdmYnfxaiQpjH8gBNbpDMToARdSJWb6uK/8=; b=DlpRpY+kn5g5IYU1v5cYqMUOBf
 AX0V1NVFmEnsQ9zvwNA/QNDTKVWD2zw7eS2KU6+KRILyX6TgkDL1TH/J7lRb8v/lZP0btk+LHpdfz
 33pfHiIA1GcLM4EetOgpJE461r3bNxOxDcoi8juYwsitsA1Sf1dLkKpu9xHjgjQWD+cZPJwVOZwyy
 Q19BFW8bagdv1VnJ5LArE7IQEyTR+Swe8iKvjGtgb5SvJ5hadRsf/XJr2CsCEKrCozWeDtPL0Qg8Q
 zYUIiFhkIcUlccVDowMtedtJu3n0nyR842S+r+AjvqMduSnw78W0RCE0A3uuizvL/lk7aPqI5Obro
 dsMgaKlg==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.98 #2 (Red Hat
 Linux)) id 1sdP1G-000000010nr-2X4U; Mon, 12 Aug 2024 06:59:06 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: viro@zeniv.linux.org.uk
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-fsdevel@vger.kernel.org
Subject: [PATCH 4/4] amdgpu: get rid of bogus includes of fdtable.h
Date: Mon, 12 Aug 2024 07:59:06 +0100
Message-ID: <20240812065906.241398-4-viro@zeniv.linux.org.uk>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240812065906.241398-1-viro@zeniv.linux.org.uk>
References: <20240812065656.GI13701@ZenIV>
 <20240812065906.241398-1-viro@zeniv.linux.org.uk>
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

Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c | 1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_sched.c           | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c
index 3a3f3ce09f00..2e2cfc5b5ed9 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c
@@ -20,7 +20,6 @@
  * OTHER DEALINGS IN THE SOFTWARE.
  */
 #include <linux/module.h>
-#include <linux/fdtable.h>
 #include <linux/uaccess.h>
 #include <linux/firmware.h>
 #include "amdgpu.h"
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_sched.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_sched.c
index 863b2a34b2d6..f9ff493c100e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_sched.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_sched.c
@@ -22,7 +22,6 @@
  * Authors: Andres Rodriguez <andresx7@gmail.com>
  */
 
-#include <linux/fdtable.h>
 #include <linux/file.h>
 #include <linux/pid.h>
 
-- 
2.39.2

