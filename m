Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1504D76FF14
	for <lists+dri-devel@lfdr.de>; Fri,  4 Aug 2023 12:58:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BA5310E02A;
	Fri,  4 Aug 2023 10:57:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8635910E02A
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Aug 2023 10:57:55 +0000 (UTC)
Received: from [127.0.1.1] (91-154-35-171.elisa-laajakaista.fi [91.154.35.171])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id EC7642E4;
 Fri,  4 Aug 2023 12:56:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1691146609;
 bh=2xH8BFLdtXeXvTOfhye94ba30yDscr1R4VyzuaQczrU=;
 h=From:Subject:Date:To:Cc:From;
 b=wDMyYg3US9vsw2CQk/7cRHCr5amz8SOUx1LcT10DGKx2bXLqc1OinUNMU+hPioxbx
 BmY26m6B78JsXS/8Ua4vRyL9lI8fJWU9DwOYGRNwdGb6AUE2eHHVxjRFTXml4fubwo
 UU4fA2j9inEfnyDlFzDlC0UEdvaovTuentJEUdWY=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH 0/2] drm: Fix errors about uninitialized variables
Date: Fri, 04 Aug 2023 13:57:38 +0300
Message-Id: <20230804-uninit-fixes-v1-0-a60772c04db5@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKLZzGQC/x3LTQqAIBBA4avIrBvwJ8K6SrQQHWs2FloRhHdPW
 n483guFMlOBSbyQ6ebCe2pQnQC/ubQScmgGLbWRVvZ4JU58YuSHCipr46jDIJ030JYj0x/aMS+
 1fmoO9KNeAAAA
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=605;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=2xH8BFLdtXeXvTOfhye94ba30yDscr1R4VyzuaQczrU=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBkzNmwUYgCBLt9WfYfPQrKEScAsg6zd2GwWS6Ms
 sxUS/QtfzmJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZMzZsAAKCRD6PaqMvJYe
 9cL0D/9cQZr9FCZmkYpHu7h2D+yQnbuUK6gPqfbDMVhxF2IVEisTZsiObJ/fzA82YnNlZiZ4grl
 YQBdEdZxWZtYEDNAeBumtM/M3ADUCwEUT2VqgCdSe4PUJ/H2M/mBPiz4FhXWGf/bdHYZiW3eGni
 rhKiPZvshAOdFWawbxjJ6o6NMS1CY9xAuyTvMrWUCoBKp+n2huCIwtRJpTajQ7G0netPHnN7jAI
 wJbiApXemetlRHWos2V75Aahx7hfCLTp/tJprDCZwuGYQkNiXt1VBh4q91id31vm8+Mp2KA+Q7A
 zDIq3kX29vVkX3JNPWbVdvmL4OqQ++YK3I2P2OUMIjXD976PMgRecdS3VTxL/xfjrcW0BP1/4QH
 wHE6c8QSL6zyy6rf6ZyDAxoBVPTKQ5rFh4FF5U7MO/UH0Oy92PsgtXeR9fV26BlYcaZcDd+OP95
 vl0teMNDkxQQj2SVJ4RN1iit70klpEHe80xJ10g4O8LYD/wogRBOfGhr0SjwNQ+1bxG9KpSB9iO
 xFAtj/uCyDOTst4EGTR2txOD7A2wkblvw6rcD9k+5f9RQthX6B/FTqslv6HlSSj8S5Jllko4b88
 T7aTde3bgInnsJ+K/ENc4Sg25trJ7hRq25F9k8u7uxkWAVsRZmc4/dMGbeCG01lvRxSoddvy9uA
 R7fTBXxSa+dxdTw==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
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
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix two cases where smatch reports a use of an uninitialized variable.

 Tomi

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
Tomi Valkeinen (2):
      drm/drm_file: fix use of uninitialized variable
      drm/framebuffer: Fix use of uninitialized variable

 drivers/gpu/drm/drm_file.c        | 2 +-
 drivers/gpu/drm/drm_framebuffer.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
---
base-commit: b0e9267d4ccce9be9217337f4bc364ca24cf7f73
change-id: 20230804-uninit-fixes-188f92d60ac3

Best regards,
-- 
Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

