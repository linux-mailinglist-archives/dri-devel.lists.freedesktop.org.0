Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD72B7A459C
	for <lists+dri-devel@lfdr.de>; Mon, 18 Sep 2023 11:13:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D929610E232;
	Mon, 18 Sep 2023 09:13:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EF3810E232
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Sep 2023 09:13:36 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 150D7B80C02;
 Mon, 18 Sep 2023 09:13:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCA33C433C9;
 Mon, 18 Sep 2023 09:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1695028413;
 bh=lK2kx7GPrJAjrDexWAuQkKEQ9GbU6QhgtAq8zq9Ines=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=WqzYqPI9jEmU1cKZvlV69MehXk/dP22UXckVvQNKna2Ysj4Lr43B6dLuq0J6k7Z7d
 cjQ6c/glne+0xzpzpWyfDK+wl7pcmd0HivwuDsoCK3D1N9q+JUk3js8TByNbOfNPcV
 v1rsFwR5brA97Iua51XDcfXCh1O7JbH5kfewIS6+MmHzpeCldlGjp5vnLODJLhIr1V
 eGoEWSv9aE2p51f/5bYgd5GcnlcsP5gyg7BBpAJRLUhgAwBPIjbAvXEunVRBvprXFh
 ZdS4HMNgvjViRaMK1hBDntlTbl5TfN2iXlN7Ro2TpNOPTzj6Cc3eOhdF094eYSv4hl
 59PC0Ty7rd2Mg==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 05/14] accel/habanalabs: fix inline doc typos
Date: Mon, 18 Sep 2023 12:13:12 +0300
Message-Id: <20230918091321.855943-5-ogabbay@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230918091321.855943-1-ogabbay@kernel.org>
References: <20230918091321.855943-1-ogabbay@kernel.org>
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
Cc: Dafna Hirschfeld <dhirschfeld@habana.ai>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dafna Hirschfeld <dhirschfeld@habana.ai>

Fix two typos

Signed-off-by: Dafna Hirschfeld <dhirschfeld@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/common/device.c     | 2 +-
 drivers/accel/habanalabs/common/habanalabs.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/accel/habanalabs/common/device.c b/drivers/accel/habanalabs/common/device.c
index 2d12c197e165..bf1b53f7fce9 100644
--- a/drivers/accel/habanalabs/common/device.c
+++ b/drivers/accel/habanalabs/common/device.c
@@ -639,7 +639,7 @@ static void device_release_func(struct device *dev)
  * @hdev: pointer to habanalabs device structure
  * @class: pointer to the class object of the device
  * @minor: minor number of the specific device
- * @fpos: file operations to install for this device
+ * @fops: file operations to install for this device
  * @name: name of the device as it will appear in the filesystem
  * @cdev: pointer to the char device object that will be initialized
  * @dev: pointer to the device object that will be initialized
diff --git a/drivers/accel/habanalabs/common/habanalabs.h b/drivers/accel/habanalabs/common/habanalabs.h
index 8b5fd2b92676..f8c597903cac 100644
--- a/drivers/accel/habanalabs/common/habanalabs.h
+++ b/drivers/accel/habanalabs/common/habanalabs.h
@@ -2261,7 +2261,7 @@ struct hl_notifier_event {
 /**
  * struct hl_fpriv - process information stored in FD private data.
  * @hdev: habanalabs device structure.
- * @filp: pointer to the DRM file private data structure.
+ * @file_priv: pointer to the DRM file private data structure.
  * @taskpid: current process ID.
  * @ctx: current executing context. TODO: remove for multiple ctx per process
  * @ctx_mgr: context manager to handle multiple context for this FD.
-- 
2.34.1

