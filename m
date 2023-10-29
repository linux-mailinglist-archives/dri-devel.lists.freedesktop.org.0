Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88A457DADFA
	for <lists+dri-devel@lfdr.de>; Sun, 29 Oct 2023 20:46:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12B9110E19E;
	Sun, 29 Oct 2023 19:46:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6007810E192
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Oct 2023 19:46:12 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8AxZ+h+tj5lq5s1AA--.3547S3;
 Mon, 30 Oct 2023 03:46:07 +0800 (CST)
Received: from openarena.loongson.cn (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8AxXNx+tj5lKq02AA--.51878S2; 
 Mon, 30 Oct 2023 03:46:06 +0800 (CST)
From: Sui Jingfeng <suijingfeng@loongson.cn>
To: Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 0/8] drm/loongson: Submit a mini VBIOS support and a display
 bridge driver
Date: Mon, 30 Oct 2023 03:45:59 +0800
Message-Id: <20231029194607.379459-1-suijingfeng@loongson.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8AxXNx+tj5lKq02AA--.51878S2
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoW7WF1DCr4UJFW3Jw1kuryrKrX_yoW8tw45pF
 sxA34FkrWUJF12yrZxJFy8JFy5Aa4rWFZa9anrJ3sIg3srAa4UZr15AFW5JrZrZFy7Jry2
 qr97GF4UG3WI9wcCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
 sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
 0xBIdaVrnRJUUUvYb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
 IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
 e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
 0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
 Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I
 8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv67AK
 xVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2Ij64
 vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_Jrv_JF1lx2IqxVAqx4xG
 67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMI
 IYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E
 14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJV
 W8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07UNvtZU
 UUUU=
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Loongson boards using various external display bridges to extend output
display interface. To complete the support, we have to introduce VBIOS(
or DT/ACPI support) and display bridge drivers.

Sui Jingfeng (8):
  drm/loongson: Introduce a minimal support for Loongson VBIOS
  drm/loongson: Introduce a drm bridge driver for it66121 HDMI
    transmitter
  drm/loongson: Allow attach drm bridge driver by calling
    lsdc_output_init()
  drm/loongson: Started to attach display bridge driver for LS7A1000
  drm/loongson: Using vbios for the LS7A2000 output initialization
  drm/loongson: Clean up the output part of LS7A2000
  drm/loongson: Support to infer DC reversion from CPU's PRID value
  drm/loongson: Add support for the display subsystem in LS2K2000

 drivers/gpu/drm/loongson/Kconfig              |   1 +
 drivers/gpu/drm/loongson/Makefile             |   7 +-
 drivers/gpu/drm/loongson/ite_it66121.c        | 749 ++++++++++++++++++
 drivers/gpu/drm/loongson/ite_it66121.h        |  19 +
 drivers/gpu/drm/loongson/ite_it66121_regs.h   | 268 +++++++
 drivers/gpu/drm/loongson/loongson_device.c    |  50 ++
 drivers/gpu/drm/loongson/loongson_vbios.c     | 420 ++++++++++
 drivers/gpu/drm/loongson/loongson_vbios.h     |  59 ++
 drivers/gpu/drm/loongson/lsdc_drv.c           |   4 +
 drivers/gpu/drm/loongson/lsdc_drv.h           |  27 +-
 drivers/gpu/drm/loongson/lsdc_output.c        | 643 +++++++++++++++
 drivers/gpu/drm/loongson/lsdc_output.h        |  57 +-
 drivers/gpu/drm/loongson/lsdc_output_2k2000.c |  84 ++
 drivers/gpu/drm/loongson/lsdc_output_7a1000.c | 144 ++--
 drivers/gpu/drm/loongson/lsdc_output_7a2000.c | 575 +++-----------
 drivers/gpu/drm/loongson/lsdc_probe.c         |  35 +
 drivers/gpu/drm/loongson/lsdc_probe.h         |   2 +
 17 files changed, 2560 insertions(+), 584 deletions(-)
 create mode 100644 drivers/gpu/drm/loongson/ite_it66121.c
 create mode 100644 drivers/gpu/drm/loongson/ite_it66121.h
 create mode 100644 drivers/gpu/drm/loongson/ite_it66121_regs.h
 create mode 100644 drivers/gpu/drm/loongson/loongson_vbios.c
 create mode 100644 drivers/gpu/drm/loongson/loongson_vbios.h
 create mode 100644 drivers/gpu/drm/loongson/lsdc_output.c
 create mode 100644 drivers/gpu/drm/loongson/lsdc_output_2k2000.c

-- 
2.34.1

