Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D418557FF35
	for <lists+dri-devel@lfdr.de>; Mon, 25 Jul 2022 14:46:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C454A8BA76;
	Mon, 25 Jul 2022 12:46:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41E8EAC856
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jul 2022 12:46:21 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 73FD7B80E7E;
 Mon, 25 Jul 2022 12:46:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67C49C341C6;
 Mon, 25 Jul 2022 12:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1658753176;
 bh=2MPE6TEDK4JnTbJUnjvf9SyF00jGOhx4NmrdtmiQ+Nc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QLyMMpckxebM7all/WIvnpW/lPJSouET0uAdYYLcoI0zs6kzYky6LNiSArprfaKya
 EUBDnLJWITtxEJnhxjfZQSjKWy2h6Rw0ac0fsYZXQUkDpDFAfgLvi/K7FfoZT86uj/
 6WONLaht6wzyG5AU2IBeDSKLJutgl5dqACpvCGIk=
Date: Mon, 25 Jul 2022 14:46:11 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
Subject: Re: [PATCH v2 2/5] soc: visconti: Add Toshiba Visconti image
 processing accelerator common source
Message-ID: <Yt6Qk6jdAjDVSBh/@kroah.com>
References: <20220722082858.17880-1-yuji2.ishikawa@toshiba.co.jp>
 <20220722082858.17880-3-yuji2.ishikawa@toshiba.co.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220722082858.17880-3-yuji2.ishikawa@toshiba.co.jp>
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
Cc: linaro-mm-sig@lists.linaro.org, Jonathan Corbet <corbet@lwn.net>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Sumit Semwal <sumit.semwal@linaro.org>, Hans Verkuil <hverkuil@xs4all.nl>,
 Rob Herring <robh+dt@kernel.org>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 22, 2022 at 05:28:55PM +0900, Yuji Ishikawa wrote:
> This commit adds common definitions shared among image processing accelerator drivers
> for Toshiba Visconti SoCs.

Please wrap your changelog text lines properly at 72 columns.

And you need to provide a lot more information here as to what this is,
it's not enough to be able to properly review this with just a single
sentence.

> 
> Signed-off-by: Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
> Reviewed-by: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
> ---
> v1 -> v2:
>   - applied checkpatch.pl --strict
> ---
>  drivers/soc/Kconfig               |  1 +
>  drivers/soc/Makefile              |  1 +
>  drivers/soc/visconti/Kconfig      |  1 +
>  drivers/soc/visconti/Makefile     |  6 +++
>  drivers/soc/visconti/ipa_common.c | 55 +++++++++++++++++++
>  drivers/soc/visconti/ipa_common.h | 18 +++++++
>  drivers/soc/visconti/uapi/ipa.h   | 90 +++++++++++++++++++++++++++++++
>  7 files changed, 172 insertions(+)
>  create mode 100644 drivers/soc/visconti/Kconfig
>  create mode 100644 drivers/soc/visconti/Makefile
>  create mode 100644 drivers/soc/visconti/ipa_common.c
>  create mode 100644 drivers/soc/visconti/ipa_common.h
>  create mode 100644 drivers/soc/visconti/uapi/ipa.h
> 
> diff --git a/drivers/soc/Kconfig b/drivers/soc/Kconfig
> index e8a30c4c5..c99139aa8 100644
> --- a/drivers/soc/Kconfig
> +++ b/drivers/soc/Kconfig
> @@ -22,6 +22,7 @@ source "drivers/soc/tegra/Kconfig"
>  source "drivers/soc/ti/Kconfig"
>  source "drivers/soc/ux500/Kconfig"
>  source "drivers/soc/versatile/Kconfig"
> +source "drivers/soc/visconti/Kconfig"
>  source "drivers/soc/xilinx/Kconfig"
>  
>  endmenu
> diff --git a/drivers/soc/Makefile b/drivers/soc/Makefile
> index a05e9fbcd..455b993c2 100644
> --- a/drivers/soc/Makefile
> +++ b/drivers/soc/Makefile
> @@ -28,4 +28,5 @@ obj-$(CONFIG_ARCH_TEGRA)	+= tegra/
>  obj-y				+= ti/
>  obj-$(CONFIG_ARCH_U8500)	+= ux500/
>  obj-$(CONFIG_PLAT_VERSATILE)	+= versatile/
> +obj-$(CONFIG_ARCH_VISCONTI)	+= visconti/
>  obj-y				+= xilinx/
> diff --git a/drivers/soc/visconti/Kconfig b/drivers/soc/visconti/Kconfig
> new file mode 100644
> index 000000000..8b1378917
> --- /dev/null
> +++ b/drivers/soc/visconti/Kconfig
> @@ -0,0 +1 @@
> +
> diff --git a/drivers/soc/visconti/Makefile b/drivers/soc/visconti/Makefile
> new file mode 100644
> index 000000000..8d710da08
> --- /dev/null
> +++ b/drivers/soc/visconti/Makefile
> @@ -0,0 +1,6 @@
> +# SPDX-License-Identifier: GPL-2.0
> +#
> +# Makefile for the Visconti specific device drivers.
> +#
> +
> +obj-y += ipa_common.o
> diff --git a/drivers/soc/visconti/ipa_common.c b/drivers/soc/visconti/ipa_common.c
> new file mode 100644
> index 000000000..6345f33c5
> --- /dev/null
> +++ b/drivers/soc/visconti/ipa_common.c
> @@ -0,0 +1,55 @@
> +// SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause

