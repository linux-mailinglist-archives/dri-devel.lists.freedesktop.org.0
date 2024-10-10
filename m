Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EEE0998696
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2024 14:49:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 836A410E008;
	Thu, 10 Oct 2024 12:49:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="oz1mEWob";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0529210E008
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2024 12:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1728564560;
 bh=peJCajT9JrXEyFW7QG0r6H6LQ1MBhLze2K+6buEL3xw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=oz1mEWob0bLo3tFj/UZ1xluxr6hYvEq4h1UspMdA6+l+A/m1HNWUQmfOSVlR6ttGy
 J3KCM9lroR2SFR+3TRZIFhBXmr9xEU+BNp7FZCwQQcI+dsB5AlPRSzna/Ke6ZrOZGT
 N1nSislJSTMtsj0d9UjBkvkWaaIdXhgSzWfQ2UGfmuWe6TWU0cmeJ3w7PI9K6JoOEh
 AqYzvkgywv4D4j1thdPHBA2OL8UlI1H0iXXsZGdhNxdxGuA2wGqRJL/l+Eaw4uCGTe
 U05rr0cvsUZk/TUARKVnMyn4W8DqOOwQ72WkeMgJ7KGAmAf3YVDlU3Yv37WOjhKHF9
 mN+/9pAZy5EFA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 7C6F217E35EA;
 Thu, 10 Oct 2024 14:49:19 +0200 (CEST)
Message-ID: <93234ce4-e831-41aa-9485-53997b5cacaf@collabora.com>
Date: Thu, 10 Oct 2024 14:49:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 04/10] media: platform: mediatek: add isp_7x cam-raw
 unit
To: Shu-hsiang Yang <Shu-hsiang.Yang@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian Konig <christian.koenig@amd.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, yaya.chang@mediatek.com,
 teddy.chen@mediatek.com, hidenorik@chromium.org, yunkec@chromium.org,
 shun-yi.wang@mediatek.com
References: <20241009111551.27052-1-Shu-hsiang.Yang@mediatek.com>
 <20241009111551.27052-5-Shu-hsiang.Yang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241009111551.27052-5-Shu-hsiang.Yang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

Il 09/10/24 13:15, Shu-hsiang Yang ha scritto:
> Introduces the ISP pipeline driver for the MediaTek ISP raw and yuv
> modules. Key functionalities include data processing, V4L2 integration,
> resource management, debug support, and various control operations.
> Additionally, IRQ handling, platform device management, and MediaTek
> ISP DMA format support are also included.
> 
> Signed-off-by: Shu-hsiang Yang <Shu-hsiang.Yang@mediatek.com>
> ---
>   .../mediatek/isp/isp_7x/camsys/mtk_cam-raw.c  | 5359 +++++++++++++++++
>   .../mediatek/isp/isp_7x/camsys/mtk_cam-raw.h  |  325 +
>   .../isp/isp_7x/camsys/mtk_cam-raw_debug.c     |  403 ++
>   .../isp/isp_7x/camsys/mtk_cam-raw_debug.h     |   39 +
>   .../isp_7x/camsys/mtk_camera-v4l2-controls.h  |   65 +
>   5 files changed, 6191 insertions(+)
>   create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-raw.c
>   create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-raw.h
>   create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-raw_debug.c
>   create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-raw_debug.h
>   create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_camera-v4l2-controls.h
> 
> diff --git a/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-raw.c b/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-raw.c
> new file mode 100644
> index 000000000000..c025f53c952d
> --- /dev/null
> +++ b/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-raw.c
> @@ -0,0 +1,5359 @@
> +// SPDX-License-Identifier: GPL-2.0
> +//
> +// Copyright (c) 2022 MediaTek Inc.
> +
> +#include <linux/clk.h>
> +#include <linux/interrupt.h>
> +#include <linux/iopoll.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_platform.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/vmalloc.h>
> +#include <linux/videodev2.h>
> +#include <linux/suspend.h>
> +#include <linux/rtc.h>
> +
> +#include <media/v4l2-device.h>
> +#include <media/v4l2-event.h>
> +#include <media/v4l2-ioctl.h>
> +#include <media/v4l2-subdev.h>
> +
> +#include <soc/mediatek/smi.h>
> +
> +#include "mtk_cam.h"
> +#include "mtk_cam-feature.h"
> +#include "mtk_cam-raw.h"
> +
> +#include "mtk_cam-regs-mt8188.h"
> +
> +#include "mtk_cam-video.h"
> +#include "mtk_cam-seninf-if.h"
> +#include "mtk_camera-v4l2-controls.h"
> +
> +#include "mtk_cam-dmadbg.h"
> +#include "mtk_cam-raw_debug.h"
> +
> +static unsigned int debug_raw;
> +module_param(debug_raw, uint, 0644);
> +MODULE_PARM_DESC(debug_raw, "activates debug info");
> +
> +static int debug_raw_num = -1;
> +module_param(debug_raw_num, int, 0644);
> +MODULE_PARM_DESC(debug_raw_num, "debug: num of used raw devices");
> +
> +static int debug_pixel_mode = -1;
> +module_param(debug_pixel_mode, int, 0644);
> +MODULE_PARM_DESC(debug_pixel_mode, "debug: pixel mode");
> +
> +static int debug_clk_idx = -1;
> +module_param(debug_clk_idx, int, 0644);
> +MODULE_PARM_DESC(debug_clk_idx, "debug: clk idx");
> +
> +static int debug_dump_fbc;
> +module_param(debug_dump_fbc, int, 0644);
> +MODULE_PARM_DESC(debug_dump_fbc, "debug: dump fbc");
> +
In addition to the first review that I gave you on patch [02/10]: please drop
all those module parameters. If you want debug switches, use debugfs instead.

Regards,
Angelo
