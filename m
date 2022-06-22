Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C3BEC55439A
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 09:37:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6328113BE8;
	Wed, 22 Jun 2022 07:37:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A15EC113BE7
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 07:37:18 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 09CD55C00E0;
 Wed, 22 Jun 2022 03:37:18 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Wed, 22 Jun 2022 03:37:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1655883438; x=
 1655969838; bh=xC3T80hMMa/KAtkEhkckBxtjK8g6J2RttpW8iWfN1EU=; b=N
 rjEVKcSFbDeeL2+mjqiRXs8dxZ8VPagAavHFkXzmAqs/lqE9hguC62MI8KYE1zKe
 EjHjAZipIiD73lBLNcVVkfHz8E/DXfGpi78eWb7qXP4bSbsiwOA73GO/hH+2a2YV
 xzeK8HSvbQKqqR6qxkch7Qwjtn7XkkN2/4YlGr6kFVL+t7p31FhWBKWyjvn3Udl4
 0MIM5Wpn+wAPnGm9YRPxdWSDWAlAESGnJCaRqF4/ojoNgTi53s76RBrKTPYnOQjO
 jDZShdjQ4wuv4AIbASKuM8yGmNWnQ8N3hOBfDptN8J/D1gVlv7Hm8y/wIc/am3+k
 VwGozVqDb9zYvT+D/jKAQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1655883438; x=
 1655969838; bh=xC3T80hMMa/KAtkEhkckBxtjK8g6J2RttpW8iWfN1EU=; b=b
 DKvd43wNUKyEB9b7ULS3DZEoZJ76jrw10egcKbVjt5MxORz6qojl+oOOUlgS0RUQ
 tAoMwlq3+VrkcxEJEWvkQRrKX9qTnIgdXAYTSmo+junYjAsLUBFGZzRX1u90c1Qr
 PZqB84guDmYsQeqThTIVl6B/IE9GWsNB14iuMnnbOLh+lo0yOEcrelwjdSiigbmN
 nWZ6EakEQkHuFqYK/SQiddLueGKRb3lX9TdV9jy0pujJC2/lWSGlC/YkVq1wM11l
 WVxvSYahhzEXtDoM9gfltVbOR7u/Vt4ij8w6PwWZ1gBmJc3YDAoS12wigEMB8Dau
 4a83Xot3lJoLIPFqwWiMQ==
X-ME-Sender: <xms:rcayYgvNYCFUjm6CUu-eKu6GU3hf-7_Jc1TqSNwFLbbhRSWsmXamJg>
 <xme:rcayYtdLiQZEmw_PIW3Pootsajx3DqBdN4luUA4RUL9vuq_LZ4TmxJXD_qnx8Xwks
 YL1FBvTFwSUUXalNpU>
X-ME-Received: <xmr:rcayYrzMLHbQoZ060U-mjDqcyxR_j4o7TXZCk7REJ1jORfe97biPHrfkYRbS26nby7nSt71INQ55AntiA25_aIjs53y1o21GX4Z4xFA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudefgedguddvfecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgjfhggtgfgse
 htkeertdertdejnecuhfhrohhmpeforgigihhmvgcutfhiphgrrhguuceomhgrgihimhgv
 segtvghrnhhordhtvggthheqnecuggftrfgrthhtvghrnhepueeigefghfffffeifeehud
 eiuedvteegueefffevgfetvdffheehkeffvedufeeinecuvehluhhsthgvrhfuihiivgep
 tdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:rcayYjOAN5uBm2KtQiw2c3WztAK0JdZ9Wu4I0AbPEghfER5x6mgUoQ>
 <xmx:rcayYg8sF5myABSdKgMbY-09QX0r4VcIhy_2QBd45FNge4Ri6BQe9Q>
 <xmx:rcayYrXYLSF02Vi5zAMNdGOiwWE57HukC6Y0QUGW4Ntp2PV22oosRQ>
 <xmx:rsayYrYTSSwSl0FaHrMyLDjhKl-KsJ7tavSCRJRcll-sXED_GwHnWg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Jun 2022 03:37:16 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: mripard@kernel.org,
	jernej.skrabec@gmail.com,
	wens@csie.org