Why is this dual-licensed?  I have to ask, and also, have to see some
sort of justification as to why this is needed.  Doing dual-licensed
kernel code is tough and a pain and we need to know that you, and your
lawyers, understand the issues involved here.


> +/* Toshiba Visconti Image Processing Accelerator Support
> + *
> + * (C) Copyright 2022 TOSHIBA CORPORATION
> + * (C) Copyright 2022 Toshiba Electronic Devices & Storage Corporation
> + */
> +
> +#include "ipa_common.h"
> +
> +int ipa_attach_dmabuf(struct device *dev, int fd, struct dma_buf_attachment **a,
> +		      struct sg_table **s, dma_addr_t *addr, enum dma_data_direction dma_dir)
> +{
> +	struct dma_buf_attachment *attachment;
> +	struct dma_buf *dmabuf;
> +	struct sg_table *sgt;
> +	int ret;
> +
> +	dmabuf = dma_buf_get(fd);
> +	if (IS_ERR(dmabuf)) {
> +		dev_err(dev, "Invalid dmabuf FD\n");
> +		return PTR_ERR(dmabuf);
> +	}
> +	attachment = dma_buf_attach(dmabuf, dev);
> +
> +	if (IS_ERR(attachment)) {
> +		dev_err(dev, "Failed to attach dmabuf\n");
> +		ret = PTR_ERR(attachment);
> +		goto err_put;
> +	}
> +	sgt = dma_buf_map_attachment(attachment, dma_dir);
> +	if (IS_ERR(sgt)) {
> +		dev_err(dev, "Failed to get dmabufs sg_table\n");
> +		ret = PTR_ERR(sgt);
> +		goto err_detach;
> +	}
> +	if (sgt->nents != 1) {
> +		dev_err(dev, "Sparse DMA region is unsupported\n");
> +		ret = -EINVAL;
> +		goto err_unmap;
> +	}
> +
> +	*addr = sg_dma_address(sgt->sgl);
> +	*a = attachment;
> +	*s = sgt;
> +
> +	return 0;
> +
> +err_unmap:
> +	dma_buf_unmap_attachment(attachment, sgt, dma_dir);
> +err_detach:
> +	dma_buf_detach(dmabuf, attachment);
> +err_put:
> +	dma_buf_put(dmabuf);
> +	return ret;
> +}

Why do you have a whole file for one function?  That feels unneeded.

thanks,

greg k-h
