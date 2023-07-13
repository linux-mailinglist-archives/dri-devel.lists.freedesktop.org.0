Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD493752AE0
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 21:27:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B339510E775;
	Thu, 13 Jul 2023 19:27:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D852910E775
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 19:27:11 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 59EF661B3C;
 Thu, 13 Jul 2023 19:27:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 665A6C433C8;
 Thu, 13 Jul 2023 19:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1689276429;
 bh=D+OEaUWIThFo6Y+wPON7lvU8a9EaVxkzBStXyg9idHY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cjZnBGryNjyq2+WPsBVvobxZ6GGKMV/bpFqhHQd1qffzIJBoC9ztdoJxYL9iNotib
 EbBNOtSfDftwdrxjzNHzodTcRR4DCF9kIV9dCfVIeRbhZUGbEoU5Oy1sQ1yGLfPD14
 kl8jJuDHtqSAVJIeiVH0902x23QMX1HcPAVngMGs=
Date: Thu, 13 Jul 2023 21:27:07 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Andrew Davis <afd@ti.com>
Subject: Re: [PATCH v3] misc: sram: Add DMA-BUF Heap exporting of SRAM areas
Message-ID: <2023071344-skinhead-send-33f7@gregkh>
References: <20230713191316.116019-1-afd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230713191316.116019-1-afd@ti.com>
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
Cc: Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 John Stultz <jstultz@google.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 13, 2023 at 02:13:16PM -0500, Andrew Davis wrote:
> +int sram_add_dma_heap(struct sram_dev *sram,
> +		      struct sram_reserve *block,
> +		      phys_addr_t start,
> +		      struct sram_partition *part)
> +{
> +	struct sram_dma_heap *sram_dma_heap;
> +	struct dma_heap_export_info exp_info;
> +
> +	dev_info(sram->dev, "Exporting SRAM Heap '%s'\n", block->label);

When drivers are working properly, they are quiet.

thanks,

greg k-h
