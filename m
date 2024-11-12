Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0A669C4D96
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2024 05:09:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E7E310E22D;
	Tue, 12 Nov 2024 04:09:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="nG+2Mm1O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B944110E22D
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2024 04:09:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 5C767A408AA;
 Tue, 12 Nov 2024 04:07:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40975C4CECD;
 Tue, 12 Nov 2024 04:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1731384572;
 bh=MhV+41Cp3i9m4j99lu/WCXY/MLivraTlLiNGgddAmok=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nG+2Mm1Ok7247hKiGkUlNBLIvm7L0Y8WWZKof6UD2P7ncgXCeLiNU0B5X91JqD1oN
 ZMybVpVEZ8Ep13s9W0AMvilXCWh+EoImzoqvdETjREQcsXBWusjwzW7RmTgx8tcLhz
 PrLncDjHZCPRvRkWDa4QE4W2l9IjyNdsRL8o/uCpruMYQks7xMATRckKFntbuYiB4D
 H95WCHX0X9FQax1l/9v+jPZNaVmDxRWXR9pBgZKS64KIptKMEwO6djWCTfGzNxd4Dq
 yyexiS175fDpNRmOwDIT+lQ3VCcaGEBOPgcXuz/a3/UzAbc64oNwwxTs8yI9Mhsedx
 yrRvan3rXLyQw==
Date: Mon, 11 Nov 2024 22:09:29 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>
Cc: Vinod Koul <vkoul@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, 
 linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 linux-i2c@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, quic_msavaliy@quicinc.com,
 quic_vtanuku@quicinc.com
Subject: Re: [PATCH v2 RESEND 2/3] i2c: qcom_geni: Update compile
 dependenices for qcom geni
Message-ID: <3fkfjeif3e4z3utcim5dou2obwjoagtr3z2bnwkywa2xlm4jrb@jon6mwtp4ahv>
References: <20241111140244.13474-1-quic_jseerapu@quicinc.com>
 <20241111140244.13474-3-quic_jseerapu@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241111140244.13474-3-quic_jseerapu@quicinc.com>
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

On Mon, Nov 11, 2024 at 07:32:43PM +0530, Jyothi Kumar Seerapu wrote:
> I2C_QCOM_GENI is having compile dependencies on QCOM_GPI_DMA and
> so update I2C_QCOM_GENI to depends on QCOM_GPI_DMA.
> 

Given that this is a separate patch, your wording can only be
interpreted as this being an existing problem.

> Signed-off-by: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>
> ---
> 
> v1 -> v2: 
> 	This patch is added in v2 to address the kernel test robot
> 	reported compilation error.
> 	ERROR: modpost: "gpi_multi_desc_process" [drivers/i2c/busses/i2c-qcom-geni.ko] undefined! 

But as far as I can tell you introduce this problem in patch 3. If so
this addition should be part of patch 3.



Also, you have different subject prefix for patch 2 and 3, yet they
relate to the same driver. Not pretty.

Regards,
Bjorn

> 
> drivers/i2c/busses/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
> index 0aa948014008..87634a682855 100644
> --- a/drivers/i2c/busses/Kconfig
> +++ b/drivers/i2c/busses/Kconfig
> @@ -1049,6 +1049,7 @@ config I2C_QCOM_GENI
>  	tristate "Qualcomm Technologies Inc.'s GENI based I2C controller"
>  	depends on ARCH_QCOM || COMPILE_TEST
>  	depends on QCOM_GENI_SE
> +	depends on QCOM_GPI_DMA
>  	help
>  	  This driver supports GENI serial engine based I2C controller in
>  	  master mode on the Qualcomm Technologies Inc.'s SoCs. If you say
> -- 
> 2.17.1
> 
> 
