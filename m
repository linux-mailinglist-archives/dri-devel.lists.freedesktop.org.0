Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 757571B1F2F
	for <lists+dri-devel@lfdr.de>; Tue, 21 Apr 2020 08:50:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 103276E8C0;
	Tue, 21 Apr 2020 06:49:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-blr-02.qualcomm.com (alexa-out-blr-02.qualcomm.com
 [103.229.18.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E3786E878;
 Tue, 21 Apr 2020 04:55:11 +0000 (UTC)
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
 by alexa-out-blr-02.qualcomm.com with ESMTP/TLS/AES256-SHA;
 21 Apr 2020 10:25:11 +0530
Received: from harigovi-linux.qualcomm.com ([10.204.66.157])
 by ironmsg01-blr.qualcomm.com with ESMTP; 21 Apr 2020 10:25:10 +0530
Received: by harigovi-linux.qualcomm.com (Postfix, from userid 2332695)
 id D706A2A55; Tue, 21 Apr 2020 10:25:09 +0530 (IST)
From: Harigovindan P <harigovi@codeaurora.org>
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: [PATCH v11 0/2] Add support for rm69299 Visionox panel driver and add
 devicetree bindings for visionox panel
Date: Tue, 21 Apr 2020 10:25:06 +0530
Message-Id: <20200421045508.21137-1-harigovi@codeaurora.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 21 Apr 2020 06:48:39 +0000
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
Cc: sean@poorly.run, seanpaul@chromium.org,
 Harigovindan P <harigovi@codeaurora.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Adding support for visionox rm69299 panel driver and adding bindings for the same panel.
https://patchwork.kernel.org/patch/11461943/ has already been added to drm-misc-next.

Harigovindan P (2):
  drm/panel: add support for rm69299 visionox panel driver
  dt-bindings: documenting compatible string vendor "visionox"

 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 drivers/gpu/drm/panel/Kconfig                 |   8 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 .../gpu/drm/panel/panel-visionox-rm69299.c    | 304 ++++++++++++++++++
 4 files changed, 315 insertions(+)
 create mode 100644 drivers/gpu/drm/panel/panel-visionox-rm69299.c

-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
