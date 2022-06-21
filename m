Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2CEB5529AF
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jun 2022 05:17:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5CBC10E363;
	Tue, 21 Jun 2022 03:17:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0655A10E363
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jun 2022 03:17:24 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id EF4D53200681;
 Mon, 20 Jun 2022 23:17:20 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Mon, 20 Jun 2022 23:17:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 cc:cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1655781440; x=
 1655867840; bh=Sfk1SXZ7F6XnwAc31bmXv51aiOv48V99TnEspvYhC8U=; b=l
 Mz8i+xJS86NW82yt2y9Yv6ilXg+Swd89w7B8zkfeePV03MV9vCTG7c4Oz4Nk9dJI
 25P5uYWPGd+L7KRIKWHGXPIbMDe4jIhqgH8WGSkMvAqWiAZgdiN0AFQ/gg77B15J
 fBzkNwFczL1vFeio+dv6IypmXZ0bToB0m18UWDqb/pTiq2eF7N/3ivnpdHM2k+VI
 Vzw23NG3JIaEDIiFCGDQeNIdYFnb0glAVy8pxSJtYAVceXUYFZr0zt8jT4ug8V8O
 93IK0eJzMbd7OvveSxL4gFEt6VgkneDoa+hgiNg7sav3zK1RTmFPyLSVFPs0HbmU
 Pv7rwMgQctInA1SETXh6g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1655781440; x=
 1655867840; bh=Sfk1SXZ7F6XnwAc31bmXv51aiOv48V99TnEspvYhC8U=; b=F
 9stTVIrj2tX8ZHEb/m5IFcOdApbiwUShR4qu8qDwiZeRMxgJ1OSJHgBbJmVHAzGy
 zpCqT5iqDdx62DfXfrEMhykAga0Hx/6i59IGMtZRvqR+wHjXJHsRCCgK5cqUu6an
 GMdBMu5934N+JUpSveAK/bABVJcorfcAFIgbc8dlGrTWa/AtolP9J+ypbpMaAtVQ
 L/Z/L8Fq7ytBJOurtZLxXD7nH1f7GH3ByIs35pzPeyw249PWmaFEEzcPHxCNJN/o
 f7dW/oh2hI5IxZsajcnOYXO7yTDIoe7aOb5scDbo91qpkGfnsGQZfy9PSv/uaqrV
 PGO/ty7j0g7qp7oNb4HAw==
X-ME-Sender: <xms:QDixYih5qPPaBmrb--Uca4Yll0jCeDybnx-Ej4yMhMqD4if8vGGCsw>
 <xme:QDixYjCia8TmQijbO7Fi61wE-QKB42YiYUKOp4gVszkhibawYKyk_Eki5d9Qr8lGd
 uQru4VBZ14UikHArg>
X-ME-Received: <xmr:QDixYqGGK3EDt0BB_qliiqJm9In4sukYR56dzOWGJk727sKHI4w4gk12I3JBN5OmIWiLD9iA4QOSa6fo7407RITEktTxrys2qULN7_Xnv3eSlGVZLWIuuqZAHw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudefvddgieeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepuffvvehfhffkffgfgggjtgfgsehtjeertddtfeejnecuhfhrohhmpefurghm
 uhgvlhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenuc
 ggtffrrghtthgvrhhnpefftdevkedvgeekueeutefgteffieelvedukeeuhfehledvhfei
 tdehudfhudehhfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
 hrohhmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:QDixYrRkzEkp4dPq8eV37_XEoq9wrFADw6WhdUAin6ESA6qkhcYdfg>
 <xmx:QDixYvxctDhWIKI73HYMWRd75jz8tMzKeeCo0YuEi4FIr3-i3EjO-w>
 <xmx:QDixYp6bjPGnQP7jbh1Jb_YLAUnkrWu8A1ARccOoOy-IozorviX0iw>
 <xmx:QDixYmwYwib7ccxYXV_YpPNh7KfGcgOkLXEWyPIzP5PVtWqBlm9w4Q>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 20 Jun 2022 23:17:19 -0400 (EDT)
Subject: Re: [PATCH v2] drm/sun4i: Add DMA mask and segment size
To: Jernej Skrabec <jernej.skrabec@gmail.com>, mripard@kernel.org,
 wens@csie.org
References: <20220620181333.650301-1-jernej.skrabec@gmail.com>
From: Samuel Holland <samuel@sholland.org>
Message-ID: <4c0c9c77-260a-9955-46bd-1740cdf8c22c@sholland.org>
Date: Mon, 20 Jun 2022 22:17:19 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20220620181333.650301-1-jernej.skrabec@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 6/20/22 1:13 PM, Jernej Skrabec wrote:
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
> Fix that by setting DMA mask and segment size.
> 
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Reviewed-by: Samuel Holland <samuel@sholland.org>