Subject: Re: (subset) [PATCH v2] drm/sun4i: Add DMA mask and segment size
Date: Wed, 22 Jun 2022 09:37:13 +0200
Message-Id: <165588343010.17134.16657769855274724616.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220620181333.650301-1-jernej.skrabec@gmail.com>
References: <20220620181333.650301-1-jernej.skrabec@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
Cc: samuel@sholland.org, airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Maxime Ripard <maxime@cerno.tech>,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 20 Jun 2022 20:13:33 +0200, Jernej Skrabec wrote:
> Kernel occasionally complains that there is mismatch in segment size
> when trying to render HW decoded videos and rendering them directly with
> sun4i DRM driver. Following message can be observed on H6 SoC:
> 
> [  184.298308] ------------[ cut here ]------------
> [  184.298326] DMA-API: sun4i-drm display-engine: mapping sg segment longer than device claims to support [len=6144000] [max=65536]
> [  184.298364] WARNING: CPU: 1 PID: 382 at kernel/dma/debug.c:1162 debug_dma_map_sg+0x2b0/0x350
> [  184.322997] CPU: 1 PID: 382 Comm: ffmpeg Not tainted 5.19.0-rc1+ #1331
> [  184.329533] Hardware name: Tanix TX6 (DT)
> [  184.333544] pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [  184.340512] pc : debug_dma_map_sg+0x2b0/0x350
> [  184.344882] lr : debug_dma_map_sg+0x2b0/0x350
> [  184.349250] sp : ffff800009f33a50
> [  184.352567] x29: ffff800009f33a50 x28: 0000000000010000 x27: ffff000001b86c00
> [  184.359725] x26: ffffffffffffffff x25: ffff000005d8cc80 x24: 0000000000000000
> [  184.366879] x23: ffff80000939ab18 x22: 0000000000000001 x21: 0000000000000001
> [  184.374031] x20: 0000000000000000 x19: ffff0000018a7410 x18: ffffffffffffffff
> [  184.381186] x17: 0000000000000000 x16: 0000000000000000 x15: ffffffffffffffff
> [  184.388338] x14: 0000000000000001 x13: ffff800009534e86 x12: 6f70707573206f74
> [  184.395493] x11: 20736d69616c6320 x10: 000000000000000a x9 : 0000000000010000
> [  184.402647] x8 : ffff8000093b6d40 x7 : ffff800009f33850 x6 : 000000000000000c
> [  184.409800] x5 : ffff0000bf997940 x4 : 0000000000000000 x3 : 0000000000000027
> [  184.416953] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff000003960e80
> [  184.424106] Call trace:
> [  184.426556]  debug_dma_map_sg+0x2b0/0x350
> [  184.430580]  __dma_map_sg_attrs+0xa0/0x110
> [  184.434687]  dma_map_sgtable+0x28/0x4c
> [  184.438447]  vb2_dc_dmabuf_ops_map+0x60/0xcc
> [  184.442729]  __map_dma_buf+0x2c/0xd4
> [  184.446321]  dma_buf_map_attachment+0xa0/0x130
> [  184.450777]  drm_gem_prime_import_dev+0x7c/0x18c
> [  184.455410]  drm_gem_prime_fd_to_handle+0x1b8/0x214
> [  184.460300]  drm_prime_fd_to_handle_ioctl+0x2c/0x40
> [  184.465190]  drm_ioctl_kernel+0xc4/0x174
> [  184.469123]  drm_ioctl+0x204/0x420
> [  184.472534]  __arm64_sys_ioctl+0xac/0xf0
> [  184.476474]  invoke_syscall+0x48/0x114
> [  184.480240]  el0_svc_common.constprop.0+0x44/0xec
> [  184.484956]  do_el0_svc+0x2c/0xc0
> [  184.488283]  el0_svc+0x2c/0x84
> [  184.491354]  el0t_64_sync_handler+0x11c/0x150
> [  184.495723]  el0t_64_sync+0x18c/0x190
> [  184.499397] ---[ end trace 0000000000000000 ]---
> 
> [...]

Applied to drm/drm-misc (drm-misc-fixes).

Thanks!
Maxime
