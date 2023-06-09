Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A5B147292A0
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jun 2023 10:18:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D28D310E656;
	Fri,  9 Jun 2023 08:17:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B675510E115
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jun 2023 08:17:47 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3F1FC65488;
 Fri,  9 Jun 2023 08:17:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAB8CC433EF;
 Fri,  9 Jun 2023 08:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686298666;
 bh=5WxptCcuNZ6PFNUe4Ge7FNnGCCSO4/X7Wrbwlvx9cdE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=AC1W6TcxOH9LR868PISJ6SPkszmuIVupVwNGvaqBNaW7niqUZ3aOfT05mUp3PdDrQ
 dO9DEg+gf7MpwCKgBToiuexkKQRjLu+Fu6ENwpSqAAEWt64drf45/0n0qXIQBZpw2i
 2y/hJIiO4IQ5hqV/zP/wMKKP1xEvfm4MmW51b0Z4fhtUUv74MTdH7e/VPglfIBRyeR
 jBB/LQCK+YJ0jmhmkluz34l/a24UHC2Rx4UdGPun5yAhy/FmukQCNn3PvLEbsoO7Z4
 mdMp69GzJBFvlwIZp6dLmx64Lf9kz4W62fACGVMUgF0Khc8HLwIjIpPb9Z/PVKRFXP
 UoIZJc50bkNXw==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org
Subject: [RESEND 01/15] drm/xlnx/zynqmp_disp: Use correct kerneldoc formatting
 in zynqmp_disp
Date: Fri,  9 Jun 2023 09:17:04 +0100
Message-ID: <20230609081732.3842341-2-lee@kernel.org>
X-Mailer: git-send-email 2.41.0.162.gfafddb0af9-goog
In-Reply-To: <20230609081732.3842341-1-lee@kernel.org>
References: <20230609081732.3842341-1-lee@kernel.org>
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
Cc: Hyun Kwon <hyun.kwon@xilinx.com>, Michal Simek <michal.simek@xilinx.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/xlnx/zynqmp_disp.c:151: warning: Function parameter or member 'blend' not described in 'zynqmp_disp'
 drivers/gpu/drm/xlnx/zynqmp_disp.c:151: warning: Function parameter or member 'avbuf' not described in 'zynqmp_disp'
 drivers/gpu/drm/xlnx/zynqmp_disp.c:151: warning: Function parameter or member 'audio' not described in 'zynqmp_disp'

Cc: Hyun Kwon <hyun.kwon@xilinx.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Michal Simek <michal.simek@xilinx.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-arm-kernel@lists.infradead.org
Signed-off-by: Lee Jones <lee@kernel.org>
---
 drivers/gpu/drm/xlnx/zynqmp_disp.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
index 3b87eebddc979..63358f4898625 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
@@ -128,9 +128,9 @@ struct zynqmp_disp_layer {
  * struct zynqmp_disp - Display controller
  * @dev: Device structure
  * @dpsub: Display subsystem
- * @blend.base: Register I/O base address for the blender
- * @avbuf.base: Register I/O base address for the audio/video buffer manager
- * @audio.base: Registers I/O base address for the audio mixer
+ * @blend: .base: Register I/O base address for the blender
+ * @avbuf: .base: Register I/O base address for the audio/video buffer manager
+ * @audio: .base: Registers I/O base address for the audio mixer
  * @layers: Layers (planes)
  */
 struct zynqmp_disp {
-- 
2.41.0.162.gfafddb0af9-goog

