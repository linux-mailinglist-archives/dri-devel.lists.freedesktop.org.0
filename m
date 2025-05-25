Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 323E1AC3292
	for <lists+dri-devel@lfdr.de>; Sun, 25 May 2025 08:10:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 088F210E00B;
	Sun, 25 May 2025 06:10:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 519 seconds by postgrey-1.36 at gabe;
 Sun, 25 May 2025 06:10:05 UTC
Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDF4010E00B
 for <dri-devel@lists.freedesktop.org>; Sun, 25 May 2025 06:10:05 +0000 (UTC)
Received: from [192.168.2.107] (p5b13a30a.dip0.t-ipconnect.de [91.19.163.10])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: pmenzel)
 by mx.molgen.mpg.de (Postfix) with ESMTPSA id 685D661E64783;
 Sun, 25 May 2025 08:01:05 +0200 (CEST)
Message-ID: <c8a64686-f1a2-44f1-9d13-fd5b4f923e0f@molgen.mpg.de>
Date: Sun, 25 May 2025 08:01:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 LKML <linux-kernel@vger.kernel.org>
From: Paul Menzel <pmenzel@molgen.mpg.de>
Subject: MT8183: Only maximum resolution 1280x720?
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

Dear Linux folks,


On the older MT8183 device Lenovo IdeaPad Duet Chromebook, running 
ChromeOS with their Linux 5.10.x, connecting a 1920x1080 Dell monitor to 
a USB-C adapter using HDMI, only the resolution of 1280x720 is 
configured, although the adapter also support 1920x1080. It happens with 
all adapters, for example, LMP USB-C mini Dock [1].

I reported it to the Chromium OS issue tracker [1], and the last comment is:

> It seems the display pipeline for the internal display (DSI) has
> higher clock rate. Also, the resolution support depends on the
> refresh rate as well, so the claimed 2400x1080 might only work on
> lower refresh rate.
> 
> For the external display, the display modes are mostly rejected by
> the pre-defined max_clock_khz in mtk_dpi.c:
> https://elixir.bootlin.com/linux/v6.11.4/source/drivers/gpu/drm/mediatek/mtk_dpi.c#L940

Can you confirm this? The font rendering seems not so good in the lower 
resolution, and strangely, playing movies these seem to be rendered in 
higher resolution (or the monitor or hardware does a good job in 
up-scaling).


Kind regards,

Paul


[1]: https://lmp-adapter.com/product/lmp-usb-c-mini-dock/
[2]: https://issuetracker.google.com/issues/295666708
